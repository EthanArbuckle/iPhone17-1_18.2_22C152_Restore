@interface PKTransformStrokesAnimation
- (id)initWithStrokes:(double)a3 startTime:(double)a4 duration:(double)a5 destinationFrame:(double)a6 fadeOutDuration:(double)a7;
- (void)newStrokesAtTime:(uint64_t)a1;
@end

@implementation PKTransformStrokesAnimation

- (id)initWithStrokes:(double)a3 startTime:(double)a4 duration:(double)a5 destinationFrame:(double)a6 fadeOutDuration:(double)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  if (a1)
  {
    v38.receiver = a1;
    v38.super_class = (Class)PKTransformStrokesAnimation;
    v19 = (id *)objc_msgSendSuper2(&v38, sel_init);
    a1 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 1, a2);
      *((double *)a1 + 2) = a3;
      *((double *)a1 + 3) = a4;
      *((double *)a1 + 9) = a5;
      *((double *)a1 + 10) = a6;
      *((double *)a1 + 11) = a7;
      *((double *)a1 + 12) = a8;
      *((double *)a1 + 4) = a9;
      CGFloat x = *MEMORY[0x1E4F1DB20];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v24 = v18;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v35;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v35 != v27) {
              objc_enumerationMutation(v24);
            }
            objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v28), "renderBounds", (void)v34);
            v44.origin.CGFloat x = v29;
            v44.origin.CGFloat y = v30;
            v44.size.CGFloat width = v31;
            v44.size.CGFloat height = v32;
            v41.origin.CGFloat x = x;
            v41.origin.CGFloat y = y;
            v41.size.CGFloat width = width;
            v41.size.CGFloat height = height;
            CGRect v42 = CGRectUnion(v41, v44);
            CGFloat x = v42.origin.x;
            CGFloat y = v42.origin.y;
            CGFloat width = v42.size.width;
            CGFloat height = v42.size.height;
            ++v28;
          }
          while (v26 != v28);
          uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v26);
      }

      *((CGFloat *)a1 + 5) = x;
      *((CGFloat *)a1 + 6) = y;
      *((CGFloat *)a1 + 7) = width;
      *((CGFloat *)a1 + 8) = height;
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = width;
      v43.size.CGFloat height = height;
      *(CGRect *)(a1 + 13) = CGRectUnion(v43, *(CGRect *)(a1 + 9));
    }
  }

  return a1;
}

- (void)newStrokesAtTime:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  double v3 = *(double *)(a1 + 24);
  double v4 = a2 - *(double *)(a1 + 16);
  double v5 = v4 / v3;
  if (v4 / v3 > 1.0) {
    double v5 = 1.0;
  }
  double v6 = v5 * v5 * (v5 * -2.0 + 3.0);
  long long v33 = 0u;
  long long v34 = 0u;
  double v7 = *(double *)(a1 + 40);
  if (*(double *)(a1 + 32) >= v3) {
    double v8 = v3;
  }
  else {
    double v8 = *(double *)(a1 + 32);
  }
  long long v32 = 0uLL;
  +[PKMetalUtility transformConvertingRect:toRect:percent:](PKMetalUtility, "transformConvertingRect:toRect:percent:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(void *)&v6);
  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 8);
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = fmax(1.0 - v4 / v8, 0.0);
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v15 = [v14 ink];
        v16 = [v15 color];

        [v16 alphaComponent];
        id v18 = [v16 colorWithAlphaComponent:v11 * v17];
        v19 = (void *)[v14 mutableCopy];
        v27[0] = v32;
        v27[1] = v33;
        v27[2] = v34;
        [v19 _applyTransform:v27];
        v20 = [v14 ink];
        v21 = [v20 identifier];
        v22 = [v14 ink];
        [v22 weight];
        v23 = +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", v21, v18);
        [v19 setInk:v23];

        [v26 addObject:v19];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v10);
  }

  return v26;
}

- (void).cxx_destruct
{
}

@end