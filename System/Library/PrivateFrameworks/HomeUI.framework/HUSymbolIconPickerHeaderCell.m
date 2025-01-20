@interface HUSymbolIconPickerHeaderCell
- (HUSymbolIconPickerHeaderCell)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (void)setIconDescriptor:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation HUSymbolIconPickerHeaderCell

- (HUSymbolIconPickerHeaderCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUSymbolIconPickerHeaderCell;
  v3 = -[HUSymbolIconPickerHeaderCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    [(HUSymbolIconPickerHeaderCell *)v3 bounds];
    v5 = objc_msgSend(v4, "initWithFrame:");
    [(HUSymbolIconPickerHeaderCell *)v3 setImageView:v5];

    v6 = [(HUSymbolIconPickerHeaderCell *)v3 imageView];
    [v6 setContentMode:1];

    v7 = [(HUSymbolIconPickerHeaderCell *)v3 contentView];
    v8 = [(HUSymbolIconPickerHeaderCell *)v3 imageView];
    [v7 addSubview:v8];
  }
  return v3;
}

- (void)setIconDescriptor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v14 = v4;
  if (objc_opt_isKindOfClass()) {
    v5 = v14;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 imageIdentifier];
  v8 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438F0]];
  v9 = [v6 imageSymbolConfiguration];
  objc_super v10 = [v8 configurationByApplyingConfiguration:v9];

  v11 = [MEMORY[0x1E4F42A80] _systemImageNamed:v7 withConfiguration:v10];
  v12 = [v11 imageWithRenderingMode:2];
  v13 = [(HUSymbolIconPickerHeaderCell *)self imageView];
  [v13 setImage:v12];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end