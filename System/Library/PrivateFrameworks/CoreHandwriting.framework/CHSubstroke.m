@interface CHSubstroke
+ (BOOL)supportsSecureCoding;
+ (id)substrokesForStroke:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSubstroke:(id)a3;
- (CGRect)bounds;
- (CHEncodedStrokeIdentifier)strokeIdentifier;
- (CHSubstroke)initWithCoder:(id)a3;
- (CHSubstroke)initWithStrokeIdentifier:(id)a3 bounds:(CGRect)a4 startTimestamp:(double)a5 endTimestamp:(double)a6 convexHull:(const void *)a7 curvature:(double)a8;
- (double)curvature;
- (double)endTimestamp;
- (double)startTimestamp;
- (id).cxx_construct;
- (void)convexHull;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSubstroke

- (CHSubstroke)initWithStrokeIdentifier:(id)a3 bounds:(CGRect)a4 startTimestamp:(double)a5 endTimestamp:(double)a6 convexHull:(const void *)a7 curvature:(double)a8
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v18 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CHSubstroke;
  v19 = [(CHSubstroke *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_strokeIdentifier, a3);
    v20->_bounds.origin.CGFloat x = x;
    v20->_bounds.origin.CGFloat y = y;
    v20->_bounds.size.CGFloat width = width;
    v20->_bounds.size.CGFloat height = height;
    v20->_startTimestamp = a5;
    v20->_endTimestamp = a6;
    if (&v20->_convexHull != a7) {
      sub_1C49B7D84(&v20->_convexHull.__begin_, *(char **)a7, *((char **)a7 + 1), (uint64_t)(*((void *)a7 + 1) - *(void *)a7) >> 4);
    }
    v20->_curvature = a8;
  }

  return v20;
}

+ (id)substrokesForStroke:(id)a3
{
  id v3 = a3;
  v137 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7, v8);
  uint64_t v178 = 0;
  v179 = (double *)&v178;
  uint64_t v180 = 0x5012000000;
  v181 = sub_1C4B2CA34;
  v182 = nullsub_38;
  v183 = &unk_1C4CB5C62;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v184 = *MEMORY[0x1E4F1DB20];
  long long v185 = v9;
  v176[0] = 0;
  v176[1] = v176;
  v176[2] = 0x4012000000;
  v176[3] = sub_1C4B2CA44;
  v176[4] = nullsub_39;
  v176[5] = &unk_1C4CB5C62;
  int64x2_t v177 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v172[0] = 0;
  v172[1] = v172;
  v172[2] = 0x4812000000;
  v172[3] = sub_1C4B2CA54;
  v172[4] = sub_1C4B2CAA0;
  v172[5] = 0;
  uint64_t v173 = (uint64_t)&v173;
  v174 = &v173;
  uint64_t v175 = 0;
  uint64_t v168 = 0;
  v169 = (double *)&v168;
  uint64_t v170 = 0x2020000000;
  uint64_t v171 = 0;
  uint64_t v164 = 0;
  v165 = (double *)&v164;
  uint64_t v166 = 0x2020000000;
  uint64_t v167 = 0;
  uint64_t v160 = 0;
  v161 = (double *)&v160;
  uint64_t v162 = 0x2020000000;
  uint64_t v163 = 0;
  uint64_t v151 = 0;
  v152 = &v151;
  uint64_t v153 = 0x4812000000;
  v154 = sub_1C4B2CB08;
  v155 = sub_1C4B2CB2C;
  v156 = &unk_1C4CB5C62;
  v158 = 0;
  uint64_t v159 = 0;
  v157 = 0;
  v10 = objc_opt_class();
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = sub_1C4B2CB44;
  v141[3] = &unk_1E64E3F20;
  v144 = &v151;
  v145 = &v178;
  v146 = &v164;
  v147 = &v160;
  v148 = v176;
  v149 = v172;
  v150 = &v168;
  id v11 = v3;
  id v142 = v11;
  id v12 = v137;
  id v143 = v12;
  objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v10, v13, (uint64_t)v11, 0, 1, (uint64_t)v141);
  v20 = (float64x2_t *)v152[6];
  v19 = (char *)v152[7];
  if ((unint64_t)(v19 - (char *)v20) < 0x11)
  {
    if (v19 == (char *)v20) {
      goto LABEL_45;
    }
  }
  else
  {
    unint64_t v21 = (v19 - (char *)v20) >> 4;
    float64x2_t v22 = *v20;
    if (v21 <= 2) {
      unint64_t v21 = 2;
    }
    double v23 = 0.0;
    for (uint64_t i = 1; i != v21; ++i)
    {
      float64x2_t v25 = v20[i];
      float32x2_t v26 = vsub_f32(vcvt_f32_f64(v25), vcvt_f32_f64(v22));
      double v23 = v23 + sqrtf(vaddv_f32(vmul_f32(v26, v26)));
      float64x2_t v22 = v25;
    }
    if (v23 >= 10.0 && v169[3] != 0.0)
    {
      if (v19 == (char *)v20) {
        goto LABEL_45;
      }
      goto LABEL_36;
    }
  }
  if (!objc_msgSend_count(v12, v14, v15, v16, v17, v18))
  {
    if (v152[7] == v152[6]) {
      goto LABEL_45;
    }
LABEL_36:
    v77 = objc_opt_class();
    if (v77)
    {
      objc_msgSend_convexHullForPoints_(v77, v78, (uint64_t)(v152 + 6), v79, v80, v81);
    }
    else
    {
      __p = 0;
      v139 = 0;
      uint64_t v140 = 0;
    }
    v115 = [CHSubstroke alloc];
    v121 = objc_msgSend_encodedStrokeIdentifier(v11, v116, v117, v118, v119, v120);
    started = objc_msgSend_initWithStrokeIdentifier_bounds_startTimestamp_endTimestamp_convexHull_curvature_(v115, v122, (uint64_t)v121, (uint64_t)&__p, v123, v124, v179[6], v179[7], v179[8], v179[9], v165[3], v161[3], v169[3]);

    objc_msgSend_addObject_(v12, v126, (uint64_t)started, v127, v128, v129);
    if (__p)
    {
      v139 = __p;
      operator delete(__p);
    }
    goto LABEL_45;
  }
  v32 = objc_msgSend_lastObject(v12, v27, v28, v29, v30, v31, v3);
  CGFloat v33 = v179[6];
  CGFloat v34 = v179[7];
  CGFloat v35 = v179[8];
  CGFloat v36 = v179[9];
  objc_msgSend_bounds(v32, v37, v38, v39, v40, v41);
  v188.origin.CGFloat x = v42;
  v188.origin.CGFloat y = v43;
  v188.size.CGFloat width = v44;
  v188.size.CGFloat height = v45;
  v187.origin.CGFloat x = v33;
  v187.origin.CGFloat y = v34;
  v187.size.CGFloat width = v35;
  v187.size.CGFloat height = v36;
  v136 = v12;
  unint64_t v46 = 0;
  *(CGRect *)(v179 + 6) = CGRectUnion(v187, v188);
  while (1)
  {
    v53 = objc_msgSend_convexHull(v32, v47, v48, v49, v50, v51);
    if (v46 >= (uint64_t)(v53[1] - *v53) >> 4) {
      break;
    }
    v59 = v152;
    v60 = (_OWORD *)(*objc_msgSend_convexHull(v32, v54, v55, v56, v57, v58) + 16 * v46);
    v62 = (_OWORD *)v59[7];
    unint64_t v61 = v59[8];
    if ((unint64_t)v62 < v61)
    {
      _OWORD *v62 = *v60;
      v52 = v62 + 1;
      goto LABEL_14;
    }
    v63 = (_OWORD *)v59[6];
    uint64_t v64 = v62 - v63;
    unint64_t v65 = v64 + 1;
    if ((unint64_t)(v64 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v66 = v61 - (void)v63;
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
      v68 = (char *)operator new(16 * v67);
      v69 = &v68[16 * v64];
      *(_OWORD *)v69 = *v60;
      uint64_t v70 = (uint64_t)v69;
      if (v62 == v63)
      {
LABEL_31:
        v52 = v69 + 16;
        v59[6] = v70;
        v59[7] = (uint64_t)(v69 + 16);
        v59[8] = (uint64_t)&v68[16 * v67];
        if (!v62) {
          goto LABEL_14;
        }
LABEL_32:
        operator delete(v62);
        goto LABEL_14;
      }
    }
    else
    {
      v68 = 0;
      v69 = (char *)(16 * v64);
      *(_OWORD *)(16 * v64) = *v60;
      uint64_t v70 = 16 * v64;
      if (v62 == v63) {
        goto LABEL_31;
      }
    }
    do
    {
      *(_OWORD *)(v70 - 16) = *(v62 - 1);
      v70 -= 16;
      --v62;
    }
    while (v62 != v63);
    v62 = (_OWORD *)v59[6];
    v52 = v69 + 16;
    v59[6] = v70;
    v59[7] = (uint64_t)(v69 + 16);
    v59[8] = (uint64_t)&v68[16 * v67];
    if (v62) {
      goto LABEL_32;
    }
LABEL_14:
    v59[7] = (uint64_t)v52;
    ++v46;
  }
  v71 = objc_opt_class();
  id v12 = v136;
  if (v71)
  {
    objc_msgSend_convexHullForPoints_(v71, v72, (uint64_t)(v152 + 6), v74, v75, v76);
  }
  else
  {
    __p = 0;
    v139 = 0;
    uint64_t v140 = 0;
  }
  double v82 = v169[3];
  objc_msgSend_curvature(v32, v72, v73, v74, v75, v76);
  double v84 = v83;
  v85 = [CHSubstroke alloc];
  v91 = objc_msgSend_strokeIdentifier(v32, v86, v87, v88, v89, v90);
  double v92 = v179[6];
  double v93 = v179[7];
  double v94 = v179[8];
  double v95 = v179[9];
  objc_msgSend_startTimestamp(v32, v96, v97, v98, v99, v100);
  v105 = objc_msgSend_initWithStrokeIdentifier_bounds_startTimestamp_endTimestamp_convexHull_curvature_(v85, v101, (uint64_t)v91, (uint64_t)&__p, v102, v103, v92, v93, v94, v95, v104, v161[3], v82 + v84);

  uint64_t v111 = objc_msgSend_count(v136, v106, v107, v108, v109, v110);
  objc_msgSend_setObject_atIndexedSubscript_(v136, v112, (uint64_t)v105, v111 - 1, v113, v114);

  if (__p)
  {
    v139 = __p;
    operator delete(__p);
  }

LABEL_45:
  id v130 = v12;

  _Block_object_dispose(&v151, 8);
  if (v157)
  {
    v158 = v157;
    operator delete(v157);
  }
  _Block_object_dispose(&v160, 8);
  _Block_object_dispose(&v164, 8);
  _Block_object_dispose(&v168, 8);
  _Block_object_dispose(v172, 8);
  if (v175)
  {
    uint64_t v132 = v173;
    v131 = v174;
    uint64_t v133 = *v174;
    *(void *)(v133 + 8) = *(void *)(v173 + 8);
    **(void **)(v132 + 8) = v133;
    uint64_t v175 = 0;
    if (v131 != &v173)
    {
      do
      {
        v134 = (uint64_t *)v131[1];
        operator delete(v131);
        v131 = v134;
      }
      while (v134 != &v173);
    }
  }
  _Block_object_dispose(v176, 8);
  _Block_object_dispose(&v178, 8);

  return v130;
}

- (void)convexHull
{
  return &self->_convexHull;
}

- (void)encodeWithCoder:(id)a3
{
  id v67 = a3;
  long long v9 = objc_msgSend_strokeIdentifier(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v67, v10, (uint64_t)v9, @"strokeIdentifier", v11, v12);

  uint64_t v16 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v13, (uint64_t)&self->_bounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v14, v15);
  objc_msgSend_encodeObject_forKey_(v67, v17, (uint64_t)v16, @"bounds", v18, v19);
  objc_msgSend_startTimestamp(self, v20, v21, v22, v23, v24);
  objc_msgSend_encodeDouble_forKey_(v67, v25, @"startTimestamp", v26, v27, v28);
  objc_msgSend_endTimestamp(self, v29, v30, v31, v32, v33);
  objc_msgSend_encodeDouble_forKey_(v67, v34, @"endTimestamp", v35, v36, v37);
  uint64_t v38 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v44 = *objc_msgSend_convexHull(self, v39, v40, v41, v42, v43);
  uint64_t v50 = objc_msgSend_convexHull(self, v45, v46, v47, v48, v49);
  v54 = objc_msgSend_dataWithBytes_length_(v38, v51, v44, v50[1] - *v50, v52, v53);
  objc_msgSend_encodeObject_forKey_(v67, v55, (uint64_t)v54, @"convexHull", v56, v57);
  objc_msgSend_curvature(self, v58, v59, v60, v61, v62);
  objc_msgSend_encodeDouble_forKey_(v67, v63, @"curvature", v64, v65, v66);
}

- (CHSubstroke)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  long long v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"strokeIdentifier", v7, v8);
  uint64_t v10 = objc_opt_class();
  uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"bounds", v12, v13);
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v62 = *MEMORY[0x1E4F1DB20];
  long long v63 = v15;
  objc_msgSend_getValue_size_(v14, v16, (uint64_t)&v62, 32, v17, v18);
  objc_msgSend_decodeDoubleForKey_(v4, v19, @"startTimestamp", v20, v21, v22);
  double v24 = v23;
  objc_msgSend_decodeDoubleForKey_(v4, v25, @"endTimestamp", v26, v27, v28);
  double v30 = v29;
  uint64_t v31 = objc_opt_class();
  uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"convexHull", v33, v34);
  uint64_t v41 = objc_msgSend_length(v35, v36, v37, v38, v39, v40);
  id v42 = v35;
  uint64_t v48 = (char *)objc_msgSend_bytes(v42, v43, v44, v45, v46, v47);
  __p = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  sub_1C49B7D84(&__p, v48, &v48[v41 & 0xFFFFFFFFFFFFFFF0], v41 >> 4);
  objc_msgSend_decodeDoubleForKey_(v4, v49, @"curvature", v50, v51, v52);
  started = (CHSubstroke *)objc_msgSend_initWithStrokeIdentifier_bounds_startTimestamp_endTimestamp_convexHull_curvature_(self, v53, (uint64_t)v9, (uint64_t)&__p, v54, v55, v62, v63, v24, v30, v56);
  if (__p)
  {
    uint64_t v60 = __p;
    operator delete(__p);
  }

  return started;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToSubstroke:(id)a3
{
  id v4 = (CHSubstroke *)a3;
  uint64_t v10 = v4;
  if (self == v4)
  {
    LOBYTE(v29) = 1;
    goto LABEL_28;
  }
  strokeIdentifier = self->_strokeIdentifier;
  objc_msgSend_strokeIdentifier(v4, v5, v6, v7, v8, v9);
  uint64_t v17 = (CHEncodedStrokeIdentifier *)objc_claimAutoreleasedReturnValue();
  if (strokeIdentifier == v17)
  {
  }
  else
  {
    uint64_t v18 = objc_msgSend_strokeIdentifier(v10, v12, v13, v14, v15, v16);
    int isEqual = objc_msgSend_isEqual_(v18, v19, (uint64_t)self->_strokeIdentifier, v20, v21, v22);

    if (!isEqual)
    {
LABEL_10:
      BOOL v29 = 0;
      goto LABEL_11;
    }
  }
  CGFloat x = self->_bounds.origin.x;
  CGFloat y = self->_bounds.origin.y;
  CGFloat width = self->_bounds.size.width;
  CGFloat height = self->_bounds.size.height;
  objc_msgSend_bounds(v10, v24, v25, v26, v27, v28);
  v66.origin.CGFloat x = v34;
  v66.origin.CGFloat y = v35;
  v66.size.CGFloat width = v36;
  v66.size.CGFloat height = v37;
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  if (!CGRectEqualToRect(v65, v66)) {
    goto LABEL_10;
  }
  double startTimestamp = self->_startTimestamp;
  objc_msgSend_startTimestamp(v10, v24, v25, v26, v27, v28);
  if (startTimestamp != v39) {
    goto LABEL_10;
  }
  double endTimestamp = self->_endTimestamp;
  objc_msgSend_endTimestamp(v10, v24, v25, v26, v27, v28);
  BOOL v29 = endTimestamp == v41;
LABEL_11:
  begin = self->_convexHull.__begin_;
  end = self->_convexHull.__end_;
  uint64_t v44 = objc_msgSend_convexHull(v10, v24, v25, v26, v27, v28);
  if ((char *)end - (char *)begin != v44[1] - *v44)
  {
LABEL_25:
    LOBYTE(v29) = 0;
    goto LABEL_28;
  }
  uint64_t v50 = self->_convexHull.__begin_;
  if (self->_convexHull.__end_ == v50)
  {
    if (!v29) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v29)
  {
    double v52 = v50->x;
    double v51 = v50->y;
    uint64_t v53 = objc_msgSend_convexHull(v10, v45, v46, v47, v48, v49);
    LOBYTE(v29) = 0;
    if (v52 == **(double **)v53 && v51 == *(double *)(*(void *)v53 + 8))
    {
      uint64_t v54 = self->_convexHull.__begin_;
      if ((CGPoint *)((char *)self->_convexHull.__end_ - (char *)v54) >= (CGPoint *)0x11)
      {
        uint64_t v55 = 0;
        unint64_t v56 = 1;
        do
        {
          uint64_t v57 = &v54[v55];
          double v58 = v57[1].x;
          double v59 = v57[1].y;
          uint64_t v60 = *objc_msgSend_convexHull(v10, v45, v46, v47, v48, v49) + v55 * 16;
          if (v58 != *(double *)(v60 + 16) || v59 != *(double *)(v60 + 24)) {
            goto LABEL_25;
          }
          ++v56;
          uint64_t v54 = self->_convexHull.__begin_;
          ++v55;
        }
        while (v56 < self->_convexHull.__end_ - v54);
      }
LABEL_27:
      double curvature = self->_curvature;
      objc_msgSend_curvature(v10, v45, v46, v47, v48, v49);
      LOBYTE(v29) = vabdd_f64(curvature, v63) < 2.22044605e-16;
    }
  }
LABEL_28:

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToSubstroke = objc_msgSend_isEqualToSubstroke_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToSubstroke;
  }
  else
  {

    return 0;
  }
}

- (CHEncodedStrokeIdentifier)strokeIdentifier
{
  return self->_strokeIdentifier;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (double)curvature
{
  return self->_curvature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIdentifier, 0);
  begin = self->_convexHull.__begin_;
  if (begin)
  {
    self->_convexHull.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end