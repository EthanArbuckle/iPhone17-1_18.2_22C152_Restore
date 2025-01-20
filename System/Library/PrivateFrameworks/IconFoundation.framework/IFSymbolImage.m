@interface IFSymbolImage
- (BOOL)isFlippable;
- (CGImage)CGImage;
- (CGRect)alignmentRect;
- (CGRect)contentBounds;
- (CGSize)size;
- (CUINamedVectorGlyph)vectorGlyph;
- (IFSymbolImage)initWithNamedVectorGlyph:(id)a3;
- (double)baselineOffset;
- (double)capHeight;
- (double)fontMatchingScaleFactor;
- (double)pointSize;
- (double)referencePointSize;
- (double)scale;
- (int64_t)layoutDirection;
- (int64_t)symbolWeight;
- (unint64_t)symbolSize;
- (void)dealloc;
- (void)setVectorGlyph:(id)a3;
@end

@implementation IFSymbolImage

- (IFSymbolImage)initWithNamedVectorGlyph:(id)a3
{
  id v5 = a3;
  v6 = (void *)[v5 image];
  v26.receiver = self;
  v26.super_class = (Class)IFSymbolImage;
  v7 = [(IFImage *)&v26 _init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong(v7 + 15, a3);
    [v5 scale];
    v8[6] = v9;
    if (v6)
    {
      CFRetain(v6);
      v8[5] = v6;
      double v10 = (double)CGImageGetWidth((CGImageRef)v6) / *((double *)v8 + 6);
      double v11 = (double)CGImageGetHeight((CGImageRef)v6) / *((double *)v8 + 6);
      *((double *)v8 + 16) = v10;
      *((double *)v8 + 17) = v11;
    }
    [v5 pointSize];
    v8[7] = v12;
    v8[8] = (id)[v5 glyphSize];
    v8[9] = (id)[v5 glyphWeight];
    [v5 referencePointSize];
    v8[10] = v13;
    [v5 fontMatchingScaleFactor];
    v8[11] = v14;
    [v5 baselineOffset];
    v8[12] = v15;
    [v5 baselineOffset];
    v8[13] = v16;
    [v5 alignmentRect];
    v8[18] = v17;
    v8[19] = v18;
    v8[20] = v19;
    v8[21] = v20;
    [v5 contentBounds];
    v8[22] = v21;
    v8[23] = v22;
    v8[24] = v23;
    v8[25] = v24;
    *((unsigned char *)v8 + 32) = [v5 isFlippable];
    v8[14] = (id)[v5 layoutDirection];
  }

  return (IFSymbolImage *)v8;
}

- (void)dealloc
{
  internalCGImage = self->_internalCGImage;
  if (internalCGImage) {
    CFRelease(internalCGImage);
  }
  v4.receiver = self;
  v4.super_class = (Class)IFSymbolImage;
  [(IFSymbolImage *)&v4 dealloc];
}

- (CGImage)CGImage
{
  v3 = +[IFImage escapingCGImageWithCGImage:self->_internalCGImage];
  internalCGImage = self->_internalCGImage;
  if (v3 != internalCGImage)
  {
    CFAutorelease(internalCGImage);
    CFRetain(v3);
    self->_internalCGImage = v3;
  }
  return v3;
}

- (double)scale
{
  return self->_internalScale;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_internalSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (unint64_t)symbolSize
{
  return self->_symbolSize;
}

- (int64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (double)referencePointSize
{
  return self->_referencePointSize;
}

- (double)fontMatchingScaleFactor
{
  return self->_fontMatchingScaleFactor;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (double)capHeight
{
  return self->_capHeight;
}

- (CGRect)alignmentRect
{
  double x = self->_alignmentRect.origin.x;
  double y = self->_alignmentRect.origin.y;
  double width = self->_alignmentRect.size.width;
  double height = self->_alignmentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isFlippable
{
  return self->_flippable;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (CUINamedVectorGlyph)vectorGlyph
{
  return (CUINamedVectorGlyph *)objc_getProperty(self, a2, 120, 1);
}

- (void)setVectorGlyph:(id)a3
{
}

- (void).cxx_destruct
{
}

@end