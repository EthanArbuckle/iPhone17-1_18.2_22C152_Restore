@interface CHRemoteSketchRecognizer
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteSketchRecognizer:(id)a3;
- (CHRemoteSketchRecognizer)init;
- (CHRemoteSketchRecognizer)initWithPriority:(int64_t)a3;
- (NSCharacterSet)activeCharacterSet;
- (id)sketchRecognitionResultsForDrawing:(id)a3 options:(id)a4;
- (id)sketchRecognitionResultsForDrawing:(id)a3 options:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)setActiveCharacterSet:(id)a3;
@end

@implementation CHRemoteSketchRecognizer

- (CHRemoteSketchRecognizer)init
{
  return (CHRemoteSketchRecognizer *)objc_msgSend_initWithPriority_(self, a2, 0, v2, v3, v4);
}

- (CHRemoteSketchRecognizer)initWithPriority:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CHRemoteSketchRecognizer;
  uint64_t v4 = [(CHRemoteRecognizer *)&v10 initWithEnableCachingIfAvailable:0];
  objc_msgSend_setPriority_(v4, v5, a3, v6, v7, v8);
  return v4;
}

- (id)sketchRecognitionResultsForDrawing:(id)a3 options:(id)a4
{
  return (id)((uint64_t (*)(CHRemoteSketchRecognizer *, char *, id, id, void))MEMORY[0x1F4181798])(self, sel_sketchRecognitionResultsForDrawing_options_error_, a3, a4, 0);
}

- (id)sketchRecognitionResultsForDrawing:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6 = self;
  if (self)
  {
    id v8 = a4;
    id v9 = a3;
    objc_super v10 = [CHRemoteRecognitionSketchRequest alloc];
    uint64_t v16 = objc_msgSend_priority(v6, v11, v12, v13, v14, v15);
    v19 = objc_msgSend_initWithDrawing_options_priority_(v10, v17, (uint64_t)v9, (uint64_t)v8, v16, v18);

    uint64_t v25 = objc_msgSend_maxRecognitionResultCount(v6, v20, v21, v22, v23, v24);
    objc_msgSend_setMaxRecognitionResultCount_(v19, v26, v25, v27, v28, v29);
    objc_msgSend_minimumDrawingSize(v6, v30, v31, v32, v33, v34);
    objc_msgSend_setMinimumDrawingSize_(v19, v35, v36, v37, v38, v39);
    uint64_t v45 = objc_msgSend_enableCachingIfAvailable(v6, v40, v41, v42, v43, v44);
    objc_msgSend_setEnableCachingIfAvailable_(v19, v46, v45, v47, v48, v49);
    id v124 = v19;
    v50 = v6;
    objc_sync_enter(v50);
    if (!v50[7])
    {
      id v51 = objc_alloc(MEMORY[0x1E4F29268]);
      uint64_t v55 = objc_msgSend_initWithMachServiceName_options_(v51, v52, @"com.apple.handwritingd.remoterecognition", 0, v53, v54);
      v56 = v50[7];
      v50[7] = (void *)v55;

      v123 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v57, (uint64_t)&unk_1F2063C40, v58, v59, v60);
      v116 = a5;
      v122 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v121 = objc_opt_class();
      uint64_t v120 = objc_opt_class();
      uint64_t v119 = objc_opt_class();
      uint64_t v118 = objc_opt_class();
      uint64_t v117 = objc_opt_class();
      uint64_t v115 = objc_opt_class();
      uint64_t v114 = objc_opt_class();
      uint64_t v113 = objc_opt_class();
      uint64_t v61 = objc_opt_class();
      uint64_t v62 = objc_opt_class();
      uint64_t v63 = objc_opt_class();
      uint64_t v64 = objc_opt_class();
      uint64_t v65 = objc_opt_class();
      uint64_t v66 = objc_opt_class();
      uint64_t v67 = objc_opt_class();
      uint64_t v68 = objc_opt_class();
      uint64_t v69 = objc_opt_class();
      objc_msgSend_setWithObjects_(v122, v70, v121, v71, v72, v73, v120, v119, v118, v117, v115, v114, v113, v61, v62, v63, v64, v65, v66,
        v67,
        v68,
        v69,
      v74 = 0);
      objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v123, v75, (uint64_t)v74, (uint64_t)sel_handleSketchRecognitionRequest_withReply_, 0, 1);
      objc_msgSend_setRemoteObjectInterface_(v50[7], v76, (uint64_t)v123, v77, v78, v79);
      objc_initWeak(&location, v50);
      v80 = v50[7];
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v145 = 3221225472;
      uint64_t v146 = (uint64_t)sub_1C49E3928;
      v147 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E64E1CD0;
      objc_copyWeak((id *)&v148, &location);
      objc_msgSend_setInterruptionHandler_(v80, v81, (uint64_t)buf, v82, v83, v84);
      objc_msgSend_setInvalidationHandler_(v50[7], v85, (uint64_t)&unk_1F2012AB0, v86, v87, v88);
      a5 = v116;
      objc_msgSend_resume(v50[7], v89, v90, v91, v92, v93);
      objc_destroyWeak((id *)&v148);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v50);

    v94 = v50;
    objc_sync_enter(v94);
    v95 = v94[7];
    objc_sync_exit(v94);

    if (!v95)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v96 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v96, OS_LOG_TYPE_FAULT, "XPC connection must be non-nil", buf, 2u);
      }
    }
    *(void *)buf = 0;
    uint64_t v145 = (uint64_t)buf;
    uint64_t v146 = 0x3032000000;
    v147 = sub_1C49E3504;
    v148 = sub_1C49E3514;
    id v149 = 0;
    v97 = v94;
    objc_sync_enter(v97);
    id v98 = v97[7];
    objc_sync_exit(v97);

    v143[0] = MEMORY[0x1E4F143A8];
    v143[1] = 3221225472;
    v143[2] = sub_1C49E351C;
    v143[3] = &unk_1E64E1C80;
    v143[4] = buf;
    v103 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v98, v99, (uint64_t)v143, v100, v101, v102);

    id location = 0;
    p_id location = &location;
    uint64_t v139 = 0x3032000000;
    v140 = sub_1C49E3504;
    v141 = sub_1C49E3514;
    id v142 = 0;
    uint64_t v131 = 0;
    v132 = &v131;
    uint64_t v133 = 0x3032000000;
    v134 = sub_1C49E3504;
    v135 = sub_1C49E3514;
    id v136 = 0;
    uint64_t v127 = 0;
    v128 = &v127;
    uint64_t v129 = 0x2020000000;
    char v130 = 0;
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = sub_1C49E3624;
    v126[3] = &unk_1E64E1CA8;
    v126[4] = &location;
    v126[5] = &v131;
    v126[6] = &v127;
    v104 = v124;
    objc_msgSend_handleSketchRecognitionRequest_withReply_(v103, v105, (uint64_t)v124, (uint64_t)v126, v106, v107);
    if (*((unsigned char *)v128 + 24))
    {
      v108 = *(void **)(v145 + 40);
      if (v108) {
        goto LABEL_12;
      }
    }
    else
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v112 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v125 = 0;
        _os_log_impl(&dword_1C492D000, v112, OS_LOG_TYPE_ERROR, "Sketch request did not execute reply block", v125, 2u);
      }

      v108 = *(void **)(v145 + 40);
      if (v108)
      {
LABEL_12:
        id v109 = v108;
        uint64_t v6 = (CHRemoteSketchRecognizer *)p_location[5];
        _Block_object_dispose(&v127, 8);
        _Block_object_dispose(&v131, 8);

        _Block_object_dispose(&location, 8);
        _Block_object_dispose(buf, 8);

        id v110 = v109;
        if (!a5) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    v108 = (void *)v132[5];
    goto LABEL_12;
  }
  v104 = 0;

  id v110 = 0;
  if (a5) {
LABEL_13:
  }
    *a5 = v110;
LABEL_14:

  return v6;
}

- (BOOL)isEqualToRemoteSketchRecognizer:(id)a3
{
  id v9 = (CHRemoteSketchRecognizer *)a3;
  if (self == v9)
  {
    BOOL v57 = 1;
  }
  else
  {
    objc_msgSend_minimumDrawingSize(self, v4, v5, v6, v7, v8);
    double v11 = v10;
    double v13 = v12;
    objc_msgSend_minimumDrawingSize(v9, v14, v15, v16, v17, v18);
    if (v11 != v25 || v13 != v24) {
      goto LABEL_14;
    }
    uint64_t v27 = objc_msgSend_activeCharacterSet(self, v19, v20, v21, v22, v23);
    uint64_t v33 = objc_msgSend_activeCharacterSet(v9, v28, v29, v30, v31, v32);
    if (v27 == (void *)v33)
    {
    }
    else
    {
      uint64_t v39 = (void *)v33;
      v40 = objc_msgSend_activeCharacterSet(self, v34, v35, v36, v37, v38);
      v46 = objc_msgSend_activeCharacterSet(v9, v41, v42, v43, v44, v45);
      int isEqual = objc_msgSend_isEqual_(v40, v47, (uint64_t)v46, v48, v49, v50);

      if (!isEqual) {
        goto LABEL_14;
      }
    }
    uint64_t v58 = objc_msgSend_maxRecognitionResultCount(self, v52, v53, v54, v55, v56);
    if (v58 != objc_msgSend_maxRecognitionResultCount(v9, v59, v60, v61, v62, v63))
    {
LABEL_14:
      BOOL v57 = 0;
      goto LABEL_15;
    }
    uint64_t v69 = objc_msgSend_priority(self, v64, v65, v66, v67, v68);
    BOOL v57 = v69 == objc_msgSend_priority(v9, v70, v71, v72, v73, v74);
  }
LABEL_15:

  return v57;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteSketchRecognizer = objc_msgSend_isEqualToRemoteSketchRecognizer_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteSketchRecognizer;
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  if (self)
  {
    uint64_t v3 = self;
    objc_sync_enter(v3);
    objc_msgSend_invalidate(v3->__connection, v4, v5, v6, v7, v8);
    connection = v3->__connection;
    v3->__connection = 0;

    objc_sync_exit(v3);
  }
  v10.receiver = self;
  v10.super_class = (Class)CHRemoteSketchRecognizer;
  [(CHRemoteRecognizer *)&v10 dealloc];
}

- (NSCharacterSet)activeCharacterSet
{
  return self->_activeCharacterSet;
}

- (void)setActiveCharacterSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCharacterSet, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

@end