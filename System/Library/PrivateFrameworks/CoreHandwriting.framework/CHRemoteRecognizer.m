@interface CHRemoteRecognizer
+ (int64_t)absoluteMaxStrokeCountPerRequest;
- (BOOL)enableCachingIfAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteRecognizer:(id)a3;
- (CGSize)minimumDrawingSize;
- (CHRemoteRecognizer)initWithEnableCachingIfAvailable:(BOOL)a3;
- (id)connection;
- (int64_t)priority;
- (unint64_t)hash;
- (unint64_t)maxRecognitionResultCount;
- (void)dealloc;
- (void)logDrawingsAndResultsForRequest:(id)a3 result:(id)a4 error:(id)a5;
- (void)setMaxRecognitionResultCount:(unint64_t)a3;
- (void)setMinimumDrawingSize:(CGSize)a3;
- (void)setPriority:(int64_t)a3;
- (void)setupXPCConnectionIfNeeded;
@end

@implementation CHRemoteRecognizer

- (CHRemoteRecognizer)initWithEnableCachingIfAvailable:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CHRemoteRecognizer;
  v4 = [(CHRemoteRecognizer *)&v14 init];
  if (v4)
  {
    v5 = objc_opt_class();
    objc_msgSend_defaultMinimumDrawingSize(v5, v6, v7, v8, v9, v10);
    v4->_minimumDrawingSize.width = v11;
    v4->_minimumDrawingSize.height = v12;
    v4->_priority = 0;
    v4->_enableCachingIfAvailable = a3;
  }
  return v4;
}

- (void)setupXPCConnectionIfNeeded
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->__connection)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = objc_msgSend_initWithMachServiceName_options_(v3, v4, @"com.apple.handwritingd.remoterecognition", 0, v5, v6);
    connection = v2->__connection;
    v2->__connection = (NSXPCConnection *)v7;

    v13 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v9, (uint64_t)&unk_1F2063C40, v10, v11, v12);
    objc_super v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v23 = objc_msgSend_setWithObjects_(v14, v19, v15, v20, v21, v22, v16, v17, v18, 0);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v13, v24, (uint64_t)v23, (uint64_t)sel_transcriptionPathsForTokenizedTextResult_recognitionRequest_withReply_, 0, 1);
    objc_msgSend_setRemoteObjectInterface_(v2->__connection, v25, (uint64_t)v13, v26, v27, v28);
    objc_initWeak(&location, v2);
    v29 = v2->__connection;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = sub_1C4B3A068;
    v43[3] = &unk_1E64E1E78;
    objc_copyWeak(&v44, &location);
    objc_msgSend_setInterruptionHandler_(v29, v30, (uint64_t)v43, v31, v32, v33);
    objc_msgSend_setInvalidationHandler_(v2->__connection, v34, (uint64_t)&unk_1F2012F10, v35, v36, v37);
    objc_msgSend_resume(v2->__connection, v38, v39, v40, v41, v42);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

- (id)connection
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->__connection;
  objc_sync_exit(v2);

  return v3;
}

- (void)dealloc
{
  sub_1C4B3A120(self);
  v3.receiver = self;
  v3.super_class = (Class)CHRemoteRecognizer;
  [(CHRemoteRecognizer *)&v3 dealloc];
}

- (void)logDrawingsAndResultsForRequest:(id)a3 result:(id)a4 error:(id)a5
{
  v136[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v15 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v10, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_dictionaryForKey_(v15, v16, @"com.apple.corehandwriting", v17, v18, v19);

    v25 = objc_msgSend_objectForKey_(v20, v21, @"CHLogAllDrawings", v22, v23, v24);
    char v31 = objc_msgSend_BOOLValue(v25, v26, v27, v28, v29, v30);

    if (v31)
    {
      uint64_t v37 = objc_msgSend_topTranscription(v8, v32, v33, v34, v35, v36);
      v43 = &stru_1F20141C8;
      v125 = (void *)v37;
      if (v37) {
        v43 = (__CFString *)v37;
      }
      v136[0] = v43;
      v135[0] = @"string";
      v135[1] = @"request_description";
      id v44 = objc_msgSend_debugDescription(v7, v38, v39, v40, v41, v42);
      v136[1] = v44;
      v126 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)v136, (uint64_t)v135, 2, v46);

      if (qword_1EA3C93D0 != -1) {
        dispatch_once(&qword_1EA3C93D0, &unk_1F2013AE8);
      }
      id v127 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      objc_msgSend_setDateFormat_(v127, v47, @"dd-MM-yyyy-HH-mm-ss-SSS", v48, v49, v50);
      v56 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v51, v52, v53, v54, v55);
      v62 = objc_msgSend_UUIDString(v56, v57, v58, v59, v60, v61);
      v128 = objc_msgSend_substringToIndex_(v62, v63, 4, v64, v65, v66);

      uint64_t v72 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v67, v68, v69, v70, v71);
      v77 = objc_msgSend_stringFromDate_(v127, v73, v72, v74, v75, v76);

      v83 = objc_msgSend_drawing(v7, v78, v79, v80, v81, v82);
      LOBYTE(v72) = v83 == 0;

      if (v72)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v88 = (id)qword_1EA3C9FB0;
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v130 = @"CHLogAllDrawings";
          __int16 v131 = 2112;
          uint64_t v132 = (uint64_t)v9;
          _os_log_impl(&dword_1C492D000, v88, OS_LOG_TYPE_ERROR, "%@ skipping serialization of nil drawing. Error = %@", buf, 0x16u);
        }
      }
      else
      {
        v88 = objc_msgSend_stringWithFormat_(NSString, v84, @"drawing_%@_%@.json", v85, v86, v87, v77, v128);
        v94 = objc_msgSend_drawing(v7, v89, v90, v91, v92, v93);
        objc_msgSend_writeToFileWithContext_folder_basename_(v94, v95, (uint64_t)v126, qword_1EA3C93C8, (uint64_t)v88, v96);

        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v97 = (id)qword_1EA3C9FB0;
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v130 = @"CHLogAllDrawings";
          __int16 v131 = 2112;
          uint64_t v132 = qword_1EA3C93C8;
          __int16 v133 = 2112;
          v134 = v88;
          _os_log_impl(&dword_1C492D000, v97, OS_LOG_TYPE_DEFAULT, "%@ serialize drawing to %@/%@, ", buf, 0x20u);
        }

        v102 = objc_msgSend_stringWithFormat_(NSString, v98, @"request_%@_%@.hrr", v99, v100, v101, v77, v128);
        id v106 = (id)objc_msgSend_writeToFileInFolder_basename_(v7, v103, qword_1EA3C93C8, (uint64_t)v102, v104, v105);
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v107 = (id)qword_1EA3C9FB0;
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v130 = @"CHLogAllDrawings";
          __int16 v131 = 2112;
          uint64_t v132 = qword_1EA3C93C8;
          __int16 v133 = 2112;
          v134 = v102;
          _os_log_impl(&dword_1C492D000, v107, OS_LOG_TYPE_DEFAULT, "%@ serialize request to %@/%@, ", buf, 0x20u);
        }

        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v108 = (id)qword_1EA3C9FB0;
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          v114 = objc_msgSend_debugDescription(v7, v109, v110, v111, v112, v113);
          *(_DWORD *)buf = 138412546;
          v130 = @"CHLogAllDrawings";
          __int16 v131 = 2112;
          uint64_t v132 = (uint64_t)v114;
          _os_log_impl(&dword_1C492D000, v108, OS_LOG_TYPE_DEFAULT, "%@ serialize request with description = %@", buf, 0x16u);
        }
      }

      if (v8)
      {
        v119 = objc_msgSend_stringWithFormat_(NSString, v115, @"result_%@_%@.dat", v116, v117, v118, v77, v128);
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v120 = (id)qword_1EA3C9FB0;
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v130 = @"CHLogAllDrawings";
          __int16 v131 = 2112;
          uint64_t v132 = qword_1EA3C93C8;
          __int16 v133 = 2112;
          v134 = v119;
          _os_log_impl(&dword_1C492D000, v120, OS_LOG_TYPE_DEFAULT, "%@ serialize recognition result to %@/%@, ", buf, 0x20u);
        }

        id v124 = (id)objc_msgSend_writeToFileInFolder_basename_(v8, v121, qword_1EA3C93C8, (uint64_t)v119, v122, v123);
      }
      else
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v119 = (id)qword_1EA3C9FB0;
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v130 = @"CHLogAllDrawings";
          __int16 v131 = 2112;
          uint64_t v132 = (uint64_t)v9;
          _os_log_impl(&dword_1C492D000, v119, OS_LOG_TYPE_ERROR, "%@ skipping serialization of nil result. Error = %@", buf, 0x16u);
        }
      }
    }
  }
}

- (BOOL)isEqualToRemoteRecognizer:(id)a3
{
  id v9 = (CHRemoteRecognizer *)a3;
  if (self == v9)
  {
    LOBYTE(v55) = 1;
  }
  else
  {
    objc_msgSend_minimumDrawingSize(self, v4, v5, v6, v7, v8);
    double v11 = v10;
    double v13 = v12;
    objc_msgSend_minimumDrawingSize(v9, v14, v15, v16, v17, v18);
    BOOL v26 = v11 == v25 && v13 == v24;
    if (v26
      && (uint64_t v27 = objc_msgSend_maxRecognitionResultCount(self, v19, v20, v21, v22, v23),
          v27 == objc_msgSend_maxRecognitionResultCount(v9, v28, v29, v30, v31, v32))
      && (uint64_t v38 = objc_msgSend_priority(self, v33, v34, v35, v36, v37),
          v38 == objc_msgSend_priority(v9, v39, v40, v41, v42, v43)))
    {
      int v49 = objc_msgSend_enableCachingIfAvailable(self, v44, v45, v46, v47, v48);
      int v55 = v49 ^ objc_msgSend_enableCachingIfAvailable(v9, v50, v51, v52, v53, v54) ^ 1;
    }
    else
    {
      LOBYTE(v55) = 0;
    }
  }

  return v55;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteRecognizer = objc_msgSend_isEqualToRemoteRecognizer_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognizer;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  unint64_t v7 = (unint64_t)(self->_minimumDrawingSize.height + (double)(unint64_t)self->_minimumDrawingSize.width);
  uint64_t v8 = objc_msgSend_maxRecognitionResultCount(self, a2, v2, v3, v4, v5);
  return objc_msgSend_priority(self, v9, v10, v11, v12, v13) ^ v8 ^ self->_enableCachingIfAvailable ^ v7;
}

+ (int64_t)absoluteMaxStrokeCountPerRequest
{
  uint64_t v2 = objc_opt_class();
  return objc_msgSend_drawingStrokeLimitForLocale_(v2, v3, 0, v4, v5, v6);
}

- (unint64_t)maxRecognitionResultCount
{
  return self->_maxRecognitionResultCount;
}

- (void)setMaxRecognitionResultCount:(unint64_t)a3
{
  self->_maxRecognitionResultCount = a3;
}

- (CGSize)minimumDrawingSize
{
  double width = self->_minimumDrawingSize.width;
  double height = self->_minimumDrawingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumDrawingSize:(CGSize)a3
{
  self->_minimumDrawingSize = a3;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
}

@end