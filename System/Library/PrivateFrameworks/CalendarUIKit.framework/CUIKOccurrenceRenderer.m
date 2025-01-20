@interface CUIKOccurrenceRenderer
+ (id)reminderBackgroundColor:(BOOL)a3 style:(int64_t)a4 miniPreview:(BOOL)a5 completed:(BOOL)a6;
+ (id)reminderStrokeColor:(BOOL)a3 stack:(BOOL)a4 style:(int64_t)a5;
+ (id)renderColorBlockImageWithThickness:(double)a3 backgroundColor:(CGColor *)a4 stripeColor:(CGColor *)a5 stripedImageAlpha:(double)a6;
+ (id)renderReminderBackgroundSelected:(BOOL)a3 stackDepth:(int)a4 userInterfaceStyle:(int64_t)a5 miniPreview:(BOOL)a6 completed:(BOOL)a7;
+ (id)renderStrings:(id)a3 withSize:(CGSize)a4 font:(id)a5 edgeInsets:(UIEdgeInsets)a6 leadingIcon:(id)a7 trailingIcons:(id)a8 shouldAutoHideLeadingIcon:(BOOL)a9;
+ (id)renderingBlockForStrings:(id)a3 withSize:(CGSize)a4 font:(id)a5 edgeInsets:(UIEdgeInsets)a6 leadingIcon:(id)a7 trailingIcons:(id)a8 outImageSize:(CGSize *)a9 shouldAutoHideLeadingIcon:(BOOL)a10;
+ (void)drawReminderInContext:(CGContext *)a3 rect:(CGRect)a4 fillColor:(id)a5 strokeColor:(id)a6 coveringReminderRect:(CGRect)a7 allDay:(BOOL)a8;
+ (void)renderReminderInPreparedContext:(CGContext *)a3 bounds:(CGRect)a4 selected:(BOOL)a5 stackDepth:(int)a6 userInterfaceStyle:(int64_t)a7 miniPreview:(BOOL)a8 allDay:(BOOL)a9 completed:(BOOL)a10;
@end

@implementation CUIKOccurrenceRenderer

uint64_t __117__CUIKOccurrenceRenderer_renderStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_shouldAutoHideLeadingIcon___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)renderColorBlockImageWithThickness:(double)a3 backgroundColor:(CGColor *)a4 stripeColor:(CGColor *)a5 stripedImageAlpha:(double)a6
{
  v10 = +[CUIKInterface shared];
  int v11 = [v10 interfaceIsLeftToRight];

  +[CUIKORImageUtils occurrencePadding];
  double v13 = v12;
  if (a5)
  {
    double v14 = v12 + a3 + 9.0 + 1.0;
    CUIKRoundToScreenScale(0.5);
    double v16 = (v15 + a3 * 2.0) * 3.0 * 18.0;
  }
  else
  {
    CUIKRoundToScreenScale(0.5);
    double v16 = v17 + a3 * 2.0;
    double v14 = v13 + a3 + 2.0;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __107__CUIKOccurrenceRenderer_renderColorBlockImageWithThickness_backgroundColor_stripeColor_stripedImageAlpha___block_invoke;
  v23[3] = &__block_descriptor_88_e20_v16__0__CGContext__8l;
  BOOL v18 = a5 == 0;
  v23[4] = a5;
  v23[5] = a4;
  *(double *)&v23[6] = a6;
  v23[7] = 0;
  v23[8] = 0;
  *(double *)&v23[9] = v14;
  *(double *)&v23[10] = v16;
  v19 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_drawImageWithSize:drawBlock:", v23, v14);
  if (v11) {
    double v20 = a3 + 1.0 + v13;
  }
  else {
    double v20 = 0.0;
  }
  v21 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_resizableImageFromOriginalImage:withCapInsets:resizingMode:", v19, v18, 0.0, v20);

  return v21;
}

+ (id)renderStrings:(id)a3 withSize:(CGSize)a4 font:(id)a5 edgeInsets:(UIEdgeInsets)a6 leadingIcon:(id)a7 trailingIcons:(id)a8 shouldAutoHideLeadingIcon:(BOOL)a9
{
  double v18 = 0.0;
  double v19 = 0.0;
  v9 = objc_msgSend(a1, "renderingBlockForStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:outImageSize:shouldAutoHideLeadingIcon:", a3, a5, a7, a8, &v18, a9, a4.width, a4.height, a6.top, a6.left, a6.bottom, a6.right);
  v10 = (void *)MEMORY[0x1E4FB1818];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__CUIKOccurrenceRenderer_renderStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_shouldAutoHideLeadingIcon___block_invoke;
  v16[3] = &unk_1E636A910;
  id v17 = v9;
  double v11 = v18;
  double v12 = v19;
  id v13 = v9;
  double v14 = objc_msgSend(v10, "cuik_drawImageWithSize:drawBlock:", v16, v11, v12);

  return v14;
}

+ (id)renderingBlockForStrings:(id)a3 withSize:(CGSize)a4 font:(id)a5 edgeInsets:(UIEdgeInsets)a6 leadingIcon:(id)a7 trailingIcons:(id)a8 outImageSize:(CGSize *)a9 shouldAutoHideLeadingIcon:(BOOL)a10
{
  BOOL v10 = a10;
  double bottom = a6.bottom;
  double top = a6.top;
  double height = a4.height;
  double width = a4.width;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a5;
  id v21 = a7;
  id v22 = a8;
  v23 = +[CUIKInterface shared];
  uint64_t v24 = [v23 layoutDirectionOrOverride];

  double v25 = 0.0;
  double v26 = 0.0;
  if (v21)
  {
    [v21 size];
    double v26 = v27;
  }
  if ([v22 count])
  {
    BOOL v61 = v10;
    uint64_t v62 = v24;
    id v28 = v20;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v77 = 0u;
    long long v76 = 0u;
    id v29 = v22;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v76 objects:v80 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v77 != v32) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v76 + 1) + 8 * i) size];
          double v35 = v25 + v34;
          +[CUIKORImageUtils occurrencePadding];
          double v25 = v35 + v36;
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v76 objects:v80 count:16];
      }
      while (v31);
    }

    id v20 = v28;
    uint64_t v24 = v62;
    BOOL v10 = v61;
  }
  double v37 = width - (v26 + v25);
  if (v10)
  {
    +[CUIKORImageUtils hideIconBreakpoint];
    if (v37 < v38) {
      double v26 = 0.0;
    }
  }
  double v63 = v26;
  +[CUIKORImageUtils hideIconBreakpoint];
  if (v37 >= v39) {
    double v40 = v25;
  }
  else {
    double v40 = 0.0;
  }
  v41 = [v19 combinedString];
  objc_msgSend(v41, "boundingRectWithSize:options:context:", 33, 0, width - v40, height);
  CGFloat v43 = v42;
  double v45 = v44;
  CGFloat v47 = v46;
  double v49 = v48;

  double v50 = bottom + v49;
  v83.origin.x = v43;
  v83.origin.y = v45;
  v83.size.double width = v47;
  v83.size.double height = v50;
  double v51 = width - CGRectGetMinX(v83);
  double v52 = top + v45;
  v84.origin.x = v43;
  v84.origin.y = v52;
  v84.size.double width = v51;
  v84.size.double height = v50;
  CGFloat MaxX = CGRectGetMaxX(v84);
  v85.origin.x = v43;
  v85.origin.y = v52;
  v85.size.double width = v51;
  v85.size.double height = v50;
  double MaxY = CGRectGetMaxY(v85);
  if (a9)
  {
    a9->double width = MaxX;
    a9->double height = MaxY;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__CUIKOccurrenceRenderer_renderingBlockForStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_outImageSize_shouldAutoHideLeadingIcon___block_invoke;
  aBlock[3] = &unk_1E636A960;
  CGFloat v69 = v43;
  double v70 = v52;
  double v71 = v51;
  double v72 = v50;
  id v65 = v22;
  id v66 = v20;
  BOOL v75 = v24 == 1;
  double v73 = v40;
  double v74 = v63;
  id v67 = v21;
  id v68 = v19;
  id v55 = v19;
  id v56 = v21;
  id v57 = v20;
  id v58 = v22;
  v59 = _Block_copy(aBlock);

  return v59;
}

void __141__CUIKOccurrenceRenderer_renderingBlockForStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_outImageSize_shouldAutoHideLeadingIcon___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_msgSend(v8, "boundingRectWithSize:options:context:", 33, 0, *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  double Height = CGRectGetHeight(v10);
  if (Height > CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32))) {
    goto LABEL_5;
  }
  objc_msgSend(v8, "drawWithRect:options:context:", 33, 0, *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56)
                                                              - Height;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = Height
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40);
  if ([*(id *)(a1 + 32) count] - 1 != a3)
  {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 56)
                                                                + -1.0;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + 1.0;
  }
  if (CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)) <= 0.0) {
LABEL_5:
  }
    *a4 = 1;
}

void __141__CUIKOccurrenceRenderer_renderingBlockForStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_outImageSize_shouldAutoHideLeadingIcon___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v55 = 0;
  id v56 = (CGRect *)&v55;
  uint64_t v57 = 0x4010000000;
  id v58 = &unk_1BE0B4516;
  long long v2 = *(_OWORD *)(a1 + 80);
  long long v59 = *(_OWORD *)(a1 + 64);
  long long v60 = v2;
  if ([*(id *)(a1 + 32) count] && *(double *)(a1 + 96) > 0.0)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v3 = [*(id *)(a1 + 32) reverseObjectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v52 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          [v7 size];
          double v9 = v8;
          double v11 = v10;
          double MaxX = CGRectGetMaxX(v56[1]);
          double y = v56[1].origin.y;
          double v15 = [(UIFont *)*(void **)(a1 + 40) cuik_lineHeight];
          double v16 = CUIKCeilToScreenScale(y + (v15 - v11) * 0.5);
          +[CUIKORImageUtils occurrencePadding];
          p_x = (void *)&v56->origin.x;
          double v20 = v56[1].size.width - (v9 + v18);
          v56[1].size.double width = v20;
          if (*(unsigned char *)(a1 + 112))
          {
            uint64_t v21 = p_x[4];
            uint64_t v22 = p_x[5];
            uint64_t v23 = p_x[7];
            double MinX = CGRectGetMinX(*(CGRect *)(&v20 - 2));
            +[CUIKORImageUtils occurrencePadding];
            v56[1].origin.x = v9 + v25 + v56[1].origin.x;
          }
          else
          {
            double MinX = MaxX - v9;
          }
          -[UIImage cuik_drawAtPoint:](v7, v17, MinX, v16);
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v4);
    }
  }
  if (*(double *)(a1 + 104) > 0.0)
  {
    [*(id *)(a1 + 48) size];
    double v27 = v26;
    double v29 = v28;
    double v30 = *(double *)(a1 + 64);
    double v31 = *(double *)(a1 + 72);
    double v33 = [(UIFont *)*(void **)(a1 + 40) cuik_lineHeight];
    double v35 = CUIKCeilToScreenScale(v31 + (v33 - v29) * 0.5);
    if (*(unsigned char *)(a1 + 112))
    {
      double v36 = CGRectGetMaxX(v56[1]) - v27 + 1.0;
      double v37 = v27 + 3.0 + -1.0;
      double v38 = v56;
    }
    else
    {
      double v36 = v30 + -1.0;
      double v37 = v27 + 3.0 + -1.0;
      double v38 = v56;
      v56[1].origin.x = v37 + v56[1].origin.x;
    }
    v38[1].size.double width = v38[1].size.width - v37;
    -[UIImage cuik_drawAtPoint:](*(void **)(a1 + 48), v34, v36, v35);
  }
  double v39 = [*(id *)(a1 + 56) trailingString];

  if (v39)
  {
    id v40 = objc_alloc_init(MEMORY[0x1E4FB0860]);
    v41 = [*(id *)(a1 + 56) trailingString];
    objc_msgSend(v41, "drawWithRect:options:context:", 33, v40, v56[1].origin.x, v56[1].origin.y, v56[1].size.width, v56[1].size.height);

    [v40 totalBounds];
    double v42 = CGRectGetWidth(v63) + 2.0;
    CGFloat v43 = v56;
    v56[1].size.double width = v56[1].size.width - v42;
    if (*(unsigned char *)(a1 + 112)) {
      v43[1].origin.x = v42 + v43[1].origin.x;
    }
  }
  double v44 = [*(id *)(a1 + 56) trailingString];
  if (!v44 || (BOOL v45 = CGRectGetWidth(v56[1]) < 10.0, v44, !v45))
  {
    double v46 = [*(id *)(a1 + 56) nonNilComponents];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __141__CUIKOccurrenceRenderer_renderingBlockForStrings_withSize_font_edgeInsets_leadingIcon_trailingIcons_outImageSize_shouldAutoHideLeadingIcon___block_invoke_2;
    v48[3] = &unk_1E636A938;
    double v50 = &v55;
    id v47 = v46;
    id v49 = v47;
    [v47 enumerateObjectsUsingBlock:v48];
  }
  _Block_object_dispose(&v55, 8);
}

void __107__CUIKOccurrenceRenderer_renderColorBlockImageWithThickness_backgroundColor_stripeColor_stripedImageAlpha___block_invoke(uint64_t a1, CGContext *a2)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_stripedImageWithBackgroundColor:stripeColor:scale:", *(void *)(a1 + 40), *(void *)(a1 + 32), CUIKScaleFactor());
    uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithPatternImage:v4];
    id v6 = [v5 colorWithAlphaComponent:*(double *)(a1 + 48)];
    v7 = (CGColor *)[v6 CGColor];
  }
  else
  {
    v7 = *(CGColor **)(a1 + 40);
  }
  CGContextSetFillColorWithColor(a2, v7);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);

  CGContextFillRect(a2, *(CGRect *)&v8);
}

+ (id)renderReminderBackgroundSelected:(BOOL)a3 stackDepth:(int)a4 userInterfaceStyle:(int64_t)a5 miniPreview:(BOOL)a6 completed:(BOOL)a7
{
  double v7 = (double)(a4 - 1);
  v12[1] = 3221225472;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[2] = __111__CUIKOccurrenceRenderer_renderReminderBackgroundSelected_stackDepth_userInterfaceStyle_miniPreview_completed___block_invoke;
  v12[3] = &__block_descriptor_87_e20_v16__0__CGContext__8l;
  v12[5] = 0;
  v12[6] = 0;
  v12[4] = a1;
  v12[7] = ceil((v7 * 0.75 + 2.0) * 4.0 + 3.0);
  v12[8] = ceil((v7 * 0.5 + 2.0) * 4.0 + 3.0);
  BOOL v14 = a3;
  int v13 = a4;
  v12[9] = a5;
  BOOL v15 = a6;
  BOOL v16 = a7;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_drawImageWithSize:drawBlock:", v12);
  double v9 = ceil((v7 * 0.375 + 1.0) * 4.0);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_resizableImageFromOriginalImage:withCapInsets:resizingMode:", v8, 1, 4.0, v9, ceil((v7 * 0.5 + 1.0) * 4.0), v9);

  return v10;
}

uint64_t __111__CUIKOccurrenceRenderer_renderReminderBackgroundSelected_stackDepth_userInterfaceStyle_miniPreview_completed___block_invoke(uint64_t a1, uint64_t a2)
{
  LOBYTE(v3) = *(unsigned char *)(a1 + 86);
  return objc_msgSend(*(id *)(a1 + 32), "renderReminderInPreparedContext:bounds:selected:stackDepth:userInterfaceStyle:miniPreview:allDay:completed:", a2, *(unsigned __int8 *)(a1 + 84), *(unsigned int *)(a1 + 80), *(void *)(a1 + 72), *(unsigned __int8 *)(a1 + 85), 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v3);
}

+ (void)renderReminderInPreparedContext:(CGContext *)a3 bounds:(CGRect)a4 selected:(BOOL)a5 stackDepth:(int)a6 userInterfaceStyle:(int64_t)a7 miniPreview:(BOOL)a8 allDay:(BOOL)a9 completed:(BOOL)a10
{
  BOOL v10 = a9;
  BOOL v13 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v27 = [a1 reminderBackgroundColor:a5 style:a7 miniPreview:a8 completed:a10];
  int v20 = a6 - 1;
  double v21 = height + (double)(a6 - 1) * -2.0;
  uint64_t v22 = [a1 reminderStrokeColor:v13 stack:a6 > 1 style:a7];
  objc_msgSend(a1, "drawReminderInContext:rect:fillColor:strokeColor:coveringReminderRect:allDay:", a3, v27, v22, v10, x, y, width, v21, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  if (a6 >= 2)
  {
    do
    {
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.double width = width;
      v29.size.double height = v21;
      CGRect v30 = CGRectInset(v29, 1.5, 0.0);
      CGFloat v23 = v30.origin.x;
      CGFloat v24 = v30.size.width;
      CGFloat v25 = v30.size.height;
      CGFloat v26 = v30.origin.y + 2.0;
      [a1 drawReminderInContext:a3 rect:v27 fillColor:v22 strokeColor:v10 coveringReminderRect:v30.origin.x allDay:v30.origin.y + 2.0];
      double v21 = v25;
      double width = v24;
      double y = v26;
      double x = v23;
      --v20;
    }
    while (v20);
  }
}

+ (void)drawReminderInContext:(CGContext *)a3 rect:(CGRect)a4 fillColor:(id)a5 strokeColor:(id)a6 coveringReminderRect:(CGRect)a7 allDay:(BOOL)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  double v14 = a4.size.height;
  CGFloat v15 = a4.size.width;
  double v16 = a4.origin.y;
  CGFloat v17 = a4.origin.x;
  id v19 = a5;
  id v20 = a6;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  BOOL IsNull = CGRectIsNull(v36);
  v37.origin.CGFloat x = v17;
  v37.origin.CGFloat y = v16;
  v37.size.CGFloat width = v15;
  v37.size.CGFloat height = v14;
  uint64_t v22 = CGPathCreateWithRoundedRect(v37, 4.0, 4.0, 0);
  CGFloat v23 = 0;
  if (!IsNull)
  {
    CGContextBeginPath(a3);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGRect v39 = CGRectInset(v38, 0.5, 0.5);
    CGFloat v24 = v39.origin.x;
    CGFloat v25 = v39.origin.y;
    CGFloat v26 = v39.size.width;
    CGFloat v27 = v39.size.height;
    CGFloat v23 = CGPathCreateWithRoundedRect(v39, 3.75, 3.75, 0);
    CGContextAddPath(a3, v23);
    CGContextAddPath(a3, v22);
    CGContextClosePath(a3);
    CGContextEOClip(a3);
    CGContextBeginPath(a3);
    v40.origin.CGFloat x = v24;
    v40.origin.CGFloat y = v25;
    v40.size.CGFloat width = v26;
    v40.size.CGFloat height = v27;
    v41.origin.CGFloat y = CGRectGetMaxY(v40) + -0.9;
    v41.size.CGFloat height = v14 - (v41.origin.y - v16);
    v41.origin.CGFloat x = v17;
    v41.size.CGFloat width = v15;
    CGContextAddRect(a3, v41);
    CGContextClosePath(a3);
    CGContextClip(a3);
  }
  id v32 = v19;
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v32 CGColor]);
  CGContextBeginPath(a3);
  CGContextAddPath(a3, v22);
  CGContextClosePath(a3);
  CGContextFillPath(a3);
  CGPathRelease(v22);
  if (v20 && !a8)
  {
    v42.origin.CGFloat x = v17;
    v42.origin.CGFloat y = v16;
    v42.size.CGFloat width = v15;
    v42.size.CGFloat height = v14;
    CGRect v43 = CGRectInset(v42, 0.5, 0.5);
    double v28 = CGPathCreateWithRoundedRect(v43, v14 + -0.25, v14 + -0.25, 0);
    CGContextBeginPath(a3);
    CGContextAddPath(a3, v28);
    CGContextClosePath(a3);
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v20 CGColor]);
    CGContextSetLineWidth(a3, 0.5);
    CGContextStrokePath(a3);
    CGPathRelease(v28);
  }
  if (!IsNull)
  {
    CGFloat v29 = v14 * 0.5;
    CGFloat v30 = *MEMORY[0x1E4F1DB30];
    CGFloat v31 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v34.CGFloat width = *(CGFloat *)MEMORY[0x1E4F1DB30];
    v34.CGFloat height = v31;
    CGContextSetShadow(a3, v34, v29);
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v32 CGColor]);
    CGContextBeginPath(a3);
    CGContextAddPath(a3, v23);
    CGContextClosePath(a3);
    CGContextFillPath(a3);
    v35.CGFloat width = v30;
    v35.CGFloat height = v31;
    CGContextSetShadowWithColor(a3, v35, 0.0, 0);
    CGContextResetClip(a3);
  }
  if (v23) {
    CGPathRelease(v23);
  }
}

+ (id)reminderBackgroundColor:(BOOL)a3 style:(int64_t)a4 miniPreview:(BOOL)a5 completed:(BOOL)a6
{
  if (a3)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "systemGray2Color", a3, a4, a5, a6);
LABEL_5:
    double v7 = (void *)v6;
    goto LABEL_9;
  }
  if (a5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_systemBackgroundColor");
    goto LABEL_5;
  }
  BOOL v8 = a6;
  BOOL v10 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v11 = CUIKAdjustedColorForColor(v10, a4);
  double v12 = CUIKBackgroundColorForCalendarColorWithOpaqueForStyle(v11, 0, a4, 0);
  double v7 = v12;
  if (v8)
  {
    uint64_t v13 = objc_msgSend(v12, "cuik_colorWithAlphaScaled:", 0.35);

    double v7 = (void *)v13;
  }

LABEL_9:

  return v7;
}

+ (id)reminderStrokeColor:(BOOL)a3 stack:(BOOL)a4 style:(int64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  BOOL v8 = [MEMORY[0x1E4F57780] getDebugColorStringForPreference:*MEMORY[0x1E4F575A0] dark:a5 == 2];
  if (v8)
  {
    uint64_t v9 = CUIKColorFromString();
  }
  else if (v7)
  {
    if (!v6)
    {
      double v12 = 0;
      goto LABEL_12;
    }
    if (a5 == 2)
    {
      double v10 = 0.407843137;
      double v11 = 0.423529412;
    }
    else
    {
      double v10 = 0.596078431;
      double v11 = 0.611764706;
    }
    uint64_t v9 = [MEMORY[0x1E4FB1618] colorWithRed:v10 green:v10 blue:v11 alpha:1.0];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4FB1618] systemFillColor];
  }
  double v12 = (void *)v9;
LABEL_12:

  return v12;
}

@end