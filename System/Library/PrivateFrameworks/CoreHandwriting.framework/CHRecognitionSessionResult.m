@interface CHRecognitionSessionResult
+ (BOOL)supportsSecureCoding;
+ (id)loadFromFile:(id)a3;
- ($54B668FA3CFF7C50914A1C899F2834C0)generationDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSerializableRecognitionSessionResult:(id)a3;
- (BOOL)isValidForStrokes:(id)a3;
- (CHRecognitionSessionResult)init;
- (CHRecognitionSessionResult)initWithCoder:(id)a3;
- (CHRecognitionSessionResult)initWithResult:(id)a3 validStrokes:(id)a4;
- (CHRecognitionSessionResult)initWithStrokeProviderVersion:(id)a3 encodedStrokeProviderVersion:(id)a4 orderedStrokeIdentifiers:(id)a5 sessionMode:(int64_t)a6 locales:(id)a7 preferredLocales:(id)a8 declaredVariables:(id)a9 clutterFilter:(id)a10 strokeClassificationResult:(id)a11 rawStrokeClassificationResult:(id)a12 strokeGroupingResult:(id)a13 rawStrokeGroupingResult:(id)a14 unprocessedStrokeGroupingResult:(id)a15 recognitionResults:(id)a16 rawRecognitionResults:(id)a17 inlineContinuousModeResults:(id)a18 autoRefineResults:(id)a19 generationDuration:(id *)a20 recognitionEnvironment:(int64_t)a21;
- (CHStrokeClassificationResult)rawStrokeClassificationResult;
- (CHStrokeClassificationResult)strokeClassificationResult;
- (CHStrokeClutterFilter)clutterFilter;
- (CHStrokeGroupingResult)rawStrokeGroupingResult;
- (CHStrokeGroupingResult)strokeGroupingResult;
- (CHStrokeGroupingResult)unprocessedStrokeGroupingResult;
- (CHStrokeProviderVersion)strokeProviderVersion;
- (NSArray)allResultsDebugDescriptionByGroup;
- (NSArray)autoRefineResults;
- (NSArray)locales;
- (NSArray)orderedStrokeIdentifiers;
- (NSArray)preferredLocales;
- (NSString)allResultsDebugDescription;
- (NSString)highConfidenceDebugDescription;
- (id)allMathResultsDebugDescriptionWithGroupHeaderBlock:(id)a3;
- (id)allResultsDebugDescriptionWithGroupHeaderBlock:(id)a3;
- (id)cachedRecognitionResultsFromPostProcessing;
- (id)contextualResultsWithFullyCoveredStrokeGroups:(id)a3 partiallyCoveredStrokeGroups:(id)a4 drawingCanvasSize:(CGSize)a5;
- (id)debugDescription;
- (id)declaredVariables;
- (id)description;
- (id)encodedStrokeProviderVersion;
- (id)forcedCachedContextualResultCoveringStrokes:(id)a3;
- (id)fullyCoveredStrokeGroupsForContextStrokes:(id)a3 partiallyCoveredStrokeGroups:(id *)a4;
- (id)rawRecognitionResultForStrokeGroupIdentifier:(int64_t)a3;
- (id)rawRecognitionResultsByGroupID;
- (id)recognitionResultForStrokeGroupIdentifier:(int64_t)a3;
- (id)recognitionResultsByGroupID;
- (id)textCorrectionResultForStrokeGroupIdentifier:(int64_t)a3;
- (id)textCorrectionResultsByGroupID;
- (id)writeToFile;
- (id)writeToFileInFolder:(id)a3 basename:(id)a4;
- (int64_t)completeness;
- (int64_t)recognitionEnvironment;
- (int64_t)sessionMode;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedRecognitionResultsFromPostProcessing:(id)a3;
@end

@implementation CHRecognitionSessionResult

- (CHRecognitionSessionResult)init
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

- (CHRecognitionSessionResult)initWithStrokeProviderVersion:(id)a3 encodedStrokeProviderVersion:(id)a4 orderedStrokeIdentifiers:(id)a5 sessionMode:(int64_t)a6 locales:(id)a7 preferredLocales:(id)a8 declaredVariables:(id)a9 clutterFilter:(id)a10 strokeClassificationResult:(id)a11 rawStrokeClassificationResult:(id)a12 strokeGroupingResult:(id)a13 rawStrokeGroupingResult:(id)a14 unprocessedStrokeGroupingResult:(id)a15 recognitionResults:(id)a16 rawRecognitionResults:(id)a17 inlineContinuousModeResults:(id)a18 autoRefineResults:(id)a19 generationDuration:(id *)a20 recognitionEnvironment:(int64_t)a21
{
  id v97 = a3;
  id v85 = a4;
  id v96 = a4;
  id v86 = a5;
  id v95 = a5;
  id v99 = a7;
  id v25 = a8;
  id v98 = a9;
  id v94 = a10;
  id v93 = a11;
  id v92 = a12;
  id v91 = a13;
  id v90 = a14;
  id v89 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  v100.receiver = self;
  v100.super_class = (Class)CHRecognitionSessionResult;
  v30 = [(CHRecognitionSessionResult *)&v100 init];
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_strokeProviderVersion, a3);
    objc_storeStrong((id *)&v31->_encodedStrokeProviderVersion, v85);
    objc_storeStrong((id *)&v31->_orderedStrokeIdentifiers, v86);
    v31->_sessionMode = a6;
    uint64_t v37 = objc_msgSend_copy(v99, v32, v33, v34, v35, v36);
    locales = v31->_locales;
    v31->_locales = (NSArray *)v37;

    uint64_t v44 = objc_msgSend_copy(v25, v39, v40, v41, v42, v43);
    preferredLocales = v31->_preferredLocales;
    v31->_preferredLocales = (NSArray *)v44;

    uint64_t v51 = objc_msgSend_copy(v98, v46, v47, v48, v49, v50);
    declaredVariables = v31->_declaredVariables;
    v31->_declaredVariables = (NSSet *)v51;

    objc_storeStrong((id *)&v31->_strokeClassificationResult, a11);
    objc_storeStrong((id *)&v31->_rawStrokeClassificationResult, a12);
    objc_storeStrong((id *)&v31->_strokeGroupingResult, a13);
    objc_storeStrong((id *)&v31->_rawStrokeGroupingResult, a14);
    objc_storeStrong((id *)&v31->_unprocessedStrokeGroupingResult, a15);
    uint64_t v58 = objc_msgSend_copy(v26, v53, v54, v55, v56, v57);
    recognitionResultsByGroupID = v31->_recognitionResultsByGroupID;
    v31->_recognitionResultsByGroupID = (NSDictionary *)v58;

    uint64_t v65 = objc_msgSend_copy(v27, v60, v61, v62, v63, v64);
    rawRecognitionResultsByGroupID = v31->_rawRecognitionResultsByGroupID;
    v31->_rawRecognitionResultsByGroupID = (NSDictionary *)v65;

    uint64_t v72 = objc_msgSend_copy(v28, v67, v68, v69, v70, v71);
    textCorrectionResultsByGroupID = v31->_textCorrectionResultsByGroupID;
    v31->_textCorrectionResultsByGroupID = (NSDictionary *)v72;

    uint64_t v79 = objc_msgSend_copy(v29, v74, v75, v76, v77, v78);
    autoRefineResults = v31->_autoRefineResults;
    v31->_autoRefineResults = (NSArray *)v79;

    long long v81 = *(_OWORD *)&a20->var0;
    long long v82 = *(_OWORD *)&a20->var2;
    *(_OWORD *)&v31->_generationDuration.principalLinesDuration = *(_OWORD *)&a20->var4;
    *(_OWORD *)&v31->_generationDuration.groupingDuration = v82;
    *(_OWORD *)&v31->_generationDuration.strokeClutterFilteringDuration = v81;
    v31->_recognitionEnvironment = a21;
    objc_storeStrong((id *)&v31->_clutterFilter, a10);
    v31->__shouldUseCachedCompleteness = 0;
    v31->_completeness = 0;
  }

  return v31;
}

- (CHRecognitionSessionResult)initWithResult:(id)a3 validStrokes:(id)a4
{
  return 0;
}

- (id)description
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v13 = objc_msgSend_locales(self, v8, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v65, (uint64_t)v69, 16, v15);
  if (v21)
  {
    uint64_t v22 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v66 != v22) {
          objc_enumerationMutation(v13);
        }
        v24 = objc_msgSend_localeIdentifier(*(void **)(*((void *)&v65 + 1) + 8 * i), v16, v17, v18, v19, v20);
        objc_msgSend_addObject_(v7, v25, (uint64_t)v24, v26, v27, v28);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v65, (uint64_t)v69, 16, v20);
    }
    while (v21);
  }

  uint64_t v33 = objc_msgSend_componentsJoinedByString_(v7, v29, @"\", \"", v30, v31, v32);
  v38 = objc_msgSend_stringWithFormat_(NSString, v34, @"\"%@\"", v35, v36, v37, v33);

  v64.receiver = self;
  v64.super_class = (Class)CHRecognitionSessionResult;
  v39 = [(CHRecognitionSessionResult *)&v64 description];
  v45 = objc_msgSend_strokeProviderVersion(self, v40, v41, v42, v43, v44);
  uint64_t v51 = objc_msgSend_strokeClassificationResult(self, v46, v47, v48, v49, v50);
  uint64_t v57 = objc_msgSend_strokeGroupingResult(self, v52, v53, v54, v55, v56);
  uint64_t v62 = objc_msgSend_stringByAppendingFormat_(v39, v58, @" strokeProviderVersion: %@, locales: %@, strokeClassificationResult: %@, strokeGroupingResult: %@", v59, v60, v61, v45, v38, v51, v57);

  return v62;
}

- (id)debugDescription
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4, v5);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v13 = objc_msgSend_strokeGroupingResult(self, v8, v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v13, v14, 0, 0, v15, v16);

  id obj = v17;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v97, (uint64_t)v101, 16, v19);
  if (v25)
  {
    uint64_t v26 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v98 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void **)(*((void *)&v97 + 1) + 8 * i);
        id v29 = objc_msgSend_recognitionResultsByGroupID(self, v20, v21, v22, v23, v24);
        uint64_t v30 = NSNumber;
        uint64_t v36 = objc_msgSend_uniqueIdentifier(v28, v31, v32, v33, v34, v35);
        uint64_t v41 = objc_msgSend_numberWithInteger_(v30, v37, v36, v38, v39, v40);
        v46 = objc_msgSend_objectForKeyedSubscript_(v29, v42, (uint64_t)v41, v43, v44, v45);

        v52 = objc_msgSend_textCorrectionResultsByGroupID(self, v47, v48, v49, v50, v51);
        uint64_t v53 = NSNumber;
        uint64_t v59 = objc_msgSend_uniqueIdentifier(v28, v54, v55, v56, v57, v58);
        objc_super v64 = objc_msgSend_numberWithInteger_(v53, v60, v59, v61, v62, v63);
        uint64_t v69 = objc_msgSend_objectForKeyedSubscript_(v52, v65, (uint64_t)v64, v66, v67, v68);

        uint64_t v75 = objc_msgSend_uniqueIdentifier(v28, v70, v71, v72, v73, v74);
        objc_msgSend_appendFormat_(v7, v76, @"  Group %ld: ", v77, v78, v79, v75);
        if (v46)
        {
          objc_msgSend_appendFormat_(v7, v80, @"recognition: %@", v81, v82, v83, v46);
          if (!v69) {
            goto LABEL_11;
          }
          objc_msgSend_appendString_(v7, v80, @" ", v81, v82, v83);
        }
        else if (!v69)
        {
          goto LABEL_11;
        }
        objc_msgSend_appendFormat_(v7, v80, @"textCorrection: %@", v81, v82, v83, v69);
LABEL_11:
        objc_msgSend_appendString_(v7, v80, @"\n", v81, v82, v83);
      }
      uint64_t v17 = obj;
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v97, (uint64_t)v101, 16, v24);
    }
    while (v25);
  }

  id v89 = objc_msgSend_description(self, v84, v85, v86, v87, v88);
  id v94 = objc_msgSend_stringByAppendingFormat_(v89, v90, @"Group Results: \n%@", v91, v92, v93, v7);

  return v94;
}

- (NSString)highConfidenceDebugDescription
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4, v5);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v13 = objc_msgSend_strokeGroupingResult(self, v8, v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v13, v14, 0, 1, v15, v16);

  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v46, (uint64_t)v50, 16, v19);
  if (v25)
  {
    uint64_t v26 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(v17);
        }
        uint64_t v28 = objc_msgSend_uniqueIdentifier(*(void **)(*((void *)&v46 + 1) + 8 * i), v20, v21, v22, v23, v24);
        uint64_t v33 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(self, v29, v28, v30, v31, v32);
        uint64_t v35 = objc_msgSend_highConfidenceTextForSessionResult_averageTokenScore_rejectionRate_doesContainUnfilteredMultiLocaleResults_isNonTextCandidateResult_(v33, v34, (uint64_t)self, 0, 0, 0, 0);
        if (objc_msgSend_length(v35, v36, v37, v38, v39, v40)) {
          objc_msgSend_appendFormat_(v7, v41, @"%@\n", v42, v43, v44, v35);
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v46, (uint64_t)v50, 16, v24);
    }
    while (v25);
  }

  return (NSString *)v7;
}

- (NSString)allResultsDebugDescription
{
  return (NSString *)sub_1C49F0EF0(self, 0, 0);
}

- (NSArray)allResultsDebugDescriptionByGroup
{
  v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  id v8 = sub_1C49F0EF0(self, v7, &unk_1F2012B30);
  return (NSArray *)v7;
}

- (id)allResultsDebugDescriptionWithGroupHeaderBlock:(id)a3
{
  uint64_t v3 = sub_1C49F0EF0(self, 0, a3);
  return v3;
}

- (id)allMathResultsDebugDescriptionWithGroupHeaderBlock:(id)a3
{
  uint64_t v290 = *MEMORY[0x1E4F143B8];
  v264 = (void (**)(id, void *))a3;
  v262 = objc_msgSend_string(MEMORY[0x1E4F28E78], v4, v5, v6, v7, v8);
  long long v286 = 0u;
  long long v287 = 0u;
  long long v284 = 0u;
  long long v285 = 0u;
  v261 = self;
  v14 = objc_msgSend_strokeGroupingResult(self, v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v14, v15, 0, 1, v16, v17);

  id obj = v18;
  uint64_t v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v284, (uint64_t)v289, 16, v20);
  if (v263)
  {
    uint64_t v259 = 0;
    uint64_t v260 = *(void *)v285;
    do
    {
      for (uint64_t i = 0; i != v263; ++i)
      {
        if (*(void *)v285 != v260) {
          objc_enumerationMutation(obj);
        }
        v267 = *(void **)(*((void *)&v284 + 1) + 8 * i);
        uint64_t v26 = objc_msgSend_uniqueIdentifier(v267, v21, v22, v23, v24, v25);
        uint64_t v31 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v261, v27, v26, v28, v29, v30);
        uint64_t v42 = objc_msgSend_string(MEMORY[0x1E4F28E78], v32, v33, v34, v35, v36);
        if (!v264 || (v264[2](v264, v267), (uint64_t v43 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          uint64_t v44 = NSString;
          uint64_t v45 = objc_msgSend_uniqueIdentifier(v267, v37, v38, v39, v40, v41);
          uint64_t v43 = objc_msgSend_stringWithFormat_(v44, v46, @"GroupID %ld", v47, v48, v49, v45);
        }
        objc_msgSend_appendFormat_(v42, v37, @"%@: {\n  ", v39, v40, v41, v43);
        v265 = (void *)v43;
        uint64_t v60 = objc_msgSend_mathResult(v31, v50, v51, v52, v53, v54);
        if (!v60) {
          goto LABEL_21;
        }
        uint64_t v61 = objc_msgSend_mathResult(v31, v55, v56, v57, v58, v59);
        uint64_t v67 = objc_msgSend_transcriptionPaths(v61, v62, v63, v64, v65, v66);
        BOOL v73 = objc_msgSend_count(v67, v68, v69, v70, v71, v72) == 0;

        if (v73)
        {
LABEL_21:
          objc_msgSend_appendFormat_(v42, v55, @"%@", v57, v58, v59, @"<NO RESULT>\n");
        }
        else
        {
          long long v282 = 0u;
          long long v283 = 0u;
          long long v281 = 0u;
          long long v280 = 0u;
          uint64_t v75 = objc_msgSend_mathResult(v31, v55, v74, v57, v58, v59);
          uint64_t v81 = objc_msgSend_transcriptionPaths(v75, v76, v77, v78, v79, v80);

          uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v82, (uint64_t)&v280, (uint64_t)v288, 16, v83);
          if (v89)
          {
            uint64_t v90 = *(void *)v281;
            do
            {
              for (uint64_t j = 0; j != v89; ++j)
              {
                if (*(void *)v281 != v90) {
                  objc_enumerationMutation(v81);
                }
                uint64_t v92 = *(void **)(*((void *)&v280 + 1) + 8 * j);
                uint64_t v93 = objc_msgSend_mathResult(v31, v84, v85, v86, v87, v88);
                long long v99 = objc_msgSend_transcriptionPaths(v93, v94, v95, v96, v97, v98);
                v105 = objc_msgSend_lastObject(v99, v100, v101, v102, v103, v104);

                v111 = objc_msgSend_mathResult(v31, v106, v107, v108, v109, v110);
                uint64_t v117 = objc_msgSend_length(v92, v112, v113, v114, v115, v116);
                v120 = objc_msgSend_transcriptionWithPath_columnRange_(v111, v118, (uint64_t)v92, 0, v117, v119);

                v125 = @"\n";
                if (v92 != v105) {
                  v125 = @", ";
                }
                objc_msgSend_appendFormat_(v42, v121, @"\"%@\"%@", v122, v123, v124, v120, v125);
              }
              uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v84, (uint64_t)&v280, (uint64_t)v288, 16, v88);
            }
            while (v89);
          }

          ++v259;
        }
        objc_msgSend_appendFormat_(v42, v126, @"},\n", v127, v128, v129);
        v135 = objc_msgSend_mathResult(v31, v130, v131, v132, v133, v134);
        BOOL v136 = v135 == 0;

        if (!v136)
        {
          v142 = objc_msgSend_mathResult(v31, v137, v138, v139, v140, v141);
          v143 = NSString;
          objc_msgSend_absoluteProbability(v142, v144, v145, v146, v147, v148);
          uint64_t v150 = v149;
          objc_msgSend_score(v142, v151, v152, v153, v154, v155);
          v161 = objc_msgSend_stringWithFormat_(v143, v156, @"(%.3f, %.3f)", v157, v158, v159, v150, v160);
          objc_msgSend_appendFormat_(v42, v162, @"Result score: %@\n", v163, v164, v165, v161);
          v171 = objc_msgSend_mathResult(v31, v166, v167, v168, v169, v170);
          v177 = objc_msgSend_selectedTranscriptionPathIndex(v171, v172, v173, v174, v175, v176);
          BOOL v178 = v177 == 0;

          if (!v178)
          {
            v184 = objc_msgSend_mathResult(v31, v179, v180, v181, v182, v183);
            v190 = objc_msgSend_selectedTranscriptionPathIndex(v184, v185, v186, v187, v188, v189);
            objc_msgSend_appendFormat_(v42, v191, @"Selected transcription index: %@\n", v192, v193, v194, v190);
          }
          uint64_t v276 = 0;
          v277 = &v276;
          uint64_t v278 = 0x2020000000;
          char v279 = 0;
          uint64_t v272 = 0;
          v273 = &v272;
          uint64_t v274 = 0x2020000000;
          char v275 = 0;
          v195 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v179, v180, v181, v182, v183);
          v201 = objc_msgSend_mathResult(v31, v196, v197, v198, v199, v200);
          v268[0] = MEMORY[0x1E4F143A8];
          v268[1] = 3221225472;
          v268[2] = sub_1C49F2194;
          v268[3] = &unk_1E64E1FA0;
          id v202 = v195;
          id v269 = v202;
          v270 = &v276;
          v271 = &v272;
          objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(v201, v203, (uint64_t)v268, v204, v205, v206);

          v207 = (void *)MEMORY[0x1E4F28D60];
          v213 = objc_msgSend_strokeIdentifiers(v267, v208, v209, v210, v211, v212);
          uint64_t v219 = objc_msgSend_count(v213, v214, v215, v216, v217, v218);
          v223 = objc_msgSend_indexSetWithIndexesInRange_(v207, v220, 0, v219, v221, v222);
          char isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v202, v224, (uint64_t)v223, v225, v226, v227);

          if ((isEqualToIndexSet & 1) == 0)
          {
            v234 = objc_msgSend_strokeIdentifiers(v267, v229, v230, v231, v232, v233);
            uint64_t v240 = objc_msgSend_count(v234, v235, v236, v237, v238, v239);
            v246 = objc_msgSend_description(v202, v241, v242, v243, v244, v245);
            objc_msgSend_appendFormat_(v42, v247, @"ERROR: Not all %lu strokes covered in the result. Coverage: %@\n", v248, v249, v250, v240, v246);
          }
          v251 = @"ERROR: Evaluation trigger ('=' or '\\hline') has no strokes assigned.\n";
          if (*((unsigned char *)v277 + 24)
            || (v251 = @"WARNING: Some ink elements have no strokes assigned.\n", *((unsigned char *)v273 + 24)))
          {
            objc_msgSend_appendString_(v42, v229, (uint64_t)v251, v231, v232, v233);
          }

          _Block_object_dispose(&v272, 8);
          _Block_object_dispose(&v276, 8);
        }
        objc_msgSend_appendString_(v42, v137, @"\n", v139, v140, v141);
        objc_msgSend_appendString_(v262, v252, (uint64_t)v42, v253, v254, v255);
      }
      uint64_t v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v284, (uint64_t)v289, 16, v25);
    }
    while (v263);

    if (v259)
    {
      v256 = v262;
      goto LABEL_37;
    }
  }
  else
  {
  }
  v256 = &stru_1F20141C8;
LABEL_37:

  return v256;
}

- (id)recognitionResultForStrokeGroupIdentifier:(int64_t)a3
{
  uint64_t v7 = objc_msgSend_recognitionResultsByGroupID(self, a2, a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend_numberWithInteger_(NSNumber, v8, a3, v9, v10, v11);
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v7, v13, (uint64_t)v12, v14, v15, v16);

  return v17;
}

- (id)rawRecognitionResultForStrokeGroupIdentifier:(int64_t)a3
{
  uint64_t v7 = objc_msgSend_rawRecognitionResultsByGroupID(self, a2, a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend_numberWithInteger_(NSNumber, v8, a3, v9, v10, v11);
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v7, v13, (uint64_t)v12, v14, v15, v16);

  return v17;
}

- (id)textCorrectionResultForStrokeGroupIdentifier:(int64_t)a3
{
  uint64_t v7 = objc_msgSend_textCorrectionResultsByGroupID(self, a2, a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend_numberWithInteger_(NSNumber, v8, a3, v9, v10, v11);
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v7, v13, (uint64_t)v12, v14, v15, v16);

  return v17;
}

- (BOOL)isValidForStrokes:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v10 = objc_msgSend_strokeGroupingResult(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_strokeGroups(v10, v11, v12, v13, v14, v15);
  uint64_t v22 = objc_msgSend_allObjects(v16, v17, v18, v19, v20, v21);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v23 = v4;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v39, (uint64_t)v43, 16, v25);
  if (v26)
  {
    uint64_t v27 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v23);
        }
        uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v30 = objc_opt_class();
        id v33 = (id)objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_foundStrokeGroupIndex_(v30, v31, v29, (uint64_t)v22, (uint64_t)&v38, v32);
        if (v38 == 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v36 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v34, (uint64_t)&v39, (uint64_t)v43, 16, v35);
      if (v26) {
        continue;
      }
      break;
    }
  }
  BOOL v36 = 1;
LABEL_11:

  return v36;
}

- (id)fullyCoveredStrokeGroupsForContextStrokes:(id)a3 partiallyCoveredStrokeGroups:(id *)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  uint64_t v98 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(self->_strokeGroupingResult, v5, 0, 0, v6, v7);
  uint64_t v8 = objc_opt_class();
  uint64_t v96 = objc_msgSend_strokeIdentifierToGroupIndexMappingForStrokeIdentifiers_orderedStrokeGroups_(v8, v9, (uint64_t)v93, (uint64_t)v98, v10, v11);
  uint64_t v97 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v12, v13, v14, v15, v16);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v17 = v93;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v107, (uint64_t)v113, 16, v19);
  if (v24)
  {
    uint64_t v25 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v108 != v25) {
          objc_enumerationMutation(v17);
        }
        uint64_t v27 = objc_msgSend_objectForKey_(v96, v20, *(void *)(*((void *)&v107 + 1) + 8 * i), v21, v22, v23);
        uint64_t v33 = objc_msgSend_integerValue(v27, v28, v29, v30, v31, v32);

        uint64_t v38 = objc_msgSend_objectAtIndexedSubscript_(v98, v34, v33, v35, v36, v37);
        objc_msgSend_addObject_(v97, v39, (uint64_t)v38, v40, v41, v42);
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v107, (uint64_t)v113, 16, v23);
    }
    while (v24);
  }

  objc_msgSend_array(MEMORY[0x1E4F1CA48], v43, v44, v45, v46, v47);
  id v95 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v53 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v48, v49, v50, v51, v52);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id obj = v97;
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v103, (uint64_t)v112, 16, v55);
  if (v61)
  {
    uint64_t v62 = *(void *)v104;
    do
    {
      for (uint64_t j = 0; j != v61; ++j)
      {
        if (*(void *)v104 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = *(void **)(*((void *)&v103 + 1) + 8 * j);
        uint64_t v65 = objc_msgSend_strokeIdentifiers(v64, v56, v57, v58, v59, v60);
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v66 = v65;
        uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v99, (uint64_t)v111, 16, v68);
        if (v73)
        {
          uint64_t v74 = *(void *)v100;
LABEL_15:
          uint64_t v75 = 0;
          while (1)
          {
            if (*(void *)v100 != v74) {
              objc_enumerationMutation(v66);
            }
            if ((objc_msgSend_containsObject_(v17, v69, *(void *)(*((void *)&v99 + 1) + 8 * v75), v70, v71, v72) & 1) == 0) {
              break;
            }
            if (v73 == ++v75)
            {
              uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v69, (uint64_t)&v99, (uint64_t)v111, 16, v72);
              if (v73) {
                goto LABEL_15;
              }
              goto LABEL_21;
            }
          }

          char v90 = objc_msgSend_containsObject_(v53, v86, (uint64_t)v64, v87, v88, v89);
          uint64_t v85 = v53;
          if (v90) {
            goto LABEL_25;
          }
LABEL_24:
          objc_msgSend_addObject_(v85, v80, (uint64_t)v64, v81, v82, v83);
          goto LABEL_25;
        }
LABEL_21:

        char v84 = objc_msgSend_containsObject_(v95, v76, (uint64_t)v64, v77, v78, v79);
        uint64_t v85 = v95;
        if ((v84 & 1) == 0) {
          goto LABEL_24;
        }
LABEL_25:
      }
      uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v103, (uint64_t)v112, 16, v60);
    }
    while (v61);
  }

  if (a4) {
    *a4 = v53;
  }

  return v95;
}

- (id)forcedCachedContextualResultCoveringStrokes:(id)a3
{
  uint64_t v317 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v300 = v4;
  v302 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(self->_strokeGroupingResult, v5, 0, 0, v6, v7);
  uint64_t v8 = objc_opt_class();
  uint64_t v12 = objc_msgSend_strokeIdentifierToGroupIndexMappingForStrokeIdentifiers_orderedStrokeGroups_(v8, v9, (uint64_t)v4, (uint64_t)v302, v10, v11);
  if (!objc_msgSend_count(v12, v13, v14, v15, v16, v17))
  {
    uint64_t v236 = 0;
    goto LABEL_58;
  }
  long long v309 = 0u;
  long long v310 = 0u;
  long long v307 = 0u;
  long long v308 = 0u;
  id v18 = v4;
  uint64_t v21 = 0;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v307, (uint64_t)v316, 16, v20);
  if (v26)
  {
    uint64_t v27 = *(void *)v308;
    do
    {
      uint64_t v28 = 0;
      uint64_t v29 = v21;
      do
      {
        if (*(void *)v308 != v27) {
          objc_enumerationMutation(v18);
        }
        uint64_t v30 = v12;
        uint64_t v31 = objc_msgSend_objectForKey_(v12, v22, *(void *)(*((void *)&v307 + 1) + 8 * v28), v23, v24, v25);
        uint64_t v37 = objc_msgSend_integerValue(v31, v32, v33, v34, v35, v36);

        if (v29)
        {
          uint64_t v42 = objc_msgSend_objectAtIndexedSubscript_(v302, v38, v37, v39, v40, v41);
          BOOL v43 = v29 == v42;

          if (!v43)
          {
            uint64_t v236 = 0;
            goto LABEL_57;
          }
        }
        uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v302, v38, v37, v39, v40, v41);

        ++v28;
        uint64_t v29 = v21;
        uint64_t v12 = v30;
      }
      while (v26 != v28);
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v307, (uint64_t)v316, 16, v25);
    }
    while (v26);
  }
  uint64_t v30 = v12;

  recognitionResultsByGroupID = self->_recognitionResultsByGroupID;
  uint64_t v45 = NSNumber;
  uint64_t v51 = objc_msgSend_uniqueIdentifier(v21, v46, v47, v48, v49, v50);
  uint64_t v56 = objc_msgSend_numberWithInteger_(v45, v52, v51, v53, v54, v55);
  v298 = objc_msgSend_objectForKey_(recognitionResultsByGroupID, v57, (uint64_t)v56, v58, v59, v60);

  uint64_t v71 = objc_msgSend_preferredLocale(v298, v61, v62, v63, v64, v65);
  if (!v71)
  {
    uint64_t v236 = 0;
    goto LABEL_56;
  }
  v297 = v71;
  uint64_t v72 = objc_msgSend_recognitionResultsByLocale(v298, v66, v67, v68, v69, v70);
  v301 = objc_msgSend_objectForKeyedSubscript_(v72, v73, (uint64_t)v71, v74, v75, v76);

  uint64_t v82 = objc_msgSend_inputStrokeIdentifiers(v301, v77, v78, v79, v80, v81);
  uint64_t v88 = objc_msgSend_count(v82, v83, v84, v85, v86, v87);
  id v94 = objc_msgSend_strokeIndexes(v301, v89, v90, v91, v92, v93);
  BOOL v100 = v88 == objc_msgSend_count(v94, v95, v96, v97, v98, v99);

  if (!v100)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    long long v106 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
    {
      v112 = objc_msgSend_strokeIndexes(v301, v107, v108, v109, v110, v111);
      uint64_t v118 = objc_msgSend_count(v112, v113, v114, v115, v116, v117);
      uint64_t v124 = objc_msgSend_inputStrokeIdentifiers(v298, v119, v120, v121, v122, v123);
      uint64_t v130 = objc_msgSend_count(v124, v125, v126, v127, v128, v129);
      *(_DWORD *)buf = 134218240;
      uint64_t v313 = v118;
      __int16 v314 = 2048;
      uint64_t v315 = v130;
      _os_log_impl(&dword_1C492D000, v106, OS_LOG_TYPE_FAULT, "Mismatch between the strokes covered by a text result (%ld) vs its stroke group (%ld).", buf, 0x16u);
    }
  }
  uint64_t v131 = objc_msgSend_inputStrokeIdentifiers(v298, v101, v102, v103, v104, v105);
  objc_msgSend_setInputStrokeIdentifiers_(v301, v132, (uint64_t)v131, v133, v134, v135);

  uint64_t v141 = objc_msgSend_inputStrokeIdentifiers(v301, v136, v137, v138, v139, v140);
  unint64_t v147 = objc_msgSend_count(v141, v142, v143, v144, v145, v146);
  BOOL v153 = v147 < objc_msgSend_count(v18, v148, v149, v150, v151, v152);

  if (v153)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v159 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v159, OS_LOG_TYPE_FAULT))
    {
      uint64_t v165 = objc_msgSend_inputStrokeIdentifiers(v301, v160, v161, v162, v163, v164);
      uint64_t v171 = objc_msgSend_count(v165, v166, v167, v168, v169, v170);
      uint64_t v177 = objc_msgSend_count(v18, v172, v173, v174, v175, v176);
      *(_DWORD *)buf = 134218240;
      uint64_t v313 = v171;
      __int16 v314 = 2048;
      uint64_t v315 = v177;
      _os_log_impl(&dword_1C492D000, v159, OS_LOG_TYPE_FAULT, "The group has %ld strokes, but should contain at least as many strokes as the %ld strokes to cover", buf, 0x16u);
    }
  }
  BOOL v178 = objc_msgSend_inputStrokeIdentifiers(v301, v154, v155, v156, v157, v158);
  unint64_t v184 = objc_msgSend_count(v178, v179, v180, v181, v182, v183);
  BOOL v190 = v184 > objc_msgSend_count(v18, v185, v186, v187, v188, v189);

  if (!v190) {
    goto LABEL_55;
  }
  v299 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v191, v192, v193, v194, v195);
  uint64_t v201 = 0;
  uint64_t v202 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    if (v201 >= objc_msgSend_tokenColumnCount(v301, v196, v197, v198, v199, v200)) {
      goto LABEL_44;
    }
    uint64_t v206 = objc_msgSend_strokeIndexesForColumnsInRange_(v301, v203, v201, 1, v204, v205);
    uint64_t v212 = objc_msgSend_inputStrokeIdentifiers(v301, v207, v208, v209, v210, v211);
    uint64_t v217 = objc_msgSend_objectsAtIndexes_(v212, v213, (uint64_t)v206, v214, v215, v216);

    if (v202 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    long long v305 = 0u;
    long long v306 = 0u;
    long long v303 = 0u;
    long long v304 = 0u;
    id v222 = v217;
    uint64_t v229 = objc_msgSend_countByEnumeratingWithState_objects_count_(v222, v223, (uint64_t)&v303, (uint64_t)v311, 16, v224);
    if (v229)
    {
      uint64_t v230 = *(void *)v304;
      while (2)
      {
        for (uint64_t i = 0; i != v229; ++i)
        {
          if (*(void *)v304 != v230) {
            objc_enumerationMutation(v222);
          }
          if (objc_msgSend_containsObject_(v18, v225, *(void *)(*((void *)&v303 + 1) + 8 * i), v226, v227, v228))
          {

            uint64_t v71 = v297;
            uint64_t v202 = v201;
            goto LABEL_38;
          }
        }
        uint64_t v229 = objc_msgSend_countByEnumeratingWithState_objects_count_(v222, v225, (uint64_t)&v303, (uint64_t)v311, 16, v228);
        if (v229) {
          continue;
        }
        break;
      }
    }

    uint64_t v71 = v297;
    uint64_t v202 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_39:

    ++v201;
  }
LABEL_38:
  objc_msgSend_addObjectsFromArray_(v299, v218, (uint64_t)v217, v219, v220, v221);
  if ((objc_msgSend_isEqualToArray_(v299, v232, (uint64_t)v18, v233, v234, v235) & 1) == 0) {
    goto LABEL_39;
  }

  if (v201 + 1 == v202)
  {
LABEL_44:
    uint64_t v240 = v301;
    goto LABEL_54;
  }
  uint64_t v240 = objc_msgSend_subResultWithColumnRange_(v301, v237, v202, v201 + 1 - v202, v238, v239);
  v246 = objc_msgSend_tokenColumns(v240, v241, v242, v243, v244, v245);
  v251 = objc_msgSend_objectAtIndexedSubscript_(v246, v247, 0, v248, v249, v250);
  v257 = objc_msgSend_strokeIndexes(v251, v252, v253, v254, v255, v256);
  uint64_t Index = objc_msgSend_firstIndex(v257, v258, v259, v260, v261, v262);

  for (uint64_t j = 1; j < objc_msgSend_tokenColumnCount(v240, v264, v265, v266, v267, v268) && Index > 0; ++j)
  {
    char v275 = objc_msgSend_tokenColumns(v240, v270, v271, v272, v273, v274);
    long long v280 = objc_msgSend_objectAtIndexedSubscript_(v275, v276, j, v277, v278, v279);
    long long v286 = objc_msgSend_strokeIndexes(v280, v281, v282, v283, v284, v285);
    uint64_t v292 = objc_msgSend_firstIndex(v286, v287, v288, v289, v290, v291);

    if (v292 < Index) {
      uint64_t Index = v292;
    }
  }
  if (Index > 0) {
    objc_msgSend_offsetAllStrokeIndexesBy_(v240, v270, -Index, v272, v273, v274);
  }
  objc_msgSend_setInputStrokeIdentifiers_(v240, v270, (uint64_t)v299, v272, v273, v274);

LABEL_54:
  v301 = v240;
LABEL_55:
  v293 = [CHContextualTextResult alloc];
  uint64_t v236 = objc_msgSend_initWithTextResult_terminatingSpecialCharacter_strokeGroup_(v293, v294, (uint64_t)v301, 0, (uint64_t)v21, v295);

LABEL_56:
  id v18 = v298;
  uint64_t v29 = v21;
LABEL_57:

  uint64_t v12 = v30;
LABEL_58:

  return v236;
}

- (id)contextualResultsWithFullyCoveredStrokeGroups:(id)a3 partiallyCoveredStrokeGroups:(id)a4 drawingCanvasSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v460 = *MEMORY[0x1E4F143B8];
  id v447 = a3;
  id v446 = a4;
  v452 = objc_msgSend_textStrokeGroupClusters(self->_strokeGroupingResult, v9, v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(self->_strokeGroupingResult, v14, 0, 1, v15, v16);
  if (!objc_msgSend_count(v17, v18, v19, v20, v21, v22))
  {
    id v445 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_38;
  }
  v453 = self;
  v455 = v17;
  uint64_t v28 = objc_msgSend_count(v447, v23, v24, v25, v26, v27);
  v454 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  int v448 = 0;
  unint64_t v37 = 0;
  uint64_t v442 = objc_msgSend_count(v446, v29, v30, v31, v32, v33) + v28;
  while (1)
  {
    if (v34)
    {
      if (!v454)
      {
        v454 = 0;
        if (qword_1EA3CA000 != -1) {
          goto LABEL_107;
        }
        goto LABEL_34;
      }
      uint64_t v204 = v455;
      objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40, v41, v42);
      id v445 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v444 = 0;
      if (v447) {
        BOOL v210 = v446 == 0;
      }
      else {
        BOOL v210 = 1;
      }
      int v211 = !v210;
      int v443 = v211;
      for (unint64_t i = objc_msgSend_count(v455, v205, v206, v207, v208, v209);
            ;
            unint64_t i = objc_msgSend_count(v455, v418, v419, v420, v421, v422))
      {
        if (v37 >= i) {
          goto LABEL_37;
        }
        if (v37 >= objc_msgSend_count(v204, v213, v214, v215, v216, v217) - 1)
        {
          v264 = 0;
          id v223 = 0;
          BOOL v451 = 0;
          goto LABEL_57;
        }
        objc_msgSend_objectAtIndexedSubscript_(v455, v218, v37 + 1, v220, v221, v222);
        id v223 = (id)objc_claimAutoreleasedReturnValue();
        recognitionResultsByGroupID = v453->_recognitionResultsByGroupID;
        uint64_t v225 = NSNumber;
        uint64_t v231 = objc_msgSend_uniqueIdentifier(v223, v226, v227, v228, v229, v230);
        uint64_t v236 = objc_msgSend_numberWithInteger_(v225, v232, v231, v233, v234, v235);
        v241 = objc_msgSend_objectForKey_(recognitionResultsByGroupID, v237, (uint64_t)v236, v238, v239, v240);

        v247 = objc_msgSend_preferredLocale(v241, v242, v243, v244, v245, v246);
        BOOL v451 = v247 == 0;

        if (!v451)
        {
          uint64_t v253 = objc_msgSend_preferredLocale(v241, v248, v249, v250, v251, v252);
          uint64_t v259 = objc_msgSend_recognitionResultsByLocale(v241, v254, v255, v256, v257, v258);
          v264 = objc_msgSend_objectForKeyedSubscript_(v259, v260, v253, v261, v262, v263);
          uint64_t v265 = (void *)v253;
          goto LABEL_56;
        }
        uint64_t v266 = objc_msgSend_mathResult(v241, v248, v249, v250, v251, v252);
        BOOL v267 = v266 == 0;

        if (!v267) {
          break;
        }
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v373 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v373, OS_LOG_TYPE_ERROR))
        {
          v379 = objc_msgSend_inputStrokeIdentifiers(v241, v374, v375, v376, v377, v378);
          uint64_t v385 = objc_msgSend_count(v379, v380, v381, v382, v383, v384);
          *(_DWORD *)buf = 134217984;
          uint64_t v459 = v385;
          _os_log_impl(&dword_1C492D000, v373, OS_LOG_TYPE_ERROR, "Unexpected group recognition result (%ld strokes) found with no math result and no preferred locale. Skipping.", buf, 0xCu);
        }
        id v386 = 0;
        ++v37;
LABEL_99:

        uint64_t v204 = v455;
      }
      uint64_t v273 = objc_msgSend_orderedLocales(v241, v268, v269, v270, v271, v272);
      uint64_t v265 = objc_msgSend_firstObject(v273, v274, v275, v276, v277, v278);

      uint64_t v259 = objc_msgSend_mathResult(v241, v279, v280, v281, v282, v283);
      v264 = objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v284, (uint64_t)v259, (uint64_t)v454, v285, v286);
LABEL_56:

      uint64_t v292 = objc_msgSend_inputStrokeIdentifiers(v241, v287, v288, v289, v290, v291);
      objc_msgSend_setInputStrokeIdentifiers_(v264, v293, (uint64_t)v292, v294, v295, v296);

      objc_msgSend_setLocale_(v264, v297, (uint64_t)v265, v298, v299, v300);
LABEL_57:
      if (v443
        && (int v301 = objc_msgSend_containsObject_(v447, v218, (uint64_t)v36, v220, v221, v222),
            !(v301 | objc_msgSend_containsObject_(v446, v302, (uint64_t)v36, v303, v304, v305)))
        || !v34)
      {
LABEL_98:
        id v386 = v264;

        id v223 = v223;
        ++v37;
        uint64_t v34 = v386;
        uint64_t v36 = v223;
        int v448 = v451;
        goto LABEL_99;
      }
      if (v447)
      {
        v456[0] = MEMORY[0x1E4F143A8];
        v456[1] = 3221225472;
        v456[2] = sub_1C49F4458;
        v456[3] = &unk_1E64E1FC8;
        id v457 = v36;
        uint64_t v310 = objc_msgSend_indexOfObjectPassingTest_(v447, v306, (uint64_t)v456, v307, v308, v309);

        ++v444;
        if (!v223) {
          goto LABEL_66;
        }
      }
      else
      {
        uint64_t v310 = 0x7FFFFFFFFFFFFFFFLL;
        ++v444;
        if (!v223) {
          goto LABEL_66;
        }
      }
      if (((v448 ^ 1) & 1) == 0)
      {
        v311 = @"\n";
        if (v451) {
          goto LABEL_97;
        }
      }
LABEL_66:
      if (v223 && ((v448 ^ v451) & 1) != 0)
      {
        v312 = objc_opt_class();
        if (objc_msgSend_isStrokeGroup_inlineWithNextGroup_(v312, v313, (uint64_t)v36, (uint64_t)v223, v314, v315))v311 = @" "; {
        else
        }
          v311 = @"\n";
LABEL_97:
        v410 = [CHContextualTextResult alloc];
        v413 = objc_msgSend_initWithTextResult_terminatingSpecialCharacter_strokeGroup_(v410, v411, (uint64_t)v34, (uint64_t)v311, (uint64_t)v36, v412);
        objc_msgSend_addObject_(v445, v414, (uint64_t)v413, v415, v416, v417);

        goto LABEL_98;
      }
      if (v264)
      {
        v316 = objc_msgSend_tokenColumns(v264, v218, v219, v220, v221, v222);
        if (objc_msgSend_count(v316, v317, v318, v319, v320, v321))
        {
          v440 = objc_msgSend_tokenColumns(v264, v322, v323, v324, v325, v326);
          v449 = v316;
          v332 = objc_msgSend_firstObject(v440, v327, v328, v329, v330, v331);
          v338 = objc_msgSend_textTokenRows(v332, v333, v334, v335, v336, v337);
          BOOL v344 = objc_msgSend_count(v338, v339, v340, v341, v342, v343) == 0;

          if (!v344)
          {
            v450 = objc_msgSend_tokenColumns(v264, v218, v219, v220, v221, v222);
            v441 = objc_msgSend_firstObject(v450, v345, v346, v347, v348, v349);
            v439 = objc_msgSend_textTokenRows(v441, v350, v351, v352, v353, v354);
            v360 = objc_msgSend_firstObject(v439, v355, v356, v357, v358, v359);
            v366 = objc_msgSend_firstObject(v360, v361, v362, v363, v364, v365);
            BOOL v372 = (objc_msgSend_properties(v366, v367, v368, v369, v370, v371) & 0x80) == 0;

            v311 = @"\n";
            if (!v372) {
              goto LABEL_97;
            }
          }
        }
        else
        {
        }
      }
      BOOL v387 = width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (v387
        || (objc_msgSend_bounds(v36, v218, v219, v220, v221, v222), v388 / width >= 0.5)
        || ((v311 = @"\n", v444 != v442) ? (v389 = @"\n") : (v389 = 0),
            v390 = v389,
            v444 == v442))
      {
        if (v37 == objc_msgSend_count(v455, v218, v219, v220, v221, v222) - 1)
        {
          v311 = 0;
          char isEqualToString = objc_msgSend_isEqualToString_(0, v391, @"\n", v392, v393, v394);
        }
        else
        {
          objc_msgSend_defaultWordTerminationCharacterForLocale_(CHContextualTextResult, v391, (uint64_t)v454, v392, v393, v394);
          v401 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v310 == 0x7FFFFFFFFFFFFFFFLL)
          {

            v311 = @"\n";
            char isEqualToString = objc_msgSend_isEqualToString_(@"\n", v406, @"\n", v407, v408, v409);
          }
          else
          {
            v311 = v401;
            char isEqualToString = objc_msgSend_isEqualToString_(v401, v402, @"\n", v403, v404, v405);
          }
        }
        if ((isEqualToString & 1) == 0)
        {
          for (unint64_t j = 0; j < objc_msgSend_count(v452, v396, v397, v398, v399, v400) - 1; ++j)
          {
            v428 = objc_msgSend_objectAtIndexedSubscript_(v452, v424, j, v425, v426, v427);
            uint64_t v438 = objc_msgSend_indexOfObject_(v428, v429, (uint64_t)v36, v430, v431, v432);
            if (v438 != 0x7FFFFFFFFFFFFFFFLL && v438 == objc_msgSend_count(v428, v433, v434, v435, v436, v437) - 1)
            {

              v311 = @"\n";
            }
          }
        }
      }
      goto LABEL_97;
    }
    if (v37 >= objc_msgSend_count(v455, v38, v39, v40, v41, v42))
    {
      uint64_t v34 = 0;
      if (qword_1EA3CA000 != -1) {
        goto LABEL_107;
      }
      goto LABEL_34;
    }
    uint64_t v47 = objc_msgSend_objectAtIndexedSubscript_(v455, v43, v37, v44, v45, v46);

    uint64_t v48 = v453->_recognitionResultsByGroupID;
    uint64_t v49 = NSNumber;
    uint64_t v55 = objc_msgSend_uniqueIdentifier(v47, v50, v51, v52, v53, v54);
    uint64_t v60 = objc_msgSend_numberWithInteger_(v49, v56, v55, v57, v58, v59);
    uint64_t v65 = objc_msgSend_objectForKey_(v48, v61, (uint64_t)v60, v62, v63, v64);

    uint64_t v71 = objc_msgSend_preferredLocale(v65, v66, v67, v68, v69, v70);
    BOOL v72 = v71 == 0;

    if (!v72)
    {
      uint64_t v35 = v65;
      uint64_t v36 = v47;
LABEL_7:
      uint64_t v78 = objc_msgSend_preferredLocale(v35, v73, v74, v75, v76, v77);

      uint64_t v84 = objc_msgSend_recognitionResultsByLocale(v35, v79, v80, v81, v82, v83);
      uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v84, v85, v78, v86, v87, v88);
      v454 = (void *)v78;
      goto LABEL_31;
    }
    uint64_t v89 = objc_msgSend_mathResult(v65, v73, v74, v75, v76, v77);
    BOOL v90 = v89 == 0;

    if (v90) {
      break;
    }
    uint64_t v35 = v65;
    uint64_t v36 = v47;
LABEL_10:
    uint64_t v96 = objc_msgSend_orderedLocales(v35, v91, v92, v93, v94, v95);
    BOOL v102 = objc_msgSend_count(v96, v97, v98, v99, v100, v101) == 0;

    if (v102)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v175 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v175, OS_LOG_TYPE_ERROR, "No orderedLocales for group recognition math result, falling back to en_US", buf, 2u);
      }

      objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v176, @"en_US", v177, v178, v179);
      v454 = uint64_t v108 = v454;
    }
    else
    {
      uint64_t v108 = objc_msgSend_orderedLocales(v35, v103, v104, v105, v106, v107);
      uint64_t v114 = objc_msgSend_firstObject(v108, v109, v110, v111, v112, v113);

      v454 = (void *)v114;
    }

    uint64_t v84 = objc_msgSend_mathResult(v35, v180, v181, v182, v183, v184);
    uint64_t v34 = objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v185, (uint64_t)v84, (uint64_t)v454, v186, v187);
    int v448 = 1;
LABEL_31:

    uint64_t v193 = objc_msgSend_inputStrokeIdentifiers(v35, v188, v189, v190, v191, v192);
    objc_msgSend_setInputStrokeIdentifiers_(v34, v194, (uint64_t)v193, v195, v196, v197);

    objc_msgSend_setLocale_(v34, v198, (uint64_t)v454, v199, v200, v201);
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v115 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
  {
    uint64_t v121 = objc_msgSend_inputStrokeIdentifiers(v65, v116, v117, v118, v119, v120);
    uint64_t v127 = objc_msgSend_count(v121, v122, v123, v124, v125, v126);
    *(_DWORD *)buf = 134217984;
    uint64_t v459 = v127;
    _os_log_impl(&dword_1C492D000, v115, OS_LOG_TYPE_ERROR, "Unexpected group recognition result (%ld strokes) found with no math result and no preferred locale. Skipping.", buf, 0xCu);
  }
  ++v37;
  while (1)
  {

    if (v37 >= objc_msgSend_count(v455, v128, v129, v130, v131, v132)) {
      break;
    }
    uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(v455, v133, v37, v134, v135, v136);

    uint64_t v137 = v453->_recognitionResultsByGroupID;
    uint64_t v138 = NSNumber;
    uint64_t v144 = objc_msgSend_uniqueIdentifier(v36, v139, v140, v141, v142, v143);
    uint64_t v149 = objc_msgSend_numberWithInteger_(v138, v145, v144, v146, v147, v148);
    uint64_t v35 = objc_msgSend_objectForKey_(v137, v150, (uint64_t)v149, v151, v152, v153);

    uint64_t v159 = objc_msgSend_preferredLocale(v35, v154, v155, v156, v157, v158);
    BOOL v160 = v159 == 0;

    if (!v160) {
      goto LABEL_7;
    }
    uint64_t v161 = objc_msgSend_mathResult(v35, v73, v74, v75, v76, v77);
    BOOL v162 = v161 == 0;

    if (!v162) {
      goto LABEL_10;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v115 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
    {
      uint64_t v168 = objc_msgSend_inputStrokeIdentifiers(v35, v163, v164, v165, v166, v167);
      uint64_t v174 = objc_msgSend_count(v168, v169, v170, v171, v172, v173);
      *(_DWORD *)buf = 134217984;
      uint64_t v459 = v174;
      _os_log_impl(&dword_1C492D000, v115, OS_LOG_TYPE_ERROR, "Unexpected group recognition result (%ld strokes) found with no math result and no preferred locale. Skipping.", buf, 0xCu);
    }
    ++v37;
    uint64_t v47 = v36;
    uint64_t v65 = v35;
  }
  uint64_t v34 = 0;
  uint64_t v35 = v65;
  uint64_t v36 = v47;
  if (qword_1EA3CA000 == -1) {
    goto LABEL_34;
  }
LABEL_107:
  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
LABEL_34:
  uint64_t v202 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v202, OS_LOG_TYPE_ERROR, "Found no valid group recognition results found with math result or preferred locale. Skipping.", buf, 2u);
  }

  id v445 = (id)MEMORY[0x1E4F1CBF0];
LABEL_37:

  uint64_t v17 = v455;
LABEL_38:

  return v445;
}

- (id)encodedStrokeProviderVersion
{
  return self->_encodedStrokeProviderVersion;
}

- (id)declaredVariables
{
  return self->_declaredVariables;
}

- (id)recognitionResultsByGroupID
{
  return self->_recognitionResultsByGroupID;
}

- (id)rawRecognitionResultsByGroupID
{
  return self->_rawRecognitionResultsByGroupID;
}

- (id)textCorrectionResultsByGroupID
{
  return self->_textCorrectionResultsByGroupID;
}

- (id)cachedRecognitionResultsFromPostProcessing
{
  return self->_cachedRecognitionResultsFromPostProcessing;
}

- (void)setCachedRecognitionResultsFromPostProcessing:(id)a3
{
  id v4 = (NSDictionary *)a3;
  if (self->_cachedRecognitionResultsFromPostProcessing != v4)
  {
    uint64_t v12 = v4;
    uint64_t v10 = (NSDictionary *)objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    cachedRecognitionResultsFromPostProcessing = self->_cachedRecognitionResultsFromPostProcessing;
    self->_cachedRecognitionResultsFromPostProcessing = v10;

    id v4 = v12;
  }
}

- (id)writeToFile
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = NSTemporaryDirectory();
  uint64_t v9 = objc_msgSend_fileURLWithPath_(v3, v5, (uint64_t)v4, v6, v7, v8);

  id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend_setDateFormat_(v10, v11, @"dd-MM-yyyy-HH-mm-ss-SSS", v12, v13, v14);
  uint64_t v20 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v15, v16, v17, v18, v19);
  uint64_t v26 = objc_msgSend_UUIDString(v20, v21, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_substringToIndex_(v26, v27, 4, v28, v29, v30);

  unint64_t v37 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v32, v33, v34, v35, v36);
  uint64_t v42 = objc_msgSend_stringFromDate_(v10, v38, (uint64_t)v37, v39, v40, v41);

  uint64_t v47 = objc_msgSend_stringWithFormat_(NSString, v43, @"/session_result_%@-%@.dat", v44, v45, v46, v42, v31);
  uint64_t v51 = objc_msgSend_writeToFileInFolder_basename_(self, v48, (uint64_t)v9, (uint64_t)v47, v49, v50);

  return v51;
}

- (id)writeToFileInFolder:(id)a3 basename:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v14 = objc_msgSend_absoluteString(v6, v9, v10, v11, v12, v13);
  char v19 = objc_msgSend_fileExistsAtPath_(v8, v15, (uint64_t)v14, v16, v17, v18);

  if (v19)
  {
    uint64_t v24 = 0;
LABEL_5:
    uint64_t v28 = objc_msgSend_URLByAppendingPathComponent_(v6, v20, (uint64_t)v7, v21, v22, v23);
    uint64_t v31 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v29, (uint64_t)self, 1, 0, v30);
    id v54 = v24;
    objc_msgSend_writeToURL_options_error_(v31, v32, (uint64_t)v28, 1, (uint64_t)&v54, v33);
    id v27 = v54;

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v34 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = objc_msgSend_absoluteString(v28, v35, v36, v37, v38, v39);
      uint64_t v46 = objc_msgSend_description(v27, v41, v42, v43, v44, v45);
      *(_DWORD *)buf = 138412546;
      id v57 = v40;
      __int16 v58 = 2112;
      id v59 = v46;
      _os_log_impl(&dword_1C492D000, v34, OS_LOG_TYPE_DEFAULT, "SessionResult writeToFile saving result at URL %@, error = %@", buf, 0x16u);
    }
    if (v27)
    {
      uint64_t v52 = 0;
    }
    else
    {
      uint64_t v52 = objc_msgSend_absoluteString(v28, v47, v48, v49, v50, v51);
    }

    goto LABEL_18;
  }
  id v55 = 0;
  char DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v8, v20, (uint64_t)v6, 1, 0, (uint64_t)&v55);
  id v26 = v55;
  id v27 = v26;
  if (DirectoryAtURL_withIntermediateDirectories_attributes_error)
  {
    uint64_t v24 = v26;
    goto LABEL_5;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v28 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v57 = v6;
    __int16 v58 = 2112;
    id v59 = v27;
    _os_log_impl(&dword_1C492D000, v28, OS_LOG_TYPE_ERROR, "Session result unable to create folder at URL %@: Error %@", buf, 0x16u);
  }
  uint64_t v52 = 0;
LABEL_18:

  return v52;
}

+ (id)loadFromFile:(id)a3
{
  id v6 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3, v4, v5);
  id v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v155 = a3;
  uint64_t v9 = objc_msgSend_encodedStrokeProviderVersion(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v155, v10, (uint64_t)v9, @"strokeProviderVersion", v11, v12);

  uint64_t v18 = objc_msgSend_orderedStrokeIdentifiers(self, v13, v14, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v155, v19, (uint64_t)v18, @"orderedStrokeIdentifiers", v20, v21);

  uint64_t v27 = objc_msgSend_sessionMode(self, v22, v23, v24, v25, v26);
  objc_msgSend_encodeInteger_forKey_(v155, v28, v27, @"sessionMode", v29, v30);
  uint64_t v36 = objc_msgSend_locales(self, v31, v32, v33, v34, v35);
  objc_msgSend_encodeObject_forKey_(v155, v37, (uint64_t)v36, @"locales", v38, v39);

  uint64_t v45 = objc_msgSend_preferredLocales(self, v40, v41, v42, v43, v44);
  objc_msgSend_encodeObject_forKey_(v155, v46, (uint64_t)v45, @"preferredLocales", v47, v48);

  id v54 = objc_msgSend_declaredVariables(self, v49, v50, v51, v52, v53);
  objc_msgSend_encodeObject_forKey_(v155, v55, (uint64_t)v54, @"declaredVariables", v56, v57);

  uint64_t v63 = objc_msgSend_strokeClassificationResult(self, v58, v59, v60, v61, v62);
  objc_msgSend_encodeObject_forKey_(v155, v64, (uint64_t)v63, @"strokeClassificationResult", v65, v66);

  BOOL v72 = objc_msgSend_rawStrokeClassificationResult(self, v67, v68, v69, v70, v71);
  objc_msgSend_encodeObject_forKey_(v155, v73, (uint64_t)v72, @"rawStrokeClassificationResult", v74, v75);

  uint64_t v81 = objc_msgSend_strokeGroupingResult(self, v76, v77, v78, v79, v80);
  objc_msgSend_encodeObject_forKey_(v155, v82, (uint64_t)v81, @"strokeGroupingResult", v83, v84);

  BOOL v90 = objc_msgSend_unprocessedStrokeGroupingResult(self, v85, v86, v87, v88, v89);
  objc_msgSend_encodeObject_forKey_(v155, v91, (uint64_t)v90, @"unprocessedStrokeGroupingResult", v92, v93);

  uint64_t v99 = objc_msgSend_rawStrokeGroupingResult(self, v94, v95, v96, v97, v98);
  objc_msgSend_encodeObject_forKey_(v155, v100, (uint64_t)v99, @"rawStrokeGroupingResult", v101, v102);

  uint64_t v108 = objc_msgSend_recognitionResultsByGroupID(self, v103, v104, v105, v106, v107);
  objc_msgSend_encodeObject_forKey_(v155, v109, (uint64_t)v108, @"recognitionResults", v110, v111);

  uint64_t v117 = objc_msgSend_rawRecognitionResultsByGroupID(self, v112, v113, v114, v115, v116);
  objc_msgSend_encodeObject_forKey_(v155, v118, (uint64_t)v117, @"rawRecognitionResults", v119, v120);

  uint64_t v126 = objc_msgSend_textCorrectionResultsByGroupID(self, v121, v122, v123, v124, v125);
  objc_msgSend_encodeObject_forKey_(v155, v127, (uint64_t)v126, @"inlineContinuousModeResults", v128, v129);

  uint64_t v135 = objc_msgSend_cachedRecognitionResultsFromPostProcessing(self, v130, v131, v132, v133, v134);
  objc_msgSend_encodeObject_forKey_(v155, v136, (uint64_t)v135, @"cachedRecognitionResultsFromPostProcessing", v137, v138);

  uint64_t v142 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v139, (uint64_t)&self->_generationDuration, 48, v140, v141);
  objc_msgSend_encodeObject_forKey_(v155, v143, (uint64_t)v142, @"generationDuration", v144, v145);
  uint64_t v151 = objc_msgSend_recognitionEnvironment(self, v146, v147, v148, v149, v150);
  objc_msgSend_encodeInteger_forKey_(v155, v152, v151, @"recognitionEnvironment", v153, v154);
}

- (CHRecognitionSessionResult)initWithCoder:(id)a3
{
  v222[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v209 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v5, v4, @"strokeProviderVersion", v6, v7);
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v222[0] = objc_opt_class();
  v222[1] = objc_opt_class();
  uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v222, 2, v10, v11);
  uint64_t v17 = objc_msgSend_setWithArray_(v8, v13, (uint64_t)v12, v14, v15, v16);
  uint64_t v208 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v18, (uint64_t)v17, @"orderedStrokeIdentifiers", v19, v20);

  uint64_t v197 = objc_msgSend_decodeIntegerForKey_(v3, v21, @"sessionMode", v22, v23, v24);
  uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
  v221[0] = objc_opt_class();
  v221[1] = objc_opt_class();
  uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v221, 2, v27, v28);
  uint64_t v34 = objc_msgSend_setWithArray_(v25, v30, (uint64_t)v29, v31, v32, v33);
  uint64_t v38 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v35, (uint64_t)v34, @"locales", v36, v37);

  uint64_t v207 = objc_msgSend_effectiveLocalesFromLocales_(CHRecognitionSession, v39, (uint64_t)v38, v40, v41, v42);

  uint64_t v43 = (void *)MEMORY[0x1E4F1CAD0];
  v220[0] = objc_opt_class();
  v220[1] = objc_opt_class();
  uint64_t v47 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v44, (uint64_t)v220, 2, v45, v46);
  uint64_t v52 = objc_msgSend_setWithArray_(v43, v48, (uint64_t)v47, v49, v50, v51);
  uint64_t v56 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v53, (uint64_t)v52, @"preferredLocales", v54, v55);

  uint64_t v206 = objc_msgSend_effectiveLocalesFromLocales_(CHRecognitionSession, v57, (uint64_t)v56, v58, v59, v60);

  uint64_t v61 = (void *)MEMORY[0x1E4F1CAD0];
  v219[0] = objc_opt_class();
  v219[1] = objc_opt_class();
  uint64_t v65 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v62, (uint64_t)v219, 2, v63, v64);
  uint64_t v70 = objc_msgSend_setWithArray_(v61, v66, (uint64_t)v65, v67, v68, v69);
  v203 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v71, (uint64_t)v70, @"declaredVariables", v72, v73);

  uint64_t v202 = objc_alloc_init(CHStrokeClutterFilter);
  uint64_t v74 = objc_opt_class();
  uint64_t v204 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v75, v74, @"strokeClassificationResult", v76, v77);
  uint64_t v78 = objc_opt_class();
  uint64_t v205 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v79, v78, @"rawStrokeClassificationResult", v80, v81);
  uint64_t v82 = (void *)MEMORY[0x1E4F1CAD0];
  v218[0] = objc_opt_class();
  v218[1] = objc_opt_class();
  v218[2] = objc_opt_class();
  uint64_t v86 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v83, (uint64_t)v218, 3, v84, v85);
  uint64_t v91 = objc_msgSend_setWithArray_(v82, v87, (uint64_t)v86, v88, v89, v90);
  uint64_t v201 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v92, (uint64_t)v91, @"strokeGroupingResult", v93, v94);

  uint64_t v95 = (void *)MEMORY[0x1E4F1CAD0];
  v217[0] = objc_opt_class();
  v217[1] = objc_opt_class();
  v217[2] = objc_opt_class();
  uint64_t v99 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v96, (uint64_t)v217, 3, v97, v98);
  uint64_t v104 = objc_msgSend_setWithArray_(v95, v100, (uint64_t)v99, v101, v102, v103);
  uint64_t v200 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v105, (uint64_t)v104, @"rawStrokeGroupingResult", v106, v107);

  uint64_t v108 = (void *)MEMORY[0x1E4F1CAD0];
  v216[0] = objc_opt_class();
  v216[1] = objc_opt_class();
  v216[2] = objc_opt_class();
  uint64_t v112 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v109, (uint64_t)v216, 3, v110, v111);
  uint64_t v117 = objc_msgSend_setWithArray_(v108, v113, (uint64_t)v112, v114, v115, v116);
  uint64_t v199 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v118, (uint64_t)v117, @"unprocessedStrokeGroupingResult", v119, v120);

  uint64_t v121 = (void *)MEMORY[0x1E4F1CAD0];
  v215[0] = objc_opt_class();
  v215[1] = objc_opt_class();
  v215[2] = objc_opt_class();
  uint64_t v125 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v122, (uint64_t)v215, 3, v123, v124);
  uint64_t v130 = objc_msgSend_setWithArray_(v121, v126, (uint64_t)v125, v127, v128, v129);
  uint64_t v134 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v131, (uint64_t)v130, @"recognitionResults", v132, v133);

  uint64_t v135 = (void *)MEMORY[0x1E4F1CAD0];
  v214[0] = objc_opt_class();
  v214[1] = objc_opt_class();
  v214[2] = objc_opt_class();
  uint64_t v139 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v136, (uint64_t)v214, 3, v137, v138);
  uint64_t v144 = objc_msgSend_setWithArray_(v135, v140, (uint64_t)v139, v141, v142, v143);
  uint64_t v148 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v145, (uint64_t)v144, @"rawRecognitionResults", v146, v147);

  uint64_t v149 = (void *)MEMORY[0x1E4F1CAD0];
  v213[0] = objc_opt_class();
  v213[1] = objc_opt_class();
  v213[2] = objc_opt_class();
  v213[3] = objc_opt_class();
  uint64_t v153 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v150, (uint64_t)v213, 4, v151, v152);
  uint64_t v158 = objc_msgSend_setWithArray_(v149, v154, (uint64_t)v153, v155, v156, v157);
  BOOL v162 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v159, (uint64_t)v158, @"inlineContinuousModeResults", v160, v161);

  uint64_t v163 = (void *)MEMORY[0x1E4F1CAD0];
  v212[0] = objc_opt_class();
  v212[1] = objc_opt_class();
  v212[2] = objc_opt_class();
  uint64_t v167 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v164, (uint64_t)v212, 3, v165, v166);
  uint64_t v172 = objc_msgSend_setWithArray_(v163, v168, (uint64_t)v167, v169, v170, v171);
  uint64_t v176 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v173, (uint64_t)v172, @"inlineContinuousModeResults", v174, v175);

  uint64_t v177 = objc_opt_class();
  uint64_t v181 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v178, v177, @"generationDuration", v179, v180);
  objc_msgSend_getBytes_length_(v181, v182, (uint64_t)v211, 48, v183, v184);
  uint64_t v189 = objc_msgSend_decodeIntegerForKey_(v3, v185, @"recognitionEnvironment", v186, v187, v188);
  v210[0] = v211[0];
  v210[1] = v211[1];
  v210[2] = v211[2];
  uint64_t v191 = (CHRecognitionSessionResult *)objc_msgSend_initWithStrokeProviderVersion_encodedStrokeProviderVersion_orderedStrokeIdentifiers_sessionMode_locales_preferredLocales_declaredVariables_clutterFilter_strokeClassificationResult_rawStrokeClassificationResult_strokeGroupingResult_rawStrokeGroupingResult_unprocessedStrokeGroupingResult_recognitionResults_rawRecognitionResults_inlineContinuousModeResults_autoRefineResults_generationDuration_recognitionEnvironment_(self, v190, 0, (uint64_t)v209, (uint64_t)v208, v197, v207, v206, v203, v202, v204, v205, v201, v200, v199, v134, v148, v176, 0,
                                         v210,
                                         v189);
  objc_msgSend_setCachedRecognitionResultsFromPostProcessing_(v191, v192, (uint64_t)v162, v193, v194, v195);

  return v191;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToSerializableRecognitionSessionResult:(id)a3
{
  id v4 = a3;
  encodedStrokeProviderVersion = self->_encodedStrokeProviderVersion;
  objc_msgSend_encodedStrokeProviderVersion(v4, v6, v7, v8, v9, v10);
  uint64_t v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (encodedStrokeProviderVersion == v16)
  {
  }
  else
  {
    uint64_t v17 = objc_msgSend_encodedStrokeProviderVersion(v4, v11, v12, v13, v14, v15);
    int isEqual = objc_msgSend_isEqual_(v17, v18, (uint64_t)self->_encodedStrokeProviderVersion, v19, v20, v21);

    if (!isEqual) {
      goto LABEL_64;
    }
  }
  orderedStrokeIdentifiers = self->_orderedStrokeIdentifiers;
  objc_msgSend_orderedStrokeIdentifiers(v4, v23, v24, v25, v26, v27);
  uint64_t v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (orderedStrokeIdentifiers == v34)
  {
  }
  else
  {
    uint64_t v35 = objc_msgSend_orderedStrokeIdentifiers(v4, v29, v30, v31, v32, v33);
    int v40 = objc_msgSend_isEqual_(v35, v36, (uint64_t)self->_orderedStrokeIdentifiers, v37, v38, v39);

    if (!v40) {
      goto LABEL_64;
    }
  }
  locales = self->_locales;
  objc_msgSend_locales(v4, v41, v42, v43, v44, v45);
  uint64_t v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (locales == v52)
  {
  }
  else
  {
    uint64_t v53 = objc_msgSend_locales(v4, v47, v48, v49, v50, v51);
    int v58 = objc_msgSend_isEqual_(v53, v54, (uint64_t)self->_locales, v55, v56, v57);

    if (!v58) {
      goto LABEL_64;
    }
  }
  preferredLocales = self->_preferredLocales;
  objc_msgSend_preferredLocales(v4, v59, v60, v61, v62, v63);
  uint64_t v70 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (preferredLocales == v70)
  {
  }
  else
  {
    uint64_t v71 = objc_msgSend_preferredLocales(v4, v65, v66, v67, v68, v69);
    int v76 = objc_msgSend_isEqual_(v71, v72, (uint64_t)self->_preferredLocales, v73, v74, v75);

    if (!v76) {
      goto LABEL_64;
    }
  }
  strokeClassificationResult = self->_strokeClassificationResult;
  objc_msgSend_strokeClassificationResult(v4, v77, v78, v79, v80, v81);
  uint64_t v88 = (CHStrokeClassificationResult *)objc_claimAutoreleasedReturnValue();
  if (strokeClassificationResult == v88)
  {
  }
  else
  {
    uint64_t v89 = objc_msgSend_strokeClassificationResult(v4, v83, v84, v85, v86, v87);
    int isEquivalentToStrokeClassificationResult = objc_msgSend_isEquivalentToStrokeClassificationResult_(v89, v90, (uint64_t)self->_strokeClassificationResult, v91, v92, v93);

    if (!isEquivalentToStrokeClassificationResult) {
      goto LABEL_64;
    }
  }
  rawStrokeClassificationResult = self->_rawStrokeClassificationResult;
  objc_msgSend_rawStrokeClassificationResult(v4, v95, v96, v97, v98, v99);
  uint64_t v106 = (CHStrokeClassificationResult *)objc_claimAutoreleasedReturnValue();
  if (rawStrokeClassificationResult == v106)
  {
  }
  else
  {
    uint64_t v107 = objc_msgSend_rawStrokeClassificationResult(v4, v101, v102, v103, v104, v105);
    int v112 = objc_msgSend_isEquivalentToStrokeClassificationResult_(v107, v108, (uint64_t)self->_rawStrokeClassificationResult, v109, v110, v111);

    if (!v112) {
      goto LABEL_64;
    }
  }
  strokeGroupingResult = self->_strokeGroupingResult;
  objc_msgSend_strokeGroupingResult(v4, v113, v114, v115, v116, v117);
  uint64_t v124 = (CHStrokeGroupingResult *)objc_claimAutoreleasedReturnValue();
  if (strokeGroupingResult == v124)
  {
  }
  else
  {
    uint64_t v125 = objc_msgSend_strokeGroupingResult(v4, v119, v120, v121, v122, v123);
    int v130 = objc_msgSend_isEqual_(v125, v126, (uint64_t)self->_strokeGroupingResult, v127, v128, v129);

    if (!v130) {
      goto LABEL_64;
    }
  }
  rawStrokeGroupingResult = self->_rawStrokeGroupingResult;
  objc_msgSend_rawStrokeGroupingResult(v4, v131, v132, v133, v134, v135);
  uint64_t v142 = (CHStrokeGroupingResult *)objc_claimAutoreleasedReturnValue();
  if (rawStrokeGroupingResult == v142)
  {
  }
  else
  {
    uint64_t v143 = objc_msgSend_rawStrokeGroupingResult(v4, v137, v138, v139, v140, v141);
    int v148 = objc_msgSend_isEqual_(v143, v144, (uint64_t)self->_rawStrokeGroupingResult, v145, v146, v147);

    if (!v148) {
      goto LABEL_64;
    }
  }
  unprocessedStrokeGroupingResult = self->_unprocessedStrokeGroupingResult;
  objc_msgSend_unprocessedStrokeGroupingResult(v4, v149, v150, v151, v152, v153);
  uint64_t v160 = (CHStrokeGroupingResult *)objc_claimAutoreleasedReturnValue();
  if (unprocessedStrokeGroupingResult == v160)
  {
  }
  else
  {
    uint64_t v161 = objc_msgSend_unprocessedStrokeGroupingResult(v4, v155, v156, v157, v158, v159);
    int v166 = objc_msgSend_isEqual_(v161, v162, (uint64_t)self->_unprocessedStrokeGroupingResult, v163, v164, v165);

    if (!v166) {
      goto LABEL_64;
    }
  }
  recognitionResultsByGroupID = self->_recognitionResultsByGroupID;
  objc_msgSend_recognitionResultsByGroupID(v4, v167, v168, v169, v170, v171);
  uint64_t v178 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (recognitionResultsByGroupID == v178)
  {
  }
  else
  {
    uint64_t v179 = objc_msgSend_recognitionResultsByGroupID(v4, v173, v174, v175, v176, v177);
    int v184 = objc_msgSend_isEqual_(v179, v180, (uint64_t)self->_recognitionResultsByGroupID, v181, v182, v183);

    if (!v184) {
      goto LABEL_64;
    }
  }
  rawRecognitionResultsByGroupID = self->_rawRecognitionResultsByGroupID;
  objc_msgSend_rawRecognitionResultsByGroupID(v4, v185, v186, v187, v188, v189);
  uint64_t v196 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (rawRecognitionResultsByGroupID == v196)
  {
  }
  else
  {
    uint64_t v197 = objc_msgSend_rawRecognitionResultsByGroupID(v4, v191, v192, v193, v194, v195);
    int v202 = objc_msgSend_isEqual_(v197, v198, (uint64_t)self->_rawRecognitionResultsByGroupID, v199, v200, v201);

    if (!v202) {
      goto LABEL_64;
    }
  }
  textCorrectionResultsByGroupID = self->_textCorrectionResultsByGroupID;
  objc_msgSend_textCorrectionResultsByGroupID(v4, v203, v204, v205, v206, v207);
  uint64_t v214 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (textCorrectionResultsByGroupID == v214)
  {
  }
  else
  {
    uint64_t v215 = objc_msgSend_textCorrectionResultsByGroupID(v4, v209, v210, v211, v212, v213);
    int v220 = objc_msgSend_isEqual_(v215, v216, (uint64_t)self->_textCorrectionResultsByGroupID, v217, v218, v219);

    if (!v220) {
      goto LABEL_64;
    }
  }
  double groupingDuration = self->_generationDuration.groupingDuration;
  if (v4)
  {
    objc_msgSend_generationDuration(v4, v221, v222, v223, v224, v225);
    if (groupingDuration != v266) {
      goto LABEL_64;
    }
    double recognitionDuration = self->_generationDuration.recognitionDuration;
    objc_msgSend_generationDuration(v4, v227, v228, v229, v230, v231);
    if (recognitionDuration != v265) {
      goto LABEL_64;
    }
    double strokeClassificationDuration = self->_generationDuration.strokeClassificationDuration;
    objc_msgSend_generationDuration(v4, v233, v234, v235, v236, v237);
    if (strokeClassificationDuration != v264) {
      goto LABEL_64;
    }
    double strokeClutterFilteringDuration = self->_generationDuration.strokeClutterFilteringDuration;
    objc_msgSend_generationDuration(v4, v239, v240, v241, v242, v243);
    if (strokeClutterFilteringDuration != v263) {
      goto LABEL_64;
    }
    double totalDuration = self->_generationDuration.totalDuration;
    objc_msgSend_generationDuration(v4, v245, v246, v247, v248, v249);
    if (totalDuration != v262) {
      goto LABEL_64;
    }
    double principalLinesDuration = self->_generationDuration.principalLinesDuration;
    objc_msgSend_generationDuration(v4, v251, v252, v253, v254, v255);
    double v257 = v261;
  }
  else
  {
    if (groupingDuration != 0.0
      || self->_generationDuration.recognitionDuration != 0.0
      || self->_generationDuration.strokeClassificationDuration != 0.0
      || self->_generationDuration.strokeClutterFilteringDuration != 0.0
      || self->_generationDuration.totalDuration != 0.0)
    {
      goto LABEL_64;
    }
    double principalLinesDuration = self->_generationDuration.principalLinesDuration;
    double v257 = 0.0;
  }
  if (principalLinesDuration != v257)
  {
LABEL_64:
    BOOL v259 = 0;
    goto LABEL_65;
  }
  int64_t recognitionEnvironment = self->_recognitionEnvironment;
  BOOL v259 = recognitionEnvironment == objc_msgSend_recognitionEnvironment(v4, v221, v222, v223, v224, v225);
LABEL_65:

  return v259;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (CHRecognitionSessionResult *)v4;
    uint64_t v10 = v5;
    if (self)
    {
      if (self == v5)
      {
        LOBYTE(self) = 1;
      }
      else if (objc_msgSend_isEqualToSerializableRecognitionSessionResult_(self, v6, (uint64_t)v5, v7, v8, v9))
      {
        clutterFilter = self->_clutterFilter;
        objc_msgSend_clutterFilter(v10, v11, v12, v13, v14, v15);
        uint64_t v22 = (CHStrokeClutterFilter *)objc_claimAutoreleasedReturnValue();
        if (clutterFilter == v22)
        {
          LOBYTE(self) = 1;
        }
        else if (self->_clutterFilter)
        {
          uint64_t v23 = objc_msgSend_clutterFilter(v10, v17, v18, v19, v20, v21);
          LOBYTE(self) = objc_msgSend_isEqual_(v23, v24, (uint64_t)self->_clutterFilter, v25, v26, v27);
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (int64_t)completeness
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (!self->__shouldUseCachedCompleteness)
  {
    uint64_t v89 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self->_strokeClassificationResult, a2, v2, v3, v4, v5);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    objc_msgSend_allKeys(self->_recognitionResultsByGroupID, v7, v8, v9, v10, v11);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v90, (uint64_t)v94, 16, v13);
    if (v18)
    {
      uint64_t v19 = *(void *)v91;
      char v87 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v91 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = objc_msgSend_objectForKey_(self->_recognitionResultsByGroupID, v14, *(void *)(*((void *)&v90 + 1) + 8 * i), v15, v16, v17);
          uint64_t v27 = objc_msgSend_preferredLocale(v21, v22, v23, v24, v25, v26);
          uint64_t v33 = objc_msgSend_inputStrokeIdentifiers(v21, v28, v29, v30, v31, v32);
          uint64_t v39 = objc_msgSend_firstObject(v33, v34, v35, v36, v37, v38);
          uint64_t v44 = objc_msgSend_objectForKey_(v89, v40, (uint64_t)v39, v41, v42, v43);
          uint64_t v50 = objc_msgSend_integerValue(v44, v45, v46, v47, v48, v49);

          uint64_t v51 = objc_opt_class();
          if (objc_msgSend_isStrokeClassificationTextOrMath_(v51, v52, v50, v53, v54, v55)
            && objc_msgSend_count(self->_locales, v56, v57, v58, v59, v60))
          {
            if (v21 && v27)
            {
              uint64_t v66 = objc_msgSend_recognitionResultsByLocale(v21, v61, v62, v63, v64, v65);
              uint64_t v71 = objc_msgSend_objectForKey_(v66, v67, (uint64_t)v27, v68, v69, v70);

              if (!v71) {
                goto LABEL_18;
              }
              uint64_t v77 = objc_msgSend_topModelTranscriptionPath(v71, v72, v73, v74, v75, v76);
              char hasValidPrincipalLinesForPath = objc_msgSend_hasValidPrincipalLinesForPath_(v71, v78, (uint64_t)v77, v79, v80, v81);

              v87 &= hasValidPrincipalLinesForPath;
            }
            else
            {
              uint64_t v83 = objc_msgSend_mathResult(v21, v61, v62, v63, v64, v65);
              BOOL v84 = v83 == 0;

              if (v84)
              {
LABEL_18:

                goto LABEL_22;
              }
            }
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v90, (uint64_t)v94, 16, v17);
        if (v18) {
          continue;
        }
        break;
      }

      if ((v87 & 1) == 0)
      {
        int64_t v85 = 1;
        goto LABEL_21;
      }
    }
    else
    {
    }
    int64_t v85 = 2;
LABEL_21:
    self->_completeness = v85;
LABEL_22:
    self->__shouldUseCachedCompleteness = 1;
  }
  return self->_completeness;
}

- (CHStrokeProviderVersion)strokeProviderVersion
{
  return self->_strokeProviderVersion;
}

- (NSArray)orderedStrokeIdentifiers
{
  return self->_orderedStrokeIdentifiers;
}

- (int64_t)sessionMode
{
  return self->_sessionMode;
}

- (NSArray)locales
{
  return self->_locales;
}

- (NSArray)preferredLocales
{
  return self->_preferredLocales;
}

- (CHStrokeClutterFilter)clutterFilter
{
  return self->_clutterFilter;
}

- (int64_t)recognitionEnvironment
{
  return self->_recognitionEnvironment;
}

- (CHStrokeClassificationResult)rawStrokeClassificationResult
{
  return self->_rawStrokeClassificationResult;
}

- (CHStrokeGroupingResult)rawStrokeGroupingResult
{
  return self->_rawStrokeGroupingResult;
}

- (CHStrokeClassificationResult)strokeClassificationResult
{
  return self->_strokeClassificationResult;
}

- (CHStrokeGroupingResult)unprocessedStrokeGroupingResult
{
  return self->_unprocessedStrokeGroupingResult;
}

- (CHStrokeGroupingResult)strokeGroupingResult
{
  return self->_strokeGroupingResult;
}

- (NSArray)autoRefineResults
{
  return self->_autoRefineResults;
}

- ($54B668FA3CFF7C50914A1C899F2834C0)generationDuration
{
  long long v3 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var5;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[4].var3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoRefineResults, 0);
  objc_storeStrong((id *)&self->_strokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_unprocessedStrokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_strokeClassificationResult, 0);
  objc_storeStrong((id *)&self->_rawStrokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_rawStrokeClassificationResult, 0);
  objc_storeStrong((id *)&self->_clutterFilter, 0);
  objc_storeStrong((id *)&self->_preferredLocales, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_orderedStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeProviderVersion, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_encodedStrokeProviderVersion, 0);
  objc_storeStrong((id *)&self->_cachedRecognitionResultsFromPostProcessing, 0);
  objc_storeStrong((id *)&self->_textCorrectionResultsByGroupID, 0);
  objc_storeStrong((id *)&self->_rawRecognitionResultsByGroupID, 0);
  objc_storeStrong((id *)&self->_recognitionResultsByGroupID, 0);
}

@end