@interface GKContiguousContainerView
+ (id)containerForViewsFontsLeadings:(id)a3 options:(int64_t)a4;
+ (id)containerViewForViews:(id)a3 overlap:(double)a4 vertical:(BOOL)a5;
+ (id)containerViewForViews:(id)a3 overlap:(double)a4 vertical:(BOOL)a5 applyOrthogonalConstraints:(BOOL)a6;
- (BOOL)applyOrthogonalConstraints;
- (BOOL)vertical;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)replaceableConstraints;
- (UIEdgeInsets)insets;
- (UIView)baselineView;
- (double)overlap;
- (id)viewForBaselineLayout;
- (void)_addContiguousSubviews:(id)a3;
- (void)replaceSubviews:(id)a3;
- (void)setApplyOrthogonalConstraints:(BOOL)a3;
- (void)setBaselineView:(id)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setOverlap:(double)a3;
- (void)setReplaceableConstraints:(id)a3;
- (void)setVertical:(BOOL)a3;
@end

@implementation GKContiguousContainerView

+ (id)containerViewForViews:(id)a3 overlap:(double)a4 vertical:(BOOL)a5
{
  return (id)[a1 containerViewForViews:a3 overlap:a5 vertical:1 applyOrthogonalConstraints:a4];
}

+ (id)containerViewForViews:(id)a3 overlap:(double)a4 vertical:(BOOL)a5 applyOrthogonalConstraints:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 setApplyOrthogonalConstraints:v6];
  [v11 setVertical:v7];
  [v11 setOverlap:a4];
  [v11 _addContiguousSubviews:v10];

  return v11;
}

+ (id)containerForViewsFontsLeadings:(id)a3 options:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__GKContiguousContainerView_containerForViewsFontsLeadings_options___block_invoke;
  v11[3] = &unk_1E5F64278;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v11];
  v8 = [MEMORY[0x1E4F28DC8] _gkBaselineConstraintsForViewsFontsLeadings:v5 superview:v7 options:a4];

  [v7 addConstraints:v8];
  id v9 = v7;

  return v9;
}

void __68__GKContiguousContainerView_containerForViewsFontsLeadings_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addSubview:v3];
  }
}

- (void)setOverlap:(double)a3
{
  if (self->_overlap != a3)
  {
    BOOL v5 = [(GKContiguousContainerView *)self vertical];
    replaceableConstraints = self->_replaceableConstraints;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__GKContiguousContainerView_setOverlap___block_invoke;
    v7[3] = &__block_descriptor_41_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
    BOOL v8 = v5;
    *(double *)&v7[4] = a3;
    [(NSArray *)replaceableConstraints enumerateObjectsUsingBlock:v7];
    self->_overlap = a3;
  }
}

void __40__GKContiguousContainerView_setOverlap___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (a3 >= 2)
  {
    int v6 = *(unsigned __int8 *)(a1 + 40);
    id v9 = v5;
    uint64_t v7 = [v5 firstAttribute];
    BOOL v8 = v6 ? v7 == 3 : v7 == 1;
    id v5 = v9;
    if (v8)
    {
      [v9 setConstant:-*(double *)(a1 + 32)];
      id v5 = v9;
    }
  }
}

- (void)setInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  p_insets = &self->_insets;
  double v8 = self->_insets.top;
  if (self->_insets.left != a3.left
    || v8 != top
    || self->_insets.right != a3.right
    || self->_insets.bottom != a3.bottom)
  {
    BOOL v13 = [(GKContiguousContainerView *)self vertical];
    replaceableConstraints = self->_replaceableConstraints;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__GKContiguousContainerView_setInsets___block_invoke;
    v15[3] = &__block_descriptor_65_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
    BOOL v16 = v13;
    *(double *)&v15[4] = top;
    *(CGFloat *)&v15[5] = left;
    *(CGFloat *)&v15[6] = bottom;
    *(CGFloat *)&v15[7] = right;
    [(NSArray *)replaceableConstraints enumerateObjectsUsingBlock:v15];
    p_insets->double top = top;
    p_insets->CGFloat left = left;
    p_insets->CGFloat bottom = bottom;
    p_insets->CGFloat right = right;
  }
}

void __39__GKContiguousContainerView_setInsets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v14 = v5;
  if (a3 == 1)
  {
    uint64_t v8 = 48;
    if (!*(unsigned char *)(a1 + 64)) {
      uint64_t v8 = 56;
    }
    double v9 = *(double *)(a1 + v8);
    goto LABEL_9;
  }
  if (!a3)
  {
    uint64_t v6 = 32;
    if (!*(unsigned char *)(a1 + 64)) {
      uint64_t v6 = 40;
    }
    double v7 = *(double *)(a1 + v6);
    goto LABEL_10;
  }
  int v11 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v12 = [v5 firstAttribute];
  if (!v11)
  {
    if (v12 == 3)
    {
      double v7 = *(double *)(a1 + 32);
      goto LABEL_10;
    }
    BOOL v13 = [v14 firstAttribute] == 4;
    id v10 = v14;
    if (!v13) {
      goto LABEL_11;
    }
    double v9 = *(double *)(a1 + 48);
LABEL_9:
    double v7 = -v9;
LABEL_10:
    [v14 setConstant:v7];
    id v10 = v14;
    goto LABEL_11;
  }
  if (v12 == 1)
  {
    double v7 = *(double *)(a1 + 40);
    goto LABEL_10;
  }
  BOOL v13 = [v14 firstAttribute] == 2;
  id v10 = v14;
  if (v13)
  {
    double v9 = *(double *)(a1 + 56);
    goto LABEL_9;
  }
LABEL_11:
}

- (void)_addContiguousSubviews:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__GKContiguousContainerView__addContiguousSubviews___block_invoke;
  v6[3] = &unk_1E5F66360;
  v6[4] = self;
  id v4 = a3;
  [v4 enumerateObjectsUsingBlock:v6];
  id v5 = objc_msgSend(MEMORY[0x1E4F28DC8], "_gkConstraintsForViews:contiguouslyLaidOutVertically:overlap:withinView:insets:applyOrthogonalConstraints:", v4, self->_vertical, self, self->_applyOrthogonalConstraints, self->_overlap, self->_insets.top, self->_insets.left, self->_insets.bottom, self->_insets.right);

  [(GKContiguousContainerView *)self setReplaceableConstraints:v5];
  if ([v5 count]) {
    [(GKContiguousContainerView *)self addConstraints:v5];
  }
}

uint64_t __52__GKContiguousContainerView__addContiguousSubviews___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSubview:a2];
}

- (void)replaceSubviews:(id)a3
{
  id v4 = a3;
  id v7 = [(GKContiguousContainerView *)self replaceableConstraints];
  if (v7) {
    [(GKContiguousContainerView *)self removeConstraints:v7];
  }
  id v5 = [(GKContiguousContainerView *)self subviews];
  uint64_t v6 = (void *)[v5 copy];

  [v6 enumerateObjectsUsingBlock:&__block_literal_global_43];
  [(GKContiguousContainerView *)self _addContiguousSubviews:v4];
}

uint64_t __45__GKContiguousContainerView_replaceSubviews___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (CGSize)intrinsicContentSize
{
  -[GKContiguousContainerView sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  id v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v6 = [(GKContiguousContainerView *)self subviews];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__GKContiguousContainerView_sizeThatFits___block_invoke;
  v12[3] = &unk_1E5F66388;
  *(CGFloat *)&v12[7] = width;
  *(CGFloat *)&v12[8] = height;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v17;
  [v6 enumerateObjectsUsingBlock:v12];
  if (v14[3] - (self->_insets.left + self->_insets.right) >= 0.0) {
    double v7 = v14[3] - (self->_insets.left + self->_insets.right);
  }
  else {
    double v7 = 0.0;
  }
  double v8 = self->_insets.top + self->_insets.bottom;
  if (v18[3] - v8 >= 0.0) {
    double v9 = v18[3] - v8;
  }
  else {
    double v9 = 0.0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  double v10 = v7;
  double v11 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

double __42__GKContiguousContainerView_sizeThatFits___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  double v6 = *(double *)(v5 + 24);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 408))
  {
    if (v6 >= v3) {
      double v3 = *(double *)(v5 + 24);
    }
    *(double *)(v5 + 24) = v3;
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
    double v3 = *(double *)(*(void *)(a1 + 32) + 424);
    if (v3 > v4) {
      double v3 = v4;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  else
  {
    *(double *)(v5 + 24) = v3 + v6;
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(double *)(v8 + 24) >= v4) {
      double v4 = *(double *)(v8 + 24);
    }
    *(double *)(v8 + 24) = v4;
    if (*(double *)(*(void *)(a1 + 32) + 424) <= v3) {
      double v3 = *(double *)(*(void *)(a1 + 32) + 424);
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  double result = *(double *)(v7 + 24) - v3;
  *(double *)(v7 + 24) = result;
  return result;
}

- (id)viewForBaselineLayout
{
  baselineView = self->_baselineView;
  if (baselineView)
  {
    double v4 = [(UIView *)baselineView superview];

    if (v4 != self)
    {
      uint64_t v5 = NSString;
      double v6 = [NSString stringWithFormat:@"Baseline view MUST be a subview of the container view."];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/NSLayoutConstraint+GKAdditions.m"];
      id v8 = [v7 lastPathComponent];
      double v9 = [v5 stringWithFormat:@"%@ ([_baselineView superview] == self)\n[%s (%s:%d)]", v6, "-[GKContiguousContainerView viewForBaselineLayout]", objc_msgSend(v8, "UTF8String"), 487];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
    }
    double v10 = self->_baselineView;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)GKContiguousContainerView;
    double v10 = [(GKContiguousContainerView *)&v12 viewForBaselineLayout];
  }

  return v10;
}

- (UIView)baselineView
{
  return self->_baselineView;
}

- (void)setBaselineView:(id)a3
{
  self->_baselineView = (UIView *)a3;
}

- (double)overlap
{
  return self->_overlap;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (BOOL)applyOrthogonalConstraints
{
  return self->_applyOrthogonalConstraints;
}

- (void)setApplyOrthogonalConstraints:(BOOL)a3
{
  self->_applyOrthogonalConstraints = a3;
}

- (NSArray)replaceableConstraints
{
  return self->_replaceableConstraints;
}

- (void)setReplaceableConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end