@interface HKAxisExclusion
- (BOOL)excludeRect:(CGRect)a3;
- (HKAxisExclusion)init;
- (NSMutableArray)excludedRects;
- (void)setExcludedRects:(id)a3;
- (void)unifyExclusion;
@end

@implementation HKAxisExclusion

- (HKAxisExclusion)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKAxisExclusion;
  v2 = [(HKAxisExclusion *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    excludedRects = v2->_excludedRects;
    v2->_excludedRects = v3;
  }
  return v2;
}

- (BOOL)excludeRect:(CGRect)a3
{
  BOOL v3 = 0;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3.size.width > 0.0)
  {
    double height = a3.size.height;
    if (a3.size.height > 0.0)
    {
      double width = a3.size.width;
      double y = a3.origin.y;
      double x = a3.origin.x;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v9 = self->_excludedRects;
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "CGRectValue", (void)v20);
            v28.origin.double x = v14;
            v28.origin.double y = v15;
            v28.size.double width = v16;
            v28.size.double height = v17;
            v26.origin.double x = x;
            v26.origin.double y = y;
            v26.size.double width = width;
            v26.size.double height = height;
            CGRect v27 = CGRectIntersection(v26, v28);
            if (!CGRectIsNull(v27))
            {
              BOOL v3 = 1;
              goto LABEL_13;
            }
          }
          uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      excludedRects = self->_excludedRects;
      objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      [(NSMutableArray *)excludedRects addObject:v9];
      BOOL v3 = 0;
LABEL_13:
    }
  }
  return v3;
}

- (void)unifyExclusion
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v7 = self->_excludedRects;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    CGFloat v26 = height;
    CGFloat v27 = width;
    CGFloat v28 = y;
    CGFloat v29 = x;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "CGRectValue", *(void *)&v26, *(void *)&v27, *(void *)&v28, *(void *)&v29, (void)v30);
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        v36.origin.double x = x;
        v36.origin.double y = y;
        v36.size.double width = width;
        v36.size.double height = height;
        v40.origin.double y = v28;
        v40.origin.double x = v29;
        v40.size.double height = v26;
        v40.size.double width = v27;
        if (CGRectEqualToRect(v36, v40))
        {
          double height = v19;
          double width = v17;
          double y = v15;
          double x = v13;
        }
        else
        {
          v37.origin.double x = x;
          v37.origin.double y = y;
          v37.size.double width = width;
          v37.size.double height = height;
          v41.origin.double x = v13;
          v41.origin.double y = v15;
          v41.size.double width = v17;
          v41.size.double height = v19;
          CGRect v38 = CGRectUnion(v37, v41);
          double x = v38.origin.x;
          double y = v38.origin.y;
          double width = v38.size.width;
          double height = v38.size.height;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
    CGFloat v21 = v28;
    CGFloat v20 = v29;
    CGFloat v23 = v26;
    CGFloat v22 = v27;
  }
  else
  {
    CGFloat v20 = x;
    CGFloat v21 = y;
    CGFloat v22 = width;
    CGFloat v23 = height;
  }

  v39.origin.double x = x;
  v39.origin.double y = y;
  v39.size.double width = width;
  v39.size.double height = height;
  v42.origin.double x = v20;
  v42.origin.double y = v21;
  v42.size.double width = v22;
  v42.size.double height = v23;
  if (!CGRectEqualToRect(v39, v42))
  {
    [(NSMutableArray *)self->_excludedRects removeAllObjects];
    excludedRects = self->_excludedRects;
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
    [(NSMutableArray *)excludedRects addObject:v25];
  }
}

- (NSMutableArray)excludedRects
{
  return self->_excludedRects;
}

- (void)setExcludedRects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end