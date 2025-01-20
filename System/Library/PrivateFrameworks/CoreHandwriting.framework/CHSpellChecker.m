@interface CHSpellChecker
- (BOOL)isWordInUserDictionaries:(id)a3 caseSensitive:(BOOL)a4;
- (CHSpellChecker)init;
- (id)correctionsForString:(id)a3 shouldUseErrorModel:(BOOL)a4 forLocale:(id)a5;
- (id)topCorrectionForRecognition:(id)a3 contextBeforeToken:(id)a4 contextSeparator:(id)a5 shouldUseErrorModel:(BOOL)a6 forLocale:(id)a7 minScore:(double)a8;
- (id)topCorrectionForString:(id)a3 contextBeforeToken:(id)a4 contextSeparator:(id)a5 shouldUseErrorModel:(BOOL)a6 forLanguage:(id)a7;
- (id)topCorrectionsForRecognition:(id)a3 contextBeforeToken:(id)a4 contextSeparator:(id)a5 shouldUseErrorModel:(BOOL)a6 forLocale:(id)a7 minScore:(double)a8;
@end

@implementation CHSpellChecker

- (CHSpellChecker)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHSpellChecker;
  v2 = [(CHSpellChecker *)&v6 init];
  if (v2)
  {
    self;
    if (qword_1EA3C92D8 != -1) {
      dispatch_once(&qword_1EA3C92D8, &unk_1F2012D70);
    }
    objc_storeStrong((id *)&v2->_spellServer, (id)qword_1EA3C92D0);
    self;
    v3 = objc_alloc_init(CHSpellCheckerErrorModel);
    errorModel = v2->_errorModel;
    v2->_errorModel = v3;
  }
  return v2;
}

- (BOOL)isWordInUserDictionaries:(id)a3 caseSensitive:(BOOL)a4
{
  return 0;
}

- (id)topCorrectionForString:(id)a3 contextBeforeToken:(id)a4 contextSeparator:(id)a5 shouldUseErrorModel:(BOOL)a6 forLanguage:(id)a7
{
  v11 = (NSString *)a3;
  id v12 = a4;
  id v90 = a5;
  id v13 = a7;
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v14, v15, v16, v17, v18);
  v19 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = isStringEntirelyFromSet(v11, v19);

  if ((a7 & 1) == 0)
  {
    objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v20, v21, v22, v23, v24);
    v26 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = rangeOfCharactersFromSet(v11, v26, 0);
    uint64_t v29 = v28;

    if (v29)
    {
      objc_msgSend_substringWithRange_(v11, v30, v27, v29, v33, v34);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = &stru_1F20141C8;
    }
    v89 = v35;
    objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v30, v31, v32, v33, v34);
    v36 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = rangeOfCharactersFromSet(v11, v36, 1);
    uint64_t v39 = v38;

    if (v39)
    {
      objc_msgSend_substringWithRange_(v11, v40, v37, v39, v42, v43);
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
LABEL_8:
        objc_msgSend_stringByAppendingFormat_(v12, v40, @"%@%@", v41, v42, v43, v90, v11);
        v45 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v51 = v45;
        uint64_t v52 = objc_msgSend_length(v45, v46, v47, v48, v49, v50);
        uint64_t v63 = v52 + v29 - objc_msgSend_length(v11, v53, v54, v55, v56, v57);
        uint64_t v64 = objc_msgSend_length(v11, v58, v59, v60, v61, v62) - (v39 + v29);
        v65 = self->_spellServer;
        objc_sync_enter(v65);
        v67 = objc_msgSend_spellServer_suggestGuessesForWordRange_inString_language_options_(self->_spellServer, v66, (uint64_t)self, v63, v64, (uint64_t)v51, v13, 0);
        objc_sync_exit(v65);

        if (objc_msgSend_count(v67, v68, v69, v70, v71, v72))
        {
          v77 = objc_msgSend_objectAtIndexedSubscript_(v67, v73, 0, v74, v75, v76);
          v82 = objc_msgSend_stringByAppendingString_(v89, v78, (uint64_t)v77, v79, v80, v81);

          v87 = objc_msgSend_stringByAppendingString_(v82, v83, (uint64_t)v44, v84, v85, v86);
        }
        else
        {
          v87 = 0;
        }
        id v25 = v87;

        goto LABEL_15;
      }
    }
    else
    {
      v44 = &stru_1F20141C8;
      if (v12) {
        goto LABEL_8;
      }
    }
    v45 = v11;
    goto LABEL_11;
  }
  id v25 = 0;
LABEL_15:

  return v25;
}

- (id)correctionsForString:(id)a3 shouldUseErrorModel:(BOOL)a4 forLocale:(id)a5
{
  BOOL v6 = a4;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v11 = a5;
  if (v6)
  {
    errorModel = self->_errorModel;
    uint64_t v32 = @"ErrorModel";
    v33[0] = errorModel;
    id v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v33, (uint64_t)&v32, 1, v10);
    v14 = self->_errorModel;
  }
  else
  {
    v14 = 0;
    id v13 = 0;
  }
  uint64_t v15 = self->_spellServer;
  objc_sync_enter(v15);
  spellServer = self->_spellServer;
  uint64_t v22 = objc_msgSend_length(v8, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_localeIdentifier(v11, v23, v24, v25, v26, v27);
  v30 = objc_msgSend_spellServer_suggestGuessDictionariesForWordRange_inString_language_options_errorModel_(spellServer, v29, (uint64_t)self, 0, v22, (uint64_t)v8, v28, v13, v14);

  objc_sync_exit(v15);
  return v30;
}

- (id)topCorrectionForRecognition:(id)a3 contextBeforeToken:(id)a4 contextSeparator:(id)a5 shouldUseErrorModel:(BOOL)a6 forLocale:(id)a7 minScore:(double)a8
{
  id v8 = objc_msgSend_topCorrectionsForRecognition_contextBeforeToken_contextSeparator_shouldUseErrorModel_forLocale_minScore_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  v14 = v8;
  if (v8 && objc_msgSend_count(v8, v9, v10, v11, v12, v13))
  {
    uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0, v16, v17, v18);

    uint64_t v20 = (void *)v19;
  }
  else
  {

    uint64_t v20 = 0;
  }
  return v20;
}

- (id)topCorrectionsForRecognition:(id)a3 contextBeforeToken:(id)a4 contextSeparator:(id)a5 shouldUseErrorModel:(BOOL)a6 forLocale:(id)a7 minScore:(double)a8
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (NSString *)a3;
  id v113 = a4;
  id v112 = a5;
  id v114 = a7;
  v111 = v13;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17, v18);
  id v116 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v19, v20, v21, v22, v23);
  uint64_t v24 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = isStringEntirelyFromSet(v13, v24);

  if (a5) {
    goto LABEL_20;
  }
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v25, v26, v27, v28, v29);
  v30 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = rangeOfCharactersFromSet(v13, v30, 0);
  uint64_t v33 = v32;

  if (v33)
  {
    objc_msgSend_substringWithRange_(v13, v34, v31, v33, v37, v38);
    v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v115 = &stru_1F20141C8;
  }
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E4F28B88], v34, v35, v36, v37, v38);
  uint64_t v39 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = rangeOfCharactersFromSet(v13, v39, 1);
  uint64_t v42 = v41;

  if (!v42)
  {
    uint64_t v47 = &stru_1F20141C8;
    uint64_t v48 = v113;
    if (v113) {
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v49 = v13;
    goto LABEL_10;
  }
  objc_msgSend_substringWithRange_(v13, v43, v40, v42, v45, v46);
  uint64_t v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v48 = v113;
  if (!v113) {
    goto LABEL_9;
  }
LABEL_7:
  objc_msgSend_stringByAppendingFormat_(v48, v43, @"%@%@", v44, v45, v46, v112, v13);
  uint64_t v49 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v110 = v49;
  uint64_t v55 = objc_msgSend_length(v49, v50, v51, v52, v53, v54);
  uint64_t v61 = objc_msgSend_length(v13, v56, v57, v58, v59, v60);
  uint64_t v67 = objc_msgSend_length(v13, v62, v63, v64, v65, v66);
  uint64_t v71 = objc_msgSend_substringWithRange_(v110, v68, v55 + v33 - v61, v67 - (v42 + v33), v69, v70);
  uint64_t v74 = objc_msgSend_correctionsForString_shouldUseErrorModel_forLocale_(self, v72, (uint64_t)v71, 1, (uint64_t)v114, v73);

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v75 = v74;
  uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v117, (uint64_t)v121, 16, v77);
  if (v82)
  {
    uint64_t v83 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v82; ++i)
      {
        if (*(void *)v118 != v83) {
          objc_enumerationMutation(v75);
        }
        uint64_t v85 = *(void **)(*((void *)&v117 + 1) + 8 * i);
        uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(v85, v78, @"Score", v79, v80, v81);
        objc_msgSend_doubleValue(v86, v87, v88, v89, v90, v91);
        BOOL v93 = v92 > a8;

        if (v93)
        {
          v94 = objc_msgSend_objectForKeyedSubscript_(v85, v78, @"Guess", v79, v80, v81);
          v99 = objc_msgSend_stringByAppendingString_(v115, v95, (uint64_t)v94, v96, v97, v98);

          v104 = objc_msgSend_stringByAppendingString_(v99, v100, (uint64_t)v47, v101, v102, v103);

          objc_msgSend_addObject_(v116, v105, (uint64_t)v104, v106, v107, v108);
        }
      }
      uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v78, (uint64_t)&v117, (uint64_t)v121, 16, v81);
    }
    while (v82);
  }

LABEL_20:
  return v116;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorModel, 0);
  objc_storeStrong((id *)&self->_spellServer, 0);
}

@end