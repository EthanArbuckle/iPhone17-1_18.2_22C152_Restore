@interface CPTextBoxMaker
+ (void)boxLayoutsIn:(id)a3;
+ (void)promoteLayoutsIn:(id)a3;
- (BOOL)layoutIsSliced:(id)a3;
- (void)boxLayout:(id)a3;
- (void)boxLayoutsIn:(id)a3;
- (void)makeBoxesWith:(id)a3 parent:(id)a4;
- (void)promoteLayoutsIn:(id)a3;
- (void)promoteLayoutsInCertainRegions:(id)a3;
- (void)rotate:(id)a3;
- (void)rotateTextBox:(id)a3;
@end

@implementation CPTextBoxMaker

- (void)boxLayoutsIn:(id)a3
{
  self->mainZone = (CPZone *)a3;
  uint64_t v5 = objc_opt_class();

  [a3 mapSafely:sel_boxLayout_ target:self childrenOfClass:v5];
}

- (void)boxLayout:(id)a3
{
  uint64_t v5 = objc_alloc_init(CPTextBox);
  if ([(CPZone *)self->mainZone hasRotatedCharacters])
  {
    [(CPZone *)self->mainZone rotationAngle];
    -[CPTextBox setRotationAngle:](v5, "setRotationAngle:");
  }
  [(CPChunk *)v5 add:a3];
  [(CPChunk *)self->mainZone add:v5];
}

- (void)promoteLayoutsIn:(id)a3
{
  self->bodyZone = (CPBody *)a3;
  uint64_t v5 = objc_opt_class();

  [a3 map:sel_promoteLayoutsInCertainRegions_ target:self childrenOfClass:v5];
}

- (void)promoteLayoutsInCertainRegions:(id)a3
{
  if ([a3 isGraphicalRegion])
  {
    [a3 firstChild];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = (void *)[a3 firstChild];
      if ([v5 count])
      {
        if (![v5 isUprightRectangle]
          || [(CPTextBoxMaker *)self layoutIsSliced:v5])
        {
          v6 = objc_alloc_init(CPTextBox);
          [(CPChunk *)v6 addChildrenOf:v5];
          [(CPChunk *)self->bodyZone add:v6];
        }
      }
    }
  }
}

- (BOOL)layoutIsSliced:(id)a3
{
  int v4 = [a3 count];
  if (v4)
  {
    uint64_t v5 = (void *)[a3 firstChild];
    int v6 = [v5 zOrder];
    int v7 = [a3 zOrder];
    if (v6 >= v7) {
      int v8 = v7;
    }
    else {
      int v8 = v6;
    }
    if (v6 <= v7) {
      int v9 = v7;
    }
    else {
      int v9 = v6;
    }
    v10 = objc_msgSend((id)objc_msgSend(v5, "page"), "graphicsOnPage");
    int v11 = [v10 count];
    int v12 = v11;
    if (v11 < 1)
    {
      LODWORD(v13) = 0;
      int v15 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      while (1)
      {
        int v15 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v13), "zOrder");
        if (v8 < v15) {
          break;
        }
        if (v14 == ++v13)
        {
          LODWORD(v13) = v12;
          break;
        }
      }
    }
    if (v15 <= v9)
    {
      [a3 bounds];
      CGFloat v41 = v17;
      CGFloat v42 = v16;
      CGFloat v39 = v19;
      CGFloat v40 = v18;
      [v5 bounds];
      if ((int)v13 < v12)
      {
        CGFloat v24 = v20;
        CGFloat v25 = v21;
        CGFloat v26 = v22;
        CGFloat v27 = v23;
        for (uint64_t i = 0; (int)v13 + (int)i < v12; ++i)
        {
          v29 = (void *)[v10 objectAtIndex:v13 + i];
          if (v9 < (int)[v29 zOrder]) {
            break;
          }
          [v29 bounds];
          CGFloat v31 = v30;
          CGFloat v33 = v32;
          CGFloat v35 = v34;
          CGFloat v37 = v36;
          v43.origin.x = v24;
          v43.origin.y = v25;
          v43.size.width = v26;
          v43.size.height = v27;
          v45.origin.x = v31;
          v45.origin.y = v33;
          v45.size.width = v35;
          v45.size.height = v37;
          if (CGRectIntersectsRect(v43, v45))
          {
            v44.origin.y = v41;
            v44.origin.x = v42;
            v44.size.height = v39;
            v44.size.width = v40;
            v46.origin.x = v31;
            v46.origin.y = v33;
            v46.size.width = v35;
            v46.size.height = v37;
            if (CGRectIntersectsRect(v44, v46))
            {
              LOBYTE(v4) = 1;
              return v4;
            }
          }
        }
      }
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)rotate:(id)a3
{
  uint64_t v5 = objc_opt_class();

  [a3 map:sel_rotateTextBox_ target:self childrenOfClass:v5];
}

- (void)rotateTextBox:(id)a3
{
  [a3 rotationAngle];
  double v5 = v4;
  if (fabs(v4) > 2.0)
  {
    int v6 = (void *)[a3 firstChild];
    int v7 = [v6 count];
    if (v7 >= 1)
    {
      int v8 = v7;
      __double2 v9 = __sincos_stret(v5);
      uint64_t v10 = 0;
      float64x2_t v16 = vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1850CD8C0, v9.__sinval), (float64x2_t)xmmword_1850CD830, v9.__cosval);
      float64x2_t v17 = vmlsq_lane_f64(vmulq_n_f64((float64x2_t)xmmword_1850CD8C0, v9.__cosval), (float64x2_t)xmmword_1850CD830, v9.__sinval, 0);
      double v11 = v16.f64[1];
      double v12 = v17.f64[1];
      do
      {
        uint64_t v13 = objc_msgSend(v6, "childAtIndex:", v10, *(_OWORD *)&v16, *(_OWORD *)&v17);
        [v13 bounds];
        objc_msgSend(v13, "setBounds:", v14 * v17.f64[0] + v16.f64[0] * v15 + 0.0, v14 * v12 + v11 * v15 + 0.0);
        uint64_t v10 = (v10 + 1);
      }
      while (v8 != v10);
    }
  }
}

- (void)makeBoxesWith:(id)a3 parent:(id)a4
{
  int v6 = [a4 hasRotatedCharacters];
  double v7 = 0.0;
  if (v6)
  {
    [a4 rotationAngle];
    double v7 = v8;
  }
  uint64_t v9 = [a3 count];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      double v11 = objc_alloc_init(CPTextBox);
      double v12 = v11;
      if (v6) {
        [(CPTextBox *)v11 setRotationAngle:v7];
      }
      [a4 add:v12];

      uint64_t v13 = [a3 objectAtIndex:i];
      double v14 = objc_alloc_init(CPLayoutArea);
      [(CPChunk *)v12 add:v14];

      double v15 = objc_alloc_init(CPColumn);
      [(CPChunk *)v14 add:v15];

      [(CPChunk *)v15 add:v13];
    }
  }
}

+ (void)boxLayoutsIn:(id)a3
{
  double v4 = objc_alloc_init(CPTextBoxMaker);
  [(CPTextBoxMaker *)v4 boxLayoutsIn:a3];
}

+ (void)promoteLayoutsIn:(id)a3
{
  double v4 = objc_alloc_init(CPTextBoxMaker);
  [(CPTextBoxMaker *)v4 promoteLayoutsIn:a3];
}

@end