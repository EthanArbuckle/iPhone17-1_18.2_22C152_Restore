@interface MLCSliceLayer
+ (MLCSliceLayer)sliceLayerWithStart:(NSArray *)start end:(NSArray *)end stride:(NSArray *)stride;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isStaticBatchSize;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (NSArray)end;
- (NSArray)start;
- (NSArray)stride;
- (id)description;
- (id)initSliceLayerWithStart:(id)a3 end:(id)a4 stride:(id)a5;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)resultSizeForDimension:(unint64_t)a3;
@end

@implementation MLCSliceLayer

+ (MLCSliceLayer)sliceLayerWithStart:(NSArray *)start end:(NSArray *)end stride:(NSArray *)stride
{
  v8 = stride;
  v9 = end;
  v10 = start;
  v11 = (void *)[objc_alloc((Class)a1) initSliceLayerWithStart:v10 end:v9 stride:v8];

  return (MLCSliceLayer *)v11;
}

- (id)initSliceLayerWithStart:(id)a3 end:(id)a4 stride:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  v12 = a5;
  uint64_t v13 = [v10 count];
  if (v13 != [v11 count])
  {
    v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MLCSliceLayer initSliceLayerWithStart:end:stride:].cold.4(a2);
    }
    goto LABEL_28;
  }
  if (v12)
  {
    uint64_t v14 = [v12 count];
    if (v14 != [v11 count])
    {
      v25 = +[MLCLog framework];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[MLCSliceLayer initSliceLayerWithStart:end:stride:](a2);
      }
      goto LABEL_28;
    }
  }
  id v33 = a4;
  v34 = self;
  v35 = a2;
  if (!objc_msgSend(v10, "count", a3))
  {
LABEL_10:
    self = v34;
    if (!v12 || ![v10 count])
    {
LABEL_15:
      v25 = [MEMORY[0x1E4F1CBF0] mutableCopy];
      if ([v10 count])
      {
        unint64_t v26 = 0;
        do
        {
          [v25 addObject:&unk_1F3876A38];
          ++v26;
        }
        while (v26 < [v10 count]);
      }
      v36.receiver = v34;
      v36.super_class = (Class)MLCSliceLayer;
      v27 = [(MLCLayer *)&v36 initWithLabel:@"Slice"];
      p_isa = (id *)&v27->super.super.isa;
      if (v27)
      {
        objc_storeStrong((id *)&v27->_start, obj);
        objc_storeStrong(p_isa + 26, v33);
        if (v12) {
          v29 = v12;
        }
        else {
          v29 = v25;
        }
        objc_storeStrong(p_isa + 27, v29);
      }
      self = p_isa;
      v30 = self;
      goto LABEL_29;
    }
    uint64_t v22 = 0;
    while (1)
    {
      v23 = [v12 objectAtIndexedSubscript:v22];
      uint64_t v24 = [v23 integerValue];

      if (v24 <= 0) {
        break;
      }
      if (++v22 >= (unint64_t)[v10 count]) {
        goto LABEL_15;
      }
    }
    v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MLCSliceLayer initSliceLayerWithStart:end:stride:](v35);
    }
LABEL_28:
    v30 = 0;
    goto LABEL_29;
  }
  uint64_t v15 = 0;
  while (1)
  {
    v16 = [v10 objectAtIndexedSubscript:v15];
    if ([v16 integerValue] < 0) {
      break;
    }
    v17 = [v11 objectAtIndexedSubscript:v15];
    if ([v17 integerValue] <= 0)
    {

      break;
    }
    v18 = [v11 objectAtIndexedSubscript:v15];
    unint64_t v19 = [v18 unsignedIntegerValue];
    v20 = [v10 objectAtIndexedSubscript:v15];
    unint64_t v21 = [v20 unsignedIntegerValue];

    if (v19 <= v21) {
      goto LABEL_32;
    }
    if (++v15 >= (unint64_t)[v10 count]) {
      goto LABEL_10;
    }
  }

LABEL_32:
  v25 = +[MLCLog framework];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[MLCSliceLayer initSliceLayerWithStart:end:stride:](v35);
  }
  v30 = 0;
  self = v34;
LABEL_29:

  return v30;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v73 = a5;
  id v11 = [v10 objectAtIndexedSubscript:0];
  v12 = [v11 descriptor];
  uint64_t v13 = [v12 dimensionCount];
  v74 = self;
  uint64_t v14 = [(MLCSliceLayer *)self start];
  uint64_t v15 = [v14 count];

  if (v13 != v15)
  {
    v66 = +[MLCLog framework];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      -[MLCSliceLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
    }
    goto LABEL_24;
  }
  v16 = [v10 objectAtIndexedSubscript:0];
  v17 = [v16 descriptor];
  uint64_t v18 = [v17 dataType];

  if (!+[MLCLayer supportsDataType:v18 onDevice:v9])
  {
    v66 = +[MLCLog framework];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v69 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v77 = v69;
      __int16 v78 = 1024;
      int v79 = v18;
      __int16 v80 = 2112;
      id v81 = v9;
      _os_log_error_impl(&dword_1DD0C9000, v66, OS_LOG_TYPE_ERROR, "%@: slice layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
    }
LABEL_24:
    char v68 = 0;
    v52 = v73;
    goto LABEL_25;
  }
  v72 = v9;
  unint64_t v19 = [v10 objectAtIndexedSubscript:0];
  v20 = [v19 descriptor];
  unint64_t v21 = [v20 dimensionCount];

  if (v21 >= 2)
  {
    unint64_t v22 = 1;
    while (1)
    {
      v23 = [(MLCSliceLayer *)v74 end];
      uint64_t v24 = [v23 objectAtIndexedSubscript:v22];
      unint64_t v25 = [v24 unsignedIntegerValue];
      unint64_t v26 = [v10 objectAtIndexedSubscript:0];
      v27 = [v26 descriptor];
      v28 = [v27 shape];
      v29 = [v28 objectAtIndexedSubscript:v22];
      unint64_t v30 = [v29 unsignedIntegerValue];

      if (v25 > v30) {
        break;
      }
      ++v22;
      v31 = [v10 objectAtIndexedSubscript:0];
      v32 = [v31 descriptor];
      unint64_t v33 = [v32 dimensionCount];

      if (v22 >= v33) {
        goto LABEL_7;
      }
    }
    v66 = +[MLCLog framework];
    id v9 = v72;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      -[MLCSliceLayer compileForDevice:sourceTensors:resultTensor:]();
    }
    goto LABEL_24;
  }
LABEL_7:
  v34 = [v10 objectAtIndexedSubscript:0];
  v35 = [v34 descriptor];
  unint64_t v36 = [v35 dimensionCount];

  if (v36 < 2)
  {
LABEL_11:
    v49 = [v10 objectAtIndexedSubscript:0];
    v50 = [v49 descriptor];
    unint64_t v51 = [v50 dimensionCount];

    v52 = v73;
    if (v51 < 2)
    {
LABEL_15:
      v62 = [v72 computeEngine];
      v63 = [(MLCSliceLayer *)v74 start];
      v64 = [(MLCSliceLayer *)v74 end];
      v65 = [(MLCSliceLayer *)v74 stride];
      v66 = objc_msgSend(v62, "sliceLayerWithbegin:end:stride:inferenceOnly:", v63, v64, v65, -[MLCLayer compileForInferenceOnly](v74, "compileForInferenceOnly"));

      if (v66 && [v66 count])
      {
        id v9 = v72;
        v67 = [v72 computeEngine];
        char v68 = [v67 compileLayerDeviceOps:v66 sourceTensors:v10 resultTensor:v73];

        v75.receiver = v74;
        v75.super_class = (Class)MLCSliceLayer;
        [(MLCLayer *)&v75 bindDevice:v72 deviceOps:v66];
        goto LABEL_25;
      }
      v71 = +[MLCLog framework];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
        -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:]();
      }
    }
    else
    {
      unint64_t v53 = 1;
      while (1)
      {
        uint64_t v54 = [(MLCSliceLayer *)v74 resultSizeForDimension:v53];
        v55 = [v73 descriptor];
        v56 = [v55 shape];
        v57 = [v56 objectAtIndexedSubscript:v53];
        uint64_t v58 = [v57 unsignedIntegerValue];

        if (v54 != v58) {
          break;
        }
        ++v53;
        v59 = [v10 objectAtIndexedSubscript:0];
        v60 = [v59 descriptor];
        unint64_t v61 = [v60 dimensionCount];

        if (v53 >= v61) {
          goto LABEL_15;
        }
      }
      v66 = +[MLCLog framework];
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        -[MLCSliceLayer compileForDevice:sourceTensors:resultTensor:].cold.4();
      }
    }
    char v68 = 0;
    id v9 = v72;
    goto LABEL_25;
  }
  unint64_t v37 = 1;
  while (1)
  {
    v38 = [(MLCSliceLayer *)v74 start];
    v39 = [v38 objectAtIndexedSubscript:v37];
    unint64_t v40 = [v39 unsignedIntegerValue];
    v41 = [v10 objectAtIndexedSubscript:0];
    v42 = [v41 descriptor];
    v43 = [v42 shape];
    v44 = [v43 objectAtIndexedSubscript:v37];
    unint64_t v45 = [v44 unsignedIntegerValue] - 1;

    if (v40 > v45) {
      break;
    }
    ++v37;
    v46 = [v10 objectAtIndexedSubscript:0];
    v47 = [v46 descriptor];
    unint64_t v48 = [v47 dimensionCount];

    if (v37 >= v48) {
      goto LABEL_11;
    }
  }
  v66 = +[MLCLog framework];
  id v9 = v72;
  v52 = v73;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
    -[MLCSliceLayer compileForDevice:sourceTensors:resultTensor:]();
  }
  char v68 = 0;
LABEL_25:

  return v68;
}

- (unint64_t)resultSizeForDimension:(unint64_t)a3
{
  v5 = [(MLCSliceLayer *)self stride];
  v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 integerValue];
  if (v7 >= 0) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = -v7;
  }

  id v9 = [(MLCSliceLayer *)self end];
  id v10 = [v9 objectAtIndexedSubscript:a3];
  uint64_t v11 = [v10 unsignedIntegerValue];
  v12 = [(MLCSliceLayer *)self start];
  uint64_t v13 = [v12 objectAtIndexedSubscript:a3];
  unint64_t v14 = (v11 + ~[v13 unsignedIntegerValue]) / v8 + 1;

  return v14;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v7 = [v4 objectAtIndexedSubscript:0];
    unint64_t v8 = [v7 descriptor];
    id v9 = [v8 shape];
    unint64_t v10 = [v9 count];

    if (i >= v10) {
      break;
    }
    unint64_t v11 = [(MLCSliceLayer *)self resultSizeForDimension:i];
    v12 = [NSNumber numberWithUnsignedInteger:v11];
    [v5 setObject:v12 atIndexedSubscript:i];
  }
  uint64_t v13 = (void *)[v5 copy];
  unint64_t v14 = [v4 objectAtIndexedSubscript:0];
  uint64_t v15 = [v14 descriptor];
  v16 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v13, [v15 dataType]);

  v17 = +[MLCTensor tensorWithDescriptor:v16];

  return v17;
}

- (BOOL)isStaticBatchSize
{
  unint64_t v14 = [(MLCLayer *)self sourceTensors];
  v3 = [v14 objectAtIndexedSubscript:0];
  id v4 = [v3 descriptor];
  v5 = [v4 shape];
  v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 unsignedIntegerValue];
  unint64_t v8 = [(MLCLayer *)self resultTensors];
  id v9 = [v8 objectAtIndexedSubscript:0];
  unint64_t v10 = [v9 descriptor];
  unint64_t v11 = [v10 shape];
  v12 = [v11 objectAtIndexedSubscript:0];
  LOBYTE(v7) = v7 == [v12 unsignedIntegerValue];

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MLCSliceLayer *)self start];
  uint64_t v7 = [(MLCSliceLayer *)self end];
  unint64_t v8 = [(MLCSliceLayer *)self stride];
  id v9 = [v3 stringWithFormat:@"%@: { start=%@ : end=%@ : stride=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  uint64_t v7 = [(MLCSliceLayer *)self start];
  unint64_t v8 = [(MLCSliceLayer *)self end];
  id v9 = [(MLCSliceLayer *)self stride];
  unint64_t v10 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Start: %@    End: %@<BR />Stride: %@</FONT>>", v5, v6, v7, v8, v9];

  return v10;
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
      uint64_t v7 = [v6 shape];
      unint64_t v8 = [v7 count];

      BOOL v9 = v8 > 1;
      if (v8 <= 1) {
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

- (NSArray)start
{
  return self->_start;
}

- (NSArray)end
{
  return self->_end;
}

- (NSArray)stride
{
  return self->_stride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stride, 0);
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

- (void)initSliceLayerWithStart:(const char *)a1 end:stride:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: error: stride must be greater than zero at each dimension", v4, v5, v6, v7, v8);
}

- (void)initSliceLayerWithStart:(const char *)a1 end:stride:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: error: start and end vectors must be non negative and the end vector must be greater than the start vector at each dimension", v4, v5, v6, v7, v8);
}

- (void)initSliceLayerWithStart:(const char *)a1 end:stride:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: error: stride, start and end vector must have the same dimension", v4, v5, v6, v7, v8);
}

- (void)initSliceLayerWithStart:(const char *)a1 end:stride:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: error: start and end vector must have the same dimension", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: error: the end vector at index [%lu] is greater than the size of the input tensor", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: error: the start vector at index [%lu] should not be greater than the size of the input tensor minus 1", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: error: the result tensor size does not match the size of slicing at index [%lu]", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: error: the source tensor size does not match the start and end tensors", v4, v5, v6, v7, v8);
}

@end