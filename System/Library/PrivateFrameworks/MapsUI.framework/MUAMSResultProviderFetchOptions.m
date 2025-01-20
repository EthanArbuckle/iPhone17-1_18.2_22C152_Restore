@interface MUAMSResultProviderFetchOptions
- (CGSize)artworkSize;
- (MUAMSResultProviderFetchOptions)initWithDisplayScale:(double)a3 artworkSize:(CGSize)a4 source:(int64_t)a5;
- (double)displayScale;
- (int64_t)source;
- (void)setArtworkSize:(CGSize)a3;
- (void)setDisplayScale:(double)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation MUAMSResultProviderFetchOptions

- (MUAMSResultProviderFetchOptions)initWithDisplayScale:(double)a3 artworkSize:(CGSize)a4 source:(int64_t)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v10.receiver = self;
  v10.super_class = (Class)MUAMSResultProviderFetchOptions;
  result = [(MUAMSResultProviderFetchOptions *)&v10 init];
  if (result)
  {
    result->_displayScale = a3;
    result->_artworkSize.CGFloat width = width;
    result->_artworkSize.CGFloat height = height;
    result->_source = a5;
  }
  return result;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (CGSize)artworkSize
{
  double width = self->_artworkSize.width;
  double height = self->_artworkSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setArtworkSize:(CGSize)a3
{
  self->_artworkSize = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

@end