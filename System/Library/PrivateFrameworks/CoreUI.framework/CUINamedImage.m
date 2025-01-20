@interface CUINamedImage
- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentEdgeInsets;
- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets;
- (BOOL)_cacheRenditionProperties;
- (BOOL)hasAlignmentInformation;
- (BOOL)hasSliceInformation;
- (BOOL)isAlphaCropped;
- (BOOL)isFlippable;
- (BOOL)isStructured;
- (BOOL)isTemplate;
- (BOOL)isVectorBased;
- (BOOL)preservedVectorRepresentation;
- (CGImage)createImageFromPDFRenditionWithScale:(double)a3;
- (CGImage)croppedImage;
- (CGImage)image;
- (CGRect)alphaCroppedRect;
- (CGSize)originalUncroppedSize;
- (CGSize)size;
- (CUINamedImage)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5;
- (double)opacity;
- (double)positionOfSliceBoundary:(unsigned int)a3;
- (double)scale;
- (id)baseKey;
- (id)description;
- (int)blendMode;
- (int)exifOrientation;
- (int64_t)imageType;
- (int64_t)resizingMode;
- (int64_t)resizingModeWithSubtype:(int64_t)a3;
- (int64_t)templateRenderingMode;
@end

@implementation CUINamedImage

- (BOOL)_cacheRenditionProperties
{
  v28.receiver = self;
  v28.super_class = (Class)CUINamedImage;
  BOOL v3 = [(CUINamedLookup *)&v28 _cacheRenditionProperties];
  if (v3)
  {
    v4 = [(CUINamedLookup *)self _rendition];
    if (v4)
    {
      v5 = v4;
      unsigned int v6 = [(CUINamedLookup *)self _distilledInVersion];
      [(CUIThemeRendition *)v5 scale];
      self->_scale = v7;
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFFFE | [(CUIThemeRendition *)v5 isVectorBased]);
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFFFD | (2 * ([(CUIThemeRendition *)v5 type] != 0)));
      if (objc_msgSend(-[CUIThemeRendition metrics](v5, "metrics"), "hasAlignmentEdgeMargins")) {
        int v8 = 4;
      }
      else {
        int v8 = 0;
      }
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFFFB | v8);
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFFE7 | (8 * ([(CUINamedImage *)self resizingModeWithSubtype:[(CUIThemeRendition *)v5 subtype]] & 3)));
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFF0FF | (([(CUIThemeRendition *)v5 exifOrientation] & 0xF) << 8));
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFF1F | (32 * ([(CUIThemeRendition *)v5 templateRenderingMode] & 7)));
      [(CUIThemeRendition *)v5 originalUncroppedSize];
      if (v10 == CGSizeZero.height && v9 == CGSizeZero.width) {
        int v12 = 0;
      }
      else {
        int v12 = 4096;
      }
      self->_imageProperties = (_cuiniproperties)(v12 | *(_DWORD *)&self->_imageProperties & 0xFFFFEFFF);
      if ([(CUIThemeRendition *)v5 isFlippable]) {
        int v13 = 0x2000;
      }
      else {
        int v13 = 0;
      }
      unsigned int v14 = *(_DWORD *)&self->_imageProperties & 0xFFFFDFFF | v13;
      self->_imageProperties = (_cuiniproperties)v14;
      if (v6 - 461 > 0x17)
      {
        if ([(CUIThemeRendition *)v5 preservedVectorRepresentation]) {
          int v26 = 0x8000;
        }
        else {
          int v26 = 0;
        }
        _cuiniproperties v15 = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFF7FFF | v26);
      }
      else
      {
        _cuiniproperties v15 = (_cuiniproperties)(v14 | 0x8000);
      }
      self->_imageProperties = v15;
      LOBYTE(v3) = 1;
    }
    else
    {
      unint64_t v16 = [(CUINamedLookup *)self storageRef];
      v18 = (void *)_LookupStructuredThemeProvider(v16, v17);
      v19 = [(CUINamedLookup *)self name];
      [(CUINamedLookup *)self storageRef];
      objc_msgSend(objc_msgSend(v18, "themeStore"), "path");
      _CUILog(4, (uint64_t)"CoreUI: could not find rendition for '%@' in %d:'%@'", v20, v21, v22, v23, v24, v25, (uint64_t)v19);
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (int64_t)resizingModeWithSubtype:(int64_t)a3
{
  return (unint64_t)a3 > 0x1E || ((1 << a3) & 0x40900800) == 0;
}

- (double)scale
{
  return self->_scale;
}

- (CGImage)image
{
  v2 = [(CUINamedLookup *)self _rendition];
  return [(CUIThemeRendition *)v2 uncroppedImage];
}

- (CUINamedImage)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)CUINamedImage;
  unsigned int v6 = [(CUINamedLookup *)&v14 initWithName:a3 usingRenditionKey:a4 fromTheme:a5];
  if ((id)[(CUIThemeRendition *)[(CUINamedLookup *)v6 _rendition] type] == (id)1000)
  {
    _CUILog(4, (uint64_t)"CoreUI: attempting to lookup a named image '%@' with a type that is not a data type in the AssetCatalog", v7, v8, v9, v10, v11, v12, (uint64_t)a3);

    return 0;
  }
  return v6;
}

- (BOOL)hasSliceInformation
{
  return (*(unsigned char *)&self->_imageProperties >> 1) & 1;
}

- (int)exifOrientation
{
  return (*(_DWORD *)&self->_imageProperties >> 8) & 0xF;
}

- (int64_t)templateRenderingMode
{
  return (uint64_t)(int)(*(_DWORD *)&self->_imageProperties << 24) >> 29;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentEdgeInsets
{
  if ([(CUINamedImage *)self hasAlignmentInformation])
  {
    id v3 = [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] metrics];
    if (v3)
    {
      v4 = v3;
      [(CUINamedImage *)self scale];
      double v6 = v5;
      [v4 edgeBottomLeftMargin];
      double v8 = v7;
      [v4 edgeBottomLeftMargin];
      double v10 = v9;
      [v4 edgeTopRightMargin];
      double v12 = v11;
      [v4 edgeTopRightMargin];
      double v14 = v13;
      if (v6 <= 1.0) {
        double v15 = 1.0;
      }
      else {
        double v15 = 1.0 / v6;
      }
      double v16 = v15 * v12;
      double v17 = v15 * v10;
      double v18 = v8 * v15;
      double v19 = v15 * v14;
    }
    else
    {
      double v19 = 0.0;
      double v17 = 0.0;
      double v18 = 0.0;
      double v16 = 0.0;
    }
  }
  else
  {
    double v16 = 0.0;
    double v18 = 0.0;
    double v17 = 0.0;
    double v19 = 0.0;
  }
  result.var3 = v19;
  result.var2 = v17;
  result.var1 = v18;
  result.var0 = v16;
  return result;
}

- (BOOL)hasAlignmentInformation
{
  return (*(unsigned char *)&self->_imageProperties >> 2) & 1;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets
{
  objc_msgSend(-[CUIThemeRendition sliceInformation](-[CUINamedLookup _rendition](self, "_rendition"), "sliceInformation"), "edgeInsets");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CUINamedImage *)self scale];
  if (v11 >= 1.0) {
    double v12 = v11;
  }
  else {
    double v12 = 1.0;
  }
  double v13 = v4 / v12;
  double v14 = v6 / v12;
  double v15 = v8 / v12;
  double v16 = v10 / v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (id)baseKey
{
  id v2 = [(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] copy];
  return v2;
}

- (int64_t)resizingMode
{
  return (uint64_t)(int)(*(_DWORD *)&self->_imageProperties << 27) >> 30;
}

- (CGImage)croppedImage
{
  id v2 = [(CUINamedLookup *)self _rendition];
  return [(CUIThemeRendition *)v2 unslicedImage];
}

- (CGSize)size
{
  [(CUINamedImage *)self scale];
  double v4 = v3;
  [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] unslicedSize];
  if (v4 == 0.0)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    double width = v5 / v4;
    double height = v6 / v4;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)imageType
{
  int64_t result = [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] type];
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

- (double)positionOfSliceBoundary:(unsigned int)a3
{
  id v4 = [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] sliceInformation];
  [v4 positionOfSliceBoundary:a3];
  return result;
}

- (double)opacity
{
  id v2 = [(CUINamedLookup *)self _rendition];
  [(CUIThemeRendition *)v2 opacity];
  return result;
}

- (int)blendMode
{
  id v2 = [(CUINamedLookup *)self _rendition];
  return [(CUIThemeRendition *)v2 blendMode];
}

- (BOOL)isVectorBased
{
  return *(_DWORD *)&self->_imageProperties & 1;
}

- (BOOL)isTemplate
{
  return ([(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] templateRenderingMode] & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)isStructured
{
  return (id)[(CUIRenditionKey *)[(CUINamedLookup *)self key] themeElement] == (id)101;
}

- (BOOL)isFlippable
{
  return (*((unsigned __int8 *)&self->_imageProperties + 1) >> 5) & 1;
}

- (BOOL)preservedVectorRepresentation
{
  return *((unsigned __int8 *)&self->_imageProperties + 1) >> 7;
}

- (BOOL)isAlphaCropped
{
  return (*((unsigned __int8 *)&self->_imageProperties + 1) >> 4) & 1;
}

- (id)description
{
  double v3 = [(CUINamedLookup *)self key];
  v19.receiver = self;
  v19.super_class = (Class)CUINamedImage;
  id v18 = [(CUINamedImage *)&v19 description];
  [(CUINamedImage *)self size];
  uint64_t v5 = v4;
  [(CUINamedImage *)self size];
  double v17 = +[NSString stringWithFormat:@"width: %f height: %f", v5, v6];
  [(CUINamedImage *)self edgeInsets];
  double v14 = +[NSString stringWithFormat:@"\nEdge insets top: %f left: %f bottom: %f right: %f", v7, v8, v9, v10];
  double v16 = [(CUINamedLookup *)self name];
  [(CUINamedImage *)self scale];
  uint64_t v15 = (int)v11;
  [(CUINamedImage *)self opacity];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\n%@", v18, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\nDevice Idiom: %d\nDevice Subtype: %d\nHorizontal Size Class: %d\nVertical Size Class: %d\nImage Identifier: %d", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Name: %@\nScale: %d\nOpacity: %f\nSize: %@\nBlend Mode: %d\nResizing Mode: %d\nVector Based: %d\nTemplateRenderingMode: %ld\nEdgeInset: %@\nexifOrientation: %d,\nCropped: %d\nDisplay Gamut: %d\nLayout Direction: %d\nisFlippable: %d", v16, v15, v12, v17, [(CUINamedImage *)self blendMode], [(CUINamedImage *)self resizingMode], [(CUINamedImage *)self isVectorBased],
               [(CUINamedImage *)self templateRenderingMode],
               v14,
               [(CUINamedImage *)self exifOrientation],
               [(CUINamedImage *)self isAlphaCropped],
               [(CUIRenditionKey *)v3 themeDisplayGamut],
               [(CUIRenditionKey *)v3 themeDirection],
               [(CUINamedImage *)self isFlippable]),
             [(CUIRenditionKey *)v3 themeIdiom],
             [(CUIRenditionKey *)v3 themeSubtype],
             [(CUIRenditionKey *)v3 themeSizeClassHorizontal],
             [(CUIRenditionKey *)v3 themeSizeClassVertical],
             [(CUIRenditionKey *)v3 themeIdentifier]));
}

- (CGImage)createImageFromPDFRenditionWithScale:(double)a3
{
  if ((id)[(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] type] != (id)9) {
    return 0;
  }
  uint64_t v5 = [(CUINamedLookup *)self _rendition];
  return [(CUIThemeRendition *)v5 createImageFromPDFRenditionWithScale:a3];
}

- (CGSize)originalUncroppedSize
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)alphaCroppedRect
{
  id v2 = [(CUINamedLookup *)self _rendition];
  [(CUIThemeRendition *)v2 alphaCroppedRect];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end