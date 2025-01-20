@interface EKUIListViewCellBackground
+ (BOOL)drawsBackgroundForEvent:(id)a3;
+ (id)_angledStripeBackground:(id)a3;
- (EKUIListViewCellBackground)initWithCornerRadius:(double)a3;
- (id)_backgroundViewFilterColorForHighlighted:(BOOL)a3 carplayMode:(BOOL)a4;
- (id)_backgroundViewFilterForHighlighted:(BOOL)a3 carplayMode:(BOOL)a4;
- (id)_carplayAngledStripeBackgroundForHighlighted:(BOOL)a3;
- (void)_configureLayer:(id)a3;
- (void)_updateBackgroundWithSolidColor:(id)a3 stripedColor:(id)a4 highlighted:(BOOL)a5 dimmed:(BOOL)a6 carplayMode:(BOOL)a7;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)updateBackgroundColorForEvent:(id)a3 highlighted:(BOOL)a4 dimmed:(BOOL)a5 carplayMode:(BOOL)a6 dragPreview:(BOOL)a7;
@end

@implementation EKUIListViewCellBackground

- (EKUIListViewCellBackground)initWithCornerRadius:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKUIListViewCellBackground;
  v4 = [(EKUIListViewCellBackground *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_cornerRadius = a3;
    v6 = [(EKUIListViewCellBackground *)v4 layer];
    [(EKUIListViewCellBackground *)v5 _configureLayer:v6];
  }
  return v5;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)EKUIListViewCellBackground;
  [(EKUIListViewCellBackground *)&v4 layoutSubviews];
  v3 = [(EKUIListViewCellBackground *)self layer];
  [(EKUIListViewCellBackground *)self _configureLayer:v3];
}

- (void)layoutSublayersOfLayer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EKUIListViewCellBackground;
  [(EKUIListViewCellBackground *)&v15 layoutSublayersOfLayer:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = objc_msgSend(v4, "sublayers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        [v4 bounds];
        objc_msgSend(v10, "setFrame:");
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (BOOL)drawsBackgroundForEvent:(id)a3
{
  id v3 = a3;
  char v4 = CUIKEventDisplaysAsNeedsReply();
  uint64_t v5 = [v3 status];
  char v6 = CUIKEventDisplaysAsTentative();

  if (v5 == 3) {
    char v7 = 0;
  }
  else {
    char v7 = v4;
  }
  return v7 | v6;
}

- (void)updateBackgroundColorForEvent:(id)a3 highlighted:(BOOL)a4 dimmed:(BOOL)a5 carplayMode:(BOOL)a6 dragPreview:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v37 = a3;
  long long v12 = [v37 calendar];
  long long v13 = [v12 displayColor];
  long long v14 = [(EKUIListViewCellBackground *)self traitCollection];
  [v14 userInterfaceStyle];
  objc_super v15 = CUIKAdjustedColorForColor();

  if (v10)
  {
    id v16 = v15;
  }
  else
  {
    id v16 = [v15 colorWithAlphaComponent:0.3];
  }
  uint64_t v17 = v16;
  uint64_t v18 = [v37 status];
  if (!CUIKEventDisplaysAsNeedsReply() || v18 == 3)
  {
    if (!CUIKEventDisplaysAsTentative())
    {
      if (v8)
      {
        id v22 = v17;
      }
      else if (v7)
      {
        v36 = [(EKUIListViewCellBackground *)self traitCollection];
        [v36 userInterfaceStyle];
        CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v22 = 0;
      }
      [(EKUIListViewCellBackground *)self _updateBackgroundWithSolidColor:v22 stripedColor:0 highlighted:v10 dimmed:v9 carplayMode:v8];
      goto LABEL_22;
    }
    v23 = [(EKUIListViewCellBackground *)self traitCollection];
    [v23 userInterfaceStyle];
    CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      id v24 = v17;

      v25 = (void *)MEMORY[0x1E4FB1618];
      v26 = [(EKUIListViewCellBackground *)self _carplayAngledStripeBackgroundForHighlighted:v10];
      id v19 = [v25 colorWithPatternImage:v26];
      id v22 = v24;
    }
    else
    {
      v33 = (void *)MEMORY[0x1E4FB1618];
      v34 = objc_opt_class();
      v26 = [(EKUIListViewCellBackground *)self traitCollection];
      v35 = [v34 _angledStripeBackground:v26];
      id v19 = [v33 colorWithPatternImage:v35];
    }
    v30 = self;
    id v31 = v22;
    id v32 = v19;
  }
  else
  {
    if (v8)
    {
      id v19 = v17;
      v20 = (void *)MEMORY[0x1E4FB1618];
      v21 = [(EKUIListViewCellBackground *)self _carplayAngledStripeBackgroundForHighlighted:v10];
      id v22 = [v20 colorWithPatternImage:v21];
    }
    else
    {
      v27 = (void *)MEMORY[0x1E4FB1618];
      v28 = objc_opt_class();
      v21 = [(EKUIListViewCellBackground *)self traitCollection];
      v29 = [v28 _angledStripeBackground:v21];
      id v22 = [v27 colorWithPatternImage:v29];

      id v19 = 0;
    }

    v30 = self;
    id v31 = v19;
    id v32 = v22;
  }
  [(EKUIListViewCellBackground *)v30 _updateBackgroundWithSolidColor:v31 stripedColor:v32 highlighted:v10 dimmed:v9 carplayMode:v8];

LABEL_22:
}

- (void)_configureLayer:(id)a3
{
  id v6 = a3;
  double cornerRadius = self->_cornerRadius;
  if (cornerRadius == 0.0)
  {
    [(EKUIListViewCellBackground *)self bounds];
    double cornerRadius = v5 * 0.5;
  }
  [v6 setCornerRadius:cornerRadius];
}

- (void)_updateBackgroundWithSolidColor:(id)a3 stripedColor:(id)a4 highlighted:(BOOL)a5 dimmed:(BOOL)a6 carplayMode:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (v8)
  {
    double v14 = *MEMORY[0x1E4F57AA8];
    uint64_t v15 = objc_msgSend(v12, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E4F57AA8]);

    uint64_t v16 = objc_msgSend(v13, "cuik_colorWithAlphaScaled:", v14);

    id v13 = (id)v16;
    id v12 = (id)v15;
  }
  uint64_t v17 = [(EKUIListViewCellBackground *)self layer];
  uint64_t v18 = [v17 sublayers];
  id v19 = (void *)[v18 copy];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v24++) removeFromSuperlayer];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v22);
  }

  v25 = [(EKUIListViewCellBackground *)self _backgroundViewFilterForHighlighted:v9 carplayMode:v7];
  uint64_t v26 = [(EKUIListViewCellBackground *)self _backgroundViewFilterColorForHighlighted:v9 carplayMode:v7];
  v27 = (void *)v26;
  if (v25 && v26)
  {
    v28 = objc_opt_new();
    [(EKUIListViewCellBackground *)self _configureLayer:v28];
    [v28 setCompositingFilter:v25];
    objc_msgSend(v28, "setBackgroundColor:", objc_msgSend(v27, "CGColor"));
    v29 = [(EKUIListViewCellBackground *)self layer];
    [v29 addSublayer:v28];
  }
  [(EKUIListViewCellBackground *)self setBackgroundColor:v12];
  if (v13)
  {
    v30 = objc_opt_new();
    [(EKUIListViewCellBackground *)self _configureLayer:v30];
    objc_msgSend(v30, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));
    CATransform3DMakeScale(&v32, 1.0, -1.0, 1.0);
    [v30 setTransform:&v32];
    id v31 = [(EKUIListViewCellBackground *)self layer];
    [v31 addSublayer:v30];
  }
  [(EKUIListViewCellBackground *)self setNeedsLayout];
}

- (id)_carplayAngledStripeBackgroundForHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [MEMORY[0x1E4FB1618] clearColor];
  if (v3) {
    double v5 = @"carplayNeedsReplyStripeColorHighlighted";
  }
  else {
    double v5 = @"carplayNeedsReplyStripeColor";
  }
  id v6 = [MEMORY[0x1E4FB1618] colorNamed:v5];
  EKUIScaleFactor();
  BOOL v7 = CUIKCreateStripedUIImage();
  BOOL v8 = objc_msgSend(v7, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  return v8;
}

+ (id)_angledStripeBackground:(id)a3
{
  id v3 = a3;
  if (!_angledStripeBackground__imageCache)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    double v5 = (void *)_angledStripeBackground__imageCache;
    _angledStripeBackground__imageCache = v4;
  }
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", objc_msgSend(v3, "userInterfaceStyle"));
  BOOL v7 = [(id)_angledStripeBackground__imageCache objectForKey:v6];
  if (!v7)
  {
    BOOL v8 = [MEMORY[0x1E4FB1618] clearColor];
    BOOL v9 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    EKUIScaleFactor();
    BOOL v10 = CUIKCreateStripedUIImage();
    BOOL v7 = objc_msgSend(v10, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

    [(id)_angledStripeBackground__imageCache setObject:v7 forKey:v6];
  }

  return v7;
}

- (id)_backgroundViewFilterColorForHighlighted:(BOOL)a3 carplayMode:(BOOL)a4
{
  uint64_t v4 = 0;
  if (a3 && a4)
  {
    double v5 = [(EKUIListViewCellBackground *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];

    if (v6 == 1)
    {
      BOOL v7 = [MEMORY[0x1E4FB1618] blackColor];
      BOOL v8 = v7;
      double v9 = 0.3;
    }
    else
    {
      BOOL v7 = [MEMORY[0x1E4FB1618] whiteColor];
      BOOL v8 = v7;
      double v9 = 0.1;
    }
    uint64_t v4 = [v7 colorWithAlphaComponent:v9];
  }

  return v4;
}

- (id)_backgroundViewFilterForHighlighted:(BOOL)a3 carplayMode:(BOOL)a4
{
  uint64_t v6 = 0;
  if (a3 && a4)
  {
    BOOL v7 = [(EKUIListViewCellBackground *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceStyle];

    double v9 = (void *)MEMORY[0x1E4F3A248];
    if (v8 == 1) {
      double v9 = (void *)MEMORY[0x1E4F3A240];
    }
    uint64_t v6 = [MEMORY[0x1E4F39BC0] filterWithType:*v9];
    uint64_t v4 = vars8;
  }
  return v6;
}

@end