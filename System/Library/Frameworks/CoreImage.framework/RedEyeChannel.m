@interface RedEyeChannel
- (id)filterNameForChannel:(int)a3;
- (id)outputImage;
- (id)parameterNamesForChannel:(int)a3;
@end

@implementation RedEyeChannel

- (id)outputImage
{
  v28[2] = *MEMORY[0x1E4F143B8];
  if (outputImage_onceToken_2 != -1) {
    dispatch_once(&outputImage_onceToken_2, &__block_literal_global_78);
  }
  int v3 = [(NSNumber *)self->inputChannel intValue];
  inputParam1 = self->inputParam1;
  if (inputParam1)
  {
    [(NSNumber *)inputParam1 floatValue];
    float v6 = v5;
    if (v3 <= 0x18 && ((1 << v3) & 0x1A08000) != 0) {
      float v6 = 1.0 / (1.0 - v5);
    }
  }
  else
  {
    float v6 = 1.0;
    if ((v3 - 15) < 0xA) {
      float v6 = flt_19395830C[v3 - 15];
    }
  }
  inputParam2 = self->inputParam2;
  if (inputParam2)
  {
    [(NSNumber *)inputParam2 floatValue];
    float v10 = v9;
    if (v3 == 21 || v3 == 15) {
      float v10 = 1.0 / (1.0 - v9);
    }
  }
  else
  {
    float v10 = 1.0;
    if ((v3 - 15) < 0xA) {
      float v10 = flt_193958334[v3 - 15];
    }
  }
  inputParam3 = self->inputParam3;
  if (inputParam3)
  {
    [(NSNumber *)inputParam3 floatValue];
    float v14 = v13;
    if ((v3 & 0xFFFFFFFD) == 0x15) {
      float v14 = 1.0 / (1.0 - v13);
    }
  }
  else
  {
    float v15 = 1.0;
    if (v3 == 21) {
      float v15 = 5.0;
    }
    if (v3 == 23) {
      float v14 = 2.0;
    }
    else {
      float v14 = v15;
    }
  }
  if (self->inputParam1)
  {
    [(NSNumber *)self->inputParam4 floatValue];
    double v17 = v16;
  }
  else
  {
    double v17 = 1.0;
  }
  v18 = (void *)[(id)outputImage_kernels_1 objectAtIndexedSubscript:v3];
  [(CIImage *)self->inputImage extent];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v28[0] = self->inputImage;
  v28[1] = +[CIVector vectorWithX:v6 Y:v10 Z:v14 W:v17];
  return (id)objc_msgSend(v18, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_4, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 2), v20, v22, v24, v26);
}

NSArray *__28__RedEyeChannel_outputImage__block_invoke()
{
  result = +[CIKernel kernelsWithString:](CIColorKernel, "kernelsWithString:", [NSString stringWithUTF8String:aKernelVec4Rede_4]);
  outputImage_kernels_1 = (uint64_t)result;
  return result;
}

- (id)filterNameForChannel:(int)a3
{
  if ((a3 - 1) > 0x17) {
    return @"Original";
  }
  else {
    return off_1E57733C0[a3 - 1];
  }
}

- (id)parameterNamesForChannel:(int)a3
{
  if ((a3 - 15) > 9) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  else {
    return (id)qword_1E5773480[a3 - 15];
  }
}

@end