@interface CHTransformedTextSegment
- (BoundingBox)boundingBox;
- (CGAffineTransform)transform;
- (CGPoint)anchorPoint;
- (CGPoint)insertionPoint;
- (CHTransformedTextSegment)initWithStrokes:(id)a3 tokens:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6 principalLines:(PrincipalLines *)a7 transform:(CGAffineTransform *)a8;
- (CHTransformedTextSegment)initWithStrokes:(id)a3 tokens:(id)a4 points:(const void *)a5 strokePoints:(const void *)a6 locale:(id)a7 strokeClassification:(int64_t)a8 principalLines:(PrincipalLines *)a9 transform:(CGAffineTransform *)a10;
- (NSArray)supportStrokeTokenRanges;
- (NSArray)supportStrokes;
- (NSArray)textStrokes;
- (NSArray)tokens;
- (NSLocale)locale;
- (PrincipalLines)principalLines;
- (double)lineHeight;
- (double)orientation;
- (id).cxx_construct;
- (id)splitIntoTokens;
- (id)string;
- (id)tokenDistanceSizes:(BOOL)a3;
- (id)tokenSupportRangeForTokenIndex:(int64_t)a3 supportStrokes:(id *)a4;
- (int64_t)strokeClassification;
- (vector<CGPoint,)clippedPoints:(CHTransformedTextSegment *)self min:(SEL)a3 max:(CGSize)a4;
- (vector<CGPoint,)filteredPoints:(CHTransformedTextSegment *)self;
- (vector<CGPoint,)points;
- (vector<std::vector<CGPoint>,)strokePoints;
- (void)addSupportStroke:(id)a3;
- (void)addSupportStroke:(id)a3 tokenRange:(_NSRange)a4;
- (void)addTransform:(CGAffineTransform *)a3;
- (void)mergeTransformedText:(id)a3;
@end

@implementation CHTransformedTextSegment

- (CHTransformedTextSegment)initWithStrokes:(id)a3 tokens:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6 principalLines:(PrincipalLines *)a7 transform:(CGAffineTransform *)a8
{
  id v44 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v22 = objc_msgSend_init(self, v17, v18, v19, v20, v21);
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)(v22 + 184), a3);
    objc_storeStrong((id *)(v23 + 192), a4);
    objc_storeStrong((id *)(v23 + 216), a5);
    *(void *)(v23 + 224) = a6;
    if ((PrincipalLines *)(v23 + 8) != a7)
    {
      sub_1C49B7D84((void *)(v23 + 8), (char *)a7->descender.__begin_, (char *)a7->descender.__end_, a7->descender.__end_ - a7->descender.__begin_);
      sub_1C49B7D84((void *)(v23 + 32), (char *)a7->base.__begin_, (char *)a7->base.__end_, a7->base.__end_ - a7->base.__begin_);
      sub_1C49B7D84((void *)(v23 + 56), (char *)a7->median.__begin_, (char *)a7->median.__end_, a7->median.__end_ - a7->median.__begin_);
      sub_1C49B7D84((void *)(v23 + 80), (char *)a7->top.__begin_, (char *)a7->top.__end_, a7->top.__end_ - a7->top.__begin_);
    }
    long long v24 = *(_OWORD *)&a8->a;
    long long v25 = *(_OWORD *)&a8->c;
    *(_OWORD *)(v23 + 264) = *(_OWORD *)&a8->tx;
    *(_OWORD *)(v23 + 248) = v25;
    *(_OWORD *)(v23 + 232) = v24;
    v26 = *(void **)(v23 + 200);
    uint64_t v27 = MEMORY[0x1E4F1CBF0];
    *(void *)(v23 + 200) = MEMORY[0x1E4F1CBF0];

    v28 = *(void **)(v23 + 208);
    *(void *)(v23 + 208) = v27;

    v30 = (void *)(v23 + 136);
    v29 = *(void **)(v23 + 136);
    if (v29)
    {
      *(void *)(v23 + 144) = v29;
      operator delete(v29);
      void *v30 = 0;
      *(void *)(v23 + 144) = 0;
      *(void *)(v23 + 152) = 0;
    }
    v31 = (void **)(v23 + 160);
    v32 = *(char **)(v23 + 160);
    void *v30 = 0;
    *(void *)(v23 + 144) = 0;
    *(void *)(v23 + 152) = 0;
    if (v32)
    {
      v33 = *(char **)(v23 + 168);
      v34 = v32;
      if (v33 != v32)
      {
        v35 = *(char **)(v23 + 168);
        do
        {
          v37 = (void *)*((void *)v35 - 3);
          v35 -= 24;
          v36 = v37;
          if (v37)
          {
            *((void *)v33 - 2) = v36;
            operator delete(v36);
          }
          v33 = v35;
        }
        while (v35 != v32);
        v34 = *v31;
      }
      *(void *)(v23 + 168) = v32;
      operator delete(v34);
      *v31 = 0;
      *(void *)(v23 + 168) = 0;
      *(void *)(v23 + 176) = 0;
    }
    *v31 = 0;
    *(void *)(v23 + 168) = 0;
    *(void *)(v23 + 176) = 0;
    v38 = (CGRect *)MEMORY[0x1E4F1DB28];
    CGFloat MinX = CGRectGetMinX(*MEMORY[0x1E4F1DB28]);
    CGFloat MaxX = CGRectGetMaxX(*v38);
    CGFloat MinY = CGRectGetMinY(*v38);
    CGFloat MaxY = CGRectGetMaxY(*v38);
    *(CGFloat *)(v23 + 104) = MinX;
    *(CGFloat *)(v23 + 112) = MaxX;
    *(CGFloat *)(v23 + 120) = MinY;
    *(CGFloat *)(v23 + 128) = MaxY;
  }

  return (CHTransformedTextSegment *)v23;
}

- (CHTransformedTextSegment)initWithStrokes:(id)a3 tokens:(id)a4 points:(const void *)a5 strokePoints:(const void *)a6 locale:(id)a7 strokeClassification:(int64_t)a8 principalLines:(PrincipalLines *)a9 transform:(CGAffineTransform *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  sub_1C4AAA458(v36, (uint64_t)a9);
  long long v19 = *(_OWORD *)&a10->c;
  v35[0] = *(_OWORD *)&a10->a;
  v35[1] = v19;
  v35[2] = *(_OWORD *)&a10->tx;
  uint64_t v21 = (CHTransformedTextSegment *)objc_msgSend_initWithStrokes_tokens_locale_strokeClassification_principalLines_transform_(self, v20, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, a8, v36, v35);
  if (__p)
  {
    v42 = __p;
    operator delete(__p);
  }
  if (v39)
  {
    v40 = v39;
    operator delete(v39);
  }
  if (v37)
  {
    v38 = v37;
    operator delete(v37);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v21)
  {
    if (&v21->_points != a5) {
      sub_1C49B7D84(&v21->_points.__begin_, *(char **)a5, *((char **)a5 + 1), (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 4);
    }
    if (&v21->_strokePoints != a6) {
      sub_1C4AAA66C((uint64_t)&v21->_strokePoints, *(char ***)a6, *((void *)a6 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 3));
    }
    p_x = &v21->_points.__begin_->x;
    end = v21->_points.__end_;
    if (p_x == (double *)end)
    {
      double v24 = 1.79769313e308;
      double v25 = -1.79769313e308;
      double v26 = -1.79769313e308;
      double v27 = 1.79769313e308;
    }
    else
    {
      double v24 = 1.79769313e308;
      double v25 = -1.79769313e308;
      double v26 = -1.79769313e308;
      double v27 = 1.79769313e308;
      double v28 = -1.79769313e308;
      double v29 = 1.79769313e308;
      double v30 = -1.79769313e308;
      double v31 = 1.79769313e308;
      do
      {
        double v32 = *p_x;
        double v33 = p_x[1];
        p_x += 2;
        if (v31 > v32)
        {
          double v27 = v32;
          double v31 = v32;
        }
        if (v30 < v32)
        {
          double v26 = v32;
          double v30 = v32;
        }
        if (v29 > v33)
        {
          double v24 = v33;
          double v29 = v33;
        }
        if (v28 < v33)
        {
          double v25 = v33;
          double v28 = v33;
        }
      }
      while (p_x != (double *)end);
    }
    v21->_boundingBox.x_min = v27;
    v21->_boundingBox.x_max = v26;
    v21->_boundingBox.y_min = v24;
    v21->_boundingBox.y_max = v25;
  }

  return v21;
}

- (void)addTransform:(CGAffineTransform *)a3
{
  p_principalLines = &self->_principalLines;
  CoreHandwriting::transformPrincipalLines((double **)&self->_principalLines, (float64x2_t *)a3, (uint64_t)&v56);
  if (p_principalLines != (PrincipalLines *)&v56)
  {
    sub_1C49B7D84(p_principalLines, v56, v57, (v57 - v56) >> 4);
    sub_1C49B7D84(&self->_principalLines.base.__begin_, v58, v59, (v59 - v58) >> 4);
    sub_1C49B7D84(&self->_principalLines.median.__begin_, v60, v61, (v61 - v60) >> 4);
    sub_1C49B7D84(&self->_principalLines.top.__begin_, v62, v63, (v63 - v62) >> 4);
  }
  objc_msgSend_points(self, v6, v7, v8, v9, v10);
  sub_1C4B4D480((double **)&__p, (float64x2_t *)a3, (float64x2_t **)&v50);
  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
    self->_points.__begin_ = 0;
    self->_points.__end_ = 0;
    self->_points.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&self->_points.__begin_ = *(_OWORD *)&v50.a;
  self->_points.__end_cap_.__value_ = *(CGPoint **)&v50.c;
  memset(&v50, 0, 24);
  if (__p)
  {
    v55 = (char *)__p;
    operator delete(__p);
  }
  objc_msgSend_strokePoints(self, v11, v12, v13, v14, v15);
  v51 = 0;
  v52 = 0;
  unint64_t v53 = 0;
  id v17 = (char *)__p;
  if (v55 != __p)
  {
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    do
    {
      sub_1C4B4D480((double **)&v17[v18], (float64x2_t *)a3, (float64x2_t **)&v50);
      uint64_t v20 = v52;
      if ((unint64_t)v52 < v53)
      {
        *(void *)v52 = 0;
        *((void *)v20 + 1) = 0;
        *((void *)v20 + 2) = 0;
        *(_OWORD *)uint64_t v20 = *(_OWORD *)&v50.a;
        *((void *)v20 + 2) = *(void *)&v50.c;
        v52 = v20 + 24;
      }
      else
      {
        v52 = sub_1C4AAA9E8((char **)&v51, (uint64_t)&v50);
        if (*(void *)&v50.a)
        {
          v50.b = v50.a;
          operator delete(*(void **)&v50.a);
        }
      }
      ++v19;
      id v17 = (char *)__p;
      v18 += 24;
    }
    while (v19 < 0xAAAAAAAAAAAAAAABLL * ((v55 - (unsigned char *)__p) >> 3));
  }
  if (&self->_strokePoints != (vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *)&v51) {
    sub_1C4AAA66C((uint64_t)&self->_strokePoints, (char **)v51, (uint64_t)v52, 0xAAAAAAAAAAAAAAABLL * ((v52 - (unsigned char *)v51) >> 3));
  }
  uint64_t v21 = self->_points.__begin_;
  end = self->_points.__end_;
  if (v21 == end)
  {
    double v23 = 1.79769313e308;
    double v24 = -1.79769313e308;
    double v25 = -1.79769313e308;
    double v26 = 1.79769313e308;
  }
  else
  {
    double v23 = 1.79769313e308;
    double v24 = -1.79769313e308;
    double v25 = -1.79769313e308;
    double v26 = 1.79769313e308;
    double v27 = -1.79769313e308;
    double v28 = 1.79769313e308;
    double v29 = -1.79769313e308;
    double v30 = 1.79769313e308;
    do
    {
      double x = v21->x;
      double y = v21->y;
      ++v21;
      if (v30 > x)
      {
        double v26 = x;
        double v30 = x;
      }
      if (v29 < x)
      {
        double v25 = x;
        double v29 = x;
      }
      if (v28 > y)
      {
        double v23 = y;
        double v28 = y;
      }
      if (v27 < y)
      {
        double v24 = y;
        double v27 = y;
      }
    }
    while (v21 != end);
  }
  self->_boundingBox.x_min = v26;
  self->_boundingBox.x_madouble x = v25;
  self->_boundingBox.y_min = v23;
  self->_boundingBox.y_madouble x = v24;
  long long v33 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v33;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_transform.tx;
  long long v34 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v48.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v48.c = v34;
  *(_OWORD *)&v48.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v50, &t1, &v48);
  long long v35 = *(_OWORD *)&v50.c;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&v50.a;
  *(_OWORD *)&self->_transform.c = v35;
  *(_OWORD *)&self->_transform.tdouble x = *(_OWORD *)&v50.tx;
  v36 = (char *)v51;
  if (v51)
  {
    v37 = v52;
    v38 = v51;
    if (v52 != v51)
    {
      v39 = v52;
      do
      {
        v41 = (void *)*((void *)v39 - 3);
        v39 -= 24;
        v40 = v41;
        if (v41)
        {
          *((void *)v37 - 2) = v40;
          operator delete(v40);
        }
        v37 = v39;
      }
      while (v39 != v36);
      v38 = v51;
    }
    v52 = v36;
    operator delete(v38);
  }
  v42 = (char *)__p;
  if (__p)
  {
    v43 = v55;
    id v44 = __p;
    if (v55 != __p)
    {
      v45 = v55;
      do
      {
        v47 = (void *)*((void *)v45 - 3);
        v45 -= 24;
        v46 = v47;
        if (v47)
        {
          *((void *)v43 - 2) = v46;
          operator delete(v46);
        }
        v43 = v45;
      }
      while (v45 != v42);
      id v44 = __p;
    }
    v55 = v42;
    operator delete(v44);
  }
  if (v62)
  {
    v63 = v62;
    operator delete(v62);
  }
  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }
}

- (void)addSupportStroke:(id)a3
{
  id v87 = a3;
  if (objc_msgSend_count(self->_tokens, v4, v5, v6, v7, v8) == 1)
  {
    objc_msgSend_addSupportStroke_tokenRange_(self, v9, (uint64_t)v87, 0, 1, v13);
  }
  else
  {
    objc_msgSend_bounds(v87, v9, v10, v11, v12, v13);
    CGFloat v89 = v14;
    double v90 = v15;
    CGFloat rect = v16;
    double v18 = v17;
    double v29 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v19, v20, v21, v22, v23);
    for (unint64_t i = 0; i < objc_msgSend_count(self->_tokens, v24, v25, v26, v27, v28); ++i)
    {
      v36 = objc_msgSend_objectAtIndexedSubscript_(self->_tokens, v31, i, v33, v34, v35);
      textStrokes = self->_textStrokes;
      v43 = objc_msgSend_strokeIndexes(v36, v38, v39, v40, v41, v42);
      CGAffineTransform v48 = objc_msgSend_objectsAtIndexes_(textStrokes, v44, (uint64_t)v43, v45, v46, v47);

      objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v49, (uint64_t)v48, v50, v51, v52);
      double v54 = v53;
      CGFloat v56 = v55;
      double v58 = v57;
      CGFloat v60 = v59;
      v92.origin.double x = v18;
      v92.origin.double y = v89;
      v92.size.width = v90;
      v92.size.height = rect;
      double MaxX = CGRectGetMaxX(v92);
      v93.origin.double x = v54;
      v93.origin.double y = v56;
      v93.size.width = v58;
      v93.size.height = v60;
      double v66 = fmin(MaxX, CGRectGetMaxX(v93)) - fmax(v18, v54);
      if (v66 / (v58 + 1.0e-10) > 0.2 || v66 / (v90 + 1.0e-10) > 0.2) {
        objc_msgSend_addIndex_(v29, v62, i, v63, v64, v65);
      }
    }
    if (objc_msgSend_count(v29, v31, v32, v33, v34, v35))
    {
      Indedouble x = objc_msgSend_firstIndex(v29, v67, v68, v69, v70, v71);
      uint64_t v78 = objc_msgSend_lastIndex(v29, v73, v74, v75, v76, v77);
      uint64_t v84 = objc_msgSend_firstIndex(v29, v79, v80, v81, v82, v83);
      objc_msgSend_addSupportStroke_tokenRange_(self, v85, (uint64_t)v87, Index, v78 - v84 + 1, v86);
    }
  }
}

- (void)addSupportStroke:(id)a3 tokenRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v35[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_msgSend_arrayByAddingObject_(self->_supportStrokes, v8, (uint64_t)v7, v9, v10, v11);
  uint64_t v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportStrokes = self->_supportStrokes;
  self->_supportStrokes = v12;

  supportStrokeTokenRanges = self->_supportStrokeTokenRanges;
  unint64_t v19 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, location, v16, v17, v18);
  v35[0] = v19;
  double v24 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, length, v21, v22, v23);
  v35[1] = v24;
  uint64_t v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v35, 2, v26, v27);
  objc_msgSend_arrayByAddingObject_(supportStrokeTokenRanges, v29, (uint64_t)v28, v30, v31, v32);
  uint64_t v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = self->_supportStrokeTokenRanges;
  self->_supportStrokeTokenRanges = v33;
}

- (id)tokenSupportRangeForTokenIndex:(int64_t)a3 supportStrokes:(id *)a4
{
  uint64_t v8 = objc_msgSend_indexSetWithIndex_(MEMORY[0x1E4F28E60], a2, a3, (uint64_t)a4, v4, v5);
  unint64_t v19 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v9, v10, v11, v12, v13);
  uint64_t v20 = 0;
  while (v20 != objc_msgSend_count(v8, v14, v15, v16, v17, v18))
  {
    uint64_t v20 = objc_msgSend_count(v8, v21, v22, v23, v24, v25);
    for (unint64_t i = 0; i < objc_msgSend_count(self->_supportStrokes, v26, v27, v28, v29, v30); ++i)
    {
      uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(self->_supportStrokeTokenRanges, v14, i, v16, v17, v18);
      if ((objc_msgSend_containsIndex_(v19, v33, i, v34, v35, v36) & 1) == 0)
      {
        uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(v32, v37, 0, v38, v39, v40);
        int v47 = objc_msgSend_intValue(v41, v42, v43, v44, v45, v46);
        uint64_t v52 = objc_msgSend_objectAtIndexedSubscript_(v32, v48, 1, v49, v50, v51);
        int v58 = objc_msgSend_intValue(v52, v53, v54, v55, v56, v57);
        int v62 = objc_msgSend_intersectsIndexesInRange_(v8, v59, v47, v58, v60, v61);

        if (v62)
        {
          objc_msgSend_addIndex_(v19, v63, i, v64, v65, v66);
          uint64_t v71 = objc_msgSend_objectAtIndexedSubscript_(v32, v67, 0, v68, v69, v70);
          int v77 = objc_msgSend_intValue(v71, v72, v73, v74, v75, v76);
          uint64_t v82 = objc_msgSend_objectAtIndexedSubscript_(v32, v78, 1, v79, v80, v81);
          int v88 = objc_msgSend_intValue(v82, v83, v84, v85, v86, v87);
          objc_msgSend_addIndexesInRange_(v8, v89, v77, v88, v90, v91);
        }
      }
    }
  }
  if (a4) {
    *a4 = v19;
  }

  return v8;
}

- (id)splitIntoTokens
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  id v120 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v125 = 0;
  v119 = v129;
  while (v125 < objc_msgSend_count(self->_tokens, v7, v8, v9, v10, v11))
  {
    id v173 = 0;
    uint64_t v15 = objc_msgSend_tokenSupportRangeForTokenIndex_supportStrokes_(self, v12, v125, (uint64_t)&v173, v13, v14);
    id v123 = v173;
    v124 = v15;
    uint64_t v121 = objc_msgSend_count(v15, v16, v17, v18, v19, v20);
    v122 = objc_msgSend_objectsAtIndexes_(self->_tokens, v21, (uint64_t)v15, v22, v23, v24);
    uint64_t v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
    v127 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v31, v32, v33, v34, v35);
    uint64_t v164 = 0;
    v165 = &v164;
    uint64_t v166 = 0x4812000000;
    v167 = sub_1C4AA2E80;
    v168 = sub_1C4AA2EA4;
    v169 = &unk_1C4CB5C62;
    v171 = 0;
    uint64_t v172 = 0;
    v170 = 0;
    uint64_t v155 = 0;
    v156 = (double **)&v155;
    uint64_t v157 = 0x4812000000;
    v158 = sub_1C4AA2F34;
    v159 = sub_1C4AA2F58;
    v160 = &unk_1C4CB5C62;
    v162 = 0;
    uint64_t v163 = 0;
    v161 = 0;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id obj = v122;
    uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v151, (uint64_t)v174, 16, v37);
    if (v43)
    {
      uint64_t v44 = *(void *)v152;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v152 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = *(void **)(*((void *)&v151 + 1) + 8 * i);
          uint64_t v47 = objc_msgSend_count(v30, v38, v39, v40, v41, v42);
          double v53 = objc_msgSend_strokeIndexes(v46, v48, v49, v50, v51, v52);
          v147[0] = MEMORY[0x1E4F143A8];
          v147[1] = 3221225472;
          v147[2] = sub_1C4AA2F70;
          v147[3] = &unk_1E64E35C8;
          v147[4] = self;
          id v148 = v30;
          v149 = &v164;
          v150 = &v155;
          objc_msgSend_enumerateIndexesUsingBlock_(v53, v54, (uint64_t)v147, v55, v56, v57);

          uint64_t v63 = objc_msgSend_mutableCopy(v46, v58, v59, v60, v61, v62);
          uint64_t v64 = (void *)MEMORY[0x1E4F28D60];
          uint64_t v70 = objc_msgSend_strokeIndexes(v46, v65, v66, v67, v68, v69);
          uint64_t v76 = objc_msgSend_count(v70, v71, v72, v73, v74, v75);
          uint64_t v80 = objc_msgSend_indexSetWithIndexesInRange_(v64, v77, v47, v76, v78, v79);
          objc_msgSend_setStrokeIndexes_(v63, v81, (uint64_t)v80, v82, v83, v84);

          objc_msgSend_addObject_(v127, v85, (uint64_t)v63, v86, v87, v88);
        }
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v151, (uint64_t)v174, 16, v42);
      }
      while (v43);
    }

    sub_1C4B52ADC((double **)&self->_principalLines, v156 + 6, (uint64_t)v140);
    CGFloat v89 = [CHTransformedTextSegment alloc];
    uint64_t v90 = v156;
    uint64_t v91 = v165;
    locale = self->_locale;
    int64_t strokeClassification = self->_strokeClassification;
    sub_1C4AAA458(v133, (uint64_t)v140);
    long long v94 = *(_OWORD *)&self->_transform.c;
    v132[0] = *(_OWORD *)&self->_transform.a;
    v132[1] = v94;
    v132[2] = *(_OWORD *)&self->_transform.tx;
    v101 = objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v89, v95, (uint64_t)v30, (uint64_t)v127, (uint64_t)(v90 + 6), (uint64_t)(v91 + 6), locale, strokeClassification, v133, v132, v119);
    if (__p)
    {
      v139 = __p;
      operator delete(__p);
    }
    if (v136)
    {
      v137 = v136;
      operator delete(v136);
    }
    if (v134)
    {
      v135 = v134;
      operator delete(v134);
    }
    if (v133[0])
    {
      v133[1] = v133[0];
      operator delete(v133[0]);
    }
    Indedouble x = objc_msgSend_firstIndex(v124, v96, v97, v98, v99, v100);
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v129[0] = sub_1C4AA31B8;
    v129[1] = &unk_1E64E1500;
    v129[2] = self;
    id v103 = v101;
    id v130 = v103;
    uint64_t v131 = Index;
    objc_msgSend_enumerateIndexesUsingBlock_(v123, v104, (uint64_t)v128, v105, v106, v107);
    objc_msgSend_addObject_(v120, v108, (uint64_t)v103, v109, v110, v111);

    if (v145)
    {
      v146 = v145;
      operator delete(v145);
    }
    if (v143)
    {
      v144 = v143;
      operator delete(v143);
    }
    if (v141)
    {
      v142 = v141;
      operator delete(v141);
    }
    if (v140[0])
    {
      v140[1] = v140[0];
      operator delete(v140[0]);
    }
    _Block_object_dispose(&v155, 8);
    if (v161)
    {
      v162 = v161;
      operator delete(v161);
    }
    _Block_object_dispose(&v164, 8);
    v112 = (char *)v170;
    if (v170)
    {
      v113 = v171;
      v114 = v170;
      if (v171 != v170)
      {
        v115 = v171;
        do
        {
          v117 = (void *)*((void *)v115 - 3);
          v115 -= 24;
          v116 = v117;
          if (v117)
          {
            *((void *)v113 - 2) = v116;
            operator delete(v116);
          }
          v113 = v115;
        }
        while (v115 != v112);
        v114 = v170;
      }
      v171 = v112;
      operator delete(v114);
    }

    v125 += v121;
  }
  return v120;
}

- (void)mergeTransformedText:(id)a3
{
  uint64_t v226 = *MEMORY[0x1E4F143B8];
  id v193 = a3;
  uint64_t v9 = objc_msgSend_count(self->_textStrokes, v4, v5, v6, v7, v8);
  textStrokes = self->_textStrokes;
  uint64_t v16 = objc_msgSend_textStrokes(v193, v11, v12, v13, v14, v15);
  objc_msgSend_arrayByAddingObjectsFromArray_(textStrokes, v17, (uint64_t)v16, v18, v19, v20);
  uint64_t v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = self->_textStrokes;
  self->_textStrokes = v21;

  uint64_t v194 = objc_msgSend_count(self->_tokens, v23, v24, v25, v26, v27);
  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  uint64_t v33 = objc_msgSend_tokens(v193, v28, v29, v30, v31, v32);
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v220, (uint64_t)v225, 16, v35);
  if (v41)
  {
    uint64_t v42 = *(void *)v221;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v221 != v42) {
          objc_enumerationMutation(v33);
        }
        uint64_t v44 = *(void **)(*((void *)&v220 + 1) + 8 * i);
        uint64_t v45 = objc_msgSend_strokeIndexes(v44, v36, v37, v38, v39, v40);
        uint64_t v51 = objc_msgSend_mutableCopy(v45, v46, v47, v48, v49, v50);

        objc_msgSend_shiftIndexesStartingAtIndex_by_(v51, v52, 0, v9, v53, v54);
        uint64_t v60 = objc_msgSend_mutableCopy(v44, v55, v56, v57, v58, v59);
        objc_msgSend_setStrokeIndexes_(v60, v61, (uint64_t)v51, v62, v63, v64);
        objc_msgSend_arrayByAddingObject_(self->_tokens, v65, (uint64_t)v60, v66, v67, v68);
        uint64_t v69 = (NSArray *)objc_claimAutoreleasedReturnValue();
        tokens = self->_tokens;
        self->_tokens = v69;
      }
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v220, (uint64_t)v225, 16, v40);
    }
    while (v41);
  }

  supportStrokes = self->_supportStrokes;
  int v77 = objc_msgSend_supportStrokes(v193, v72, v73, v74, v75, v76);
  objc_msgSend_arrayByAddingObjectsFromArray_(supportStrokes, v78, (uint64_t)v77, v79, v80, v81);
  uint64_t v82 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v83 = self->_supportStrokes;
  self->_supportStrokes = v82;

  CGFloat v89 = objc_msgSend_supportStrokeTokenRanges(v193, v84, v85, v86, v87, v88);
  v95 = objc_msgSend_mutableCopy(v89, v90, v91, v92, v93, v94);

  for (unint64_t j = 0; j < objc_msgSend_count(v95, v96, v97, v98, v99, v100); ++j)
  {
    uint64_t v106 = objc_msgSend_objectAtIndexedSubscript_(v95, v102, j, v103, v104, v105);
    uint64_t v107 = NSNumber;
    v112 = objc_msgSend_objectAtIndexedSubscript_(v106, v108, 0, v109, v110, v111);
    int v118 = objc_msgSend_intValue(v112, v113, v114, v115, v116, v117);
    id v123 = objc_msgSend_numberWithInteger_(v107, v119, v194 + v118, v120, v121, v122);
    v224[0] = v123;
    v128 = objc_msgSend_objectAtIndexedSubscript_(v106, v124, 1, v125, v126, v127);
    v224[1] = v128;
    v132 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v129, (uint64_t)v224, 2, v130, v131);
    objc_msgSend_setObject_atIndexedSubscript_(v95, v133, (uint64_t)v132, j, v134, v135);
  }
  objc_msgSend_arrayByAddingObjectsFromArray_(self->_supportStrokeTokenRanges, v102, (uint64_t)v95, v103, v104, v105);
  v136 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportStrokeTokenRanges = self->_supportStrokeTokenRanges;
  self->_supportStrokeTokenRanges = v136;

  objc_msgSend_points(self, v138, v139, v140, v141, v142);
  if (v193)
  {
    objc_msgSend_points(v193, v143, v144, v145, v146, v147);
    id v148 = (char *)v215;
    v149 = v216;
  }
  else
  {
    v149 = 0;
    id v148 = 0;
    v215 = 0;
    v216 = 0;
    uint64_t v217 = 0;
  }
  sub_1C4AAAD38((uint64_t)&v218, *(uint64_t *)v219, v148, v149, (v149 - v148) >> 4);
  if (&self->_points != (vector<CGPoint, std::allocator<CGPoint>> *)&v218) {
    sub_1C49B7D84(&self->_points.__begin_, (char *)v218, *(char **)v219, (uint64_t)(*(void *)v219 - (void)v218) >> 4);
  }
  objc_msgSend_strokePoints(self, v150, v151, v152, v153, v154);
  if (v193)
  {
    objc_msgSend_strokePoints(v193, v155, v156, v157, v158, v159);
    v160 = (char **)v210;
    uint64_t v161 = (uint64_t)v211;
  }
  else
  {
    uint64_t v161 = 0;
    v160 = 0;
    v210 = 0;
    v211 = 0;
    uint64_t v212 = 0;
  }
  sub_1C4AAAF6C((char ***)&v213, (uint64_t)v214, v160, v161, 0xAAAAAAAAAAAAAAABLL * ((v161 - (uint64_t)v160) >> 3));
  if (&self->_strokePoints != (vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *)&v213) {
    sub_1C4AAA66C((uint64_t)&self->_strokePoints, (char **)v213, (uint64_t)v214, 0xAAAAAAAAAAAAAAABLL * ((v214 - (unsigned char *)v213) >> 3));
  }
  v162 = (CGRect *)MEMORY[0x1E4F1DB28];
  double MinX = CGRectGetMinX(*MEMORY[0x1E4F1DB28]);
  double MaxX = CGRectGetMaxX(*v162);
  double MinY = CGRectGetMinY(*v162);
  double MaxY = CGRectGetMaxY(*v162);
  begin = self->_principalLines.base.__begin_;
  self->_boundingBox.x_min = MinX;
  self->_boundingBox.x_madouble x = MaxX;
  self->_boundingBox.y_min = MinY;
  self->_boundingBox.y_madouble x = MaxY;
  double x = begin->x;
  objc_msgSend_principalLines(v193, v169, v170, v171, v172, v173);
  double v179 = *(double *)v204;
  if (__p)
  {
    v209 = (char *)__p;
    operator delete(__p);
  }
  if (v206)
  {
    v207 = (char *)v206;
    operator delete(v206);
  }
  if (v204)
  {
    v205 = (char *)v204;
    operator delete(v204);
  }
  p_principalLines = &self->_principalLines;
  if (v202)
  {
    v203 = (char *)v202;
    operator delete(v202);
  }
  if (x >= v179)
  {
    objc_msgSend_principalLines(v193, v174, v175, v176, v177, v178);
    CoreHandwriting::merge_lines((CoreHandwriting *)v195, (const CoreHandwriting::PrincipalLines *)&self->_principalLines, (uint64_t)&v202);
    if (p_principalLines == (PrincipalLines *)&v202) {
      goto LABEL_34;
    }
  }
  else
  {
    objc_msgSend_principalLines(v193, v174, v175, v176, v177, v178);
    CoreHandwriting::merge_lines((CoreHandwriting *)&self->_principalLines, (const CoreHandwriting::PrincipalLines *)v195, (uint64_t)&v202);
    if (p_principalLines == (PrincipalLines *)&v202) {
      goto LABEL_34;
    }
  }
  sub_1C49B7D84(&self->_principalLines.descender.__begin_, (char *)v202, v203, (v203 - (unsigned char *)v202) >> 4);
  sub_1C49B7D84(&self->_principalLines.base.__begin_, (char *)v204, v205, (v205 - (unsigned char *)v204) >> 4);
  sub_1C49B7D84(&self->_principalLines.median.__begin_, (char *)v206, v207, (v207 - (unsigned char *)v206) >> 4);
  sub_1C49B7D84(&self->_principalLines.top.__begin_, (char *)__p, v209, (v209 - (unsigned char *)__p) >> 4);
LABEL_34:
  if (__p)
  {
    v209 = (char *)__p;
    operator delete(__p);
  }
  if (v206)
  {
    v207 = (char *)v206;
    operator delete(v206);
  }
  if (v204)
  {
    v205 = (char *)v204;
    operator delete(v204);
  }
  if (v202)
  {
    v203 = (char *)v202;
    operator delete(v202);
  }
  if (v200)
  {
    v201 = v200;
    operator delete(v200);
  }
  if (v198)
  {
    v199 = v198;
    operator delete(v198);
  }
  if (v196)
  {
    v197 = v196;
    operator delete(v196);
  }
  if (v195[0])
  {
    v195[1] = v195[0];
    operator delete(v195[0]);
  }
  v181 = (char *)v210;
  if (v210)
  {
    v182 = v211;
    v183 = v210;
    if (v211 != v210)
    {
      v184 = v211;
      do
      {
        v186 = (void *)*((void *)v184 - 3);
        v184 -= 24;
        v185 = v186;
        if (v186)
        {
          *((void *)v182 - 2) = v185;
          operator delete(v185);
        }
        v182 = v184;
      }
      while (v184 != v181);
      v183 = v210;
    }
    v211 = v181;
    operator delete(v183);
  }
  v187 = (char *)v213;
  if (v213)
  {
    v188 = v214;
    v189 = v213;
    if (v214 != v213)
    {
      v190 = v214;
      do
      {
        v192 = (void *)*((void *)v190 - 3);
        v190 -= 24;
        v191 = v192;
        if (v192)
        {
          *((void *)v188 - 2) = v191;
          operator delete(v191);
        }
        v188 = v190;
      }
      while (v190 != v187);
      v189 = v213;
    }
    v214 = v187;
    operator delete(v189);
  }
  if (v215)
  {
    v216 = (char *)v215;
    operator delete(v215);
  }
  if (v218)
  {
    *(void *)v219 = v218;
    operator delete(v218);
  }
}

- (id)tokenDistanceSizes:(BOOL)a3
{
  BOOL v123 = a3;
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, v3, v4, v5);
  if ((unint64_t)objc_msgSend_count(self->_tokens, v8, v9, v10, v11, v12) <= 1)
  {
    id v18 = v7;
    goto LABEL_125;
  }
  uint64_t v120 = objc_msgSend_splitIntoTokens(self, v13, v14, v15, v16, v17);
  uint64_t v24 = objc_msgSend_firstObject(v120, v19, v20, v21, v22, v23);
  uint64_t v30 = v24;
  if (v24)
  {
    objc_msgSend_principalLines(v24, v25, v26, v27, v28, v29);
  }
  else
  {
    *(_OWORD *)v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    *(_OWORD *)v137 = 0u;
    *(_OWORD *)__dst = 0u;
    *(_OWORD *)uint64_t v135 = 0u;
  }

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  uint64_t v36 = objc_msgSend_count(v120, v31, v32, v33, v34, v35);
  objc_msgSend_subarrayWithRange_(v120, v37, 1, v36 - 1, v38, v39);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v130, (uint64_t)v140, 16, v41);
  if (v47)
  {
    uint64_t v122 = *(void *)v131;
    uint64_t v48 = v7;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v131 != v122) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = *(void **)(*((void *)&v130 + 1) + 8 * i);
        uint64_t v51 = objc_msgSend_tokens(v50, v42, v43, v44, v45, v46);
        uint64_t v57 = objc_msgSend_firstObject(v51, v52, v53, v54, v55, v56);
        char v63 = objc_msgSend_properties(v57, v58, v59, v60, v61, v62);

        if (!v123 || (v63 & 0x20) != 0)
        {
          uint64_t v67 = (double *)v135[1];
          objc_msgSend_principalLines(v50, v42, v64, v44, v45, v46);
          double v73 = v67[2];
          double v74 = v67[3];
          double v76 = *(double *)v125[1];
          double v75 = *((double *)v125[1] + 1);
          if (__p[1])
          {
            v129 = (const char *)__p[1];
            operator delete(__p[1]);
          }
          if (v127[0])
          {
            v127[1] = v127[0];
            operator delete(v127[0]);
          }
          if (v125[1])
          {
            uint64_t v126 = (const char *)v125[1];
            operator delete(v125[1]);
          }
          if (v124[0])
          {
            v124[1] = v124[0];
            operator delete(v124[0]);
          }
          int v77 = objc_msgSend_numberWithDouble_(NSNumber, v68, v69, v70, v71, v72, sqrt((v74 - v75) * (v74 - v75) + (v73 - v76) * (v73 - v76)));
          objc_msgSend_addObject_(v48, v78, (uint64_t)v77, v79, v80, v81);
        }
        else if (!v50)
        {
          uint64_t v65 = 0;
          uint64_t v66 = 0;
          *(_OWORD *)__p = 0u;
          v129 = 0;
          uint64_t v126 = 0;
          *(_OWORD *)uint64_t v127 = 0u;
          *(_OWORD *)v124 = 0u;
          *(_OWORD *)uint64_t v125 = 0u;
          goto LABEL_26;
        }
        objc_msgSend_principalLines(v50, v42, v64, v44, v45, v46);
        uint64_t v65 = (const char *)v124[1];
        uint64_t v66 = (const char *)v124[0];
LABEL_26:
        size_t v82 = v65 - v66;
        unint64_t v83 = (v65 - v66) >> 4;
        uint64_t v84 = (uint64_t)v135[0];
        uint64_t v85 = (char *)__dst[0];
        if (v83 <= ((char *)v135[0] - (char *)__dst[0]) >> 4)
        {
          unint64_t v89 = ((char *)__dst[1] - (char *)__dst[0]) >> 4;
          if (v89 >= v83)
          {
            if (v65 == v66) {
              goto LABEL_46;
            }
            uint64_t v90 = __dst[0];
            uint64_t v42 = v66;
            goto LABEL_45;
          }
          if (__dst[1] != __dst[0])
          {
            memmove(__dst[0], v66, (char *)__dst[1] - (char *)__dst[0]);
            uint64_t v85 = (char *)__dst[1];
          }
          uint64_t v42 = &v66[16 * v89];
          size_t v82 = v65 - v42;
          if (v65 != v42)
          {
            uint64_t v90 = v85;
LABEL_45:
            memmove(v90, v42, v82);
          }
        }
        else
        {
          if (__dst[0])
          {
            __dst[1] = __dst[0];
            operator delete(__dst[0]);
            uint64_t v84 = 0;
            __dst[0] = 0;
            __dst[1] = 0;
            v135[0] = 0;
          }
          if ((v82 & 0x8000000000000000) != 0) {
            goto LABEL_128;
          }
          uint64_t v86 = v84 >> 3;
          if (v84 >> 3 <= v83) {
            uint64_t v86 = (v65 - v66) >> 4;
          }
          unint64_t v87 = (unint64_t)v84 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v86;
          if (v87 >> 60) {
LABEL_128:
          }
            sub_1C494A220();
          uint64_t v88 = (char *)operator new(16 * v87);
          uint64_t v85 = v88;
          __dst[0] = v88;
          __dst[1] = v88;
          v135[0] = &v88[16 * v87];
          if (v65 != v66) {
            memcpy(v88, v66, v65 - v66);
          }
        }
LABEL_46:
        __dst[1] = &v85[v82];
        size_t v91 = (char *)v126 - (char *)v125[1];
        unint64_t v92 = ((char *)v126 - (char *)v125[1]) >> 4;
        uint64_t v93 = *((void *)&v136 + 1);
        uint64_t v94 = (char *)v135[1];
        if (v92 <= (uint64_t)(*((void *)&v136 + 1) - (unint64_t)v135[1]) >> 4)
        {
          unint64_t v98 = (uint64_t)(v136 - (unint64_t)v135[1]) >> 4;
          if (v98 >= v92)
          {
            if (v126 == v125[1]) {
              goto LABEL_66;
            }
            uint64_t v99 = v135[1];
            uint64_t v42 = (const char *)v125[1];
            goto LABEL_65;
          }
          if ((void *)v136 != v135[1])
          {
            memmove(v135[1], v125[1], v136 - (unint64_t)v135[1]);
            uint64_t v94 = (char *)v136;
          }
          uint64_t v42 = (char *)v125[1] + 16 * v98;
          size_t v91 = v126 - v42;
          if (v126 != v42)
          {
            uint64_t v99 = v94;
LABEL_65:
            memmove(v99, v42, v91);
          }
        }
        else
        {
          if (v135[1])
          {
            *(void **)&long long v136 = v135[1];
            operator delete(v135[1]);
            uint64_t v93 = 0;
            v135[1] = 0;
            long long v136 = 0uLL;
          }
          if ((v91 & 0x8000000000000000) != 0) {
            goto LABEL_128;
          }
          uint64_t v95 = v93 >> 3;
          if (v93 >> 3 <= v92) {
            uint64_t v95 = ((char *)v126 - (char *)v125[1]) >> 4;
          }
          unint64_t v96 = (unint64_t)v93 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v95;
          if (v96 >> 60) {
            goto LABEL_128;
          }
          uint64_t v97 = (char *)operator new(16 * v96);
          uint64_t v94 = v97;
          v135[1] = v97;
          *(void *)&long long v136 = v97;
          *((void *)&v136 + 1) = &v97[16 * v96];
          if (v126 != v125[1]) {
            memcpy(v97, v125[1], v91);
          }
        }
LABEL_66:
        *(void *)&long long v136 = &v94[v91];
        size_t v100 = (char *)v127[1] - (char *)v127[0];
        unint64_t v101 = ((char *)v127[1] - (char *)v127[0]) >> 4;
        uint64_t v102 = (uint64_t)v138[0];
        uint64_t v103 = (char *)v137[0];
        if (v101 <= ((char *)v138[0] - (char *)v137[0]) >> 4)
        {
          unint64_t v107 = ((char *)v137[1] - (char *)v137[0]) >> 4;
          if (v107 >= v101)
          {
            if (v127[1] == v127[0]) {
              goto LABEL_86;
            }
            v108 = v137[0];
            uint64_t v42 = (const char *)v127[0];
            goto LABEL_85;
          }
          if (v137[1] != v137[0])
          {
            memmove(v137[0], v127[0], (char *)v137[1] - (char *)v137[0]);
            uint64_t v103 = (char *)v137[1];
          }
          uint64_t v42 = (char *)v127[0] + 16 * v107;
          size_t v100 = (char *)v127[1] - (char *)v42;
          if (v127[1] != v42)
          {
            v108 = v103;
LABEL_85:
            memmove(v108, v42, v100);
          }
        }
        else
        {
          if (v137[0])
          {
            v137[1] = v137[0];
            operator delete(v137[0]);
            uint64_t v102 = 0;
            v137[0] = 0;
            v137[1] = 0;
            v138[0] = 0;
          }
          if ((v100 & 0x8000000000000000) != 0) {
            goto LABEL_128;
          }
          uint64_t v104 = v102 >> 3;
          if (v102 >> 3 <= v101) {
            uint64_t v104 = ((char *)v127[1] - (char *)v127[0]) >> 4;
          }
          unint64_t v105 = (unint64_t)v102 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v104;
          if (v105 >> 60) {
            goto LABEL_128;
          }
          uint64_t v106 = (char *)operator new(16 * v105);
          uint64_t v103 = v106;
          v137[0] = v106;
          v137[1] = v106;
          v138[0] = &v106[16 * v105];
          if (v127[1] != v127[0]) {
            memcpy(v106, v127[0], v100);
          }
        }
LABEL_86:
        v137[1] = &v103[v100];
        size_t v109 = (char *)v129 - (char *)__p[1];
        unint64_t v110 = ((char *)v129 - (char *)__p[1]) >> 4;
        uint64_t v111 = *((void *)&v139 + 1);
        v112 = (char *)v138[1];
        if (v110 <= (uint64_t)(*((void *)&v139 + 1) - (unint64_t)v138[1]) >> 4)
        {
          size_t v43 = v139 - (unint64_t)v138[1];
          unint64_t v116 = (uint64_t)(v139 - (unint64_t)v138[1]) >> 4;
          if (v116 >= v110)
          {
            uint64_t v7 = v48;
            if (v129 == __p[1]) {
              goto LABEL_107;
            }
            uint64_t v117 = v138[1];
            uint64_t v42 = (const char *)__p[1];
            goto LABEL_106;
          }
          uint64_t v7 = v48;
          if ((void *)v139 != v138[1])
          {
            memmove(v138[1], __p[1], v43);
            v112 = (char *)v139;
          }
          uint64_t v42 = (char *)__p[1] + 16 * v116;
          size_t v109 = v129 - v42;
          if (v129 != v42)
          {
            uint64_t v117 = v112;
LABEL_106:
            memmove(v117, v42, v109);
          }
        }
        else
        {
          if (v138[1])
          {
            *(void **)&long long v139 = v138[1];
            operator delete(v138[1]);
            uint64_t v111 = 0;
            v138[1] = 0;
            long long v139 = 0uLL;
          }
          if ((v109 & 0x8000000000000000) != 0) {
            goto LABEL_128;
          }
          uint64_t v113 = v111 >> 3;
          if (v111 >> 3 <= v110) {
            uint64_t v113 = ((char *)v129 - (char *)__p[1]) >> 4;
          }
          unint64_t v114 = (unint64_t)v111 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v113;
          if (v114 >> 60) {
            goto LABEL_128;
          }
          uint64_t v115 = (char *)operator new(16 * v114);
          v112 = v115;
          v138[1] = v115;
          *(void *)&long long v139 = v115;
          *((void *)&v139 + 1) = &v115[16 * v114];
          if (v129 != __p[1]) {
            memcpy(v115, __p[1], v109);
          }
          uint64_t v7 = v48;
        }
LABEL_107:
        *(void *)&long long v139 = &v112[v109];
        if (__p[1])
        {
          v129 = (const char *)__p[1];
          operator delete(__p[1]);
        }
        if (v127[0])
        {
          v127[1] = v127[0];
          operator delete(v127[0]);
        }
        if (v125[1])
        {
          uint64_t v126 = (const char *)v125[1];
          operator delete(v125[1]);
        }
        if (v124[0])
        {
          v124[1] = v124[0];
          operator delete(v124[0]);
        }
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v130, (uint64_t)v140, 16, v46);
    }
    while (v47);
  }

  id v118 = v7;
  if (v138[1])
  {
    *(void **)&long long v139 = v138[1];
    operator delete(v138[1]);
  }
  if (v137[0])
  {
    v137[1] = v137[0];
    operator delete(v137[0]);
  }
  if (v135[1])
  {
    *(void **)&long long v136 = v135[1];
    operator delete(v135[1]);
  }
  if (__dst[0])
  {
    __dst[1] = __dst[0];
    operator delete(__dst[0]);
  }

LABEL_125:
  return v7;
}

- (id)string
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v2 = self->_tokens;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v28, (uint64_t)v32, 16, v4);
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
    uint64_t v12 = &stru_1F20141C8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v12;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v2);
        }
        uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        if ((objc_msgSend_properties(v15, v5, v6, v7, v8, v9, (void)v28) & 0x20) != 0)
        {
          uint64_t v21 = objc_msgSend_stringByAppendingString_(v14, v16, @" ", v18, v19, v20);

          uint64_t v14 = (void *)v21;
        }
        uint64_t v22 = objc_msgSend_string(v15, v16, v17, v18, v19, v20);
        objc_msgSend_stringByAppendingString_(v14, v23, (uint64_t)v22, v24, v25, v26);
        uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v13;
        uint64_t v14 = v12;
      }
      while (v10 != v13);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v28, (uint64_t)v32, 16, v9);
    }
    while (v10);
  }
  else
  {
    uint64_t v12 = &stru_1F20141C8;
  }

  return v12;
}

- (double)lineHeight
{
  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  objc_msgSend_principalLines(self, v7, v8, v9, v10, v11);
  uint64_t v12 = v28;
  if ((char *)v33 - (char *)v32 == (char *)v29 - (char *)v28)
  {
    BOOL v13 = v32 == v33 || v28 == v29;
    uint64_t v14 = v28;
    uint64_t v15 = v32;
    if (v13)
    {
LABEL_7:
      if (v15 == v33)
      {
        double v16 = 0.0;
        if (v14 == v29) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      uint64_t v15 = v32;
      uint64_t v14 = v28;
      while (*v15 == *v14 && v15[1] == v14[1])
      {
        v15 += 2;
        v14 += 2;
        if (v15 == v33 || v14 == v29) {
          goto LABEL_7;
        }
      }
    }
  }
  double v18 = *v32;
  double v17 = v32[1];
  double v19 = (v32[3] - v17) / (v32[2] - *v32);
  double v20 = v28[1];
  double v21 = (v28[3] - v20) / (v28[2] - *v28);
  double v22 = v20 - v21 * *v28;
  double v23 = *v32;
  if (v19 != 0.0) {
    double v23 = (v17 - -1.0 / v19 * v18 - v22) / (v21 - -1.0 / v19);
  }
  double v16 = sqrt((v17 - (v22 + v21 * v23)) * (v17 - (v22 + v21 * v23)) + (v18 - v23) * (v18 - v23));
LABEL_12:
  if (__p)
  {
    operator delete(__p);
    uint64_t v12 = v28;
  }
  if (v12) {
    operator delete(v12);
  }
  if (v27) {
    operator delete(v27);
  }
  if (v26) {
    operator delete(v26);
  }
  if (v35) {
    operator delete(v35);
  }
  if (v34) {
    operator delete(v34);
  }
  if (v32) {
    operator delete(v32);
  }
  if (v31) {
    operator delete(v31);
  }
  return v16;
}

- (CGPoint)anchorPoint
{
  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  double v13 = *v22;
  double v12 = v22[1];
  if (__p) {
    operator delete(__p);
  }
  if (v23) {
    operator delete(v23);
  }
  if (v22) {
    operator delete(v22);
  }
  if (v21) {
    operator delete(v21);
  }
  if (objc_msgSend_strokeClassification(self, v7, v8, v9, v10, v11) == 2)
  {
    objc_msgSend_principalLines(self, v14, v15, v16, v17, v18);
    double v13 = v22[2];
    double v12 = v22[3];
    if (__p) {
      operator delete(__p);
    }
    if (v23) {
      operator delete(v23);
    }
    if (v22) {
      operator delete(v22);
    }
    if (v21) {
      operator delete(v21);
    }
  }
  double v19 = v13;
  double v20 = v12;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (CGPoint)insertionPoint
{
  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  double v13 = v22[2];
  double v12 = v22[3];
  if (__p) {
    operator delete(__p);
  }
  if (v23) {
    operator delete(v23);
  }
  if (v22) {
    operator delete(v22);
  }
  if (v21) {
    operator delete(v21);
  }
  if (objc_msgSend_strokeClassification(self, v7, v8, v9, v10, v11) == 2)
  {
    objc_msgSend_principalLines(self, v14, v15, v16, v17, v18);
    double v13 = *v22;
    double v12 = v22[1];
    if (__p) {
      operator delete(__p);
    }
    if (v23) {
      operator delete(v23);
    }
    if (v22) {
      operator delete(v22);
    }
    if (v21) {
      operator delete(v21);
    }
  }
  double v19 = v13;
  double v20 = v12;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (double)orientation
{
  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  objc_msgSend_principalLines(self, v7, v8, v9, v10, v11);
  double v12 = v18[2];
  double v13 = v18[3];
  double v14 = *v22;
  double v15 = v22[1];
  if (__p) {
    operator delete(__p);
  }
  if (v19) {
    operator delete(v19);
  }
  if (v18) {
    operator delete(v18);
  }
  if (v17) {
    operator delete(v17);
  }
  if (v24) {
    operator delete(v24);
  }
  if (v23) {
    operator delete(v23);
  }
  if (v22) {
    operator delete(v22);
  }
  if (v21) {
    operator delete(v21);
  }
  return -atan2(v13 - v15, v12 - v14);
}

- (vector<CGPoint,)points
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_points.__end_ == v4->_points.__begin_)
  {
    CoreHandwriting::getPointSet(v4->_textStrokes, v13);
    sub_1C4B4D480((double **)v13, (float64x2_t *)&v4->_transform, (float64x2_t **)&__p);
    if (&v4->_points != (vector<CGPoint, std::allocator<CGPoint>> *)&__p) {
      sub_1C49B7D84(&v4->_points.__begin_, (char *)__p, v12, (v12 - (unsigned char *)__p) >> 4);
    }
    if (__p)
    {
      double v12 = (char *)__p;
      operator delete(__p);
    }
    if (v13[0])
    {
      v13[1] = v13[0];
      operator delete(v13[0]);
    }
  }
  objc_sync_exit(v4);

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = v4->_points.__begin_;
  end = v4->_points.__end_;
  int64_t v8 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v8 < 0) {
      sub_1C494A220();
    }
    uint64_t v9 = (CGPoint *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v9;
    uint64_t v10 = &v9[v8 >> 4];
    retstr->__end_cap_.__value_ = v10;
    CGPoint result = (vector<CGPoint, std::allocator<CGPoint>> *)memcpy(v9, begin, v8);
    retstr->__end_ = v10;
  }
  return result;
}

- (vector<std::vector<CGPoint>,)strokePoints
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  p_strokePoints = (char **)&v4->_strokePoints;
  uint64_t v32 = retstr;
  if (v4->_strokePoints.__end_ == v4->_strokePoints.__begin_)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v4->_textStrokes;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v38, (uint64_t)v43, 16, v7);
    if (v11)
    {
      uint64_t v12 = *(void *)v39;
      p_transform = (float64x2_t *)&v4->_transform;
      uint64_t v33 = v4;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v42 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          double v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)&v42, 1, v9, v10);
          CoreHandwriting::getPointSet(v15, v37);

          sub_1C4B4D480((double **)v37, p_transform, (float64x2_t **)&__p);
          end = v4->_strokePoints.__end_;
          if (end >= v4->_strokePoints.__end_cap_.__value_)
          {
            uint64_t v25 = sub_1C4AAAB38(p_strokePoints, (uint64_t)&__p);
          }
          else
          {
            uint64_t v17 = v11;
            uint64_t v18 = p_transform;
            uint64_t v19 = v12;
            double v20 = p_strokePoints;
            void *end = 0;
            end[1] = 0;
            end[2] = 0;
            double v21 = __p;
            int64_t v22 = v36 - (unsigned char *)__p;
            if (v36 != __p)
            {
              if (v22 < 0) {
                sub_1C494A220();
              }
              double v23 = (char *)operator new(v36 - (unsigned char *)__p);
              void *end = v23;
              end[1] = v23;
              uint64_t v24 = &v23[16 * (v22 >> 4)];
              end[2] = v24;
              memcpy(v23, v21, v22);
              end[1] = v24;
              retstr = v32;
            }
            uint64_t v25 = (char *)(end + 3);
            v33->_strokePoints.__end_ = end + 3;
            p_strokePoints = v20;
            uint64_t v12 = v19;
            p_transform = v18;
            uint64_t v11 = v17;
            uint64_t v4 = v33;
          }
          v4->_strokePoints.__end_ = v25;
          if (__p)
          {
            uint64_t v36 = __p;
            operator delete(__p);
          }
          if (v37[0])
          {
            v37[1] = v37[0];
            operator delete(v37[0]);
          }
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v38, (uint64_t)v43, 16, v10);
      }
      while (v11);
    }
  }
  objc_sync_exit(v4);

  retstr->__end_cap_.__value_ = 0;
  p_end_cap = &retstr->__end_cap_;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  uint64_t begin = (uint64_t)v4->_strokePoints.__begin_;
  uint64_t v27 = (uint64_t)v4->_strokePoints.__end_;
  CGPoint result = (vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *)(v27 - begin);
  if (v27 != begin)
  {
    unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)result >> 3);
    if (v30 >= 0xAAAAAAAAAAAAAABLL) {
      sub_1C494A220();
    }
    long long v31 = operator new((size_t)result);
    v32->__begin_ = v31;
    v32->__end_ = v31;
    v32->__end_cap_.__value_ = &v31[3 * v30];
    CGPoint result = (vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *)sub_1C4AAA8E4((uint64_t)p_end_cap, begin, v27, v31);
    v32->__end_ = result;
  }
  return result;
}

- (vector<CGPoint,)filteredPoints:(CHTransformedTextSegment *)self
{
  textStrokes = self->_textStrokes;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1C4AA51C4;
  v44[3] = &unk_1E64E35F0;
  v44[4] = self;
  CGSize v45 = a4;
  uint64_t v10 = objc_msgSend_indexesOfObjectsPassingTest_(textStrokes, a3, (uint64_t)v44, v4, v5, v6);
  if (!objc_msgSend_count(v10, v11, v12, v13, v14, v15))
  {
    double v21 = (void *)MEMORY[0x1E4F28D60];
    uint64_t v22 = objc_msgSend_count(self->_textStrokes, v16, v17, v18, v19, v20);
    uint64_t v26 = objc_msgSend_indexSetWithIndexesInRange_(v21, v23, 0, v22, v24, v25);

    uint64_t v10 = (void *)v26;
  }
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x4812000000;
  long long v38 = sub_1C4AA2F34;
  long long v39 = sub_1C4AA2F58;
  long long v40 = &unk_1C4CB5C62;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  __p = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C4AA5268;
  v34[3] = &unk_1E64E1C58;
  v34[4] = self;
  v34[5] = &v35;
  objc_msgSend_enumerateIndexesUsingBlock_(v10, v16, (uint64_t)v34, v18, v19, v20);
  uint64_t v27 = v36;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  long long v29 = (unsigned char *)v27[6];
  long long v28 = (unsigned char *)v27[7];
  int64_t v30 = v28 - v29;
  if (v28 != v29)
  {
    if (v30 < 0) {
      sub_1C494A220();
    }
    long long v31 = (CGPoint *)operator new(v28 - v29);
    retstr->__begin_ = v31;
    uint64_t v32 = &v31[v30 >> 4];
    retstr->__end_cap_.__value_ = v32;
    memcpy(v31, v29, v30);
    retstr->__end_ = v32;
  }
  _Block_object_dispose(&v35, 8);
  if (__p)
  {
    uint64_t v42 = __p;
    operator delete(__p);
  }

  return result;
}

- (vector<CGPoint,)clippedPoints:(CHTransformedTextSegment *)self min:(SEL)a3 max:(CGSize)a4
{
  double y = a6.y;
  double x = a6.x;
  double v12 = a5.y;
  double v13 = a5.x;
  double height = a4.height;
  double width = a4.width;
  uint64_t v17 = 0;
  unint64_t v18 = 0;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  double v98 = sqrt((a5.y - a6.y) * (a5.y - a6.y) + (a5.x - a6.x) * (a5.x - a6.x));
  while (1)
  {
    CGPoint result = (vector<CGPoint, std::allocator<CGPoint>> *)objc_msgSend_count(self->_textStrokes, a3, v6, v7, v8, v9);
    if (v18 >= (unint64_t)result) {
      return result;
    }
    uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(self->_textStrokes, v20, v18, v21, v22, v23);
    objc_msgSend_strokePoints(self, v25, v26, v27, v28, v29);
    int64_t v30 = (double *)__p;
    long long v31 = (char *)__p + 24 * v18;
    uint64_t v103 = 0;
    uint64_t v104 = 0;
    uint64_t v102 = 0;
    uint64_t v33 = *(unsigned char **)v31;
    uint64_t v32 = (unsigned char *)*((void *)v31 + 1);
    int64_t v34 = v32 - v33;
    if (v32 != v33)
    {
      if (v34 < 0) {
        sub_1C494A220();
      }
      uint64_t v102 = operator new(v32 - v33);
      uint64_t v103 = v102;
      uint64_t v35 = (char *)v102 + 16 * (v34 >> 4);
      uint64_t v104 = v35;
      memcpy(v102, v33, v34);
      uint64_t v103 = v35;
    }
    uint64_t v36 = v101;
    uint64_t v37 = v30;
    if (v101 != v30)
    {
      long long v38 = v101;
      do
      {
        long long v40 = (void *)*((void *)v38 - 3);
        v38 -= 3;
        long long v39 = v40;
        if (v40)
        {
          *((void *)v36 - 2) = v39;
          operator delete(v39);
        }
        uint64_t v36 = v38;
      }
      while (v38 != v30);
      uint64_t v37 = __p;
    }
    unint64_t v101 = v30;
    operator delete(v37);
    objc_msgSend_bounds(v24, v41, v42, v43, v44, v45);
    if (v51 * self->_transform.a > width
      || (objc_msgSend_bounds(v24, v46, v47, v48, v49, v50), v52 * self->_transform.d > height))
    {
      objc_msgSend_orientation(self, v46, v47, v48, v49, v50);
      long double v54 = tan(v53);
      sub_1C4B48FE8((double **)&v102, (uint64_t *)&__p, -v54, v13, v12, x, y);
      uint64_t v60 = (double *)v102;
      if (v102 == v103)
      {
        double v62 = -1.79769313e308;
        double v61 = 1.79769313e308;
      }
      else
      {
        double v61 = 1.79769313e308;
        double v62 = -1.79769313e308;
        do
        {
          double v63 = *v60;
          v60 += 2;
          double v64 = v63;
          if (v61 > v63) {
            double v61 = v64;
          }
          if (v62 < v64) {
            double v62 = v64;
          }
        }
        while (v60 != v103);
      }
      objc_msgSend_orientation(self, v55, v56, v57, v58, v59);
      double v71 = cos(v65);
      double v73 = (double *)__p;
      uint64_t v72 = v101;
      if (v101 != __p)
      {
        double v74 = v62 - v61;
        double v75 = 1.79769313e308;
        double v76 = -1.79769313e308;
        double v77 = v74 / v71;
        do
        {
          double v78 = *v73;
          v73 += 2;
          double v79 = v78;
          if (v75 > v78) {
            double v75 = v79;
          }
          if (v76 < v79) {
            double v76 = v79;
          }
        }
        while (v73 != v101);
        objc_msgSend_orientation(self, v66, v67, v68, v69, v70);
        double v81 = (v76 - v75) / cos(v80);
        if (v81 <= 0.0)
        {
          uint64_t v72 = (double *)__p;
        }
        else
        {
          BOOL v82 = v81 / v77 < 0.8 && v81 / v98 < 0.5;
          uint64_t v72 = (double *)__p;
          if (!v82 && v101 != __p)
          {
            unint64_t v84 = 0;
            uint64_t v85 = v17;
            while (1)
            {
              uint64_t v86 = (CGPoint *)&v72[2 * v84];
              value = retstr->__end_cap_.__value_;
              if (v85 >= value) {
                break;
              }
              CGPoint *v85 = *v86;
              uint64_t v17 = v85 + 1;
LABEL_41:
              retstr->__end_ = v17;
              ++v84;
              uint64_t v72 = (double *)__p;
              uint64_t v85 = v17;
              if (v84 >= ((char *)v101 - (unsigned char *)__p) >> 4) {
                goto LABEL_59;
              }
            }
            uint64_t begin = retstr->__begin_;
            uint64_t v89 = v85 - retstr->__begin_;
            unint64_t v90 = v89 + 1;
            if ((unint64_t)(v89 + 1) >> 60) {
              sub_1C494A220();
            }
            uint64_t v91 = (char *)value - (char *)begin;
            if (v91 >> 3 > v90) {
              unint64_t v90 = v91 >> 3;
            }
            if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v92 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v92 = v90;
            }
            if (v92)
            {
              if (v92 >> 60) {
                sub_1C4949AA8();
              }
              uint64_t v93 = (char *)operator new(16 * v92);
              uint64_t v94 = (uint64_t)&v93[16 * v89];
              *(CGPoint *)uint64_t v94 = *v86;
              uint64_t v95 = (CGPoint *)v94;
              if (v85 == begin) {
                goto LABEL_52;
              }
              do
              {
LABEL_55:
                v95[-1] = v85[-1];
                --v95;
                --v85;
              }
              while (v85 != begin);
              uint64_t v85 = retstr->__begin_;
              uint64_t v97 = (CGPoint *)&v93[16 * v92];
              uint64_t v17 = (CGPoint *)(v94 + 16);
              retstr->__begin_ = v95;
              retstr->__end_ = (CGPoint *)(v94 + 16);
              retstr->__end_cap_.__value_ = v97;
              if (!v85) {
                goto LABEL_41;
              }
            }
            else
            {
              uint64_t v93 = 0;
              uint64_t v94 = 16 * v89;
              *(CGPoint *)(16 * v89) = *v86;
              uint64_t v95 = (CGPoint *)(16 * v89);
              if (v85 != begin) {
                goto LABEL_55;
              }
LABEL_52:
              unint64_t v96 = (CGPoint *)&v93[16 * v92];
              uint64_t v17 = (CGPoint *)(v94 + 16);
              retstr->__begin_ = v95;
              retstr->__end_ = (CGPoint *)(v94 + 16);
              retstr->__end_cap_.__value_ = v96;
              if (!v85) {
                goto LABEL_41;
              }
            }
            operator delete(v85);
            goto LABEL_41;
          }
        }
      }
LABEL_59:
      if (v72)
      {
        unint64_t v101 = v72;
        operator delete(v72);
      }
    }
    if (v102)
    {
      uint64_t v103 = v102;
      operator delete(v102);
    }

    ++v18;
  }
}

- (BoundingBox)boundingBox
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_boundingBox.x_max - v2->_boundingBox.x_min == 0.0)
  {
    objc_msgSend_points(v2, v3, v4, v5, v6, v7);
    if (v23 == v24)
    {
      double v8 = 1.79769313e308;
      double v9 = -1.79769313e308;
      double v10 = -1.79769313e308;
      double v11 = 1.79769313e308;
      if (!v23) {
        goto LABEL_15;
      }
    }
    else
    {
      double v8 = 1.79769313e308;
      double v9 = -1.79769313e308;
      double v10 = -1.79769313e308;
      double v11 = 1.79769313e308;
      double v12 = -1.79769313e308;
      double v13 = 1.79769313e308;
      double v14 = -1.79769313e308;
      double v15 = 1.79769313e308;
      uint64_t v16 = v23;
      do
      {
        double v17 = *v16;
        double v18 = v16[1];
        v16 += 2;
        if (v15 > v17)
        {
          double v11 = v17;
          double v15 = v17;
        }
        if (v14 < v17)
        {
          double v10 = v17;
          double v14 = v17;
        }
        if (v13 > v18)
        {
          double v8 = v18;
          double v13 = v18;
        }
        if (v12 < v18)
        {
          double v9 = v18;
          double v12 = v18;
        }
      }
      while (v16 != v24);
      if (!v23) {
        goto LABEL_15;
      }
    }
    operator delete(v23);
LABEL_15:
    v2->_boundingBox.double x_min = v11;
    v2->_boundingBox.x_madouble x = v10;
    v2->_boundingBox.double y_min = v8;
    v2->_boundingBox.y_madouble x = v9;
  }
  objc_sync_exit(v2);

  double x_min = v2->_boundingBox.x_min;
  x_madouble x = v2->_boundingBox.x_max;
  double y_min = v2->_boundingBox.y_min;
  y_madouble x = v2->_boundingBox.y_max;
  result.y_madouble x = y_max;
  result.double y_min = y_min;
  result.x_madouble x = x_max;
  result.double x_min = x_min;
  return result;
}

- (PrincipalLines)principalLines
{
  return (PrincipalLines *)sub_1C4AAA458(retstr, (uint64_t)&self->_principalLines);
}

- (int64_t)strokeClassification
{
  return self->_strokeClassification;
}

- (NSArray)textStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (NSArray)supportStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (NSArray)supportStrokeTokenRanges
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 216, 1);
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[5].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[5].d;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_supportStrokeTokenRanges, 0);
  objc_storeStrong((id *)&self->_supportStrokes, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_textStrokes, 0);
  uint64_t begin = (char *)self->_strokePoints.__begin_;
  if (begin)
  {
    end = (char *)self->_strokePoints.__end_;
    uint64_t v5 = self->_strokePoints.__begin_;
    if (end != begin)
    {
      uint64_t v6 = (char *)self->_strokePoints.__end_;
      do
      {
        double v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        uint64_t v7 = v8;
        if (v8)
        {
          *((void *)end - 2) = v7;
          operator delete(v7);
        }
        end = v6;
      }
      while (v6 != begin);
      uint64_t v5 = self->_strokePoints.__begin_;
    }
    self->_strokePoints.__end_ = begin;
    operator delete(v5);
  }
  double v9 = self->_points.__begin_;
  if (v9)
  {
    self->_points.__end_ = v9;
    operator delete(v9);
  }
  double v10 = self->_principalLines.top.__begin_;
  if (v10)
  {
    self->_principalLines.top.__end_ = v10;
    operator delete(v10);
  }
  double v11 = self->_principalLines.median.__begin_;
  if (v11)
  {
    self->_principalLines.median.__end_ = v11;
    operator delete(v11);
  }
  double v12 = self->_principalLines.base.__begin_;
  if (v12)
  {
    self->_principalLines.base.__end_ = v12;
    operator delete(v12);
  }
  double v13 = self->_principalLines.descender.__begin_;
  if (v13)
  {
    self->_principalLines.descender.__end_ = v13;
    operator delete(v13);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 104) = xmmword_1C4C3B2A0;
  *(_OWORD *)((char *)self + 120) = xmmword_1C4C3B2A0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  return self;
}

@end