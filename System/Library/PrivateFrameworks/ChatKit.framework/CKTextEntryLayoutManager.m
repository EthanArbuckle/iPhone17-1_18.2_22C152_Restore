@interface CKTextEntryLayoutManager
- (BOOL)isAnyMentionAnimationActive;
- (CGSize)currentMentionOffset;
- (CKTextEntryLayoutManager)init;
- (CKTextEntryLayoutManagerMentionsDelegate)mentionsDelegate;
- (NSMutableAttributedString)mentionAttributes;
- (NSMutableDictionary)animationsByIdentifier;
- (NSTimer)mentionTimer;
- (UIColor)currentMentionColor;
- (UIColor)currentMentionShadowColor;
- (double)currentMentionScale;
- (void)drawAttributedMentionGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)setAnimationsByIdentifier:(id)a3;
- (void)setCurrentMentionColor:(id)a3;
- (void)setCurrentMentionOffset:(CGSize)a3;
- (void)setCurrentMentionScale:(double)a3;
- (void)setCurrentMentionShadowColor:(id)a3;
- (void)setMentionAttributes:(id)a3;
- (void)setMentionTimer:(id)a3;
- (void)setMentionsDelegate:(id)a3;
- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9;
- (void)startTimerIfNeeded;
- (void)stopTimerRemovingAttribute:(BOOL)a3;
- (void)updateDisplayForMentionGlyphRangeRemovingAttribute:(BOOL)a3;
- (void)updateMentionAttributes:(id)a3;
- (void)updateMentionDisplay;
@end

@implementation CKTextEntryLayoutManager

- (CKTextEntryLayoutManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKTextEntryLayoutManager;
  v2 = [(EMKLayoutManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v4 = (void *)*((void *)v2 + 49);
    *((void *)v2 + 49) = v3;

    v5 = (void *)*((void *)v2 + 46);
    *((void *)v2 + 46) = 0;

    *((void *)v2 + 47) = 0x3FF0000000000000;
    *(_OWORD *)(v2 + 408) = *MEMORY[0x1E4F1DB30];
    v6 = (void *)*((void *)v2 + 48);
    *((void *)v2 + 48) = 0;
  }
  return (CKTextEntryLayoutManager *)v2;
}

- (void)updateMentionAttributes:(id)a3
{
  id v4 = a3;
  if (([(NSMutableAttributedString *)self->_mentionAttributes isEqualToAttributedString:v4] & 1) == 0)
  {
    v5 = (NSMutableAttributedString *)[v4 mutableCopy];
    mentionAttributes = self->_mentionAttributes;
    self->_mentionAttributes = v5;

    v7 = self->_mentionAttributes;
    uint64_t v8 = *MEMORY[0x1E4F6D510];
    uint64_t v9 = [(NSMutableAttributedString *)v7 length];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__CKTextEntryLayoutManager_updateMentionAttributes___block_invoke;
    v10[3] = &unk_1E5624860;
    v10[4] = self;
    -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](v7, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v9, 2, v10);
  }
}

void __52__CKTextEntryLayoutManager_updateMentionAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v7 length])
      {
        uint64_t v3 = [*(id *)(a1 + 32) animationsByIdentifier];
        id v4 = [v3 objectForKeyedSubscript:v7];

        if (!v4)
        {
          v5 = objc_alloc_init(CKMentionRippler);
          v6 = [*(id *)(a1 + 32) animationsByIdentifier];
          [v6 setObject:v5 forKeyedSubscript:v7];

          [(CKMentionRippler *)v5 start];
          [*(id *)(a1 + 32) startTimerIfNeeded];
        }
      }
    }
  }
}

- (BOOL)isAnyMentionAnimationActive
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v3 = [(CKTextEntryLayoutManager *)self mentionAttributes];
  id v4 = [(CKTextEntryLayoutManager *)self mentionAttributes];
  uint64_t v5 = [v4 length];
  uint64_t v6 = *MEMORY[0x1E4F6D510];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CKTextEntryLayoutManager_isAnyMentionAnimationActive__block_invoke;
  v10[3] = &unk_1E5625748;
  v10[4] = self;
  void v10[5] = &v11;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 2, v10);

  if (*((unsigned char *)v12 + 24))
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [(CKTextEntryLayoutManager *)self animationsByIdentifier];
    [v8 removeAllObjects];

    BOOL v7 = *((unsigned char *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __55__CKTextEntryLayoutManager_isAnyMentionAnimationActive__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (v6)
  {
    id v10 = v6;
    BOOL v7 = [*(id *)(a1 + 32) animationsByIdentifier];
    uint64_t v8 = [v7 objectForKeyedSubscript:v10];

    if (v8)
    {
      if (objc_msgSend(v8, "finishedForGlyphIndex:numberOfGlyphs:timeIndex:", a4, a4, objc_msgSend(v8, "currentTimeIndex")))
      {
        uint64_t v9 = [*(id *)(a1 + 32) animationsByIdentifier];
        [v9 removeObjectForKey:v10];
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }

    id v6 = v10;
  }
}

- (void)startTimerIfNeeded
{
  uint64_t v3 = [(CKTextEntryLayoutManager *)self mentionTimer];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_updateMentionDisplay selector:0 userInfo:1 repeats:0.0166666667];
    [(CKTextEntryLayoutManager *)self setMentionTimer:v4];
  }
  id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  uint64_t v5 = [(CKTextEntryLayoutManager *)self mentionTimer];
  [v6 addTimer:v5 forMode:*MEMORY[0x1E4F43EA8]];
}

- (void)stopTimerRemovingAttribute:(BOOL)a3
{
  [(CKTextEntryLayoutManager *)self updateDisplayForMentionGlyphRangeRemovingAttribute:a3];
  id v4 = [(CKTextEntryLayoutManager *)self mentionTimer];
  [v4 invalidate];

  [(CKTextEntryLayoutManager *)self setMentionTimer:0];
}

- (void)updateMentionDisplay
{
  [(CKTextEntryLayoutManager *)self updateDisplayForMentionGlyphRangeRemovingAttribute:0];
  if (![(CKTextEntryLayoutManager *)self isAnyMentionAnimationActive])
  {
    [(CKTextEntryLayoutManager *)self stopTimerRemovingAttribute:1];
  }
}

- (void)updateDisplayForMentionGlyphRangeRemovingAttribute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CKTextEntryLayoutManager *)self mentionAttributes];
  id v6 = (void *)[v5 copy];

  uint64_t v17 = 0;
  uint64_t v18 = 0;
  BOOL v7 = [(CKTextEntryLayoutManager *)self textStorage];
  unint64_t v8 = [v7 length];

  uint64_t v9 = [v6 length];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *MEMORY[0x1E4F6D510];
    do
    {
      uint64_t v13 = objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v11, &v17, v11, v10 - v11);
      if ([v13 length] && v18 + v17 <= v8)
      {
        if (v3)
        {
          char v14 = [(CKTextEntryLayoutManager *)self mentionsDelegate];
          [v14 layoutManagerDidFinishAnimatingMentionWithAnimationIdentifier:v13];
        }
        uint64_t v15 = -[CKTextEntryLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:");
        -[CKTextEntryLayoutManager invalidateDisplayForGlyphRange:](self, "invalidateDisplayForGlyphRange:", v15, v16);
      }

      uint64_t v11 = v18 + v17;
    }
    while (v18 + v17 < v10);
  }
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v9 = [(CKTextEntryLayoutManager *)self mentionAttributes];
  int v10 = [v9 containsAttribute:*MEMORY[0x1E4F6D510]];

  if (v10)
  {
    -[CKTextEntryLayoutManager drawAttributedMentionGlyphsForGlyphRange:atPoint:](self, "drawAttributedMentionGlyphsForGlyphRange:atPoint:", location, length, x, y);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CKTextEntryLayoutManager;
    -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v11, sel_drawGlyphsForGlyphRange_atPoint_, location, length, x, y);
  }
}

- (void)drawAttributedMentionGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v8 = -[CKTextEntryLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", a3.location, a3.length, 0);
  uint64_t v10 = v9;
  unint64_t v39 = v8;
  uint64_t v40 = 0;
  objc_super v11 = [(CKTextEntryLayoutManager *)self mentionAttributes];
  unint64_t v12 = [v11 length];

  unint64_t v30 = v8 + v10;
  unint64_t v31 = v12;
  if (v12 >= v8 + v10) {
    unint64_t v13 = v8 + v10;
  }
  else {
    unint64_t v13 = v12;
  }
  if (v8 < v13)
  {
    uint64_t v33 = *MEMORY[0x1E4F6D510];
    unint64_t v14 = location + length;
    double v15 = *MEMORY[0x1E4F1DB30];
    double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    unint64_t v32 = v13;
    do
    {
      uint64_t v17 = [(CKTextEntryLayoutManager *)self mentionAttributes];
      uint64_t v18 = objc_msgSend(v17, "attribute:atIndex:longestEffectiveRange:inRange:", v33, v40 + v39, &v39, v40 + v39, v13 - (v40 + v39));

      uint64_t v19 = -[CKTextEntryLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v39, v40, 0);
      uint64_t v21 = v20;
      if ([v18 length])
      {
        v22 = [(CKTextEntryLayoutManager *)self animationsByIdentifier];
        v34 = v18;
        v23 = [v22 objectForKeyedSubscript:v18];

        if (v21)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (location <= v19 + i && v19 + i + 1 <= v14)
            {
              uint64_t v26 = [v23 currentTimeIndex];
              v27 = [v23 currentColorForGlyphIndex:i numberOfGlyphs:v21 timeIndex:v26];
              [(CKTextEntryLayoutManager *)self setCurrentMentionColor:v27];

              [v23 currentScaleForGlyphIndex:i numberOfGlyphs:v21 timeIndex:v26];
              -[CKTextEntryLayoutManager setCurrentMentionScale:](self, "setCurrentMentionScale:");
              [v23 currentOffsetForGlyphIndex:i numberOfGlyphs:v21 timeIndex:v26];
              -[CKTextEntryLayoutManager setCurrentMentionOffset:](self, "setCurrentMentionOffset:");
              v38.receiver = self;
              v38.super_class = (Class)CKTextEntryLayoutManager;
              -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v38, sel_drawGlyphsForGlyphRange_atPoint_, v19 + i, 1, x, y);
              [(CKTextEntryLayoutManager *)self setCurrentMentionColor:0];
              [(CKTextEntryLayoutManager *)self setCurrentMentionScale:1.0];
              -[CKTextEntryLayoutManager setCurrentMentionOffset:](self, "setCurrentMentionOffset:", v15, v16);
              [(CKTextEntryLayoutManager *)self setCurrentMentionShadowColor:0];
            }
          }
        }

        unint64_t v13 = v32;
        uint64_t v18 = v34;
      }
      else
      {
        v37.receiver = self;
        v37.super_class = (Class)CKTextEntryLayoutManager;
        -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v37, sel_drawGlyphsForGlyphRange_atPoint_, v19, v21, x, y);
      }
    }
    while (v40 + v39 < v13);
  }
  if (v30 > v31)
  {
    unint64_t v39 = v31;
    uint64_t v40 = v30 - v31;
    uint64_t v28 = -[CKTextEntryLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:");
    v36.receiver = self;
    v36.super_class = (Class)CKTextEntryLayoutManager;
    -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v36, sel_drawGlyphsForGlyphRange_atPoint_, v28, v29, x, y);
  }
}

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  id v15 = a6;
  id v16 = a8;
  CGPoint v41 = *a4;
  if (a5 == 1)
  {
    [v15 pointSize];
    double v18 = v17;
    uint64_t v19 = [(CKTextEntryLayoutManager *)self currentMentionShadowColor];
    BOOL v21 = v18 <= 22.0 && v19 != 0;

    [(CKTextEntryLayoutManager *)self currentMentionScale];
    if (v22 != 1.0
      || ([(CKTextEntryLayoutManager *)self currentMentionOffset], v23 != 0.0)
      || ([(CKTextEntryLayoutManager *)self currentMentionOffset], v24 != 0.0))
    {
      [(CKTextEntryLayoutManager *)self currentMentionScale];
      CGContextSetFontSize(a9, v18 * v25);
      CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs((CTFontRef)v15, kCTFontOrientationDefault, a3, 0, 1);
      double width = BoundingRectsForGlyphs.size.width;
      [(CKTextEntryLayoutManager *)self currentMentionOffset];
      double v28 = v27;
      [(CKTextEntryLayoutManager *)self currentMentionScale];
      v41.double x = v41.x + v28 + width * (v29 + -1.0) * -0.5;
      [(CKTextEntryLayoutManager *)self currentMentionOffset];
      v41.double y = v41.y - v30;
      a4 = &v41;
    }
    unint64_t v31 = [(CKTextEntryLayoutManager *)self currentMentionColor];

    if (v31) {
      [(UIColor *)self->_currentMentionColor set];
    }
    if (v21)
    {
      id v32 = [(CKTextEntryLayoutManager *)self currentMentionShadowColor];
      uint64_t v33 = (CGColor *)[v32 CGColor];
      v42.double width = 0.25;
      v42.height = 0.0;
      CGContextSetShadowWithColor(a9, v42, 0.0, v33);

      v40.receiver = self;
      v40.super_class = (Class)CKTextEntryLayoutManager;
      long long v34 = *(_OWORD *)&a7->c;
      long long v37 = *(_OWORD *)&a7->a;
      long long v38 = v34;
      long long v39 = *(_OWORD *)&a7->tx;
      [(CKTextEntryLayoutManager *)&v40 showCGGlyphs:a3 positions:a4 count:1 font:v15 textMatrix:&v37 attributes:v16 inContext:a9];
      CGContextSetShadowWithColor(a9, *MEMORY[0x1E4F1DB30], 0.0, 0);
    }
    else
    {
      v40.receiver = self;
      v40.super_class = (Class)CKTextEntryLayoutManager;
      long long v36 = *(_OWORD *)&a7->c;
      long long v37 = *(_OWORD *)&a7->a;
      long long v38 = v36;
      long long v39 = *(_OWORD *)&a7->tx;
      [(CKTextEntryLayoutManager *)&v40 showCGGlyphs:a3 positions:a4 count:1 font:v15 textMatrix:&v37 attributes:v16 inContext:a9];
    }
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)CKTextEntryLayoutManager;
    long long v35 = *(_OWORD *)&a7->c;
    long long v37 = *(_OWORD *)&a7->a;
    long long v38 = v35;
    long long v39 = *(_OWORD *)&a7->tx;
    [(CKTextEntryLayoutManager *)&v40 showCGGlyphs:a3 positions:a4 count:a5 font:v15 textMatrix:&v37 attributes:v16 inContext:a9];
  }
}

- (CKTextEntryLayoutManagerMentionsDelegate)mentionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mentionsDelegate);

  return (CKTextEntryLayoutManagerMentionsDelegate *)WeakRetained;
}

- (void)setMentionsDelegate:(id)a3
{
}

- (NSMutableAttributedString)mentionAttributes
{
  return self->_mentionAttributes;
}

- (void)setMentionAttributes:(id)a3
{
}

- (UIColor)currentMentionColor
{
  return self->_currentMentionColor;
}

- (void)setCurrentMentionColor:(id)a3
{
}

- (double)currentMentionScale
{
  return self->_currentMentionScale;
}

- (void)setCurrentMentionScale:(double)a3
{
  self->_currentMentionScale = a3;
}

- (CGSize)currentMentionOffset
{
  double width = self->_currentMentionOffset.width;
  double height = self->_currentMentionOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentMentionOffset:(CGSize)a3
{
  self->_currentMentionOffset = a3;
}

- (UIColor)currentMentionShadowColor
{
  return self->_currentMentionShadowColor;
}

- (void)setCurrentMentionShadowColor:(id)a3
{
}

- (NSMutableDictionary)animationsByIdentifier
{
  return self->_animationsByIdentifier;
}

- (void)setAnimationsByIdentifier:(id)a3
{
}

- (NSTimer)mentionTimer
{
  return self->_mentionTimer;
}

- (void)setMentionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionTimer, 0);
  objc_storeStrong((id *)&self->_animationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_currentMentionShadowColor, 0);
  objc_storeStrong((id *)&self->_currentMentionColor, 0);
  objc_storeStrong((id *)&self->_mentionAttributes, 0);

  objc_destroyWeak((id *)&self->_mentionsDelegate);
}

@end