@interface CIInterleavedToPlanar3
- (id)outputImage;
@end

@implementation CIInterleavedToPlanar3

- (id)outputImage
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v2 = [(CIPlanarize *)self inputImage];
  [(CIImage *)v2 extent];
  if (CGRectIsEmpty(v25)) {
    return 0;
  }
  [(CIImage *)v2 extent];
  if (CGRectIsInfinite(v26)) {
    return 0;
  }
  v4 = +[CIKernel kernelWithInternalRepresentation:&CI::_interleavedToPlanar3];
  [(CIImage *)v2 extent];
  double v6 = v5;
  [(CIImage *)v2 extent];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGAffineTransformMakeScale(&v21, 1.0, 3.0);
  v27.origin.double x = v8;
  v27.origin.double y = v10;
  v27.size.double width = v12;
  v27.size.double height = v14;
  CGRect v28 = CGRectApplyAffineTransform(v27, &v21);
  double x = v28.origin.x;
  double y = v28.origin.y;
  double width = v28.size.width;
  double height = v28.size.height;
  v24[0] = v2;
  v24[1] = objc_msgSend(NSNumber, "numberWithDouble:", v6, MEMORY[0x1E4F143A8], 3221225472, __37__CIInterleavedToPlanar3_outputImage__block_invoke, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, *(void *)&v6);
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v22 = @"kCIKernelOutputFormat";
  uint64_t v23 = [NSNumber numberWithInt:2053];
  return -[CIKernel applyWithExtent:roiCallback:arguments:options:](v4, "applyWithExtent:roiCallback:arguments:options:", &v20, v19, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1], x, y, width, height);
}

@end