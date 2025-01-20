@interface EQKitStringBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_appendEntryToSpec:(void *)a3 run:(__CTRun *)a4 glyphRange:(id)a5 offset:(CGPoint)a6;
- (CGColor)color;
- (CGRect)erasableBounds;
- (EQKitStringBox)initWithAttributedString:(id)a3 cgColor:(CGColor *)a4;
- (NSAttributedString)attributedString;
- (__CTLine)line;
- (double)depth;
- (double)height;
- (double)positionOfCharacterAtIndex:(unint64_t)a3;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)p_cacheDimensions;
- (void)p_ensureDimensionsAreValid;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitStringBox

- (EQKitStringBox)initWithAttributedString:(id)a3 cgColor:(CGColor *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EQKitStringBox;
  v7 = [(EQKitStringBox *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    attributedString = v7->_attributedString;
    v7->_attributedString = (NSAttributedString *)v8;

    if (a4) {
      v10 = (CGColor *)CFRetain(a4);
    }
    else {
      v10 = 0;
    }
    v7->_cgColor = v10;
  }

  return v7;
}

- (void)dealloc
{
  line = self->_line;
  if (line) {
    CFRelease(line);
  }
  CGColorRelease(self->_cgColor);
  v4.receiver = self;
  v4.super_class = (Class)EQKitStringBox;
  [(EQKitStringBox *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitStringBox *)self attributedString];
  id v6 = (void *)[v4 initWithAttributedString:v5 cgColor:self->_cgColor];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (EQKitStringBox *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    if ([(EQKitStringBox *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      id v6 = [(EQKitStringBox *)self attributedString];
      uint64_t v7 = [(EQKitStringBox *)v5 attributedString];
      uint64_t v8 = (void *)v7;
      if (v6 == (void *)v7) {
        goto LABEL_7;
      }
      BOOL v9 = 0;
      if (!v6 || !v7) {
        goto LABEL_11;
      }
      if ([v6 isEqualToAttributedString:v7]) {
LABEL_7:
      }
        BOOL v9 = CGColorEqualToColor([(EQKitStringBox *)self color], [(EQKitStringBox *)v5 color]);
      else {
        BOOL v9 = 0;
      }
LABEL_11:

      goto LABEL_12;
    }
    BOOL v9 = 0;
  }
LABEL_12:

  return v9;
}

- (void)p_ensureDimensionsAreValid
{
  if (!self->_dimensionsValid)
  {
    [(EQKitStringBox *)self p_cacheDimensions];
    self->_dimensionsValid = 1;
  }
}

- (double)height
{
  return self->_height;
}

- (double)depth
{
  return self->_depth;
}

- (double)width
{
  return self->_width;
}

- (CGRect)erasableBounds
{
  [(EQKitStringBox *)self p_ensureDimensionsAreValid];
  double x = self->_erasableBounds.origin.x;
  double y = self->_erasableBounds.origin.y;
  double width = self->_erasableBounds.size.width;
  double height = self->_erasableBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (__CTLine)line
{
  CGRect result = self->_line;
  if (!result)
  {
    CFAttributedStringRef v4 = [(EQKitStringBox *)self attributedString];
    self->_line = CTLineCreateWithAttributedString(v4);

    return self->_line;
  }
  return result;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EQKitStringBox;
  -[EQKitBox renderIntoContext:offset:](&v13, sel_renderIntoContext_offset_, v7, x, y);
  uint64_t v8 = (CGContext *)[v7 cgContext];
  if (v8)
  {
    BOOL v9 = [(EQKitStringBox *)self line];
    if (v9)
    {
      if (self->_cgColor)
      {
        CGContextSaveGState(v8);
        CGContextSetFillColorWithColor(v8, self->_cgColor);
      }
      memset(&v12, 0, sizeof(v12));
      CGContextGetTextMatrix(&v12, v8);
      CGAffineTransformMakeScale(&v11, 1.0, -1.0);
      CGContextSetTextMatrix(v8, &v11);
      CGContextSetTextPosition(v8, x, y);
      CTLineDraw(v9, v8);
      CGAffineTransform v10 = v12;
      CGContextSetTextMatrix(v8, &v10);
      if (self->_cgColor) {
        CGContextRestoreGState(v8);
      }
    }
  }
}

- (double)positionOfCharacterAtIndex:(unint64_t)a3
{
  v5 = [(EQKitStringBox *)self line];
  if (!v5) {
    return 0.0;
  }
  id v6 = v5;
  id v7 = [(EQKitStringBox *)self attributedString];
  unint64_t v8 = [v7 length];

  if (v8 < a3) {
    return 0.0;
  }

  return CTLineGetOffsetForStringIndex(v6, a3, 0);
}

- (BOOL)p_appendEntryToSpec:(void *)a3 run:(__CTRun *)a4 glyphRange:(id)a5 offset:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  CFIndex var1 = a5.var1;
  CFIndex var0 = a5.var0;
  CGGlyph buffer = 0;
  CTRunGetGlyphs(a4, (CFRange)a5, &buffer);
  CFDictionaryRef Attributes = CTRunGetAttributes(a4);
  CFDictionaryRef v13 = Attributes;
  if (Attributes)
  {
    Value = (const __CTFont *)CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x263F039A0]);
    v18.location = var0;
    v18.length = var1;
    CTRunGetPositions(a4, v18, &v16);
    v19.double x = x + v16.x;
    v19.double y = y + v16.y;
    EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v19, Value, buffer);
  }
  return v13 != 0;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CFArrayRef GlyphRuns = CTLineGetGlyphRuns([(EQKitStringBox *)self line]);
  CFIndex Count = CFArrayGetCount(GlyphRuns);
  if (!Count) {
    return 0;
  }
  int v10 = *((_DWORD *)a3 + 6);
  if (v10 == 2)
  {
    ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, Count - 1);
    GlyphCFIndex Count = CTRunGetGlyphCount(ValueAtIndex);
    CFIndex v15 = GlyphCount - 1;
    if (GlyphCount >= 1)
    {
      CGAffineTransform v12 = self;
      CFDictionaryRef v13 = a3;
      v14 = ValueAtIndex;
      goto LABEL_8;
    }
    return 0;
  }
  if (v10) {
    return 0;
  }
  CGAffineTransform v11 = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, 0);
  if (CTRunGetGlyphCount(v11) < 1) {
    return 0;
  }
  CGAffineTransform v12 = self;
  CFDictionaryRef v13 = a3;
  v14 = v11;
  CFIndex v15 = 0;
LABEL_8:

  return -[EQKitStringBox p_appendEntryToSpec:run:glyphRange:offset:](v12, "p_appendEntryToSpec:run:glyphRange:offset:", v13, v14, v15, 1, x, y);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitStringBox *)self height];
  uint64_t v6 = v5;
  [(EQKitStringBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitStringBox *)self width];
  uint64_t v10 = v9;
  CGAffineTransform v11 = [(EQKitStringBox *)self attributedString];
  CGAffineTransform v12 = [v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f attributedString=%@", v4, self, v6, v8, v10, v11];

  return v12;
}

- (void)p_cacheDimensions
{
  self->_CGFloat height = 0.0;
  self->_depth = 0.0;
  self->_CGFloat width = 0.0;
  p_erasableBounds = &self->_erasableBounds;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_erasableBounds.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_erasableBounds.size = v4;
  uint64_t v5 = [(EQKitStringBox *)self line];
  if (v5)
  {
    uint64_t v6 = v5;
    CGRect ImageBounds = CTLineGetImageBounds(v5, 0);
    CGFloat x = ImageBounds.origin.x;
    CGFloat y = ImageBounds.origin.y;
    CGFloat width = ImageBounds.size.width;
    CGFloat height = ImageBounds.size.height;
    double MaxY = CGRectGetMaxY(ImageBounds);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v19);
    double TypographicBounds = CTLineGetTypographicBounds(v6, 0, 0, 0);
    if (TypographicBounds > 0.0)
    {
      self->_CGFloat height = MaxY;
      self->_depth = -MinY;
      self->_CGFloat width = TypographicBounds;
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGFloat MinX = CGRectGetMinX(v20);
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGFloat v15 = -CGRectGetMaxY(v21);
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGFloat v16 = CGRectGetWidth(v22);
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      CGFloat v17 = CGRectGetHeight(v23);
      p_erasableBounds->origin.CGFloat x = MinX;
      p_erasableBounds->origin.CGFloat y = v15;
      p_erasableBounds->size.CGFloat width = v16;
      p_erasableBounds->size.CGFloat height = v17;
    }
  }
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGColor)color
{
  return self->_cgColor;
}

- (void).cxx_destruct
{
}

@end