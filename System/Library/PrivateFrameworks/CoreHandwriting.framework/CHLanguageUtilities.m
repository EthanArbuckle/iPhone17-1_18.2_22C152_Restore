@interface CHLanguageUtilities
+ (BOOL)findPartialMatchInPhraseLexicon:(_LXLexicon *)a3 token:(id)a4 contextBeforeToken:(id)a5;
+ (BOOL)isMecabraConversionCandidateAllowed:(id)a3;
+ (BOOL)lexiconHasEntryForString:(id)a3 withLexicon:(_LXLexicon *)a4 outHasMatchingString:(BOOL *)a5;
+ (BOOL)shouldCapitalizeGivenHistory:(id)a3 shouldAutoCapitalizeSetting:(BOOL)a4 locale:(id)a5;
+ (double)characterLMLogProbabilityForString:(id)a3 characterLM:(id)a4;
+ (double)computeEditPenalizationFromString:(id)a3 toReferenceString:(id)a4 withSuffix:(id)a5 withCaseSensitivity:(BOOL)a6 withFirstLetterCaseSensitivity:(BOOL)a7 withDiacriticSensitivity:(BOOL)a8 withDiacriticsCharSet:(id)a9 withConsumableStrokesCharSet:(id)a10 outputSuffix:(id *)a11 lexiconExtraCharacters:(id *)a12 firstLetterCaseFlipped:(BOOL *)a13;
+ (id)lexiconCorrectionsForToken:(id)a3 locale:(id)a4 lexicon:(_LXLexicon *)a5 lmVocabulary:(void *)a6 ovsStringChecker:(id)a7 textReplacements:(id)a8 consumableStrokesSet:(id)a9 minimumTokenScore:(double)a10 activeHistoryRange:(_NSRange)a11 outBestTokenScore:(double *)a12 shouldCapitalizeWord:(BOOL)a13 shouldSkipEntryCorrection:(BOOL)a14 allowFullCapsCorrections:(BOOL)a15 minimalLengthForLowConfidenceCorrections:(int64_t)a16 lowConfidenceThreshold:(double)a17 minimalLengthForCustomCapitalizationCorrections:(int64_t)a18 outBestTokenIndex:(int64_t *)a19 outFoundTokenInLexicon:(BOOL *)a20 outFoundCaseMatchingTokenInLexicon:(BOOL *)a21 outCorrectionFromOutOfContextEntry:(BOOL *)a22;
+ (id)mecabraTokenizationAndKanaConversionForString:(id)a3 mecabraEngine:(__Mecabra *)a4 contextRef:(__MecabraContext *)a5 leftCandidateRef:(void *)a6 alternativeCandidateLimit:(int64_t)a7;
+ (id)performInverseBiDiForNumeric:(id)a3 isRTLContext:(BOOL)a4;
+ (id)splitStringIntoSubtokensForLexicon:(id)a3 minLength:(int64_t)a4;
+ (id)tokensRangesForString:(id)a3 outTokenIDs:(id *)a4 wordLanguageModel:(void *)a5;
+ (id)transformCyrillicToLatin:(id)a3;
+ (id)transformLatinToCyrillic:(id)a3;
+ (id)transformString:(id)a3 usingConfusions:(id)a4;
+ (id)transliterateStringUsingICUTransliterator:(id)a3 _icuTransliterator:(void *)a4;
+ (unsigned)normalizeLMTokenIDForWord:(id)a3 tokenID:(unsigned int)a4 isFromPattern:(BOOL)a5 score:(double *)a6 wordLanguageModel:(void *)a7;
+ (unsigned)tokenIDForString:(id)a3 withLexicon:(_LXLexicon *)a4;
@end

@implementation CHLanguageUtilities

+ (unsigned)normalizeLMTokenIDForWord:(id)a3 tokenID:(unsigned int)a4 isFromPattern:(BOOL)a5 score:(double *)a6 wordLanguageModel:(void *)a7
{
  BOOL v7 = a5;
  id v9 = a3;
  if (v7) {
    int TokenIDForString = 3;
  }
  else {
    int TokenIDForString = a4;
  }
  if (!TokenIDForString)
  {
    int TokenIDForString = LMLanguageModelGetTokenIDForString();
    if (!TokenIDForString)
    {
      v16 = objc_msgSend_lowercaseString(v9, v11, v12, v13, v14, v15);
      int TokenIDForString = LMLanguageModelGetTokenIDForString();
    }
  }
  if (TokenIDForString == 28) {
    int v17 = 6;
  }
  else {
    int v17 = TokenIDForString;
  }
  if ((v17 & 0xFFFFFFFE) == 0x82) {
    int v17 = 3;
  }
  if (v17 == 46) {
    unsigned int v18 = 0;
  }
  else {
    unsigned int v18 = v17;
  }

  return v18;
}

+ (id)tokensRangesForString:(id)a3 outTokenIDs:(id *)a4 wordLanguageModel:(void *)a5
{
  id v160 = a1;
  BOOL v7 = (__CFString *)a3;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  id v164 = (id)objc_claimAutoreleasedReturnValue();
  v163 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15, v16, v17);
  v166.length = objc_msgSend_length(v7, v18, v19, v20, v21, v22);
  v166.location = 0;
  v27 = CFStringTokenizerCreate(0, v7, v166, 0, 0);
  if (v27)
  {
    unint64_t v28 = 0;
    v161 = v7;
    v162 = a4;
    while (CFStringTokenizerAdvanceToNextToken(v27))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v27);
      length = (const char *)CurrentTokenRange.length;
      if (CurrentTokenRange.location > v28)
      {
        v38 = objc_msgSend_substringWithRange_(v7, (const char *)CurrentTokenRange.length, v28, CurrentTokenRange.location - v28, v35, v36);
        v44 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v39, v40, v41, v42, v43);
        v49 = objc_msgSend_stringByTrimmingCharactersInSet_(v38, v45, (uint64_t)v44, v46, v47, v48);

        if (objc_msgSend_length(v49, v50, v51, v52, v53, v54))
        {
          uint64_t v59 = objc_msgSend_rangeOfString_(v38, v55, (uint64_t)v49, v56, v57, v58);
          uint64_t v65 = objc_msgSend_length(v49, v60, v61, v62, v63, v64);
          v70 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v66, 0, v67, v68, v69);
          objc_msgSend_addObject_(v163, v71, (uint64_t)v70, v72, v73, v74);

          v78 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v75, v59 + v28, v65, v76, v77);
          objc_msgSend_addObject_(v164, v79, (uint64_t)v78, v80, v81, v82);
        }
        BOOL v7 = v161;
        a4 = v162;
      }
      v83 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], length, CurrentTokenRange.location, CurrentTokenRange.length, v35, v36, v160);
      objc_msgSend_addObject_(v164, v84, (uint64_t)v83, v85, v86, v87);

      if (a4)
      {
        v95 = objc_msgSend_substringWithRange_(v7, v88, CurrentTokenRange.location, CurrentTokenRange.length, v89, v90);
        if (a5)
        {
          uint64_t TokenIDForString = LMLanguageModelGetTokenIDForString();
          v97 = objc_opt_class();
          unsigned int v99 = objc_msgSend_normalizeLMTokenIDForWord_tokenID_isFromPattern_score_wordLanguageModel_(v97, v98, (uint64_t)v95, TokenIDForString, 0, 0, a5);
        }
        else
        {
          unsigned int v99 = 0;
        }
        v100 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v91, v99, v92, v93, v94);
        objc_msgSend_addObject_(v163, v101, (uint64_t)v100, v102, v103, v104);
      }
      unint64_t v28 = CurrentTokenRange.location + CurrentTokenRange.length;
    }
    if (objc_msgSend_length(v7, v29, v30, v31, v32, v33) > v28)
    {
      uint64_t v110 = objc_msgSend_length(v7, v105, v106, v107, v108, v109);
      v114 = objc_msgSend_substringWithRange_(v7, v111, v28, v110 - v28, v112, v113);
      v120 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v115, v116, v117, v118, v119);
      v125 = objc_msgSend_stringByTrimmingCharactersInSet_(v114, v121, (uint64_t)v120, v122, v123, v124);

      if (objc_msgSend_length(v125, v126, v127, v128, v129, v130))
      {
        uint64_t v135 = objc_msgSend_rangeOfString_(v114, v131, (uint64_t)v125, v132, v133, v134);
        uint64_t v141 = objc_msgSend_length(v125, v136, v137, v138, v139, v140);
        v146 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v142, 0, v143, v144, v145);
        objc_msgSend_addObject_(v163, v147, (uint64_t)v146, v148, v149, v150);

        v154 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v151, v135 + v28, v141, v152, v153);
        objc_msgSend_addObject_(v164, v155, (uint64_t)v154, v156, v157, v158);
      }
      a4 = v162;
    }
    CFRelease(v27);
  }
  if (a4)
  {
    objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v23, (uint64_t)v163, v24, v25, v26);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v164;
}

+ (id)splitStringIntoSubtokensForLexicon:(id)a3 minLength:(int64_t)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (a4 <= 0)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v11 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v11, OS_LOG_TYPE_FAULT, "minLength has to be > 0", buf, 2u);
    }
  }
  uint64_t v16 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  if (qword_1EA3C8FF0 != -1) {
    dispatch_once(&qword_1EA3C8FF0, &unk_1F2012990);
  }
  objc_msgSend_componentsSeparatedByCharactersInSet_(v10, v12, qword_1EA3C8FE8, v13, v14, v15);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v36, (uint64_t)v41, 16, v19);
  if (v25)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v17);
        }
        unint64_t v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_msgSend_length(v28, v20, v21, v22, v23, v24, (void)v36) >= (unint64_t)a4)
        {
          uint64_t v29 = objc_msgSend_length(v28, v20, v21, v22, v23, v24);
          if (v29 != objc_msgSend_length(v10, v30, v31, v32, v33, v34)) {
            objc_msgSend_addObject_(v16, v20, (uint64_t)v28, v22, v23, v24);
          }
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v36, (uint64_t)v41, 16, v24);
    }
    while (v25);
  }

  return v16;
}

+ (BOOL)findPartialMatchInPhraseLexicon:(_LXLexicon *)a3 token:(id)a4 contextBeforeToken:(id)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v94 = a5;
  uint64_t v92 = v7;
  if (a3)
  {
    char v13 = objc_msgSend_properties(v7, v8, v9, v10, v11, v12);
    uint64_t v14 = @" ";
    if ((v13 & 0x20) == 0) {
      uint64_t v14 = &stru_1F20141C8;
    }
    uint64_t v93 = v14;
    objc_msgSend_string(v7, v15, v16, v17, v18, v19);
    if (v94) {
      uint64_t v20 = {;
    }
      uint64_t v25 = objc_msgSend_stringByAppendingFormat_(v94, v21, @"%@%@", v22, v23, v24, v93, v20);
    }
    else {
      uint64_t v25 = {;
    }
    }
    uint64_t v32 = objc_msgSend_length(v94, v26, v27, v28, v29, v30);
    uint64_t v38 = objc_msgSend_length(v93, v33, v34, v35, v36, v37);
    v44 = objc_msgSend_string(v7, v39, v40, v41, v42, v43);
    NSUInteger v50 = objc_msgSend_length(v44, v45, v46, v47, v48, v49);

    uint64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v56 = objc_msgSend_length(v25, v51, v52, v53, v54, v55);
    uint64_t v62 = objc_msgSend_length(v25, v57, v58, v59, v60, v61);
    v103.location = 0x7FFFFFFFFFFFFFFFLL;
    v103.length = 0;
    v105.location = 0;
    v105.length = v56;
    uint64_t v63 = phraseMatchingCandidates((NSString *)v25, a3, v103, v105, 3, v62, &v99);
    NSUInteger v64 = v38 + v32;
    v91 = v63;
    if (v99 < v64 || v99 - v64 >= v50)
    {
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v66 = v63;
      uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v95, (uint64_t)v100, 16, v68);
      if (v74)
      {
        uint64_t v75 = *(void *)v96;
        while (2)
        {
          for (uint64_t i = 0; i != v74; ++i)
          {
            if (*(void *)v96 != v75) {
              objc_enumerationMutation(v66);
            }
            uint64_t v77 = *(void **)(*((void *)&v95 + 1) + 8 * i);
            NSUInteger v78 = objc_msgSend_integerValue(v77, length, v70, v71, v72, v73);
            v83 = objc_msgSend_objectForKeyedSubscript_(v66, v79, (uint64_t)v77, v80, v81, v82);
            NSUInteger v89 = objc_msgSend_length(v83, v84, v85, v86, v87, v88);

            v102.location = v64;
            v102.length = v50;
            v104.location = v78;
            v104.length = v89;
            length = (const char *)NSIntersectionRange(v102, v104).length;
            if (length)
            {
              int v65 = 1;
              goto LABEL_21;
            }
          }
          uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, 0, (uint64_t)&v95, (uint64_t)v100, 16, v73);
          if (v74) {
            continue;
          }
          break;
        }
      }
      int v65 = 0;
LABEL_21:
    }
    else
    {
      int v65 = 1;
    }

    BOOL v31 = v65 != 0;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

+ (id)transliterateStringUsingICUTransliterator:(id)a3 _icuTransliterator:(void *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v11 = objc_msgSend_length(v5, v6, v7, v8, v9, v10);
  MEMORY[0x1F4188790](v11);
  char v13 = (char *)&v33 - ((v12 + 17) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend_getCharacters_(v5, v14, (uint64_t)v13, v15, v16, v17);
  *(_WORD *)&v13[2 * objc_msgSend_length(v5, v18, v19, v20, v21, v22)] = 0;
  uint64_t v28 = v5;
  if (a4)
  {
    int v35 = objc_msgSend_length(v5, v23, v24, v25, v26, v27);
    int v36 = v35;
    int v34 = 0;
    utrans_transUChars();
    uint64_t v28 = v5;
    if (v34 <= 0)
    {
      uint64_t v28 = objc_msgSend_stringWithCharacters_length_(NSString, v29, (uint64_t)v13, v36, v30, v31);
    }
  }

  return v28;
}

+ (id)transformString:(id)a3 usingConfusions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_copy(v5, v13, v14, v15, v16, v17);
  objc_msgSend_addObject_(v12, v19, (uint64_t)v18, v20, v21, v22);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C494EBF4;
  v29[3] = &unk_1E64E0F08;
  id v23 = v12;
  id v30 = v23;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v24, (uint64_t)v29, v25, v26, v27);

  return v23;
}

+ (id)transformLatinToCyrillic:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  uint64_t v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v3, v4, v5, v6, v7);
  objc_msgSend_transformString_usingConfusions_(CHLanguageUtilities, v9, (uint64_t)v31, (uint64_t)&unk_1F203CEA0, v10, v11);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v32, (uint64_t)v36, 16, v14);
  if (v20)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v12);
        }
        id v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v15, v16, v17, v18, v19);
        uint64_t v29 = objc_msgSend_rangeOfCharacterFromSet_(v23, v25, (uint64_t)v24, v26, v27, v28);

        if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend_addObject_(v8, v15, (uint64_t)v23, v17, v18, v19);
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v32, (uint64_t)v36, 16, v19);
    }
    while (v20);
  }

  return v8;
}

+ (id)transformCyrillicToLatin:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  uint64_t v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v3, v4, v5, v6, v7);
  objc_msgSend_transformString_usingConfusions_(CHLanguageUtilities, v9, (uint64_t)v31, (uint64_t)&unk_1F203CEC8, v10, v11);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v32, (uint64_t)v36, 16, v14);
  if (v20)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v12);
        }
        id v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E4F28B88], v15, v16, v17, v18, v19);
        uint64_t v29 = objc_msgSend_rangeOfCharacterFromSet_(v23, v25, (uint64_t)v24, v26, v27, v28);

        if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend_addObject_(v8, v15, (uint64_t)v23, v17, v18, v19);
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v32, (uint64_t)v36, 16, v19);
    }
    while (v20);
  }

  return v8;
}

+ (id)performInverseBiDiForNumeric:(id)a3 isRTLContext:(BOOL)a4
{
  BOOL v4 = a4;
  v233[1] = *MEMORY[0x1E4F143B8];
  v218 = (NSString *)a3;
  if (v4) {
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v5, @"0123456789٠١٢٣٤٥٦٧٨٩/.", v6, v7, v8);
  }
  else {
  v217 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v5, @"٠١٢٣٤٥٦٧٨٩/.", v6, v7, v8);
  }
  v215 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v9, @"*+-^=", v10, v11, v12);
  v213 = (NSCharacterSet *)objc_msgSend_mutableCopy(v217, v13, v14, v15, v16, v17);
  objc_msgSend_formUnionWithCharacterSet_(v213, v18, (uint64_t)v215, v19, v20, v21);
  if (isStringEntirelyFromSet(v218, v213) && (unint64_t)objc_msgSend_length(v218, v22, v23, v24, v25, v26) >= 2)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v27 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v27, OS_LOG_TYPE_DEBUG, "performInverseBiDiForNumeric is attempting to rearrange a numeric token", buf, 2u);
    }

    long long v33 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v28, v29, v30, v31, v32);
    v216 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v34, v35, v36, v37, v38);
    unint64_t v44 = 0;
    char v45 = 1;
    while (v44 < objc_msgSend_length(v218, v39, v40, v41, v42, v43))
    {
      uint64_t v51 = objc_msgSend_substringWithRange_(v218, v46, v44, 1, v49, v50);
      uint64_t v56 = objc_msgSend_characterAtIndex_(v51, v52, 0, v53, v54, v55);
      if (objc_msgSend_characterIsMember_(v215, v57, v56, v58, v59, v60))
      {
        if (objc_msgSend_count(v216, v61, v62, v63, v64, v65))
        {
          uint64_t v71 = objc_msgSend_mutableCopy(v216, v66, v67, v68, v69, v70);
          objc_msgSend_addObject_(v33, v72, (uint64_t)v71, v73, v74, v75);
        }
        v233[0] = v51;
        uint64_t v76 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v66, (uint64_t)v233, 1, v69, v70);
        objc_msgSend_addObject_(v33, v77, (uint64_t)v76, v78, v79, v80);

        objc_msgSend_removeAllObjects(v216, v81, v82, v83, v84, v85);
        char v45 = 0;
      }
      else
      {
        uint64_t v86 = objc_msgSend_characterAtIndex_(v51, v61, 0, v63, v64, v65);
        if (objc_msgSend_characterIsMember_(v217, v87, v86, v88, v89, v90))
        {
          if ((v45 & 1) != 0 || !objc_msgSend_count(v216, v91, v92, v93, v94, v95))
          {
            objc_msgSend_addObject_(v216, v91, (uint64_t)v51, v93, v94, v95);
          }
          else if (objc_msgSend_count(v216, v91, v96, v93, v94, v95))
          {
            NSRange v102 = objc_msgSend_mutableCopy(v216, v97, v98, v99, v100, v101);
            objc_msgSend_addObject_(v33, v103, (uint64_t)v102, v104, v105, v106);

            objc_msgSend_removeAllObjects(v216, v107, v108, v109, v110, v111);
          }
          char v45 = 1;
        }
      }

      ++v44;
    }
    if (objc_msgSend_count(v216, v46, v47, v48, v49, v50))
    {
      uint64_t v118 = objc_msgSend_mutableCopy(v216, v113, v114, v115, v116, v117);
      objc_msgSend_addObject_(v33, v119, (uint64_t)v118, v120, v121, v122);
    }
    uint64_t v123 = objc_msgSend_count(v33, v113, v114, v115, v116, v117);
    v214 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v124, v125, v126, v127, v128);
    for (uint64_t i = 0; i < (unint64_t)objc_msgSend_count(v33, v129, v130, v131, v132, v133); ++i)
    {
      uint64_t v135 = objc_msgSend_objectAtIndex_(v33, v129, i, v131, v132, v133);
      uint64_t v140 = objc_msgSend_objectAtIndex_(v135, v136, 0, v137, v138, v139);
      uint64_t v145 = objc_msgSend_characterAtIndex_(v140, v141, 0, v142, v143, v144);
      char IsMember = objc_msgSend_characterIsMember_(v217, v146, v145, v147, v148, v149);

      if (IsMember) {
        break;
      }
    }
    uint64_t v151 = v123 - 1;
    do
    {
      uint64_t v152 = v151;
      if (v151 < i) {
        break;
      }
      uint64_t v153 = objc_msgSend_objectAtIndex_(v33, v129, v151, v131, v132, v133);
      uint64_t v158 = objc_msgSend_objectAtIndex_(v153, v154, 0, v155, v156, v157);
      uint64_t v163 = objc_msgSend_characterAtIndex_(v158, v159, 0, v160, v161, v162);
      char v168 = objc_msgSend_characterIsMember_(v217, v164, v163, v165, v166, v167);

      uint64_t v151 = v152 - 1;
    }
    while ((v168 & 1) == 0);
    if (i == v152)
    {
      uint64_t v112 = v218;
    }
    else
    {
      if (i)
      {
        for (uint64_t j = 0; j != i; ++j)
        {
          v170 = objc_msgSend_objectAtIndex_(v33, v129, j, v131, v132, v133);
          objc_msgSend_addObject_(v214, v171, (uint64_t)v170, v172, v173, v174);
        }
      }
      unint64_t v175 = v152 + 1;
      if (v152 >= i)
      {
        uint64_t v176 = v152 + 1;
        do
        {
          v177 = objc_msgSend_objectAtIndex_(v33, v129, --v176, v131, v132, v133);
          objc_msgSend_addObject_(v214, v178, (uint64_t)v177, v179, v180, v181);
        }
        while (v176 > i);
      }
      while (v175 < objc_msgSend_count(v33, v129, v130, v131, v132, v133))
      {
        v182 = objc_msgSend_objectAtIndex_(v33, v187, v175, v189, v190, v191);
        objc_msgSend_addObject_(v214, v183, (uint64_t)v182, v184, v185, v186);

        ++v175;
      }
      objc_msgSend_string(MEMORY[0x1E4F28E78], v187, v188, v189, v190, v191);
      uint64_t v112 = (NSString *)objc_claimAutoreleasedReturnValue();
      long long v225 = 0u;
      long long v226 = 0u;
      long long v223 = 0u;
      long long v224 = 0u;
      id v192 = v214;
      uint64_t v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(v192, v193, (uint64_t)&v223, (uint64_t)v232, 16, v194);
      if (v195)
      {
        uint64_t v196 = *(void *)v224;
        do
        {
          for (uint64_t k = 0; k != v195; ++k)
          {
            if (*(void *)v224 != v196) {
              objc_enumerationMutation(v192);
            }
            v198 = *(void **)(*((void *)&v223 + 1) + 8 * k);
            long long v219 = 0u;
            long long v220 = 0u;
            long long v221 = 0u;
            long long v222 = 0u;
            id v199 = v198;
            uint64_t v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v200, (uint64_t)&v219, (uint64_t)v231, 16, v201);
            if (v206)
            {
              uint64_t v207 = *(void *)v220;
              do
              {
                for (uint64_t m = 0; m != v206; ++m)
                {
                  if (*(void *)v220 != v207) {
                    objc_enumerationMutation(v199);
                  }
                  objc_msgSend_appendString_(v112, v202, *(void *)(*((void *)&v219 + 1) + 8 * m), v203, v204, v205);
                }
                uint64_t v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v202, (uint64_t)&v219, (uint64_t)v231, 16, v205);
              }
              while (v206);
            }
          }
          uint64_t v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(v192, v209, (uint64_t)&v223, (uint64_t)v232, 16, v210);
        }
        while (v195);
      }

      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v211 = (id)qword_1EA3C9F98;
      if (os_log_type_enabled(v211, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v228 = v218;
        __int16 v229 = 2112;
        v230 = v112;
        _os_log_impl(&dword_1C492D000, v211, OS_LOG_TYPE_DEBUG, "performInverseBiDiForNumeric rearranged numeric string %@ to %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v112 = v218;
  }

  return v112;
}

+ (unsigned)tokenIDForString:(id)a3 withLexicon:(_LXLexicon *)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0xFFEFFFFFFFFFFFFFLL;
  id v7 = a3;
  id v4 = v7;
  LXLexiconEnumerateEntriesForString();
  unsigned int v5 = *((_DWORD *)v10 + 6);

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

+ (BOOL)lexiconHasEntryForString:(id)a3 withLexicon:(_LXLexicon *)a4 outHasMatchingString:(BOOL *)a5
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v6 = a3;
  LXLexiconEnumerateEntriesForString();
  if (a5) {
    *a5 = *((unsigned char *)v10 + 24);
  }
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (double)characterLMLogProbabilityForString:(id)a3 characterLM:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v12 = v6;
  double v13 = 0.0;
  if (v6 && objc_msgSend_lmSPIType(v6, v7, v8, v9, v10, v11) == 2)
  {
    objc_msgSend_languageModel(v12, v14, v15, v16, v17, v18);
    CVNLPLanguageModelLogJointProbability();
    double v13 = v19;
  }

  return v13;
}

+ (BOOL)isMecabraConversionCandidateAllowed:(id)a3
{
  v3 = (NSString *)a3;
  if (qword_1EA3C8FF8 != -1) {
    dispatch_once(&qword_1EA3C8FF8, &unk_1F2013450);
  }
  BOOL v4 = isStringEntirelyFromSet(v3, (NSCharacterSet *)qword_1EA3C9000);

  return v4;
}

+ (id)mecabraTokenizationAndKanaConversionForString:(id)a3 mecabraEngine:(__Mecabra *)a4 contextRef:(__MecabraContext *)a5 leftCandidateRef:(void *)a6 alternativeCandidateLimit:(int64_t)a7
{
  id v10 = a3;
  MecabraContextAddCandidate();
  if (MecabraAnalyzeStringWithContext()
    && (NextCandidate = (void *)MecabraGetNextCandidate(), (char v12 = NextCandidate) != 0))
  {
    id v13 = NextCandidate;
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17, v18);
    id v106 = (id)objc_claimAutoreleasedReturnValue();
    int WordCount = MecabraCandidateGetWordCount();
    _NSRange v103 = a5;
    if (WordCount < 1)
    {
      uint64_t v72 = 0;
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v107 = 0;
      int64_t v104 = a7;
      uint64_t v105 = WordCount;
      do
      {
        uint64_t v110 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v20, v21, v22, v23, v24, v103);
        objc_msgSend_addObject_(v106, v27, (uint64_t)v110, v28, v29, v30);
        uint64_t NextPhraseBoundary = MecabraCandidateGetNextPhraseBoundary();
        uint64_t v35 = NextPhraseBoundary;
        if (v26 <= NextPhraseBoundary)
        {
          LOBYTE(v37) = 0;
          uint64_t v36 = 0;
          uint64_t v109 = NextPhraseBoundary + 1;
          while (1)
          {
            unsigned int WordReadingLengthAtIndex = MecabraCandidateGetWordReadingLengthAtIndex();
            int v37 = (v37 & 1) != 0 ? 1 : MecabraCandidateHasAlternativeSurfaceFormForWordAtIndex();
            v36 += WordReadingLengthAtIndex;
            uint64_t v49 = v36 + v25;
            if (v36 + v25 < (unint64_t)objc_msgSend_length(v10, v38, v39, v40, v41, v42))
            {
              uint64_t v108 = v36;
              uint64_t v50 = v10;
              uint64_t v51 = a4;
              uint64_t v52 = objc_msgSend_ch_basicAlphanumericCharacterSet(MEMORY[0x1E4F28B88], v44, v45, v46, v47, v48);
              uint64_t v57 = objc_msgSend_characterAtIndex_(v50, v53, v49 - 1, v54, v55, v56);
              uint64_t v62 = objc_msgSend_characterAtIndex_(v50, v58, v49, v59, v60, v61);
              LODWORD(v57) = objc_msgSend_characterIsMember_(v52, v63, v57, v64, v65, v66);
              LODWORD(v62) = objc_msgSend_characterIsMember_(v52, v67, v62, v68, v69, v70);

              BOOL v71 = v57 == v62;
              a4 = v51;
              id v10 = v50;
              uint64_t v36 = v108;
              if (!v71) {
                break;
              }
            }
            if (v109 == ++v26) {
              goto LABEL_17;
            }
          }
          uint64_t v35 = v26;
LABEL_17:
          a7 = v104;
          objc_msgSend_substringWithRange_(v10, v44, v25, v36, v47, v48);
        }
        else
        {
          uint64_t v36 = 0;
          int v37 = 0;
          objc_msgSend_substringWithRange_(v10, v32, v25, 0, v33, v34);
        uint64_t v72 = };
        objc_msgSend_addObject_(v110, v73, (uint64_t)v72, v74, v75, v76);
        if (v37)
        {
          MecabraContextCreateMutable();
          if (v107)
          {
            CandidateFromContextString = (void *)MecabraCreateCandidateFromContextString();
            MecabraContextAddCandidate();
          }
          if (MecabraAnalyzeStringWithContext())
          {
            while (MecabraGetNextCandidate()
                 && objc_msgSend_count(v110, v78, v79, v80, v81, v82) <= (unint64_t)a7)
            {
              uint64_t v83 = MecabraCandidateGetSurface();
              if (objc_msgSend_length(v83, v84, v85, v86, v87, v88))
              {
                if ((objc_msgSend_isEqualToString_(v83, v89, (uint64_t)v72, v90, v91, v92) & 1) == 0)
                {
                  uint64_t v93 = objc_opt_class();
                  if (objc_msgSend_isMecabraConversionCandidateAllowed_(v93, v94, (uint64_t)v83, v95, v96, v97))objc_msgSend_addObject_(v110, v98, (uint64_t)v83, v99, v100, v101); {
                }
                  }
              }
            }
          }
          MecabraContextRelease();
        }
        uint64_t v26 = v35 + 1;
        v25 += v36;

        uint64_t v107 = v72;
      }
      while (v35 + 1 < v105);
    }
  }
  else
  {
    id v106 = 0;
  }
  MecabraContextGetCandidateCount();
  MecabraContextRemoveCandidatesInRange();

  return v106;
}

+ (BOOL)shouldCapitalizeGivenHistory:(id)a3 shouldAutoCapitalizeSetting:(BOOL)a4 locale:(id)a5
{
  BOOL v6 = a4;
  v81[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v13 = a5;
  if (v6)
  {
    uint64_t v14 = objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v8, v9, v10, v11, v12);
    objc_msgSend_rangeOfCharacterFromSet_(v7, v15, (uint64_t)v14, v16, v17, v18);
    uint64_t v20 = v19;
    uint64_t v25 = objc_msgSend_length(v7, v19, v21, v22, v23, v24);

    BOOL v36 = 1;
    if (objc_msgSend_length(v7, v26, v27, v28, v29, v30) && v20 != (const char *)v25)
    {
      uint64_t v76 = 0;
      uint64_t v77 = &v76;
      uint64_t v78 = 0x2020000000;
      char v79 = 0;
      uint64_t v37 = objc_msgSend_length(v7, v31, v32, v33, v34, v35);
      uint64_t v38 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v44 = objc_msgSend_localeIdentifier(v13, v39, v40, v41, v42, v43);
      uint64_t v49 = objc_msgSend_arrayWithObjects_(v38, v45, (uint64_t)v44, v46, v47, v48, 0);

      if (qword_1EA3C9D08 != -1) {
        dispatch_once(&qword_1EA3C9D08, &unk_1F2013470);
      }
      uint64_t v55 = objc_msgSend_localeIdentifier(v13, v50, v51, v52, v53, v54);
      uint64_t v80 = v55;
      v81[0] = v49;
      uint64_t v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v56, (uint64_t)v81, (uint64_t)&v80, 1, v57);

      if (v37)
      {
        uint64_t v64 = (void *)MEMORY[0x1E4F28F28];
        uint64_t v65 = objc_msgSend_localeIdentifier(v13, v59, v60, v61, v62, v63);
        uint64_t v69 = objc_msgSend_orthographyWithDominantScript_languageMap_(v64, v66, (uint64_t)v65, (uint64_t)v58, v67, v68);
        uint64_t v70 = *MEMORY[0x1E4F28520];
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = sub_1C4950A80;
        v73[3] = &unk_1E64E0F80;
        uint64_t v75 = &v76;
        id v74 = v7;
        objc_msgSend_enumerateLinguisticTagsInRange_scheme_options_orthography_usingBlock_(v74, v71, 0, v37, v70, 0, v69, v73);
      }
      BOOL v36 = *((unsigned char *)v77 + 24) != 0;

      _Block_object_dispose(&v76, 8);
    }
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

+ (double)computeEditPenalizationFromString:(id)a3 toReferenceString:(id)a4 withSuffix:(id)a5 withCaseSensitivity:(BOOL)a6 withFirstLetterCaseSensitivity:(BOOL)a7 withDiacriticSensitivity:(BOOL)a8 withDiacriticsCharSet:(id)a9 withConsumableStrokesCharSet:(id)a10 outputSuffix:(id *)a11 lexiconExtraCharacters:(id *)a12 firstLetterCaseFlipped:(BOOL *)a13
{
  BOOL v349 = a8;
  BOOL v343 = a6;
  BOOL v344 = a7;
  id v15 = a3;
  id v16 = a4;
  id v346 = a5;
  id v351 = a9;
  id v354 = a10;
  v355 = v16;
  v361 = 0;
  v362 = 0;
  v363 = 0;
  id v353 = v15;
  uint64_t v20 = objc_msgSend_codepointAtIndex_outRange_(v16, v17, 0, (uint64_t)&v359, v18, v19);
  uint64_t v24 = objc_msgSend_codepointAtIndex_outRange_(v15, v21, 0, (uint64_t)&v357, v22, v23);
  v352 = objc_msgSend_string(MEMORY[0x1E4F28E78], v25, v26, v27, v28, v29);
  uint64_t v350 = 0;
  uint64_t v347 = 0;
  uint64_t v345 = 0;
  BOOL v35 = v349;
  if (!v351) {
    BOOL v35 = 0;
  }
  BOOL v348 = v35;
  *a13 = 0;
  while (1)
  {
    if (!(v20 | v24))
    {
LABEL_241:
      uint64_t v288 = v362 - v361;
      if (v362 == v361)
      {
        int v300 = 0;
        signed int v301 = 0;
        v292 = v346;
        v293 = v354;
      }
      else
      {
        uint64_t v289 = v288 >> 2;
        unint64_t v290 = (v288 >> 2) - 1;
        if ((unint64_t)(v288 >> 2) <= 1) {
          uint64_t v289 = 1;
        }
        int v291 = *(_DWORD *)v361;
        v292 = v346;
        v293 = v354;
        if (v288 >> 2 == 1) {
          int v294 = 0;
        }
        else {
          int v294 = *((_DWORD *)v361 + 1);
        }
        if (v291 >= 0) {
          unsigned int v302 = *(_DWORD *)v361;
        }
        else {
          unsigned int v302 = -v291;
        }
        int v303 = v294 + v291;
        if (v303 < 0) {
          int v303 = -v303;
        }
        if (v302 >= v303) {
          int v300 = v303;
        }
        else {
          int v300 = v302;
        }
        if ((unint64_t)v288 >= 8)
        {
          uint64_t v332 = 0;
          uint64_t v333 = v289 - 1;
          do
          {
            uint64_t v340 = v332 + 1;
            v341 = &v361[4 * v332];
            if (v290 > v332 + 1) {
              int v334 = *((_DWORD *)v341 + 2);
            }
            else {
              int v334 = 0;
            }
            int v335 = *(_DWORD *)&v361[4 * v332];
            int v336 = *((_DWORD *)v341 + 1);
            if (v336 >= 0) {
              unsigned int v337 = v336;
            }
            else {
              unsigned int v337 = -v336;
            }
            int v338 = v336 + v335;
            if (v338 < 0) {
              int v338 = -v338;
            }
            int v339 = v334 + v336;
            if (v339 < 0) {
              int v339 = -v339;
            }
            if (v338 >= v339) {
              int v338 = v339;
            }
            if (v337 >= v338) {
              signed int v301 = v338;
            }
            else {
              signed int v301 = v337;
            }
            v300 += v301;
            uint64_t v332 = v340;
          }
          while (v333 != v340);
        }
        else
        {
          signed int v301 = v300;
        }
      }
      int v304 = *((_DWORD *)v362 - 1);
      unint64_t v306 = 0;
      if (objc_msgSend_length(v292, v30, v31, v32, v33, v34, v342) && v304 < 0 && v301)
      {
        unint64_t v306 = 0;
        int v307 = 0;
        do
        {
          uint64_t v308 = objc_msgSend_codepointAtIndex_outRange_(v292, v30, v306, (uint64_t)v356, v33, v34);
          if (objc_msgSend_characterIsMember_(v293, v309, (unsigned __int16)v308, v310, v311, v312)
            && (int v318 = objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v313, v308, v315, v316, v317), v301 >= v307 + v318))
          {
            unint64_t v306 = v356[1] + v356[0];
            char v319 = 1;
            v307 += v318;
          }
          else
          {
            char v319 = 0;
          }
          if (v306 < objc_msgSend_length(v292, v313, v314, v315, v316, v317)) {
            char v320 = v319;
          }
          else {
            char v320 = 0;
          }
        }
        while ((v320 & 1) != 0);
        if (v307 >= 1)
        {
          if (v304 >= 0) {
            unsigned int v321 = v304;
          }
          else {
            unsigned int v321 = -v304;
          }
          unsigned int v322 = v307 + v304;
          if (v307 + v304 < 0) {
            unsigned int v322 = -v322;
          }
          if (v321 >= v322) {
            unsigned int v321 = v322;
          }
          int v300 = v300 - v301 + v321;
        }
      }
      if (v300 >= 0) {
        uint64_t v323 = v300;
      }
      else {
        uint64_t v323 = -v300;
      }
      uint64_t v324 = v347;
      if (v347 < 0) {
        uint64_t v324 = -v347;
      }
      uint64_t v325 = v324 + v345;
      if (!v349) {
        uint64_t v325 = 0;
      }
      uint64_t v326 = v350;
      if (!v343) {
        uint64_t v326 = 0;
      }
      double v296 = (double)(v325 + v326 + v323);
      if (!a11)
      {
        v295 = 0;
        v298 = a12;
        if (!a12) {
          goto LABEL_295;
        }
LABEL_248:
        objc_msgSend_stringWithString_(NSString, v30, (uint64_t)v352, v32, v33, v34, v342);
        id *v298 = (id)objc_claimAutoreleasedReturnValue();

        v299 = v361;
        if (!v361) {
          goto LABEL_297;
        }
        goto LABEL_296;
      }
      uint64_t v327 = objc_msgSend_length(v292, v30, v305, v32, v33, v34);
      objc_msgSend_substringWithRange_(v292, v328, v306, v327 - v306, v329, v330);
      v295 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v297 = a11;
LABEL_294:
      v295 = v295;
      id *v297 = v295;
      v298 = a12;
      if (!a12) {
        goto LABEL_295;
      }
      goto LABEL_248;
    }
    if (!v360)
    {
      if (!objc_msgSend_characterIsMember_(v354, v30, (unsigned __int16)v24, v32, v33, v34)) {
        goto LABEL_160;
      }
      int v60 = objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v30, v24, v32, v33, v34);
      int v61 = v60;
      uint64_t v62 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v60;
        uint64_t v63 = (uint64_t)(v62 + 4);
LABEL_80:
        char v125 = 0;
        v362 = (char *)v63;
        id v15 = v353;
        goto LABEL_161;
      }
      uint64_t v90 = v361;
      uint64_t v91 = (v362 - v361) >> 2;
      unint64_t v92 = v91 + 1;
      if ((unint64_t)(v91 + 1) >> 62) {
        sub_1C494A220();
      }
      uint64_t v93 = v363 - v361;
      if ((v363 - v361) >> 1 > v92) {
        unint64_t v92 = v93 >> 1;
      }
      if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v94 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v94 = v92;
      }
      if (v94)
      {
        if (v94 >> 62) {
          sub_1C4949AA8();
        }
        uint64_t v95 = operator new(4 * v94);
        uint64_t v96 = &v95[4 * v91];
        *(_DWORD *)uint64_t v96 = v61;
        uint64_t v63 = (uint64_t)(v96 + 4);
        int64_t v97 = v62 - v90;
        if (v62 == v90) {
          goto LABEL_78;
        }
      }
      else
      {
        uint64_t v95 = 0;
        uint64_t v96 = (char *)(4 * v91);
        *(_DWORD *)(4 * v91) = v61;
        uint64_t v63 = 4 * v91 + 4;
        int64_t v97 = v62 - v90;
        if (v62 == v90)
        {
LABEL_78:
          v361 = v96;
          v362 = (char *)v63;
          v363 = &v95[4 * v94];
          if (v90) {
            operator delete(v90);
          }
          goto LABEL_80;
        }
      }
      unint64_t v126 = v97 - 4;
      if (v126 < 0x2C) {
        goto LABEL_337;
      }
      if ((unint64_t)(v90 - v95) < 0x20) {
        goto LABEL_337;
      }
      uint64_t v127 = (v126 >> 2) + 1;
      uint64_t v128 = 4 * (v127 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v129 = &v62[-v128];
      v96 -= v128;
      uint64_t v130 = &v95[4 * v91 - 16];
      uint64_t v131 = v62 - 16;
      uint64_t v132 = v127 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v133 = *(_OWORD *)v131;
        *(v130 - 1) = *((_OWORD *)v131 - 1);
        *uint64_t v130 = v133;
        v130 -= 2;
        v131 -= 32;
        v132 -= 8;
      }
      while (v132);
      uint64_t v62 = v129;
      if (v127 != (v127 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_337:
        do
        {
          int v134 = *((_DWORD *)v62 - 1);
          v62 -= 4;
          *((_DWORD *)v96 - 1) = v134;
          v96 -= 4;
        }
        while (v62 != v90);
      }
      goto LABEL_78;
    }
    if (!v358)
    {
      if (!objc_msgSend_characterIsMember_(v354, v30, (unsigned __int16)v20, v32, v33, v34))
      {
LABEL_117:
        uint64_t v48 = unicodeToNSString(v20, v64, v65, v66, v67, v68);
        objc_msgSend_appendString_(v352, v172, (uint64_t)v48, v173, v174, v175);
        char v125 = 0;
        int v152 = 0;
        goto LABEL_133;
      }
      int v69 = -(int)objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v64, v20, v66, v67, v68);
      uint64_t v70 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v69;
        uint64_t v71 = (uint64_t)(v70 + 4);
LABEL_116:
        v362 = (char *)v71;
        id v15 = v353;
        goto LABEL_117;
      }
      uint64_t v101 = v361;
      uint64_t v102 = (v362 - v361) >> 2;
      unint64_t v103 = v102 + 1;
      if ((unint64_t)(v102 + 1) >> 62) {
        sub_1C494A220();
      }
      uint64_t v104 = v363 - v361;
      if ((v363 - v361) >> 1 > v103) {
        unint64_t v103 = v104 >> 1;
      }
      if ((unint64_t)v104 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v105 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v105 = v103;
      }
      if (v105)
      {
        if (v105 >> 62) {
          sub_1C4949AA8();
        }
        id v106 = operator new(4 * v105);
        uint64_t v107 = (int *)&v106[4 * v102];
        *uint64_t v107 = v69;
        uint64_t v71 = (uint64_t)(v107 + 1);
        int64_t v108 = v70 - v101;
        if (v70 == v101) {
          goto LABEL_114;
        }
      }
      else
      {
        id v106 = 0;
        uint64_t v107 = (int *)(4 * v102);
        *(_DWORD *)(4 * v102) = v69;
        uint64_t v71 = 4 * v102 + 4;
        int64_t v108 = v70 - v101;
        if (v70 == v101)
        {
LABEL_114:
          v361 = (char *)v107;
          v362 = (char *)v71;
          v363 = &v106[4 * v105];
          if (v101) {
            operator delete(v101);
          }
          goto LABEL_116;
        }
      }
      unint64_t v163 = v108 - 4;
      if (v163 < 0x2C) {
        goto LABEL_338;
      }
      if ((unint64_t)(v101 - v106) < 0x20) {
        goto LABEL_338;
      }
      uint64_t v164 = (v163 >> 2) + 1;
      uint64_t v165 = 4 * (v164 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v166 = &v70[-v165];
      uint64_t v107 = (int *)((char *)v107 - v165);
      uint64_t v167 = &v106[4 * v102 - 16];
      char v168 = v70 - 16;
      uint64_t v169 = v164 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v170 = *(_OWORD *)v168;
        *(v167 - 1) = *((_OWORD *)v168 - 1);
        *uint64_t v167 = v170;
        v167 -= 2;
        v168 -= 32;
        v169 -= 8;
      }
      while (v169);
      uint64_t v70 = v166;
      if (v164 != (v164 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_338:
        do
        {
          int v171 = *((_DWORD *)v70 - 1);
          v70 -= 4;
          *--uint64_t v107 = v171;
        }
        while (v70 != v101);
      }
      goto LABEL_114;
    }
    int v37 = objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v30, v24, v32, v33, v34);
    int v42 = objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v38, v20, v39, v40, v41);
    uint64_t v48 = unicodeToNSString(v24, v43, v44, v45, v46, v47);
    uint64_t v57 = unicodeToNSString(v20, v49, v50, v51, v52, v53);
    if (v24 == v20)
    {
      uint64_t v58 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = 0;
        uint64_t v59 = (uint64_t)(v58 + 4);
LABEL_70:
        char v125 = 0;
LABEL_129:
        v362 = (char *)v59;
LABEL_130:
        int v152 = 1;
        goto LABEL_131;
      }
      uint64_t v82 = v361;
      uint64_t v83 = (v362 - v361) >> 2;
      unint64_t v84 = v83 + 1;
      if ((unint64_t)(v83 + 1) >> 62) {
        sub_1C494A220();
      }
      uint64_t v85 = v363 - v361;
      if ((v363 - v361) >> 1 > v84) {
        unint64_t v84 = v85 >> 1;
      }
      if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v86 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v86 = v84;
      }
      if (v86)
      {
        if (v86 >> 62) {
          sub_1C4949AA8();
        }
        uint64_t v87 = operator new(4 * v86);
        uint64_t v88 = &v87[4 * v83];
        *(_DWORD *)uint64_t v88 = 0;
        uint64_t v59 = (uint64_t)(v88 + 4);
        int64_t v89 = v58 - v82;
        if (v58 == v82) {
          goto LABEL_68;
        }
      }
      else
      {
        uint64_t v87 = 0;
        uint64_t v88 = (char *)(4 * v83);
        *(_DWORD *)(4 * v83) = 0;
        uint64_t v59 = 4 * v83 + 4;
        int64_t v89 = v58 - v82;
        if (v58 == v82)
        {
LABEL_68:
          v361 = v88;
          v362 = (char *)v59;
          v363 = &v87[4 * v86];
          if (v82) {
            operator delete(v82);
          }
          goto LABEL_70;
        }
      }
      unint64_t v116 = v89 - 4;
      if (v116 < 0x2C) {
        goto LABEL_339;
      }
      if ((unint64_t)(v82 - v87) < 0x20) {
        goto LABEL_339;
      }
      uint64_t v117 = (v116 >> 2) + 1;
      uint64_t v118 = 4 * (v117 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v119 = &v58[-v118];
      v88 -= v118;
      uint64_t v120 = &v87[4 * v83 - 16];
      uint64_t v121 = v58 - 16;
      uint64_t v122 = v117 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v123 = *(_OWORD *)v121;
        *(v120 - 1) = *((_OWORD *)v121 - 1);
        _OWORD *v120 = v123;
        v120 -= 2;
        v121 -= 32;
        v122 -= 8;
      }
      while (v122);
      uint64_t v58 = v119;
      if (v117 != (v117 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_339:
        do
        {
          int v124 = *((_DWORD *)v58 - 1);
          v58 -= 4;
          *((_DWORD *)v88 - 1) = v124;
          v88 -= 4;
        }
        while (v58 != v82);
      }
      goto LABEL_68;
    }
    if (!objc_msgSend_compare_options_(v48, v54, (uint64_t)v57, 1, v55, v56))
    {
      if (v359)
      {
        uint64_t v98 = 1;
        uint64_t v100 = v362;
        uint64_t v99 = v363;
        if (v362 < v363) {
          goto LABEL_47;
        }
LABEL_82:
        uint64_t v135 = v361;
        uint64_t v136 = (v100 - v361) >> 2;
        unint64_t v137 = v136 + 1;
        if ((unint64_t)(v136 + 1) >> 62) {
          sub_1C494A220();
        }
        uint64_t v138 = v99 - v361;
        if (v138 >> 1 > v137) {
          unint64_t v137 = v138 >> 1;
        }
        if ((unint64_t)v138 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v139 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v139 = v137;
        }
        uint64_t v342 = v98;
        if (v139)
        {
          if (v139 >> 62) {
            sub_1C4949AA8();
          }
          uint64_t v140 = operator new(4 * v139);
          uint64_t v141 = &v140[4 * v136];
          *(_DWORD *)uint64_t v141 = 0;
          uint64_t v59 = (uint64_t)(v141 + 4);
          int64_t v142 = v100 - v135;
          if (v100 == v135)
          {
LABEL_125:
            v361 = v141;
            v362 = (char *)v59;
            v363 = &v140[4 * v139];
            if (v135) {
              operator delete(v135);
            }
            uint64_t v98 = v342;
            goto LABEL_128;
          }
        }
        else
        {
          uint64_t v140 = 0;
          uint64_t v141 = (char *)(4 * v136);
          *(_DWORD *)(4 * v136) = 0;
          uint64_t v59 = 4 * v136 + 4;
          int64_t v142 = v100 - v135;
          if (v100 == v135) {
            goto LABEL_125;
          }
        }
        unint64_t v176 = v142 - 4;
        if (v176 < 0x2C) {
          goto LABEL_340;
        }
        if ((unint64_t)(v135 - v140) < 0x20) {
          goto LABEL_340;
        }
        uint64_t v177 = (v176 >> 2) + 1;
        uint64_t v178 = 4 * (v177 & 0x7FFFFFFFFFFFFFF8);
        uint64_t v179 = &v100[-v178];
        v141 -= v178;
        uint64_t v180 = &v140[4 * v136 - 16];
        uint64_t v181 = v100 - 16;
        uint64_t v182 = v177 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v183 = *(_OWORD *)v181;
          *(v180 - 1) = *((_OWORD *)v181 - 1);
          *uint64_t v180 = v183;
          v180 -= 2;
          v181 -= 32;
          v182 -= 8;
        }
        while (v182);
        uint64_t v100 = v179;
        if (v177 != (v177 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_340:
          do
          {
            int v184 = *((_DWORD *)v100 - 1);
            v100 -= 4;
            *((_DWORD *)v141 - 1) = v184;
            v141 -= 4;
          }
          while (v100 != v135);
        }
        goto LABEL_125;
      }
      *a13 = 1;
      uint64_t v98 = v344;
      uint64_t v100 = v362;
      uint64_t v99 = v363;
      if (v362 >= v363) {
        goto LABEL_82;
      }
LABEL_47:
      *(_DWORD *)uint64_t v100 = 0;
      uint64_t v59 = (uint64_t)(v100 + 4);
LABEL_128:
      char v125 = 0;
      v350 += v98;
      goto LABEL_129;
    }
    if (v348 && !objc_msgSend_compare_options_(v48, v72, (uint64_t)v57, 129, v74, v75))
    {
      int IsMember = objc_msgSend_characterIsMember_(v351, v72, (unsigned __int16)v24, v73, v74, v75);
      int v158 = objc_msgSend_characterIsMember_(v351, v154, (unsigned __int16)v20, v155, v156, v157);
      if ((IsMember ^ 1 | v158))
      {
        char v159 = IsMember | v158 ^ 1;
        int v160 = v37 - v42;
        uint64_t v161 = v362;
        if (v159)
        {
          if (v362 >= v363)
          {
            v245 = v361;
            uint64_t v246 = (v362 - v361) >> 2;
            unint64_t v247 = v246 + 1;
            if ((unint64_t)(v246 + 1) >> 62) {
              sub_1C494A220();
            }
            uint64_t v248 = v363 - v361;
            if ((v363 - v361) >> 1 > v247) {
              unint64_t v247 = v248 >> 1;
            }
            if ((unint64_t)v248 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v249 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v249 = v247;
            }
            if (v249)
            {
              if (v249 >> 62) {
                sub_1C4949AA8();
              }
              unint64_t v250 = v249;
              v251 = operator new(4 * v249);
              unint64_t v249 = v250;
            }
            else
            {
              v251 = 0;
            }
            v268 = &v251[4 * v246];
            *(_DWORD *)v268 = v160;
            uint64_t v162 = v268 + 4;
            if (v161 == v245)
            {
              id v15 = v353;
            }
            else
            {
              unint64_t v269 = v161 - v245 - 4;
              id v15 = v353;
              if (v269 < 0x2C) {
                goto LABEL_341;
              }
              if ((unint64_t)(v245 - v251) < 0x20) {
                goto LABEL_341;
              }
              uint64_t v270 = (v269 >> 2) + 1;
              uint64_t v271 = 4 * (v270 & 0x7FFFFFFFFFFFFFF8);
              v272 = &v161[-v271];
              v268 -= v271;
              v273 = &v251[4 * v246 - 16];
              v274 = v161 - 16;
              uint64_t v275 = v270 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                long long v276 = *(_OWORD *)v274;
                *(v273 - 1) = *((_OWORD *)v274 - 1);
                _OWORD *v273 = v276;
                v273 -= 2;
                v274 -= 32;
                v275 -= 8;
              }
              while (v275);
              uint64_t v161 = v272;
              if (v270 != (v270 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_341:
                do
                {
                  int v277 = *((_DWORD *)v161 - 1);
                  v161 -= 4;
                  *((_DWORD *)v268 - 1) = v277;
                  v268 -= 4;
                }
                while (v161 != v245);
              }
            }
            v361 = v268;
            v362 = v162;
            v363 = &v251[4 * v249];
            if (v245) {
              operator delete(v245);
            }
          }
          else
          {
            *(_DWORD *)v362 = v160;
            uint64_t v162 = v161 + 4;
            id v15 = v353;
          }
          char v125 = 0;
          v362 = v162;
          ++v345;
          int v152 = 1;
        }
        else
        {
          if (v362 >= v363)
          {
            v252 = v361;
            uint64_t v253 = (v362 - v361) >> 2;
            unint64_t v254 = v253 + 1;
            if ((unint64_t)(v253 + 1) >> 62) {
              sub_1C494A220();
            }
            uint64_t v255 = v363 - v361;
            if ((v363 - v361) >> 1 > v254) {
              unint64_t v254 = v255 >> 1;
            }
            if ((unint64_t)v255 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v256 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v256 = v254;
            }
            if (v256)
            {
              if (v256 >> 62) {
                sub_1C4949AA8();
              }
              unint64_t v257 = v256;
              v258 = operator new(4 * v256);
              unint64_t v256 = v257;
            }
            else
            {
              v258 = 0;
            }
            v278 = &v258[4 * v253];
            *(_DWORD *)v278 = v160;
            long long v226 = v278 + 4;
            if (v161 == v252)
            {
              id v15 = v353;
            }
            else
            {
              unint64_t v279 = v161 - v252 - 4;
              id v15 = v353;
              if (v279 < 0x2C) {
                goto LABEL_342;
              }
              if ((unint64_t)(v252 - v258) < 0x20) {
                goto LABEL_342;
              }
              uint64_t v280 = (v279 >> 2) + 1;
              uint64_t v281 = 4 * (v280 & 0x7FFFFFFFFFFFFFF8);
              v282 = &v161[-v281];
              v278 -= v281;
              v283 = &v258[4 * v253 - 16];
              v284 = v161 - 16;
              uint64_t v285 = v280 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                long long v286 = *(_OWORD *)v284;
                *(v283 - 1) = *((_OWORD *)v284 - 1);
                _OWORD *v283 = v286;
                v283 -= 2;
                v284 -= 32;
                v285 -= 8;
              }
              while (v285);
              uint64_t v161 = v282;
              if (v280 != (v280 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_342:
                do
                {
                  int v287 = *((_DWORD *)v161 - 1);
                  v161 -= 4;
                  *((_DWORD *)v278 - 1) = v287;
                  v278 -= 4;
                }
                while (v161 != v252);
              }
            }
            v361 = v278;
            v362 = v226;
            v363 = &v258[4 * v256];
            if (v252) {
              operator delete(v252);
            }
          }
          else
          {
            *(_DWORD *)v362 = v160;
            long long v226 = v161 + 4;
            id v15 = v353;
          }
          char v125 = 0;
          v362 = v226;
          --v347;
          int v152 = 1;
        }
        goto LABEL_132;
      }
      int v206 = v37 - v42;
      uint64_t v207 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v206;
        uint64_t v208 = (uint64_t)(v207 + 4);
LABEL_214:
        char v125 = 0;
        v362 = (char *)v208;
        ++v347;
        goto LABEL_130;
      }
      v227 = v361;
      uint64_t v228 = (v362 - v361) >> 2;
      unint64_t v229 = v228 + 1;
      if ((unint64_t)(v228 + 1) >> 62) {
        sub_1C494A220();
      }
      uint64_t v230 = v363 - v361;
      if ((v363 - v361) >> 1 > v229) {
        unint64_t v229 = v230 >> 1;
      }
      if ((unint64_t)v230 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v231 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v231 = v229;
      }
      if (v231)
      {
        if (v231 >> 62) {
          sub_1C4949AA8();
        }
        unint64_t v232 = v231;
        v233 = operator new(4 * v231);
        unint64_t v231 = v232;
        v234 = &v233[4 * v228];
        *(_DWORD *)v234 = v206;
        uint64_t v208 = (uint64_t)(v234 + 4);
        int64_t v235 = v207 - v227;
        if (v207 == v227) {
          goto LABEL_212;
        }
LABEL_206:
        unint64_t v259 = v235 - 4;
        if (v259 < 0x2C) {
          goto LABEL_343;
        }
        if ((unint64_t)(v227 - v233) < 0x20) {
          goto LABEL_343;
        }
        uint64_t v260 = (v259 >> 2) + 1;
        uint64_t v261 = 4 * (v260 & 0x7FFFFFFFFFFFFFF8);
        v262 = &v207[-v261];
        v234 -= v261;
        v263 = &v233[4 * v228 - 16];
        v264 = v207 - 16;
        uint64_t v265 = v260 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v266 = *(_OWORD *)v264;
          *(v263 - 1) = *((_OWORD *)v264 - 1);
          _OWORD *v263 = v266;
          v263 -= 2;
          v264 -= 32;
          v265 -= 8;
        }
        while (v265);
        uint64_t v207 = v262;
        if (v260 != (v260 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_343:
          do
          {
            int v267 = *((_DWORD *)v207 - 1);
            v207 -= 4;
            *((_DWORD *)v234 - 1) = v267;
            v234 -= 4;
          }
          while (v207 != v227);
        }
      }
      else
      {
        v233 = 0;
        v234 = (char *)(4 * v228);
        *(_DWORD *)(4 * v228) = v206;
        uint64_t v208 = 4 * v228 + 4;
        int64_t v235 = v207 - v227;
        if (v207 != v227) {
          goto LABEL_206;
        }
      }
LABEL_212:
      v361 = v234;
      v362 = (char *)v208;
      v363 = &v233[4 * v231];
      if (v227) {
        operator delete(v227);
      }
      goto LABEL_214;
    }
    if (objc_msgSend_characterIsMember_(v354, v72, (unsigned __int16)v24, v73, v74, v75, v342))
    {
      uint64_t v80 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v37;
        uint64_t v81 = (uint64_t)(v80 + 4);
        goto LABEL_159;
      }
      uint64_t v143 = v361;
      uint64_t v144 = (v362 - v361) >> 2;
      unint64_t v145 = v144 + 1;
      if ((unint64_t)(v144 + 1) >> 62) {
        sub_1C494A220();
      }
      uint64_t v146 = v363 - v361;
      if ((v363 - v361) >> 1 > v145) {
        unint64_t v145 = v146 >> 1;
      }
      if ((unint64_t)v146 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v147 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v147 = v145;
      }
      if (v147)
      {
        if (v147 >> 62) {
          sub_1C4949AA8();
        }
        unint64_t v148 = v147;
        uint64_t v149 = operator new(4 * v147);
        unint64_t v147 = v148;
        uint64_t v150 = &v149[4 * v144];
        *(_DWORD *)uint64_t v150 = v37;
        uint64_t v81 = (uint64_t)(v150 + 4);
        int64_t v151 = v80 - v143;
        if (v80 == v143) {
          goto LABEL_157;
        }
LABEL_151:
        unint64_t v209 = v151 - 4;
        if (v209 < 0x2C) {
          goto LABEL_344;
        }
        if ((unint64_t)(v143 - v149) < 0x20) {
          goto LABEL_344;
        }
        uint64_t v210 = (v209 >> 2) + 1;
        uint64_t v211 = 4 * (v210 & 0x7FFFFFFFFFFFFFF8);
        v212 = &v80[-v211];
        v150 -= v211;
        v213 = &v149[4 * v144 - 16];
        v214 = v80 - 16;
        uint64_t v215 = v210 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v216 = *(_OWORD *)v214;
          *(v213 - 1) = *((_OWORD *)v214 - 1);
          _OWORD *v213 = v216;
          v213 -= 2;
          v214 -= 32;
          v215 -= 8;
        }
        while (v215);
        uint64_t v80 = v212;
        if (v210 != (v210 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_344:
          do
          {
            int v217 = *((_DWORD *)v80 - 1);
            v80 -= 4;
            *((_DWORD *)v150 - 1) = v217;
            v150 -= 4;
          }
          while (v80 != v143);
        }
      }
      else
      {
        uint64_t v149 = 0;
        uint64_t v150 = (char *)(4 * v144);
        *(_DWORD *)(4 * v144) = v37;
        uint64_t v81 = 4 * v144 + 4;
        int64_t v151 = v80 - v143;
        if (v80 != v143) {
          goto LABEL_151;
        }
      }
LABEL_157:
      v361 = v150;
      v362 = (char *)v81;
      v363 = &v149[4 * v147];
      if (v143) {
        operator delete(v143);
      }
LABEL_159:
      id v15 = v353;
      v362 = (char *)v81;

LABEL_160:
      char v125 = 0;
      goto LABEL_161;
    }
    if (objc_msgSend_characterIsMember_(v354, v76, (unsigned __int16)v20, v77, v78, v79))
    {
      objc_msgSend_appendString_(v352, v109, (uint64_t)v57, v110, v111, v112);
      int v113 = -v42;
      uint64_t v114 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v113;
        uint64_t v115 = (uint64_t)(v114 + 4);
LABEL_186:
        int v152 = 0;
        char v125 = 0;
        v362 = (char *)v115;
        goto LABEL_131;
      }
      v197 = v361;
      uint64_t v198 = (v362 - v361) >> 2;
      unint64_t v199 = v198 + 1;
      if ((unint64_t)(v198 + 1) >> 62) {
        sub_1C494A220();
      }
      uint64_t v200 = v363 - v361;
      if ((v363 - v361) >> 1 > v199) {
        unint64_t v199 = v200 >> 1;
      }
      if ((unint64_t)v200 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v201 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v201 = v199;
      }
      if (v201)
      {
        if (v201 >> 62) {
          sub_1C4949AA8();
        }
        unint64_t v202 = v201;
        uint64_t v203 = operator new(4 * v201);
        unint64_t v201 = v202;
        uint64_t v204 = (int *)&v203[4 * v198];
        *uint64_t v204 = v113;
        uint64_t v115 = (uint64_t)(v204 + 1);
        int64_t v205 = v114 - v197;
        if (v114 == v197) {
          goto LABEL_184;
        }
LABEL_178:
        unint64_t v236 = v205 - 4;
        if (v236 < 0x2C) {
          goto LABEL_345;
        }
        if ((unint64_t)(v197 - v203) < 0x20) {
          goto LABEL_345;
        }
        uint64_t v237 = (v236 >> 2) + 1;
        uint64_t v238 = 4 * (v237 & 0x7FFFFFFFFFFFFFF8);
        v239 = &v114[-v238];
        uint64_t v204 = (int *)((char *)v204 - v238);
        v240 = &v203[4 * v198 - 16];
        v241 = v114 - 16;
        uint64_t v242 = v237 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v243 = *(_OWORD *)v241;
          *(v240 - 1) = *((_OWORD *)v241 - 1);
          _OWORD *v240 = v243;
          v240 -= 2;
          v241 -= 32;
          v242 -= 8;
        }
        while (v242);
        uint64_t v114 = v239;
        if (v237 != (v237 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_345:
          do
          {
            int v244 = *((_DWORD *)v114 - 1);
            v114 -= 4;
            *--uint64_t v204 = v244;
          }
          while (v114 != v197);
        }
      }
      else
      {
        uint64_t v203 = 0;
        uint64_t v204 = (int *)(4 * v198);
        *(_DWORD *)(4 * v198) = v113;
        uint64_t v115 = 4 * v198 + 4;
        int64_t v205 = v114 - v197;
        if (v114 != v197) {
          goto LABEL_178;
        }
      }
LABEL_184:
      v361 = (char *)v204;
      v362 = (char *)v115;
      v363 = &v203[4 * v201];
      if (v197) {
        operator delete(v197);
      }
      goto LABEL_186;
    }
    int v152 = 1;
    char v125 = 1;
LABEL_131:
    id v15 = v353;
LABEL_132:

LABEL_133:
    uint64_t v185 = v359;
    uint64_t v186 = v360;
    if (v186 + v185 >= (unint64_t)objc_msgSend_length(v355, v187, v188, v189, v190, v191))
    {
      uint64_t v359 = objc_msgSend_length(v355, v192, v193, v194, v195, v196);
      uint64_t v360 = 0;
      if ((v152 & 1) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v20 = objc_msgSend_codepointAtIndex_outRange_(v355, v192, v360 + v359, (uint64_t)&v359, v195, v196);
      if (!v152) {
        goto LABEL_4;
      }
    }
LABEL_161:
    uint64_t v218 = v357;
    uint64_t v219 = v358;
    if (v219 + v218 < (unint64_t)objc_msgSend_length(v15, v30, v31, v32, v33, v34, v342))
    {
      uint64_t v24 = objc_msgSend_codepointAtIndex_outRange_(v15, v220, v358 + v357, (uint64_t)&v357, v223, v224);
LABEL_4:
      if (v125) {
        break;
      }
      uint64_t v36 = v358;
      goto LABEL_6;
    }
    uint64_t v225 = objc_msgSend_length(v15, v220, v221, v222, v223, v224);
    uint64_t v36 = 0;
    uint64_t v357 = v225;
    uint64_t v358 = 0;
    if (v125) {
      break;
    }
LABEL_6:
    if (!(v360 | v36)) {
      goto LABEL_241;
    }
  }
  v295 = &stru_1F20141C8;
  double v296 = 100.0;
  v292 = v346;
  v293 = v354;
  v297 = a11;
  if (a11) {
    goto LABEL_294;
  }
  v298 = a12;
  if (a12) {
    goto LABEL_248;
  }
LABEL_295:

  v299 = v361;
  if (!v361) {
    goto LABEL_297;
  }
LABEL_296:
  v362 = v299;
  operator delete(v299);
LABEL_297:

  return v296;
}

+ (id)lexiconCorrectionsForToken:(id)a3 locale:(id)a4 lexicon:(_LXLexicon *)a5 lmVocabulary:(void *)a6 ovsStringChecker:(id)a7 textReplacements:(id)a8 consumableStrokesSet:(id)a9 minimumTokenScore:(double)a10 activeHistoryRange:(_NSRange)a11 outBestTokenScore:(double *)a12 shouldCapitalizeWord:(BOOL)a13 shouldSkipEntryCorrection:(BOOL)a14 allowFullCapsCorrections:(BOOL)a15 minimalLengthForLowConfidenceCorrections:(int64_t)a16 lowConfidenceThreshold:(double)a17 minimalLengthForCustomCapitalizationCorrections:(int64_t)a18 outBestTokenIndex:(int64_t *)a19 outFoundTokenInLexicon:(BOOL *)a20 outFoundCaseMatchingTokenInLexicon:(BOOL *)a21 outCorrectionFromOutOfContextEntry:(BOOL *)a22
{
  id v27 = a3;
  id v28 = a4;
  id v284 = a7;
  id v283 = a8;
  id v34 = a9;
  if (qword_1EA3C9028 != -1) {
    dispatch_once(&qword_1EA3C9028, &unk_1F2013490);
  }
  uint64_t v285 = v28;
  long long v286 = v27;
  id v268 = v34;
  BOOL v35 = objc_msgSend_string(v27, v29, v30, v31, v32, v33);
  if (!objc_msgSend_length(v35, v36, v37, v38, v39, v40))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v45 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v45, OS_LOG_TYPE_FAULT, "Lexicon correction requires non-empty token string.", buf, 2u);
    }
  }
  v282 = objc_msgSend_uppercaseStringWithLocale_(v35, v41, (uint64_t)v28, v42, v43, v44);
  uint64_t v50 = objc_msgSend_lowercaseStringWithLocale_(v35, v46, (uint64_t)v28, v47, v48, v49);
  *(void *)buf = 0;
  BOOL v344 = buf;
  uint64_t v345 = 0x2020000000;
  char v346 = 0;
  uint64_t v339 = 0;
  uint64_t v340 = &v339;
  uint64_t v341 = 0x2020000000;
  v342[0] = 0;
  uint64_t v281 = (void *)v50;
  objc_msgSend_computeEditPenalizationFromString_toReferenceString_withSuffix_withCaseSensitivity_withFirstLetterCaseSensitivity_withDiacriticSensitivity_withDiacriticsCharSet_withConsumableStrokesCharSet_outputSuffix_lexiconExtraCharacters_firstLetterCaseFlipped_(CHLanguageUtilities, v51, (uint64_t)v35, v50, (uint64_t)&stru_1F20141C8, 1, 1, 0, 0, v34, 0, 0, v342);
  double v53 = v52;
  objc_msgSend_computeEditPenalizationFromString_toReferenceString_withSuffix_withCaseSensitivity_withFirstLetterCaseSensitivity_withDiacriticSensitivity_withDiacriticsCharSet_withConsumableStrokesCharSet_outputSuffix_lexiconExtraCharacters_firstLetterCaseFlipped_(CHLanguageUtilities, v54, (uint64_t)v35, (uint64_t)v282, (uint64_t)&stru_1F20141C8, 1, 1, 0, 0, v34, 0, 0, v340 + 3);
  double v61 = v60;
  double v62 = v53 + v60;
  BOOL v63 = v60 / v62 < 0.5 && a15;
  v344[24] = v63;
  if (objc_msgSend_length(v35, v55, v56, v57, v58, v59) <= a11.length)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v67 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v335 = 0;
      _os_log_impl(&dword_1C492D000, v67, OS_LOG_TYPE_FAULT, "The prefix length should be smaller than the candidate string length", v335, 2u);
    }
  }
  uint64_t v280 = objc_msgSend_substringWithRange_(v35, v64, 0, a11.length, v65, v66);
  unint64_t v279 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v68, v69, v70, v71, v72);
  *(void *)int v335 = 0;
  int v336 = v335;
  uint64_t v337 = 0x2020000000;
  uint64_t v338 = 0x7FEFFFFFFFFFFFFFLL;
  v334[0] = 0;
  v334[1] = v334;
  v334[2] = 0x2020000000;
  v334[3] = 0x7FEFFFFFFFFFFFFFLL;
  v332[0] = 0;
  v332[1] = v332;
  v332[2] = 0x2020000000;
  char v333 = 0;
  id v73 = v35;
  unint64_t v83 = objc_msgSend_rangeOfString_(v73, v74, @"'", v75, v76, v77);
  uint64_t v328 = 0;
  uint64_t v329 = &v328;
  uint64_t v330 = 0x2020000000;
  char v331 = 0;
  id v84 = v73;
  if (v83 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v84 = v73;
    if (v83 < objc_msgSend_length(v73, v78, v79, v80, v81, v82) - 1)
    {
      id v84 = v73;
      if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v78, (uint64_t)v73, (uint64_t)a5, 0, v82) & 1) == 0)
      {
        uint64_t v85 = objc_msgSend_substringFromIndex_(v73, v78, v83 + 1, v80, v81, v82);
        id v84 = v73;
        if (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v86, (uint64_t)v85, (uint64_t)a5, 0, v87))
        {
          id v84 = v85;

          *((unsigned char *)v329 + 24) = 1;
        }

        id v34 = v268;
      }
    }
  }
  uint64_t v88 = objc_msgSend_stringByTrimmingCharactersInSet_(v84, v78, qword_1EA3C9020, v80, v81, v82);
  uint64_t v291 = MEMORY[0x1E4F143A8];
  uint64_t v292 = 3221225472;
  v293 = sub_1C4952BA4;
  int v294 = &unk_1E64E0FA8;
  double v311 = a17;
  id v89 = v84;
  id v295 = v89;
  int64_t v312 = a16;
  id v270 = v88;
  id v296 = v270;
  int64_t v313 = a18;
  id v269 = v280;
  id v297 = v269;
  uint64_t v314 = 0;
  NSUInteger length = a11.length;
  uint64_t v316 = a20;
  id v90 = v284;
  id v298 = v90;
  id v91 = v286;
  unint64_t v317 = 0xBFF4D104D427DE80;
  int v318 = a6;
  char v319 = a21;
  BOOL v325 = a13;
  id v299 = v91;
  uint64_t v305 = &v328;
  id v92 = v73;
  id v300 = v92;
  id v93 = v283;
  BOOL v326 = a14;
  id v301 = v93;
  unint64_t v306 = buf;
  double v320 = v61;
  double v321 = v62;
  BOOL v327 = a15;
  id v94 = v285;
  id v302 = v94;
  id v95 = v34;
  double v322 = a10;
  id v303 = v95;
  int v307 = v335;
  uint64_t v308 = v332;
  v309 = v334;
  uint64_t v310 = &v339;
  id v96 = v279;
  id v304 = v96;
  uint64_t v323 = a19;
  uint64_t v324 = a22;
  LXLexiconEnumerateEntriesForString();
  if (a12) {
    *a12 = *((double *)v336 + 3);
  }
  uint64_t v289 = v90;
  if (!objc_msgSend_count(v96, v97, v98, v99, v100, v101))
  {
    uint64_t v276 = objc_msgSend_properties(v91, v102, v103, v104, v105, v106);
    if (a14)
    {
      id v287 = v92;
    }
    else if (v344[24])
    {
      uint64_t v117 = objc_msgSend_string(v91, v107, v108, v109, v110, v111);
      objc_msgSend_uppercaseStringWithLocale_(v117, v118, (uint64_t)v94, v119, v120, v121);
      id v287 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (a13)
    {
      uint64_t v122 = objc_msgSend_string(v91, v107, v108, v109, v110, v111);
      objc_msgSend_lowercaseStringWithLocale_(v122, v123, (uint64_t)v94, v124, v125, v126);
      uint64_t v127 = (NSString *)objc_claimAutoreleasedReturnValue();

      uint64_t v128 = uppercaseFirstLetter(v127);

      v276 |= 0x200uLL;
      id v287 = (id)v128;
    }
    else
    {
      uint64_t v129 = objc_msgSend_string(v91, v107, v108, v109, v110, v111);
      uint64_t v135 = objc_msgSend_lowercaseString(v129, v130, v131, v132, v133, v134);

      id v287 = v135;
      objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v135, v136, 0, v137, v138, v139);
      uint64_t v141 = (uint64_t)v140;
      if (objc_msgSend_length(v135, v140, v142, v143, v144, v145) > (unint64_t)v140)
      {
        int v277 = objc_msgSend_substringFromIndex_(v135, v112, v141, v114, v115, v116);
        v273 = objc_msgSend_string(v91, v146, v147, v148, v149, v150);
        uint64_t v155 = objc_msgSend_substringFromIndex_(v273, v151, v141, v152, v153, v154);
        int isEqualToString = objc_msgSend_isEqualToString_(v277, v156, (uint64_t)v155, v157, v158, v159);

        uint64_t v160 = v276;
        if (!isEqualToString) {
          uint64_t v160 = v276 | 0x200;
        }
        uint64_t v276 = v160;
      }
    }
    uint64_t v161 = objc_msgSend_string(v91, v112, v113, v114, v115, v116);
    char v166 = objc_msgSend_isEqualToString_(v287, v162, (uint64_t)v161, v163, v164, v165);

    if ((v166 & 1) == 0)
    {
      uint64_t v167 = [CHTokenizedTextResultToken alloc];
      v278 = objc_msgSend_strokeIndexes(v91, v168, v169, v170, v171, v172);
      unsigned int v272 = objc_msgSend_wordID(v91, v173, v174, v175, v176, v177);
      objc_msgSend_modelScore(v91, v178, v179, v180, v181, v182);
      double v267 = v183;
      objc_msgSend_recognitionScore(v91, v184, v185, v186, v187, v188);
      double v266 = v189;
      objc_msgSend_combinedScore(v91, v190, v191, v192, v193, v194);
      double v265 = v195;
      objc_msgSend_alignmentScore(v91, v196, v197, v198, v199, v200);
      double v264 = v201;
      v274 = objc_msgSend_recognizerSourceLocale(v91, v202, v203, v204, v205, v206);
      uint64_t v212 = objc_msgSend_inputSources(v91, v207, v208, v209, v210, v211);
      uint64_t v263 = objc_msgSend_substrokeCount(v91, v213, v214, v215, v216, v217);
      objc_msgSend_bounds(v91, v218, v219, v220, v221, v222);
      double v224 = v223;
      double v226 = v225;
      double v228 = v227;
      double v230 = v229;
      objc_msgSend_originalBounds(v91, v231, v232, v233, v234, v235);
      uint64_t v242 = v241;
      uint64_t v244 = v243;
      uint64_t v246 = v245;
      uint64_t v248 = v247;
      if (v91) {
        objc_msgSend_principalLines(v91, v236, v237, v238, v239, v240);
      }
      else {
        memset(v290, 0, sizeof(v290));
      }
      unint64_t v249 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v167, v236, (uint64_t)v287, (uint64_t)v278, v272, v276, v274, v212 | 0x100, v267, v266, v265, v264, v224, v226, v228, v230, v263, v242, v244,
                       v246,
                       v248,
                       v290);

      objc_msgSend_addObject_(v96, v250, (uint64_t)v249, v251, v252, v253);
      if (a12)
      {
        objc_msgSend_combinedScore(v91, v254, v255, v256, v257, v258);
        *(void *)a12 = v259;
      }
      if (a19) {
        *a19 = 0;
      }
      if (a22) {
        *a22 = 0;
      }
    }
  }
  uint64_t v260 = v304;
  id v261 = v96;

  _Block_object_dispose(&v328, 8);
  _Block_object_dispose(v332, 8);
  _Block_object_dispose(v334, 8);
  _Block_object_dispose(v335, 8);

  _Block_object_dispose(&v339, 8);
  _Block_object_dispose(buf, 8);

  return v261;
}

@end