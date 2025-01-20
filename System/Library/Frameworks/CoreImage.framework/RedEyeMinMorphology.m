@interface RedEyeMinMorphology
- (id)outputImage;
@end

@implementation RedEyeMinMorphology

- (id)outputImage
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if (outputImage_onceToken_1 != -1) {
    dispatch_once(&outputImage_onceToken_1, &__block_literal_global_76);
  }
  [(NSNumber *)self->inputRadius floatValue];
  int v4 = v3;
  v5 = (void *)[(id)outputImage_kernels_0 objectAtIndexedSubscript:0];
  [(CIImage *)self->inputImage extent];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __34__RedEyeMinMorphology_outputImage__block_invoke_2;
  v21[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  int v22 = v4;
  inputRadius = self->inputRadius;
  v24[0] = self->inputImage;
  v24[1] = inputRadius;
  uint64_t v11 = objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:", v21, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 2), v7, v8, v9, v10);
  v12 = (void *)[(id)outputImage_kernels_0 objectAtIndexedSubscript:1];
  [(CIImage *)self->inputImage extent];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __34__RedEyeMinMorphology_outputImage__block_invoke_3;
  v19[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  int v20 = v4;
  v13 = self->inputRadius;
  v23[0] = v11;
  v23[1] = v13;
  return (id)objc_msgSend(v12, "applyWithExtent:roiCallback:arguments:", v19, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 2), v14, v15, v16, v17);
}

NSArray *__34__RedEyeMinMorphology_outputImage__block_invoke()
{
  result = objc_retain(+[CIKernel kernelsWithString:](CIKernel, "kernelsWithString:", objc_msgSend(NSString, "stringWithUTF8String:", "kernel vec4 _redEyeHorizontalMinKernel(sampler im, float radius) { float offset; vec2 pt, sd; vec4 s, m"
                 "insofar; pt = samplerCoord(im); sd = samplerTransform(im, destCoord() + vec2(1.0)) - pt; minsofar = sam"
                 "ple(im, pt + vec2(0.0, 0.0)*sd); for (offset = 1.0; offset <= radius; offset += 1.0) { s = sample(im, p"
                 "t + vec2(offset, 0.0)*sd); minsofar = min(minsofar, s); s = sample(im, pt + vec2(-offset, 0.0)*sd); min"
                 "sofar = min(minsofar, s); } return minsofar; } kernel vec4 _redEyeVerticalMinKernel(sampler im, float r"
                 "adius) { float offset; vec2 pt, sd; vec4 s, minsofar; pt = samplerCoord(im); sd = samplerTransform(im, "
                 "destCoord() + vec2(1.0)) - pt; minsofar = sample(im, pt + vec2(0.0, 0.0)*sd); for (offset = 1.0; offset"
                 " <= radius; offset += 1.0) { s = sample(im, pt + vec2(0.0, offset)*sd); minsofar = min(minsofar, s); s "
                 "= sample(im, pt + vec2(0.0, -offset)*sd); minsofar = min(minsofar, s); } return minsofar; }")));
  outputImage_kernels_0 = (uint64_t)result;
  return result;
}

double __34__RedEyeMinMorphology_outputImage__block_invoke_2(uint64_t a1, double a2)
{
  return a2 - ceilf(*(float *)(a1 + 32));
}

@end