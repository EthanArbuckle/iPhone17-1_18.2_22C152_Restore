@interface CPLayoutMaker
- (BOOL)column:(id)a3 fits:(id)a4;
- (void)makeLayouts:(id)a3 from:(id)a4;
@end

@implementation CPLayoutMaker

- (void)makeLayouts:(id)a3 from:(id)a4
{
  [a4 sortUsingSelector:sel_compareTopDescending_];
  uint64_t v7 = [a4 count];
  if (v7)
  {
    v8 = objc_alloc_init(CPLayoutArea);
    -[CPLayoutArea setHasRotatedCharacters:](v8, "setHasRotatedCharacters:", [a3 hasRotatedCharacters]);
    [a3 add:v8];

    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v10 = [a4 objectAtIndex:i];
      if (![(CPLayoutMaker *)self column:v10 fits:v8])
      {
        [(CPChunk *)v8 sortUsingSelector:sel_compareX_];
        v8 = objc_alloc_init(CPLayoutArea);
        -[CPLayoutArea setHasRotatedCharacters:](v8, "setHasRotatedCharacters:", [a3 hasRotatedCharacters]);
        [a3 add:v8];
      }
      [(CPChunk *)v8 add:v10];
    }
    [(CPChunk *)v8 sortUsingSelector:sel_compareX_];
  }
}

- (BOOL)column:(id)a3 fits:(id)a4
{
  int v6 = [a4 count];
  if (!v6) {
    return 1;
  }
  int v7 = v6;
  [a3 normalizedBounds];
  CGFloat v12 = v8;
  CGFloat rect1 = v9;
  CGFloat v13 = v10;
  CGFloat v14 = v11;
  if (v10 < 0.0 || v11 < 0.0)
  {
    unint64_t v15 = (unint64_t)CGRectStandardize(*(CGRect *)&v8);
    v38.origin.x = v12;
    v38.origin.double y = rect1;
    v38.size.width = v13;
    v38.size.height = v14;
    CGRect v39 = CGRectStandardize(v38);
    double v35 = v39.origin.x + v39.size.width;
    v39.origin.x = v12;
    v39.origin.double y = rect1;
    v39.size.width = v13;
    v39.size.height = v14;
    *(CGRect *)(&v9 - 1) = CGRectStandardize(v39);
  }
  else
  {
    double v35 = v8 + v10;
    *(double *)&unint64_t v15 = v8;
  }
  uint64_t v16 = 0;
  double v36 = v9 + v11;
  double v33 = v13;
  double v34 = v14;
  while (1)
  {
    double v17 = *(double *)&v15;
    objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", v16), "normalizedBounds");
    double v19 = v18;
    double y = v20;
    double v23 = v22;
    double v25 = v24;
    v40.origin.x = v12;
    v40.origin.double y = rect1;
    v40.size.width = v13;
    v40.size.height = v14;
    v46.origin.x = v19;
    v46.origin.double y = y;
    v46.size.width = v23;
    v46.size.height = v25;
    if (CGRectIntersectsRect(v40, v46)) {
      break;
    }
    if (v23 < 0.0 || v25 < 0.0)
    {
      double v27 = v12;
      v41.origin.x = v19;
      v41.origin.double y = y;
      v41.size.width = v23;
      v41.size.height = v25;
      double v28 = COERCE_DOUBLE(CGRectStandardize(v41));
      v42.origin.x = v19;
      v42.origin.double y = y;
      v42.size.width = v23;
      v42.size.height = v25;
      CGRect v43 = CGRectStandardize(v42);
      double v26 = v43.origin.x + v43.size.width;
      if (v17 >= v28 && v17 <= v26) {
        return 0;
      }
      v44.origin.x = v19;
      v44.origin.double y = y;
      v44.size.width = v23;
      v44.size.height = v25;
      CGRect v45 = CGRectStandardize(v44);
      double y = v45.origin.y;
      double v19 = v28;
      CGFloat v12 = v27;
      CGFloat v13 = v33;
      *(double *)&unint64_t v15 = v17;
    }
    else
    {
      double v26 = v19 + v23;
      *(double *)&unint64_t v15 = v17;
      if (v17 >= v19 && v17 <= v26) {
        return 0;
      }
    }
    if (v35 <= v26 && v35 >= v19 || v36 < y) {
      return 0;
    }
    uint64_t v16 = (v16 + 1);
    CGFloat v14 = v34;
    if (v7 == v16) {
      return 1;
    }
  }
  return 0;
}

@end