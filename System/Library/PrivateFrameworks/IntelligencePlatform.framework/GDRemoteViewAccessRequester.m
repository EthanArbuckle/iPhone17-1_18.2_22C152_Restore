@interface GDRemoteViewAccessRequester
+ (BOOL)currentProcessIsSandboxed;
+ (unint64_t)_machTimeToMilliseconds:(unint64_t)a3;
- (BOOL)reportSQLiteError:(id)a3 sqliteErrorCode:(int64_t)a4 error:(id *)a5;
- (BOOL)reportSQLiteError:(id)a3 sqliteErrorCode:(int64_t)a4 useCase:(id)a5 error:(id *)a6;
- (BOOL)reportUnknownError:(id)a3 error:(id *)a4;
- (BOOL)reportUnknownError:(id)a3 useCase:(id)a4 error:(id *)a5;
- (GDRemoteViewAccessRequester)init;
- (id)_requestAssertionForViewName:(id)a3 useCase:(id)a4 error:(id *)a5;
- (id)requestAssertionForViewName:(id)a3 error:(id *)a4;
- (id)requestAssertionForViewName:(id)a3 useCase:(id)a4 error:(id *)a5;
- (id)requestInfoForViewName:(id)a3 useCase:(id)a4 error:(id *)a5;
@end

@implementation GDRemoteViewAccessRequester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcService, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (BOOL)reportSQLiteError:(id)a3 sqliteErrorCode:(int64_t)a4 useCase:(id)a5 error:(id *)a6
{
  return MEMORY[0x1F4181798](self->_xpcService, sel_reportSQLiteErrorForViewName_sqliteErrorCode_useCase_error_, a3, a4, a5);
}

- (BOOL)reportSQLiteError:(id)a3 sqliteErrorCode:(int64_t)a4 error:(id *)a5
{
  return MEMORY[0x1F4181798](self, sel_reportSQLiteError_sqliteErrorCode_useCase_error_, a3, a4, *MEMORY[0x1E4F4FB00]);
}

- (BOOL)reportUnknownError:(id)a3 useCase:(id)a4 error:(id *)a5
{
  return MEMORY[0x1F4181798](self->_xpcService, sel_reportUnknownErrorForViewName_useCase_error_, a3, a4, a5);
}

- (BOOL)reportUnknownError:(id)a3 error:(id *)a4
{
  return MEMORY[0x1F4181798](self, sel_reportUnknownError_useCase_error_, a3, *MEMORY[0x1E4F4FB00], a4);
}

- (id)requestAssertionForViewName:(id)a3 useCase:(id)a4 error:(id *)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = GDSignpostLog();
  id v10 = a4;
  os_signpost_id_t v11 = os_signpost_id_generate(v9);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B2996000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "viewServing", "", buf, 2u);
  }

  uint64_t v12 = mach_absolute_time();
  id v84 = 0;
  v14 = objc_msgSend__requestAssertionForViewName_useCase_error_(self, v13, (uint64_t)v8, (uint64_t)v10, (uint64_t)&v84);

  id v15 = v84;
  v16 = objc_opt_class();
  uint64_t v17 = mach_absolute_time();
  uint64_t v21 = objc_msgSend__machTimeToMilliseconds_(v16, v18, v17 - v12, v19, v20);
  v22 = objc_opt_new();
  v26 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v23, v21, v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v22, v27, (uint64_t)v26, @"latencyMillis", v28);

  if (qword_1EB7F31E0[0] != -1) {
    dispatch_once(qword_1EB7F31E0, &unk_1F0AE1D90);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v22, v29, qword_1EB7F3270, @"processName", v30);
  objc_msgSend_setObject_forKeyedSubscript_(v22, v31, (uint64_t)v8, @"viewName", v32);
  if (v14)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v22, v33, MEMORY[0x1E4F1CC38], @"success", v34);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v22, v33, MEMORY[0x1E4F1CC28], @"success", v34);
    if (v15)
    {
      v39 = objc_msgSend_domain(v15, v35, v36, v37, v38);
      objc_msgSend_setObject_forKeyedSubscript_(v22, v40, (uint64_t)v39, @"errorDomain", v41);

      v42 = NSNumber;
      uint64_t v47 = objc_msgSend_code(v15, v43, v44, v45, v46);
      v51 = objc_msgSend_numberWithInteger_(v42, v48, v47, v49, v50);
      objc_msgSend_setObject_forKeyedSubscript_(v22, v52, (uint64_t)v51, @"errorCode", v53);
    }
  }
  AnalyticsSendEvent();
  if (objc_msgSend_isInternalDevice(GDOSVariant, v54, v55, v56, v57))
  {
    v83 = v14;
    if (v14)
    {
      unint64_t v62 = v11 - 1;
      v63 = @"success";
      if (v15)
      {
LABEL_13:
        id v64 = v8;
        os_signpost_id_t v65 = v11;
        v66 = a5;
        v67 = objc_msgSend_domain(v15, v58, v59, v60, v61);
        int isEqualToString = objc_msgSend_isEqualToString_(v67, v68, @"com.apple.intelligenceplatform.IntelligencePlatformCore.ViewXPC.AccessError", v69, v70);

        if (isEqualToString) {
          uint64_t v76 = objc_msgSend_code(v15, v72, v73, v74, v75);
        }
        else {
          uint64_t v76 = -1;
        }
        a5 = v66;
        os_signpost_id_t v11 = v65;
        id v8 = v64;
        goto LABEL_25;
      }
    }
    else
    {
      unint64_t v62 = v11 - 1;
      id v78 = [NSString alloc];
      v63 = (__CFString *)objc_msgSend_initWithFormat_(v78, v79, @"error: %@", v80, v81, v15);
      if (v15) {
        goto LABEL_13;
      }
    }
    uint64_t v76 = 0;
LABEL_25:
    if (v62 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138543874;
      id v86 = v8;
      __int16 v87 = 2114;
      v88 = v63;
      __int16 v89 = 2050;
      uint64_t v90 = v76;
      _os_signpost_emit_with_name_impl(&dword_1B2996000, v9, OS_SIGNPOST_INTERVAL_END, v11, "viewServing", "viewName=%{signpost.telemetry:string1,public}@ result=%{signpost.telemetry:string2,public}@ errorCode=%{signpost.telemetry:number1,public}ld enableTelemetry=YES ", buf, 0x20u);
    }

    v14 = v83;
    goto LABEL_29;
  }
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v77 = @"success";
    if (!v14) {
      v77 = @"error";
    }
    *(_DWORD *)buf = 138543618;
    id v86 = v8;
    __int16 v87 = 2114;
    v88 = v77;
    _os_signpost_emit_with_name_impl(&dword_1B2996000, v9, OS_SIGNPOST_INTERVAL_END, v11, "viewServing", "viewName=%{signpost.telemetry:string1,public}@ result=%{signpost.telemetry:string2,public}@ enableTelemetry=YES ", buf, 0x16u);
  }
  v63 = (__CFString *)v9;
LABEL_29:

  if (a5 && !v14) {
    *a5 = v15;
  }

  return v14;
}

- (id)requestAssertionForViewName:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_requestAssertionForViewName_useCase_error_, a3, *MEMORY[0x1E4F4FB00], a4);
}

- (id)requestInfoForViewName:(id)a3 useCase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_1B2E63E48;
  v35 = sub_1B2E63E58;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_1B2E63E48;
  v29 = sub_1B2E63E58;
  id v30 = 0;
  lock = self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E63E60;
  v19[3] = &unk_1E6013998;
  v23 = &v31;
  id v11 = v8;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  v22 = self;
  uint64_t v24 = &v25;
  objc_msgSend_runWithLockAcquired_(lock, v13, (uint64_t)v19, v14, v15);
  v16 = (void *)v32[5];
  if (a5 && !v16)
  {
    *a5 = (id) v26[5];
    v16 = (void *)v32[5];
  }
  id v17 = v16;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (id)_requestAssertionForViewName:(id)a3 useCase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_1B2E63E48;
  v35 = sub_1B2E63E58;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_1B2E63E48;
  v29 = sub_1B2E63E58;
  id v30 = 0;
  lock = self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E641E0;
  v19[3] = &unk_1E6013998;
  v23 = &v31;
  id v11 = v8;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  v22 = self;
  uint64_t v24 = &v25;
  objc_msgSend_runWithLockAcquired_(lock, v13, (uint64_t)v19, v14, v15);
  v16 = (void *)v32[5];
  if (a5 && !v16)
  {
    *a5 = (id) v26[5];
    v16 = (void *)v32[5];
  }
  id v17 = v16;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (GDRemoteViewAccessRequester)init
{
  v13.receiver = self;
  v13.super_class = (Class)GDRemoteViewAccessRequester;
  v2 = [(GDRemoteViewAccessRequester *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    v4 = objc_alloc_init(GDViewRemoteAccessRequesterGuardedData);
    uint64_t v8 = objc_msgSend_initWithGuardedData_(v3, v5, (uint64_t)v4, v6, v7);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v8;

    uint64_t v10 = objc_opt_new();
    xpcService = v2->_xpcService;
    v2->_xpcService = (GDXPCViewService *)v10;
  }
  return v2;
}

+ (unint64_t)_machTimeToMilliseconds:(unint64_t)a3
{
  if (qword_1EB7F3280[0] != -1) {
    dispatch_once(qword_1EB7F3280, &unk_1F0AE1D70);
  }
  return dword_1EB7F3278 * a3 / *(unsigned int *)algn_1EB7F327C / 0xF4240;
}

+ (BOOL)currentProcessIsSandboxed
{
  if (qword_1EB7F3310 != -1) {
    dispatch_once(&qword_1EB7F3310, &unk_1F0AE1D50);
  }
  return dword_1EB7F3318 != 0;
}

@end