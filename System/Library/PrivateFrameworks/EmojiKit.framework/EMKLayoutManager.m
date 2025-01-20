@interface EMKLayoutManager
- (BOOL)convertGlyphIndex:(unint64_t)a3 toAttributeRelativeGlyphIndex:(unint64_t *)a4 numberOfAttributedGlyphs:(unint64_t *)a5;
- (BOOL)isDarkModeEnabled;
- (BOOL)isEmojiAnimationActive;
- (BOOL)isEmojiConversionActive;
- (BOOL)isEmojiConversionEnabled;
- (EMKLayoutManager)init;
- (id)attributes;
- (id)emojiConversionLanguages;
- (void)drawAttributedGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)flushGlyphIndexTable;
- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7;
- (void)setDarkModeEnabled:(BOOL)a3;
- (void)setDelayFrames:(unint64_t)a3;
- (void)setEmojiConversionActive:(BOOL)a3;
- (void)setEmojiConversionEnabled:(BOOL)a3;
- (void)setEmojiConversionLanguages:(id)a3;
- (void)setPostFrames:(unint64_t)a3;
- (void)setPreFrames:(unint64_t)a3;
- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(unint64_t)a5 font:(id)a6 matrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9;
- (void)startOrStopTimer;
@end

@implementation EMKLayoutManager

- (EMKLayoutManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)EMKLayoutManager;
  v2 = [(EMKLayoutManager *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28E48], "emptyAttributedStringOfLength_emk:", 0);
    v4 = (void *)*((void *)v2 + 33);
    *((void *)v2 + 33) = v3;

    v5 = objc_alloc_init(EMKGlyphRippler);
    v6 = (void *)*((void *)v2 + 34);
    *((void *)v2 + 34) = v5;

    v7 = (void *)*((void *)v2 + 35);
    *((void *)v2 + 35) = 0;

    *((void *)v2 + 36) = 0x3FF0000000000000;
    *(_OWORD *)(v2 + 296) = *MEMORY[0x1E4F1DB30];
    v8 = (void *)*((void *)v2 + 39);
    *((void *)v2 + 39) = 0;

    v9 = (void *)*((void *)v2 + 40);
    *((void *)v2 + 40) = &unk_1F40657F0;

    v10 = objc_alloc_init(EMKTextEnumerator);
    v11 = (void *)*((void *)v2 + 41);
    *((void *)v2 + 41) = v10;

    v12 = (void *)*((void *)v2 + 42);
    *((void *)v2 + 42) = 0;

    v2[344] = 1;
    v2[345] = 0;
    v2[346] = 0;
  }
  return (EMKLayoutManager *)v2;
}

- (void)flushGlyphIndexTable
{
  self->_glyphIndexTable = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)convertGlyphIndex:(unint64_t)a3 toAttributeRelativeGlyphIndex:(unint64_t *)a4 numberOfAttributedGlyphs:(unint64_t *)a5
{
  unint64_t v9 = [(EMKLayoutManager *)self numberOfGlyphs];
  if (!v9) {
    return v9 != 0;
  }
  glyphIndexTable = self->_glyphIndexTable;
  if (!glyphIndexTable)
  {
    unint64_t v25 = a3;
    unint64_t v11 = [(NSMutableAttributedString *)self->_attributes length];
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    v12 = [MEMORY[0x1E4F1CA58] dataWithLength:8 * v9 + 8];
    v13 = self->_glyphIndexTable;
    self->_glyphIndexTable = v12;

    objc_super v14 = [(NSMutableData *)self->_glyphIndexTable mutableBytes];
    if (v11)
    {
      v24 = a4;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      do
      {
        v17 = [(NSMutableAttributedString *)self->_attributes attribute:@"EMKEmojiTokenList", v15, &v26, v15, v11 - v15 atIndex longestEffectiveRange inRange];
        unint64_t v18 = -[EMKLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v26, v27, 0);
        unint64_t v20 = v18 + v19;
        if (v18 < v18 + v19)
        {
          v21 = &v14[v18];
          do
          {
            *v21++ = v16;
            v16 += v17 != 0;
            --v19;
          }
          while (v19);
        }

        uint64_t v15 = v27 + v26;
      }
      while (v27 + v26 < v11);
      a4 = v24;
      if (v20 > v9) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v16 = 0;
      unint64_t v20 = 0;
    }
    do
      v14[v20++] = v16;
    while (v20 <= v9);
LABEL_13:
    glyphIndexTable = self->_glyphIndexTable;
    a3 = v25;
  }
  uint64_t v22 = [(NSMutableData *)glyphIndexTable mutableBytes];
  if (a4) {
    *a4 = *(void *)(v22 + 8 * a3);
  }
  if (a5) {
    *a5 = *(void *)(v22 + 8 * v9);
  }
  return v9 != 0;
}

- (void)startOrStopTimer
{
  uint64_t v6 = 0;
  if (self->_emojiConversionEnabled
    && self->_emojiConversionActive
    && [(EMKLayoutManager *)self convertGlyphIndex:0 toAttributeRelativeGlyphIndex:0 numberOfAttributedGlyphs:&v6]&& v6)
  {
    [(EMKGlyphRippler *)self->_rippler startWithDarkMode:[(EMKLayoutManager *)self isDarkModeEnabled]];
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = v3;
    v5 = @"EMKStartTimerNotificationName";
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = v3;
    v5 = @"EMKStopTimerNotificationName";
  }
  [v3 postNotificationName:v5 object:self];
}

- (BOOL)isEmojiAnimationActive
{
  uint64_t v6 = 0;
  if (!self->_emojiConversionEnabled || !self->_emojiConversionActive) {
    return 0;
  }
  BOOL v3 = [(EMKLayoutManager *)self convertGlyphIndex:0 toAttributeRelativeGlyphIndex:0 numberOfAttributedGlyphs:&v6];
  BOOL result = 0;
  if (v3)
  {
    if (v6)
    {
      unint64_t v5 = [(EMKGlyphRippler *)self->_rippler currentTimeIndex];
      return ![(EMKGlyphRippler *)self->_rippler finishedForGlyphIndex:v6 - 1 numberOfGlyphs:v6 timeIndex:v5];
    }
  }
  return result;
}

- (BOOL)isEmojiConversionEnabled
{
  return self->_emojiConversionEnabled;
}

- (void)setEmojiConversionEnabled:(BOOL)a3
{
  if (self->_emojiConversionEnabled && !a3)
  {
    uint64_t v5 = [(NSMutableAttributedString *)self->_attributes length];
    attributes = self->_attributes;
    v7 = objc_msgSend(MEMORY[0x1E4F28B18], "emptyAttributedStringOfLength_emk:", v5);
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](attributes, "replaceCharactersInRange:withAttributedString:", 0, v5, v7);

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"EMKEmojiConversionDisabledNotificationName" object:self];
  }
  self->_emojiConversionEnabled = a3;
}

- (BOOL)isEmojiConversionActive
{
  return self->_emojiConversionActive;
}

- (void)setEmojiConversionActive:(BOOL)a3
{
  self->_emojiConversionActive = a3;
  [(EMKLayoutManager *)self startOrStopTimer];
}

- (BOOL)isDarkModeEnabled
{
  return self->_darkModeEnabled;
}

- (void)setDarkModeEnabled:(BOOL)a3
{
  self->_darkModeEnabled = a3;
}

- (id)emojiConversionLanguages
{
  return self->_emojiConversionLanguages;
}

- (void)setEmojiConversionLanguages:(id)a3
{
  self->_emojiConversionLanguages = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)attributes
{
  return self->_attributes;
}

- (void)drawAttributedGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v9 = -[EMKLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", a3.location, a3.length, 0);
  uint64_t v11 = v10;
  unint64_t v40 = v9;
  uint64_t v41 = 0;
  unint64_t v12 = [(NSMutableAttributedString *)self->_attributes length];
  unint64_t v31 = v9 + v11;
  unint64_t v32 = v12;
  if (v12 >= v9 + v11) {
    unint64_t v13 = v9 + v11;
  }
  else {
    unint64_t v13 = v12;
  }
  if (v9 < v13)
  {
    NSUInteger v34 = location + length;
    unint64_t v33 = v13;
    do
    {
      objc_super v14 = [(NSMutableAttributedString *)self->_attributes attribute:@"EMKEmojiTokenList", v9, &v40, v9, v13 - v9 atIndex longestEffectiveRange inRange];
      unint64_t v15 = -[EMKLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v40, v41, 0);
      NSUInteger v17 = v15;
      uint64_t v18 = v16;
      if (v14)
      {
        if (v15 < v15 + v16)
        {
          do
          {
            if (location <= v17 && v17 < v34)
            {
              unint64_t v19 = [(EMKGlyphRippler *)self->_rippler currentTimeIndex];
              uint64_t v38 = 0;
              uint64_t v39 = 0;
              [(EMKLayoutManager *)self convertGlyphIndex:v17 toAttributeRelativeGlyphIndex:&v39 numberOfAttributedGlyphs:&v38];
              unint64_t v20 = [(EMKGlyphRippler *)self->_rippler currentColorForGlyphIndex:v39 numberOfGlyphs:v38 timeIndex:v19];
              currentColor = self->_currentColor;
              self->_currentColor = v20;

              [(EMKGlyphRippler *)self->_rippler currentScaleForGlyphIndex:v39 numberOfGlyphs:v38 timeIndex:v19];
              self->_currentScale = v22;
              [(EMKGlyphRippler *)self->_rippler currentOffsetForGlyphIndex:v39 numberOfGlyphs:v38 timeIndex:v19];
              self->_currentOffset.width = v23;
              self->_currentOffset.height = v24;
              unint64_t v25 = [(EMKGlyphRippler *)self->_rippler currentShadowColorForGlyphIndex:v39 numberOfGlyphs:v38 timeIndex:v19];
              currentShadowColor = self->_currentShadowColor;
              self->_currentShadowColor = v25;

              v37.receiver = self;
              v37.super_class = (Class)EMKLayoutManager;
              -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v37, sel_drawGlyphsForGlyphRange_atPoint_, v17, 1, x, y);
              uint64_t v27 = self->_currentColor;
              self->_currentColor = 0;

              self->_currentScale = 1.0;
              self->_currentOffset = (CGSize)*MEMORY[0x1E4F1DB30];
              v28 = self->_currentShadowColor;
              self->_currentShadowColor = 0;
            }
            ++v17;
            --v18;
          }
          while (v18);
        }
      }
      else
      {
        v36.receiver = self;
        v36.super_class = (Class)EMKLayoutManager;
        -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v36, sel_drawGlyphsForGlyphRange_atPoint_, v15, v16, x, y);
      }

      unint64_t v9 = v41 + v40;
      unint64_t v13 = v33;
    }
    while (v41 + v40 < v33);
  }
  if (v31 > v32)
  {
    unint64_t v40 = v32;
    uint64_t v41 = v31 - v32;
    uint64_t v29 = -[EMKLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:");
    v35.receiver = self;
    v35.super_class = (Class)EMKLayoutManager;
    -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v35, sel_drawGlyphsForGlyphRange_atPoint_, v29, v30, x, y);
  }
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  if (self->_emojiConversionEnabled && self->_emojiConversionActive)
  {
    -[EMKLayoutManager drawAttributedGlyphsForGlyphRange:atPoint:](self, "drawAttributedGlyphsForGlyphRange:atPoint:", a3.location, a3.length, a4.x, a4.y);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)EMKLayoutManager;
    -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v4, sel_drawGlyphsForGlyphRange_atPoint_, a3.location, a3.length, a4.x, a4.y);
  }
}

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(unint64_t)a5 font:(id)a6 matrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  id v14 = a6;
  id v15 = a8;
  if (self->_currentColor)
  {
    [v14 pointSize];
    double v17 = v16;
    BOOL v19 = v16 <= 22.0 && self->_currentShadowColor != 0;
    BOOL v28 = v19;
    if (a5)
    {
      if (self->_currentScale == 1.0 && self->_currentOffset.width == 0.0 && self->_currentOffset.height == 0.0)
      {
        unint64_t v20 = 0;
      }
      else
      {
        unint64_t v20 = (CGPoint *)malloc_type_calloc(a5, 0x10uLL, 0x1000040451B5BE8uLL);
        if (v20)
        {
          CGContextSetFontSize(a9, v17 * self->_currentScale);
          CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs((CTFontRef)v14, kCTFontOrientationDefault, a3, 0, a5);
          uint64_t v21 = 0;
          unint64_t v22 = a5;
          do
          {
            CGFloat v23 = a4[v21].y - self->_currentOffset.height;
            p_double x = &v20[v21].x;
            *p_double x = a4[v21].x
                 + self->_currentOffset.width
                 + BoundingRectsForGlyphs.size.width * (self->_currentScale + -1.0) * -0.5;
            p_x[1] = v23;
            ++v21;
            --v22;
          }
          while (v22);
          a4 = v20;
        }
      }
    }
    else
    {
      unint64_t v20 = 0;
    }
    [(UIColor *)self->_currentColor set];
    if (v28)
    {
      uint64_t v26 = [(UIColor *)self->_currentShadowColor CGColor];
      v32.width = 0.25;
      v32.height = 0.0;
      CGContextSetShadowWithColor(a9, v32, 0.0, v26);
      int v25 = 1;
    }
    else
    {
      int v25 = 0;
    }
  }
  else
  {
    int v25 = 0;
    unint64_t v20 = 0;
  }
  v31.receiver = self;
  v31.super_class = (Class)EMKLayoutManager;
  long long v27 = *(_OWORD *)&a7->c;
  v30[0] = *(_OWORD *)&a7->a;
  v30[1] = v27;
  v30[2] = *(_OWORD *)&a7->tx;
  [(EMKLayoutManager *)&v31 showCGGlyphs:a3 positions:a4 count:a5 font:v14 matrix:v30 attributes:v15 inContext:a9];
  if (v25) {
    CGContextSetShadowWithColor(a9, *MEMORY[0x1E4F1DB30], 0.0, 0);
  }
  if (v20) {
    free(v20);
  }
}

- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7
{
  NSUInteger length = a5.length;
  char v9 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  NSUInteger v44 = 0;
  uint64_t v45 = 0;
  v43.receiver = self;
  v43.super_class = (Class)EMKLayoutManager;
  NSUInteger location = a5.location;
  id v33 = a3;
  -[EMKLayoutManager processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](&v43, sel_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange_, a7.location, a7.length);
  if ((v9 & 2) != 0)
  {
    attributes = self->_attributes;
    unint64_t v12 = objc_msgSend(MEMORY[0x1E4F28B18], "emptyAttributedStringOfLength_emk:", length);
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](attributes, "replaceCharactersInRange:withAttributedString:", location, length - a6, v12);

    unint64_t v13 = [v33 length];
    unint64_t v14 = [(NSMutableAttributedString *)self->_attributes length];
    uint64_t v30 = 0;
    unint64_t v15 = location + length;
    if (location + length > v13 || (unint64_t v16 = v14, v14 < v15))
    {
LABEL_28:
      [(EMKLayoutManager *)self flushGlyphIndexTable];

      goto LABEL_29;
    }
    if (location)
    {
      double v17 = [(NSMutableAttributedString *)self->_attributes attribute:@"EMKEmojiTokenList" atIndex:location - 1 effectiveRange:0];
      if (v17)
      {
        id v18 = (id)[(NSMutableAttributedString *)self->_attributes attribute:@"EMKEmojiTokenList", location - 1, &v44, 0, location atIndex longestEffectiveRange inRange];
        NSUInteger v19 = v44;
        NSUInteger v20 = v15 - v44;
      }
      else
      {
        NSUInteger v20 = length;
        NSUInteger v19 = location;
      }
    }
    else
    {
      NSUInteger v19 = 0;
      double v17 = 0;
      NSUInteger v20 = length;
    }
    BOOL v21 = v16 > v15;
    unint64_t v22 = v16 - v15;
    if (v21)
    {
      uint64_t v30 = [(NSMutableAttributedString *)self->_attributes attribute:@"EMKEmojiTokenList" atIndex:v15 effectiveRange:0];

      if (v30)
      {
        id v23 = (id)[(NSMutableAttributedString *)self->_attributes attribute:@"EMKEmojiTokenList", v15, &v44, v15, v22 atIndex longestEffectiveRange inRange];
        NSUInteger v20 = v44 - v19 + v45;
        if (!v20) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v30 = 0;
        if (!v20) {
          goto LABEL_18;
        }
      }
    }
    else
    {
      uint64_t v30 = v17;
      if (!v20)
      {
LABEL_18:
        if (self->_emojiConversionEnabled)
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          obj = self->_emojiConversionLanguages;
          uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v46 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v40;
LABEL_21:
            uint64_t v26 = 0;
            while (1)
            {
              if (*(void *)v40 != v25) {
                objc_enumerationMutation(obj);
              }
              uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8 * v26);
              uint64_t v35 = 0;
              objc_super v36 = &v35;
              uint64_t v37 = 0x2020000000;
              char v38 = 0;
              enumerator = self->_enumerator;
              uint64_t v29 = [v33 string];
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v34[2] = __94__EMKLayoutManager_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke;
              v34[3] = &unk_1E6E972B8;
              v34[4] = self;
              v34[5] = v27;
              v34[6] = &v35;
              -[EMKTextEnumerator enumerateEmojiSignifiersInString:touchingRange:language:usingBlock:](enumerator, "enumerateEmojiSignifiersInString:touchingRange:language:usingBlock:", v29, location, length, v27, v34);

              LODWORD(v27) = *((unsigned __int8 *)v36 + 24);
              _Block_object_dispose(&v35, 8);
              if (v27) {
                break;
              }
              if (v24 == ++v26)
              {
                uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v46 count:16];
                if (v24) {
                  goto LABEL_21;
                }
                break;
              }
            }
          }
        }
        goto LABEL_28;
      }
    }
    [(NSMutableAttributedString *)self->_attributes removeAttribute:@"EMKEmojiTokenList", v19, v20 range];
    goto LABEL_18;
  }
LABEL_29:
}

uint64_t __94__EMKLayoutManager_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1[4] + 264), "addAttribute:value:range:", @"EMKEmojiTokenList", a4, a2, a3);
  uint64_t result = objc_msgSend(*(id *)(a1[4] + 264), "addAttribute:value:range:", @"EMKEmojiConversionLanguage", a1[5], a2, a3);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return result;
}

- (void)setPreFrames:(unint64_t)a3
{
}

- (void)setPostFrames:(unint64_t)a3
{
}

- (void)setDelayFrames:(unint64_t)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphIndexTable, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_emojiConversionLanguages, 0);
  objc_storeStrong((id *)&self->_currentShadowColor, 0);
  objc_storeStrong((id *)&self->_currentColor, 0);
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end