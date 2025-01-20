@interface CHContextualTextResults
- (BOOL)isMathForContextLookup;
- (CGRect)bounds;
- (CHContextualTextResults)initWithTextResults:(id)a3;
- (NSArray)textResults;
- (id)rawTranscription;
- (id)textResultToIndexMappingFromTopTranscriptionWithCharacterRange:(_NSRange)a3 intersectionRanges:(id *)a4;
- (id)topTranscription;
- (void)enumerateGroupsCoveredByStringRange:(_NSRange)a3 block:(id)a4;
- (void)setTextResults:(id)a3;
@end

@implementation CHContextualTextResults

- (CHContextualTextResults)initWithTextResults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHContextualTextResults;
  v6 = [(CHContextualTextResults *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textResults, a3);
  }

  return v7;
}

- (id)topTranscription
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4, v5);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v8 = self->_textResults;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v60, (uint64_t)v64, 16, v10);
  if (v11)
  {
    uint64_t v17 = v11;
    uint64_t v18 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        while (1)
        {
          if (*(void *)v61 != v18) {
            objc_enumerationMutation(v8);
          }
          v31 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v32 = objc_msgSend_textResult(v31, v12, v13, v14, v15, v16, (void)v60);
          v38 = objc_msgSend_topTranscription(v32, v33, v34, v35, v36, v37);

          objc_msgSend_appendString_(v7, v39, (uint64_t)v38, v40, v41, v42);
          v48 = objc_msgSend_terminatingSpecialCharacter(v31, v43, v44, v45, v46, v47);

          if (v48) {
            break;
          }
          v20 = objc_msgSend_textResult(v31, v49, v50, v51, v52, v53);
          v26 = objc_msgSend_precedingSeparatorForTopTranscriptionPath(v20, v21, v22, v23, v24, v25);
          objc_msgSend_appendString_(v7, v27, (uint64_t)v26, v28, v29, v30);

          if (v17 == ++i) {
            goto LABEL_3;
          }
        }
        v54 = objc_msgSend_terminatingSpecialCharacter(v31, v49, v50, v51, v52, v53);
        objc_msgSend_appendString_(v7, v55, (uint64_t)v54, v56, v57, v58);
      }
LABEL_3:
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v60, (uint64_t)v64, 16, v16);
    }
    while (v17);
  }

  return v7;
}

- (CGRect)bounds
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v6 = self->_textResults;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v36, 16, v8);
  if (v9)
  {
    uint64_t v15 = v9;
    uint64_t v16 = *(void *)v33;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v6);
        }
        uint64_t v18 = objc_msgSend_strokeGroup(*(void **)(*((void *)&v32 + 1) + 8 * v17), v10, v11, v12, v13, v14, (void)v32);
        objc_msgSend_bounds(v18, v19, v20, v21, v22, v23);
        v41.origin.CGFloat x = v24;
        v41.origin.CGFloat y = v25;
        v41.size.CGFloat width = v26;
        v41.size.CGFloat height = v27;
        v38.origin.CGFloat x = x;
        v38.origin.CGFloat y = y;
        v38.size.CGFloat width = width;
        v38.size.CGFloat height = height;
        CGRect v39 = CGRectUnion(v38, v41);
        CGFloat x = v39.origin.x;
        CGFloat y = v39.origin.y;
        CGFloat width = v39.size.width;
        CGFloat height = v39.size.height;

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v32, (uint64_t)v36, 16, v14);
    }
    while (v15);
  }

  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (id)rawTranscription
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4, v5);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v8 = self->_textResults;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v65, (uint64_t)v69, 16, v10);
  if (v11)
  {
    uint64_t v17 = v11;
    uint64_t v18 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v66 != v18) {
          objc_enumerationMutation(v8);
        }
        uint64_t v20 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_textResult(v20, v12, v13, v14, v15, v16, (void)v65);
        CGFloat v27 = objc_msgSend_precedingSeparatorForRawTranscriptionPath(v21, v22, v23, v24, v25, v26);
        objc_msgSend_appendString_(v7, v28, (uint64_t)v27, v29, v30, v31);

        uint64_t v37 = objc_msgSend_textResult(v20, v32, v33, v34, v35, v36);
        v43 = objc_msgSend_rawTranscription(v37, v38, v39, v40, v41, v42);

        objc_msgSend_appendString_(v7, v44, (uint64_t)v43, v45, v46, v47);
        uint64_t v53 = objc_msgSend_terminatingSpecialCharacter(v20, v48, v49, v50, v51, v52);

        if (v53)
        {
          v59 = objc_msgSend_terminatingSpecialCharacter(v20, v54, v55, v56, v57, v58);
          objc_msgSend_appendString_(v7, v60, (uint64_t)v59, v61, v62, v63);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v65, (uint64_t)v69, 16, v16);
    }
    while (v17);
  }

  return v7;
}

- (void)enumerateGroupsCoveredByStringRange:(_NSRange)a3 block:(id)a4
{
  NSUInteger range1 = a3.length;
  NSUInteger location = a3.location;
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  v136 = (void (**)(id, void *, void *, void *))a4;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  obj = self->_textResults;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v151, (uint64_t)v156, 16, v7);
  if (v8)
  {
    uint64_t v14 = v8;
    NSUInteger v15 = 0;
    uint64_t v16 = *(void *)v152;
    uint64_t v133 = *(void *)v152;
    NSUInteger v17 = location + range1;
    NSUInteger v134 = location;
    NSUInteger v132 = location + range1;
LABEL_3:
    uint64_t v18 = 0;
    uint64_t v135 = v14;
    while (1)
    {
      if (*(void *)v152 != v16) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v151 + 1) + 8 * v18);
      uint64_t v20 = objc_msgSend_textResult(v19, v9, v10, v11, v12, v13, v132);
      uint64_t v26 = objc_msgSend_rawTranscriptionPath(v20, v21, v22, v23, v24, v25);

      long long v32 = objc_msgSend_textResult(v19, v27, v28, v29, v30, v31);
      uint64_t v38 = objc_msgSend_length(v26, v33, v34, v35, v36, v37);
      uint64_t v40 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v32, v39, (uint64_t)v26, 0, v38, 0);

      v144 = v40;
      uint64_t v46 = objc_msgSend_length(v40, v41, v42, v43, v44, v45);
      uint64_t v52 = objc_msgSend_terminatingSpecialCharacter(v19, v47, v48, v49, v50, v51);
      NSUInteger v58 = objc_msgSend_length(v52, v53, v54, v55, v56, v57) + v46;

      v158.NSUInteger location = location;
      v158.length = range1;
      v159.NSUInteger location = v15;
      NSUInteger v143 = v58;
      v159.length = v58;
      NSRange v63 = NSIntersectionRange(v158, v159);
      if (v63.length)
      {
        v64 = objc_msgSend_textResult(v19, (const char *)v63.length, v59, v60, v61, v62);
        uint64_t v65 = (uint64_t)v26;
        long long v66 = v64;
        v142 = (void *)v65;
        v69 = objc_msgSend_tokensFromTranscriptionPath_characterRange_(v64, v67, v65, v63.location - v15, v63.length, v68);

        v75 = objc_msgSend_strokeGroupResult(v19, v70, v71, v72, v73, v74);

        if (v75)
        {
          v81 = v19;
          uint64_t v139 = v18;
          NSUInteger v140 = v15;
          v146 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v76, v77, v78, v79, v80);
          v87 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v82, v83, v84, v85, v86);
          long long v147 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          long long v150 = 0u;
          v138 = v69;
          id v145 = v69;
          uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v145, v88, (uint64_t)&v147, (uint64_t)v155, 16, v89);
          if (v90)
          {
            uint64_t v96 = v90;
            uint64_t v97 = *(void *)v148;
            do
            {
              for (uint64_t i = 0; i != v96; ++i)
              {
                if (*(void *)v148 != v97) {
                  objc_enumerationMutation(v145);
                }
                v99 = *(void **)(*((void *)&v147 + 1) + 8 * i);
                v100 = objc_msgSend_strokeGroupResult(v81, v91, v92, v93, v94, v95);
                v106 = objc_msgSend_inputStrokeIdentifiers(v100, v101, v102, v103, v104, v105);
                v112 = objc_msgSend_strokeIndexes(v99, v107, v108, v109, v110, v111);
                v117 = objc_msgSend_objectsAtIndexes_(v106, v113, (uint64_t)v112, v114, v115, v116);

                objc_msgSend_addObject_(v87, v118, (uint64_t)v117, v119, v120, v121);
                objc_msgSend_addObject_(v146, v122, (uint64_t)v99, v123, v124, v125);
              }
              uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v145, v91, (uint64_t)&v147, (uint64_t)v155, 16, v95);
            }
            while (v96);
          }

          v131 = objc_msgSend_strokeGroup(v81, v126, v127, v128, v129, v130);
          v136[2](v136, v131, v146, v87);

          uint64_t v16 = v133;
          NSUInteger location = v134;
          uint64_t v18 = v139;
          NSUInteger v15 = v140;
          uint64_t v14 = v135;
          NSUInteger v17 = v132;
          v69 = v138;
        }

        uint64_t v26 = v142;
      }
      v15 += v143;

      if (v15 >= v17) {
        break;
      }
      if (++v18 == v14)
      {
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v151, (uint64_t)v156, 16, v13);
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)textResultToIndexMappingFromTopTranscriptionWithCharacterRange:(_NSRange)a3 intersectionRanges:(id *)a4
{
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3.location, a3.length, (uint64_t)a4, v4);
  id v97 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v96 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v6, v7, v8, v9, v10);
  if (objc_msgSend_count(self->_textResults, v11, v12, v13, v14, v15))
  {
    NSUInteger v20 = 0;
    uint64_t v21 = 0;
    v98 = self;
    objc_msgSend_objectAtIndexedSubscript_(self->_textResults, v16, 0, v17, v18, v19);
    while (1)
      uint64_t v31 = {;
      uint64_t v37 = objc_msgSend_textResult(v31, v32, v33, v34, v35, v36);
      uint64_t v43 = objc_msgSend_topTranscription(v37, v38, v39, v40, v41, v42);
      NSUInteger v49 = objc_msgSend_length(v43, v44, v45, v46, v47, v48);

      v101.NSUInteger location = v20;
      v101.length = v49;
      NSRange v50 = NSIntersectionRange(a3, v101);
      uint64_t v55 = objc_msgSend_topTranscription(v37, (const char *)v50.length, v51, v52, v53, v54);
      uint64_t v61 = objc_msgSend_length(v55, v56, v57, v58, v59, v60);
      long long v67 = objc_msgSend_terminatingSpecialCharacter(v31, v62, v63, v64, v65, v66);
      uint64_t v73 = objc_msgSend_length(v67, v68, v69, v70, v71, v72);

      if (v50.length)
      {
        uint64_t v78 = objc_msgSend_numberWithInteger_(NSNumber, v74, v21, v75, v76, v77);
        objc_msgSend_setObject_forKey_(v97, v79, (uint64_t)v78, (uint64_t)v37, v80, v81);

        uint64_t v85 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v82, v50.location - v20, v50.length, v83, v84);
        uint64_t v90 = objc_msgSend_numberWithInteger_(NSNumber, v86, v21, v87, v88, v89);
        objc_msgSend_setObject_forKey_(v96, v91, (uint64_t)v85, (uint64_t)v90, v92, v93);
      }
      v20 += v61 + v73;

      if (++v21 >= (unint64_t)objc_msgSend_count(v98->_textResults, v22, v23, v24, v25, v26)) {
        break;
      }
      objc_msgSend_objectAtIndexedSubscript_(v98->_textResults, v27, v21, v28, v29, v30);
    }
  }
  if (a4) {
    *a4 = v96;
  }

  return v97;
}

- (BOOL)isMathForContextLookup
{
  if (objc_msgSend_count(self->_textResults, a2, v2, v3, v4, v5) != 1) {
    return 0;
  }
  uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(self->_textResults, v7, 0, v8, v9, v10);
  char isMathForContextLookup = objc_msgSend_isMathForContextLookup(v11, v12, v13, v14, v15, v16);

  return isMathForContextLookup;
}

- (NSArray)textResults
{
  return self->_textResults;
}

- (void)setTextResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end