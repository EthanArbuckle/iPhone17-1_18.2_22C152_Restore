@interface CHTextInputInsertionCaretGesture
- (CGPoint)caretTipPoint;
- (CHTextInputInsertionCaretGesture)initWithCaretTipPoint:(CGPoint)a3 targetContentInfo:(id)a4 locale:(id)a5 normalizedDrawing:(id)a6 originalDrawing:(id)a7;
- (int64_t)caretDirection;
- (void)getAffectedRange:(_NSRange *)a3 expandedToFullTokens:(BOOL *)a4;
@end

@implementation CHTextInputInsertionCaretGesture

- (CHTextInputInsertionCaretGesture)initWithCaretTipPoint:(CGPoint)a3 targetContentInfo:(id)a4 locale:(id)a5 normalizedDrawing:(id)a6 originalDrawing:(id)a7
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)CHTextInputInsertionCaretGesture;
  char v10 = 0;
  result = [(CHTextInputGesture *)&v11 initWithGestureType:8 targetContentInfo:a4 locale:a5 normalizedDrawing:a6 originalDrawing:a7 lastStroke:0 preferCharacterLevel:v10];
  if (result)
  {
    result->_caretTipPoint.CGFloat x = x;
    result->_caretTipPoint.CGFloat y = y;
  }
  return result;
}

- (void)getAffectedRange:(_NSRange *)a3 expandedToFullTokens:(BOOL *)a4
{
  uint64_t v194 = *MEMORY[0x1E4F143B8];
  v9 = objc_msgSend_targetContentInfo(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  objc_msgSend_referenceSubstringRange(v9, v10, v11, v12, v13, v14);
  uint64_t v16 = v15;

  if (v16)
  {
    v22 = objc_msgSend_targetContentInfo(self, v17, v18, v19, v20, v21);
    uint64_t v28 = objc_msgSend_referenceSubstringRange(v22, v23, v24, v25, v26, v27);
    uint64_t v30 = v29;

    v36 = objc_msgSend_targetContentInfo(self, v31, v32, v33, v34, v35);
    uint64_t v42 = objc_msgSend_strokeCoveredTextRange(v36, v37, v38, v39, v40, v41);

    if (v42 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v48 = objc_msgSend_targetContentInfo(self, v43, v44, v45, v46, v47);
      NSUInteger v54 = objc_msgSend_strokeCoveredTextRange(v48, v49, v50, v51, v52, v53);
      NSUInteger v56 = (NSUInteger)v55;
      v61 = objc_msgSend_targetContentInfo(self, v55, v57, v58, v59, v60);
      v196.location = objc_msgSend_referenceSubstringRange(v61, v62, v63, v64, v65, v66);
      v196.NSUInteger length = v67;
      v195.location = v54;
      v195.NSUInteger length = v56;
      NSUInteger length = NSIntersectionRange(v195, v196).length;

      if (!length)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v74 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v190) = 0;
          _os_log_impl(&dword_1C492D000, v74, OS_LOG_TYPE_FAULT, "The stroke covered range must be within the reference substring range", (uint8_t *)&v190, 2u);
        }
      }
      v75 = objc_msgSend_targetContentInfo(self, v69, v70, v71, v72, v73);
      uint64_t v28 = objc_msgSend_strokeCoveredTextRange(v75, v76, v77, v78, v79, v80);
      uint64_t v30 = v81;
    }
    v82 = objc_msgSend_targetContentInfo(self, v43, v44, v45, v46, v47);
    unint64_t v87 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v82, v83, v28, v84, v85, v86);

    v93 = objc_msgSend_targetContentInfo(self, v88, v89, v90, v91, v92);
    v99 = objc_msgSend_referenceSubstring(v93, v94, v95, v96, v97, v98);

    CGFloat x = self->_caretTipPoint.x;
    CGFloat y = self->_caretTipPoint.y;
    v107 = objc_msgSend_targetContentInfo(self, v102, v103, v104, v105, v106);
    unint64_t v113 = objc_msgSend_baseWritingDirection(v107, v108, v109, v110, v111, v112);
    v119 = objc_msgSend_targetContentInfo(self, v114, v115, v116, v117, v118);
    uint64_t v125 = objc_msgSend_characterRectsInReferenceSubstring(v119, v120, v121, v122, v123, v124);
    v126.n128_f64[0] = x;
    v127.n128_f64[0] = y;
    uint64_t v128 = sub_1C4A75108(v126, v127, (uint64_t)CHTextInputGesture, v99, v113, v125, v87, v30);

    BOOL v134 = v128 > 0;
    unint64_t v135 = v128;
    if (v128 >= 1)
    {
      if (v128 != objc_msgSend_length(v99, v129, v130, v131, v132, v133))
      {
        BOOL v134 = 0;
        unint64_t v135 = v128;
LABEL_20:
        if (v135 < objc_msgSend_length(v99, v129, v130, v131, v132, v133))
        {
LABEL_26:
          uint64_t v147 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v99, v136, v135, v137, v138, v139);
          unint64_t v149 = (unint64_t)v148;
          v154 = objc_msgSend_targetContentInfo(self, v148, v150, v151, v152, v153);
          NSUInteger v159 = objc_msgSend_absoluteLocationFromRelativeLocation_(v154, v155, v128, v156, v157, v158);

          v163 = objc_msgSend_substringWithRange_(v99, v160, v147, v149, v161, v162);
          char isEqualToString = objc_msgSend_isEqualToString_(v163, v164, @" ", v165, v166, v167);

          if ((isEqualToString & 1) == 0)
          {
            LOBYTE(v190) = 0;
            sub_1C4A74AE4((uint64_t)CHTextInputGesture, v99, v147, v149, &v190, 0);
            if ((_BYTE)v190)
            {
              v174 = objc_opt_class();
              v180 = objc_msgSend_locale(self, v175, v176, v177, v178, v179);
              uint64_t v147 = objc_msgSend_rangeOfTokenAtCharacterIndex_inString_locale_(v174, v181, v147, (uint64_t)v99, (uint64_t)v180, v182);
              unint64_t v149 = v183;
            }
            v184 = objc_msgSend_targetContentInfo(self, v169, v170, v171, v172, v173);
            uint64_t v189 = objc_msgSend_absoluteLocationFromRelativeLocation_(v184, v185, v147, v186, v187, v188);

            if (v134 || (uint64_t)(v159 - v189) > (uint64_t)(v149 - v159 + v189)) {
              v189 += v149;
            }
            NSUInteger v159 = v189;
          }
          if (a3)
          {
            a3->location = v159;
            a3->NSUInteger length = 0;
          }
          if (a4) {
            *a4 = 0;
          }

          return;
        }
LABEL_21:
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v140 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v140, OS_LOG_TYPE_FAULT))
        {
          uint64_t v146 = objc_msgSend_length(v99, v141, v142, v143, v144, v145);
          int v190 = 134218240;
          unint64_t v191 = v135;
          __int16 v192 = 2048;
          uint64_t v193 = v146;
          _os_log_impl(&dword_1C492D000, v140, OS_LOG_TYPE_FAULT, "The computed character index (%li) must be valid in the string (length=%li)", (uint8_t *)&v190, 0x16u);
        }

        goto LABEL_26;
      }
      unint64_t v135 = objc_msgSend_length(v99, v129, v130, v131, v132, v133) - 1;
    }
    if ((v135 & 0x8000000000000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (a3) {
    *a3 = (_NSRange)xmmword_1C4C3B320;
  }
  if (a4) {
    *a4 = 0;
  }
}

- (int64_t)caretDirection
{
  v7 = objc_msgSend_originalDrawing(self, a2, v2, v3, v4, v5);
  objc_msgSend_bounds(v7, v8, v9, v10, v11, v12);
  double v14 = v13;
  double v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  p_caretTipPoint = &self->_caretTipPoint;
  double v22 = vabdd_f64(v16, self->_caretTipPoint.y);
  v23 = (double *)operator new(8uLL);
  double *v23 = v22;
  uint64_t v24 = v23 + 1;
  uint64_t v98 = v23;
  v99 = v23 + 1;
  uint64_t v25 = operator new(8uLL);
  *uint64_t v25 = 2;
  v100.origin.CGFloat x = v14;
  v100.origin.CGFloat y = v16;
  v100.size.width = v18;
  v100.size.height = v20;
  double v26 = vabdd_f64(CGRectGetMaxY(v100), p_caretTipPoint->y);
  uint64_t v28 = v24;
  uint64_t v27 = v99;
  if (v24 < v99)
  {
    *uint64_t v24 = v26;
    uint64_t v29 = v24 + 1;
    goto LABEL_22;
  }
  uint64_t v30 = v98;
  int64_t v31 = (char *)v24 - (char *)v98;
  uint64_t v32 = v24 - v98;
  unint64_t v33 = v32 + 1;
  if ((unint64_t)(v32 + 1) >> 61) {
    sub_1C494A220();
  }
  if (((char *)v99 - (char *)v98) >> 2 > v33) {
    unint64_t v33 = ((char *)v99 - (char *)v98) >> 2;
  }
  if ((unint64_t)((char *)v99 - (char *)v98) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v34 = v33;
  }
  if (v34)
  {
    if (v34 >> 61) {
      sub_1C4949AA8();
    }
    uint64_t v35 = (char *)operator new(8 * v34);
    v36 = (double *)&v35[8 * v32];
    uint64_t v27 = (double *)&v35[8 * v34];
    double *v36 = v26;
    uint64_t v29 = v36 + 1;
    int64_t v37 = (char *)v28 - (char *)v98;
    if (v28 == v98) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  uint64_t v35 = 0;
  v36 = (double *)(8 * v32);
  uint64_t v27 = 0;
  *(double *)(8 * v32) = v26;
  uint64_t v29 = (double *)(8 * v32 + 8);
  int64_t v37 = (char *)v28 - (char *)v98;
  if (v28 != v98)
  {
LABEL_14:
    unint64_t v38 = v37 - 8;
    if (v38 < 0x58) {
      goto LABEL_87;
    }
    if ((unint64_t)((char *)v28 - v35 - v31) < 0x20) {
      goto LABEL_87;
    }
    uint64_t v39 = (v38 >> 3) + 1;
    uint64_t v40 = 8 * (v39 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v41 = &v28[v40 / 0xFFFFFFFFFFFFFFF8];
    v36 = (double *)((char *)v36 - v40);
    uint64_t v42 = &v35[8 * v32 - 16];
    v43 = v28 - 2;
    uint64_t v44 = v39 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v45 = *(_OWORD *)v43;
      *((_OWORD *)v42 - 1) = *((_OWORD *)v43 - 1);
      *(_OWORD *)uint64_t v42 = v45;
      v42 -= 32;
      v43 -= 4;
      v44 -= 4;
    }
    while (v44);
    uint64_t v28 = v41;
    if (v39 != (v39 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_87:
      do
      {
        uint64_t v46 = *((void *)v28-- - 1);
        *((void *)v36-- - 1) = v46;
      }
      while (v28 != v98);
    }
  }
LABEL_20:
  uint64_t v98 = v36;
  v99 = v27;
  if (v30) {
    operator delete(v30);
  }
LABEL_22:
  uint64_t v47 = operator new(0x10uLL);
  *uint64_t v47 = *v25;
  v47[1] = 1;
  operator delete(v25);
  double v48 = vabdd_f64(v14, p_caretTipPoint->x);
  if (v29 < v27)
  {
    *uint64_t v29 = v48;
    v49 = v29 + 1;
    goto LABEL_45;
  }
  uint64_t v50 = v98;
  uint64_t v51 = v29 - v98;
  unint64_t v52 = v51 + 1;
  if ((unint64_t)(v51 + 1) >> 61) {
    sub_1C494A220();
  }
  if (((char *)v27 - (char *)v98) >> 2 > v52) {
    unint64_t v52 = ((char *)v27 - (char *)v98) >> 2;
  }
  if ((unint64_t)((char *)v27 - (char *)v98) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v53 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v53 = v52;
  }
  if (v53)
  {
    if (v53 >> 61) {
      sub_1C4949AA8();
    }
    NSUInteger v54 = operator new(8 * v53);
    v55 = (double *)&v54[8 * v51];
    NSUInteger v56 = (double *)&v54[8 * v53];
    double *v55 = v48;
    v49 = v55 + 1;
    int64_t v57 = (char *)v29 - (char *)v98;
    if (v29 == v98) {
      goto LABEL_43;
    }
  }
  else
  {
    NSUInteger v54 = 0;
    v55 = (double *)(8 * v51);
    NSUInteger v56 = 0;
    *(double *)(8 * v51) = v48;
    v49 = (double *)(8 * v51 + 8);
    int64_t v57 = (char *)v29 - (char *)v98;
    if (v29 == v98) {
      goto LABEL_43;
    }
  }
  unint64_t v58 = v57 - 8;
  if (v58 < 0x58)
  {
    uint64_t v59 = v29;
    goto LABEL_42;
  }
  if ((unint64_t)((char *)v98 - v54) < 0x20)
  {
    uint64_t v59 = v29;
    do
    {
LABEL_42:
      uint64_t v66 = *((void *)v59-- - 1);
      *((void *)v55-- - 1) = v66;
    }
    while (v59 != v98);
    goto LABEL_43;
  }
  uint64_t v60 = (v58 >> 3) + 1;
  uint64_t v61 = 8 * (v60 & 0x3FFFFFFFFFFFFFFCLL);
  uint64_t v59 = &v29[v61 / 0xFFFFFFFFFFFFFFF8];
  v55 = (double *)((char *)v55 - v61);
  v62 = &v54[8 * v51 - 16];
  uint64_t v63 = v29 - 2;
  uint64_t v64 = v60 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v65 = *(_OWORD *)v63;
    *(v62 - 1) = *((_OWORD *)v63 - 1);
    _OWORD *v62 = v65;
    v62 -= 2;
    v63 -= 4;
    v64 -= 4;
  }
  while (v64);
  if (v60 != (v60 & 0x3FFFFFFFFFFFFFFCLL)) {
    goto LABEL_42;
  }
LABEL_43:
  uint64_t v98 = v55;
  v99 = v56;
  if (v50) {
    operator delete(v50);
  }
LABEL_45:
  NSUInteger v67 = operator new(0x20uLL);
  v67[2] = 3;
  *(_OWORD *)NSUInteger v67 = *(_OWORD *)v47;
  operator delete(v47);
  v101.origin.CGFloat x = v14;
  v101.origin.CGFloat y = v16;
  v101.size.width = v18;
  v101.size.height = v20;
  double v68 = vabdd_f64(CGRectGetMaxX(v101), p_caretTipPoint->x);
  v69 = v49;
  if (v49 < v99)
  {
    double *v49 = v68;
    uint64_t v70 = v98;
    goto LABEL_67;
  }
  int64_t v71 = (char *)v49 - (char *)v98;
  uint64_t v72 = v49 - v98;
  unint64_t v73 = v72 + 1;
  if ((unint64_t)(v72 + 1) >> 61) {
    sub_1C494A220();
  }
  uint64_t v74 = (char *)v99 - (char *)v98;
  if (((char *)v99 - (char *)v98) >> 2 > v73) {
    unint64_t v73 = v74 >> 2;
  }
  BOOL v75 = (unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8;
  unint64_t v76 = 0x1FFFFFFFFFFFFFFFLL;
  if (!v75) {
    unint64_t v76 = v73;
  }
  if (v76)
  {
    if (v76 >> 61) {
      sub_1C4949AA8();
    }
    uint64_t v77 = (char *)operator new(8 * v76);
    uint64_t v78 = (double *)&v77[8 * v72];
    *uint64_t v78 = v68;
    uint64_t v70 = v78;
    int64_t v79 = (char *)v69 - (char *)v98;
    if (v69 == v98) {
      goto LABEL_64;
    }
  }
  else
  {
    uint64_t v77 = 0;
    uint64_t v78 = (double *)(8 * v72);
    *(double *)(8 * v72) = v68;
    uint64_t v70 = (double *)(8 * v72);
    int64_t v79 = (char *)v69 - (char *)v98;
    if (v69 == v98) {
      goto LABEL_64;
    }
  }
  unint64_t v80 = v79 - 8;
  if (v80 >= 0x58)
  {
    uint64_t v70 = v78;
    if ((unint64_t)((char *)v69 - &v77[v71]) >= 0x20)
    {
      uint64_t v81 = (v80 >> 3) + 1;
      uint64_t v82 = 8 * (v81 & 0x3FFFFFFFFFFFFFFCLL);
      v83 = &v69[v82 / 0xFFFFFFFFFFFFFFF8];
      uint64_t v70 = &v78[v82 / 0xFFFFFFFFFFFFFFF8];
      uint64_t v84 = &v77[8 * v72 - 16];
      uint64_t v85 = v69 - 2;
      uint64_t v86 = v81 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v87 = *(_OWORD *)v85;
        *((_OWORD *)v84 - 1) = *((_OWORD *)v85 - 1);
        *(_OWORD *)uint64_t v84 = v87;
        v84 -= 32;
        v85 -= 4;
        v86 -= 4;
      }
      while (v86);
      v69 = v83;
      if (v81 == (v81 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_64;
      }
    }
  }
  else
  {
    uint64_t v70 = v78;
  }
  do
  {
    uint64_t v88 = *((void *)v69-- - 1);
    *((void *)v70-- - 1) = v88;
  }
  while (v69 != v98);
LABEL_64:
  if (v98) {
    operator delete(v98);
  }
  v69 = v78;
LABEL_67:
  v67[3] = 4;
  BOOL v89 = v70 == v69 + 1 || v70 == v69;
  uint64_t v90 = v70;
  if (!v89)
  {
    uint64_t v91 = v70 + 1;
    double v92 = *v70;
    uint64_t v90 = v70;
    v93 = v70 + 1;
    do
    {
      double v94 = *v93++;
      double v95 = v94;
      if (v94 < v92)
      {
        double v92 = v95;
        uint64_t v90 = v91;
      }
      BOOL v89 = v91 == v69;
      uint64_t v91 = v93;
    }
    while (!v89);
  }
  int64_t v96 = *(void *)((char *)v67 + (((char *)v90 - (char *)v70) << 29 >> 29));
  operator delete(v67);
  if (v70) {
    operator delete(v70);
  }
  return v96;
}

- (CGPoint)caretTipPoint
{
  double x = self->_caretTipPoint.x;
  double y = self->_caretTipPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end