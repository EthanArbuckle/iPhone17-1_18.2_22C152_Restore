@interface CIMorphologyRectangle
+ (id)customAttributes;
- (BOOL)_doMinimum;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputHeight;
- (NSNumber)inputWidth;
- (id)outputImage;
- (void)setInputHeight:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CIMorphologyRectangle

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryBlur";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"13";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.15";
  v8[3] = @"inputWidth";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeMin";
  v6[0] = @"CIAttributeTypeInteger";
  v6[1] = &unk_1EE4A9470;
  v5[2] = @"CIAttributeSliderMin";
  v5[3] = @"CIAttributeSliderMax";
  v6[2] = &unk_1EE4A9470;
  v6[3] = &unk_1EE4A9490;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeIdentity";
  v6[4] = &unk_1EE4A9450;
  v6[5] = &unk_1EE4A9470;
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputHeight";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeInteger";
  v4[1] = &unk_1EE4A9470;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A9470;
  v4[3] = &unk_1EE4A9490;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4A9450;
  v4[5] = &unk_1EE4A9470;
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (BOOL)_isIdentity
{
  return [(NSNumber *)self->inputWidth intValue] <= 2
      && [(NSNumber *)self->inputHeight intValue] < 3;
}

- (BOOL)_doMinimum
{
  return 0;
}

- (id)outputImage
{
  v36[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(CIMorphologyRectangle *)self _isIdentity])
  {
    v3 = self->inputImage;
    return v3;
  }
  [(NSNumber *)self->inputWidth floatValue];
  uint64_t v7 = 1;
  if (v6 > 2.0) {
    uint64_t v7 = (2 * vcvtms_s32_f32(v6 * 0.5)) | 1;
  }
  [(NSNumber *)self->inputHeight floatValue];
  uint64_t v9 = 1;
  if (v8 > 2.0) {
    uint64_t v9 = (2 * vcvtms_s32_f32(v8 * 0.5)) | 1;
  }
  BOOL v10 = [(CIMorphologyRectangle *)self _doMinimum];
  if (!v10)
  {
    int v13 = -1;
    v14 = &CI::_morphmax;
    goto LABEL_16;
  }
  [(CIImage *)self->inputImage extent];
  if (v11 > (double)((int)v7 - 1))
  {
    [(CIImage *)self->inputImage extent];
    if (v12 > (double)((int)v9 - 1))
    {
      int v13 = 1;
      v14 = &CI::_morphmin;
LABEL_16:
      inputImage = self->inputImage;
      v15 = +[CIKernel kernelWithInternalRepresentation:v14];
      if ((int)v9 >= 0) {
        int v16 = v9;
      }
      else {
        int v16 = v9 + 1;
      }
      if (v13 * (int)v9 >= 0) {
        int v17 = v13 * v9;
      }
      else {
        int v17 = v13 * v9 + 1;
      }
      if ((int)v7 >= 3)
      {
        int v30 = v16;
        [(CIImage *)inputImage extent];
        CGRect v39 = CGRectInset(v38, (double)(v13 * (int)v7 / 2), 0.0);
        double x = v39.origin.x;
        double y = v39.origin.y;
        double width = v39.size.width;
        double height = v39.size.height;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __36__CIMorphologyRectangle_outputImage__block_invoke;
        v33[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        unsigned int v34 = v7 >> 1;
        v36[0] = inputImage;
        v36[1] = [NSNumber numberWithInt:v7 >> 1];
        v36[2] = +[CIVector vectorWithX:1.0 Y:0.0];
        uint64_t v22 = -[CIKernel applyWithExtent:roiCallback:arguments:](v15, "applyWithExtent:roiCallback:arguments:", v33, [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3], x, y, width, height);
        int v16 = v30;
        inputImage = (CIImage *)v22;
      }
      if ((int)v9 >= 3)
      {
        uint64_t v23 = (v16 >> 1);
        [(CIImage *)inputImage extent];
        CGRect v41 = CGRectInset(v40, 0.0, (double)(v17 >> 1));
        double v24 = v41.origin.x;
        double v25 = v41.origin.y;
        double v26 = v41.size.width;
        double v27 = v41.size.height;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __36__CIMorphologyRectangle_outputImage__block_invoke_2;
        v31[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        int v32 = v23;
        v35[0] = inputImage;
        v35[1] = [NSNumber numberWithInt:v23];
        v35[2] = +[CIVector vectorWithX:0.0 Y:1.0];
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v15, "applyWithExtent:roiCallback:arguments:", v31, [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3], v24, v25, v26, v27);
      }
      if (CI_ENABLE_MPS())
      {
        v28 = self->inputImage;
        if ((int)v7 > 9 || (int)v9 > 9)
        {
          v28 = +[CIMorphologyProcessor applyBoxToImage:v28 width:v7 height:1 doMin:v10];
          uint64_t v29 = 1;
        }
        else
        {
          uint64_t v29 = v7;
        }
        return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIMorphologyProcessor applyBoxToImage:v28 width:v29 height:v9 doMin:v10], inputImage);
      }
      return inputImage;
    }
  }

  return +[CIImage emptyImage];
}

double __36__CIMorphologyRectangle_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (double)-*(_DWORD *)(a1 + 32), 0.0);
  return result;
}

double __36__CIMorphologyRectangle_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, 0.0, (double)-*(_DWORD *)(a1 + 32));
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputHeight
{
  return self->inputHeight;
}

- (void)setInputHeight:(id)a3
{
}

@end