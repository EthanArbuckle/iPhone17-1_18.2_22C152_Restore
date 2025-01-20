@interface NTK_PUPhotoEditBaseAdjustmentCell
- (BOOL)isEnabled;
- (BOOL)isUserModifying;
- (NSString)imageName;
- (NTK_PUPhotoEditAdjustmentControl)containerButton;
- (NTK_PUPhotoEditBaseAdjustmentCell)initWithCoder:(id)a3;
- (NTK_PUPhotoEditBaseAdjustmentCell)initWithFrame:(CGRect)a3;
- (UIImage)ntk_image;
- (double)defaultValue;
- (double)identityValue;
- (double)maxValue;
- (double)minValue;
- (double)value;
- (id)focusEffect;
- (void)_setupContainerButton;
- (void)layoutSubviews;
- (void)ntk_setImage:(id)a3;
- (void)prepareForReuse;
- (void)resetToDefault;
- (void)setContainerButton:(id)a3;
- (void)setDefaultValue:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentityValue:(double)a3;
- (void)setImageName:(id)a3;
- (void)setIsUserModifying:(BOOL)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setValue:(double)a3;
@end

@implementation NTK_PUPhotoEditBaseAdjustmentCell

- (NTK_PUPhotoEditBaseAdjustmentCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTK_PUPhotoEditBaseAdjustmentCell;
  v3 = -[NTK_PUPhotoEditBaseAdjustmentCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    sub_2640C(v3);
  }
  return v4;
}

- (NTK_PUPhotoEditBaseAdjustmentCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTK_PUPhotoEditBaseAdjustmentCell;
  v3 = [(NTK_PUPhotoEditBaseAdjustmentCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    sub_2640C(v3);
  }
  return v4;
}

- (void)_setupContainerButton
{
  [(NTK_PUPhotoEditBaseAdjustmentCell *)self bounds];
  v7 = -[NTK_PUPhotoEditAdjustmentControl initWithFrame:]([NTK_PUPhotoEditAdjustmentControl alloc], "initWithFrame:", v3, v4, v5, v6);
  containerButton = self->_containerButton;
  self->_containerButton = v7;

  [(NTK_PUPhotoEditAdjustmentControl *)self->_containerButton setUserInteractionEnabled:0];
  id v9 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self contentView];
  [v9 addSubview:self->_containerButton];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)NTK_PUPhotoEditBaseAdjustmentCell;
  [(NTK_PUPhotoEditBaseAdjustmentCell *)&v5 prepareForReuse];
  double v3 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v3 resetToDefaults];

  double v4 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setUserInteractionEnabled:0];

  [(NTK_PUPhotoEditBaseAdjustmentCell *)self setIsUserModifying:0];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTK_PUPhotoEditBaseAdjustmentCell;
  [(NTK_PUPhotoEditBaseAdjustmentCell *)&v12 layoutSubviews];
  [(NTK_PUPhotoEditBaseAdjustmentCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (id)focusEffect
{
  return 0;
}

- (void)setValue:(double)a3
{
  id v4 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setValue:a3];
}

- (double)value
{
  v2 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (void)setDefaultValue:(double)a3
{
  id v4 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setDefaultValue:a3];
}

- (double)defaultValue
{
  v2 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 defaultValue];
  double v4 = v3;

  return v4;
}

- (void)setIdentityValue:(double)a3
{
  id v4 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setIdentityValue:a3];
}

- (double)identityValue
{
  v2 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 identityValue];
  double v4 = v3;

  return v4;
}

- (void)setMinValue:(double)a3
{
  id v4 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setMinValue:a3];
}

- (double)minValue
{
  v2 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 minValue];
  double v4 = v3;

  return v4;
}

- (void)setMaxValue:(double)a3
{
  id v4 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setMaxValue:a3];
}

- (double)maxValue
{
  v2 = [(NTK_PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v2 maxValue];
  double v4 = v3;

  return v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTK_PUPhotoEditBaseAdjustmentCell;
  -[NTK_PUPhotoEditBaseAdjustmentCell setSelected:](&v7, "setSelected:");
  double v5 = +[PUPhotoEditProtoSettings sharedInstance];
  unsigned int v6 = [v5 alwaysShowValueWhenAdjustmentIsSelected];

  [(NTK_PUPhotoEditBaseAdjustmentCell *)self setIsUserModifying:v3 & v6];
}

- (void)resetToDefault
{
  [(NTK_PUPhotoEditBaseAdjustmentCell *)self defaultValue];

  -[NTK_PUPhotoEditBaseAdjustmentCell setValue:](self, "setValue:");
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (UIImage)ntk_image
{
  return self->_ntk_image;
}

- (void)ntk_setImage:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isUserModifying
{
  return self->_isUserModifying;
}

- (void)setIsUserModifying:(BOOL)a3
{
  self->_isUserModifying = a3;
}

- (NTK_PUPhotoEditAdjustmentControl)containerButton
{
  return self->_containerButton;
}

- (void)setContainerButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerButton, 0);
  objc_storeStrong((id *)&self->_ntk_image, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

@end