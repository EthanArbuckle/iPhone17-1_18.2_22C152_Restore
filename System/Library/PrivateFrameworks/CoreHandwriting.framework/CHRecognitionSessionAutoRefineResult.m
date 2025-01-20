@interface CHRecognitionSessionAutoRefineResult
- (CHDrawing)drawing;
- (CHRecognitionSessionAutoRefineResult)initWithStrokeGroupResult:(id)a3 strokeGroup:(id)a4 textResult:(id)a5 refinedColumns:(id)a6 strokeProvider:(id)a7;
- (CHStrokeGroup)strokeGroup;
- (CHStrokeGroupRecognitionResult)strokeGroupResult;
- (CHTokenizedTextResult)textResult;
- (NSArray)strokeIdentifiers;
- (NSArray)tokenOriginalBounds;
- (NSIndexSet)refinedTokenColumns;
- (NSIndexSet)syntheticStrokeIndexes;
@end

@implementation CHRecognitionSessionAutoRefineResult

- (CHRecognitionSessionAutoRefineResult)initWithStrokeGroupResult:(id)a3 strokeGroup:(id)a4 textResult:(id)a5 refinedColumns:(id)a6 strokeProvider:(id)a7
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v121 = a4;
  id v119 = a5;
  id v120 = a6;
  id v14 = a7;
  v128.receiver = self;
  v128.super_class = (Class)CHRecognitionSessionAutoRefineResult;
  v15 = [(CHRecognitionSessionAutoRefineResult *)&v128 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v15->_strokeGroup, a4);
  objc_storeStrong((id *)&v16->_strokeGroupResult, a3);
  objc_storeStrong((id *)&v16->_textResult, a5);
  v22 = objc_msgSend_inputStrokeIdentifiers(v16->_strokeGroupResult, v17, v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v23, (uint64_t)v22, (uint64_t)v14, v24, v25);
  strokeIdentifiers = v16->_strokeIdentifiers;
  v16->_strokeIdentifiers = (NSArray *)v26;

  v33 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v28, v29, v30, v31, v32);
  v39 = objc_msgSend_inputStrokeIdentifiers(v16->_strokeGroupResult, v34, v35, v36, v37, v38);
  v43 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v40, (uint64_t)v39, (uint64_t)v14, v41, v42);

  uint64_t v49 = objc_msgSend_count(v43, v44, v45, v46, v47, v48);
  v55 = objc_msgSend_inputStrokeIdentifiers(v16->_strokeGroupResult, v50, v51, v52, v53, v54);
  LOBYTE(v49) = v49 == objc_msgSend_count(v55, v56, v57, v58, v59, v60);

  if ((v49 & 1) == 0)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v99 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      uint64_t v105 = objc_msgSend_count(v43, v100, v101, v102, v103, v104);
      v111 = objc_msgSend_inputStrokeIdentifiers(v16->_strokeGroupResult, v106, v107, v108, v109, v110);
      uint64_t v117 = objc_msgSend_count(v111, v112, v113, v114, v115, v116);
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v105;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v117;
      _os_log_impl(&dword_1C492D000, v99, OS_LOG_TYPE_ERROR, "AutoRefine result not created: Unable to access all strokes from the previous stroke group result from the last stroke provider: %ld strokes recovered out of %ld", buf, 0x16u);
    }
    goto LABEL_12;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v130 = 1;
  textResult = v16->_textResult;
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = sub_1C49EFF2C;
  v124[3] = &unk_1E64E1F30;
  id v62 = v43;
  id v125 = v62;
  id v63 = v33;
  id v126 = v63;
  v127 = buf;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(textResult, v64, (uint64_t)v124, v65, v66, v67);
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {

    _Block_object_dispose(buf, 8);
LABEL_12:
    v98 = 0;
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v16->_tokenOriginalBounds, v33);
  v73 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v68, v69, v70, v71, v72);
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = sub_1C49F0170;
  v122[3] = &unk_1E64E1F58;
  id v74 = v73;
  id v123 = v74;
  objc_msgSend_enumerateObjectsUsingBlock_(v62, v75, (uint64_t)v122, v76, v77, v78);
  uint64_t v84 = objc_msgSend_copy(v74, v79, v80, v81, v82, v83);
  syntheticStrokeIndexes = v16->_syntheticStrokeIndexes;
  v16->_syntheticStrokeIndexes = (NSIndexSet *)v84;

  objc_storeStrong((id *)&v16->_refinedTokenColumns, a6);
  v86 = [CHStrokeGroupingManager alloc];
  v92 = objc_msgSend_orderedLocales(v13, v87, v88, v89, v90, v91);
  isMathMode = objc_msgSend_initWithStrokeProvider_strokeGroupingModel_locales_isInlineContinuousMode_inlineContinuousModeTargets_isMathMode_(v86, v93, (uint64_t)v14, 0, (uint64_t)v92, 0, 0, 0);

  uint64_t v96 = objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(isMathMode, v95, (uint64_t)v121, 0, 0, 0, 0, 0.0, 0.0);
  drawing = v16->_drawing;
  v16->_drawing = (CHDrawing *)v96;

  _Block_object_dispose(buf, 8);
LABEL_5:
  v98 = v16;
LABEL_13:

  return v98;
}

- (CHStrokeGroup)strokeGroup
{
  return self->_strokeGroup;
}

- (CHTokenizedTextResult)textResult
{
  return self->_textResult;
}

- (NSArray)tokenOriginalBounds
{
  return self->_tokenOriginalBounds;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (CHStrokeGroupRecognitionResult)strokeGroupResult
{
  return self->_strokeGroupResult;
}

- (NSIndexSet)refinedTokenColumns
{
  return self->_refinedTokenColumns;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (NSIndexSet)syntheticStrokeIndexes
{
  return self->_syntheticStrokeIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntheticStrokeIndexes, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_refinedTokenColumns, 0);
  objc_storeStrong((id *)&self->_strokeGroupResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_tokenOriginalBounds, 0);
  objc_storeStrong((id *)&self->_textResult, 0);
  objc_storeStrong((id *)&self->_strokeGroup, 0);
}

@end