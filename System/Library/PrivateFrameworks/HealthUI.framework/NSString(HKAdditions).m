@interface NSString(HKAdditions)
- (double)hk_boundingHeightWithWidth:()HKAdditions font:;
- (double)hk_boundingWidthWithHeight:()HKAdditions font:;
- (id)hk_attributedStringPrefixedWithImage:()HKAdditions baselineAdjusted:spacing:attributes:;
- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions baselineAdjusted:spacing:;
- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions baselineAdjusted:withAttributes:;
- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions spacing:;
- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions spacing:attributes:;
- (void)hk_drawInRect:()HKAdditions withAttributes:outlineWidth:outlineColor:context:;
@end

@implementation NSString(HKAdditions)

- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions spacing:
{
  return objc_msgSend(a1, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:", 0.0, a3);
}

- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions spacing:attributes:
{
  return objc_msgSend(a1, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:attributes:", a3, (uint64_t)a5, a4, 0.0);
}

- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions baselineAdjusted:spacing:
{
  return objc_msgSend(a1, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:attributes:", a3, (uint64_t)a5, 0);
}

- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions baselineAdjusted:withAttributes:
{
  return objc_msgSend(a1, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:attributes:", a3, 0, a4);
}

- (id)hk_attributedStringPrefixedWithImage:()HKAdditions baselineAdjusted:spacing:attributes:
{
  id v10 = a4;
  id v11 = a6;
  v12 = [MEMORY[0x1E4F1CA48] array];
  if (v10)
  {
    if (a2 < 0.0)
    {
      [v10 size];
      double v14 = v13;
      [v10 size];
      double v16 = v15 + a2;
      [v10 size];
      CGFloat v18 = v17;
      [v10 size];
      CGFloat v20 = v19 + a2;
      [v10 scale];
      CGFloat v22 = v21;
      v34.width = v18;
      v34.height = v20;
      UIGraphicsBeginImageContextWithOptions(v34, 0, v22);
      objc_msgSend(v10, "drawInRect:", 0.0, 0.0, v14, v16);
      uint64_t v23 = UIGraphicsGetImageFromCurrentImageContext();

      UIGraphicsEndImageContext();
      id v10 = (id)v23;
    }
    id v24 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v24 setImage:v10];
    v25 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v24];
    v26 = (void *)[v25 mutableCopy];

    if (a2 != 0.0)
    {
      uint64_t v27 = *MEMORY[0x1E4FB06C8];
      v28 = [NSNumber numberWithDouble:a2];
      objc_msgSend(v26, "addAttribute:value:range:", v27, v28, 0, 1);
    }
    [v12 addObject:v26];
    if (a5 >= 1)
    {
      v29 = objc_msgSend(MEMORY[0x1E4F28B18], "hk_attributedStringForSpacing:", a5);
      [v12 addObject:v29];
    }
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a1 attributes:v11];
    [v12 addObject:v30];
  }
  v31 = HKUIJoinAttributedStringsForLocale(v12);

  return v31;
}

- (double)hk_boundingHeightWithWidth:()HKAdditions font:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a2, 3.40282347e38);
  double Height = CGRectGetHeight(v13);

  return Height;
}

- (double)hk_boundingWidthWithHeight:()HKAdditions font:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, 3.40282347e38, a2);
  double Width = CGRectGetWidth(v13);

  return Width;
}

- (void)hk_drawInRect:()HKAdditions withAttributes:outlineWidth:outlineColor:context:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v18 = a9;
  double v19 = +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", a1, a8, a2, a3, a4, a5);
  v21[0] = v19;
  CGFloat v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  +[HKStringDrawing drawStrings:v20 outlineWidth:v18 outlineColor:a10 context:a6];
}

@end