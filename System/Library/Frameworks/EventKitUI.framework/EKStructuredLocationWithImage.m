@interface EKStructuredLocationWithImage
- (EKStructuredLocation)location;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation EKStructuredLocationWithImage

- (EKStructuredLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
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

  objc_storeStrong((id *)&self->_location, 0);
}

@end