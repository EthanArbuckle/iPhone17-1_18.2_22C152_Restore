@interface CVAFilterMaskedVariableBlur
+ (void)prewarmGaussianPyramid:(id)a3 device:(id)a4 commandBuffer:(id)a5;
- (CVAFilterMaskedVariableBlur)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 commandQueue:(id)a6 kernelSize:(int)a7 error:(id *)a8;
- (NSString)label;
- (void)encodeBlurPyramidInPlaceToCommandBuffer:(id)a3 inoutTexture:(id)a4;
- (void)encodeToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 mask:(id)a6 maxBlurRadius:(float)a7;
@end

@implementation CVAFilterMaskedVariableBlur

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_maskedVariableBlurKernel, 0);
  objc_storeStrong((id *)&self->_gaussianPyramid, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)encodeToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 mask:(id)a6 maxBlurRadius:(float)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  float v20 = a7;
  [(CVAFilterMaskedVariableBlur *)self encodeBlurPyramidInPlaceToCommandBuffer:v12 inoutTexture:v13];
  v16 = [v12 computeCommandEncoder];
  [v16 setLabel:@"_maskedVariableBlurKernel"];
  [v16 setComputePipelineState:self->_maskedVariableBlurKernel];
  [v16 setTexture:v14 atIndex:0];
  [v16 setTexture:v15 atIndex:1];
  [v16 setTexture:v13 atIndex:2];
  [v16 setBytes:&v20 length:4 atIndex:0];
  v19[0] = (unint64_t)([v14 width] + 15) >> 4;
  v19[1] = (unint64_t)([v14 height] + 15) >> 4;
  v19[2] = 1;
  uint64_t v18 = 1;
  long long v17 = xmmword_1BA86C930;
  [v16 dispatchThreadgroups:v19 threadsPerThreadgroup:&v17];
  [v16 endEncoding];
}

- (void)encodeBlurPyramidInPlaceToCommandBuffer:(id)a3 inoutTexture:(id)a4
{
  id v6 = a4;
  [(MPSImageGaussianPyramid *)self->_gaussianPyramid encodeToCommandBuffer:a3 inPlaceTexture:&v6 fallbackCopyAllocator:0];
}

- (CVAFilterMaskedVariableBlur)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 commandQueue:(id)a6 kernelSize:(int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v39.receiver = self;
  v39.super_class = (Class)CVAFilterMaskedVariableBlur;
  v19 = [(CVAFilterMaskedVariableBlur *)&v39 init];
  if (v19)
  {
    float v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    label = v19->_label;
    v19->_label = (NSString *)v21;

    objc_storeStrong((id *)&v19->_device, a3);
    sub_1BA8328CC((void **)&v19->_maskedVariableBlurKernel, v16, v17, v19->_device, @"maskedVariableBlurWithUpsample", a8, 0);
    if (v19->_maskedVariableBlurKernel)
    {
      if (sub_1BA84F794(@"harvesting.enabled", @"com.apple.coremedia", 0))
      {
LABEL_16:
        v33 = v19;
        goto LABEL_17;
      }
      if (!v9)
      {
        v25 = 0;
        goto LABEL_14;
      }
      uint64_t v23 = (v9 * v9);
      v24 = (int32x4_t *)operator new(4 * v23);
      v25 = v24;
      *(float *)v26.i32 = 1.0 / (float)(int)v23;
      unint64_t v27 = (v23 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      v28 = v24;
      if (v27 >= 7)
      {
        uint64_t v29 = (v27 + 1) & 0x7FFFFFFFFFFFFFF8;
        int32x4_t v30 = vdupq_lane_s32(v26, 0);
        v31 = v24 + 1;
        uint64_t v32 = v29;
        do
        {
          v31[-1] = v30;
          int32x4_t *v31 = v30;
          v31 += 2;
          v32 -= 8;
        }
        while (v32);
        if (v27 + 1 == v29)
        {
LABEL_14:
          uint64_t v34 = [objc_alloc(MEMORY[0x1E4F35590]) initWithDevice:v19->_device kernelWidth:(int)v9 kernelHeight:(int)v9 weights:v25];
          gaussianPyramid = v19->_gaussianPyramid;
          v19->_gaussianPyramid = (MPSImageGaussianPyramid *)v34;

          [(MPSImageGaussianPyramid *)v19->_gaussianPyramid setEdgeMode:1];
          [(MPSImageGaussianPyramid *)v19->_gaussianPyramid setOptions:2];
          v36 = objc_msgSend(NSString, "stringWithFormat:", @"GaussianPyramid%ix%i", v9, v9);
          [(MPSImageGaussianPyramid *)v19->_gaussianPyramid setLabel:v36];

          v37 = [v18 commandBuffer];
          [v37 setLabel:@"GaussianPyramid"];
          +[CVAFilterMaskedVariableBlur prewarmGaussianPyramid:v19->_gaussianPyramid device:v19->_device commandBuffer:v37];
          [v37 commit];

          if (v25) {
            operator delete(v25);
          }
          goto LABEL_16;
        }
        v28 = (int32x4_t *)((char *)v24 + 4 * v29);
      }
      do
      {
        v28->i32[0] = v26.i32[0];
        v28 = (int32x4_t *)((char *)v28 + 4);
      }
      while (v28 != (int32x4_t *)((char *)v24 + 4 * v23));
      goto LABEL_14;
    }
  }
  v33 = 0;
LABEL_17:

  return v33;
}

+ (void)prewarmGaussianPyramid:(id)a3 device:(id)a4 commandBuffer:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:70 width:144 height:108 mipmapped:0];
  [v10 setMipmapLevelCount:7];
  [v10 setUsage:3];
  id v11 = (id)[v8 newTextureWithDescriptor:v10];
  [v7 encodeToCommandBuffer:v9 inPlaceTexture:&v11 fallbackCopyAllocator:0];
}

@end