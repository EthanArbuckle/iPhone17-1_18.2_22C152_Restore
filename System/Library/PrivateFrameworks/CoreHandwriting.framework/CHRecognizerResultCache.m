@interface CHRecognizerResultCache
- (CHRecognizerResultCache)init;
- (id)retrievePartialResultsForDrawing:(id)a3 recognitionEngineCachingKey:(id)a4 matchingColumnRange:(_NSRange *)a5;
- (void)cacheTextResult:(id)a3 drawing:(id)a4 recognitionEngineCachingKey:(id)a5;
- (void)clearCacheForKey:(id)a3;
@end

@implementation CHRecognizerResultCache

- (CHRecognizerResultCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)CHRecognizerResultCache;
  v2 = [(CHRecognizerResultCache *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastDrawings = v2->_lastDrawings;
    v2->_lastDrawings = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    textResults = v2->_textResults;
    v2->_textResults = v5;
  }
  return v2;
}

- (void)cacheTextResult:(id)a3 drawing:(id)a4 recognitionEngineCachingKey:(id)a5
{
  id v37 = a3;
  id v8 = a4;
  id v9 = a5;
  v14 = objc_msgSend_objectForKeyedSubscript_(self->_lastDrawings, v10, (uint64_t)v9, v11, v12, v13);
  if ((objc_msgSend_isEqualToDrawing_(v14, v15, (uint64_t)v8, v16, v17, v18) & 1) == 0)
  {
    v24 = objc_msgSend_copy(v37, v19, v20, v21, v22, v23);
    objc_msgSend_setObject_forKeyedSubscript_(self->_textResults, v25, (uint64_t)v24, (uint64_t)v9, v26, v27);

    v33 = objc_msgSend_copy(v8, v28, v29, v30, v31, v32);
    objc_msgSend_setObject_forKeyedSubscript_(self->_lastDrawings, v34, (uint64_t)v33, (uint64_t)v9, v35, v36);
  }
}

- (id)retrievePartialResultsForDrawing:(id)a3 recognitionEngineCachingKey:(id)a4 matchingColumnRange:(_NSRange *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14 = objc_msgSend_objectForKeyedSubscript_(self->_lastDrawings, v10, (uint64_t)v9, v11, v12, v13);
  uint64_t v19 = objc_msgSend_matchingStrokePrefixRangeForDrawing_(v14, v15, (uint64_t)v8, v16, v17, v18);
  unint64_t v25 = (unint64_t)v20;
  if (!v20)
  {
    objc_msgSend_clearCacheForKey_(self, 0, (uint64_t)v9, v22, v23, v24);
    NSUInteger v80 = 0;
    v38 = 0;
    NSUInteger v81 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a5) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v26 = v19;
  if (v20 == (const char *)objc_msgSend_strokeCount(v14, v20, v21, v22, v23, v24)
    && v25 < objc_msgSend_strokeCount(v8, v27, v28, v29, v30, v31))
  {
    uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(self->_textResults, v27, (uint64_t)v9, v29, v30, v31);
    v38 = v32;
    if (v32)
    {
LABEL_20:
      NSUInteger v80 = objc_msgSend_tokenColumnCount(v32, v33, v34, v35, v36, v37);
      NSUInteger v81 = 0;
      if (!a5) {
        goto LABEL_15;
      }
LABEL_14:
      a5->location = v81;
      a5->length = v80;
      goto LABEL_15;
    }
  }
  else if (v25 < objc_msgSend_strokeCount(v14, v27, v28, v29, v30, v31) {
         && v25 == objc_msgSend_strokeCount(v8, v39, v40, v41, v42, v43))
  }
  {
    v38 = objc_msgSend_objectForKeyedSubscript_(self->_textResults, v39, (uint64_t)v9, v41, v42, v43);
    if (v38)
    {
      uint64_t v54 = objc_msgSend_strokeCount(v14, v44, v45, v46, v47, v48) - v25;
      if (v54 < 1)
      {
        uint64_t v79 = 0;
      }
      else
      {
        uint64_t v55 = 0;
        do
        {
          v56 = objc_msgSend_tokenColumns(v38, v49, v50, v51, v52, v53);
          uint64_t v62 = objc_msgSend_tokenColumnCount(v38, v57, v58, v59, v60, v61);
          v67 = objc_msgSend_objectAtIndexedSubscript_(v56, v63, v55 + v62 - 1, v64, v65, v66);
          v73 = objc_msgSend_strokeIndexes(v67, v68, v69, v70, v71, v72);
          v54 -= objc_msgSend_count(v73, v74, v75, v76, v77, v78);

          --v55;
        }
        while (v54 > 0);
        uint64_t v79 = -v55;
      }
      uint64_t v120 = objc_msgSend_tokenColumnCount(v38, v49, v50, v51, v52, v53);
      NSUInteger v81 = 0;
      NSUInteger v80 = v120 - v79;
      if (!a5) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v87 = objc_msgSend_strokeCount(v8, v39, v40, v41, v42, v43);
    textResults = self->_textResults;
    if (v25 == v87)
    {
      uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(textResults, v83, (uint64_t)v9, v84, v85, v86);
      v38 = v32;
      if (v32) {
        goto LABEL_20;
      }
    }
    else
    {
      v38 = objc_msgSend_objectForKeyedSubscript_(textResults, v83, (uint64_t)v9, v84, v85, v86);
      if (v38)
      {
        id v121 = v9;
        id v122 = v8;
        unint64_t v94 = 0;
        uint64_t v95 = 0;
        unint64_t v96 = v26 + v25;
        uint64_t v97 = 0x7FFFFFFFFFFFFFFFLL;
        while (v95 < objc_msgSend_tokenColumnCount(v38, v89, v90, v91, v92, v93, v121, v122))
        {
          v103 = objc_msgSend_tokenColumns(v38, v98, v99, v100, v101, v102);
          v108 = objc_msgSend_objectAtIndexedSubscript_(v103, v104, v95, v105, v106, v107);
          v114 = objc_msgSend_strokeIndexes(v108, v109, v110, v111, v112, v113);
          v94 += objc_msgSend_count(v114, v115, v116, v117, v118, v119);

          if (v94 <= v96) {
            uint64_t v97 = v95;
          }
          ++v95;
        }
        NSUInteger v81 = 0x7FFFFFFFFFFFFFFFLL;
        if (v97 == 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v80 = 0;
        }
        else
        {
          NSUInteger v81 = 0;
          NSUInteger v80 = v97 + 1;
        }
        id v9 = v121;
        id v8 = v122;
        if (a5) {
          goto LABEL_14;
        }
        goto LABEL_15;
      }
    }
  }
  NSUInteger v80 = 0;
  NSUInteger v81 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5) {
    goto LABEL_14;
  }
LABEL_15:

  return v38;
}

- (void)clearCacheForKey:(id)a3
{
  id v12 = a3;
  objc_msgSend_removeObjectForKey_(self->_lastDrawings, v4, (uint64_t)v12, v5, v6, v7);
  objc_msgSend_removeObjectForKey_(self->_textResults, v8, (uint64_t)v12, v9, v10, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textResults, 0);
  objc_storeStrong((id *)&self->_lastDrawings, 0);
}

@end