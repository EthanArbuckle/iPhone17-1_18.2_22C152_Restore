@interface CIToneMapHeadroom
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputSourceHeadroom;
- (NSNumber)inputTargetHeadroom;
- (float)srcHeadroom;
- (float)targetHeadroom;
- (id)outputImage;
- (id)outputValue:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSourceHeadroom:(id)a3;
- (void)setInputTargetHeadroom:(id)a3;
@end

@implementation CIToneMapHeadroom

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryColorAdjustment";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryInterlaced";
  v7[3] = @"CICategoryHighDynamicRange";
  v7[4] = @"CICategoryNonSquarePixels";
  v7[5] = @"CICategoryStillImage";
  v7[6] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
  v9[1] = @"18";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"15.0";
  v8[3] = @"inputSourceHeadroom";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4AA538;
  v6[1] = &unk_1EE4AA538;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4AA550;
  v6[3] = &unk_1EE4AA568;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeScalar";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v8[4] = @"inputTargetHeadroom";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4AA538;
  v4[1] = &unk_1EE4AA538;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4AA550;
  v4[3] = &unk_1EE4AA568;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4AA538;
  v4[5] = @"CIAttributeTypeScalar";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (float)targetHeadroom
{
  [(NSNumber *)[(CIToneMapHeadroom *)self inputTargetHeadroom] floatValue];
  float v3 = 1.0;
  if (v2 >= 1.0) {
    float v3 = v2;
  }
  BOOL v4 = v2 > 0.0;
  float result = 0.0;
  if (v4) {
    return v3;
  }
  return result;
}

- (float)srcHeadroom
{
  if (self->inputSourceHeadroom) {
    [(NSNumber *)self->inputSourceHeadroom floatValue];
  }
  else {
    [(CIImage *)self->inputImage contentHeadroom];
  }
  float v3 = 1.0;
  if (v2 > 1.0) {
    float v3 = v2;
  }
  BOOL v4 = v2 > 0.0;
  float result = 0.0;
  if (v4) {
    return v3;
  }
  return result;
}

- (id)outputValue:(id)a3
{
  [(CIToneMapHeadroom *)self srcHeadroom];
  float v6 = v5;
  [(CIToneMapHeadroom *)self targetHeadroom];
  long long v14 = 0u;
  long long v15 = 0u;
  calcUniforms(v6, v7, (uint64_t)&v14);
  if (!v14) {
    return a3;
  }
  if (v14 == 1)
  {
    [a3 floatValue];
    *(float *)&double v8 = fminf(*(float *)&v8, *((float *)&v14 + 2));
  }
  else
  {
    [a3 floatValue];
    float v10 = *((float *)&v14 + 3);
    if (*(float *)&v8 > 1.0)
    {
      float v11 = (float)(*((float *)&v15 + 2)
                  + sqrtf(fmaxf(*((float *)&v15 + 1) + (float)(*(float *)&v15 * *(float *)&v8), 0.0)))
          / *(float *)&v15;
      float v12 = *((float *)&v14 + 3) + (float)(*((float *)&v15 + 3) * v11) * (v11 + -2.0);
      if (*(float *)&v8 >= *((float *)&v14 + 1)) {
        float v12 = *((float *)&v14 + 2);
      }
      float v10 = fminf(v12 / *(float *)&v8, 1.0);
    }
    *(float *)&double v8 = *(float *)&v8 * v10;
  }
  v13 = NSNumber;

  return (id)[v13 numberWithFloat:v8];
}

- (id)outputImage
{
  v47[2] = *MEMORY[0x1E4F143B8];
  float v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_headroomToneMap];
  BOOL v4 = +[CIKernel kernelWithInternalRepresentation:&CI::_headroomClamp];
  float v5 = [(CIToneMapHeadroom *)self inputImage];
  [(CIToneMapHeadroom *)self srcHeadroom];
  float v7 = v6;
  [(CIToneMapHeadroom *)self targetHeadroom];
  float v9 = v8;
  long long v40 = 0u;
  long long v41 = 0u;
  calcUniforms(v7, v8, (uint64_t)&v40);
  int v10 = v40;
  if (!v40) {
    return v5;
  }
  float v11 = [(CIImage *)self->inputImage colorSpace];
  if (!CGColorSpaceContainsFlexGTCInfo())
  {
    long long v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBD8]);
    if (v15) {
      float v5 = [(CIImage *)v5 imageByColorMatchingWorkingSpaceToColorSpace:v15];
    }
    v16 = [(CIImage *)v5 imageByUnpremultiplyingAlpha];
    [(CIImage *)v16 extent];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    if (v10 == 1)
    {
      v47[0] = v16;
      int v25 = DWORD2(v40);
      LODWORD(v17) = DWORD2(v40);
      v47[1] = [NSNumber numberWithFloat:v17];
      uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
      v45 = @"kCIImageContentHeadroom";
      LODWORD(v27) = v25;
      uint64_t v46 = [NSNumber numberWithFloat:v27];
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      v29 = v4;
      double v30 = v18;
      double v31 = v20;
      double v32 = v22;
      double v33 = v24;
      uint64_t v34 = v26;
    }
    else
    {
      v44[0] = v16;
      LODWORD(v17) = DWORD1(v40);
      v44[1] = [NSNumber numberWithFloat:v17];
      LODWORD(v35) = DWORD2(v40);
      v44[2] = [NSNumber numberWithFloat:v35];
      LODWORD(v36) = HIDWORD(v40);
      v44[3] = [NSNumber numberWithFloat:v36];
      v44[4] = +[CIVector vectorWithX:*(float *)&v41 Y:*((float *)&v41 + 1) Z:*((float *)&v41 + 2) W:*((float *)&v41 + 3)];
      uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:5];
      v42 = @"kCIImageContentHeadroom";
      *(float *)&double v38 = v9;
      uint64_t v43 = [NSNumber numberWithFloat:v38];
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      v29 = v3;
      double v30 = v18;
      double v31 = v20;
      double v32 = v22;
      double v33 = v24;
      uint64_t v34 = v37;
    }
    v39 = (CIImage *)objc_msgSend(-[CIColorKernel applyWithExtent:arguments:options:](v29, "applyWithExtent:arguments:options:", v34, v28, v30, v31, v32, v33), "imageByPremultiplyingAlpha");
    float v5 = v39;
    if (v15) {
      float v5 = [(CIImage *)v39 imageByColorMatchingColorSpaceToWorkingSpace:v15];
    }
    CGColorSpaceRelease(v15);
    return v5;
  }
  float v12 = [(CIImage *)v5 imageByColorMatchingWorkingSpaceToColorSpace:v11];
  *(float *)&double v13 = v9;

  return [(CIImage *)v12 _imageByToneMappingColorSpaceToWorkingSpace:v11 targetHeadroom:v13];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputSourceHeadroom
{
  return self->inputSourceHeadroom;
}

- (void)setInputSourceHeadroom:(id)a3
{
}

- (NSNumber)inputTargetHeadroom
{
  return self->inputTargetHeadroom;
}

- (void)setInputTargetHeadroom:(id)a3
{
}

@end