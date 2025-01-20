@interface JFXEffectTextEditingProperties
+ (id)textEditingPropertiesWithTextEffect:(id)a3 withText:(id)a4 relativeTo:(CGRect)a5 atTime:(id *)a6 index:(unint64_t)a7 moveBeforeScalingToAvoidKeyboard:(BOOL)a8;
- (BOOL)isAllCaps;
- (BOOL)isEmoji;
- (BOOL)isOutlineDisabled;
- (BOOL)isSpecialCaseForGameOverPoster;
- (BOOL)isTextFlipped;
- (BOOL)moveBeforeScalingToAvoidKeyboard;
- (BOOL)useFullTransform;
- (CGAffineTransform)partialTransformNoScaleNoTranslation;
- (CGPoint)scale;
- (CGRect)bounds;
- (CGRect)cachedBounds;
- (CGRect)cachedFrame;
- (CGRect)frame;
- (JFXEffectTextEditingProperties)initWithTextEffect:(id)a3 withText:(id)a4 relativeTo:(CGRect)a5 atTime:(id *)a6 index:(unint64_t)a7 moveBeforeScalingToAvoidKeyboard:(BOOL)a8;
- (JFXTextEffectFrame)effectFrame;
- (NSAttributedString)attributedText;
- (NSDictionary)defaultTypingAttributes;
- (NSNumber)cachedRotation;
- (NSValue)cachedScale;
- (PVMatrix44Double)cachedPartialTransformNoScaleNoTranslation;
- (UIColor)customTextColor;
- (UIColor)customTextEditTintColor;
- (UIColor)defaultTextColor;
- (double)baselineYOffset;
- (double)rotation;
- (id)description;
- (int64_t)textAlignment;
- (unint64_t)numberOfLines;
- (void)JFX_configureWithAttributedString:(id)a3 text:(id)a4;
- (void)JFX_configureWithDefaultTypingAttributes:(id)a3;
- (void)JFX_configureWithEffect:(id)a3;
- (void)JFX_modifyAttributedString:(id)a3;
- (void)JFX_modifyEntireAttributedString:(id)a3 forTargetSize:(CGSize)a4 fontColor:(id)a5;
- (void)JFX_modifyRangesOfAttributedString:(id)a3 isOutlineDisabled:(BOOL)a4;
- (void)setAttributedText:(id)a3;
- (void)setBaselineYOffset:(double)a3;
- (void)setCachedBounds:(CGRect)a3;
- (void)setCachedFrame:(CGRect)a3;
- (void)setCachedPartialTransformNoScaleNoTranslation:(id)a3;
- (void)setCachedRotation:(id)a3;
- (void)setCachedScale:(id)a3;
- (void)setCustomTextColor:(id)a3;
- (void)setCustomTextEditTintColor:(id)a3;
- (void)setDefaultTextColor:(id)a3;
- (void)setDefaultTypingAttributes:(id)a3;
- (void)setEffectFrame:(id)a3;
- (void)setIsAllCaps:(BOOL)a3;
- (void)setIsEmoji:(BOOL)a3;
- (void)setIsSpecialCaseForGameOverPoster:(BOOL)a3;
- (void)setIsTextFlipped:(BOOL)a3;
- (void)setMoveBeforeScalingToAvoidKeyboard:(BOOL)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setOutlineDisabled:(BOOL)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setUseFullTransform:(BOOL)a3;
@end

@implementation JFXEffectTextEditingProperties

+ (id)textEditingPropertiesWithTextEffect:(id)a3 withText:(id)a4 relativeTo:(CGRect)a5 atTime:(id *)a6 index:(unint64_t)a7 moveBeforeScalingToAvoidKeyboard:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_alloc((Class)a1);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a6;
  v20 = objc_msgSend(v19, "initWithTextEffect:withText:relativeTo:atTime:index:moveBeforeScalingToAvoidKeyboard:", v18, v17, &v22, a7, v8, x, y, width, height);

  return v20;
}

- (JFXEffectTextEditingProperties)initWithTextEffect:(id)a3 withText:(id)a4 relativeTo:(CGRect)a5 atTime:(id *)a6 index:(unint64_t)a7 moveBeforeScalingToAvoidKeyboard:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a5.size.height;
  double width = a5.size.width;
  id v15 = a3;
  id v16 = a4;
  id v17 = [v15 strings];
  if ([v17 count] <= a7)
  {
    v34 = 0;
  }
  else
  {
    long long v37 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    id v18 = +[JFXTextEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXTextEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v15, 1, &v37, 0, 0, 1, width, height);
    id v19 = [v18 textFrames];
    unint64_t v20 = [v19 count];

    if (v20 <= a7)
    {
      v34 = 0;
    }
    else
    {
      v36.receiver = self;
      v36.super_class = (Class)JFXEffectTextEditingProperties;
      v21 = [(JFXEffectTextEditingProperties *)&v36 init];
      if (v21)
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = [v15 effectID];
        -[JFXEffectTextEditingProperties setIsSpecialCaseForGameOverPoster:](v21, "setIsSpecialCaseForGameOverPoster:", [v22 isEqualToString:*MEMORY[0x263F615F8]]);

        double v23 = *MEMORY[0x263F001A0];
        double v24 = *(double *)(MEMORY[0x263F001A0] + 8);
        double v25 = *(double *)(MEMORY[0x263F001A0] + 16);
        double v26 = *(double *)(MEMORY[0x263F001A0] + 24);
        -[JFXEffectTextEditingProperties setCachedFrame:](v21, "setCachedFrame:", *MEMORY[0x263F001A0], v24, v25, v26);
        -[JFXEffectTextEditingProperties setCachedBounds:](v21, "setCachedBounds:", v23, v24, v25, v26);
        [(JFXEffectTextEditingProperties *)v21 setMoveBeforeScalingToAvoidKeyboard:v8];
        [(JFXEffectTextEditingProperties *)v21 JFX_configureWithEffect:v15];
        uint64_t v27 = [v15 indexOfTextObjectUsedForEditViewTransform];
        v28 = [v18 textFrames];
        v29 = [v28 objectAtIndexedSubscript:v27];
        [(JFXEffectTextEditingProperties *)v21 setEffectFrame:v29];

        v30 = [v17 objectAtIndexedSubscript:a7];
        [(JFXEffectTextEditingProperties *)v21 JFX_configureWithAttributedString:v30 text:v16];

        v31 = [v15 defaultTypingAttributes:a7];
        [(JFXEffectTextEditingProperties *)v21 JFX_configureWithDefaultTypingAttributes:v31];

        v32 = (void *)MEMORY[0x263F61248];
        v33 = [(JFXEffectTextEditingProperties *)v21 defaultTypingAttributes];
        -[JFXEffectTextEditingProperties setIsAllCaps:](v21, "setIsAllCaps:", [v32 isAllCapsFromAttributes:v33]);
      }
      self = v21;
      v34 = self;
    }
  }
  return v34;
}

- (void)JFX_configureWithEffect:(id)a3
{
  id v10 = a3;
  v4 = [v10 effectID];
  [(JFXEffectTextEditingProperties *)self setUseFullTransform:+[JFXEffectEditingUtilities shouldUseFullTransformWhileEditingTextForEffectID:v4]];

  v5 = [v10 customTextEditColor];
  [(JFXEffectTextEditingProperties *)self setCustomTextColor:v5];

  v6 = [v10 customTextEditTintColor];
  [(JFXEffectTextEditingProperties *)self setCustomTextEditTintColor:v6];

  v7 = [v10 effectID];
  [(JFXEffectTextEditingProperties *)self setOutlineDisabled:+[JFXEffectEditingUtilities shouldDisableTextOutlineWhileEditingTextForEffectID:v7]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v10;
    -[JFXEffectTextEditingProperties setIsEmoji:](self, "setIsEmoji:", [v8 isEmoji]);
    uint64_t v9 = [v8 isTextFlipped];

    [(JFXEffectTextEditingProperties *)self setIsTextFlipped:v9];
  }
  else
  {
    [(JFXEffectTextEditingProperties *)self setIsEmoji:0];
  }
}

- (void)JFX_configureWithAttributedString:(id)a3 text:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v6 && [v13 length])
  {
    unint64_t v7 = [v6 length];
    unint64_t v8 = [v13 length];
    if (v7 >= v8) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v7;
    }
    id v10 = objc_msgSend(v13, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, v9);
    v11 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6 attributes:v10];
  }
  else
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v13];
  }
  [MEMORY[0x263F61248] baselineOffsetFromAttributedString:v11];
  -[JFXEffectTextEditingProperties setBaselineYOffset:](self, "setBaselineYOffset:");
  [(JFXEffectTextEditingProperties *)self JFX_modifyAttributedString:v11];
  if ([v11 length])
  {
    v12 = [v11 attribute:@"TXNumSoftLines" atIndex:0 effectiveRange:0];
    -[JFXEffectTextEditingProperties setNumberOfLines:](self, "setNumberOfLines:", [v12 unsignedIntegerValue]);
  }
  else
  {
    [(JFXEffectTextEditingProperties *)self setNumberOfLines:1];
  }
  [(JFXEffectTextEditingProperties *)self setAttributedText:v11];
}

- (void)JFX_configureWithDefaultTypingAttributes:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F089B8];
  id v5 = a3;
  id v10 = (id)[[v4 alloc] initWithString:@" " attributes:v5];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F1C240]];

  [(JFXEffectTextEditingProperties *)self setDefaultTextColor:v6];
  [(JFXEffectTextEditingProperties *)self JFX_modifyAttributedString:v10];
  unint64_t v7 = [v10 attributesAtIndex:0 effectiveRange:0];
  [(JFXEffectTextEditingProperties *)self setDefaultTypingAttributes:v7];

  unint64_t v8 = [(JFXEffectTextEditingProperties *)self defaultTypingAttributes];
  unint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F1C268]];

  -[JFXEffectTextEditingProperties setTextAlignment:](self, "setTextAlignment:", [v9 alignment]);
}

- (void)JFX_modifyAttributedString:(id)a3
{
  id v9 = a3;
  if ([v9 length])
  {
    [v9 size];
    double v5 = v4;
    double v7 = v6;
    [v9 beginEditing];
    [(JFXEffectTextEditingProperties *)self JFX_modifyRangesOfAttributedString:v9 isOutlineDisabled:[(JFXEffectTextEditingProperties *)self isOutlineDisabled]];
    unint64_t v8 = [(JFXEffectTextEditingProperties *)self customTextColor];
    -[JFXEffectTextEditingProperties JFX_modifyEntireAttributedString:forTargetSize:fontColor:](self, "JFX_modifyEntireAttributedString:forTargetSize:fontColor:", v9, v8, v5, v7);

    [v9 endEditing];
  }
}

- (void)JFX_modifyRangesOfAttributedString:(id)a3 isOutlineDisabled:(BOOL)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    double v7 = 1.0;
    double v8 = 1.0;
    if (![(JFXEffectTextEditingProperties *)self useFullTransform])
    {
      [(JFXEffectTextEditingProperties *)self scale];
      double v7 = v9;
      double v8 = v10;
    }
    uint64_t v11 = [v6 length];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __87__JFXEffectTextEditingProperties_JFX_modifyRangesOfAttributedString_isOutlineDisabled___block_invoke;
    v12[3] = &unk_264C0C180;
    id v13 = v6;
    double v14 = v7;
    double v15 = v8;
    BOOL v16 = a4;
    objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, v12);
  }
}

void __87__JFXEffectTextEditingProperties_JFX_modifyRangesOfAttributedString_isOutlineDisabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_msgSend(MEMORY[0x263F61248], "modifyAttributedStringByApplyingSubstituteFont:attributes:range:", *(void *)(a1 + 32), v7, a3, a4);
  objc_msgSend(MEMORY[0x263F61248], "modifyAttributedStringByAdjustingKerning:attributes:range:scale:", *(void *)(a1 + 32), v7, a3, a4, *(double *)(a1 + 40));
  if (*(unsigned char *)(a1 + 56)) {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x263F1C2A8], a3, a4);
  }
  else {
    objc_msgSend(MEMORY[0x263F61248], "modifyAttributedStringByAdjustingOutline:attributes:range:scale:", *(void *)(a1 + 32), v7, a3, a4, *(double *)(a1 + 40));
  }
}

- (void)JFX_modifyEntireAttributedString:(id)a3 forTargetSize:(CGSize)a4 fontColor:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v20 = a3;
  id v9 = a5;
  if ([v20 length])
  {
    double v10 = 1.0;
    double v11 = 1.0;
    if (![(JFXEffectTextEditingProperties *)self useFullTransform])
    {
      [(JFXEffectTextEditingProperties *)self scale];
      double v10 = v12;
      double v11 = v13;
    }
    BOOL v14 = [(JFXEffectTextEditingProperties *)self isSpecialCaseForGameOverPoster];
    double v15 = v10 * 0.73;
    if (v14)
    {
      double v11 = v11 * 0.73;
      double v10 = v10 * 0.73;
    }
    objc_msgSend(MEMORY[0x263F61248], "modifyAttributedStringByAdjustingFontSize:scale:", v20, v10, v15);
    objc_msgSend(v20, "removeAttribute:range:", *MEMORY[0x263F1C220], 0, objc_msgSend(v20, "length"));
    [MEMORY[0x263F61248] modifyAttributedStringByAdjustingForNegativeLineSpacing:v20 scale:v10];
    BOOL v16 = (void *)MEMORY[0x263F61248];
    [(JFXEffectTextEditingProperties *)self rotation];
    [v16 modifyAttributedStringByAdjustingShadow:v20 scale:v10 rotation:v17];
    if (v9)
    {
      uint64_t v18 = [v20 length];
      uint64_t v19 = *MEMORY[0x263F1C240];
      objc_msgSend(v20, "removeAttribute:range:", *MEMORY[0x263F1C240], 0, v18);
      objc_msgSend(v20, "addAttribute:value:range:", v19, v9, 0, v18);
    }
    if (![(JFXEffectTextEditingProperties *)self isSpecialCaseForGameOverPoster]) {
      objc_msgSend(MEMORY[0x263F61248], "modifyAttributedStringByAdjustingFont:toFitSize:", v20, width * v10, height * v11);
    }
  }
}

- (CGRect)frame
{
  [(JFXEffectTextEditingProperties *)self cachedFrame];
  if (CGRectIsNull(v51))
  {
    v3 = [(JFXEffectTextEditingProperties *)self effectFrame];
    [v3 center];
    double v5 = v4;
    double v7 = v6;

    memset(&v49, 0, sizeof(v49));
    CGAffineTransformMakeTranslation(&t1, -v5, -v7);
    [(JFXEffectTextEditingProperties *)self rotation];
    CGAffineTransformMakeRotation(&t2, -(v8 + -3.14159265));
    CGAffineTransformConcat(&v48, &t1, &t2);
    CGAffineTransformMakeTranslation(&v45, v5, v7);
    CGAffineTransformConcat(&v49, &v48, &v45);
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x6010000000;
    v40 = &unk_234D77F97;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v9 = [(JFXEffectTextEditingProperties *)self effectFrame];
    double v10 = v9;
    if (v9) {
      [v9 cornerPoints];
    }
    else {
      memset(&v36, 0, sizeof(v36));
    }
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    CGAffineTransform v35 = v49;
    v32 = __39__JFXEffectTextEditingProperties_frame__block_invoke;
    v33 = &unk_264C0C1A8;
    v34 = &v37;
    uint64_t v19 = v31;
    uint64_t v20 = 0;
    do
    {
      PVCGPointQuad v50 = v36;
      PVCGPointQuad_get_point_at_index(&v50);
      ((void (*)(void *, uint64_t))v32)(v19, v20);
      uint64_t v20 = (v20 + 1);
    }
    while (v20 != 4);

    CGPoint v21 = (CGPoint)*((_OWORD *)v38 + 3);
    v50.a = (CGPoint)*((_OWORD *)v38 + 2);
    v50.b = v21;
    CGPoint v22 = (CGPoint)*((_OWORD *)v38 + 5);
    v50.c = (CGPoint)*((_OWORD *)v38 + 4);
    v50.d = v22;
    pv_bounding_CGRect(&v50);
    double v12 = v23;
    double v14 = v24;
    double v16 = v25;
    double v18 = v26;
    if ([(JFXEffectTextEditingProperties *)self isSpecialCaseForGameOverPoster])
    {
      double v12 = v12 + (v16 - v16 * 0.73) * 0.5;
      double v14 = v14 + (v18 - v18 * 0.73) * 0.5;
      double v18 = v18 * 0.73;
      double v16 = v16 * 0.73;
    }
    -[JFXEffectTextEditingProperties setCachedFrame:](self, "setCachedFrame:", v12, v14, v16, v18);
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    [(JFXEffectTextEditingProperties *)self cachedFrame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  double v27 = v12;
  double v28 = v14;
  double v29 = v16;
  double v30 = v18;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

uint64_t __39__JFXEffectTextEditingProperties_frame__block_invoke(uint64_t a1, double a2, double a3)
{
  CGPoint v3 = (CGPoint)vaddq_f64(*(float64x2_t *)(a1 + 72), vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 56), a3), *(float64x2_t *)(a1 + 40), a2));
  CGFloat y = v3.y;
  return PVCGPointQuad_set_point_at_index((PVCGPointQuad *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), v3);
}

- (CGRect)bounds
{
  [(JFXEffectTextEditingProperties *)self cachedBounds];
  if (CGRectIsNull(v18))
  {
    [(JFXEffectTextEditingProperties *)self frame];
    double v3 = CGRectMakeWithSize();
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    -[JFXEffectTextEditingProperties setCachedBounds:](self, "setCachedBounds:");
  }
  else
  {
    [(JFXEffectTextEditingProperties *)self cachedBounds];
    double v3 = v10;
    double v5 = v11;
    double v7 = v12;
    double v9 = v13;
  }
  double v14 = v3;
  double v15 = v5;
  double v16 = v7;
  double v17 = v9;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGPoint)scale
{
  double v3 = [(JFXEffectTextEditingProperties *)self cachedScale];

  if (v3)
  {
    double v4 = [(JFXEffectTextEditingProperties *)self cachedScale];
    [v4 CGPointValue];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    long long v18 = 0u;
    double v9 = [(JFXEffectTextEditingProperties *)self effectFrame];
    double v10 = v9;
    if (v9)
    {
      [v9 transformInfo];
    }
    else
    {
      long long v18 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
    }

    double v6 = fmax(fabs(*(double *)&v18), 0.001);
    double v8 = fmax(fabs(*((double *)&v18 + 1)), 0.001);
    if ([(JFXEffectTextEditingProperties *)self isSpecialCaseForGameOverPoster])
    {
      double v8 = v8 * 0.73;
      double v6 = v6 * 0.73;
    }
    double v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v6, v8, v14, v15, v16, v17);
    [(JFXEffectTextEditingProperties *)self setCachedScale:v11];
  }
  double v12 = v6;
  double v13 = v8;
  result.CGFloat y = v13;
  result.double x = v12;
  return result;
}

- (double)rotation
{
  double v3 = [(JFXEffectTextEditingProperties *)self cachedRotation];

  if (v3)
  {
    double v4 = [(JFXEffectTextEditingProperties *)self cachedRotation];
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    double v7 = [(JFXEffectTextEditingProperties *)self effectFrame];
    double v8 = v7;
    if (v7)
    {
      [v7 transformInfo];
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }

    pv_simd_quaternion_get_euler_angles();
    double v6 = 0.0 + 3.14159265;
    if ([(JFXEffectTextEditingProperties *)self isTextFlipped]) {
      double v6 = v6 + -3.14159265;
    }
    double v9 = [NSNumber numberWithDouble:v6];
    [(JFXEffectTextEditingProperties *)self setCachedRotation:v9];
  }
  return v6;
}

- (CGAffineTransform)partialTransformNoScaleNoTranslation
{
  CGPoint result = (CGAffineTransform *)[(JFXEffectTextEditingProperties *)self isSpecialCaseForGameOverPoster];
  if (result)
  {
    uint64_t v6 = MEMORY[0x263F000D0];
    long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->c = v7;
    long long v8 = *(_OWORD *)(v6 + 32);
LABEL_14:
    *(_OWORD *)&retstr->tdouble x = v8;
    return result;
  }
  double v9 = [(JFXEffectTextEditingProperties *)self cachedPartialTransformNoScaleNoTranslation];

  if (!v9)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v15 = [(JFXEffectTextEditingProperties *)self effectFrame];
    long long v16 = v15;
    if (v15)
    {
      [v15 transform];
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
    }

    *(void *)&long long v17 = 0;
    *((void *)&v17 + 1) = *((void *)&v52 + 1);
    long long v51 = 0u;
    long long v52 = v17;
    [(JFXEffectTextEditingProperties *)self scale];
    *(double *)&unint64_t v28 = 1.0 / v18;
    [(JFXEffectTextEditingProperties *)self scale];
    double v20 = v19;
    pv_simd_normalize();
    uint64_t v21 = 0;
    *(void *)&long long v22 = 0;
    *((double *)&v22 + 1) = -1.0 / v20;
    long long v61 = v28;
    long long v62 = 0u;
    long long v63 = v22;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = xmmword_234D61140;
    long long v67 = 0u;
    long long v68 = xmmword_234D61130;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    do
    {
      float64x2_t v24 = *(float64x2_t *)((char *)&v61 + v21);
      float64x2_t v23 = *(float64x2_t *)((char *)&v61 + v21 + 16);
      double v25 = (float64x2_t *)((char *)&v37 + v21);
      *double v25 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v29, v24.f64[0]), v31, v24, 1), v33, v23.f64[0]), v35, v23, 1);
      v25[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v30, v24.f64[0]), v32, v24, 1), v34, v23.f64[0]), v36, v23, 1);
      v21 += 32;
    }
    while (v21 != 128);
    long long v49 = v41;
    long long v50 = v42;
    long long v51 = v43;
    long long v52 = v44;
    long long v45 = v37;
    long long v46 = v38;
    long long v47 = v39;
    long long v48 = v40;
    long long v65 = v41;
    long long v66 = v42;
    long long v67 = v43;
    long long v68 = v44;
    long long v61 = v37;
    long long v62 = v38;
    long long v63 = v39;
    long long v64 = v40;
    double v26 = [MEMORY[0x263F612E0] matrixWithSIMDDouble4x4:&v61];
    [(JFXEffectTextEditingProperties *)self setCachedPartialTransformNoScaleNoTranslation:v26];

    long long v27 = v47;
    *(_OWORD *)&retstr->a = v45;
    *(_OWORD *)&retstr->c = v27;
    long long v8 = v51;
    goto LABEL_14;
  }
  double v10 = [(JFXEffectTextEditingProperties *)self cachedPartialTransformNoScaleNoTranslation];
  long long v11 = v10;
  if (v10)
  {
    [v10 SIMDDouble4x4];
    long long v12 = v53;
    long long v13 = v55;
    long long v14 = v59;
  }
  else
  {
    long long v12 = 0uLL;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v13 = 0uLL;
    long long v14 = 0uLL;
    long long v53 = 0u;
    long long v54 = 0u;
  }
  *(_OWORD *)&retstr->a = v12;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tdouble x = v14;

  return result;
}

- (id)description
{
  double v20 = NSString;
  v26.receiver = self;
  v26.super_class = (Class)JFXEffectTextEditingProperties;
  double v19 = [(JFXEffectTextEditingProperties *)&v26 description];
  float64x2_t v24 = [(JFXEffectTextEditingProperties *)self attributedText];
  float64x2_t v23 = [(JFXEffectTextEditingProperties *)self defaultTypingAttributes];
  [(JFXEffectTextEditingProperties *)self bounds];
  double v18 = NSStringFromCGRect(v28);
  [(JFXEffectTextEditingProperties *)self frame];
  long long v17 = NSStringFromCGRect(v29);
  double v3 = (void *)MEMORY[0x263F08D40];
  [(JFXEffectTextEditingProperties *)self scale];
  v25[0] = v4;
  v25[1] = v5;
  long long v22 = [v3 valueWithBytes:v25 objCType:"{CGPoint=dd}"];
  uint64_t v6 = NSNumber;
  [(JFXEffectTextEditingProperties *)self rotation];
  long long v15 = objc_msgSend(v6, "numberWithDouble:");
  long long v16 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXEffectTextEditingProperties useFullTransform](self, "useFullTransform"));
  long long v14 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXEffectTextEditingProperties isAllCaps](self, "isAllCaps"));
  long long v7 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXEffectTextEditingProperties isEmoji](self, "isEmoji"));
  long long v8 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXEffectTextEditingProperties isTextFlipped](self, "isTextFlipped"));
  double v9 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXEffectTextEditingProperties isOutlineDisabled](self, "isOutlineDisabled"));
  double v10 = [(JFXEffectTextEditingProperties *)self customTextEditTintColor];
  long long v11 = [(JFXEffectTextEditingProperties *)self customTextColor];
  long long v12 = [(JFXEffectTextEditingProperties *)self effectFrame];
  uint64_t v21 = [v20 stringWithFormat:@"%@\n    attributedText: %@\n    defaultTypingAttributes: %@\n    bounds: %@\n    frame: %@\n    scale: %@\n    rotation: %@\n    useFullTransform: %@\n    isAllCaps: %@\n    isEmoji: %@\n    isTextFlipped: %@\n    isOutlineDisabled: %@\n    customTextEditTintColor: %@\n    customTextColor: %@\n    effectFrame:\n%@\n", v19, v24, v23, v18, v17, v22, v15, v16, v14, v7, v8, v9, v10, v11, v12];

  return v21;
}

- (JFXTextEffectFrame)effectFrame
{
  return self->_effectFrame;
}

- (void)setEffectFrame:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
}

- (NSDictionary)defaultTypingAttributes
{
  return self->_defaultTypingAttributes;
}

- (void)setDefaultTypingAttributes:(id)a3
{
}

- (BOOL)useFullTransform
{
  return self->_useFullTransform;
}

- (void)setUseFullTransform:(BOOL)a3
{
  self->_useFullTransform = a3;
}

- (BOOL)isAllCaps
{
  return self->_isAllCaps;
}

- (void)setIsAllCaps:(BOOL)a3
{
  self->_isAllCaps = a3;
}

- (BOOL)isEmoji
{
  return self->_isEmoji;
}

- (void)setIsEmoji:(BOOL)a3
{
  self->_isEmoji = a3;
}

- (BOOL)isTextFlipped
{
  return self->_isTextFlipped;
}

- (void)setIsTextFlipped:(BOOL)a3
{
  self->_isTextFlipped = a3;
}

- (BOOL)isOutlineDisabled
{
  return self->_outlineDisabled;
}

- (void)setOutlineDisabled:(BOOL)a3
{
  self->_outlineDisabled = a3;
}

- (BOOL)moveBeforeScalingToAvoidKeyboard
{
  return self->_moveBeforeScalingToAvoidKeyboard;
}

- (void)setMoveBeforeScalingToAvoidKeyboard:(BOOL)a3
{
  self->_moveBeforeScalingToAvoidKeyboard = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
}

- (double)baselineYOffset
{
  return self->_baselineYOffset;
}

- (void)setBaselineYOffset:(double)a3
{
  self->_baselineYOffset = a3;
}

- (UIColor)defaultTextColor
{
  return self->_defaultTextColor;
}

- (void)setDefaultTextColor:(id)a3
{
}

- (UIColor)customTextColor
{
  return self->_customTextColor;
}

- (void)setCustomTextColor:(id)a3
{
}

- (UIColor)customTextEditTintColor
{
  return self->_customTextEditTintColor;
}

- (void)setCustomTextEditTintColor:(id)a3
{
}

- (BOOL)isSpecialCaseForGameOverPoster
{
  return self->_isSpecialCaseForGameOverPoster;
}

- (void)setIsSpecialCaseForGameOverPoster:(BOOL)a3
{
  self->_isSpecialCaseForGameOverPoster = a3;
}

- (CGRect)cachedFrame
{
  double x = self->_cachedFrame.origin.x;
  double y = self->_cachedFrame.origin.y;
  double width = self->_cachedFrame.size.width;
  double height = self->_cachedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedFrame:(CGRect)a3
{
  self->_cachedFrame = a3;
}

- (CGRect)cachedBounds
{
  double x = self->_cachedBounds.origin.x;
  double y = self->_cachedBounds.origin.y;
  double width = self->_cachedBounds.size.width;
  double height = self->_cachedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedBounds:(CGRect)a3
{
  self->_cachedBounds = a3;
}

- (NSValue)cachedScale
{
  return self->_cachedScale;
}

- (void)setCachedScale:(id)a3
{
}

- (NSNumber)cachedRotation
{
  return self->_cachedRotation;
}

- (void)setCachedRotation:(id)a3
{
}

- (PVMatrix44Double)cachedPartialTransformNoScaleNoTranslation
{
  return self->_cachedPartialTransformNoScaleNoTranslation;
}

- (void)setCachedPartialTransformNoScaleNoTranslation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPartialTransformNoScaleNoTranslation, 0);
  objc_storeStrong((id *)&self->_cachedRotation, 0);
  objc_storeStrong((id *)&self->_cachedScale, 0);
  objc_storeStrong((id *)&self->_customTextEditTintColor, 0);
  objc_storeStrong((id *)&self->_customTextColor, 0);
  objc_storeStrong((id *)&self->_defaultTextColor, 0);
  objc_storeStrong((id *)&self->_defaultTypingAttributes, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_effectFrame, 0);
}

@end