@interface CKColoredBalloonView
- (BOOL)_shouldApplySendLaterStyleForComposition:(id)a3;
- (BOOL)hasBackground;
- (BOOL)needsGroupOpacity;
- (BOOL)wantsGradient;
- (BOOL)wantsInvisibleInkEffectMask;
- (CGRect)gradientOverrideFrame;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (CKBalloonImageView)effectViewMask;
- (CKBalloonImageView)mask;
- (CKBalloonShapeView)balloonShapeView;
- (CKColoredBalloonView)initWithFrame:(CGRect)a3;
- (CKGradientReferenceView)gradientReferenceView;
- (CKGradientView)gradientView;
- (UIEdgeInsets)alignmentRectInsets;
- (id)description;
- (id)overlayColor;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForComposition:(id)a3;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setBalloonDescriptor:(CKBalloonDescriptor_t *)a3;
- (void)setBalloonShapeView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCanUseOpaqueMask:(BOOL)a3;
- (void)setColor:(char)a3;
- (void)setEffectViewMask:(id)a3;
- (void)setEffectViewMaskImage:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGradientOverrideFrame:(CGRect)a3;
- (void)setGradientReferenceView:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setHasTail:(BOOL)a3;
- (void)setIsBeingShownAsPreview:(BOOL)a3;
- (void)setMask:(id)a3;
- (void)setWantsGradient:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWantsGradient;
@end

@implementation CKColoredBalloonView

- (void)configureForComposition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKColoredBalloonView;
  id v4 = a3;
  [(CKBalloonView *)&v7 configureForComposition:v4];
  BOOL v5 = -[CKColoredBalloonView _shouldApplySendLaterStyleForComposition:](self, "_shouldApplySendLaterStyleForComposition:", v4, v7.receiver, v7.super_class);

  if (v5) {
    uint64_t v6 = 15;
  }
  else {
    uint64_t v6 = 1;
  }
  [(CKColoredBalloonView *)self setColor:v6];
}

- (BOOL)_shouldApplySendLaterStyleForComposition:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isScheduledMessagesCoreEnabled];

  BOOL v7 = 0;
  if (v5)
  {
    uint64_t v6 = [v3 sendLaterPluginInfo];

    if (v6) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (void)configureForMessagePart:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKColoredBalloonView;
  id v4 = a3;
  [(CKBalloonView *)&v6 configureForMessagePart:v4];
  uint64_t v5 = objc_msgSend(v4, "color", v6.receiver, v6.super_class);

  [(CKColoredBalloonView *)self setColor:v5];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = [(CKBalloonView *)self color];
  BOOL v5 = [(CKColoredBalloonView *)self wantsGradient];
  v9.receiver = self;
  v9.super_class = (Class)CKColoredBalloonView;
  objc_super v6 = [(CKBalloonView *)&v9 description];
  BOOL v7 = [v3 stringWithFormat:@"[CKColoredBalloonView color:%ld wantsGradient:%d %@]", v4, v5, v6];

  return v7;
}

- (CKColoredBalloonView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKColoredBalloonView;
  id v3 = -[CKBalloonView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    [(CKColoredBalloonView *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = +[CKUIBehavior sharedBehaviors];
    int v14 = [v13 shouldUseDynamicGradient];

    if (v14)
    {
      v15 = -[CKGradientView initWithFrame:]([CKGradientView alloc], "initWithFrame:", v6, v8, v10, v12);
      [(CKColoredBalloonView *)v4 setGradientView:v15];
    }
    [(CKColoredBalloonView *)v4 setColor:0xFFFFFFFFLL];
  }
  return v4;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)CKColoredBalloonView;
  [(CKBalloonView *)&v22 layoutSubviews];
  id v3 = [(CKColoredBalloonView *)self gradientView];
  [(CKColoredBalloonView *)self bounds];
  objc_msgSend(v3, "setFrame:");
  [(CKColoredBalloonView *)self bounds];
  -[CKBalloonShapeView setFrame:](self->_balloonShapeView, "setFrame:");
  [(CKColoredBalloonView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(CKColoredBalloonView *)self wantsGradient]
    && [(CKBalloonView *)self canUseOpaqueMask])
  {
    double v12 = +[CKUIBehavior sharedBehaviors];
    [(CKColoredBalloonView *)self balloonDescriptor];
    [v12 balloonMaskFrameInsetsWithBalloonShape:v21];
    double v5 = v5 - v13;
    double v7 = v7 - v14;
    double v9 = v9 + v13 + v15;
    double v11 = v11 + v14 + v16;
  }
  objc_super v17 = [(CKColoredBalloonView *)self mask];
  objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);

  if ([(CKColoredBalloonView *)self wantsInvisibleInkEffectMask])
  {
    effectViewMask = self->_effectViewMask;
    v19 = [(CKBalloonView *)self invisibleInkEffectController];
    v20 = [v19 effectView];
    [v20 bounds];
    -[CKBalloonImageView setFrame:](effectViewMask, "setFrame:");
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  if ([(CKColoredBalloonView *)self wantsGradient]
    || [(CKBalloonView *)self canUseOpaqueMask]
    && [(CKColoredBalloonView *)self wantsInvisibleInkEffectMask])
  {
    id v3 = [(CKColoredBalloonView *)self mask];
  }
  else
  {
    [(CKColoredBalloonView *)self balloonDescriptor];
    if (v22 < 3)
    {
      v21.receiver = self;
      v21.super_class = (Class)CKColoredBalloonView;
      [(CKBalloonImageView *)&v21 alignmentRectInsets];
      double v6 = v17;
      double v8 = v18;
      double v10 = v19;
      double v12 = v20;
      goto LABEL_4;
    }
    if ((v22 - 3) >= 2)
    {
      double v6 = *MEMORY[0x1E4F437F8];
      double v8 = *(double *)(MEMORY[0x1E4F437F8] + 8);
      double v10 = *(double *)(MEMORY[0x1E4F437F8] + 16);
      double v12 = *(double *)(MEMORY[0x1E4F437F8] + 24);
      goto LABEL_4;
    }
    id v3 = [(CKColoredBalloonView *)self balloonShapeView];
  }
  double v4 = v3;
  [v3 alignmentRectInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

LABEL_4:
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKColoredBalloonView *)self bounds];
  double v9 = v8;
  v10.receiver = self;
  v10.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonImageView setBounds:](&v10, sel_setBounds_, x, y, width, height);
  if (v9 != width) {
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKColoredBalloonView *)self frame];
  double v9 = v8;
  v10.receiver = self;
  v10.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  if (v9 != width) {
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKColoredBalloonView;
  [(CKBalloonView *)&v3 prepareForReuse];
  [(CKColoredBalloonView *)self setIsBeingShownAsPreview:0];
  [(CKColoredBalloonView *)self setGradientReferenceView:0];
}

- (void)setIsBeingShownAsPreview:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKColoredBalloonView;
  [(CKBalloonView *)&v6 setIsBeingShownAsPreview:a3];
  [(CKColoredBalloonView *)self balloonDescriptor];
  balloonShapeView = self->_balloonShapeView;
  v5[2] = v5[7];
  v5[3] = v5[8];
  v5[4] = v5[9];
  v5[0] = v5[5];
  v5[1] = v5[6];
  [(CKBalloonShapeView *)balloonShapeView setDescriptor:v5];
}

- (void)prepareForDisplay
{
  v49.receiver = self;
  v49.super_class = (Class)CKColoredBalloonView;
  [(CKBalloonView *)&v49 prepareForDisplay];
  [(CKBalloonShapeView *)self->_balloonShapeView removeFromSuperview];
  [(CKColoredBalloonView *)self alignmentRectInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  [(CKColoredBalloonView *)self balloonDescriptor];
  double v11 = [(CKColoredBalloonView *)self gradientView];
  double v12 = +[CKUIBehavior sharedBehaviors];
  double v13 = [v12 theme];
  double v14 = [v13 balloonColorsForColorType:(char)v45];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __41__CKColoredBalloonView_prepareForDisplay__block_invoke;
  v43[3] = &unk_1E562A138;
  v43[4] = self;
  double v15 = objc_msgSend(v14, "__imArrayByApplyingBlock:", v43);
  double v16 = +[CKPrintController sharedInstance];
  int v17 = [v16 isPrinting];

  if (v17)
  {
    id v42 = v15;
    +[CKPrintController printResolvedColors:&v42 balloonDescriptor:&v44 coloredBalloonView:self];
    id v18 = v42;

    double v15 = v18;
  }
  double v19 = [(CKColoredBalloonView *)self mask];
  if ([(CKColoredBalloonView *)self wantsGradient])
  {
    [(CKBalloonImageView *)self setImage:0];
    [(CKColoredBalloonView *)self setBackgroundColor:0];
    [v19 removeFromSuperview];
    long long v39 = v46;
    long long v40 = v47;
    long long v41 = v48;
    long long v37 = v44;
    long long v38 = v45;
    if (BYTE8(v48)) {
      CKResizableBalloonPunchout(&v37);
    }
    else {
    v27 = CKResizableBalloonMask(&v37);
    }
    [v19 setImage:v27];

    [v11 setColors:v15];
    if (!BYTE8(v48)
      && [(CKColoredBalloonView *)self wantsInvisibleInkEffectMask]
      && [(CKColoredBalloonView *)self hasBackground])
    {
      v28 = [v19 image];
      [(CKColoredBalloonView *)self setEffectViewMaskImage:v28];
    }
    else
    {
      [(CKColoredBalloonView *)self setEffectViewMaskImage:0];
    }
    long long v39 = v46;
    long long v40 = v47;
    long long v41 = v48;
    long long v37 = v44;
    long long v38 = v45;
    v29 = CKResizableBalloonMask(&v37);
    [v11 setMaskImage:v29];

    v30 = [v11 superview];

    if (!v30) {
      [(CKColoredBalloonView *)self insertSubview:v11 atIndex:0];
    }
    goto LABEL_30;
  }
  double v20 = [v11 superview];

  if (v20) {
    [v11 removeFromSuperview];
  }
  if (!BYTE8(v48)
    || ![(CKColoredBalloonView *)self wantsInvisibleInkEffectMask]
    || ![(CKColoredBalloonView *)self hasBackground])
  {
    [(CKColoredBalloonView *)self balloonDescriptor];
    if (v36 >= 3)
    {
      if ((v36 - 3) >= 2)
      {
LABEL_18:
        [(CKColoredBalloonView *)self setBackgroundColor:0];
        [v19 removeFromSuperview];
        if ([(CKColoredBalloonView *)self wantsInvisibleInkEffectMask]
          && [(CKColoredBalloonView *)self hasBackground])
        {
          long long v39 = v46;
          long long v40 = v47;
          long long v41 = v48;
          long long v37 = v44;
          long long v38 = v45;
          v26 = CKResizableBalloonMask(&v37);
          [(CKColoredBalloonView *)self setEffectViewMaskImage:v26];
        }
        else
        {
          [(CKColoredBalloonView *)self setEffectViewMaskImage:0];
        }
        goto LABEL_30;
      }
      [(CKBalloonImageView *)self setImage:0];
      [(CKBalloonImageView *)self setImageHidden:1];
      [(CKColoredBalloonView *)self balloonDescriptor];
      v25 = [(CKColoredBalloonView *)self balloonShapeView];
      v35[2] = v35[7];
      v35[3] = v35[8];
      v35[4] = v35[9];
      v35[0] = v35[5];
      v35[1] = v35[6];
      [v25 setDescriptor:v35];

      v24 = [(CKColoredBalloonView *)self balloonShapeView];
      [(CKColoredBalloonView *)self insertSubview:v24 atIndex:0];
    }
    else
    {
      long long v39 = v46;
      long long v40 = v47;
      long long v41 = v48;
      long long v37 = v44;
      long long v38 = v45;
      v24 = CKResizableBalloonImage((uint64_t)&v37);
      [(CKBalloonImageView *)self setImage:v24];
    }

    goto LABEL_18;
  }
  [(CKColoredBalloonView *)self setEffectViewMaskImage:0];
  [(CKBalloonImageView *)self setImage:0];
  objc_super v21 = [v15 lastObject];
  [(CKColoredBalloonView *)self setBackgroundColor:v21];

  long long v39 = v46;
  long long v40 = v47;
  long long v41 = v48;
  long long v37 = v44;
  long long v38 = v45;
  char v22 = CKResizableBalloonPunchout(&v37);
  [v19 setImage:v22];

  v23 = [v19 superview];

  if (!v23) {
    [(CKColoredBalloonView *)self addSubview:v19];
  }
LABEL_30:
  [(CKColoredBalloonView *)self alignmentRectInsets];
  if (v6 != v34 || v4 != v31 || v10 != v33 || v8 != v32) {
    [(CKColoredBalloonView *)self setNeedsLayout];
  }
}

id __41__CKColoredBalloonView_prepareForDisplay__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  double v4 = [v2 traitCollection];
  double v5 = [v3 resolvedColorForTraitCollection:v4];

  return v5;
}

- (void)setHasTail:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKBalloonView *)self hasTail] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKColoredBalloonView;
    [(CKBalloonView *)&v5 setHasTail:v3];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setCanUseOpaqueMask:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKBalloonView *)self canUseOpaqueMask] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKColoredBalloonView;
    [(CKBalloonView *)&v5 setCanUseOpaqueMask:v3];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    [(CKColoredBalloonView *)self setNeedsLayout];
  }
}

- (BOOL)needsGroupOpacity
{
  BOOL v3 = [(CKColoredBalloonView *)self wantsGradient];
  if (v3)
  {
    LOBYTE(v3) = [(CKBalloonView *)self canUseOpaqueMask];
  }
  return v3;
}

- (id)overlayColor
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 theme];
  objc_super v5 = objc_msgSend(v4, "balloonOverlayColorForColorType:", -[CKBalloonView color](self, "color"));

  return v5;
}

- (void)setColor:(char)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKColoredBalloonView;
  [(CKBalloonView *)&v4 setColor:a3];
  [(CKColoredBalloonView *)self updateWantsGradient];
  [(CKBalloonView *)self setNeedsPrepareForDisplay];
}

- (void)setGradientReferenceView:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CKColoredBalloonView *)self gradientView];
  [v5 setReferenceView:v4];

  [(CKColoredBalloonView *)self updateWantsGradient];

  [(CKBalloonView *)self setNeedsPrepareForDisplay];
}

- (CKGradientReferenceView)gradientReferenceView
{
  v2 = [(CKColoredBalloonView *)self gradientView];
  BOOL v3 = [v2 referenceView];

  return (CKGradientReferenceView *)v3;
}

- (BOOL)hasBackground
{
  return 1;
}

- (void)updateWantsGradient
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 shouldUseDynamicGradient];

  if (v4)
  {
    objc_super v5 = +[CKUIBehavior sharedBehaviors];
    double v6 = [v5 theme];
    objc_msgSend(v6, "balloonColorsForColorType:", -[CKBalloonView color](self, "color"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)[v8 count] <= 1)
    {
      [(CKColoredBalloonView *)self setWantsGradient:0];
    }
    else
    {
      double v7 = [(CKColoredBalloonView *)self gradientReferenceView];
      [(CKColoredBalloonView *)self setWantsGradient:v7 != 0];
    }
  }
}

- (void)setWantsGradient:(BOOL)a3
{
  if (self->_wantsGradient != a3)
  {
    self->_wantsGradient = a3;
    [(CKColoredBalloonView *)self setNeedsLayout];
  }
}

- (void)setBalloonDescriptor:(CKBalloonDescriptor_t *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKColoredBalloonView;
  long long v5 = *(_OWORD *)&a3->var6.alpha;
  v7[2] = *(_OWORD *)&a3->var6.green;
  v7[3] = v5;
  v7[4] = *(_OWORD *)&a3->var8;
  long long v6 = *(_OWORD *)&a3->var5;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  [(CKBalloonView *)&v8 setBalloonDescriptor:v7];
  [(CKColoredBalloonView *)self setColor:a3->var5];
  -[CKBalloonView setStrokeColor:](self, "setStrokeColor:", a3->var6.red, a3->var6.green, a3->var6.blue, a3->var6.alpha);
  [(CKColoredBalloonView *)self updateWantsGradient];
  [(CKBalloonView *)self setNeedsPrepareForDisplay];
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v13.receiver = self;
  v13.super_class = (Class)CKColoredBalloonView;
  [(CKBalloonDescriptor_t *)&v13 balloonDescriptor];
  if (!retstr->var7)
  {
    long long v5 = [(CKColoredBalloonView *)self traitCollection];
    retstr->var7 = [v5 userInterfaceStyle];
  }
  retstr->var2 = [(CKBalloonView *)self balloonStyle];
  [(CKBalloonView *)self strokeColor];
  retstr->var6.red = v6;
  retstr->var6.green = v7;
  retstr->var6.blue = v8;
  retstr->var6.alpha = v9;
  retstr->var5 = [(CKBalloonView *)self color];
  UIEdgeInsets result = (CKBalloonDescriptor_t *)[(CKBalloonView *)self isBeingShownAsPreview];
  if (result)
  {
    if ([(CKBalloonView *)self balloonStyle] == 3
      || (UIEdgeInsets result = (CKBalloonDescriptor_t *)[(CKBalloonView *)self balloonStyle], result == 4))
    {
      *(_OWORD *)&retstr->var6.red = CKColorZero;
      *(_OWORD *)&retstr->var6.blue = *(_OWORD *)&qword_18F81CEF8;
      double v11 = [MEMORY[0x1E4F42F80] currentTraitCollection];
      uint64_t v12 = [v11 userInterfaceStyle];

      if (v12 == 2) {
        retstr->var5 = -1;
      }
    }
  }
  return result;
}

- (CKBalloonImageView)mask
{
  mask = self->_mask;
  if (!mask)
  {
    int v4 = objc_alloc_init(CKBalloonImageView);
    long long v5 = self->_mask;
    self->_mask = v4;

    [(CKBalloonImageView *)self->_mask setUserInteractionEnabled:0];
    mask = self->_mask;
  }

  return mask;
}

- (CKBalloonShapeView)balloonShapeView
{
  balloonShapeView = self->_balloonShapeView;
  if (!balloonShapeView)
  {
    int v4 = [CKBalloonShapeView alloc];
    [(CKColoredBalloonView *)self balloonDescriptor];
    long long v5 = [(CKBalloonShapeView *)v4 initWithDescriptor:&v8 imageGenerator:&__block_literal_global_190];
    double v6 = self->_balloonShapeView;
    self->_balloonShapeView = v5;

    balloonShapeView = self->_balloonShapeView;
  }

  return balloonShapeView;
}

id __40__CKColoredBalloonView_balloonShapeView__block_invoke(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[3];
  v6[2] = a2[2];
  v6[3] = v2;
  v6[4] = a2[4];
  long long v3 = a2[1];
  v6[0] = *a2;
  v6[1] = v3;
  int v4 = CKResizableBalloonImage((uint64_t)v6);

  return v4;
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 balloonBackdropFilters];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    double v7 = [(CKColoredBalloonView *)self layer];
    [v7 setAllowsGroupBlending:0];

    id v8 = [(CKBalloonView *)self backdropFilterLayer];
    if (v8)
    {
LABEL_12:
      int v17 = [v4 balloonBackdropFilters];
      [v8 setFilters:v17];

      goto LABEL_13;
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F39B40]);
    objc_msgSend(v8, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [v8 setGroupName:@"FSMBackdropGroup"];
    [v8 setScale:0.25];
    if ([(CKColoredBalloonView *)self wantsGradient])
    {
      double v9 = [(CKColoredBalloonView *)self gradientView];
      [v9 setHidden:1];

      double v10 = [(CKColoredBalloonView *)self gradientView];
      double v11 = [v10 maskImage];

      if (!v11) {
        goto LABEL_11;
      }
    }
    else
    {
      [(CKBalloonImageView *)self setImageHidden:1];
      if ([v4 shouldUseMaskImage])
      {
        [(CKColoredBalloonView *)self balloonDescriptor];
        uint64_t v12 = CKResizableBalloonMask(v23);
      }
      else
      {
        uint64_t v12 = [(CKBalloonImageView *)self image];
      }
      double v11 = (void *)v12;
      if (!v12) {
        goto LABEL_11;
      }
    }
    [v8 setMaskImage:v11];
    objc_super v13 = (void *)MEMORY[0x1E4F39BE8];
    [(CKColoredBalloonView *)self bounds];
    objc_msgSend(v13, "boundsForMaskImage:withOriginalSize:", v11, v14, v15);
    objc_msgSend(v8, "setFrame:");
    [(CKBalloonView *)self setBackdropFilterLayer:v8];
LABEL_11:
    double v16 = [(CKColoredBalloonView *)self layer];
    [v16 insertSublayer:v8 atIndex:0];

    goto LABEL_12;
  }
LABEL_13:
  id v18 = [(CKColoredBalloonView *)self layer];
  double v19 = [v4 balloonFilters];
  [v18 setFilters:v19];

  double v20 = [(CKColoredBalloonView *)self layer];
  objc_super v21 = [v4 balloonCompositingFilter];
  [v20 setCompositingFilter:v21];

  v22.receiver = self;
  v22.super_class = (Class)CKColoredBalloonView;
  [(CKBalloonView *)&v22 addFilter:v4];
}

- (void)clearFilters
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v3 = [(CKBalloonView *)self filters];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v16 + 1) + 8 * v7) balloonBackdropFilters];
        if ([v8 count])
        {
          double v9 = [(CKColoredBalloonView *)self gradientView];

          if (v9)
          {
            double v10 = [(CKColoredBalloonView *)self gradientView];
            [v10 setHidden:0];

            [(CKBalloonImageView *)self setImageHidden:0];
            goto LABEL_12;
          }
        }
        else
        {
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
LABEL_12:

  double v11 = [(CKColoredBalloonView *)self layer];
  [v11 setAllowsGroupBlending:1];

  uint64_t v12 = [(CKColoredBalloonView *)self layer];
  [v12 setFilters:0];

  objc_super v13 = [(CKColoredBalloonView *)self layer];
  [v13 setCompositingFilter:0];

  double v14 = [(CKBalloonView *)self backdropFilterLayer];
  [v14 removeFromSuperlayer];

  [(CKBalloonView *)self setBackdropFilterLayer:0];
  v15.receiver = self;
  v15.super_class = (Class)CKColoredBalloonView;
  [(CKBalloonView *)&v15 clearFilters];
}

- (void)setEffectViewMaskImage:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(CKBalloonView *)self invisibleInkEffectController];
  uint64_t v5 = [v4 effectView];

  if (v5)
  {
    if (v7)
    {
      uint64_t v6 = [(CKColoredBalloonView *)self effectViewMask];
      [v6 setImage:v7];
      [v5 setMaskView:v6];
    }
    else
    {
      [v5 setMaskView:0];
    }
  }
}

- (CKBalloonImageView)effectViewMask
{
  effectViewMask = self->_effectViewMask;
  if (!effectViewMask)
  {
    uint64_t v4 = objc_alloc_init(CKBalloonImageView);
    uint64_t v5 = self->_effectViewMask;
    self->_effectViewMask = v4;

    effectViewMask = self->_effectViewMask;
  }

  return effectViewMask;
}

- (void)setGradientOverrideFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_gradientOverrideFrame = &self->_gradientOverrideFrame;
  if (!CGRectEqualToRect(self->_gradientOverrideFrame, a3))
  {
    p_gradientOverrideFrame->origin.double x = x;
    p_gradientOverrideFrame->origin.double y = y;
    p_gradientOverrideFrame->size.double width = width;
    p_gradientOverrideFrame->size.double height = height;
    id v18 = [MEMORY[0x1E4F39BE8] layer];
    double v9 = [(CKColoredBalloonView *)self gradientView];
    id v10 = [v9 gradient];
    objc_msgSend(v18, "setContents:", objc_msgSend(v10, "CGImage"));

    objc_msgSend(v18, "setFrame:", x, y, width, height);
    double v11 = [(CKColoredBalloonView *)self layer];
    uint64_t v12 = [(CKColoredBalloonView *)self gradientView];
    objc_super v13 = [v12 layer];
    [v11 insertSublayer:v18 above:v13];

    id v14 = objc_alloc(MEMORY[0x1E4F42AA0]);
    objc_super v15 = [(CKColoredBalloonView *)self gradientView];
    long long v16 = [v15 maskImage];
    long long v17 = (void *)[v14 initWithImage:v16];

    [(CKColoredBalloonView *)self bounds];
    objc_msgSend(v17, "setFrame:");
    [(CKColoredBalloonView *)self setMaskView:v17];
  }
}

- (BOOL)wantsInvisibleInkEffectMask
{
  [(CKColoredBalloonView *)self balloonDescriptor];
  return v4 <= 2u && [(CKBalloonView *)self invisibleInkEffectEnabled];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKColoredBalloonView;
  id v4 = a3;
  [(CKBalloonView *)&v7 traitCollectionDidChange:v4];
  uint64_t v5 = [(CKColoredBalloonView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6)
  {
    [(CKColoredBalloonView *)self setNeedsDisplay];
    [(CKBalloonView *)self prepareForDisplayIfNeeded];
  }
}

- (CKGradientView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
}

- (void)setMask:(id)a3
{
}

- (BOOL)wantsGradient
{
  return self->_wantsGradient;
}

- (CGRect)gradientOverrideFrame
{
  double x = self->_gradientOverrideFrame.origin.x;
  double y = self->_gradientOverrideFrame.origin.y;
  double width = self->_gradientOverrideFrame.size.width;
  double height = self->_gradientOverrideFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEffectViewMask:(id)a3
{
}

- (void)setBalloonShapeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonShapeView, 0);
  objc_storeStrong((id *)&self->_effectViewMask, 0);
  objc_storeStrong((id *)&self->_mask, 0);

  objc_storeStrong((id *)&self->_gradientView, 0);
}

@end