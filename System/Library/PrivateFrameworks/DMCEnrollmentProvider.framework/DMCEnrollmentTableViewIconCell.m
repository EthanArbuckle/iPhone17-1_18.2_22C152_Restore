@interface DMCEnrollmentTableViewIconCell
- (DMCEnrollmentTableViewIconCell)initWithIconImages:(id)a3 layoutStyle:(unint64_t)a4;
- (DMCEnrollmentTableViewIconCell)initWithIconNames:(id)a3;
- (DMCEnrollmentTableViewIconCell)initWithIconNames:(id)a3 layoutStyle:(unint64_t)a4;
- (NSArray)icons;
- (UIStackView)stackView;
- (double)_iconHeight;
- (double)_iconWidth;
- (double)cellHeight;
- (double)estimatedCellHeight;
- (id)_createImageViewWithImage:(id)a3;
- (id)_createStackViewWithViews:(id)a3;
- (id)_systemImageWithName:(id)a3;
- (unint64_t)layoutStyle;
- (void)_addConstraintsForStackView:(id)a3;
- (void)_updateImageViewsWithCount:(int64_t)a3;
- (void)layoutSubviews;
- (void)setIconImages:(id)a3;
- (void)setIconNames:(id)a3;
- (void)setIcons:(id)a3;
- (void)setLayoutStyle:(unint64_t)a3;
- (void)setStackView:(id)a3;
@end

@implementation DMCEnrollmentTableViewIconCell

- (DMCEnrollmentTableViewIconCell)initWithIconNames:(id)a3
{
  return [(DMCEnrollmentTableViewIconCell *)self initWithIconNames:a3 layoutStyle:0];
}

- (DMCEnrollmentTableViewIconCell)initWithIconNames:(id)a3 layoutStyle:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = -[DMCEnrollmentTableViewIconCell _systemImageWithName:](self, "_systemImageWithName:", *(void *)(*((void *)&v16 + 1) + 8 * v12), (void)v16);
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = [(DMCEnrollmentTableViewIconCell *)self initWithIconImages:v7 layoutStyle:a4];
  return v14;
}

- (DMCEnrollmentTableViewIconCell)initWithIconImages:(id)a3 layoutStyle:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  v26.receiver = self;
  v26.super_class = (Class)DMCEnrollmentTableViewIconCell;
  uint64_t v9 = [(DMCEnrollmentTableViewIconCell *)&v26 initWithStyle:0 reuseIdentifier:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(DMCEnrollmentTableViewIconCell *)v9 setBackgroundColor:v10];

    [(DMCEnrollmentTableViewIconCell *)v9 setSelectionStyle:0];
    v9->_layoutStyle = a4;
    uint64_t v11 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = -[DMCEnrollmentTableViewIconCell _createImageViewWithImage:](v9, "_createImageViewWithImage:", *(void *)(*((void *)&v22 + 1) + 8 * v16), (void)v22);
          [v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [(DMCEnrollmentTableViewIconCell *)v9 _createStackViewWithViews:v11];
    long long v19 = [(DMCEnrollmentTableViewIconCell *)v9 contentView];
    [v19 addSubview:v18];

    [(DMCEnrollmentTableViewIconCell *)v9 _addConstraintsForStackView:v18];
    stackView = v9->_stackView;
    v9->_stackView = (UIStackView *)v18;
  }
  return v9;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DMCEnrollmentTableViewIconCell;
  [(DMCEnrollmentTableViewIconCell *)&v3 layoutSubviews];
  [(DMCEnrollmentTableViewIconCell *)self setUserInteractionEnabled:0];
  [(DMCEnrollmentTableViewIconCell *)self bounds];
  -[DMCEnrollmentTableViewIconCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v4), 0.0, 0.0);
}

- (void)_updateImageViewsWithCount:(int64_t)a3
{
  v5 = [(DMCEnrollmentTableViewIconCell *)self stackView];
  id v6 = [v5 arrangedSubviews];
  uint64_t v7 = [v6 count];

  int64_t v8 = a3 - v7;
  if (a3 - v7 < 1)
  {
    if (v8 < 0)
    {
      uint64_t v12 = v7 - a3;
      do
      {
        uint64_t v13 = [(DMCEnrollmentTableViewIconCell *)self stackView];
        uint64_t v14 = [(DMCEnrollmentTableViewIconCell *)self stackView];
        uint64_t v15 = [v14 arrangedSubviews];
        uint64_t v16 = [v15 lastObject];
        [v13 removeArrangedSubview:v16];

        --v12;
      }
      while (v12);
    }
  }
  else
  {
    unint64_t v9 = v8 + 1;
    do
    {
      uint64_t v10 = [(DMCEnrollmentTableViewIconCell *)self stackView];
      uint64_t v11 = [(DMCEnrollmentTableViewIconCell *)self _createImageViewWithImage:0];
      [v10 addArrangedSubview:v11];

      --v9;
    }
    while (v9 > 1);
  }
}

- (void)setIconNames:(id)a3
{
  id v10 = a3;
  -[DMCEnrollmentTableViewIconCell _updateImageViewsWithCount:](self, "_updateImageViewsWithCount:", [v10 count]);
  CGRect v4 = [(DMCEnrollmentTableViewIconCell *)self stackView];
  v5 = [v4 arrangedSubviews];

  if ([v10 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v10 objectAtIndexedSubscript:v6];
      int64_t v8 = [(DMCEnrollmentTableViewIconCell *)self _systemImageWithName:v7];

      unint64_t v9 = [v5 objectAtIndexedSubscript:v6];
      [v9 setImage:v8];

      ++v6;
    }
    while ([v10 count] > v6);
  }
  [(DMCEnrollmentTableViewIconCell *)self setNeedsDisplay];
}

- (void)setIconImages:(id)a3
{
  id v9 = a3;
  -[DMCEnrollmentTableViewIconCell _updateImageViewsWithCount:](self, "_updateImageViewsWithCount:", [v9 count]);
  CGRect v4 = [(DMCEnrollmentTableViewIconCell *)self stackView];
  v5 = [v4 arrangedSubviews];

  if ([v9 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v9 objectAtIndexedSubscript:v6];
      int64_t v8 = [v5 objectAtIndexedSubscript:v6];
      [v8 setImage:v7];

      ++v6;
    }
    while ([v9 count] > v6);
  }
  [(DMCEnrollmentTableViewIconCell *)self setNeedsDisplay];
}

- (double)cellHeight
{
  [(DMCEnrollmentTableViewIconCell *)self _iconHeight];
  return v2 + 0.0 + 10.0;
}

- (double)estimatedCellHeight
{
  [(DMCEnrollmentTableViewIconCell *)self _iconHeight];
  return v2 + 0.0 + 10.0;
}

- (double)_iconWidth
{
  return 80.0;
}

- (double)_iconHeight
{
  unint64_t v2 = [(DMCEnrollmentTableViewIconCell *)self layoutStyle];
  double result = 80.0;
  if (v2 == 1) {
    return 38.0;
  }
  return result;
}

- (id)_systemImageWithName:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F1C6B0] _systemImageNamed:a3];
  CGRect v4 = (void *)MEMORY[0x263F1C6C8];
  v5 = [MEMORY[0x263F1C550] systemBlueColor];
  v12[0] = v5;
  unint64_t v6 = [MEMORY[0x263F1C550] systemBlueColor];
  uint64_t v7 = [v6 colorWithAlphaComponent:0.4];
  v12[1] = v7;
  int64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v9 = [v4 _configurationWithHierarchicalColors:v8];

  id v10 = [v3 imageWithConfiguration:v9];

  return v10;
}

- (id)_createImageViewWithImage:(id)a3
{
  CGRect v4 = (objc_class *)MEMORY[0x263F1C6D0];
  id v5 = a3;
  unint64_t v6 = (void *)[[v4 alloc] initWithImage:v5];

  objc_msgSend(v6, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = (void *)MEMORY[0x263F08938];
  [(DMCEnrollmentTableViewIconCell *)self _iconWidth];
  id v9 = [v7 constraintWithItem:v6 attribute:7 relatedBy:0 toItem:v6 attribute:7 multiplier:0.0 constant:v8];
  [v6 addConstraint:v9];

  id v10 = (void *)MEMORY[0x263F08938];
  [(DMCEnrollmentTableViewIconCell *)self _iconHeight];
  uint64_t v12 = [v10 constraintWithItem:v6 attribute:8 relatedBy:0 toItem:v6 attribute:8 multiplier:0.0 constant:v11];
  [v6 addConstraint:v12];

  [v6 setContentMode:1];
  return v6;
}

- (id)_createStackViewWithViews:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x263F1C9B8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithArrangedSubviews:v4];

  [v5 setAxis:0];
  [v5 setAlignment:3];
  [v5 setDistribution:4];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setSpacing:10.0];
  return v5;
}

- (void)_addConstraintsForStackView:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DMCEnrollmentTableViewIconCell *)self contentView];
  unint64_t v6 = (void *)MEMORY[0x263F08938];
  uint64_t v7 = [(DMCEnrollmentTableViewIconCell *)self contentView];
  double v8 = [v6 constraintWithItem:v4 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [v5 addConstraint:v8];

  uint64_t v16 = @"stackView";
  v17[0] = v4;
  id v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [(DMCEnrollmentTableViewIconCell *)self layoutStyle];
  unint64_t v10 = [(DMCEnrollmentTableViewIconCell *)self layoutStyle];
  double v11 = 10.0;
  if (v10 == 1) {
    double v11 = 0.0;
  }
  uint64_t v12 = (void *)MEMORY[0x263F08938];
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"V:|-%f-[stackView]-%f-|", 0, *(void *)&v11);
  uint64_t v14 = [v12 constraintsWithVisualFormat:v13 options:0 metrics:0 views:v9];

  uint64_t v15 = [(DMCEnrollmentTableViewIconCell *)self contentView];
  [v15 addConstraints:v14];
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (NSArray)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

@end