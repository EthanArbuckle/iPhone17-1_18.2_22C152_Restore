@interface CAMPreviewAlignmentGuide
- (CAMLevelCrosshair)_guidanceCrosshair;
- (CAMLevelCrosshair)_targetCrosshair;
- (CAMPreviewAlignmentGuide)initWithFrame:(CGRect)a3;
- (CAMPreviewAlignmentModel)alignmentModel;
- (void)layoutSubviews;
- (void)previewAlignmentModelDidChangeOpacity:(id)a3;
@end

@implementation CAMPreviewAlignmentGuide

- (CAMPreviewAlignmentGuide)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CAMPreviewAlignmentGuide;
  v3 = -[CAMPreviewAlignmentGuide initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMPreviewAlignmentGuide *)v3 setUserInteractionEnabled:0];
    v5 = objc_alloc_init(CAMPreviewAlignmentModel);
    alignmentModel = v4->_alignmentModel;
    v4->_alignmentModel = v5;

    [(CAMPreviewAlignmentModel *)v4->_alignmentModel setObserver:v4];
    v7 = objc_alloc_init(CAMLevelCrosshair);
    guidanceCrosshair = v4->__guidanceCrosshair;
    v4->__guidanceCrosshair = v7;

    [(CAMLevelCrosshair *)v4->__guidanceCrosshair setHighlighted:1];
    [(CAMPreviewAlignmentGuide *)v4 addSubview:v4->__guidanceCrosshair];
    v9 = objc_alloc_init(CAMLevelCrosshair);
    targetCrosshair = v4->__targetCrosshair;
    v4->__targetCrosshair = v9;

    [(CAMPreviewAlignmentGuide *)v4 addSubview:v4->__targetCrosshair];
    v11 = [(CAMLevelCrosshair *)v4->__targetCrosshair layer];
    long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v17[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v17[3] = v12;
    v17[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    uint64_t v13 = *(void *)(MEMORY[0x263F15740] + 80);
    long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v17[0] = *MEMORY[0x263F15740];
    v17[1] = v14;
    uint64_t v18 = v13;
    unint64_t v19 = 0xBF7B4E81B4E81B4FLL;
    long long v15 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v21 = v15;
    [v11 setSublayerTransform:v17];
  }
  return v4;
}

- (void)layoutSubviews
{
  [(CAMPreviewAlignmentGuide *)self bounds];
  v3 = [(CAMPreviewAlignmentGuide *)self alignmentModel];
  v4 = v3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (v3) {
    [v3 alignmentTransform];
  }
  uint64_t v5 = [v4 isAligned];
  UIRectCenteredIntegralRectScale();
  UIRectGetCenter();
  double v7 = v6;
  double v9 = v8;
  v10 = [(CAMPreviewAlignmentGuide *)self _guidanceCrosshair];
  v11 = [v10 layer];

  objc_msgSend(v11, "setBounds:", 0.0, 0.0, 60.0, 60.0);
  objc_msgSend(v11, "setPosition:", v7, v9);
  v13[4] = v18;
  v13[5] = v19;
  v13[6] = v20;
  v13[7] = v21;
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  v13[3] = v17;
  [v11 setTransform:v13];
  long long v12 = [(CAMPreviewAlignmentGuide *)self _targetCrosshair];
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, 60.0, 60.0);
  objc_msgSend(v12, "setCenter:", v7, v9);
  [v12 setHighlighted:v5];
}

- (void)previewAlignmentModelDidChangeOpacity:(id)a3
{
  id v4 = a3;
  [v4 opacity];
  double v6 = v5;
  double v7 = [(CAMPreviewAlignmentGuide *)self _guidanceCrosshair];
  [v7 setAlpha:v6];

  [v4 opacity];
  double v9 = v8;

  id v10 = [(CAMPreviewAlignmentGuide *)self _targetCrosshair];
  [v10 setAlpha:v9];
}

- (CAMPreviewAlignmentModel)alignmentModel
{
  return self->_alignmentModel;
}

- (CAMLevelCrosshair)_targetCrosshair
{
  return self->__targetCrosshair;
}

- (CAMLevelCrosshair)_guidanceCrosshair
{
  return self->__guidanceCrosshair;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__guidanceCrosshair, 0);
  objc_storeStrong((id *)&self->__targetCrosshair, 0);
  objc_storeStrong((id *)&self->_alignmentModel, 0);
}

@end