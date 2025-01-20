@interface CHTransliterateHalfWidthPunctuationStep
- (CHTransliterateHalfWidthPunctuationStep)initWithShouldAddAlternatives:(BOOL)a3;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHTransliterateHalfWidthPunctuationStep

- (CHTransliterateHalfWidthPunctuationStep)initWithShouldAddAlternatives:(BOOL)a3
{
  v47.receiver = self;
  v47.super_class = (Class)CHTransliterateHalfWidthPunctuationStep;
  v4 = [(CHTransliterateHalfWidthPunctuationStep *)&v47 init];
  v9 = v4;
  if (v4)
  {
    v4->_shouldAddAlternatives = a3;
    uint64_t v10 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v5, @"@#＠＃", v6, v7, v8);
    contextInvariantCharacterSet = v9->_contextInvariantCharacterSet;
    v9->_contextInvariantCharacterSet = (NSCharacterSet *)v10;

    uint64_t v16 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v12, @"|｜~～+=$＋＝＄([{<（［｛＜‘“＂＇\"'「｢『〈〔〘《【〖"), v13, v14, v15;
    forwardLookingCharacterSet = v9->_forwardLookingCharacterSet;
    v9->_forwardLookingCharacterSet = (NSCharacterSet *)v16;

    v23 = objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28E58], v18, v19, v20, v21, v22);
    objc_msgSend_removeCharactersInString_(v23, v24, @"@#＠＃", v25, v26, v27);
    objc_msgSend_addCharactersInString_(v23, v28, @"|｜~～>＞", v29, v30, v31);
    uint64_t v37 = objc_msgSend_copy(v23, v32, v33, v34, v35, v36);
    backwardLookingCharacterSet = v9->_backwardLookingCharacterSet;
    v9->_backwardLookingCharacterSet = (NSCharacterSet *)v37;

    uint64_t v44 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28B88], v39, v40, v41, v42, v43);
    widthAlternativeCharacterSet = v9->_widthAlternativeCharacterSet;
    v9->_widthAlternativeCharacterSet = (NSCharacterSet *)v44;
  }
  return v9;
}

- (id)process:(id)a3 options:(id)a4
{
  v5 = (id *)a3;
  id v6 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v7 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEBUG, "CHTransliterateHalfWidthPunctuationStep is running", buf, 2u);
  }

  unint64_t v8 = 0x1E4F1C000uLL;
  v211 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12, v13);
  v210 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17, v18);
  v209 = v6;
  v24 = objc_msgSend_leftContext(v5, v19, v20, v21, v22, v23);
  uint64_t v30 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v25, v26, v27, v28, v29);
  v212 = objc_msgSend_stringByTrimmingCharactersInSet_(v24, v31, (uint64_t)v30, v32, v33, v34);

  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v41 = objc_msgSend_result(v5, v35, v36, v37, v38, v39);
    objc_super v47 = objc_msgSend_transcriptionPaths(v41, v42, v43, v44, v45, v46);
    unint64_t v53 = objc_msgSend_count(v47, v48, v49, v50, v51, v52);

    if (i >= v53) {
      break;
    }
    *(void *)buf = 0;
    v225 = buf;
    uint64_t v226 = 0x3032000000;
    v227 = sub_1C4C089AC;
    v228 = sub_1C4C089BC;
    v229 = &stru_1F20141C8;
    if (objc_msgSend_length(v212, v54, v55, v56, v57, v58))
    {
      uint64_t v64 = objc_msgSend_lastComposedCharacter(v212, v59, v60, v61, v62, v63);
      v65 = (void *)*((void *)v225 + 5);
      *((void *)v225 + 5) = v64;
    }
    v66 = (void *)*((void *)v225 + 5);
    v67 = objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v59, v60, v61, v62, v63);
    uint64_t v72 = objc_msgSend_rangeOfCharacterFromSet_(v66, v68, (uint64_t)v67, v69, v70, v71);

    if (v72 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v78 = (void *)*((void *)v225 + 5);
      *((void *)v225 + 5) = &stru_1F20141C8;
    }
    v79 = objc_msgSend_result(v5, v73, v74, v75, v76, v77);
    v85 = objc_msgSend_transcriptionPaths(v79, v80, v81, v82, v83, v84);
    v90 = objc_msgSend_objectAtIndexedSubscript_(v85, v86, i, v87, v88, v89);

    v215 = objc_msgSend_array(*(void **)(v8 + 2632), v91, v92, v93, v94, v95);
    v214 = objc_msgSend_array(*(void **)(v8 + 2632), v96, v97, v98, v99, v100);
    v213 = objc_msgSend_array(*(void **)(v8 + 2632), v101, v102, v103, v104, v105);
    v111 = objc_msgSend_result(v5, v106, v107, v108, v109, v110);
    unint64_t v112 = v8;
    uint64_t v118 = objc_msgSend_length(v90, v113, v114, v115, v116, v117);
    v217[0] = MEMORY[0x1E4F143A8];
    v217[1] = 3221225472;
    v217[2] = sub_1C4C0D3A8;
    v217[3] = &unk_1E64E5070;
    v217[4] = self;
    v218 = @"#";
    v223 = buf;
    v219 = @"＃";
    id v119 = v215;
    id v220 = v119;
    id v120 = v214;
    id v221 = v120;
    id v121 = v213;
    id v222 = v121;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v111, v122, (uint64_t)v90, 0, v118, (uint64_t)v217);

    objc_msgSend_addObject_(v211, v123, (uint64_t)v120, v124, v125, v126);
    v132 = objc_msgSend_result(v5, v127, v128, v129, v130, v131);
    v138 = objc_msgSend_transcriptionPathScores(v132, v133, v134, v135, v136, v137);
    v143 = objc_msgSend_objectAtIndexedSubscript_(v138, v139, i, v140, v141, v142);
    objc_msgSend_addObject_(v210, v144, (uint64_t)v143, v145, v146, v147);

    if ((objc_msgSend_modifiesOriginalTokens(self, v148, v149, v150, v151, v152) & 1) == 0
      && (objc_msgSend_isEqualToArray_(v119, v153, (uint64_t)v120, v154, v155, v156) & 1) == 0)
    {
      objc_msgSend_addObject_(v211, v153, (uint64_t)v119, v154, v155, v156);
      v162 = objc_msgSend_result(v5, v157, v158, v159, v160, v161);
      v168 = objc_msgSend_transcriptionPathScores(v162, v163, v164, v165, v166, v167);
      v173 = objc_msgSend_objectAtIndexedSubscript_(v168, v169, i, v170, v171, v172);
      objc_msgSend_addObject_(v210, v174, (uint64_t)v173, v175, v176, v177);
    }
    if (self
      && self->_shouldAddAlternatives
      && (objc_msgSend_isEqualToArray_(v121, v153, (uint64_t)v120, v154, v155, v156) & 1) == 0)
    {
      objc_msgSend_addObject_(v211, v178, (uint64_t)v121, v179, v180, v181);
      v187 = objc_msgSend_result(v5, v182, v183, v184, v185, v186);
      v193 = objc_msgSend_transcriptionPathScores(v187, v188, v189, v190, v191, v192);
      v198 = objc_msgSend_objectAtIndexedSubscript_(v193, v194, i, v195, v196, v197);
      objc_msgSend_addObject_(v210, v199, (uint64_t)v198, v200, v201, v202);
    }
    _Block_object_dispose(buf, 8);

    unint64_t v8 = v112;
  }
  v203 = objc_msgSend_result(v5, v54, v55, v56, v57, v58);
  v207 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v203, v204, (uint64_t)v211, (uint64_t)v210, v205, v206);
  if (v5) {
    objc_storeStrong(v5 + 3, v207);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthAlternativeCharacterSet, 0);
  objc_storeStrong((id *)&self->_backwardLookingCharacterSet, 0);
  objc_storeStrong((id *)&self->_forwardLookingCharacterSet, 0);
  objc_storeStrong((id *)&self->_contextInvariantCharacterSet, 0);
}

@end