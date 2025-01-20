@interface HKAnnotationColumnLayout
@end

@implementation HKAnnotationColumnLayout

double __82___HKAnnotationColumnLayout__layoutColumnsWithWidth_columnSeparation_currentSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v6 = a2;
  [v6 frame];
  double v8 = v7;
  [v6 frame];
  double v10 = v9;
  [v6 frame];
  objc_msgSend(v6, "setFrame:", v5, v8, v10);
  [v6 frame];
  double v12 = v11;

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  if (a3 && [*(id *)(a1 + 32) includeSeparators])
  {
    v13 = [*(id *)(a1 + 32) separatorViews];
    v14 = [v13 objectAtIndexedSubscript:a3 - 1];

    double v15 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + *(double *)(a1 + 48);
    [v14 frame];
    double v17 = v16;
    [v14 frame];
    double v19 = v18;
    [v14 frame];
    objc_msgSend(v14, "setFrame:", v15, v17, v19);
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)(a1 + 56) + *(double *)(v20 + 24);
  *(double *)(v20 + 24) = result;
  return result;
}

void __82___HKAnnotationColumnLayout__layoutColumnsWithWidth_columnSeparation_currentSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v19 = a2;
  [v19 frame];
  double v6 = *(double *)(a1 + 40) + v5;
  [v19 frame];
  double v8 = v7;
  [v19 frame];
  double v10 = v9;
  [v19 frame];
  objc_msgSend(v19, "setFrame:", v6, v8, v10);
  if (a3 && [*(id *)(a1 + 32) includeSeparators])
  {
    double v11 = [*(id *)(a1 + 32) separatorViews];
    double v12 = [v11 objectAtIndexedSubscript:a3 - 1];

    [v19 frame];
    double v14 = v13 - *(double *)(a1 + 48);
    [v12 frame];
    double v16 = v15;
    [v12 frame];
    double v18 = v17;
    [v12 frame];
    objc_msgSend(v12, "setFrame:", v14, v16, v18);
  }
}

@end