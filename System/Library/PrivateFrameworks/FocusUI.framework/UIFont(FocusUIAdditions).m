@interface UIFont(FocusUIAdditions)
+ (id)fcui_excessiveLineHeightChars;
+ (uint64_t)fcui_exuberatedValueForValue:()FocusUIAdditions;
- (double)fcui_drawingHeightForText:()FocusUIAdditions withNumberOfLines:additionalPadding:;
- (double)fcui_measuringHeightForText:()FocusUIAdditions withNumberOfLines:;
- (uint64_t)fcui_effectiveLineHeightForText:()FocusUIAdditions;
- (uint64_t)fcui_effectiveScaledValueForValue:()FocusUIAdditions hasExuberatedLineHeight:;
- (uint64_t)fcui_hasExuberatedLineHeight;
- (uint64_t)fcui_hasExuberatedLineHeightForText:()FocusUIAdditions;
- (unint64_t)fcui_numberOfLinesForText:()FocusUIAdditions inFrame:maximum:drawingContext:;
@end

@implementation UIFont(FocusUIAdditions)

+ (id)fcui_excessiveLineHeightChars
{
  if (fcui_excessiveLineHeightChars_onceToken != -1) {
    dispatch_once(&fcui_excessiveLineHeightChars_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)fcui_excessiveLineHeightChars___excessiveLineHeightChars;
  return v0;
}

+ (uint64_t)fcui_exuberatedValueForValue:()FocusUIAdditions
{
  return MEMORY[0x270EE9C18]();
}

- (uint64_t)fcui_hasExuberatedLineHeight
{
  return MEMORY[0x270EE9CA8]();
}

- (uint64_t)fcui_hasExuberatedLineHeightForText:()FocusUIAdditions
{
  id v4 = a3;
  if ([v4 length] && objc_msgSend(a1, "fcui_hasExuberatedLineHeight")) {
    uint64_t v5 = objc_msgSend(v4, "fcui_containsExcessiveLineHeightCharacters");
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)fcui_effectiveScaledValueForValue:()FocusUIAdditions hasExuberatedLineHeight:
{
  if (a4)
  {
    v6 = objc_opt_class();
    [a1 _scaledValueForValue:a2];
    return objc_msgSend(v6, "fcui_exuberatedValueForValue:");
  }
  else
  {
    return objc_msgSend(a1, "_scaledValueForValue:");
  }
}

- (uint64_t)fcui_effectiveLineHeightForText:()FocusUIAdditions
{
  if (objc_msgSend(a1, "fcui_hasExuberatedLineHeightForText:"))
  {
    v2 = objc_opt_class();
    [a1 lineHeight];
    return objc_msgSend(v2, "fcui_exuberatedValueForValue:");
  }
  else
  {
    return [a1 lineHeight];
  }
}

- (unint64_t)fcui_numberOfLinesForText:()FocusUIAdditions inFrame:maximum:drawingContext:
{
  v20[1] = *MEMORY[0x263EF8340];
  id v14 = a7;
  id v15 = a9;
  if ([v14 length])
  {
    if (a8 != 1)
    {
      if (!v15)
      {
        id v15 = objc_alloc_init(MEMORY[0x263F81668]);
        [v15 setWantsNumberOfLineFragments:1];
      }
      uint64_t v19 = *MEMORY[0x263F814F0];
      v20[0] = a1;
      v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v16, v15, a4, a5);

      if (!a8) {
        a8 = -1;
      }
      unint64_t v17 = [v15 numberOfLineFragments];
      if (a8 >= v17) {
        a8 = v17;
      }
    }
  }
  else
  {
    a8 = 0;
  }

  return a8;
}

- (double)fcui_measuringHeightForText:()FocusUIAdditions withNumberOfLines:
{
  double v6 = (double)a4;
  objc_msgSend(a1, "fcui_effectiveLineHeightForText:");
  double v8 = v7;
  unint64_t v9 = a4 - 1;
  if (!a4) {
    unint64_t v9 = 0;
  }
  double v10 = (double)v9;
  [a1 leading];
  return v11 * v10 + v6 * v8;
}

- (double)fcui_drawingHeightForText:()FocusUIAdditions withNumberOfLines:additionalPadding:
{
  uint64_t v8 = objc_msgSend(a1, "fcui_hasExuberatedLineHeightForText:");
  if (v8)
  {
    unint64_t v9 = objc_opt_class();
    [a1 lineHeight];
    objc_msgSend(v9, "fcui_exuberatedValueForValue:");
  }
  else
  {
    [a1 lineHeight];
  }
  double v11 = v10;
  objc_msgSend(a1, "fcui_effectiveScaledValueForValue:hasExuberatedLineHeight:", v8, a2);
  double v13 = v12;
  [a1 leading];
  return (v13 + v11 + v14) * (double)a5;
}

@end