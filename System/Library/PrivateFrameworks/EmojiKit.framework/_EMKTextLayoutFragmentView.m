@interface _EMKTextLayoutFragmentView
- (BOOL)isOpaque;
- (EMKGlyphRippler)rippler;
- (NSTextLayoutFragment)layoutFragment;
- (_EMKTextLayoutFragmentView)initWithFrame:(CGRect)a3 layoutFragment:(id)a4;
- (unint64_t)animatingGlyphCount;
- (unint64_t)animatingGlyphCountBeforeFragment;
- (unint64_t)timeIndex;
- (void)___drawAnimatingEmojiGlyph:(unsigned __int16)a3 textPosition:(CGPoint)a4 glyphPosition:(CGPoint)a5 font:(__CTFont *)a6 attributes:(id)a7;
- (void)__drawAnimatingEmojiRun:(__CTRun *)a3 textPosition:(CGPoint)a4 animatingGlyphCountBefore:(int64_t)a5 drawnRunGlyphCount:(int64_t *)a6;
- (void)_drawTextLineFragment:(id)a3 animatingGlyphCountBefore:(int64_t)a4 drawnGlyphCount:(int64_t *)a5;
- (void)drawRect:(CGRect)a3;
- (void)setAnimatingGlyphCount:(unint64_t)a3;
- (void)setAnimatingGlyphCountBeforeFragment:(unint64_t)a3;
- (void)setLayoutFragment:(id)a3;
- (void)setRippler:(id)a3;
- (void)setTimeIndex:(unint64_t)a3;
- (void)startAnimationWithRippler:(id)a3 animatingGlyphCount:(unint64_t)a4 animatingGlyphCountBefore:(unint64_t)a5;
- (void)updateWithTimeIndex:(unint64_t)a3;
@end

@implementation _EMKTextLayoutFragmentView

- (_EMKTextLayoutFragmentView)initWithFrame:(CGRect)a3 layoutFragment:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_EMKTextLayoutFragmentView;
  v11 = -[_EMKTextLayoutFragmentView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_layoutFragment, a4);
    rippler = v12->_rippler;
    v12->_rippler = 0;

    v12->_timeIndedouble x = 0;
    v12->_animatingGlyphCount = 0;
    v12->_animatingGlyphCountBeforeFragment = 0;
    [(_EMKTextLayoutFragmentView *)v12 setContentMode:3];
    [(_EMKTextLayoutFragmentView *)v12 setClipsToBounds:1];
    v14 = [(_EMKTextLayoutFragmentView *)v12 layer];
    [v14 setMasksToBounds:1];
  }
  return v12;
}

- (void)startAnimationWithRippler:(id)a3 animatingGlyphCount:(unint64_t)a4 animatingGlyphCountBefore:(unint64_t)a5
{
  self->_timeIndedouble x = 0;
  self->_animatingGlyphCountBeforeFragment = a5;
  id v7 = a3;
  [(_EMKTextLayoutFragmentView *)self setAnimatingGlyphCount:a4];
  [(_EMKTextLayoutFragmentView *)self setRippler:v7];
}

- (void)updateWithTimeIndex:(unint64_t)a3
{
  self->_timeIndedouble x = a3;
  [(_EMKTextLayoutFragmentView *)self setNeedsDisplay];
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)_EMKTextLayoutFragmentView;
  -[_EMKTextLayoutFragmentView drawRect:](&v20, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  layoutFragment = self->_layoutFragment;
  if (layoutFragment)
  {
    v5 = [(NSTextLayoutFragment *)layoutFragment textLayoutManager];
    v6 = v5;
    if (v5 && self->_rippler)
    {
      id v7 = [v5 documentRange];
      [v6 ensureLayoutForRange:v7];
      unint64_t animatingGlyphCountBeforeFragment = self->_animatingGlyphCountBeforeFragment;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v9 = [(NSTextLayoutFragment *)self->_layoutFragment textLineFragments];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
            uint64_t v15 = 0;
            [(_EMKTextLayoutFragmentView *)self _drawTextLineFragment:v14 animatingGlyphCountBefore:animatingGlyphCountBeforeFragment drawnGlyphCount:&v15];
            animatingGlyphCountBeforeFragment += v15;
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)_drawTextLineFragment:(id)a3 animatingGlyphCountBefore:(int64_t)a4 drawnGlyphCount:(int64_t *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = CTLineGetGlyphRuns((CTLineRef)[v8 lineRef]);
  [v8 glyphOrigin];
  double v11 = v10;
  double v13 = v12;
  [v8 typographicBounds];
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;
  double MinY = CGRectGetMinY(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v37);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v9;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    int64_t v23 = 0;
    double v24 = v11 + MinX;
    double v25 = v13 + MinY;
    uint64_t v26 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v20);
        }
        uint64_t v28 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v29 = 0;
        -[_EMKTextLayoutFragmentView __drawAnimatingEmojiRun:textPosition:animatingGlyphCountBefore:drawnRunGlyphCount:](self, "__drawAnimatingEmojiRun:textPosition:animatingGlyphCountBefore:drawnRunGlyphCount:", v28, v23 + a4, &v29, v24, v25);
        v23 += v29;
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v22);
  }
  else
  {
    int64_t v23 = 0;
  }

  *a5 = v23;
}

- (void)__drawAnimatingEmojiRun:(__CTRun *)a3 textPosition:(CGPoint)a4 animatingGlyphCountBefore:(int64_t)a5 drawnRunGlyphCount:(int64_t *)a6
{
  double y = a4.y;
  double x = a4.x;
  if (_EMKShouldDrawCTRun(a3))
  {
    CFDictionaryRef Attributes = CTRunGetAttributes(a3);
    Value = CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x1E4F243F0]);
    CFIndex GlyphCount = CTRunGetGlyphCount(a3);
    uint64_t v15 = (CGPoint *)malloc_type_calloc(GlyphCount, 0x10uLL, 0x1000040451B5BE8uLL);
    long long v16 = (CGGlyph *)malloc_type_calloc(GlyphCount, 2uLL, 0x1000040BDFB0063uLL);
    v26.location = 0;
    v26.length = 0;
    int64_t v23 = v16;
    CTRunGetGlyphs(a3, v26, v16);
    v27.location = 0;
    v27.length = 0;
    double v24 = v15;
    CTRunGetPositions(a3, v27, v15);
    *a6 = GlyphCount;
    if (GlyphCount >= 1)
    {
      long long v17 = v23;
      p_double y = &v24->y;
      do
      {
        unsigned int v19 = *v17++;
        double v20 = *(p_y - 1);
        double v21 = *p_y;
        uint64_t v22 = [[_EMKGlyphRenderingAttributes alloc] initWithValuesFromRippler:self->_rippler timeIndex:self->_timeIndex glyphIndex:a5 numberOfGlyphs:self->_animatingGlyphCount];
        -[_EMKTextLayoutFragmentView ___drawAnimatingEmojiGlyph:textPosition:glyphPosition:font:attributes:](self, "___drawAnimatingEmojiGlyph:textPosition:glyphPosition:font:attributes:", v19, Value, v22, x, y, v20, v21);

        ++a5;
        p_y += 2;
        --GlyphCount;
      }
      while (GlyphCount);
    }
    free(v23);
    free(v24);
  }
  else
  {
    *a6 = 0;
  }
}

- (void)___drawAnimatingEmojiGlyph:(unsigned __int16)a3 textPosition:(CGPoint)a4 glyphPosition:(CGPoint)a5 font:(__CTFont *)a6 attributes:(id)a7
{
  CGFloat y = a5.y;
  double x = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGGlyph glyphs = a3;
  id v13 = a7;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  double Size = CTFontGetSize(a6);
  [v13 scale];
  CGFloat v17 = Size * v16;
  CopyWithCFDictionaryRef Attributes = CTFontCreateCopyWithAttributes(a6, v17, 0, 0);
  id v19 = [v13 color];
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v19 CGColor]);
  CGContextSetStrokeColorSpace(CurrentContext, ColorSpace);
  CGContextSetFillColorSpace(CurrentContext, ColorSpace);
  id v21 = v19;
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v21 CGColor]);
  id v22 = v21;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v22 CGColor]);
  int64_t v23 = [v13 shadowIfNeededForFontPointSize:v17];

  objc_msgSend(v23, "applyToGraphicsContext_emk:", CurrentContext);
  memset(&v27, 0, sizeof(v27));
  CGContextGetTextMatrix(&v27, CurrentContext);
  CGAffineTransform v25 = v27;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformScale(&v26, &v25, 1.0, -1.0);
  CGAffineTransform v25 = v26;
  CGContextSetTextMatrix(CurrentContext, &v25);
  CGContextSetTextPosition(CurrentContext, v11, v10);
  v24.CGFloat y = y;
  [(_EMKTextLayoutFragmentView *)self bounds];
  v24.double x = CGRectGetMinX(v29) + x;
  CTFontDrawGlyphs(CopyWithAttributes, &glyphs, &v24, 1uLL, CurrentContext);
  CGContextRestoreGState(CurrentContext);
  CFRelease(CopyWithAttributes);
  CGAffineTransform v25 = v27;
  CGContextSetTextMatrix(CurrentContext, &v25);
}

- (NSTextLayoutFragment)layoutFragment
{
  return self->_layoutFragment;
}

- (void)setLayoutFragment:(id)a3
{
}

- (EMKGlyphRippler)rippler
{
  return self->_rippler;
}

- (void)setRippler:(id)a3
{
}

- (unint64_t)timeIndex
{
  return self->_timeIndex;
}

- (void)setTimeIndex:(unint64_t)a3
{
  self->_timeIndedouble x = a3;
}

- (unint64_t)animatingGlyphCount
{
  return self->_animatingGlyphCount;
}

- (void)setAnimatingGlyphCount:(unint64_t)a3
{
  self->_animatingCFIndex GlyphCount = a3;
}

- (unint64_t)animatingGlyphCountBeforeFragment
{
  return self->_animatingGlyphCountBeforeFragment;
}

- (void)setAnimatingGlyphCountBeforeFragment:(unint64_t)a3
{
  self->_unint64_t animatingGlyphCountBeforeFragment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_layoutFragment, 0);
}

@end