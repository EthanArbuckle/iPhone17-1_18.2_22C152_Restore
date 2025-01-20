@interface CHOpeningClosingCharacterMatchingStep
- (CHOpeningClosingCharacterMatchingStep)init;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHOpeningClosingCharacterMatchingStep

- (CHOpeningClosingCharacterMatchingStep)init
{
  v34.receiver = self;
  v34.super_class = (Class)CHOpeningClosingCharacterMatchingStep;
  v6 = [(CHOpeningClosingCharacterMatchingStep *)&v34 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v2, @"<([{＜（［｛"), v3, v4, v5;
    openingBracketCharacters = v6->_openingBracketCharacters;
    v6->_openingBracketCharacters = (NSCharacterSet *)v7;

    uint64_t v13 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v9, @">]}＞）］｝"), v10, v11, v12);
    closingBracketCharacters = v6->_closingBracketCharacters;
    v6->_closingBracketCharacters = (NSCharacterSet *)v13;

    uint64_t v19 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v15, @"‘“「｢", v16, v17, v18);
    openingQuoteCharacters = v6->_openingQuoteCharacters;
    v6->_openingQuoteCharacters = (NSCharacterSet *)v19;

    uint64_t v25 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v21, @"’”」｣", v22, v23, v24);
    closingQuoteCharacters = v6->_closingQuoteCharacters;
    v6->_closingQuoteCharacters = (NSCharacterSet *)v25;

    uint64_t v31 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v27, @"＂＇\"'", v28, v29, v30);
    symmetricQuoteCharacters = v6->_symmetricQuoteCharacters;
    v6->_symmetricQuoteCharacters = (NSCharacterSet *)v31;
  }
  return v6;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v5 = (id *)a3;
  id v180 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHOpeningClosingCharacterMatchingStep is running", buf, 2u);
  }

  v182 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  v181 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
  unint64_t v22 = 0;
  while (1)
  {
    uint64_t v23 = objc_msgSend_result(v5, v17, v18, v19, v20, v21);
    uint64_t v29 = objc_msgSend_transcriptionPaths(v23, v24, v25, v26, v27, v28);
    unint64_t v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34);

    if (v22 >= v35) {
      break;
    }
    v41 = objc_msgSend_result(v5, v36, v37, v38, v39, v40);
    v47 = objc_msgSend_transcriptionPaths(v41, v42, v43, v44, v45, v46);
    uint64_t v48 = v22;
    uint64_t v53 = objc_msgSend_objectAtIndexedSubscript_(v47, v49, v22, v50, v51, v52);

    v59 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v54, v55, v56, v57, v58);
    v184 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v60, v61, v62, v63, v64);
    v70 = objc_msgSend_leftContext(v5, v65, v66, v67, v68, v69);
    v185 = (void *)v53;
    v76 = objc_msgSend_leftContext(v5, v71, v72, v73, v74, v75);
    uint64_t v82 = objc_msgSend_length(v76, v77, v78, v79, v80, v81);
    v192[0] = MEMORY[0x1E4F143A8];
    v192[1] = 3221225472;
    v192[2] = sub_1C4C0E290;
    v192[3] = &unk_1E64E5098;
    v192[4] = self;
    id v83 = v59;
    id v193 = v83;
    id v84 = v184;
    id v194 = v84;
    objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v70, v85, 0, v82, 2, (uint64_t)v192);

    v183 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v86, v87, v88, v89, v90);
    v96 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v91, v92, v93, v94, v95);
    v97 = v5;
    v103 = objc_msgSend_result(v5, v98, v99, v100, v101, v102);
    uint64_t v109 = objc_msgSend_length(v185, v104, v105, v106, v107, v108);
    v187[0] = MEMORY[0x1E4F143A8];
    v187[1] = 3221225472;
    v187[2] = sub_1C4C0E490;
    v187[3] = &unk_1E64E3998;
    v187[4] = self;
    id v110 = v83;
    id v188 = v110;
    id v111 = v84;
    id v189 = v111;
    id v112 = v183;
    id v190 = v112;
    id v113 = v96;
    id v191 = v113;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v103, v114, (uint64_t)v185, 0, v109, (uint64_t)v187);

    objc_msgSend_addObject_(v182, v115, (uint64_t)v113, v116, v117, v118);
    v124 = objc_msgSend_result(v5, v119, v120, v121, v122, v123);
    v130 = objc_msgSend_transcriptionPathScores(v124, v125, v126, v127, v128, v129);
    v135 = objc_msgSend_objectAtIndexedSubscript_(v130, v131, v48, v132, v133, v134);
    objc_msgSend_addObject_(v181, v136, (uint64_t)v135, v137, v138, v139);

    if ((objc_msgSend_modifiesOriginalTokens(self, v140, v141, v142, v143, v144) & 1) == 0
      && (objc_msgSend_isEqualToArray_(v112, v145, (uint64_t)v113, v146, v147, v148) & 1) == 0)
    {
      objc_msgSend_addObject_(v182, v149, (uint64_t)v112, v150, v151, v152);
      v158 = objc_msgSend_result(v97, v153, v154, v155, v156, v157);
      v164 = objc_msgSend_transcriptionPathScores(v158, v159, v160, v161, v162, v163);
      v169 = objc_msgSend_objectAtIndexedSubscript_(v164, v165, v48, v166, v167, v168);
      objc_msgSend_addObject_(v181, v170, (uint64_t)v169, v171, v172, v173);
    }
    unint64_t v22 = v48 + 1;
    uint64_t v5 = v97;
  }
  v174 = objc_msgSend_result(v5, v36, v37, v38, v39, v40);
  v178 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v174, v175, (uint64_t)v182, (uint64_t)v181, v176, v177);
  if (v5) {
    objc_storeStrong(v5 + 3, v178);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symmetricQuoteCharacters, 0);
  objc_storeStrong((id *)&self->_closingQuoteCharacters, 0);
  objc_storeStrong((id *)&self->_openingQuoteCharacters, 0);
  objc_storeStrong((id *)&self->_closingBracketCharacters, 0);
  objc_storeStrong((id *)&self->_openingBracketCharacters, 0);
}

@end