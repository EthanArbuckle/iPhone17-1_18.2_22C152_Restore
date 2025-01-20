@interface CFXEffectPickerCollectionViewCell
- (BOOL)isAccessibilityElement;
- (CFXEffect)effect;
- (JFXImageView)imageView;
- (JTImage)image;
- (NSString)effectIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)awakeFromNib;
- (void)configureCellAppearence;
- (void)prepareForReuse;
- (void)setEffect:(id)a3;
- (void)setEffectIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation CFXEffectPickerCollectionViewCell

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)CFXEffectPickerCollectionViewCell;
  [(CFXEffectPickerCollectionViewCell *)&v3 awakeFromNib];
  [(CFXEffectPickerCollectionViewCell *)self configureCellAppearence];
}

- (void)configureCellAppearence
{
  objc_super v3 = [(CFXEffectPickerCollectionViewCell *)self imageView];
  v4 = [v3 layer];
  [v4 setCornerRadius:7.0];

  id v5 = [(CFXEffectPickerCollectionViewCell *)self imageView];
  [v5 setClipsToBounds:1];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CFXEffectPickerCollectionViewCell;
  [(CFXEffectPickerCollectionViewCell *)&v4 prepareForReuse];
  objc_super v3 = [(CFXEffectPickerCollectionViewCell *)self imageView];
  [v3 setJtImage:0];

  [(CFXEffectPickerCollectionViewCell *)self setEffect:0];
  [(CFXEffectPickerCollectionViewCell *)self setEffectIdentifier:0];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXEffectPickerCollectionViewCell *)self imageView];
  [v5 setJtImage:v4];
}

- (JTImage)image
{
  v2 = [(CFXEffectPickerCollectionViewCell *)self imageView];
  objc_super v3 = [v2 jtImage];

  return (JTImage *)v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v5.receiver = self;
  v5.super_class = (Class)CFXEffectPickerCollectionViewCell;
  v2 = [(CFXEffectPickerCollectionViewCell *)&v5 accessibilityLabel];
  objc_super v3 = [v2 lowercaseString];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CFXEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
}

- (NSString)effectIdentifier
{
  return self->_effectIdentifier;
}

- (void)setEffectIdentifier:(id)a3
{
}

- (JFXImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_effectIdentifier, 0);
  objc_storeStrong((id *)&self->_effect, 0);
}

@end