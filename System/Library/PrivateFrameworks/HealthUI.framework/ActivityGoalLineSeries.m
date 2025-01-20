@interface ActivityGoalLineSeries
@end

@implementation ActivityGoalLineSeries

void __166___ActivityGoalLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v25 = a2;
  id v7 = a4;
  [v25 coordinate];
  CGFloat v10 = v8;
  if (v8 < *(double *)(a1 + 64))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = v25;
LABEL_3:
    v13 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
LABEL_14:

    goto LABEL_15;
  }
  CGFloat v14 = v9;
  if (v8 > *(double *)(a1 + 72))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      goto LABEL_15;
    }
    if (([*(id *)(a1 + 32) _lineSeriesCoordinateIsPaused:v25] & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) coordinate];
      CGContextAddLineToPoint(*(CGContextRef *)(a1 + 80), v15, v14);
      CGContextAddLineToPoint(*(CGContextRef *)(a1 + 80), v10, v14);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += 2;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    v13 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
    goto LABEL_14;
  }
  char v17 = [*(id *)(a1 + 32) _lineSeriesCoordinateIsPaused:v25];
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  if (v19)
  {
    if (v17)
    {
      CGContextMoveToPoint(*(CGContextRef *)(a1 + 80), v10, v14);
      goto LABEL_24;
    }
    [v19 coordinate];
    v22 = *(CGContext **)(a1 + 80);
    if (*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < 1) {
      CGContextMoveToPoint(v22, v21, v14);
    }
    else {
      CGContextAddLineToPoint(v22, v21, v14);
    }
    CGContextAddLineToPoint(*(CGContextRef *)(a1 + 80), v10, v14);
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v24 = *(void *)(v23 + 24) + 2;
  }
  else
  {
    if (v17)
    {
      id v20 = v25;
      v13 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v20;
      goto LABEL_14;
    }
    CGContextMoveToPoint(*(CGContextRef *)(a1 + 80), *(CGFloat *)(a1 + 64), v14);
    CGContextAddLineToPoint(*(CGContextRef *)(a1 + 80), v10, v14);
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v24 = *(void *)(v23 + 24) + 1;
  }
  *(void *)(v23 + 24) = v24;
LABEL_24:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if ((v17 & 1) == 0)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = v7;
    goto LABEL_3;
  }
LABEL_15:
}

@end