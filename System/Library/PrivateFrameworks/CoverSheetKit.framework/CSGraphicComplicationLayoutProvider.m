@interface CSGraphicComplicationLayoutProvider
+ (BOOL)canAddElement:(id)a3 toElements:(id)a4;
+ (BOOL)canAddElement:(id)a3 toElements:(id)a4 layoutStyle:(int64_t)a5;
+ (double)complicationContainerHeight;
+ (double)complicationEdgeInset;
+ (double)containerEdgeInset;
+ (double)gridUnitSize;
+ (double)interComplicationSpacing;
+ (double)interComplicationSpacingExcludingInnerInset;
+ (id)_framesForLayoutElements:(id)a3 layoutStyle:(int64_t)a4 containerSize:(CGSize)a5;
+ (id)_rowFramesForLayoutElements:(id)a3 containerSize:(CGSize)a4;
+ (id)_sidebarFramesForLayoutElements:(id)a3 containerSize:(CGSize)a4;
+ (id)complicationLayoutForElements:(id)a3 containerSize:(CGSize)a4;
+ (id)complicationLayoutForElements:(id)a3 containerSize:(CGSize)a4 draggedElement:(id)a5 draggedElementPosition:(CGPoint)a6;
+ (id)complicationLayoutForElements:(id)a3 layoutStyle:(int64_t)a4 containerSize:(CGSize)a5;
+ (id)complicationLayoutForElements:(id)a3 layoutStyle:(int64_t)a4 containerSize:(CGSize)a5 draggedElement:(id)a6 draggedElementPosition:(CGPoint)a7;
+ (int64_t)_insertionIndexForElement:(id)a3 withExistingElements:(id)a4 proposedInsertionIndex:(int64_t)a5;
+ (int64_t)insertionIndexForElement:(id)a3 withExistingElements:(id)a4;
+ (int64_t)sidebarGridHeight;
@end

@implementation CSGraphicComplicationLayoutProvider

+ (int64_t)sidebarGridHeight
{
  unint64_t v2 = +[CSDeviceDetermination baseCategory];
  if (v2 - 24 > 7) {
    return 8;
  }
  else {
    return qword_1ADA41F48[v2 - 24];
  }
}

+ (double)gridUnitSize
{
  v3 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v4 = [v3 deviceClass];

  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v6 = [v5 fixedCoordinateSpace];
  [v6 bounds];
  double v11 = v10;
  if (v4 == 2)
  {
    CGFloat v12 = v7;
    CGFloat v13 = v8;
    CGFloat v14 = v9;

    CGAffineTransformMakeRotation(&v28, 1.57079633);
    v29.origin.x = v12;
    v29.origin.y = v13;
    v29.size.width = v11;
    v29.size.double height = v14;
    CGRect v30 = CGRectApplyAffineTransform(v29, &v28);
    double height = v30.size.height;
    +[CSProminentLayoutController landscapePadSubtitleElementBoundingTopY];
    double v17 = height + v16 * -2.0;
    double v18 = (double)([a1 sidebarGridHeight] - 1);
    [a1 interComplicationSpacing];
    double v20 = v19 * v18;
    [a1 complicationEdgeInset];
    return (v17 - v20 - (v21 + v21)) / (double)[a1 sidebarGridHeight];
  }
  else
  {

    [a1 containerEdgeInset];
    double v24 = v23;
    [a1 complicationEdgeInset];
    double v26 = v24 + v25;
    [a1 interComplicationSpacing];
    return (v11 - (v27 * 3.0 + v26 * 2.0)) * 0.25;
  }
}

+ (double)complicationContainerHeight
{
  [a1 gridUnitSize];
  double v4 = v3;
  [a1 complicationEdgeInset];
  return v4 + v5 * 2.0;
}

+ (double)interComplicationSpacing
{
  [a1 interComplicationSpacingExcludingInnerInset];
  double v4 = v3;
  [a1 complicationEdgeInset];
  return v4 + v5 * 2.0;
}

+ (double)interComplicationSpacingExcludingInnerInset
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  double result = 10.0;
  if (v2 - 1 <= 0x1F) {
    return dbl_1ADA41F88[v2 - 1];
  }
  return result;
}

+ (double)containerEdgeInset
{
  +[CSProminentLayoutController leadingPortraitLayoutInset];
  return result;
}

+ (double)complicationEdgeInset
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  double result = 7.0;
  if (v2 <= 0x20) {
    return dbl_1ADA42088[v2];
  }
  return result;
}

+ (id)complicationLayoutForElements:(id)a3 containerSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "complicationLayoutForElements:layoutStyle:containerSize:", a3, 0, a4.width, a4.height);
}

+ (id)complicationLayoutForElements:(id)a3 layoutStyle:(int64_t)a4 containerSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  double v10 = [CSComplicationLayout alloc];
  double v11 = objc_msgSend(a1, "_framesForLayoutElements:layoutStyle:containerSize:", v9, a4, width, height);

  id v12 = [(CSComplicationLayout *)v10 _initWithFramesByElement:v11 draggedItemInsertionIndex:0x7FFFFFFFFFFFFFFFLL];

  return v12;
}

+ (id)complicationLayoutForElements:(id)a3 containerSize:(CGSize)a4 draggedElement:(id)a5 draggedElementPosition:(CGPoint)a6
{
  return (id)objc_msgSend(a1, "complicationLayoutForElements:layoutStyle:containerSize:draggedElement:draggedElementPosition:", a3, 0, a5, a4.width, a4.height, a6.x, a6.y);
}

+ (id)complicationLayoutForElements:(id)a3 layoutStyle:(int64_t)a4 containerSize:(CGSize)a5 draggedElement:(id)a6 draggedElementPosition:(CGPoint)a7
{
  CGFloat y = a7.y;
  double x = a7.x;
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  id v15 = a6;
  if (v15 && ([a1 canAddElement:v15 toElements:v14 layoutStyle:a4] & 1) != 0)
  {
    double v16 = objc_msgSend(a1, "_framesForLayoutElements:layoutStyle:containerSize:", v14, a4, width, height);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __133__CSGraphicComplicationLayoutProvider_complicationLayoutForElements_layoutStyle_containerSize_draggedElement_draggedElementPosition___block_invoke;
    v38[3] = &__block_descriptor_48_e29_q24__0__NSValue_8__NSValue_16l;
    *(double *)&v38[4] = x;
    *(CGFloat *)&v38[5] = y;
    double v17 = [v16 keysSortedByValueUsingComparator:v38];
    double v18 = [v17 firstObject];

    if (v18)
    {
      uint64_t v19 = [v14 indexOfObject:v18];
      double v20 = [v16 objectForKeyedSubscript:v18];
      [v20 CGRectValue];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;

      v40.origin.double x = v22;
      v40.origin.CGFloat y = v24;
      v40.size.double width = v26;
      v40.size.double height = v28;
      double MidX = CGRectGetMidX(v40);
      uint64_t v30 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
      if (x >= MidX) {
        BOOL v31 = v30 != 1;
      }
      else {
        BOOL v31 = v30 == 1;
      }
      uint64_t v32 = v19 + v31;
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v14];
      uint64_t v34 = [a1 _insertionIndexForElement:v15 withExistingElements:v14 proposedInsertionIndex:v32];
      [v33 insertObject:v15 atIndex:v34];
      uint64_t v35 = objc_msgSend(a1, "_framesForLayoutElements:layoutStyle:containerSize:", v33, a4, width, height);

      double v16 = (void *)v35;
    }
    else
    {
      uint64_t v34 = 0;
    }
    id v36 = [[CSComplicationLayout alloc] _initWithFramesByElement:v16 draggedItemInsertionIndex:v34];
  }
  else
  {
    objc_msgSend(a1, "complicationLayoutForElements:layoutStyle:containerSize:", v14, a4, width, height);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v36;
}

uint64_t __133__CSGraphicComplicationLayoutProvider_complicationLayoutForElements_layoutStyle_containerSize_draggedElement_draggedElementPosition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 CGRectValue];
  double v6 = vabdd_f64(CGRectGetMidX(v20), *(double *)(a1 + 32));
  [v5 CGRectValue];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v21.origin.double x = v8;
  v21.origin.CGFloat y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  double v15 = vabdd_f64(CGRectGetMidX(v21), *(double *)(a1 + 32));
  double v16 = [NSNumber numberWithDouble:v6];
  double v17 = [NSNumber numberWithDouble:v15];
  uint64_t v18 = [v16 compare:v17];

  return v18;
}

+ (BOOL)canAddElement:(id)a3 toElements:(id)a4
{
  return [a1 canAddElement:a3 toElements:a4 layoutStyle:0];
}

+ (BOOL)canAddElement:(id)a3 toElements:(id)a4 layoutStyle:(int64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  CGFloat v10 = v9;
  if (a5)
  {
    if (a5 == 1) {
      BOOL v5 = (unint64_t)[v9 count] < 0x14;
    }
  }
  else
  {
    double v11 = [v9 arrayByAddingObject:v8];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v11);
          }
          v14 += [*(id *)(*((void *)&v18 + 1) + 8 * v16++) gridWidth];
        }
        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
      BOOL v5 = v14 < 5;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  return v5;
}

+ (int64_t)insertionIndexForElement:(id)a3 withExistingElements:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = objc_msgSend(a1, "_insertionIndexForElement:withExistingElements:proposedInsertionIndex:", v7, v6, objc_msgSend(v6, "count"));

  return v8;
}

+ (int64_t)_insertionIndexForElement:(id)a3 withExistingElements:(id)a4 proposedInsertionIndex:(int64_t)a5
{
  id v7 = a3;
  int64_t v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a4;
  CGFloat v10 = (void *)[[v8 alloc] initWithArray:v9];

  [v10 insertObject:v7 atIndex:a5];
  double v11 = objc_msgSend(v10, "bs_filter:", &__block_literal_global);
  if ([v11 count] == 1)
  {
    uint64_t v12 = [v11 firstObject];
    [v10 removeObject:v12];
    [v10 insertObject:v12 atIndex:0];
    a5 = [v10 indexOfObject:v7];
  }
  return a5;
}

BOOL __109__CSGraphicComplicationLayoutProvider__insertionIndexForElement_withExistingElements_proposedInsertionIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 complicationFamily] == 1;
}

+ (id)_framesForLayoutElements:(id)a3 layoutStyle:(int64_t)a4 containerSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  if (a4 == 1)
  {
    uint64_t v11 = objc_msgSend(a1, "_sidebarFramesForLayoutElements:containerSize:", v10, width, height);
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    uint64_t v11 = objc_msgSend(a1, "_rowFramesForLayoutElements:containerSize:", v10, width, height);
  }
  BOOL v5 = (void *)v11;
LABEL_6:

  return v5;
}

+ (id)_rowFramesForLayoutElements:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [a1 interComplicationSpacingExcludingInnerInset];
  double v9 = v8;
  uint64_t v10 = [v7 count];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v76;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v76 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v75 + 1) + 8 * i) size];
        double v15 = v15 + v17;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
  }

  if ([v11 count] == 1)
  {
    long long v18 = [v11 firstObject];
    BOOL v19 = [v18 complicationFamily] == 1;
  }
  else
  {
    BOOL v19 = 0;
  }
  if ([v11 count] == 2)
  {
    long long v20 = [v11 firstObject];
    if ([v20 complicationFamily] == 1)
    {
      long long v21 = [v11 lastObject];
      BOOL v22 = [v21 complicationFamily] == 0;
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v19 || v22)
  {
    [a1 interComplicationSpacingExcludingInnerInset];
    double v25 = v24 * 3.0;
    [a1 gridUnitSize];
    double v27 = v26;
    [a1 complicationEdgeInset];
    double v29 = fmax((width - (v25 + (v27 + v28 * 2.0) * 4.0)) * 0.5, 0.0);
    uint64_t v30 = [v11 firstObject];
    [v30 size];
    double v32 = v31;

    double v33 = height * 0.5 - v32 * 0.5;
    id v34 = [v11 firstObject];
    [v34 size];
    double v36 = v35;
    double v38 = v37;
    v39 = (id *)MEMORY[0x1E4FB2608];
    uint64_t v40 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
    double v41 = width - v29;
    double v42 = width - v29 - v36;
    if (v40 != 1) {
      double v42 = v29;
    }
    v43 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v42, v33, v36, v38);
    [v23 setObject:v43 forKeyedSubscript:v34];

    if (v22)
    {
      v44 = [v11 lastObject];
      [v44 size];
      double v46 = v45;
      double v48 = v47;
      uint64_t v49 = [*v39 userInterfaceLayoutDirection];
      double v50 = v41 - v46;
      if (v49 == 1) {
        double v50 = v29;
      }
      v51 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v50, v33, v46, v48);
      [v23 setObject:v51 forKeyedSubscript:v44];
    }
  }
  else
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v34 = v11;
    uint64_t v52 = [v34 countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      id v70 = v11;
      double v54 = width * 0.5 - (v9 * (double)(unint64_t)(v10 - 1) + v15) * 0.5;
      uint64_t v55 = *(void *)v72;
      double v56 = height * 0.5;
      v57 = (id *)MEMORY[0x1E4FB2608];
      do
      {
        for (uint64_t j = 0; j != v53; ++j)
        {
          if (*(void *)v72 != v55) {
            objc_enumerationMutation(v34);
          }
          v59 = *(void **)(*((void *)&v71 + 1) + 8 * j);
          [v59 size];
          double v61 = v60;
          double v63 = v62;
          double v64 = v56 + v62 * -0.5;
          uint64_t v65 = [*v57 userInterfaceLayoutDirection];
          double v66 = width - v54 - v61;
          if (v65 != 1) {
            double v66 = v54;
          }
          v67 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v66, v64, v61, v63);
          [v23 setObject:v67 forKeyedSubscript:v59];

          [a1 interComplicationSpacingExcludingInnerInset];
          double v54 = v54 + v61 + v68;
        }
        uint64_t v53 = [v34 countByEnumeratingWithState:&v71 objects:v79 count:16];
      }
      while (v53);
      id v11 = v70;
    }
  }

  return v23;
}

+ (id)_sidebarFramesForLayoutElements:(id)a3 containerSize:(CGSize)a4
{
  CGFloat height = a4.height;
  double width = a4.width;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [a1 complicationEdgeInset];
  double v9 = v8;
  [a1 complicationEdgeInset];
  double v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    double v17 = (id *)MEMORY[0x1E4FB2608];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        BOOL v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_msgSend(v19, "size", (void)v35);
        double v21 = v20;
        double v23 = v22;
        if ([*v17 userInterfaceLayoutDirection] == 1) {
          double v24 = width - v9 - v21;
        }
        else {
          double v24 = v9;
        }
        v42.origin.double x = 0.0;
        v42.origin.CGFloat y = 0.0;
        v42.size.double width = width;
        v42.size.CGFloat height = height;
        v43.origin.double x = v24;
        v43.origin.CGFloat y = v11;
        v43.size.double width = v21;
        v43.size.CGFloat height = v23;
        if (CGRectContainsRect(v42, v43))
        {
          double v25 = (void *)MEMORY[0x1E4F29238];
          double v26 = v24;
        }
        else
        {
          [a1 complicationEdgeInset];
          double v9 = v27;
          [a1 gridUnitSize];
          double v29 = v28;
          [a1 interComplicationSpacing];
          double v11 = v11 + v29 + v30;
          uint64_t v31 = [*v17 userInterfaceLayoutDirection];
          double v26 = width - v9 - v21;
          if (v31 != 1) {
            double v26 = v9;
          }
          double v25 = (void *)MEMORY[0x1E4F29238];
        }
        double v32 = objc_msgSend(v25, "valueWithCGRect:", v26, v11, v21, v23);
        [v12 setObject:v32 forKeyedSubscript:v19];

        [a1 interComplicationSpacing];
        double v9 = v9 + v21 + v33;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v15);
  }

  return v12;
}

@end