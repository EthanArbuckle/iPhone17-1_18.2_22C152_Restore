@interface CHReflowableTextLine
+ (BOOL)supportsReflowForLocale:(id)a3;
+ (BOOL)useRightToLeftReflow:(id)a3;
+ (id)_normalizedLocaleForCRLineWrapper:(id)a3;
+ (id)alignShortReflowableLines:(id)a3;
+ (id)reflowableLines:(id)a3 withLineWrapper:(id)a4;
- ($9936F71585EAE7D8081FB1B234834B3F)principalLines;
- (BOOL)hasEndingLineBreak;
- (BOOL)hasStartingLineBreak;
- (CGRect)bounds;
- (CHReflowableTextLine)initWithTokens:(id)a3 principalLines:(id *)a4 bounds:(CGRect)a5 headIndent:(double)a6 leading:(double)a7 hasStartingLineBreak:(BOOL)a8 hasEndingLineBreak:(BOOL)a9 alignmentType:(unint64_t)a10 writingDirection:(int64_t)a11 locale:(id)a12;
- (CRNormalizedQuad)boundingQuad;
- (NSArray)tokens;
- (NSLocale)locale;
- (NSString)description;
- (double)headIndent;
- (double)leading;
- (id)_string;
- (id)string;
- (int64_t)writingDirection;
- (unint64_t)alignmentType;
- (unint64_t)layoutDirection;
- (void)setBounds:(CGRect)a3;
- (void)setHasEndingLineBreak:(BOOL)a3;
- (void)setHasStartingLineBreak:(BOOL)a3;
@end

@implementation CHReflowableTextLine

- (CHReflowableTextLine)initWithTokens:(id)a3 principalLines:(id *)a4 bounds:(CGRect)a5 headIndent:(double)a6 leading:(double)a7 hasStartingLineBreak:(BOOL)a8 hasEndingLineBreak:(BOOL)a9 alignmentType:(unint64_t)a10 writingDirection:(int64_t)a11 locale:(id)a12
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v24 = a3;
  id v25 = a12;
  v48.receiver = self;
  v48.super_class = (Class)CHReflowableTextLine;
  v31 = [(CHReflowableTextLine *)&v48 init];
  if (v31)
  {
    uint64_t v32 = objc_msgSend_copy(v24, v26, v27, v28, v29, v30);
    tokens = v31->_tokens;
    v31->_tokens = (NSArray *)v32;

    CGPoint var0 = a4->var0.var0;
    CGPoint var1 = a4->var0.var1;
    CGPoint v36 = a4->var1.var1;
    v31->_principalLines.base.start = a4->var1.var0;
    v31->_principalLines.base.end = v36;
    v31->_principalLines.descender.start = var0;
    v31->_principalLines.descender.end = var1;
    CGPoint v37 = a4->var2.var0;
    CGPoint v38 = a4->var2.var1;
    CGPoint v39 = a4->var3.var1;
    v31->_principalLines.top.start = a4->var3.var0;
    v31->_principalLines.top.end = v39;
    v31->_principalLines.median.start = v37;
    v31->_principalLines.median.end = v38;
    v31->_bounds.origin.CGFloat x = x;
    v31->_bounds.origin.CGFloat y = y;
    v31->_bounds.size.CGFloat width = width;
    v31->_bounds.size.CGFloat height = height;
    v31->_headIndent = a6;
    v31->_leading = a7;
    v31->_hasStartingLineBreak = a8;
    v31->_hasEndingLineBreak = a9;
    v31->_alignmentType = a10;
    v31->_writingDirection = a11;
    uint64_t v45 = objc_msgSend_copy(v25, v40, v41, v42, v43, v44);
    locale = v31->_locale;
    v31->_locale = (NSLocale *)v45;
  }
  return v31;
}

- (id)string
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4, v5);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v13 = objc_msgSend_tokens(self, v8, v9, v10, v11, v12, 0);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v36, (uint64_t)v40, 16, v15);
  if (v21)
  {
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v13);
        }
        id v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_msgSend_hasPrecedingSpace(v24, v16, v17, v18, v19, v20)) {
          objc_msgSend_appendString_(v7, v25, @" ", v27, v28, v29);
        }
        uint64_t v30 = objc_msgSend_string(v24, v25, v26, v27, v28, v29);
        objc_msgSend_appendString_(v7, v31, (uint64_t)v30, v32, v33, v34);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v36, (uint64_t)v40, 16, v20);
    }
    while (v21);
  }

  return v7;
}

- (NSString)description
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4, v5);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v13 = objc_msgSend_tokens(self, v8, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v67, (uint64_t)v71, 16, v15);
  if (v21)
  {
    uint64_t v22 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v68 != v22) {
          objc_enumerationMutation(v13);
        }
        id v24 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        id v25 = objc_msgSend_strokeIdentifiers(v24, v16, v17, v18, v19, v20);
        uint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
        long long v37 = objc_msgSend_nonTextStrokeIdentifiers(v24, v32, v33, v34, v35, v36);
        uint64_t v43 = objc_msgSend_count(v37, v38, v39, v40, v41, v42);
        objc_msgSend_appendFormat_(v7, v44, @"(T: %lu, NT%lu), ", v45, v46, v47, v31, v43);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v67, (uint64_t)v71, 16, v20);
    }
    while (v21);
  }

  objc_super v48 = NSString;
  v54 = objc_msgSend_tokens(self, v49, v50, v51, v52, v53);
  uint64_t v60 = objc_msgSend_count(v54, v55, v56, v57, v58, v59);
  v65 = objc_msgSend_stringWithFormat_(v48, v61, @"ReflowableLine %lu tokens, stroke counts per token = %@", v62, v63, v64, v60, v7);

  return (NSString *)v65;
}

+ (BOOL)supportsReflowForLocale:(id)a3
{
  v6 = objc_msgSend_languageCode(a3, a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend_lowercaseString(v6, v7, v8, v9, v10, v11);

  if (v12)
  {
    char v17 = objc_msgSend_containsObject_(&unk_1F203D950, v13, (uint64_t)v12, v14, v15, v16);

    return v17;
  }
  else
  {

    return 0;
  }
}

+ (BOOL)useRightToLeftReflow:(id)a3
{
  v6 = objc_msgSend_languageCode(a3, a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend_lowercaseString(v6, v7, v8, v9, v10, v11);

  if (v12)
  {
    char v17 = objc_msgSend_containsObject_(&unk_1F203D968, v13, (uint64_t)v12, v14, v15, v16);

    return v17;
  }
  else
  {

    return 0;
  }
}

- (id)_string
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v6 = objc_msgSend_tokens(self, a2, v2, v3, v4, v5, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v36, 16, v8);
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    uint64_t v16 = &stru_1F20141C8;
    do
    {
      uint64_t v17 = 0;
      uint64_t v18 = v16;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v6);
        }
        uint64_t v19 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
        if (objc_msgSend_hasPrecedingSpace(v19, v9, v10, v11, v12, v13))
        {
          uint64_t v25 = objc_msgSend_stringByAppendingString_(v18, v20, @" ", v22, v23, v24);

          uint64_t v18 = (void *)v25;
        }
        uint64_t v26 = objc_msgSend_string(v19, v20, v21, v22, v23, v24);
        objc_msgSend_stringByAppendingString_(v18, v27, (uint64_t)v26, v28, v29, v30);
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v17;
        uint64_t v18 = v16;
      }
      while (v14 != v17);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v32, (uint64_t)v36, 16, v13);
    }
    while (v14);
  }
  else
  {
    uint64_t v16 = &stru_1F20141C8;
  }

  return v16;
}

- (CRNormalizedQuad)boundingQuad
{
  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  objc_msgSend_bounds(self, v7, v8, v9, v10, v11);
  if (v14 == 0.0) {
    double v14 = 1.0;
  }
  if (v15 == 0.0) {
    double v15 = 1.0;
  }
  double v16 = v12 + v32 * v14;
  double v17 = v13 + v33 * v15;
  double v18 = v12 + v34 * v14;
  double v19 = v13 + v35 * v15;
  double v20 = v12 + v36 * v14;
  double v21 = v13 + v37 * v15;
  double v22 = v12 + v38 * v14;
  double v23 = v13 + v39 * v15;
  id v24 = objc_alloc(MEMORY[0x1E4FAF188]);
  uint64_t v30 = objc_msgSend_initWithNormalizedTopLeft_topRight_bottomRight_bottomLeft_size_(v24, v25, v26, v27, v28, v29, v20, v21, v22, v23, v18, v19, v16, v17, 0x3FF0000000000000, 0x3FF0000000000000);
  return (CRNormalizedQuad *)v30;
}

- (unint64_t)layoutDirection
{
  uint64_t v6 = objc_msgSend_writingDirection(self, a2, v2, v3, v4, v5);
  if ((unint64_t)(v6 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1C4C39C80[v6 - 1];
  }
}

+ (id)reflowableLines:(id)a3 withLineWrapper:(id)a4
{
  uint64_t v585 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v510 = a4;
  v512 = v5;
  if ((unint64_t)objc_msgSend_count(v5, v6, v7, v8, v9, v10) > 1)
  {
    v509 = objc_alloc_init(CHCTLD);
    double v15 = objc_msgSend_reflowableLineRegions_(v509, v11, (uint64_t)v5, v12, v13, v14);
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v559 = 0u;
    long long v560 = 0u;
    long long v561 = 0u;
    long long v562 = 0u;
    obuint64_t j = v15;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v559, (uint64_t)v584, 16, v21);
    if (v22)
    {
      uint64_t v23 = *(void *)v560;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v560 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v559 + 1) + 8 * i);
          long long v555 = 0u;
          long long v556 = 0u;
          long long v557 = 0u;
          long long v558 = 0u;
          id v26 = v25;
          uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v555, (uint64_t)v583, 16, v28);
          if (v34)
          {
            uint64_t v35 = *(void *)v556;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v556 != v35) {
                  objc_enumerationMutation(v26);
                }
                objc_msgSend_bounds(*(void **)(*((void *)&v555 + 1) + 8 * j), v29, v30, v31, v32, v33);
                v589.origin.double x = v37;
                v589.origin.double y = v38;
                v589.size.double width = v39;
                v589.size.double height = v40;
                v587.origin.double x = x;
                v587.origin.double y = y;
                v587.size.double width = width;
                v587.size.double height = height;
                CGRect v588 = CGRectUnion(v587, v589);
                double x = v588.origin.x;
                double y = v588.origin.y;
                double width = v588.size.width;
                double height = v588.size.height;
              }
              uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v555, (uint64_t)v583, 16, v33);
            }
            while (v34);
          }
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v559, (uint64_t)v584, 16, v42);
      }
      while (v22);
    }

    v513 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v43, v44, v45, v46, v47);
    long long v553 = 0u;
    long long v554 = 0u;
    long long v551 = 0u;
    long long v552 = 0u;
    id v514 = obj;
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v514, v48, (uint64_t)&v551, (uint64_t)v582, 16, v49);
    if (v55)
    {
      uint64_t v518 = *(void *)v552;
      while (2)
      {
        id v521 = 0;
        id v515 = (id)v55;
        do
        {
          if (*(void *)v552 != v518) {
            objc_enumerationMutation(v514);
          }
          uint64_t v56 = *(void **)(*((void *)&v551 + 1) + 8 * (void)v521);
          uint64_t v57 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v50, v51, v52, v53, v54);
          long long v549 = 0u;
          long long v550 = 0u;
          long long v547 = 0u;
          long long v548 = 0u;
          id v522 = v56;
          uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v522, v58, (uint64_t)&v547, (uint64_t)v581, 16, v59);
          if (v65)
          {
            uint64_t v66 = *(void *)v548;
            while (2)
            {
              for (uint64_t k = 0; k != v65; ++k)
              {
                if (*(void *)v548 != v66) {
                  objc_enumerationMutation(v522);
                }
                long long v68 = *(void **)(*((void *)&v547 + 1) + 8 * k);
                long long v69 = objc_msgSend_boundingQuad(v68, v60, v61, v62, v63, v64);
                objc_msgSend_topLeft(v69, v70, v71, v72, v73, v74);
                id v533 = v75;
                objc_msgSend_topLeft(v69, v76, v77, v78, v79, v80);
                double v530 = v81;
                objc_msgSend_topRight(v69, v82, v83, v84, v85, v86);
                double v527 = v87;
                objc_msgSend_topRight(v69, v88, v89, v90, v91, v92);
                double v524 = v93;
                objc_msgSend_bottomRight(v69, v94, v95, v96, v97, v98);
                double v100 = v99;
                objc_msgSend_bottomRight(v69, v101, v102, v103, v104, v105);
                double v107 = v106;
                objc_msgSend_bottomLeft(v69, v108, v109, v110, v111, v112);
                double v114 = v113;
                objc_msgSend_bottomLeft(v69, v115, v116, v117, v118, v119);
                double v121 = v120;
                id v122 = objc_alloc(MEMORY[0x1E4FAF188]);
                v128 = objc_msgSend_initWithNormalizedTopLeft_topRight_bottomRight_bottomLeft_size_(v122, v123, v124, v125, v126, v127, (*(double *)&v533 - x) / width, (v530 - y) / height, (v527 - x) / width, (v524 - y) / height, (v100 - x) / width, (v107 - y) / height, (v114 - x) / width, (v121 - y) / height, *(void *)&width, *(void *)&height);
                v134 = objc_msgSend_locale(v68, v129, v130, v131, v132, v133);
                v135 = objc_opt_class();
                v140 = objc_msgSend__normalizedLocaleForCRLineWrapper_(v135, v136, (uint64_t)v134, v137, v138, v139);

                if (!v140)
                {

                  char v155 = 0;
                  goto LABEL_32;
                }
                v141 = [CHLineWrappableLine alloc];
                v147 = objc_msgSend__string(v68, v142, v143, v144, v145, v146);
                v150 = objc_msgSend_initWithQuad_text_locale_(v141, v148, (uint64_t)v128, (uint64_t)v147, (uint64_t)v140, v149);

                objc_msgSend_addObject_(v57, v151, (uint64_t)v150, v152, v153, v154);
              }
              uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v522, v60, (uint64_t)&v547, (uint64_t)v581, 16, v64);
              if (v65) {
                continue;
              }
              break;
            }
          }
          char v155 = 1;
LABEL_32:

          v156 = [CHLineWrappableGroup alloc];
          v161 = objc_msgSend_initWithLines_(v156, v157, (uint64_t)v57, v158, v159, v160);
          objc_msgSend_addObject_(v513, v162, (uint64_t)v161, v163, v164, v165);

          if ((v155 & 1) == 0)
          {

            id v520 = v512;
            goto LABEL_92;
          }
          id v521 = (char *)v521 + 1;
        }
        while (v521 != v515);
        uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v514, v50, (uint64_t)&v551, (uint64_t)v582, 16, v54);
        if (v55) {
          continue;
        }
        break;
      }
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v166 = (id)qword_1EA3C9FE8;
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v172 = objc_msgSend_count(v512, v167, v168, v169, v170, v171);
      uint64_t v178 = objc_msgSend_count(v514, v173, v174, v175, v176, v177);
      *(_DWORD *)buf = 134218240;
      unint64_t v564 = v172;
      __int16 v565 = 2048;
      unint64_t v566 = v178;
      _os_log_impl(&dword_1C492D000, v166, OS_LOG_TYPE_DEBUG, "Running line wrapper for %lu lines in %lu groups.", buf, 0x16u);
    }

    v511 = objc_msgSend_lineWrappingResultForGroups_options_error_(v510, v179, (uint64_t)v513, 0, 0, v180);
    v181 = objc_opt_new();
    long long v545 = 0u;
    long long v546 = 0u;
    long long v543 = 0u;
    long long v544 = 0u;
    v187 = objc_msgSend_lineWrappableGroups(v511, v182, v183, v184, v185, v186);
    id v534 = v187;
    unint64_t v190 = 0;
    uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v188, (uint64_t)&v543, (uint64_t)v580, 16, v189);
    if (v196)
    {
      uint64_t v197 = *(void *)v544;
      do
      {
        for (uint64_t m = 0; m != v196; ++m)
        {
          if (*(void *)v544 != v197) {
            objc_enumerationMutation(v534);
          }
          v199 = *(void **)(*((void *)&v543 + 1) + 8 * m);
          long long v539 = 0u;
          long long v540 = 0u;
          long long v541 = 0u;
          long long v542 = 0u;
          v200 = objc_msgSend_subregions(v199, v191, v192, v193, v194, v195);
          uint64_t v208 = objc_msgSend_countByEnumeratingWithState_objects_count_(v200, v201, (uint64_t)&v539, (uint64_t)v579, 16, v202);
          if (v208)
          {
            uint64_t v209 = *(void *)v540;
            do
            {
              uint64_t v210 = 0;
              unint64_t v211 = v190;
              do
              {
                if (*(void *)v540 != v209) {
                  objc_enumerationMutation(v200);
                }
                if (objc_msgSend_lineWrappingType(*(void **)(*((void *)&v539 + 1) + 8 * v210), v203, v204, v205, v206, v207) != 1)objc_msgSend_addIndex_(v181, v203, v190 + v210, v205, v206, v207); {
                ++v210;
                }
              }
              while (v208 != v210);
              uint64_t v208 = objc_msgSend_countByEnumeratingWithState_objects_count_(v200, v203, (uint64_t)&v539, (uint64_t)v579, 16, v207);
              v190 += v210;
            }
            while (v208);
            unint64_t v190 = v211 + v210;
          }
        }
        v187 = v534;
        uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v534, v191, (uint64_t)&v543, (uint64_t)v580, 16, v195);
      }
      while (v196);
    }

    if (v190 != objc_msgSend_count(v512, v212, v213, v214, v215, v216))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v217 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v217, OS_LOG_TYPE_FAULT))
      {
        uint64_t v223 = objc_msgSend_count(v512, v218, v219, v220, v221, v222);
        *(_DWORD *)buf = 134218240;
        unint64_t v564 = v190;
        __int16 v565 = 2048;
        unint64_t v566 = v223;
        _os_log_impl(&dword_1C492D000, v217, OS_LOG_TYPE_FAULT, "Number of wrapping result lines should match that of reflowable lines: %lu != %lu", buf, 0x16u);
      }
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v224 = (id)qword_1EA3C9FE8;
    BOOL v225 = os_log_type_enabled(v224, OS_LOG_TYPE_DEBUG);

    if (v225)
    {
      unint64_t v525 = 0;
      while (1)
      {
        v231 = objc_msgSend_lineWrappableGroups(v511, v226, v227, v228, v229, v230);
        BOOL v237 = v525 < objc_msgSend_count(v231, v232, v233, v234, v235, v236);

        if (!v237) {
          break;
        }
        v238 = objc_msgSend_lineWrappableGroups(v511, v226, v227, v228, v229, v230);
        objc_msgSend_objectAtIndexedSubscript_(v238, v239, v525, v240, v241, v242);
        id v535 = (id)objc_claimAutoreleasedReturnValue();

        unint64_t v248 = 0;
        ++v525;
        while (1)
        {
          v249 = objc_msgSend_subregions(v535, v243, v244, v245, v246, v247);
          BOOL v255 = v248 < objc_msgSend_count(v249, v250, v251, v252, v253, v254);

          if (!v255) {
            break;
          }
          v261 = objc_msgSend_subregions(v535, v256, v257, v258, v259, v260);
          v266 = objc_msgSend_objectAtIndexedSubscript_(v261, v262, v248, v263, v264, v265);

          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v267 = (id)qword_1EA3C9FE8;
          if (os_log_type_enabled(v267, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v273 = objc_msgSend_lineWrappingType(v266, v268, v269, v270, v271, v272);
            v531 = objc_msgSend_text(v266, v274, v275, v276, v277, v278);
            v528 = objc_msgSend_locale(v266, v279, v280, v281, v282, v283);
            v289 = objc_msgSend_localeIdentifier(v528, v284, v285, v286, v287, v288);
            v295 = objc_msgSend_boundingQuad(v266, v290, v291, v292, v293, v294);
            objc_msgSend_topLeft(v295, v296, v297, v298, v299, v300);
            uint64_t v302 = v301;
            v308 = objc_msgSend_boundingQuad(v266, v303, v304, v305, v306, v307);
            objc_msgSend_topLeft(v308, v309, v310, v311, v312, v313);
            uint64_t v315 = v314;
            v321 = objc_msgSend_boundingQuad(v266, v316, v317, v318, v319, v320);
            objc_msgSend_size(v321, v322, v323, v324, v325, v326);
            uint64_t v328 = v327;
            v334 = objc_msgSend_boundingQuad(v266, v329, v330, v331, v332, v333);
            objc_msgSend_size(v334, v335, v336, v337, v338, v339);
            ++v248;
            *(_DWORD *)buf = 134220035;
            unint64_t v564 = v525;
            __int16 v565 = 2048;
            unint64_t v566 = v248;
            __int16 v567 = 2048;
            *(void *)v568 = v273;
            *(_WORD *)&v568[8] = 2117;
            v569 = v531;
            *(_WORD *)v570 = 2112;
            *(void *)&v570[2] = v289;
            __int16 v571 = 2048;
            uint64_t v572 = v302;
            __int16 v573 = 2048;
            uint64_t v574 = v315;
            __int16 v575 = 2048;
            uint64_t v576 = v328;
            __int16 v577 = 2048;
            uint64_t v578 = v340;
            _os_log_impl(&dword_1C492D000, v267, OS_LOG_TYPE_DEBUG, "Line Wrapping Line:%lu-%lu result:%lu text:'%{sensitive}@' (%@) (x:%lf y:%lf w:%lf h:%lf)", buf, 0x5Cu);
          }
          else
          {
            ++v248;
          }
        }
      }
    }
    v341 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v342 = objc_msgSend_count(v512, v226, v227, v228, v229, v230);
    objc_msgSend_arrayWithCapacity_(v341, v343, v342, v344, v345, v346);
    id v520 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v529 = 0;
    unint64_t v352 = 0;
    char v353 = 1;
    while (v352 < objc_msgSend_count(v514, v347, v348, v349, v350, v351))
    {
      v526 = objc_msgSend_objectAtIndexedSubscript_(v514, v354, v352, v355, v356, v357);
      unint64_t v363 = 0;
      unint64_t v516 = v352 + 1;
      while (v363 < objc_msgSend_count(v526, v358, v359, v360, v361, v362))
      {
        v536 = (char *)v363;
        v368 = objc_msgSend_objectAtIndexedSubscript_(v526, v364, v363, v365, v366, v367);
        int v532 = objc_msgSend_containsIndex_(v181, v369, v529, v370, v371, v372);
        hasStartingLineBreauint64_t k = objc_msgSend_hasStartingLineBreak(v368, v373, v374, v375, v376, v377);
        hasEndingLineBreauint64_t k = objc_msgSend_hasEndingLineBreak(v368, v379, v380, v381, v382, v383);
        v385 = [CHReflowableTextLine alloc];
        v396 = objc_msgSend_tokens(v368, v386, v387, v388, v389, v390);
        if (v368) {
          objc_msgSend_principalLines(v368, v391, v392, v393, v394, v395);
        }
        else {
          memset(v538, 0, sizeof(v538));
        }
        objc_msgSend_bounds(v368, v391, v392, v393, v394, v395);
        double v398 = v397;
        double v400 = v399;
        double v402 = v401;
        double v404 = v403;
        objc_msgSend_headIndent(v368, v405, v406, v407, v408, v409);
        double v411 = v410;
        objc_msgSend_leading(v368, v412, v413, v414, v415, v416);
        double v418 = v417;
        uint64_t v424 = objc_msgSend_alignmentType(v368, v419, v420, v421, v422, v423);
        uint64_t v430 = objc_msgSend_writingDirection(v368, v425, v426, v427, v428, v429);
        v436 = objc_msgSend_locale(v368, v431, v432, v433, v434, v435);
        char v437 = hasStartingLineBreak | v353 ^ 1;
        unsigned int v438 = hasEndingLineBreak | v532 ^ 1;
        hasEndingLineBreak_alignmentType_writingDirection_locale = objc_msgSend_initWithTokens_principalLines_bounds_headIndent_leading_hasStartingLineBreak_hasEndingLineBreak_alignmentType_writingDirection_locale_(v385, v439, (uint64_t)v396, (uint64_t)v538, v437 & 1, v438, v424, v430, v398, v400, v402, v404, v411, v418, v436);

        objc_msgSend_addObject_(v520, v441, (uint64_t)hasEndingLineBreak_alignmentType_writingDirection_locale, v442, v443, v444);
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v523 = (id)qword_1EA3C9FE8;
        if (os_log_type_enabled(v523, OS_LOG_TYPE_DEBUG))
        {
          int v450 = objc_msgSend_hasStartingLineBreak(v368, v445, v446, v447, v448, v449);
          int v456 = objc_msgSend_hasEndingLineBreak(v368, v451, v452, v453, v454, v455);
          v519 = objc_msgSend_boundingQuad(v368, v457, v458, v459, v460, v461);
          objc_msgSend_topLeft(v519, v462, v463, v464, v465, v466);
          uint64_t v468 = v467;
          v474 = objc_msgSend_boundingQuad(v368, v469, v470, v471, v472, v473);
          objc_msgSend_topLeft(v474, v475, v476, v477, v478, v479);
          uint64_t v481 = v480;
          v487 = objc_msgSend_boundingQuad(v368, v482, v483, v484, v485, v486);
          objc_msgSend_size(v487, v488, v489, v490, v491, v492);
          uint64_t v494 = v493;
          v500 = objc_msgSend_boundingQuad(v368, v495, v496, v497, v498, v499);
          objc_msgSend_size(v500, v501, v502, v503, v504, v505);
          *(_DWORD *)buf = 134220544;
          unint64_t v564 = v516;
          __int16 v565 = 2048;
          id v537 = v536 + 1;
          unint64_t v566 = (unint64_t)v537;
          __int16 v567 = 1024;
          *(_DWORD *)v568 = v532;
          *(_WORD *)&v568[4] = 1024;
          *(_DWORD *)&v568[6] = v450;
          LOWORD(v569) = 1024;
          *(_DWORD *)((char *)&v569 + 2) = v437 & 1;
          HIWORD(v569) = 1024;
          *(_DWORD *)v570 = v456;
          *(_WORD *)&v570[4] = 1024;
          *(_DWORD *)&v570[6] = v438;
          __int16 v571 = 2048;
          uint64_t v572 = v468;
          __int16 v573 = 2048;
          uint64_t v574 = v481;
          __int16 v575 = 2048;
          uint64_t v576 = v494;
          __int16 v577 = 2048;
          uint64_t v578 = v506;
          v507 = v523;
          _os_log_impl(&dword_1C492D000, v523, OS_LOG_TYPE_DEBUG, "Reflow Line:%lu-%lu canWrap:%d startingLineBreak:%d=>%d endingLineBreak:%d=>%d (x:%lf y:%lf w:%lf h:%lf)", buf, 0x5Cu);
        }
        else
        {
          id v537 = v536 + 1;
          v507 = v523;
        }

        ++v529;
        char v353 = v532;
        unint64_t v363 = (unint64_t)v537;
      }

      unint64_t v352 = v516;
    }

LABEL_92:
  }
  else
  {
    id v520 = v5;
  }

  return v520;
}

+ (id)alignShortReflowableLines:(id)a3
{
  id v3 = a3;
  if ((unint64_t)objc_msgSend_count(v3, v4, v5, v6, v7, v8) > 1)
  {
    id v14 = (id)objc_msgSend_mutableCopy(v3, v9, v10, v11, v12, v13);
    uint64_t v20 = 0;
    id v344 = v3;
    uint64_t v345 = v14;
    while (1)
    {
      uint64_t v25 = v20 + 1;
      if (v20 + 1 >= (unint64_t)objc_msgSend_count(v3, v15, v16, v17, v18, v19)) {
        break;
      }
      uint64_t v346 = v20;
      id v26 = objc_msgSend_objectAtIndexedSubscript_(v14, v21, v20, v22, v23, v24);
      uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v14, v27, v25, v28, v29, v30);
      objc_msgSend_bounds(v31, v32, v33, v34, v35, v36);
      double v350 = v37;
      objc_msgSend_bounds(v26, v38, v39, v40, v41, v42);
      double v347 = v43;
      objc_msgSend_bounds(v26, v44, v45, v46, v47, v48);
      double MaxX = CGRectGetMaxX(v387);
      objc_msgSend_bounds(v31, v50, v51, v52, v53, v54);
      double v55 = CGRectGetMaxX(v388);
      objc_msgSend_bounds(v26, v56, v57, v58, v59, v60);
      double v62 = v61;
      objc_msgSend_bounds(v31, v63, v64, v65, v66, v67);
      double v69 = v68;
      objc_msgSend_bounds(v31, v70, v71, v72, v73, v74);
      double v76 = v75;
      objc_msgSend_bounds(v26, v77, v78, v79, v80, v81);
      double MaxY = CGRectGetMaxY(v389);
      objc_msgSend_bounds(v31, v83, v84, v85, v86, v87);
      double MinY = CGRectGetMinY(v390);
      objc_msgSend_bounds(v26, v89, v90, v91, v92, v93);
      double Height = CGRectGetHeight(v391);
      if (objc_msgSend_hasEndingLineBreak(v26, v95, v96, v97, v98, v99)) {
        int v105 = 0;
      }
      else {
        int v105 = objc_msgSend_hasStartingLineBreak(v31, v100, v101, v102, v103, v104) ^ 1;
      }
      double v106 = fmin(MaxX, v55) - fmax(v62, v69);
      if (MaxY - MinY < Height * 0.5) {
        int v105 = 1;
      }
      if (v350 < v347 / 3.0 && v106 > v76 * 0.699999988 && v105 != 0)
      {
        if (v26)
        {
          objc_msgSend_principalLines(v26, v100, v101, v102, v103, v104);
          double v109 = *(double *)&v381;
          objc_msgSend_principalLines(v26, v110, v111, v112, v113, v114);
          double v115 = *(double *)&v372;
        }
        else
        {
          long long v384 = 0u;
          long long v385 = 0u;
          long long v382 = 0u;
          long long v383 = 0u;
          long long v380 = 0u;
          long long v381 = 0u;
          long long v378 = 0u;
          long long v379 = 0u;
          long long v376 = 0u;
          long long v377 = 0u;
          long long v374 = 0u;
          long long v375 = 0u;
          long long v372 = 0u;
          long long v373 = 0u;
          double v115 = 0.0;
          double v109 = 0.0;
          long long v370 = 0u;
          long long v371 = 0u;
        }
        objc_msgSend_bounds(v26, v100, v101, v102, v103, v104);
        double v122 = v121;
        if (v26)
        {
          objc_msgSend_principalLines(v26, v116, v117, v118, v119, v120);
          double v123 = *((double *)&v381 + 1);
          objc_msgSend_principalLines(v26, v124, v125, v126, v127, v128);
          double v129 = *((double *)&v372 + 1);
        }
        else
        {
          long long v384 = 0u;
          long long v385 = 0u;
          long long v382 = 0u;
          long long v383 = 0u;
          long long v380 = 0u;
          long long v381 = 0u;
          long long v378 = 0u;
          long long v379 = 0u;
          long long v376 = 0u;
          long long v377 = 0u;
          long long v374 = 0u;
          long long v375 = 0u;
          long long v372 = 0u;
          long long v373 = 0u;
          double v129 = 0.0;
          double v123 = 0.0;
          long long v370 = 0u;
          long long v371 = 0u;
        }
        objc_msgSend_bounds(v26, v116, v117, v118, v119, v120);
        double v131 = (v109 - v115) * v122;
        if (fabs(v131) < 1.17549435e-38) {
          double v131 = 1.17549435e-38;
        }
        double v137 = atan((v123 - v129) * v130 / v131);
        if (v31)
        {
          objc_msgSend_principalLines(v31, v132, v133, v134, v135, v136);
          double v138 = *(double *)&v381;
          objc_msgSend_principalLines(v31, v139, v140, v141, v142, v143);
          double v144 = *(double *)&v372;
        }
        else
        {
          long long v384 = 0u;
          long long v385 = 0u;
          long long v382 = 0u;
          long long v383 = 0u;
          long long v380 = 0u;
          long long v381 = 0u;
          long long v378 = 0u;
          long long v379 = 0u;
          long long v376 = 0u;
          long long v377 = 0u;
          long long v374 = 0u;
          long long v375 = 0u;
          long long v372 = 0u;
          long long v373 = 0u;
          double v144 = 0.0;
          double v138 = 0.0;
          long long v370 = 0u;
          long long v371 = 0u;
        }
        objc_msgSend_bounds(v31, v132, v133, v134, v135, v136);
        double v151 = v150;
        if (v31)
        {
          objc_msgSend_principalLines(v31, v145, v146, v147, v148, v149);
          double v152 = *((double *)&v381 + 1);
          objc_msgSend_principalLines(v31, v153, v154, v155, v156, v157);
          double v158 = *((double *)&v372 + 1);
        }
        else
        {
          long long v384 = 0u;
          long long v385 = 0u;
          long long v382 = 0u;
          long long v383 = 0u;
          long long v380 = 0u;
          long long v381 = 0u;
          long long v378 = 0u;
          long long v379 = 0u;
          long long v376 = 0u;
          long long v377 = 0u;
          long long v374 = 0u;
          long long v375 = 0u;
          long long v372 = 0u;
          long long v373 = 0u;
          double v158 = 0.0;
          double v152 = 0.0;
          long long v370 = 0u;
          long long v371 = 0u;
        }
        objc_msgSend_bounds(v31, v145, v146, v147, v148, v149);
        float v160 = v137;
        double v161 = (v138 - v144) * v151;
        if (fabs(v161) < 1.17549435e-38) {
          double v161 = 1.17549435e-38;
        }
        float v167 = atan((v152 - v158) * v159 / v161);
        if (vabds_f32(v160, v167) > 0.17453)
        {
          if (v26)
          {
            objc_msgSend_principalLines(v26, v162, v163, v164, v165, v166);
          }
          else
          {
            long long v368 = 0u;
            long long v369 = 0u;
            long long v366 = 0u;
            long long v367 = 0u;
            long long v364 = 0u;
            long long v365 = 0u;
            long long v362 = 0u;
            long long v363 = 0u;
          }
          objc_msgSend_bounds(v26, v162, v163, v164, v165, v166);
          double v177 = v176;
          double v322 = *((double *)&v362 + 1);
          double v324 = *(double *)&v362;
          long long v178 = v363;
          double v321 = *(double *)&v363;
          if (v174 == 0.0) {
            double v174 = 1.0;
          }
          double v348 = v174;
          if (v175 == 0.0) {
            double v179 = 1.0;
          }
          else {
            double v179 = v175;
          }
          double v319 = *((double *)&v364 + 1);
          double v320 = *(double *)&v364;
          double v326 = *((double *)&v365 + 1);
          double v328 = *(double *)&v365;
          double v333 = *((double *)&v366 + 1);
          double v335 = *(double *)&v366;
          long long v180 = v367;
          double v331 = *(double *)&v367;
          double v340 = *(double *)&v368;
          double v342 = v179;
          double v338 = *(double *)&v369;
          double v339 = *((double *)&v368 + 1);
          double v337 = *((double *)&v369 + 1);
          double v351 = v173;
          if (v31)
          {
            objc_msgSend_principalLines(v31, v168, v169, v170, v171, v172);
          }
          else
          {
            long long v360 = 0u;
            long long v361 = 0u;
            long long v358 = 0u;
            long long v359 = 0u;
            long long v356 = 0u;
            long long v357 = 0u;
            long long v354 = 0u;
            long long v355 = 0u;
          }
          objc_msgSend_bounds(v31, v168, v169, v170, v171, v172);
          double v189 = v188;
          double v191 = v190;
          if (v186 == 0.0) {
            double v192 = 1.0;
          }
          else {
            double v192 = v186;
          }
          if (v187 == 0.0) {
            double v193 = 1.0;
          }
          else {
            double v193 = v187;
          }
          long long v194 = v356;
          objc_msgSend_bounds(v31, v181, v182, v183, v184, v185);
          double MinX = CGRectGetMinX(v392);
          objc_msgSend_bounds(v31, v196, v197, v198, v199, v200);
          double v206 = CGRectGetMaxX(v393);
          double v207 = v351 + v320 * v348;
          double v208 = v177 + v319 * v342;
          double v209 = v189 + *(double *)&v194 * v192 - v207;
          double v210 = v191 + *((double *)&v194 + 1) * v193 - v208;
          double v211 = v351 + v324 * v348 + v209;
          double v212 = v177 + v322 * v342 + v210;
          double v213 = v351 + v321 * v348 + v209;
          double v214 = v177 + *((double *)&v178 + 1) * v342 + v210;
          if (vabdd_f64(v213, v211) >= 1.17549435e-38)
          {
            double v219 = (v214 - v214) / (v213 - v211);
            double v220 = v212 - v219 * v211;
            if (v211 < MinX)
            {
              double v211 = MinX;
              double v212 = v220 + v219 * MinX;
            }
            double v218 = v206;
            if (v213 > v206)
            {
              double v214 = v220 + v219 * v206;
              double v213 = v206;
            }
            double v216 = v348;
            double v215 = v351;
            double v217 = v342;
          }
          else
          {
            double v216 = v348;
            double v215 = v351;
            double v217 = v342;
            double v218 = v206;
          }
          double v221 = v340;
          double v222 = v215 + v328 * v216;
          double v223 = v207 + v209;
          double v224 = v208 + v210;
          double v225 = v222 + v209;
          double v226 = v177 + v326 * v217 + v210;
          double v349 = v212;
          double v352 = v214;
          double v341 = v213;
          double v343 = v211;
          if (vabdd_f64(v222 + v209, v207 + v209) >= 1.17549435e-38)
          {
            double v227 = (v226 - v226) / (v225 - v223);
            double v228 = v224 - v227 * v223;
            if (v223 < MinX)
            {
              double v223 = MinX;
              double v224 = v228 + v227 * MinX;
            }
            double v325 = v223;
            double v327 = v224;
            if (v225 <= v218)
            {
              double v323 = v222 + v209;
              double v329 = v226;
            }
            else
            {
              double v329 = v228 + v227 * v218;
              double v323 = v218;
            }
          }
          else
          {
            double v323 = v222 + v209;
            double v325 = v207 + v209;
            double v327 = v208 + v210;
            double v329 = v226;
          }
          double v229 = v215 + v335 * v216 + v209;
          double v230 = v177 + v333 * v217 + v210;
          double v231 = v215 + v331 * v216 + v209;
          if (vabdd_f64(v231, v229) >= 1.17549435e-38)
          {
            double v232 = (v177 + *((double *)&v180 + 1) * v217 + v210 - (v177 + *((double *)&v180 + 1) * v217 + v210))
                 / (v231 - v229);
            double v233 = v230 - v232 * v229;
            if (v229 < MinX)
            {
              double v229 = MinX;
              double v230 = v233 + v232 * MinX;
            }
            double v334 = v230;
            double v330 = v229;
            if (v231 <= v218)
            {
              double v332 = v215 + v331 * v216 + v209;
              double v336 = v177 + *((double *)&v180 + 1) * v217 + v210;
            }
            else
            {
              double v336 = v233 + v232 * v218;
              double v332 = v218;
            }
          }
          else
          {
            double v330 = v215 + v335 * v216 + v209;
            double v332 = v215 + v331 * v216 + v209;
            double v334 = v177 + v333 * v217 + v210;
            double v336 = v177 + *((double *)&v180 + 1) * v217 + v210;
          }
          double v234 = v215 + v338 * v216;
          double v235 = v215 + v221 * v216 + v209;
          double v236 = v177 + v339 * v217 + v210;
          double v237 = v234 + v209;
          double v238 = v177 + v337 * v217 + v210;
          if (vabdd_f64(v234 + v209, v235) < 1.17549435e-38) {
            goto LABEL_78;
          }
          double v239 = (v238 - v238) / (v237 - v235);
          double v240 = v236 - v239 * v235;
          if (v235 < MinX)
          {
            double v235 = MinX;
            double v236 = v240 + v239 * MinX;
          }
          if (v237 <= v218) {
LABEL_78:
          }
            double v218 = v234 + v209;
          else {
            double v238 = v240 + v239 * v218;
          }
          objc_msgSend_bounds(v31, v201, v202, v203, v204, v205);
          double v244 = v243;
          double v246 = v245;
          if (v241 == 0.0) {
            double v247 = 1.0;
          }
          else {
            double v247 = v241;
          }
          if (v242 == 0.0) {
            double v248 = 1.0;
          }
          else {
            double v248 = v242;
          }
          v249 = [CHReflowableTextLine alloc];
          BOOL v255 = objc_msgSend_tokens(v31, v250, v251, v252, v253, v254);
          v353[0] = (v343 - v244) / v247;
          v353[1] = (v349 - v246) / v248;
          v353[2] = (v341 - v244) / v247;
          v353[3] = (v352 - v246) / v248;
          v353[4] = (v325 - v244) / v247;
          v353[5] = (v327 - v246) / v248;
          v353[6] = (v323 - v244) / v247;
          v353[7] = (v329 - v246) / v248;
          v353[8] = (v330 - v244) / v247;
          v353[9] = (v334 - v246) / v248;
          v353[10] = (v332 - v244) / v247;
          v353[11] = (v336 - v246) / v248;
          v353[12] = (v235 - v244) / v247;
          v353[13] = (v236 - v246) / v248;
          v353[14] = (v218 - v244) / v247;
          v353[15] = (v238 - v246) / v248;
          objc_msgSend_bounds(v31, v256, v257, v258, v259, v260);
          double v262 = v261;
          double v264 = v263;
          double v266 = v265;
          double v268 = v267;
          objc_msgSend_headIndent(v31, v269, v270, v271, v272, v273);
          double v275 = v274;
          objc_msgSend_leading(v31, v276, v277, v278, v279, v280);
          double v282 = v281;
          hasStartingLineBreauint64_t k = objc_msgSend_hasStartingLineBreak(v31, v283, v284, v285, v286, v287);
          hasEndingLineBreauint64_t k = objc_msgSend_hasEndingLineBreak(v31, v289, v290, v291, v292, v293);
          uint64_t v300 = objc_msgSend_alignmentType(v31, v295, v296, v297, v298, v299);
          uint64_t v306 = objc_msgSend_writingDirection(v31, v301, v302, v303, v304, v305);
          uint64_t v312 = objc_msgSend_locale(v31, v307, v308, v309, v310, v311);
          hasEndingLineBreak_alignmentType_writingDirection_locale = objc_msgSend_initWithTokens_principalLines_bounds_headIndent_leading_hasStartingLineBreak_hasEndingLineBreak_alignmentType_writingDirection_locale_(v249, v313, (uint64_t)v255, (uint64_t)v353, hasStartingLineBreak, hasEndingLineBreak, v300, v306, v262, v264, v266, v268, v275, v282, v312);

          objc_msgSend_setObject_atIndexedSubscript_(v345, v315, (uint64_t)hasEndingLineBreak_alignmentType_writingDirection_locale, v25, v316, v317);
        }
      }

      id v14 = v345;
      uint64_t v20 = v346 + 1;
      id v3 = v344;
    }
    id v3 = v344;
  }
  else
  {
    id v14 = v3;
  }

  return v14;
}

+ (id)_normalizedLocaleForCRLineWrapper:(id)a3
{
  id v8 = a3;
  if (qword_1EA3C9D18 != -1) {
    dispatch_once(&qword_1EA3C9D18, &unk_1F20129D0);
  }
  uint64_t v9 = objc_msgSend_languageCode(v8, v3, v4, v5, v6, v7);
  double v15 = objc_msgSend_lowercaseString(v9, v10, v11, v12, v13, v14);

  uint64_t v20 = objc_msgSend_objectForKey_((void *)qword_1EA3C9D10, v16, (uint64_t)v15, v17, v18, v19);

  if (v20)
  {
    uint64_t v25 = NSString;
    id v26 = objc_msgSend_objectForKey_((void *)qword_1EA3C9D10, v21, (uint64_t)v15, v22, v23, v24);
    uint64_t v31 = objc_msgSend_stringWithFormat_(v25, v27, @"%@-%@", v28, v29, v30, v15, v26);

    uint64_t v36 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v32, (uint64_t)v31, v33, v34, v35);
  }
  else
  {
    uint64_t v36 = 0;
  }

  return v36;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- ($9936F71585EAE7D8081FB1B234834B3F)principalLines
{
  CGPoint var1 = self[1].var1.var1;
  retstr->var2.CGPoint var0 = self[1].var1.var0;
  retstr->var2.CGPoint var1 = var1;
  CGPoint v4 = self[1].var2.var1;
  retstr->var3.CGPoint var0 = self[1].var2.var0;
  retstr->var3.CGPoint var1 = v4;
  CGPoint v5 = self->var3.var1;
  retstr->var0.CGPoint var0 = self->var3.var0;
  retstr->var0.CGPoint var1 = v5;
  CGPoint v6 = self[1].var0.var1;
  retstr->var1.CGPoint var0 = self[1].var0.var0;
  retstr->var1.CGPoint var1 = v6;
  return self;
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

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)headIndent
{
  return self->_headIndent;
}

- (double)leading
{
  return self->_leading;
}

- (BOOL)hasStartingLineBreak
{
  return self->_hasStartingLineBreak;
}

- (void)setHasStartingLineBreak:(BOOL)a3
{
  self->_hasStartingLineBreauint64_t k = a3;
}

- (BOOL)hasEndingLineBreak
{
  return self->_hasEndingLineBreak;
}

- (void)setHasEndingLineBreak:(BOOL)a3
{
  self->_hasEndingLineBreauint64_t k = a3;
}

- (unint64_t)alignmentType
{
  return self->_alignmentType;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end