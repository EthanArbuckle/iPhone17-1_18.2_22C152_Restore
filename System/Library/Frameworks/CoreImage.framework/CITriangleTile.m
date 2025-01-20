@interface CITriangleTile
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_CITriangleTile;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CITriangleTile

- (id)_CITriangleTile
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_triangleTile];
}

- (id)outputImage
{
  v56[4] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputAngle floatValue];
  float v6 = v5;
  double v7 = v4;
  double v52 = v5;
  __double2 v8 = __sincos_stret(v5 + 0.523598776);
  float v9 = v8.__cosval * v4;
  float v10 = v8.__sinval * v4;
  float v11 = v4 / 1.73205081;
  __float2 v12 = __sincosf_stret(v6);
  [(CIVector *)self->inputCenter X];
  float v14 = v13;
  [(CIVector *)self->inputCenter Y];
  float v16 = v15;
  float v17 = v14 + (float)(v12.__cosval * v11);
  float v18 = v16 + (float)(v12.__sinval * v11);
  double v19 = v18;
  double v20 = (float)(v12.__cosval * v11) + v17;
  double v21 = (float)(v12.__sinval * v11) + v18;
  float v22 = v9;
  float v23 = v14 + v9;
  float v54 = v10;
  float v24 = v10 + v16;
  BOOL v25 = v20 < v17;
  BOOL v26 = v20 <= v17;
  float v27 = v20;
  if (v26) {
    float v28 = v14 + (float)(v12.__cosval * v11);
  }
  else {
    float v28 = v27;
  }
  if (v25) {
    float v28 = v14 + (float)(v12.__cosval * v11);
  }
  if (v25) {
    float v17 = v27;
  }
  if (v21 >= v19)
  {
    if (v21 <= v19) {
      float v29 = v18;
    }
    else {
      float v29 = v21;
    }
  }
  else
  {
    float v29 = v18;
    float v18 = v21;
  }
  if (v23 > v28) {
    float v30 = v14 + v9;
  }
  else {
    float v30 = v28;
  }
  if (v23 >= v17) {
    float v31 = v30;
  }
  else {
    float v31 = v28;
  }
  if (v23 >= v17) {
    float v32 = v17;
  }
  else {
    float v32 = v14 + v9;
  }
  if (v24 > v29) {
    float v33 = v24;
  }
  else {
    float v33 = v29;
  }
  if (v24 >= v18) {
    float v34 = v33;
  }
  else {
    float v34 = v29;
  }
  if (v24 >= v18) {
    float v35 = v18;
  }
  else {
    float v35 = v24;
  }
  __double2 v36 = __sincos_stret(v52 + -0.523598776);
  float v37 = v36.__cosval * v7;
  float v38 = v36.__sinval * v7;
  float v39 = 1.0 / (float)((float)(v37 * v54) - (float)(v38 * v22));
  float v51 = -(float)(v22 * v39);
  float v53 = v39 * v37;
  float v49 = v39 * v54;
  float v50 = -(float)(v38 * v39);
  v40 = +[CIVector vectorWithX:v32 Y:v35 Z:(float)(v31 - v32) W:(float)(v34 - v35)];
  id v41 = [(CITriangleTile *)self _CITriangleTile];
  double v42 = *MEMORY[0x1E4F1DB10];
  double v43 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v45 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v44 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __29__CITriangleTile_outputImage__block_invoke;
  v55[3] = &unk_1E57716D0;
  inputImage = self->inputImage;
  inputCenter = self->inputCenter;
  v55[4] = v40;
  v56[0] = inputImage;
  v56[1] = inputCenter;
  v56[2] = +[CIVector vectorWithX:v49 Y:v51 Z:v50 W:v53];
  v56[3] = +[CIVector vectorWithX:v37 Y:v22 Z:v38 W:v54];
  return (id)objc_msgSend(v41, "applyWithExtent:roiCallback:arguments:", v55, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v56, 4), v42, v43, v45, v44);
}

double __29__CITriangleTile_outputImage__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 X];
  double v3 = v2 + -1.0;
  [v1 Y];
  [v1 Z];
  [v1 W];
  return v3;
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryTileEffect";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputWidth";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4AA070;
  v4[1] = &unk_1EE4AA080;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4AA090;
  v4[3] = &unk_1EE4AA0A0;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeDistance";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end