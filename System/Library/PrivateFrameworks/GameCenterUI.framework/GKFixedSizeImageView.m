@interface GKFixedSizeImageView
- (UIImage)actualImage;
- (id)image;
- (void)setActualImage:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation GKFixedSizeImageView

- (id)image
{
  return self->_actualImage;
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_actualImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_actualImage, a3);
    v6 = [(UIImage *)self->_actualImage CGImage];
    v7 = [(GKFixedSizeImageView *)self layer];
    [v7 setContents:v6];

    [(UIView *)self _gkSetNeedsRender];
    v5 = v8;
  }
}

- (UIImage)actualImage
{
  return self->_actualImage;
}

- (void)setActualImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end