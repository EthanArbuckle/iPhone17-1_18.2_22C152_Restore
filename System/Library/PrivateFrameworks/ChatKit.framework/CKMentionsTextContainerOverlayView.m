@interface CKMentionsTextContainerOverlayView
- (BOOL)isOpaque;
- (CKMentionsTextContainerOverlayView)initWithFrame:(CGRect)a3 textView:(id)a4;
- (NSDictionary)mentionAnimations;
- (UITextView)textView;
- (void)__drawGlyph:(unsigned __int16)a3 textPosition:(CGPoint)a4 glyphPosition:(CGPoint)a5 font:(__CTFont *)a6 attributes:(id)a7 layoutFragment:(id)a8;
- (void)_drawAnimatedMentionRun:(__CTRun *)a3 textPosition:(CGPoint)a4 rippler:(id)a5 layoutFragment:(id)a6;
- (void)drawRect:(CGRect)a3;
- (void)setMentionAnimations:(id)a3;
- (void)setTextView:(id)a3;
- (void)updateUsingAnimations:(id)a3;
@end

@implementation CKMentionsTextContainerOverlayView

- (CKMentionsTextContainerOverlayView)initWithFrame:(CGRect)a3 textView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKMentionsTextContainerOverlayView;
  v11 = -[CKMentionsTextContainerOverlayView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textView, a4);
    mentionAnimations = v12->_mentionAnimations;
    v12->_mentionAnimations = (NSDictionary *)MEMORY[0x1E4F1CC08];

    [(CKMentionsTextContainerOverlayView *)v12 setUserInteractionEnabled:1];
    v14 = [(CKMentionsTextContainerOverlayView *)v12 layer];
    [v14 setMasksToBounds:1];

    [(CKMentionsTextContainerOverlayView *)v12 setClipsToBounds:1];
    [(CKMentionsTextContainerOverlayView *)v12 setContentMode:3];
  }

  return v12;
}

- (void)updateUsingAnimations:(id)a3
{
  [(CKMentionsTextContainerOverlayView *)self setMentionAnimations:a3];

  [(CKMentionsTextContainerOverlayView *)self setNeedsDisplay];
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CKMentionsTextContainerOverlayView;
  -[CKMentionsTextContainerOverlayView drawRect:](&v20, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 set];

  [(CKMentionsTextContainerOverlayView *)self bounds];
  UIRectFill(v21);
  v5 = [(CKMentionsTextContainerOverlayView *)self textView];
  v6 = [v5 textLayoutManager];

  v7 = [(CKMentionsTextContainerOverlayView *)self textView];
  [v7 textContainerInset];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  objc_super v16 = [v6 documentRange];
  v17 = [v16 location];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__CKMentionsTextContainerOverlayView_drawRect___block_invoke;
  v19[3] = &unk_1E562BC68;
  v19[5] = v9;
  v19[6] = v11;
  v19[7] = v13;
  v19[8] = v15;
  v19[4] = self;
  id v18 = (id)[v6 enumerateTextLayoutFragmentsFromLocation:v17 options:4 usingBlock:v19];
}

uint64_t __47__CKMentionsTextContainerOverlayView_drawRect___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v38[0] = *MEMORY[0x1E4F1DB28];
  v38[1] = v4;
  v37[0] = v38[0];
  v37[1] = v4;
  objc_msgSend(v3, "_ck_getFragmentViewFrame:getBounds:textContainerInset:", v37, v38, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = [v3 textLineFragments];
  uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v7 = [v6 lineRef];
        if (v7)
        {
          uint64_t v8 = (const __CTLine *)v7;
          uint64_t v28 = i;
          [v6 glyphOrigin];
          double v10 = v9;
          double v12 = v11;
          uint64_t v13 = CTLineGetGlyphRuns(v8);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v30;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v30 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(const __CTRun **)(*((void *)&v29 + 1) + 8 * j);
                v19 = CKCTRunGetMentionsAnimationIdentifier(v18);
                if (v19)
                {
                  objc_super v20 = [*(id *)(*(void *)(a1 + 32) + 416) objectForKeyedSubscript:v19];
                  if (v20)
                  {
                    [v6 typographicBounds];
                    double v22 = v21;
                    [v3 layoutFragmentFrame];
                    objc_msgSend(*(id *)(a1 + 32), "_drawAnimatedMentionRun:textPosition:rippler:layoutFragment:", v18, v20, v3, v10, v12 + *(double *)(a1 + 40) + v22 + v23);
                  }
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
            }
            while (v15);
          }

          uint64_t i = v28;
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v27);
  }

  return 1;
}

- (void)_drawAnimatedMentionRun:(__CTRun *)a3 textPosition:(CGPoint)a4 rippler:(id)a5 layoutFragment:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v32 = a5;
  id v12 = a6;
  CFDictionaryRef Attributes = CTRunGetAttributes(a3);
  Value = CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x1E4F243F0]);
  if (!Value)
  {
    long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"CKMentionsTextContainerOverlayView.m" lineNumber:175 description:@"font required"];
  }
  size_t GlyphCount = CTRunGetGlyphCount(a3);
  if (GlyphCount)
  {
    int64_t v16 = GlyphCount;
    v17 = (CGPoint *)malloc_type_calloc(GlyphCount, 0x10uLL, 0x1000040451B5BE8uLL);
    id v18 = (CGGlyph *)malloc_type_calloc(v16, 2uLL, 0x1000040BDFB0063uLL);
    v34.location = 0;
    v34.length = 0;
    CTRunGetGlyphs(a3, v34, v18);
    v35.location = 0;
    v35.length = 0;
    long long v31 = v17;
    CTRunGetPositions(a3, v35, v17);
    uint64_t v19 = [v32 currentTimeIndex];
    if (v16 >= 1)
    {
      uint64_t v20 = v19;
      uint64_t v21 = 0;
      p_double y = &v17->y;
      do
      {
        double v23 = Value;
        id v24 = v12;
        uint64_t v25 = v18[v21];
        double v26 = *(p_y - 1);
        double v27 = *p_y;
        id v28 = +[CKMentionsRenderingAttributes newWithValuesFromRippler:timeIndex:glyphIndex:glyphCount:](CKMentionsRenderingAttributes, "newWithValuesFromRippler:timeIndex:glyphIndex:glyphCount:", v32, v20, v21, v16, v31);
        uint64_t v29 = v25;
        id v12 = v24;
        Value = v23;
        -[CKMentionsTextContainerOverlayView __drawGlyph:textPosition:glyphPosition:font:attributes:layoutFragment:](self, "__drawGlyph:textPosition:glyphPosition:font:attributes:layoutFragment:", v29, v23, v28, v12, x, y, v26, v27);

        ++v21;
        p_y += 2;
      }
      while (v16 != v21);
    }
    free(v18);
    free(v31);
  }
}

- (void)__drawGlyph:(unsigned __int16)a3 textPosition:(CGPoint)a4 glyphPosition:(CGPoint)a5 font:(__CTFont *)a6 attributes:(id)a7 layoutFragment:(id)a8
{
  double x = a5.x;
  CGFloat y = a4.y;
  CGFloat v12 = a4.x;
  positions.CGFloat y = a5.y;
  CGGlyph glyphs = a3;
  id v13 = a8;
  id v14 = a7;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGFloat v28 = 0.0;
  [v14 _applyInContext:CurrentContext fontPointSize:&v28 getAdjustedFontSize:CTFontGetSize(a6)];

  CopyWithCFDictionaryRef Attributes = CTFontCreateCopyWithAttributes(a6, v28, 0, 0);
  memset(&v27, 0, sizeof(v27));
  CGContextGetTextMatrix(&v27, CurrentContext);
  CGAffineTransform v25 = v27;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformScale(&v26, &v25, 1.0, -1.0);
  CGAffineTransform v25 = v26;
  CGContextSetTextMatrix(CurrentContext, &v25);
  CGContextSetTextPosition(CurrentContext, v12, y);
  [v13 layoutFragmentFrame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v31.origin.double x = v18;
  v31.origin.CGFloat y = v20;
  v31.size.double width = v22;
  v31.size.double height = v24;
  positions.double x = CGRectGetMinX(v31) + x;
  CTFontDrawGlyphs(CopyWithAttributes, &glyphs, &positions, 1uLL, CurrentContext);
  CGContextRestoreGState(CurrentContext);
  CGAffineTransform v25 = v27;
  CGContextSetTextMatrix(CurrentContext, &v25);
  CFRelease(CopyWithAttributes);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSDictionary)mentionAnimations
{
  return self->_mentionAnimations;
}

- (void)setMentionAnimations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionAnimations, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end