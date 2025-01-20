@interface CHPrefixQuery
+ (id)hashtagQueryForRecognitionSession:(id)a3;
+ (id)mentionQueryForRecognitionSession:(id)a3;
+ (id)prefixQueryWithPrefix:(id)a3 forRecognitionSession:(id)a4;
- (BOOL)_isTokenStringMatchingQuery:(id)a3 allowPartialMatching:(BOOL)a4;
- (BOOL)q_doesQueryResultDependOnDeclaredVariables;
- (BOOL)q_resultWantedForCompleteness:(int64_t)a3;
- (NSArray)foundItems;
- (NSSet)validSuffixes;
- (NSString)prefix;
- (id)_prefixQueryResultsForSessionResult:(id)a3;
- (id)debugName;
- (void)q_updateQueryResult;
- (void)setValidSuffixes:(id)a3;
@end

@implementation CHPrefixQuery

+ (id)hashtagQueryForRecognitionSession:(id)a3
{
  id v3 = a3;
  v4 = [CHPrefixQuery alloc];
  self;
  if (qword_1EA3C8F20 != -1) {
    dispatch_once(&qword_1EA3C8F20, &unk_1F2012ED0);
  }
  v5 = sub_1C4B28C88((id *)&v4->super.super.isa, v3, @"#", 0, (void *)qword_1EA3C8F28);

  return v5;
}

+ (id)mentionQueryForRecognitionSession:(id)a3
{
  id v3 = a3;
  v4 = [CHPrefixQuery alloc];
  v10 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v5, v6, v7, v8, v9);
  v16 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v11, v12, v13, v14, v15);
  v17 = sub_1C4B28C88((id *)&v4->super.super.isa, v3, @"@", v10, v16);

  return v17;
}

+ (id)prefixQueryWithPrefix:(id)a3 forRecognitionSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [CHPrefixQuery alloc];
  uint64_t v13 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v8, v9, v10, v11, v12);
  uint64_t v14 = sub_1C4B28C88((id *)&v7->super.super.isa, v6, v5, 0, v13);

  return v14;
}

- (void)q_updateQueryResult
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v3 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  if (qword_1EA3CA000 == -1)
  {
    id v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    id v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHPrefixQuery", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v7 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHPrefixQuery\"", buf, 2u);
  }

  v34.receiver = self;
  v34.super_class = (Class)CHPrefixQuery;
  [(CHQuery *)&v34 q_updateQueryResult];
  uint64_t v13 = objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  objc_msgSend__prefixQueryResultsForSessionResult_(self, v14, (uint64_t)v13, v15, v16, v17);
  v18 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  v24 = v18;
  if (self && self->_foundItems != v18)
  {
    v25 = (NSArray *)objc_msgSend_copy(v18, v19, v20, v21, v22, v23);
    foundItems = self->_foundItems;
    self->_foundItems = v25;

    objc_msgSend_q_queryResultDidChange(self, v27, v28, v29, v30, v31);
  }

  if (qword_1EA3CA000 == -1)
  {
    v32 = (id)qword_1EA3C9FC8;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_18;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v32 = (id)qword_1EA3C9FC8;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_18;
    }
  }
  if (os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v32, OS_SIGNPOST_INTERVAL_END, v4, "CHPrefixQuery", "", buf, 2u);
  }
LABEL_18:

  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v33 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v33 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
LABEL_20:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v33, OS_LOG_TYPE_DEFAULT, "END \"CHPrefixQuery\"", buf, 2u);
  }
LABEL_21:
}

- (BOOL)_isTokenStringMatchingQuery:(id)a3 allowPartialMatching:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self->_prefix;
  uint64_t v11 = objc_msgSend_stringByFoldingWithOptions_locale_(v7, v8, 385, 0, v9, v10);

  uint64_t v15 = objc_msgSend_stringByFoldingWithOptions_locale_(v6, v12, 385, 0, v13, v14);
  uint64_t v20 = objc_msgSend_componentsSeparatedByString_(v15, v16, (uint64_t)v11, v17, v18, v19);
  uint64_t v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25) - 1;

  if (v26 <= 1)
  {
    BOOL v31 = 0;
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x2020000000;
    char v91 = 0;
    if (objc_msgSend_hasPrefix_(v15, v27, (uint64_t)v11, v28, v29, v30))
    {
      uint64_t v37 = objc_msgSend_length(v11, v32, v33, v34, v35, v36);
      v42 = objc_msgSend_substringFromIndex_(v6, v38, v37, v39, v40, v41);
      uint64_t v47 = objc_msgSend_rangeOfCharacterFromSet_(v42, v43, (uint64_t)self->_queryDelimiters, v44, v45, v46);

      if (v47 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v4)
        {
          uint64_t v53 = objc_msgSend_length(v15, v48, v49, v50, v51, v52);
          if (v53 == objc_msgSend_length(v11, v54, v55, v56, v57, v58) || (validSuffixes = self->_validSuffixes) == 0)
          {
            *((unsigned char *)v89 + 24) = 1;
          }
          else
          {
            v84[0] = MEMORY[0x1E4F143A8];
            v84[1] = 3221225472;
            v84[2] = sub_1C4B297D0;
            v84[3] = &unk_1E64E3E58;
            id v85 = v15;
            id v86 = v11;
            v87 = &v88;
            objc_msgSend_enumerateObjectsUsingBlock_(validSuffixes, v60, (uint64_t)v84, v61, v62, v63);
          }
        }
        else
        {
          v64 = self->_validSuffixes;
          if (v64)
          {
            uint64_t v65 = objc_msgSend_length(v11, v48, v49, v50, v51, v52);
            v70 = objc_msgSend_substringFromIndex_(v15, v66, v65, v67, v68, v69);
            char v75 = objc_msgSend_containsObject_(v64, v71, (uint64_t)v70, v72, v73, v74);
            *((unsigned char *)v89 + 24) = v75;
          }
          else
          {
            unint64_t v76 = objc_msgSend_length(v15, v48, v49, v50, v51, v52);
            BOOL v82 = v76 > objc_msgSend_length(v11, v77, v78, v79, v80, v81);
            *((unsigned char *)v89 + 24) = v82;
          }
        }
      }
      else
      {
        *((unsigned char *)v89 + 24) = 0;
      }
      BOOL v31 = *((unsigned char *)v89 + 24) != 0;
    }
    _Block_object_dispose(&v88, 8);
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (id)_prefixQueryResultsForSessionResult:(id)a3
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v121 = a3;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7, v8);
  id v116 = (id)objc_claimAutoreleasedReturnValue();
  validSuffixes = self->_validSuffixes;
  if (!validSuffixes || objc_msgSend_count(validSuffixes, v9, v10, v11, v12, v13))
  {
    uint64_t v15 = objc_msgSend_strokeGroupingResult(v121, v9, v10, v11, v12, v13);
    uint64_t v21 = objc_msgSend_strokeGroups(v15, v16, v17, v18, v19, v20);
    v118 = self;

    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id obj = v21;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v138, (uint64_t)v144, 16, v23);
    if (v24)
    {
      uint64_t v119 = *(void *)v139;
      do
      {
        uint64_t v120 = v24;
        for (uint64_t i = 0; i != v120; ++i)
        {
          if (*(void *)v139 != v119) {
            objc_enumerationMutation(obj);
          }
          BOOL v31 = *(void **)(*((void *)&v138 + 1) + 8 * i);
          uint64_t v32 = objc_msgSend_uniqueIdentifier(v31, v25, v26, v27, v28, v29);
          uint64_t v37 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v121, v33, v32, v34, v35, v36);
          v122 = objc_msgSend_preferredLocale(v37, v38, v39, v40, v41, v42);
          v43 = objc_opt_class();
          uint64_t v49 = objc_msgSend_recognitionResultsByLocale(v37, v44, v45, v46, v47, v48);
          uint64_t v55 = objc_msgSend_locales(v121, v50, v51, v52, v53, v54);
          uint64_t v61 = objc_msgSend_languageFitnessByLocale(v37, v56, v57, v58, v59, v60);
          uint64_t v63 = objc_msgSend_filteredResultsByLocale_orderedLocales_usingLanguageFitness_outSortedLocales_(v43, v62, (uint64_t)v49, (uint64_t)v55, (uint64_t)v61, 0);

          uint64_t v72 = objc_msgSend_objectForKeyedSubscript_(v63, v64, (uint64_t)v122, v65, v66, v67);
          if (v72)
          {
            if (objc_msgSend_shouldRefinePrefixQueryMatchesForLocale_(CHRecognizerConfiguration, v68, (uint64_t)v122, v69, v70, v71))
            {
              uint64_t v78 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v73, v74, v75, v76, v77);
              uint64_t v134 = 0;
              v135 = &v134;
              uint64_t v136 = 0x2020000000;
              char v137 = 0;
              v127[0] = MEMORY[0x1E4F143A8];
              v127[1] = 3221225472;
              v127[2] = sub_1C4B2A9D0;
              v127[3] = &unk_1E64E3ED0;
              id v117 = v78;
              id v128 = v117;
              v129 = v118;
              v133 = &v134;
              id v79 = v37;
              id v130 = v79;
              v131 = v31;
              id v80 = v116;
              id v132 = v80;
              objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v72, v81, (uint64_t)v127, v82, v83, v84);
              if (*((unsigned char *)v135 + 24))
              {
                id v85 = v117;
                char v91 = objc_msgSend_string(MEMORY[0x1E4F28E78], v86, v87, v88, v89, v90);
                v142[0] = MEMORY[0x1E4F143A8];
                v142[1] = 3221225472;
                v142[2] = sub_1C4B2A31C;
                v142[3] = &unk_1E64E3280;
                id v92 = v91;
                id v143 = v92;
                objc_msgSend_enumerateObjectsUsingBlock_(v85, v93, (uint64_t)v142, v94, v95, v96);
                v101 = objc_msgSend_stringWithString_(NSString, v97, (uint64_t)v92, v98, v99, v100);

                if (objc_msgSend__isTokenStringMatchingQuery_allowPartialMatching_(v118, v102, (uint64_t)v101, 0, v103, v104))
                {
                  v109 = sub_1C4B29894((void **)&v118->super.super.isa, v85, v79, v31);
                  if (v109) {
                    objc_msgSend_addObject_(v80, v105, (uint64_t)v109, v106, v107, v108);
                  }
                }
              }

              _Block_object_dispose(&v134, 8);
            }
            else
            {
              v123[0] = MEMORY[0x1E4F143A8];
              v123[1] = 3221225472;
              v123[2] = sub_1C4B2ABC4;
              v123[3] = &unk_1E64E3EF8;
              v123[4] = v118;
              id v124 = v37;
              v125 = v31;
              id v126 = v116;
              objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v72, v110, (uint64_t)v123, v111, v112, v113);
            }
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v138, (uint64_t)v144, 16, v29);
      }
      while (v24);
    }
  }
  return v116;
}

- (NSArray)foundItems
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4B2AE10;
  uint64_t v15 = sub_1C4B2AE20;
  id v16 = 0;
  uint64_t v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4B2AE28;
  v10[3] = &unk_1E64E1168;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (NSSet)validSuffixes
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4B2AE10;
  uint64_t v15 = sub_1C4B2AE20;
  id v16 = 0;
  uint64_t v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4B2AF68;
  v10[3] = &unk_1E64E1168;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSSet *)v8;
}

- (void)setValidSuffixes:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_processingQueue(self, v5, v6, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4B2B048;
  v12[3] = &unk_1E64E11E0;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_sync(v10, v12);
}

- (BOOL)q_resultWantedForCompleteness:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugName
{
  uint64_t v7 = NSString;
  uint64_t v8 = objc_msgSend_prefix(self, a2, v2, v3, v4, v5);
  id v13 = objc_msgSend_stringWithFormat_(v7, v9, @"Prefix data Query %p for prefix %@", v10, v11, v12, self, v8);

  return v13;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_queryDelimiters, 0);
  objc_storeStrong((id *)&self->_validSuffixes, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
}

@end