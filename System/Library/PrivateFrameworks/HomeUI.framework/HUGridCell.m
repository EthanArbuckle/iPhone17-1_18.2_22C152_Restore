@interface HUGridCell
+ (Class)layoutOptionsClass;
- (BOOL)areCellContentsHidden;
- (BOOL)isPointerInteractionEnabled;
- (BOOL)isRearranging;
- (BOOL)managesOwnBackgroundViewLayout;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CAShapeLayer)dashedBorderLayer;
- (HFItem)item;
- (HUGridCell)initWithCoder:(id)a3;
- (HUGridCell)initWithFrame:(CGRect)a3;
- (HUGridCellBackgroundView)gridBackgroundView;
- (HUGridCellLayoutOptions)layoutOptions;
- (UIPointerInteraction)pointerInteraction;
- (UIView)gridForegroundContentView;
- (UIVisualEffect)contentEffect;
- (UIVisualEffect)secondaryContentEffect;
- (UIVisualEffectView)gridForegroundView;
- (double)pointerRegionMargin;
- (double)secondaryContentDimmingFactor;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (int64_t)primaryState;
- (unint64_t)backgroundState;
- (unint64_t)iconDisplayStyle;
- (void)_removeDashedBorderLayer;
- (void)_setupCommonCellAppearance;
- (void)_updateForegroundStyle;
- (void)_updateTintColorSettingsForSubviewsOfView:(id)a3 desiredDisplayStyle:(unint64_t)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutOptionsDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCellContentsHidden:(BOOL)a3;
- (void)setContentEffect:(id)a3;
- (void)setDashedBorderLayer:(id)a3;
- (void)setGridBackgroundView:(id)a3;
- (void)setGridForegroundView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setPointerInteractionEnabled:(BOOL)a3;
- (void)setPointerRegionMargin:(double)a3;
- (void)setPrimaryState:(int64_t)a3;
- (void)setRearranging:(BOOL)a3;
- (void)setSecondaryContentDimmingFactor:(double)a3;
- (void)setSecondaryContentEffect:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUGridCell

- (HUGridCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridCell;
  v3 = -[HUGridCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HUGridCell *)v3 _setupCommonCellAppearance];
  }
  return v4;
}

- (void)setRearranging:(BOOL)a3
{
  if (self->_rearranging != a3)
  {
    BOOL v3 = a3;
    self->_rearranging = a3;
    id v5 = [(HUGridCell *)self layer];
    [(HUGridCell *)self frame];
    +[HUGraphicsUtilities legacy_setRearrangingAnimation:layer:frame:](HUGraphicsUtilities, "legacy_setRearrangingAnimation:layer:frame:", v3, v5);
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)HUGridCell;
  [(HUGridCell *)&v21 layoutSubviews];
  if (![(HUGridCell *)self managesOwnBackgroundViewLayout])
  {
    [(HUGridCell *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(HUGridCell *)self gridBackgroundView];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  }
  [(HUGridCell *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(HUGridCell *)self gridForegroundView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (UIView)gridForegroundContentView
{
  v2 = [(HUGridCell *)self gridForegroundView];
  double v3 = [v2 contentView];

  return (UIView *)v3;
}

- (UIVisualEffectView)gridForegroundView
{
  return self->_gridForegroundView;
}

- (BOOL)managesOwnBackgroundViewLayout
{
  return 0;
}

- (void)layoutOptionsDidChange
{
  double v3 = [(HUGridCell *)self layoutOptions];
  [v3 cellCornerRadius];
  double v5 = v4;
  double v6 = [(HUGridCell *)self gridBackgroundView];
  [v6 setCornerRadius:v5];

  double v7 = [(HUGridCell *)self layoutOptions];
  double v8 = [v7 backgroundDisplayOptions];
  double v9 = [(HUGridCell *)self gridBackgroundView];
  [v9 setDisplayOptions:v8];

  double v10 = [(HUGridCell *)self layoutOptions];
  [v10 cellCornerRadius];
  double v12 = v11;
  double v13 = [(HUGridCell *)self layer];
  [v13 setCornerRadius:v12];

  [(HUGridCell *)self _updateForegroundStyle];
}

- (HUGridCellBackgroundView)gridBackgroundView
{
  return self->_gridBackgroundView;
}

- (void)_updateForegroundStyle
{
  unint64_t v3 = [(HUGridCell *)self iconDisplayStyle];
  if (v3 == 3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3;
  }
  if (v4 == 2)
  {
    double v5 = [(HUGridCell *)self layoutOptions];
    id v18 = [v5 vibrancyEffect];

    double v6 = [(HUGridCell *)self layoutOptions];
    double v7 = [v6 secondaryVibrancyEffect];
    if (v7) {
      double v8 = v7;
    }
    else {
      double v8 = v18;
    }
    id v9 = v8;

    double v10 = [(HUGridCell *)self layoutOptions];
    [v10 secondaryContentDimmingFactor];
    double v12 = v11;
  }
  else
  {
    id v9 = 0;
    id v18 = 0;
    double v12 = 1.0;
  }
  double v13 = [(HUGridCell *)self gridForegroundContentView];
  [(HUGridCell *)self _updateTintColorSettingsForSubviewsOfView:v13 desiredDisplayStyle:v4];

  id v14 = [(HUGridCell *)self contentEffect];
  if (v18 != v14) {
    goto LABEL_13;
  }
  id v15 = [(HUGridCell *)self contentEffect];
  if (v9 != v15)
  {

    id v14 = v18;
LABEL_13:

LABEL_14:
    [(HUGridCell *)self setContentEffect:v18];
    [(HUGridCell *)self setSecondaryContentEffect:v9];
    [(HUGridCell *)self setSecondaryContentDimmingFactor:v12];
    [(HUGridCell *)self displayStyleDidChange];
    goto LABEL_15;
  }
  [(HUGridCell *)self secondaryContentDimmingFactor];
  double v17 = v16;

  if (v12 != v17) {
    goto LABEL_14;
  }
LABEL_15:
}

- (UIVisualEffect)contentEffect
{
  return self->_contentEffect;
}

- (unint64_t)iconDisplayStyle
{
  unint64_t result = [(HUGridCell *)self backgroundState];
  if (result != 1)
  {
    uint64_t v4 = [(HUGridCell *)self layoutOptions];
    uint64_t v5 = [v4 contentColorStyle];

    unint64_t v6 = 3;
    if (v5 != 1) {
      unint64_t v6 = 1;
    }
    if (v5) {
      return v6;
    }
    else {
      return 2;
    }
  }
  return result;
}

- (unint64_t)backgroundState
{
  v2 = [(HUGridCell *)self gridBackgroundView];
  unint64_t v3 = [v2 backgroundState];

  return v3;
}

- (void)_updateTintColorSettingsForSubviewsOfView:(id)a3 desiredDisplayStyle:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = v6;
  if (a4 != 2) {
    [v6 setTintColor:0];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v24 = v7;
  double v8 = [v7 subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    uint64_t v12 = 1;
    if (a4 != 1) {
      uint64_t v12 = 2;
    }
    uint64_t v25 = v12;
    unint64_t v13 = 0x1E4F42000uLL;
    do
    {
      uint64_t v14 = 0;
      uint64_t v26 = v10;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v15 _setTextColorFollowsTintColor:a4 == 2];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v16 = a4;
            uint64_t v17 = v11;
            id v18 = self;
            unint64_t v19 = v13;
            v20 = v8;
            id v21 = v15;
            v22 = [v21 image];
            v23 = [v22 imageWithRenderingMode:v25];
            [v21 setImage:v23];

            double v8 = v20;
            unint64_t v13 = v19;
            self = v18;
            uint64_t v11 = v17;
            a4 = v16;
            uint64_t v10 = v26;
          }
        }
        [(HUGridCell *)self _updateTintColorSettingsForSubviewsOfView:v15 desiredDisplayStyle:a4];
        ++v14;
      }
      while (v10 != v14);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }
}

- (double)secondaryContentDimmingFactor
{
  return self->_secondaryContentDimmingFactor;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v78[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HUGridCell *)self item];
  uint64_t v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  -[HUGridCell setPrimaryState:](self, "setPrimaryState:", [v6 integerValue]);

  double v7 = [(HUGridCell *)self item];
  double v8 = [v7 latestResults];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68C20]];

  v11 = v9 && (int64_t v10 = -[HUGridCell primaryState](self, "primaryState"), v10 != [v9 integerValue])
     || [(HUGridCell *)self primaryState] == 2;
  uint64_t v12 = [(HUGridCell *)self gridBackgroundView];
  [v12 setBackgroundState:v11];

  [(HUGridCell *)self _updateForegroundStyle];
  unint64_t v13 = [(HUGridCell *)self layoutOptions];
  uint64_t v14 = [v13 onStateBorderStyle];

  switch(v14)
  {
    case 0:
      goto LABEL_16;
    case 1:
      [(HUGridCell *)self _removeDashedBorderLayer];
      id v73 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
      uint64_t v74 = [v73 CGColor];
      v75 = [(HUGridCell *)self gridBackgroundView];
      v76 = [v75 layer];
      [v76 setBorderColor:v74];

      if ([(HUGridCell *)self primaryState] == 2) {
        double v77 = 1.0;
      }
      else {
        double v77 = 0.0;
      }
      v69 = [(HUGridCell *)self gridBackgroundView];
      v70 = [v69 layer];
      v71 = v70;
      double v72 = v77;
      goto LABEL_22;
    case 2:
      if ([(HUGridCell *)self primaryState] == 2)
      {
        id v15 = [(HUGridCell *)self dashedBorderLayer];

        if (!v15)
        {
          unint64_t v16 = [MEMORY[0x1E4F39C88] layer];
          [(HUGridCell *)self setDashedBorderLayer:v16];

          uint64_t v17 = [(HUGridCell *)self gridBackgroundView];
          id v18 = [v17 layer];
          unint64_t v19 = [(HUGridCell *)self dashedBorderLayer];
          [v18 addSublayer:v19];

          v78[0] = &unk_1F19B4718;
          v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
          id v21 = [(HUGridCell *)self dashedBorderLayer];
          [v21 setLineDashPattern:v20];

          v22 = [(HUGridCell *)self dashedBorderLayer];
          [v22 setLineWidth:2.0];

          v23 = [(HUGridCell *)self dashedBorderLayer];
          [v23 setFillColor:0];
        }
        v24 = [(HUGridCell *)self dashedBorderLayer];
        [v24 frame];
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        [(HUGridCell *)self bounds];
        v80.origin.x = v33;
        v80.origin.y = v34;
        v80.size.width = v35;
        v80.size.height = v36;
        v79.origin.x = v26;
        v79.origin.y = v28;
        v79.size.width = v30;
        v79.size.height = v32;
        BOOL v37 = CGRectEqualToRect(v79, v80);

        if (!v37)
        {
          [(HUGridCell *)self bounds];
          double v39 = v38;
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          v46 = [(HUGridCell *)self dashedBorderLayer];
          objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

          v47 = (void *)MEMORY[0x1E4F427D0];
          v48 = [(HUGridCell *)self dashedBorderLayer];
          [v48 frame];
          double v50 = v49;
          double v52 = v51;
          double v54 = v53;
          double v56 = v55;
          v57 = [(HUGridCell *)self gridBackgroundView];
          v58 = [v57 layer];
          [v58 cornerRadius];
          objc_msgSend(v47, "bezierPathWithRoundedRect:cornerRadius:", v50, v52, v54, v56, v59);
          id v60 = objc_claimAutoreleasedReturnValue();
          uint64_t v61 = [v60 CGPath];
          v62 = [(HUGridCell *)self dashedBorderLayer];
          [v62 setPath:v61];
        }
        id v63 = [MEMORY[0x1E4F428B8] systemLightMidGrayColor];
        uint64_t v64 = [v63 CGColor];

        v65 = [(HUGridCell *)self traitCollection];
        uint64_t v66 = [v65 userInterfaceStyle];

        if (v66 == 2)
        {
          id v67 = [MEMORY[0x1E4F428B8] systemDarkLightMidGrayColor];
          uint64_t v64 = [v67 CGColor];
        }
        v68 = [(HUGridCell *)self dashedBorderLayer];
        [v68 setStrokeColor:v64];

        goto LABEL_17;
      }
LABEL_16:
      [(HUGridCell *)self _removeDashedBorderLayer];
LABEL_17:
      v69 = [(HUGridCell *)self gridBackgroundView];
      v70 = [v69 layer];
      v71 = v70;
      double v72 = 0.0;
LABEL_22:
      [v70 setBorderWidth:v72];

      break;
  }
}

- (int64_t)primaryState
{
  return self->_primaryState;
}

- (void)setPrimaryState:(int64_t)a3
{
  self->_primaryState = a3;
}

- (void)_removeDashedBorderLayer
{
  unint64_t v3 = [(HUGridCell *)self dashedBorderLayer];

  if (v3)
  {
    uint64_t v4 = [(HUGridCell *)self dashedBorderLayer];
    [v4 removeFromSuperlayer];

    [(HUGridCell *)self setDashedBorderLayer:0];
  }
}

- (CAShapeLayer)dashedBorderLayer
{
  return self->_dashedBorderLayer;
}

- (void)setSecondaryContentEffect:(id)a3
{
}

- (void)setSecondaryContentDimmingFactor:(double)a3
{
  self->_secondaryContentDimmingFactor = a3;
}

- (void)setContentEffect:(id)a3
{
  id v5 = a3;
  id v6 = self->_contentEffect;
  double v7 = (UIVisualEffect *)v5;
  BOOL v11 = v7;
  if (v6 == v7)
  {

    int64_t v10 = v11;
LABEL_8:

    uint64_t v9 = v11;
    goto LABEL_9;
  }
  if (!v6)
  {

    goto LABEL_7;
  }
  char v8 = [(UIVisualEffect *)v6 isEqual:v7];

  uint64_t v9 = v11;
  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_contentEffect, a3);
    int64_t v10 = [(HUGridCell *)self gridForegroundView];
    [v10 setEffect:v11];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUGridCell;
  [(HUGridCell *)&v7 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 backgroundEffectViewGrouper];
    id v6 = [(HUGridCell *)self gridBackgroundView];
    [v6 setBackgroundEffectViewGrouper:v5];
  }
}

- (HUGridCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridCell;
  unint64_t v3 = [(HUGridCell *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(HUGridCell *)v3 _setupCommonCellAppearance];
  }
  return v4;
}

- (void)setLayoutOptions:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_layoutOptions] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    [(HUGridCell *)self layoutOptionsDidChange];
  }
}

- (void)_setupCommonCellAppearance
{
  [(HUGridCell *)self setPrimaryState:0];
  unint64_t v3 = objc_alloc_init(HUGridCellBackgroundView);
  [(HUGridCell *)self setGridBackgroundView:v3];

  id v4 = [(HUGridCell *)self contentView];
  id v5 = [(HUGridCell *)self gridBackgroundView];
  [v4 addSubview:v5];

  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
  [(HUGridCell *)self setGridForegroundView:v6];

  id v8 = [(HUGridCell *)self contentView];
  objc_super v7 = [(HUGridCell *)self gridForegroundView];
  [v8 addSubview:v7];
}

- (void)prepareForReuse
{
  [(HUGridCell *)self setCellContentsHidden:0];
  [(HUGridCell *)self setPrimaryState:0];
  [(HUGridCell *)self setRearranging:0];
  v3.receiver = self;
  v3.super_class = (Class)HUGridCell;
  [(HUGridCell *)&v3 prepareForReuse];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUGridCell;
  -[HUGridCell setHighlighted:](&v6, sel_setHighlighted_);
  id v5 = [(HUGridCell *)self gridBackgroundView];
  [v5 setPressed:v3];
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  if (self->_pointerInteractionEnabled != a3)
  {
    self->_pointerInteractionEnabled = a3;
    if (a3)
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:self];
      [(HUGridCell *)self setPointerInteraction:v4];

      id v6 = [(HUGridCell *)self pointerInteraction];
      [(HUGridCell *)self addInteraction:v6];
    }
    else
    {
      id v5 = [(HUGridCell *)self pointerInteraction];
      [(HUGridCell *)self removeInteraction:v5];

      [(HUGridCell *)self setPointerInteraction:0];
    }
  }
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)setCellContentsHidden:(BOOL)a3
{
  if (self->_cellContentsHidden != a3)
  {
    BOOL v3 = a3;
    self->_cellContentsHidden = a3;
    id v4 = [(HUGridCell *)self contentView];
    [v4 setHidden:v3];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  [(HUGridCell *)self pointerRegionMargin];
  if (v7 == 0.0)
  {
    id v8 = v6;
  }
  else
  {
    [v6 rect];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(HUGridCell *)self pointerRegionMargin];
    CGFloat v18 = -v17;
    [(HUGridCell *)self pointerRegionMargin];
    CGFloat v20 = -v19;
    v29.origin.double x = v10;
    v29.origin.double y = v12;
    v29.size.double width = v14;
    v29.size.double height = v16;
    CGRect v30 = CGRectInset(v29, v18, v20);
    double x = v30.origin.x;
    double y = v30.origin.y;
    double width = v30.size.width;
    double height = v30.size.height;
    double v25 = (void *)MEMORY[0x1E4F42CB0];
    CGFloat v26 = [v6 identifier];
    objc_msgSend(v25, "regionWithRect:identifier:", v26, x, y, width, height);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self];
  id v6 = [MEMORY[0x1E4F42CA8] effectWithPreview:v5];
  double v7 = (void *)MEMORY[0x1E4F42CB8];
  [(HUGridCell *)self frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  CGFloat v16 = [(HUGridCell *)self layoutOptions];
  [v16 cellCornerRadius];
  CGFloat v18 = objc_msgSend(v7, "shapeWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v17);

  double v19 = [MEMORY[0x1E4F42CC0] styleWithEffect:v6 shape:v18];

  return v19;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUGridCell;
  if (-[HUGridCell pointInside:withEvent:](&v23, sel_pointInside_withEvent_, v7, x, y))
  {
    BOOL v8 = 1;
  }
  else if ([v7 type] != 11 {
         || ([(HUGridCell *)self pointerRegionMargin], v9 == 0.0))
  }
  {
    BOOL v8 = 0;
  }
  else
  {
    [(HUGridCell *)self bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(HUGridCell *)self pointerRegionMargin];
    CGFloat v19 = -v18;
    [(HUGridCell *)self pointerRegionMargin];
    CGFloat v21 = -v20;
    v25.origin.double x = v11;
    v25.origin.double y = v13;
    v25.size.double width = v15;
    v25.size.double height = v17;
    CGRect v26 = CGRectInset(v25, v19, v21);
    v24.double x = x;
    v24.double y = y;
    BOOL v8 = CGRectContainsPoint(v26, v24);
  }

  return v8;
}

- (BOOL)areCellContentsHidden
{
  return self->_cellContentsHidden;
}

- (HUGridCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (BOOL)isRearranging
{
  return self->_rearranging;
}

- (BOOL)isPointerInteractionEnabled
{
  return self->_pointerInteractionEnabled;
}

- (double)pointerRegionMargin
{
  return self->_pointerRegionMargin;
}

- (void)setPointerRegionMargin:(double)a3
{
  self->_pointerRegionMargin = a3;
}

- (UIVisualEffect)secondaryContentEffect
{
  return self->_secondaryContentEffect;
}

- (void)setGridBackgroundView:(id)a3
{
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (void)setGridForegroundView:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void)setDashedBorderLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashedBorderLayer, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_gridForegroundView, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_gridBackgroundView, 0);
  objc_storeStrong((id *)&self->_secondaryContentEffect, 0);
  objc_storeStrong((id *)&self->_contentEffect, 0);

  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end