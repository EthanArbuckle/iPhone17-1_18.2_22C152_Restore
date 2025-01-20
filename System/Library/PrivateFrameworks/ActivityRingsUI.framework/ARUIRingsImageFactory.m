@interface ARUIRingsImageFactory
+ (id)_renderRingsUsingRingsView:(id)a3 withDiameter:(double)a4 thickness:(double)a5 interspacing:(double)a6;
+ (id)renderRingGroup:(id)a3 withRenderer:(id)a4;
+ (id)renderRingGroupController:(id)a3 withBackgroundColor:(id)a4 andRenderer:(id)a5;
+ (id)renderRingGroupController:(id)a3 withRenderer:(id)a4;
+ (id)renderRingsUsingRingsView:(id)a3 forMovePercentage:(double)a4 exercisePercentage:(double)a5 standPercentage:(double)a6 withDiameter:(double)a7 thickness:(double)a8 interspacing:(double)a9;
+ (id)renderRingsWithBackgroundColor:(id)a3 usingRingsView:(id)a4 forMovePercentage:(double)a5 exercisePercentage:(double)a6 standPercentage:(double)a7 withDiameter:(double)a8 thickness:(double)a9 interspacing:(double)a10;
+ (id)renderSingleRingUsingRingsView:(id)a3 forPercentage:(double)a4 withDiameter:(double)a5 thickness:(double)a6 topColor:(id)a7 bottomColor:(id)a8;
+ (void)renderRingsUsingRingsView:(id)a3 forMovePercentage:(double)a4 exercisePercentage:(double)a5 standPercentage:(double)a6 withDiameter:(double)a7 thickness:(double)a8 interspacing:(double)a9 inRect:(CGRect)a10;
@end

@implementation ARUIRingsImageFactory

+ (id)renderRingGroup:(id)a3 withRenderer:(id)a4
{
  id v5 = a3;
  v6 = (ARUIRenderer *)a4;
  if (!v6) {
    v6 = objc_alloc_init(ARUIRenderer);
  }
  v7 = (void *)[v5 copy];
  [v7 groupDiameter];
  float v9 = v8;
  v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  float v12 = v11;

  double v13 = v9 + v12 * -0.5;
  *(float *)&double v13 = v13;
  [v7 setGroupDiameter:v13];
  [v7 setTranslation:0.0];
  [v5 groupDiameter];
  v15 = -[ARUIRenderContext initWithSize:]([ARUIRenderContext alloc], "initWithSize:", v14, v14);
  v16 = [v7 rings];
  v17 = [v7 spriteSheet];
  v18 = [(ARUIRenderer *)v6 snapshotRings:v16 spriteSheet:v17 withContext:v15];

  return v18;
}

+ (id)renderRingGroupController:(id)a3 withRenderer:(id)a4
{
  id v5 = a4;
  v6 = [a3 ringGroup];
  v7 = +[ARUIRingsImageFactory renderRingGroup:v6 withRenderer:v5];

  return v7;
}

+ (id)renderRingGroupController:(id)a3 withBackgroundColor:(id)a4 andRenderer:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  float v9 = +[ARUIRingsImageFactory renderRingGroupController:v8 withRenderer:a5];
  [v8 ringDiameter];
  float v11 = v10;

  CGFloat v12 = v11;
  double v13 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", 0.0, 0.0, v12, v12);
  float v14 = [MEMORY[0x263F15880] layer];
  [v14 setBorderWidth:1.0];
  id v15 = v7;
  uint64_t v16 = [v15 CGColor];

  [v14 setFillColor:v16];
  id v17 = v13;
  objc_msgSend(v14, "setPath:", objc_msgSend(v17, "CGPath"));
  [v9 scale];
  CGFloat v19 = v18;
  v23.width = v12;
  v23.height = v12;
  UIGraphicsBeginImageContextWithOptions(v23, 0, v19);
  [v14 renderInContext:UIGraphicsGetCurrentContext()];
  objc_msgSend(v9, "drawAtPoint:", 0.0, 0.0);
  v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v20;
}

+ (id)renderSingleRingUsingRingsView:(id)a3 forPercentage:(double)a4 withDiameter:(double)a5 thickness:(double)a6 topColor:(id)a7 bottomColor:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  id v17 = [v16 ringGroupController];
  *(float *)&double v18 = a5;
  [v17 setRingDiameter:v18];
  [v17 setRingIconSize:0.0];
  [v17 setPercentage:0 ofRingAtIndex:0 animated:a4];
  [v17 setTopColor:v15 bottomColor:v14 ofRingAtIndex:0];

  CGFloat v19 = [a1 _renderRingsUsingRingsView:v16 withDiameter:a5 thickness:a6 interspacing:0.0];

  return v19;
}

+ (id)renderRingsUsingRingsView:(id)a3 forMovePercentage:(double)a4 exercisePercentage:(double)a5 standPercentage:(double)a6 withDiameter:(double)a7 thickness:(double)a8 interspacing:(double)a9
{
  id v16 = a3;
  id v17 = [v16 ringGroupController];
  *(float *)&double v18 = a7;
  [v17 setRingDiameter:v18];
  [v17 setRingIconSize:0.0];
  [v16 setActiveEnergyPercentage:0 animated:a4];
  [v16 setBriskPercentage:0 animated:a5];
  [v16 setMovingHoursPercentage:0 animated:a6];
  CGFloat v19 = [a1 _renderRingsUsingRingsView:v16 withDiameter:a7 thickness:a8 interspacing:a9];

  return v19;
}

+ (id)_renderRingsUsingRingsView:(id)a3 withDiameter:(double)a4 thickness:(double)a5 interspacing:(double)a6
{
  id v9 = a3;
  float v10 = [v9 ringGroupController];
  float v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 scale];
  float v13 = v12;

  objc_msgSend(v9, "setFrame:", 0.0, 0.0, a4, a4);
  double v14 = a4 + v13 * -0.5;
  *(float *)&double v14 = v14;
  [v10 setRingDiameter:v14];
  double v15 = a5 + -0.5;
  *(float *)&double v15 = a5 + -0.5;
  [v10 setRingThickness:v15];
  *(float *)&double v16 = a6;
  [v10 setRingInterspacing:v16];
  objc_msgSend(v10, "setCenter:", 0.0, 0.0);
  id v17 = [v9 snapshot];

  [v17 size];
  double v19 = v18;
  [v17 size];
  double v21 = v20 * 0.5 - a4 * 0.5;
  [v17 scale];
  CGFloat v23 = v22;
  v27.width = a4;
  v27.height = a4;
  UIGraphicsBeginImageContextWithOptions(v27, 0, v23);
  objc_msgSend(v17, "drawAtPoint:", -(v19 * 0.5 - a4 * 0.5), -v21);
  v24 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v24;
}

+ (id)renderRingsWithBackgroundColor:(id)a3 usingRingsView:(id)a4 forMovePercentage:(double)a5 exercisePercentage:(double)a6 standPercentage:(double)a7 withDiameter:(double)a8 thickness:(double)a9 interspacing:(double)a10
{
  id v17 = a3;
  double v18 = +[ARUIRingsImageFactory renderRingsUsingRingsView:a4 forMovePercentage:a5 exercisePercentage:a6 standPercentage:a7 withDiameter:a8 thickness:a9 interspacing:a10];
  double v19 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", 0.0, 0.0, a8, a8);
  double v20 = [MEMORY[0x263F15880] layer];
  [v20 setBorderWidth:1.0];
  id v21 = v17;
  uint64_t v22 = [v21 CGColor];

  [v20 setFillColor:v22];
  id v23 = v19;
  objc_msgSend(v20, "setPath:", objc_msgSend(v23, "CGPath"));
  [v18 scale];
  CGFloat v25 = v24;
  v29.width = a8;
  v29.height = a8;
  UIGraphicsBeginImageContextWithOptions(v29, 0, v25);
  [v20 renderInContext:UIGraphicsGetCurrentContext()];
  objc_msgSend(v18, "drawAtPoint:", 0.0, 0.0);
  v26 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v26;
}

+ (void)renderRingsUsingRingsView:(id)a3 forMovePercentage:(double)a4 exercisePercentage:(double)a5 standPercentage:(double)a6 withDiameter:(double)a7 thickness:(double)a8 interspacing:(double)a9 inRect:(CGRect)a10
{
  id v16 = a3;
  [v16 setActiveEnergyPercentage:0 animated:a4];
  [v16 setBriskPercentage:0 animated:a5];
  [v16 setMovingHoursPercentage:0 animated:a6];
  id v21 = [v16 ringGroupController];
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, a7, a7);
  double v17 = a7 + -1.0;
  *(float *)&double v17 = a7 + -1.0;
  [v21 setRingDiameter:v17];
  double v18 = a8 + -0.5;
  *(float *)&double v18 = a8 + -0.5;
  [v21 setRingThickness:v18];
  *(float *)&double v19 = a9;
  [v21 setRingInterspacing:v19];
  objc_msgSend(v21, "setCenter:", 0.0, 0.0);
  double v20 = [v16 snapshot];

  objc_msgSend(v20, "drawInRect:", a10.origin.x, a10.origin.y, a10.size.width, a10.size.height);
}

@end