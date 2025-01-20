@interface HUIconPickerCell
- (HFImageIconDescriptor)iconDescriptor;
- (HUIconPickerCell)initWithFrame:(CGRect)a3;
- (HUIconView)iconView;
- (UIColor)selectedTintColor;
- (id)_iconTintColor;
- (void)_updateIconDescriptor:(id)a3;
- (void)layoutSubviews;
- (void)setIconDescriptor:(id)a3 andSelectedTintColor:(id)a4;
- (void)setIconView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedTintColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HUIconPickerCell

- (HUIconPickerCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)HUIconPickerCell;
  v3 = -[HUIconPickerCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6A428]);
    [(HUIconPickerCell *)v3 bounds];
    v5 = objc_msgSend(v4, "initWithFrame:contentMode:", 1);
    [(HUIconPickerCell *)v3 setIconView:v5];

    v6 = [(HUIconPickerCell *)v3 iconView];
    [v6 setIconSize:5];

    v7 = [(HUIconPickerCell *)v3 iconView];
    [v7 setUserInteractionEnabled:0];

    v8 = [(HUIconPickerCell *)v3 iconView];
    [v8 setDisableContinuousAnimation:1];

    v9 = [(HUIconPickerCell *)v3 contentView];
    v10 = [(HUIconPickerCell *)v3 iconView];
    [v9 addSubview:v10];

    id v11 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(HUIconPickerCell *)v3 bounds];
    v12 = objc_msgSend(v11, "initWithFrame:");
    [(HUIconPickerCell *)v3 setSelectedBackgroundView:v12];

    v13 = [(HUIconPickerCell *)v3 selectedBackgroundView];
    v14 = [v13 layer];
    [v14 setCornerRadius:7.0];

    v15 = [(HUIconPickerCell *)v3 selectedBackgroundView];
    v16 = [v15 layer];
    [v16 setMasksToBounds:1];

    v17 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    v18 = [(HUIconPickerCell *)v3 selectedBackgroundView];
    [v18 setBackgroundColor:v17];
  }
  return v3;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)HUIconPickerCell;
  [(HUIconPickerCell *)&v8 layoutSubviews];
  [(HUIconPickerCell *)self bounds];
  CGRect v10 = CGRectInset(v9, 5.0, 5.0);
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  v7 = [(HUIconPickerCell *)self iconView];
  objc_msgSend(v7, "setFrame:", x, y, width, height);
}

- (void)_updateIconDescriptor:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F42A98];
  uint64_t v5 = *MEMORY[0x1E4F43870];
  id v6 = a3;
  v7 = [v4 configurationWithTextStyle:v5];
  id v11 = [v6 imageIconDescriptorWithUpdatedImageSymbolConfiguration:v7];

  objc_super v8 = [(HUIconPickerCell *)self iconView];
  [v8 updateWithIconDescriptor:v11 displayStyle:1 animated:1];

  CGRect v9 = [(HUIconPickerCell *)self _iconTintColor];
  CGRect v10 = [(HUIconPickerCell *)self iconView];
  [v10 setTintColor:v9];
}

- (void)setSelected:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUIconPickerCell;
  [(HUIconPickerCell *)&v5 setSelected:a3];
  id v4 = [(HUIconPickerCell *)self iconDescriptor];
  [(HUIconPickerCell *)self _updateIconDescriptor:v4];
}

- (void)setSelectedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTintColor, a3);
  id v4 = [(HUIconPickerCell *)self iconDescriptor];
  [(HUIconPickerCell *)self _updateIconDescriptor:v4];
}

- (HFImageIconDescriptor)iconDescriptor
{
  objc_opt_class();
  v3 = [(HUIconPickerCell *)self iconView];
  id v4 = [v3 iconDescriptor];
  if (objc_opt_isKindOfClass()) {
    objc_super v5 = v4;
  }
  else {
    objc_super v5 = 0;
  }
  id v6 = v5;

  return (HFImageIconDescriptor *)v6;
}

- (id)_iconTintColor
{
  v3 = [(HUIconPickerCell *)self traitCollection];
  if ([v3 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4F428B8] systemDarkMidGrayColor];
  }
  else {
  id v4 = [MEMORY[0x1E4F428B8] systemDarkLightMidGrayColor];
  }

  if ([(HUIconPickerCell *)self isSelected])
  {
    id v5 = [(HUIconPickerCell *)self selectedTintColor];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (void)setIconDescriptor:(id)a3 andSelectedTintColor:(id)a4
{
  objc_storeStrong((id *)&self->_selectedTintColor, a4);
  id v6 = a3;
  [(HUIconPickerCell *)self _updateIconDescriptor:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = [(HUIconPickerCell *)self _iconTintColor];
  id v4 = [(HUIconPickerCell *)self iconView];
  [v4 setTintColor:v5];
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedTintColor, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end