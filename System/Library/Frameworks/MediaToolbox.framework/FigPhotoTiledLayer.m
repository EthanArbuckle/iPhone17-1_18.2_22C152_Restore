@interface FigPhotoTiledLayer
- (CGSize)imageSize;
- (FigPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6;
- (FigPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 placeholderImage:(CGImage *)a5 screenSize:(CGSize)a6;
- (FigPhotoTiledLayer)initWithContainerURL:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6;
- (int64_t)imageOrientation;
- (void)dealloc;
- (void)flushCache;
- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4;
- (void)sizeToFit;
@end

@implementation FigPhotoTiledLayer

- (CGSize)imageSize
{
  [(CMPhotoTiledLayer *)self->_tiledLayer imageSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)imageOrientation
{
  return [(CMPhotoTiledLayer *)self->_tiledLayer imageOrientation];
}

- (FigPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v8 = a5.height;
  double v9 = a5.width;
  v14.receiver = self;
  v14.super_class = (Class)FigPhotoTiledLayer;
  v12 = [(FigPhotoTiledLayer *)&v14 init];
  if (v12) {
    v12->_tiledLayer = (CMPhotoTiledLayer *)objc_msgSend(objc_alloc(MEMORY[0x1E4F55F88]), "initWithContainerData:containerImageIndex:backgroundImageSize:screenSize:", a3, a4, v9, v8, width, height);
  }
  return v12;
}

- (FigPhotoTiledLayer)initWithContainerURL:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v8 = a5.height;
  double v9 = a5.width;
  v14.receiver = self;
  v14.super_class = (Class)FigPhotoTiledLayer;
  v12 = [(FigPhotoTiledLayer *)&v14 init];
  if (v12) {
    v12->_tiledLayer = (CMPhotoTiledLayer *)objc_msgSend(objc_alloc(MEMORY[0x1E4F55F88]), "initWithContainerURL:containerImageIndex:backgroundImageSize:screenSize:", a3, a4, v9, v8, width, height);
  }
  return v12;
}

- (FigPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 placeholderImage:(CGImage *)a5 screenSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  v13.receiver = self;
  v13.super_class = (Class)FigPhotoTiledLayer;
  v11 = [(FigPhotoTiledLayer *)&v13 init];
  if (v11) {
    v11->_tiledLayer = (CMPhotoTiledLayer *)objc_msgSend(objc_alloc(MEMORY[0x1E4F55F88]), "initWithContainerData:containerImageIndex:placeholderImage:screenSize:", a3, a4, a5, width, height);
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigPhotoTiledLayer;
  [(FigPhotoTiledLayer *)&v3 dealloc];
}

- (void)flushCache
{
}

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4
{
}

- (void)sizeToFit
{
}

@end