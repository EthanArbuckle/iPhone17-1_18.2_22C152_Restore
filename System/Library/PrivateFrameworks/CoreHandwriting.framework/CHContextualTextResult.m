@interface CHContextualTextResult
+ (id)defaultWordTerminationCharacterForLocale:(id)a3;
- (BOOL)isMathForContextLookup;
- (BOOL)isNonTextCandidateForContextLookup;
- (BOOL)isNonTextCandidateForContextLookupByStrokeClassificationResult:(id)a3;
- (CHContextualTextResult)initWithTextResult:(id)a3 terminatingSpecialCharacter:(id)a4 strokeGroup:(id)a5;
- (CHStrokeGroup)strokeGroup;
- (CHStrokeGroupRecognitionResult)strokeGroupResult;
- (CHTokenizedTextResult)textResult;
- (NSString)terminatingSpecialCharacter;
- (void)setStrokeGroup:(id)a3;
- (void)setStrokeGroupResult:(id)a3;
- (void)setTerminatingSpecialCharacter:(id)a3;
- (void)setTextResult:(id)a3;
@end

@implementation CHContextualTextResult

- (CHContextualTextResult)initWithTextResult:(id)a3 terminatingSpecialCharacter:(id)a4 strokeGroup:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHContextualTextResult;
  v12 = [(CHContextualTextResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_textResult, a3);
    objc_storeStrong((id *)&v13->_terminatingSpecialCharacter, a4);
    objc_storeStrong((id *)&v13->_strokeGroup, a5);
  }

  return v13;
}

+ (id)defaultWordTerminationCharacterForLocale:(id)a3
{
  int shouldApplyLatinSpacingForLocale = objc_msgSend_shouldApplyLatinSpacingForLocale_(CHRecognizerConfiguration, a2, (uint64_t)a3, v3, v4, v5);
  v7 = &stru_1F20141C8;
  if (shouldApplyLatinSpacingForLocale) {
    v7 = @" ";
  }
  v8 = v7;
  return v8;
}

- (BOOL)isNonTextCandidateForContextLookup
{
  v6 = self;
  v7 = objc_msgSend_textResult(self, a2, v2, v3, v4, v5);
  int isMathForContextLookup = objc_msgSend_isMathForContextLookup(v6, v8, v9, v10, v11, v12);
  LOBYTE(v6) = objc_msgSend_isNonTextCandidateTranscriptionWithStrictFiltering_(v7, v14, isMathForContextLookup ^ 1u, v15, v16, v17);

  return (char)v6;
}

- (BOOL)isMathForContextLookup
{
  v64[1] = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_textResult(self, a2, v2, v3, v4, v5);
  v13 = objc_msgSend_topTranscription(v7, v8, v9, v10, v11, v12);
  if (objc_msgSend_containsString_(v13, v14, @"=", v15, v16, v17))
  {
    BOOL v23 = 1;
  }
  else
  {
    v24 = objc_msgSend_textResult(self, v18, v19, v20, v21, v22);
    v30 = objc_msgSend_topTranscription(v24, v25, v26, v27, v28, v29);
    v36 = objc_msgSend_ch_mathExclusiveSymbolSet(MEMORY[0x1E4F28B88], v31, v32, v33, v34, v35);
    v64[0] = v36;
    v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v64, 1, v38, v39);
    v45 = objc_msgSend_ch_hasCharactersFromSets_(v30, v41, (uint64_t)v40, v42, v43, v44);
    BOOL v23 = v45 != 0;
  }
  v51 = objc_msgSend_strokeGroup(self, v46, v47, v48, v49, v50);
  uint64_t v57 = objc_msgSend_classification(v51, v52, v53, v54, v55, v56);
  char isStrokeClassificationMath = objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v58, v57, v59, v60, v61);

  return isStrokeClassificationMath & v23;
}

- (BOOL)isNonTextCandidateForContextLookupByStrokeClassificationResult:(id)a3
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v10 = objc_msgSend_textResult(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_inputStrokeIdentifiers(v10, v11, v12, v13, v14, v15);

  uint64_t v22 = objc_msgSend_count(v16, v17, v18, v19, v20, v21);
  BOOL v28 = 1;
  if (v4 && v22)
  {
    uint64_t v123 = v22;
    uint64_t v29 = objc_msgSend_textResult(self, v23, v24, v25, v26, v27);
    uint64_t v35 = objc_msgSend_textResult(self, v30, v31, v32, v33, v34);
    v41 = objc_msgSend_transcriptionPaths(v35, v36, v37, v38, v39, v40);
    uint64_t v47 = objc_msgSend_firstObject(v41, v42, v43, v44, v45, v46);
    uint64_t v52 = objc_msgSend_inLexiconTokenCountInTranscriptionPath_(v29, v48, (uint64_t)v47, v49, v50, v51);

    v58 = objc_msgSend_textResult(self, v53, v54, v55, v56, v57);
    v64 = objc_msgSend_textResult(self, v59, v60, v61, v62, v63);
    uint64_t v70 = objc_msgSend_tokenColumnCount(v64, v65, v66, v67, v68, v69);
    objc_msgSend_averageTokenRecognitionScoreForColumnRange_(v58, v71, 0, v70, v72, v73);
    double v75 = v74;

    if (v52 > 1 || v52 == 1 && v75 > 0.9)
    {
      BOOL v28 = 0;
    }
    else
    {
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      v122 = v16;
      id v76 = v16;
      uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v124, (uint64_t)v128, 16, v78);
      if (v79)
      {
        uint64_t v85 = v79;
        uint64_t v86 = 0;
        uint64_t v87 = *(void *)v125;
        do
        {
          for (uint64_t i = 0; i != v85; ++i)
          {
            if (*(void *)v125 != v87) {
              objc_enumerationMutation(v76);
            }
            uint64_t v89 = *(void *)(*((void *)&v124 + 1) + 8 * i);
            v90 = objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v4, v80, v81, v82, v83, v84, v122);
            v95 = objc_msgSend_objectForKeyedSubscript_(v90, v91, v89, v92, v93, v94);

            if (v95)
            {
              v101 = objc_msgSend_orderedScriptClassification(v95, v96, v97, v98, v99, v100);
              uint64_t v106 = objc_msgSend_indexOfObject_(v101, v102, (uint64_t)&unk_1F203EFE8, v103, v104, v105);

              v112 = objc_msgSend_orderedScriptClassification(v95, v107, v108, v109, v110, v111);
              uint64_t v117 = objc_msgSend_indexOfObject_(v112, v113, (uint64_t)&unk_1F203F000, v114, v115, v116);

              if (v117 < 3 && v106 < 3 || v106 < 2) {
                ++v86;
              }
            }
          }
          uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v80, (uint64_t)&v124, (uint64_t)v128, 16, v84);
        }
        while (v85);
      }
      else
      {
        uint64_t v86 = 0;
      }

      float v120 = (float)v86;
      uint64_t v16 = v122;
      BOOL v28 = (float)(v120 / (float)v123) >= 0.5;
    }
  }

  return v28;
}

- (CHTokenizedTextResult)textResult
{
  return self->_textResult;
}

- (void)setTextResult:(id)a3
{
}

- (CHStrokeGroup)strokeGroup
{
  return self->_strokeGroup;
}

- (void)setStrokeGroup:(id)a3
{
}

- (NSString)terminatingSpecialCharacter
{
  return self->_terminatingSpecialCharacter;
}

- (void)setTerminatingSpecialCharacter:(id)a3
{
}

- (CHStrokeGroupRecognitionResult)strokeGroupResult
{
  return self->_strokeGroupResult;
}

- (void)setStrokeGroupResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminatingSpecialCharacter, 0);
  objc_storeStrong((id *)&self->_strokeGroup, 0);
  objc_storeStrong((id *)&self->_textResult, 0);
  objc_storeStrong((id *)&self->_strokeGroupResult, 0);
}

@end