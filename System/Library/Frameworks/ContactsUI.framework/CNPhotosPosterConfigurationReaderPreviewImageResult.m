@interface CNPhotosPosterConfigurationReaderPreviewImageResult
- (CGSize)imageSize;
- (NSData)imageData;
- (void)setImageData:(id)a3;
- (void)setImageSize:(CGSize)a3;
@end

@implementation CNPhotosPosterConfigurationReaderPreviewImageResult

- (void).cxx_destruct
{
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end