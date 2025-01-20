@interface MLCMatMulLayer
+ (MLCMatMulLayer)layerWithDescriptor:(MLCMatMulDescriptor *)descriptor;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCMatMulDescriptor)descriptor;
- (MLCMatMulLayer)initWithDescriptor:(id)a3;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
@end

@implementation MLCMatMulLayer

+ (MLCMatMulLayer)layerWithDescriptor:(MLCMatMulDescriptor *)descriptor
{
  v4 = descriptor;
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCMatMulLayer *)v5;
}

- (MLCMatMulLayer)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLCMatMulLayer;
  v6 = [(MLCLayer *)&v9 initWithLabel:@"MatMul"];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_descriptor, a3);
  }

  return v7;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v10)
  {
    v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_31;
  }
  if (!v11)
  {
    v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_31;
  }
  v54 = self;
  uint64_t v13 = [v10 count];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    while (1)
    {
      v16 = [v10 objectAtIndexedSubscript:v15];
      v17 = [v16 descriptor];
      uint64_t v18 = [v17 dataType];

      if (!+[MLCLayer supportsDataType:v18 onDevice:v9]) {
        break;
      }
      if (v14 == ++v15) {
        goto LABEL_7;
      }
    }
    v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v51 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v57 = v51;
      __int16 v58 = 2048;
      uint64_t v59 = v15;
      __int16 v60 = 1024;
      int v61 = v18;
      __int16 v62 = 2112;
      id v63 = v9;
      _os_log_error_impl(&dword_1DD0C9000, v19, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);
    }
    goto LABEL_31;
  }
LABEL_7:
  if ((unint64_t)[v10 count] > 1)
  {
    v53 = a2;
    v20 = v54;
    v21 = [(MLCMatMulLayer *)v54 resultTensorFromSources:v10];
    v19 = v21;
    if (!v21) {
      goto LABEL_33;
    }
    v22 = [v21 descriptor];
    v23 = [v22 shape];
    v24 = [v12 descriptor];
    v25 = [v24 shape];
    char v26 = [v23 isEqualToArray:v25];

    if (v26)
    {
      if ([v10 count] == 3)
      {
        v27 = [v10 objectAtIndexedSubscript:2];
        v28 = [v27 descriptor];
        v29 = [v28 shape];
        v30 = [v29 mutableCopy];

        unint64_t v31 = [v30 count];
        v32 = [v12 descriptor];
        unint64_t v33 = [v32 dimensionCount];

        if (v31 < v33)
        {
          do
          {
            [v30 insertObject:&unk_1F3876BB8 atIndex:0];
            ++v31;
            v34 = [v12 descriptor];
            unint64_t v35 = [v34 dimensionCount];
          }
          while (v31 < v35);
        }
        v36 = [v12 descriptor];
        v37 = [v36 shape];

        if ([v37 count])
        {
          uint64_t v38 = 0;
          while (1)
          {
            v39 = [v30 objectAtIndexedSubscript:v38];
            uint64_t v40 = [v39 unsignedIntegerValue];

            v41 = [v37 objectAtIndexedSubscript:v38];
            uint64_t v42 = [v41 unsignedIntegerValue];

            if (v42 != 1 && v40 != 1 && v40 != v42) {
              break;
            }
            if (++v38 >= (unint64_t)[v37 count]) {
              goto LABEL_25;
            }
          }
          v52 = +[MLCLog framework];
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:].cold.6(v53);
          }

          goto LABEL_35;
        }
LABEL_25:

        v20 = v54;
      }
      v43 = [v9 computeEngine];
      uint64_t v44 = [(MLCMatMulLayer *)v20 descriptor];
      v45 = v20;
      v46 = (void *)v44;
      v30 = objc_msgSend(v43, "matMulLayerWithDescriptor:sourceTensors:resultTensor:inferenceOnly:", v44, v10, v12, -[MLCLayer compileForInferenceOnly](v45, "compileForInferenceOnly"));

      if (v30 && [v30 count])
      {
        v47 = [v9 computeEngine];
        char v48 = [v47 compileLayerDeviceOps:v30 sourceTensors:v10 resultTensor:v12];

        v55.receiver = v54;
        v55.super_class = (Class)MLCMatMulLayer;
        [(MLCLayer *)&v55 bindDevice:v9 deviceOps:v30];
LABEL_36:

        goto LABEL_32;
      }
      v50 = +[MLCLog framework];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](v53, (uint64_t)v30, v50);
      }
    }
    else
    {
LABEL_33:
      v30 = +[MLCLog framework];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:].cold.4(v53);
      }
    }
LABEL_35:
    char v48 = 0;
    goto LABEL_36;
  }
  v19 = +[MLCLog framework];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:](a2);
  }
LABEL_31:
  char v48 = 0;
LABEL_32:

  return v48;
}

- (id)resultTensorFromSources:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectAtIndexedSubscript:0];
  v6 = [v5 descriptor];
  v7 = [v6 shape];
  v8 = (void *)[v7 mutableCopy];

  id v9 = [v4 objectAtIndexedSubscript:1];
  id v10 = [v9 descriptor];
  id v11 = [v10 shape];
  v12 = (void *)[v11 mutableCopy];

  uint64_t v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v14 = [v8 count];
  if (v14 <= [v12 count]) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = v8;
  }
  unint64_t v16 = [v15 count];
  unint64_t v17 = [v8 count];
  unint64_t v18 = v16 - v17;
  if (v16 > v17)
  {
    do
    {
      [v8 insertObject:&unk_1F3876BB8 atIndex:0];
      --v18;
    }
    while (v18);
  }
  unint64_t v19 = [v12 count];
  unint64_t v20 = v16 - v19;
  if (v16 > v19)
  {
    do
    {
      [v12 insertObject:&unk_1F3876BB8 atIndex:0];
      --v20;
    }
    while (v20);
  }
  if (v16)
  {
    for (uint64_t i = 0; i != v16; ++i)
      [v13 setObject:&unk_1F3876BB8 atIndexedSubscript:i];
  }
  unint64_t v22 = v16 - 1;
  v23 = [v8 objectAtIndexedSubscript:v16 - 1];
  uint64_t v65 = [v23 unsignedIntegerValue];

  unint64_t v24 = v16 - 2;
  v25 = [v12 objectAtIndexedSubscript:v16 - 2];
  uint64_t v66 = [v25 unsignedIntegerValue];

  char v26 = [v8 objectAtIndexedSubscript:v24];
  uint64_t v64 = [v26 unsignedIntegerValue];

  v27 = [v12 objectAtIndexedSubscript:v22];
  uint64_t v28 = [v27 unsignedIntegerValue];

  v29 = [(MLCMatMulLayer *)self descriptor];
  v67 = v4;
  if ([v29 transposesX])
  {
    v30 = [(MLCMatMulLayer *)self descriptor];
    int v31 = [v30 transposesY];

    if (v31)
    {
      v32 = [v8 objectAtIndexedSubscript:v24];
      uint64_t v33 = [v32 unsignedIntegerValue];

      v34 = [v12 objectAtIndexedSubscript:v22];
      uint64_t v35 = [v34 unsignedIntegerValue];

      v36 = [v8 objectAtIndexedSubscript:v22];
      uint64_t v37 = [v36 unsignedIntegerValue];

      uint64_t v38 = [v12 objectAtIndexedSubscript:v24];
      uint64_t v28 = [v38 unsignedIntegerValue];
LABEL_19:

      goto LABEL_20;
    }
  }
  else
  {
  }
  v39 = [(MLCMatMulLayer *)self descriptor];
  int v40 = [v39 transposesX];

  if (v40)
  {
    v41 = [v8 objectAtIndexedSubscript:v24];
    uint64_t v33 = [v41 unsignedIntegerValue];

    uint64_t v38 = [v8 objectAtIndexedSubscript:v22];
    uint64_t v37 = [v38 unsignedIntegerValue];
    uint64_t v35 = v66;
    goto LABEL_19;
  }
  uint64_t v42 = [(MLCMatMulLayer *)self descriptor];
  int v43 = [v42 transposesY];

  if (v43)
  {
    uint64_t v44 = [v12 objectAtIndexedSubscript:v22];
    uint64_t v35 = [v44 unsignedIntegerValue];

    uint64_t v38 = [v12 objectAtIndexedSubscript:v24];
    uint64_t v28 = [v38 unsignedIntegerValue];
    uint64_t v37 = v64;
    uint64_t v33 = v65;
    goto LABEL_19;
  }
  uint64_t v33 = v65;
  uint64_t v35 = v66;
  uint64_t v37 = v64;
LABEL_20:
  if (v33 == v35)
  {
    v45 = [NSNumber numberWithUnsignedInteger:v28];
    [v13 setObject:v45 atIndexedSubscript:v22];

    v46 = [NSNumber numberWithUnsignedInteger:v37];
    [v13 setObject:v46 atIndexedSubscript:v24];

    if (!v24)
    {
LABEL_30:
      v54 = (void *)[v13 copy];
      objc_super v55 = v67;
      v56 = [v67 objectAtIndexedSubscript:0];
      v57 = [v56 descriptor];
      __int16 v58 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v54, [v57 dataType]);

      uint64_t v59 = +[MLCTensor tensorWithDescriptor:v58];

      goto LABEL_37;
    }
    uint64_t v47 = 0;
    while (1)
    {
      char v48 = [v8 objectAtIndexedSubscript:v47];
      uint64_t v49 = [v48 unsignedIntegerValue];

      v50 = [v12 objectAtIndexedSubscript:v47];
      uint64_t v51 = [v50 unsignedIntegerValue];

      if (v51 != 1 && v49 != 1 && v49 != v51) {
        break;
      }
      if (v49 == 1) {
        uint64_t v52 = v51;
      }
      else {
        uint64_t v52 = v49;
      }
      v53 = [NSNumber numberWithUnsignedInteger:v52];
      [v13 setObject:v53 atIndexedSubscript:v47];

      if (v24 == ++v47) {
        goto LABEL_30;
      }
    }
    __int16 v60 = +[MLCLog framework];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      __int16 v62 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v69 = v62;
      __int16 v70 = 2048;
      uint64_t v71 = v49;
      __int16 v72 = 2048;
      uint64_t v73 = v51;
      _os_log_error_impl(&dword_1DD0C9000, v60, OS_LOG_TYPE_ERROR, "%@: the shapes of source tensors do not allow broadcast, [%lu] != [%lu]", buf, 0x20u);
    }
  }
  else
  {
    __int16 v60 = +[MLCLog framework];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[MLCMatMulLayer resultTensorFromSources:](a2);
    }
  }

  uint64_t v59 = 0;
  objc_super v55 = v67;
LABEL_37:

  return v59;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    v7 = [a3 objectAtIndexedSubscript:v4];
    v8 = [v7 descriptor];
    id v9 = [v8 shape];
    unint64_t v10 = [v9 count];

    if (v10 < 2) {
      break;
    }
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  return v10 > 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  char v6 = [(MLCMatMulLayer *)self descriptor];
  v7 = [(MLCLayer *)self resultTensors];
  v8 = [v3 stringWithFormat:@"%@: { descriptor=%@ : resultTensor=%@ }", v5, v6, v7];

  return v8;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  v7 = [(MLCMatMulLayer *)self descriptor];
  [v7 alpha];
  double v9 = v8;
  unint64_t v10 = [(MLCMatMulLayer *)self descriptor];
  unsigned int v11 = [v10 transposesX];
  v12 = [(MLCMatMulLayer *)self descriptor];
  uint64_t v13 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Alpha: %.03f<BR />Transposes X: %hhd    Transposes Y: %hhd</FONT>>", v5, v6, *(void *)&v9, v11, objc_msgSend(v12, "transposesY")];

  return v13;
}

- (MLCMatMulDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: no source tensors specified", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: no result tensor specified", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: source tensor array must be of size 2", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: failure to compile matmul layer", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.6(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: bias tensor is not broadcastable to matmul result tensor", v4, v5, v6, v7, v8);
}

- (void)resultTensorFromSources:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: the inner dimension of the last two indices of the source tensors does not match", v4, v5, v6, v7, v8);
}

@end