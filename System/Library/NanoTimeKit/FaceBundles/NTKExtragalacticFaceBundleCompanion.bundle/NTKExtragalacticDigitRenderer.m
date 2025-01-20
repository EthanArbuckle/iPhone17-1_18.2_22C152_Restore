@interface NTKExtragalacticDigitRenderer
- (NTKExtragalacticDigitRenderer)initWithDevice:(id)a3;
- (id)loadDrawInfoForDigit:(id)a3 inStyle:(unint64_t)a4;
@end

@implementation NTKExtragalacticDigitRenderer

- (NTKExtragalacticDigitRenderer)initWithDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKExtragalacticDigitRenderer;
  v6 = [(NTKExtragalacticDigitRenderer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = +[NTKExtragalacticFontLoader extragalacticFontForDevice:v7->_device];
    font = v7->_font;
    v7->_font = (UIFont *)v8;

    v7->_ascent = CTFontGetAscent((CTFontRef)v7->_font);
    v7->_descent = CTFontGetDescent((CTFontRef)v7->_font);
    v7->_capHeight = CTFontGetCapHeight((CTFontRef)v7->_font);
  }

  return v7;
}

- (id)loadDrawInfoForDigit:(id)a3 inStyle:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  font = self->_font;
  double v9 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  v10 = [MEMORY[0x263EFF9A0] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [v6 glyphsForStyle:a4];
  uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        CGGlyph glyphs = 0;
        v16 = [v15 name];
        CGGlyph GlyphWithName = CTFontGetGlyphWithName((CTFontRef)font, v16);

        CGGlyph glyphs = GlyphWithName;
        CGPathRef PathForGlyph = CTFontCreatePathForGlyph((CTFontRef)font, GlyphWithName, 0);
        if (PathForGlyph)
        {
          CGPathRef v19 = PathForGlyph;
          CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs((CTFontRef)font, kCTFontOrientationDefault, &glyphs, 0, 1);
          CGFloat x = BoundingRectsForGlyphs.origin.x;
          CGFloat y = BoundingRectsForGlyphs.origin.y;
          CGFloat width = BoundingRectsForGlyphs.size.width;
          CGFloat height = BoundingRectsForGlyphs.size.height;
          double AdvancesForGlyphs = CTFontGetAdvancesForGlyphs((CTFontRef)font, kCTFontOrientationDefault, &glyphs, 0, 1);
          double capHeight = self->_capHeight;
          v32[0] = 0x3FF0000000000000;
          v32[1] = 0;
          v32[2] = 0;
          long long v33 = xmmword_246AFB160;
          double v34 = capHeight;
          v26 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithCGPath:", MEMORY[0x24C541240](v19, v32));
          v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "color"));
          [v10 setObject:v26 forKeyedSubscript:v27];

          v44.origin.CGFloat x = x;
          v44.origin.CGFloat y = y;
          v44.size.CGFloat width = width;
          v44.size.CGFloat height = height;
          double v28 = fmax(AdvancesForGlyphs, CGRectGetMaxX(v44));
          v45.origin.CGFloat x = x;
          v45.origin.CGFloat y = y;
          v45.size.CGFloat width = width;
          v45.size.CGFloat height = height;
          double v9 = fmax(v9, v28 - fmin(CGRectGetMinX(v45), 0.0));
          double v8 = fmax(v8, self->_ascent - self->_descent);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v12);
  }

  v29 = +[NTKExtragalacticDigitDrawInfo drawInfoWithUnifiedSize:paths:](NTKExtragalacticDigitDrawInfo, "drawInfoWithUnifiedSize:paths:", v10, v9, v8);

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end