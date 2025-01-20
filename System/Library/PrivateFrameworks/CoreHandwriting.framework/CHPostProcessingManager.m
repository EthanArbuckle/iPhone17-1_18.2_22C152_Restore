@interface CHPostProcessingManager
- (CHPostProcessingManager)init;
- (CHPostProcessingManager)initWithSequence:(id)a3;
- (CHPostProcessingManager)initWithStep:(id)a3;
- (NSArray)sequence;
- (id)process:(id)a3 options:(id)a4;
- (void)setSequence:(id)a3;
@end

@implementation CHPostProcessingManager

- (CHPostProcessingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHPostProcessingManager;
  v2 = [(CHPostProcessingManager *)&v6 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    sequence = v2->_sequence;
    v2->_sequence = v3;
  }
  return v2;
}

- (CHPostProcessingManager)initWithStep:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
  v10 = objc_msgSend_initWithObjects_(v5, v6, (uint64_t)v4, v7, v8, v9, 0);
  v15 = (CHPostProcessingManager *)objc_msgSend_initWithSequence_(self, v11, (uint64_t)v10, v12, v13, v14);

  return v15;
}

- (CHPostProcessingManager)initWithSequence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHPostProcessingManager;
  objc_super v6 = [(CHPostProcessingManager *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sequence, a3);
  }

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = a4;
  unint64_t v13 = 0;
  *(void *)&long long v14 = 138412802;
  long long v76 = v14;
  while (1)
  {
    v15 = objc_msgSend_sequence(self, v7, v8, v9, v10, v11, v76);
    BOOL v21 = v13 < objc_msgSend_count(v15, v16, v17, v18, v19, v20);

    if (!v21) {
      break;
    }
    v27 = objc_msgSend_sequence(self, v22, v23, v24, v25, v26);
    v32 = objc_msgSend_objectAtIndex_(v27, v28, v13, v29, v30, v31);

    if (objc_msgSend_modifiesOriginalTokens(v32, v33, v34, v35, v36, v37))
    {
      v43 = 0;
    }
    else
    {
      v44 = objc_msgSend_result(v6, v38, v39, v40, v41, v42);
      v43 = objc_msgSend_rawTranscription(v44, v45, v46, v47, v48, v49);
    }
    v50 = objc_msgSend_process_options_(v32, v38, (uint64_t)v6, (uint64_t)v12, v41, v42);

    if ((objc_msgSend_modifiesOriginalTokens(v32, v51, v52, v53, v54, v55) & 1) == 0)
    {
      v61 = objc_msgSend_result(v50, v56, v57, v58, v59, v60);
      v67 = objc_msgSend_rawTranscription(v61, v62, v63, v64, v65, v66);

      if ((objc_msgSend_isEqualToString_(v67, v68, (uint64_t)v43, v69, v70, v71) & 1) == 0)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v72 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
        {
          v73 = (objc_class *)objc_opt_class();
          v74 = NSStringFromClass(v73);
          *(_DWORD *)buf = v76;
          v78 = v74;
          __int16 v79 = 2112;
          v80 = v43;
          __int16 v81 = 2112;
          v82 = v67;
          _os_log_impl(&dword_1C492D000, v72, OS_LOG_TYPE_FAULT, "%@ unexpectedly modified original tokens: \"%@\" -> \"%@\"", buf, 0x20u);
        }
      }
    }
    ++v13;
    id v6 = v50;
  }

  return v6;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
}

- (void).cxx_destruct
{
}

@end