@interface CHNumberFieldResultReorderingStep
- (id)initForDigitFields;
- (id)initForPhoneNumberFields;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHNumberFieldResultReorderingStep

- (id)initForPhoneNumberFields
{
  v32.receiver = self;
  v32.super_class = (Class)CHNumberFieldResultReorderingStep;
  v7 = [(CHNumberFieldResultReorderingStep *)&v32 init];
  if (v7)
  {
    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28E58], v2, v3, v4, v5, v6);
    v8 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_letterCharacterSet(MEMORY[0x1E4F28B88], v9, v10, v11, v12, v13);
    objc_msgSend_formUnionWithCharacterSet_(v8, v15, (uint64_t)v14, v16, v17, v18);

    v23 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v19, @"+-#*'\",. ", v20, v21, v22);
    objc_msgSend_formUnionWithCharacterSet_(v8, v24, (uint64_t)v23, v25, v26, v27);

    allowedCharacters = v7->_allowedCharacters;
    v7->_allowedCharacters = v8;
    v29 = v8;

    characterReplacements = v7->_characterReplacements;
    v7->_characterReplacements = (NSDictionary *)&unk_1F203D1E8;
  }
  return v7;
}

- (id)initForDigitFields
{
  v22.receiver = self;
  v22.super_class = (Class)CHNumberFieldResultReorderingStep;
  v7 = [(CHNumberFieldResultReorderingStep *)&v22 init];
  if (v7)
  {
    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28E58], v2, v3, v4, v5, v6);
    v8 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v9, @",.-", v10, v11, v12);
    objc_msgSend_formUnionWithCharacterSet_(v8, v14, (uint64_t)v13, v15, v16, v17);

    allowedCharacters = v7->_allowedCharacters;
    v7->_allowedCharacters = v8;
    v19 = v8;

    characterReplacements = v7->_characterReplacements;
    v7->_characterReplacements = (NSDictionary *)&unk_1F203D210;
  }
  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v5 = (id *)a3;
  id v245 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHNumberFieldResultReorderingStep is running", buf, 2u);
  }

  v253[0] = MEMORY[0x1E4F143A8];
  v253[1] = 3221225472;
  v253[2] = sub_1C4C20288;
  v253[3] = &unk_1E64E5318;
  v253[4] = self;
  v7 = (void *)MEMORY[0x1C8786E90](v253);
  v249 = v5;
  uint64_t v13 = objc_msgSend_result(v5, v8, v9, v10, v11, v12);
  v14 = v7;
  obunint64_t j = v13;
  id v248 = v13;
  self;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v21 = objc_msgSend_tokenColumns(v248, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  v246 = objc_msgSend_arrayWithCapacity_(v15, v28, v27, v29, v30, v31);

  for (unint64_t i = 0; ; ++i)
  {
    v38 = objc_msgSend_tokenColumns(v248, v32, v33, v34, v35, v36);
    unint64_t v44 = objc_msgSend_count(v38, v39, v40, v41, v42, v43);

    if (i >= v44) {
      break;
    }
    v50 = objc_msgSend_tokenColumns(v248, v45, v46, v47, v48, v49);
    v55 = objc_msgSend_objectAtIndexedSubscript_(v50, v51, i, v52, v53, v54);

    v56 = (void *)MEMORY[0x1E4F1CA48];
    v251 = v55;
    v62 = objc_msgSend_textTokenRows(v55, v57, v58, v59, v60, v61);
    uint64_t v68 = objc_msgSend_count(v62, v63, v64, v65, v66, v67);
    v250 = objc_msgSend_arrayWithCapacity_(v56, v69, v68, v70, v71, v72);

    for (unint64_t j = 0; ; ++j)
    {
      v79 = objc_msgSend_textTokenRows(v251, v73, v74, v75, v76, v77);
      unint64_t v85 = objc_msgSend_count(v79, v80, v81, v82, v83, v84);

      if (j >= v85) {
        break;
      }
      v91 = objc_msgSend_textTokenRows(v251, v86, v87, v88, v89, v90);
      v96 = objc_msgSend_objectAtIndexedSubscript_(v91, v92, j, v93, v94, v95);

      v97 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v103 = objc_msgSend_count(v96, v98, v99, v100, v101, v102);
      v113 = objc_msgSend_arrayWithCapacity_(v97, v104, v103, v105, v106, v107);
      for (unint64_t k = 0; k < objc_msgSend_count(v96, v108, v109, v110, v111, v112); ++k)
      {
        v119 = objc_msgSend_objectAtIndexedSubscript_(v96, v115, k, v116, v117, v118);
        v125 = objc_msgSend_string(v119, v120, v121, v122, v123, v124);
        uint64_t v131 = objc_msgSend_length(v125, v126, v127, v128, v129, v130);

        v140 = objc_msgSend_objectAtIndexedSubscript_(v96, v132, k, v133, v134, v135);
        if (v131)
        {
          *(void *)buf = i;
          unint64_t v255 = j;
          unint64_t v256 = k;
          v141 = v14[2](v14, v140, buf);
          objc_msgSend_addObject_(v113, v142, (uint64_t)v141, v143, v144, v145);
        }
        else
        {
          objc_msgSend_addObject_(v113, v136, (uint64_t)v140, v137, v138, v139);
        }
      }
      objc_msgSend_addObject_(v250, v115, (uint64_t)v113, v116, v117, v118);
    }
    v146 = [CHTokenizedResultColumn alloc];
    v151 = objc_msgSend_initWithTokenRows_(v146, v147, (uint64_t)v250, v148, v149, v150);
    objc_msgSend_addObject_(v246, v152, (uint64_t)v151, v153, v154, v155);
  }
  objc_msgSend_setTokenColumns_(v248, v45, (uint64_t)v246, v47, v48, v49);

  if (v249) {
    objc_storeStrong(v249 + 3, obj);
  }

  v156 = (void *)MEMORY[0x1E4F1CA48];
  v162 = objc_msgSend_result(v249, v157, v158, v159, v160, v161);
  v168 = objc_msgSend_tokenColumns(v162, v163, v164, v165, v166, v167);
  uint64_t v174 = objc_msgSend_count(v168, v169, v170, v171, v172, v173);
  v179 = objc_msgSend_arrayWithCapacity_(v156, v175, v174, v176, v177, v178);

  for (unint64_t m = 0; ; ++m)
  {
    v186 = objc_msgSend_result(v249, v180, v181, v182, v183, v184);
    v192 = objc_msgSend_tokenColumns(v186, v187, v188, v189, v190, v191);
    unint64_t v198 = objc_msgSend_count(v192, v193, v194, v195, v196, v197);

    if (m >= v198) {
      break;
    }
    v204 = objc_msgSend_result(v249, v199, v200, v201, v202, v203);
    v210 = objc_msgSend_tokenColumns(v204, v205, v206, v207, v208, v209);
    v215 = objc_msgSend_objectAtIndexedSubscript_(v210, v211, m, v212, v213, v214);

    v221 = objc_msgSend_textTokenRows(v215, v216, v217, v218, v219, v220);
    v252[0] = MEMORY[0x1E4F143A8];
    v252[1] = 3221225472;
    v252[2] = sub_1C4C20600;
    v252[3] = &unk_1E64E5340;
    v252[4] = self;
    v226 = objc_msgSend_sortedArrayUsingComparator_(v221, v222, (uint64_t)v252, v223, v224, v225);

    v227 = [CHTokenizedResultColumn alloc];
    v232 = objc_msgSend_initWithTokenRows_(v227, v228, (uint64_t)v226, v229, v230, v231);
    objc_msgSend_addObject_(v179, v233, (uint64_t)v232, v234, v235, v236);
  }
  v237 = objc_msgSend_result(v249, v199, v200, v201, v202, v203);
  objc_msgSend_setTokenColumns_(v237, v238, (uint64_t)v179, v239, v240, v241);

  v242 = v249;
  return v242;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterReplacements, 0);
  objc_storeStrong((id *)&self->_allowedCharacters, 0);
}

@end