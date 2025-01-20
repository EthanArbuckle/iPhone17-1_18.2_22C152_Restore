@interface MUDisclosureActionViewModel
- (NSString)titleString;
- (UIColor)imageTintColor;
- (UIImage)image;
- (id)actionBlock;
- (void)setActionBlock:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setTitleString:(id)a3;
@end

@implementation MUDisclosureActionViewModel

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end