@interface CHSubstrokePlacement
+ (BOOL)supportsSecureCoding;
- (CGAffineTransform)orientationTransform;
- (CGPoint)coalescedCenter;
- (CGRect)orientedBounds;
- (CGRect)rotatedBounds;
- (CGVector)strokeDeviation;
- (CGVector)writingOrientation;
- (CHSubstroke)substroke;
- (CHSubstrokePlacement)initWithCoder:(id)a3;
- (CHSubstrokePlacement)initWithSubstroke:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)originalWritingDirectionIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setCoalescedCenter:(CGPoint)a3;
- (void)setOriginalWritingDirectionIndex:(int64_t)a3;
- (void)setStrokeDeviation:(CGVector)a3;
- (void)setWritingOrientation:(CGVector)a3;
@end

@implementation CHSubstrokePlacement

- (CHSubstrokePlacement)initWithSubstroke:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSubstrokePlacement;
  v6 = [(CHSubstrokePlacement *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_substroke, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7 = objc_msgSend_allocWithZone_(CHSubstrokePlacement, a2, (uint64_t)a3, v3, v4, v5);
  v13 = objc_msgSend_substroke(self, v8, v9, v10, v11, v12);
  v18 = objc_msgSend_initWithSubstroke_(v7, v14, (uint64_t)v13, v15, v16, v17);

  objc_msgSend_writingOrientation(self, v19, v20, v21, v22, v23);
  objc_msgSend_setWritingOrientation_(v18, v24, v25, v26, v27, v28);
  objc_msgSend_strokeDeviation(self, v29, v30, v31, v32, v33);
  objc_msgSend_setStrokeDeviation_(v18, v34, v35, v36, v37, v38);
  uint64_t v44 = objc_msgSend_originalWritingDirectionIndex(self, v39, v40, v41, v42, v43);
  objc_msgSend_setOriginalWritingDirectionIndex_(v18, v45, v44, v46, v47, v48);
  objc_msgSend_coalescedCenter(self, v49, v50, v51, v52, v53);
  objc_msgSend_setCoalescedCenter_(v18, v54, v55, v56, v57, v58);
  return v18;
}

- (CGRect)rotatedBounds
{
  v7 = objc_msgSend_substroke(self, a2, v2, v3, v4, v5);
  objc_msgSend_bounds(v7, v8, v9, v10, v11, v12);
  double MidX = CGRectGetMidX(v83);
  v18 = objc_msgSend_substroke(self, v13, v14, v15, v16, v17);
  objc_msgSend_bounds(v18, v19, v20, v21, v22, v23);
  double MidY = CGRectGetMidY(v84);

  objc_msgSend_writingOrientation(self, v24, v25, v26, v27, v28);
  long double v30 = v29;
  objc_msgSend_writingOrientation(self, v31, v32, v33, v34, v35);
  float v37 = atan2(v30, v36);
  __float2 v43 = __sincosf_stret(v37);
  uint64_t v44 = 0;
  unint64_t v45 = 0;
  double cosval = v43.__cosval;
  double sinval = v43.__sinval;
  double v48 = 2.22507386e-308;
  double v49 = 1.79769313e308;
  double v50 = 1.79769313e308;
  double v51 = 2.22507386e-308;
  while (1)
  {
    uint64_t v52 = objc_msgSend_substroke(self, v38, *(void *)&v39, *(void *)&v40, *(void *)&v41, *(void *)&v42, *(void *)&MidY);
    uint64_t v58 = objc_msgSend_convexHull(v52, v53, v54, v55, v56, v57);
    uint64_t v59 = v58[1] - *v58;

    if (v45 >= v59 >> 4) {
      break;
    }
    v65 = objc_msgSend_substroke(self, v60, v61, v62, v63, v64);
    v71 = (double *)(*objc_msgSend_convexHull(v65, v66, v67, v68, v69, v70) + v44);
    double v72 = *v71;
    double v73 = v71[1];

    double v74 = MidX + cosval * (v72 - MidX) - (v73 - MidY) * sinval;
    double v75 = (v73 - MidY) * cosval;
    double v76 = MidY + v75 + sinval * (v72 - MidX);
    if (v74 < v49) {
      double v49 = MidX + cosval * (v72 - MidX) - (v73 - MidY) * sinval;
    }
    if (v74 > v48) {
      double v48 = MidX + cosval * (v72 - MidX) - (v73 - MidY) * sinval;
    }
    if (v76 < v50) {
      double v50 = MidY + v75 + sinval * (v72 - MidX);
    }
    if (v76 > v51) {
      double v51 = MidY + v75 + sinval * (v72 - MidX);
    }
    ++v45;
    v44 += 16;
  }
  double v77 = v48 - v49;
  double v78 = v51 - v50;
  double v79 = v49;
  double v80 = v50;
  result.size.height = v78;
  result.size.width = v77;
  result.origin.y = v80;
  result.origin.x = v79;
  return result;
}

- (CGAffineTransform)orientationTransform
{
  objc_msgSend_writingOrientation(self, a3, v3, v4, v5, v6);
  long double v10 = v9;
  objc_msgSend_writingOrientation(self, v11, v12, v13, v14, v15);
  long double v17 = atan2(v10, v16);
  objc_msgSend_rotatedBounds(self, v18, v19, v20, v21, v22);
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  double MidX = CGRectGetMidX(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v38);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  CGAffineTransformMakeTranslation(retstr, MidX, MidY);
  long long v29 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v35.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v35.c = v29;
  *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformRotate(&v36, &v35, v17);
  long long v30 = *(_OWORD *)&v36.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v36.a;
  *(_OWORD *)&retstr->c = v30;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v36.tx;
  long long v31 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v34.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v34.c = v31;
  *(_OWORD *)&v34.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformTranslate(&v36, &v34, -MidX, -MidY);
  long long v33 = *(_OWORD *)&v36.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v36.a;
  *(_OWORD *)&retstr->c = v33;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v36.tx;
  return result;
}

- (CGRect)orientedBounds
{
  memset(&v149, 0, sizeof(v149));
  objc_msgSend_orientationTransform(self, a2, v2, v3, v4, v5);
  CGAffineTransform v147 = v149;
  memset(&v148, 0, sizeof(v148));
  CGAffineTransformInvert(&v148, &v147);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  objc_msgSend_rotatedBounds(self, v11, v12, v13, v14, v15);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v20 = (double *)operator new(0x10uLL);
  *(void *)uint64_t v20 = v17;
  *((void *)v20 + 1) = v19;
  v145 = v20 + 2;
  v146 = v20 + 2;
  v144 = v20;
  objc_msgSend_rotatedBounds(self, v21, v22, v23, v24, v25);
  double v27 = v26;
  objc_msgSend_rotatedBounds(self, v28, v29, v30, v31, v32);
  double v34 = v33;
  objc_msgSend_rotatedBounds(self, v35, v36, v37, v38, v39);
  uint64_t v46 = v45;
  double v47 = v27 + v34;
  double v48 = v145;
  if (v145 < v146)
  {
    double *v145 = v47;
    *((void *)v145 + 1) = v45;
    unint64_t v49 = (unint64_t)(v145 + 2);
    goto LABEL_14;
  }
  uint64_t v50 = ((char *)v145 - (char *)v144) >> 4;
  unint64_t v51 = v50 + 1;
  if ((unint64_t)(v50 + 1) >> 60) {
    sub_1C494A220();
  }
  uint64_t v52 = (char *)v146 - (char *)v144;
  if (v146 - v144 > v51) {
    unint64_t v51 = v52 >> 3;
  }
  if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v53 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v53 = v51;
  }
  if (v53)
  {
    if (v53 >> 60) {
      sub_1C4949AA8();
    }
    uint64_t v54 = (char *)operator new(16 * v53);
    uint64_t v55 = (uint64_t)&v54[16 * v50];
    uint64_t v56 = &v54[16 * v53];
    *(double *)uint64_t v55 = v47;
    *(void *)(v55 + 8) = v46;
    unint64_t v49 = v55 + 16;
    if (v145 == v144)
    {
LABEL_12:
      v144 = (double *)v55;
      v146 = (double *)v56;
      if (!v145) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v55 = 16 * v50;
    uint64_t v56 = 0;
    *(double *)uint64_t v55 = v47;
    *(void *)(v55 + 8) = v45;
    unint64_t v49 = 16 * v50 + 16;
    if (v145 == v144) {
      goto LABEL_12;
    }
  }
  do
  {
    *(_OWORD *)(v55 - 16) = *((_OWORD *)v48 - 1);
    v55 -= 16;
    v48 -= 2;
  }
  while (v48 != v144);
  double v48 = v144;
  v144 = (double *)v55;
  v146 = (double *)v56;
  if (v48) {
LABEL_13:
  }
    operator delete(v48);
LABEL_14:
  objc_msgSend_rotatedBounds(self, v40, v41, v42, v43, v44);
  uint64_t v58 = v57;
  objc_msgSend_rotatedBounds(self, v59, v60, v61, v62, v63);
  double v65 = v64;
  objc_msgSend_rotatedBounds(self, v66, v67, v68, v69, v70);
  double v77 = v65 + v76;
  double v78 = (double *)v49;
  if (v49 < (unint64_t)v146)
  {
    *(void *)unint64_t v49 = v58;
    *(double *)(v49 + 8) = v77;
    double v79 = (double *)(v49 + 16);
    goto LABEL_27;
  }
  uint64_t v80 = (uint64_t)(v49 - (void)v144) >> 4;
  unint64_t v81 = v80 + 1;
  if ((unint64_t)(v80 + 1) >> 60) {
    sub_1C494A220();
  }
  uint64_t v82 = (char *)v146 - (char *)v144;
  if (v146 - v144 > v81) {
    unint64_t v81 = v82 >> 3;
  }
  if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v83 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v83 = v81;
  }
  if (v83)
  {
    if (v83 >> 60) {
      sub_1C4949AA8();
    }
    CGRect v84 = (char *)operator new(16 * v83);
    uint64_t v85 = (uint64_t)&v84[16 * v80];
    v86 = &v84[16 * v83];
    *(void *)uint64_t v85 = v58;
    *(double *)(v85 + 8) = v77;
    double v79 = (double *)(v85 + 16);
    if (v78 == v144)
    {
LABEL_25:
      v144 = (double *)v85;
      v146 = (double *)v86;
      if (!v78) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v85 = 16 * v80;
    v86 = 0;
    *(void *)uint64_t v85 = v58;
    *(double *)(v85 + 8) = v77;
    double v79 = (double *)(16 * v80 + 16);
    if (v78 == v144) {
      goto LABEL_25;
    }
  }
  do
  {
    *(_OWORD *)(v85 - 16) = *((_OWORD *)v78 - 1);
    v85 -= 16;
    v78 -= 2;
  }
  while (v78 != v144);
  double v78 = v144;
  v144 = (double *)v85;
  v146 = (double *)v86;
  if (v78) {
LABEL_26:
  }
    operator delete(v78);
LABEL_27:
  objc_msgSend_rotatedBounds(self, v71, v72, v73, v74, v75);
  double v88 = v87;
  objc_msgSend_rotatedBounds(self, v89, v90, v91, v92, v93);
  double v95 = v94;
  objc_msgSend_rotatedBounds(self, v96, v97, v98, v99, v100);
  double v102 = v101;
  objc_msgSend_rotatedBounds(self, v103, v104, v105, v106, v107);
  double v108 = v88 + v95;
  double v110 = v102 + v109;
  v111 = v79;
  if (v79 >= v146)
  {
    uint64_t v115 = ((char *)v79 - (char *)v144) >> 4;
    unint64_t v116 = v115 + 1;
    if ((unint64_t)(v115 + 1) >> 60) {
      sub_1C494A220();
    }
    uint64_t v117 = (char *)v146 - (char *)v144;
    if (v146 - v144 > v116) {
      unint64_t v116 = v117 >> 3;
    }
    if ((unint64_t)v117 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v118 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v118 = v116;
    }
    if (v118)
    {
      if (v118 >> 60) {
        sub_1C4949AA8();
      }
      v119 = (char *)operator new(16 * v118);
    }
    else
    {
      v119 = 0;
    }
    v120 = (double *)&v119[16 * v115];
    double *v120 = v108;
    v120[1] = v110;
    v112 = v120 + 2;
    double v113 = v7;
    if (v111 != v144)
    {
      do
      {
        *((_OWORD *)v120 - 1) = *((_OWORD *)v111 - 1);
        v120 -= 2;
        v111 -= 2;
      }
      while (v111 != v144);
      v111 = v144;
    }
    double v114 = v9;
    v144 = v120;
    if (v111) {
      operator delete(v111);
    }
  }
  else
  {
    *double v79 = v108;
    v79[1] = v110;
    v112 = v79 + 2;
    double v113 = v7;
    double v114 = v9;
  }
  v121 = v144;
  if (v144 == v112)
  {
    v121 = v112;
LABEL_68:
    operator delete(v121);
    goto LABEL_69;
  }
  double v122 = v144[1];
  double v113 = v148.tx + v122 * v148.c + v148.a * *v144 + -0.5;
  double v8 = v148.ty + v122 * v148.d + v148.b * *v144 + -0.5;
  v123 = v144 + 2;
  double v114 = 1.0;
  double v10 = 1.0;
  if (v144 + 2 == v112) {
    goto LABEL_68;
  }
  do
  {
    double v124 = *v123;
    double v125 = v123[1];
    double c = v148.c;
    double a = v148.a;
    double b = v148.b;
    tCGFloat x = v148.tx;
    tCGFloat y = v148.ty;
    double d = v148.d;
    v150.origin.CGFloat x = v113;
    v150.origin.CGFloat y = v8;
    v150.size.CGFloat width = v10;
    v150.size.CGFloat height = v114;
    CGFloat MaxX = CGRectGetMaxX(v150);
    v151.size.CGFloat height = v114;
    double v129 = MaxX;
    v151.origin.CGFloat x = v113;
    v151.origin.CGFloat y = v8;
    v151.size.CGFloat width = v10;
    double MaxY = CGRectGetMaxY(v151);
    double v131 = tx + v125 * c + a * v124;
    double v132 = v125 * d + b * v124;
    double v133 = ty + v132;
    if (v113 >= v131) {
      double v113 = tx + v125 * c + a * v124;
    }
    if (v8 >= v133) {
      double v8 = ty + v132;
    }
    double v134 = v131 - v113;
    if (v129 - v113 <= v134) {
      double v10 = v134;
    }
    else {
      double v10 = v129 - v113;
    }
    double v135 = MaxY - v8;
    if (v135 <= v133 - v8) {
      double v114 = v133 - v8;
    }
    else {
      double v114 = v135;
    }
    v123 += 2;
  }
  while (v123 != v112);
  v121 = v144;
  if (v144) {
    goto LABEL_68;
  }
LABEL_69:
  double v136 = v113;
  double v137 = v8;
  double v138 = v10;
  double v139 = v114;
  result.size.CGFloat height = v139;
  result.size.CGFloat width = v138;
  result.origin.CGFloat y = v137;
  result.origin.CGFloat x = v136;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v31 = a3;
  objc_msgSend_encodeObject_forKey_(v31, v4, (uint64_t)self->_substroke, @"substroke", v5, v6);
  double v10 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v7, (uint64_t)&self->_writingOrientation, (uint64_t)"{CGPoint=dd}", v8, v9);
  objc_msgSend_encodeObject_forKey_(v31, v11, (uint64_t)v10, @"writingOrientation", v12, v13);
  uint64_t v17 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v14, (uint64_t)&self->_strokeDeviation, (uint64_t)"{CGPoint=dd}", v15, v16);
  objc_msgSend_encodeObject_forKey_(v31, v18, (uint64_t)v17, @"strokeDeviation", v19, v20);
  objc_msgSend_encodeInteger_forKey_(v31, v21, self->_originalWritingDirectionIndex, @"originalWritingDirectionIndex", v22, v23);
  double v27 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v24, (uint64_t)&self->_coalescedCenter, (uint64_t)"{CGPoint=dd}", v25, v26);
  objc_msgSend_encodeObject_forKey_(v31, v28, (uint64_t)v27, @"coalescedCenter", v29, v30);
}

- (CHSubstrokePlacement)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"substroke", v7, v8);
  uint64_t v10 = objc_opt_class();
  uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"writingOrientation", v12, v13);
  objc_msgSend_getValue_size_(v14, v15, (uint64_t)v66, 16, v16, v17);
  uint64_t v18 = objc_opt_class();
  uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"strokeDeviation", v20, v21);
  objc_msgSend_getValue_size_(v22, v23, (uint64_t)v65, 16, v24, v25);
  uint64_t v30 = objc_msgSend_decodeIntegerForKey_(v4, v26, @"originalWritingDirectionIndex", v27, v28, v29);
  uint64_t v31 = objc_opt_class();
  CGAffineTransform v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"coalescedCenter", v33, v34);
  objc_msgSend_getValue_size_(v35, v36, (uint64_t)v64, 16, v37, v38);
  uint64_t v43 = (CHSubstrokePlacement *)objc_msgSend_initWithSubstroke_(self, v39, (uint64_t)v9, v40, v41, v42);
  objc_msgSend_setWritingOrientation_(v43, v44, v45, v46, v47, v48, v66[0], v66[1]);
  objc_msgSend_setStrokeDeviation_(v43, v49, v50, v51, v52, v53, v65[0], v65[1]);
  objc_msgSend_setOriginalWritingDirectionIndex_(v43, v54, v30, v55, v56, v57);
  objc_msgSend_setCoalescedCenter_(v43, v58, v59, v60, v61, v62, v64[0], v64[1]);

  return v43;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSubstroke)substroke
{
  return self->_substroke;
}

- (CGVector)writingOrientation
{
  dCGFloat x = self->_writingOrientation.dx;
  dCGFloat y = self->_writingOrientation.dy;
  result.dCGFloat y = dy;
  result.dCGFloat x = dx;
  return result;
}

- (void)setWritingOrientation:(CGVector)a3
{
  self->_writingOrientation = a3;
}

- (CGVector)strokeDeviation
{
  dCGFloat x = self->_strokeDeviation.dx;
  dCGFloat y = self->_strokeDeviation.dy;
  result.dCGFloat y = dy;
  result.dCGFloat x = dx;
  return result;
}

- (void)setStrokeDeviation:(CGVector)a3
{
  self->_strokeDeviation = a3;
}

- (int64_t)originalWritingDirectionIndex
{
  return self->_originalWritingDirectionIndex;
}

- (void)setOriginalWritingDirectionIndex:(int64_t)a3
{
  self->_originalWritingDirectionIndeCGFloat x = a3;
}

- (CGPoint)coalescedCenter
{
  double x = self->_coalescedCenter.x;
  double y = self->_coalescedCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCoalescedCenter:(CGPoint)a3
{
  self->_coalescedCenter = a3;
}

- (void).cxx_destruct
{
}

@end