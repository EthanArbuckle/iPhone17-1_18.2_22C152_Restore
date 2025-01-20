@interface RedEyeDifference
- (id)outputImage;
@end

@implementation RedEyeDifference

- (id)outputImage
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (outputImage_onceToken_18 != -1) {
    dispatch_once(&outputImage_onceToken_18, &__block_literal_global_20);
  }
  v3 = (void *)[(id)outputImage_kernels_17 objectAtIndexedSubscript:0];
  [(CIImage *)self->inputImage extent];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(CIImage *)self->inputSubtractedImage extent];
  v21.origin.x = v12;
  v21.origin.y = v13;
  v21.size.width = v14;
  v21.size.height = v15;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  CGRect v20 = CGRectUnion(v19, v21);
  inputSubtractedImage = self->inputSubtractedImage;
  v18[0] = self->inputImage;
  v18[1] = inputSubtractedImage;
  return (id)objc_msgSend(v3, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_23, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 2), v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
}

NSArray *__31__RedEyeDifference_outputImage__block_invoke()
{
  result = objc_retain(+[CIKernel kernelsWithString:](CIColorKernel, "kernelsWithString:", objc_msgSend(NSString, "stringWithUTF8String:", "kernel vec4 _redEyeDifference(sampler src1, sampler src2) { vec2 dc = destCoord(); vec4 s1, s2, diff; s"
                 "1 = sample(src1, samplerTransform(src1, dc)); s2 = sample(src2, samplerTransform(src2, dc)); diff = max"
                 "(s1 - s2, vec4(0.0)); return vec4(diff.rgb, 1.0); }")));
  outputImage_kernels_17 = (uint64_t)result;
  return result;
}

@end