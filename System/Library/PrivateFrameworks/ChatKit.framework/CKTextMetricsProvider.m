@interface CKTextMetricsProvider
- (id)_metricsForAttributedString:(id)a3 lineFragmentPadding:(double)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 targetSize:(CGSize)a7;
- (id)_metricsForRequest:(id)a3 containerInset:(UIEdgeInsets)a4;
- (id)_metricsForRequest:(id)a3 containerInset:(UIEdgeInsets)a4 minimumViewHeight:(double)a5;
- (id)metricsForRequest:(id)a3;
@end

@implementation CKTextMetricsProvider

- (id)_metricsForAttributedString:(id)a3 lineFragmentPadding:(double)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 targetSize:(CGSize)a7
{
  double width = a7.width;
  id v11 = a3;
  id v12 = objc_alloc_init(MEMORY[0x1E4FB0880]);
  id v13 = objc_alloc_init(MEMORY[0x1E4FB0890]);
  id v14 = objc_alloc_init(MEMORY[0x1E4FB0888]);
  v15 = objc_alloc_init(CKTextStorage);
  [v14 setTextStorage:v15];

  [v14 addTextLayoutManager:v13];
  [v13 setTextContainer:v12];
  [v12 setLineFragmentPadding:a4];
  [v12 setMaximumNumberOfLines:a5];
  [v12 setLineBreakMode:a6];
  objc_msgSend(v12, "setSize:", width, 1.79769313e308);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke;
  v47[3] = &unk_1E5620AF8;
  id v16 = v14;
  id v48 = v16;
  id v17 = v11;
  id v49 = v17;
  [v16 performEditingTransactionUsingBlock:v47];
  v18 = [v13 documentRange];
  [v13 ensureLayoutForRange:v18];
  [v13 usageBoundsForTextContainer];
  double v20 = v19;
  double v22 = v21;
  uint64_t v43 = 0;
  v44 = (double *)&v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = -1;
  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  v23 = [v18 location];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke_2;
  v37[3] = &unk_1E562C508;
  v37[4] = v42;
  v37[5] = &v38;
  v37[6] = &v43;
  v37[7] = a5;
  id v24 = (id)[v13 enumerateTextLayoutFragmentsFromLocation:v23 options:4 usingBlock:v37];

  double v25 = v44[3];
  double v26 = v39[3];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  v27 = [v13 documentRange];
  v28 = [v27 location];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke_3;
  v32[3] = &unk_1E5621AA8;
  v32[4] = &v33;
  id v29 = (id)[v13 enumerateTextLayoutFragmentsFromLocation:v28 options:4 usingBlock:v32];

  v30 = -[CKTextMetrics initWithSize:singleLine:alignmentInset:]([CKTextMetrics alloc], "initWithSize:singleLine:alignmentInset:", v34[3] == 1, v20 + a4 * 2.0, v22, v25, a4, v26, a4);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v43, 8);

  return v30;
}

void __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) textStorage];
  [v2 setAttributedString:v1];
}

uint64_t __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke_2(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v3 = objc_msgSend(a2, "textLineFragments", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    uint64_t v7 = *MEMORY[0x1E4FB06F8];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
        ++*(void *)(*(void *)(a1[4] + 8) + 24);
        [v9 glyphOrigin];
        double v11 = v10;
        [v9 typographicBounds];
        CGFloat x = v33.origin.x;
        CGFloat y = v33.origin.y;
        CGFloat width = v33.size.width;
        CGFloat height = v33.size.height;
        double v16 = CGRectGetHeight(v33);
        [v9 glyphOrigin];
        *(double *)(*(void *)(a1[5] + 8) + 24) = v16 - v17;
        v18 = [v9 attributedString];
        double v19 = [v18 attribute:v7 atIndex:0 effectiveRange:0];

        if (!*(void *)(*(void *)(a1[4] + 8) + 24))
        {
          v34.origin.CGFloat x = x;
          v34.origin.CGFloat y = y;
          v34.size.CGFloat width = width;
          v34.size.CGFloat height = height;
          CGFloat v20 = CGRectGetHeight(v34) - v11;
          v35.origin.CGFloat x = x;
          v35.origin.CGFloat y = y;
          v35.size.CGFloat width = width;
          v35.size.CGFloat height = height;
          CGFloat v21 = CGRectGetMaxY(v35) - v20;
          [v19 capHeight];
          *(CGFloat *)(*(void *)(a1[6] + 8) + 24) = v21 - v22;
        }
        unint64_t v23 = a1[7];
        if (v23)
        {
          unint64_t v24 = *(void *)(*(void *)(a1[4] + 8) + 24) + 1;

          if (v23 <= v24)
          {
            uint64_t v25 = 0;
            goto LABEL_15;
          }
        }
        else
        {
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }
  uint64_t v25 = 1;
LABEL_15:

  return v25;
}

uint64_t __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 textLineFragments];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];

  return 1;
}

- (id)metricsForRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [v4 minimumViewHeight];
  double v6 = v5;
  [v4 containerInset];
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  if (v6 <= 0.0)
  {
    -[CKTextMetricsProvider _metricsForRequest:containerInset:](self, "_metricsForRequest:containerInset:", v4, v7, v8, v9, v10);
  }
  else
  {
    [v4 minimumViewHeight];
    -[CKTextMetricsProvider _metricsForRequest:containerInset:minimumViewHeight:](self, "_metricsForRequest:containerInset:minimumViewHeight:", v4, v11, v12, v13, v14, v15);
  double v16 = };

  return v16;
}

- (id)_metricsForRequest:(id)a3 containerInset:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  [v9 adjustedMaximumSize];
  double v11 = v10;
  double v13 = v12;
  double v14 = [v9 attributedString];
  [v9 lineFragmentPadding];
  double v16 = v15;
  uint64_t v17 = [v9 maximumNumberOfLines];
  uint64_t v18 = [v9 lineBreakMode];

  double v19 = -[CKTextMetricsProvider _metricsForAttributedString:lineFragmentPadding:maximumNumberOfLines:lineBreakMode:targetSize:](self, "_metricsForAttributedString:lineFragmentPadding:maximumNumberOfLines:lineBreakMode:targetSize:", v14, v17, v18, v16, v11, v13);

  [v19 alignmentInset];
  double v21 = top + v20;
  [v19 alignmentInset];
  double v23 = left + v22;
  [v19 alignmentInset];
  double v25 = bottom + v24;
  [v19 alignmentInset];
  double v27 = right + v26;
  [v19 size];
  long long v30 = -[CKTextMetrics initWithSize:singleLine:alignmentInset:]([CKTextMetrics alloc], "initWithSize:singleLine:alignmentInset:", [v19 isSingleLine], left + right + v28, top + bottom + v29, v21, v23, v25, v27);

  return v30;
}

- (id)_metricsForRequest:(id)a3 containerInset:(UIEdgeInsets)a4 minimumViewHeight:(double)a5
{
  double bottom = a4.bottom;
  double top = a4.top;
  id v8 = a3;
  [v8 adjustedMaximumSize];
  double v10 = v9;
  double v12 = v11;
  double v13 = [v8 attributedString];
  [v8 lineFragmentPadding];
  double v15 = v14;
  uint64_t v16 = [v8 maximumNumberOfLines];
  uint64_t v17 = [v8 lineBreakMode];

  uint64_t v18 = -[CKTextMetricsProvider _metricsForAttributedString:lineFragmentPadding:maximumNumberOfLines:lineBreakMode:targetSize:](self, "_metricsForAttributedString:lineFragmentPadding:maximumNumberOfLines:lineBreakMode:targetSize:", v13, v16, v17, v15, v10, v12);

  [v18 size];
  double v20 = v19;
  [v18 size];
  double v22 = v21;
  [v18 alignmentInset];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  [v18 size];
  if (v31 >= a5)
  {
    a5 = v20;
  }
  else
  {
    double v32 = (a5 - (bottom + top + v22)) * 0.5;
    double v24 = top + v32;
    double v28 = bottom + v32;
    double v30 = 0.0;
    double v26 = 0.0;
  }
  [v18 size];
  CGRect v34 = -[CKTextMetrics initWithSize:singleLine:alignmentInset:]([CKTextMetrics alloc], "initWithSize:singleLine:alignmentInset:", [v18 isSingleLine], v33, a5, v24, v26, v28, v30);

  return v34;
}

@end