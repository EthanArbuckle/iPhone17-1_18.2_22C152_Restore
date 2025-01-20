@interface CUIKORImageUtils
+ (UIEdgeInsets)_edgeInsets:(UIEdgeInsets)a3 scaledByFont:(id)a4;
+ (double)colorBarThickness;
+ (double)hideIconBreakpoint;
+ (double)iconToTextPadding;
+ (double)occurrencePadding;
+ (id)_calendarColorDotImageForColor:(id)a3 baseSize:(double)a4 font:(id)a5;
+ (id)_calendarColorDotImageForColor:(id)a3 diameter:(double)a4;
+ (id)_calendarColorDotImageForColor:(id)a3 diameter:(double)a4 enabled:(BOOL)a5 adjustWhiteColor:(BOOL)a6;
+ (id)scaledCalendarColorChooserDotImageForColor:(id)a3 font:(id)a4;
+ (id)scaledCalendarColorDotImageForColor:(id)a3 font:(id)a4;
+ (id)scaledCalendarColorDotImageForColor_SuggestedEvent:(id)a3 font:(id)a4;
+ (id)scaledCalendarInvitationDotForFont:(id)a3;
+ (unint64_t)_uniqueDotHashForColor:(id)a3 diameter:(double)a4;
@end

@implementation CUIKORImageUtils

+ (double)colorBarThickness
{
  return 3.0;
}

+ (double)iconToTextPadding
{
  [a1 occurrencePadding];
  return v2 + -2.0;
}

+ (double)occurrencePadding
{
  return 4.0;
}

+ (double)hideIconBreakpoint
{
  return 50.0;
}

+ (id)scaledCalendarInvitationDotForFont:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  v6 = [v4 systemBlueColor];
  v7 = [a1 _calendarColorDotImageForColor:v6 baseSize:v5 font:6.0];

  objc_msgSend(a1, "_edgeInsets:scaledByFont:", v5, 1.0, 0.0, 0.5, 3.0);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = objc_msgSend(v7, "cuik_imageWithInsets:", v9, v11, v13, v15);

  return v16;
}

+ (id)scaledCalendarColorDotImageForColor:(id)a3 font:(id)a4
{
  return (id)[a1 _calendarColorDotImageForColor:a3 baseSize:a4 font:7.5];
}

+ (id)scaledCalendarColorChooserDotImageForColor:(id)a3 font:(id)a4
{
  return (id)[a1 _calendarColorDotImageForColor:a3 baseSize:a4 font:13.0];
}

+ (id)scaledCalendarColorDotImageForColor_SuggestedEvent:(id)a3 font:(id)a4
{
  return (id)[a1 _calendarColorDotImageForColor:a3 baseSize:a4 font:10.0];
}

+ (id)_calendarColorDotImageForColor:(id)a3 diameter:(double)a4 enabled:(BOOL)a5 adjustWhiteColor:(BOOL)a6
{
  id v9 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x4010000000;
  v19[4] = 0;
  v19[5] = 0;
  v19[3] = &unk_1BE0B4516;
  double v20 = a4;
  double v21 = a4;
  double v10 = (void *)MEMORY[0x1E4FB1818];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__CUIKORImageUtils__calendarColorDotImageForColor_diameter_enabled_adjustWhiteColor___block_invoke;
  v14[3] = &unk_1E636A828;
  id v11 = v9;
  BOOL v17 = a5;
  id v15 = v11;
  v16 = v19;
  BOOL v18 = a6;
  double v12 = objc_msgSend(v10, "cuik_drawImageWithSize:drawBlock:", v14, v20, v21);

  _Block_object_dispose(v19, 8);

  return v12;
}

void __85__CUIKORImageUtils__calendarColorDotImageForColor_diameter_enabled_adjustWhiteColor___block_invoke(uint64_t a1, CGContext *a2)
{
  id v4 = *(id *)(a1 + 32);
  if (!*(unsigned char *)(a1 + 48))
  {
    id v8 = v4;
    id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.65 alpha:1.0];
    uint64_t v6 = CUIKBlendColorsSourceOver(v8, v5);

    id v4 = (id)v6;
  }
  id v9 = v4;
  [v4 setFill];
  CGContextFillEllipseInRect(a2, *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  if (CUIKColorIsWhite(*(void **)(a1 + 32)) && *(unsigned char *)(a1 + 49))
  {
    v7 = [MEMORY[0x1E4FB1618] grayColor];
    CGContextSetLineWidth(a2, 1.0);
    *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGRectInset(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8)+ 32), 0.5, 0.5);
    [v7 setStroke];
    CGContextStrokeEllipseInRect(a2, *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  }
}

+ (unint64_t)_uniqueDotHashForColor:(id)a3 diameter:(double)a4
{
  double v8 = 0.0;
  double v9 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  objc_msgSend(a3, "cuik_getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  return (int)(v9 * 100.0) | ((int)(a4 * 100.0) << 28) | ((int)(v8 * 100.0) << 7) | ((int)(v7 * 100.0) << 14) | ((int)(v6 * 100.0) << 21);
}

+ (id)_calendarColorDotImageForColor:(id)a3 diameter:(double)a4
{
  id v6 = a3;
  double v7 = v6;
  if (_calendarColorDotImageForColor_diameter__onceToken[0] == -1)
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_8:
    double v12 = 0;
    double v9 = 0;
    goto LABEL_9;
  }
  dispatch_once(_calendarColorDotImageForColor_diameter__onceToken, &__block_literal_global_11);
  if (!v7) {
    goto LABEL_8;
  }
LABEL_3:
  double v8 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_systemBackgroundColor");
  double v9 = CUIKAdjustedColorForBackgroundColor(v7, v8);

  uint64_t v10 = [a1 _uniqueDotHashForColor:v9 diameter:a4];
  id v11 = [NSNumber numberWithUnsignedInteger:v10];
  double v12 = [(id)_calendarColorDotImageForColor_diameter____CachedDotImages objectForKey:v11];
  if (!v12)
  {
    double v12 = [a1 _calendarColorDotImageForColor:v9 diameter:1 enabled:1 adjustWhiteColor:a4];
    if (v12) {
      [(id)_calendarColorDotImageForColor_diameter____CachedDotImages setObject:v12 forKey:v11];
    }
  }

LABEL_9:

  return v12;
}

void __60__CUIKORImageUtils__calendarColorDotImageForColor_diameter___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_calendarColorDotImageForColor_diameter____CachedDotImages;
  _calendarColorDotImageForColor_diameter____CachedDotImages = v0;
}

+ (id)_calendarColorDotImageForColor:(id)a3 baseSize:(double)a4 font:(id)a5
{
  id v8 = a3;
  objc_msgSend(a5, "cuik_scaledValueForValue:", a4);
  double v9 = objc_msgSend(a1, "_calendarColorDotImageForColor:diameter:", v8);

  return v9;
}

+ (UIEdgeInsets)_edgeInsets:(UIEdgeInsets)a3 scaledByFont:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v8 = a4;
  objc_msgSend(v8, "cuik_scaledValueForValue:", top);
  double v10 = v9;
  objc_msgSend(v8, "cuik_scaledValueForValue:", left);
  double v12 = v11;
  objc_msgSend(v8, "cuik_scaledValueForValue:", bottom);
  double v14 = v13;
  objc_msgSend(v8, "cuik_scaledValueForValue:", right);
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.double right = v20;
  result.double bottom = v19;
  result.double left = v18;
  result.double top = v17;
  return result;
}

@end