@interface CIPlanarToInterleaved3
- (id)outputImage;
@end

@implementation CIPlanarToInterleaved3

- (id)outputImage
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v2 = [(CIPlanarize *)self inputImage];
  [(CIImage *)v2 extent];
  if (CGRectIsEmpty(v22)) {
    return 0;
  }
  [(CIImage *)v2 extent];
  if (CGRectIsInfinite(v23)) {
    return 0;
  }
  v4 = +[CIKernel kernelWithInternalRepresentation:&CI::_planarToInterleaved3];
  [(CIImage *)v2 extent];
  uint64_t v6 = v5;
  [(CIImage *)v2 extent];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGAffineTransformMakeScale(&v20, 1.0, 0.333333333);
  v24.origin.double x = v8;
  v24.origin.double y = v10;
  v24.size.double width = v12;
  v24.size.double height = v14;
  CGRect v25 = CGRectApplyAffineTransform(v24, &v20);
  double x = v25.origin.x;
  double y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;
  v21[0] = v2;
  v21[1] = objc_msgSend(NSNumber, "numberWithDouble:", v25.size.height, MEMORY[0x1E4F143A8], 3221225472, __37__CIPlanarToInterleaved3_outputImage__block_invoke, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, v6);
  return -[CIKernel applyWithExtent:roiCallback:arguments:](v4, "applyWithExtent:roiCallback:arguments:", &v19, [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2], x, y, width, height);
}

@end