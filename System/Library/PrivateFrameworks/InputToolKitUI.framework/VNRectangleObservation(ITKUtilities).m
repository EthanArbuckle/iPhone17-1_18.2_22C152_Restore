@interface VNRectangleObservation(ITKUtilities)
- (ITKQuad)itkQuad;
- (id)itk_quadConvertedToView:()ITKUtilities withContentsRect:;
@end

@implementation VNRectangleObservation(ITKUtilities)

- (ITKQuad)itkQuad
{
  objc_opt_class();
  v0 = ITKDynamicCast();
  v1 = v0;
  if (v0)
  {
    [v0 topLeft];
    ITKFlipPoint();
    double v16 = v3;
    double v17 = v2;
    [v1 topRight];
    ITKFlipPoint();
    double v5 = v4;
    double v7 = v6;
    [v1 bottomLeft];
    ITKFlipPoint();
    double v9 = v8;
    double v11 = v10;
    [v1 bottomRight];
    ITKFlipPoint();
    v14 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v9, v11, v12, v13, v17, v16, v5, v7);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)itk_quadConvertedToView:()ITKUtilities withContentsRect:
{
  id v12 = a7;
  double v13 = [a1 itkQuad];
  v14 = objc_msgSend(v13, "quadByConvertingFromNormalizedRectToView:contentsRect:", v12, a2, a3, a4, a5);

  return v14;
}

@end