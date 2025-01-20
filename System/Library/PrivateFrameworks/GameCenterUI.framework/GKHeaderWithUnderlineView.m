@interface GKHeaderWithUnderlineView
+ (BOOL)requiresConstraintBasedLayout;
+ (id)macMetrics;
+ (id)padMetrics;
+ (id)phoneMetrics;
+ (void)initialize;
- (BOOL)allowsVibrancy;
- (BOOL)didSetupConstraints;
- (BOOL)drawsUnderline;
- (BOOL)isPinned;
- (BOOL)underlineHasRightMargin;
- (GKHeaderWithUnderlineView)initWithFrame:(CGRect)a3;
- (NSArray)gutterConstraints;
- (NSMutableDictionary)metrics;
- (UIImageView)shadowView;
- (UIView)pinnedBackdropView;
- (UIView)underlineView;
- (double)leadingMargin;
- (double)trailingMargin;
- (void)applyLayoutAttributes:(id)a3;
- (void)establishConstraints;
- (void)pinningStateChangedTo:(BOOL)a3;
- (void)setDidSetupConstraints:(BOOL)a3;
- (void)setGutterConstraints:(id)a3;
- (void)setIsPinned:(BOOL)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setMetrics:(id)a3;
- (void)setPinnedBackdropView:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setTrailingMargin:(double)a3;
- (void)setUnderlineHasRightMargin:(BOOL)a3;
- (void)setUnderlineView:(id)a3;
- (void)updateConstraints;
- (void)updateGutterConstraints;
@end

@implementation GKHeaderWithUnderlineView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (void)initialize
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  v7[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v4 = [v2 appearanceWhenContainedInInstancesOfClasses:v3];

  v5 = [(id)objc_opt_class() phoneMetrics];
  v6 = (void *)[v5 mutableCopy];

  [v4 setMetrics:v6];
}

+ (id)macMetrics
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v2 = NSNumber;
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  v5 = [v2 numberWithDouble:1.0 / v4];

  v8[0] = @"gutter";
  v8[1] = @"rightGutter";
  v9[0] = &unk_1F0812090;
  v9[1] = &unk_1F08120A8;
  v8[2] = @"labelSpacing";
  v8[3] = @"hairline";
  v9[2] = &unk_1F08120C0;
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)padMetrics
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v2 = NSNumber;
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  v5 = [v2 numberWithDouble:1.0 / v4];

  v8[0] = @"gutter";
  v8[1] = @"rightGutter";
  v9[0] = &unk_1F08120D8;
  v9[1] = &unk_1F08120A8;
  v8[2] = @"labelSpacing";
  v8[3] = @"hairline";
  v9[2] = &unk_1F08120C0;
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)phoneMetrics
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v2 = NSNumber;
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  v5 = [v2 numberWithDouble:1.0 / v4];

  v8[0] = @"gutter";
  v8[1] = @"rightGutter";
  v9[0] = &unk_1F08120A8;
  v9[1] = &unk_1F08120A8;
  v8[2] = @"labelSpacing";
  v8[3] = @"hairline";
  v9[2] = &unk_1F08120C0;
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (GKHeaderWithUnderlineView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)GKHeaderWithUnderlineView;
  v3 = -[GKHeaderWithUnderlineView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(GKHeaderWithUnderlineView *)v3 setOpaque:0];
    v5 = [MEMORY[0x1E4F639B0] sharedPalette];
    v6 = [v5 floatingHeaderViewBackgroundColor];
    [(GKHeaderWithUnderlineView *)v4 setBackgroundColor:v6];

    if ([(GKHeaderWithUnderlineView *)v4 drawsUnderline])
    {
      v7 = objc_alloc_init(GKHairlineView);
      underlineView = v4->_underlineView;
      v4->_underlineView = &v7->super;

      [(UIView *)v4->_underlineView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(GKHeaderWithUnderlineView *)v4 addSubview:v4->_underlineView];
    }
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    shadowView = v4->_shadowView;
    v4->_shadowView = v9;

    v11 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    [(UIImageView *)v4->_shadowView setBackgroundColor:v11];

    [(UIImageView *)v4->_shadowView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_shadowView setOpaque:0];
    [(UIImageView *)v4->_shadowView setAlpha:0.0];
    [(GKHeaderWithUnderlineView *)v4 addSubview:v4->_shadowView];
    v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    v13 = (void *)[v12 userInterfaceIdiom];

    if (v13 == (void *)1 && (!*MEMORY[0x1E4F63830] || *MEMORY[0x1E4F63A38]))
    {
      v12 = [(id)objc_opt_class() padMetrics];
      v14 = (void *)[v12 mutableCopy];
      int v15 = 1;
    }
    else
    {
      v13 = [(id)objc_opt_class() phoneMetrics];
      v14 = (void *)[v13 mutableCopy];
      int v15 = 0;
    }
    objc_storeStrong((id *)&v4->_metrics, v14);
    if (!v15) {
      v12 = v13;
    }

    uint64_t v16 = [MEMORY[0x1E4FB1EB0] _gkStandardBackdropView];
    pinnedBackdropView = v4->_pinnedBackdropView;
    v4->_pinnedBackdropView = (UIView *)v16;

    [(UIView *)v4->_pinnedBackdropView setAlpha:0.0];
    [(GKHeaderWithUnderlineView *)v4 insertSubview:v4->_pinnedBackdropView atIndex:0];
  }
  return v4;
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)GKHeaderWithUnderlineView;
  [(GKHeaderWithUnderlineView *)&v3 updateConstraints];
  if (!self->_didSetupConstraints)
  {
    [(GKHeaderWithUnderlineView *)self establishConstraints];
    self->_didSetupConstraints = 1;
  }
}

- (void)establishConstraints
{
  if ([(GKHeaderWithUnderlineView *)self drawsUnderline])
  {
    objc_super v3 = (void *)MEMORY[0x1E4F28DC8];
    metrics = self->_metrics;
    v5 = _NSDictionaryOfVariableBindings(&cfstr_Underlineview.isa, self->_underlineView, 0);
    v6 = [v3 constraintsWithVisualFormat:@"V:[_underlineView(hairline)]|" options:0 metrics:metrics views:v5];
    [(GKHeaderWithUnderlineView *)self addConstraints:v6];

    [(GKHeaderWithUnderlineView *)self updateGutterConstraints];
  }
  v7 = (void *)MEMORY[0x1E4F28DC8];
  v8 = self->_metrics;
  v9 = _NSDictionaryOfVariableBindings(&cfstr_Shadowview_0.isa, self->_shadowView, 0);
  v10 = [v7 constraintsWithVisualFormat:@"|[_shadowView]|" options:0 metrics:v8 views:v9];
  [(GKHeaderWithUnderlineView *)self addConstraints:v10];

  v11 = (void *)MEMORY[0x1E4F28DC8];
  v12 = self->_metrics;
  v13 = _NSDictionaryOfVariableBindings(&cfstr_Shadowview_0.isa, self->_shadowView, 0);
  v14 = [v11 constraintsWithVisualFormat:@"V:[_shadowView(hairline)]" options:0 metrics:v12 views:v13];
  [(GKHeaderWithUnderlineView *)self addConstraints:v14];

  int v15 = (void *)MEMORY[0x1E4F28DC8];
  shadowView = self->_shadowView;
  id v19 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:@"hairline"];
  [v19 floatValue];
  v18 = [v15 constraintWithItem:shadowView attribute:3 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:(float)-v17];
  [(GKHeaderWithUnderlineView *)self addConstraint:v18];
}

- (void)setUnderlineHasRightMargin:(BOOL)a3
{
  if (self->_underlineHasRightMargin != a3)
  {
    self->_underlineHasRightMargin = a3;
    [(GKHeaderWithUnderlineView *)self updateGutterConstraints];
  }
}

- (void)updateGutterConstraints
{
  if ([(GKHeaderWithUnderlineView *)self drawsUnderline])
  {
    if (self->_gutterConstraints) {
      -[GKHeaderWithUnderlineView removeConstraints:](self, "removeConstraints:");
    }
    BOOL underlineHasRightMargin = self->_underlineHasRightMargin;
    double v4 = (void *)MEMORY[0x1E4F28DC8];
    metrics = self->_metrics;
    v6 = _NSDictionaryOfVariableBindings(&cfstr_Underlineview.isa, self->_underlineView, 0);
    if (underlineHasRightMargin)
    {
      v7 = [v4 constraintsWithVisualFormat:@"|-(gutter)-[_underlineView]-(gutter)-|" options:0 metrics:metrics views:v6];
      [(GKHeaderWithUnderlineView *)self setGutterConstraints:v7];

      v8 = [(NSArray *)self->_gutterConstraints firstObject];
      v9 = [(NSArray *)self->_gutterConstraints lastObject];
      [(UICollectionReusableView *)self _gkSetLeadingGuideConstraint:v8 trailingGuideConstraint:v9];
    }
    else
    {
      v10 = [v4 constraintsWithVisualFormat:@"|-(gutter)-[_underlineView]|" options:0 metrics:metrics views:v6];
      [(GKHeaderWithUnderlineView *)self setGutterConstraints:v10];

      v8 = [(NSArray *)self->_gutterConstraints firstObject];
      [(UICollectionReusableView *)self _gkSetLeadingGuideConstraint:v8 trailingGuideConstraint:0];
    }

    [(GKHeaderWithUnderlineView *)self leadingMargin];
    double v12 = v11;
    [(GKHeaderWithUnderlineView *)self trailingMargin];
    if (v12 > 0.0 || v13 > 0.0) {
      [MEMORY[0x1E4FB1560] _gkAdjustConstraintMargins:self->_gutterConstraints leading:v12 trailing:v13];
    }
    gutterConstraints = self->_gutterConstraints;
    [(GKHeaderWithUnderlineView *)self addConstraints:gutterConstraints];
  }
}

- (BOOL)drawsUnderline
{
  return 1;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)GKHeaderWithUnderlineView;
  [(GKHeaderWithUnderlineView *)&v37 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    -[GKHeaderWithUnderlineView setIsPinned:](self, "setIsPinned:", [v5 isPinned]);
    if (self->_isPinned)
    {
      [v5 frame];
      double v7 = v6;
      v8 = [(GKHeaderWithUnderlineView *)self superview];
      objc_opt_class();
      double v9 = 0.0;
      if (objc_opt_isKindOfClass())
      {
        [v8 bounds];
        double v11 = v10;
        [v8 contentInset];
        double v13 = v11 + v12;
        double v14 = 0.0;
        if (v7 < v13) {
          double v14 = (double)((int)(v13 - v7) & ~((int)(v13 - v7) >> 31));
        }
        int v15 = [v8 collectionViewLayout];
        [v15 laidOutContentSize];
        double v17 = v16;
        [v8 contentSize];
        double v19 = v17 - v18;
        if (v18 <= v17) {
          double v19 = -0.0;
        }
        double v9 = v14 + v19;
      }
      [(GKHeaderWithUnderlineView *)self bounds];
      double v21 = v20;
      double v23 = v22;
      [(UIView *)self->_pinnedBackdropView frame];
      double v25 = v24;
      double v27 = v26;
      [(UIView *)self->_pinnedBackdropView frame];
      v39.origin.x = v28;
      v39.origin.y = v29;
      v39.size.width = v30;
      v39.size.height = v31;
      v38.origin.x = v25;
      v38.origin.y = v9 + v21;
      v38.size.width = v27;
      v38.size.height = v23 - v9;
      if (!CGRectEqualToRect(v38, v39)) {
        -[UIView setFrame:](self->_pinnedBackdropView, "setFrame:", v25, v9 + v21, v27, v23 - v9);
      }
    }
    if ([(GKHeaderWithUnderlineView *)self drawsUnderline])
    {
      [v5 leadingMargin];
      double v33 = v32;
      [v5 trailingMargin];
      double v35 = v34;
      [(GKHeaderWithUnderlineView *)self setLeadingMargin:v33];
      [(GKHeaderWithUnderlineView *)self setTrailingMargin:v35];
      v36 = [(GKHeaderWithUnderlineView *)self gutterConstraints];
      if (v36) {
        [MEMORY[0x1E4FB1560] _gkAdjustConstraintMargins:v36 leading:v33 trailing:v35];
      }
    }
  }
}

- (void)setIsPinned:(BOOL)a3
{
  if (self->_isPinned != a3)
  {
    BOOL v3 = a3;
    self->_isPinned = a3;
    if (!a3) {
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    id v5 = self;
    uint64_t v6 = [MEMORY[0x1E4FB1EC0] viewControllerForView:v5];
    if (v6)
    {
      double v7 = (void *)v6;
    }
    else
    {
      do
      {
        v8 = v5;
        id v5 = [(GKHeaderWithUnderlineView *)v5 superview];

        uint64_t v9 = [MEMORY[0x1E4FB1EC0] viewControllerForView:v5];
        if (v9) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = v5 == 0;
        }
      }
      while (!v10);
      double v7 = (void *)v9;
      if (!v9) {
        goto LABEL_15;
      }
    }
    double v11 = [v7 navigationController];
    if (v11)
    {
      double v12 = self->_pinnedBackdropView;
      double v13 = [v11 navigationBar];
      double v14 = [v13 _backdropViewLayerGroupName];
      [(UIView *)v12 setGroupName:v14];
    }
LABEL_15:

LABEL_16:
    [(UIView *)self->_pinnedBackdropView setAlpha:(double)v3];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__GKHeaderWithUnderlineView_setIsPinned___block_invoke;
    v15[3] = &unk_1E5F63D68;
    v15[4] = self;
    BOOL v16 = v3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v15 animations:0.3];
  }
}

uint64_t __41__GKHeaderWithUnderlineView_setIsPinned___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pinningStateChangedTo:*(unsigned __int8 *)(a1 + 40)];
}

- (void)pinningStateChangedTo:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)a3;
  [(UIImageView *)self->_shadowView setAlpha:(double)a3];
  [(UIView *)self->_underlineView setAlpha:(double)!v3];
  [(UIView *)self->_pinnedBackdropView setAlpha:v5];
  uint64_t v6 = [MEMORY[0x1E4F639B0] sharedPalette];
  id v8 = v6;
  if (v3) {
    [v6 pinnedHeaderViewBackgroundColor];
  }
  else {
  double v7 = [v6 floatingHeaderViewBackgroundColor];
  }
  [(GKHeaderWithUnderlineView *)self setBackgroundColor:v7];
}

- (BOOL)allowsVibrancy
{
  return self->_isPinned;
}

- (UIView)underlineView
{
  return self->_underlineView;
}

- (void)setUnderlineView:(id)a3
{
}

- (UIImageView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (BOOL)underlineHasRightMargin
{
  return self->_underlineHasRightMargin;
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (NSArray)gutterConstraints
{
  return self->_gutterConstraints;
}

- (void)setGutterConstraints:(id)a3
{
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (UIView)pinnedBackdropView
{
  return self->_pinnedBackdropView;
}

- (void)setPinnedBackdropView:(id)a3
{
}

- (BOOL)didSetupConstraints
{
  return self->_didSetupConstraints;
}

- (void)setDidSetupConstraints:(BOOL)a3
{
  self->_didSetupConstraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedBackdropView, 0);
  objc_storeStrong((id *)&self->_gutterConstraints, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);

  objc_storeStrong((id *)&self->_underlineView, 0);
}

@end