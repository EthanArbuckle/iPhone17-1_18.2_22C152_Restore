@interface CHStrokeGroupRecognitionResult
+ (BOOL)supportsSecureCoding;
+ (id)filteredResultsByLocale:(id)a3 orderedLocales:(id)a4 usingLanguageFitness:(id)a5 outSortedLocales:(id *)a6;
+ (id)sortedLanguageGroups:(id)a3 usingLanguageFitness:(id)a4;
+ (id)sortedLocales:(id)a3 usingLanguageFitness:(id)a4 useCombinedScore:(BOOL)a5;
+ (id)textTranscriptionsForSortedGroupCluster:(id)a3 recognizedResultsByGroupID:(id)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)languageFitnessForLocale:(id)a3;
- (BOOL)hasPrincipalLines;
- (BOOL)isCandidateMathGroup;
- (BOOL)isEqual:(id)a3;
- (CHDrawing)inputDrawing;
- (CHStrokeGroupRecognitionResult)init;
- (CHStrokeGroupRecognitionResult)initWithCoder:(id)a3;
- (CHStrokeGroupRecognitionResult)initWithOrderedLocales:(id)a3 resultsByLocale:(id)a4 errorsByLocale:(id)a5 languageFitnessByLocale:(id)a6 mathResult:(id)a7 inputStrokeIdentifiers:(id)a8;
- (CHStrokeGroupRecognitionResult)initWithOrderedLocales:(id)a3 resultsByLocale:(id)a4 errorsByLocale:(id)a5 languageFitnessByLocale:(id)a6 mathResult:(id)a7 inputStrokeIdentifiers:(id)a8 inputDrawing:(id)a9 inputDrawingCutPoints:(id)a10;
- (CHTokenizedMathResult)mathResult;
- (NSArray)inputDrawingCutPoints;
- (NSArray)inputStrokeIdentifiers;
- (NSArray)orderedLocales;
- (NSDictionary)errorsByLocale;
- (NSDictionary)languageFitnessByLocale;
- (NSDictionary)recognitionResultsByLocale;
- (id)description;
- (id)highConfidenceTextForSessionResult:(id)a3 averageTokenScore:(double *)a4 rejectionRate:(double *)a5 doesContainUnfilteredMultiLocaleResults:(BOOL *)a6 isNonTextCandidateResult:(BOOL *)a7;
- (id)localesSortedByCombinedLanguageFitness:(id)a3;
- (id)localesSortedByRawLanguageFitness:(id)a3;
- (id)mathStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult:(id)a3 wrapTextResult:(BOOL)a4;
- (id)preferredLocale;
- (id)textStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHStrokeGroupRecognitionResult

- (CHStrokeGroupRecognitionResult)init
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHStrokeGroupRecognitionResult)initWithOrderedLocales:(id)a3 resultsByLocale:(id)a4 errorsByLocale:(id)a5 languageFitnessByLocale:(id)a6 mathResult:(id)a7 inputStrokeIdentifiers:(id)a8
{
  return (CHStrokeGroupRecognitionResult *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8, 0, 0);
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)CHStrokeGroupRecognitionResult;
  v3 = [(CHStrokeGroupRecognitionResult *)&v16 description];
  v9 = objc_msgSend_recognitionResultsByLocale(self, v4, v5, v6, v7, v8);
  v14 = objc_msgSend_stringByAppendingFormat_(v3, v10, @" %@", v11, v12, v13, v9);

  return v14;
}

- (id)localesSortedByRawLanguageFitness:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v11 = objc_msgSend_languageFitnessByLocale(self, v6, v7, v8, v9, v10);
  v14 = objc_msgSend_sortedLocales_usingLanguageFitness_useCombinedScore_(v5, v12, (uint64_t)v4, (uint64_t)v11, 0, v13);

  return v14;
}

- (id)localesSortedByCombinedLanguageFitness:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v11 = objc_msgSend_languageFitnessByLocale(self, v6, v7, v8, v9, v10);
  v14 = objc_msgSend_sortedLocales_usingLanguageFitness_useCombinedScore_(v5, v12, (uint64_t)v4, (uint64_t)v11, 1, v13);

  return v14;
}

- (id)highConfidenceTextForSessionResult:(id)a3 averageTokenScore:(double *)a4 rejectionRate:(double *)a5 doesContainUnfilteredMultiLocaleResults:(BOOL *)a6 isNonTextCandidateResult:(BOOL *)a7
{
  uint64_t v216 = *MEMORY[0x1E4F143B8];
  id v199 = a3;
  uint64_t v13 = objc_msgSend_mathResult(self, v8, v9, v10, v11, v12);

  if (!v13)
  {
    if (!v199) {
      goto LABEL_45;
    }
    v54 = v199;
    objc_sync_enter(v54);
    if (!v54[5])
    {
      long long v211 = 0u;
      long long v212 = 0u;
      long long v209 = 0u;
      long long v210 = 0u;
      objc_msgSend_preferredLocales(v54, v55, v56, v57, v58, v59);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v60, (uint64_t)&v209, (uint64_t)v215, 16, v61);
      if (v190)
      {
        uint64_t v191 = *(void *)v210;
        uint64_t v194 = 2;
        do
        {
          for (uint64_t i = 0; i != v190; ++i)
          {
            if (*(void *)v210 != v191) {
              objc_enumerationMutation(obj);
            }
            v67 = *(void **)(*((void *)&v209 + 1) + 8 * i);
            long long v205 = 0u;
            long long v206 = 0u;
            long long v207 = 0u;
            long long v208 = 0u;
            v68 = objc_msgSend_locales(v54, v62, v63, v64, v65, v66);
            uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v205, (uint64_t)v214, 16, v70);
            if (v76)
            {
              uint64_t v77 = *(void *)v206;
              while (2)
              {
                for (uint64_t j = 0; j != v76; ++j)
                {
                  if (*(void *)v206 != v77) {
                    objc_enumerationMutation(v68);
                  }
                  v79 = *(void **)(*((void *)&v205 + 1) + 8 * j);
                  v80 = objc_msgSend_languageCode(v67, v71, v72, v73, v74, v75);
                  v86 = objc_msgSend_languageCode(v79, v81, v82, v83, v84, v85);
                  BOOL v91 = objc_msgSend_caseInsensitiveCompare_(v80, v87, (uint64_t)v86, v88, v89, v90) == 0;

                  if (v91)
                  {

                    uint64_t v92 = 1;
                    goto LABEL_30;
                  }
                }
                uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v71, (uint64_t)&v205, (uint64_t)v214, 16, v75);
                if (v76) {
                  continue;
                }
                break;
              }
            }
          }
          uint64_t v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v62, (uint64_t)&v209, (uint64_t)v215, 16, v66);
        }
        while (v190);
      }
      else
      {
        uint64_t v92 = 2;
LABEL_30:
        uint64_t v194 = v92;
      }

      v54[5] = v194;
    }
    objc_sync_exit(v54);

    if (v54[5] != 1)
    {
LABEL_45:
      v30 = 0;
      goto LABEL_59;
    }
    v93 = objc_opt_class();
    v99 = objc_msgSend_recognitionResultsByLocale(self, v94, v95, v96, v97, v98);
    orderedLocales = self->_orderedLocales;
    v106 = objc_msgSend_languageFitnessByLocale(self, v101, v102, v103, v104, v105);
    id v204 = 0;
    v108 = objc_msgSend_filteredResultsByLocale_orderedLocales_usingLanguageFitness_outSortedLocales_(v93, v107, (uint64_t)v99, (uint64_t)orderedLocales, (uint64_t)v106, (uint64_t)&v204);
    id v109 = v204;

    long long v202 = 0u;
    long long v203 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    v115 = objc_msgSend_allValues(v108, v110, v111, v112, v113, v114);
    v118 = 0;
    uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v200, (uint64_t)v213, 16, v117);
    if (v124)
    {
      uint64_t v125 = *(void *)v201;
      do
      {
        for (uint64_t k = 0; k != v124; ++k)
        {
          if (*(void *)v201 != v125) {
            objc_enumerationMutation(v115);
          }
          v127 = *(void **)(*((void *)&v200 + 1) + 8 * k);
          if (v118)
          {
            v128 = objc_msgSend_topTranscription(v127, v119, v120, v121, v122, v123);
            BOOL v132 = objc_msgSend_compare_options_(v118, v129, (uint64_t)v128, 1, v130, v131) == 0;

            if (!v132)
            {
              v142 = 0;
              goto LABEL_46;
            }
          }
          else
          {
            v118 = objc_msgSend_topTranscription(v127, v119, v120, v121, v122, v123);
          }
        }
        uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v119, (uint64_t)&v200, (uint64_t)v213, 16, v123);
      }
      while (v124);
    }

    v115 = objc_msgSend_firstObject(v109, v133, v134, v135, v136, v137);
    v142 = objc_msgSend_objectForKeyedSubscript_(v108, v138, (uint64_t)v115, v139, v140, v141);
LABEL_46:

    v148 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v143, v144, v145, v146, v147);
    int v153 = objc_msgSend_BOOLForKey_(v148, v149, @"CHSkipConfidenceFiltering", v150, v151, v152);

    v159 = objc_msgSend_transcriptionPaths(v142, v154, v155, v156, v157, v158);
    v165 = objc_msgSend_firstObject(v159, v160, v161, v162, v163, v164);

    if (v165)
    {
      uint64_t v171 = objc_msgSend_length(v165, v166, v167, v168, v169, v170);
      v30 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_rejectionRate_tokenProcessingBlock_(v142, v172, (uint64_t)v165, 0, v171, v153 ^ 1u, v153 ^ 1u, a5, 0);
      uint64_t v178 = objc_msgSend_length(v30, v173, v174, v175, v176, v177);
    }
    else
    {
      v30 = 0;
      uint64_t v178 = objc_msgSend_length(0, v166, v167, v168, v169, v170);
    }
    if (v178)
    {
      if (a4) {
        goto LABEL_51;
      }
    }
    else
    {

      v30 = 0;
      if (a4)
      {
LABEL_51:
        uint64_t v184 = objc_msgSend_length(v165, v179, v180, v181, v182, v183);
        objc_msgSend_averageTokenRecognitionScoreForColumnRange_(v142, v185, 0, v184, v186, v187);
        *(void *)a4 = v188;
        if (!a6) {
          goto LABEL_52;
        }
        goto LABEL_56;
      }
    }
    if (!a6)
    {
LABEL_52:
      if (!a7) {
        goto LABEL_58;
      }
      goto LABEL_57;
    }
LABEL_56:
    *a6 = (unint64_t)objc_msgSend_count(v108, v179, v180, v181, v182, v183) > 1;
    if (!a7)
    {
LABEL_58:

      goto LABEL_59;
    }
LABEL_57:
    *a7 = objc_msgSend_isNonTextCandidateTranscriptionWithStrictFiltering_(v142, v179, 1, v181, v182, v183);
    goto LABEL_58;
  }
  v19 = objc_msgSend_mathResult(self, v14, v15, v16, v17, v18);
  v25 = objc_msgSend_preferredTranscription(v19, v20, v21, v22, v23, v24);
  v30 = objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v26, (uint64_t)v25, v27, v28, v29);

  v36 = objc_msgSend_mathResult(self, v31, v32, v33, v34, v35);
  v42 = objc_msgSend_mathResult(self, v37, v38, v39, v40, v41);
  uint64_t v48 = objc_msgSend_tokenColumnCount(v42, v43, v44, v45, v46, v47);
  objc_msgSend_averageTokenScoreForColumnRange_(v36, v49, 0, v48, v50, v51);
  uint64_t v53 = v52;

  if (a4) {
    *(void *)a4 = v53;
  }
  if (a5) {
    *a5 = 0.0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
LABEL_59:

  return v30;
}

- (BOOL)isCandidateMathGroup
{
  if (self->_mathResult) {
    return 1;
  }
  uint64_t v12 = objc_msgSend_preferredLocale(self, a2, v2, v3, v4, v5);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(self->_recognitionResultsByLocale, v8, (uint64_t)v12, v9, v10, v11);
    v19 = objc_msgSend_topTranscription(v13, v14, v15, v16, v17, v18);

    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v19, v20, @" ", (uint64_t)&stru_1F20141C8, v21, v22);
    uint64_t v23 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_ch_mathCharSet(MEMORY[0x1E4F28B88], v24, v25, v26, v27, v28);
    uint64_t v29 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = isStringEntirelyFromSet(v23, v29);

    return (char)v19;
  }
  else
  {

    return 0;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)languageFitnessForLocale:(id)a3
{
  id v4 = a3;
  int64x2_t v22 = vdupq_n_s64(0xC7EFFFFFE0000000);
  uint64_t v10 = objc_msgSend_languageFitnessByLocale(self, v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v4, v12, v13, v14);

  if (v15) {
    objc_msgSend_getValue_(v15, v16, (uint64_t)&v22, v17, v18, v19);
  }

  double v21 = *(double *)&v22.i64[1];
  double v20 = *(double *)v22.i64;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (id)preferredLocale
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  recognitionResultsByLocale = self->_recognitionResultsByLocale;
  languageFitnessByLocale = self->_languageFitnessByLocale;
  orderedLocales = self->_orderedLocales;
  id v81 = 0;
  uint64_t v8 = objc_msgSend_filteredResultsByLocale_orderedLocales_usingLanguageFitness_outSortedLocales_(v3, v7, (uint64_t)recognitionResultsByLocale, (uint64_t)orderedLocales, (uint64_t)languageFitnessByLocale, (uint64_t)&v81);
  id v9 = v81;
  if (!objc_msgSend_count(v8, v10, v11, v12, v13, v14))
  {
    uint64_t v32 = objc_msgSend_allKeys(self->_recognitionResultsByLocale, v15, v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend_localesSortedByRawLanguageFitness_(self, v33, (uint64_t)v32, v34, v35, v36);

    uint64_t v31 = objc_msgSend_firstObject(v25, v37, v38, v39, v40, v41);
    goto LABEL_5;
  }
  if (objc_msgSend_count(v8, v15, v16, v17, v18, v19) == 1)
  {
    uint64_t v25 = objc_msgSend_allKeys(v8, v20, v21, v22, v23, v24);
    uint64_t v31 = objc_msgSend_firstObject(v25, v26, v27, v28, v29, v30);
LABEL_5:
    id v42 = (id)v31;
    goto LABEL_6;
  }
  uint64_t v25 = objc_msgSend_allKeys(v8, v20, v21, v22, v23, v24);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v45 = self->_orderedLocales;
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v77, (uint64_t)v88, 16, v47);
  if (v52)
  {
    uint64_t v53 = *(void *)v78;
LABEL_9:
    uint64_t v54 = 0;
    while (1)
    {
      if (*(void *)v78 != v53) {
        objc_enumerationMutation(v45);
      }
      v55 = *(void **)(*((void *)&v77 + 1) + 8 * v54);
      if (objc_msgSend_containsObject_(v25, v48, (uint64_t)v55, v49, v50, v51, (void)v77)) {
        break;
      }
      if (v52 == ++v54)
      {
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v77, (uint64_t)v88, 16, v51);
        if (v52) {
          goto LABEL_9;
        }
        goto LABEL_15;
      }
    }
    id v42 = v55;

    if (v42) {
      goto LABEL_6;
    }
  }
  else
  {
LABEL_15:
  }
  objc_msgSend_firstObject(v9, v56, v57, v58, v59, v60, (void)v77);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v61 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v25, v62, @", ", (uint64_t)&unk_1F20135D0, v63, v64);
    id v65 = (id)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(self->_orderedLocales, v66, @", ", (uint64_t)&unk_1F20135F0, v67, v68);
    uint64_t v75 = objc_msgSend_localeIdentifier(v42, v70, v71, v72, v73, v74);
    *(_DWORD *)buf = 138412802;
    id v83 = v65;
    __int16 v84 = 2112;
    uint64_t v85 = v69;
    __int16 v86 = 2112;
    v87 = v75;
    _os_log_impl(&dword_1C492D000, v61, OS_LOG_TYPE_ERROR, "Error: unexpected missing preferredLocale with competing locales %@, ordered locales %@, falling back on %@", buf, 0x20u);
  }
  if (!v42)
  {
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v76 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
      {
LABEL_25:

        id v42 = 0;
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v76 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
        goto LABEL_25;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v76, OS_LOG_TYPE_FAULT, "There must be a preferred locale for the filtered results if there exists at least one result.", buf, 2u);
    goto LABEL_25;
  }
LABEL_6:

  id v43 = v42;
  return v43;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_orderedLocales, @"orderedLocales", v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_recognitionResultsByLocale, @"recognitionResultsByLocale", v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_mathResult, @"mathResult", v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_errorsByLocale, @"errorsByLocale", v15, v16);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)self->_inputStrokeIdentifiers, @"inputStrokeIdentifiers", v18, v19);
  double v20 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v26 = objc_msgSend_count(self->_languageFitnessByLocale, v21, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_dictionaryWithCapacity_(v20, v27, v26, v28, v29, v30);
  languageFitnessByLocale = self->_languageFitnessByLocale;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_1C49FDF90;
  v41[3] = &unk_1E64E20E0;
  id v33 = v31;
  id v42 = v33;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(languageFitnessByLocale, v34, (uint64_t)v41, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v33, @"languageFitnessDictByLocale", v39, v40);
}

- (CHStrokeGroupRecognitionResult)initWithCoder:(id)a3
{
  v141[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v141[0] = objc_opt_class();
  v141[1] = objc_opt_class();
  v141[2] = objc_opt_class();
  uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v141, 3, v6, v7);
  uint64_t v13 = objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8, v10, v11, v12);
  uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v14, (uint64_t)v13, @"recognitionResultsByLocale", v15, v16);

  uint64_t v18 = objc_opt_class();
  uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v19, v18, @"mathResult", v20, v21);
  uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
  v140[0] = objc_opt_class();
  v140[1] = objc_opt_class();
  uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v140, 2, v25, v26);
  uint64_t v32 = objc_msgSend_setWithArray_(v23, v28, (uint64_t)v27, v29, v30, v31);
  uint64_t v36 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v33, (uint64_t)v32, @"orderedLocales", v34, v35);

  uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
  v139[0] = objc_opt_class();
  v139[1] = objc_opt_class();
  v139[2] = objc_opt_class();
  uint64_t v41 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v38, (uint64_t)v139, 3, v39, v40);
  uint64_t v46 = objc_msgSend_setWithArray_(v37, v42, (uint64_t)v41, v43, v44, v45);
  uint64_t v50 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v47, (uint64_t)v46, @"errorsByLocale", v48, v49);

  uint64_t v51 = (void *)MEMORY[0x1E4F1CAD0];
  v138[0] = objc_opt_class();
  v138[1] = objc_opt_class();
  v55 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v52, (uint64_t)v138, 2, v53, v54);
  uint64_t v60 = objc_msgSend_setWithArray_(v51, v56, (uint64_t)v55, v57, v58, v59);
  uint64_t v64 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v61, (uint64_t)v60, @"inputStrokeIdentifiers", v62, v63);

  int v69 = objc_msgSend_containsValueForKey_(v3, v65, @"languageFitnessDictByLocale", v66, v67, v68);
  uint64_t v70 = (void *)MEMORY[0x1E4F1CAD0];
  if (v69)
  {
    v137[0] = objc_opt_class();
    v137[1] = objc_opt_class();
    v137[2] = objc_opt_class();
    v137[3] = objc_opt_class();
    uint64_t v74 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v71, (uint64_t)v137, 4, v72, v73);
    long long v79 = objc_msgSend_setWithArray_(v70, v75, (uint64_t)v74, v76, v77, v78);
    id v83 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v80, (uint64_t)v79, @"languageFitnessDictByLocale", v81, v82);

    __int16 v84 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v90 = objc_msgSend_count(v83, v85, v86, v87, v88, v89);
    uint64_t v95 = objc_msgSend_dictionaryWithCapacity_(v84, v91, v90, v92, v93, v94);
    uint64_t v96 = v135;
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = sub_1C49FE72C;
    v135[3] = &unk_1E64E2108;
    id v97 = v95;
    v135[4] = v97;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v83, v98, (uint64_t)v135, v99, v100, v101);
  }
  else
  {
    v136[0] = objc_opt_class();
    v136[1] = objc_opt_class();
    v136[2] = objc_opt_class();
    uint64_t v105 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v102, (uint64_t)v136, 3, v103, v104);
    v110 = objc_msgSend_setWithArray_(v70, v106, (uint64_t)v105, v107, v108, v109);
    id v83 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v111, (uint64_t)v110, @"languageFitnessByLocale", v112, v113);

    uint64_t v114 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v120 = objc_msgSend_count(v83, v115, v116, v117, v118, v119);
    uint64_t v125 = objc_msgSend_dictionaryWithCapacity_(v114, v121, v120, v122, v123, v124);
    uint64_t v96 = v134;
    v134[0] = MEMORY[0x1E4F143A8];
    v134[1] = 3221225472;
    v134[2] = sub_1C49FE85C;
    v134[3] = &unk_1E64E2130;
    id v97 = v125;
    v134[4] = v97;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v83, v126, (uint64_t)v134, v127, v128, v129);
  }

  uint64_t v131 = (CHStrokeGroupRecognitionResult *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(self, v130, (uint64_t)v36, (uint64_t)v17, (uint64_t)v50, (uint64_t)v97, v22, v64, 0);
  return v131;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (CHStrokeGroupRecognitionResult *)v4;
    uint64_t v11 = v5;
    if (self)
    {
      if (self != v5)
      {
        recognitionResultsByLocale = self->_recognitionResultsByLocale;
        objc_msgSend_recognitionResultsByLocale(v5, v6, v7, v8, v9, v10);
        uint64_t v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (recognitionResultsByLocale == v18)
        {
        }
        else
        {
          uint64_t v19 = objc_msgSend_recognitionResultsByLocale(v11, v13, v14, v15, v16, v17);
          int isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)self->_recognitionResultsByLocale, v21, v22, v23);

          if (!isEqual) {
            goto LABEL_22;
          }
        }
        errorsByLocale = self->_errorsByLocale;
        uint64_t v36 = objc_msgSend_errorsByLocale(v11, v25, v26, v27, v28, v29);
        if (errorsByLocale == v36)
        {
        }
        else
        {
          if (!self->_errorsByLocale)
          {
            LOBYTE(self) = 0;
            goto LABEL_27;
          }
          uint64_t v37 = objc_msgSend_errorsByLocale(v11, v31, v32, v33, v34, v35);
          int v42 = objc_msgSend_isEqual_(v37, v38, (uint64_t)self->_errorsByLocale, v39, v40, v41);

          if (!v42) {
            goto LABEL_22;
          }
        }
        languageFitnessByLocale = self->_languageFitnessByLocale;
        objc_msgSend_languageFitnessByLocale(v11, v43, v44, v45, v46, v47);
        uint64_t v54 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (languageFitnessByLocale == v54)
        {

LABEL_20:
          inputStrokeIdentifiers = self->_inputStrokeIdentifiers;
          objc_msgSend_inputStrokeIdentifiers(v11, v61, v62, v63, v64, v65);
          uint64_t v72 = (NSArray *)objc_claimAutoreleasedReturnValue();
          if (inputStrokeIdentifiers == v72)
          {
          }
          else
          {
            uint64_t v73 = objc_msgSend_inputStrokeIdentifiers(v11, v67, v68, v69, v70, v71);
            int v78 = objc_msgSend_isEqual_(v73, v74, (uint64_t)self->_inputStrokeIdentifiers, v75, v76, v77);

            if (!v78) {
              goto LABEL_22;
            }
          }
          mathResult = self->_mathResult;
          uint64_t v36 = objc_msgSend_mathResult(v11, v79, v80, v81, v82, v83);
          if (mathResult == v36)
          {
            LOBYTE(self) = 1;
            uint64_t v36 = mathResult;
          }
          else
          {
            uint64_t v90 = objc_msgSend_mathResult(v11, v85, v86, v87, v88, v89);
            LOBYTE(self) = objc_msgSend_isEqual_(v90, v91, (uint64_t)self->_mathResult, v92, v93, v94);
          }
LABEL_27:

          goto LABEL_28;
        }
        v55 = objc_msgSend_languageFitnessByLocale(v11, v49, v50, v51, v52, v53);
        int v60 = objc_msgSend_isEqual_(v55, v56, (uint64_t)self->_languageFitnessByLocale, v57, v58, v59);

        if (v60) {
          goto LABEL_20;
        }
LABEL_22:
        LOBYTE(self) = 0;
        goto LABEL_28;
      }
      LOBYTE(self) = 1;
    }
LABEL_28:

    goto LABEL_29;
  }
  LOBYTE(self) = 0;
LABEL_29:

  return (char)self;
}

- (NSArray)inputStrokeIdentifiers
{
  return self->_inputStrokeIdentifiers;
}

- (NSDictionary)recognitionResultsByLocale
{
  return self->_recognitionResultsByLocale;
}

- (NSDictionary)errorsByLocale
{
  return self->_errorsByLocale;
}

- (CHTokenizedMathResult)mathResult
{
  return self->_mathResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathResult, 0);
  objc_storeStrong((id *)&self->_errorsByLocale, 0);
  objc_storeStrong((id *)&self->_recognitionResultsByLocale, 0);
  objc_storeStrong((id *)&self->_inputStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedLocales, 0);
  objc_storeStrong((id *)&self->_languageFitnessByLocale, 0);
  objc_storeStrong((id *)&self->_inputDrawingCutPoints, 0);
  objc_storeStrong((id *)&self->_inputDrawing, 0);
}

- (CHStrokeGroupRecognitionResult)initWithOrderedLocales:(id)a3 resultsByLocale:(id)a4 errorsByLocale:(id)a5 languageFitnessByLocale:(id)a6 mathResult:(id)a7 inputStrokeIdentifiers:(id)a8 inputDrawing:(id)a9 inputDrawingCutPoints:(id)a10
{
  id v74 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v75.receiver = self;
  v75.super_class = (Class)CHStrokeGroupRecognitionResult;
  uint64_t v28 = [(CHStrokeGroupRecognitionResult *)&v75 init];
  if (v28)
  {
    uint64_t v29 = objc_msgSend_copy(v74, v23, v24, v25, v26, v27);
    orderedLocales = v28->_orderedLocales;
    v28->_orderedLocales = (NSArray *)v29;

    uint64_t v36 = objc_msgSend_copy(v16, v31, v32, v33, v34, v35);
    recognitionResultsByLocale = v28->_recognitionResultsByLocale;
    v28->_recognitionResultsByLocale = (NSDictionary *)v36;

    uint64_t v43 = objc_msgSend_copy(v18, v38, v39, v40, v41, v42);
    languageFitnessByLocale = v28->_languageFitnessByLocale;
    v28->_languageFitnessByLocale = (NSDictionary *)v43;

    uint64_t v50 = objc_msgSend_copy(v20, v45, v46, v47, v48, v49);
    inputStrokeIdentifiers = v28->_inputStrokeIdentifiers;
    v28->_inputStrokeIdentifiers = (NSArray *)v50;

    objc_storeStrong((id *)&v28->_inputDrawing, a9);
    uint64_t v57 = objc_msgSend_copy(v22, v52, v53, v54, v55, v56);
    inputDrawingCutPoints = v28->_inputDrawingCutPoints;
    v28->_inputDrawingCutPoints = (NSArray *)v57;

    uint64_t v64 = objc_msgSend_copy(v17, v59, v60, v61, v62, v63);
    errorsByLocale = v28->_errorsByLocale;
    v28->_errorsByLocale = (NSDictionary *)v64;

    uint64_t v71 = objc_msgSend_copy(v19, v66, v67, v68, v69, v70);
    mathResult = v28->_mathResult;
    v28->_mathResult = (CHTokenizedMathResult *)v71;
  }
  return v28;
}

- (NSArray)orderedLocales
{
  return self->_orderedLocales;
}

- (CHDrawing)inputDrawing
{
  return self->_inputDrawing;
}

- (NSArray)inputDrawingCutPoints
{
  return self->_inputDrawingCutPoints;
}

- (NSDictionary)languageFitnessByLocale
{
  return self->_languageFitnessByLocale;
}

+ (id)sortedLanguageGroups:(id)a3 usingLanguageFitness:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v18 = objc_msgSend_allKeys(v5, v13, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v45, (uint64_t)v49, 16, v20);
  if (v25)
  {
    uint64_t v26 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v46 != v26) {
          objc_enumerationMutation(v18);
        }
        uint64_t v28 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v5, v21, v28, v22, v23, v24);
        BOOL v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34) == 0;

        if (!v35) {
          objc_msgSend_addObject_(v12, v21, v28, v22, v23, v24);
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v45, (uint64_t)v49, 16, v24);
    }
    while (v25);
  }

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1C49FF104;
  v42[3] = &unk_1E64E2158;
  id v36 = v6;
  id v43 = v36;
  id v37 = v5;
  id v44 = v37;
  objc_msgSend_sortWithOptions_usingComparator_(v12, v38, 16, (uint64_t)v42, v39, v40);

  return v12;
}

+ (id)sortedLocales:(id)a3 usingLanguageFitness:(id)a4 useCombinedScore:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = sub_1C49FF5F0;
  v55[3] = &unk_1E64E2180;
  id v8 = v7;
  id v56 = v8;
  long long v47 = objc_msgSend_sortedArrayWithOptions_usingComparator_(a3, v9, 16, (uint64_t)v55, v10, v11);
  if (v5)
  {
    uint64_t v16 = objc_msgSend_localesByLanguageGroup_(CHRecognizerConfiguration, v12, (uint64_t)v47, v13, v14, v15);
    uint64_t v17 = objc_opt_class();
    long long v46 = objc_msgSend_sortedLanguageGroups_usingLanguageFitness_(v17, v18, (uint64_t)v16, (uint64_t)v8, v19, v20);
    uint64_t v26 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v21, v22, v23, v24, v25);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = v46;
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v51, (uint64_t)v57, 16, v28);
    if (v33)
    {
      uint64_t v34 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v52 != v34) {
            objc_enumerationMutation(obj);
          }
          id v36 = objc_msgSend_objectForKeyedSubscript_(v16, v29, *(void *)(*((void *)&v51 + 1) + 8 * i), v30, v31, v32);
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = sub_1C49FF6F8;
          v49[3] = &unk_1E64E2180;
          id v50 = v8;
          uint64_t v40 = objc_msgSend_sortedArrayWithOptions_usingComparator_(v36, v37, 16, (uint64_t)v49, v38, v39);

          objc_msgSend_addObjectsFromArray_(v26, v41, (uint64_t)v40, v42, v43, v44);
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v51, (uint64_t)v57, 16, v32);
      }
      while (v33);
    }
  }
  else
  {
    uint64_t v26 = v47;
  }

  return v26;
}

+ (id)textTranscriptionsForSortedGroupCluster:(id)a3 recognizedResultsByGroupID:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v92 = a4;
  uint64_t v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  obuint64_t j = v5;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v93, (uint64_t)v97, 16, v13);
  if (v19)
  {
    uint64_t v20 = *(void *)v94;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v94 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = NSNumber;
        uint64_t v23 = objc_msgSend_uniqueIdentifier(*(void **)(*((void *)&v93 + 1) + 8 * v21), v14, v15, v16, v17, v18);
        uint64_t v28 = objc_msgSend_numberWithInteger_(v22, v24, v23, v25, v26, v27);
        uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v92, v29, v28, v30, v31, v32);

        uint64_t v39 = objc_msgSend_preferredLocale(v33, v34, v35, v36, v37, v38);
        LOBYTE(v28) = v39 == 0;

        if ((v28 & 1) == 0)
        {
          long long v45 = objc_msgSend_recognitionResultsByLocale(v33, v40, v41, v42, v43, v44);
          long long v51 = objc_msgSend_preferredLocale(v33, v46, v47, v48, v49, v50);
          id v56 = objc_msgSend_objectForKeyedSubscript_(v45, v52, (uint64_t)v51, v53, v54, v55);
          objc_msgSend_topTranscription(v56, v57, v58, v59, v60, v61);
          uint64_t v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
          objc_msgSend_addObject_(v11, v79, (uint64_t)v62, v80, v81, v82);
          goto LABEL_11;
        }
        uint64_t v63 = objc_msgSend_mathResult(v33, v40, v41, v42, v43, v44);
        BOOL v64 = v63 == 0;

        if (!v64)
        {
          long long v45 = objc_msgSend_mathResult(v33, v65, v66, v67, v68, v69);
          long long v51 = objc_msgSend_preferredTranscription(v45, v70, v71, v72, v73, v74);
          objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v75, (uint64_t)v51, v76, v77, v78);
          uint64_t v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        uint64_t v62 = &stru_1F20141C8;
        objc_msgSend_addObject_(v11, v65, (uint64_t)&stru_1F20141C8, v67, v68, v69);
LABEL_11:

        ++v21;
      }
      while (v19 != v21);
      uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v93, (uint64_t)v97, 16, v18);
      uint64_t v19 = v83;
    }
    while (v83);
  }

  uint64_t v89 = objc_msgSend_copy(v11, v84, v85, v86, v87, v88);
  return v89;
}

+ (id)filteredResultsByLocale:(id)a3 orderedLocales:(id)a4 usingLanguageFitness:(id)a5 outSortedLocales:(id *)a6
{
  uint64_t v294 = *MEMORY[0x1E4F143B8];
  id v254 = a3;
  id v243 = a4;
  id v255 = a5;
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10, v11, v12, v13);
  id v251 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17, v18);
  id v252 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = objc_msgSend_allKeys(v254, v19, v20, v21, v22, v23);
  uint64_t v27 = objc_msgSend_sortedLocales_usingLanguageFitness_useCombinedScore_(a1, v25, (uint64_t)v24, (uint64_t)v255, 0, v26);

  v239 = (void *)v27;
  v250 = objc_msgSend_localesByLanguageGroup_(CHRecognizerConfiguration, v28, v27, v29, v30, v31);
  uint64_t v37 = objc_msgSend_modelNameLatin(CHRecognizerConfiguration, v32, v33, v34, v35, v36);
  uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v250, v38, (uint64_t)v37, v39, v40, v41);
  uint64_t v48 = objc_msgSend_count(v42, v43, v44, v45, v46, v47);

  v242 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v49, (uint64_t)&unk_1F203DA10, v50, v51, v52);
  if (v48)
  {
    v280[0] = MEMORY[0x1E4F143A8];
    v280[1] = 3221225472;
    v280[2] = sub_1C4A00984;
    v280[3] = &unk_1E64E21D0;
    id v281 = v242;
    uint64_t v53 = (void *)MEMORY[0x1C8786E90](v280);
    long long v278 = 0u;
    long long v279 = 0u;
    long long v276 = 0u;
    long long v277 = 0u;
    uint64_t v59 = objc_msgSend_allNonLatinModelNames(CHRecognizerConfiguration, v54, v55, v56, v57, v58);
    uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v276, (uint64_t)v293, 16, v61);
    if (v66)
    {
      uint64_t v67 = *(void *)v277;
      do
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v277 != v67) {
            objc_enumerationMutation(v59);
          }
          uint64_t v69 = *(void *)(*((void *)&v276 + 1) + 8 * i);
          uint64_t v70 = objc_msgSend_objectForKeyedSubscript_(v250, v62, v69, v63, v64, v65);
          uint64_t v71 = sub_1C4A009F4((uint64_t)CHStrokeGroupRecognitionResult, v70, v254, v53);

          objc_msgSend_setObject_forKeyedSubscript_(v250, v72, (uint64_t)v71, v69, v73, v74);
        }
        uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v62, (uint64_t)&v276, (uint64_t)v293, 16, v65);
      }
      while (v66);
    }
  }
  uint64_t v75 = sub_1C49FFB70((uint64_t)CHStrokeGroupRecognitionResult, @"zh", v243);
  if (v75 >= sub_1C49FFB70((uint64_t)CHStrokeGroupRecognitionResult, @"yue", v243)) {
    uint64_t v76 = @"yue";
  }
  else {
    uint64_t v76 = @"zh";
  }
  uint64_t v77 = sub_1C49FFB70((uint64_t)CHStrokeGroupRecognitionResult, v76, v243);
  uint64_t v78 = sub_1C49FFB70((uint64_t)CHStrokeGroupRecognitionResult, @"ja", v243);
  if (v77 != 0x7FFFFFFFFFFFFFFFLL && v78 != 0x7FFFFFFFFFFFFFFFLL && v77 < v78)
  {
    __int16 v84 = objc_msgSend_modelNameJapanese(CHRecognizerConfiguration, v79, v80, v81, v82, v83);
    uint64_t v89 = objc_msgSend_objectForKeyedSubscript_(v250, v85, (uint64_t)v84, v86, v87, v88);
    uint64_t v90 = sub_1C4A009F4((uint64_t)CHStrokeGroupRecognitionResult, v89, v254, &unk_1F2013610);

    long long v96 = objc_msgSend_modelNameJapanese(CHRecognizerConfiguration, v91, v92, v93, v94, v95);
    objc_msgSend_setObject_forKeyedSubscript_(v250, v97, (uint64_t)v90, (uint64_t)v96, v98, v99);
  }
  uint64_t v100 = objc_opt_class();
  v241 = objc_msgSend_sortedLanguageGroups_usingLanguageFitness_(v100, v101, (uint64_t)v250, (uint64_t)v255, v102, v103);
  BOOL v109 = (unint64_t)objc_msgSend_count(v254, v104, v105, v106, v107, v108) > 1;
  v248 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v110, v111, v112, v113, v114);
  long long v274 = 0u;
  long long v275 = 0u;
  long long v272 = 0u;
  long long v273 = 0u;
  obuint64_t j = v241;
  uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v115, (uint64_t)&v272, (uint64_t)v292, 16, v116);
  double v122 = dbl_1C4C3A8A0[v109];
  if (v121)
  {
    uint64_t v123 = *(void *)v273;
    double v124 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v121; ++j)
      {
        if (*(void *)v273 != v123) {
          objc_enumerationMutation(obj);
        }
        uint64_t v126 = *(void *)(*((void *)&v272 + 1) + 8 * j);
        uint64_t v127 = objc_msgSend_objectForKeyedSubscript_(v250, v117, v126, v118, v119, v120);
        v133 = objc_msgSend_firstObject(v127, v128, v129, v130, v131, v132);
        v138 = objc_msgSend_objectForKeyedSubscript_(v255, v134, (uint64_t)v133, v135, v136, v137);
        objc_msgSend_getValue_(v138, v139, (uint64_t)buf, v140, v141, v142);

        double v143 = *(double *)buf;
        if (*(double *)buf >= v122 && v124 <= 0.9)
        {
          double v143 = v124 - *(double *)buf;
          if (v124 - *(double *)buf <= 0.01)
          {
            objc_msgSend_addObject_(v248, v117, v126, v118, v119, v120, v143);
            double v143 = *(double *)buf;
            if (*(double *)buf > v124) {
              double v124 = *(double *)buf;
            }
          }
        }
      }
      uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v117, (uint64_t)&v272, (uint64_t)v292, 16, v120, v143);
    }
    while (v121);
  }

  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  id v244 = v248;
  uint64_t v246 = objc_msgSend_countByEnumeratingWithState_objects_count_(v244, v144, (uint64_t)&v268, (uint64_t)v291, 16, v145);
  if (v246)
  {
    uint64_t v245 = *(void *)v269;
    do
    {
      for (uint64_t k = 0; k != v246; ++k)
      {
        if (*(void *)v269 != v245) {
          objc_enumerationMutation(v244);
        }
        uint64_t v151 = *(void *)(*((void *)&v268 + 1) + 8 * k);
        v253 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v146, v147, v148, v149, v150);
        long long v266 = 0u;
        long long v267 = 0u;
        long long v264 = 0u;
        long long v265 = 0u;
        uint64_t v156 = objc_msgSend_objectForKeyedSubscript_(v250, v152, v151, v153, v154, v155);
        uint64_t v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v156, v157, (uint64_t)&v264, (uint64_t)v290, 16, v158);
        if (v163)
        {
          uint64_t v164 = *(void *)v265;
          double v165 = 0.0;
          do
          {
            for (uint64_t m = 0; m != v163; ++m)
            {
              if (*(void *)v265 != v164) {
                objc_enumerationMutation(v156);
              }
              uint64_t v168 = *(void **)(*((void *)&v264 + 1) + 8 * m);
              uint64_t v169 = objc_msgSend_objectForKeyedSubscript_(v255, v159, (uint64_t)v168, v160, v161, v162);
              objc_msgSend_getValue_(v169, v170, (uint64_t)&v262, v171, v172, v173);

              if (v262 < v122 || v165 - v262 > 0.1)
              {
                if (qword_1EA3CA000 != -1) {
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                }
                uint64_t v178 = (id)qword_1EA3C9FA0;
                if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend_localeIdentifier(v168, v179, v180, v181, v182, v183);
                  id v184 = objc_claimAutoreleasedReturnValue();
                  uint64_t v190 = objc_msgSend_UTF8String(v184, v185, v186, v187, v188, v189);
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = v190;
                  __int16 v284 = 2048;
                  double v285 = v262;
                  __int16 v286 = 2048;
                  double v287 = v165;
                  __int16 v288 = 2048;
                  uint64_t v289 = *(void *)&v122;
                  _os_log_impl(&dword_1C492D000, v178, OS_LOG_TYPE_DEBUG, "Filtering results for locale %s based on raw fitness score %.3f. (best score: %.3f, threshold: %.3f)\n", buf, 0x2Au);
                }
              }
              else
              {
                objc_msgSend_addObject_(v253, v174, (uint64_t)v168, v175, v176, v177, v165 - v262);
                double v167 = v262;
                if (v262 > v165) {
                  double v165 = v262;
                }
              }
            }
            uint64_t v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v156, v159, (uint64_t)&v264, (uint64_t)v290, 16, v162, v167);
          }
          while (v163);
        }

        v260[0] = MEMORY[0x1E4F143A8];
        v260[1] = 3221225472;
        v260[2] = sub_1C4A00D14;
        v260[3] = &unk_1E64E2180;
        id v191 = v255;
        id v261 = v191;
        objc_msgSend_sortUsingComparator_(v253, v192, (uint64_t)v260, v193, v194, v195);
        long long v258 = 0u;
        long long v259 = 0u;
        long long v256 = 0u;
        long long v257 = 0u;
        id v196 = v253;
        uint64_t v203 = objc_msgSend_countByEnumeratingWithState_objects_count_(v196, v197, (uint64_t)&v256, (uint64_t)v282, 16, v198);
        if (v203)
        {
          uint64_t v204 = *(void *)v257;
          double v205 = 0.0;
          do
          {
            uint64_t v206 = 0;
            do
            {
              if (*(void *)v257 != v204) {
                objc_enumerationMutation(v196);
              }
              long long v207 = *(void **)(*((void *)&v256 + 1) + 8 * v206);
              long long v208 = objc_msgSend_objectForKeyedSubscript_(v191, v199, (uint64_t)v207, v200, v201, v202);
              objc_msgSend_getValue_(v208, v209, (uint64_t)&v262, v210, v211, v212);

              v220 = objc_msgSend_objectForKey_(v254, v213, (uint64_t)v207, v214, v215, v216);
              if (v220)
              {
                if (v205 - v263 <= 0.01)
                {
                  objc_msgSend_setObject_forKey_(v251, v217, (uint64_t)v220, (uint64_t)v207, v218, v219, v205 - v263);
                  objc_msgSend_addObject_(v252, v234, (uint64_t)v207, v235, v236, v237);
                  if (v263 > v205) {
                    double v205 = v263;
                  }
                }
                else
                {
                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  v221 = (id)qword_1EA3C9FA0;
                  if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend_localeIdentifier(v207, v222, v223, v224, v225, v226);
                    id v227 = objc_claimAutoreleasedReturnValue();
                    uint64_t v233 = objc_msgSend_UTF8String(v227, v228, v229, v230, v231, v232);
                    *(_DWORD *)buf = 136315906;
                    *(void *)&uint8_t buf[4] = v233;
                    __int16 v284 = 2048;
                    double v285 = v263;
                    __int16 v286 = 2048;
                    double v287 = v205;
                    __int16 v288 = 2048;
                    uint64_t v289 = 0x3F847AE147AE147BLL;
                    _os_log_impl(&dword_1C492D000, v221, OS_LOG_TYPE_DEBUG, "Filtering results for locale %s based on combined fitness score %.3f. (best score: %.3f, gap threshold: %.3f)\n", buf, 0x2Au);
                  }
                }
              }

              ++v206;
            }
            while (v203 != v206);
            uint64_t v203 = objc_msgSend_countByEnumeratingWithState_objects_count_(v196, v199, (uint64_t)&v256, (uint64_t)v282, 16, v202);
          }
          while (v203);
        }
      }
      uint64_t v246 = objc_msgSend_countByEnumeratingWithState_objects_count_(v244, v146, (uint64_t)&v268, (uint64_t)v291, 16, v150);
    }
    while (v246);
  }

  if (a6) {
    *a6 = v252;
  }

  return v251;
}

- (BOOL)hasPrincipalLines
{
  uint64_t v7 = objc_msgSend_preferredLocale(self, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(self->_recognitionResultsByLocale, v8, (uint64_t)v7, v9, v10, v11);
  uint64_t v18 = objc_msgSend_topModelTranscriptionPath(v12, v13, v14, v15, v16, v17);
  char hasValidPrincipalLinesForPath = objc_msgSend_hasValidPrincipalLinesForPath_(v12, v19, (uint64_t)v18, v20, v21, v22);

  return hasValidPrincipalLinesForPath;
}

- (id)textStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult:(id)a3
{
  v490[1] = *MEMORY[0x1E4F143B8];
  id v470 = a3;
  v472 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v3, v4, v5, v6, v7);
  v471 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9, v10, v11, v12);
  uint64_t v23 = objc_msgSend_mathResult(self, v13, v14, v15, v16, v17);
  if (v23)
  {
    uint64_t v24 = objc_msgSend_mathResult(v470, v18, v19, v20, v21, v22);

    if (v24)
    {
      uint64_t v25 = objc_msgSend_orderedLocales(self, v18, v19, v20, v21, v22);
      uint64_t v31 = objc_msgSend_orderedLocales(self, v26, v27, v28, v29, v30);
      uint64_t v37 = objc_msgSend_count(v31, v32, v33, v34, v35, v36);

      if (!v37)
      {
        uint64_t v43 = objc_msgSend_orderedLocales(v470, v38, v39, v40, v41, v42);
        uint64_t v49 = objc_msgSend_count(v43, v44, v45, v46, v47, v48);

        if (v49)
        {
          uint64_t v55 = objc_msgSend_orderedLocales(v470, v50, v51, v52, v53, v54);
        }
        else
        {
          id v261 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v50, @"en_US", v52, v53, v54);
          v490[0] = v261;
          uint64_t v55 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v262, (uint64_t)v490, 1, v263, v264);
        }
        uint64_t v25 = v55;
      }
      long long v265 = objc_msgSend_preferredLocale(self, v38, v39, v40, v41, v42);
      BOOL v266 = v265 == 0;

      if (v266)
      {
        v283 = objc_msgSend_mathResult(self, v267, v268, v269, v270, v271);
        uint64_t v289 = objc_msgSend_firstObject(v25, v284, v285, v286, v287, v288);
        v166 = objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v290, (uint64_t)v283, (uint64_t)v289, v291, v292);

        long long v272 = objc_msgSend_inputStrokeIdentifiers(self, v293, v294, v295, v296, v297);
        objc_msgSend_setInputStrokeIdentifiers_(v166, v298, (uint64_t)v272, v299, v300, v301);
      }
      else
      {
        long long v272 = objc_msgSend_recognitionResultsByLocale(self, v267, v268, v269, v270, v271);
        long long v278 = objc_msgSend_preferredLocale(self, v273, v274, v275, v276, v277);
        v166 = objc_msgSend_objectForKeyedSubscript_(v272, v279, (uint64_t)v278, v280, v281, v282);
      }
      v307 = objc_msgSend_preferredLocale(v470, v302, v303, v304, v305, v306);
      BOOL v308 = v307 == 0;

      if (v308)
      {
        v326 = objc_msgSend_mathResult(v470, v309, v310, v311, v312, v313);
        v332 = objc_msgSend_firstObject(v25, v327, v328, v329, v330, v331);
        v325 = objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v333, (uint64_t)v326, (uint64_t)v332, v334, v335);

        v314 = objc_msgSend_inputStrokeIdentifiers(v470, v336, v337, v338, v339, v340);
        objc_msgSend_setInputStrokeIdentifiers_(v325, v341, (uint64_t)v314, v342, v343, v344);
      }
      else
      {
        v314 = objc_msgSend_recognitionResultsByLocale(v470, v309, v310, v311, v312, v313);
        v320 = objc_msgSend_preferredLocale(v470, v315, v316, v317, v318, v319);
        v325 = objc_msgSend_objectForKeyedSubscript_(v314, v321, (uint64_t)v320, v322, v323, v324);
      }
      v349 = objc_msgSend_tokenizedTextResultByAppendingTokenizedTextResult_(v166, v345, (uint64_t)v325, v346, v347, v348);
      v355 = objc_msgSend_firstObject(v25, v350, v351, v352, v353, v354);
      objc_msgSend_languageFitnessForLocale_recognitionMode_(v349, v356, (uint64_t)v355, 6, v357, v358);
      *(void *)buf = v359;
      uint64_t v486 = v360;

      v366 = objc_msgSend_firstObject(v25, v361, v362, v363, v364, v365);
      objc_msgSend_setObject_forKeyedSubscript_(v472, v367, (uint64_t)v349, (uint64_t)v366, v368, v369);

      v373 = objc_msgSend_value_withObjCType_(MEMORY[0x1E4F29238], v370, (uint64_t)buf, (uint64_t)"{?=dd}", v371, v372);
      v379 = objc_msgSend_firstObject(v25, v374, v375, v376, v377, v378);
      objc_msgSend_setObject_forKeyedSubscript_(v471, v380, (uint64_t)v373, (uint64_t)v379, v381, v382);

      goto LABEL_49;
    }
  }
  uint64_t v56 = objc_msgSend_mathResult(self, v18, v19, v20, v21, v22);

  if (v56)
  {
    uint64_t v62 = objc_msgSend_preferredLocale(self, v57, v58, v59, v60, v61);

    if (v62)
    {
      uint64_t v68 = objc_msgSend_recognitionResultsByLocale(self, v63, v64, v65, v66, v67);
      uint64_t v74 = objc_msgSend_preferredLocale(self, v69, v70, v71, v72, v73);
      long long v79 = objc_msgSend_objectForKeyedSubscript_(v68, v75, (uint64_t)v74, v76, v77, v78);
    }
    else
    {
      uint64_t v104 = objc_msgSend_mathResult(self, v63, v64, v65, v66, v67);
      v110 = objc_msgSend_preferredLocale(v470, v105, v106, v107, v108, v109);
      long long v79 = objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v111, (uint64_t)v104, (uint64_t)v110, v112, v113);

      uint64_t v68 = objc_msgSend_inputStrokeIdentifiers(self, v114, v115, v116, v117, v118);
      objc_msgSend_setInputStrokeIdentifiers_(v79, v119, (uint64_t)v68, v120, v121, v122);
    }

    long long v483 = 0u;
    long long v484 = 0u;
    long long v481 = 0u;
    long long v482 = 0u;
    objc_msgSend_recognitionResultsByLocale(v470, v123, v124, v125, v126, v127);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v128, (uint64_t)&v481, (uint64_t)v489, 16, v129);
    uint64_t v136 = v79;
    if (v135)
    {
      uint64_t v137 = *(void *)v482;
      do
      {
        for (uint64_t i = 0; i != v135; ++i)
        {
          if (*(void *)v482 != v137) {
            objc_enumerationMutation(obj);
          }
          uint64_t v139 = *(void *)(*((void *)&v481 + 1) + 8 * i);
          uint64_t v140 = objc_msgSend_recognitionResultsByLocale(v470, v130, v131, v132, v133, v134);
          uint64_t v145 = objc_msgSend_objectForKeyedSubscript_(v140, v141, v139, v142, v143, v144);

          uint64_t v150 = objc_msgSend_tokenizedTextResultByAppendingTokenizedTextResult_(v136, v146, (uint64_t)v145, v147, v148, v149);
          *(void *)buf = 0;
          uint64_t v486 = 0;
          objc_msgSend_languageFitnessForLocale_recognitionMode_(v150, v151, v139, 6, v152, v153);
          *(void *)buf = v154;
          uint64_t v486 = v155;
          objc_msgSend_setObject_forKeyedSubscript_(v472, v156, (uint64_t)v150, v139, v157, v158);
          uint64_t v162 = objc_msgSend_value_withObjCType_(MEMORY[0x1E4F29238], v159, (uint64_t)buf, (uint64_t)"{?=dd}", v160, v161);
          objc_msgSend_setObject_forKeyedSubscript_(v471, v163, (uint64_t)v162, v139, v164, v165);
        }
        uint64_t v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v130, (uint64_t)&v481, (uint64_t)v489, 16, v134);
      }
      while (v135);
    }

    v166 = v136;
    uint64_t v172 = objc_msgSend_orderedLocales(v470, v167, v168, v169, v170, v171);
LABEL_48:
    uint64_t v25 = v172;
LABEL_49:

LABEL_50:
    v451 = objc_msgSend_inputStrokeIdentifiers(self, v256, v257, v258, v259, v260);
    v457 = objc_msgSend_inputStrokeIdentifiers(v470, v452, v453, v454, v455, v456);
    v462 = objc_msgSend_arrayByAddingObjectsFromArray_(v451, v458, (uint64_t)v457, v459, v460, v461);

    v463 = [CHStrokeGroupRecognitionResult alloc];
    v465 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(v463, v464, (uint64_t)v25, (uint64_t)v472, MEMORY[0x1E4F1CC08], (uint64_t)v471, 0, v462);

    goto LABEL_51;
  }
  uint64_t v80 = objc_msgSend_mathResult(v470, v57, v58, v59, v60, v61);

  if (v80)
  {
    uint64_t v86 = objc_msgSend_preferredLocale(v470, v81, v82, v83, v84, v85);

    if (v86)
    {
      uint64_t v92 = objc_msgSend_recognitionResultsByLocale(v470, v87, v88, v89, v90, v91);
      uint64_t v98 = objc_msgSend_preferredLocale(v470, v93, v94, v95, v96, v97);
      uint64_t v103 = objc_msgSend_objectForKeyedSubscript_(v92, v99, (uint64_t)v98, v100, v101, v102);
    }
    else
    {
      v383 = objc_msgSend_mathResult(v470, v87, v88, v89, v90, v91);
      v389 = objc_msgSend_preferredLocale(self, v384, v385, v386, v387, v388);
      uint64_t v103 = objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v390, (uint64_t)v383, (uint64_t)v389, v391, v392);

      uint64_t v92 = objc_msgSend_inputStrokeIdentifiers(v470, v393, v394, v395, v396, v397);
      objc_msgSend_setInputStrokeIdentifiers_(v103, v398, (uint64_t)v92, v399, v400, v401);
    }

    long long v479 = 0u;
    long long v480 = 0u;
    long long v477 = 0u;
    long long v478 = 0u;
    v407 = objc_msgSend_recognitionResultsByLocale(self, v402, v403, v404, v405, v406);
    id obja = v407;
    uint64_t v415 = objc_msgSend_countByEnumeratingWithState_objects_count_(v407, v408, (uint64_t)&v477, (uint64_t)v488, 16, v409);
    uint64_t v416 = (uint64_t)v103;
    if (v415)
    {
      uint64_t v417 = *(void *)v478;
      do
      {
        for (uint64_t j = 0; j != v415; ++j)
        {
          if (*(void *)v478 != v417) {
            objc_enumerationMutation(obja);
          }
          uint64_t v419 = *(void *)(*((void *)&v477 + 1) + 8 * j);
          v420 = objc_msgSend_recognitionResultsByLocale(self, v410, v411, v412, v413, v414);
          v425 = objc_msgSend_objectForKeyedSubscript_(v420, v421, v419, v422, v423, v424);

          v430 = objc_msgSend_tokenizedTextResultByAppendingTokenizedTextResult_(v425, v426, v416, v427, v428, v429);
          *(void *)buf = 0;
          uint64_t v486 = 0;
          objc_msgSend_languageFitnessForLocale_recognitionMode_(v430, v431, v419, 6, v432, v433);
          *(void *)buf = v434;
          uint64_t v486 = v435;
          objc_msgSend_setObject_forKeyedSubscript_(v472, v436, (uint64_t)v430, v419, v437, v438);
          v442 = objc_msgSend_value_withObjCType_(MEMORY[0x1E4F29238], v439, (uint64_t)buf, (uint64_t)"{?=dd}", v440, v441);
          objc_msgSend_setObject_forKeyedSubscript_(v471, v443, (uint64_t)v442, v419, v444, v445);
        }
        v407 = obja;
        uint64_t v415 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v410, (uint64_t)&v477, (uint64_t)v488, 16, v414);
      }
      while (v415);
    }

    v166 = (void *)v416;
    uint64_t v172 = objc_msgSend_orderedLocales(self, v446, v447, v448, v449, v450);
    goto LABEL_48;
  }
  uint64_t v173 = objc_msgSend_recognitionResultsByLocale(self, v81, v82, v83, v84, v85);
  v179 = objc_msgSend_allKeys(v173, v174, v175, v176, v177, v178);
  v185 = objc_msgSend_recognitionResultsByLocale(v470, v180, v181, v182, v183, v184);
  id v191 = objc_msgSend_allKeys(v185, v186, v187, v188, v189, v190);
  char isEqualToArray = objc_msgSend_isEqualToArray_(v179, v192, (uint64_t)v191, v193, v194, v195);

  if (isEqualToArray)
  {
    long long v475 = 0u;
    long long v476 = 0u;
    long long v473 = 0u;
    long long v474 = 0u;
    uint64_t v202 = objc_msgSend_recognitionResultsByLocale(self, v197, v198, v199, v200, v201);
    uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v202, v203, (uint64_t)&v473, (uint64_t)v487, 16, v204);
    if (v210)
    {
      uint64_t v211 = *(void *)v474;
      do
      {
        for (uint64_t k = 0; k != v210; ++k)
        {
          if (*(void *)v474 != v211) {
            objc_enumerationMutation(v202);
          }
          uint64_t v213 = *(void *)(*((void *)&v473 + 1) + 8 * k);
          uint64_t v214 = objc_msgSend_recognitionResultsByLocale(self, v205, v206, v207, v208, v209);
          uint64_t v219 = objc_msgSend_objectForKeyedSubscript_(v214, v215, v213, v216, v217, v218);

          uint64_t v225 = objc_msgSend_recognitionResultsByLocale(v470, v220, v221, v222, v223, v224);
          uint64_t v230 = objc_msgSend_objectForKeyedSubscript_(v225, v226, v213, v227, v228, v229);

          uint64_t v235 = objc_msgSend_tokenizedTextResultByAppendingTokenizedTextResult_(v219, v231, (uint64_t)v230, v232, v233, v234);
          *(void *)buf = 0;
          uint64_t v486 = 0;
          objc_msgSend_languageFitnessForLocale_recognitionMode_(v235, v236, v213, 6, v237, v238);
          *(void *)buf = v239;
          uint64_t v486 = v240;
          objc_msgSend_setObject_forKeyedSubscript_(v472, v241, (uint64_t)v235, v213, v242, v243);
          v247 = objc_msgSend_value_withObjCType_(MEMORY[0x1E4F29238], v244, (uint64_t)buf, (uint64_t)"{?=dd}", v245, v246);
          objc_msgSend_setObject_forKeyedSubscript_(v471, v248, (uint64_t)v247, v213, v249, v250);
        }
        uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v202, v205, (uint64_t)&v473, (uint64_t)v487, 16, v209);
      }
      while (v210);
    }

    uint64_t v25 = objc_msgSend_orderedLocales(self, v251, v252, v253, v254, v255);
    goto LABEL_50;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v25 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v25, OS_LOG_TYPE_ERROR, "Can't append recognitionResults of CHStrokeGroupRecognitionResult with different locales.", buf, 2u);
  }
  v465 = 0;
LABEL_51:

  return v465;
}

- (id)mathStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult:(id)a3 wrapTextResult:(BOOL)a4
{
  id v6 = a3;
  uint64_t v17 = objc_msgSend_mathResult(self, v7, v8, v9, v10, v11);
  id v213 = v6;
  if (v17)
  {
    uint64_t v18 = objc_msgSend_mathResult(v6, v12, v13, v14, v15, v16);

    if (v18)
    {
      uint64_t v19 = objc_msgSend_mathResult(self, v12, v13, v14, v15, v16);
      uint64_t v25 = objc_msgSend_mathResult(v6, v20, v21, v22, v23, v24);
      uint64_t v31 = objc_msgSend_topTranscription(v19, v26, v27, v28, v29, v30);
      uint64_t v37 = objc_msgSend_length(v31, v32, v33, v34, v35, v36);

      uint64_t v43 = v25;
      if (v37
        && (objc_msgSend_topTranscription(v25, v38, v39, v40, v41, v42),
            uint64_t v44 = objc_claimAutoreleasedReturnValue(),
            uint64_t v50 = objc_msgSend_length(v44, v45, v46, v47, v48, v49),
            v44,
            uint64_t v43 = v19,
            v50))
      {
        objc_msgSend_tokenizedMathResultByAppendingTokenizedMathResult_(v19, v51, (uint64_t)v25, v52, v53, v54);
        id v55 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v55 = v43;
      }
      uint64_t v72 = v55;
      uint64_t v73 = objc_msgSend_inputStrokeIdentifiers(self, v56, v57, v58, v59, v60);
      long long v79 = objc_msgSend_inputStrokeIdentifiers(v6, v74, v75, v76, v77, v78);
      uint64_t v84 = objc_msgSend_arrayByAddingObjectsFromArray_(v73, v80, (uint64_t)v79, v81, v82, v83);

      uint64_t v85 = [CHStrokeGroupRecognitionResult alloc];
      uint64_t v87 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(v85, v86, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CC08], v72, v84);

      goto LABEL_21;
    }
  }
  uint64_t v61 = objc_msgSend_mathResult(self, v12, v13, v14, v15, v16);
  if (v61)
  {

LABEL_11:
    uint64_t v94 = objc_msgSend_mathResult(self, v67, v68, v69, v70, v71);
    if (v94)
    {
      uint64_t v95 = objc_msgSend_recognitionResultsByLocale(v6, v89, v90, v91, v92, v93);
      objc_msgSend_preferredLocale(v6, v96, v97, v98, v99, v100);
    }
    else
    {
      uint64_t v95 = objc_msgSend_recognitionResultsByLocale(self, v89, v90, v91, v92, v93);
      objc_msgSend_preferredLocale(self, v106, v107, v108, v109, v110);
    uint64_t v101 = };
    uint64_t v111 = objc_msgSend_objectForKeyedSubscript_(v95, v102, (uint64_t)v101, v103, v104, v105);

    uint64_t v214 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v112, v113, v114, v115, v116);
    for (unint64_t i = 0; ; ++i)
    {
      uint64_t v123 = objc_msgSend_transcriptionPaths(v111, v117, v118, v119, v120, v121);
      unint64_t v129 = objc_msgSend_count(v123, v124, v125, v126, v127, v128);

      if (i >= v129) {
        break;
      }
      uint64_t v135 = objc_msgSend_transcriptionPaths(v111, v130, v131, v132, v133, v134);
      uint64_t v140 = objc_msgSend_objectAtIndexedSubscript_(v135, v136, i, v137, v138, v139);

      uint64_t v146 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v141, v142, v143, v144, v145);
      uint64_t v152 = objc_msgSend_tokenColumnCount(v111, v147, v148, v149, v150, v151);
      v216[0] = MEMORY[0x1E4F143A8];
      v216[1] = 3221225472;
      v216[2] = sub_1C4A02500;
      v216[3] = &unk_1E64E2240;
      BOOL v218 = a4;
      id v153 = v146;
      id v217 = v153;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v111, v154, (uint64_t)v140, 0, v152, (uint64_t)v216);
      uint64_t v160 = objc_msgSend_copy(v153, v155, v156, v157, v158, v159);
      objc_msgSend_addObject_(v214, v161, (uint64_t)v160, v162, v163, v164);

      id v6 = v213;
    }
    uint64_t v165 = [CHTokenizedMathResult alloc];
    uint64_t v170 = objc_msgSend_initWithBestPathTokens_(v165, v166, (uint64_t)v214, v167, v168, v169);
    uint64_t v176 = objc_msgSend_mathResult(self, v171, v172, v173, v174, v175);

    if (v176)
    {
      uint64_t v182 = objc_msgSend_mathResult(self, v177, v178, v179, v180, v181);
      objc_msgSend_tokenizedMathResultByAppendingTokenizedMathResult_(v182, v183, (uint64_t)v170, v184, v185, v186);
    }
    else
    {
      uint64_t v182 = objc_msgSend_mathResult(v6, v177, v178, v179, v180, v181);
      objc_msgSend_tokenizedMathResultByAppendingTokenizedMathResult_(v170, v187, (uint64_t)v182, v188, v189, v190);
    id v191 = };

    v197 = objc_msgSend_inputStrokeIdentifiers(self, v192, v193, v194, v195, v196);
    uint64_t v203 = objc_msgSend_inputStrokeIdentifiers(v6, v198, v199, v200, v201, v202);
    uint64_t v208 = objc_msgSend_arrayByAddingObjectsFromArray_(v197, v204, (uint64_t)v203, v205, v206, v207);

    uint64_t v209 = [CHStrokeGroupRecognitionResult alloc];
    uint64_t v87 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(v209, v210, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CC08], v191, v208);

    id v6 = v213;
    goto LABEL_21;
  }
  uint64_t v88 = objc_msgSend_mathResult(v6, v62, v63, v64, v65, v66);

  if (v88) {
    goto LABEL_11;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v212 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v212, OS_LOG_TYPE_ERROR, "Can't append two text CHStrokeGroupRecognitionResult with into math StrokeGroupRecognitionResult.", buf, 2u);
  }

  uint64_t v87 = 0;
LABEL_21:

  return v87;
}

@end