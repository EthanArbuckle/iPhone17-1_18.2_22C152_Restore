@interface MLCPaddingLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCPaddingLayer)layerWithConstantPadding:(NSArray *)padding constantValue:(float)constantValue;
+ (MLCPaddingLayer)layerWithReflectionPadding:(NSArray *)padding;
+ (MLCPaddingLayer)layerWithSymmetricPadding:(NSArray *)padding;
+ (MLCPaddingLayer)layerWithZeroPadding:(NSArray *)padding;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCPaddingLayer)initWithPaddingType:(int)a3 paddingSizes:(id)a4 constantValue:(float)a5;
- (MLCPaddingType)paddingType;
- (NSUInteger)paddingBottom;
- (NSUInteger)paddingLeft;
- (NSUInteger)paddingRight;
- (NSUInteger)paddingTop;
- (float)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
@end

@implementation MLCPaddingLayer

+ (MLCPaddingLayer)layerWithReflectionPadding:(NSArray *)padding
{
  v4 = padding;
  v5 = (void *)[objc_alloc((Class)a1) initWithPaddingType:1 paddingSizes:v4 constantValue:0.0];

  return (MLCPaddingLayer *)v5;
}

+ (MLCPaddingLayer)layerWithSymmetricPadding:(NSArray *)padding
{
  v4 = padding;
  v5 = (void *)[objc_alloc((Class)a1) initWithPaddingType:2 paddingSizes:v4 constantValue:0.0];

  return (MLCPaddingLayer *)v5;
}

+ (MLCPaddingLayer)layerWithZeroPadding:(NSArray *)padding
{
  v4 = padding;
  v5 = (void *)[objc_alloc((Class)a1) initWithPaddingType:0 paddingSizes:v4 constantValue:0.0];

  return (MLCPaddingLayer *)v5;
}

+ (MLCPaddingLayer)layerWithConstantPadding:(NSArray *)padding constantValue:(float)constantValue
{
  v6 = padding;
  id v7 = objc_alloc((Class)a1);
  *(float *)&double v8 = constantValue;
  v9 = (void *)[v7 initWithPaddingType:3 paddingSizes:v6 constantValue:v8];

  return (MLCPaddingLayer *)v9;
}

- (MLCPaddingLayer)initWithPaddingType:(int)a3 paddingSizes:(id)a4 constantValue:(float)a5
{
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MLCPaddingLayer;
  v9 = [(MLCLayer *)&v19 initWithLabel:@"Padding"];
  v10 = v9;
  if (v9)
  {
    v9->_paddingType = a3;
    if ([v8 count] == 1)
    {
      v11 = [v8 objectAtIndexedSubscript:0];
      uint64_t v12 = [v11 unsignedIntegerValue];
      v10->_paddingBottom = v12;
      v10->_paddingRight = v12;
      v10->_paddingTop = v12;
      v13 = &OBJC_IVAR___MLCPaddingLayer__paddingLeft;
    }
    else if ([v8 count] == 2)
    {
      v10->_paddingTop = 0;
      v10->_paddingBottom = 0;
      v14 = [v8 objectAtIndexedSubscript:0];
      v10->_paddingLeft = [v14 unsignedIntegerValue];

      v11 = [v8 objectAtIndexedSubscript:1];
      uint64_t v12 = [v11 unsignedIntegerValue];
      v13 = &OBJC_IVAR___MLCPaddingLayer__paddingRight;
    }
    else
    {
      v15 = [v8 objectAtIndexedSubscript:2];
      v10->_paddingLeft = [v15 unsignedIntegerValue];

      v16 = [v8 objectAtIndexedSubscript:3];
      v10->_paddingRight = [v16 unsignedIntegerValue];

      v17 = [v8 objectAtIndexedSubscript:0];
      v10->_paddingTop = [v17 unsignedIntegerValue];

      v11 = [v8 objectAtIndexedSubscript:1];
      uint64_t v12 = [v11 unsignedIntegerValue];
      v13 = &OBJC_IVAR___MLCPaddingLayer__paddingBottom;
    }
    *(Class *)((char *)&v10->super.super.isa + *v13) = (Class)v12;

    v10->_constantValue = a5;
  }

  return v10;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  if ([a4 type]) {
    return a3 == 1;
  }
  else {
    return ((a3 - 1) & 0xFFFFFFFD) == 0;
  }
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  uint64_t v14 = [v13 dataType];

  [(MLCPaddingLayer *)self constantValue];
  if (!+[MLCTensor canConvertValue:toDataType:](MLCTensor, "canConvertValue:toDataType:", v14))
  {
    v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v31 = NSStringFromSelector(a2);
      [(MLCPaddingLayer *)self constantValue];
      *(_DWORD *)buf = 138412802;
      v52 = v31;
      __int16 v53 = 2048;
      *(double *)v54 = v32;
      *(_WORD *)&v54[8] = 1024;
      *(_DWORD *)&v54[10] = v14;
      v33 = "%@: cannot compile padding layer as specified constant value = %f is too large for data type = %d";
LABEL_12:
      _os_log_error_impl(&dword_1DD0C9000, v21, OS_LOG_TYPE_ERROR, v33, buf, 0x1Cu);
    }
LABEL_16:
    char v35 = 0;
    goto LABEL_17;
  }
  if (!+[MLCPaddingLayer supportsDataType:v14 onDevice:v9])
  {
    v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v31 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v52 = v31;
      __int16 v53 = 1024;
      *(_DWORD *)v54 = v14;
      *(_WORD *)&v54[4] = 2112;
      *(void *)&v54[6] = v9;
      v33 = "%@: padding layer with data type = %d is not supported on a device = %@";
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  aSelector = a2;
  id v49 = v11;
  v15 = [v9 computeEngine];
  uint64_t v16 = [(MLCPaddingLayer *)self paddingType];
  NSUInteger v17 = [(MLCPaddingLayer *)self paddingLeft];
  NSUInteger v18 = [(MLCPaddingLayer *)self paddingRight];
  NSUInteger v19 = [(MLCPaddingLayer *)self paddingTop];
  NSUInteger v20 = [(MLCPaddingLayer *)self paddingBottom];
  [(MLCPaddingLayer *)self constantValue];
  v21 = objc_msgSend(v15, "paddingLayerWithPaddingType:paddingLeft:paddingRight:paddingTop:paddingBottom:constantValue:dataType:", v16, v17, v18, v19, v20, v14);

  if (!v21 || ![v21 count])
  {
    v34 = +[MLCLog framework];
    id v11 = v49;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MLCPaddingLayer compileForDevice:sourceTensors:resultTensor:](aSelector);
    }

    goto LABEL_16;
  }
  v22 = [v10 objectAtIndexedSubscript:0];
  v23 = [v22 descriptor];
  v24 = [v23 shape];
  uint64_t v25 = [v24 count];

  if (v25 == 4)
  {
    v37 = [v10 objectAtIndexedSubscript:0];
    v38 = [v37 descriptor];
    v39 = [v38 shape];
    v40 = [v39 objectAtIndexedSubscript:2];
    uint64_t v41 = [v40 unsignedIntegerValue];

    unint64_t v30 = v41;
    v26 = [v10 objectAtIndexedSubscript:0];
    v27 = [v26 descriptor];
    v28 = [v27 shape];
    v29 = [v28 objectAtIndexedSubscript:3];
  }
  else
  {
    if (v25 != 3)
    {
      v44 = +[MLCLog framework];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[MLCPaddingLayer compileForDevice:sourceTensors:resultTensor:](aSelector, v10);
      }

      goto LABEL_32;
    }
    v26 = [v10 objectAtIndexedSubscript:0];
    v27 = [v26 descriptor];
    v28 = [v27 shape];
    v29 = [v28 objectAtIndexedSubscript:2];
    unint64_t v30 = 1;
  }
  unint64_t v42 = [v29 unsignedIntegerValue];

  if ([(MLCPaddingLayer *)self paddingType]
    && [(MLCPaddingLayer *)self paddingType] != MLCPaddingTypeConstant
    && (v42 <= [(MLCPaddingLayer *)self paddingLeft]
     || v42 <= [(MLCPaddingLayer *)self paddingRight]
     || v30 <= [(MLCPaddingLayer *)self paddingTop]
     || v30 <= [(MLCPaddingLayer *)self paddingBottom]))
  {
    v45 = +[MLCLog framework];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      v46 = SEL aSelectora = (SEL)v42;
      *(_DWORD *)buf = 138413826;
      v52 = v46;
      __int16 v53 = 2048;
      *(void *)v54 = [(MLCPaddingLayer *)self paddingLeft];
      *(_WORD *)&v54[8] = 2048;
      *(void *)&v54[10] = [(MLCPaddingLayer *)self paddingRight];
      __int16 v55 = 2048;
      NSUInteger v56 = [(MLCPaddingLayer *)self paddingTop];
      __int16 v57 = 2048;
      NSUInteger v58 = [(MLCPaddingLayer *)self paddingBottom];
      __int16 v59 = 2048;
      SEL v60 = aSelectora;
      __int16 v61 = 2048;
      unint64_t v62 = v30;
      _os_log_error_impl(&dword_1DD0C9000, v45, OS_LOG_TYPE_ERROR, "%@: padding size [%lu, %lu, %lu, %lu] must be less than the source tensor dimension size=[%lu, %lu]", buf, 0x48u);
    }
LABEL_32:
    char v35 = 0;
    id v11 = v49;
    goto LABEL_17;
  }
  v43 = [v9 computeEngine];
  char v35 = [v43 compileLayerDeviceOps:v21 sourceTensors:v10 resultTensor:v49];

  id v11 = v49;
  v50.receiver = self;
  v50.super_class = (Class)MLCPaddingLayer;
  [(MLCLayer *)&v50 bindDevice:v9 deviceOps:v21];
LABEL_17:

  return v35;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MLCPaddingLayer;
  v6 = -[MLCLayer resultSizeFromSourceSize:dimension:](&v10, sel_resultSizeFromSourceSize_dimension_, a3);
  if (a4 == 2)
  {
    NSUInteger v7 = [(MLCPaddingLayer *)self paddingTop];
    NSUInteger v8 = [(MLCPaddingLayer *)self paddingBottom];
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    NSUInteger v7 = [(MLCPaddingLayer *)self paddingLeft];
    NSUInteger v8 = [(MLCPaddingLayer *)self paddingRight];
LABEL_5:
    v6 += v7 + v8;
  }
  return (unint64_t)v6;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v6 = [v4 objectAtIndexedSubscript:0];
  NSUInteger v7 = [v6 descriptor];
  NSUInteger v8 = [v7 shape];
  id v9 = [v8 objectAtIndexedSubscript:0];
  [v5 setObject:v9 atIndexedSubscript:0];

  objc_super v10 = [v4 objectAtIndexedSubscript:0];
  id v11 = [v10 descriptor];
  uint64_t v12 = [v11 shape];
  v13 = [v12 objectAtIndexedSubscript:1];
  [v5 setObject:v13 atIndexedSubscript:1];

  uint64_t v14 = [v4 objectAtIndexedSubscript:0];
  v15 = [v14 descriptor];
  uint64_t v16 = [v15 shape];
  uint64_t v17 = [v16 count];

  if (v17 == 4)
  {
    v29 = [v4 objectAtIndexedSubscript:0];
    unint64_t v30 = [v29 descriptor];
    v31 = [v30 shape];
    float v32 = [v31 objectAtIndexedSubscript:2];
    uint64_t v33 = [v32 unsignedIntegerValue];
    NSUInteger v34 = [(MLCPaddingLayer *)self paddingTop];
    NSUInteger v35 = v34 + [(MLCPaddingLayer *)self paddingBottom] + v33;

    v36 = [NSNumber numberWithUnsignedInteger:v35];
    [v5 setObject:v36 atIndexedSubscript:2];

    v37 = [v4 objectAtIndexedSubscript:0];
    v38 = [v37 descriptor];
    v39 = [v38 shape];
    v40 = [v39 objectAtIndexedSubscript:3];
    uint64_t v41 = [v40 unsignedIntegerValue];
    NSUInteger v42 = [(MLCPaddingLayer *)self paddingLeft];
    NSUInteger v43 = v42 + [(MLCPaddingLayer *)self paddingRight] + v41;

    uint64_t v25 = [NSNumber numberWithUnsignedInteger:v43];
    v26 = v5;
    v27 = v25;
    uint64_t v28 = 3;
  }
  else
  {
    if (v17 != 3) {
      goto LABEL_6;
    }
    NSUInteger v18 = [v4 objectAtIndexedSubscript:0];
    NSUInteger v19 = [v18 descriptor];
    NSUInteger v20 = [v19 shape];
    v21 = [v20 objectAtIndexedSubscript:2];
    uint64_t v22 = [v21 unsignedIntegerValue];
    NSUInteger v23 = [(MLCPaddingLayer *)self paddingLeft];
    NSUInteger v24 = v23 + [(MLCPaddingLayer *)self paddingRight] + v22;

    uint64_t v25 = [NSNumber numberWithUnsignedInteger:v24];
    v26 = v5;
    v27 = v25;
    uint64_t v28 = 2;
  }
  [v26 setObject:v27 atIndexedSubscript:v28];

LABEL_6:
  v44 = (void *)[v5 copy];
  v45 = [v4 objectAtIndexedSubscript:0];
  v46 = [v45 descriptor];
  v47 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v44, [v46 dataType]);

  v48 = +[MLCTensor tensorWithDescriptor:v47];

  return v48;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCPaddingLayer *)self paddingType];
  NSUInteger v7 = [(MLCPaddingLayer *)self paddingLeft];
  NSUInteger v8 = [(MLCPaddingLayer *)self paddingRight];
  NSUInteger v9 = [(MLCPaddingLayer *)self paddingTop];
  NSUInteger v10 = [(MLCPaddingLayer *)self paddingBottom];
  [(MLCPaddingLayer *)self constantValue];
  double v12 = v11;
  v13 = [(MLCLayer *)self conditionalTreeNode];
  uint64_t v14 = [(MLCLayer *)self resultTensors];
  v15 = [v3 stringWithFormat:@"%@: { paddingType=%d, paddingLeft=%lu, paddingRight=%lu, paddingTop=%lu, paddingBottom=%lu, constantValue=%f, conditionalTreeNode=%@, resultTensor = %@ }", v5, v6, v7, v8, v9, v10, *(void *)&v12, v13, v14];

  return v15;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  NSUInteger v7 = MLCPaddingTypeDebugDescription([(MLCPaddingLayer *)self paddingType]);
  [(MLCPaddingLayer *)self constantValue];
  NSUInteger v9 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Padding Type: %@     Constant Value: %.03f<BR />Padding Left: %lu    Padding Right: %lu<BR />Padding Top: %lu     Padding Bottom: %lu</FONT>>", v5, v6, v7, v8, -[MLCPaddingLayer paddingLeft](self, "paddingLeft"), -[MLCPaddingLayer paddingRight](self, "paddingRight"), -[MLCPaddingLayer paddingTop](self, "paddingTop"), -[MLCPaddingLayer paddingBottom](self, "paddingBottom")];

  return v9;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [v3 objectAtIndexedSubscript:v4];
      NSUInteger v6 = [v5 descriptor];
      NSUInteger v7 = [v6 shape];
      unint64_t v8 = [v7 count];

      BOOL v9 = v8 > 2;
      if (v8 <= 2) {
        break;
      }
      ++v4;
    }
    while (v4 < [v3 count]);
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(MLCPaddingLayer *)self paddingType];
  NSUInteger v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLCPaddingLayer paddingLeft](self, "paddingLeft"));
  v13[0] = v6;
  NSUInteger v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLCPaddingLayer paddingRight](self, "paddingRight"));
  v13[1] = v7;
  unint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLCPaddingLayer paddingTop](self, "paddingTop"));
  v13[2] = v8;
  BOOL v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLCPaddingLayer paddingBottom](self, "paddingBottom"));
  v13[3] = v9;
  NSUInteger v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  [(MLCPaddingLayer *)self constantValue];
  float v11 = objc_msgSend(v4, "initWithPaddingType:paddingSizes:constantValue:", v5, v10);

  return v11;
}

- (MLCPaddingType)paddingType
{
  return self->_paddingType;
}

- (NSUInteger)paddingLeft
{
  return self->_paddingLeft;
}

- (NSUInteger)paddingRight
{
  return self->_paddingRight;
}

- (NSUInteger)paddingTop
{
  return self->_paddingTop;
}

- (NSUInteger)paddingBottom
{
  return self->_paddingBottom;
}

- (float)constantValue
{
  return self->_constantValue;
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, 2u);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.2(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  NSUInteger v10 = [a2 objectAtIndexedSubscript:0];
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v4, v5, "%@: Source tensor shape not supported=%@", v6, v7, v8, v9, 2u);
}

@end