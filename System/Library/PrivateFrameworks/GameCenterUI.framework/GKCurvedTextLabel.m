@interface GKCurvedTextLabel
- (BOOL)interior;
- (CGPoint)_offsetOfBoundingRect:(CGRect)a3 inRect:(CGRect)a4;
- (CGRect)_glyphsBoundingRect;
- (CGRect)textBoundingRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (GKCurvedTextLabel)init;
- (GKCurvedTextLabel)initWithFrame:(CGRect)a3;
- (NSDictionary)textAttributes;
- (_NSRange)_drawableCharacterRange:(_NSRange *)a3;
- (__CTLine)_newLineFromDrawableTextStorage;
- (double)_distance;
- (double)centerAngle;
- (double)circleRadius;
- (double)linearWidth;
- (double)maxAngularWidth;
- (double)textLeadingAngle;
- (double)textTrailingAngle;
- (id)attributedText;
- (id)font;
- (id)text;
- (id)textColor;
- (void)_enumerateTransformsForDrawableCharacters:(id)a3;
- (void)_updateMaxSize;
- (void)_updateTextColor;
- (void)drawTextInRect:(CGRect)a3;
- (void)invalidateCachedSize;
- (void)setAttributedText:(id)a3;
- (void)setCenterAngle:(double)a3;
- (void)setCircleRadius:(double)a3;
- (void)setFont:(id)a3;
- (void)setInterior:(BOOL)a3;
- (void)setMaxAngularWidth:(double)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation GKCurvedTextLabel

- (GKCurvedTextLabel)init
{
  return -[GKCurvedTextLabel initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (GKCurvedTextLabel)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)GKCurvedTextLabel;
  v3 = -[GKCurvedTextLabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSTextContainer *)objc_alloc_init(MEMORY[0x1E4FB0880]);
    textContainer = v3->_textContainer;
    v3->_textContainer = v4;

    [(NSTextContainer *)v3->_textContainer setMaximumNumberOfLines:1];
    [(NSTextContainer *)v3->_textContainer setLineFragmentPadding:0.0];
    [(NSTextContainer *)v3->_textContainer setLineBreakMode:4];
    v6 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E4FB0840]);
    layoutManager = v3->_layoutManager;
    v3->_layoutManager = v6;

    [(NSLayoutManager *)v3->_layoutManager addTextContainer:v3->_textContainer];
    v8 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E4FB08B8]);
    textStorage = v3->_textStorage;
    v3->_textStorage = v8;

    [(NSTextStorage *)v3->_textStorage addLayoutManager:v3->_layoutManager];
    uint64_t v10 = [MEMORY[0x1E4FB1618] labelColor];
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v10;
  }
  return v3;
}

- (NSDictionary)textAttributes
{
  v2 = [(GKCurvedTextLabel *)self attributedText];
  uint64_t v3 = [v2 length];
  if (v3)
  {
    v4 = objc_msgSend(v2, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, v3);
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (void)setInterior:(BOOL)a3
{
  if (self->_interior != a3)
  {
    self->_interior = a3;
    [(GKCurvedTextLabel *)self invalidateCachedSize];
    [(GKCurvedTextLabel *)self setNeedsLayout];
    [(GKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (void)setCircleRadius:(double)a3
{
  if (self->_circleRadius != a3)
  {
    self->_circleRadius = a3;
    [(GKCurvedTextLabel *)self invalidateCachedSize];
    [(GKCurvedTextLabel *)self _updateMaxSize];
    [(GKCurvedTextLabel *)self setNeedsLayout];
    [(GKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (void)setCenterAngle:(double)a3
{
  if (self->_centerAngle != a3)
  {
    self->_centerAngle = a3;
    [(GKCurvedTextLabel *)self invalidateCachedSize];
    [(GKCurvedTextLabel *)self setNeedsLayout];
    [(GKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (void)setMaxAngularWidth:(double)a3
{
  long double v5 = fmod(a3, 6.28318531);
  if (a3 <= 6.28318531) {
    long double v5 = a3;
  }
  if (self->_maxAngularWidth != v5)
  {
    self->_maxAngularWidth = v5;
    [(GKCurvedTextLabel *)self _updateMaxSize];
  }
}

- (double)linearWidth
{
  return self->_textWidth;
}

- (void)_updateMaxSize
{
  double maxAngularWidth = self->_maxAngularWidth;
  if (maxAngularWidth == 0.0 || (double circleRadius = self->_circleRadius, circleRadius == 0.0))
  {
    double v5 = 1.79769313e308;
  }
  else
  {
    if (maxAngularWidth > 3.14159265) {
      double maxAngularWidth = 6.28318531 - maxAngularWidth;
    }
    double v5 = maxAngularWidth * circleRadius;
  }
  [(NSTextContainer *)self->_textContainer size];
  if (v6 != v5 || self->_textWidth != v5)
  {
    -[NSTextContainer setSize:](self->_textContainer, "setSize:", v5, 1.79769313e308);
    self->_textWidth = v5;
    [(GKCurvedTextLabel *)self invalidateCachedSize];
    [(GKCurvedTextLabel *)self setNeedsLayout];
    [(GKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (void)setTextColor:(id)a3
{
  double v5 = (UIColor *)a3;
  textColor = self->_textColor;
  v7 = v5;
  if (!v5 || !textColor)
  {
    if (textColor == v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((-[UIColor isEqual:](v5, "isEqual:") & 1) == 0)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_textColor, a3);
    [(GKCurvedTextLabel *)self _updateTextColor];
  }
LABEL_7:
}

- (void)_updateTextColor
{
  uint64_t v3 = [(NSTextStorage *)self->_textStorage length];
  if (v3)
  {
    -[NSTextStorage addAttribute:value:range:](self->_textStorage, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], self->_textColor, 0, v3);
    [(GKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (id)textColor
{
  return self->_textColor;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToAttributedString:self->_textStorage] & 1) == 0)
  {
    if (!v4) {
      goto LABEL_11;
    }
    uint64_t v5 = [v4 length];
    uint64_t v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = [v4 string];
      v9 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v9, 0, v6, v5);
      uint64_t v12 = v11;

      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v7)
      {

        v7 = 0;
      }
      else
      {
        v7 = (void *)[v4 mutableCopy];
      }
      objc_super v13 = [v7 mutableString];
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v10, v12, @" ");

      uint64_t v6 = v10 + 1;
      uint64_t v5 = [v4 length] - v6;
    }
    if (v7)
    {
      id v14 = v7;
      v15 = v14;
    }
    else
    {
LABEL_11:
      v16 = (void *)[v4 mutableCopy];
      v17 = v16;
      if (v16) {
        id v18 = v16;
      }
      else {
        id v18 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F07B2408];
      }
      v15 = v18;

      id v14 = 0;
    }
    uint64_t v19 = *MEMORY[0x1E4FB0738];
    if (_CurvedParagraphStyle_onceToken != -1) {
      dispatch_once(&_CurvedParagraphStyle_onceToken, &__block_literal_global_28);
    }
    id v20 = (id)_CurvedParagraphStyle_paragraphStyle;
    objc_msgSend(v15, "addAttribute:value:range:", v19, v20, 0, objc_msgSend(v15, "length"));

    [(NSTextStorage *)self->_textStorage setAttributedString:v15];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    textStorage = self->_textStorage;
    uint64_t v22 = [(NSTextStorage *)textStorage length];
    uint64_t v23 = *MEMORY[0x1E4FB06F8];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __39__GKCurvedTextLabel_setAttributedText___block_invoke;
    v24[3] = &unk_1E5F65378;
    v24[4] = &v25;
    -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v22, 0, v24);
    self->_hasMonospacedNumbers = *((unsigned char *)v26 + 24);
    [(GKCurvedTextLabel *)self _updateTextColor];
    [(GKCurvedTextLabel *)self invalidateCachedSize];
    [(GKCurvedTextLabel *)self setNeedsDisplay];
    [(GKCurvedTextLabel *)self setNeedsLayout];
    _Block_object_dispose(&v25, 8);
  }
}

void __39__GKCurvedTextLabel_setAttributedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 fontDescriptor];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FB0910]];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = *MEMORY[0x1E4FB0968];
    uint64_t v12 = *MEMORY[0x1E4FB0960];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = [v14 objectForKeyedSubscript:v11];
        if ([v15 isEqualToNumber:&unk_1F0811F40])
        {
          v16 = [v14 objectForKeyedSubscript:v12];
          int v17 = [v16 isEqualToNumber:&unk_1F0811F58];

          if (v17)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
            *a5 = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
LABEL_12:
}

- (id)attributedText
{
  return self->_textStorage;
}

- (void)setText:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F28B18];
    id v5 = a3;
    id v6 = [v4 alloc];
    font = self->_font;
    uint64_t v10 = *MEMORY[0x1E4FB06F8];
    v11[0] = font;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v6 initWithString:v5 attributes:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(GKCurvedTextLabel *)self setAttributedText:v9];
}

- (id)text
{
  return (id)[(NSTextStorage *)self->_textStorage string];
}

- (void)setFont:(id)a3
{
  id v5 = (UIFont *)a3;
  font = self->_font;
  uint64_t v8 = v5;
  if (!v5 || !font)
  {
    if (font == v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((-[UIFont isEqual:](v5, "isEqual:") & 1) == 0)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_font, a3);
    id v7 = [(GKCurvedTextLabel *)self text];
    [(GKCurvedTextLabel *)self setText:v7];

    [(GKCurvedTextLabel *)self invalidateCachedSize];
  }
LABEL_7:
}

- (id)font
{
  return self->_font;
}

- (void)invalidateCachedSize
{
  self->_cachedSizeIsValid = 0;
  self->_cachedSize = (CGSize)*MEMORY[0x1E4F1DB30];
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_cachedBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_cachedBounds.size = v3;
  self->_cachedGlyphsBoundingRect.origin = v2;
  self->_cachedGlyphsBoundingRect.size = v3;
  self->_cachedLeadingAngle = self->_centerAngle;
  self->_cachedTrailingAngle = self->_centerAngle;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  p_cachedSize = &self->_cachedSize;
  if (self->_cachedSizeIsValid)
  {
    double width = p_cachedSize->width;
    double height = self->_cachedSize.height;
  }
  else
  {
    [(GKCurvedTextLabel *)self _glyphsBoundingRect];
    double width = v7;
    double height = v8;
    p_cachedSize->double width = v7;
    p_cachedSize->double height = v8;
    self->_cachedSizeIsValid = 1;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  [(GKCurvedTextLabel *)self _glyphsBoundingRect];
  -[GKCurvedTextLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:");
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v8 = [(GKCurvedTextLabel *)self _newLineFromDrawableTextStorage];
  CGRect ImageBounds = CTLineGetImageBounds(v8, 0);
  CGFloat x = ImageBounds.origin.x;
  CGFloat y = ImageBounds.origin.y;
  CFRelease(v8);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3010000000;
  v14[3] = &unk_1AF895502;
  CGFloat v15 = x;
  CGFloat v16 = y;
  if (self->_hasMonospacedNumbers) {
    CGFloat v15 = 0.0;
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  CGAffineTransformMakeTranslation(&transform, v5, v7);
  CGContextConcatCTM(CurrentContext, &transform);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__GKCurvedTextLabel_drawTextInRect___block_invoke;
  v12[3] = &unk_1E5F653A0;
  v12[4] = self;
  v12[5] = v14;
  v12[6] = CurrentContext;
  [(GKCurvedTextLabel *)self _enumerateTransformsForDrawableCharacters:v12];
  _Block_object_dispose(v14, 8);
}

void __36__GKCurvedTextLabel_drawTextInRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, double a5, double a6)
{
  CGContextSaveGState(*(CGContextRef *)(a1 + 48));
  uint64_t v12 = *(CGContext **)(a1 + 48);
  long long v13 = a4[1];
  *(_OWORD *)&v14.a = *a4;
  *(_OWORD *)&v14.c = v13;
  *(_OWORD *)&v14.tCGFloat x = a4[2];
  CGContextConcatCTM(v12, &v14);
  if (a2 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 808), "drawGlyphsForGlyphRange:atPoint:", a2, a3, -a5 - *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), -a6);
  }
  CGContextRestoreGState(*(CGContextRef *)(a1 + 48));
}

- (CGRect)textBoundingRect
{
  [(GKCurvedTextLabel *)self _glyphsBoundingRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(GKCurvedTextLabel *)self bounds];
  -[GKCurvedTextLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v4, v6, v8, v10, v11, v12, v13, v14);
  double v16 = v4 + v15;
  double v18 = v6 + v17;
  double v19 = v8;
  double v20 = v10;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v16;
  return result;
}

- (double)textLeadingAngle
{
  return self->_cachedLeadingAngle;
}

- (double)textTrailingAngle
{
  return self->_cachedTrailingAngle;
}

- (_NSRange)_drawableCharacterRange:(_NSRange *)a3
{
  uint64_t v5 = [(NSLayoutManager *)self->_layoutManager glyphRangeForTextContainer:self->_textContainer];
  uint64_t v7 = v6;
  uint64_t v8 = [(NSLayoutManager *)self->_layoutManager truncatedGlyphRangeInLineFragmentForGlyphAtIndex:v5];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v8 + 1;
    if (a3)
    {
      a3->location = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v8, v9, 0);
      a3->length = v10;
    }
  }
  layoutManager = self->_layoutManager;

  NSUInteger v12 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v5, v7, 0);
  result.length = v13;
  result.location = v12;
  return result;
}

- (__CTLine)_newLineFromDrawableTextStorage
{
  long long v13 = xmmword_1AF7CAEE0;
  uint64_t v4 = [(GKCurvedTextLabel *)self _drawableCharacterRange:&v13];
  textStorage = self->_textStorage;
  if ((void)v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v3;
    uint64_t v7 = [(NSTextStorage *)textStorage length];
    uint64_t v8 = self->_textStorage;
    if (v4 || v6 != v7)
    {
      uint64_t v9 = (NSTextStorage *)[(NSTextStorage *)v8 mutableCopy];
      -[NSTextStorage deleteCharactersInRange:](v9, "deleteCharactersInRange:", v6, [(NSTextStorage *)self->_textStorage length] - v6);
    }
    else
    {
      uint64_t v9 = v8;
    }
  }
  else
  {
    uint64_t v9 = (NSTextStorage *)[(NSTextStorage *)textStorage mutableCopy];
    uint64_t v10 = [(NSTextStorage *)self->_textStorage length];
    *((void *)&v13 + 1) = v10 - v13;
    -[NSTextStorage replaceCharactersInRange:withString:](v9, "replaceCharactersInRange:withString:");
  }
  double v11 = CTLineCreateWithAttributedString((CFAttributedStringRef)v9);

  return v11;
}

- (CGPoint)_offsetOfBoundingRect:(CGRect)a3 inRect:(CGRect)a4
{
  CGFloat rect = a4.size.height;
  CGFloat width = a3.size.width;
  CGFloat v4 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat height = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  double v11 = CGRectGetWidth(a4);
  v19.origin.CGFloat x = v10;
  v19.origin.CGFloat y = v9;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = height;
  double v12 = v11 - CGRectGetMaxX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = v4;
  v20.size.CGFloat height = rect;
  double v13 = CGRectGetHeight(v20);
  v21.origin.CGFloat x = v10;
  v21.origin.CGFloat y = v9;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v14 = v13 - CGRectGetMaxY(v21);
  double v15 = v12;
  result.CGFloat y = v14;
  result.CGFloat x = v15;
  return result;
}

- (CGRect)_glyphsBoundingRect
{
  p_cachedBounds = &self->_cachedBounds;
  [(GKCurvedTextLabel *)self bounds];
  v40.origin.CGFloat x = v4;
  v40.origin.CGFloat y = v5;
  v40.size.CGFloat width = v6;
  v40.size.CGFloat height = v7;
  if (CGRectEqualToRect(*p_cachedBounds, v40) && !CGRectIsEmpty(self->_cachedGlyphsBoundingRect))
  {
    CGFloat x = self->_cachedGlyphsBoundingRect.origin.x;
    CGFloat y = self->_cachedGlyphsBoundingRect.origin.y;
    CGFloat width = self->_cachedGlyphsBoundingRect.size.width;
    CGFloat height = self->_cachedGlyphsBoundingRect.size.height;
  }
  else
  {
    uint64_t v32 = 0;
    v33 = (CGRect *)&v32;
    uint64_t v34 = 0x4010000000;
    v35 = &unk_1AF895502;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v36 = *MEMORY[0x1E4F1DB20];
    long long v37 = v8;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0x10000000000000;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0x10000000000000;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __40__GKCurvedTextLabel__glyphsBoundingRect__block_invoke;
    v23[3] = &unk_1E5F653C8;
    v23[4] = &v32;
    v23[5] = &v28;
    v23[6] = &v24;
    [(GKCurvedTextLabel *)self _enumerateTransformsForDrawableCharacters:v23];
    CGRect v38 = CGRectInset(v33[1], 0.0, -1.0);
    v33[1] = v38;
    [(GKCurvedTextLabel *)self bounds];
    p_cachedBounds->origin.CGFloat x = v9;
    p_cachedBounds->origin.CGFloat y = v10;
    p_cachedBounds->size.CGFloat width = v11;
    p_cachedBounds->size.CGFloat height = v12;
    p_CGFloat x = &v33->origin.x;
    CGSize size = v33[1].size;
    self->_cachedGlyphsBoundingRect.origin = v33[1].origin;
    self->_cachedGlyphsBoundingRect.CGSize size = size;
    *(void *)&self->_cachedLeadingAngle = v29[3];
    *(void *)&self->_cachedTrailingAngle = v25[3];
    CGFloat x = p_x[4];
    CGFloat y = p_x[5];
    CGFloat width = p_x[6];
    CGFloat height = p_x[7];
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

void __40__GKCurvedTextLabel__glyphsBoundingRect__block_invoke(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, uint64_t a9, uint64_t a10, _OWORD *a11)
{
  double v12 = a5;
  long long v15 = a11[1];
  *(_OWORD *)&v24.a = *a11;
  *(_OWORD *)&v24.c = v15;
  *(_OWORD *)&v24.tCGFloat x = a11[2];
  *(double *)&long long v15 = a7;
  CGRect v25 = CGRectApplyAffineTransform(*(CGRect *)(&v12 - 1), &v24);
  *(CGRect *)(*(void *)(a1[4] + 8) + 32) = CGRectUnion(v25, *(CGRect *)(*(void *)(a1[4] + 8) + 32));
  uint64_t v17 = *(void *)(a1[5] + 8);
  double v18 = *(double *)(v17 + 24);
  if (v18 >= a8) {
    double v19 = a8;
  }
  else {
    double v19 = *(double *)(v17 + 24);
  }
  if (v18 == 2.22507386e-308) {
    double v20 = a8;
  }
  else {
    double v20 = v19;
  }
  *(double *)(v17 + 24) = v20;
  uint64_t v21 = *(void *)(a1[6] + 8);
  double v22 = *(double *)(v21 + 24);
  if (v22 < a8 || v22 == 2.22507386e-308) {
    double v22 = a8;
  }
  *(double *)(v21 + 24) = v22;
}

- (double)_distance
{
  double result = self->_circleRadius;
  if (!self->_interior) {
    return -result;
  }
  return result;
}

- (void)_enumerateTransformsForDrawableCharacters:(id)a3
{
  CGFloat v4 = a3;
  [(GKCurvedTextLabel *)self bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [(GKCurvedTextLabel *)self _distance];
  double v14 = v13;
  long long v15 = [(GKCurvedTextLabel *)self _newLineFromDrawableTextStorage];
  CGRect ImageBounds = CTLineGetImageBounds(v15, 0);
  CGFloat x = ImageBounds.origin.x;
  CGFloat y = ImageBounds.origin.y;
  CGFloat height = ImageBounds.size.height;
  CGFloat width = ImageBounds.size.width;
  CGFloat MinX = 0.0;
  double TypographicBounds = 0.0;
  if (self->_hasMonospacedNumbers) {
    double TypographicBounds = CTLineGetTypographicBounds(v15, 0, 0, 0);
  }
  CFRelease(v15);
  CGFloat v60 = y;
  if (self->_hasMonospacedNumbers)
  {
    double v19 = TypographicBounds;
  }
  else
  {
    v99.origin.CGFloat x = x;
    v99.origin.CGFloat y = y;
    v99.size.CGFloat height = height;
    v99.size.CGFloat width = width;
    CGFloat v20 = CGRectGetWidth(v99);
    CGFloat v21 = y;
    double v19 = v20;
    if (!self->_hasMonospacedNumbers)
    {
      CGFloat v22 = x;
      CGFloat v24 = height;
      CGFloat v23 = width;
      CGFloat MinX = CGRectGetMinX(*(CGRect *)(&v21 - 1));
    }
  }
  CGFloat v61 = x;
  v97[0] = xmmword_1AF7CAEE0;
  unint64_t v25 = [(GKCurvedTextLabel *)self _drawableCharacterRange:v97];
  uint64_t v27 = v26;
  if (self->_hasMonospacedNumbers)
  {
    uint64_t v28 = [(NSTextStorage *)self->_textStorage attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
    v100.origin.CGFloat y = v60;
    v100.origin.CGFloat x = x;
    v100.size.CGFloat height = height;
    v100.size.CGFloat width = width;
    CGFloat rect = CGRectGetMinX(v100);
    [v28 xHeight];
    *(double *)&uint64_t v72 = v14;
    CGFloat v30 = v29;
    [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:0];
    uint64_t v66 = v12;
    uint64_t v68 = v10;
    double v32 = v31;
    v101.origin.CGFloat y = 0.0;
    v101.origin.CGFloat x = v33 + 0.0;
    CGFloat v34 = v101.origin.x;
    v101.size.CGFloat width = rect;
    v101.size.CGFloat height = v30;
    v102.origin.CGFloat y = v32 - CGRectGetMaxY(v101);
    CGFloat v58 = v102.origin.y;
    v102.origin.CGFloat x = v34;
    v102.size.CGFloat width = rect;
    v102.size.CGFloat height = v30;
    double v96 = 0.0;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v93 = 0u;
    double MidX = CGRectGetMidX(v102);
    CGFloat v35 = v32;
    uint64_t v12 = v66;
    _TransformForLayoutLocation((uint64_t)&v93, MidX, v35, v19, *(double *)&v72, self->_centerAngle, v6, v8, v68, v66);
    v103.origin.CGFloat x = v34;
    uint64_t v10 = v68;
    v103.origin.CGFloat y = v58;
    v103.size.CGFloat height = v30;
    v103.size.CGFloat width = rect;
    double v14 = *(double *)&v72;
    CGRect v104 = CGRectOffset(v103, -MidX, -v35);
    long long v36 = (void (*)(void *, uint64_t, void, long long *, double, double, double, double, double, double, double))v4[2];
    long long v90 = v93;
    long long v91 = v94;
    long long v92 = v95;
    v36(v4, 0x7FFFFFFFFFFFFFFFLL, 0, &v90, MidX, v35, v104.origin.x, v104.origin.y, v104.size.width, v104.size.height, v96);
  }
  unint64_t v73 = v25 + v27;
  if (v25 < v25 + v27)
  {
    v70 = v4;
    do
    {
      long long v93 = xmmword_1AF7CAEE0;
      unint64_t v38 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self->_layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", v25, 1, &v93);
      uint64_t v39 = *(void *)&v97[0];
      uint64_t v40 = v93;
      if (*(void *)&v97[0] == (void)v93) {
        uint64_t v41 = 1;
      }
      else {
        uint64_t v41 = v37;
      }
      v42 = objc_opt_new();
      uint64_t v43 = v41;
      unint64_t v44 = v38;
      if (v38 < v41 + v38)
      {
        do
        {
          if (([(NSLayoutManager *)self->_layoutManager propertyForGlyphAtIndex:v44] & 1) == 0) {
            [v42 addIndex:v44];
          }
          ++v44;
          --v43;
        }
        while (v43);
      }
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __63__GKCurvedTextLabel__enumerateTransformsForDrawableCharacters___block_invoke;
      v75[3] = &unk_1E5F653F0;
      v75[4] = self;
      uint64_t v77 = 0;
      CGFloat v78 = MinX;
      long long v79 = v93;
      uint64_t v80 = v41;
      BOOL v89 = v39 == v40;
      double v81 = v19;
      double v82 = v14;
      uint64_t v83 = v6;
      uint64_t v84 = v8;
      uint64_t v85 = v10;
      uint64_t v86 = v12;
      if (v39 == v40) {
        v45 = (char *)v97 + 8;
      }
      else {
        v45 = (char *)&v93 + 8;
      }
      CGFloat v4 = v70;
      v76 = v70;
      unint64_t v87 = v38;
      uint64_t v88 = v41;
      [v42 enumerateRangesUsingBlock:v75];
      uint64_t v46 = *(void *)v45;
      if (*(void *)v45 <= 1uLL) {
        uint64_t v46 = 1;
      }
      v25 += v46;
    }
    while (v25 < v73);
  }
  if (self->_hasMonospacedNumbers)
  {
    unint64_t v47 = v73 - 1;
    v48 = [(NSTextStorage *)self->_textStorage attribute:*MEMORY[0x1E4FB06F8] atIndex:v73 - 1 effectiveRange:0];
    v105.origin.CGFloat x = v61;
    v105.origin.CGFloat y = v60;
    uint64_t v74 = v6;
    v105.size.CGFloat width = width;
    uint64_t v71 = v8;
    v105.size.CGFloat height = height;
    CGFloat v69 = TypographicBounds - CGRectGetMaxX(v105);
    v106.origin.CGFloat x = v61;
    v106.origin.CGFloat y = v60;
    v106.size.CGFloat width = width;
    v106.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v106);
    [v48 xHeight];
    CGFloat v51 = v50;
    [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:[(NSLayoutManager *)self->_layoutManager glyphIndexForCharacterAtIndex:v47]];
    double v53 = v52;
    v107.origin.CGFloat y = 0.0;
    v107.origin.CGFloat x = MaxX + 0.0;
    v107.size.CGFloat width = v69;
    v107.size.CGFloat height = v51;
    v108.origin.CGFloat y = v53 - CGRectGetMaxY(v107);
    CGFloat v67 = v108.origin.y;
    v108.origin.CGFloat x = MaxX + 0.0;
    v108.size.CGFloat width = v69;
    v108.size.CGFloat height = v51;
    CGFloat v54 = CGRectGetMidX(v108);
    double v96 = 0.0;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v93 = 0u;
    uint64_t v57 = v10;
    double v55 = v54;
    _TransformForLayoutLocation((uint64_t)&v93, v54, v53, v19, v14, self->_centerAngle, v74, v71, v57, v12);
    v109.origin.CGFloat x = MaxX + 0.0;
    v109.origin.CGFloat y = v67;
    v109.size.CGFloat width = v69;
    v109.size.CGFloat height = v51;
    CGRect v110 = CGRectOffset(v109, -v55, -v53);
    v56 = (void (*)(void *, uint64_t, void, long long *, double, double, double, double, double, double, double))v4[2];
    long long v90 = v93;
    long long v91 = v94;
    long long v92 = v95;
    v56(v4, 0x7FFFFFFFFFFFFFFFLL, 0, &v90, v55, v53, v110.origin.x, v110.origin.y, v110.size.width, v110.size.height, v96);
  }
}

void __63__GKCurvedTextLabel__enumerateTransformsForDrawableCharacters___block_invoke(uint64_t a1, uint64_t a2, CFIndex a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 808) locationForGlyphAtIndex:a2];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = a2 + 1;
  if (a2 + 1 < (unint64_t)(a2 + a3))
  {
    CFIndex v11 = a3 - 1;
    do
    {
      [*(id *)(*(void *)(a1 + 32) + 808) locationForGlyphAtIndex:v10];
      if (v12 < v7)
      {
        double v9 = v13;
        double v7 = v12;
      }
      ++v10;
      --v11;
    }
    while (v11);
  }
  double v14 = *(double *)(a1 + 48);
  double v15 = *(double *)(a1 + 56);
  double v16 = [*(id *)(*(void *)(a1 + 32) + 800) attribute:*MEMORY[0x1E4FB06F8] atIndex:*(void *)(a1 + 64) effectiveRange:0];
  MEMORY[0x1F4188790](v16);
  double v18 = (const CGGlyph *)((char *)v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 808), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", a2, a3, v18, 0, 0, 0);
  CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v16, kCTFontOrientationDefault, v18, 0, a3);
  double x = BoundingRectsForGlyphs.origin.x;
  CGFloat y = BoundingRectsForGlyphs.origin.y;
  CGFloat width = BoundingRectsForGlyphs.size.width;
  if (*(unsigned char *)(a1 + 152))
  {
    [(__CTFont *)v16 xHeight];
    CGFloat height = v22;
  }
  else
  {
    CGFloat height = BoundingRectsForGlyphs.size.height;
  }
  CGFloat v24 = v7 + v14 - v15 + x;
  v35.origin.double x = v24;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGFloat v25 = v9 - CGRectGetMaxY(v35);
  v36.origin.double x = v24;
  v36.origin.CGFloat y = v25;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v36);
  double v32 = 0.0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  _TransformForLayoutLocation((uint64_t)&v29, MidX, v9, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(*(void *)(a1 + 32) + 968), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128));
  v37.origin.double x = v24;
  v37.origin.CGFloat y = v25;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGRect v38 = CGRectOffset(v37, -MidX, -v9);
  uint64_t v27 = *(void (**)(double, double, double, double, double, double, double))(*(void *)(a1 + 40) + 16);
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  v27(MidX, v9, v38.origin.x, v38.origin.y, v38.size.width, v38.size.height, v32);
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (BOOL)interior
{
  return self->_interior;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (double)maxAngularWidth
{
  return self->_maxAngularWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);

  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end