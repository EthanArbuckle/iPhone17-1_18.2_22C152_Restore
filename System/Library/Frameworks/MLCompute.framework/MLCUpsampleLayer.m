@interface MLCUpsampleLayer
+ (MLCUpsampleLayer)layerWithShape:(NSArray *)shape;
+ (MLCUpsampleLayer)layerWithShape:(NSArray *)shape sampleMode:(MLCSampleMode)sampleMode alignsCorners:(BOOL)alignsCorners;
- (BOOL)alignsCorners;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (MLCSampleMode)sampleMode;
- (MLCUpsampleLayer)initWithShape:(id)a3 sampleMode:(int)a4 alignCorners:(BOOL)a5;
- (NSArray)shape;
- (id)description;
- (id)summarizedDOTDescription;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
- (unint64_t)upsampleHeight;
- (unint64_t)upsampleWidth;
@end

@implementation MLCUpsampleLayer

+ (MLCUpsampleLayer)layerWithShape:(NSArray *)shape
{
  v4 = shape;
  v5 = (void *)[objc_alloc((Class)a1) initWithShape:v4 sampleMode:0 alignCorners:0];

  return (MLCUpsampleLayer *)v5;
}

+ (MLCUpsampleLayer)layerWithShape:(NSArray *)shape sampleMode:(MLCSampleMode)sampleMode alignsCorners:(BOOL)alignsCorners
{
  BOOL v5 = alignsCorners;
  uint64_t v6 = *(void *)&sampleMode;
  v8 = shape;
  v9 = (void *)[objc_alloc((Class)a1) initWithShape:v8 sampleMode:v6 alignCorners:v5];

  return (MLCUpsampleLayer *)v9;
}

- (MLCUpsampleLayer)initWithShape:(id)a3 sampleMode:(int)a4 alignCorners:(BOOL)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLCUpsampleLayer;
  v10 = [(MLCLayer *)&v15 initWithLabel:@"Upsampling"];
  if (v10)
  {
    if ([v9 count] == 1)
    {
      uint64_t v11 = 0;
      v10->_upsampleHeight = 1;
    }
    else
    {
      v12 = [v9 objectAtIndexedSubscript:0];
      v10->_upsampleHeight = [v12 unsignedIntegerValue];

      uint64_t v11 = 1;
    }
    v13 = [v9 objectAtIndexedSubscript:v11];
    v10->_upsampleWidth = [v13 unsignedIntegerValue];

    v10->_sampleMode = a4;
    v10->_alignsCorners = a5;
    objc_storeStrong((id *)&v10->_shape, a3);
  }

  return v10;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  uint64_t v14 = [v13 dataType];

  if (!+[MLCLayer supportsDataType:v14 onDevice:v9])
  {
    v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v62 = v29;
      __int16 v63 = 1024;
      *(_DWORD *)v64 = v14;
      *(_WORD *)&v64[4] = 2112;
      *(void *)&v64[6] = v9;
      _os_log_error_impl(&dword_1DD0C9000, v28, OS_LOG_TYPE_ERROR, "%@: upsample layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
    }
    goto LABEL_29;
  }
  objc_super v15 = [v10 objectAtIndexedSubscript:0];
  v16 = [v15 descriptor];
  v17 = [v16 shape];
  uint64_t v18 = [v17 count];

  if (v18 == 2)
  {
    SEL aSelectorb = a2;
    unint64_t v27 = 1;
    unint64_t v30 = 1;
    unint64_t v31 = 1;
    unint64_t v23 = 1;
    unint64_t v32 = [(MLCUpsampleLayer *)self upsampleWidth];
  }
  else
  {
    if (v18 == 4)
    {
      SEL aSelector = a2;
      v33 = [v10 objectAtIndexedSubscript:0];
      v34 = [v33 descriptor];
      v35 = [v34 shape];
      v36 = [v35 objectAtIndexedSubscript:2];
      uint64_t v59 = [v36 unsignedIntegerValue];

      v37 = [v10 objectAtIndexedSubscript:0];
      v38 = [v37 descriptor];
      v39 = [v38 shape];
      v40 = [v39 objectAtIndexedSubscript:3];
      unint64_t v23 = [v40 unsignedIntegerValue];

      v41 = [v11 descriptor];
      v42 = [v41 shape];
      v43 = [v42 objectAtIndexedSubscript:2];
      unint64_t v27 = [v43 unsignedIntegerValue];

      v24 = [v11 descriptor];
      v25 = [v24 shape];
      v26 = [v25 objectAtIndexedSubscript:3];
    }
    else
    {
      if (v18 != 3)
      {
        v28 = +[MLCLog framework];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[MLCPaddingLayer compileForDevice:sourceTensors:resultTensor:](a2, v10);
        }
        goto LABEL_29;
      }
      SEL aSelector = a2;
      v19 = [v10 objectAtIndexedSubscript:0];
      v20 = [v19 descriptor];
      v21 = [v20 shape];
      v22 = [v21 objectAtIndexedSubscript:2];
      unint64_t v23 = [v22 unsignedIntegerValue];

      v24 = [v11 descriptor];
      v25 = [v24 shape];
      v26 = [v25 objectAtIndexedSubscript:2];
      unint64_t v27 = 1;
      uint64_t v59 = 1;
    }
    unint64_t v30 = [v26 unsignedIntegerValue];

    unint64_t v31 = v59;
    unint64_t v32 = [(MLCUpsampleLayer *)self upsampleWidth];
  }
  if (v30 != v32)
  {
    v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v53 = NSStringFromSelector(aSelectora);
      *(_DWORD *)buf = 138412802;
      v62 = v53;
      __int16 v63 = 2048;
      *(void *)v64 = v30;
      *(_WORD *)&v64[8] = 2048;
      *(void *)&v64[10] = [(MLCUpsampleLayer *)self upsampleWidth];
      v54 = "%@: resultTensor width=%lu does not match value specified in shape=%lu";
LABEL_25:
      _os_log_error_impl(&dword_1DD0C9000, v28, OS_LOG_TYPE_ERROR, v54, buf, 0x20u);
LABEL_28:
    }
LABEL_29:
    char v52 = 0;
    goto LABEL_30;
  }
  if (v27 != [(MLCUpsampleLayer *)self upsampleHeight])
  {
    v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v53 = NSStringFromSelector(aSelectora);
      *(_DWORD *)buf = 138412802;
      v62 = v53;
      __int16 v63 = 2048;
      *(void *)v64 = v27;
      *(_WORD *)&v64[8] = 2048;
      *(void *)&v64[10] = [(MLCUpsampleLayer *)self upsampleHeight];
      v54 = "%@: resultTensor height=%lu does not match value specified in shape=%lu";
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  float v44 = (float)v30 / (float)v23;
  float v45 = (float)v27 / (float)v31;
  if ([(MLCUpsampleLayer *)self sampleMode] == MLCSampleModeLinear
    && [(MLCUpsampleLayer *)self alignsCorners])
  {
    float v44 = (float)(v30 - 1) / (float)(v23 - 1);
    float v45 = (float)(v27 - 1) / (float)(v31 - 1);
  }
  v46 = [v9 computeEngine];
  uint64_t v47 = [(MLCUpsampleLayer *)self sampleMode];
  BOOL v48 = [(MLCUpsampleLayer *)self alignsCorners];
  *(float *)&double v49 = v44;
  *(float *)&double v50 = v45;
  v28 = [v46 upsampleLayerWithScaleFactorX:v47 scaleFactorY:v48 sampleMode:v49 alignCorners:v50];

  if (!v28 || ![v28 count])
  {
    v53 = +[MLCLog framework];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[MLCPaddingLayer compileForDevice:sourceTensors:resultTensor:](aSelectora);
    }
    goto LABEL_28;
  }
  v51 = [v9 computeEngine];
  char v52 = [v51 compileLayerDeviceOps:v28 sourceTensors:v10 resultTensor:v11];

  v60.receiver = self;
  v60.super_class = (Class)MLCUpsampleLayer;
  [(MLCLayer *)&v60 bindDevice:v9 deviceOps:v28];
LABEL_30:

  return v52;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MLCUpsampleLayer;
  unint64_t result = -[MLCLayer resultSizeFromSourceSize:dimension:](&v7, sel_resultSizeFromSourceSize_dimension_, a3);
  if (a4 == 2) {
    return [(MLCUpsampleLayer *)self upsampleHeight];
  }
  if (a4 == 3) {
    return [(MLCUpsampleLayer *)self upsampleWidth];
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCUpsampleLayer *)self shape];
  objc_super v7 = [(MLCLayer *)self conditionalTreeNode];
  v8 = [(MLCLayer *)self resultTensors];
  id v9 = [v3 stringWithFormat:@"%@: { shape=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  objc_super v7 = [(MLCUpsampleLayer *)self shape];
  v8 = MLCSampleModeDebugDescription([(MLCUpsampleLayer *)self sampleMode]);
  id v9 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Shape: %@<BR />Sample Mode: %@    Align Corners: %hhd</FONT>>", v5, v6, v7, v8, -[MLCUpsampleLayer alignsCorners](self, "alignsCorners")];

  return v9;
}

- (NSArray)shape
{
  return self->_shape;
}

- (MLCSampleMode)sampleMode
{
  return self->_sampleMode;
}

- (BOOL)alignsCorners
{
  return self->_alignsCorners;
}

- (unint64_t)upsampleWidth
{
  return self->_upsampleWidth;
}

- (unint64_t)upsampleHeight
{
  return self->_upsampleHeight;
}

- (void).cxx_destruct
{
}

@end