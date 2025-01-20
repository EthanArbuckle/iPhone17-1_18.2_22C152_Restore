@interface PDFCoachMark
- (PDFCoachMark)initWithFrame:(CGRect)a3;
- (double)effectTimeLeft;
- (void)playEffect:(id)a3;
@end

@implementation PDFCoachMark

- (PDFCoachMark)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PDFCoachMark;
  v7 = [(PDFCoachMark *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    creationTime = v7->creationTime;
    v7->creationTime = (NSDate *)v8;

    v7->frame.origin.CGFloat x = x;
    v7->frame.origin.CGFloat y = y;
    v7->frame.size.CGFloat width = width;
    v7->frame.size.CGFloat height = height;
  }
  return v7;
}

- (void)playEffect:(id)a3
{
  v43[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  +[PDFPageLayerEffect createPDFCoachmarkLayerEffectsWithFrame:withLayer:](PDFPageLayerEffect, "createPDFCoachmarkLayerEffectsWithFrame:withLayer:", v4, self->frame.origin.x, self->frame.origin.y, self->frame.size.width, self->frame.size.height);
  v5 = (PDFPageLayerEffect *)objc_claimAutoreleasedReturnValue();
  layerEffect = self->layerEffect;
  self->layerEffect = v5;

  if (self->layerEffect)
  {
    v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v7 setBeginTime:CACurrentMediaTime() + 0.8];
    LODWORD(v8) = 1.0;
    v9 = [NSNumber numberWithFloat:v8];
    [v7 setFromValue:v9];

    v10 = [NSNumber numberWithFloat:0.0];
    [v7 setToValue:v10];

    [v7 setDuration:0.4];
    LODWORD(v11) = 1.0;
    [v7 setRepeatCount:v11];
    [v7 setRemovedOnCompletion:0];
    [v7 setFillMode:*MEMORY[0x263F15AB0]];
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x263F158F8];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __27__PDFCoachMark_playEffect___block_invoke;
    v39[3] = &unk_264204088;
    objc_copyWeak(&v41, &location);
    id v40 = v4;
    [v12 setCompletionBlock:v39];
    v13 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
    long long v28 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    long long v35 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    long long v29 = v35;
    long long v36 = v28;
    long long v26 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v37 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v27 = v37;
    long long v38 = v26;
    long long v24 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    long long v31 = *MEMORY[0x263F15740];
    long long v25 = v31;
    long long v32 = v24;
    long long v22 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    long long v33 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    long long v23 = v33;
    long long v34 = v22;
    v14 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v31];
    v43[0] = v14;
    v15 = (void *)MEMORY[0x263F08D40];
    CATransform3DMakeScale(&v30, 2.0, 2.0, 1.0);
    v16 = [v15 valueWithCATransform3D:&v30];
    v43[1] = v16;
    long long v35 = v29;
    long long v36 = v28;
    long long v37 = v27;
    long long v38 = v26;
    long long v31 = v25;
    long long v32 = v24;
    long long v33 = v23;
    long long v34 = v22;
    v17 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v31];
    v43[2] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
    [v13 setValues:v18];

    [v13 setDuration:0.2];
    LODWORD(v19) = 1.0;
    [v13 setRepeatCount:v19];
    v20 = [(PDFPageLayerEffect *)self->layerEffect sublayers];
    v21 = [v20 firstObject];

    [v21 addAnimation:v7 forKey:@"fadeAnimation"];
    [v21 addAnimation:v13 forKey:@"scaleAnimation"];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
}

void __27__PDFCoachMark_playEffect___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v5 = WeakRetained;
    id v4 = [WeakRetained[6] UUID];
    [v3 removePageLayerEffectForID:v4];

    WeakRetained = v5;
  }
}

- (double)effectTimeLeft
{
  v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:self->creationTime];
  double v5 = 1.2 - v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->layerEffect, 0);

  objc_storeStrong((id *)&self->creationTime, 0);
}

@end