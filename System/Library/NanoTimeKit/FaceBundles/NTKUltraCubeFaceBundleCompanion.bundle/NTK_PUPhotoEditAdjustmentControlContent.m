@interface NTK_PUPhotoEditAdjustmentControlContent
- (UIColor)color;
- (UIImage)image;
- (void)setColor:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation NTK_PUPhotoEditAdjustmentControlContent

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end