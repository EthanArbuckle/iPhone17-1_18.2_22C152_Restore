@interface EQKitVBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)p_cacheErasableBounds;
- (EQKitVBox)initWithChildBoxes:(id)a3;
- (EQKitVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)hitTest:(CGPoint)a3;
- (unint64_t)pivotIndex;
- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitVBox

- (EQKitVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EQKitVBox;
  v7 = [(EQKitCompoundBox *)&v11 initWithChildBoxes:v6];
  if (v7)
  {
    unint64_t v8 = [v6 count];
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 > a4) {
      unint64_t v9 = a4;
    }
    v7->_pivotIndex = v9;
  }

  return v7;
}

- (EQKitVBox)initWithChildBoxes:(id)a3
{
  return [(EQKitVBox *)self initWithChildBoxes:a3 pivotIndex:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitCompoundBox *)self childBoxes];
  id v6 = objc_msgSend(v4, "initWithChildBoxes:pivotIndex:", v5, -[EQKitVBox pivotIndex](self, "pivotIndex"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EQKitVBox;
  if ([(EQKitCompoundBox *)&v9 isEqual:v4])
  {
    id v5 = v4;
    unint64_t v6 = [(EQKitVBox *)self pivotIndex];
    BOOL v7 = v6 == [v5 pivotIndex];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EQKitVBox;
  -[EQKitBox renderIntoContext:offset:](&v23, sel_renderIntoContext_offset_, v7, x, y);
  if (v7)
  {
    [(EQKitCompoundBox *)self height];
    double v9 = v8;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      double v12 = y - v9;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v15 layoutHeight];
          double v17 = v12 + v16;
          objc_msgSend(v15, "renderIntoContext:offset:", v7, x, v17);
          [v15 layoutDepth];
          double v12 = v17 + v18;
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(EQKitCompoundBox *)self height];
  if ((*((_DWORD *)a3 + 6) | 2) == 2)
  {
    double v9 = v8;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v10 = [(EQKitCompoundBox *)self childBoxes];
    char v11 = 0;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      double v13 = y - v9;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v10);
          }
          double v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v16 layoutHeight];
          double v18 = v13 + v17;
          char v19 = objc_msgSend(v16, "appendOpticalAlignToSpec:offset:", a3, x, v18);
          [v16 layoutDepth];
          v11 |= v19;
          double v13 = v18 + v20;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

- (id)hitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(EQKitCompoundBox *)self height];
  double v7 = v6;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v8 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    double v10 = v7 - y;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v13 height];
        v15 = objc_msgSend(v13, "hitTest:", x, v14 - v10);
        if (v15)
        {

          goto LABEL_11;
        }
        [v13 vsize];
        double v10 = v10 - v16;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v18.receiver = self;
  v18.super_class = (Class)EQKitVBox;
  v15 = -[EQKitBox hitTest:](&v18, sel_hitTest_, x, y);
LABEL_11:

  return v15;
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  double v6 = (EQKitVBox *)a4;
  if (v6 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    [(EQKitCompoundBox *)self height];
    double v8 = v7;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      double v11 = -v8;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v14 layoutHeight];
          double v16 = v11 + v15;
          if (objc_msgSend(v14, "p_getTransform:fromDescendant:", a3, v6))
          {
            long long v19 = *(_OWORD *)&a3->c;
            *(_OWORD *)&v22.a = *(_OWORD *)&a3->a;
            *(_OWORD *)&v22.c = v19;
            *(_OWORD *)&v22.tdouble x = *(_OWORD *)&a3->tx;
            CGAffineTransformTranslate(&v23, &v22, 0.0, v16);
            long long v20 = *(_OWORD *)&v23.c;
            *(_OWORD *)&a3->a = *(_OWORD *)&v23.a;
            *(_OWORD *)&a3->c = v20;
            *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v23.tx;
            BOOL v18 = 1;
            goto LABEL_12;
          }
          [v14 layoutDepth];
          double v11 = v16 + v17;
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v18 = 0;
LABEL_12:
  }
  return v18;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitCompoundBox *)self height];
  uint64_t v6 = v5;
  [(EQKitCompoundBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitCompoundBox *)self width];
  uint64_t v10 = v9;
  double v11 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v12 = [v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f childBoxes=%@ pivotIndex=%lu", v4, self, v6, v8, v10, v11, -[EQKitVBox pivotIndex](self, "pivotIndex")];

  return v12;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  *a3 = 0.0;
  *a4 = 0.0;
  *a5 = 0.0;
  if ([(EQKitVBox *)self pivotIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v21 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v9 = [v21 count];
    if (v9)
    {
      unint64_t v10 = [(EQKitVBox *)self pivotIndex];
      unint64_t v11 = v10;
      unint64_t v12 = 0;
      if (v10 >= v9 - 1) {
        unint64_t v13 = v9 - 1;
      }
      else {
        unint64_t v13 = v10;
      }
      do
      {
        double v14 = [v21 objectAtIndexedSubscript:v12];
        double v15 = v14;
        if (v12 >= v13)
        {
          if (v12 <= v13)
          {
            if (v13) {
              [v14 layoutHeight];
            }
            else {
              [v14 height];
            }
            *a3 = v18 + *a3;
            if (v9 - 1 <= v11) {
              [v15 depth];
            }
            else {
              [v15 layoutDepth];
            }
          }
          else
          {
            [v14 layoutVSize];
          }
          double v17 = a4;
        }
        else
        {
          [v14 layoutVSize];
          double v17 = a3;
        }
        *double v17 = v16 + *v17;
        double v19 = *a5;
        [v15 width];
        if (v19 >= v20) {
          double v20 = v19;
        }
        *a5 = v20;

        ++v12;
      }
      while (v9 != v12);
    }
  }
}

- (CGRect)p_cacheErasableBounds
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A8];
  double y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  CGFloat rect = *(double *)(MEMORY[0x263F001A8] + 16);
  [(EQKitCompoundBox *)self height];
  double v5 = v4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v6 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    double v8 = -v5;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v11 layoutHeight];
        double v13 = v12;
        [v11 erasableBounds];
        CGFloat v15 = v14;
        double v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        [v11 layoutDepth];
        double v23 = v22;
        v38.origin.CGFloat x = x;
        v38.origin.double y = y;
        v38.size.width = rect;
        v38.size.CGFloat height = height;
        double v24 = v8 + v13;
        if (CGRectIsEmpty(v38))
        {
          double y = v24 + v17;
          CGFloat rect = v19;
          CGFloat x = v15;
          CGFloat height = v21;
        }
        else
        {
          v39.origin.CGFloat x = x;
          v39.origin.double y = y;
          v39.size.width = rect;
          v39.size.CGFloat height = height;
          v42.origin.CGFloat x = v15;
          v42.size.width = v19;
          v42.size.CGFloat height = v21;
          v42.origin.double y = v24 + v17;
          CGRect v40 = CGRectUnion(v39, v42);
          CGFloat x = v40.origin.x;
          double y = v40.origin.y;
          CGFloat rect = v40.size.width;
          CGFloat height = v40.size.height;
        }
        double v8 = v24 + v23;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }

  double v25 = x;
  double v26 = y;
  double v27 = rect;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.width = v27;
  result.origin.double y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (unint64_t)pivotIndex
{
  return self->_pivotIndex;
}

@end