@interface CUINamedTexture
- (BOOL)_cacheRenditionProperties;
- (BOOL)isAlphaCropped;
- (BOOL)isOpaque;
- (CGRect)alphaCroppedRect;
- (CGSize)size;
- (CUINamedTexture)textureWithBufferAllocator:(id)a3;
- (double)scale;
- (id)description;
- (int)exifOrientation;
@end

@implementation CUINamedTexture

- (BOOL)_cacheRenditionProperties
{
  v12.receiver = self;
  v12.super_class = (Class)CUINamedTexture;
  LODWORD(v3) = [(CUINamedLookup *)&v12 _cacheRenditionProperties];
  if (v3)
  {
    v3 = [(CUINamedLookup *)self _rendition];
    if (v3)
    {
      v4 = v3;
      [(CUIThemeRendition *)v3 scale];
      self->_scale = v5;
      self->_textureProperties = (_cuintproperties)(*(_DWORD *)&self->_textureProperties & 0xFFFFFFF0 | [(CUIThemeRendition *)v4 exifOrientation] & 0xF);
      [(CUIThemeRendition *)v4 originalUncroppedSize];
      if (v7 == CGSizeZero.height && v6 == CGSizeZero.width) {
        int v9 = 0;
      }
      else {
        int v9 = 16;
      }
      self->_textureProperties = (_cuintproperties)(v9 | *(_DWORD *)&self->_textureProperties & 0xFFFFFFEF);
      if ([(CUIThemeRendition *)v4 isOpaque]) {
        int v10 = 32;
      }
      else {
        int v10 = 0;
      }
      self->_textureProperties = (_cuintproperties)(*(_DWORD *)&self->_textureProperties & 0xFFFFFFDF | v10);
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (CGSize)size
{
  objc_msgSend(-[CUIThemeRendition provideTextureInfo](-[CUINamedLookup _rendition](self, "_rendition"), "provideTextureInfo"), "dimensions");
  v4.i64[0] = v2;
  v4.i64[1] = v3;
  float64x2_t v5 = vcvtq_f64_u64(v4);
  double v6 = v5.f64[1];
  result.width = v5.f64[0];
  result.height = v6;
  return result;
}

- (CUINamedTexture)textureWithBufferAllocator:(id)a3
{
  float64x2_t v5 = [(CUINamedLookup *)self _rendition];
  if (!v5 || (id)[(CUIThemeRendition *)v5 type] != (id)1007) {
    return 0;
  }
  double v6 = objc_alloc_init(_CUTextureLink);
  [(_CUTextureLink *)v6 setNamedTexture:self];
  [(_CUTextureLink *)v6 setBufferAllocator:a3];
  id v7 = [objc_alloc((Class)TXRTexture) initWithDataSourceProvider:v6];
  v8 = v6;
  return (CUINamedTexture *)v7;
}

- (int)exifOrientation
{
  return (int)(*(_DWORD *)&self->_textureProperties << 28) >> 28;
}

- (BOOL)isOpaque
{
  return (*(unsigned char *)&self->_textureProperties >> 5) & 1;
}

- (BOOL)isAlphaCropped
{
  return (*(unsigned char *)&self->_textureProperties >> 4) & 1;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)CUINamedTexture;
  id v3 = [(CUINamedTexture *)&v11 description];
  [(CUINamedTexture *)self size];
  uint64_t v5 = v4;
  [(CUINamedTexture *)self size];
  id v7 = +[NSString stringWithFormat:@"width: %f height: %f", v5, v6];
  v8 = [(CUINamedLookup *)self name];
  [(CUINamedTexture *)self scale];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\n%@", v3, +[NSString stringWithFormat:@"Name: %@\nScale: %d\nSize: %@\nexifOrientation: %d,\nCropped: %d\nDisplay Gamut: %d", v8, (int)v9, v7, [(CUINamedTexture *)self exifOrientation], [(CUINamedTexture *)self isAlphaCropped], [(CUIRenditionKey *)[(CUINamedLookup *)self key] themeDisplayGamut]]);
}

- (CGRect)alphaCroppedRect
{
  unsigned int v2 = [(CUINamedLookup *)self _rendition];
  [(CUIThemeRendition *)v2 alphaCroppedRect];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)scale
{
  return self->_scale;
}

@end