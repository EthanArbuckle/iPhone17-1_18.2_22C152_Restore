@interface QLTThumbnailOperation
- (NSError)error;
- (UIImage)image;
- (id)needsAdditionalTime;
- (void)setNeedsAdditionalTime:(id)a3;
@end

@implementation QLTThumbnailOperation

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 320, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 328, 1);
}

- (id)needsAdditionalTime
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setNeedsAdditionalTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_needsAdditionalTime, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end