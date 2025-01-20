@interface BCSDissolveEffectView
- (UIImageView)contentView;
- (id)_averageColorAtCornerForImage:(id)a3;
- (id)_imageForCellWithColor:(id)a3 size:(CGSize)a4;
- (void)setContentView:(id)a3;
- (void)startAnimation;
- (void)startAnimationWithDuration:(double)a3 appImageBlock:(id)a4 completion:(id)a5;
- (void)stopAnimation;
@end

@implementation BCSDissolveEffectView

- (id)_averageColorAtCornerForImage:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "extent", *MEMORY[0x263F000D0], *(void *)(MEMORY[0x263F000D0] + 8), *(void *)(MEMORY[0x263F000D0] + 16), *(void *)(MEMORY[0x263F000D0] + 24), *(void *)(MEMORY[0x263F000D0] + 32), *(void *)(MEMORY[0x263F000D0] + 40));
  CGFloat v5 = v4;
  [v3 extent];
  CGAffineTransformScale(&v15, &v14, v5, v6);
  v17.origin.y = 0.98;
  v17.origin.x = 0.01;
  v17.size.width = 0.01;
  v17.size.height = 0.01;
  CGRect v18 = CGRectApplyAffineTransform(v17, &v15);
  v7 = objc_msgSend(v3, "imageByCroppingToRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  v8 = (void *)[objc_alloc(MEMORY[0x263F00628]) initWithOptions:0];
  [v7 extent];
  double v10 = v9;
  [v7 extent];
  v11 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v3, 0.0, 0.0, v10);
  v12 = [MEMORY[0x263F827E8] imageWithCGImage:v11 scale:0 orientation:2.0];
  CGImageRelease(v11);

  return v12;
}

- (id)_imageForCellWithColor:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = a3;
  v10.CGFloat width = width;
  v10.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  [v6 set];
  v11.origin.x = *(CGFloat *)MEMORY[0x263F00148];
  v11.origin.y = *(CGFloat *)(MEMORY[0x263F00148] + 8);
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  UIRectFill(v11);
  v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsPopContext();

  return v7;
}

- (void)startAnimation
{
  v42[1] = *MEMORY[0x263EF8340];
  [(BCSDissolveEffectView *)self bounds];
  CGRect v44 = CGRectInset(v43, 10.0, 10.0);
  double x = v44.origin.x;
  double y = v44.origin.y;
  double width = v44.size.width;
  double height = v44.size.height;
  v7 = [MEMORY[0x263F825C8] whiteColor];
  -[BCSDissolveEffectView _imageForCellWithColor:size:](self, "_imageForCellWithColor:size:", v7, 2.0, 2.0);
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 CGImage];

  CGSize v10 = [(BCSDissolveEffectView *)self contentView];
  CGRect v11 = [v10 image];
  v12 = [v11 CIImage];
  id v13 = [(BCSDissolveEffectView *)self _averageColorAtCornerForImage:v12];
  uint64_t v38 = [v13 CGImage];

  uint64_t v14 = *MEMORY[0x263F15A78];
  CGAffineTransform v15 = [MEMORY[0x263F157A8] behaviorWithType:*MEMORY[0x263F15A78]];
  [v15 setValue:@"scale" forKey:@"keyPath"];
  [v15 setValue:&unk_26FCC6728 forKey:@"values"];
  [v15 setValue:&unk_26FCC6740 forKey:@"locations"];
  v39 = [MEMORY[0x263EFF980] array];
  v16 = [MEMORY[0x263F157B0] emitterCell];
  [v16 setName:@"white"];
  v42[0] = v15;
  CGRect v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
  [v16 setEmitterBehaviors:v17];

  LODWORD(v18) = 30.0;
  [v16 setBirthRate:v18];
  LODWORD(v19) = 1.0;
  [v16 setLifetime:v19];
  [v16 setContents:v9];
  [v16 setBeginTime:CACurrentMediaTime()];
  id v20 = [MEMORY[0x263F825C8] whiteColor];
  objc_msgSend(v16, "setColor:", objc_msgSend(v20, "CGColor"));

  [v39 addObject:v16];
  v21 = [MEMORY[0x263F157B8] layer];
  [v21 setEmitterCells:v39];
  [v21 setEmitterMode:@"sequential"];
  objc_msgSend(v21, "setEmitterPosition:", x + width * 0.5, y + height * 0.5);
  [v21 setEmitterShape:@"cuboid"];
  objc_msgSend(v21, "setEmitterSize:", width, height);
  objc_msgSend(v21, "setFrame:", 0.0, 0.0, width, height);
  [v21 setRenderMode:@"unordered"];
  [v21 setSeed:arc4random()];
  v22 = [MEMORY[0x263F157A8] behaviorWithType:v14];
  [v22 setValue:@"scale" forKey:@"keyPath"];
  [v22 setValue:&unk_26FCC6758 forKey:@"values"];
  [v22 setValue:&unk_26FCC6770 forKey:@"locations"];
  v23 = [MEMORY[0x263F157B0] emitterCell];
  [v23 setName:@"black"];
  v41 = v22;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
  [v23 setEmitterBehaviors:v24];

  LODWORD(v25) = 12.0;
  [v23 setBirthRate:v25];
  LODWORD(v26) = 3.0;
  [v23 setLifetime:v26];
  [v23 setContents:v38];
  [v23 setBeginTime:CACurrentMediaTime()];
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  CGRect v46 = CGRectInset(v45, 2.0, 2.0);
  double v27 = v46.origin.x;
  double v28 = v46.origin.y;
  double v29 = v46.size.width;
  double v30 = v46.size.height;
  v31 = [MEMORY[0x263F157B8] layer];
  v40 = v23;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
  [v31 setEmitterCells:v32];

  [v31 setEmitterMode:@"sequential"];
  objc_msgSend(v31, "setEmitterPosition:", v27 + v29 * 0.5, v28 + v30 * 0.5);
  [v31 setEmitterShape:@"rectangle"];
  objc_msgSend(v31, "setEmitterSize:", v29, v30);
  objc_msgSend(v31, "setFrame:", 0.0, 0.0, v29, v30);
  [v31 setRenderMode:@"unordered"];
  [v31 setSeed:arc4random()];
  objc_storeStrong((id *)&self->_expandingLayer, v31);
  objc_storeStrong((id *)&self->_dissolveLayer, v21);
  LODWORD(v33) = 2.0;
  [(CAEmitterLayer *)self->_dissolveLayer setBirthRate:v33];
  LODWORD(v34) = 1053609165;
  [(CAEmitterLayer *)self->_expandingLayer setLifetime:v34];
  LODWORD(v35) = 1053609165;
  [(CAEmitterLayer *)self->_dissolveLayer setLifetime:v35];
  v36 = [(BCSDissolveEffectView *)self layer];
  [v36 insertSublayer:v31 atIndex:0];

  v37 = [(BCSDissolveEffectView *)self layer];
  [v37 addSublayer:v21];
}

- (void)stopAnimation
{
  [(CAEmitterLayer *)self->_expandingLayer removeFromSuperlayer];
  expandingLayer = self->_expandingLayer;
  self->_expandingLayer = 0;

  [(CAEmitterLayer *)self->_dissolveLayer removeFromSuperlayer];
  dissolveLayer = self->_dissolveLayer;
  self->_dissolveLayer = 0;

  id v5 = [MEMORY[0x263F825C8] whiteColor];
  -[BCSDissolveEffectView setBackgroundColor:](self, "setBackgroundColor:");
}

- (void)startAnimationWithDuration:(double)a3 appImageBlock:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(BCSDissolveEffectView *)self setClipsToBounds:1];
  [(BCSDissolveEffectView *)self startAnimation];
  CGSize v10 = [(BCSDissolveEffectView *)self window];
  [v10 setUserInteractionEnabled:0];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke;
  v18[3] = &unk_26524BFA8;
  v18[4] = self;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_2;
  v17[3] = &unk_26524C700;
  v17[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v18 animations:v17 completion:a3];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 0.75 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_3;
  block[3] = &unk_26524C778;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_after(v11, MEMORY[0x263EF83A0], block);
}

uint64_t __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setContinuousCornerRadius:32.0];
}

uint64_t __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 432));
  [WeakRetained removeFromSuperview];

  id v3 = *(void **)(a1 + 32);

  return [v3 stopAnimation];
}

void __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F82828]);
  id v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = [v2 initWithImage:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = v4;

  [*(id *)(a1 + 32) bounds];
  CGRectGetMidX(v23);
  [*(id *)(a1 + 32) bounds];
  CGRectGetMidY(v24);
  _bcs_roundPointToPixels();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setPosition:");
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 424)];
  CGAffineTransformMakeScale(&v22, 0.0, 0.0);
  v7 = *(void **)(*(void *)(a1 + 32) + 424);
  CGAffineTransform v21 = v22;
  [v7 setTransform:&v21];
  memset(&v20, 0, sizeof(v20));
  [*(id *)(a1 + 32) bounds];
  double Width = CGRectGetWidth(v25);
  [*(id *)(*(void *)(a1 + 32) + 424) bounds];
  CGFloat v9 = Width / CGRectGetWidth(v26);
  [*(id *)(a1 + 32) bounds];
  double Height = CGRectGetHeight(v27);
  [*(id *)(*(void *)(a1 + 32) + 424) bounds];
  CGFloat v11 = CGRectGetHeight(v28);
  CGAffineTransformMakeScale(&v20, v9, Height / v11);
  CGAffineTransform v18 = v20;
  CGAffineTransformScale(&v19, &v18, 0.5, 0.5);
  CGAffineTransform v20 = v19;
  id v12 = (void *)MEMORY[0x263F82E00];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_4;
  v16[3] = &unk_26524C728;
  v16[4] = *(void *)(a1 + 32);
  CGAffineTransform v17 = v19;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_5;
  v14[3] = &unk_26524C750;
  id v13 = *(id *)(a1 + 48);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v13;
  [v12 animateWithDuration:0 delay:v16 usingSpringWithDamping:v14 initialSpringVelocity:0.3 options:0.0 animations:0.73 completion:0.0];
}

uint64_t __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 424);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

void __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) window];
  [v2 setUserInteractionEnabled:1];
}

- (UIImageView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  return (UIImageView *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_targetAppIcon, 0);
  objc_storeStrong((id *)&self->_expandingLayer, 0);

  objc_storeStrong((id *)&self->_dissolveLayer, 0);
}

@end