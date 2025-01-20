@interface CHLexiconCorrectionStep
+ (id)validatedTokenForCorrectedToken:(id)a3 rawToken:(id)a4 autoCapitalizationMode:(int)a5;
- (CHLexiconCorrectionStep)initWithAutoCapitalizationMode:(int)a3 shouldAutoCorrect:(BOOL)a4 shouldAutoCapitalize:(BOOL)a5 shouldCreatePseudoTokens:(BOOL)a6 locale:(id)a7 staticLexicon:(_LXLexicon *)a8 customLexicon:(_LXLexicon *)cf phraseLexicon:(_LXLexicon *)a10 customPhraseLexicon:(_LXLexicon *)a11 spellChecker:(id)a12 lmVocabulary:(void *)a13 ovsStringChecker:(id)a14 textReplacements:(id)a15;
- (_LXLexicon)staticLexicon;
- (id)process:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)setStaticLexicon:(_LXLexicon *)a3;
@end

@implementation CHLexiconCorrectionStep

+ (id)validatedTokenForCorrectedToken:(id)a3 rawToken:(id)a4 autoCapitalizationMode:(int)a5
{
  id v7 = a3;
  id v219 = a4;
  if (qword_1EA3C8F70 != -1) {
    dispatch_once(&qword_1EA3C8F70, &unk_1F2013090);
  }
  v13 = objc_msgSend_string(v7, v8, v9, v10, v11, v12);
  v19 = objc_msgSend_string(v219, v14, v15, v16, v17, v18);
  char isEqualToString = objc_msgSend_isEqualToString_(v13, v20, (uint64_t)v19, v21, v22, v23);

  id v25 = v7;
  v31 = v25;
  id v32 = v25;
  if (isEqualToString) {
    goto LABEL_42;
  }
  int v218 = a5;
  v33 = objc_msgSend_string(v25, v26, v27, v28, v29, v30);
  v39 = objc_msgSend_string(v219, v34, v35, v36, v37, v38);
  uint64_t v44 = objc_msgSend_caseInsensitiveCompare_(v33, v40, (uint64_t)v39, v41, v42, v43);

  id v50 = v31;
  if (v44) {
    goto LABEL_27;
  }
  v217 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v45, v46, v47, v48, v49);
  v56 = objc_msgSend_string(v31, v51, v52, v53, v54, v55);
  v62 = objc_msgSend_string(v31, v57, v58, v59, v60, v61);
  uint64_t v68 = objc_msgSend_length(v62, v63, v64, v65, v66, v67);
  v222[0] = MEMORY[0x1E4F143A8];
  v222[1] = 3221225472;
  v222[2] = sub_1C4C06908;
  v222[3] = &unk_1E64E0E38;
  id v69 = v217;
  id v223 = v69;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v56, v70, 0, v68, 2, (uint64_t)v222);

  v76 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v71, v72, v73, v74, v75);
  v82 = objc_msgSend_string(v219, v77, v78, v79, v80, v81);
  v88 = objc_msgSend_string(v219, v83, v84, v85, v86, v87);
  uint64_t v94 = objc_msgSend_length(v88, v89, v90, v91, v92, v93);
  v220[0] = MEMORY[0x1E4F143A8];
  v220[1] = 3221225472;
  v220[2] = sub_1C4C06914;
  v220[3] = &unk_1E64E0E38;
  id v95 = v76;
  id v221 = v95;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v82, v96, 0, v94, 2, (uint64_t)v220);

  uint64_t v102 = objc_msgSend_count(v69, v97, v98, v99, v100, v101);
  id v50 = v31;
  if (v102 != objc_msgSend_count(v95, v103, v104, v105, v106, v107)) {
    goto LABEL_26;
  }
  int v113 = 0;
  char v114 = 0;
  v115 = 0;
  for (unint64_t i = 0; i < objc_msgSend_count(v69, v108, v109, v110, v111, v112); ++i)
  {
    v122 = objc_msgSend_objectAtIndexedSubscript_(v69, v118, i, v119, v120, v121);
    objc_msgSend_objectAtIndexedSubscript_(v95, v123, i, v124, v125, v126);
    v127 = (NSString *)objc_claimAutoreleasedReturnValue();
    int v132 = objc_msgSend_isEqualToString_(v122, v128, (uint64_t)v127, v129, v130, v131);
    if (!v132)
    {
      if (v114)
      {
        v117 = v127;
        v127 = (NSString *)v122;
        v122 = v115;
      }
      else
      {
        if (v115) {
          v113 |= !isStringEntirelyFromSet(v115, (NSCharacterSet *)qword_1EA3C8F68);
        }
        else {
          int v113 = 1;
        }

        v117 = v127;
        v127 = (NSString *)v122;
        v122 = 0;
      }
      goto LABEL_8;
    }
    if ((v113 & 1) == 0)
    {
      int v113 = 0;
      v117 = v115;
LABEL_8:

      goto LABEL_9;
    }
    BOOL v133 = isStringEntirelyFromSet((NSString *)v122, (NSCharacterSet *)qword_1EA3C8F68);

    if (!v133)
    {
      v115 = (NSString *)v122;
      goto LABEL_24;
    }
    int v113 = 0;
LABEL_9:
    char v114 = v132 ^ 1;
    v115 = (NSString *)v122;
  }
  if ((v113 & 1) == 0)
  {
    id v50 = v219;

    goto LABEL_25;
  }
LABEL_24:
  id v50 = v31;
LABEL_25:

LABEL_26:
LABEL_27:
  v134 = objc_msgSend_string(v219, v45, v46, v47, v48, v49);
  v138 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v134, v135, @".", (uint64_t)&stru_1F20141C8, v136, v137);
  v144 = objc_msgSend_string(v31, v139, v140, v141, v142, v143);
  v148 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v144, v145, @".", (uint64_t)&stru_1F20141C8, v146, v147);
  uint64_t v153 = objc_msgSend_caseInsensitiveCompare_(v138, v149, (uint64_t)v148, v150, v151, v152);

  if (!v153)
  {
    v159 = objc_msgSend_string(v219, v154, v155, v156, v157, v158);
    char isAbbreviation = objc_msgSend_isAbbreviation(v159, v160, v161, v162, v163, v164);

    v166 = v219;
    if (isAbbreviation) {
      goto LABEL_41;
    }
  }
  if (v218 == 5) {
    goto LABEL_40;
  }
  v167 = objc_msgSend_string(v219, v154, v155, v156, v157, v158);
  if (objc_msgSend_countSubstringsWithOptions_(v167, v168, 2, v169, v170, v171) <= 4)
  {
    v177 = objc_msgSend_string(v219, v172, v173, v174, v175, v176);
    if (objc_msgSend_isAllUppercase(v177, v178, v179, v180, v181, v182))
    {
      char v188 = objc_msgSend_properties(v219, v183, v184, v185, v186, v187);

      v166 = v219;
      if ((v188 & 4) != 0)
      {
        if (v218 != 6) {
          goto LABEL_40;
        }
        goto LABEL_37;
      }
      goto LABEL_41;
    }
  }
  if (v218 != 6) {
    goto LABEL_40;
  }
LABEL_37:
  v194 = objc_msgSend_string(v219, v189, v190, v191, v192, v193);
  v200 = objc_msgSend_string(v31, v195, v196, v197, v198, v199);
  if (objc_msgSend_caseInsensitiveCompare_(v194, v201, (uint64_t)v200, v202, v203, v204)
    || (objc_msgSend_inputSources(v31, v205, v206, v207, v208, v209) & 0x100) == 0)
  {

    goto LABEL_40;
  }
  __int16 v216 = objc_msgSend_properties(v31, v210, v211, v212, v213, v214);

  v166 = v219;
  if ((v216 & 0x200) != 0) {
LABEL_40:
  }
    v166 = v50;
LABEL_41:
  id v32 = v166;

LABEL_42:
  return v32;
}

- (CHLexiconCorrectionStep)initWithAutoCapitalizationMode:(int)a3 shouldAutoCorrect:(BOOL)a4 shouldAutoCapitalize:(BOOL)a5 shouldCreatePseudoTokens:(BOOL)a6 locale:(id)a7 staticLexicon:(_LXLexicon *)a8 customLexicon:(_LXLexicon *)cf phraseLexicon:(_LXLexicon *)a10 customPhraseLexicon:(_LXLexicon *)a11 spellChecker:(id)a12 lmVocabulary:(void *)a13 ovsStringChecker:(id)a14 textReplacements:(id)a15
{
  id v47 = a7;
  id v46 = a12;
  id v45 = a14;
  id v44 = a15;
  v48.receiver = self;
  v48.super_class = (Class)CHLexiconCorrectionStep;
  uint64_t v22 = [(CHLexiconCorrectionStep *)&v48 init];
  p_isa = (id *)&v22->super.super.isa;
  v24 = v22;
  if (v22)
  {
    v22->_autoCapitalizationMode = a3;
    v22->_shouldAutoCorrect = a4;
    v22->_shouldAutoCapitalize = a5;
    v22->_shouldCreatePseudoTokens = a6;
    objc_storeStrong((id *)&v22->_locale, a7);
    if (a8) {
      v24->_staticLexicon = (_LXLexicon *)CFRetain(a8);
    }
    if (cf) {
      v24->_customLexicon = (_LXLexicon *)CFRetain(cf);
    }
    if (a10) {
      v24->_phraseLexicon = (_LXLexicon *)CFRetain(a10);
    }
    if (a11) {
      v24->_customPhraseLexicon = (_LXLexicon *)CFRetain(a11);
    }
    v24->_lmVocabulary = a13;
    objc_storeStrong(p_isa + 7, a14);
    objc_storeStrong(p_isa + 8, a12);
    uint64_t v29 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v25, @"'\".-", v26, v27, v28);
    consumableStrokesCharSet = v24->_consumableStrokesCharSet;
    v24->_consumableStrokesCharSet = (NSCharacterSet *)v29;

    objc_storeStrong(p_isa + 9, a15);
    uint64_t v35 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v31, @"．！？；：。", v32, v33, v34);
    fullWidthPunctuationThatExpectsUppercaseAfter = v24->_fullWidthPunctuationThatExpectsUppercaseAfter;
    v24->_fullWidthPunctuationThatExpectsUppercaseAfter = (NSCharacterSet *)v35;

    uint64_t v41 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v37, @"¿¡", v38, v39, v40);
    punctuationThatExpectsUppercaseAfter = v24->_punctuationThatExpectsUppercaseAfter;
    v24->_punctuationThatExpectsUppercaseAfter = (NSCharacterSet *)v41;
  }
  return v24;
}

- (void)dealloc
{
  staticLexicon = self->_staticLexicon;
  if (staticLexicon)
  {
    CFRelease(staticLexicon);
    self->_staticLexicon = 0;
  }
  customLexicon = self->_customLexicon;
  if (customLexicon)
  {
    CFRelease(customLexicon);
    self->_customLexicon = 0;
  }
  phraseLexicon = self->_phraseLexicon;
  if (phraseLexicon)
  {
    CFRelease(phraseLexicon);
    self->_phraseLexicon = 0;
  }
  customPhraseLexicon = self->_customPhraseLexicon;
  if (customPhraseLexicon)
  {
    CFRelease(customPhraseLexicon);
    self->_customPhraseLexicon = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CHLexiconCorrectionStep;
  [(CHLexiconCorrectionStep *)&v7 dealloc];
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v937 = *MEMORY[0x1E4F143B8];
  v5 = (id *)a3;
  id v823 = a4;
  v853 = v5;
  uint64_t v11 = objc_msgSend_leftContext(v5, v6, v7, v8, v9, v10);
  v833 = v11;
  if (v11 && objc_msgSend_length(v11, v12, v13, v14, v15, v16))
  {
    objc_msgSend_lastComposedCharacter(v833, v12, v17, v18, v19, v16);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v21, v22, v23, v24, v25);
    uint64_t v26 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v829) = isStringEntirelyFromSet(v20, v26);

    if (isCharacterLatinOrCommonScript(v20)) {
      HIDWORD(v829) = isCharacterCJKSymbolsPunctuations(v20) ^ 1;
    }
    else {
      BYTE4(v829) = 0;
    }

    char v828 = 0;
  }
  else
  {
    uint64_t v829 = 0;
    char v828 = 1;
  }
  int shouldAutoCapitalizeSetting_locale = objc_msgSend_shouldCapitalizeGivenHistory_shouldAutoCapitalizeSetting_locale_(CHLanguageUtilities, v12, (uint64_t)v833, self->_shouldAutoCapitalize, (uint64_t)self->_locale, v16);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v27 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = objc_msgSend_stringForAutoCapitalizationMode_(CHRecognizerConfiguration, v28, self->_autoCapitalizationMode, v29, v30, v31);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v32;
    _os_log_impl(&dword_1C492D000, v27, OS_LOG_TYPE_DEBUG, "CHLexiconCorrectionStep is running with autoCapitalizationMode: %@", (uint8_t *)&buf, 0xCu);
  }
  v824 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v33, v34, v35, v36, v37);
  v825 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40, v41, v42);
  unint64_t v832 = 0;
LABEL_13:
  objc_super v48 = objc_msgSend_result(v853, v43, v44, v45, v46, v47);
  uint64_t v54 = objc_msgSend_transcriptionPaths(v48, v49, v50, v51, v52, v53);
  BOOL v60 = v832 < objc_msgSend_count(v54, v55, v56, v57, v58, v59);

  if (v60)
  {
    v835 = objc_msgSend_mutableCopy(v833, v61, v62, v63, v64, v65);
    v71 = objc_msgSend_result(v853, v66, v67, v68, v69, v70);
    v77 = objc_msgSend_transcriptionPaths(v71, v72, v73, v74, v75, v76);
    v834 = objc_msgSend_objectAtIndexedSubscript_(v77, v78, v832, v79, v80, v81);

    v826 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v82, v83, v84, v85, v86);
    v827 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v87, v88, v89, v90, v91);
    v830 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v92, v93, v94, v95, v96);
    uint64_t v896 = 0;
    v897 = &v896;
    uint64_t v898 = 0x2020000000;
    char v899 = 1;
    v894[0] = 0;
    v894[1] = v894;
    v894[2] = 0x2020000000;
    char v895 = BYTE4(v829);
    v892[0] = 0;
    v892[1] = v892;
    v892[2] = 0x3032000000;
    v892[3] = sub_1C4C089AC;
    v892[4] = sub_1C4C089BC;
    id v893 = v833;
    uint64_t v102 = objc_msgSend_result(v853, v97, v98, v99, v100, v101);
    uint64_t v108 = objc_msgSend_length(v834, v103, v104, v105, v106, v107);
    v885[0] = MEMORY[0x1E4F143A8];
    v885[1] = 3221225472;
    v885[2] = sub_1C4C0AAD0;
    v885[3] = &unk_1E64E5048;
    v887 = v894;
    v888 = v892;
    v889 = &v896;
    char v890 = v828;
    char v891 = v829;
    id v836 = v830;
    id v886 = v836;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v102, v109, (uint64_t)v834, 0, v108, (uint64_t)v885);

    char v114 = objc_msgSend_numberWithBool_(NSNumber, v110, *((unsigned __int8 *)v897 + 24), v111, v112, v113);
    objc_msgSend_addObject_(v836, v115, (uint64_t)v114, v116, v117, v118);

    v844 = 0;
    uint64_t v846 = 0;
    for (unint64_t i = 0; ; ++i)
    {
      if (i >= objc_msgSend_length(v834, v119, v120, v121, v122, v123))
      {
        if ((objc_msgSend_isEqual_(v826, v124, (uint64_t)v827, v125, v126, v127) & 1) == 0)
        {
          objc_msgSend_addObject_(v824, v737, (uint64_t)v826, v738, v739, v740);
          v746 = objc_msgSend_result(v853, v741, v742, v743, v744, v745);
          v752 = objc_msgSend_transcriptionPathScores(v746, v747, v748, v749, v750, v751);
          v757 = objc_msgSend_objectAtIndexedSubscript_(v752, v753, v832, v754, v755, v756);
          objc_msgSend_addObject_(v825, v758, (uint64_t)v757, v759, v760, v761);
        }
        objc_msgSend_addObject_(v824, v737, (uint64_t)v827, v738, v739, v740);
        v767 = objc_msgSend_result(v853, v762, v763, v764, v765, v766);
        v773 = objc_msgSend_transcriptionPathScores(v767, v768, v769, v770, v771, v772);
        v778 = objc_msgSend_objectAtIndexedSubscript_(v773, v774, v832, v775, v776, v777);
        objc_msgSend_addObject_(v825, v779, (uint64_t)v778, v780, v781, v782);

        _Block_object_dispose(v892, 8);
        _Block_object_dispose(v894, 8);
        _Block_object_dispose(&v896, 8);

        ++v832;
        goto LABEL_13;
      }
      uint64_t v851 = objc_msgSend_indexAtPosition_(v834, v124, i, v125, v126, v127);
      BOOL v133 = objc_msgSend_result(v853, v128, v129, v130, v131, v132);
      v139 = objc_msgSend_tokenColumns(v133, v134, v135, v136, v137, v138);
      v144 = objc_msgSend_objectAtIndexedSubscript_(v139, v140, i, v141, v142, v143);
      uint64_t v150 = objc_msgSend_textTokenRows(v144, v145, v146, v147, v148, v149);
      v831 = objc_msgSend_objectAtIndexedSubscript_(v150, v151, v851, v152, v153, v154);

      v842 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v155, v156, v157, v158, v159);
      v839 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v160, v161, v162, v163, v164);
      long long v883 = 0u;
      long long v884 = 0u;
      long long v882 = 0u;
      long long v881 = 0u;
      obuint64_t j = v831;
      uint64_t v167 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v165, (uint64_t)&v881, (uint64_t)v923, 16, v166);
      if (!v167) {
        goto LABEL_102;
      }
      uint64_t v838 = *(void *)v882;
      do
      {
        uint64_t v847 = 0;
        uint64_t v840 = v167;
        do
        {
          if (*(void *)v882 != v838) {
            objc_enumerationMutation(obj);
          }
          uint64_t v173 = *(void **)(*((void *)&v881 + 1) + 8 * v847);
          uint64_t v174 = objc_msgSend_string(v173, v168, v169, v170, v171, v172);
          BOOL v180 = objc_msgSend_length(v174, v175, v176, v177, v178, v179) == 0;

          if (v180)
          {
            objc_msgSend_addObject_(v839, v181, (uint64_t)v173, v182, v183, v184);
            objc_msgSend_addObject_(v842, v198, (uint64_t)v173, v199, v200, v201);
            goto LABEL_19;
          }
          uint64_t v185 = objc_msgSend_objectAtIndex_(v836, v181, v846, v182, v183, v184);
          int v191 = objc_msgSend_BOOLValue(v185, v186, v187, v188, v189, v190);

          if (v191) {
            uint64_t v197 = self->_textReplacements;
          }
          else {
            uint64_t v197 = 0;
          }
          uint64_t v202 = objc_msgSend_string(v173, v192, v193, v194, v195, v196);
          int v841 = objc_msgSend_length(v202, v203, v204, v205, v206, v207) == 1
              && objc_msgSend_length(v834, v208, v209, v210, v211, v212) == 1
              && objc_msgSend_count(obj, v213, v214, v215, v216, v217) == 1;

          BOOL v850 = v846 == 0;
          id v218 = v173;
          id v848 = v835;
          v843 = v197;
          id v219 = v218;
          v849 = v219;
          if (!self->_shouldCreatePseudoTokens) {
            goto LABEL_77;
          }
          id v871 = v219;
          v869 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v220, v221, v222, v223, v224);
          v230 = objc_msgSend_string(v871, v225, v226, v227, v228, v229);
          v236 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v231, v232, v233, v234, v235);
          v241 = objc_msgSend_componentsSeparatedByCharactersInSet_(v230, v237, (uint64_t)v236, v238, v239, v240);

          long long v920 = 0u;
          long long v921 = 0u;
          long long v918 = 0u;
          long long v919 = 0u;
          id v855 = v241;
          uint64_t v244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v855, v242, (uint64_t)&v918, (uint64_t)&buf, 16, v243);
          if (v244)
          {
            uint64_t v864 = *(void *)v919;
            do
            {
              uint64_t v250 = 0;
              uint64_t v865 = v244;
              do
              {
                if (*(void *)v919 != v864) {
                  objc_enumerationMutation(v855);
                }
                v251 = *(void **)(*((void *)&v918 + 1) + 8 * v250);
                if (objc_msgSend_length(v251, v245, v246, v247, v248, v249))
                {
                  uint64_t v914 = 0;
                  v915 = &v914;
                  uint64_t v916 = 0x2020000000;
                  uint64_t v917 = 0;
                  uint64_t v917 = objc_msgSend_properties(v871, v245, v246, v247, v248, v249);
                  if (objc_msgSend_count(v869, v252, v253, v254, v255, v256)) {
                    v915[3] |= 0x20uLL;
                  }
                  v912[0] = 0;
                  v912[1] = v912;
                  v912[2] = 0x2020000000;
                  BOOL v913 = 0;
                  objc_msgSend_firstComposedCharacter(v251, v257, v258, v259, v260, v261);
                  v262 = (NSString *)objc_claimAutoreleasedReturnValue();
                  BOOL v263 = isCharacterLatinOrCommonScript(v262);

                  BOOL v913 = v263;
                  *(void *)&long long v908 = 0;
                  *((void *)&v908 + 1) = &v908;
                  *(void *)&long long v909 = 0x3032000000;
                  *((void *)&v909 + 1) = sub_1C4C089AC;
                  *(void *)&long long v910 = sub_1C4C089BC;
                  *((void *)&v910 + 1) = objc_msgSend_string(MEMORY[0x1E4F28E78], v264, v265, v266, v267, v268);
                  uint64_t v274 = objc_msgSend_length(v251, v269, v270, v271, v272, v273);
                  *(void *)&long long v900 = MEMORY[0x1E4F143A8];
                  *((void *)&v900 + 1) = 3221225472;
                  *(void *)&long long v901 = sub_1C4C08A8C;
                  *((void *)&v901 + 1) = &unk_1E64E5020;
                  *(void *)&long long v903 = v912;
                  *((void *)&v903 + 1) = &v908;
                  id v275 = v871;
                  *(void *)&long long v902 = v275;
                  *(void *)&long long v904 = &v914;
                  id v276 = v869;
                  *((void *)&v902 + 1) = v276;
                  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v251, v277, 0, v274, 2, (uint64_t)&v900);
                  if (objc_msgSend_length(*(void **)(*((void *)&v908 + 1) + 40), v278, v279, v280, v281, v282))
                  {
                    uint64_t v288 = *(void *)(*((void *)&v908 + 1) + 40);
                    objc_msgSend_strokeIndexes(v275, v283, v284, v285, v286, v287);
                    id v867 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v294 = objc_msgSend_wordID(v275, v289, v290, v291, v292, v293);
                    objc_msgSend_modelScore(v275, v295, v296, v297, v298, v299);
                    double v301 = v300;
                    objc_msgSend_recognitionScore(v275, v302, v303, v304, v305, v306);
                    double v308 = v307;
                    objc_msgSend_combinedScore(v275, v309, v310, v311, v312, v313);
                    double v315 = v314;
                    objc_msgSend_alignmentScore(v275, v316, v317, v318, v319, v320);
                    double v322 = v321;
                    uint64_t v323 = v915[3];
                    v329 = objc_msgSend_recognizerSourceLocale(v275, v324, v325, v326, v327, v328);
                    double v856 = v322;
                    double v858 = v315;
                    double v860 = v308;
                    double v862 = v301;
                    uint64_t v335 = objc_msgSend_inputSources(v275, v330, v331, v332, v333, v334);
                    uint64_t v341 = objc_msgSend_substrokeCount(v275, v336, v337, v338, v339, v340);
                    objc_msgSend_bounds(v275, v342, v343, v344, v345, v346);
                    double v348 = v347;
                    double v350 = v349;
                    double v352 = v351;
                    double v354 = v353;
                    objc_msgSend_originalBounds(v275, v355, v356, v357, v358, v359);
                    uint64_t v366 = v365;
                    uint64_t v368 = v367;
                    uint64_t v370 = v369;
                    uint64_t v372 = v371;
                    if (v871)
                    {
                      objc_msgSend_principalLines(v275, v360, v361, v362, v363, v364);
                    }
                    else
                    {
                      long long v930 = 0u;
                      long long v931 = 0u;
                      long long v928 = 0u;
                      long long v929 = 0u;
                      long long v926 = 0u;
                      long long v927 = 0u;
                      long long v924 = 0u;
                      long long v925 = 0u;
                    }
                    objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v360, v288, (uint64_t)v867, v294, v323, v329, v335, v862, v860, v858, v856, v348, v350, v352, v354, v341, v366, v368,
                      v370,
                      v372,
                    v373 = &v924);

                    objc_msgSend_addObject_(v276, v374, (uint64_t)v373, v375, v376, v377);
                  }

                  _Block_object_dispose(&v908, 8);
                  _Block_object_dispose(v912, 8);
                  _Block_object_dispose(&v914, 8);
                }
                ++v250;
              }
              while (v865 != v250);
              uint64_t v244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v855, v245, (uint64_t)&v918, (uint64_t)&buf, 16, v249);
            }
            while (v244);
          }

          if (v869)
          {
            if ((unint64_t)objc_msgSend_count(v869, v378, v379, v380, v381, v382) >= 2)
            {
              v388 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v383, v384, v385, v386, v387);
              v394 = objc_msgSend_mutableCopy(v848, v389, v390, v391, v392, v393);
              long long v920 = 0u;
              long long v921 = 0u;
              long long v918 = 0u;
              long long v919 = 0u;
              id v868 = v869;
              unint64_t v397 = objc_msgSend_countByEnumeratingWithState_objects_count_(v868, v395, (uint64_t)&v918, (uint64_t)&buf, 16, v396);
              if (v397)
              {
                uint64_t v398 = *(void *)v919;
                do
                {
                  if (*(void *)v919 != v398) {
                    objc_enumerationMutation(v868);
                  }
                  v399 = sub_1C4C07A60((uint64_t)self, **((void ***)&v918 + 1), v850, v394, shouldAutoCapitalizeSetting_locale & v850, 0, 0, 0);
                  if ((objc_msgSend_properties(v399, v400, v401, v402, v403, v404) & 0x20) != 0) {
                    objc_msgSend_appendString_(v394, v405, @" ", v407, v408, v409);
                  }
                  v410 = objc_msgSend_string(v399, v405, v406, v407, v408, v409);
                  objc_msgSend_appendString_(v394, v411, (uint64_t)v410, v412, v413, v414);

                  objc_msgSend_addObject_(v388, v415, (uint64_t)v399, v416, v417, v418);
                  if (v397 >= 2)
                  {
                    for (uint64_t j = 1; j != v397; ++j)
                    {
                      if (*(void *)v919 != v398) {
                        objc_enumerationMutation(v868);
                      }
                      v422 = sub_1C4C07A60((uint64_t)self, *(void **)(*((void *)&v918 + 1) + 8 * j), 0, v394, 0, 0, 0, 0);
                      if ((objc_msgSend_properties(v422, v423, v424, v425, v426, v427) & 0x20) != 0) {
                        objc_msgSend_appendString_(v394, v428, @" ", v430, v431, v432);
                      }
                      v433 = objc_msgSend_string(v422, v428, v429, v430, v431, v432);
                      objc_msgSend_appendString_(v394, v434, (uint64_t)v433, v435, v436, v437);

                      objc_msgSend_addObject_(v388, v438, (uint64_t)v422, v439, v440, v441);
                    }
                  }
                  unint64_t v397 = objc_msgSend_countByEnumeratingWithState_objects_count_(v868, v419, (uint64_t)&v918, (uint64_t)&buf, 16, v420);
                  BOOL v850 = 0;
                }
                while (v397);
              }

              uint64_t v447 = objc_msgSend_inputSources(v871, v442, v443, v444, v445, v446);
              v453 = objc_msgSend_string(MEMORY[0x1E4F28E78], v448, v449, v450, v451, v452);
              long long v910 = 0u;
              long long v911 = 0u;
              long long v908 = 0u;
              long long v909 = 0u;
              id v454 = v388;
              uint64_t v462 = objc_msgSend_countByEnumeratingWithState_objects_count_(v454, v455, (uint64_t)&v908, (uint64_t)&v924, 16, v456);
              if (v462)
              {
                uint64_t v463 = *(void *)v909;
                do
                {
                  for (uint64_t k = 0; k != v462; ++k)
                  {
                    if (*(void *)v909 != v463) {
                      objc_enumerationMutation(v454);
                    }
                    v465 = *(void **)(*((void *)&v908 + 1) + 8 * k);
                    if (objc_msgSend_length(v453, v457, v458, v459, v460, v461)
                      && (objc_msgSend_properties(v465, v466, v467, v468, v469, v470) & 0x20) != 0)
                    {
                      objc_msgSend_appendString_(v453, v466, @" ", v468, v469, v470);
                    }
                    v471 = objc_msgSend_string(v465, v466, v467, v468, v469, v470);
                    objc_msgSend_appendString_(v453, v472, (uint64_t)v471, v473, v474, v475);

                    v447 |= objc_msgSend_inputSources(v465, v476, v477, v478, v479, v480);
                  }
                  uint64_t v462 = objc_msgSend_countByEnumeratingWithState_objects_count_(v454, v457, (uint64_t)&v908, (uint64_t)&v924, 16, v461);
                }
                while (v462);
              }

              v486 = objc_msgSend_string(v871, v481, v482, v483, v484, v485);
              char isEqualToString = objc_msgSend_isEqualToString_(v453, v487, (uint64_t)v486, v488, v489, v490);

              if ((isEqualToString & 1) == 0)
              {
                v866 = objc_msgSend_strokeIndexes(v871, v492, v493, v494, v495, v496);
                uint64_t v502 = objc_msgSend_wordID(v871, v497, v498, v499, v500, v501);
                objc_msgSend_modelScore(v871, v503, v504, v505, v506, v507);
                double v863 = v508;
                objc_msgSend_recognitionScore(v871, v509, v510, v511, v512, v513);
                double v861 = v514;
                objc_msgSend_combinedScore(v871, v515, v516, v517, v518, v519);
                double v859 = v520;
                objc_msgSend_alignmentScore(v871, v521, v522, v523, v524, v525);
                double v857 = v526;
                uint64_t v532 = objc_msgSend_properties(v871, v527, v528, v529, v530, v531);
                v538 = objc_msgSend_recognizerSourceLocale(v871, v533, v534, v535, v536, v537);
                uint64_t v544 = objc_msgSend_substrokeCount(v871, v539, v540, v541, v542, v543);
                objc_msgSend_bounds(v871, v545, v546, v547, v548, v549);
                double v551 = v550;
                double v553 = v552;
                double v555 = v554;
                double v557 = v556;
                objc_msgSend_originalBounds(v871, v558, v559, v560, v561, v562);
                uint64_t v569 = v568;
                uint64_t v571 = v570;
                uint64_t v573 = v572;
                uint64_t v575 = v574;
                if (v871)
                {
                  objc_msgSend_principalLines(v871, v563, v564, v565, v566, v567);
                }
                else
                {
                  long long v906 = 0u;
                  long long v907 = 0u;
                  long long v904 = 0u;
                  long long v905 = 0u;
                  long long v902 = 0u;
                  long long v903 = 0u;
                  long long v900 = 0u;
                  long long v901 = 0u;
                }
                objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v563, (uint64_t)v453, (uint64_t)v866, v502, v532, v538, v447, v863, v861, v859, v857, v551, v553, v555, v557, v544, v569, v571,
                  v573,
                  v575,
                uint64_t v736 = &v900);

                id v871 = (id)v736;
              }

              v869 = v868;
              goto LABEL_79;
            }
          }
          else
          {
LABEL_77:
            v869 = 0;
          }
          sub_1C4C07A60((uint64_t)self, v849, v846 == 0, v848, shouldAutoCapitalizeSetting_locale, v843, v841, 1);
          id v454 = v849;
          id v871 = (id)objc_claimAutoreleasedReturnValue();
LABEL_79:

          v576 = objc_opt_class();
          v579 = objc_msgSend_validatedTokenForCorrectedToken_rawToken_autoCapitalizationMode_(v576, v577, (uint64_t)v871, (uint64_t)v849, self->_autoCapitalizationMode, v578);

          v585 = objc_msgSend_string(v579, v580, v581, v582, v583, v584);
          v591 = objc_msgSend_string(v849, v586, v587, v588, v589, v590);
          char v596 = objc_msgSend_isEqualToString_(v585, v592, (uint64_t)v591, v593, v594, v595);

          if ((v596 & 1) == 0)
          {
            for (unint64_t m = 0; ; unint64_t m = v662 + 1)
            {
              v638 = objc_msgSend_result(v853, v597, v598, v599, v600, v601);
              v644 = objc_msgSend_tokenColumns(v638, v639, v640, v641, v642, v643);
              v649 = objc_msgSend_objectAtIndexedSubscript_(v644, v645, i, v646, v647, v648);
              v655 = objc_msgSend_textTokenRows(v649, v650, v651, v652, v653, v654);
              uint64_t v870 = m;
              BOOL v661 = m < objc_msgSend_count(v655, v656, v657, v658, v659, v660);

              if (!v661) {
                break;
              }
              uint64_t v662 = v870;
              if (v870 != v851)
              {
                v663 = objc_msgSend_result(v853, v597, v598, v599, v600, v601);
                v669 = objc_msgSend_tokenColumns(v663, v664, v665, v666, v667, v668);
                v674 = objc_msgSend_objectAtIndexedSubscript_(v669, v670, i, v671, v672, v673);
                v680 = objc_msgSend_textTokenRows(v674, v675, v676, v677, v678, v679);
                v685 = objc_msgSend_objectAtIndexedSubscript_(v680, v681, v870, v682, v683, v684);

                long long v879 = 0u;
                long long v880 = 0u;
                long long v877 = 0u;
                long long v878 = 0u;
                id v872 = v685;
                uint64_t v693 = objc_msgSend_countByEnumeratingWithState_objects_count_(v872, v686, (uint64_t)&v877, (uint64_t)v922, 16, v687);
                if (v693)
                {
                  uint64_t v694 = *(void *)v878;
                  do
                  {
                    for (uint64_t n = 0; n != v693; ++n)
                    {
                      if (*(void *)v878 != v694) {
                        objc_enumerationMutation(v872);
                      }
                      v696 = *(void **)(*((void *)&v877 + 1) + 8 * n);
                      if ((objc_msgSend_inputSources(v696, v688, v689, v690, v691, v692) & 0x20) == 0)
                      {
                        v697 = objc_msgSend_string(v696, v688, v689, v690, v691, v692);
                        v703 = objc_msgSend_string(v579, v698, v699, v700, v701, v702);
                        if (objc_msgSend_isEqualToString_(v697, v704, (uint64_t)v703, v705, v706, v707))
                        {
                          v713 = objc_msgSend_strokeIndexes(v696, v708, v709, v710, v711, v712);
                          v719 = objc_msgSend_strokeIndexes(v579, v714, v715, v716, v717, v718);
                          int isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v713, v720, (uint64_t)v719, v721, v722, v723);

                          if (isEqualToIndexSet)
                          {
                            v725 = objc_msgSend_mutableCopy(v579, v688, v689, v690, v691, v692);

                            objc_msgSend_modelScore(v696, v726, v727, v728, v729, v730);
                            v579 = v725;
                            objc_msgSend_setModelScore_(v725, v731, v732, v733, v734, v735);
                          }
                        }
                        else
                        {
                        }
                      }
                    }
                    uint64_t v693 = objc_msgSend_countByEnumeratingWithState_objects_count_(v872, v688, (uint64_t)&v877, (uint64_t)v922, 16, v692);
                  }
                  while (v693);
                }

                uint64_t v662 = v870;
              }
            }
          }
          objc_msgSend_addObject_(v839, v597, (uint64_t)v849, v599, v600, v601);
          objc_msgSend_addObject_(v842, v602, (uint64_t)v579, v603, v604, v605);
          v611 = objc_msgSend_lastObject(v842, v606, v607, v608, v609, v610);

          v617 = objc_msgSend_result(v853, v612, v613, v614, v615, v616);
          v622 = objc_msgSend_precedingSeparatorForToken_(v617, v618, (uint64_t)v611, v619, v620, v621);
          objc_msgSend_appendString_(v848, v623, (uint64_t)v622, v624, v625, v626);

          v632 = objc_msgSend_string(v611, v627, v628, v629, v630, v631);
          objc_msgSend_appendString_(v848, v633, (uint64_t)v632, v634, v635, v636);

          ++v846;
          v844 = v611;
LABEL_19:
          ++v847;
        }
        while (v847 != v840);
        uint64_t v167 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v168, (uint64_t)&v881, (uint64_t)v923, 16, v172);
      }
      while (v167);
LABEL_102:

      sub_1C4C045E8((uint64_t)CHPostprocessingStep, v842, v839, v826, v827);
    }
  }
  v783 = objc_msgSend_result(v853, v61, v62, v63, v64, v65);
  v787 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v783, v784, (uint64_t)v824, (uint64_t)v825, v785, v786);
  if (v853) {
    objc_storeStrong(v853 + 3, v787);
  }

  if (self->_phraseLexicon || self->_customPhraseLexicon)
  {
    unsigned int autoCapitalizationMode = self->_autoCapitalizationMode;
    if (autoCapitalizationMode > 5 || ((1 << autoCapitalizationMode) & 0x31) == 0)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v933 = 0x3032000000;
      v934 = sub_1C4C089AC;
      v935 = sub_1C4C089BC;
      id v789 = v833;
      id v936 = v789;
      if (objc_msgSend_length(v789, v790, v791, v792, v793, v794))
      {
        *(void *)&long long v924 = 0;
        *((void *)&v924 + 1) = &v924;
        long long v925 = 0x2020000000uLL;
        uint64_t v800 = objc_msgSend_length(v789, v795, v796, v797, v798, v799);
        v873[0] = MEMORY[0x1E4F143A8];
        v873[1] = 3221225472;
        v873[2] = sub_1C4C0ADAC;
        v873[3] = &unk_1E64E1550;
        v875 = &v924;
        p_long long buf = &buf;
        id v874 = v789;
        objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v874, v801, 0, v800, 259, (uint64_t)v873);

        _Block_object_dispose(&v924, 8);
      }
      if (self->_phraseLexicon)
      {
        v802 = objc_msgSend_result(v853, v795, v796, v797, v798, v799);
        v805 = objc_msgSend_phraseCaseCorrectedResultWithHistory_phraseLexicon_maxPhraseLength_(v802, v803, *(void *)(*((void *)&buf + 1) + 40), (uint64_t)self->_phraseLexicon, 3, v804);
        v811 = objc_msgSend_mutableCopy(v805, v806, v807, v808, v809, v810);
        sub_1C4C040D0((uint64_t)v853, v811);
      }
      if (self->_customPhraseLexicon)
      {
        v812 = objc_msgSend_result(v853, v795, v796, v797, v798, v799);
        v815 = objc_msgSend_phraseCaseCorrectedResultWithHistory_phraseLexicon_maxPhraseLength_(v812, v813, *(void *)(*((void *)&buf + 1) + 40), (uint64_t)self->_customPhraseLexicon, 3, v814);
        v821 = objc_msgSend_mutableCopy(v815, v816, v817, v818, v819, v820);
        sub_1C4C040D0((uint64_t)v853, v821);
      }
      _Block_object_dispose(&buf, 8);
    }
  }

  return v853;
}

- (_LXLexicon)staticLexicon
{
  return self->_staticLexicon;
}

- (void)setStaticLexicon:(_LXLexicon *)a3
{
  self->_staticLexicouint64_t n = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punctuationThatExpectsUppercaseAfter, 0);
  objc_storeStrong((id *)&self->_fullWidthPunctuationThatExpectsUppercaseAfter, 0);
  objc_storeStrong((id *)&self->_consumableStrokesCharSet, 0);
  objc_storeStrong((id *)&self->_textReplacements, 0);
  objc_storeStrong((id *)&self->_spellChecker, 0);
  objc_storeStrong((id *)&self->_ovsStringChecker, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end