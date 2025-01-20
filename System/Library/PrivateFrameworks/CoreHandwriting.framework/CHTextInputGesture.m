@interface CHTextInputGesture
+ (BOOL)isDrawingCenterOnBlank:(id)a3 targetContentInfo:(id)a4 insertionLocation:(int64_t *)a5;
+ (BOOL)isEditGestureForDrawing:(id)a3 targetContentInfo:(id)a4 tentativeResultType:(int64_t)a5;
+ (BOOL)isVerticalBarShapeFromLineResult:(id)a3 originalDrawing:(id)a4 isDirectionDownward:(BOOL *)a5;
+ (BOOL)shouldReclassifyGestureType:(int64_t)a3;
+ (_NSRange)rangeOfTokenAtCharacterIndex:(int64_t)a3 inString:(id)a4 locale:(id)a5;
+ (id)verticalBarGestureFromLineResult:(id)a3 currentGesture:(id)a4;
- (BOOL)preferCharacterLevel;
- (CHDrawing)normalizedDrawing;
- (CHDrawing)originalDrawing;
- (CHStroke)lastStroke;
- (CHTextInputGesture)initWithGestureType:(int64_t)a3 targetContentInfo:(id)a4 locale:(id)a5 normalizedDrawing:(id)a6 originalDrawing:(id)a7 lastStroke:(id)a8 preferCharacterLevel:(BOOL)a9;
- (CHTextInputTargetContentInfo)targetContentInfo;
- (NSLocale)locale;
- (_NSRange)_affectedRangeByAdjustingForProtectedCharacters:(_NSRange)a3;
- (id)textResult;
- (int64_t)gestureType;
- (void)getAffectedRange:(_NSRange *)a3 expandedToFullTokens:(BOOL *)a4;
- (void)setGestureType:(int64_t)a3;
@end

@implementation CHTextInputGesture

- (CHTextInputGesture)initWithGestureType:(int64_t)a3 targetContentInfo:(id)a4 locale:(id)a5 normalizedDrawing:(id)a6 originalDrawing:(id)a7 lastStroke:(id)a8 preferCharacterLevel:(BOOL)a9
{
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v16 = a7;
  id v17 = a8;
  if (a3 == 1)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v18 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v18, OS_LOG_TYPE_FAULT, "CHTextInputGesture does not support the text correction type.", buf, 2u);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)CHTextInputGesture;
  v19 = [(CHTextInputGesture *)&v26 init];
  v20 = v19;
  if (v19)
  {
    v19->_gestureType = a3;
    objc_storeStrong((id *)&v19->_targetContentInfo, a4);
    objc_storeStrong((id *)&v20->_locale, a5);
    objc_storeStrong((id *)&v20->_normalizedDrawing, a6);
    objc_storeStrong((id *)&v20->_originalDrawing, a7);
    objc_storeStrong((id *)&v20->_lastStroke, a8);
    v20->_preferCharacterLevel = a9;
    textResult = v20->__textResult;
    v20->__textResult = 0;

    v20->__storedAffectedRange = (_NSRange)xmmword_1C4C3B320;
  }

  return v20;
}

- (id)textResult
{
  return self->__textResult;
}

- (void)getAffectedRange:(_NSRange *)a3 expandedToFullTokens:(BOOL *)a4
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  v9 = objc_msgSend_targetContentInfo(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  NSUInteger location = objc_msgSend_strokeCoveredTextRange(v9, v10, v11, v12, v13, v14);
  NSUInteger length = v16;

  BOOL v124 = 0;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    switch(objc_msgSend_gestureType(self, v18, v19, v20, v21, v22))
    {
      case 0:
        NSUInteger length = 0;
        break;
      case 2:
        NSUInteger length = 0;
        if (qword_1EA3CA000 != -1) {
          goto LABEL_21;
        }
        goto LABEL_13;
      case 3:
        uint64_t v102 = sub_1C4A732F4(self, (const char *)location, length, v23, v24, v25);
        v106 = (const char *)objc_msgSend__affectedRangeByAdjustingForProtectedCharacters_(self, v103, v102, (uint64_t)v103, v104, v105);
        v110 = (const char *)sub_1C4A733C0(self, v106, v107, v107, v108, v109);
        v114 = (const char *)sub_1C4A736F4(self, v110, v111, v111, v112, v113);
        uint64_t v63 = sub_1C4A739D4(self, v114, v115, 1, (char *)&v124, v116);
        goto LABEL_11;
      case 4:
      case 5:
        unint64_t v26 = sub_1C4A732F4(self, (const char *)location, length, v23, v24, v25);
        uint64_t v28 = (uint64_t)v27;
        uint64_t v33 = objc_msgSend_gestureType(self, v27, v29, v30, v31, v32);
        v39 = objc_msgSend_originalDrawing(self, v34, v35, v36, v37, v38);
        v45 = objc_msgSend_targetContentInfo(self, v40, v41, v42, v43, v44);
        uint64_t v46 = sub_1C4A74070((uint64_t)CHTextInputGesture, v26, v28, v33, v39, v45);
        uint64_t v48 = v47;

        v52 = (const char *)objc_msgSend__affectedRangeByAdjustingForProtectedCharacters_(self, v49, v46, v48, v50, v51);
        v56 = (const char *)sub_1C4A733C0(self, v52, v53, v53, v54, v55);
        v60 = (const char *)sub_1C4A736F4(self, v56, v57, v57, v58, v59);
        uint64_t v63 = sub_1C4A739D4(self, v60, v61, 0, (char *)&v124, v62);
        goto LABEL_11;
      case 6:
        unint64_t v65 = sub_1C4A732F4(self, (const char *)location, length, v23, v24, v25);
        uint64_t v67 = (uint64_t)v66;
        uint64_t v72 = objc_msgSend_gestureType(self, v66, v68, v69, v70, v71);
        v78 = objc_msgSend_originalDrawing(self, v73, v74, v75, v76, v77);
        v84 = objc_msgSend_targetContentInfo(self, v79, v80, v81, v82, v83);
        uint64_t v85 = sub_1C4A74070((uint64_t)CHTextInputGesture, v65, v67, v72, v78, v84);
        uint64_t v87 = v86;

        v91 = (const char *)objc_msgSend__affectedRangeByAdjustingForProtectedCharacters_(self, v88, v85, v87, v89, v90);
        v95 = (const char *)sub_1C4A733C0(self, v91, v92, v92, v93, v94);
        v99 = (const char *)sub_1C4A736F4(self, v95, v96, v96, v97, v98);
        uint64_t v63 = sub_1C4A739D4(self, v99, v100, 1, (char *)&v124, v101);
LABEL_11:
        NSUInteger location = v63;
        NSUInteger length = v64;
        goto LABEL_12;
      case 7:
        NSUInteger location = self->__storedAffectedRange.location;
        NSUInteger length = self->__storedAffectedRange.length;
        if (qword_1EA3CA000 != -1) {
          goto LABEL_21;
        }
        goto LABEL_13;
      default:
LABEL_12:
        if (qword_1EA3CA000 == -1) {
          goto LABEL_13;
        }
        goto LABEL_21;
    }
  }
  NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  if (qword_1EA3CA000 != -1) {
LABEL_21:
  }
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
LABEL_13:
  v117 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v123 = objc_msgSend_gestureType(self, v118, v119, v120, v121, v122);
    *(_DWORD *)buf = 134218496;
    uint64_t v126 = v123;
    __int16 v127 = 2048;
    NSUInteger v128 = location;
    __int16 v129 = 2048;
    NSUInteger v130 = length;
    _os_log_impl(&dword_1C492D000, v117, OS_LOG_TYPE_DEBUG, "Gesture recognized with type %ld, range  = %ld,%ld", buf, 0x20u);
  }

  if (a3)
  {
    a3->NSUInteger location = location;
    a3->NSUInteger length = length;
  }
  if (a4) {
    *a4 = v124;
  }
}

- (_NSRange)_affectedRangeByAdjustingForProtectedCharacters:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  NSUInteger v32 = a3.length;
  uint64_t v25 = 0;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  NSUInteger v28 = a3.location;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v7 = objc_msgSend_targetContentInfo(self, a2, a3.location, a3.length, v3, v4);
  uint64_t v13 = objc_msgSend_protectedCharacterIndexes(v7, v8, v9, v10, v11, v12);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C4A74A40;
  v22[3] = &unk_1E64E3038;
  v22[4] = &v25;
  v22[5] = &v29;
  v22[7] = location;
  v22[8] = length;
  v22[6] = v23;
  objc_msgSend_enumerateIndexesUsingBlock_(v13, v14, (uint64_t)v22, v15, v16, v17);

  NSUInteger v18 = v26[3];
  NSUInteger v19 = v30[3];
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  NSUInteger v20 = v18;
  NSUInteger v21 = v19;
  result.NSUInteger length = v21;
  result.NSUInteger location = v20;
  return result;
}

+ (_NSRange)rangeOfTokenAtCharacterIndex:(int64_t)a3 inString:(id)a4 locale:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v7 = (__CFString *)a4;
  CFLocaleRef v8 = (const __CFLocale *)a5;
  if (objc_msgSend_length(v7, v9, v10, v11, v12, v13))
  {
    if (a3 < 0 || objc_msgSend_length(v7, v14, v15, v16, v17, v18) <= (unint64_t)a3)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      char v24 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        int v38 = 134218240;
        int64_t v39 = a3;
        __int16 v40 = 2048;
        uint64_t v41 = objc_msgSend_length(v7, v25, v26, v27, v28, v29);
        _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_FAULT, "Character index %lu beyond bounds for string length: %lu", (uint8_t *)&v38, 0x16u);
      }
    }
    v44.CFIndex length = objc_msgSend_length(v7, v19, v20, v21, v22, v23);
    v44.CFIndex location = 0;
    uint64_t v30 = CFStringTokenizerCreate(0, v7, v44, 4uLL, v8);
    CFStringTokenizerTokenType v31 = CFStringTokenizerGoToTokenAtIndex(v30, a3);
    if (v31)
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
      CFIndex location = CurrentTokenRange.location;
      CFIndex length = CurrentTokenRange.length;
      if (!(v31 | a3)) {
        goto LABEL_15;
      }
    }
    else
    {
      CFIndex length = 0;
      CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == (unsigned __int128)0) {
        goto LABEL_15;
      }
    }
    if (location + length > (unint64_t)a3)
    {
LABEL_18:
      CFRelease(v30);
      goto LABEL_19;
    }
LABEL_15:
    if (CFStringTokenizerAdvanceToNextToken(v30))
    {
      CFRange v35 = CFStringTokenizerGetCurrentTokenRange(v30);
      if ((unint64_t)a3 >= v35.location && (unint64_t)(a3 - v35.location) < v35.length)
      {
        CFIndex length = v35.length;
        CFIndex location = v35.location;
      }
    }
    goto LABEL_18;
  }
  CFIndex length = 0;
  CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:

  NSUInteger v36 = location;
  NSUInteger v37 = length;
  result.CFIndex length = v37;
  result.CFIndex location = v36;
  return result;
}

+ (id)verticalBarGestureFromLineResult:(id)a3 currentGesture:(id)a4
{
  id v319 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_targetContentInfo(v6, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_originalDrawing(v6, v13, v14, v15, v16, v17);
  LODWORD(a1) = objc_msgSend_isVerticalBarShapeFromLineResult_originalDrawing_isDirectionDownward_(a1, v19, (uint64_t)v319, (uint64_t)v18, 0, v20);

  if (!a1)
  {
    v134 = 0;
    uint64_t Stroke_preferCharacterLevel = 0;
    goto LABEL_37;
  }
  uint64_t v26 = objc_msgSend_originalDrawing(v6, v21, v22, v23, v24, v25);
  objc_msgSend_bounds(v26, v27, v28, v29, v30, v31);
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;

  v322.origin.x = v33;
  v322.origin.y = v35;
  v322.size.width = v37;
  v322.size.height = v39;
  CGFloat MidX = CGRectGetMidX(v322);
  v323.origin.x = v33;
  v323.origin.y = v35;
  v323.size.width = v37;
  v323.size.height = v39;
  CGFloat MidY = CGRectGetMidY(v323);
  uint64_t v47 = objc_msgSend_strokeCoveredTextRange(v12, v42, v43, v44, v45, v46);
  uint64_t v49 = (uint64_t)v48;
  unint64_t v53 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v12, v48, v47, v50, v51, v52);
  uint64_t v59 = objc_msgSend_referenceSubstring(v12, v54, v55, v56, v57, v58);
  unint64_t v65 = objc_msgSend_baseWritingDirection(v12, v60, v61, v62, v63, v64);
  uint64_t v71 = objc_msgSend_characterRectsInReferenceSubstring(v12, v66, v67, v68, v69, v70);
  v72.n128_f64[0] = MidX;
  v73.n128_f64[0] = MidY;
  uint64_t v74 = sub_1C4A75108(v72, v73, (uint64_t)CHTextInputGesture, v59, v65, v71, v53, v49);

  uint64_t v80 = objc_msgSend_controlCharacterSet(MEMORY[0x1E4F28E58], v75, v76, v77, v78, v79);
  v318 = v80;
  uint64_t v86 = objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v81, v82, v83, v84, v85);
  uint64_t v92 = objc_msgSend_invertedSet(v86, v87, v88, v89, v90, v91);
  objc_msgSend_formIntersectionWithCharacterSet_(v80, v93, (uint64_t)v92, v94, v95, v96);

  uint64_t v102 = objc_msgSend_referenceSubstring(v12, v97, v98, v99, v100, v101);
  uint64_t v108 = objc_msgSend_length(v102, v103, v104, v105, v106, v107);

  if (v74 == v108)
  {
    v114 = objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
    uint64_t v120 = objc_msgSend_referenceSubstring(v12, v115, v116, v117, v118, v119);
    uint64_t v126 = objc_msgSend_length(v120, v121, v122, v123, v124, v125);
    uint64_t v131 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v114, v127, v126 - 1, v128, v129, v130);
    uint64_t v317 = v132;
    unint64_t v133 = v131;

    if (v133 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_4:
      unint64_t v133 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_11;
    }
  }
  else
  {
    if (v74 < 1
      || (objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113),
          v136 = objc_claimAutoreleasedReturnValue(),
          unint64_t v142 = objc_msgSend_length(v136, v137, v138, v139, v140, v141),
          v136,
          v142 < v74))
    {
      uint64_t v317 = 0;
      goto LABEL_4;
    }
    v268 = objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
    uint64_t v273 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v268, v269, v74 - 1, v270, v271, v272);
    uint64_t v317 = v274;
    unint64_t v133 = v273;

    if (v133 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_4;
    }
  }
  v143 = objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
  uint64_t v148 = objc_msgSend_characterAtIndex_(v143, v144, v133, v145, v146, v147);

  if (objc_msgSend_characterIsMember_(v80, v149, v148, v150, v151, v152))
  {
    v153 = objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
    v159 = objc_msgSend_invertedSet(v80, v154, v155, v156, v157, v158);
    uint64_t v161 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v153, v160, (uint64_t)v159, 4, 0, v133 + v317);
    uint64_t v317 = v162;
    unint64_t v133 = v161;
  }
LABEL_11:
  v163 = objc_msgSend_referenceSubstring(v12, v109, v110, v111, v112, v113);
  unint64_t v169 = objc_msgSend_length(v163, v164, v165, v166, v167, v168);

  if (v74 >= v169)
  {
    uint64_t v182 = 0;
    unint64_t v180 = 0x7FFFFFFFFFFFFFFFLL;
    if (v133 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_19;
    }
  }
  else
  {
    v175 = objc_msgSend_referenceSubstring(v12, v170, v171, v172, v173, v174);
    unint64_t v180 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v175, v176, v74, v177, v178, v179);
    uint64_t v182 = v181;

    v188 = objc_msgSend_referenceSubstring(v12, v183, v184, v185, v186, v187);
    uint64_t v193 = objc_msgSend_characterAtIndex_(v188, v189, v180, v190, v191, v192);

    if (objc_msgSend_characterIsMember_(v80, v194, v193, v195, v196, v197))
    {
      v198 = objc_msgSend_referenceSubstring(v12, v170, v171, v172, v173, v174);
      v204 = objc_msgSend_invertedSet(v80, v199, v200, v201, v202, v203);
      v210 = objc_msgSend_referenceSubstring(v12, v205, v206, v207, v208, v209);
      uint64_t v216 = objc_msgSend_length(v210, v211, v212, v213, v214, v215);
      unint64_t v180 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v198, v217, (uint64_t)v204, 0, v180, v216 - v180);
      uint64_t v182 = v218;
    }
    if (v133 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_19:
      uint64_t v220 = 0;
      if (v180 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
  }
  unint64_t active = objc_msgSend_activePreviewRange(v12, v170, v171, v172, v173, v174);
  if (v133 >= active && v133 - active < (unint64_t)v170) {
    goto LABEL_19;
  }
  v221 = objc_msgSend_referenceSubstring(v12, v170, v171, v172, v173, v174);
  uint64_t v220 = objc_msgSend_substringWithRange_(v221, v222, v133, v317, v223, v224);

  if (v180 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_24;
  }
LABEL_22:
  unint64_t v225 = objc_msgSend_activePreviewRange(v12, v170, v171, v172, v173, v174);
  if (v180 < v225 || v180 - v225 >= (unint64_t)v170)
  {
    v262 = objc_msgSend_referenceSubstring(v12, v170, v226, v172, v173, v174);
    uint64_t v227 = objc_msgSend_substringWithRange_(v262, v263, v180, v182, v264, v265);

    if (v220 | v227) {
      goto LABEL_25;
    }
LABEL_31:
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v266 = (id)qword_1EA3C9FC0;
    if (os_log_type_enabled(v266, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v266, OS_LOG_TYPE_DEBUG, "No characters found on either side of the vertical bar stroke", buf, 2u);
    }

    v134 = 0;
    uint64_t Stroke_preferCharacterLevel = 0;
    goto LABEL_36;
  }
LABEL_24:
  uint64_t v227 = 0;
  if (!v220) {
    goto LABEL_31;
  }
LABEL_25:
  uint64_t v316 = objc_msgSend_absoluteLocationFromRelativeLocation_(v12, v170, v180, v172, v173, v174);
  if ((objc_msgSend_isEqualToString_((void *)v220, v228, @" ", v229, v230, v231) & 1) != 0
    || objc_msgSend_isEqualToString_((void *)v220, v232, @"　", v233, v234, v235))
  {
    uint64_t v316 = objc_msgSend_absoluteLocationFromRelativeLocation_(v12, v232, v133, v233, v234, v235);
    v134 = 0;
    goto LABEL_28;
  }
  if ((objc_msgSend_isEqualToString_((void *)v227, v232, @" ", v233, v234, v235) & 1) != 0
    || (objc_msgSend_isEqualToString_((void *)v227, v275, @"　", v276, v277, v278) & 1) != 0)
  {
    v134 = 0;
    uint64_t v317 = v182;
    goto LABEL_28;
  }
  uint64_t v284 = 0x7FFFFFFFFFFFFFFFLL;
  if (v180 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_48;
  }
  if (v133 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v180 = v133 + v317;
LABEL_48:
    uint64_t v284 = objc_msgSend_absoluteLocationFromRelativeLocation_(v12, v279, v180, v281, v282, v283);
  }
  v285 = objc_msgSend_locale(v6, v279, v280, v281, v282, v283);
  if (objc_msgSend_shouldUseFullWidthSpaceBasedOnContextForLocale_(CHRecognizerConfiguration, v286, (uint64_t)v285, v287, v288, v289))
  {
    int v290 = isCharacterFullWidth((NSString *)v220);

    if (v290) {
      v295 = @"　";
    }
    else {
      v295 = @" ";
    }
  }
  else
  {

    v295 = @" ";
  }
  uint64_t v316 = v284;
  v296 = objc_msgSend_indexSetWithIndex_(MEMORY[0x1E4F28D60], v291, 0, v292, v293, v294);
  v302 = objc_msgSend_normalizedDrawing(v6, v297, v298, v299, v300, v301);
  objc_msgSend_boundsForStrokeIndexes_(v302, v303, (uint64_t)v296, v304, v305, v306);
  double v308 = v307;
  double v310 = v309;
  double v312 = v311;
  double v314 = v313;

  v134 = objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_(CHTokenizedTextResult, v315, (uint64_t)v295, (uint64_t)v296, (uint64_t)&stru_1F20141C8, 0, v308, v310, v312, v314, 0.0);

  uint64_t v317 = 0;
LABEL_28:
  v236 = [CHTextInputGesture alloc];
  v242 = objc_msgSend_locale(v6, v237, v238, v239, v240, v241);
  v248 = objc_msgSend_normalizedDrawing(v6, v243, v244, v245, v246, v247);
  v254 = objc_msgSend_originalDrawing(v6, v249, v250, v251, v252, v253);
  v260 = objc_msgSend_lastStroke(v6, v255, v256, v257, v258, v259);
  uint64_t Stroke_preferCharacterLevel = objc_msgSend_initWithGestureType_targetContentInfo_locale_normalizedDrawing_originalDrawing_lastStroke_preferCharacterLevel_(v236, v261, 7, (uint64_t)v12, (uint64_t)v242, (uint64_t)v248, v254, v260, 0);

  if (Stroke_preferCharacterLevel)
  {
    objc_storeStrong((id *)(Stroke_preferCharacterLevel + 64), v134);
    *(void *)(Stroke_preferCharacterLevel + 72) = v316;
    *(void *)(Stroke_preferCharacterLevel + 80) = v317;
  }
LABEL_36:

LABEL_37:
  return (id)Stroke_preferCharacterLevel;
}

+ (BOOL)isEditGestureForDrawing:(id)a3 targetContentInfo:(id)a4 tentativeResultType:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!objc_msgSend_pointCount(v7, v9, v10, v11, v12, v13))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    NSUInteger v19 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_FAULT, "The drawing cannot be empty", buf, 2u);
    }
  }
  uint64_t v20 = objc_msgSend_strokeCoveredTextRange(v8, v14, v15, v16, v17, v18);
  uint64_t v22 = (uint64_t)v21;
  uint64_t v246 = objc_msgSend_referenceSubstringInRange_(v8, v21, v20, (uint64_t)v21, v23, v24);
  self;
  if ((unint64_t)(a5 - 4) <= 2)
  {
    uint64_t v30 = objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v25, v26, v27, v28, v29);
    CGFloat v35 = objc_msgSend_stringByTrimmingCharactersInSet_(v246, v31, (uint64_t)v30, v32, v33, v34);
    uint64_t v41 = objc_msgSend_length(v35, v36, v37, v38, v39, v40);

    if (v41 != v22)
    {
      uint64_t v42 = sub_1C4A74070((uint64_t)CHTextInputGesture, v20, v22, a5, v7, v8);
      uint64_t v46 = objc_msgSend_referenceSubstringInRange_(v8, v43, v42, (uint64_t)v43, v44, v45);

      uint64_t v246 = (void *)v46;
    }
  }
  uint64_t v47 = objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v25, v26, v27, v28, v29);
  uint64_t v52 = objc_msgSend_stringByTrimmingCharactersInSet_(v246, v48, (uint64_t)v47, v49, v50, v51);
  uint64_t v58 = objc_msgSend_length(v52, v53, v54, v55, v56, v57);

  if (!v58)
  {
    objc_msgSend_bounds(v7, v59, v60, v61, v62, v63);
    CGFloat v65 = v64;
    CGFloat v67 = v66;
    CGFloat v69 = v68;
    CGFloat v71 = v70;
    objc_msgSend_unionCharacterRects(v8, v72, v73, v74, v75, v76);
    CGFloat x = v256.origin.x;
    CGFloat y = v256.origin.y;
    CGFloat width = v256.size.width;
    CGFloat height = v256.size.height;
    if (CGRectIsNull(v256))
    {
      uint64_t v86 = objc_msgSend_textInputTarget(v8, v81, v82, v83, v84, v85);
      objc_msgSend_frame(v86, v87, v88, v89, v90, v91);
      CGFloat x = v92;
      CGFloat y = v93;
      CGFloat width = v94;
      CGFloat height = v95;
    }
    v257.origin.CGFloat x = x;
    v257.origin.CGFloat y = y;
    v257.size.CGFloat width = width;
    v257.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v257);
    v258.origin.CGFloat x = v65;
    v258.origin.CGFloat y = v67;
    v258.size.CGFloat width = v69;
    v258.size.CGFloat height = v71;
    if (CGRectGetMinX(v258) > MinX + -5.0)
    {
      BOOL v205 = 0;
      goto LABEL_61;
    }
  }
  uint64_t v97 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v98 = objc_msgSend_strokeCount(v7, v59, v60, v61, v62, v63);
  uint64_t v102 = objc_msgSend_indexSetWithIndexesInRange_(v97, v99, 0, v98, v100, v101);
  objc_msgSend_centroidForStrokeIndexes_(v7, v103, (uint64_t)v102, v104, v105, v106);
  double v243 = v107;
  double v245 = v108;

  objc_msgSend_bounds(v7, v109, v110, v111, v112, v113);
  CGFloat v114 = v259.origin.x;
  CGFloat v115 = v259.origin.y;
  CGFloat v116 = v259.size.width;
  CGFloat v117 = v259.size.height;
  double v251 = CGRectGetMinX(v259);
  v260.origin.CGFloat x = v114;
  v260.origin.CGFloat y = v115;
  v260.size.CGFloat width = v116;
  v260.size.CGFloat height = v117;
  double MinY = CGRectGetMinY(v260);
  v261.origin.CGFloat x = v114;
  v261.origin.CGFloat y = v115;
  v261.size.CGFloat width = v116;
  v261.size.CGFloat height = v117;
  double v119 = CGRectGetMinX(v261);
  v262.origin.CGFloat x = v114;
  v262.origin.CGFloat y = v115;
  v262.size.CGFloat width = v116;
  v262.size.CGFloat height = v117;
  double MaxY = CGRectGetMaxY(v262);
  v263.origin.CGFloat x = v114;
  v263.origin.CGFloat y = v115;
  v263.size.CGFloat width = v116;
  v263.size.CGFloat height = v117;
  double MaxX = CGRectGetMaxX(v263);
  v264.origin.CGFloat x = v114;
  v264.origin.CGFloat y = v115;
  v264.size.CGFloat width = v116;
  v264.size.CGFloat height = v117;
  double v247 = CGRectGetMaxY(v264);
  v265.origin.CGFloat x = v114;
  v265.origin.CGFloat y = v115;
  v265.size.CGFloat width = v116;
  v265.size.CGFloat height = v117;
  double v121 = CGRectGetMaxX(v265);
  v266.origin.CGFloat x = v114;
  v266.origin.CGFloat y = v115;
  v266.size.CGFloat width = v116;
  v266.size.CGFloat height = v117;
  double v127 = CGRectGetMinY(v266);
  double v242 = v117;
  double v244 = v116;
  v128.f32[0] = v251;
  float32_t v129 = MinY;
  v128.f32[1] = v129;
  v130.f32[0] = v243;
  float32_t v131 = v245;
  v130.f32[1] = v131;
  float32x2_t v132 = vsub_f32(v128, v130);
  float v133 = sqrtf(vaddv_f32(vmul_f32(v132, v132)));
  v134.f32[0] = v119;
  float32_t v135 = MaxY;
  v134.f32[1] = v135;
  float32x2_t v136 = vsub_f32(v134, v130);
  float v137 = sqrtf(vaddv_f32(vmul_f32(v136, v136)));
  if (v133 >= v137) {
    double v138 = v119;
  }
  else {
    double v138 = v251;
  }
  if (v133 >= v137)
  {
    double v139 = v247;
  }
  else
  {
    double MaxY = MinY;
    double v139 = v127;
  }
  if (v133 >= v137) {
    double v140 = MaxX;
  }
  else {
    double v140 = v121;
  }
  unint64_t v141 = objc_msgSend_referenceSubstringRange(v8, v122, v123, v124, v125, v126);
  unint64_t v147 = v141;
  uint64_t v148 = v142;
  v149 = &v142[v141];
  double v150 = 0.0;
  if (v141 < (unint64_t)&v142[v141])
  {
    uint64_t v151 = 0;
    double v252 = (v245 + MaxY) * 0.5;
    double v249 = (v243 + v138) * 0.5;
    uint64_t v153 = v141;
    do
    {
      objc_msgSend_characterRectForCharacterIndex_(v8, v142, v153, v144, v145, v146);
      double v155 = v154;
      double v157 = v156;
      double v159 = v158;
      double v161 = v160;
      uint64_t v162 = [CHPolygon alloc];
      uint64_t v168 = objc_msgSend_initWithRect_(v162, v163, v164, v165, v166, v167, v155, v157, v159, v161);
      uint64_t v174 = objc_msgSend_edgeCountIntersectingLineSegment_(v168, v169, v170, v171, v172, v173, v249, v252, v243 + v244 * 0.1, v252 - (v245 - v252) / (v243 - v249) * v249 + (v245 - v252) / (v243 - v249) * (v243 + v244 * 0.1));
      double v152 = (v245 + v139) * 0.5;
      v151 += v174
            + objc_msgSend_edgeCountIntersectingLineSegment_(v168, v175, v176, v177, v178, v179, v243 - v244 * 0.1, v152- (v245 - v152) / (v243 - (v243 + v140) * 0.5) * ((v243 + v140) * 0.5)+ (v245 - v152) / (v243 - (v243 + v140) * 0.5) * (v243 - v244 * 0.1), (v243 + v140) * 0.5, v152);

      ++v153;
      --v148;
    }
    while (v148);
    double v150 = (double)v151;
  }
  unint64_t v180 = objc_msgSend_referenceSubstring(v8, v142, v143, v144, v145, v146);
  uint64_t v186 = objc_msgSend_length(v180, v181, v182, v183, v184, v185);

  if (v186)
  {
    uint64_t v192 = objc_msgSend_characterRectsInReferenceSubstring(v8, v187, v188, v189, v190, v191);
    v198 = objc_msgSend_referenceSubstring(v8, v193, v194, v195, v196, v197);
    double v204 = *(double *)(v192 + 32 * objc_msgSend_length(v198, v199, v200, v201, v202, v203) - 16);

    if (v244 < v204 || v150 / (v244 * v242) * 100.0 > 0.01)
    {
      BOOL v205 = 1;
      goto LABEL_61;
    }
  }
  uint64_t v209 = objc_msgSend_pointCountForStrokeIndex_(v7, v187, 0, v189, v190, v191);
  if (v209 < 1)
  {
    uint64_t v215 = 0;
    uint64_t v214 = 0;
    goto LABEL_60;
  }
  v210 = (double *)MEMORY[0x1E4F1DAD8];
  double v212 = *MEMORY[0x1E4F1DAD8];
  double v211 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v147 < (unint64_t)v149)
  {
    uint64_t v213 = 0;
    uint64_t v214 = 0;
    uint64_t v215 = 0;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v7, v206, 0, 0, v207, v208);
    while (1)
    {
      CGFloat v250 = v221;
      CGFloat v253 = v220;
      BOOL v222 = v212 == *v210 && v211 == v210[1];
      if (v222
        || (v223.f32[0] = v212,
            float32_t v224 = v211,
            v223.f32[1] = v224,
            v225.f64[0] = v253,
            v225.f64[1] = v250,
            float32x2_t v226 = vsub_f32(v223, vcvt_f32_f64(v225)),
            sqrtf(vaddv_f32(vmul_f32(v226, v226))) >= 2.0))
      {
        uint64_t v227 = v147;
        do
        {
          objc_msgSend_characterRectForCharacterIndex_(v8, v216, v227, v217, v218, v219);
          v255.CGFloat y = v250;
          v255.CGFloat x = v253;
          BOOL v228 = CGRectContainsPoint(v267, v255);
          int v229 = ++v227 >= (unint64_t)v149 || v228;
        }
        while (v229 != 1);
        v215 += v228;
        double v211 = v250;
        double v212 = v253;
        if (++v213 == v209) {
          goto LABEL_60;
        }
      }
      else
      {
        ++v214;
        if (++v213 == v209) {
          goto LABEL_60;
        }
      }
      objc_msgSend_pointForStrokeIndex_pointIndex_(v7, v216, 0, v213, v218, v219);
    }
  }
  uint64_t v230 = 0;
  uint64_t v214 = 0;
  objc_msgSend_pointForStrokeIndex_pointIndex_(v7, v206, 0, 0, v207, v208);
  while (1)
  {
    if (v212 != *v210 || v211 != v210[1])
    {
      v237.f32[0] = v212;
      float32_t v238 = v211;
      v237.f32[1] = v238;
      v239.f64[0] = v234;
      v239.f64[1] = v235;
      float32x2_t v240 = vsub_f32(v237, vcvt_f32_f64(v239));
      if (sqrtf(vaddv_f32(vmul_f32(v240, v240))) < 2.0) {
        break;
      }
    }
    double v211 = v235;
    double v212 = v234;
    if (v209 == ++v230) {
      goto LABEL_59;
    }
LABEL_52:
    objc_msgSend_pointForStrokeIndex_pointIndex_(v7, v231, 0, v230, v232, v233);
  }
  ++v214;
  if (v209 != ++v230) {
    goto LABEL_52;
  }
LABEL_59:
  uint64_t v215 = 0;
LABEL_60:
  BOOL v205 = (double)v215 / ((double)v209 - (double)v214) > 0.3;
LABEL_61:

  return v205;
}

+ (BOOL)shouldReclassifyGestureType:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x1FDu >> a3);
}

+ (BOOL)isVerticalBarShapeFromLineResult:(id)a3 originalDrawing:(id)a4 isDirectionDownward:(BOOL *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend_strokeCount(v8, v9, v10, v11, v12, v13) != 1
    || (unint64_t)objc_msgSend_pointCountForStrokeIndex_(v8, v14, 0, v15, v16, v17) <= 1)
  {
    BOOL v18 = 0;
    if (a5) {
      *a5 = 0;
    }
    goto LABEL_23;
  }
  id v19 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v25 = objc_msgSend_string(v19, v20, v21, v22, v23, v24);
  if (objc_msgSend_isEqualToString_(v25, v26, @"Line", v27, v28, v29))
  {
  }
  else
  {
    uint64_t v40 = objc_msgSend_string(v19, v30, v31, v32, v33, v34);
    int isEqualToString = objc_msgSend_isEqualToString_(v40, v41, @"Manhattan Line", v42, v43, v44);

    if (!isEqualToString)
    {
LABEL_19:
      BOOL v18 = 0;
      BOOL v85 = 0;
      goto LABEL_20;
    }
  }
  objc_msgSend_endLocation(v19, v35, v36, v37, v38, v39);
  double v47 = v46;
  objc_msgSend_startLocation(v19, v48, v49, v50, v51, v52);
  double v54 = v53;
  objc_msgSend_endLocation(v19, v55, v56, v57, v58, v59);
  double v61 = v60;
  objc_msgSend_startLocation(v19, v62, v63, v64, v65, v66);
  double v71 = v61 - v70;
  if (v71 >= 0.0) {
    double v72 = 0.000001;
  }
  else {
    double v72 = -0.000001;
  }
  if (v71 > -0.000001 && v71 < 0.000001) {
    double v71 = v72;
  }
  if (fabs((v47 - v54) / v71) <= 2.0) {
    goto LABEL_19;
  }
  objc_msgSend_pointForStrokeIndex_pointIndex_(v8, v67, 0, 0, v68, v69);
  double v75 = v74;
  uint64_t v80 = objc_msgSend_pointCountForStrokeIndex_(v8, v76, 0, v77, v78, v79);
  objc_msgSend_pointForStrokeIndex_pointIndex_(v8, v81, 0, v80 - 1, v82, v83);
  BOOL v85 = v84 > v75;
  BOOL v18 = 1;
LABEL_20:
  if (a5) {
    *a5 = v85;
  }

LABEL_23:
  return v18;
}

+ (BOOL)isDrawingCenterOnBlank:(id)a3 targetContentInfo:(id)a4 insertionLocation:(int64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_msgSend_bounds(v7, v9, v10, v11, v12, v13);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  uint64_t v27 = objc_msgSend_referenceSubstringRange(v8, v22, v23, v24, v25, v26);
  uint64_t v29 = v28;
  unint64_t v33 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v8, v28, v27, v30, v31, v32);
  if (objc_msgSend_textContentLength(v8, v34, v35, v36, v37, v38) <= 0) {
    uint64_t v44 = 0;
  }
  else {
    uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!v29) {
    goto LABEL_9;
  }
  CGRect v91 = *(CGRect *)(objc_msgSend_characterRectsInReferenceSubstring(v8, v39, v40, v41, v42, v43)
                  + 32 * (void)v29
                  - 32);
  double MaxY = CGRectGetMaxY(v91);
  v92.origin.CGFloat x = v15;
  v92.origin.CGFloat y = v17;
  v92.size.CGFloat width = v19;
  v92.size.CGFloat height = v21;
  if (MaxY <= CGRectGetMinY(v92))
  {
    uint64_t v44 = (uint64_t)&v29[v33];
    goto LABEL_12;
  }
  CGRect v93 = *(CGRect *)objc_msgSend_characterRectsInReferenceSubstring(v8, v39, v46, v41, v42, v43);
  double MinY = CGRectGetMinY(v93);
  v94.origin.CGFloat x = v15;
  v94.origin.CGFloat y = v17;
  v94.size.CGFloat width = v19;
  v94.size.CGFloat height = v21;
  if (MinY >= CGRectGetMaxY(v94))
  {
LABEL_9:
    uint64_t v44 = 0;
    BOOL v52 = 1;
    if (a5) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }
  uint64_t v49 = objc_msgSend_characterRectsInReferenceSubstring(v8, v39, v48, v41, v42, v43);
  v95.origin.CGFloat x = v15;
  v95.origin.CGFloat y = v17;
  v95.size.CGFloat width = v19;
  v95.size.CGFloat height = v21;
  double MidX = CGRectGetMidX(v95);
  v96.origin.CGFloat x = v15;
  v96.origin.CGFloat y = v17;
  v96.size.CGFloat width = v19;
  v96.size.CGFloat height = v21;
  double MidY = CGRectGetMidY(v96);
  if (v33 >= (unint64_t)&v29[v33])
  {
LABEL_12:
    if ((unint64_t)(v44 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
    {
      double v53 = objc_msgSend_referenceSubstring(v8, v39, v46, v41, v42, v43);
      uint64_t v58 = objc_msgSend_characterAtIndex_(v53, v54, v44 - 1, v55, v56, v57);

      uint64_t v64 = objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v59, v60, v61, v62, v63);
      LODWORD(v58) = objc_msgSend_characterIsMember_(v64, v65, v58, v66, v67, v68);

      if (v58) {
        --v44;
      }
    }
    BOOL v52 = 1;
    if (a5) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }
  uint64_t v50 = v33 + 1;
  uint64_t v51 = v49 + 32 * v33 + 16;
  double v88 = 1.79769313e308;
  CGFloat v86 = v17;
  CGFloat v87 = v15;
  CGFloat v84 = v21;
  CGFloat v85 = v19;
  while (1)
  {
    CGFloat v75 = *(double *)(v51 - 16);
    CGFloat v76 = *(double *)(v51 - 8);
    CGFloat v78 = *(double *)v51;
    CGFloat v77 = *(double *)(v51 + 8);
    v98.origin.CGFloat x = v75;
    v98.origin.CGFloat y = v76;
    v98.size.CGFloat width = *(CGFloat *)v51;
    v98.size.CGFloat height = v77;
    if (CGRectIsNull(v98)) {
      goto LABEL_28;
    }
    v99.origin.CGFloat x = v75;
    v99.origin.CGFloat y = v76;
    v99.size.CGFloat width = v78;
    v99.size.CGFloat height = v77;
    if (CGRectGetMinY(v99) <= MidY)
    {
      v100.origin.CGFloat x = v75;
      v100.origin.CGFloat y = v76;
      v100.size.CGFloat width = v78;
      v100.size.CGFloat height = v77;
      if (CGRectGetMaxY(v100) >= MidY) {
        break;
      }
    }
    v101.origin.CGFloat x = v75;
    v101.origin.CGFloat y = v76;
    v101.size.CGFloat width = v78;
    v101.size.CGFloat height = v77;
    if (CGRectGetMinY(v101) >= MidY) {
      goto LABEL_12;
    }
LABEL_28:
    ++v50;
    v51 += 32;
    if (!--v29) {
      goto LABEL_12;
    }
  }
  v102.origin.CGFloat x = v75;
  v102.origin.CGFloat y = v76;
  v102.size.CGFloat width = v78;
  v102.size.CGFloat height = v77;
  v108.origin.CGFloat x = v15;
  v108.origin.CGFloat y = v17;
  v108.size.CGFloat width = v19;
  v108.size.CGFloat height = v21;
  CGRect v103 = CGRectIntersection(v102, v108);
  CGFloat x = v103.origin.x;
  CGFloat y = v103.origin.y;
  CGFloat width = v103.size.width;
  CGFloat height = v103.size.height;
  if (CGRectIsNull(v103)) {
    goto LABEL_36;
  }
  v104.origin.CGFloat y = v86;
  v104.origin.CGFloat x = v87;
  v104.size.CGFloat height = v84;
  v104.size.CGFloat width = v85;
  double v83 = CGRectGetHeight(v104);
  v105.origin.CGFloat x = x;
  v105.origin.CGFloat y = y;
  v105.size.CGFloat width = width;
  v105.size.CGFloat height = height;
  if (CGRectGetHeight(v105) < v83 * 0.3)
  {
LABEL_36:
    v106.origin.CGFloat x = v75;
    v106.origin.CGFloat y = v76;
    v106.size.CGFloat width = v78;
    v106.size.CGFloat height = v77;
    CGFloat v17 = v86;
    CGFloat v15 = v87;
    CGFloat v21 = v84;
    CGFloat v19 = v85;
    if (MidX - CGRectGetMidX(v106) >= 0.0)
    {
      v97.origin.CGFloat x = v75;
      v97.origin.CGFloat y = v76;
      v97.size.CGFloat width = v78;
      v97.size.CGFloat height = v77;
      double v72 = MidX - CGRectGetMidX(v97);
    }
    else
    {
      v107.origin.CGFloat x = v75;
      v107.origin.CGFloat y = v76;
      v107.size.CGFloat width = v78;
      v107.size.CGFloat height = v77;
      double v72 = -(MidX - CGRectGetMidX(v107));
    }
    double v73 = v88;
    BOOL v74 = v72 < v88;
    if (v72 < v88) {
      double v73 = v72;
    }
    double v88 = v73;
    if (v74) {
      uint64_t v44 = v50;
    }
    goto LABEL_28;
  }
  BOOL v52 = 0;
  if (!a5) {
    goto LABEL_22;
  }
LABEL_16:
  int64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
  if (v44 != 0x7FFFFFFFFFFFFFFFLL && v52) {
    int64_t v69 = objc_msgSend_absoluteLocationFromRelativeLocation_(v8, v39, v44, v41, v42, v43);
  }
  *a5 = v69;
LABEL_22:

  return v52;
}

- (int64_t)gestureType
{
  return self->_gestureType;
}

- (void)setGestureType:(int64_t)a3
{
  self->_gestureType = a3;
}

- (CHTextInputTargetContentInfo)targetContentInfo
{
  return self->_targetContentInfo;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (CHDrawing)normalizedDrawing
{
  return self->_normalizedDrawing;
}

- (CHDrawing)originalDrawing
{
  return self->_originalDrawing;
}

- (BOOL)preferCharacterLevel
{
  return self->_preferCharacterLevel;
}

- (CHStroke)lastStroke
{
  return self->_lastStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textResult, 0);
  objc_storeStrong((id *)&self->_lastStroke, 0);
  objc_storeStrong((id *)&self->_originalDrawing, 0);
  objc_storeStrong((id *)&self->_normalizedDrawing, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_targetContentInfo, 0);
}

@end