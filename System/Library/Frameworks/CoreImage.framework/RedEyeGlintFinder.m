@interface RedEyeGlintFinder
- (id)outputImage;
@end

@implementation RedEyeGlintFinder

- (id)outputImage
{
  v22[3] = *MEMORY[0x1E4F143B8];
  if (outputImage_onceToken_0 != -1) {
    dispatch_once(&outputImage_onceToken_0, &__block_literal_global_74);
  }
  [(CIVector *)self->inputThresholds X];
  float v4 = v3;
  [(CIVector *)self->inputThresholds Y];
  float v6 = v5;
  [(CIVector *)self->inputThresholds Z];
  *(float *)&double v7 = v7;
  float v8 = 1.0 / (1.0 - v4);
  float v9 = 1.0 / (1.0 - v6);
  float v10 = 1.0 / (1.0 - *(float *)&v7);
  float v11 = v8 + -1.0;
  float v12 = v9 + -1.0;
  float v13 = v10 + -1.0;
  v14 = +[CIVector vectorWithX:v8 Y:v9 Z:v10 W:0.0];
  v15 = +[CIVector vectorWithX:v11 Y:v12 Z:v13 W:0.0];
  v16 = (void *)[(id)outputImage_kernels objectAtIndexedSubscript:0];
  [(CIImage *)self->inputImage extent];
  v22[0] = self->inputImage;
  v22[1] = v14;
  v22[2] = v15;
  return (id)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_5_2, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 3), v17, v18, v19, v20);
}

NSArray *__32__RedEyeGlintFinder_outputImage__block_invoke()
{
  result = +[CIKernel kernelsWithString:](CIColorKernel, "kernelsWithString:", objc_msgSend(NSString, "stringWithUTF8String:", "kernel vec4 _redEyeGlintfinder(__sample a, vec4 factors, vec4 offsets) { vec4 b = max(sqrt(a)*factors - offsets, vec4(0.0)); float y = b.r * b.g * b.b; return vec4(y, y, y, 1.0); }"));
  outputImage_kernels = (uint64_t)result;
  return result;
}

@end