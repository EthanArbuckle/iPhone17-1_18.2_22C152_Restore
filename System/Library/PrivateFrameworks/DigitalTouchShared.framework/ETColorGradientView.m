@interface ETColorGradientView
- (ETColorGradientView)initWithFrame:(CGRect)a3;
- (void)hideColorWheelWithRotation:(double)a3 completion:(id)a4;
- (void)prepareToAnimateColorWheelWithRotation:(double)a3;
- (void)revealColorWheelWithCompletion:(id)a3;
@end

@implementation ETColorGradientView

- (ETColorGradientView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ETColorGradientView;
  v3 = -[ETColorGradientView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (SetupSpecValuesIfNeeded_onceToken_0 != -1) {
      dispatch_once(&SetupSpecValuesIfNeeded_onceToken_0, &__block_literal_global_1);
    }
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(ETColorGradientView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(ETColorGradientView *)v3 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    v8 = [MEMORY[0x263F1C6B0] etImageNamed:@"color-wheel-gradient"];
    [(UIImageView *)v3->_imageView setImage:v8];

    [(ETColorGradientView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)prepareToAnimateColorWheelWithRotation:(double)a3
{
  id v15 = [(ETColorGradientView *)self layer];
  [(ETColorGradientView *)self bounds];
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  CGFloat MidX = CGRectGetMidX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v18);
  v11 = [MEMORY[0x263F15880] layer];
  [v11 setLineWidth:49.5];
  id v12 = [MEMORY[0x263F1C550] clearColor];
  objc_msgSend(v11, "setFillColor:", objc_msgSend(v12, "CGColor"));

  id v13 = [MEMORY[0x263F1C550] blackColor];
  objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  [v11 setLineCap:*MEMORY[0x263F15E70]];
  [v15 bounds];
  objc_msgSend(v11, "setFrame:");
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, MidX, MidY, 52.25, a3 + 3.14159265, a3 + 9.42477796, 0);
  [v11 setPath:Mutable];
  CFRelease(Mutable);
  [v15 setMask:v11];
}

- (void)revealColorWheelWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ETColorGradientView *)self layer];
  uint64_t v6 = [v5 mask];
  [v6 setStrokeStart:0.4999];
  [v6 setStrokeEnd:0.5];
  v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
  [v7 setDuration:0.275];
  uint64_t v8 = *MEMORY[0x263F15EB0];
  v9 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
  [v7 setTimingFunction:v9];

  uint64_t v10 = *MEMORY[0x263F15AB0];
  [v7 setFillMode:*MEMORY[0x263F15AB0]];
  LODWORD(v11) = 0.5;
  id v12 = [NSNumber numberWithFloat:v11];
  [v7 setFromValue:v12];

  LODWORD(v13) = 1.0;
  v14 = [NSNumber numberWithFloat:v13];
  [v7 setToValue:v14];

  [v7 setRemovedOnCompletion:0];
  id v15 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeStart"];
  [v15 setDuration:0.275];
  v16 = [MEMORY[0x263F15808] functionWithName:v8];
  [v15 setTimingFunction:v16];

  [v15 setFillMode:v10];
  LODWORD(v17) = 0.5;
  CGRect v18 = [NSNumber numberWithFloat:v17];
  [v15 setFromValue:v18];

  v19 = [NSNumber numberWithFloat:0.0];
  [v15 setToValue:v19];

  [v15 setRemovedOnCompletion:0];
  [MEMORY[0x263F158F8] begin];
  v20 = (void *)MEMORY[0x263F158F8];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __54__ETColorGradientView_revealColorWheelWithCompletion___block_invoke;
  v26 = &unk_264DEC738;
  id v27 = v5;
  id v28 = v4;
  id v21 = v4;
  id v22 = v5;
  [v20 setCompletionBlock:&v23];
  objc_msgSend(v6, "addAnimation:forKey:", v7, @"strokeEnd", v23, v24, v25, v26);
  [v6 addAnimation:v15 forKey:@"strokeStart"];

  [MEMORY[0x263F158F8] commit];
}

uint64_t __54__ETColorGradientView_revealColorWheelWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMask:0];
  [*(id *)(a1 + 32) removeAllAnimations];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)hideColorWheelWithRotation:(double)a3 completion:(id)a4
{
  id v28 = a4;
  uint64_t v6 = [(ETColorGradientView *)self layer];
  v7 = [v6 mask];
  [v7 setStrokeStart:0.0];
  [v7 setStrokeEnd:1.0];
  uint64_t v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
  [v8 setDuration:0.275];
  uint64_t v9 = *MEMORY[0x263F15EC0];
  uint64_t v10 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  [v8 setTimingFunction:v10];

  uint64_t v11 = *MEMORY[0x263F15AB0];
  [v8 setFillMode:*MEMORY[0x263F15AB0]];
  LODWORD(v12) = 1.0;
  double v13 = [NSNumber numberWithFloat:v12];
  [v8 setFromValue:v13];

  LODWORD(v14) = 0.5;
  id v15 = [NSNumber numberWithFloat:v14];
  [v8 setToValue:v15];

  [v8 setRemovedOnCompletion:0];
  v16 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeStart"];
  [v16 setDuration:0.275];
  double v17 = [MEMORY[0x263F15808] functionWithName:v9];
  [v16 setTimingFunction:v17];

  [v16 setFillMode:v11];
  CGRect v18 = [NSNumber numberWithFloat:0.0];
  [v16 setFromValue:v18];

  LODWORD(v19) = 0.5;
  v20 = [NSNumber numberWithFloat:v19];
  [v16 setToValue:v20];

  [v16 setRemovedOnCompletion:0];
  id v21 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.z"];
  [v21 setDuration:0.275];
  [v21 setAdditive:1];
  [v21 setRemovedOnCompletion:0];
  [v21 setFillMode:v11];
  *(float *)&double v22 = a3;
  uint64_t v23 = [NSNumber numberWithFloat:v22];
  [v21 setToValue:v23];

  [v21 setRemovedOnCompletion:0];
  [MEMORY[0x263F158F8] begin];
  uint64_t v24 = (void *)MEMORY[0x263F158F8];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __61__ETColorGradientView_hideColorWheelWithRotation_completion___block_invoke;
  v29[3] = &unk_264DEC9F0;
  id v30 = v6;
  v31 = self;
  id v32 = v28;
  id v25 = v28;
  id v26 = v6;
  [v24 setCompletionBlock:v29];
  [v7 addAnimation:v8 forKey:@"strokeEnd"];
  [v7 addAnimation:v16 forKey:@"strokeStart"];
  id v27 = [(UIImageView *)self->_imageView layer];
  [v27 addAnimation:v21 forKey:@"transform.rotation.z"];

  [MEMORY[0x263F158F8] commit];
}

uint64_t __61__ETColorGradientView_hideColorWheelWithRotation_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMask:0];
  [*(id *)(a1 + 32) removeAllAnimations];
  v2 = [*(id *)(*(void *)(a1 + 40) + 408) layer];
  [v2 removeAllAnimations];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end