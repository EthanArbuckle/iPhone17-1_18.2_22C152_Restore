@interface CKConversationListAccessoryView
+ (double)defaultDiameter;
+ (id)defaultStateConfigMap;
- (BOOL)imageNeedsEdgeAntiAliasing;
- (BOOL)needsVibrancy;
- (BOOL)needsVisualEffects;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CKConversationListAccessoryView)init;
- (CKConversationListAccessoryView)initWithDiameter:(double)a3;
- (CKConversationListAccessoryView)initWithFrame:(CGRect)a3;
- (NSDictionary)configStateMap;
- (NSNumber)lastKnownState;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (UIImageView)imageView;
- (UIView)colorView;
- (UIVisualEffectView)backgroundView;
- (UIVisualEffectView)vibrancyView;
- (id)configForState:(unint64_t)a3;
- (void)_setConfig:(id)a3 forState:(unint64_t)a4;
- (void)_setNeedsVisualAppearanceUpdate;
- (void)_updateVisualAppearanceForCurrentStateIfNeeded;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4;
- (void)setBackgroundView:(id)a3;
- (void)setBlurEffect:(id)a3 forState:(unint64_t)a4;
- (void)setBlurEffect:(id)a3 withVibrancyEffectStyle:(int64_t)a4 forState:(unint64_t)a5;
- (void)setColorView:(id)a3;
- (void)setConfigStateMap:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setImageNeedsEdgeAntiAliasing:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setLastKnownState:(id)a3;
- (void)setNeedsVibrancy:(BOOL)a3;
- (void)setNeedsVisualEffects:(BOOL)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTintColor:(id)a3 forState:(unint64_t)a4;
- (void)setVibrancyEffectStyle:(int64_t)a3 forState:(unint64_t)a4;
- (void)setVibrancyView:(id)a3;
@end

@implementation CKConversationListAccessoryView

+ (double)defaultDiameter
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 pinnedConversationDefaultAccessorySize];
  double v4 = v3;

  return v4;
}

+ (id)defaultStateConfigMap
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = &unk_1EDF16910;
  v2 = objc_alloc_init(CKConversationListAccessoryViewConfiguration);
  v6[0] = v2;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (CKConversationListAccessoryView)initWithFrame:(CGRect)a3
{
  v44.receiver = self;
  v44.super_class = (Class)CKConversationListAccessoryView;
  double v3 = -[CKConversationListAccessoryView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[CKConversationListAccessoryView defaultStateConfigMap];
    [(CKConversationListAccessoryView *)v3 setConfigStateMap:v4];

    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKConversationListAccessoryView *)v3 setBackgroundColor:v5];

    [(CKConversationListAccessoryView *)v3 bounds];
    double v7 = v6 * 0.5;
    v8 = [(CKConversationListAccessoryView *)v3 layer];
    [v8 setCornerRadius:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(CKConversationListAccessoryView *)v3 bounds];
    v10 = objc_msgSend(v9, "initWithFrame:");
    [(CKConversationListAccessoryView *)v3 setColorView:v10];

    v11 = [(CKConversationListAccessoryView *)v3 colorView];
    [v11 setClipsToBounds:1];

    v12 = [(CKConversationListAccessoryView *)v3 colorView];
    [v12 bounds];
    double v14 = v13 * 0.5;
    v15 = [(CKConversationListAccessoryView *)v3 colorView];
    v16 = [v15 layer];
    [v16 setCornerRadius:v14];

    v17 = [(CKConversationListAccessoryView *)v3 colorView];
    [v17 setUserInteractionEnabled:0];

    v18 = [(CKConversationListAccessoryView *)v3 colorView];
    [(CKConversationListAccessoryView *)v3 addSubview:v18];

    id v19 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v20 = [(CKConversationListAccessoryView *)v3 imageView];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    v25 = [(CKConversationListAccessoryView *)v3 backgroundView];
    [v25 bounds];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    if (CKMainScreenScale_once_70 != -1) {
      dispatch_once(&CKMainScreenScale_once_70, &__block_literal_global_180);
    }
    double v34 = *(double *)&CKMainScreenScale_sMainScreenScale_70;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_70 == 0.0) {
      double v34 = 1.0;
    }
    v35 = objc_msgSend(v19, "initWithFrame:", 1.0 / v34 * (v27 * v34 + floor((v31 * v34 - v22 * v34) * 0.5)), 1.0 / v34 * (v29 * v34 + floor((v33 * v34 - v24 * v34) * 0.5)), v22 * v34 * (1.0 / v34), v24 * v34 * (1.0 / v34));
    [(CKConversationListAccessoryView *)v3 setImageView:v35];

    v36 = [(CKConversationListAccessoryView *)v3 imageView];
    [v36 setUserInteractionEnabled:0];

    v37 = [(CKConversationListAccessoryView *)v3 preferredSymbolConfiguration];
    v38 = [(CKConversationListAccessoryView *)v3 imageView];
    [v38 setPreferredSymbolConfiguration:v37];

    uint64_t v39 = [(CKConversationListAccessoryView *)v3 imageNeedsEdgeAntiAliasing];
    v40 = [(CKConversationListAccessoryView *)v3 imageView];
    v41 = [v40 layer];
    [v41 setAllowsEdgeAntialiasing:v39];

    v42 = [(CKConversationListAccessoryView *)v3 imageView];
    [(CKConversationListAccessoryView *)v3 addSubview:v42];

    [(CKConversationListAccessoryView *)v3 _setNeedsVisualAppearanceUpdate];
    [(CKConversationListAccessoryView *)v3 _updateVisualAppearanceForCurrentStateIfNeeded];
  }
  return v3;
}

- (CKConversationListAccessoryView)initWithDiameter:(double)a3
{
  return -[CKConversationListAccessoryView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3, a3);
}

- (CKConversationListAccessoryView)init
{
  +[CKConversationListAccessoryView defaultDiameter];

  return -[CKConversationListAccessoryView initWithDiameter:](self, "initWithDiameter:");
}

- (id)configForState:(unint64_t)a3
{
  double v4 = [(CKConversationListAccessoryView *)self configStateMap];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  double v6 = [v4 objectForKey:v5];

  if (!v6) {
    double v6 = objc_alloc_init(CKConversationListAccessoryViewConfiguration);
  }
  double v7 = (void *)[(CKConversationListAccessoryViewConfiguration *)v6 copy];

  return v7;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat point = a3.y;
  CGFloat x = a3.x;
  [(CKConversationListAccessoryView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(CKConversationListAccessoryView *)self bounds];
  if (v14 + -44.0 <= 0.0) {
    double v15 = v14 + -44.0;
  }
  else {
    double v15 = 0.0;
  }
  [(CKConversationListAccessoryView *)self bounds];
  if (v16 + -44.0 <= 0.0) {
    double v17 = v16 + -44.0;
  }
  else {
    double v17 = 0.0;
  }
  v23.origin.CGFloat x = v7;
  v23.origin.y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  CGRect v24 = CGRectInset(v23, v15, v17);
  CGFloat v18 = x;
  CGFloat v19 = point;

  return CGRectContainsPoint(v24, *(CGPoint *)&v18);
}

- (void)_updateVisualAppearanceForCurrentStateIfNeeded
{
  double v3 = [(CKConversationListAccessoryView *)self lastKnownState];
  double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKConversationListAccessoryView state](self, "state"));
  char v5 = [v3 isEqualToNumber:v4];

  if ((v5 & 1) == 0)
  {
    double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKConversationListAccessoryView state](self, "state"));
    [(CKConversationListAccessoryView *)self setLastKnownState:v6];

    id v76 = [(CKConversationListAccessoryView *)self configForState:[(CKConversationListAccessoryView *)self state]];
    CGFloat v7 = [v76 backgroundColor];
    double v8 = [(CKConversationListAccessoryView *)self colorView];
    [v8 setBackgroundColor:v7];

    LODWORD(v8) = [(CKConversationListAccessoryView *)self needsVisualEffects];
    CGFloat v9 = [(CKConversationListAccessoryView *)self backgroundView];
    double v10 = v9;
    if (v8)
    {

      if (!v10)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F43028]);
        [(CKConversationListAccessoryView *)self bounds];
        double v12 = objc_msgSend(v11, "initWithFrame:");
        [(CKConversationListAccessoryView *)self setBackgroundView:v12];

        CGFloat v13 = [(CKConversationListAccessoryView *)self backgroundView];
        [v13 setClipsToBounds:1];

        double v14 = [(CKConversationListAccessoryView *)self backgroundView];
        [v14 bounds];
        double v16 = v15 * 0.5;
        double v17 = [(CKConversationListAccessoryView *)self backgroundView];
        CGFloat v18 = [v17 layer];
        [v18 setCornerRadius:v16];

        CGFloat v19 = [(CKConversationListAccessoryView *)self backgroundView];
        [v19 setUserInteractionEnabled:0];

        v20 = [(CKConversationListAccessoryView *)self backgroundView];
        [(CKConversationListAccessoryView *)self addSubview:v20];
      }
      double v21 = [v76 blurEffect];
      double v22 = [(CKConversationListAccessoryView *)self backgroundView];
      [v22 setEffect:v21];
    }
    else
    {
      [v9 removeFromSuperview];

      [(CKConversationListAccessoryView *)self setBackgroundView:0];
    }
    uint64_t v23 = [v76 blurEffect];
    if (v23
      && (CGRect v24 = (void *)v23,
          BOOL v25 = [(CKConversationListAccessoryView *)self needsVibrancy],
          v24,
          v25))
    {
      double v26 = (void *)MEMORY[0x1E4F42FE8];
      double v27 = [v76 blurEffect];
      double v28 = objc_msgSend(v26, "effectForBlurEffect:style:", v27, objc_msgSend(v76, "vibrancyStyle"));

      double v29 = [(CKConversationListAccessoryView *)self vibrancyView];

      if (!v29)
      {
        double v30 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v28];
        [(CKConversationListAccessoryView *)self setVibrancyView:v30];

        double v31 = [(CKConversationListAccessoryView *)self backgroundView];
        [v31 bounds];
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        v40 = [(CKConversationListAccessoryView *)self vibrancyView];
        objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

        v41 = [(CKConversationListAccessoryView *)self backgroundView];
        v42 = [v41 contentView];
        v43 = [(CKConversationListAccessoryView *)self vibrancyView];
        [v42 addSubview:v43];
      }
    }
    else
    {
      objc_super v44 = [(CKConversationListAccessoryView *)self vibrancyView];
      [v44 removeFromSuperview];

      [(CKConversationListAccessoryView *)self setVibrancyView:0];
    }
    v45 = [v76 image];
    v46 = [(CKConversationListAccessoryView *)self imageView];
    [v46 setImage:v45];

    v47 = [(CKConversationListAccessoryView *)self imageView];
    [v47 sizeToFit];

    v48 = [(CKConversationListAccessoryView *)self imageView];
    [v48 frame];
    double v50 = v49;
    double v52 = v51;
    v53 = [(CKConversationListAccessoryView *)self backgroundView];
    [v53 bounds];
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    double v61 = v60;
    if (CKMainScreenScale_once_70 != -1) {
      dispatch_once(&CKMainScreenScale_once_70, &__block_literal_global_180);
    }
    double v62 = *(double *)&CKMainScreenScale_sMainScreenScale_70;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_70 == 0.0) {
      double v62 = 1.0;
    }
    double v63 = v50 * v62;
    double v64 = v52 * v62;
    double v65 = v55 * v62 + floor((v59 * v62 - v50 * v62) * 0.5);
    double v66 = v57 * v62 + floor((v61 * v62 - v52 * v62) * 0.5);
    double v67 = 1.0 / v62;
    double v68 = v67 * v65;
    double v69 = v67 * v66;
    double v70 = v63 * v67;
    double v71 = v64 * v67;
    v72 = [(CKConversationListAccessoryView *)self imageView];
    objc_msgSend(v72, "setFrame:", v68, v69, v70, v71);

    v73 = [v76 tintColor];
    v74 = [(CKConversationListAccessoryView *)self imageView];
    [v74 setTintColor:v73];

    v75 = [(CKConversationListAccessoryView *)self imageView];
    [(CKConversationListAccessoryView *)self bringSubviewToFront:v75];
  }
}

- (void)_setNeedsVisualAppearanceUpdate
{
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  v2 = [(CKConversationListAccessoryView *)self imageView];
  double v3 = [v2 preferredSymbolConfiguration];

  return (UIImageSymbolConfiguration *)v3;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListAccessoryView *)self imageView];
  [v5 setPreferredSymbolConfiguration:v4];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationListAccessoryView;
  [(CKConversationListAccessoryView *)&v4 setEnabled:a3];
  [(CKConversationListAccessoryView *)self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationListAccessoryView;
  [(CKConversationListAccessoryView *)&v4 setHighlighted:a3];
  [(CKConversationListAccessoryView *)self setNeedsLayout];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationListAccessoryView;
  [(CKConversationListAccessoryView *)&v4 setSelected:a3];
  [(CKConversationListAccessoryView *)self setNeedsLayout];
}

- (void)_setConfig:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  CGFloat v7 = [(CKConversationListAccessoryView *)self configStateMap];
  id v10 = (id)[v7 mutableCopy];

  double v8 = [NSNumber numberWithUnsignedInteger:a4];
  [v10 setObject:v6 forKey:v8];

  CGFloat v9 = (void *)[v10 copy];
  [(CKConversationListAccessoryView *)self setConfigStateMap:v9];

  [(CKConversationListAccessoryView *)self _setNeedsVisualAppearanceUpdate];
  [(CKConversationListAccessoryView *)self setNeedsLayout];
}

- (void)setVibrancyEffectStyle:(int64_t)a3 forState:(unint64_t)a4
{
  id v7 = [(CKConversationListAccessoryView *)self configForState:a4];
  [(CKConversationListAccessoryView *)self setNeedsVibrancy:1];
  [v7 setVibrancyStyle:a3];
  [(CKConversationListAccessoryView *)self _setConfig:v7 forState:a4];
}

- (void)setBlurEffect:(id)a3 withVibrancyEffectStyle:(int64_t)a4 forState:(unint64_t)a5
{
  [(CKConversationListAccessoryView *)self setBlurEffect:a3 forState:a5];
  if (a3)
  {
    [(CKConversationListAccessoryView *)self setNeedsVibrancy:1];
    id v9 = [(CKConversationListAccessoryView *)self configForState:a5];
    [v9 setVibrancyStyle:a4];
    [(CKConversationListAccessoryView *)self _setConfig:v9 forState:a5];
  }
  else
  {
    _IMWarn();
  }
}

- (void)setBlurEffect:(id)a3 forState:(unint64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    [(CKConversationListAccessoryView *)self setNeedsVisualEffects:1];
    id v6 = [(CKConversationListAccessoryView *)self configForState:a4];
    [v6 setBlurEffect:v7];
    [(CKConversationListAccessoryView *)self _setConfig:v6 forState:a4];
  }
  else
  {
    _IMWarn();
  }
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CKConversationListAccessoryView *)self configForState:a4];
  [v7 setBackgroundColor:v6];

  [(CKConversationListAccessoryView *)self _setConfig:v7 forState:a4];
}

- (void)setTintColor:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CKConversationListAccessoryView *)self configForState:a4];
  [v7 setTintColor:v6];

  [(CKConversationListAccessoryView *)self _setConfig:v7 forState:a4];
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CKConversationListAccessoryView *)self configForState:a4];
  [v7 setImage:v6];

  [(CKConversationListAccessoryView *)self _setConfig:v7 forState:a4];
}

- (void)layoutSubviews
{
  v62.receiver = self;
  v62.super_class = (Class)CKConversationListAccessoryView;
  [(CKConversationListAccessoryView *)&v62 layoutSubviews];
  [(CKConversationListAccessoryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CKConversationListAccessoryView *)self colorView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(CKConversationListAccessoryView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(CKConversationListAccessoryView *)self backgroundView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  double v21 = [(CKConversationListAccessoryView *)self configForState:[(CKConversationListAccessoryView *)self state]];
  double v22 = [v21 tintColor];
  uint64_t v23 = [(CKConversationListAccessoryView *)self imageView];
  [v23 setTintColor:v22];

  CGRect v24 = [(CKConversationListAccessoryView *)self imageView];
  [v24 frame];
  double v26 = v25;
  double v28 = v27;
  double v29 = [(CKConversationListAccessoryView *)self backgroundView];
  [v29 frame];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  if (CKMainScreenScale_once_70 != -1) {
    dispatch_once(&CKMainScreenScale_once_70, &__block_literal_global_180);
  }
  double v38 = *(double *)&CKMainScreenScale_sMainScreenScale_70;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_70 == 0.0) {
    double v38 = 1.0;
  }
  double v39 = v26 * v38;
  double v40 = v28 * v38;
  double v41 = v31 * v38 + floor((v35 * v38 - v26 * v38) * 0.5);
  double v42 = v33 * v38 + floor((v37 * v38 - v28 * v38) * 0.5);
  double v43 = 1.0 / v38;
  double v44 = v43 * v41;
  double v45 = v43 * v42;
  double v46 = v39 * v43;
  double v47 = v40 * v43;
  v48 = [(CKConversationListAccessoryView *)self imageView];
  objc_msgSend(v48, "setFrame:", v44, v45, v46, v47);

  [(CKConversationListAccessoryView *)self bounds];
  double v50 = v49 * 0.5;
  double v51 = [(CKConversationListAccessoryView *)self layer];
  [v51 setCornerRadius:v50];

  double v52 = [(CKConversationListAccessoryView *)self colorView];
  [v52 bounds];
  double v54 = v53 * 0.5;
  double v55 = [(CKConversationListAccessoryView *)self colorView];
  double v56 = [v55 layer];
  [v56 setCornerRadius:v54];

  double v57 = [(CKConversationListAccessoryView *)self backgroundView];
  [v57 bounds];
  double v59 = v58 * 0.5;
  double v60 = [(CKConversationListAccessoryView *)self backgroundView];
  double v61 = [v60 layer];
  [v61 setCornerRadius:v59];

  [(CKConversationListAccessoryView *)self _updateVisualAppearanceForCurrentStateIfNeeded];
}

- (BOOL)imageNeedsEdgeAntiAliasing
{
  return self->_imageNeedsEdgeAntiAliasing;
}

- (void)setImageNeedsEdgeAntiAliasing:(BOOL)a3
{
  self->_imageNeedsEdgeAntiAliasing = a3;
}

- (NSDictionary)configStateMap
{
  return self->_configStateMap;
}

- (void)setConfigStateMap:(id)a3
{
}

- (BOOL)needsVisualEffects
{
  return self->_needsVisualEffects;
}

- (void)setNeedsVisualEffects:(BOOL)a3
{
  self->_needsVisualEffects = a3;
}

- (BOOL)needsVibrancy
{
  return self->_needsVibrancy;
}

- (void)setNeedsVibrancy:(BOOL)a3
{
  self->_needsVibrancy = a3;
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSNumber)lastKnownState
{
  return self->_lastKnownState;
}

- (void)setLastKnownState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownState, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);

  objc_storeStrong((id *)&self->_configStateMap, 0);
}

@end