@interface EQKitHBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)p_cacheErasableBounds;
- (id)hitTest:(CGPoint)a3;
- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitHBox

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EQKitHBox;
  -[EQKitBox renderIntoContext:offset:](&v18, sel_renderIntoContext_offset_, v7, x, y);
  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend(v12, "renderIntoContext:offset:", v7, x, y);
          [v12 width];
          double x = x + v13;
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v36 = *MEMORY[0x263EF8340];
  int v8 = *((_DWORD *)a3 + 6);
  if (v8 == 2)
  {
    [(EQKitCompoundBox *)self width];
    double v16 = v15;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v17 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v9 = [v17 reverseObjectEnumerator];

    uint64_t v18 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      double v19 = x + v16;
      uint64_t v20 = *(void *)v27;
LABEL_14:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v9);
        }
        v22 = *(void **)(*((void *)&v26 + 1) + 8 * v21);
        [v22 width];
        double v19 = v19 - v23;
        if (objc_msgSend(v22, "appendOpticalAlignToSpec:offset:", a3, v19, y)) {
          goto LABEL_21;
        }
        if (v18 == ++v21)
        {
          uint64_t v18 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v18) {
            goto LABEL_14;
          }
          break;
        }
      }
    }
  }
  else
  {
    if (v8) {
      return 0;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v9 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v31;
LABEL_5:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
        if (objc_msgSend(v13, "appendOpticalAlignToSpec:offset:", a3, x, y)) {
          break;
        }
        [v13 width];
        double x = x + v14;
        if (v10 == ++v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v10) {
            goto LABEL_5;
          }
          goto LABEL_20;
        }
      }
LABEL_21:
      BOOL v24 = 1;
      goto LABEL_22;
    }
  }
LABEL_20:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)hitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    double v9 = x;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "hitTest:", v9, y);
        if (v12)
        {

          goto LABEL_11;
        }
        [v11 width];
        double v9 = v9 - v13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v15.receiver = self;
  v15.super_class = (Class)EQKitHBox;
  uint64_t v12 = -[EQKitBox hitTest:](&v15, sel_hitTest_, x, y);
LABEL_11:

  return v12;
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v6 = (EQKitHBox *)a4;
  if (v6 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v21;
      double v10 = 0.0;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v12, "p_getTransform:fromDescendant:", a3, v6))
          {
            long long v15 = *(_OWORD *)&a3->c;
            *(_OWORD *)&v18.a = *(_OWORD *)&a3->a;
            *(_OWORD *)&v18.c = v15;
            *(_OWORD *)&v18.tdouble x = *(_OWORD *)&a3->tx;
            CGAffineTransformTranslate(&v19, &v18, v10, 0.0);
            long long v16 = *(_OWORD *)&v19.c;
            *(_OWORD *)&a3->a = *(_OWORD *)&v19.a;
            *(_OWORD *)&a3->c = v16;
            *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v19.tx;
            BOOL v14 = 1;
            goto LABEL_12;
          }
          [v12 width];
          double v10 = v10 + v13;
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_12:
  }
  return v14;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  *a5 = 0.0;
  *a3 = 0.0;
  *a4 = 0.0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    char v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v13 vsize];
        if (v14 != 0.0)
        {
          if (v11)
          {
            [v13 height];
            *(void *)a3 = v15;
            [v13 depth];
          }
          else
          {
            double v17 = *a3;
            [v13 height];
            if (v17 >= v18) {
              double v18 = v17;
            }
            *a3 = v18;
            double v19 = *a4;
            [v13 depth];
            if (v19 >= v16) {
              double v16 = v19;
            }
          }
          char v11 = 0;
          *a4 = v16;
        }
        [v13 width];
        *a5 = v20 + *a5;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

- (CGRect)p_cacheErasableBounds
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  double x = *MEMORY[0x263F001A8];
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v4 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v29;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_msgSend(v9, "erasableBounds", *(void *)&y, *(void *)&width);
        double v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        [v9 width];
        double v19 = v18;
        v34.origin.double x = x;
        v34.origin.CGFloat y = v25;
        v34.size.CGFloat width = v27;
        v34.size.CGFloat height = height;
        if (CGRectIsEmpty(v34))
        {
          CGFloat y = v13;
          CGFloat width = v15;
          double x = v7 + v11;
          CGFloat height = v17;
        }
        else
        {
          v35.origin.double x = x;
          v35.origin.CGFloat y = v25;
          v35.size.CGFloat width = v27;
          v35.size.CGFloat height = height;
          v38.origin.CGFloat y = v13;
          v38.size.CGFloat width = v15;
          v38.size.CGFloat height = v17;
          v38.origin.double x = v7 + v11;
          CGRect v36 = CGRectUnion(v35, v38);
          CGFloat y = v36.origin.y;
          CGFloat width = v36.size.width;
          double x = v36.origin.x;
          CGFloat height = v36.size.height;
        }
        double v7 = v7 + v19;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.double x = v20;
  return result;
}

@end