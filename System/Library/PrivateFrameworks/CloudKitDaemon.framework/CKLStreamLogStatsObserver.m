@interface CKLStreamLogStatsObserver
- (CKLStreamLogStatsObserver)initWithLogTypes:(unint64_t)a3;
- (NSMutableDictionary)totalCountByLine;
- (NSMutableDictionary)totalSizeByLine;
- (void)eventMatched:(id)a3;
- (void)finish;
- (void)setTotalCountByLine:(id)a3;
- (void)setTotalSizeByLine:(id)a3;
@end

@implementation CKLStreamLogStatsObserver

- (CKLStreamLogStatsObserver)initWithLogTypes:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKLStreamLogStatsObserver;
  v3 = [(CKLStreamObserver *)&v9 initWithLogTypes:a3];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    totalSizeByLine = v3->_totalSizeByLine;
    v3->_totalSizeByLine = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    totalCountByLine = v3->_totalCountByLine;
    v3->_totalCountByLine = v6;
  }
  return v3;
}

- (void)eventMatched:(id)a3
{
  objc_msgSend_composedMessage(a3, a2, (uint64_t)a3);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_componentsSeparatedByString_(v43, v4, @" ");
  v7 = objc_msgSend_objectAtIndexedSubscript_(v5, v6, 0);
  objc_super v9 = objc_msgSend_objectAtIndexedSubscript_(v5, v8, 1);
  int v12 = objc_msgSend_intValue(v9, v10, v11);

  v13 = (void *)MEMORY[0x1E4F28ED0];
  v16 = objc_msgSend_totalSizeByLine(self, v14, v15);
  v18 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v7);
  int v21 = objc_msgSend_intValue(v18, v19, v20);
  v23 = objc_msgSend_numberWithInt_(v13, v22, (v21 + v12));
  v26 = objc_msgSend_totalSizeByLine(self, v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v26, v27, (uint64_t)v23, v7);

  v28 = (void *)MEMORY[0x1E4F28ED0];
  v31 = objc_msgSend_totalCountByLine(self, v29, v30);
  v33 = objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)v7);
  int v36 = objc_msgSend_intValue(v33, v34, v35);
  v38 = objc_msgSend_numberWithInt_(v28, v37, (v36 + 1));
  v41 = objc_msgSend_totalCountByLine(self, v39, v40);
  objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v38, v7);
}

- (void)finish
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v6 = objc_msgSend_totalSizeByLine(self, v4, v5);
  objc_super v9 = objc_msgSend_allKeys(v6, v7, v8);

  obunint64_t j = v9;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v94, v98, 16);
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v95;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v95 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v94 + 1) + 8 * v16);
        v18 = objc_msgSend_totalCountByLine(self, v12, v13);
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v18, v19, v17);
        uint64_t v23 = (int)objc_msgSend_intValue(v20, v21, v22);

        v26 = objc_msgSend_totalSizeByLine(self, v24, v25);
        v28 = objc_msgSend_objectForKeyedSubscript_(v26, v27, v17);
        uint64_t v31 = (int)objc_msgSend_intValue(v28, v29, v30);

        v32 = objc_opt_new();
        objc_msgSend_setFileAndLine_(v32, v33, v17);
        objc_msgSend_setCount_(v32, v34, v23);
        objc_msgSend_setSize_(v32, v35, v31);
        objc_msgSend_addObject_(v3, v36, (uint64_t)v32);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v94, v98, 16);
    }
    while (v14);
  }

  v37 = v3;
  objc_msgSend_sortUsingComparator_(v3, v38, (uint64_t)&unk_1F2042E10);
  id v39 = [NSString alloc];
  id v41 = objc_msgSend_initWithFormat_(v39, v40, @"Biggest logging call sites by size:\nTotal Size\tAvg Size\tCallsite\n");
  v44 = (const char *)objc_msgSend_UTF8String(v41, v42, v43);
  puts(v44);

  for (unint64_t i = 0; i != 30; ++i)
  {
    if (i >= objc_msgSend_count(v37, v45, v46)) {
      break;
    }
    v48 = objc_msgSend_objectAtIndexedSubscript_(v37, v45, i);
    id v49 = [NSString alloc];
    uint64_t v52 = objc_msgSend_size(v48, v50, v51);
    unint64_t v55 = objc_msgSend_size(v48, v53, v54);
    unint64_t v58 = v55 / objc_msgSend_count(v48, v56, v57);
    v61 = objc_msgSend_fileAndLine(v48, v59, v60);
    id v63 = objc_msgSend_initWithFormat_(v49, v62, @"%ld\t%ld\t%@", v52, v58, v61);
    v66 = (const char *)objc_msgSend_UTF8String(v63, v64, v65);
    puts(v66);
  }
  objc_msgSend_sortUsingComparator_(v37, v45, (uint64_t)&unk_1F2042E30);
  id v67 = [NSString alloc];
  id v69 = objc_msgSend_initWithFormat_(v67, v68, @"Most frequent logging call sites:\nTotal Count\tTotal Size\tCallsite\n");
  v72 = (const char *)objc_msgSend_UTF8String(v69, v70, v71);
  puts(v72);

  for (unint64_t j = 0; j != 30; ++j)
  {
    if (j >= objc_msgSend_count(v37, v73, v74)) {
      break;
    }
    v77 = objc_msgSend_objectAtIndexedSubscript_(v37, v76, j);
    id v78 = [NSString alloc];
    uint64_t v81 = objc_msgSend_count(v77, v79, v80);
    uint64_t v84 = objc_msgSend_size(v77, v82, v83);
    v87 = objc_msgSend_fileAndLine(v77, v85, v86);
    id v89 = objc_msgSend_initWithFormat_(v78, v88, @"%ld\t%ld\t%@", v81, v84, v87);
    v92 = (const char *)objc_msgSend_UTF8String(v89, v90, v91);
    puts(v92);
  }
}

- (NSMutableDictionary)totalSizeByLine
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTotalSizeByLine:(id)a3
{
}

- (NSMutableDictionary)totalCountByLine
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTotalCountByLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountByLine, 0);
  objc_storeStrong((id *)&self->_totalSizeByLine, 0);
}

@end