@interface CKMacToolBarImageProperties
- (NSString)imageName;
- (UIColor)tintColor;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setImageName:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation CKMacToolBarImageProperties

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_imageName, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end