@interface MLCPoolingLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCPoolingLayer)layerWithDescriptor:(MLCPoolingDescriptor *)descriptor;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (MLCPoolingDescriptor)descriptor;
- (MLCPoolingLayer)initWithDescriptor:(id)a3;
- (id)description;
- (id)summarizedDOTDescription;
@end

@implementation MLCPoolingLayer

+ (MLCPoolingLayer)layerWithDescriptor:(MLCPoolingDescriptor *)descriptor
{
  v4 = descriptor;
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCPoolingLayer *)v5;
}

- (MLCPoolingLayer)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MLCPoolingLayer;
  v6 = [(MLCLayer *)&v18 initWithLabel:@"Pooling"];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_descriptor, a3);
    v17.receiver = v7;
    v17.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setKernelWidth:](&v17, sel_setKernelWidth_, [v5 kernelWidth]);
    v16.receiver = v7;
    v16.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setKernelHeight:](&v16, sel_setKernelHeight_, [v5 kernelHeight]);
    v15.receiver = v7;
    v15.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setDilationRateInX:](&v15, sel_setDilationRateInX_, [v5 dilationRateInX]);
    v14.receiver = v7;
    v14.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setDilationRateInY:](&v14, sel_setDilationRateInY_, [v5 dilationRateInY]);
    v13.receiver = v7;
    v13.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setStrideInX:](&v13, sel_setStrideInX_, [v5 strideInX]);
    v12.receiver = v7;
    v12.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setStrideInY:](&v12, sel_setStrideInY_, [v5 strideInY]);
    v11.receiver = v7;
    v11.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setPaddingPolicy:](&v11, sel_setPaddingPolicy_, [v5 paddingPolicy]);
    v10.receiver = v7;
    v10.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setPaddingSizeInX:](&v10, sel_setPaddingSizeInX_, [v5 paddingSizeInX]);
    v9.receiver = v7;
    v9.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setPaddingSizeInY:](&v9, sel_setPaddingSizeInY_, [v5 paddingSizeInY]);
  }

  return v7;
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
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_super v12 = [v10 objectAtIndexedSubscript:0];
  objc_super v13 = [v12 descriptor];
  uint64_t v14 = [v13 dataType];

  if (!+[MLCPoolingLayer supportsDataType:v14 onDevice:v9])
  {
    v29 = +[MLCLog framework];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v14;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v9;
      _os_log_error_impl(&dword_1DD0C9000, v29, OS_LOG_TYPE_ERROR, "%@: pooling layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
    }
    goto LABEL_28;
  }
  objc_super v15 = [v10 objectAtIndexedSubscript:0];
  objc_super v16 = [v15 descriptor];
  objc_super v17 = [v16 shape];
  uint64_t v18 = [v17 count];

  if (v18 == 4)
  {
    v67 = a2;
    v31 = [v10 objectAtIndexedSubscript:0];
    v32 = [v31 descriptor];
    v33 = [v32 shape];
    v34 = [v33 objectAtIndexedSubscript:3];
    unint64_t v68 = [v34 unsignedIntegerValue];

    v35 = [v10 objectAtIndexedSubscript:0];
    v36 = [v35 descriptor];
    v37 = [v36 shape];
    v38 = [v37 objectAtIndexedSubscript:2];
    unint64_t v39 = [v38 unsignedIntegerValue];

    v40 = [v11 descriptor];
    v41 = [v40 shape];
    v42 = [v41 objectAtIndexedSubscript:3];
    uint64_t v26 = [v42 unsignedIntegerValue];

    v43 = [v11 descriptor];
    v44 = [v43 shape];
    v45 = [v44 objectAtIndexedSubscript:2];
    uint64_t v28 = [v45 unsignedIntegerValue];

    float v27 = (float)v39;
  }
  else
  {
    if (v18 != 3)
    {
      v29 = +[MLCLog framework];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](a2, v29);
      }
      goto LABEL_28;
    }
    v67 = a2;
    v19 = [v10 objectAtIndexedSubscript:0];
    v20 = [v19 descriptor];
    v21 = [v20 shape];
    v22 = [v21 objectAtIndexedSubscript:2];
    unint64_t v68 = [v22 unsignedIntegerValue];

    v23 = [v11 descriptor];
    v24 = [v23 shape];
    v25 = [v24 objectAtIndexedSubscript:2];
    uint64_t v26 = [v25 unsignedIntegerValue];

    float v27 = 1.0;
    uint64_t v28 = 1;
  }
  if ([(MLCLayer *)self paddingPolicy] == 2)
  {
    *(void *)buf = [(MLCLayer *)self paddingSizeInX];
    *(void *)&buf[8] = [(MLCLayer *)self paddingSizeInX];
    *(void *)&buf[16] = [(MLCLayer *)self paddingSizeInY];
    unint64_t v46 = [(MLCLayer *)self paddingSizeInY];
  }
  else
  {
    v47 = [(MLCPoolingLayer *)self descriptor];
    int v48 = [v47 poolingType];

    float v49 = (float)([(MLCLayer *)self strideInX] * v26);
    float v50 = (float)v68;
    if (v48 == 2)
    {
      float v51 = v50 - (float)[(MLCLayer *)self kernelWidth];
      float v52 = v49 - (float)(v51 + (float)[(MLCLayer *)self strideInX]);
      if (v52 < 0.0) {
        float v52 = 0.0;
      }
      float v53 = 0.5;
      *(void *)buf = (unint64_t)(float)(v52 * 0.5);
      *(void *)&buf[8] = (unint64_t)(float)(v52 - (float)*(unint64_t *)buf);
      float v54 = (float)([(MLCLayer *)self strideInY] * v28);
      float v55 = (float)[(MLCLayer *)self kernelHeight];
    }
    else
    {
      unint64_t v56 = [(MLCLayer *)self dilationRateInX];
      float v57 = v50 - (float)(([(MLCLayer *)self kernelWidth] - 1) * v56 + 1);
      float v58 = v49 - (float)(v57 + (float)[(MLCLayer *)self strideInX]);
      if (v58 < 0.0) {
        float v58 = 0.0;
      }
      float v53 = 0.5;
      *(void *)buf = (unint64_t)(float)(v58 * 0.5);
      *(void *)&buf[8] = (unint64_t)(float)(v58 - (float)*(unint64_t *)buf);
      float v54 = (float)([(MLCLayer *)self strideInY] * v28);
      unint64_t v59 = [(MLCLayer *)self dilationRateInY];
      float v55 = (float)(([(MLCLayer *)self kernelHeight] - 1) * v59 + 1);
    }
    float v60 = v54 - (float)((float)(v27 - v55) + (float)[(MLCLayer *)self strideInY]);
    if (v60 < 0.0) {
      float v60 = 0.0;
    }
    *(void *)&buf[16] = (unint64_t)(float)(v60 * v53);
    unint64_t v46 = (unint64_t)(float)(v60 - (float)*(unint64_t *)&buf[16]);
  }
  *(void *)&buf[24] = v46;
  v61 = [v9 computeEngine];
  v62 = [(MLCPoolingLayer *)self descriptor];
  v29 = [v61 poolingLayerWithDescriptor:v62 paddingSizes:buf];

  if (!v29 || ![v29 count])
  {
    v65 = +[MLCLog framework];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](v67, (uint64_t)v29, v65);
    }

LABEL_28:
    char v64 = 0;
    goto LABEL_29;
  }
  v63 = [v9 computeEngine];
  char v64 = [v63 compileLayerDeviceOps:v29 sourceTensors:v10 resultTensor:v11];

  v69.receiver = self;
  v69.super_class = (Class)MLCPoolingLayer;
  [(MLCLayer *)&v69 bindDevice:v9 deviceOps:v29];
LABEL_29:

  return v64;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(MLCPoolingLayer *)self descriptor];
  v7 = [(MLCLayer *)self conditionalTreeNode];
  v8 = [(MLCLayer *)self resultTensors];
  id v9 = [v3 stringWithFormat:@"%@: { poolingDescriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  v3 = [(MLCPoolingLayer *)self descriptor];
  unsigned int v4 = [v3 paddingPolicy];

  if (v4 >= 2)
  {
    if (v4 != 2)
    {
      v36 = 0;
      goto LABEL_7;
    }
    v6 = NSString;
    id v5 = [(MLCPoolingLayer *)self descriptor];
    v7 = MLCPaddingPolicyDebugDescription((MLCPaddingPolicy)[v5 paddingPolicy]);
    v8 = [(MLCPoolingLayer *)self descriptor];
    uint64_t v9 = [v8 paddingSizeInX];
    id v10 = [(MLCPoolingLayer *)self descriptor];
    v36 = [v6 stringWithFormat:@"%@ (%lu, %lu)", v7, v9, objc_msgSend(v10, "paddingSizeInY")];
  }
  else
  {
    id v5 = [(MLCPoolingLayer *)self descriptor];
    v36 = MLCPaddingPolicyDebugDescription((MLCPaddingPolicy)[v5 paddingPolicy]);
  }

LABEL_7:
  v34 = (void *)MEMORY[0x1E4F28E78];
  id v11 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v11);
  NSUInteger v31 = [(MLCLayer *)self layerID];
  v35 = [(MLCPoolingLayer *)self descriptor];
  v30 = MLCPoolingTypeDebugDescription((MLCPoolingType)[v35 poolingType]);
  v33 = [(MLCPoolingLayer *)self descriptor];
  uint64_t v29 = [v33 kernelWidth];
  objc_super v12 = [(MLCPoolingLayer *)self descriptor];
  uint64_t v13 = [v12 kernelHeight];
  uint64_t v14 = [(MLCPoolingLayer *)self descriptor];
  uint64_t v15 = [v14 dilationRateInX];
  objc_super v16 = [(MLCPoolingLayer *)self descriptor];
  uint64_t v17 = [v16 dilationRateInY];
  uint64_t v18 = [(MLCPoolingLayer *)self descriptor];
  uint64_t v19 = [v18 strideInX];
  v20 = [(MLCPoolingLayer *)self descriptor];
  v21 = [v34 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Pooling Type: %@     Kernel: (%lu, %lu)<BR />Dilation: (%lu, %lu)  Stride: (%lu, %lu)<BR />Padding: %@", v32, v31, v30, v29, v13, v15, v17, v19, objc_msgSend(v20, "strideInY"), v36];

  v22 = [(MLCPoolingLayer *)self descriptor];
  LODWORD(v15) = [v22 poolingType];

  if (v15 == 2)
  {
    v23 = NSString;
    v24 = [(MLCPoolingLayer *)self descriptor];
    int v25 = [v24 countIncludesPadding];
    uint64_t v26 = @"NO";
    if (v25) {
      uint64_t v26 = @"YES";
    }
    float v27 = [v23 stringWithFormat:@"<BR />Count Includes Padding: %@", v26];
    [v21 appendString:v27];
  }
  [v21 appendString:@"</FONT>>"];

  return v21;
}

- (MLCPoolingDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(NSObject *)a2 resultTensor:.cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: source tensor shape is not supported.  must be a tensor of shape 3 or higher", (uint8_t *)&v4, 0xCu);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(uint64_t)a2 resultTensor:(NSObject *)a3 .cold.2(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: failure to create deviceOps=%@", (uint8_t *)&v6, 0x16u);
}

@end