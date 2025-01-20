@interface CLKUICurvedLabel
- (BOOL)_hasImage;
- (BOOL)attributedTextProvidesColor;
- (BOOL)interior;
- (BOOL)isTextTruncated;
- (CGAffineTransform)_transformForLayoutLocation:(SEL)a3 usedWidth:(CGPoint)a4 distance:(double)a5 centerAngle:(double)a6 bounds:(double)a7;
- (CGAffineTransform)transformForImage;
- (CGPoint)_offsetOfBoundingRect:(CGRect)a3 inRect:(CGRect)a4;
- (CGPoint)centerForImage;
- (CGRect)_glyphsBoundingRect;
- (CGRect)_imageBounds;
- (CGRect)textBoundingRect;
- (CGSize)imageViewOverrideSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKUICurvedLabel)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIBezierPath)path;
- (UIColor)textColor;
- (UIEdgeInsets)opticalInsets;
- (UIFont)font;
- (UIView)imageView;
- (_NSRange)_drawableCharacterRange:(_NSRange *)a3;
- (__CTLine)_newLineFromDrawableTextStorage;
- (double)_distance;
- (double)_extraWidthForImage;
- (double)_lastLineBaseline;
- (double)alpha;
- (double)animationAlpha;
- (double)baselineOffset;
- (double)centerAngle;
- (double)circleRadius;
- (double)imagePadding;
- (double)maxAngularWidth;
- (double)maxLinearTextWidth;
- (double)maxLinearWidth;
- (double)tracking;
- (int64_t)textAlignment;
- (unint64_t)imagePlacement;
- (void)_enumerateTransforms:(BOOL)a3 callback:(id)a4;
- (void)_enumerateTransformsForDrawableCharacters:(id)a3;
- (void)_setAttributedText:(id)a3;
- (void)_transformForImage:(id)a3;
- (void)_updateMaxSize;
- (void)_updateTextColor;
- (void)_updateTracking;
- (void)dealloc;
- (void)drawTextInRect:(CGRect)a3;
- (void)getTextCenter:(CGPoint *)a3 startAngle:(double *)a4 endAngle:(double *)a5;
- (void)invalidateCachedSize;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAlpha:(double)a3;
- (void)setAnimationAlpha:(double)a3;
- (void)setAttributedText:(id)a3;
- (void)setAttributedTextProvidesColor:(BOOL)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setCenterAngle:(double)a3;
- (void)setCircleRadius:(double)a3;
- (void)setFont:(id)a3;
- (void)setImagePadding:(double)a3;
- (void)setImagePlacement:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)setImageView:(id)a3 placement:(unint64_t)a4 padding:(double)a5;
- (void)setImageViewOverrideSize:(CGSize)a3;
- (void)setInterior:(BOOL)a3;
- (void)setMaxAngularWidth:(double)a3;
- (void)setPath:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTracking:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CLKUICurvedLabel

- (CLKUICurvedLabel)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CLKUICurvedLabel;
  v3 = -[CLKUICurvedLabel initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    textContainer = v3->_textContainer;
    v3->_textContainer = (NSTextContainer *)v4;

    [(NSTextContainer *)v3->_textContainer setMaximumNumberOfLines:1];
    [(NSTextContainer *)v3->_textContainer setLineFragmentPadding:0.0];
    [(NSTextContainer *)v3->_textContainer setLineBreakMode:4];
    uint64_t v6 = objc_opt_new();
    layoutManager = v3->_layoutManager;
    v3->_layoutManager = (NSLayoutManager *)v6;

    [(NSLayoutManager *)v3->_layoutManager addTextContainer:v3->_textContainer];
    uint64_t v8 = objc_opt_new();
    textStorage = v3->_textStorage;
    v3->_textStorage = (NSTextStorage *)v8;

    [(NSTextStorage *)v3->_textStorage addLayoutManager:v3->_layoutManager];
    uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v10;

    v3->_viewAlpha = 1.0;
    v3->_animationAlpha = 1.0;
    v3->_usesPath = 0;
    v12 = objc_alloc_init(CLKUICurvedCircleGlyphLayoutProvider);
    circleGlyphLayoutProvider = v3->_circleGlyphLayoutProvider;
    v3->_circleGlyphLayoutProvider = v12;

    v14 = objc_alloc_init(CLKUICurvedPathGlyphLayoutProvider);
    pathGlyphLayoutProvider = v3->_pathGlyphLayoutProvider;
    v3->_pathGlyphLayoutProvider = v14;
  }
  return v3;
}

- (void)dealloc
{
  p_imageView = &self->_imageView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  [WeakRetained removeObserver:self forKeyPath:@"bounds" context:&kImageViewBoundsContext];

  id v5 = objc_loadWeakRetained((id *)p_imageView);
  [v5 removeObserver:self forKeyPath:@"frame" context:&kImageViewBoundsContext];

  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedLabel;
  [(CLKUICurvedLabel *)&v6 dealloc];
}

- (double)_lastLineBaseline
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUICurvedLabel;
  [(CLKUICurvedLabel *)&v3 _lastLineBaseline];
  return result;
}

- (void)setInterior:(BOOL)a3
{
  if (self->_interior != a3)
  {
    self->_interior = a3;
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self _updateTracking];
    [(CLKUICurvedLabel *)self setNeedsLayout];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
  }
}

- (void)setCircleRadius:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_circleRadius = a3;
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self _updateMaxSize];
    [(CLKUICurvedLabel *)self setNeedsLayout];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
  }
}

- (void)setCenterAngle:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_centerAngle = a3;
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self setNeedsLayout];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
  }
}

- (void)setMaxAngularWidth:(double)a3
{
  double v3 = a3;
  double v5 = fmod(a3, 6.28318531);
  if (v3 > 6.28318531) {
    double v3 = v5;
  }
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_maxAngularWidth = v3;
    [(CLKUICurvedLabel *)self _updateMaxSize];
  }
}

- (void)setPath:(id)a3
{
  double v5 = (UIBezierPath *)a3;
  if (self->_path != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_path, a3);
    self->_usesPath = 1;
    [(CLKUICurvedPathGlyphLayoutProvider *)self->_pathGlyphLayoutProvider setPath:self->_path];
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self _updateMaxSize];
    [(CLKUICurvedLabel *)self _updateTracking];
    [(CLKUICurvedLabel *)self setNeedsLayout];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
    double v5 = v6;
  }
}

- (double)maxLinearWidth
{
  double maxTextWidth = self->_maxTextWidth;
  [(CLKUICurvedLabel *)self _extraWidthForImage];
  return maxTextWidth + v3;
}

- (double)maxLinearTextWidth
{
  return self->_maxTextWidth;
}

- (double)_extraWidthForImage
{
  double Width = 0.0;
  if ([(CLKUICurvedLabel *)self _hasImage])
  {
    [(CLKUICurvedLabel *)self _imageBounds];
    double Width = CGRectGetWidth(v5);
    if ([(NSTextStorage *)self->_textStorage length]) {
      return Width + self->_imagePadding;
    }
  }
  return Width;
}

- (void)_updateMaxSize
{
  if (self->_usesPath)
  {
    p_pathGlyphLayoutProvider = (id *)&self->_pathGlyphLayoutProvider;
  }
  else
  {
    p_pathGlyphLayoutProvider = (id *)&self->_circleGlyphLayoutProvider;
    [(CLKUICurvedCircleGlyphLayoutProvider *)self->_circleGlyphLayoutProvider setMaxAngularWidth:self->_maxAngularWidth];
    [*p_pathGlyphLayoutProvider setCircleRadius:self->_circleRadius];
  }
  id v4 = *p_pathGlyphLayoutProvider;
  [(CLKUICurvedLabel *)self _extraWidthForImage];
  objc_msgSend(v4, "setExtraWidthForImage:");
  [*p_pathGlyphLayoutProvider maxTextWidth];
  double v6 = v5;
  [(NSTextContainer *)self->_textContainer size];
  if (!CLKFloatEqualsFloat() || (CLKFloatEqualsFloat() & 1) == 0)
  {
    -[NSTextContainer setSize:](self->_textContainer, "setSize:", v6, 1.79769313e308);
    self->_double maxTextWidth = v6;
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self setNeedsLayout];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
  }
}

- (BOOL)isTextTruncated
{
  isTextTruncated = self->_isTextTruncated;
  if (!isTextTruncated)
  {
    long long v7 = xmmword_1D31B6A30;
    [(CLKUICurvedLabel *)self _drawableCharacterRange:&v7];
    [NSNumber numberWithInt:v7 != 0x7FFFFFFFFFFFFFFFLL];
    id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_isTextTruncated;
    self->_isTextTruncated = v4;

    isTextTruncated = self->_isTextTruncated;
  }
  return [(NSNumber *)isTextTruncated BOOLValue];
}

- (void)setTextColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_textColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(CLKUICurvedLabel *)self _updateTextColor];
  }
}

- (void)_updateTextColor
{
  uint64_t v3 = [(NSTextStorage *)self->_textStorage length];
  id v4 = self->_textColor;
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    double viewAlpha = self->_viewAlpha;
    double v16 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    double v14 = 1.0;
    [(UIColor *)v4 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
    double v14 = viewAlpha * v14;
    uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:v14 * v17 green:v14 * v16 blue:v14 * v15 alpha:1.0];

    id v4 = (UIColor *)v6;
  }
  if ([(CLKUICurvedLabel *)self attributedTextProvidesColor])
  {
    long long v7 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, v3);
    attributedStringWithoutColorModification = self->_attributedStringWithoutColorModification;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__CLKUICurvedLabel__updateTextColor__block_invoke;
    v12[3] = &unk_1E697C208;
    id v13 = v7;
    id v9 = v7;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](attributedStringWithoutColorModification, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0x100000, v12);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__CLKUICurvedLabel__updateTextColor__block_invoke_2;
    v10[3] = &unk_1E697C230;
    v10[4] = self;
    v11 = v4;
    [v9 enumerateRangesUsingBlock:v10];
  }
  else
  {
    -[NSTextStorage addAttribute:value:range:](self->_textStorage, "addAttribute:value:range:", *MEMORY[0x1E4FB12B8], v4, 0, v3);
  }
  [(CLKUICurvedLabel *)self setNeedsDisplay];
}

void __36__CLKUICurvedLabel__updateTextColor__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  long long v7 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FB12B8]];

  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "removeIndexesInRange:", a3, a4);
  }
}

uint64_t __36__CLKUICurvedLabel__updateTextColor__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 800), "addAttribute:value:range:", *MEMORY[0x1E4FB12B8], *(void *)(a1 + 40), a2, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setAlpha:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_double viewAlpha = a3;
    [(CLKUICurvedLabel *)self _updateTextColor];
  }
}

- (double)alpha
{
  return self->_viewAlpha;
}

- (void)setAnimationAlpha:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_animationAlpha = a3;
    v5.receiver = self;
    v5.super_class = (Class)CLKUICurvedLabel;
    [(CLKUICurvedLabel *)&v5 setAlpha:a3];
  }
}

- (UIEdgeInsets)opticalInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_setAttributedText:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToAttributedString:self->_attributedStringUnmodified] & 1) == 0)
  {
    double v5 = (NSAttributedString *)[v4 copy];
    attributedStringUnmodified = self->_attributedStringUnmodified;
    self->_attributedStringUnmodified = v5;

    if (!v4) {
      goto LABEL_10;
    }
    uint64_t v7 = [v4 length];
    uint64_t v8 = 0;
    id v9 = 0;
    while (1)
    {
      uint64_t v10 = [v4 string];
      v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v11, 0, v8, v7);
      uint64_t v14 = v13;

      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (!v9) {
        id v9 = (void *)[v4 mutableCopy];
      }
      double v15 = [v9 mutableString];
      objc_msgSend(v15, "replaceCharactersInRange:withString:", v12, v14, @" ");

      uint64_t v8 = v12 + 1;
      uint64_t v7 = [v4 length] - v8;
    }
    if (v9)
    {
      id v16 = v9;
      double v17 = v16;
    }
    else
    {
LABEL_10:
      id v16 = (id)[v4 mutableCopy];
      double v17 = 0;
    }
    uint64_t v18 = [v16 length];
    self->_storageIsEmpty = v18 == 0;
    if (!v18)
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@"​"];

      id v16 = (id)v19;
    }
    uint64_t v20 = *MEMORY[0x1E4FB12D0];
    if (_CurvedParagraphStyle_onceToken != -1) {
      dispatch_once(&_CurvedParagraphStyle_onceToken, &__block_literal_global_11);
    }
    id v21 = (id)_CurvedParagraphStyle_paragraphStyle;
    objc_msgSend(v16, "addAttribute:value:range:", v20, v21, 0, objc_msgSend(v16, "length"));

    [(NSTextStorage *)self->_textStorage setAttributedString:v16];
    v22 = (NSAttributedString *)[v16 copy];
    attributedStringWithoutColorModification = self->_attributedStringWithoutColorModification;
    self->_attributedStringWithoutColorModification = v22;

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    textStorage = self->_textStorage;
    uint64_t v25 = [(NSTextStorage *)textStorage length];
    uint64_t v26 = *MEMORY[0x1E4FB12B0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __39__CLKUICurvedLabel__setAttributedText___block_invoke;
    v27[3] = &unk_1E697C258;
    v27[4] = &v28;
    -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v26, 0, v25, 0, v27);
    self->_hasMonospacedNumbers = *((unsigned char *)v29 + 24);
    [(CLKUICurvedLabel *)self _updateTextColor];
    [(CLKUICurvedLabel *)self _updateTracking];
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
    [(CLKUICurvedLabel *)self setNeedsLayout];
    _Block_object_dispose(&v28, 8);
  }
}

void __39__CLKUICurvedLabel__setAttributedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v5 = [a2 fontDescriptor];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FB2868]];

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
    uint64_t v11 = *MEMORY[0x1E4FB2898];
    uint64_t v12 = *MEMORY[0x1E4FB2888];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v15 = [v14 objectForKeyedSubscript:v11];
        if ([v15 isEqualToNumber:&unk_1F2A6A770])
        {
          id v16 = [v14 objectForKeyedSubscript:v12];
          int v17 = [v16 isEqualToNumber:&unk_1F2A6A788];

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

- (void)setAttributedText:(id)a3
{
  self->_storageIsNonAttributedText = 0;
  [(CLKUICurvedLabel *)self _setAttributedText:a3];
}

- (NSAttributedString)attributedText
{
  BOOL storageIsEmpty = self->_storageIsEmpty;
  textStorage = self->_textStorage;
  if (storageIsEmpty)
  {
    -[NSTextStorage attributedSubstringFromRange:](textStorage, "attributedSubstringFromRange:", 0, 0);
    id v4 = (NSTextStorage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = textStorage;
  }
  return (NSAttributedString *)v4;
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
    uint64_t v10 = *MEMORY[0x1E4FB12B0];
    v11[0] = font;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v6 initWithString:v5 attributes:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  self->_storageIsNonAttributedText = 1;
  [(CLKUICurvedLabel *)self _setAttributedText:v9];
}

- (NSString)text
{
  double v2 = [(CLKUICurvedLabel *)self attributedText];
  double v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_font] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    if (self->_storageIsNonAttributedText)
    {
      id v5 = [(CLKUICurvedLabel *)self text];
      [(CLKUICurvedLabel *)self setText:v5];
    }
  }
}

- (UIFont)font
{
  return self->_font;
}

- (void)setTracking:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_tracking = a3;
    [(CLKUICurvedLabel *)self _updateTracking];
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self setNeedsLayout];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
  }
}

- (void)_updateTracking
{
  [(CLKUICurvedLabel *)self tracking];
  if (v3 < 0.0) {
    double v3 = -v3;
  }
  if (v3 > 0.00000011920929)
  {
    uint64_t v4 = [(NSTextStorage *)self->_textStorage length];
    textStorage = self->_textStorage;
    uint64_t v6 = *MEMORY[0x1E4FB12C0];
    id v7 = NSNumber;
    [(CLKUICurvedLabel *)self tracking];
    CLKKernValueForDesignSpecTrackingValue();
    objc_msgSend(v7, "numberWithDouble:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSTextStorage addAttribute:value:range:](textStorage, "addAttribute:value:range:", v6, v8, 0, v4);
  }
}

- (void)setBaselineOffset:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_baselineOffset = a3;
    pathGlyphLayoutProvider = self->_pathGlyphLayoutProvider;
    [(CLKUICurvedPathGlyphLayoutProvider *)pathGlyphLayoutProvider setBaselineOffset:a3];
  }
}

- (void)setImagePlacement:(unint64_t)a3
{
  if (self->_imagePlacement != a3)
  {
    self->_imagePlacement = a3;
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
    [(CLKUICurvedLabel *)self setNeedsLayout];
  }
}

- (void)setImagePadding:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_imagePadding = a3;
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
    [(CLKUICurvedLabel *)self setNeedsLayout];
  }
}

- (void)setImageView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_imageView);
    [v6 removeObserver:self forKeyPath:@"bounds" context:&kImageViewBoundsContext];

    id v7 = objc_loadWeakRetained((id *)&self->_imageView);
    [v7 removeObserver:self forKeyPath:@"frame" context:&kImageViewBoundsContext];

    id v8 = objc_loadWeakRetained((id *)&self->_imageView);
    [v8 removeFromSuperview];

    id v9 = objc_storeWeak((id *)&self->_imageView, obj);
    if (obj)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_imageView);
      uint64_t v11 = [v10 layer];
      objc_msgSend(v11, "setAnchorPoint:", 0.5, 1.0);

      id v12 = objc_loadWeakRetained((id *)&self->_imageView);
      [v12 sizeToFit];

      id v13 = objc_loadWeakRetained((id *)&self->_imageView);
      [v13 addObserver:self forKeyPath:@"bounds" options:3 context:&kImageViewBoundsContext];

      id v14 = objc_loadWeakRetained((id *)&self->_imageView);
      [v14 addObserver:self forKeyPath:@"frame" options:3 context:&kImageViewBoundsContext];

      id v15 = objc_loadWeakRetained((id *)&self->_imageView);
      [(CLKUICurvedLabel *)self addSubview:v15];
    }
    else
    {
      self->_imagePlacement = 0;
    }
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self _updateMaxSize];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
    [(CLKUICurvedLabel *)self setNeedsLayout];
    id v5 = obj;
  }
}

- (void)setImageViewOverrideSize:(CGSize)a3
{
  if (self->_imageViewOverrideSize.width != a3.width || self->_imageViewOverrideSize.height != a3.height)
  {
    self->_imageViewOverrideSize = a3;
    [(CLKUICurvedLabel *)self invalidateCachedSize];
    [(CLKUICurvedLabel *)self _updateMaxSize];
    [(CLKUICurvedLabel *)self setNeedsDisplay];
    [(CLKUICurvedLabel *)self setNeedsLayout];
  }
}

- (void)setImageView:(id)a3 placement:(unint64_t)a4 padding:(double)a5
{
  self->_imagePlacement = a4;
  self->_imagePadding = a5;
  [(CLKUICurvedLabel *)self setImageView:a3];
}

- (BOOL)_hasImage
{
  if (!self->_imagePlacement) {
    return 0;
  }
  [(CLKUICurvedLabel *)self _imageBounds];
  return !CGRectIsEmpty(v3);
}

- (void)invalidateCachedSize
{
  self->_cachedSizeIsValid = 0;
  isTextTruncated = self->_isTextTruncated;
  self->_isTextTruncated = 0;

  self->_cachedSize = (CGSize)*MEMORY[0x1E4F1DB30];
  CGPoint v5 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_cachedBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_cachedBounds.size = v4;
  self->_cachedGlyphsBoundingRect.origin = v5;
  self->_cachedGlyphsBoundingRect.size = v4;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CLKUICurvedLabel;
  [(CLKUICurvedLabel *)&v9 layoutSubviews];
  BOOL v3 = [(CLKUICurvedLabel *)self _hasImage];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  CGPoint v5 = WeakRetained;
  if (v3)
  {
    [WeakRetained setHidden:0];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __34__CLKUICurvedLabel_layoutSubviews__block_invoke;
    v8[3] = &unk_1E697C280;
    v8[4] = self;
    [(CLKUICurvedLabel *)self _transformForImage:v8];
    [(CLKUICurvedLabel *)self transformForImage];
    id v6 = [(CLKUICurvedLabel *)self imageView];
    *(_OWORD *)id v7 = *(_OWORD *)&v7[7];
    *(_OWORD *)&v7[2] = *(_OWORD *)&v7[9];
    *(_OWORD *)&v7[4] = *(_OWORD *)&v7[11];
    [v6 setTransform:v7];
  }
  else
  {
    [WeakRetained setHidden:1];
  }
}

void __34__CLKUICurvedLabel_layoutSubviews__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v14 = [*(id *)(a1 + 32) imageView];
  [v14 bounds];
  objc_msgSend(v14, "setBounds:");
  objc_super v9 = [v14 layer];
  [v9 anchorPoint];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v14, "setCenter:", a2 + v11 * a4, a3 + v13 * a5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (!self->_cachedSizeIsValid)
  {
    [(CLKUICurvedLabel *)self _glyphsBoundingRect];
    CGSize v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    CGPoint v5 = [v4 device];

    CLKCeilForDevice();
    CGFloat v7 = v6;
    CLKCeilForDevice();
    self->_cachedSize.double width = v7;
    self->_cachedSize.double height = v8;
    self->_cachedSizeIsValid = 1;
  }
  double width = self->_cachedSize.width;
  double height = self->_cachedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CLKUICurvedLabel;
  id v4 = a3;
  [(CLKUICurvedLabel *)&v20 traitCollectionDidChange:v4];
  CGPoint v5 = [(CLKUICurvedLabel *)self traitCollection];
  uint64_t v6 = [v5 legibilityWeight];
  uint64_t v7 = [v4 legibilityWeight];

  if (v6 != v7)
  {
    font = self->_font;
    if (font)
    {
      objc_super v9 = [(UIFont *)font _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v5];
      [(CLKUICurvedLabel *)self setFont:v9];
    }
    if (!self->_storageIsNonAttributedText)
    {
      double v10 = (void *)[(NSAttributedString *)self->_attributedStringUnmodified mutableCopy];
      attributedStringUnmodified = self->_attributedStringUnmodified;
      uint64_t v12 = [(NSAttributedString *)attributedStringUnmodified length];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __45__CLKUICurvedLabel_traitCollectionDidChange___block_invoke;
      int v17 = &unk_1E697C2A8;
      id v18 = v5;
      id v19 = v10;
      id v13 = v10;
      -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](attributedStringUnmodified, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0x100000, &v14);
      -[CLKUICurvedLabel setAttributedText:](self, "setAttributedText:", v13, v14, v15, v16, v17);
    }
  }
}

void __45__CLKUICurvedLabel_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x1E4FB12B0];
  id v10 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FB12B0]];
  CGFloat v8 = [v10 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:*(void *)(a1 + 32)];
  if (v10) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9 && ([v10 isEqual:v8] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v7, v8, a3, a4);
  }
}

- (void)drawTextInRect:(CGRect)a3
{
  [(CLKUICurvedLabel *)self _glyphsBoundingRect];
  -[CLKUICurvedLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:");
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v8 = [(CLKUICurvedLabel *)self _newLineFromDrawableTextStorage];
  CGRect ImageBounds = CTLineGetImageBounds(v8, 0);
  CGFloat x = ImageBounds.origin.x;
  CGFloat y = ImageBounds.origin.y;
  CFRelease(v8);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3010000000;
  v15[3] = "";
  CGFloat v16 = x;
  CGFloat v17 = y;
  if (self->_hasMonospacedNumbers) {
    CGFloat v16 = 0.0;
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  if (!self->_usesPath)
  {
    CGAffineTransformMakeTranslation(&transform, v5, v7);
    CGContextConcatCTM(CurrentContext, &transform);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__CLKUICurvedLabel_drawTextInRect___block_invoke;
  v13[3] = &unk_1E697C2D0;
  v13[4] = self;
  v13[5] = v15;
  [(CLKUICurvedLabel *)self _transformForImage:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__CLKUICurvedLabel_drawTextInRect___block_invoke_2;
  v12[3] = &unk_1E697C2F8;
  v12[5] = v15;
  v12[6] = CurrentContext;
  void v12[4] = self;
  [(CLKUICurvedLabel *)self _enumerateTransformsForDrawableCharacters:v12];
  _Block_object_dispose(v15, 8);
}

uint64_t __35__CLKUICurvedLabel_drawTextInRect___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t result = [*(id *)(a1 + 32) imagePlacement];
  if (result == 1)
  {
    v13.origin.CGFloat x = a2;
    v13.origin.CGFloat y = a3;
    v13.size.double width = a4;
    v13.size.double height = a5;
    double Width = CGRectGetWidth(v13);
    uint64_t result = [*(id *)(a1 + 32) imagePadding];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 32)
                                                                - (Width
                                                                 + v12);
  }
  return result;
}

void __35__CLKUICurvedLabel_drawTextInRect___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, double a5, double a6)
{
  CGContextSaveGState(*(CGContextRef *)(a1 + 48));
  double v12 = *(CGContext **)(a1 + 48);
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
  [(CLKUICurvedLabel *)self _glyphsBoundingRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CLKUICurvedLabel *)self bounds];
  -[CLKUICurvedLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v4, v6, v8, v10, v11, v12, v13, v14);
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
  long long v13 = xmmword_1D31B6A30;
  uint64_t v4 = [(CLKUICurvedLabel *)self _drawableCharacterRange:&v13];
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

- (void)getTextCenter:(CGPoint *)a3 startAngle:(double *)a4 endAngle:(double *)a5
{
  if ([(NSTextStorage *)self->_textStorage length] || [(CLKUICurvedLabel *)self _hasImage])
  {
    [(CLKUICurvedLabel *)self _distance];
    double v10 = v9;
    [(CLKUICurvedLabel *)self _glyphsBoundingRect];
    if (a3)
    {
      double v15 = v11;
      double v16 = v12;
      double v17 = v13;
      double v18 = v14;
      double v47 = v10;
      if ([(NSTextStorage *)self->_textStorage length])
      {
        [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:0];
        [(CLKUICurvedLabel *)self bounds];
      }
      else
      {
        [(UIFont *)self->_font ascender];
        [(CLKUICurvedLabel *)self bounds];
      }
      -[CLKUICurvedLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v15, v16, v17, v18, v20, v21, v22, v23);
      double v26 = v25;
      double v28 = v27;
      [(CLKUICurvedLabel *)self bounds];
      CGFloat x = v48.origin.x;
      CGFloat y = v48.origin.y;
      CGFloat width = v48.size.width;
      CGFloat height = v48.size.height;
      double centerAngle = self->_centerAngle;
      double MidX = CGRectGetMidX(v48);
      __double2 v35 = __sincos_stret(centerAngle);
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.CGFloat width = width;
      double v10 = v47;
      v49.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v49);
      a3->CGFloat x = v26 + MidX - v47 * v35.__sinval;
      a3->CGFloat y = v28 + v46 + MinY - v47 * v35.__cosval;
    }
    v37 = [(CLKUICurvedLabel *)self _newLineFromDrawableTextStorage];
    v38 = v37;
    if (self->_hasMonospacedNumbers)
    {
      double TypographicBounds = CTLineGetTypographicBounds(v37, 0, 0, 0);
    }
    else
    {
      CGRect ImageBounds = CTLineGetImageBounds(v37, 0);
      double TypographicBounds = CGRectGetWidth(ImageBounds);
    }
    double v40 = TypographicBounds;
    CFRelease(v38);
    if ([(CLKUICurvedLabel *)self _hasImage])
    {
      [(CLKUICurvedLabel *)self _imageBounds];
      double v41 = CGRectGetWidth(v51);
      [(CLKUICurvedLabel *)self _drawableCharacterRange:0];
      if (v42) {
        double v41 = v41 + self->_imagePadding;
      }
      double v40 = v40 + v41;
    }
    double v43 = dbl_1D31B6A20[!self->_interior];
    if (a4)
    {
      double v44 = 0.0;
      if (v10 != 0.0) {
        double v44 = (v40 * -0.5 + 0.0) / v10 + self->_centerAngle;
      }
      *a4 = v43 - v44;
    }
    if (a5)
    {
      double v45 = 0.0;
      if (v10 != 0.0) {
        double v45 = (v40 + v40 * -0.5) / v10 + self->_centerAngle;
      }
      *a5 = v43 - v45;
    }
  }
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
  [(CLKUICurvedLabel *)self bounds];
  v33.origin.CGFloat x = v4;
  v33.origin.CGFloat y = v5;
  v33.size.CGFloat width = v6;
  v33.size.CGFloat height = v7;
  if (CGRectEqualToRect(*p_cachedBounds, v33) && !CGRectIsEmpty(self->_cachedGlyphsBoundingRect))
  {
    CGFloat x = self->_cachedGlyphsBoundingRect.origin.x;
    CGFloat y = self->_cachedGlyphsBoundingRect.origin.y;
    CGFloat width = self->_cachedGlyphsBoundingRect.size.width;
    CGFloat height = self->_cachedGlyphsBoundingRect.size.height;
  }
  else
  {
    uint64_t v25 = 0;
    double v26 = (CGRect *)&v25;
    uint64_t v27 = 0x4010000000;
    double v28 = "";
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v29 = *MEMORY[0x1E4F1DB20];
    long long v30 = v8;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __39__CLKUICurvedLabel__glyphsBoundingRect__block_invoke;
    v24[3] = &unk_1E697C320;
    v24[4] = &v25;
    [(CLKUICurvedLabel *)self _transformForImage:v24];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__CLKUICurvedLabel__glyphsBoundingRect__block_invoke_2;
    v23[3] = &unk_1E697C348;
    v23[4] = &v25;
    [(CLKUICurvedLabel *)self _enumerateTransformsForDrawableCharacters:v23];
    CGRect v31 = CGRectInset(v26[1], 0.0, -1.0);
    v26[1] = v31;
    [(CLKUICurvedLabel *)self bounds];
    p_cachedBounds->origin.CGFloat x = v9;
    p_cachedBounds->origin.CGFloat y = v10;
    p_cachedBounds->size.CGFloat width = v11;
    p_cachedBounds->size.CGFloat height = v12;
    p_CGFloat x = &v26->origin.x;
    CGSize size = v26[1].size;
    self->_cachedGlyphsBoundingRect.origin = v26[1].origin;
    self->_cachedGlyphsBoundingRect.CGSize size = size;
    CGFloat x = p_x[4];
    CGFloat y = p_x[5];
    CGFloat width = p_x[6];
    CGFloat height = p_x[7];
    _Block_object_dispose(&v25, 8);
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

void __39__CLKUICurvedLabel__glyphsBoundingRect__block_invoke(uint64_t a1, _OWORD *a2, double a3, double a4, double a5, double a6)
{
  long long v7 = a2[1];
  *(_OWORD *)&v8.a = *a2;
  *(_OWORD *)&v8.c = v7;
  *(_OWORD *)&v8.tCGFloat x = a2[2];
  CGRect v9 = CGRectApplyAffineTransform(*(CGRect *)&a3, &v8);
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(v9, *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32));
}

void __39__CLKUICurvedLabel__glyphsBoundingRect__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, _OWORD *a10)
{
  double v10 = a5;
  long long v13 = a10[1];
  *(_OWORD *)&v15.a = *a10;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tCGFloat x = a10[2];
  *(double *)&long long v13 = a7;
  CGRect v16 = CGRectApplyAffineTransform(*(CGRect *)(&v10 - 1), &v15);
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(v16, *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32));
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
}

- (void)_transformForImage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CLKUICurvedLabel__transformForImage___block_invoke;
  v6[3] = &unk_1E697C370;
  id v7 = v4;
  id v5 = v4;
  [(CLKUICurvedLabel *)self _enumerateTransforms:1 callback:v6];
}

uint64_t __39__CLKUICurvedLabel__transformForImage___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, long long *a10)
{
  CGFloat v11 = *(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 32) + 16);
  long long v12 = a10[1];
  long long v14 = *a10;
  long long v15 = v12;
  long long v16 = a10[2];
  return v11(a4, a5, a6, a7);
}

- (void)_enumerateTransforms:(BOOL)a3 callback:(id)a4
{
  BOOL v4 = a3;
  v113 = a4;
  BOOL v6 = [(CLKUICurvedLabel *)self _hasImage];
  BOOL v7 = v6;
  if (!v4 || v6)
  {
    [(CLKUICurvedLabel *)self bounds];
    uint64_t v111 = v9;
    uint64_t v112 = v8;
    uint64_t v110 = v10;
    uint64_t v12 = v11;
    [(CLKUICurvedLabel *)self _distance];
    double v14 = v13;
    long long v15 = [(CLKUICurvedLabel *)self _newLineFromDrawableTextStorage];
    CGRect ImageBounds = CTLineGetImageBounds(v15, 0);
    CGFloat x = ImageBounds.origin.x;
    CGFloat y = ImageBounds.origin.y;
    CGFloat width = ImageBounds.size.width;
    CGFloat rect = ImageBounds.size.height;
    CGFloat MinX = 0.0;
    double TypographicBounds = 0.0;
    if (self->_hasMonospacedNumbers) {
      double TypographicBounds = CTLineGetTypographicBounds(v15, 0, 0, 0);
    }
    CFRelease(v15);
    CGFloat v98 = width;
    CGFloat v99 = y;
    if (self->_hasMonospacedNumbers)
    {
      double v21 = TypographicBounds;
    }
    else
    {
      v137.origin.CGFloat x = x;
      v137.origin.CGFloat y = y;
      v137.size.CGFloat width = width;
      v137.size.CGFloat height = rect;
      CGFloat v22 = CGRectGetWidth(v137);
      CGFloat v23 = width;
      double v21 = v22;
      if (!self->_hasMonospacedNumbers)
      {
        CGFloat v24 = x;
        CGFloat v25 = y;
        CGFloat v26 = rect;
        CGFloat MinX = CGRectGetMinX(*(CGRect *)(&v23 - 2));
      }
    }
    v135[0] = xmmword_1D31B6A30;
    unint64_t v27 = [(CLKUICurvedLabel *)self _drawableCharacterRange:v135];
    uint64_t v29 = v28;
    double v30 = 0.0;
    if (v7)
    {
      [(CLKUICurvedLabel *)self _imageBounds];
      double v31 = CGRectGetWidth(v138);
      if (v29) {
        double v31 = v31 + self->_imagePadding;
      }
      double v32 = x;
      double v21 = v21 + v31;
      if (self->_imagePlacement == 1) {
        double v30 = v31;
      }
      else {
        double v30 = 0.0;
      }
    }
    else
    {
      double v32 = x;
    }
    if (self->_usesPath)
    {
      [(CLKUICurvedPathGlyphLayoutProvider *)self->_pathGlyphLayoutProvider setTextAlignment:self->_textAlignment];
      [(CLKUICurvedPathGlyphLayoutProvider *)self->_pathGlyphLayoutProvider setUsedWidth:v21];
      double v32 = x;
    }
    if (v4 && v7)
    {
      [(CLKUICurvedLabel *)self _imageBounds];
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      CGFloat v39 = v34;
      long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v132 = *MEMORY[0x1E4F1DAB8];
      long long v133 = v40;
      long long v134 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      if (v29)
      {
        double v101 = v14;
        unint64_t imagePlacement = self->_imagePlacement;
        CGFloat v105 = v34;
        double v42 = v38;
        CGFloat v43 = v33;
        [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:[(NSLayoutManager *)self->_layoutManager glyphIndexForCharacterAtIndex:0]];
        double v45 = v44;
        double v47 = v46;
        [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:[(NSLayoutManager *)self->_layoutManager glyphIndexForCharacterAtIndex:v27 + v29 - 1]];
        if (imagePlacement == 1) {
          double v50 = v47;
        }
        else {
          double v50 = v49;
        }
        if (imagePlacement != 1) {
          double v49 = v47;
        }
        if (v45 >= v48) {
          double v51 = v49;
        }
        else {
          double v51 = v50;
        }
        v139.origin.CGFloat x = v36;
        v139.origin.CGFloat y = v43;
        CGFloat v38 = v42;
        CGFloat v39 = v105;
        v139.size.CGFloat width = v38;
        v139.size.CGFloat height = v105;
        double v52 = v51 - CGRectGetHeight(v139);
        double v108 = v52;
        if (imagePlacement == 1)
        {
          CGFloat v36 = 0.0;
          uint64_t v53 = 0;
          CGFloat v54 = v38;
          CGFloat v55 = v105;
          double MidX = CGRectGetMidX(*(CGRect *)(&v52 - 1));
        }
        else
        {
          CGFloat v88 = v36;
          CGFloat v89 = v38;
          CGFloat v90 = v105;
          CGFloat v91 = v52;
          v151.origin.CGFloat x = v21 - CGRectGetWidth(*(CGRect *)(&v52 - 1));
          v151.origin.CGFloat y = v91;
          CGFloat v36 = v151.origin.x;
          v151.size.CGFloat width = v38;
          v151.size.CGFloat height = v105;
          double MidX = v21 + CGRectGetWidth(v151) * -0.5;
        }
        [(CLKUICurvedLabel *)self centerAngle];
        -[CLKUICurvedLabel _transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:](self, "_transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:", MidX, v51, v21, v101, v92, v112, v111, v110, v12);
        double v33 = v108;
      }
      else
      {
        double MidX = *MEMORY[0x1E4F1DAD8];
        double v51 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      CGFloat v93 = v36;
      CGFloat v94 = v38;
      CGFloat v95 = v39;
      CGRect v152 = CGRectOffset(*(CGRect *)(&v33 - 1), -MidX, -v51);
      v96 = (void (*)(void *, void, void, long long *, double, double, double, double, double, double))v113[2];
      long long v129 = v132;
      long long v130 = v133;
      long long v131 = v134;
      v96(v113, 0, 0, &v129, MidX, v51, v152.origin.x, v152.origin.y, v152.size.width, v152.size.height);
    }
    else
    {
      CGFloat v97 = v32;
      double v102 = v14;
      if (self->_hasMonospacedNumbers)
      {
        v57 = [(NSTextStorage *)self->_textStorage attribute:*MEMORY[0x1E4FB12B0] atIndex:0 effectiveRange:0];
        v140.origin.CGFloat x = v97;
        v140.size.CGFloat width = v98;
        v140.origin.CGFloat y = v99;
        v140.size.CGFloat height = rect;
        CGFloat v58 = CGRectGetMinX(v140);
        [v57 xHeight];
        CGFloat v106 = v59;
        [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:0];
        double v61 = v60;
        double v103 = v60;
        v141.origin.CGFloat y = 0.0;
        v141.origin.CGFloat x = v30 + v62 + 0.0;
        CGFloat v63 = v141.origin.x;
        v141.size.CGFloat width = v58;
        v141.size.CGFloat height = v106;
        v142.origin.CGFloat y = v61 - CGRectGetMaxY(v141);
        CGFloat v104 = v142.origin.y;
        v142.origin.CGFloat x = v63;
        v142.size.CGFloat width = v58;
        v142.size.CGFloat height = v106;
        double v64 = CGRectGetMidX(v142);
        long long v133 = 0u;
        long long v134 = 0u;
        long long v132 = 0u;
        [(CLKUICurvedLabel *)self centerAngle];
        -[CLKUICurvedLabel _transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:](self, "_transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:", v64, v103, v21, v102, v65, v112, v111, v110, v12);
        v143.origin.CGFloat x = v63;
        double v14 = v102;
        v143.origin.CGFloat y = v104;
        v143.size.CGFloat height = v106;
        v143.size.CGFloat width = v58;
        CGRect v144 = CGRectOffset(v143, -v64, -v103);
        v66 = (void (*)(void *, uint64_t, void, long long *, double, double, double, double, double, double))v113[2];
        long long v129 = v132;
        long long v130 = v133;
        long long v131 = v134;
        v66(v113, 0x7FFFFFFFFFFFFFFFLL, 0, &v129, v64, v103, v144.origin.x, v144.origin.y, v144.size.width, v144.size.height);
      }
      unint64_t v107 = v27 + v29;
      while (v27 < v107)
      {
        long long v132 = xmmword_1D31B6A30;
        unint64_t v68 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self->_layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", v27, 1, &v132);
        uint64_t v69 = *(void *)&v135[0];
        uint64_t v70 = v132;
        if (*(void *)&v135[0] == (void)v132) {
          uint64_t v71 = 1;
        }
        else {
          uint64_t v71 = v67;
        }
        v72 = objc_opt_new();
        uint64_t v73 = v71;
        unint64_t v74 = v68;
        if (v68 < v71 + v68)
        {
          do
          {
            if (([(NSLayoutManager *)self->_layoutManager propertyForGlyphAtIndex:v74] & 1) == 0) {
              [v72 addIndex:v74];
            }
            ++v74;
            --v73;
          }
          while (v73);
        }
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __50__CLKUICurvedLabel__enumerateTransforms_callback___block_invoke;
        v114[3] = &unk_1E697C398;
        v114[4] = self;
        double v116 = v30;
        CGFloat v117 = MinX;
        long long v118 = v132;
        uint64_t v119 = v71;
        BOOL v128 = v69 == v70;
        double v120 = v21;
        double v121 = v14;
        uint64_t v122 = v112;
        uint64_t v123 = v111;
        uint64_t v124 = v110;
        uint64_t v125 = v12;
        if (v69 == v70) {
          v75 = (char *)v135 + 8;
        }
        else {
          v75 = (char *)&v132 + 8;
        }
        v115 = v113;
        unint64_t v126 = v68;
        uint64_t v127 = v71;
        [v72 enumerateRangesUsingBlock:v114];
        uint64_t v76 = *(void *)v75;
        if (*(void *)v75 <= 1uLL) {
          uint64_t v76 = 1;
        }
        v27 += v76;
      }
      if (self->_hasMonospacedNumbers)
      {
        v77 = [(NSTextStorage *)self->_textStorage attribute:*MEMORY[0x1E4FB12B0] atIndex:v107 - 1 effectiveRange:0];
        v145.origin.CGFloat x = v97;
        v145.origin.CGFloat y = v99;
        v145.size.CGFloat width = v98;
        v145.size.CGFloat height = rect;
        CGFloat v109 = TypographicBounds - CGRectGetMaxX(v145);
        v146.origin.CGFloat x = v97;
        v146.origin.CGFloat y = v99;
        v146.size.CGFloat width = v98;
        v146.size.CGFloat height = rect;
        double MaxX = CGRectGetMaxX(v146);
        [v77 xHeight];
        CGFloat v80 = v79;
        [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:[(NSLayoutManager *)self->_layoutManager glyphIndexForCharacterAtIndex:v107 - 1]];
        double v82 = v81;
        CGFloat v83 = v30 + MaxX;
        v147.origin.CGFloat y = 0.0;
        v147.origin.CGFloat x = v83;
        v147.size.CGFloat width = v109;
        v147.size.CGFloat height = v80;
        CGFloat v84 = v82 - CGRectGetMaxY(v147);
        v148.origin.CGFloat x = v83;
        v148.origin.CGFloat y = v84;
        v148.size.CGFloat width = v109;
        v148.size.CGFloat height = v80;
        double v85 = CGRectGetMidX(v148);
        long long v133 = 0u;
        long long v134 = 0u;
        long long v132 = 0u;
        [(CLKUICurvedLabel *)self centerAngle];
        -[CLKUICurvedLabel _transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:](self, "_transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:", v85, v82, v21, v102, v86, v112, v111, v110, v12);
        v149.origin.CGFloat x = v83;
        v149.origin.CGFloat y = v84;
        v149.size.CGFloat width = v109;
        v149.size.CGFloat height = v80;
        CGRect v150 = CGRectOffset(v149, -v85, -v82);
        v87 = (void (*)(void *, uint64_t, void, long long *, double, double, double, double, double, double))v113[2];
        long long v129 = v132;
        long long v130 = v133;
        long long v131 = v134;
        v87(v113, 0x7FFFFFFFFFFFFFFFLL, 0, &v129, v85, v82, v150.origin.x, v150.origin.y, v150.size.width, v150.size.height);
      }
    }
  }
}

void __50__CLKUICurvedLabel__enumerateTransforms_callback___block_invoke(uint64_t a1, uint64_t a2, CFIndex a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
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
  double v14 = v7 + *(double *)(a1 + 48) - *(double *)(a1 + 56);
  long long v15 = [*(id *)(*(void *)(a1 + 32) + 800) attribute:*MEMORY[0x1E4FB12B0] atIndex:*(void *)(a1 + 64) effectiveRange:0];
  MEMORY[0x1F4188790](v15, v16, v17, v18, v19, v20);
  CGFloat v22 = (const CGGlyph *)((char *)v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 808), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", a2, a3, v22, 0, 0, 0);
  CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v15, kCTFontOrientationDefault, v22, 0, a3);
  double x = BoundingRectsForGlyphs.origin.x;
  CGFloat y = BoundingRectsForGlyphs.origin.y;
  CGFloat width = BoundingRectsForGlyphs.size.width;
  if (*(unsigned char *)(a1 + 152))
  {
    [(__CTFont *)v15 xHeight];
    CGFloat height = v26;
  }
  else
  {
    CGFloat height = BoundingRectsForGlyphs.size.height;
  }
  double v28 = v14 + x;
  v42.origin.double x = v28;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double v29 = v9 - CGRectGetMaxY(v42);
  v43.origin.double x = v28;
  v43.origin.CGFloat y = v29;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v43);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  double v31 = *(void **)(a1 + 32);
  double v32 = *(double *)(a1 + 88);
  double v33 = *(double *)(a1 + 96);
  [v31 centerAngle];
  if (v31)
  {
    objc_msgSend(v31, "_transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:", MidX, v9, v32, v33, v34, *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128));
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
  }
  v44.origin.double x = v28;
  v44.origin.CGFloat y = v29;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  CGRect v45 = CGRectOffset(v44, -MidX, -v9);
  double v35 = *(void (**)(double, double, double, double, double, double))(*(void *)(a1 + 40) + 16);
  v36[0] = v37;
  v36[1] = v38;
  v36[2] = v39;
  v35(MidX, v9, v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
}

- (CGAffineTransform)_transformForLayoutLocation:(SEL)a3 usedWidth:(CGPoint)a4 distance:(double)a5 centerAngle:(double)a6 bounds:(double)a7
{
  double y = a4.y;
  double x = a4.x;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  if (self->_usesPath)
  {
    uint64_t v12 = 992;
    -[CLKUICurvedPathGlyphLayoutProvider setLayoutLocation:](self->_pathGlyphLayoutProvider, "setLayoutLocation:", a4.x, a4.y, a5, a6, a7);
  }
  else
  {
    uint64_t v12 = 984;
    -[CLKUICurvedCircleGlyphLayoutProvider setCenterAngle:](self->_circleGlyphLayoutProvider, "setCenterAngle:", self->_centerAngle, a4.y, a5, a6, a7);
    -[CLKUICurvedCircleGlyphLayoutProvider setLayoutLocation:](self->_circleGlyphLayoutProvider, "setLayoutLocation:", x, y);
    [(CLKUICurvedCircleGlyphLayoutProvider *)self->_circleGlyphLayoutProvider setUsedWidth:a5];
    [(CLKUICurvedCircleGlyphLayoutProvider *)self->_circleGlyphLayoutProvider setDistance:a6];
    -[CLKUICurvedCircleGlyphLayoutProvider setBounds:](self->_circleGlyphLayoutProvider, "setBounds:", a8.origin.x, a8.origin.y, a8.size.width, a8.size.height);
  }
  double result = *(CGAffineTransform **)((char *)&self->super.super.super.super.isa + v12);
  if (result)
  {
    double result = (CGAffineTransform *)[(CGAffineTransform *)result makeTransform];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }
  *(_OWORD *)&retstr->a = v16;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tdouble x = v18;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &kImageViewBoundsContext)
  {
    uint64_t v7 = *MEMORY[0x1E4F284E0];
    id v8 = a5;
    double v9 = [v8 objectForKeyedSubscript:v7];
    [v9 CGRectValue];

    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

    [v10 CGRectValue];
    if (!CLKFloatEqualsFloat() || (CLKFloatEqualsFloat() & 1) == 0)
    {
      [(CLKUICurvedLabel *)self _updateMaxSize];
      [(CLKUICurvedLabel *)self invalidateCachedSize];
      [(CLKUICurvedLabel *)self setNeedsDisplay];
      [(CLKUICurvedLabel *)self setNeedsLayout];
    }
  }
}

- (CGRect)_imageBounds
{
  [(CLKUICurvedLabel *)self imageViewOverrideSize];
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
    [WeakRetained bounds];
    double v6 = v13;
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(CLKUICurvedLabel *)self imageViewOverrideSize];
    double v9 = v8;
    double v11 = v10;
  }
  double v17 = v6;
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGAffineTransform)transformForImage
{
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x5010000000;
  double v28 = "";
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  [(CLKUICurvedLabel *)self _glyphsBoundingRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(CLKUICurvedLabel *)self bounds];
  -[CLKUICurvedLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v6, v8, v10, v12, v13, v14, v15, v16);
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, v17, v18);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __37__CLKUICurvedLabel_transformForImage__block_invoke;
  v22[3] = &unk_1E697C3C0;
  v22[4] = self;
  v22[5] = &v25;
  CGAffineTransform v23 = v24;
  [(CLKUICurvedLabel *)self _transformForImage:v22];
  double v19 = v26;
  long long v20 = *((_OWORD *)v26 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v26 + 2);
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tdouble x = *((_OWORD *)v19 + 4);
  _Block_object_dispose(&v25, 8);
  return result;
}

__n128 __37__CLKUICurvedLabel_transformForImage__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8) + 32;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 977))
  {
    __n128 result = *(__n128 *)a2;
    long long v4 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v2 + 32) = v4;
    *(__n128 *)uint64_t v2 = result;
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v5;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)(a2 + 32);
    long long v6 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&v8.a = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&v8.c = v6;
    *(_OWORD *)&v8.tdouble x = *(_OWORD *)(a1 + 80);
    CGAffineTransformConcat(&v10, &t1, &v8);
    long long v7 = *(_OWORD *)&v10.c;
    __n128 result = *(__n128 *)&v10.tx;
    *(_OWORD *)uint64_t v2 = *(_OWORD *)&v10.a;
    *(_OWORD *)(v2 + 16) = v7;
    *(__n128 *)(v2 + 32) = result;
  }
  return result;
}

- (CGPoint)centerForImage
{
  uint64_t v7 = 0;
  CGAffineTransform v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  CGAffineTransform v10 = "";
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__CLKUICurvedLabel_centerForImage__block_invoke;
  v6[3] = &unk_1E697C320;
  void v6[4] = &v7;
  [(CLKUICurvedLabel *)self _transformForImage:v6];
  double v2 = v8[4];
  double v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  double v4 = v2;
  double v5 = v3;
  result.double y = v5;
  result.double x = v4;
  return result;
}

double __34__CLKUICurvedLabel_centerForImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result = a2 + a4 * 0.5;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  *(double *)(v6 + 32) = result;
  *(double *)(v6 + 40) = a3 + a5 * 0.5;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (UIBezierPath)path
{
  return self->_path;
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

- (double)tracking
{
  return self->_tracking;
}

- (BOOL)attributedTextProvidesColor
{
  return self->_attributedTextProvidesColor;
}

- (void)setAttributedTextProvidesColor:(BOOL)a3
{
  self->_attributedTextProvidesColor = a3;
}

- (unint64_t)imagePlacement
{
  return self->_imagePlacement;
}

- (double)imagePadding
{
  return self->_imagePadding;
}

- (UIView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  return (UIView *)WeakRetained;
}

- (double)animationAlpha
{
  return self->_animationAlpha;
}

- (CGSize)imageViewOverrideSize
{
  double width = self->_imageViewOverrideSize.width;
  double height = self->_imageViewOverrideSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathGlyphLayoutProvider, 0);
  objc_storeStrong((id *)&self->_circleGlyphLayoutProvider, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_attributedStringUnmodified, 0);
  objc_storeStrong((id *)&self->_attributedStringWithoutColorModification, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_isTextTruncated, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end