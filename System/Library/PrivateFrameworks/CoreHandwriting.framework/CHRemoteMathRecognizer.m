@interface CHRemoteMathRecognizer
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteMathRecognizer:(id)a3;
- (NSArray)locales;
- (NSSet)declaredVariables;
- (id)mathRecognitionResultForDrawing:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (void)setDeclaredVariables:(id)a3;
- (void)setLocales:(id)a3;
@end

@implementation CHRemoteMathRecognizer

- (id)mathRecognitionResultForDrawing:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (self)
  {
    v11 = [CHRemoteRecognitionMathRequest alloc];
    uint64_t v17 = objc_msgSend_priority(self, v12, v13, v14, v15, v16);
    v20 = objc_msgSend_initWithDrawing_options_priority_(v11, v18, (uint64_t)v8, (uint64_t)v10, v17, v19);
    v26 = objc_msgSend_locales(self, v21, v22, v23, v24, v25);
    objc_msgSend_setLocales_(v20, v27, (uint64_t)v26, v28, v29, v30);

    uint64_t v36 = objc_msgSend_maxRecognitionResultCount(self, v31, v32, v33, v34, v35);
    objc_msgSend_setMaxRecognitionResultCount_(v20, v37, v36, v38, v39, v40);
    objc_msgSend_minimumDrawingSize(self, v41, v42, v43, v44, v45);
    objc_msgSend_setMinimumDrawingSize_(v20, v46, v47, v48, v49, v50);
    uint64_t v56 = objc_msgSend_enableCachingIfAvailable(self, v51, v52, v53, v54, v55);
    objc_msgSend_setEnableCachingIfAvailable_(v20, v57, v56, v58, v59, v60);
    v66 = objc_msgSend_declaredVariables(self, v61, v62, v63, v64, v65);
    objc_msgSend_setDeclaredVariables_(v20, v67, (uint64_t)v66, v68, v69, v70);

    id v71 = v20;
    objc_msgSend_setupXPCConnectionIfNeeded(self, v72, v73, v74, v75, v76);
    v82 = objc_msgSend_connection(self, v77, v78, v79, v80, v81);

    if (!v82)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v87 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v109[0]) = 0;
        _os_log_impl(&dword_1C492D000, v87, OS_LOG_TYPE_FAULT, "XPC connection must be non-nil", (uint8_t *)v109, 2u);
      }
    }
    uint64_t v131 = 0;
    v132 = &v131;
    uint64_t v133 = 0x3032000000;
    v134 = sub_1C4B08FC0;
    v135 = sub_1C4B08FD0;
    id v136 = 0;
    uint64_t v125 = 0;
    v126 = &v125;
    uint64_t v127 = 0x3032000000;
    v128 = sub_1C4B08FC0;
    v129 = sub_1C4B08FD0;
    id v130 = 0;
    objc_msgSend_setHasBeenSubmitted_(v71, v83, 1, v84, v85, v86);
    uint64_t v119 = 0;
    v120 = &v119;
    uint64_t v121 = 0x3032000000;
    v122 = sub_1C4B08FC0;
    v123 = sub_1C4B08FD0;
    id v124 = 0;
    v93 = objc_msgSend_connection(self, v88, v89, v90, v91, v92);
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = sub_1C4B08FD8;
    v118[3] = &unk_1E64E10C8;
    v118[4] = &v119;
    v98 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v93, v94, (uint64_t)v118, v95, v96, v97);

    uint64_t v114 = 0;
    v115 = &v114;
    uint64_t v116 = 0x2020000000;
    char v117 = 0;
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = sub_1C4B090F8;
    v109[3] = &unk_1E64E1118;
    v111 = &v131;
    v112 = &v125;
    v109[4] = self;
    id v99 = v71;
    id v110 = v99;
    v113 = &v114;
    objc_msgSend_handleRecognitionRequest_withReply_(v98, v100, (uint64_t)v99, (uint64_t)v109, v101, v102);
    if (!*((unsigned char *)v115 + 24)) {
      objc_msgSend_logDrawingsAndResultsForRequest_result_error_(self, v103, (uint64_t)v99, 0, v120[5], v104);
    }
    v105 = (void *)v120[5];
    if (!v105) {
      v105 = (void *)v126[5];
    }
    id v106 = v105;
    self = (CHRemoteMathRecognizer *)(id)v132[5];

    _Block_object_dispose(&v114, 8);
    _Block_object_dispose(&v119, 8);

    _Block_object_dispose(&v125, 8);
    _Block_object_dispose(&v131, 8);

    id v107 = v106;
    if (a5) {
      goto LABEL_13;
    }
  }
  else
  {

    id v71 = 0;
    id v107 = 0;
    if (a5) {
LABEL_13:
    }
      *a5 = v107;
  }

  return self;
}

- (BOOL)isEqualToRemoteMathRecognizer:(id)a3
{
  v4 = (CHRemoteMathRecognizer *)a3;
  if (self == v4)
  {
    char isEqualToSet = 1;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)CHRemoteMathRecognizer;
    if ([(CHRemoteRecognizer *)&v35 isEqualToRemoteRecognizer:v4])
    {
      v10 = objc_msgSend_declaredVariables(self, v5, v6, v7, v8, v9);
      v21 = objc_msgSend_declaredVariables(v4, v11, v12, v13, v14, v15);
      if (v10 == v21)
      {
        char isEqualToSet = 1;
      }
      else
      {
        uint64_t v22 = objc_msgSend_declaredVariables(self, v16, v17, v18, v19, v20);
        uint64_t v28 = objc_msgSend_declaredVariables(v4, v23, v24, v25, v26, v27);
        char isEqualToSet = objc_msgSend_isEqualToSet_(v22, v29, (uint64_t)v28, v30, v31, v32);
      }
    }
    else
    {
      char isEqualToSet = 0;
    }
  }

  return isEqualToSet;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteMathRecognizer = objc_msgSend_isEqualToRemoteMathRecognizer_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteMathRecognizer;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = objc_msgSend_declaredVariables(self, a2, v2, v3, v4, v5);
  uint64_t v10 = 0;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, (uint64_t)v25, 16, v9);
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v7);
        }
        v10 ^= objc_msgSend_hash(*(void **)(*((void *)&v21 + 1) + 8 * v18++), v11, v12, v13, v14, v15);
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v21, (uint64_t)v25, 16, v15);
    }
    while (v16);
  }

  v20.receiver = self;
  v20.super_class = (Class)CHRemoteMathRecognizer;
  return [(CHRemoteRecognizer *)&v20 hash] ^ v10;
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (void)setDeclaredVariables:(id)a3
{
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
}

@end