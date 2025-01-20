@interface AKTextAnnotationAttributeHelper
+ (id)actualOrPlaceholderTextOfAnnotation:(id)a3;
+ (id)font:(id)a3 byApplyingScaleFactor:(double)a4;
+ (id)fontsOfAnnotations:(id)a3;
+ (id)fontsOfEditor:(id)a3;
+ (id)newTextStorage:(id)a3 byApplyingScaleFactor:(double)a4;
+ (id)newTextStorageOriginalFontSavvyWithAttributedString:(id)a3;
+ (id)newTextStorageOriginalFontSavvyWithString:(id)a3 attributes:(id)a4;
+ (id)placeholderTextOfAnnotation:(id)a3;
+ (id)textAttributesOfAnnotations:(id)a3;
+ (id)textAttributesOfEditor:(id)a3;
+ (id)typingAttributes:(id)a3 byApplyingScaleFactor:(double)a4;
+ (void)adjustAnnotationBoundsToFitText:(id)a3;
+ (void)adjustBoundsOfAnnotation:(id)a3 toFitOptionalText:(id)a4 onPageController:(id)a5;
+ (void)enumerateFontAttributesOfAttributedString:(id)a3 usingBlock:(id)a4;
+ (void)resolvedAlignmentAndDirection:(id)a3 locale:(id)a4 alignment:(int64_t *)a5 direction:(int64_t *)a6;
+ (void)setFont:(id)a3 ofAnnotation:(id)a4;
+ (void)setTextAlignment:(int64_t)a3 ofAnnotation:(id)a4;
+ (void)setTextAttributes:(id)a3 ofAnnotation:(id)a4;
@end

@implementation AKTextAnnotationAttributeHelper

+ (void)resolvedAlignmentAndDirection:(id)a3 locale:(id)a4 alignment:(int64_t *)a5 direction:(int64_t *)a6
{
  id v13 = a3;
  id v9 = a4;
  if (!v13 || (int64_t v10 = [v13 baseWritingDirection], v10 == -1)) {
    int64_t v10 = [MEMORY[0x263F1C358] defaultWritingDirectionForLanguage:v9];
  }
  if (a6) {
    *a6 = v10;
  }
  if (a5)
  {
    if (v13)
    {
      int64_t v11 = [v13 alignment];
      BOOL v12 = v10 == 1;
      if (v11 != 4) {
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v12 = v10 == 1;
    }
    int64_t v11 = 2 * v12;
LABEL_12:
    *a5 = v11;
  }
}

+ (id)fontsOfAnnotations:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v17 = [MEMORY[0x263EFF9C0] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v16 = *MEMORY[0x263F1C238];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 conformsToAKTextAnnotationProtocol])
        {
          id v10 = v9;
          int64_t v11 = [v10 annotationText];
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = sub_23762E2A8;
          v18[3] = &unk_264CDAF08;
          id v12 = v17;
          id v19 = v12;
          +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:v11 usingBlock:v18];
          if (!v11 || ![v11 length])
          {
            id v13 = [v10 typingAttributes];
            v14 = [v13 objectForKeyedSubscript:v16];

            if (v14) {
              [v12 addObject:v14];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v17;
}

+ (id)fontsOfEditor:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] set];
  if ([v3 isEditing])
  {
    uint64_t v5 = [v3 textView];
    uint64_t v6 = [v3 annotation];
    [v6 originalModelBaseScaleFactor];
    double v8 = 1.0 / v7;
    id v9 = [v5 textStorage];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_23762E3E8;
    v11[3] = &unk_264CDAF30;
    double v13 = v8;
    id v12 = v4;
    +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:v9 usingBlock:v11];
  }

  return v4;
}

+ (void)setFont:(id)a3 ofAnnotation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 annotationText];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = [v7 annotationText];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_23762E570;
  id v17 = &unk_264CDAF58;
  id v18 = v9;
  id v19 = v6;
  id v11 = v6;
  id v12 = v9;
  +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:v10 usingBlock:&v14];

  double v13 = objc_msgSend(a1, "newTextStorageOriginalFontSavvyWithAttributedString:", v12, v14, v15, v16, v17);
  [v7 setAnnotationText:v13];
}

+ (void)setTextAlignment:(int64_t)a3 ofAnnotation:(id)a4
{
  id v6 = a4;
  id v7 = [v6 annotationText];
  id v13 = (id)[v7 mutableCopy];

  uint64_t v8 = [v13 length];
  uint64_t v9 = *MEMORY[0x263F1C268];
  if (!v8
    || ([v13 attribute:*MEMORY[0x263F1C268] atIndex:0 effectiveRange:0],
        (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v10 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  }
  id v11 = (void *)[v10 mutableCopy];
  [v11 setAlignment:a3];
  objc_msgSend(v13, "addAttribute:value:range:", v9, v11, 0, objc_msgSend(v13, "length"));
  id v12 = (void *)[a1 newTextStorageOriginalFontSavvyWithAttributedString:v13];
  [v6 setAnnotationText:v12];
}

+ (id)textAttributesOfAnnotations:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 conformsToAKTextAnnotationProtocol])
        {
          id v11 = v10;
          id v12 = [v11 annotationText];
          uint64_t v13 = [v12 length];
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = sub_23762E8B0;
          v17[3] = &unk_264CDAF80;
          id v14 = v4;
          id v18 = v14;
          objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v17);
          if (!v12 || ![v12 length])
          {
            uint64_t v15 = [v11 typingAttributes];
            [v14 addObject:v15];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)textAttributesOfEditor:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] set];
  if ([v3 isEditing])
  {
    id v5 = [v3 textView];
    uint64_t v6 = [v5 textStorage];
    uint64_t v7 = [v6 length];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_23762E9C8;
    v9[3] = &unk_264CDAF80;
    id v10 = v4;
    objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v9);
  }

  return v4;
}

+ (void)setTextAttributes:(id)a3 ofAnnotation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 annotationText];
  id v10 = (id)[v8 mutableCopy];

  objc_msgSend(v10, "addAttributes:range:", v7, 0, objc_msgSend(v10, "length"));
  uint64_t v9 = (void *)[a1 newTextStorageOriginalFontSavvyWithAttributedString:v10];
  [v6 setAnnotationText:v9];
}

+ (void)adjustBoundsOfAnnotation:(id)a3 toFitOptionalText:(id)a4 onPageController:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  int v10 = [v7 conformsToAKRectangularAnnotationProtocol];
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned __int8 v14 = 0;
  if (v10) {
    id v11 = &v15;
  }
  else {
    id v11 = 0;
  }
  LOBYTE(v13) = 0;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", v11, 0, 0, 0, &v14, v7, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v8, 0, v13, v9);

  if (v10) {
    objc_msgSend(v7, "setRectangle:", v15, v16);
  }
  int v12 = [v7 textIsClipped];
  if (v14 != v12) {
    [v7 setTextIsClipped:v14 != 0];
  }
}

+ (void)adjustAnnotationBoundsToFitText:(id)a3
{
  id v3 = a3;
  id v4 = +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:v3];
  if (![v4 length]) {
    goto LABEL_20;
  }
  uint64_t v5 = [v3 textIsFixedWidth];
  uint64_t v6 = [v3 textIsFixedHeight];
  [v3 setTextIsFixedWidth:1];
  [v3 setTextIsFixedHeight:1];
  [v3 rectangle];
  CGFloat x = v7;
  CGFloat y = v9;
  CGFloat v12 = v11;
  CGFloat v63 = v13;
  BOOL v14 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", [v3 originalExifOrientation]);
  double v64 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v65 = *MEMORY[0x263F001A8];
  double rect_8 = *(double *)(MEMORY[0x263F001A8] + 24);
  double rect_16 = *(double *)(MEMORY[0x263F001A8] + 16);
  +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v3, v4);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  +[AKTextAnnotationRenderHelper unconstrainedSizeForText:v4];
  double v24 = v23;
  CGFloat v61 = y;
  CGFloat v62 = x;
  CGFloat rect_24 = v12;
  uint64_t v25 = v16;
  uint64_t v26 = v18;
  uint64_t v27 = v20;
  uint64_t v28 = v22;
  if (!v14)
  {
    double Height = CGRectGetHeight(*(CGRect *)&v25);
    double v38 = v24;
    BOOL v31 = v24 <= Height;
    CGFloat v32 = v63;
    uint64_t v33 = v20;
    double v34 = rect_8;
    if (v31) {
      goto LABEL_9;
    }
    double v36 = (v38 - Height) * -0.5;
    double v35 = 0.0;
LABEL_7:
    uint64_t v39 = v16;
    uint64_t v40 = v18;
    uint64_t v41 = v22;
    CGRect v69 = CGRectInset(*(CGRect *)(&v33 - 2), v35, v36);
    +[AKAnnotationRenderer rectangleForAnnotation:withTextBounds:](AKAnnotationRenderer, "rectangleForAnnotation:withTextBounds:", v3, v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
    CGFloat x = v42;
    CGFloat y = v43;
    CGFloat v12 = v44;
    CGFloat v32 = v45;
    objc_msgSend(v3, "setRectangle:");
    if (v14) {
      goto LABEL_8;
    }
LABEL_9:
    v71.origin.CGFloat y = v61;
    v71.origin.CGFloat x = v62;
    v71.size.width = rect_24;
    v71.size.height = v63;
    double Width = CGRectGetWidth(v71);
    goto LABEL_10;
  }
  double v29 = CGRectGetWidth(*(CGRect *)&v25);
  double v30 = v24;
  BOOL v31 = v24 <= v29;
  CGFloat v32 = v63;
  uint64_t v33 = v20;
  double v34 = rect_8;
  if (!v31)
  {
    double v35 = (v30 - v29) * -0.5;
    double v36 = 0.0;
    goto LABEL_7;
  }
LABEL_8:
  v70.origin.CGFloat y = v61;
  v70.origin.CGFloat x = v62;
  v70.size.width = rect_24;
  v70.size.height = v63;
  double Width = CGRectGetHeight(v70);
LABEL_10:
  unint64_t v47 = vcvtad_u64_f64(Width * 3.0);
  if (v47)
  {
    double v48 = *MEMORY[0x263F00148];
    double v49 = *(double *)(MEMORY[0x263F00148] + 8);
    while (1)
    {
      long long v67 = 0u;
      long long v68 = 0u;
      char v66 = 0;
      LOBYTE(v57) = 0;
      +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", &v67, 0, 0, 0, &v66, v3, v48, v49, v65, v64, rect_16, v34, 0, 0, v57, v4);
      if (!v66) {
        break;
      }
      if (v14)
      {
        CGFloat v50 = 0.0;
        CGFloat v51 = -0.5;
      }
      else
      {
        CGFloat v50 = -0.5;
        CGFloat v51 = 0.0;
      }
      v72.origin.CGFloat x = x;
      v72.origin.CGFloat y = y;
      v72.size.width = v12;
      v72.size.height = v32;
      CGRect v73 = CGRectInset(v72, v50, v51);
      CGFloat x = v73.origin.x;
      CGFloat y = v73.origin.y;
      CGFloat v12 = v73.size.width;
      CGFloat v32 = v73.size.height;
      objc_msgSend(v3, "setRectangle:");
      if (!--v47) {
        goto LABEL_17;
      }
    }
    double v54 = *((double *)&v67 + 1);
    double v53 = *(double *)&v67;
    double v56 = *((double *)&v68 + 1);
    double v55 = *(double *)&v68;
    v52 = v3;
  }
  else
  {
LABEL_17:
    v52 = v3;
    double v54 = v61;
    double v53 = v62;
    double v55 = rect_24;
    double v56 = v63;
  }
  objc_msgSend(v52, "setRectangle:", v53, v54, v55, v56);
  [v3 setTextIsFixedWidth:v5];
  [v3 setTextIsFixedHeight:v6];
LABEL_20:
}

+ (id)placeholderTextOfAnnotation:(id)a3
{
  id v3 = a3;
  if ([v3 shouldUsePlaceholderText]
    && (([v3 customPlaceholderText], (id v4 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([(id)objc_opt_class() defaultPlaceholderText],
         (id v4 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    uint64_t v5 = [v3 typingAttributes];
    id v6 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:v4 attributes:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)actualOrPlaceholderTextOfAnnotation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 annotationText];
  uint64_t v6 = [v5 length];

  if (v6) {
    [v4 annotationText];
  }
  else {
  double v7 = [a1 placeholderTextOfAnnotation:v4];
  }

  return v7;
}

+ (id)font:(id)a3 byApplyingScaleFactor:(double)a4
{
  id v5 = a3;
  [v5 pointSize];
  double v7 = [v5 fontWithSize:v6 * a4];

  return v7;
}

+ (id)typingAttributes:(id)a3 byApplyingScaleFactor:(double)a4
{
  v32[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = v5;
  if (fabs(a4 + -1.0) >= 0.0005)
  {
    id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F1C260]];
    uint64_t v9 = *MEMORY[0x263F1C238];
    if (!v8)
    {
      id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
    }
    [v8 pointSize];
    uint64_t v26 = v8;
    uint64_t v11 = [v8 fontWithSize:v10 * a4];
    id v7 = (id)[v6 mutableCopy];
    uint64_t v25 = (void *)v11;
    [v7 setObject:v11 forKeyedSubscript:v9];
    uint64_t v12 = *MEMORY[0x263F1C2C8];
    v32[0] = *MEMORY[0x263F1C248];
    v32[1] = v12;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v19 = [v6 objectForKeyedSubscript:v18];
          uint64_t v20 = v19;
          if (v19)
          {
            uint64_t v21 = NSNumber;
            [v19 doubleValue];
            double v23 = [v21 numberWithDouble:v22 * a4];
            [v7 setObject:v23 forKeyedSubscript:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v15);
    }
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

+ (id)newTextStorage:(id)a3 byApplyingScaleFactor:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)[v6 mutableCopy];
    if ([v7 length] && fabs(a4 + -1.0) >= 0.0005)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = sub_23762F3A8;
      v11[3] = &unk_264CDAFA8;
      id v13 = a1;
      double v14 = a4;
      id v12 = v8;
      [a1 enumerateFontAttributesOfAttributedString:v7 usingBlock:v11];
    }
    uint64_t v9 = (void *)[a1 newTextStorageOriginalFontSavvyWithAttributedString:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)newTextStorageOriginalFontSavvyWithAttributedString:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (objc_class *)MEMORY[0x263F1C380];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(AKTextLayoutManager);
  [v5 addLayoutManager:v6];
  [v5 setAttributedString:v4];

  [v5 removeLayoutManager:v6];
  return v5;
}

+ (id)newTextStorageOriginalFontSavvyWithString:(id)a3 attributes:(id)a4
{
  id v6 = (__CFString *)a3;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &stru_26EA57918;
  }
  id v8 = (objc_class *)MEMORY[0x263F086A0];
  id v9 = a4;
  double v10 = (void *)[[v8 alloc] initWithString:v7 attributes:v9];

  uint64_t v11 = (void *)[a1 newTextStorageOriginalFontSavvyWithAttributedString:v10];
  return v11;
}

+ (void)enumerateFontAttributesOfAttributedString:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 length];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_23762F61C;
  v9[3] = &unk_264CDAFD0;
  id v10 = v5;
  id v8 = v5;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0x100000, v9);
}

@end