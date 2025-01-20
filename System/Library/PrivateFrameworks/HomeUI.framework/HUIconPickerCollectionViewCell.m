@interface HUIconPickerCollectionViewCell
- (HFIconDescriptor)iconDescriptor;
- (HUIconButton)iconButton;
- (HUIconPickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setIconButton:(id)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation HUIconPickerCollectionViewCell

- (HUIconPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUIconPickerCollectionViewCell;
  v3 = -[HUIconPickerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [HUIconButton alloc];
    [(HUIconPickerCollectionViewCell *)v3 bounds];
    v5 = -[HUIconButton initWithFrame:](v4, "initWithFrame:");
    [(HUIconPickerCollectionViewCell *)v3 setIconButton:v5];

    v6 = [(HUIconPickerCollectionViewCell *)v3 iconButton];
    [v6 setUserInteractionEnabled:0];

    v7 = [(HUIconPickerCollectionViewCell *)v3 contentView];
    v8 = [(HUIconPickerCollectionViewCell *)v3 iconButton];
    [v7 addSubview:v8];
  }
  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUIconPickerCollectionViewCell;
  [(HUIconPickerCollectionViewCell *)&v4 prepareForReuse];
  v3 = [(HUIconPickerCollectionViewCell *)self iconButton];
  [v3 updateWithIconDescriptor:0 animated:0];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)HUIconPickerCollectionViewCell;
  [(HUIconPickerCollectionViewCell *)&v8 layoutSubviews];
  [(HUIconPickerCollectionViewCell *)self bounds];
  CGRect v10 = CGRectInset(v9, 20.0, 20.0);
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  v7 = [(HUIconPickerCollectionViewCell *)self iconButton];
  objc_msgSend(v7, "setFrame:", x, y, width, height);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUIconPickerCollectionViewCell *)self iconButton];
  [v4 setSelected:v3];
}

- (HFIconDescriptor)iconDescriptor
{
  v2 = [(HUIconPickerCollectionViewCell *)self iconButton];
  BOOL v3 = [v2 iconDescriptor];

  return (HFIconDescriptor *)v3;
}

- (void)setIconDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(HUIconPickerCollectionViewCell *)self iconButton];
  [v5 updateWithIconDescriptor:v4 animated:1];
}

- (HUIconButton)iconButton
{
  return self->_iconButton;
}

- (void)setIconButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end