@interface EKRecentContactWithImage
- (CRRecentContact)recent;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setRecent:(id)a3;
@end

@implementation EKRecentContactWithImage

- (CRRecentContact)recent
{
  return self->_recent;
}

- (void)setRecent:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_recent, 0);
}

@end