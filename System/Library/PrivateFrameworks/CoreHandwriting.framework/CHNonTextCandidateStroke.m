@interface CHNonTextCandidateStroke
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBoundingBoxOverlappingWithStroke:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHorizontalAlignedWithStroke:(id)a3;
- (BOOL)isLongHorizontalNonTextLine;
- (BOOL)isSupportedByValidTextStrokesOrNonTextCandidates:(id)a3;
- (BOOL)isVerticalMathHorizontalLine;
- (CHEncodedStrokeIdentifier)strokeIdentifier;
- (CHNonTextCandidateStroke)initWithCoder:(id)a3;
- (CHNonTextCandidateStroke)initWithStroke:(id)a3 consistingOfSubstrokes:(id)a4 classificationAsNonText:(int64_t)a5 lineOrientation:(double)a6 lineError:(double)a7 containerScore:(double)a8 fallbackClassification:(int64_t)a9;
- (NSArray)supportingStrokeIdentifiers;
- (NSDictionary)sizeRatioByStrokeIdentifier;
- (NSDictionary)supportByStrokeIdentifier;
- (double)averageSupportFromStrokes:(id)a3;
- (double)sizeRatioFromStrokes:(id)a3;
- (double)support;
- (double)supportFromStrokes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithStrokeIdentifier:(double)a3 substrokesCount:(double)a4 classificationAsNonText:(double)a5 lineOrientation:(double)a6 lineError:(double)a7 containerScore:(double)a8 fallbackClassification:(double)a9 bounds:(uint64_t)a10 boundsDiagonal:(void *)a11 enlargedBounds:(void *)a12 rotatedBounds:(void *)a13 supportByStrokeIdentifier:(void *)a14 sizeRatioByStrokeIdentifier:(void *)a15 support:(void *)a16;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)effectiveClassification;
- (int64_t)nonTextClassification;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHNonTextCandidateStroke

- (CHNonTextCandidateStroke)initWithStroke:(id)a3 consistingOfSubstrokes:(id)a4 classificationAsNonText:(int64_t)a5 lineOrientation:(double)a6 lineError:(double)a7 containerScore:(double)a8 fallbackClassification:(int64_t)a9
{
  id v11 = a3;
  id v12 = a4;
  objc_msgSend_bounds(v11, v13, v14, v15, v16, v17);
  double v19 = v18;
  objc_msgSend_bounds(v11, v20, v21, v22, v23, v24);
  double v26 = v25;
  objc_msgSend_bounds(v11, v27, v28, v29, v30, v31);
  double v33 = v32;
  objc_msgSend_bounds(v11, v34, v35, v36, v37, v38);
  double v40 = v39;
  objc_msgSend_bounds(v11, v41, v42, v43, v44, v45);
  double v46 = sqrt(v33 * v40 + v19 * v26);
  CGRect v155 = CGRectInset(v154, v46 * -0.5, v46 * -0.5);
  CGFloat y = v155.origin.y;
  CGFloat x = v155.origin.x;
  CGFloat width = v155.size.width;
  CGFloat height = v155.size.height;
  objc_msgSend_bounds(v11, v49, v50, v51, v52, v53);
  if (a5 == 6)
  {
    v63 = objc_msgSend_firstObject(v12, v54, v55, v56, v57, v58);
    id v64 = v11;
    uint64_t v70 = objc_msgSend_convexHull(v63, v65, v66, v67, v68, v69);
    __p = 0;
    v152 = 0;
    v153 = 0;
    v72 = *(const void **)v70;
    uint64_t v71 = *(void *)(v70 + 8);
    int64_t v73 = v71 - *(void *)v70;
    if (v71 != *(void *)v70)
    {
      if (v73 < 0) {
        sub_1C494A220();
      }
      v74 = (char *)operator new(v71 - *(void *)v70);
      v75 = &v74[16 * (v73 >> 4)];
      __p = v74;
      v153 = v75;
      memcpy(v74, v72, v73);
      v152 = v75;
    }

    unint64_t v81 = 1;
LABEL_7:
    if (v81 < objc_msgSend_count(v12, v76, v77, v78, v79, v80))
    {
      for (unint64_t i = 0; ; ++i)
      {
        v88 = objc_msgSend_objectAtIndexedSubscript_(v12, v82, v81, v83, v84, v85);
        v94 = objc_msgSend_convexHull(v88, v89, v90, v91, v92, v93);
        uint64_t v95 = v94[1] - *v94;

        if (i >= v95 >> 4)
        {
          ++v81;
          goto LABEL_7;
        }
        v96 = objc_msgSend_objectAtIndexedSubscript_(v12, v76, v81, v78, v79, v80);
        v102 = (_OWORD *)(*objc_msgSend_convexHull(v96, v97, v98, v99, v100, v101) + 16 * i);
        v103 = v152;
        if (v152 < v153)
        {
          *(_OWORD *)v152 = *v102;
          v87 = v103 + 16;
          id v11 = v64;
          goto LABEL_10;
        }
        v104 = (char *)__p;
        uint64_t v105 = (v152 - (unsigned char *)__p) >> 4;
        unint64_t v106 = v105 + 1;
        if ((unint64_t)(v105 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v107 = v153 - (unsigned char *)__p;
        if ((v153 - (unsigned char *)__p) >> 3 > v106) {
          unint64_t v106 = v107 >> 3;
        }
        if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v108 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v108 = v106;
        }
        if (v108)
        {
          if (v108 >> 60) {
            sub_1C4949AA8();
          }
          v109 = (char *)operator new(16 * v108);
          v110 = &v109[16 * v105];
          *(_OWORD *)v110 = *v102;
          v111 = v110;
          if (v103 == v104)
          {
LABEL_27:
            v87 = v110 + 16;
            __p = v111;
            v153 = &v109[16 * v108];
            id v11 = v64;
            if (!v103) {
              goto LABEL_10;
            }
LABEL_28:
            operator delete(v103);
            goto LABEL_10;
          }
        }
        else
        {
          v109 = 0;
          v110 = (char *)(16 * v105);
          *(_OWORD *)(16 * v105) = *v102;
          v111 = (char *)(16 * v105);
          if (v103 == v104) {
            goto LABEL_27;
          }
        }
        do
        {
          *((_OWORD *)v111 - 1) = *((_OWORD *)v103 - 1);
          v111 -= 16;
          v103 -= 16;
        }
        while (v103 != v104);
        v103 = v104;
        v87 = v110 + 16;
        __p = v111;
        v153 = &v109[16 * v108];
        id v11 = v64;
        if (v103) {
          goto LABEL_28;
        }
LABEL_10:
        v152 = v87;
      }
    }
    v116 = objc_opt_class();
    objc_msgSend_boundingBoxOfPoints_rotatedAroundPoint_byAngle_(v116, v117, (uint64_t)&__p, v118, v119, v120, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), -a6);
    uint64_t v112 = v121;
    uint64_t v113 = v122;
    uint64_t v114 = v123;
    uint64_t v115 = v124;
    if (__p)
    {
      v152 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t v112 = v59;
    uint64_t v113 = v60;
    uint64_t v114 = v61;
    uint64_t v115 = v62;
  }
  v125 = objc_msgSend_encodedStrokeIdentifier(v11, v54, v55, v56, v57, v58);
  uint64_t v131 = objc_msgSend_count(v12, v126, v127, v128, v129, v130);
  objc_msgSend_bounds(v11, v132, v133, v134, v135, v136);
  v142 = (CHNonTextCandidateStroke *)objc_msgSend_initWithStrokeIdentifier_substrokesCount_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_bounds_boundsDiagonal_enlargedBounds_rotatedBounds_supportByStrokeIdentifier_sizeRatioByStrokeIdentifier_support_(self, v137, (uint64_t)v125, v131, a5, a9, 0, 0, a6, a7, a8, v138, v139, v140, v141, v46, *(void *)&x, *(void *)&y, *(void *)&width,
                                       *(void *)&height,
                                       v112,
                                       v113,
                                       v114,
                                       v115,
                                       0);

  return v142;
}

- (id)initWithStrokeIdentifier:(double)a3 substrokesCount:(double)a4 classificationAsNonText:(double)a5 lineOrientation:(double)a6 lineError:(double)a7 containerScore:(double)a8 fallbackClassification:(double)a9 bounds:(uint64_t)a10 boundsDiagonal:(void *)a11 enlargedBounds:(void *)a12 rotatedBounds:(void *)a13 supportByStrokeIdentifier:(void *)a14 sizeRatioByStrokeIdentifier:(void *)a15 support:(void *)a16
{
  id v40 = a11;
  id v41 = a15;
  id v42 = a16;
  v60.receiver = a1;
  v60.super_class = (Class)CHNonTextCandidateStroke;
  uint64_t v43 = (id *)objc_msgSendSuper2(&v60, sel_init);
  uint64_t v44 = v43;
  if (v43)
  {
    objc_storeStrong(v43 + 5, a11);
    v44[6] = a13;
    v44[7] = a12;
    v44[4] = a14;
    *((double *)v44 + 8) = a3;
    *((double *)v44 + 9) = a4;
    *((double *)v44 + 12) = a5;
    *((double *)v44 + 13) = a6;
    *((double *)v44 + 14) = a7;
    *((double *)v44 + 15) = a8;
    *((double *)v44 + 10) = a2;
    *((double *)v44 + 11) = a9;
    v44[16] = a17;
    v44[17] = a18;
    v44[18] = a19;
    v44[19] = a20;
    v44[20] = a21;
    v44[21] = a22;
    v44[22] = a23;
    v44[23] = a24;
    if (v41) {
      id v50 = (id)objc_msgSend_mutableCopy(v41, v45, v46, v47, v48, v49);
    }
    else {
      id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v51 = v44[1];
    v44[1] = v50;

    if (v42) {
      id v57 = (id)objc_msgSend_mutableCopy(v42, v52, v53, v54, v55, v56);
    }
    else {
      id v57 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v58 = v44[2];
    v44[2] = v57;

    v44[3] = a25;
  }

  return v44;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7 = objc_msgSend_allocWithZone_(CHNonTextCandidateStroke, a2, (uint64_t)a3, v3, v4, v5);
  return (id)objc_msgSend_initWithStrokeIdentifier_substrokesCount_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_bounds_boundsDiagonal_enlargedBounds_rotatedBounds_supportByStrokeIdentifier_sizeRatioByStrokeIdentifier_support_(v7, v8, (uint64_t)self->_strokeIdentifier, self->_substrokesCount, self->_classificationAsNonText, self->_fallbackClassification, self->_supportByStrokeIdentifier, self->_sizeRatioByStrokeIdentifier, self->_lineOrientationAngle, self->_lineError, self->_containerScore, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height, self->_boundsDiagonal, *(void *)&self->_enlargedBounds.origin.x, *(void *)&self->_enlargedBounds.origin.y, *(void *)&self->_enlargedBounds.size.width,
               *(void *)&self->_enlargedBounds.size.height,
               *(void *)&self->_rotatedBounds.origin.x,
               *(void *)&self->_rotatedBounds.origin.y,
               *(void *)&self->_rotatedBounds.size.width,
               *(void *)&self->_rotatedBounds.size.height,
               *(void *)&self->_support);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v7 = objc_msgSend_allocWithZone_(CHMutableNonTextCandidateStroke, a2, (uint64_t)a3, v3, v4, v5);
  return (id)objc_msgSend_initWithStrokeIdentifier_substrokesCount_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_bounds_boundsDiagonal_enlargedBounds_rotatedBounds_supportByStrokeIdentifier_sizeRatioByStrokeIdentifier_support_(v7, v8, (uint64_t)self->_strokeIdentifier, self->_substrokesCount, self->_classificationAsNonText, self->_fallbackClassification, self->_supportByStrokeIdentifier, self->_sizeRatioByStrokeIdentifier, self->_lineOrientationAngle, self->_lineError, self->_containerScore, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height, self->_boundsDiagonal, *(void *)&self->_enlargedBounds.origin.x, *(void *)&self->_enlargedBounds.origin.y, *(void *)&self->_enlargedBounds.size.width,
               *(void *)&self->_enlargedBounds.size.height,
               *(void *)&self->_rotatedBounds.origin.x,
               *(void *)&self->_rotatedBounds.origin.y,
               *(void *)&self->_rotatedBounds.size.width,
               *(void *)&self->_rotatedBounds.size.height,
               *(void *)&self->_support);
}

- (int64_t)effectiveClassification
{
  int64_t result = self->_classificationAsNonText;
  double v4 = 0.22;
  if (result == 6) {
    double v4 = 0.7;
  }
  if (self->_support < v4) {
    return self->_fallbackClassification;
  }
  return result;
}

- (int64_t)nonTextClassification
{
  return self->_classificationAsNonText;
}

- (NSArray)supportingStrokeIdentifiers
{
  return (NSArray *)objc_msgSend_allKeys(self->_supportByStrokeIdentifier, a2, v2, v3, v4, v5);
}

- (BOOL)isVerticalMathHorizontalLine
{
  return self->_lineError < 0.2 && fabs(self->_lineOrientationAngle) < 0.196349541;
}

- (BOOL)isLongHorizontalNonTextLine
{
  if (self) {
    LOBYTE(self) = self->_classificationAsNonText == 6
  }
                && fabs(self->_lineOrientationAngle) <= 0.785398163
                && self->_boundsDiagonal > 105.0;
  return (char)self;
}

- (BOOL)isHorizontalAlignedWithStroke:(id)a3
{
  id v4 = a3;
  objc_msgSend_bounds(v4, v5, v6, v7, v8, v9);
  double MinX = CGRectGetMinX(v26);
  if (self)
  {
    CGFloat x = self->_bounds.origin.x;
    CGFloat y = self->_bounds.origin.y;
    CGFloat width = self->_bounds.size.width;
    CGFloat height = self->_bounds.size.height;
  }
  else
  {
    CGFloat y = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    CGFloat x = 0.0;
  }
  if (MinX < CGRectGetMinX(*(CGRect *)&x)) {
    goto LABEL_7;
  }
  objc_msgSend_bounds(v4, v15, v16, v17, v18, v19);
  double MaxX = CGRectGetMaxX(v27);
  if (self)
  {
    CGFloat v21 = self->_bounds.origin.x;
    CGFloat v22 = self->_bounds.origin.y;
    CGFloat v23 = self->_bounds.size.width;
    CGFloat v24 = self->_bounds.size.height;
  }
  else
  {
    CGFloat v22 = 0.0;
    CGFloat v23 = 0.0;
    CGFloat v24 = 0.0;
    CGFloat v21 = 0.0;
  }
  if (MaxX <= CGRectGetMaxX(*(CGRect *)&v21))
  {

    return 1;
  }
  else
  {
LABEL_7:

    return 0;
  }
}

- (BOOL)hasBoundingBoxOverlappingWithStroke:(id)a3
{
  id v4 = a3;
  v10 = v4;
  if (self)
  {
    CGFloat x = self->_bounds.origin.x;
    CGFloat y = self->_bounds.origin.y;
    CGFloat width = self->_bounds.size.width;
    CGFloat height = self->_bounds.size.height;
  }
  else
  {
    CGFloat y = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    CGFloat x = 0.0;
  }
  objc_msgSend_bounds(v4, v5, v6, v7, v8, v9);
  v22.origin.CGFloat x = v15;
  v22.origin.CGFloat y = v16;
  v22.size.CGFloat width = v17;
  v22.size.CGFloat height = v18;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  BOOL v19 = CGRectIntersectsRect(v21, v22);

  return v19;
}

- (BOOL)isSupportedByValidTextStrokesOrNonTextCandidates:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v70 = a3;
  uint64_t v67 = self;
  uint64_t v9 = objc_msgSend_supportingStrokeIdentifiers(self, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_count(v9, v10, v11, v12, v13, v14);

  if (v15)
  {
    uint64_t v68 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v16, v17, v18, v19, v20);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    objc_msgSend_supportingStrokeIdentifiers(self, v21, v22, v23, v24, v25);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v75, (uint64_t)v80, 16, v27);
    if (v28)
    {
      uint64_t v29 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v76 != v29) {
            objc_enumerationMutation(obj);
          }
          double v33 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          id v34 = v70;
          uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v71, (uint64_t)v79, 16, v36);
          if (v42)
          {
            uint64_t v43 = *(void *)v72;
            do
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v72 != v43) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v45 = objc_msgSend_strokeIdentifier(*(void **)(*((void *)&v71 + 1) + 8 * j), v37, v38, v39, v40, v41);
                char isEqual = objc_msgSend_isEqual_(v33, v46, (uint64_t)v45, v47, v48, v49);

                if (isEqual)
                {

                  goto LABEL_6;
                }
              }
              uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v71, (uint64_t)v79, 16, v41);
            }
            while (v42);
          }

          objc_msgSend_addObject_(v68, v51, (uint64_t)v33, v52, v53, v54);
LABEL_6:
          ;
        }
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v75, (uint64_t)v80, 16, v32);
      }
      while (v28);
    }

    if (objc_msgSend_count(v68, v55, v56, v57, v58, v59))
    {
      objc_msgSend_sizeRatioFromStrokes_(v67, v60, (uint64_t)v68, v61, v62, v63);
      BOOL v65 = v64 > 0.07;
    }
    else
    {
      BOOL v65 = 1;
    }
  }
  else
  {
    BOOL v65 = 1;
  }

  return v65;
}

- (double)supportFromStrokes:(id)a3
{
  uint64_t v9 = 0;
  v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C49DDE90;
  v8[3] = &unk_1E64E1BB8;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_enumerateObjectsUsingBlock_(a3, a2, (uint64_t)v8, v3, v4, v5);
  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (double)averageSupportFromStrokes:(id)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C49DE054;
  v9[3] = &unk_1E64E1BE0;
  v9[4] = self;
  v9[5] = &v14;
  v9[6] = &v10;
  objc_msgSend_enumerateObjectsUsingBlock_(a3, a2, (uint64_t)v9, v3, v4, v5);
  unint64_t v6 = v11[3];
  if (v6) {
    double v7 = v15[3] / (double)v6;
  }
  else {
    double v7 = 0.0;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (double)sizeRatioFromStrokes:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C49DE210;
  v22[3] = &unk_1E64E1BB8;
  v22[4] = self;
  v22[5] = &v23;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v5, (uint64_t)v22, v6, v7, v8);
  uint64_t v14 = objc_msgSend_count(v4, v9, v10, v11, v12, v13);
  double v20 = v24[3];
  if (v14) {
    double v20 = v20 / (double)(unint64_t)objc_msgSend_count(v4, v15, v16, v17, v18, v19);
  }
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v86 = a3;
  uint64_t v9 = objc_msgSend_strokeIdentifier(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v86, v10, (uint64_t)v9, @"strokeIdentifier", v11, v12);

  if (self) {
    objc_msgSend_encodeInteger_forKey_(v86, v13, self->_substrokesCount, @"substrokesCount", v14, v15);
  }
  else {
    objc_msgSend_encodeInteger_forKey_(v86, v13, 0, @"substrokesCount", v14, v15);
  }
  if (self) {
    objc_msgSend_encodeInteger_forKey_(v86, v16, self->_classificationAsNonText, @"classificationAsNonText", v17, v18);
  }
  else {
    objc_msgSend_encodeInteger_forKey_(v86, v16, 0, @"classificationAsNonText", v17, v18);
  }
  if (self) {
    objc_msgSend_encodeInteger_forKey_(v86, v19, self->_fallbackClassification, @"fallbackClassification", v20, v21);
  }
  else {
    objc_msgSend_encodeInteger_forKey_(v86, v19, 0, @"fallbackClassification", v20, v21);
  }
  if (self) {
    objc_msgSend_encodeDouble_forKey_(v86, v22, @"lineOrientation", v23, v24, v25, self->_lineOrientationAngle);
  }
  else {
    objc_msgSend_encodeDouble_forKey_(v86, v22, @"lineOrientation", v23, v24, v25, 0.0);
  }
  if (self) {
    objc_msgSend_encodeDouble_forKey_(v86, v26, @"lineError", v27, v28, v29, self->_lineError);
  }
  else {
    objc_msgSend_encodeDouble_forKey_(v86, v26, @"lineError", v27, v28, v29, 0.0);
  }
  if (self) {
    objc_msgSend_encodeDouble_forKey_(v86, v30, @"containerScore", v31, v32, v33, self->_containerScore);
  }
  else {
    objc_msgSend_encodeDouble_forKey_(v86, v30, @"containerScore", v31, v32, v33, 0.0);
  }
  uint64_t v37 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v34, (uint64_t)&self->_bounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v35, v36);
  objc_msgSend_encodeObject_forKey_(v86, v38, (uint64_t)v37, @"bounds", v39, v40);
  if (self) {
    objc_msgSend_encodeDouble_forKey_(v86, v41, @"boundsDiagonal", v42, v43, v44, self->_boundsDiagonal);
  }
  else {
    objc_msgSend_encodeDouble_forKey_(v86, v41, @"boundsDiagonal", v42, v43, v44, 0.0);
  }
  uint64_t v48 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v45, (uint64_t)&self->_enlargedBounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v46, v47);
  objc_msgSend_encodeObject_forKey_(v86, v49, (uint64_t)v48, @"enlargedBounds", v50, v51);
  uint64_t v55 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v52, (uint64_t)&self->_rotatedBounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v53, v54);
  objc_msgSend_encodeObject_forKey_(v86, v56, (uint64_t)v55, @"rotatedBounds", v57, v58);
  double v64 = objc_msgSend_supportByStrokeIdentifier(self, v59, v60, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v86, v65, (uint64_t)v64, @"supportByStrokeIdentifier", v66, v67);

  long long v73 = objc_msgSend_sizeRatioByStrokeIdentifier(self, v68, v69, v70, v71, v72);
  objc_msgSend_encodeObject_forKey_(v86, v74, (uint64_t)v73, @"sizeRatioByStrokeIdentifier", v75, v76);

  objc_msgSend_support(self, v77, v78, v79, v80, v81);
  objc_msgSend_encodeDouble_forKey_(v86, v82, @"support", v83, v84, v85);
}

- (CHNonTextCandidateStroke)initWithCoder:(id)a3
{
  v121[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v111 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v5, v4, @"strokeIdentifier", v6, v7);
  uint64_t v12 = objc_msgSend_decodeIntegerForKey_(v3, v8, @"substrokesCount", v9, v10, v11);
  uint64_t v109 = objc_msgSend_decodeIntegerForKey_(v3, v13, @"classificationAsNonText", v14, v15, v16);
  uint64_t v108 = objc_msgSend_decodeIntegerForKey_(v3, v17, @"fallbackClassification", v18, v19, v20);
  objc_msgSend_decodeDoubleForKey_(v3, v21, @"lineOrientation", v22, v23, v24);
  double v26 = v25;
  objc_msgSend_decodeDoubleForKey_(v3, v27, @"lineError", v28, v29, v30);
  double v32 = v31;
  uint64_t v107 = v12;
  objc_msgSend_decodeDoubleForKey_(v3, v33, @"containerScore", v34, v35, v36);
  double v38 = v37;
  uint64_t v39 = objc_opt_class();
  uint64_t v43 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v40, v39, @"bounds", v41, v42);
  long long v44 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v118 = *MEMORY[0x1E4F1DB20];
  long long v119 = v44;
  unint64_t v106 = v43;
  objc_msgSend_getValue_size_(v43, v45, (uint64_t)&v118, 32, v46, v47);
  objc_msgSend_decodeDoubleForKey_(v3, v48, @"boundsDiagonal", v49, v50, v51);
  double v53 = v52;
  uint64_t v54 = objc_opt_class();
  uint64_t v58 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v55, v54, @"enlargedBounds", v56, v57);
  objc_msgSend_getValue_size_(v58, v59, (uint64_t)&v115, 32, v60, v61);
  uint64_t v62 = objc_opt_class();
  uint64_t v66 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v63, v62, @"rotatedBounds", v64, v65);
  objc_msgSend_getValue_size_(v66, v67, (uint64_t)&v112, 32, v68, v69);
  uint64_t v70 = (void *)MEMORY[0x1E4F1CAD0];
  v121[0] = objc_opt_class();
  v121[1] = objc_opt_class();
  v121[2] = objc_opt_class();
  long long v74 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v71, (uint64_t)v121, 3, v72, v73);
  uint64_t v79 = objc_msgSend_setWithArray_(v70, v75, (uint64_t)v74, v76, v77, v78);
  uint64_t v83 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v80, (uint64_t)v79, @"supportByStrokeIdentifier", v81, v82);

  uint64_t v84 = (void *)MEMORY[0x1E4F1CAD0];
  v120[0] = objc_opt_class();
  v120[1] = objc_opt_class();
  v120[2] = objc_opt_class();
  v88 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v85, (uint64_t)v120, 3, v86, v87);
  uint64_t v93 = objc_msgSend_setWithArray_(v84, v89, (uint64_t)v88, v90, v91, v92);
  v97 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v94, (uint64_t)v93, @"sizeRatioByStrokeIdentifier", v95, v96);

  objc_msgSend_decodeDoubleForKey_(v3, v98, @"support", v99, v100, v101);
  v104 = (CHNonTextCandidateStroke *)objc_msgSend_initWithStrokeIdentifier_substrokesCount_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_bounds_boundsDiagonal_enlargedBounds_rotatedBounds_supportByStrokeIdentifier_sizeRatioByStrokeIdentifier_support_(self, v102, (uint64_t)v111, v107, v109, v108, v83, v97, v26, v32, v38, v118, v119, v53, v115, v116, v117, v112, v113,
                                       v114,
                                       v103);

  return v104;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (CHNonTextCandidateStroke *)v4;
    uint64_t v11 = v5;
    if (self)
    {
      if (self != v5)
      {
        strokeIdentifier = self->_strokeIdentifier;
        objc_msgSend_strokeIdentifier(v5, v6, v7, v8, v9, v10);
        uint64_t v18 = (CHEncodedStrokeIdentifier *)objc_claimAutoreleasedReturnValue();
        if (strokeIdentifier == v18)
        {
        }
        else
        {
          uint64_t v19 = objc_msgSend_strokeIdentifier(v11, v13, v14, v15, v16, v17);
          int isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)self->_strokeIdentifier, v21, v22, v23);

          if (!isEqual) {
            goto LABEL_35;
          }
        }
        int64_t substrokesCount = self->_substrokesCount;
        if (v11)
        {
          if (substrokesCount != v11->_substrokesCount
            || self->_classificationAsNonText != v11->_classificationAsNonText
            || self->_fallbackClassification != v11->_fallbackClassification
            || vabdd_f64(self->_lineOrientationAngle, v11->_lineOrientationAngle) >= 2.22044605e-16
            || vabdd_f64(self->_lineError, v11->_lineError) >= 2.22044605e-16)
          {
            goto LABEL_35;
          }
          double containerScore = v11->_containerScore;
        }
        else
        {
          if (substrokesCount) {
            goto LABEL_35;
          }
          if (self->_classificationAsNonText) {
            goto LABEL_35;
          }
          if (self->_fallbackClassification) {
            goto LABEL_35;
          }
          if (fabs(self->_lineOrientationAngle) >= 2.22044605e-16) {
            goto LABEL_35;
          }
          double containerScore = 0.0;
          if (fabs(self->_lineError) >= 2.22044605e-16) {
            goto LABEL_35;
          }
        }
        if (vabdd_f64(self->_containerScore, containerScore) >= 2.22044605e-16) {
          goto LABEL_35;
        }
        if (v11)
        {
          CGFloat x = v11->_bounds.origin.x;
          CGFloat y = v11->_bounds.origin.y;
          CGFloat width = v11->_bounds.size.width;
          CGFloat height = v11->_bounds.size.height;
        }
        else
        {
          CGFloat y = 0.0;
          CGFloat width = 0.0;
          CGFloat height = 0.0;
          CGFloat x = 0.0;
        }
        if (!CGRectEqualToRect(self->_bounds, *(CGRect *)&x)) {
          goto LABEL_35;
        }
        double boundsDiagonal = self->_boundsDiagonal;
        if (v11)
        {
          if (vabdd_f64(boundsDiagonal, v11->_boundsDiagonal) >= 2.22044605e-16)
          {
LABEL_35:
            LOBYTE(self) = 0;
            goto LABEL_36;
          }
        }
        else if (vabdd_f64(boundsDiagonal, 0.0) >= 2.22044605e-16)
        {
          goto LABEL_35;
        }
        if (v11)
        {
          CGFloat v32 = v11->_enlargedBounds.origin.x;
          CGFloat v33 = v11->_enlargedBounds.origin.y;
          CGFloat v34 = v11->_enlargedBounds.size.width;
          CGFloat v35 = v11->_enlargedBounds.size.height;
        }
        else
        {
          CGFloat v33 = 0.0;
          CGFloat v34 = 0.0;
          CGFloat v35 = 0.0;
          CGFloat v32 = 0.0;
        }
        if (!CGRectEqualToRect(self->_enlargedBounds, *(CGRect *)&v32)) {
          goto LABEL_35;
        }
        if (v11)
        {
          CGFloat v36 = v11->_rotatedBounds.origin.x;
          CGFloat v37 = v11->_rotatedBounds.origin.y;
          CGFloat v38 = v11->_rotatedBounds.size.width;
          CGFloat v39 = v11->_rotatedBounds.size.height;
        }
        else
        {
          CGFloat v37 = 0.0;
          CGFloat v38 = 0.0;
          CGFloat v39 = 0.0;
          CGFloat v36 = 0.0;
        }
        if (!CGRectEqualToRect(self->_rotatedBounds, *(CGRect *)&v36)) {
          goto LABEL_35;
        }
        supportByStrokeIdentifier = self->_supportByStrokeIdentifier;
        objc_msgSend_supportByStrokeIdentifier(v11, v40, v41, v42, v43, v44);
        uint64_t v51 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        if (supportByStrokeIdentifier == v51)
        {
        }
        else
        {
          double v52 = objc_msgSend_supportByStrokeIdentifier(v11, v46, v47, v48, v49, v50);
          int v57 = objc_msgSend_isEqual_(v52, v53, (uint64_t)self->_supportByStrokeIdentifier, v54, v55, v56);

          if (!v57) {
            goto LABEL_35;
          }
        }
        sizeRatioByStrokeIdentifier = self->_sizeRatioByStrokeIdentifier;
        objc_msgSend_sizeRatioByStrokeIdentifier(v11, v58, v59, v60, v61, v62);
        uint64_t v69 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        if (sizeRatioByStrokeIdentifier == v69)
        {
        }
        else
        {
          uint64_t v70 = objc_msgSend_sizeRatioByStrokeIdentifier(v11, v64, v65, v66, v67, v68);
          int v75 = objc_msgSend_isEqual_(v70, v71, (uint64_t)self->_sizeRatioByStrokeIdentifier, v72, v73, v74);

          if (!v75) {
            goto LABEL_35;
          }
        }
        double support = self->_support;
        objc_msgSend_support(v11, v76, v77, v78, v79, v80);
        LOBYTE(self) = vabdd_f64(support, v83) < 2.22044605e-16;
        goto LABEL_36;
      }
      LOBYTE(self) = 1;
    }
LABEL_36:

    goto LABEL_37;
  }
  LOBYTE(self) = 0;
LABEL_37:

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v224 = objc_msgSend_hash(self->_strokeIdentifier, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_numberWithDouble_(NSNumber, v7, v8, v9, v10, v11, self->_lineOrientationAngle);
  uint64_t v223 = objc_msgSend_hash(v12, v13, v14, v15, v16, v17);

  uint64_t v23 = objc_msgSend_numberWithDouble_(NSNumber, v18, v19, v20, v21, v22, self->_lineError);
  uint64_t v222 = objc_msgSend_hash(v23, v24, v25, v26, v27, v28);

  CGFloat v34 = objc_msgSend_numberWithDouble_(NSNumber, v29, v30, v31, v32, v33, self->_containerScore);
  uint64_t v221 = objc_msgSend_hash(v34, v35, v36, v37, v38, v39);

  uint64_t v45 = objc_msgSend_numberWithDouble_(NSNumber, v40, v41, v42, v43, v44, self->_bounds.origin.x);
  uint64_t v220 = objc_msgSend_hash(v45, v46, v47, v48, v49, v50);
  uint64_t v56 = objc_msgSend_numberWithDouble_(NSNumber, v51, v52, v53, v54, v55, self->_bounds.origin.y);
  uint64_t v219 = objc_msgSend_hash(v56, v57, v58, v59, v60, v61);
  uint64_t v67 = objc_msgSend_numberWithDouble_(NSNumber, v62, v63, v64, v65, v66, self->_bounds.size.width);
  uint64_t v218 = objc_msgSend_hash(v67, v68, v69, v70, v71, v72);
  uint64_t v78 = objc_msgSend_numberWithDouble_(NSNumber, v73, v74, v75, v76, v77, self->_bounds.size.height);
  uint64_t v217 = objc_msgSend_hash(v78, v79, v80, v81, v82, v83);

  v89 = objc_msgSend_numberWithDouble_(NSNumber, v84, v85, v86, v87, v88, self->_boundsDiagonal);
  uint64_t v216 = objc_msgSend_hash(v89, v90, v91, v92, v93, v94);

  uint64_t v100 = objc_msgSend_numberWithDouble_(NSNumber, v95, v96, v97, v98, v99, self->_enlargedBounds.origin.x);
  uint64_t v215 = objc_msgSend_hash(v100, v101, v102, v103, v104, v105);
  v111 = objc_msgSend_numberWithDouble_(NSNumber, v106, v107, v108, v109, v110, self->_enlargedBounds.origin.y);
  uint64_t v214 = objc_msgSend_hash(v111, v112, v113, v114, v115, v116);
  uint64_t v122 = objc_msgSend_numberWithDouble_(NSNumber, v117, v118, v119, v120, v121, self->_enlargedBounds.size.width);
  uint64_t v213 = objc_msgSend_hash(v122, v123, v124, v125, v126, v127);
  uint64_t v133 = objc_msgSend_numberWithDouble_(NSNumber, v128, v129, v130, v131, v132, self->_enlargedBounds.size.height);
  uint64_t v212 = objc_msgSend_hash(v133, v134, v135, v136, v137, v138);

  v144 = objc_msgSend_numberWithDouble_(NSNumber, v139, v140, v141, v142, v143, self->_rotatedBounds.origin.x);
  uint64_t v150 = objc_msgSend_hash(v144, v145, v146, v147, v148, v149);
  v156 = objc_msgSend_numberWithDouble_(NSNumber, v151, v152, v153, v154, v155, self->_rotatedBounds.origin.y);
  uint64_t v162 = objc_msgSend_hash(v156, v157, v158, v159, v160, v161);
  v168 = objc_msgSend_numberWithDouble_(NSNumber, v163, v164, v165, v166, v167, self->_rotatedBounds.size.width);
  uint64_t v174 = objc_msgSend_hash(v168, v169, v170, v171, v172, v173);
  v180 = objc_msgSend_numberWithDouble_(NSNumber, v175, v176, v177, v178, v179, self->_rotatedBounds.size.height);
  uint64_t v186 = objc_msgSend_hash(v180, v181, v182, v183, v184, v185);

  uint64_t v192 = objc_msgSend_hash(self->_supportByStrokeIdentifier, v187, v188, v189, v190, v191);
  uint64_t v198 = objc_msgSend_hash(self->_sizeRatioByStrokeIdentifier, v193, v194, v195, v196, v197);
  v204 = objc_msgSend_numberWithDouble_(NSNumber, v199, v200, v201, v202, v203, self->_support);
  uint64_t v210 = objc_msgSend_hash(v204, v205, v206, v207, v208, v209);

  return v223 ^ v224 ^ v222 ^ v221 ^ v220 ^ v219 ^ v218 ^ v217 ^ v216 ^ v215 ^ v214 ^ v213 ^ v212 ^ v150 ^ v162 ^ v174 ^ v186 ^ v192 ^ v198 ^ v210 ^ self->_substrokesCount ^ self->_classificationAsNonText ^ self->_fallbackClassification;
}

- (CHEncodedStrokeIdentifier)strokeIdentifier
{
  return self->_strokeIdentifier;
}

- (double)support
{
  return self->_support;
}

- (NSDictionary)supportByStrokeIdentifier
{
  return &self->_supportByStrokeIdentifier->super;
}

- (NSDictionary)sizeRatioByStrokeIdentifier
{
  return &self->_sizeRatioByStrokeIdentifier->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIdentifier, 0);
  objc_storeStrong((id *)&self->_sizeRatioByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_supportByStrokeIdentifier, 0);
}

@end