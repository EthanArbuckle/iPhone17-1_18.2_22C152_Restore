@interface CPColumnMaker
- (BOOL)canSafelyAdd:(id)a3 to:(id)a4;
- (BOOL)closeImagesBetween:(id)a3 and:(id)a4 bounds:(CGRect)a5;
- (BOOL)column:(id)a3 isLinkedBelowTo:(id)a4;
- (BOOL)cuttingShapeBetween:(id)a3 and:(id)a4;
- (BOOL)intervalOverlapLeft:(double)a3 right:(double)a4 paragraphs:(id)a5;
- (BOOL)paragraph:(id)a3 isAbove:(id)a4;
- (BOOL)paragraph:(id)a3 isBelow:(id)a4;
- (BOOL)paragraph:(id)a3 isLinkedBelowTo:(id)a4;
- (BOOL)paragraph:(id)a3 notOnSameShapeAs:(id)a4;
- (CGRect)pageBounds;
- (CPColumnMaker)init;
- (double)averageSpacing:(id)a3;
- (id)chunkAbove:(id)a3 in:(id)a4;
- (id)columns;
- (id)paragraphAbove:(id)a3 in:(id)a4;
- (id)paragraphBelow:(id)a3 in:(id)a4;
- (void)anchorImages;
- (void)callOuts;
- (void)dealloc;
- (void)intersectionCallout:(id)a3;
- (void)makeColumnsFrom:(id)a3 zone:(id)a4;
- (void)partitionShapes:(id)a3;
- (void)setPageBounds:(CGRect)a3;
- (void)splitColumns:(id)a3;
@end

@implementation CPColumnMaker

- (void)setPageBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->pageBounds, &v3, 32, 1, 0);
}

- (CGRect)pageBounds
{
  objc_copyStruct(v6, &self->pageBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)makeColumnsFrom:(id)a3 zone:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 count];
  if (v7)
  {
    unint64_t v8 = [a3 count];
    if (((double)v8 * -0.01 + 15.0) / 100.0 >= 0.0) {
      double v9 = ((double)v8 * -0.01 + 15.0) / 100.0;
    }
    else {
      double v9 = 0.0;
    }
    double width = self->pageBounds.size.width;
    double height = self->pageBounds.size.height;
    if (width < 0.0 || height < 0.0)
    {
      CGFloat x = self->pageBounds.origin.x;
      CGFloat y = self->pageBounds.origin.y;
      *(CGRect *)(&height - 3) = CGRectStandardize(*(CGRect *)(&width - 2));
    }
    self->maxParagraphDistance = v9 * height;
    self->currentZone = (CPZone *)a4;
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    objc_msgSend((id)objc_msgSend(a4, "page"), "complexity");
    if (v15 <= 0.8) {
      [a4 descendantsOfClass:objc_opt_class() to:v14];
    }
    [(CPColumnMaker *)self partitionShapes:v14];

    self->images = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    [a4 descendantsOfClass:objc_opt_class() to:self->images];
    [(NSMutableArray *)self->images sortUsingSelector:sel_compareZDescending_];
    self->allParagraphs = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:a3];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:a3];
    [(NSMutableArray *)self->allParagraphs sortUsingSelector:sel_compareY_];
    [v16 sortUsingSelector:sel_compareTopDescending_];
    uint64_t v17 = 0;
    self->paragraphWrappers = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    do
    {
      v18 = -[CPParagraphFlow initWithParagraph:]([CPParagraphFlow alloc], "initWithParagraph:", [a3 objectAtIndex:v17]);
      [(NSMutableArray *)self->paragraphWrappers addObject:v18];
      [(CPParagraphFlow *)v18 setParagraphsAboveIn:self->allParagraphs];
      [(CPParagraphFlow *)v18 setParagraphsBelowIn:v16];

      ++v17;
    }
    while (v7 != v17);

    [(NSMutableArray *)self->allParagraphs sortUsingSelector:sel_compareX_];
    uint64_t v19 = [(NSMutableArray *)self->paragraphWrappers count];
    if (v19)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        v21 = (void *)[(NSMutableArray *)self->paragraphWrappers objectAtIndex:i];
        [v21 setParagraphsLeftIn:self->allParagraphs];
        [v21 setParagraphsRightIn:self->allParagraphs];
      }
    }
    [(CPColumnMaker *)self callOuts];
    [(NSMutableArray *)self->paragraphWrappers sortUsingSelector:sel_topDescending_];
    self->columns = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    if (v19)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        v24 = (void *)[(NSMutableArray *)self->paragraphWrappers objectAtIndex:j];
        if (![v24 calloutType] && (objc_msgSend(v24, "placed") & 1) == 0)
        {
          v25 = objc_alloc_init(CPColumn);
          [v22 addObject:v25];

          -[CPChunk add:](v25, "add:", [v24 paragraph]);
          [v24 setPlaced:1];
          uint64_t v26 = [v24 nextParagraphInColumn:v25];
          if (v26)
          {
            v27 = (void *)v26;
            do
            {
              if (![(CPColumnMaker *)self canSafelyAdd:v27 to:v25]) {
                break;
              }
              v28 = (void *)[v27 flowProperties];
              if (![v28 calloutType] && (objc_msgSend(v28, "placed") & 1) == 0)
              {
                [(CPChunk *)v25 add:v27];
                [v28 setPlaced:1];
              }
              v27 = (void *)[v28 nextParagraphInColumn:v25];
            }
            while (v27);
          }
        }
      }
    }
    [(CPColumnMaker *)self splitColumns:v22];

    [(CPColumnMaker *)self anchorImages];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    columns = self->columns;
    uint64_t v30 = [(NSMutableArray *)columns countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(columns);
          }
          v34 = *(void **)(*((void *)&v41 + 1) + 8 * k);
          if ([v34 count]) {
            [a4 add:v34];
          }
        }
        uint64_t v31 = [(NSMutableArray *)columns countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v31);
    }
    uint64_t v35 = [(NSMutableArray *)self->paragraphWrappers count];
    if (v35)
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        v37 = (void *)[(NSMutableArray *)self->paragraphWrappers objectAtIndex:m];
        if ([v37 calloutType])
        {
          v38 = objc_alloc_init(CPColumn);
          [(NSMutableArray *)self->columns addObject:v38];
          [a4 add:v38];

          -[CPChunk add:](v38, "add:", [v37 paragraph]);
        }
      }
    }

    uint64_t v39 = [(NSMutableArray *)self->columns count];
    if (v39)
    {
      for (uint64_t n = 0; n != v39; ++n)
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->columns, "objectAtIndex:", n), "sortUsingSelector:", sel_compareTopDescending_);
    }

    objc_msgSend((id)objc_msgSend(a4, "page"), "addColumns:", self->columns);
  }
}

- (void)anchorImages
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->columns count];
  if ((unint64_t)([(NSMutableArray *)self->images count] + v3) <= 0xC8)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = self->columns;
    uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v33 != v6) {
            objc_enumerationMutation(obj);
          }
          unint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          images = self->images;
          uint64_t v10 = [(NSMutableArray *)images countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v29 != v12) {
                  objc_enumerationMutation(images);
                }
                v14 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                [v14 top];
                double v16 = v15;
                [v8 bottom];
                if (v16 <= v17)
                {
                  [v8 bottom];
                  double v19 = v18;
                  [v14 top];
                  if (v19 - v20 <= self->maxParagraphDistance)
                  {
                    [v14 left];
                    double v22 = v21;
                    [v8 left];
                    if (v22 >= v23)
                    {
                      [v14 right];
                      double v25 = v24;
                      [v8 right];
                      if (v25 <= v26) {
                        objc_msgSend(v14, "setAnchoringParagraph:", objc_msgSend(v8, "lastChild"));
                      }
                    }
                  }
                }
              }
              uint64_t v11 = [(NSMutableArray *)images countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v11);
          }
        }
        uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v5);
    }
  }
}

- (void)splitColumns:(id)a3
{
  uint64_t v41 = [a3 count];
  if (v41)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = objc_msgSend(a3, "objectAtIndex:", v4, v41);
      [v5 normalizedBounds];
      double v45 = v7;
      double v46 = v6;
      double v43 = v9;
      double v44 = v8;
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithArray:", objc_msgSend(v5, "children"));
      uint64_t v11 = objc_alloc_init(CPColumn);
      uint64_t v12 = [v10 count];
      if (v12 != 1)
      {
        uint64_t v13 = v12;
        for (uint64_t i = 1; i != v13; ++i)
        {
          double v15 = (void *)[v10 objectAtIndex:i - 1];
          [(CPChunk *)v11 add:v15];
          double v16 = (void *)[v10 objectAtIndex:i];
          [v15 normalizedBounds];
          CGFloat v18 = v17;
          double v20 = v19;
          double v22 = v21;
          double v24 = v23;
          [v16 normalizedBounds];
          CGFloat v26 = v25;
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          if (v22 < 0.0 || v24 < 0.0)
          {
            v47.origin.CGFloat x = v18;
            v47.origin.CGFloat y = v20;
            v47.size.double width = v22;
            v47.size.double height = v24;
            *(CGRect *)&double v25 = CGRectStandardize(v47);
            double v20 = v33;
          }
          if (v30 < 0.0 || v32 < 0.0)
          {
            v48.origin.CGFloat x = v26;
            v48.origin.CGFloat y = v28;
            v48.size.double width = v30;
            v48.size.double height = v32;
            *(CGRect *)&double v25 = CGRectStandardize(v48);
            double v28 = v34;
            double v32 = v35;
          }
          -[CPColumnMaker averageSpacing:](self, "averageSpacing:", v15, v25);
          double v37 = v36;
          [(CPColumnMaker *)self averageSpacing:v16];
          double v39 = fmax(v37, v38);
          double v40 = 1.0;
          if (v39 > 20.0) {
            double v40 = v39 / 12.0 * 5.0 / 100.0 + 1.0;
          }
          if (vabdd_f64(v20, v28 + v32) > v40 * self->maxParagraphDistance
            && !-[CPColumnMaker closeImagesBetween:and:bounds:](self, "closeImagesBetween:and:bounds:", v15, [v10 objectAtIndex:i], v46, v45, v44, v43))
          {
            [(NSMutableArray *)self->columns addObject:v11];

            uint64_t v11 = objc_alloc_init(CPColumn);
          }
        }
      }
      -[CPChunk add:](v11, "add:", [v10 lastObject]);
      [(NSMutableArray *)self->columns addObject:v11];

      ++v4;
    }
    while (v4 != v41);
  }
}

- (double)averageSpacing:(id)a3
{
  unsigned int v4 = [a3 count];
  if (!v4) {
    return 0.0;
  }
  if (v4 == 1)
  {
    [a3 normalizedBounds];
    if (v7 < 0.0 || v8 < 0.0) {
      *(CGRect *)(&v8 - 3) = CGRectStandardize(*(CGRect *)&v5);
    }
  }
  else
  {
    uint64_t v9 = 0;
    unsigned int v10 = v4;
    uint64_t v11 = v4 - 1;
    double v12 = 0.0;
    do
    {
      uint64_t v13 = v9 + 1;
      objc_msgSend((id)objc_msgSend(a3, "childAtIndex:"), "baseline");
      double v15 = v14;
      objc_msgSend((id)objc_msgSend(a3, "childAtIndex:", v13), "baseline");
      double v12 = v12 + v15 - v16;
      uint64_t v9 = v13;
    }
    while (v11 != v13);
    return v12 / (double)v10;
  }
  return v8;
}

- (BOOL)closeImagesBetween:(id)a3 and:(id)a4 bounds:(CGRect)a5
{
  CGFloat r2_16 = a5.size.width;
  CGFloat r2_24 = a5.size.height;
  CGFloat r2_8 = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  [a3 normalizedBounds];
  uint64_t v11 = v10;
  double v67 = v13;
  double v68 = v12;
  double v15 = v14;
  [a4 normalizedBounds];
  uint64_t rect = v16;
  double rect_8 = v17;
  double rect_16 = v19;
  double rect_24 = v18;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  images = self->images;
  uint64_t v21 = [(NSMutableArray *)images countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (!v21) {
    goto LABEL_29;
  }
  uint64_t v22 = v21;
  uint64_t v61 = v11;
  double v62 = v15;
  uint64_t v23 = *(void *)v78;
  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = INFINITY;
  CGFloat r2 = INFINITY;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v78 != v23) {
        objc_enumerationMutation(images);
      }
      double v28 = *(void **)(*((void *)&v77 + 1) + 8 * i);
      objc_msgSend(v28, "bounds", v61);
      CGRect v85 = CGRectInset(v84, 2.0, 2.0);
      CGFloat v29 = v85.origin.x;
      CGFloat y = v85.origin.y;
      CGFloat width = v85.size.width;
      CGFloat height = v85.size.height;
      v85.origin.CGFloat x = x;
      v85.origin.CGFloat y = r2_8;
      v85.size.CGFloat width = r2_16;
      v85.size.CGFloat height = r2_24;
      v92.origin.CGFloat x = v29;
      v92.origin.CGFloat y = y;
      v92.size.CGFloat width = width;
      v92.size.CGFloat height = height;
      if (CGRectContainsRect(v85, v92))
      {
        [v9 addObject:v28];
        v86.origin.CGFloat x = v29;
        v86.origin.CGFloat y = y;
        v86.size.CGFloat width = width;
        v86.size.CGFloat height = height;
        v93.origin.CGFloat x = r2;
        v93.origin.CGFloat y = v26;
        v93.size.CGFloat width = v25;
        v93.size.CGFloat height = v24;
        CGRect v87 = CGRectUnion(v86, v93);
        CGFloat r2 = v87.origin.x;
        double v26 = v87.origin.y;
        double v25 = v87.size.width;
        double v24 = v87.size.height;
      }
    }
    uint64_t v22 = [(NSMutableArray *)images countByEnumeratingWithState:&v77 objects:v82 count:16];
  }
  while (v22);
  if (v25 == 0.0) {
    goto LABEL_29;
  }
  double v33 = v25;
  [v9 sortUsingSelector:sel_compareTopDescending_];
  uint64_t v34 = [v9 count];
  uint64_t v35 = 1;
  double v36 = v68;
  while (v34 != v35)
  {
    double v37 = (void *)[v9 objectAtIndex:v35 - 1];
    double v38 = (void *)[v9 objectAtIndex:v35];
    [v37 bottom];
    double v40 = v39;
    [v38 top];
    ++v35;
    if (v40 - v41 > self->maxParagraphDistance) {
      goto LABEL_29;
    }
  }
  double v42 = v67;
  if (v62 < 0.0 || v67 < 0.0)
  {
    uint64_t v43 = v61;
    double v44 = v62;
    double v45 = v68;
    CGRect v88 = CGRectStandardize(*(CGRect *)(&v42 - 3));
    double v36 = v88.origin.y;
  }
  if (v33 < 0.0 || v24 < 0.0)
  {
    v89.origin.CGFloat x = r2;
    v89.origin.CGFloat y = v26;
    v89.size.CGFloat width = v33;
    v89.size.CGFloat height = v24;
    CGRect v90 = CGRectStandardize(v89);
    double v46 = v36 - (v90.origin.y + v90.size.height);
    v90.origin.CGFloat x = r2;
    v90.origin.CGFloat y = v26;
    v90.size.CGFloat width = v33;
    v90.size.CGFloat height = v24;
    CGRect v91 = CGRectStandardize(v90);
    double v26 = v91.origin.y;
  }
  else
  {
    double v46 = v36 - (v26 + v24);
  }
  double v48 = rect_16;
  double v47 = rect_24;
  double v49 = rect_8;
  if (rect_8 < 0.0 || rect_16 < 0.0)
  {
    uint64_t v50 = rect;
    *(CGRect *)(&v47 - 1) = CGRectStandardize(*(CGRect *)(&v47 - 1));
  }
  double v51 = v47 + v48;
  double maxParagraphDistance = self->maxParagraphDistance;
  double v53 = v26 - v51;
  if (v46 < maxParagraphDistance && v53 < maxParagraphDistance)
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v57 = [v9 countByEnumeratingWithState:&v73 objects:v81 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v74 != v59) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v73 + 1) + 8 * j) setAnchoringParagraph:a3];
        }
        uint64_t v58 = [v9 countByEnumeratingWithState:&v73 objects:v81 count:16];
      }
      while (v58);
    }
    BOOL v55 = 1;
  }
  else
  {
LABEL_29:
    BOOL v55 = 0;
  }

  return v55;
}

- (void)callOuts
{
  unsigned int v3 = [(NSMutableArray *)self->paragraphWrappers count];
  if (v3 >= 2)
  {
    objc_msgSend(-[CPObject page](self->currentZone, "page"), "pageCropBox");
    CGFloat v8 = v7;
    double v9 = v4;
    CGFloat v10 = v5;
    CGFloat v11 = v6;
    uint64_t v12 = 0;
    BOOL v13 = v6 < 0.0 || v5 < 0.0;
    double v14 = v4 + v6;
    do
    {
      double v15 = (void *)[(NSMutableArray *)self->paragraphWrappers objectAtIndex:v12];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "paragraph"), "childAtIndex:", 0), "baseline");
      double v17 = v16;
      if (v13)
      {
        v73.origin.double x = v8;
        v73.origin.CGFloat y = v9;
        v73.size.double width = v10;
        v73.size.CGFloat height = v11;
        CGRect v74 = CGRectStandardize(v73);
        double v18 = v74.origin.y + v74.size.height - v17;
        v74.origin.double x = v8;
        v74.origin.CGFloat y = v9;
        v74.size.double width = v10;
        v74.size.CGFloat height = v11;
        CGRect v75 = CGRectStandardize(v74);
      }
      else
      {
        double v18 = v14 - v16;
        v75.size.CGFloat height = v11;
      }
      if (v18 > v75.size.height * 0.1) {
        break;
      }
      if (objc_msgSend((id)objc_msgSend(v15, "paragraph"), "count") == 1
        && ![v15 inOrder])
      {
        if (!CheckParagraphUnilined(v15)) {
          break;
        }
        [v15 dBelow];
        double v20 = v19;
        if (![v15 outOrder]) {
          goto LABEL_19;
        }
        if ((int)[v15 outOrder] >= 1)
        {
          objc_msgSend((id)objc_msgSend(v15, "paragraph"), "normalizedBounds");
          if (v23 < 0.0 || v24 < 0.0) {
            *(CGRect *)(&v24 - 3) = CGRectStandardize(*(CGRect *)&v21);
          }
          if (v20 > v24) {
LABEL_19:
          }
            [v15 setCalloutType:1];
        }
      }
      ++v12;
    }
    while (v3 != v12);
    uint64_t v25 = v3 - 1;
    do
    {
      double v26 = (void *)[(NSMutableArray *)self->paragraphWrappers objectAtIndex:v25];
      objc_msgSend((id)objc_msgSend(v26, "paragraph"), "normalizedBounds");
      if (v29 < 0.0 || v30 < 0.0) {
        *(CGRect *)(&v28 - 1) = CGRectStandardize(*(CGRect *)&v27);
      }
      double v31 = v28 + v30;
      if (v13)
      {
        v76.origin.double x = v8;
        v76.origin.CGFloat y = v9;
        v76.size.double width = v10;
        v76.size.CGFloat height = v11;
        CGRect v77 = CGRectStandardize(v76);
        double v32 = v31 - v77.origin.y;
        v77.origin.double x = v8;
        v77.origin.CGFloat y = v9;
        v77.size.double width = v10;
        v77.size.CGFloat height = v11;
        CGRect v78 = CGRectStandardize(v77);
      }
      else
      {
        double v32 = v31 - v9;
        v78.size.CGFloat height = v11;
      }
      if (v32 > v78.size.height * 0.1) {
        break;
      }
      if (objc_msgSend((id)objc_msgSend(v26, "paragraph"), "count") == 1
        && ![v26 outOrder])
      {
        [v26 dAbove];
        double v34 = v33;
        if (![v26 inOrder]) {
          goto LABEL_39;
        }
        if ((int)[v26 inOrder] >= 1)
        {
          objc_msgSend((id)objc_msgSend(v26, "paragraph"), "normalizedBounds");
          if (v37 < 0.0 || v38 < 0.0) {
            *(CGRect *)(&v38 - 3) = CGRectStandardize(*(CGRect *)&v35);
          }
          if (v34 > v38) {
            goto LABEL_39;
          }
        }
        if ((int)[v26 inOrder] > 1) {
          goto LABEL_39;
        }
        double v39 = objc_msgSend((id)objc_msgSend(v26, "paragraphsAbove"), "objectAtIndex:", 0);
        [v39 alignment];
        [v39 left];
        double v41 = v40;
        [v39 right];
        [v39 center];
        objc_msgSend((id)objc_msgSend(v26, "paragraph"), "left");
        double v43 = v42;
        objc_msgSend((id)objc_msgSend(v26, "paragraph"), "right");
        objc_msgSend((id)objc_msgSend(v26, "paragraph"), "center");
        if (vabdd_f64(v41, v43) > 1.0)
        {
LABEL_39:
          if (!CheckParagraphUnilined(v26)) {
            break;
          }
          [v26 setCalloutType:1];
        }
      }
      --v25;
    }
    while (v25);
    uint64_t v44 = 0;
    uint64_t v45 = v3;
    do
    {
      double v46 = (void *)[(NSMutableArray *)self->paragraphWrappers objectAtIndex:v44];
      if (![v46 calloutType])
      {
        if (![v46 inOrder] && objc_msgSend(v46, "outOrder") == 2)
        {
          objc_msgSend((id)objc_msgSend(v46, "paragraph"), "normalizedBounds");
          double v48 = v47;
          CGFloat rect = v49;
          double v51 = v50;
          double v53 = v52;
          [v46 belowBounds];
          double v55 = v54;
          CGFloat v57 = v56;
          double v59 = v58;
          double v61 = v60;
          BOOL v62 = v53 < 0.0 || v51 < 0.0;
          double v63 = v48;
          if (v62)
          {
            v79.origin.double x = v48;
            v79.origin.CGFloat y = rect;
            v79.size.double width = v51;
            v79.size.CGFloat height = v53;
            *(void *)&double v63 = (unint64_t)CGRectStandardize(v79);
          }
          BOOL v64 = v61 < 0.0 || v59 < 0.0;
          CGFloat v70 = v57;
          CGFloat v71 = v55;
          if (v64)
          {
            v80.origin.double x = v55;
            v80.origin.CGFloat y = v57;
            v80.size.double width = v59;
            v80.size.CGFloat height = v61;
            double v65 = COERCE_DOUBLE(CGRectStandardize(v80));
            v81.origin.CGFloat y = v57;
            double v66 = v63 - v65;
            v81.origin.double x = v55;
            v81.size.double width = v59;
            v81.size.CGFloat height = v61;
            CGRect v82 = CGRectStandardize(v81);
            double x = v82.origin.x;
            double width = v82.size.width;
            if (!v62) {
              goto LABEL_62;
            }
LABEL_61:
            v83.origin.double x = v48;
            v83.origin.CGFloat y = rect;
            v83.size.double width = v51;
            v83.size.CGFloat height = v53;
            CGRect v84 = CGRectStandardize(v83);
            double v48 = v84.origin.x;
            double v51 = v84.size.width;
          }
          else
          {
            double v66 = v63 - v55;
            double x = v55;
            double width = v59;
            if (v62) {
              goto LABEL_61;
            }
          }
LABEL_62:
          if (v66 >= 0.0)
          {
            double v69 = x + width - (v48 + v51);
            if (v69 >= 0.0)
            {
              if (v64)
              {
                v85.origin.CGFloat y = v70;
                v85.origin.double x = v71;
                v85.size.double width = v59;
                v85.size.CGFloat height = v61;
                CGRect v86 = CGRectStandardize(v85);
                double v59 = v86.size.width;
              }
              if (v66 + v69 > v59 * 0.5) {
                objc_msgSend(v46, "setCalloutType:", 2, v66 + v69);
              }
            }
          }
          goto LABEL_58;
        }
        [(CPColumnMaker *)self intersectionCallout:v46];
      }
LABEL_58:
      ++v44;
    }
    while (v45 != v44);
  }
}

- (void)intersectionCallout:(id)a3
{
  id v3 = a3;
  objc_msgSend((id)objc_msgSend(a3, "paragraph"), "normalizedBounds");
  CGFloat v44 = v5;
  double v45 = v6;
  CGFloat r1 = v7;
  double v9 = v8;
  [v3 area];
  double v40 = v10;
  unsigned int v11 = [(NSMutableArray *)self->paragraphWrappers count];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "paragraph"), "lastChild"), "baseline");
  uint64_t v13 = v11;
  if (v11)
  {
    double v14 = v12;
    uint64_t v15 = 0;
    double v16 = v45;
    BOOL v17 = v9 < 0.0 || v45 < 0.0;
    double v41 = v14;
    CGFloat v42 = v9;
    while (1)
    {
      double v18 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphWrappers, "objectAtIndex:", v15, v16);
      uint64_t v19 = [v18 paragraph];
      if (v19 != [v3 paragraph])
      {
        objc_msgSend((id)objc_msgSend(v18, "paragraph"), "normalizedBounds");
        CGFloat v24 = v20;
        double v25 = v21;
        CGFloat v26 = v22;
        double v27 = v23;
        BOOL v28 = v23 < 0.0 || v22 < 0.0;
        if (v28) {
          *(CGRect *)(&v21 - 1) = CGRectStandardize(*(CGRect *)&v20);
        }
        double v16 = v21 + v23;
        if (v21 + v23 > v14)
        {
          v49.origin.CGFloat x = v44;
          v49.size.double width = v45;
          v49.origin.CGFloat y = r1;
          v49.size.double height = v9;
          CGFloat v47 = v24;
          v57.origin.CGFloat x = v24;
          v57.origin.CGFloat y = v25;
          v57.size.double width = v26;
          v57.size.double height = v27;
          CGRect v50 = CGRectIntersection(v49, v57);
          CGFloat x = v50.origin.x;
          CGFloat y = v50.origin.y;
          double width = v50.size.width;
          double height = v50.size.height;
          [v18 area];
          double v43 = v33;
          if (width < 0.0 || height < 0.0)
          {
            v51.origin.CGFloat x = x;
            v51.origin.CGFloat y = y;
            v51.size.double width = width;
            v51.size.double height = height;
            CGRect v52 = CGRectStandardize(v51);
            double v34 = v52.size.width;
            v52.origin.CGFloat x = x;
            v52.origin.CGFloat y = y;
            v52.size.double width = width;
            v52.size.double height = height;
            CGRect v53 = CGRectStandardize(v52);
            double height = v53.size.height;
          }
          else
          {
            double v34 = width;
          }
          double v14 = v41;
          double v9 = v42;
          double v35 = v34 * height;
          double v16 = 1.0;
          if (v35 > 1.0)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "paragraph"), "lastChild"), "baseline");
            double v37 = v36;
            double v38 = r1;
            double v39 = v42;
            if (v17)
            {
              v54.origin.CGFloat x = v44;
              v54.size.double width = v45;
              v54.origin.CGFloat y = r1;
              v54.size.double height = v42;
              *(CGRect *)(&v38 - 1) = CGRectStandardize(v54);
            }
            double v16 = v38 + v39;
            if (v38 + v39 > v37)
            {
              if (v28)
              {
                v55.origin.CGFloat x = v47;
                v55.origin.CGFloat y = v25;
                v55.size.double width = v26;
                v55.size.double height = v27;
                CGRect v56 = CGRectStandardize(v55);
                double v25 = v56.origin.y;
                double v27 = v56.size.height;
              }
              double v16 = v25 + v27;
              if (v25 + v27 > v41)
              {
                double v16 = fmax(v40, v43) * 0.02;
                if (v35 > v16) {
                  break;
                }
              }
            }
          }
        }
      }
      if (v13 == ++v15) {
        return;
      }
    }
    if (v40 >= v43 * 0.25)
    {
      if (v43 >= v40 * 0.25 && (int)[v18 inOrder] <= 1)
      {
        if ((int)[v18 outOrder] > 1) {
          id v3 = v18;
        }
      }
      else
      {
        id v3 = v18;
      }
    }
    [v3 setCalloutType:3];
  }
}

- (BOOL)canSafelyAdd:(id)a3 to:(id)a4
{
  return 1;
}

- (BOOL)column:(id)a3 isLinkedBelowTo:(id)a4
{
  if (![a3 count] || !objc_msgSend(a4, "count")) {
    return 0;
  }
  uint64_t v7 = [a3 lastChild];

  return [(CPColumnMaker *)self paragraph:v7 isLinkedBelowTo:a4];
}

- (BOOL)paragraph:(id)a3 isLinkedBelowTo:(id)a4
{
  int v7 = [a4 count];
  if (v7)
  {
    int v8 = objc_msgSend((id)objc_msgSend(a3, "flowProperties"), "outOrder");
    int v9 = [a4 inOrder];
    LOBYTE(v7) = 0;
    if (v9 == 1 && v8 == 1) {
      LOBYTE(v7) = -[CPColumnMaker paragraphAbove:in:](self, "paragraphAbove:in:", [a4 firstChild], self->allParagraphs) == a3;
    }
  }
  return v7;
}

- (id)chunkAbove:(id)a3 in:(id)a4
{
  int v6 = [a4 count];
  if (!v6) {
    return 0;
  }
  [a3 bounds];
  double x = v7;
  CGFloat v12 = v8;
  double width = v9;
  CGFloat v14 = v10;
  if (v9 < 0.0 || v10 < 0.0)
  {
    CGRect v35 = CGRectStandardize(*(CGRect *)&v7);
    double v15 = v35.origin.y + v35.size.height;
    v35.origin.double x = x;
    v35.origin.CGFloat y = v12;
    v35.size.double width = width;
    v35.size.double height = v14;
    *(void *)&double v16 = (unint64_t)CGRectStandardize(v35);
    v36.origin.double x = x;
    v36.origin.CGFloat y = v12;
    v36.size.double width = width;
    v36.size.double height = v14;
    CGRect v37 = CGRectStandardize(v36);
    double x = v37.origin.x;
    double width = v37.size.width;
  }
  else
  {
    double v15 = v8 + v10;
    double v16 = v7;
  }
  if (v6 < 1) {
    return 0;
  }
  double v17 = x + width;
  uint64_t v18 = v6 + 1;
  while (1)
  {
    id v19 = (id)[a4 objectAtIndex:(v18 - 2)];
    int v20 = [v19 count];
    if (v19 != a3 && v20 != 0)
    {
      [v19 bounds];
      if (v24 < 0.0 || v25 < 0.0) {
        *(CGRect *)(&v23 - 1) = CGRectStandardize(*(CGRect *)&v22);
      }
      if (v23 - v15 >= -15.0)
      {
        objc_msgSend(v19, "bounds", v23 - v15);
        if (v28 < 0.0 || v29 < 0.0) {
          *(void *)&double v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v26);
        }
        if (v26 <= v17)
        {
          [v19 bounds];
          if (v32 < 0.0 || v33 < 0.0) {
            *(CGRect *)&double v30 = CGRectStandardize(*(CGRect *)&v30);
          }
          if (v30 + v32 >= v16) {
            break;
          }
        }
      }
    }
    if ((unint64_t)--v18 <= 1) {
      return 0;
    }
  }
  return v19;
}

- (id)paragraphAbove:(id)a3 in:(id)a4
{
  int v7 = [a4 count];
  if (!v7) {
    return 0;
  }
  [a3 normalizedBounds];
  double x = v8;
  CGFloat v13 = v9;
  double width = v10;
  CGFloat v15 = v11;
  if (v10 < 0.0 || v11 < 0.0)
  {
    double v16 = COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v8)) + -4.0;
    v30.origin.double x = x;
    v30.origin.CGFloat y = v13;
    v30.size.double width = width;
    v30.size.double height = v15;
    CGRect v31 = CGRectStandardize(v30);
    double x = v31.origin.x;
    double width = v31.size.width;
  }
  else
  {
    double v16 = v8 + -4.0;
  }
  if (v7 < 1) {
    return 0;
  }
  double v17 = x + width + 4.0;
  uint64_t v18 = v7 + 1;
  while (1)
  {
    id v19 = (id)[a4 objectAtIndex:(v18 - 2)];
    if (v19 != a3)
    {
      int v20 = v19;
      if (![(CPColumnMaker *)self paragraph:v19 isBelow:a3])
      {
        [v20 normalizedBounds];
        if (v23 < 0.0 || v24 < 0.0) {
          *(void *)&double v21 = (unint64_t)CGRectStandardize(*(CGRect *)&v21);
        }
        if (v21 <= v17)
        {
          [v20 normalizedBounds];
          if (v27 < 0.0 || v28 < 0.0) {
            *(CGRect *)&double v25 = CGRectStandardize(*(CGRect *)&v25);
          }
          if (v25 + v27 >= v16) {
            break;
          }
        }
      }
    }
    if ((unint64_t)--v18 <= 1) {
      return 0;
    }
  }
  return v20;
}

- (id)paragraphBelow:(id)a3 in:(id)a4
{
  uint64_t v7 = [a4 count];
  if (!v7) {
    return 0;
  }
  [a3 normalizedBounds];
  double x = v8;
  CGFloat v13 = v9;
  double width = v10;
  CGFloat v15 = v11;
  if (v10 < 0.0 || v11 < 0.0)
  {
    double v16 = COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v8)) + -4.0;
    v30.origin.double x = x;
    v30.origin.CGFloat y = v13;
    v30.size.double width = width;
    v30.size.double height = v15;
    CGRect v31 = CGRectStandardize(v30);
    double x = v31.origin.x;
    double width = v31.size.width;
  }
  else
  {
    double v16 = v8 + -4.0;
  }
  uint64_t v17 = 0;
  double v18 = x + width + 4.0;
  while (1)
  {
    id v19 = (id)[a4 objectAtIndex:v17];
    if (v19 != a3)
    {
      int v20 = v19;
      if (![(CPColumnMaker *)self paragraph:v19 isAbove:a3])
      {
        [v20 normalizedBounds];
        if (v23 < 0.0 || v24 < 0.0) {
          *(void *)&double v21 = (unint64_t)CGRectStandardize(*(CGRect *)&v21);
        }
        if (v21 <= v18)
        {
          [v20 normalizedBounds];
          if (v27 < 0.0 || v28 < 0.0) {
            *(CGRect *)&double v25 = CGRectStandardize(*(CGRect *)&v25);
          }
          if (v25 + v27 >= v16) {
            break;
          }
        }
      }
    }
    if (v7 == ++v17) {
      return 0;
    }
  }
  return v20;
}

- (BOOL)paragraph:(id)a3 isBelow:(id)a4
{
  int v6 = [a3 count];
  if (v6)
  {
    [a3 normalizedBounds];
    if (v9 < 0.0 || v10 < 0.0) {
      *(CGRect *)&double v7 = CGRectStandardize(*(CGRect *)&v7);
    }
    double v11 = v8 + v10;
    objc_msgSend((id)objc_msgSend(a4, "lastChild", v7), "baseline");
    LOBYTE(v6) = v11 < v12;
  }
  return v6;
}

- (BOOL)paragraph:(id)a3 isAbove:(id)a4
{
  int v6 = [a3 count];
  if (v6)
  {
    [a4 normalizedBounds];
    if (v9 < 0.0 || v10 < 0.0) {
      *(CGRect *)&double v7 = CGRectStandardize(*(CGRect *)&v7);
    }
    double v11 = v8 + v10;
    objc_msgSend((id)objc_msgSend(a3, "lastChild", v7), "baseline");
    LOBYTE(v6) = v12 > v11;
  }
  return v6;
}

- (BOOL)paragraph:(id)a3 notOnSameShapeAs:(id)a4
{
  uint64_t v7 = [(NSMutableArray *)self->otherShapes count];
  if (v7)
  {
    [a3 normalizedBounds];
    CGFloat v37 = v9;
    CGFloat v38 = v8;
    CGFloat v35 = v11;
    CGFloat v36 = v10;
    [a4 normalizedBounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    uint64_t v20 = 0;
    double v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = v7 - 1;
    while (1)
    {
      double v24 = (void *)[(NSMutableArray *)self->otherShapes objectAtIndex:v20];
      [v24 bounds];
      CGFloat v29 = v25;
      CGFloat v30 = v26;
      CGFloat v31 = v27;
      CGFloat v32 = v28;
      if (v22)
      {
        if (v21) {
          goto LABEL_5;
        }
      }
      else
      {
        v40.origin.CGFloat y = v37;
        v40.origin.double x = v38;
        v40.size.double height = v35;
        v40.size.double width = v36;
        if (CGRectContainsRect(*(CGRect *)&v25, v40)) {
          uint64_t v22 = v24;
        }
        else {
          uint64_t v22 = 0;
        }
        if (v21) {
          goto LABEL_5;
        }
      }
      v39.origin.double x = v29;
      v39.origin.CGFloat y = v30;
      v39.size.double width = v31;
      v39.size.double height = v32;
      v41.origin.double x = v13;
      v41.origin.CGFloat y = v15;
      v41.size.double width = v17;
      v41.size.double height = v19;
      if (CGRectContainsRect(v39, v41)) {
        double v21 = v24;
      }
      else {
        double v21 = 0;
      }
LABEL_5:
      if (v21) {
        BOOL v33 = v22 == 0;
      }
      else {
        BOOL v33 = 1;
      }
      if (v33)
      {
        BOOL v33 = v23 == v20++;
        if (!v33) {
          continue;
        }
      }
      return v22 != v21;
    }
  }
  return 0;
}

- (BOOL)cuttingShapeBetween:(id)a3 and:(id)a4
{
  uint64_t v7 = [(NSMutableArray *)self->thinHorizontalShapes count];
  if (v7)
  {
    [a3 normalizedBounds];
    double x = v8;
    double y = v10;
    double width = v12;
    double v15 = v14;
    [a4 normalizedBounds];
    double v17 = v16;
    CGFloat v19 = v18;
    double v21 = v20;
    double v23 = v22;
    CGFloat v54 = v15;
    CGFloat v56 = y;
    BOOL v24 = v15 < 0.0 || width < 0.0;
    if (v24)
    {
      v58.origin.double x = x;
      v58.size.double height = v15;
      v58.origin.double y = y;
      v58.size.double width = width;
      CGRect v59 = CGRectStandardize(v58);
      double y = v59.origin.y;
    }
    BOOL v25 = v23 < 0.0 || v21 < 0.0;
    CGFloat v26 = v19;
    double v27 = v23;
    if (v25)
    {
      v60.origin.double x = v17;
      v60.origin.double y = v19;
      v60.size.double width = v21;
      v60.size.double height = v23;
      *(CGRect *)(&v26 - 1) = CGRectStandardize(v60);
    }
    double v52 = v27;
    double v53 = v26;
    CGFloat rect = v19;
    double v28 = x;
    if (v24)
    {
      v61.origin.double x = x;
      v61.size.double height = v54;
      v61.origin.double y = v56;
      v61.size.double width = width;
      *(void *)&double v28 = (unint64_t)CGRectStandardize(v61);
    }
    double v29 = v17;
    if (v25)
    {
      v62.origin.double x = v17;
      v62.origin.double y = rect;
      v62.size.double width = v21;
      v62.size.double height = v23;
      *(void *)&double v29 = (unint64_t)CGRectStandardize(v62);
    }
    if (v24)
    {
      v63.origin.double x = x;
      v63.size.double height = v54;
      v63.origin.double y = v56;
      v63.size.double width = width;
      CGRect v64 = CGRectStandardize(v63);
      double x = v64.origin.x;
      double width = v64.size.width;
    }
    double v30 = fmin(v28, v29);
    double v31 = x + width;
    if (v25)
    {
      v65.origin.double x = v17;
      v65.origin.double y = rect;
      v65.size.double width = v21;
      v65.size.double height = v23;
      CGRect v66 = CGRectStandardize(v65);
      double v17 = v66.origin.x;
      double v21 = v66.size.width;
    }
    uint64_t v32 = 0;
    double v33 = v53 + v52;
    double v34 = fmax(v31, v17 + v21);
    double v55 = (v34 - v30) * 0.1;
    double v57 = v30;
    do
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->thinHorizontalShapes, "objectAtIndex:", v32), "bounds");
      double v39 = v35;
      CGFloat v40 = v36;
      CGFloat v41 = v37;
      CGFloat v42 = v38;
      if (v38 < 0.0 || v37 < 0.0)
      {
        CGRect v67 = CGRectStandardize(*(CGRect *)&v35);
        if (v67.origin.y + v67.size.height > y) {
          goto LABEL_56;
        }
        v68.origin.double x = v39;
        v68.origin.double y = v40;
        v68.size.double width = v41;
        v68.size.double height = v42;
        CGRect v69 = CGRectStandardize(v68);
        if (v69.origin.y + v69.size.height < v33) {
          goto LABEL_56;
        }
        v70.origin.double x = v39;
        v70.origin.double y = v40;
        v70.size.double width = v41;
        v70.size.double height = v42;
        CGRect v71 = CGRectStandardize(v70);
        if (v71.origin.y > y) {
          goto LABEL_56;
        }
        v72.origin.double x = v39;
        v72.origin.double y = v40;
        v72.size.double width = v41;
        v72.size.double height = v42;
        CGRect v73 = CGRectStandardize(v72);
        if (v73.origin.y < v33) {
          goto LABEL_56;
        }
        v74.origin.double x = v39;
        v74.origin.double y = v40;
        v74.size.double width = v41;
        v74.size.double height = v42;
        if (COERCE_DOUBLE(CGRectStandardize(v74)) >= v34) {
          goto LABEL_56;
        }
        v75.origin.double x = v39;
        v75.origin.double y = v40;
        v75.size.double width = v41;
        v75.size.double height = v42;
        CGRect v76 = CGRectStandardize(v75);
        if (v76.origin.x + v76.size.width <= v30) {
          goto LABEL_56;
        }
        v77.origin.double x = v39;
        v77.origin.double y = v40;
        v77.size.double width = v41;
        v77.size.double height = v42;
        CGRect v78 = CGRectStandardize(v77);
        double v48 = v78.origin.x + v78.size.width - v34;
        v78.origin.double x = v39;
        v78.origin.double y = v40;
        v78.size.double width = v41;
        v78.size.double height = v42;
        *(void *)&double v39 = (unint64_t)CGRectStandardize(v78);
      }
      else
      {
        BOOL v45 = v36 + v38 <= y && v36 + v38 >= v33 && v36 <= y;
        if (!v45 || v36 < v33) {
          goto LABEL_56;
        }
        if (v35 >= v34 || v35 + v37 <= v30) {
          goto LABEL_56;
        }
        double v48 = v35 + v37 - v34;
      }
      BOOL v45 = v48 <= v55;
      double v30 = v57;
      if (!v45 || v57 - v39 > v55) {
        return 1;
      }
LABEL_56:
      ++v32;
    }
    while (v7 != v32);
  }
  return 0;
}

- (void)partitionShapes:(id)a3
{
  self->thinHorizontalShapes = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  p_thinHorizontalShapes = &self->thinHorizontalShapes;
  self->otherShapes = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  p_otherShapes = &self->otherShapes;
  uint64_t v7 = [a3 count];
  if (v7)
  {
    for (uint64_t i = 0; v7 != i; ++i)
    {
      double v9 = (void *)[a3 objectAtIndex:i];
      [v9 bounds];
      CGFloat v14 = v10;
      CGFloat v15 = v11;
      double v16 = v12;
      double height = v13;
      if (v12 < 0.0 || v13 < 0.0)
      {
        CGRect v23 = CGRectStandardize(*(CGRect *)&v10);
        double v18 = (id *)p_thinHorizontalShapes;
        if (v23.size.height > 1.0)
        {
          v24.origin.double x = v14;
          v24.origin.double y = v15;
          v24.size.CGFloat width = v16;
          v24.size.double height = height;
          CGRect v25 = CGRectStandardize(v24);
          CGFloat width = v25.size.width;
          v25.origin.double x = v14;
          v25.origin.double y = v15;
          v25.size.CGFloat width = v16;
          v25.size.double height = height;
          CGRect v26 = CGRectStandardize(v25);
          double height = v26.size.height;
          double v16 = width;
LABEL_9:
          if (v16 / height > 4.0 || v16 / height == 0.0) {
            double v18 = (id *)p_thinHorizontalShapes;
          }
          else {
            double v18 = (id *)p_otherShapes;
          }
        }
      }
      else
      {
        double v18 = (id *)p_thinHorizontalShapes;
        if (v13 > 1.0) {
          goto LABEL_9;
        }
      }
      [*v18 addObject:v9];
    }
  }
  double v21 = *p_otherShapes;

  [(NSMutableArray *)v21 sortUsingSelector:sel_compareZDescending_];
}

- (BOOL)intervalOverlapLeft:(double)a3 right:(double)a4 paragraphs:(id)a5
{
  unint64_t v8 = [a5 count];
  if (v8)
  {
    uint64_t v9 = 0;
    BOOL v10 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v9), "normalizedBounds");
      double x = v11;
      CGFloat v16 = v12;
      double width = v13;
      CGFloat v18 = v14;
      if (v13 < 0.0 || v14 < 0.0)
      {
        *(void *)&double v19 = (unint64_t)CGRectStandardize(*(CGRect *)&v11);
        v22.origin.double x = x;
        v22.origin.double y = v16;
        v22.size.double width = width;
        v22.size.double height = v18;
        CGRect v23 = CGRectStandardize(v22);
        double x = v23.origin.x;
        double width = v23.size.width;
      }
      else
      {
        double v19 = v11;
      }
      if (x + width + 4.0 > a3 && v19 + -4.0 < a4) {
        break;
      }
      BOOL v10 = ++v9 < v8;
    }
    while (v8 != v9);
  }
  else
  {
    return 0;
  }
  return v10;
}

- (id)columns
{
  return self->columns;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPColumnMaker;
  [(CPColumnMaker *)&v3 dealloc];
}

- (CPColumnMaker)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPColumnMaker;
  CGRect result = [(CPColumnMaker *)&v3 init];
  if (result)
  {
    result->columns = 0;
    result->thinHorizontalShapes = 0;
    result->otherShapes = 0;
  }
  return result;
}

@end