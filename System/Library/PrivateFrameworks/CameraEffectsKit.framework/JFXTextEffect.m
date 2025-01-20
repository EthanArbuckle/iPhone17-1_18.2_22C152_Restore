@interface JFXTextEffect
- (BOOL)isAppearanceEqual:(id)a3 forPurpose:(unint64_t)a4;
- (BOOL)textBakedIn;
- (BOOL)textBounds:(CGRect *)a3 atIndex:(unint64_t)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6 includeDropShadow:(BOOL)a7 includeMasks:(BOOL)a8;
- (PVCGPointQuad)textCornersAtIndex:(SEL)a3 time:(unint64_t)a4 forcePosterFrame:(id *)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 relativeTo:(CGPoint)a8 basisOrigin:(CGRect)a9;
- (UIColor)customTextEditTintColor;
- (id)contentProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customTextEditColor;
- (id)defaultAttributedString:(unint64_t)a3;
- (id)defaultTypingAttributes:(unint64_t)a3;
- (id)editUIProperties;
- (id)localizedDefaultFontName;
- (id)localizedDefaultText;
- (id)strings;
- (id)textBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 includeMasks:(BOOL)a6;
- (id)textEffectContentDataSource;
- (id)textFrameAtIndex:(unint64_t)a3 time:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 relativeTo:(CGRect)a7 basisOrigin:(int)a8;
- (id)textFramesAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7;
- (int64_t)textHitTest:(CGPoint)a3 time:(id *)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6;
- (unint64_t)indexOfTextObjectUsedForEditViewTransform;
- (unint64_t)maxCharacters;
- (void)beginTextEditing;
- (void)enableDynamicLineSpacingForDiacritics:(BOOL)a3;
- (void)endTextEditing;
- (void)setFont:(id)a3 atIndex:(unint64_t)a4;
- (void)setFontScale:(float)a3 atIndex:(unint64_t)a4;
- (void)setFontSize:(float)a3 atIndex:(unint64_t)a4;
- (void)setString:(id)a3 atIndex:(unint64_t)a4;
- (void)setupLocalizedText;
@end

@implementation JFXTextEffect

- (id)localizedDefaultText
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    v4 = [(JFXTextEffect *)self textEffectContentDataSource];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 localizedDefaultText];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    v7 = [(JFXEffect *)self effectID];
    v8 = [v7 stringByAppendingString:@"_DEFAULT_TEXT"];

    v9 = (void *)MEMORY[0x263F086E0];
    id v5 = v8;
    v10 = [v9 jfxBundle];
    v11 = [v10 localizedStringForKey:v5 value:&stru_26E7CDB50 table:0];

    if ([v11 isEqualToString:v5]) {
      v12 = 0;
    }
    else {
      v12 = v11;
    }
    id v6 = v12;
  }
  return v6;
}

- (id)localizedDefaultFontName
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    v4 = [(JFXTextEffect *)self textEffectContentDataSource];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 localizedDefaultFontName];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    v7 = [(JFXEffect *)self effectID];
    v8 = [v7 stringByAppendingString:@"_FONT"];

    v9 = (void *)MEMORY[0x263F086E0];
    id v5 = v8;
    v10 = [v9 jfxBundle];
    v11 = [v10 localizedStringForKey:v5 value:&stru_26E7CDB50 table:0];

    if ([v11 isEqualToString:v5]) {
      v12 = 0;
    }
    else {
      v12 = v11;
    }
    id v6 = v12;
  }
  return v6;
}

- (void)setupLocalizedText
{
  a2->receiver = a1;
  a2->super_class = (Class)JFXTextEffect;
  v3 = [(objc_super *)a2 description];
  v4 = [a1 effectID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v5, v6, "The font for '%@-%@' is not localized.", v7, v8, v9, v10, v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JFXTextEffect;
  return [(JFXEffect *)&v4 copyWithZone:a3];
}

- (BOOL)isAppearanceEqual:(id)a3 forPurpose:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)JFXTextEffect;
  if ([(JFXEffect *)&v15 isAppearanceEqual:v6 forPurpose:a4])
  {
    uint64_t v7 = *MEMORY[0x263F61778];
    uint64_t v8 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F61778]];
    uint64_t v9 = [v6 parameterForKey:v7];
    if (v8 == v9 || [v8 isEqualToString:v9])
    {
      uint64_t v10 = *MEMORY[0x263F61798];
      uint8_t v11 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F61798]];
      v12 = [v6 parameterForKey:v10];
      if (v11 == v12) {
        char v13 = 1;
      }
      else {
        char v13 = [v11 isEqualToString:v12];
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)textEffectContentDataSource
{
  v3 = [(JFXEffect *)self contentDataSource];
  if (v3)
  {
    objc_super v4 = v3;
    uint64_t v5 = [(JFXEffect *)self contentDataSource];
    int v6 = [v5 conformsToProtocol:&unk_26E86F838];

    if (v6)
    {
      v3 = [(JFXEffect *)self contentDataSource];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)contentProperties
{
  v3 = [(JFXTextEffect *)self textEffectContentDataSource];
  if (v3)
  {
    v22.receiver = self;
    v22.super_class = (Class)JFXTextEffect;
    objc_super v4 = [(JFXEffect *)&v22 contentProperties];
    uint64_t v5 = (void *)[v4 mutableCopy];

    int v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:7];
    uint64_t v7 = [v3 localizedDefaultText];

    if (v7)
    {
      uint64_t v8 = [v3 localizedDefaultText];
      [v6 setObject:v8 forKeyedSubscript:@"localizedDefaultText"];
    }
    uint64_t v9 = [v3 localizedDefaultFontName];

    if (v9)
    {
      uint64_t v10 = [v3 localizedDefaultFontName];
      [v6 setObject:v10 forKeyedSubscript:@"localizedDefaultFontName"];
    }
    uint8_t v11 = [v3 renderTextWithMotionWhenEditing];

    if (v11)
    {
      v12 = [v3 renderTextWithMotionWhenEditing];
      [v6 setObject:v12 forKeyedSubscript:@"renderTextWithMotionWhenEditing"];
    }
    char v13 = [v3 textEditColor];

    if (v13)
    {
      v14 = [v3 textEditColor];
      [v6 setObject:v14 forKeyedSubscript:@"textEditColor"];
    }
    objc_super v15 = [v3 textEditSelectionTintColor];

    if (v15)
    {
      v16 = [v3 textEditSelectionTintColor];
      [v6 setObject:v16 forKeyedSubscript:@"textEditSelectionTintColor"];
    }
    v17 = [v3 maxCharacters];

    if (v17)
    {
      v18 = [v3 maxCharacters];
      [v6 setObject:v18 forKeyedSubscript:@"maxCharacters"];
    }
    v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isTextBakedIn"));
    [v6 setObject:v19 forKeyedSubscript:@"isTextBakedIn"];

    if (v5)
    {
      [v5 addEntriesFromDictionary:v6];
      id v20 = v5;

      int v6 = v20;
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)JFXTextEffect;
    int v6 = [(JFXEffect *)&v23 contentProperties];
  }

  return v6;
}

- (id)strings
{
  v2 = [(JFXEffect *)self renderEffect];
  v3 = [v2 effectParameters];

  objc_super v4 = objc_opt_new();
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F61778]];
  int v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263F61798]];
  if (v5) {
    [v4 addObject:v5];
  }
  if (v6) {
    [v4 addObject:v6];
  }

  return v4;
}

- (void)setString:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v10 = v6;
  uint64_t v7 = (void *)MEMORY[0x263F61778];
  if (a4) {
    uint64_t v7 = (void *)MEMORY[0x263F61798];
  }
  [(JFXEffect *)self setParameter:v6 forKey:*v7];
  if ([v10 length]) {
    uint64_t v8 = [v10 isEqualToString:@" "];
  }
  else {
    uint64_t v8 = 1;
  }
  uint64_t v9 = [NSNumber numberWithBool:v8];
  [(JFXEffect *)self setParameter:v9 forKey:*MEMORY[0x263F61750]];
}

- (void)enableDynamicLineSpacingForDiacritics:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x263F616A8];
  id v5 = [NSNumber numberWithBool:a3];
  [(JFXEffect *)self setParameter:v5 forKey:v4];
}

- (void)setFont:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4 = (void *)MEMORY[0x263F61760];
  if (a4) {
    uint64_t v4 = (void *)MEMORY[0x263F61780];
  }
  [(JFXEffect *)self setParameter:a3 forKey:*v4];
}

- (void)setFontSize:(float)a3 atIndex:(unint64_t)a4
{
  id v6 = (id *)MEMORY[0x263F61770];
  if (a4) {
    id v6 = (id *)MEMORY[0x263F61790];
  }
  uint64_t v7 = NSNumber;
  id v8 = *v6;
  *(float *)&double v9 = a3;
  id v10 = [v7 numberWithFloat:v9];
  [(JFXEffect *)self setParameter:v10 forKey:v8];
}

- (void)setFontScale:(float)a3 atIndex:(unint64_t)a4
{
  id v6 = (id *)MEMORY[0x263F61768];
  if (a4) {
    id v6 = (id *)MEMORY[0x263F61788];
  }
  uint64_t v7 = NSNumber;
  id v8 = *v6;
  *(float *)&double v9 = a3;
  id v10 = [v7 numberWithFloat:v9];
  [(JFXEffect *)self setParameter:v10 forKey:v8];
}

- (id)defaultAttributedString:(unint64_t)a3
{
  uint64_t v4 = [(JFXEffect *)self renderEffect];
  id v5 = [v4 defaultAttributedString:a3];

  return v5;
}

- (id)defaultTypingAttributes:(unint64_t)a3
{
  uint64_t v4 = [(JFXEffect *)self renderEffect];
  id v5 = [v4 defaultAttributedString:a3];

  id v6 = [v5 attributesAtIndex:0 effectiveRange:0];

  return v6;
}

- (id)textFramesAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  uint64_t v7 = +[JFXTextEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXTextEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", self, *(void *)&a7, &v10, a4, a5, 1, a6.size.width, a6.size.height);
  id v8 = [v7 textFrames];

  return v8;
}

- (id)textFrameAtIndex:(unint64_t)a3 time:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 relativeTo:(CGRect)a7 basisOrigin:(int)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  double v9 = -[JFXTextEffect textFramesAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "textFramesAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v12, a5, a6, *(void *)&a8, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
  if ([v9 count] <= a3)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = 0;
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [v9 objectAtIndexedSubscript:a3];
  }

  return v10;
}

- (PVCGPointQuad)textCornersAtIndex:(SEL)a3 time:(unint64_t)a4 forcePosterFrame:(id *)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 relativeTo:(CGPoint)a8 basisOrigin:(CGRect)a9
{
  uint64_t v10 = *(void *)&a10;
  BOOL v11 = a7;
  BOOL v12 = a6;
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a8.y;
  double x = a8.x;
  retstr->CGPoint c = 0u;
  retstr->d = 0u;
  retstr->CGPoint a = 0u;
  retstr->CGPoint b = 0u;
  id v20 = [(JFXEffect *)self renderEffect];
  v21 = v20;
  if (v20)
  {
    long long v26 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    objc_msgSend(v20, "textCornersAtTime:index:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v26, a4, v12, v11, v10, x, y, width, height);
  }
  else
  {
    retstr->CGPoint c = 0u;
    retstr->d = 0u;
    retstr->CGPoint a = 0u;
    retstr->CGPoint b = 0u;
  }

  if (v10 == 1)
  {
    CGPoint c = retstr->c;
    CGPoint a = retstr->a;
    CGPoint b = retstr->b;
    retstr->CGPoint a = retstr->d;
    retstr->CGPoint b = c;
    retstr->CGPoint c = b;
    retstr->d = a;
  }
  return result;
}

- (id)textBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 includeMasks:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v10 = [(JFXEffect *)self renderEffect];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  BOOL v11 = [v10 textEditingBoundsAtTime:&v13 forcePosterFrame:v8 useParagraphBounds:1 includeDropShadow:v7 includeMasks:v6];

  return v11;
}

- (BOOL)textBounds:(CGRect *)a3 atIndex:(unint64_t)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6 includeDropShadow:(BOOL)a7 includeMasks:(BOOL)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = *a5;
  uint64_t v10 = [(JFXTextEffect *)self textBoundsAtTime:&v19 forcePosterFrame:a6 includeDropShadow:a7 includeMasks:a8];
  unint64_t v11 = [v10 count];
  if (v11 <= a4)
  {
    CGSize v17 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    a3->origin = (CGPoint)*MEMORY[0x263F001A8];
    a3->size = v17;
  }
  else
  {
    BOOL v12 = [v10 objectAtIndexedSubscript:a4];
    [v12 CGRectValue];
    a3->origin.double x = v13;
    a3->origin.double y = v14;
    a3->size.double width = v15;
    a3->size.double height = v16;
  }
  return v11 > a4;
}

- (int64_t)textHitTest:(CGPoint)a3 time:(id *)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  CGFloat v15 = [(JFXTextEffect *)self strings];
  uint64_t v16 = [v15 count];

  if (v16 < 1) {
    return -1;
  }
  int64_t v17 = 0;
  while (1)
  {
    memset(&v19[1], 0, sizeof(PVCGPointQuad));
    v19[0].CGPoint a = *(CGPoint *)&a4->var0;
    *(void *)&v19[0].b.double x = a4->var3;
    -[JFXTextEffect textCornersAtIndex:time:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "textCornersAtIndex:time:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", v17, v19, 0, 1, v6, 1.0, 1.0, x, y, width, height);
    v19[0] = v19[1];
    v20.double x = v13;
    v20.double y = v12;
    if (pv_is_CGPoint_in_quad(v20, v19)) {
      break;
    }
    if (v16 == ++v17) {
      return -1;
    }
  }
  return v17;
}

- (void)beginTextEditing
{
  id v2 = [(JFXEffect *)self renderEffect];
  [v2 beginTextEditing];
}

- (void)endTextEditing
{
  id v2 = [(JFXEffect *)self renderEffect];
  [v2 endTextEditing];
}

- (unint64_t)maxCharacters
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (!v3) {
    return -1;
  }
  uint64_t v4 = [(JFXTextEffect *)self textEffectContentDataSource];
  id v5 = v4;
  if (v4 && ([v4 maxCharacters], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v7 = v6;
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v8 = -1;
  }

  return v8;
}

- (BOOL)textBakedIn
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = [(JFXTextEffect *)self textEffectContentDataSource];
    id v5 = v4;
    if (v4) {
      char v6 = [v4 isTextBakedIn];
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    id v5 = [(JFXTextEffect *)self editUIProperties];
    BOOL v7 = [(JFXEffect *)self effectID];
    unint64_t v8 = [v5 objectForKeyedSubscript:v7];

    if (v8
      && ([v8 objectForKey:kJFXEffectPropertiesTextEditDisableTextEditing],
          (double v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v10 = v9;
      char v6 = [v9 BOOLValue];
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (id)customTextEditColor
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = [(JFXTextEffect *)self textEffectContentDataSource];
    id v5 = [v4 textEditColor];
  }
  else
  {
    char v6 = [(JFXEffect *)self effectID];
    BOOL v7 = +[JFXEffectEditingUtilities shouldRenderTextWithMotionWhileEditingTextForEffectID:v6];

    if (v7)
    {
      id v5 = [MEMORY[0x263F1C550] clearColor];
      goto LABEL_13;
    }
    uint64_t v4 = [(JFXTextEffect *)self editUIProperties];
    unint64_t v8 = [(JFXEffect *)self effectID];
    double v9 = [v4 objectForKeyedSubscript:v8];

    if (v9)
    {
      uint64_t v10 = [v9 objectForKeyedSubscript:kJFXEffectPropertiesTextEditColorKey];
      if ((unint64_t)[v10 count] >= 3)
      {
        unint64_t v11 = (void *)MEMORY[0x263F1C550];
        CGFloat v12 = [v10 objectAtIndexedSubscript:0];
        [v12 doubleValue];
        double v14 = v13;
        CGFloat v15 = [v10 objectAtIndexedSubscript:1];
        [v15 doubleValue];
        double v17 = v16;
        v18 = [v10 objectAtIndexedSubscript:2];
        [v18 doubleValue];
        id v5 = [v11 colorWithRed:v14 green:v17 blue:v19 alpha:1.0];
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
LABEL_13:
  return v5;
}

- (UIColor)customTextEditTintColor
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = self;
    id v5 = [v4 textEffectContentDataSource];
    char v6 = [v5 textEditSelectionTintColor];
  }
  else
  {
    uint64_t v4 = [(JFXTextEffect *)self editUIProperties];
    BOOL v7 = [(JFXEffect *)self effectID];
    id v5 = [v4 objectForKeyedSubscript:v7];

    if (v5)
    {
      unint64_t v8 = [v5 objectForKeyedSubscript:kJFXEffectPropertiesTextEditTintColorKey];
      double v9 = v8;
      if (v8)
      {
        uint64_t v10 = (void *)MEMORY[0x263F1C550];
        unint64_t v11 = [v8 objectAtIndexedSubscript:0];
        [v11 floatValue];
        double v13 = v12;
        double v14 = [v9 objectAtIndexedSubscript:1];
        [v14 floatValue];
        double v16 = v15;
        double v17 = [v9 objectAtIndexedSubscript:2];
        [v17 floatValue];
        char v6 = [v10 colorWithRed:v13 green:v16 blue:v18 alpha:1.0];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return (UIColor *)v6;
}

- (id)editUIProperties
{
  if (editUIProperties_onceToken != -1) {
    dispatch_once(&editUIProperties_onceToken, &__block_literal_global_17);
  }
  id v2 = (void *)editUIProperties_finalDict;
  return v2;
}

void __33__JFXTextEffect_editUIProperties__block_invoke()
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F086E0] jfxBundle];
  id v1 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v2 = (void *)editUIProperties_finalDict;
  editUIProperties_finalDict = (uint64_t)v1;

  v3 = NSDictionary;
  uint64_t v4 = [v0 pathForResource:kJFXEffectPropertiesResourceFile ofType:kJFXEffectPropertiesPlistKey];
  id v5 = [v3 dictionaryWithContentsOfFile:v4];

  if (v5)
  {
    float v18 = v0;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [v5 allKeys];
    uint64_t v22 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v22)
    {
      uint64_t v20 = *(void *)v37;
      v21 = v5;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = v6;
          id v24 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * v6)];
          if (v24)
          {
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v41 count:16];
            if (v26)
            {
              uint64_t v25 = *(void *)v33;
              do
              {
                uint64_t v7 = 0;
                do
                {
                  if (*(void *)v33 != v25) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v27 = v7;
                  unint64_t v8 = [*(id *)(*((void *)&v32 + 1) + 8 * v7) objectForKeyedSubscript:kJFXEffectPropertiesEffectsKey];
                  double v9 = v8;
                  if (v8)
                  {
                    long long v30 = 0u;
                    long long v31 = 0u;
                    long long v28 = 0u;
                    long long v29 = 0u;
                    uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v40 count:16];
                    if (v10)
                    {
                      uint64_t v11 = v10;
                      uint64_t v12 = *(void *)v29;
                      do
                      {
                        for (uint64_t i = 0; i != v11; ++i)
                        {
                          if (*(void *)v29 != v12) {
                            objc_enumerationMutation(v9);
                          }
                          double v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                          float v15 = [v14 objectForKeyedSubscript:kJFXEffectPropertiesIdentifierKey];
                          if (v15)
                          {
                            double v16 = (void *)editUIProperties_finalDict;
                            double v17 = [NSDictionary dictionaryWithDictionary:v14];
                            [v16 setValue:v17 forKey:v15];
                          }
                        }
                        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v40 count:16];
                      }
                      while (v11);
                    }
                  }

                  uint64_t v7 = v27 + 1;
                }
                while (v27 + 1 != v26);
                uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v41 count:16];
              }
              while (v26);
            }
          }

          uint64_t v6 = v23 + 1;
          id v5 = v21;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v22);
    }

    v0 = v18;
  }
}

- (unint64_t)indexOfTextObjectUsedForEditViewTransform
{
  return 0;
}

@end