@interface CALayer(ITKUtilities)
- (ITKAutoFadeOutLayer)itk_autoFadeOutShapePointLayer;
- (ITKQuad)itk_quadFromConvertingRect:()ITKUtilities toLayer:;
- (id)itk_autoFadeOutShapeRectLayer;
- (id)itk_quadFromConvertingBoundsToLayer:()ITKUtilities;
@end

@implementation CALayer(ITKUtilities)

- (id)itk_quadFromConvertingBoundsToLayer:()ITKUtilities
{
  id v4 = a3;
  [a1 bounds];
  v5 = objc_msgSend(a1, "itk_quadFromConvertingRect:toLayer:", v4);

  return v5;
}

- (ITKQuad)itk_quadFromConvertingRect:()ITKUtilities toLayer:
{
  id v12 = a7;
  v13 = -[ITKQuad initWithRect:]([ITKQuad alloc], "initWithRect:", a2, a3, a4, a5);
  [(ITKQuad *)v13 topLeft];
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  double v15 = v14;
  double v17 = v16;
  [(ITKQuad *)v13 topRight];
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  double v19 = v18;
  double v21 = v20;
  [(ITKQuad *)v13 bottomLeft];
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  double v23 = v22;
  double v25 = v24;
  [(ITKQuad *)v13 bottomRight];
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  double v27 = v26;
  double v29 = v28;

  v30 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v23, v25, v27, v29, v15, v17, v19, v21);
  return v30;
}

- (ITKAutoFadeOutLayer)itk_autoFadeOutShapePointLayer
{
  v2 = objc_alloc_init(ITKAutoFadeOutLayer);
  v3 = objc_msgSend(MEMORY[0x263F825C8], "itk_randomColor");
  id v4 = [v3 colorWithAlphaComponent:0.8];
  -[ITKAutoFadeOutLayer setBackgroundColor:](v2, "setBackgroundColor:", [v4 CGColor]);

  ITKRectWithOriginAndSize();
  -[ITKAutoFadeOutLayer setBounds:](v2, "setBounds:");
  [a1 addSublayer:v2];
  v6 = v2;
  itk_dispatchMainAfterDelay();

  return v6;
}

- (id)itk_autoFadeOutShapeRectLayer
{
  v1 = objc_msgSend(a1, "itk_autoFadeOutShapePointLayer");
  objc_msgSend(v1, "setBorderColor:", objc_msgSend(v1, "backgroundColor"));
  [v1 setBorderWidth:2.0];
  id v2 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v1, "setBackgroundColor:", objc_msgSend(v2, "CGColor"));

  return v1;
}

@end