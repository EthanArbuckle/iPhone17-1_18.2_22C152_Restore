@interface MUScrollableStackView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (MUScrollableStackView)initWithFrame:(CGRect)a3;
- (NSArray)arrangedSubviews;
- (UIEdgeInsets)contentEdgeInsets;
- (double)spacing;
- (id)addArrangedCardShadowViewForView:(id)a3;
- (int64_t)alignment;
- (int64_t)axis;
- (int64_t)distribution;
- (void)_setupViews;
- (void)_updateForHorizontalAxisIfNeeded;
- (void)_updateOrientationWithNewAxis:(int64_t)a3;
- (void)addArrangedSubview:(id)a3;
- (void)addArrangedSubview:(id)a3 withCustomSpacing:(double)a4;
- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4;
- (void)layoutSubviews;
- (void)removeArrangedSubview:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setArrangedSubviews:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setCustomSpacing:(double)a3 afterView:(id)a4;
- (void)setDistribution:(int64_t)a3;
- (void)setSpacing:(double)a3;
@end

@implementation MUScrollableStackView

- (MUScrollableStackView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MUScrollableStackView;
  v3 = -[MUScrollableStackView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUScrollableStackView *)v3 _setupViews];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(MUScrollableStackView *)v4 setAccessibilityIdentifier:v6];
  }
  return v4;
}

- (void)_setupViews
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v3 = [MUStackView alloc];
  v4 = -[MUStackView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  stackView = self->_stackView;
  self->_stackView = v4;

  [(MUStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUScrollableStackView *)self addSubview:self->_stackView];
  [(MUScrollableStackView *)self setScrollEnabled:1];
  [(MUScrollableStackView *)self setShowsHorizontalScrollIndicator:0];
  [(MUScrollableStackView *)self setClipsToBounds:0];
  v15 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(MUStackView *)self->_stackView leadingAnchor];
  v18 = [(MUScrollableStackView *)self leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v20[0] = v17;
  v16 = [(MUStackView *)self->_stackView trailingAnchor];
  v6 = [(MUScrollableStackView *)self trailingAnchor];
  v7 = [v16 constraintEqualToAnchor:v6];
  v20[1] = v7;
  objc_super v8 = [(MUStackView *)self->_stackView topAnchor];
  v9 = [(MUScrollableStackView *)self topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v20[2] = v10;
  v11 = [(MUStackView *)self->_stackView bottomAnchor];
  v12 = [(MUScrollableStackView *)self bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v20[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  [v15 activateConstraints:v14];

  [(MUScrollableStackView *)self _updateOrientationWithNewAxis:1];
}

- (int64_t)axis
{
  return [(MUStackView *)self->_stackView axis];
}

- (void)setDistribution:(int64_t)a3
{
}

- (int64_t)distribution
{
  return [(MUStackView *)self->_stackView distribution];
}

- (void)setAlignment:(int64_t)a3
{
}

- (int64_t)alignment
{
  return [(MUStackView *)self->_stackView alignment];
}

- (NSArray)arrangedSubviews
{
  return [(MUStackView *)self->_stackView arrangedSubviews];
}

- (void)addArrangedSubview:(id)a3
{
}

- (void)removeArrangedSubview:(id)a3
{
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setCustomSpacing:(double)a3 afterView:(id)a4
{
}

- (void)addArrangedSubview:(id)a3 withCustomSpacing:(double)a4
{
}

- (void)_updateOrientationWithNewAxis:(int64_t)a3
{
  [(MUStackView *)self->_stackView setAxis:a3];
  [(NSLayoutConstraint *)self->_axisConstraint setActive:0];
  int64_t v4 = [(MUScrollableStackView *)self axis];
  if (v4 == 1)
  {
    v5 = [(MUStackView *)self->_stackView widthAnchor];
    uint64_t v6 = [(MUScrollableStackView *)self widthAnchor];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    v5 = [(MUStackView *)self->_stackView heightAnchor];
    uint64_t v6 = [(MUScrollableStackView *)self heightAnchor];
  }
  v7 = (void *)v6;
  objc_super v8 = [v5 constraintEqualToAnchor:v6];
  axisConstraint = self->_axisConstraint;
  self->_axisConstraint = v8;

LABEL_6:
  v10 = self->_axisConstraint;
  [(NSLayoutConstraint *)v10 setActive:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MUScrollableStackView;
  [(MUScrollableStackView *)&v3 layoutSubviews];
  if (![(MUScrollableStackView *)self axis]) {
    [(MUScrollableStackView *)self _updateForHorizontalAxisIfNeeded];
  }
}

- (void)_updateForHorizontalAxisIfNeeded
{
  if (![(MUScrollableStackView *)self axis])
  {
    [(MUScrollableStackView *)self contentSize];
    if (self->_cachedContentSize.width != v4 || self->_cachedContentSize.height != v3)
    {
      [(MUScrollableStackView *)self contentSize];
      self->_cachedContentSize.width = v6;
      self->_cachedContentSize.height = v7;
      if ([(UIView *)self _mapsui_isRTL])
      {
        [(MUScrollableStackView *)self contentSize];
        double v9 = v8;
        [(MUScrollableStackView *)self frame];
        double v10 = v9 - CGRectGetWidth(v12);
        -[MUScrollableStackView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v10, 0.0);
      }
    }
  }
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (![(MUScrollableStackView *)self axis])
  {
    [(MUScrollableStackView *)self frame];
    double height = CGRectGetHeight(v7);
  }
  v6.receiver = self;
  v6.super_class = (Class)MUScrollableStackView;
  -[MUScrollableStackView setContentSize:](&v6, sel_setContentSize_, width, height);
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)contentEdgeInsets
{
  [(MUStackView *)self->_stackView contentEdgeInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setArrangedSubviews:(id)a3
{
}

- (void)setSpacing:(double)a3
{
}

- (double)spacing
{
  [(MUStackView *)self->_stackView spacing];
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(MUStackView *)self->_stackView intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[MUStackView sizeThatFits:](self->_stackView, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  -[MUStackView systemLayoutSizeFittingSize:](self->_stackView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  -[MUStackView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_stackView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (id)addArrangedCardShadowViewForView:(id)a3
{
  id v4 = a3;
  double v5 = [[MUPlatterView alloc] initWithContentView:v4];

  [(MUScrollableStackView *)self addArrangedSubview:v5];
  return v5;
}

@end