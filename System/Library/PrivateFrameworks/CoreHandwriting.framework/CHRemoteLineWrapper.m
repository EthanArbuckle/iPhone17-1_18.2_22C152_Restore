@interface CHRemoteLineWrapper
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteLineWrapper:(id)a3;
- (CHRemoteLineWrapper)initWithEnableCachingIfAvailable:(BOOL)a3;
- (id)lineWrappingResultForGroups:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation CHRemoteLineWrapper

- (CHRemoteLineWrapper)initWithEnableCachingIfAvailable:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHRemoteLineWrapper;
  result = [(CHRemoteLineWrapper *)&v5 init];
  if (result) {
    result->_enableCachingIfAvailable = a3;
  }
  return result;
}

- (void)dealloc
{
  if (self)
  {
    objc_msgSend_invalidate(self->_connection, a2, v2, v3, v4, v5);
    connection = self->_connection;
    self->_connection = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CHRemoteLineWrapper;
  [(CHRemoteLineWrapper *)&v8 dealloc];
}

- (id)lineWrappingResultForGroups:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [CHRemoteLineWrappingRequest alloc];
  id v14 = (id)objc_msgSend_initWithLineWrappableGroups_options_(v10, v11, (uint64_t)v8, (uint64_t)v9, v12, v13);
  v19 = v14;
  if (self)
  {
    connection = self->_connection;
    v21 = &off_1C4C39000;
    if (!connection)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F29268]);
      v26 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v22, v23, @"com.apple.handwritingd.remoterecognition", 0, v24, v25);
      v27 = self->_connection;
      self->_connection = v26;

      v32 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v28, (uint64_t)&unk_1F2063C40, v29, v30, v31);
      v33 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v34 = objc_opt_class();
      uint64_t v35 = objc_opt_class();
      uint64_t v36 = objc_opt_class();
      uint64_t v37 = objc_opt_class();
      v42 = objc_msgSend_setWithObjects_(v33, v38, v34, v39, v40, v41, v35, v36, v37, 0);
      objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v32, v43, (uint64_t)v42, (uint64_t)sel_transcriptionPathsForTokenizedTextResult_recognitionRequest_withReply_, 0, 1);
      objc_msgSend_setRemoteObjectInterface_(self->_connection, v44, (uint64_t)v32, v45, v46, v47);
      objc_initWeak(&location, self);
      v48 = self->_connection;
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v91 = 3221225472;
      uint64_t v92 = (uint64_t)sub_1C49EC288;
      v93 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E64E1E78;
      objc_copyWeak((id *)&v94, &location);
      objc_msgSend_setInterruptionHandler_(v48, v49, (uint64_t)buf, v50, v51, v52);
      objc_msgSend_setInvalidationHandler_(self->_connection, v53, (uint64_t)&unk_1F2012AF0, v54, v55, v56);
      objc_msgSend_resume(self->_connection, v57, v58, v59, v60, v61);
      objc_destroyWeak((id *)&v94);
      objc_destroyWeak(&location);

      connection = self->_connection;
      v21 = &off_1C4C39000;
      if (!connection)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v62 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C492D000, v62, OS_LOG_TYPE_FAULT, "XPC connection must be non-nil", buf, 2u);
        }

        connection = self->_connection;
      }
    }
    *(void *)buf = 0;
    uint64_t v91 = (uint64_t)buf;
    uint64_t v92 = 0x3032000000;
    v93 = sub_1C49EC9DC;
    v94 = sub_1C49EC9EC;
    id v95 = 0;
    id location = 0;
    p_id location = &location;
    uint64_t v86 = 0x3032000000;
    v87 = sub_1C49EC9DC;
    v88 = sub_1C49EC9EC;
    id v89 = 0;
    uint64_t v78 = 0;
    v79 = (id *)&v78;
    uint64_t v80 = 0x3032000000;
    v81 = sub_1C49EC9DC;
    v82 = sub_1C49EC9EC;
    id v83 = 0;
    uint64_t v73 = MEMORY[0x1E4F143A8];
    uint64_t v74 = *((void *)v21 + 348);
    uint64_t v63 = v74;
    v75 = sub_1C49EC9F4;
    v76 = &unk_1E64E10C8;
    v77 = &v78;
    v64 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(connection, v15, (uint64_t)&v73, v16, v17, v18);
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = v63;
    v72[2] = sub_1C49ECB14;
    v72[3] = &unk_1E64E1EA0;
    v72[4] = buf;
    v72[5] = &location;
    objc_msgSend_handleLineWrappingRequest_withReply_(v64, v65, (uint64_t)v19, (uint64_t)v72, v66, v67);
    v68 = v79;
    if (!v79[5]) {
      v68 = p_location;
    }
    id v69 = v68[5];
    self = (CHRemoteLineWrapper *)*(id *)(v91 + 40);

    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(&location, 8);

    _Block_object_dispose(buf, 8);
    id v70 = v69;
    if (a5) {
      goto LABEL_12;
    }
  }
  else
  {

    id v70 = 0;
    if (a5) {
LABEL_12:
    }
      *a5 = v70;
  }

  return self;
}

- (BOOL)isEqualToRemoteLineWrapper:(id)a3
{
  return self == a3 || self->_enableCachingIfAvailable == *((unsigned __int8 *)a3 + 16);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteLineWrapper = objc_msgSend_isEqualToRemoteLineWrapper_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteLineWrapper;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  return 13 * self->_enableCachingIfAvailable + 7;
}

- (void).cxx_destruct
{
}

@end