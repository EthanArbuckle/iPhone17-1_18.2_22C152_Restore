@interface MUStackView
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (MUStackView)initWithFrame:(CGRect)a3;
- (NSArray)arrangedSubviews;
- (UIEdgeInsets)contentEdgeInsets;
- (double)spacing;
- (int64_t)alignment;
- (int64_t)axis;
- (int64_t)distribution;
- (void)_setupStackView;
- (void)addArrangedSubview:(id)a3;
- (void)addArrangedSubview:(id)a3 withCustomSpacing:(double)a4;
- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4;
- (void)invalidateIntrinsicContentSize;
- (void)removeArrangedSubview:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setArrangedSubviews:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setCustomSpacing:(double)a3 afterView:(id)a4;
- (void)setDistribution:(int64_t)a3;
- (void)setSpacing:(double)a3;
@end

@implementation MUStackView

- (MUStackView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MUStackView;
  v3 = -[MUStackView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUStackView *)v3 _setupStackView];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(MUStackView *)v4 setAccessibilityIdentifier:v6];
  }
  return v4;
}

- (void)_setupStackView
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  stackView = self->_stackView;
  self->_stackView = v4;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView set_mapsui_axis:1];
  [(MUStackView *)self addSubview:self->_stackView];
  v16 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(UIStackView *)self->_stackView leadingAnchor];
  v18 = [(MUStackView *)self leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v20[0] = v17;
  v6 = [(UIStackView *)self->_stackView trailingAnchor];
  v7 = [(MUStackView *)self trailingAnchor];
  objc_super v8 = [v6 constraintEqualToAnchor:v7];
  v20[1] = v8;
  v9 = [(UIStackView *)self->_stackView topAnchor];
  v10 = [(MUStackView *)self topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v20[2] = v11;
  v12 = [(UIStackView *)self->_stackView bottomAnchor];
  v13 = [(MUStackView *)self bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v20[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  [v16 activateConstraints:v15];
}

- (NSArray)arrangedSubviews
{
  return [(UIStackView *)self->_stackView arrangedSubviews];
}

- (void)addArrangedSubview:(id)a3
{
}

- (void)addArrangedSubview:(id)a3 withCustomSpacing:(double)a4
{
  stackView = self->_stackView;
  id v7 = a3;
  [(UIStackView *)stackView addArrangedSubview:v7];
  [(MUStackView *)self setCustomSpacing:v7 afterView:a4];
}

- (void)removeArrangedSubview:(id)a3
{
  stackView = self->_stackView;
  id v4 = a3;
  [(UIStackView *)stackView removeArrangedSubview:v4];
  [v4 removeFromSuperview];
}

- (void)setAxis:(int64_t)a3
{
}

- (int64_t)axis
{
  return [(UIStackView *)self->_stackView _mapsui_axis];
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setCustomSpacing:(double)a3 afterView:(id)a4
{
}

- (void)setAlignment:(int64_t)a3
{
}

- (int64_t)alignment
{
  return [(UIStackView *)self->_stackView _mapsui_alignment];
}

- (void)setDistribution:(int64_t)a3
{
}

- (int64_t)distribution
{
  return [(UIStackView *)self->_stackView _mapsui_distribution];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  -[UIStackView systemLayoutSizeFittingSize:](self->_stackView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  -[UIStackView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_stackView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UIStackView *)self->_stackView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)contentEdgeInsets
{
  [(UIStackView *)self->_stackView layoutMargins];
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
  [(UIStackView *)self->_stackView spacing];
  return result;
}

- (void).cxx_destruct
{
}

@end