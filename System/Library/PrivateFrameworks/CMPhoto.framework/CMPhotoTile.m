@interface CMPhotoTile
- (BOOL)visible;
- (CGRect)contentsRect;
- (CGRect)imageRect;
- (__IOSurface)decodedSurface;
- (id)description;
- (id)key;
- (void)dealloc;
- (void)setContentsRect:(CGRect)a3;
- (void)setDecodedSurface:(__IOSurface *)a3;
- (void)setImageRect:(CGRect)a3;
- (void)setKey:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation CMPhotoTile

- (void)setDecodedSurface:(__IOSurface *)a3
{
  decodedSurface = self->_decodedSurface;
  if (decodedSurface != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      decodedSurface = self->_decodedSurface;
    }
    if (decodedSurface)
    {
      IOSurfaceDecrementUseCount(decodedSurface);
      v6 = self->_decodedSurface;
      if (v6) {
        CFRelease(v6);
      }
    }
    self->_decodedSurface = a3;
  }
}

- (void)dealloc
{
  [(CMPhotoTile *)self setKey:0];
  [(CMPhotoTile *)self setDecodedSurface:0];
  v3.receiver = self;
  v3.super_class = (Class)CMPhotoTile;
  [(CMPhotoTile *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t ID = IOSurfaceGetID([(CMPhotoTile *)self decodedSurface]);
  [(CMPhotoTile *)self imageRect];
  uint64_t v9 = _NSStringFromCGRect(v5, v6, v7, v8);
  [(CMPhotoTile *)self contentsRect];
  uint64_t v14 = _NSStringFromCGRect(v10, v11, v12, v13);
  BOOL v15 = [(CMPhotoTile *)self visible];
  v16 = @"NO";
  if (v15) {
    v16 = @"YES";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<CMPhotoTile: %p; surface %4x; imageRect %@; contentsRect %@, visible: %@",
               self,
               ID,
               v9,
               v14,
               v16);
}

- (__IOSurface)decodedSurface
{
  return self->_decodedSurface;
}

- (CGRect)imageRect
{
  double x = self->_imageRect.origin.x;
  double y = self->_imageRect.origin.y;
  double width = self->_imageRect.size.width;
  double height = self->_imageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageRect:(CGRect)a3
{
  self->_imageRect = a3;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (id)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

@end