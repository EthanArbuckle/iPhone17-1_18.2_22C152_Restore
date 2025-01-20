@interface CIPortraitBlurNoise
- (CIImage)inputImage;
- (CIVector)inputExtent;
- (NSNumber)inputLumaNoiseAmpl;
- (NSNumber)inputLumaNoiseModelCoeff;
- (NSNumber)inputUseMetal;
- (id)_kernel;
- (id)_kernelMetal;
- (id)outputImage;
- (void)setInputExtent:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLumaNoiseAmpl:(id)a3;
- (void)setInputLumaNoiseModelCoeff:(id)a3;
- (void)setInputUseMetal:(id)a3;
@end

@implementation CIPortraitBlurNoise

- (id)_kernel
{
  if (-[CIPortraitBlurNoise _kernel]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlurNoise _kernel]::onceToken, &__block_literal_global_76_0);
  }
  return (id)-[CIPortraitBlurNoise _kernel]::k;
}

CIColorKernel *__30__CIPortraitBlurNoise__kernel__block_invoke()
{
  result = +[CIColorKernel kernelWithString:@"vec2 __pseudo_randKY( vec2 pos)\n{\nfloat rand1 = mod(12.63 * pos.x - 57.3 * pos.y * pos.y, 0.01369) \n+ mod(75.833 * pos.y - 37.135 * pos.x * pos.x, 0.014) \n+ mod(39.7 * pos.x * pos.y + 21.7 * pos.x * pos.y * pos.y, 0.0879);\nvec2 rand2 = fract(3576.7453 * vec2( rand1, 2.0 * rand1));\nvec2 rand3 = fract(vec2(7.7387 * (rand2.x + rand2.y), 33.707 * (rand2.x - rand2.y)));\nreturn rand3;\n}\nkernel vec4 _CIPortraitBlurNoise(__sample pixBlurred, vec4 params)\n{\n    float lumaNoiseAmpl = params.x;\n    float lumaNoiseModelCoeff = params.y;\n    vec2 randVal = __pseudo_randKY( destCoord() / params.zw);\n    float noiseLuma = clamp( sqrt( -2.0 * log(randVal.x)) * cos( 6.2832 * randVal.y), -5.0, 5.0);\n    vec4 kRGB_to_Y = vec4( 0.299 , 0.587, 0.114, 0.0);\n    float outLuma = dot( pixBlurred, kRGB_to_Y);\n    float addLumaNoiseLevel = lumaNoiseAmpl * mix( 1.0, outLuma, lumaNoiseModelCoeff);\n    vec4 pixOut = clamp( pixBlurred + (noiseLuma * addLumaNoiseLevel) , 0.0, 1.0);\n    pixOut.w = pixBlurred.w;\n\t return pixOut;\n}\n"];
  -[CIPortraitBlurNoise _kernel]::k = (uint64_t)result;
  return result;
}

- (id)_kernelMetal
{
  if (-[CIPortraitBlurNoise _kernelMetal]::onceToken != -1) {
    dispatch_once(&-[CIPortraitBlurNoise _kernelMetal]::onceToken, &__block_literal_global_82_0);
  }
  return (id)-[CIPortraitBlurNoise _kernelMetal]::k;
}

id __35__CIPortraitBlurNoise__kernelMetal__block_invoke()
{
  id result = +[CIColorKernel SDOFV2MetalKernelNamed:@"_CIPortraitBlurNoiseM"];
  -[CIPortraitBlurNoise _kernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  v24[2] = *MEMORY[0x1E4F143B8];
  [(CIVector *)self->inputExtent CGRectValue];
  double v4 = v3;
  double v6 = v5;
  if ([(NSNumber *)self->inputUseMetal BOOLValue]) {
    id v7 = [(CIPortraitBlurNoise *)self _kernelMetal];
  }
  else {
    id v7 = [(CIPortraitBlurNoise *)self _kernel];
  }
  id v8 = v7;
  if (!v7) {
    id v8 = [(CIPortraitBlurNoise *)self _kernel];
  }
  [(CIImage *)self->inputImage extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v24[0] = self->inputImage;
  [(NSNumber *)self->inputLumaNoiseAmpl floatValue];
  double v18 = v17;
  [(NSNumber *)self->inputLumaNoiseModelCoeff floatValue];
  v24[1] = +[CIVector vectorWithX:v18 Y:v19 Z:v4 W:v6];
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v22 = @"kCIKernelOutputFormat";
  uint64_t v23 = [NSNumber numberWithInt:264];
  return (id)objc_msgSend(v8, "applyWithExtent:arguments:options:", v20, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1), v10, v12, v14, v16);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputLumaNoiseAmpl
{
  return self->inputLumaNoiseAmpl;
}

- (void)setInputLumaNoiseAmpl:(id)a3
{
}

- (NSNumber)inputLumaNoiseModelCoeff
{
  return self->inputLumaNoiseModelCoeff;
}

- (void)setInputLumaNoiseModelCoeff:(id)a3
{
}

- (CIVector)inputExtent
{
  return (CIVector *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputExtent:(id)a3
{
}

- (NSNumber)inputUseMetal
{
  return self->inputUseMetal;
}

- (void)setInputUseMetal:(id)a3
{
}

@end