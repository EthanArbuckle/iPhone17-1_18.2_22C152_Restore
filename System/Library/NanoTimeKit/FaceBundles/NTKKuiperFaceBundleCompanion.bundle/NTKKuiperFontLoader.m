@interface NTKKuiperFontLoader
+ (CGSize)_discretizedTypographicSizeForTypographicSize:(CGSize)a3;
+ (double)_discretizedTickRotationForTickRotation:(double)a3;
+ (id)_fontVariationAttributesForTypographicSize:(CGSize)a3 tickRotation:(double)a4;
+ (id)_kuiperFontDescriptorWithTypographicSize:(CGSize)a3 tickRotation:(double)a4 flipped:(BOOL)a5 background:(BOOL)a6;
- (NTKKuiperFontLoader)initWithFontSize:(double)a3;
- (double)fontSize;
- (id)_cachedFontWithTypographicSize:(CGSize)a3 tickRotation:(double)a4 flipped:(BOOL)a5 background:(BOOL)a6;
- (id)backgroundFontWithTypographicSize:(CGSize)a3 tickRotation:(double)a4 flipped:(BOOL)a5;
- (id)fontForMaximumOverscrollTypographicSize;
- (id)foregroundFontWithTypographicSize:(CGSize)a3 tickRotation:(double)a4 flipped:(BOOL)a5;
@end

@implementation NTKKuiperFontLoader

- (NTKKuiperFontLoader)initWithFontSize:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKKuiperFontLoader;
  v4 = [(NTKKuiperFontLoader *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_fontSize = a3;
    uint64_t v6 = objc_opt_new();
    fontCache = v5->_fontCache;
    v5->_fontCache = (NSCache *)v6;
  }
  return v5;
}

- (id)backgroundFontWithTypographicSize:(CGSize)a3 tickRotation:(double)a4 flipped:(BOOL)a5
{
  return -[NTKKuiperFontLoader _cachedFontWithTypographicSize:tickRotation:flipped:background:](self, "_cachedFontWithTypographicSize:tickRotation:flipped:background:", a5, 1, a3.width, a3.height, a4);
}

- (id)foregroundFontWithTypographicSize:(CGSize)a3 tickRotation:(double)a4 flipped:(BOOL)a5
{
  return -[NTKKuiperFontLoader _cachedFontWithTypographicSize:tickRotation:flipped:background:](self, "_cachedFontWithTypographicSize:tickRotation:flipped:background:", a5, 0, a3.width, a3.height, a4);
}

- (id)fontForMaximumOverscrollTypographicSize
{
  double v3 = NTKKuiperMaximumOverscrollTypographicSize();

  return -[NTKKuiperFontLoader _cachedFontWithTypographicSize:tickRotation:flipped:background:](self, "_cachedFontWithTypographicSize:tickRotation:flipped:background:", 0, 0, v3);
}

- (id)_cachedFontWithTypographicSize:(CGSize)a3 tickRotation:(double)a4 flipped:(BOOL)a5 background:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  objc_msgSend((id)objc_opt_class(), "_discretizedTypographicSizeForTypographicSize:", a3.width, a3.height);
  double v11 = v10;
  double v13 = v12;
  [(id)objc_opt_class() _discretizedTickRotationForTickRotation:a4];
  double v15 = v14;
  v22.width = v11;
  v22.height = v13;
  v16 = NSStringFromCGSize(v22);
  v17 = +[NSString stringWithFormat:@"(%@)-(%f)-(%lu)-(%lu)", v16, *(void *)&v15, v7, v6];

  v18 = [(NSCache *)self->_fontCache objectForKey:v17];
  if (!v18)
  {
    v19 = objc_msgSend((id)objc_opt_class(), "_kuiperFontDescriptorWithTypographicSize:tickRotation:flipped:background:", v7, v6, v11, v13, v15);
    v18 = +[CLKFont fontWithDescriptor:v19 size:self->_fontSize];
    [(NSCache *)self->_fontCache setObject:v18 forKey:v17];
  }

  return v18;
}

+ (CGSize)_discretizedTypographicSizeForTypographicSize:(CGSize)a3
{
  float height = a3.height;
  double v4 = roundf(height);
  float width = a3.width;
  double v6 = roundf(width);
  double v7 = v4;
  result.float height = v6;
  result.float width = v7;
  return result;
}

+ (double)_discretizedTickRotationForTickRotation:(double)a3
{
  float v3 = a3 * 40.0;
  return (float)(roundf(v3) / 40.0);
}

+ (id)_kuiperFontDescriptorWithTypographicSize:(CGSize)a3 tickRotation:(double)a4 flipped:(BOOL)a5 background:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a3.height;
  double width = a3.width;
  if (qword_172A8 != -1) {
    dispatch_once(&qword_172A8, &stru_107C0);
  }
  id v12 = [(id)qword_172A0 copy];
  double v13 = objc_opt_new();
  double v14 = objc_msgSend(a1, "_fontVariationAttributesForTypographicSize:tickRotation:", width, height, a4);
  [v13 setObject:v14 forKey:kCTFontVariationAttribute];
  double v15 = objc_opt_new();
  if (a4 > 0.0 || v6)
  {
    if (v6)
    {
      if (qword_172B8 != -1) {
        dispatch_once(&qword_172B8, &stru_107E0);
      }
      v16 = &qword_172B0;
    }
    else
    {
      if (qword_172C8 != -1) {
        dispatch_once(&qword_172C8, &stru_10800);
      }
      v16 = &qword_172C0;
    }
    id v17 = (id)*v16;
    [v15 addObject:v17];
  }
  if (v7)
  {
    if (qword_172D8 != -1) {
      dispatch_once(&qword_172D8, &stru_10820);
    }
    [v15 addObject:qword_172D0];
  }
  if ([v15 count]) {
    [v13 setObject:v15 forKey:UIFontDescriptorFeatureSettingsAttribute];
  }
  v18 = [v12 fontDescriptorByAddingAttributes:v13];

  return v18;
}

+ (id)_fontVariationAttributesForTypographicSize:(CGSize)a3 tickRotation:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  BOOL v7 = objc_opt_new();
  v8 = +[NSNumber numberWithDouble:width];
  objc_super v9 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  [v7 setObject:v8 forKey:v9];

  double v10 = +[NSNumber numberWithDouble:height];
  double v11 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  [v7 setObject:v10 forKey:v11];

  if (a4 > 0.0)
  {
    id v12 = +[NSNumber numberWithDouble:a4];
    double v13 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
    [v7 setObject:v12 forKey:v13];
  }

  return v7;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void).cxx_destruct
{
}

@end