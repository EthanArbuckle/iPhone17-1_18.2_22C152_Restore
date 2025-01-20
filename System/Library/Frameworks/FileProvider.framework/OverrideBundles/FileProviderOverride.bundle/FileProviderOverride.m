void sub_24335AF8C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(void);
  uint64_t v25;
  void *v26;
  void v27[4];
  id v28;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14 = v9;
  if (v9)
  {
    v15 = objc_msgSend_domain(v9, v10, v11, v12, v13);
    if (objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x263F053B8], v17, v18))
    {
      v23 = objc_msgSend_code(v14, v19, v20, v21, v22);

      if (!v23)
      {
        v24 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_8:
        v24();
        goto LABEL_9;
      }
    }
    else
    {
    }
    v24 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  v25 = *(void *)(a1 + 32);
  v26 = objc_msgSend_remoteObjectProxyCreating(v7, v10, v11, v12, v13);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_24335B100;
  v27[3] = &unk_26517E7D8;
  v28 = v7;
  (*(void (**)(uint64_t, void *, id, void *, void))(v25 + 16))(v25, v26, v8, v27, 0);

LABEL_9:
}

uint64_t sub_24335B100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_invalidate, a3, a4, a5);
}

void sub_24335B21C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14 = v9;
  if (v9)
  {
    v15 = objc_msgSend_domain(v9, v10, v11, v12, v13);
    if (objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x263F053B8], v17, v18))
    {
      uint64_t v23 = objc_msgSend_code(v14, v19, v20, v21, v22);

      if (!v23)
      {
        v24 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_8:
        v24();
        goto LABEL_9;
      }
    }
    else
    {
    }
    v24 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  uint64_t v25 = *(void *)(a1 + 32);
  v26 = objc_msgSend_remoteObjectProxyCreating(v7, v10, v11, v12, v13);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_24335B384;
  v27[3] = &unk_26517E7D8;
  id v28 = v7;
  (*(void (**)(uint64_t, void *, void *, void))(v25 + 16))(v25, v26, v27, 0);

LABEL_9:
}

uint64_t sub_24335B384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_invalidate, a3, a4, a5);
}

void sub_24335B75C(uint64_t a1, void *a2)
{
  v32[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F07F70];
  v32[0] = *MEMORY[0x263F05370];
  v32[1] = v3;
  v32[2] = *MEMORY[0x263F08438];
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  id v8 = objc_msgSend_arrayWithObjects_count_(v4, v6, (uint64_t)v32, 3, v7);
  uint64_t v12 = objc_msgSend_fp_unwrappedErrorForDomains_(v5, v9, (uint64_t)v8, v10, v11);

  if (objc_msgSend_fp_isPOSIXErrorCode_(v12, v13, 16, v14, v15))
  {
    uint64_t v20 = objc_msgSend_userInfo(v5, v16, v17, v18, v19);

    objc_msgSend_objectForKey_(v20, v21, *MEMORY[0x263F07F80], v22, v23);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08608];
    v31 = v12;
    v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)&v31, (uint64_t)&v30, 1);
    v29 = objc_msgSend_errorWithDomain_code_userInfo_(v25, v28, v3, 255, (uint64_t)v27);
    (*(void (**)(uint64_t, uint64_t, void *))(v24 + 16))(v24, 1, v29);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id fp_backtrace()
{
  MEMORY[0x270FA5388]();
  uint64_t v6 = *MEMORY[0x263EF8340];
  bzero(v5, 0x2000uLL);
  sub_24335C7B0(v5);
  uint64_t v3 = objc_msgSend_stringWithUTF8String_(NSString, v0, (uint64_t)v5, v1, v2);

  return v3;
}

void fp_backtrace_exception_snprint(char *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_callStackSymbols(a3, a2, (uint64_t)a3, a4, a5);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v17, v7, v8, v9, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  v16 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
  snprintf(a1, (size_t)a2, "%s", v16);
}

void FPCaptureLogsForOperation(void *a1, void *a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = NSString;
  uint64_t v13 = objc_msgSend_domain(v7, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_code(v7, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_stringWithFormat_(v8, v19, @"%@.%ld", v20, v21, v13, v18);

  v27 = objc_msgSend_underlyingErrors(v7, v23, v24, v25, v26);

  if (v27)
  {
    id v58 = v5;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v32 = objc_msgSend_underlyingErrors(v7, v28, v29, v30, v31);
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v59, (uint64_t)v69, 16);
    if (v34)
    {
      uint64_t v39 = v34;
      uint64_t v40 = *(void *)v60;
      do
      {
        uint64_t v41 = 0;
        v42 = v22;
        do
        {
          if (*(void *)v60 != v40) {
            objc_enumerationMutation(v32);
          }
          v43 = *(void **)(*((void *)&v59 + 1) + 8 * v41);
          v44 = objc_msgSend_domain(v43, v35, v36, v37, v38);
          uint64_t v49 = objc_msgSend_code(v43, v45, v46, v47, v48);
          uint64_t v22 = objc_msgSend_stringByAppendingFormat_(v42, v50, @"%@.%ld", v51, v52, v44, v49);;

          ++v41;
          v42 = v22;
        }
        while (v39 != v41);
        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v59, (uint64_t)v69, 16);
      }
      while (v39);
    }

    id v5 = v58;
  }
  v53 = fp_current_or_default_log();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v64 = v5;
    __int16 v65 = 2112;
    id v66 = v6;
    __int16 v67 = 2112;
    v68 = v22;
    _os_log_debug_impl(&dword_243359000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] Sending ABC report with signature: type = %@, subtype = %@, subtype context = %@", buf, 0x20u);
  }

  v54 = sub_24335BD8C();
  v56 = objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(v54, v55, @"FileProvider", (uint64_t)v5, (uint64_t)v6, v22, @"fileproviderd", 0);
  objc_msgSend_snapshotWithSignature_duration_events_payload_actions_reply_(v54, v57, (uint64_t)v56, 0, 0, 0, &unk_26F8A46A8, 15.0);
}

id fp_current_or_default_log()
{
  v0 = fpfs_current_log();
  if (!v0)
  {
    v0 = fp_default_log();
  }

  return v0;
}

id sub_24335BD8C()
{
  if (qword_268D96568 != -1) {
    dispatch_once(&qword_268D96568, &unk_26F8A4748);
  }
  v0 = (void *)qword_268D96560;

  return v0;
}

void sub_24335BDE0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_msgSend_objectForKeyedSubscript_(a2, (const char *)a2, *MEMORY[0x263F7C160], a4, a5);
  int v10 = objc_msgSend_BOOLValue(v5, v6, v7, v8, v9);

  uint64_t v11 = fp_current_or_default_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      sub_24335CA68(v11);
    }
  }
  else if (v12)
  {
    sub_24335CAAC(v11);
  }
}

void sub_24335BE60()
{
  v0 = (void *)MEMORY[0x270FA5388]();
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v1 = v0;
  int v10 = v1;
  if ((unint64_t)objc_msgSend_length(v1, v2, v3, v4, v5) >= 0x65)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = objc_msgSend_hash(v1, v6, v7, v8, v9);
    uint64_t v16 = objc_msgSend_stringWithFormat_(v11, v13, @":0x%lx", v14, v15, v12);
    uint64_t v21 = objc_msgSend_length(v16, v17, v18, v19, v20);
    uint64_t v25 = objc_msgSend_substringToIndex_(v1, v22, 100 - v21, v23, v24);
    int v10 = objc_msgSend_stringByAppendingString_(v25, v26, (uint64_t)v16, v27, v28);
  }
  uint64_t v29 = sub_24335BD8C();
  uint64_t v31 = objc_msgSend_signatureWithDomain_type_subType_detectedProcess_triggerThresholdValues_(v29, v30, @"Application", @"Functional", @"AssertionFailed", @"fileproviderd", 0);

  objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v10, *MEMORY[0x263F7C190], v33);
  bzero(v53, 0x2000uLL);
  sub_24335C7B0(v53);
  uint64_t v37 = objc_msgSend_stringWithUTF8String_(NSString, v34, (uint64_t)v53, v35, v36);
  uint64_t v38 = sub_24335BD8C();
  uint64_t v51 = @"backtrace";
  uint64_t v52 = v37;
  uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v39, (uint64_t)&v52, (uint64_t)&v51, 1);
  char v42 = objc_msgSend_snapshotWithSignature_duration_event_payload_reply_(v38, v41, (uint64_t)v31, (uint64_t)v40, 0, &unk_26F8A46C8, 15.0);

  v43 = fp_current_or_default_log();
  v44 = v43;
  if (v42)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      sub_24335CAF0((uint64_t)v1, v44, v45, v46, v47, v48, v49, v50);
    }
  }
  else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    sub_24335CB5C((uint64_t)v1, v44);
  }
}

void sub_24335C0A4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_24335CBD4((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void fp_simulate_crash(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = [v9 alloc];
  uint64_t v14 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v10, (uint64_t)&a9, v13);
  getpid();
  SimulateCrash();
  sub_24335BE60();
}

id fp_default_log()
{
  if (qword_268D96520 != -1) {
    dispatch_once(&qword_268D96520, &unk_26F8A46E8);
  }
  v0 = (void *)qword_268D96528;

  return v0;
}

uint64_t sub_24335C1C0()
{
  qword_268D96528 = (uint64_t)os_log_create("com.apple.FileProvider", "default");

  return MEMORY[0x270F9A758]();
}

void *fpfs_current_log()
{
  if (qword_268D96570 != -1) {
    dispatch_once(&qword_268D96570, &unk_26F8A4768);
  }
  pthread_key_t v0 = qword_268D96548;

  return pthread_getspecific(v0);
}

uint64_t __fp_create_section()
{
  if (qword_268D96540 != -1) {
    dispatch_once(&qword_268D96540, &unk_26F8A4708);
  }
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v6 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_24335C390;
  block[3] = &unk_26517E890;
  block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_268D96538, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24335C32C()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("create-log-section", v2);
  id v1 = (void *)qword_268D96538;
  qword_268D96538 = (uint64_t)v0;
}

uint64_t sub_24335C390(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = qword_268D96530 + 1;
  qword_268D96530 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __fp_log_fork(__int16 a1)
{
  uint64_t section = __fp_create_section();
  uint64_t v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_24335CC40(a1, section, v3);
  }

  return section;
}

void __fp_log_adopt(void *a1, uint64_t a2)
{
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_24335CCB8(a1, a2, v4);
  }
}

void __fp_leave_section_Debug(uint64_t a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_24335CD34(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void __fp_leave_section_Notice(uint64_t *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *a1;
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_243359000, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┗%llx ", (uint8_t *)&v4, 0xCu);
  }
}

void __fp_leave_section_Error(uint64_t *a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_24335CDA4(a1, v2);
  }
}

void **__fp_pop_log(void **result)
{
  if (result) {
    return (void **)fpfs_adopt_log(*result);
  }
  return result;
}

id fpfs_adopt_log(void *a1)
{
  id v1 = a1;
  if (qword_268D96570 != -1) {
    dispatch_once(&qword_268D96570, &unk_26F8A4768);
  }
  id v2 = fpfs_current_log();
  pthread_key_t v3 = qword_268D96548;
  id v4 = v1;
  pthread_setspecific(v3, v4);

  return v2;
}

os_log_t fpfs_create_log_for_provider(char *category)
{
  os_log_t v1 = os_log_create("com.apple.FileProvider", category);

  return v1;
}

id fpfs_current_or_default_log()
{
  fpfs_current_log();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    if (qword_268D96578 != -1) {
      dispatch_once(&qword_268D96578, &unk_26F8A4788);
    }
    id v0 = (id)qword_268D96580;
  }

  return v0;
}

id fssync_default_log()
{
  if (qword_268D96550 != -1) {
    dispatch_once(&qword_268D96550, &unk_26F8A4728);
  }
  id v0 = (void *)qword_268D96558;

  return v0;
}

uint64_t sub_24335C76C()
{
  qword_268D96558 = (uint64_t)os_log_create("com.apple.FileProvider", "fssync");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_24335C7B0(char *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)id v11 = 0u;
  long long v12 = 0u;
  uint64_t result = backtrace(v11, 24);
  if (result)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result;
    int64_t v5 = 0x2000;
    do
    {
      memset(&v10, 0, sizeof(v10));
      if (v3)
      {
        if (dladdr(v11[v3], &v10))
        {
          dli_sname = v10.dli_sname;
          uint64_t v7 = rindex(v10.dli_fname, 47);
          dli_fname = v10.dli_fname;
          if (v7) {
            dli_fname = v7 + 1;
          }
        }
        else
        {
          dli_sname = (const char *)&unk_24335D40F;
          dli_fname = (const char *)&unk_24335D40F;
        }
        uint64_t result = snprintf(a1, v5, "frame %d: %lld %s in %s\n", v3, v11[v3], dli_sname, dli_fname);
        BOOL v9 = v5 <= (int)result;
        v5 -= (int)result;
        if (v9) {
          return result;
        }
        a1 += (int)result;
      }
      ++v3;
    }
    while (v4 != v3);
  }
  return result;
}

uint64_t sub_24335C8E8()
{
  qword_268D96560 = (uint64_t)objc_alloc_init(MEMORY[0x263F7C080]);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_24335C924()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&qword_268D96548, (void (__cdecl *)(void *))j__CFRelease);
  if (result) {
    abort();
  }
  return result;
}

uint64_t sub_24335C960()
{
  qword_268D96580 = (uint64_t)os_log_create("com.apple.FileProvider", "fpfs");

  return MEMORY[0x270F9A758]();
}

void sub_24335C9A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_24335C9C0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_24335C9E0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_243359000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] found %@ as original URL to %@", (uint8_t *)&v3, 0x16u);
}

void sub_24335CA68(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_243359000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Sent ABC report successfully", v1, 2u);
}

void sub_24335CAAC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_243359000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ABC report got rejected", v1, 2u);
}

void sub_24335CAF0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24335CB5C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_243359000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to send snapshot for signature %@", (uint8_t *)&v2, 0xCu);
}

void sub_24335CBD4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24335CC40(__int16 a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = a2;
  WORD6(v3) = 2080;
  HIWORD(v3) = a1;
  sub_24335C9C0(&dword_243359000, a2, a3, "[DEBUG] ┣%llx dispatching to %s", (void)v3, *((const char **)&v3 + 1));
}

void sub_24335CCB8(void *a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  WORD6(v3) = 2080;
  HIWORD(v3) = a2;
  sub_24335C9C0(&dword_243359000, a2, a3, "[DEBUG] ┳%llx continuing on %s", (void)v3, *((const char **)&v3 + 1));
}

void sub_24335CD34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24335CDA4(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_243359000, a2, OS_LOG_TYPE_ERROR, "[ERROR] ┗%llx ", (uint8_t *)&v3, 0xCu);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t FPNotSupportedError()
{
  return MEMORY[0x270EEBB50]();
}

uint64_t FPURLMightBeInFileProvider()
{
  return MEMORY[0x270EEBB78]();
}

uint64_t SimulateCrash()
{
  return MEMORY[0x270F24B60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

uint64_t fpfs_set_is_ignore_root()
{
  return MEMORY[0x270EEBF28]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x270EDB260](a1, *(void *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}