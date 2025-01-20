@interface CHTransformedTextLine
+ (PrincipalLines)principalLinesFromSegments:(SEL)a3;
- (BOOL)fromCachedTokens;
- (BoundingBox)boundingBox;
- (CHTransformedTextLine)initWithSegment:(id)a3;
- (CHTransformedTextLine)initWithSegments:(id)a3;
- (CHTransformedTextLine)initWithStrokes:(id)a3 tokens:(id)a4 points:(const void *)a5 strokePoints:(const void *)a6 locale:(id)a7 strokeClassification:(int64_t)a8 principalLines:(PrincipalLines *)a9 transform:(CGAffineTransform *)a10;
- (NSArray)segments;
- (PrincipalLines)principalLines;
- (id).cxx_construct;
- (id)locale;
- (id)splitIntoTokens;
- (id)string;
- (id)textStrokes;
- (id)tokenDistanceSizes:(BOOL)a3;
- (id)tokens;
- (int64_t)strokeClassification;
- (vector<CGPoint,)clippedPoints:(CHTransformedTextLine *)self min:(SEL)a3 max:(CGSize)a4;
- (vector<CGPoint,)filteredPoints:(CHTransformedTextLine *)self;
- (vector<CGPoint,)points;
- (vector<std::vector<CGPoint>,)strokePoints;
- (void)_addTextLineSegment:(id)a3;
- (void)addSupportStroke:(id)a3;
- (void)addSupportStroke:(id)a3 tokenRange:(_NSRange)a4;
- (void)addTransform:(CGAffineTransform *)a3;
- (void)mergeTransformedText:(id)a3;
- (void)setFromCachedTokens:(BOOL)a3;
@end

@implementation CHTransformedTextLine

- (CHTransformedTextLine)initWithStrokes:(id)a3 tokens:(id)a4 points:(const void *)a5 strokePoints:(const void *)a6 locale:(id)a7 strokeClassification:(int64_t)a8 principalLines:(PrincipalLines *)a9 transform:(CGAffineTransform *)a10
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  v22 = (CHTransformedTextLine *)objc_msgSend_init(self, v17, v18, v19, v20, v21);
  if (v22)
  {
    v23 = [CHTransformedTextSegment alloc];
    sub_1C4AAA458(v33, (uint64_t)a9);
    long long v24 = *(_OWORD *)&a10->c;
    v32[0] = *(_OWORD *)&a10->a;
    v32[1] = v24;
    v32[2] = *(_OWORD *)&a10->tx;
    v30 = objc_msgSend_initWithStrokes_tokens_locale_strokeClassification_principalLines_transform_(v23, v25, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, a8, v33, v32);
    if (__p)
    {
      v39 = __p;
      operator delete(__p);
    }
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
    if (v34)
    {
      v35 = v34;
      operator delete(v34);
    }
    if (v33[0])
    {
      v33[1] = v33[0];
      operator delete(v33[0]);
    }
    v22 = (CHTransformedTextLine *)(id)objc_msgSend_initWithSegment_(v22, v26, (uint64_t)v30, v27, v28, v29);
  }
  return v22;
}

- (CHTransformedTextLine)initWithSegment:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = objc_msgSend_init(self, v5, v6, v7, v8, v9);
  if (!v13) {
    goto LABEL_16;
  }
  v39[0] = v4;
  uint64_t v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v39, 1, v11, v12);
  id v15 = *(void **)(v13 + 424);
  *(void *)(v13 + 424) = v14;

  *(void *)(v13 + 408) = objc_msgSend_strokeClassification(v4, v16, v17, v18, v19, v20);
  if (v4)
  {
    objc_msgSend_principalLines(v4, v21, v22, v23, v24, v25);
    v26 = (void *)(v13 + 280);
    if ((void **)(v13 + 280) == v33) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *(_OWORD *)__p = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  *(_OWORD *)v36 = 0u;
  *(_OWORD *)v33 = 0u;
  *(_OWORD *)v34 = 0u;
  v26 = (void *)(v13 + 280);
  if ((void **)(v13 + 280) != v33)
  {
LABEL_6:
    sub_1C49B7D84(v26, (char *)v33[0], (char *)v33[1], ((char *)v33[1] - (char *)v33[0]) >> 4);
    sub_1C49B7D84(v26 + 3, (char *)v34[1], (char *)v35, (uint64_t)(v35 - (unint64_t)v34[1]) >> 4);
    sub_1C49B7D84(v26 + 6, (char *)v36[0], (char *)v36[1], ((char *)v36[1] - (char *)v36[0]) >> 4);
    sub_1C49B7D84(v26 + 9, (char *)__p[1], (char *)v38, (uint64_t)(v38 - (unint64_t)__p[1]) >> 4);
  }
LABEL_7:
  if (__p[1])
  {
    *(void **)&long long v38 = __p[1];
    operator delete(__p[1]);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v34[1])
  {
    *(void **)&long long v35 = v34[1];
    operator delete(v34[1]);
  }
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  uint64_t v27 = (CGRect *)MEMORY[0x1E4F1DB28];
  CGFloat MinX = CGRectGetMinX(*MEMORY[0x1E4F1DB28]);
  CGFloat MaxX = CGRectGetMaxX(*v27);
  CGFloat MinY = CGRectGetMinY(*v27);
  CGFloat MaxY = CGRectGetMaxY(*v27);
  *(CGFloat *)(v13 + 376) = MinX;
  *(CGFloat *)(v13 + 384) = MaxX;
  *(CGFloat *)(v13 + 392) = MinY;
  *(CGFloat *)(v13 + 400) = MaxY;
  *(unsigned char *)(v13 + 416) = 0;
LABEL_16:

  return (CHTransformedTextLine *)v13;
}

- (CHTransformedTextLine)initWithSegments:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v11 = objc_msgSend_init(self, v6, v7, v8, v9, v10);
  uint64_t v12 = (CHTransformedTextLine *)v11;
  if (!v11) {
    goto LABEL_25;
  }
  objc_storeStrong((id *)(v11 + 424), a3);
  uint64_t v13 = objc_opt_class();
  if (v13)
  {
    objc_msgSend_principalLinesFromSegments_(v13, v14, (uint64_t)v5, v16, v17, v18);
    p_principalLines = &v12->_principalLines;
    if (&v12->_principalLines == (PrincipalLines *)v62) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *(_OWORD *)__p = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  *(_OWORD *)v65 = 0u;
  *(_OWORD *)v62 = 0u;
  *(_OWORD *)v63 = 0u;
  p_principalLines = &v12->_principalLines;
  if (&v12->_principalLines != (PrincipalLines *)v62)
  {
LABEL_6:
    sub_1C49B7D84(p_principalLines, (char *)v62[0], (char *)v62[1], ((char *)v62[1] - (char *)v62[0]) >> 4);
    sub_1C49B7D84(&p_principalLines->base.__begin_, (char *)v63[1], (char *)v64, (uint64_t)(v64 - (unint64_t)v63[1]) >> 4);
    sub_1C49B7D84(&p_principalLines->median.__begin_, (char *)v65[0], (char *)v65[1], ((char *)v65[1] - (char *)v65[0]) >> 4);
    sub_1C49B7D84(&p_principalLines->top.__begin_, (char *)__p[1], (char *)v67, (uint64_t)(v67 - (unint64_t)__p[1]) >> 4);
  }
LABEL_7:
  if (__p[1])
  {
    *(void **)&long long v67 = __p[1];
    operator delete(__p[1]);
  }
  if (v65[0])
  {
    v65[1] = v65[0];
    operator delete(v65[0]);
  }
  if (v63[1])
  {
    *(void **)&long long v64 = v63[1];
    operator delete(v63[1]);
  }
  if (v62[0])
  {
    v62[1] = v62[0];
    operator delete(v62[0]);
  }
  uint64_t v20 = objc_msgSend_set(MEMORY[0x1E4F28BD0], v14, v15, v16, v17, v18);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v21 = v5;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v58, (uint64_t)v68, 16, v23);
  if (v29)
  {
    uint64_t v30 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v59 != v30) {
          objc_enumerationMutation(v21);
        }
        v32 = NSNumber;
        uint64_t v33 = objc_msgSend_strokeClassification(*(void **)(*((void *)&v58 + 1) + 8 * i), v24, v25, v26, v27, v28, (void)v58);
        long long v38 = objc_msgSend_numberWithInteger_(v32, v34, v33, v35, v36, v37);
        objc_msgSend_addObject_(v20, v39, (uint64_t)v38, v40, v41, v42);
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v58, (uint64_t)v68, 16, v28);
    }
    while (v29);
  }

  v12->_strokeClassification = 1;
  unint64_t v47 = objc_msgSend_countForObject_(v20, v43, (uint64_t)&unk_1F203ECA0, v44, v45, v46);
  if (v47 < objc_msgSend_countForObject_(v20, v48, (uint64_t)&unk_1F203ECB8, v49, v50, v51)) {
    v12->_strokeClassification = 2;
  }
  v52 = (CGRect *)MEMORY[0x1E4F1DB28];
  CGFloat MinX = CGRectGetMinX(*MEMORY[0x1E4F1DB28]);
  CGFloat MaxX = CGRectGetMaxX(*v52);
  CGFloat MinY = CGRectGetMinY(*v52);
  CGFloat MaxY = CGRectGetMaxY(*v52);
  v12->_boundingBox.x_min = MinX;
  v12->_boundingBox.x_max = MaxX;
  v12->_boundingBox.y_min = MinY;
  v12->_boundingBox.y_max = MaxY;
  v12->_fromCachedTokens = 0;

LABEL_25:
  return v12;
}

- (id)string
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = self->_segments;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v21, (uint64_t)v25, 16, v4);
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    uint64_t v12 = &stru_1F20141C8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v12;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v2);
        }
        uint64_t v15 = objc_msgSend_string(*(void **)(*((void *)&v21 + 1) + 8 * v13), v5, v6, v7, v8, v9, (void)v21);
        objc_msgSend_stringByAppendingString_(v14, v16, (uint64_t)v15, v17, v18, v19);
        uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v13;
        uint64_t v14 = v12;
      }
      while (v10 != v13);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v21, (uint64_t)v25, 16, v9);
    }
    while (v10);
  }
  else
  {
    uint64_t v12 = &stru_1F20141C8;
  }

  return v12;
}

- (void)addSupportStroke:(id)a3 tokenRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v132 = a3;
  NSUInteger v133 = 0;
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  NSUInteger v14 = 0;
  NSUInteger v131 = length;
  NSUInteger v134 = location;
  NSUInteger v15 = location + length;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (v12 >= objc_msgSend_count(self->_segments, v7, v8, v9, v10, v11, v131)) {
      break;
    }
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(self->_segments, v7, v12, v9, v10, v11);
      long long v23 = objc_msgSend_tokens(v17, v18, v19, v20, v21, v22);
      NSUInteger v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28) + v14;

      if (v29 <= location)
      {
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        NSUInteger v133 = v14;
        unint64_t v13 = 1;
        uint64_t v16 = v12;
      }
    }
    else
    {
      ++v13;
    }
    uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(self->_segments, v7, v12, v9, v10, v11);
    uint64_t v36 = objc_msgSend_tokens(v30, v31, v32, v33, v34, v35);
    v14 += objc_msgSend_count(v36, v37, v38, v39, v40, v41);

    ++v12;
  }
  while (v14 <= v15);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL && v13 >= 2)
  {
    uint64_t v42 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v43 = objc_msgSend_count(self->_segments, v7, v8, v9, v10, v11);
    objc_msgSend_arrayWithCapacity_(v42, v44, v43 - v13 + 1, v45, v46, v47);
    v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
    segments = self->_segments;
    v53 = objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x1E4F28D60], v50, 0, v16, v51, v52);
    long long v58 = objc_msgSend_objectsAtIndexes_(segments, v54, (uint64_t)v53, v55, v56, v57);
    objc_msgSend_addObjectsFromArray_(v48, v59, (uint64_t)v58, v60, v61, v62);

    v71 = objc_msgSend_objectAtIndex_(self->_segments, v63, v16, v64, v65, v66);
    unint64_t v72 = v16 + v13;
    unint64_t v73 = v16 + 1;
    if (v73 < v72)
    {
      unint64_t v74 = v13 - 1;
      do
      {
        v75 = objc_msgSend_objectAtIndexedSubscript_(self->_segments, v67, v73, v68, v69, v70);
        objc_msgSend_mergeTransformedText_(v71, v76, (uint64_t)v75, v77, v78, v79);

        ++v73;
        --v74;
      }
      while (v74);
    }
    objc_msgSend_addObject_(v48, v67, (uint64_t)v71, v68, v69, v70);
    id v80 = v71;
    v81 = self->_segments;
    v82 = (void *)MEMORY[0x1E4F28D60];
    uint64_t v88 = objc_msgSend_count(v81, v83, v84, v85, v86, v87);
    v92 = objc_msgSend_indexSetWithIndexesInRange_(v82, v89, v72, v88 - v72, v90, v91);
    v97 = objc_msgSend_objectsAtIndexes_(v81, v93, (uint64_t)v92, v94, v95, v96);
    objc_msgSend_addObjectsFromArray_(v48, v98, (uint64_t)v97, v99, v100, v101);

    v102 = self->_segments;
    self->_segments = v48;

    uint64_t v109 = v131;
    v108 = v132;
    if (!v80) {
      goto LABEL_26;
    }
LABEL_18:
    v110 = objc_msgSend_tokens(v80, v103, v104, v105, v106, v107);
    unint64_t v116 = objc_msgSend_count(v110, v111, v112, v113, v114, v115);

    if (v134 - v133 + v109 > v116)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v119 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT))
      {
        v125 = objc_msgSend_tokens(v80, v120, v121, v122, v123, v124);
        *(_DWORD *)buf = 134218496;
        NSUInteger v136 = v134 - v133;
        __int16 v137 = 2048;
        uint64_t v138 = v109;
        __int16 v139 = 2048;
        uint64_t v140 = objc_msgSend_count(v125, v126, v127, v128, v129, v130);
        _os_log_impl(&dword_1C492D000, v119, OS_LOG_TYPE_FAULT, "Token range in segment defined as (%ld, %ld), incompatible with segment containing %ld tokens.", buf, 0x20u);
      }
    }
    objc_msgSend_addSupportStroke_tokenRange_(v80, v117, (uint64_t)v108, v134 - v133, v109, v118);
    goto LABEL_26;
  }
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v80 = 0;
    v108 = v132;
    goto LABEL_26;
  }
  v108 = v132;
  objc_msgSend_objectAtIndexedSubscript_(self->_segments, v7, v16, v9, v10, v11);
  id v80 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v109 = v131;
  if (v80) {
    goto LABEL_18;
  }
LABEL_26:
}

- (void)addSupportStroke:(id)a3
{
  id v139 = a3;
  if (objc_msgSend_count(self->_segments, v4, v5, v6, v7, v8) == 1)
  {
    NSUInteger v14 = objc_msgSend_objectAtIndexedSubscript_(self->_segments, v9, 0, v11, v12, v13);
    objc_msgSend_addSupportStroke_(v14, v15, (uint64_t)v139, v16, v17, v18);
    goto LABEL_22;
  }
  objc_msgSend_bounds(v139, v9, v10, v11, v12, v13);
  CGFloat v141 = v19;
  double v142 = v20;
  CGFloat rect = v21;
  double v23 = v22;
  NSUInteger v14 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v24, v25, v26, v27, v28);
  for (unint64_t i = 0; i < objc_msgSend_count(self->_segments, v29, v30, v31, v32, v33); ++i)
  {
    uint64_t v40 = objc_msgSend_objectAtIndexedSubscript_(self->_segments, v35, i, v37, v38, v39);
    uint64_t v46 = objc_msgSend_textStrokes(v40, v41, v42, v43, v44, v45);
    objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v47, (uint64_t)v46, v48, v49, v50);
    double v52 = v51;
    CGFloat v54 = v53;
    double v56 = v55;
    CGFloat v58 = v57;

    v144.origin.x = v23;
    v144.origin.y = v141;
    v144.size.width = v142;
    v144.size.height = rect;
    double MaxX = CGRectGetMaxX(v144);
    v145.origin.x = v52;
    v145.origin.y = v54;
    v145.size.width = v56;
    v145.size.height = v58;
    double v64 = fmin(MaxX, CGRectGetMaxX(v145)) - fmax(v23, v52);
    if (v64 / (v56 + 1.0e-10) > 0.1 || v64 / (v142 + 1.0e-10) > 0.1) {
      objc_msgSend_addIndex_(v14, v60, i, v61, v62, v63);
    }
  }
  if (objc_msgSend_count(v14, v35, v36, v37, v38, v39) == 1)
  {
    segments = self->_segments;
    uint64_t Index = objc_msgSend_firstIndex(v14, v65, v66, v67, v68, v69);
    v76 = objc_msgSend_objectAtIndexedSubscript_(segments, v72, Index, v73, v74, v75);
    objc_msgSend_addSupportStroke_(v76, v77, (uint64_t)v139, v78, v79, v80);
  }
  else
  {
    if ((unint64_t)objc_msgSend_count(v14, v65, v66, v67, v68, v69) < 2) {
      goto LABEL_22;
    }
    uint64_t v86 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v87 = objc_msgSend_count(self->_segments, v81, v82, v83, v84, v85);
    objc_msgSend_arrayWithCapacity_(v86, v88, v87, v89, v90, v91);
    v97 = (NSArray *)objc_claimAutoreleasedReturnValue();
    for (unint64_t j = 0; j < objc_msgSend_count(self->_segments, v92, v93, v94, v95, v96); ++j)
    {
      if (objc_msgSend_containsIndex_(v14, v99, j, v101, v102, v103)
        && j != objc_msgSend_firstIndex(v14, v104, v105, v106, v107, v108))
      {
        uint64_t v115 = objc_msgSend_firstIndex(v14, v104, v109, v106, v107, v108);
        v110 = objc_msgSend_objectAtIndexedSubscript_(v97, v116, v115, v117, v118, v119);
        uint64_t v124 = objc_msgSend_objectAtIndexedSubscript_(self->_segments, v120, j, v121, v122, v123);
        objc_msgSend_mergeTransformedText_(v110, v125, (uint64_t)v124, v126, v127, v128);
      }
      else
      {
        v110 = objc_msgSend_objectAtIndexedSubscript_(self->_segments, v104, j, v106, v107, v108);
        objc_msgSend_addObject_(v97, v111, (uint64_t)v110, v112, v113, v114);
      }
    }
    uint64_t v129 = objc_msgSend_firstIndex(v14, v99, v100, v101, v102, v103);
    NSUInteger v134 = objc_msgSend_objectAtIndexedSubscript_(v97, v130, v129, v131, v132, v133);
    objc_msgSend_addSupportStroke_(v134, v135, (uint64_t)v139, v136, v137, v138);

    v76 = self->_segments;
    self->_segments = v97;
  }

LABEL_22:
}

- (id)splitIntoTokens
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = self->_segments;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v44, (uint64_t)v49, 16, v9);
  if (v15)
  {
    uint64_t v16 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = objc_msgSend_splitIntoTokens(*(void **)(*((void *)&v44 + 1) + 8 * i), v10, v11, v12, v13, v14);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v19 = v18;
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v40, (uint64_t)v48, 16, v21);
        if (v22)
        {
          uint64_t v23 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v41 != v23) {
                objc_enumerationMutation(v19);
              }
              uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8 * j);
              uint64_t v26 = [CHTransformedTextLine alloc];
              uint64_t v31 = objc_msgSend_initWithSegment_(v26, v27, v25, v28, v29, v30);
              objc_msgSend_addObject_(v7, v32, (uint64_t)v31, v33, v34, v35);
            }
            uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v36, (uint64_t)&v40, (uint64_t)v48, 16, v37);
          }
          while (v22);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v44, (uint64_t)v49, 16, v14);
    }
    while (v15);
  }

  return v7;
}

- (void)mergeTransformedText:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = objc_msgSend_segments(a3, a2, (uint64_t)a3, v3, v4, v5, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, (uint64_t)v21, 16, v9);
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend__addTextLineSegment_(self, v10, *(void *)(*((void *)&v17 + 1) + 8 * v16++), v11, v12, v13);
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, (uint64_t)v21, 16, v13);
    }
    while (v14);
  }
}

- (void)_addTextLineSegment:(id)a3
{
  id v4 = a3;
  uint64_t v10 = v4;
  if (v4) {
    objc_msgSend_transform(v4, v5, v6, v7, v8, v9);
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  uint64_t v11 = objc_msgSend_lastObject(self->_segments, v5, v6, v7, v8, v9);
  long long v17 = v11;
  if (v11) {
    objc_msgSend_transform(v11, v12, v13, v14, v15, v16);
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  BOOL v18 = CGAffineTransformEqualToTransform(&t1, &t2);

  segments = self->_segments;
  if (v18)
  {
    uint64_t v25 = objc_msgSend_lastObject(segments, v19, v20, v21, v22, v23);
    objc_msgSend_mergeTransformedText_(v25, v26, (uint64_t)v10, v27, v28, v29);
  }
  else
  {
    objc_msgSend_arrayByAddingObject_(segments, v19, (uint64_t)v10, v21, v22, v23);
    uint64_t v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = self->_segments;
    self->_segments = v30;
  }

  uint64_t v36 = objc_msgSend_firstObject(self->_segments, v31, v32, v33, v34, v35);
  long long v42 = v36;
  if (v36)
  {
    objc_msgSend_principalLines(v36, v37, v38, v39, v40, v41);
  }
  else
  {
    *(_OWORD *)uint64_t v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    *(_OWORD *)double v64 = 0u;
    *(_OWORD *)uint64_t v61 = 0u;
    *(_OWORD *)uint64_t v62 = 0u;
  }
  long long v43 = objc_msgSend_lastObject(self->_segments, v37, v38, v39, v40, v41);
  uint64_t v49 = v43;
  if (v43)
  {
    objc_msgSend_principalLines(v43, v44, v45, v46, v47, v48);
  }
  else
  {
    *(_OWORD *)long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    *(_OWORD *)CGFloat v58 = 0u;
    *(_OWORD *)double v55 = 0u;
    *(_OWORD *)double v56 = 0u;
  }
  CoreHandwriting::merge_lines((CoreHandwriting *)v61, (const CoreHandwriting::PrincipalLines *)v55, (uint64_t)&v67);
  if (&self->_principalLines != (PrincipalLines *)&v67)
  {
    sub_1C49B7D84(&self->_principalLines.descender.__begin_, (char *)v67, v68, (v68 - (unsigned char *)v67) >> 4);
    sub_1C49B7D84(&self->_principalLines.base.__begin_, (char *)v69, v70, (v70 - (unsigned char *)v69) >> 4);
    sub_1C49B7D84(&self->_principalLines.median.__begin_, (char *)v71, v72, (v72 - (unsigned char *)v71) >> 4);
    sub_1C49B7D84(&self->_principalLines.top.__begin_, (char *)__p, v74, (v74 - (unsigned char *)__p) >> 4);
  }
  if (__p)
  {
    uint64_t v74 = (char *)__p;
    operator delete(__p);
  }
  if (v71)
  {
    unint64_t v72 = (char *)v71;
    operator delete(v71);
  }
  if (v69)
  {
    uint64_t v70 = (char *)v69;
    operator delete(v69);
  }
  if (v67)
  {
    uint64_t v68 = (char *)v67;
    operator delete(v67);
  }
  if (v59[1])
  {
    *(void **)&long long v60 = v59[1];
    operator delete(v59[1]);
  }
  if (v58[0])
  {
    v58[1] = v58[0];
    operator delete(v58[0]);
  }
  if (v56[1])
  {
    *(void **)&long long v57 = v56[1];
    operator delete(v56[1]);
  }
  if (v55[0])
  {
    v55[1] = v55[0];
    operator delete(v55[0]);
  }

  if (v65[1])
  {
    *(void **)&long long v66 = v65[1];
    operator delete(v65[1]);
  }
  if (v64[0])
  {
    v64[1] = v64[0];
    operator delete(v64[0]);
  }
  if (v62[1])
  {
    *(void **)&long long v63 = v62[1];
    operator delete(v62[1]);
  }
  if (v61[0])
  {
    v61[1] = v61[0];
    operator delete(v61[0]);
  }

  uint64_t v50 = (CGRect *)MEMORY[0x1E4F1DB28];
  double MinX = CGRectGetMinX(*MEMORY[0x1E4F1DB28]);
  double MaxX = CGRectGetMaxX(*v50);
  double MinY = CGRectGetMinY(*v50);
  double MaxY = CGRectGetMaxY(*v50);
  self->_boundingBox.x_min = MinX;
  self->_boundingBox.x_max = MaxX;
  self->_boundingBox.y_min = MinY;
  self->_boundingBox.y_max = MaxY;
}

+ (PrincipalLines)principalLinesFromSegments:(SEL)a3
{
  uint64_t v217 = *MEMORY[0x1E4F143B8];
  v213 = 0;
  v214 = 0;
  unint64_t v215 = 0;
  v210 = 0;
  v211 = 0;
  unint64_t v212 = 0;
  v207 = 0;
  v208 = 0;
  unint64_t v209 = 0;
  v204 = 0;
  v205 = 0;
  unint64_t v206 = 0;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id v5 = a4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v200, (uint64_t)v216, 16, v7);
  v191 = retstr;
  id v14 = v5;
  if (v8)
  {
    uint64_t v192 = *(void *)v201;
    double v15 = 0.0;
    while (1)
    {
      uint64_t v193 = v8;
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v201 != v192) {
          objc_enumerationMutation(v5);
        }
        long long v17 = *(void **)(*((void *)&v200 + 1) + 8 * v16);
        objc_msgSend_orientation(v17, v9, v10, v11, v12, v13);
        double v19 = v18;
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          uint64_t v20 = (_OWORD *)*((void *)&v198 + 1);
          uint64_t v22 = v214;
          unint64_t v21 = v215;
          if ((unint64_t)v214 < v215) {
            goto LABEL_9;
          }
        }
        else
        {
          uint64_t v20 = 0;
          long long v198 = 0u;
          uint64_t v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          uint64_t v22 = v214;
          unint64_t v21 = v215;
          if ((unint64_t)v214 < v215)
          {
LABEL_9:
            *(_OWORD *)uint64_t v22 = *v20;
            uint64_t v23 = v22 + 16;
            goto LABEL_22;
          }
        }
        long long v24 = (char *)v213;
        uint64_t v25 = (v22 - (unsigned char *)v213) >> 4;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v27 = v21 - (void)v213;
        if (v27 >> 3 > v26) {
          unint64_t v26 = v27 >> 3;
        }
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v28 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28)
        {
          if (v28 >> 60) {
            sub_1C4949AA8();
          }
          uint64_t v29 = (char *)operator new(16 * v28);
          uint64_t v30 = &v29[16 * v25];
          *(_OWORD *)uint64_t v30 = *v20;
          uint64_t v31 = v30;
          if (v22 == v24)
          {
LABEL_20:
            uint64_t v32 = &v29[16 * v28];
            uint64_t v23 = v30 + 16;
            v213 = v31;
            v214 = v30 + 16;
            unint64_t v215 = (unint64_t)v32;
            id v5 = v14;
            if (!v22) {
              goto LABEL_22;
            }
LABEL_21:
            operator delete(v22);
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v29 = 0;
          uint64_t v30 = (char *)(16 * v25);
          *(_OWORD *)(16 * v25) = *v20;
          uint64_t v31 = (char *)(16 * v25);
          if (v22 == v24) {
            goto LABEL_20;
          }
        }
        do
        {
          *((_OWORD *)v31 - 1) = *((_OWORD *)v22 - 1);
          v31 -= 16;
          v22 -= 16;
        }
        while (v22 != v24);
        uint64_t v22 = (char *)v213;
        v125 = &v29[16 * v28];
        uint64_t v23 = v30 + 16;
        v213 = v31;
        v214 = v30 + 16;
        unint64_t v215 = (unint64_t)v125;
        id v5 = v14;
        if (v22) {
          goto LABEL_21;
        }
LABEL_22:
        v214 = v23;
        if (*((void *)&v198 + 1))
        {
          uint64_t v199 = *((void *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          uint64_t v33 = v199 - 16;
          uint64_t v35 = v214;
          unint64_t v34 = v215;
          if ((unint64_t)v214 < v215) {
            goto LABEL_32;
          }
        }
        else
        {
          long long v198 = 0u;
          uint64_t v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          uint64_t v33 = -16;
          uint64_t v35 = v214;
          unint64_t v34 = v215;
          if ((unint64_t)v214 < v215)
          {
LABEL_32:
            *(_OWORD *)uint64_t v35 = *(_OWORD *)v33;
            uint64_t v36 = v35 + 16;
            goto LABEL_45;
          }
        }
        uint64_t v37 = (char *)v213;
        uint64_t v38 = (v35 - (unsigned char *)v213) >> 4;
        unint64_t v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v40 = v34 - (void)v213;
        if (v40 >> 3 > v39) {
          unint64_t v39 = v40 >> 3;
        }
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v41 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          if (v41 >> 60) {
            sub_1C4949AA8();
          }
          long long v42 = (char *)operator new(16 * v41);
          long long v43 = &v42[16 * v38];
          *(_OWORD *)long long v43 = *(_OWORD *)v33;
          long long v44 = v43;
          if (v35 == v37)
          {
LABEL_43:
            uint64_t v45 = &v42[16 * v41];
            uint64_t v36 = v43 + 16;
            v213 = v44;
            v214 = v43 + 16;
            unint64_t v215 = (unint64_t)v45;
            id v5 = v14;
            if (!v35) {
              goto LABEL_45;
            }
LABEL_44:
            operator delete(v35);
            goto LABEL_45;
          }
        }
        else
        {
          long long v42 = 0;
          long long v43 = (char *)(16 * v38);
          *(_OWORD *)(16 * v38) = *(_OWORD *)v33;
          long long v44 = (char *)(16 * v38);
          if (v35 == v37) {
            goto LABEL_43;
          }
        }
        do
        {
          *((_OWORD *)v44 - 1) = *((_OWORD *)v35 - 1);
          v44 -= 16;
          v35 -= 16;
        }
        while (v35 != v37);
        uint64_t v35 = (char *)v213;
        uint64_t v126 = &v42[16 * v41];
        uint64_t v36 = v43 + 16;
        v213 = v44;
        v214 = v43 + 16;
        unint64_t v215 = (unint64_t)v126;
        id v5 = v14;
        if (v35) {
          goto LABEL_44;
        }
LABEL_45:
        v214 = v36;
        if (*((void *)&v198 + 1))
        {
          uint64_t v199 = *((void *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          uint64_t v46 = v197[0];
          uint64_t v48 = v211;
          unint64_t v47 = v212;
          if ((unint64_t)v211 < v212) {
            goto LABEL_55;
          }
        }
        else
        {
          uint64_t v46 = 0;
          long long v198 = 0u;
          uint64_t v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          uint64_t v48 = v211;
          unint64_t v47 = v212;
          if ((unint64_t)v211 < v212)
          {
LABEL_55:
            *(_OWORD *)uint64_t v48 = *v46;
            uint64_t v49 = v48 + 16;
            goto LABEL_68;
          }
        }
        uint64_t v50 = (char *)v210;
        uint64_t v51 = (v48 - (unsigned char *)v210) >> 4;
        unint64_t v52 = v51 + 1;
        if ((unint64_t)(v51 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v53 = v47 - (void)v210;
        if (v53 >> 3 > v52) {
          unint64_t v52 = v53 >> 3;
        }
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v54 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v54 = v52;
        }
        if (v54)
        {
          if (v54 >> 60) {
            sub_1C4949AA8();
          }
          double v55 = (char *)operator new(16 * v54);
          double v56 = &v55[16 * v51];
          *(_OWORD *)double v56 = *v46;
          long long v57 = v56;
          if (v48 == v50)
          {
LABEL_66:
            CGFloat v58 = &v55[16 * v54];
            uint64_t v49 = v56 + 16;
            v210 = v57;
            v211 = v56 + 16;
            unint64_t v212 = (unint64_t)v58;
            id v5 = v14;
            if (!v48) {
              goto LABEL_68;
            }
LABEL_67:
            operator delete(v48);
            goto LABEL_68;
          }
        }
        else
        {
          double v55 = 0;
          double v56 = (char *)(16 * v51);
          *(_OWORD *)(16 * v51) = *v46;
          long long v57 = (char *)(16 * v51);
          if (v48 == v50) {
            goto LABEL_66;
          }
        }
        do
        {
          *((_OWORD *)v57 - 1) = *((_OWORD *)v48 - 1);
          v57 -= 16;
          v48 -= 16;
        }
        while (v48 != v50);
        uint64_t v48 = (char *)v210;
        uint64_t v127 = &v55[16 * v54];
        uint64_t v49 = v56 + 16;
        v210 = v57;
        v211 = v56 + 16;
        unint64_t v212 = (unint64_t)v127;
        id v5 = v14;
        if (v48) {
          goto LABEL_67;
        }
LABEL_68:
        v211 = v49;
        if (*((void *)&v198 + 1))
        {
          uint64_t v199 = *((void *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          uint64_t v59 = (uint64_t)v197[1] - 16;
          uint64_t v61 = v211;
          unint64_t v60 = v212;
          if ((unint64_t)v211 < v212) {
            goto LABEL_78;
          }
        }
        else
        {
          long long v198 = 0u;
          uint64_t v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          uint64_t v59 = -16;
          uint64_t v61 = v211;
          unint64_t v60 = v212;
          if ((unint64_t)v211 < v212)
          {
LABEL_78:
            *(_OWORD *)uint64_t v61 = *(_OWORD *)v59;
            uint64_t v62 = v61 + 16;
            goto LABEL_91;
          }
        }
        long long v63 = (char *)v210;
        uint64_t v64 = (v61 - (unsigned char *)v210) >> 4;
        unint64_t v65 = v64 + 1;
        if ((unint64_t)(v64 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v66 = v60 - (void)v210;
        if (v66 >> 3 > v65) {
          unint64_t v65 = v66 >> 3;
        }
        if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v67 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v67 = v65;
        }
        if (v67)
        {
          if (v67 >> 60) {
            sub_1C4949AA8();
          }
          uint64_t v68 = (char *)operator new(16 * v67);
          uint64_t v69 = &v68[16 * v64];
          *(_OWORD *)uint64_t v69 = *(_OWORD *)v59;
          uint64_t v70 = v69;
          if (v61 == v63)
          {
LABEL_89:
            v71 = &v68[16 * v67];
            uint64_t v62 = v69 + 16;
            v210 = v70;
            v211 = v69 + 16;
            unint64_t v212 = (unint64_t)v71;
            id v5 = v14;
            if (!v61) {
              goto LABEL_91;
            }
LABEL_90:
            operator delete(v61);
            goto LABEL_91;
          }
        }
        else
        {
          uint64_t v68 = 0;
          uint64_t v69 = (char *)(16 * v64);
          *(_OWORD *)(16 * v64) = *(_OWORD *)v59;
          uint64_t v70 = (char *)(16 * v64);
          if (v61 == v63) {
            goto LABEL_89;
          }
        }
        do
        {
          *((_OWORD *)v70 - 1) = *((_OWORD *)v61 - 1);
          v70 -= 16;
          v61 -= 16;
        }
        while (v61 != v63);
        uint64_t v61 = (char *)v210;
        uint64_t v128 = &v68[16 * v67];
        uint64_t v62 = v69 + 16;
        v210 = v70;
        v211 = v69 + 16;
        unint64_t v212 = (unint64_t)v128;
        id v5 = v14;
        if (v61) {
          goto LABEL_90;
        }
LABEL_91:
        v211 = v62;
        if (*((void *)&v198 + 1))
        {
          uint64_t v199 = *((void *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          unint64_t v72 = v195[1];
          uint64_t v74 = v208;
          unint64_t v73 = v209;
          if ((unint64_t)v208 < v209) {
            goto LABEL_101;
          }
        }
        else
        {
          unint64_t v72 = 0;
          long long v198 = 0u;
          uint64_t v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          uint64_t v74 = v208;
          unint64_t v73 = v209;
          if ((unint64_t)v208 < v209)
          {
LABEL_101:
            *(_OWORD *)uint64_t v74 = *v72;
            uint64_t v75 = v74 + 16;
            goto LABEL_114;
          }
        }
        v76 = (char *)v207;
        uint64_t v77 = (v74 - (unsigned char *)v207) >> 4;
        unint64_t v78 = v77 + 1;
        if ((unint64_t)(v77 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v79 = v73 - (void)v207;
        if (v79 >> 3 > v78) {
          unint64_t v78 = v79 >> 3;
        }
        if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v80 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v80 = v78;
        }
        if (v80)
        {
          if (v80 >> 60) {
            sub_1C4949AA8();
          }
          v81 = (char *)operator new(16 * v80);
          uint64_t v82 = &v81[16 * v77];
          *(_OWORD *)uint64_t v82 = *v72;
          uint64_t v83 = v82;
          if (v74 == v76)
          {
LABEL_112:
            uint64_t v84 = &v81[16 * v80];
            uint64_t v75 = v82 + 16;
            v207 = v83;
            v208 = v82 + 16;
            unint64_t v209 = (unint64_t)v84;
            id v5 = v14;
            if (!v74) {
              goto LABEL_114;
            }
LABEL_113:
            operator delete(v74);
            goto LABEL_114;
          }
        }
        else
        {
          v81 = 0;
          uint64_t v82 = (char *)(16 * v77);
          *(_OWORD *)(16 * v77) = *v72;
          uint64_t v83 = (char *)(16 * v77);
          if (v74 == v76) {
            goto LABEL_112;
          }
        }
        do
        {
          *((_OWORD *)v83 - 1) = *((_OWORD *)v74 - 1);
          v83 -= 16;
          v74 -= 16;
        }
        while (v74 != v76);
        uint64_t v74 = (char *)v207;
        uint64_t v129 = &v81[16 * v80];
        uint64_t v75 = v82 + 16;
        v207 = v83;
        v208 = v82 + 16;
        unint64_t v209 = (unint64_t)v129;
        id v5 = v14;
        if (v74) {
          goto LABEL_113;
        }
LABEL_114:
        v208 = v75;
        if (*((void *)&v198 + 1))
        {
          uint64_t v199 = *((void *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          uint64_t v85 = (uint64_t)v196 - 16;
          uint64_t v87 = v208;
          unint64_t v86 = v209;
          if ((unint64_t)v208 < v209) {
            goto LABEL_124;
          }
        }
        else
        {
          long long v198 = 0u;
          uint64_t v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          uint64_t v85 = -16;
          uint64_t v87 = v208;
          unint64_t v86 = v209;
          if ((unint64_t)v208 < v209)
          {
LABEL_124:
            *(_OWORD *)uint64_t v87 = *(_OWORD *)v85;
            uint64_t v88 = v87 + 16;
            goto LABEL_137;
          }
        }
        uint64_t v89 = (char *)v207;
        uint64_t v90 = (v87 - (unsigned char *)v207) >> 4;
        unint64_t v91 = v90 + 1;
        if ((unint64_t)(v90 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v92 = v86 - (void)v207;
        if (v92 >> 3 > v91) {
          unint64_t v91 = v92 >> 3;
        }
        if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v93 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v93 = v91;
        }
        if (v93)
        {
          if (v93 >> 60) {
            sub_1C4949AA8();
          }
          uint64_t v94 = (char *)operator new(16 * v93);
          uint64_t v95 = &v94[16 * v90];
          *(_OWORD *)uint64_t v95 = *(_OWORD *)v85;
          uint64_t v96 = v95;
          if (v87 == v89)
          {
LABEL_135:
            v97 = &v94[16 * v93];
            uint64_t v88 = v95 + 16;
            v207 = v96;
            v208 = v95 + 16;
            unint64_t v209 = (unint64_t)v97;
            id v5 = v14;
            if (!v87) {
              goto LABEL_137;
            }
LABEL_136:
            operator delete(v87);
            goto LABEL_137;
          }
        }
        else
        {
          uint64_t v94 = 0;
          uint64_t v95 = (char *)(16 * v90);
          *(_OWORD *)(16 * v90) = *(_OWORD *)v85;
          uint64_t v96 = (char *)(16 * v90);
          if (v87 == v89) {
            goto LABEL_135;
          }
        }
        do
        {
          *((_OWORD *)v96 - 1) = *((_OWORD *)v87 - 1);
          v96 -= 16;
          v87 -= 16;
        }
        while (v87 != v89);
        uint64_t v87 = (char *)v207;
        uint64_t v130 = &v94[16 * v93];
        uint64_t v88 = v95 + 16;
        v207 = v96;
        v208 = v95 + 16;
        unint64_t v209 = (unint64_t)v130;
        id v5 = v14;
        if (v87) {
          goto LABEL_136;
        }
LABEL_137:
        v208 = v88;
        if (*((void *)&v198 + 1))
        {
          uint64_t v199 = *((void *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          v98 = v194[0];
          uint64_t v100 = v205;
          unint64_t v99 = v206;
          if ((unint64_t)v205 < v206) {
            goto LABEL_147;
          }
        }
        else
        {
          v98 = 0;
          long long v198 = 0u;
          uint64_t v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          uint64_t v100 = v205;
          unint64_t v99 = v206;
          if ((unint64_t)v205 < v206)
          {
LABEL_147:
            *(_OWORD *)uint64_t v100 = *v98;
            uint64_t v101 = v100 + 16;
            goto LABEL_160;
          }
        }
        uint64_t v102 = (char *)v204;
        uint64_t v103 = (v100 - (unsigned char *)v204) >> 4;
        unint64_t v104 = v103 + 1;
        if ((unint64_t)(v103 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v105 = v99 - (void)v204;
        if (v105 >> 3 > v104) {
          unint64_t v104 = v105 >> 3;
        }
        if ((unint64_t)v105 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v106 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v106 = v104;
        }
        if (v106)
        {
          if (v106 >> 60) {
            sub_1C4949AA8();
          }
          uint64_t v107 = (char *)operator new(16 * v106);
          uint64_t v108 = &v107[16 * v103];
          *(_OWORD *)uint64_t v108 = *v98;
          uint64_t v109 = v108;
          if (v100 == v102)
          {
LABEL_158:
            v110 = &v107[16 * v106];
            uint64_t v101 = v108 + 16;
            v204 = v109;
            v205 = v108 + 16;
            unint64_t v206 = (unint64_t)v110;
            id v5 = v14;
            if (!v100) {
              goto LABEL_160;
            }
LABEL_159:
            operator delete(v100);
            goto LABEL_160;
          }
        }
        else
        {
          uint64_t v107 = 0;
          uint64_t v108 = (char *)(16 * v103);
          *(_OWORD *)(16 * v103) = *v98;
          uint64_t v109 = (char *)(16 * v103);
          if (v100 == v102) {
            goto LABEL_158;
          }
        }
        do
        {
          *((_OWORD *)v109 - 1) = *((_OWORD *)v100 - 1);
          v109 -= 16;
          v100 -= 16;
        }
        while (v100 != v102);
        uint64_t v100 = (char *)v204;
        uint64_t v131 = &v107[16 * v106];
        uint64_t v101 = v108 + 16;
        v204 = v109;
        v205 = v108 + 16;
        unint64_t v206 = (unint64_t)v131;
        id v5 = v14;
        if (v100) {
          goto LABEL_159;
        }
LABEL_160:
        v205 = v101;
        if (*((void *)&v198 + 1))
        {
          uint64_t v199 = *((void *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          uint64_t v111 = (uint64_t)v194[1] - 16;
          uint64_t v113 = v205;
          unint64_t v112 = v206;
          if ((unint64_t)v205 < v206) {
            goto LABEL_170;
          }
        }
        else
        {
          long long v198 = 0u;
          uint64_t v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          uint64_t v111 = -16;
          uint64_t v113 = v205;
          unint64_t v112 = v206;
          if ((unint64_t)v205 < v206)
          {
LABEL_170:
            *(_OWORD *)uint64_t v113 = *(_OWORD *)v111;
            uint64_t v114 = v113 + 16;
            uint64_t v115 = v193;
            goto LABEL_185;
          }
        }
        unint64_t v116 = (char *)v204;
        uint64_t v117 = (v113 - (unsigned char *)v204) >> 4;
        unint64_t v118 = v117 + 1;
        if ((unint64_t)(v117 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v119 = v112 - (void)v204;
        if (v119 >> 3 > v118) {
          unint64_t v118 = v119 >> 3;
        }
        if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v120 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v120 = v118;
        }
        if (v120)
        {
          if (v120 >> 60) {
            sub_1C4949AA8();
          }
          uint64_t v121 = (char *)operator new(16 * v120);
          uint64_t v122 = &v121[16 * v117];
          *(_OWORD *)uint64_t v122 = *(_OWORD *)v111;
          uint64_t v123 = v122;
          if (v113 == v116)
          {
LABEL_222:
            uint64_t v115 = v193;
            uint64_t v132 = &v121[16 * v120];
            uint64_t v114 = v122 + 16;
            v204 = v123;
            v205 = v122 + 16;
            unint64_t v206 = (unint64_t)v132;
            id v5 = v14;
            if (v113) {
              goto LABEL_184;
            }
            goto LABEL_185;
          }
        }
        else
        {
          uint64_t v121 = 0;
          uint64_t v122 = (char *)(16 * v117);
          *(_OWORD *)(16 * v117) = *(_OWORD *)v111;
          uint64_t v123 = (char *)(16 * v117);
          if (v113 == v116) {
            goto LABEL_222;
          }
        }
        uint64_t v115 = v193;
        do
        {
          *((_OWORD *)v123 - 1) = *((_OWORD *)v113 - 1);
          v123 -= 16;
          v113 -= 16;
        }
        while (v113 != v116);
        uint64_t v113 = (char *)v204;
        uint64_t v124 = &v121[16 * v120];
        uint64_t v114 = v122 + 16;
        v204 = v123;
        v205 = v122 + 16;
        unint64_t v206 = (unint64_t)v124;
        id v5 = v14;
        if (v113) {
LABEL_184:
        }
          operator delete(v113);
LABEL_185:
        v205 = v114;
        if (*((void *)&v198 + 1))
        {
          uint64_t v199 = *((void *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        double v15 = v15 + v19;
        ++v16;
      }
      while (v16 != v115);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v200, (uint64_t)v216, 16, v13);
      if (!v8) {
        goto LABEL_227;
      }
    }
  }
  double v15 = 0.0;
LABEL_227:

  uint64_t v138 = objc_msgSend_count(v5, v133, v134, v135, v136, v137);
  double v144 = tan(-v15 / (double)(unint64_t)v138);
  uint64_t v145 = 0;
  unint64_t v146 = 0;
  double v147 = 0.0;
  double v148 = 0.0;
  double v149 = 0.0;
  double v150 = 0.0;
  while (v146 < 2 * objc_msgSend_count(v5, v139, v140, v141, v142, v143))
  {
    double v147 = v147 + *(double *)((char *)v213 + v145 + 8) - *(double *)((char *)v213 + v145) * v144;
    double v148 = v148 + *(double *)((char *)v210 + v145 + 8) - *(double *)((char *)v210 + v145) * v144;
    double v149 = v149 + *(double *)((char *)v207 + v145 + 8) - *(double *)((char *)v207 + v145) * v144;
    double v150 = v150 + *(double *)((char *)v204 + v145 + 8) - *(double *)((char *)v204 + v145) * v144;
    ++v146;
    v145 += 16;
  }
  uint64_t v151 = objc_msgSend_count(v5, v139, v140, v141, v142, v143);
  uint64_t v157 = objc_msgSend_count(v5, v152, v153, v154, v155, v156);
  uint64_t v163 = objc_msgSend_count(v5, v158, v159, v160, v161, v162);
  uint64_t v169 = objc_msgSend_count(v5, v164, v165, v166, v167, v168);
  *(_OWORD *)&v191->median.__end_cap_.__value_ = 0u;
  *(_OWORD *)&v191->top.__end_ = 0u;
  *(_OWORD *)&v191->base.__end_ = 0u;
  *(_OWORD *)&v191->median.__begin_ = 0u;
  *(_OWORD *)&v191->descender.__begin_ = 0u;
  *(_OWORD *)&v191->descender.__end_cap_.__value_ = 0u;
  double v170 = *(double *)v213;
  v171 = (double *)operator new(0x10uLL);
  double v172 = v147 / (double)(unint64_t)(2 * v151);
  double *v171 = v170;
  v171[1] = v172 + v170 * v144;
  double v173 = *((double *)v214 - 2);
  v174 = operator new(0x20uLL);
  *((double *)v174 + 2) = v173;
  *((double *)v174 + 3) = v172 + v173 * v144;
  *(_OWORD *)v174 = *(_OWORD *)v171;
  operator delete(v171);
  sub_1C49B7D84(&v191->top.__begin_, (char *)v174, (char *)v174 + 32, 2uLL);
  double v175 = *(double *)v210;
  v176 = (double *)operator new(0x10uLL);
  double v177 = v148 / (double)(unint64_t)(2 * v157);
  double *v176 = v175;
  v176[1] = v177 + v175 * v144;
  double v178 = *((double *)v211 - 2);
  v179 = operator new(0x20uLL);
  *((double *)v179 + 2) = v178;
  *((double *)v179 + 3) = v177 + v178 * v144;
  *(_OWORD *)v179 = *(_OWORD *)v176;
  operator delete(v176);
  sub_1C49B7D84(&v191->median.__begin_, (char *)v179, (char *)v179 + 32, 2uLL);
  double v180 = *(double *)v207;
  v181 = (double *)operator new(0x10uLL);
  double v182 = v149 / (double)(unint64_t)(2 * v163);
  double *v181 = v180;
  v181[1] = v182 + v180 * v144;
  double v183 = *((double *)v208 - 2);
  v184 = operator new(0x20uLL);
  *((double *)v184 + 2) = v183;
  *((double *)v184 + 3) = v182 + v183 * v144;
  *(_OWORD *)v184 = *(_OWORD *)v181;
  operator delete(v181);
  sub_1C49B7D84(&v191->base.__begin_, (char *)v184, (char *)v184 + 32, 2uLL);
  double v185 = *(double *)v204;
  v186 = (double *)operator new(0x10uLL);
  double v187 = v150 / (double)(unint64_t)(2 * v169);
  double *v186 = v185;
  v186[1] = v187 + v185 * v144;
  double v188 = *((double *)v205 - 2);
  v189 = operator new(0x20uLL);
  *((double *)v189 + 2) = v188;
  *((double *)v189 + 3) = v187 + v188 * v144;
  *(_OWORD *)v189 = *(_OWORD *)v186;
  operator delete(v186);
  sub_1C49B7D84(v191, (char *)v189, (char *)v189 + 32, 2uLL);
  operator delete(v189);
  operator delete(v184);
  operator delete(v179);
  operator delete(v174);
  if (v204)
  {
    v205 = (char *)v204;
    operator delete(v204);
  }
  if (v207)
  {
    v208 = (char *)v207;
    operator delete(v207);
  }
  if (v210)
  {
    v211 = (char *)v210;
    operator delete(v210);
  }
  if (v213)
  {
    v214 = (char *)v213;
    operator delete(v213);
  }

  return result;
}

- (id)tokenDistanceSizes:(BOOL)a3
{
  BOOL v6 = a3;
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_firstObject(self->_segments, a2, a3, v3, v4, v5);
  uint64_t v13 = objc_msgSend_tokenDistanceSizes_(v8, v9, v6, v10, v11, v12);
  uint64_t v142 = objc_msgSend_mutableCopy(v13, v14, v15, v16, v17, v18);

  long long v24 = objc_msgSend_firstObject(self->_segments, v19, v20, v21, v22, v23);
  uint64_t v30 = v24;
  if (v24)
  {
    objc_msgSend_principalLines(v24, v25, v26, v27, v28, v29);
  }
  else
  {
    *(_OWORD *)uint64_t v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    *(_OWORD *)uint64_t v156 = 0u;
    *(_OWORD *)__dst = 0u;
    *(_OWORD *)uint64_t v154 = 0u;
  }

  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  segments = self->_segments;
  uint64_t v37 = objc_msgSend_count(segments, v32, v33, v34, v35, v36);
  unint64_t v41 = objc_msgSend_subarrayWithRange_(segments, v38, 1, v37 - 1, v39, v40);
  uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v149, (uint64_t)v159, 16, v43);
  if (v49)
  {
    uint64_t v140 = v41;
    uint64_t v141 = *(void *)v150;
    id v139 = &v157[1];
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v150 != v141) {
          objc_enumerationMutation(v41);
        }
        uint64_t v51 = *(void **)(*((void *)&v149 + 1) + 8 * i);
        unint64_t v52 = objc_msgSend_tokens(v51, v44, v45, v46, v47, v48, v139);
        CGFloat v58 = objc_msgSend_firstObject(v52, v53, v54, v55, v56, v57);
        char v64 = objc_msgSend_properties(v58, v59, v60, v61, v62, v63);

        if (!v6 || (v64 & 0x20) != 0)
        {
          uint64_t v70 = (double *)v154[1];
          objc_msgSend_principalLines(v51, v65, v66, v67, v68, v69);
          double v76 = v70[2];
          double v77 = v70[3];
          double v79 = **((double **)&v144 + 1);
          double v78 = *(double *)(*((void *)&v144 + 1) + 8);
          if (*((void *)&v147 + 1))
          {
            double v148 = (unsigned char *)*((void *)&v147 + 1);
            operator delete(*((void **)&v147 + 1));
          }
          if (v146[0])
          {
            v146[1] = v146[0];
            operator delete(v146[0]);
          }
          if (*((void *)&v144 + 1))
          {
            uint64_t v145 = (unsigned char *)*((void *)&v144 + 1);
            operator delete(*((void **)&v144 + 1));
          }
          if (v143[0])
          {
            v143[1] = v143[0];
            operator delete(v143[0]);
          }
          unint64_t v80 = objc_msgSend_numberWithDouble_(NSNumber, v71, v72, v73, v74, v75, sqrt((v77 - v78) * (v77 - v78) + (v76 - v79) * (v76 - v79)));
          objc_msgSend_addObject_(v142, v81, (uint64_t)v80, v82, v83, v84);
        }
        uint64_t v85 = objc_msgSend_tokenDistanceSizes_(v51, v65, v6, v67, v68, v69);
        objc_msgSend_addObjectsFromArray_(v142, v86, (uint64_t)v85, v87, v88, v89);
        if (v51)
        {
          objc_msgSend_principalLines(v51, v90, v91, v92, v93, v94);
          uint64_t v95 = v143[1];
          uint64_t v96 = (char *)v143[0];
        }
        else
        {
          uint64_t v95 = 0;
          uint64_t v96 = 0;
          long long v147 = 0u;
          double v148 = 0;
          uint64_t v145 = 0;
          *(_OWORD *)unint64_t v146 = 0u;
          *(_OWORD *)uint64_t v143 = 0u;
          long long v144 = 0u;
        }
        size_t v97 = v95 - v96;
        unint64_t v98 = (v95 - v96) >> 4;
        uint64_t v99 = (uint64_t)v154[0];
        uint64_t v100 = (char *)__dst[0];
        if (v98 <= ((char *)v154[0] - (char *)__dst[0]) >> 4)
        {
          unint64_t v104 = ((char *)__dst[1] - (char *)__dst[0]) >> 4;
          if (v104 >= v98)
          {
            if (v95 == v96) {
              goto LABEL_43;
            }
            unint64_t v106 = __dst[0];
            uint64_t v105 = v96;
            goto LABEL_42;
          }
          if (__dst[1] != __dst[0])
          {
            memmove(__dst[0], v96, (char *)__dst[1] - (char *)__dst[0]);
            uint64_t v100 = (char *)__dst[1];
          }
          uint64_t v105 = &v96[16 * v104];
          size_t v97 = v95 - v105;
          if (v95 != v105)
          {
            unint64_t v106 = v100;
LABEL_42:
            memmove(v106, v105, v97);
          }
        }
        else
        {
          if (__dst[0])
          {
            __dst[1] = __dst[0];
            operator delete(__dst[0]);
            uint64_t v99 = 0;
            __dst[0] = 0;
            __dst[1] = 0;
            v154[0] = 0;
          }
          if ((v97 & 0x8000000000000000) != 0) {
            goto LABEL_124;
          }
          uint64_t v101 = v99 >> 3;
          if (v99 >> 3 <= v98) {
            uint64_t v101 = (v95 - v96) >> 4;
          }
          unint64_t v102 = (unint64_t)v99 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v101;
          if (v102 >> 60) {
LABEL_124:
          }
            sub_1C494A220();
          uint64_t v103 = (char *)operator new(16 * v102);
          uint64_t v100 = v103;
          __dst[0] = v103;
          __dst[1] = v103;
          v154[0] = &v103[16 * v102];
          if (v95 != v96) {
            memcpy(v103, v96, v95 - v96);
          }
        }
LABEL_43:
        __dst[1] = &v100[v97];
        size_t v107 = (size_t)&v145[-*((void *)&v144 + 1)];
        unint64_t v108 = (uint64_t)&v145[-*((void *)&v144 + 1)] >> 4;
        uint64_t v109 = *((void *)&v155 + 1);
        v110 = (char *)v154[1];
        if (v108 <= (uint64_t)(*((void *)&v155 + 1) - (unint64_t)v154[1]) >> 4)
        {
          unint64_t v114 = (uint64_t)(v155 - (unint64_t)v154[1]) >> 4;
          if (v114 >= v108)
          {
            if (v145 == *((unsigned char **)&v144 + 1)) {
              goto LABEL_63;
            }
            unint64_t v116 = v154[1];
            uint64_t v115 = (unsigned char *)*((void *)&v144 + 1);
            goto LABEL_62;
          }
          if ((void *)v155 != v154[1])
          {
            memmove(v154[1], *((const void **)&v144 + 1), v155 - (unint64_t)v154[1]);
            v110 = (char *)v155;
          }
          uint64_t v115 = (unsigned char *)(*((void *)&v144 + 1) + 16 * v114);
          size_t v107 = v145 - v115;
          if (v145 != v115)
          {
            unint64_t v116 = v110;
LABEL_62:
            memmove(v116, v115, v107);
          }
        }
        else
        {
          if (v154[1])
          {
            *(void **)&long long v155 = v154[1];
            operator delete(v154[1]);
            uint64_t v109 = 0;
            v154[1] = 0;
            long long v155 = 0uLL;
          }
          if ((v107 & 0x8000000000000000) != 0) {
            goto LABEL_124;
          }
          uint64_t v111 = v109 >> 3;
          if (v109 >> 3 <= v108) {
            uint64_t v111 = (uint64_t)&v145[-*((void *)&v144 + 1)] >> 4;
          }
          unint64_t v112 = (unint64_t)v109 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v111;
          if (v112 >> 60) {
            goto LABEL_124;
          }
          uint64_t v113 = (char *)operator new(16 * v112);
          v110 = v113;
          v154[1] = v113;
          *(void *)&long long v155 = v113;
          *((void *)&v155 + 1) = &v113[16 * v112];
          if (v145 != *((unsigned char **)&v144 + 1)) {
            memcpy(v113, *((const void **)&v144 + 1), v107);
          }
        }
LABEL_63:
        *(void *)&long long v155 = &v110[v107];
        size_t v117 = (char *)v146[1] - (char *)v146[0];
        unint64_t v118 = ((char *)v146[1] - (char *)v146[0]) >> 4;
        uint64_t v119 = (uint64_t)v157[0];
        unint64_t v120 = (char *)v156[0];
        if (v118 <= ((char *)v157[0] - (char *)v156[0]) >> 4)
        {
          unint64_t v124 = ((char *)v156[1] - (char *)v156[0]) >> 4;
          if (v124 >= v118)
          {
            if (v146[1] == v146[0]) {
              goto LABEL_83;
            }
            uint64_t v126 = v156[0];
            v125 = (char *)v146[0];
            goto LABEL_82;
          }
          if (v156[1] != v156[0])
          {
            memmove(v156[0], v146[0], (char *)v156[1] - (char *)v156[0]);
            unint64_t v120 = (char *)v156[1];
          }
          v125 = (char *)v146[0] + 16 * v124;
          size_t v117 = (char *)v146[1] - (char *)v125;
          if (v146[1] != v125)
          {
            uint64_t v126 = v120;
LABEL_82:
            memmove(v126, v125, v117);
          }
        }
        else
        {
          if (v156[0])
          {
            v156[1] = v156[0];
            operator delete(v156[0]);
            uint64_t v119 = 0;
            v156[0] = 0;
            v156[1] = 0;
            v157[0] = 0;
          }
          if ((v117 & 0x8000000000000000) != 0) {
            goto LABEL_124;
          }
          uint64_t v121 = v119 >> 3;
          if (v119 >> 3 <= v118) {
            uint64_t v121 = ((char *)v146[1] - (char *)v146[0]) >> 4;
          }
          unint64_t v122 = (unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v121;
          if (v122 >> 60) {
            goto LABEL_124;
          }
          uint64_t v123 = (char *)operator new(16 * v122);
          unint64_t v120 = v123;
          v156[0] = v123;
          v156[1] = v123;
          v157[0] = &v123[16 * v122];
          if (v146[1] != v146[0]) {
            memcpy(v123, v146[0], v117);
          }
        }
LABEL_83:
        v156[1] = &v120[v117];
        size_t v127 = (size_t)&v148[-*((void *)&v147 + 1)];
        unint64_t v128 = (uint64_t)&v148[-*((void *)&v147 + 1)] >> 4;
        uint64_t v129 = *((void *)&v158 + 1);
        uint64_t v130 = (char *)v157[1];
        if (v128 <= (uint64_t)(*((void *)&v158 + 1) - (unint64_t)v157[1]) >> 4)
        {
          unint64_t v134 = (uint64_t)(v158 - (unint64_t)v157[1]) >> 4;
          if (v134 >= v128)
          {
            if (v148 == *((unsigned char **)&v147 + 1)) {
              goto LABEL_103;
            }
            uint64_t v136 = v157[1];
            uint64_t v135 = (unsigned char *)*((void *)&v147 + 1);
            goto LABEL_102;
          }
          if ((void *)v158 != v157[1])
          {
            memmove(v157[1], *((const void **)&v147 + 1), v158 - (unint64_t)v157[1]);
            uint64_t v130 = (char *)v158;
          }
          uint64_t v135 = (unsigned char *)(*((void *)&v147 + 1) + 16 * v134);
          size_t v127 = v148 - v135;
          if (v148 != v135)
          {
            uint64_t v136 = v130;
LABEL_102:
            memmove(v136, v135, v127);
          }
        }
        else
        {
          if (v157[1])
          {
            *(void **)&long long v158 = v157[1];
            operator delete(v157[1]);
            uint64_t v129 = 0;
            *id v139 = 0;
            v139[1] = 0;
            v139[2] = 0;
          }
          if ((v127 & 0x8000000000000000) != 0) {
            goto LABEL_124;
          }
          uint64_t v131 = v129 >> 3;
          if (v129 >> 3 <= v128) {
            uint64_t v131 = (uint64_t)&v148[-*((void *)&v147 + 1)] >> 4;
          }
          unint64_t v132 = (unint64_t)v129 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v131;
          if (v132 >> 60) {
            goto LABEL_124;
          }
          uint64_t v133 = (char *)operator new(16 * v132);
          uint64_t v130 = v133;
          v157[1] = v133;
          *(void *)&long long v158 = v133;
          *((void *)&v158 + 1) = &v133[16 * v132];
          if (v148 != *((unsigned char **)&v147 + 1)) {
            memcpy(v133, *((const void **)&v147 + 1), v127);
          }
        }
LABEL_103:
        unint64_t v41 = v140;
        *(void *)&long long v158 = &v130[v127];
        if (*((void *)&v147 + 1))
        {
          double v148 = (unsigned char *)*((void *)&v147 + 1);
          operator delete(*((void **)&v147 + 1));
        }
        if (v146[0])
        {
          v146[1] = v146[0];
          operator delete(v146[0]);
        }
        if (*((void *)&v144 + 1))
        {
          uint64_t v145 = (unsigned char *)*((void *)&v144 + 1);
          operator delete(*((void **)&v144 + 1));
        }
        if (v143[0])
        {
          v143[1] = v143[0];
          operator delete(v143[0]);
        }
      }
      uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v44, (uint64_t)&v149, (uint64_t)v159, 16, v48);
    }
    while (v49);
  }

  id v137 = v142;
  if (v157[1])
  {
    *(void **)&long long v158 = v157[1];
    operator delete(v157[1]);
  }
  if (v156[0])
  {
    v156[1] = v156[0];
    operator delete(v156[0]);
  }
  if (v154[1])
  {
    *(void **)&long long v155 = v154[1];
    operator delete(v154[1]);
  }
  if (__dst[0])
  {
    __dst[1] = __dst[0];
    operator delete(__dst[0]);
  }

  return v137;
}

- (void)addTransform:(CGAffineTransform *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v5 = self->_segments;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v45, (uint64_t)v49, 16, v7);
  if (v12)
  {
    uint64_t v13 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v5);
        }
        uint64_t v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        long long v16 = *(_OWORD *)&a3->c;
        v44[0] = *(_OWORD *)&a3->a;
        long long v17 = *(_OWORD *)&a3->tx;
        v44[1] = v16;
        v44[2] = v17;
        objc_msgSend_addTransform_(v15, v8, (uint64_t)v44, v9, v10, v11);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v45, (uint64_t)v49, 16, v11);
    }
    while (v12);
  }

  CoreHandwriting::transformPrincipalLines((double **)&self->_principalLines, (float64x2_t *)a3, (uint64_t)&v36);
  if (&self->_principalLines != (PrincipalLines *)&v36)
  {
    sub_1C49B7D84(&self->_principalLines.descender.__begin_, (char *)v36, v37, (v37 - (unsigned char *)v36) >> 4);
    sub_1C49B7D84(&self->_principalLines.base.__begin_, (char *)v38, v39, (v39 - (unsigned char *)v38) >> 4);
    sub_1C49B7D84(&self->_principalLines.median.__begin_, (char *)v40, v41, (v41 - (unsigned char *)v40) >> 4);
    sub_1C49B7D84(&self->_principalLines.top.__begin_, (char *)__p, v43, (v43 - (unsigned char *)__p) >> 4);
  }
  objc_msgSend_points(self, v18, v19, v20, v21, v22);
  if (v34 == v35)
  {
    double v23 = 1.79769313e308;
    double v24 = -1.79769313e308;
    double v25 = -1.79769313e308;
    double v26 = 1.79769313e308;
    if (v34) {
LABEL_22:
    }
      operator delete(v34);
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
    uint64_t v31 = v34;
    do
    {
      double v32 = *v31;
      double v33 = v31[1];
      v31 += 2;
      if (v30 > v32)
      {
        double v26 = v32;
        double v30 = v32;
      }
      if (v29 < v32)
      {
        double v25 = v32;
        double v29 = v32;
      }
      if (v28 > v33)
      {
        double v23 = v33;
        double v28 = v33;
      }
      if (v27 < v33)
      {
        double v24 = v33;
        double v27 = v33;
      }
    }
    while (v31 != v35);
    if (v34) {
      goto LABEL_22;
    }
  }
  self->_boundingBox.x_min = v26;
  self->_boundingBox.x_max = v25;
  self->_boundingBox.y_min = v23;
  self->_boundingBox.y_max = v24;
  if (__p)
  {
    uint64_t v43 = (char *)__p;
    operator delete(__p);
  }
  if (v40)
  {
    unint64_t v41 = (char *)v40;
    operator delete(v40);
  }
  if (v38)
  {
    uint64_t v39 = (char *)v38;
    operator delete(v38);
  }
  if (v36)
  {
    uint64_t v37 = (char *)v36;
    operator delete(v36);
  }
}

- (vector<CGPoint,)points
{
  uint64_t v3 = retstr;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = self->_segments;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v51, (uint64_t)v55, 16, v5);
  if (v11)
  {
    end = 0;
    uint64_t v13 = *(void *)v52;
    long long v48 = v3;
    do
    {
      uint64_t v14 = 0;
      uint64_t v46 = v11;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v51 + 1) + 8 * v14);
        if (!v15)
        {
          __p = 0;
          uint64_t v50 = 0;
LABEL_9:
          uint64_t v18 = __p;
          if (__p) {
            goto LABEL_50;
          }
          goto LABEL_4;
        }
        objc_msgSend_points(v15, v6, v7, v8, v9, v10);
        long long v16 = (long long *)__p;
        uint64_t v17 = v50 - __p;
        if (v50 - __p < 1) {
          goto LABEL_9;
        }
        uint64_t v19 = v17 >> 4;
        uint64_t v20 = (char *)end - (char *)v3->__begin_;
        uint64_t v21 = (CGPoint *)((char *)v3->__begin_ + (v20 & 0xFFFFFFFFFFFFFFF0));
        value = v3->__end_cap_.__value_;
        if (v17 >> 4 <= value - end)
        {
          uint64_t v29 = end - v21;
          if (v29 >= v19)
          {
            double v30 = &__p[16 * v19];
            uint64_t v31 = end;
          }
          else
          {
            double v30 = &__p[16 * v29];
            if (v50 != v30) {
              memmove(end, &__p[16 * v29], v50 - v30);
            }
            uint64_t v31 = (CGPoint *)((char *)end + v50 - v30);
            uint64_t v3 = v48;
            v48->__end_ = v31;
            if ((char *)end - (char *)v21 < 1)
            {
              end = (CGPoint *)((char *)end + v50 - v30);
              uint64_t v18 = __p;
              if (__p) {
                goto LABEL_50;
              }
              goto LABEL_4;
            }
          }
          double v32 = &v31[-v19];
          for (uint64_t i = v31; v32 < end; ++i)
          {
            CGPoint v34 = *v32++;
            *uint64_t i = v34;
          }
          uint64_t v35 = &v21[v19];
          v3->__end_ = i;
          if (v31 != v35) {
            memmove(&v31[-(v31 - v35)], v21, (char *)v31 - (char *)v35);
          }
          size_t v7 = v30 - __p;
          if (v30 == __p)
          {
            end = i;
            uint64_t v18 = __p;
            if (!__p) {
              goto LABEL_4;
            }
LABEL_50:
            uint64_t v50 = v18;
            operator delete(v18);
            goto LABEL_4;
          }
          memmove(v21, __p, v7);
          end = i;
          uint64_t v18 = __p;
          if (__p) {
            goto LABEL_50;
          }
        }
        else
        {
          uint64_t v23 = v13;
          uint64_t v24 = v20 >> 4;
          unint64_t v25 = (v20 >> 4) + v19;
          if (v25 >> 60) {
            sub_1C494A220();
          }
          uint64_t v26 = (char *)value - (char *)v3->__begin_;
          if (v26 >> 3 > v25) {
            unint64_t v25 = v26 >> 3;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            if (v27 >> 60) {
              sub_1C4949AA8();
            }
            double v28 = (char *)operator new(16 * v27);
          }
          else
          {
            double v28 = 0;
          }
          uint64_t v36 = &v28[16 * v24];
          uint64_t v37 = 16 * v19;
          uint64_t v38 = &v36[16 * v19];
          uint64_t v39 = v36;
          do
          {
            long long v40 = *v16++;
            *(_OWORD *)uint64_t v39 = v40;
            v39 += 16;
            v37 -= 16;
          }
          while (v37);
          begin = v48->__begin_;
          if (v48->__begin_ != v21)
          {
            long long v42 = v21;
            do
            {
              *((CGPoint *)v36 - 1) = v42[-1];
              v36 -= 16;
              --v42;
            }
            while (v42 != begin);
            end = v48->__end_;
          }
          int64_t v43 = (char *)end - (char *)v21;
          if (end != v21) {
            memmove(v38, v21, (char *)end - (char *)v21);
          }
          long long v44 = v48->__begin_;
          end = (CGPoint *)&v38[v43];
          v48->__begin_ = (CGPoint *)v36;
          v48->__end_ = (CGPoint *)&v38[v43];
          uint64_t v3 = v48;
          v48->__end_cap_.__value_ = (CGPoint *)&v28[16 * v27];
          if (v44) {
            operator delete(v44);
          }
          uint64_t v13 = v23;
          uint64_t v11 = v46;
          uint64_t v18 = __p;
          if (__p) {
            goto LABEL_50;
          }
        }
LABEL_4:
        ++v14;
      }
      while (v14 != v11);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v51, (uint64_t)v55, 16, v10);
    }
    while (v11);
  }

  return result;
}

- (vector<std::vector<CGPoint>,)strokePoints
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = self->_segments;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v26, (uint64_t)v30, 16, v6);
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v4);
        }
        long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (v16)
        {
          objc_msgSend_strokePoints(v16, v7, v8, v9, v10, v11);
          uint64_t v17 = __p;
          uint64_t v18 = (uint64_t)v25;
        }
        else
        {
          uint64_t v18 = 0;
          uint64_t v17 = 0;
          __p = 0;
          unint64_t v25 = 0;
        }
        sub_1C4AAAF6C((char ***)retstr, (uint64_t)retstr->__end_, v17, v18, 0xAAAAAAAAAAAAAAABLL * ((v18 - (uint64_t)v17) >> 3));
        if (__p)
        {
          uint64_t v19 = v25;
          uint64_t v15 = __p;
          if (v25 != __p)
          {
            uint64_t v20 = v25;
            do
            {
              uint64_t v22 = *(v20 - 3);
              v20 -= 3;
              uint64_t v21 = v22;
              if (v22)
              {
                *(v19 - 2) = v21;
                operator delete(v21);
              }
              uint64_t v19 = v20;
            }
            while (v20 != __p);
            uint64_t v15 = __p;
          }
          unint64_t v25 = __p;
          operator delete(v15);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v26, (uint64_t)v30, 16, v11);
    }
    while (v12);
  }

  return result;
}

- (vector<CGPoint,)filteredPoints:(CHTransformedTextLine *)self
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = self->_segments;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v37, (uint64_t)v41, 16, v8);
  if (v14)
  {
    uint64_t v34 = *(void *)v38;
    do
    {
      uint64_t v15 = 0;
      uint64_t v33 = v14;
      do
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
        if (v16)
        {
          objc_msgSend_filteredPoints_(v16, v9, v10, v11, v12, v13, width, height);
          uint64_t v17 = v36;
          if (v36 != v35)
          {
            unint64_t v18 = 0;
            end = retstr->__end_;
            uint64_t v17 = v35;
            while (1)
            {
              uint64_t v21 = (CGPoint *)&v17[16 * v18];
              value = retstr->__end_cap_.__value_;
              if (end >= value) {
                break;
              }
              CGPoint *end = *v21;
              uint64_t v20 = end + 1;
LABEL_11:
              retstr->__end_ = v20;
              ++v18;
              uint64_t v17 = v35;
              end = v20;
              if (v18 >= (v36 - v35) >> 4) {
                goto LABEL_28;
              }
            }
            begin = retstr->__begin_;
            uint64_t v24 = end - retstr->__begin_;
            unint64_t v25 = v24 + 1;
            if ((unint64_t)(v24 + 1) >> 60) {
              sub_1C494A220();
            }
            uint64_t v26 = (char *)value - (char *)begin;
            if (v26 >> 3 > v25) {
              unint64_t v25 = v26 >> 3;
            }
            if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v27 = v25;
            }
            if (v27)
            {
              if (v27 >> 60) {
                sub_1C4949AA8();
              }
              long long v28 = (char *)operator new(16 * v27);
              uint64_t v29 = (uint64_t)&v28[16 * v24];
              *(CGPoint *)uint64_t v29 = *v21;
              double v30 = (CGPoint *)v29;
              if (end == begin) {
                goto LABEL_22;
              }
              do
              {
LABEL_25:
                v30[-1] = end[-1];
                --v30;
                --end;
              }
              while (end != begin);
              end = retstr->__begin_;
              uint64_t v20 = (CGPoint *)(v29 + 16);
              retstr->__begin_ = v30;
              retstr->__end_ = (CGPoint *)(v29 + 16);
              retstr->__end_cap_.__value_ = (CGPoint *)&v28[16 * v27];
              if (!end) {
                goto LABEL_11;
              }
            }
            else
            {
              long long v28 = 0;
              uint64_t v29 = 16 * v24;
              *(CGPoint *)(16 * v24) = *v21;
              double v30 = (CGPoint *)(16 * v24);
              if (end != begin) {
                goto LABEL_25;
              }
LABEL_22:
              uint64_t v20 = (CGPoint *)(v29 + 16);
              retstr->__begin_ = v30;
              retstr->__end_ = (CGPoint *)(v29 + 16);
              retstr->__end_cap_.__value_ = (CGPoint *)&v28[16 * v27];
              if (!end) {
                goto LABEL_11;
              }
            }
            operator delete(end);
            goto LABEL_11;
          }
LABEL_28:
          uint64_t v14 = v33;
          if (v17)
          {
            uint64_t v36 = v17;
            operator delete(v17);
          }
        }
        ++v15;
      }
      while (v15 != v14);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v37, (uint64_t)v41, 16, v13);
    }
    while (v14);
  }

  return result;
}

- (vector<CGPoint,)clippedPoints:(CHTransformedTextLine *)self min:(SEL)a3 max:(CGSize)a4
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  double height = a4.height;
  double width = a4.width;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = self->_segments;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v43, (uint64_t)v47, 16, v14);
  if (v20)
  {
    uint64_t v40 = *(void *)v44;
    do
    {
      uint64_t v21 = 0;
      uint64_t v39 = v20;
      do
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v43 + 1) + 8 * v21);
        if (v22)
        {
          objc_msgSend_clippedPoints_min_max_(v22, v15, v16, v17, v18, v19, width, height, v9, v8, x, y);
          uint64_t v23 = v42;
          if (v42 != v41)
          {
            unint64_t v24 = 0;
            end = retstr->__end_;
            uint64_t v23 = v41;
            while (1)
            {
              unint64_t v27 = (CGPoint *)&v23[16 * v24];
              value = retstr->__end_cap_.__value_;
              if (end >= value) {
                break;
              }
              CGPoint *end = *v27;
              uint64_t v26 = end + 1;
LABEL_11:
              retstr->__end_ = v26;
              ++v24;
              uint64_t v23 = v41;
              end = v26;
              if (v24 >= (v42 - v41) >> 4) {
                goto LABEL_28;
              }
            }
            begin = retstr->__begin_;
            uint64_t v30 = end - retstr->__begin_;
            unint64_t v31 = v30 + 1;
            if ((unint64_t)(v30 + 1) >> 60) {
              sub_1C494A220();
            }
            uint64_t v32 = (char *)value - (char *)begin;
            if (v32 >> 3 > v31) {
              unint64_t v31 = v32 >> 3;
            }
            if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v33 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v33 = v31;
            }
            if (v33)
            {
              if (v33 >> 60) {
                sub_1C4949AA8();
              }
              uint64_t v34 = (char *)operator new(16 * v33);
              uint64_t v35 = (uint64_t)&v34[16 * v30];
              *(CGPoint *)uint64_t v35 = *v27;
              uint64_t v36 = (CGPoint *)v35;
              if (end == begin) {
                goto LABEL_22;
              }
              do
              {
LABEL_25:
                v36[-1] = end[-1];
                --v36;
                --end;
              }
              while (end != begin);
              end = retstr->__begin_;
              uint64_t v26 = (CGPoint *)(v35 + 16);
              retstr->__begin_ = v36;
              retstr->__end_ = (CGPoint *)(v35 + 16);
              retstr->__end_cap_.__value_ = (CGPoint *)&v34[16 * v33];
              if (!end) {
                goto LABEL_11;
              }
            }
            else
            {
              uint64_t v34 = 0;
              uint64_t v35 = 16 * v30;
              *(CGPoint *)(16 * v30) = *v27;
              uint64_t v36 = (CGPoint *)(16 * v30);
              if (end != begin) {
                goto LABEL_25;
              }
LABEL_22:
              uint64_t v26 = (CGPoint *)(v35 + 16);
              retstr->__begin_ = v36;
              retstr->__end_ = (CGPoint *)(v35 + 16);
              retstr->__end_cap_.__value_ = (CGPoint *)&v34[16 * v33];
              if (!end) {
                goto LABEL_11;
              }
            }
            operator delete(end);
            goto LABEL_11;
          }
LABEL_28:
          uint64_t v20 = v39;
          if (v23)
          {
            uint64_t v42 = v23;
            operator delete(v23);
          }
        }
        ++v21;
      }
      while (v21 != v20);
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v43, (uint64_t)v47, 16, v19);
    }
    while (v20);
  }

  return result;
}

- (BoundingBox)boundingBox
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  p_x_min = &v2->_boundingBox.x_min;
  if (v2->_boundingBox.x_max - v2->_boundingBox.x_min == 0.0)
  {
    objc_msgSend_points(v2, v3, v4, v5, v6, v7);
    if (v24 == v25)
    {
      double v9 = 1.79769313e308;
      double v10 = -1.79769313e308;
      double v11 = -1.79769313e308;
      double v12 = 1.79769313e308;
      if (!v24) {
        goto LABEL_15;
      }
    }
    else
    {
      double v9 = 1.79769313e308;
      double v10 = -1.79769313e308;
      double v11 = -1.79769313e308;
      double v12 = 1.79769313e308;
      double v13 = -1.79769313e308;
      double v14 = 1.79769313e308;
      double v15 = -1.79769313e308;
      double v16 = 1.79769313e308;
      uint64_t v17 = v24;
      do
      {
        double v18 = *v17;
        double v19 = v17[1];
        v17 += 2;
        if (v16 > v18)
        {
          double v12 = v18;
          double v16 = v18;
        }
        if (v15 < v18)
        {
          double v11 = v18;
          double v15 = v18;
        }
        if (v14 > v19)
        {
          double v9 = v19;
          double v14 = v19;
        }
        if (v13 < v19)
        {
          double v10 = v19;
          double v13 = v19;
        }
      }
      while (v17 != v25);
      if (!v24) {
        goto LABEL_15;
      }
    }
    operator delete(v24);
LABEL_15:
    double *p_x_min = v12;
    v2->_boundingBox.x_madouble x = v11;
    v2->_boundingBox.double y_min = v9;
    v2->_boundingBox.y_madouble x = v10;
  }
  objc_sync_exit(v2);

  double v20 = *p_x_min;
  x_madouble x = v2->_boundingBox.x_max;
  double y_min = v2->_boundingBox.y_min;
  y_madouble x = v2->_boundingBox.y_max;
  result.y_madouble x = y_max;
  result.double y_min = y_min;
  result.x_madouble x = x_max;
  result.x_min = v20;
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

- (id)textStrokes
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v8 = self->_segments;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16, v10);
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v8);
        }
        double v19 = objc_msgSend_textStrokes(*(void **)(*((void *)&v25 + 1) + 8 * i), v11, v12, v13, v14, v15, (void)v25);
        objc_msgSend_addObjectsFromArray_(v7, v20, (uint64_t)v19, v21, v22, v23);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16, v15);
    }
    while (v16);
  }

  return v7;
}

- (id)tokens
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v8 = self->_segments;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16, v10);
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v8);
        }
        double v19 = objc_msgSend_tokens(*(void **)(*((void *)&v25 + 1) + 8 * i), v11, v12, v13, v14, v15, (void)v25);
        objc_msgSend_addObjectsFromArray_(v7, v20, (uint64_t)v19, v21, v22, v23);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16, v15);
    }
    while (v16);
  }

  return v7;
}

- (id)locale
{
  if (objc_msgSend_count(self->_segments, a2, v2, v3, v4, v5))
  {
    double v11 = objc_msgSend_objectAtIndexedSubscript_(self->_segments, v7, 0, v8, v9, v10);
    uint64_t v17 = objc_msgSend_locale(v11, v12, v13, v14, v15, v16);

    double v18 = (void *)v17;
  }
  else
  {
    double v18 = 0;
  }
  return v18;
}

- (NSArray)segments
{
  return (NSArray *)objc_getProperty(self, a2, 424, 1);
}

- (BOOL)fromCachedTokens
{
  return self->_fromCachedTokens;
}

- (void)setFromCachedTokens:(BOOL)a3
{
  self->_fromCachedTokens = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  p_principalLines = &self->_principalLines;
  begin = p_principalLines->top.__begin_;
  if (begin)
  {
    p_principalLines->top.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v5 = p_principalLines->median.__begin_;
  if (v5)
  {
    p_principalLines->median.__end_ = v5;
    operator delete(v5);
  }
  uint64_t v6 = p_principalLines->base.__begin_;
  if (v6)
  {
    p_principalLines->base.__end_ = v6;
    operator delete(v6);
  }
  uint64_t v7 = p_principalLines->descender.__begin_;
  if (p_principalLines->descender.__begin_)
  {
    p_principalLines->descender.__end_ = v7;
    operator delete(v7);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = xmmword_1C4C3B2A0;
  *(_OWORD *)((char *)self + 392) = xmmword_1C4C3B2A0;
  return self;
}

@end