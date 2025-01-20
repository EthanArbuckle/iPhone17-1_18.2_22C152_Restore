@interface RedEyeGradient
- (id)outputImage;
@end

@implementation RedEyeGradient

- (id)outputImage
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (outputImage_onceToken_30 != -1) {
    dispatch_once(&outputImage_onceToken_30, &__block_literal_global_32_0);
  }
  v3 = (void *)[(id)outputImage_kernels_29 objectAtIndexedSubscript:0];
  [(CIImage *)self->inputImage extent];
  v9[0] = self->inputImage;
  return (id)objc_msgSend(v3, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_34, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 1), v4, v5, v6, v7);
}

NSArray *__29__RedEyeGradient_outputImage__block_invoke()
{
  result = objc_retain(+[CIKernel kernelsWithString:](CIKernel, "kernelsWithString:", objc_msgSend(NSString, "stringWithUTF8String:", "kernel vec4 _redEyeGaborToYAndVF(sampler src) { vec2 dc = destCoord(); vec2 pt, u, u2, v, v2; pt = samp"
                 "lerTransform(src, dc); u = samplerTransform(src, dc + vec2(1.0, 0.0)) - pt; v = samplerTransform(src, d"
                 "c + vec2(0.0, 1.0)) - pt; u2 = u + u; v2 = v + v; float d2, d3, d4, d6, d7, d8, d9, d10, d11, d12; d2 ="
                 " sample(src, pt - u + v2).r - sample(src, pt + u - v2).r; d3 = sample(src, pt + v2).r - sample(src, pt "
                 "- v2).r; d4 = sample(src, pt + u + v2).r - sample(src, pt - u - v2).r; d6 = sample(src, pt - u2 + v).r"
                 " - sample(src, pt + u2 - v).r; d7 = sample(src, pt - u + v).r - sample(src, pt + u - v).r; d8 = samp"
                 "le(src, pt + v).r - sample(src, pt - v).r; d9 = sample(src, pt + u + v).r - sample(src, pt - u - v)"
                 ".r; d10 = sample(src, pt + u2 + v).r - sample(src, pt - u2 - v).r; d11 = sample(src, pt - u2).r - sa"
                 "mple(src, pt + u2).r; d12 = sample(src, pt - u).r - sample(src, pt + u).r; float fx = -0.54470*d12 -"
                 " 0.17643*(d7 - d9) - 0.04445*d11 - 0.01801*(d6 - d10) - 0.00900*(d2 - d4); float fy = 0.54470*d8 + 0.17"
                 "643*(d7 + d9) + 0.04445*d3 + 0.01801*(d2 + d4) + 0.00900*(d6 + d10); float mag = sqrt(fx*fx + fy*fy); f"
                 "loat angle = atan(fy, fx) + 1.5707963; angle = compare(mag - 0.0001, 1.5707963, angle); angle = compare"
                 "(angle, angle + 6.2831853, angle); float norm = compare(mag - 0.00001, 0.0, 1.0 / mag); fx *= norm; fy "
                 "*= norm; return vec4(fx, fy, mag, angle); }")));
  outputImage_kernels_29 = (uint64_t)result;
  return result;
}

double __29__RedEyeGradient_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

@end