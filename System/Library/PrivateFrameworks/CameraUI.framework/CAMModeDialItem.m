@interface CAMModeDialItem
- (BOOL)isSelected;
- (BOOL)shouldShadowTitleText;
- (CAMModeDialItem)initWithCoder:(id)a3;
- (CAMModeDialItem)initWithFrame:(CGRect)a3;
- (CAShapeLayer)_scalableTextLayer;
- (CGColor)_textColor;
- (CGPath)_pathForAttributedString:(__CFAttributedString *)a3;
- (CGSize)_textFrameSize;
- (NSString)title;
- (UIFont)font;
- (__CFAttributedString)_attributedTitle;
- (void)_commonCAMModeDialItemInitialization;
- (void)_setTextFrameSize:(CGSize)a3;
- (void)_updateScalableTextPathFromAttributedTitle;
- (void)layoutSubviews;
- (void)setFont:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldShadowTitleText:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)tintColorDidChange;
@end

@implementation CAMModeDialItem

- (CAMModeDialItem)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMModeDialItem;
  v3 = -[CAMModeDialItem initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMModeDialItem *)v3 _commonCAMModeDialItemInitialization];
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMModeDialItemInitialization
{
  v3 = +[CAMFont cameraModeDialFontForContentSize:*MEMORY[0x263F83468]];
  font = self->_font;
  self->_font = v3;

  v5 = [MEMORY[0x263F15880] layer];
  scalableTextLayer = self->__scalableTextLayer;
  self->__scalableTextLayer = v5;

  id v7 = [(CAMModeDialItem *)self layer];
  [v7 addSublayer:self->__scalableTextLayer];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(CAMModeDialItem *)self _updateScalableTextPathFromAttributedTitle];
  }
}

- (void)_updateScalableTextPathFromAttributedTitle
{
  v2 = self;
  v3 = [(CAMModeDialItem *)self _pathForAttributedString:[(CAMModeDialItem *)self _attributedTitle]];
  id v6 = [(CAMModeDialItem *)v2 _scalableTextLayer];
  LODWORD(v2) = [(CAMModeDialItem *)v2 shouldShadowTitleText];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [v6 setPath:v3];
  if (v2)
  {
    [v6 setShadowPath:v3];
    id v4 = [MEMORY[0x263F825C8] blackColor];
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v4, "CGColor"));

    LODWORD(v5) = 1051931443;
    [v6 setShadowOpacity:v5];
    objc_msgSend(v6, "setShadowOffset:", 0.0, 0.0);
    [v6 setShadowRadius:2.0];
  }
  [MEMORY[0x263F158F8] commit];
}

- (__CFAttributedString)_attributedTitle
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(CAMModeDialItem *)self font];
  id v4 = +[CAMFont cameraKerningForFont:v3];
  char v14 = 2;
  [v3 leading];
  uint64_t v13 = v5;
  settings.spec = kCTParagraphStyleSpecifierAlignment;
  settings.valueSize = 1;
  settings.value = &v14;
  int v18 = 14;
  uint64_t v19 = 8;
  v20 = &v13;
  int v21 = 15;
  uint64_t v22 = 8;
  v23 = &v13;
  CTParagraphStyleRef v6 = CTParagraphStyleCreate(&settings, 3uLL);
  id v7 = (void *)*MEMORY[0x263F03C88];
  keys[0] = *(void **)MEMORY[0x263F039A0];
  keys[1] = v7;
  keys[2] = *(void **)MEMORY[0x263F03CA0];
  values[0] = v3;
  values[1] = v4;
  values[2] = v6;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFAttributedStringRef v10 = CFAttributedStringCreate(v8, (CFStringRef)[(CAMModeDialItem *)self title], v9);
  CFRelease(v6);
  CFRelease(v9);
  v11 = (__CFAttributedString *)CFAutorelease(v10);

  return v11;
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)title
{
  return self->_title;
}

- (CGPath)_pathForAttributedString:(__CFAttributedString *)a3
{
  path1 = CGPathCreateMutable();
  uint64_t v5 = CTFramesetterCreateWithAttributedString(a3);
  fitRange.location = 0;
  fitRange.length = 0;
  v49.length = CFAttributedStringGetLength(a3);
  v53.width = 1.79769313e308;
  v49.location = 0;
  v53.height = 1.79769313e308;
  CTFramesetterSuggestFrameSizeWithConstraints(v5, v49, 0, v53, &fitRange);
  UICeilToViewScale();
  double v7 = v6;
  UICeilToViewScale();
  double v9 = v8;
  v42 = self;
  -[CAMModeDialItem _setTextFrameSize:](self, "_setTextFrameSize:", v7, v8);
  v54.origin.x = 0.0;
  v54.origin.y = 0.0;
  v54.size.width = v7;
  v54.size.height = v9;
  path = CGPathCreateWithRect(v54, 0);
  cf = v5;
  Frame = CTFramesetterCreateFrame(v5, fitRange, path, 0);
  CFArrayRef Lines = CTFrameGetLines(Frame);
  CFIndex Count = CFArrayGetCount(Lines);
  uint64_t v13 = (CGPoint *)malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  v34 = Frame;
  v50.location = 0;
  v50.length = 0;
  CTFrameGetLineOrigins(Frame, v50, v13);
  if (CFArrayGetCount(Lines) >= 1)
  {
    CFIndex v14 = 0;
    CFArrayRef theArray = Lines;
    key = (void *)*MEMORY[0x263F039A0];
    do
    {
      ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v14);
      if (ValueAtIndex)
      {
        CFArrayRef GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
        if (GlyphRuns)
        {
          CFArrayRef v17 = GlyphRuns;
          if (CFArrayGetCount(GlyphRuns) >= 1)
          {
            CFIndex v18 = 0;
            CFArrayRef v39 = v17;
            do
            {
              CFIndex v40 = v18;
              uint64_t v19 = (const __CTRun *)CFArrayGetValueAtIndex(v17, v18);
              CFDictionaryRef Attributes = CTRunGetAttributes(v19);
              Value = (const __CTFont *)CFDictionaryGetValue(Attributes, key);
              GlyphCFIndex Count = CTRunGetGlyphCount(v19);
              v41 = (double *)malloc_type_calloc(GlyphCount, 0x10uLL, 0x1000040451B5BE8uLL);
              CTRunGetStretchFactors();
              if (GlyphCount >= 1)
              {
                CFIndex v23 = 0;
                uint64_t v24 = v41 + 1;
                do
                {
                  CGGlyph buffer = 0;
                  v51.location = v23;
                  v51.length = 1;
                  CTRunGetGlyphs(v19, v51, &buffer);
                  CGFloat v25 = *(v24 - 1);
                  CGFloat v26 = *v24;
                  memset(&matrix, 0, sizeof(matrix));
                  CGAffineTransformMakeScale(&matrix, v25, v26);
                  v44.a = 0.0;
                  v44.double b = 0.0;
                  v52.location = v23;
                  v52.length = 1;
                  CTRunGetPositions(v19, v52, (CGPoint *)&v44);
                  v27 = CTFontCreatePathForGlyph(Value, buffer, &matrix);
                  *(float64x2_t *)&v44.a = vaddq_f64((float64x2_t)v13[v14], *(float64x2_t *)&v44.a);
                  v28 = +[CAMCaptureCapabilities capabilities];
                  int v29 = [v28 sfCameraFontSupported];

                  if (v29)
                  {
                    double b = v44.b;
                  }
                  else
                  {
                    double v31 = CAMPixelWidthForView(v42);
                    double b = v31 + v44.b;
                    v44.double b = v31 + v44.b;
                  }
                  memset(&m, 0, sizeof(m));
                  CGAffineTransformMakeTranslation(&m, v44.a, b);
                  CGPathAddPath(path1, &m, v27);
                  CGPathRelease(v27);
                  ++v23;
                  v24 += 2;
                }
                while (GlyphCount != v23);
              }
              free(v41);
              CFArrayRef v17 = v39;
              CFIndex v18 = v40 + 1;
            }
            while (v40 + 1 < CFArrayGetCount(v39));
          }
        }
      }
      ++v14;
      CFArrayRef Lines = theArray;
    }
    while (v14 < CFArrayGetCount(theArray));
  }
  if (v13) {
    free(v13);
  }
  memset(&matrix, 0, sizeof(matrix));
  CGAffineTransformMakeScale(&matrix, 1.0, -1.0);
  CGAffineTransform v44 = matrix;
  CGAffineTransformTranslate(&m, &v44, 0.0, -v9);
  CGAffineTransform matrix = m;
  v32 = (const void *)MEMORY[0x21050AAA0](path1, &matrix);
  CGPathRelease(path1);
  CGPathRelease(path);
  CFRelease(cf);
  CFRelease(v34);
  return (CGPath *)CFAutorelease(v32);
}

- (void)_setTextFrameSize:(CGSize)a3
{
  self->__textFrameSize = a3;
}

- (CAShapeLayer)_scalableTextLayer
{
  return self->__scalableTextLayer;
}

- (BOOL)shouldShadowTitleText
{
  return self->_shouldShadowTitleText;
}

- (void)setFont:(id)a3
{
  uint64_t v5 = (UIFont *)a3;
  p_font = &self->_font;
  if (self->_font != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_font, a3);
    p_font = (UIFont **)[(CAMModeDialItem *)self _updateScalableTextPathFromAttributedTitle];
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](p_font, v5);
}

- (void)setShouldShadowTitleText:(BOOL)a3
{
  if (self->_shouldShadowTitleText != a3)
  {
    self->_shouldShadowTitleText = a3;
    [(CAMModeDialItem *)self _updateScalableTextPathFromAttributedTitle];
  }
}

- (void)tintColorDidChange
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v3 = [(CAMModeDialItem *)self _textColor];
  id v4 = [(CAMModeDialItem *)self _scalableTextLayer];
  [v4 setFillColor:v3];

  uint64_t v5 = (void *)MEMORY[0x263F158F8];
  [v5 commit];
}

- (CGColor)_textColor
{
  if ([(CAMModeDialItem *)self isSelected]) {
    [(CAMModeDialItem *)self tintColor];
  }
  else {
  v3 = [MEMORY[0x263F825C8] whiteColor];
  }
  id v4 = [(CAMModeDialItem *)self traitCollection];
  uint64_t v5 = [v3 resolvedColorWithTraitCollection:v4];

  id v6 = v5;
  double v7 = (CGColor *)[v6 CGColor];

  return v7;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_selected != a3)
  {
    BOOL v4 = a4;
    self->_selected = a3;
    id v11 = [(CAMModeDialItem *)self _scalableTextLayer];
    id v6 = [(CAMModeDialItem *)self _textColor];
    uint64_t v7 = [v11 fillColor];
    [v11 setFillColor:v6];
    if (v4)
    {
      double v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"fillColor"];
      [v8 setFromValue:v7];
      UIAnimationDragCoefficient();
      [v8 setDuration:v9 * 0.3331];
      CFAttributedStringRef v10 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
      [v8 setTimingFunction:v10];

      [v8 setFillMode:*MEMORY[0x263F15AA8]];
      [v11 addAnimation:v8 forKey:@"colorAnimation"];
    }
  }
}

- (CGSize)_textFrameSize
{
  double width = self->__textFrameSize.width;
  double height = self->__textFrameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CAMModeDialItem;
  [(CAMModeDialItem *)&v3 layoutSubviews];
  [(CAMModeDialItem *)self bounds];
  -[CAShapeLayer setFrame:](self->__scalableTextLayer, "setFrame:");
}

- (CAMModeDialItem)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMModeDialItem;
  objc_super v3 = [(CAMModeDialItem *)&v7 initWithCoder:a3];
  BOOL v4 = v3;
  if (v3)
  {
    [(CAMModeDialItem *)v3 _commonCAMModeDialItemInitialization];
    uint64_t v5 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scalableTextLayer, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end