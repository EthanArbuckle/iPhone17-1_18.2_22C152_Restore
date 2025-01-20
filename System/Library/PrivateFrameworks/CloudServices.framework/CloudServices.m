void sub_218119820(uint64_t a1)
{
}

void sub_218119828(uint64_t a1)
{
}

void sub_218119AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_218119AFC(uint64_t a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v6 = 0;
  int v3 = objc_msgSend_daemonPasscodeRequestOpinion_(v2, a2, (uint64_t)&v6);
  id v4 = v6;
  v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "initial state fetch completed with: %d %@", buf, 0x12u);
  }

  atomic_store(0, byte_26AC125C0);
}

void sub_218119BE0(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"no error";
    if (v6) {
      int v8 = v6;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "daemonPasscodeRequestOpinion came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
}

id _CloudServicesSignpostLogSystem()
{
  if (qword_267BC0888 != -1) {
    dispatch_once(&qword_267BC0888, &unk_26C91F128);
  }
  v0 = (void *)qword_267BC0880;

  return v0;
}

uint64_t sub_218119D38()
{
  qword_267BC0880 = (uint64_t)os_log_create("com.apple.sbd", "signpost");

  return MEMORY[0x270F9A758]();
}

os_signpost_id_t _CloudServicesSignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

double _CloudServicesSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  if (qword_267BC0898 != -1) {
    dispatch_once(&qword_267BC0898, &unk_26C91F1A8);
  }
  uint64_t v3 = mach_continuous_time();
  LODWORD(v4) = dword_267BC0890;
  LODWORD(v5) = *(_DWORD *)algn_267BC0894;
  return (double)v4 / (double)v5 * (double)(v3 - a2);
}

uint64_t sub_218119E1C()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_267BC0890);
}

uint64_t sub_21811A27C(void *a1, const char *a2, uint64_t a3)
{
  if ((unint64_t)objc_msgSend_length(a1, a2, a3) < 0xBE) {
    return 0;
  }

  return MEMORY[0x270F9A6D0](a1, sel_hasSuffix_, @"PET");
}

void sub_21811B810(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7 = objc_msgSend_reason(v3, v5, v6);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, *MEMORY[0x263F08320]);

    uint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v9, *MEMORY[0x263F07F70], 4864, v4);
    int v11 = *(void **)(v2 + 264);
    *(void *)(v2 + 264) = v10;

    objc_end_catch();
    JUMPOUT(0x21811B7D4);
  }
  _Unwind_Resume(exception_object);
}

void sub_21811C4BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  id v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D1E8(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811C534(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811C5E4;
  v5[3] = &unk_264303040;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_getAccountInfoWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811C5E4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  id v6 = a2;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"no error";
    if (v5) {
      int v8 = v5;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "getAccountInfoWithRequest in daemon came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811C834(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D260();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811C8AC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811C95C;
  v5[3] = &unk_264303090;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_fetchStingrayAccountStatusInDaemon_reply_(v2, v4, v3, v5);
}

void sub_21811C95C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  id v6 = a2;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"no error";
    if (v5) {
      int v8 = v5;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "fetchStingrayAccountStatus in daemon came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811CCB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  id v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D2CC(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811CD28(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811CDE0;
  v5[3] = &unk_2643030B8;
  long long v8 = *(_OWORD *)(a1 + 64);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_enableWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811CDE0(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v5 = _CloudServicesSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v14 = 67240192;
    LODWORD(v15) = v3 == 0;
    _os_signpost_emit_with_name_impl(&dword_218118000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EnableWithRequest", " CloudServicesSignpostNameEnableWithRequest=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameEnableWithRequest}d ", (uint8_t *)&v14, 8u);
  }

  long long v8 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = *(__CFString **)(a1 + 48);
    int v14 = 134218496;
    uint64_t v15 = v9;
    __int16 v16 = 2048;
    double v17 = Nanoseconds / 1000000000.0;
    __int16 v18 = 1026;
    BOOL v19 = v3 == 0;
    _os_log_impl(&dword_218118000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: EnableWithRequest  CloudServicesSignpostNameEnableWithRequest=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameEnableWithRequest}d ", (uint8_t *)&v14, 0x1Cu);
  }

  uint64_t v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = @"no error";
    if (v3) {
      int v11 = v3;
    }
    int v14 = 138412290;
    uint64_t v15 = v11;
    _os_log_impl(&dword_218118000, v10, OS_LOG_TYPE_DEFAULT, "enableWithRequest in daemon came back with %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v12, v13);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811D124(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  id v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D344(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811D19C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811D24C;
  v5[3] = &unk_264303040;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_recoverWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811D24C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  id v6 = a2;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = @"no error";
    if (v5) {
      long long v8 = v5;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "recoverWithRequest came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811D49C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  id v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D3BC(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811D514(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811D5C4;
  v5[3] = &unk_264303040;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_recoverRecordContentsWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811D5C4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  id v6 = a2;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = @"no error";
    if (v5) {
      long long v8 = v5;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "recoverRecordContents came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811D840(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  id v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D434(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811D8B4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_21811D968;
  v6[3] = &unk_264303108;
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  objc_msgSend_createICDPRecordWithRequest_recordContents_reply_(v2, v5, v3, v4, v6);
}

void sub_21811D968(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"no error";
    if (v3) {
      uint64_t v5 = v3;
    }
    int v8 = 138412290;
    __int16 v9 = v5;
    _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "createICDPRecord came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811DBA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D4AC(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811DC18(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811DCC8;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_disableWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811DCC8(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"no error";
    if (v3) {
      uint64_t v5 = v3;
    }
    int v8 = 138412290;
    __int16 v9 = v5;
    _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "disableWithRequest came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811DF04(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D524(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811DF78(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811E028;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_stashRecoveryDataWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811E028(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"no error";
    if (v3) {
      uint64_t v5 = v3;
    }
    int v8 = 138412290;
    __int16 v9 = v5;
    _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "stashRecoveryDataWithRequest came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811E264(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D59C(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811E2D8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811E388;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_updateMetadataWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811E388(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"no error";
    if (v3) {
      uint64_t v5 = v3;
    }
    int v8 = 138412290;
    __int16 v9 = v5;
    _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "updateMetadata came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_21811E5A0(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_218118000, v2, OS_LOG_TYPE_DEFAULT, "invalidating connection", v6, 2u);
  }

  return objc_msgSend_invalidate(*(void **)(a1 + 32), v3, v4);
}

uint64_t sub_21811E614(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_cachePassphraseWithRequestAsync_, *(void *)(a1 + 40));
}

void sub_21811E778(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D614(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811E7EC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811E89C;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_cachePassphraseWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811E89C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend_invalidate(v3, v4, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811EA58(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D68C(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811EACC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811EB7C;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_uncachePassphraseWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811EB7C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend_invalidate(v3, v4, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811ED38(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D704(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811EDAC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811EE5C;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_cacheRecoveryKeyWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811EE5C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend_invalidate(v3, v4, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811F018(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D77C(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811F08C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811F13C;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_uncacheRecoveryKeyWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811F13C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend_invalidate(v3, v4, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_21811F2D4(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_218118000, v2, OS_LOG_TYPE_DEFAULT, "invalidating connection", v6, 2u);
  }

  return objc_msgSend_invalidate(*(void **)(a1 + 32), v3, v4);
}

uint64_t sub_21811F348(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_uncachePassphraseWithRequestAsync_, *(void *)(a1 + 40));
}

void sub_21811F4AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D7F4(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811F524(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811F5D4;
  v5[3] = &unk_264303040;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_startSMSChallengeWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811F5D4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  id v6 = a2;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"no error";
    if (v5) {
      int v8 = v5;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "startSMSChallengeWithRequest came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811F824(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D86C(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811F89C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811F94C;
  v5[3] = &unk_264303040;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_getCountrySMSCodesWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811F94C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  id v6 = a2;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"no error";
    if (v5) {
      int v8 = v5;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "getCountrySMSCodesWithRequest came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811FB9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D8E4(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811FC10(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21811FCC0;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_changeSMSTargetWithRequest_reply_(v2, v4, v3, v5);
}

void sub_21811FCC0(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"no error";
    if (v3) {
      uint64_t v5 = v3;
    }
    int v8 = 138412290;
    __int16 v9 = v5;
    _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "changeSMSTargetWithRequest came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21811FF1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D95C(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21811FF90(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_218120040;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_backupWithInfo_reply_(v2, v4, v3, v5);
}

void sub_218120040(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"no error";
    if (v3) {
      uint64_t v5 = v3;
    }
    int v8 = 138412290;
    __int16 v9 = v5;
    _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "backupWithInfo came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21812027C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D9D4(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2181202F4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2181203A4;
  v5[3] = &unk_264303040;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_backOffDateWithRequest_reply_(v2, v4, v3, v5);
}

void sub_2181203A4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  id v6 = a2;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"no error";
    if (v5) {
      int v8 = v5;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "backOffDateWithRequest came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2181205F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813DA4C(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_218120668(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_218120718;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_setBackOffDateWithRequest_reply_(v2, v4, v3, v5);
}

void sub_218120718(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"no error";
    if (v3) {
      uint64_t v5 = v3;
    }
    int v8 = 138412290;
    __int16 v9 = v5;
    _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "setBackOffDateWithRequest came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_218120998(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813DAC4(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_218120A10(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_218120AB0;
  v4[3] = &unk_264303040;
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  objc_msgSend_notificationInfoWithReply_(v2, v3, (uint64_t)v4);
}

void sub_218120AB0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"no error";
    if (v5) {
      int v8 = v5;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "notificationInfo came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_218120D44(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813DB3C(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_218120DBC(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_218120E5C;
  v4[3] = &unk_264303040;
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  objc_msgSend_stateCaptureWithReply_(v2, v3, (uint64_t)v4);
}

void sub_218120E5C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"no error";
    if (v5) {
      int v8 = v5;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "stateCapture came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_218121190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2181211BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2181211CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D1E8(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_21812123C(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2181212E0;
  v6[3] = &unk_2643031F8;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_getAccountInfoWithRequest_reply_(v1, v4, v2, v6);
}

void sub_2181212E0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v5 = a2;
  uint64_t v6 = a3;
  long long v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"no error";
    if (v6) {
      uint64_t v8 = v6;
    }
    int v15 = 138412290;
    __int16 v16 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "getAccountInfoWithRequest came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    __int16 v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = v6;
  }
  else
  {
    __int16 v9 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = v5;
  }
  int v11 = v10;
  v12 = *v9;
  *__int16 v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

void sub_2181216BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2181216DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813DCAC(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_21812174C(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2181217E8;
  v6[3] = &unk_264303248;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_updateMetadataWithRequest_reply_(v1, v4, v2, v6);
}

void sub_2181217E8(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  long long v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"no error";
    if (v4) {
      uint64_t v6 = v4;
    }
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "updateMetadataWithRequest came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);
}

void sub_218121B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218121BAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D2CC(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218121C1C(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_218121CB8;
  v6[3] = &unk_264303248;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_enableWithRequest_reply_(v1, v4, v2, v6);
}

void sub_218121CB8(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  long long v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"no error";
    if (v4) {
      uint64_t v6 = v4;
    }
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "enableWithRequest came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);
}

void sub_2181220BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2181220E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D344(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218122158(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2181221FC;
  v6[3] = &unk_2643031F8;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_recoverWithRequest_reply_(v1, v4, v2, v6);
}

void sub_2181221FC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v5 = a2;
  uint64_t v6 = a3;
  long long v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"no error";
    if (v6) {
      uint64_t v8 = v6;
    }
    int v15 = 138412290;
    __int16 v16 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "recoverWithRequest came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    int v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = v6;
  }
  else
  {
    int v9 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = v5;
  }
  uint64_t v11 = v10;
  v12 = *v9;
  *int v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

void sub_218122628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_218122660(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813DE98(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2181226D0(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_218122784;
  v7[3] = &unk_2643031F8;
  uint64_t v9 = *(void *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v6;
  long long v8 = v6;
  objc_msgSend_recoverWithCDPContextInDaemon_escrowRecord_reply_(v1, v5, v2, v3, v7);
}

void sub_218122784(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  long long v6 = a3;
  long long v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = @"no error";
    if (v6) {
      long long v8 = v6;
    }
    int v15 = 138412290;
    __int16 v16 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "recoverWithCDPContextInDaemon came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = v5;
  }
  uint64_t v11 = v10;
  v12 = *v9;
  *uint64_t v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

void sub_218122BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_218122BE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  id v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813DF8C(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218122C58(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_218122D0C;
  v7[3] = &unk_2643031F8;
  uint64_t v9 = *(void *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v6;
  long long v8 = v6;
  objc_msgSend_recoverSilentWithCDPContextInDaemon_allRecords_reply_(v1, v5, v2, v3, v7);
}

void sub_218122D0C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  long long v6 = a3;
  long long v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = @"no error";
    if (v6) {
      long long v8 = v6;
    }
    int v15 = 138412290;
    __int16 v16 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "recoverSilentWithCDPContextInDaemon came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = v5;
  }
  uint64_t v11 = v10;
  v12 = *v9;
  *uint64_t v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

void sub_218123068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_218123098(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  id v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813E080(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218123108(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2181231A8;
  v5[3] = &unk_2643032C0;
  uint64_t v7 = *(void *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v4;
  long long v6 = v4;
  objc_msgSend_isRecoveryKeySetInDaemon_(v1, v3, (uint64_t)v5);
}

void sub_2181231A8(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v6 = a3;
  uint64_t v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = @"no error";
    if (v6) {
      long long v8 = v6;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "isRecoveryKeySetInDaemon came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
}

void sub_21812354C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_218123570(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  long long v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813E174(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2181235E0(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2181236A0;
  v9[3] = &unk_264303248;
  long long v8 = *(_OWORD *)(a1 + 64);
  id v6 = (id)v8;
  long long v10 = v8;
  objc_msgSend_restoreKeychainAsyncWithPasswordInDaemon_keybagDigest_haveBottledPeer_viewsNotToBeRestored_reply_(v1, v7, v2, v4, v3, v5, v9);
}

void sub_2181236A0(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  uint64_t v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"no error";
    if (v4) {
      id v6 = v4;
    }
    int v9 = 138412290;
    long long v10 = v6;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "restoreKeychainAsyncWithPasswordInDaemon came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);
}

void sub_2181239F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_218123A28(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813E268(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218123A98(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_218123B3C;
  v6[3] = &unk_2643032C0;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_restoreKeychainWithBackupPasswordInDaemon_reply_(v1, v4, v2, v6);
}

void sub_218123B3C(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3;
  long long v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"no error";
    if (v6) {
      uint64_t v8 = v6;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "restoreKeychainWithBackupPassword came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
}

void sub_218123EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_218123EE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813E35C(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218123F50(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_218123FF4;
  v6[3] = &unk_2643032C0;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_verifyRecoveryKeyInDaemon_reply_(v1, v4, v2, v6);
}

void sub_218123FF4(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3;
  long long v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"no error";
    if (v6) {
      uint64_t v8 = v6;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "verifyRecoveryKey came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
}

void sub_218124340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_218124370(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813E450(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2181243E0(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_218124480;
  v5[3] = &unk_2643032C0;
  uint64_t v7 = *(void *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v4;
  long long v6 = v4;
  objc_msgSend_removeRecoveryKeyFromBackupInDaemon_(v1, v3, (uint64_t)v5);
}

void sub_218124480(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v6 = a3;
  uint64_t v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"no error";
    if (v6) {
      uint64_t v8 = v6;
    }
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "removeRecoveryKeyFromBackup came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
}

void sub_2181246E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_218124954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218124974(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  long long v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D4AC(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2181249E4(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_218124A80;
  v6[3] = &unk_264303248;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_disableWithRequest_reply_(v1, v4, v2, v6);
}

void sub_218124A80(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v4 = a2;
  long long v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"no error";
    if (v4) {
      uint64_t v6 = v4;
    }
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "disableWithRequest came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);
}

void sub_218124D20(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2181250F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21812511C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  long long v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D7F4(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_21812518C(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_218125230;
  v6[3] = &unk_2643031F8;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_startSMSChallengeWithRequest_reply_(v1, v4, v2, v6);
}

void sub_218125230(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v5 = a2;
  uint64_t v6 = a3;
  long long v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"no error";
    if (v6) {
      uint64_t v8 = v6;
    }
    int v15 = 138412290;
    __int16 v16 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "startSMSChallengeWithRequest came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    int v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = v6;
  }
  else
  {
    int v9 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = v5;
  }
  uint64_t v11 = v10;
  v12 = *v9;
  *int v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

uint64_t sub_2181254D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_218125720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218125740(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  long long v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D8E4(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2181257B0(uint64_t a1)
{
  os_signpost_id_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_21812584C;
  v6[3] = &unk_264303248;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_changeSMSTargetWithRequest_reply_(v1, v4, v2, v6);
}

void sub_21812584C(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v4 = a2;
  long long v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"no error";
    if (v4) {
      uint64_t v6 = v4;
    }
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "changeSMSTargetWithRequest came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);
}

void sub_218125C00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_218125C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21813E6B8();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_218125C90(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_218125D2C;
  v6[3] = &unk_264303248;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_backupForRecoveryKeyWithInfoInDaemon_reply_(v1, v4, v2, v6);
}

void sub_218125D2C(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v4 = a2;
  long long v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"no error";
    if (v4) {
      uint64_t v6 = v4;
    }
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "backupForRecoveryKeyWithInfoInDaemon came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);
}

void sub_218126004(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_218126024(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  long long v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813D95C(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218126094(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_218126130;
  v6[3] = &unk_264303248;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_backupWithInfo_reply_(v1, v4, v2, v6);
}

void sub_218126130(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v4 = a2;
  long long v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"no error";
    if (v4) {
      uint64_t v6 = v4;
    }
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "backupWithInfo came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);
}

void sub_21812661C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  long long v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813E81C(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_218126690(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_218126748;
  v6[3] = &unk_264303108;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  objc_msgSend_prepareHSA2EscrowRecordContents_usesComplexPassphrase_reply_(v2, v5, v3, v4, v6);
}

void sub_218126748(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"no error";
    if (v3) {
      uint64_t v5 = v3;
    }
    int v8 = 138412290;
    int v9 = v5;
    _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "prepareHSA2EscrowRecordContents came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21812682C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = (const char *)objc_msgSend_UTF8String(@"com.apple.sbd.passcode_request", a2, a3);
  if (notify_register_check(v3, &dword_26AC125B4))
  {
    uint64_t v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "unable to fetch passcode_request token", v5, 2u);
    }
  }
  else
  {
    byte_26AC125B9 = 1;
  }
}

void sub_2181268C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813E984(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218126930(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_218119BE0;
  v5[3] = &unk_2643033A8;
  uint64_t v7 = *(void *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v4;
  long long v6 = v4;
  objc_msgSend_daemonPasscodeRequestOpinion_(v1, v3, (uint64_t)v5);
}

void sub_218126D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_218126D38(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  long long v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813EA78(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218126DA8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_218126E70;
  v9[3] = &unk_2643033D0;
  uint64_t v11 = *(void *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  id v6 = (id)v8;
  long long v10 = v8;
  objc_msgSend_beginHSA2PasscodeRequest_desirePasscodeImmediately_uuid_reason_reply_(v1, v7, v2, v3, v4, v5, v9);
}

void sub_218126E70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = @"no error";
    if (v6) {
      long long v8 = v6;
    }
    int v14 = 138412290;
    int v15 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "beginHSA2PasscodeRequest came back with %@", (uint8_t *)&v14, 0xCu);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v12, v13);
}

void sub_2181270E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813EAF0(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_218127164(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_218127214;
  v5[3] = &unk_264303420;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_getCertificatesWithRequest_reply_(v2, v4, v3, v5);
}

void sub_218127214(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v15 = a2;
  objc_msgSend_invalidate(v9, v13, v14);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2181274DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813EB68(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_218127550(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_218127600;
  v5[3] = &unk_264303108;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_saveTermsAcceptance_reply_(v2, v4, v3, v5);
}

void sub_218127600(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"no error";
    if (v3) {
      uint64_t v5 = v3;
    }
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_218118000, v4, OS_LOG_TYPE_DEFAULT, "saveTermsAcceptance came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_21812785C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813EBE0(v3, v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2181278D4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_218127984;
  v5[3] = &unk_264303448;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend_getAcceptedTermsForAltDSID_reply_(v2, v4, v3, v5);
}

void sub_218127984(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"no error";
    if (v6) {
      int v8 = v6;
    }
    int v16 = 138412290;
    uint64_t v17 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "getAcceptedTermsForAltDSID came back with %@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  uint64_t v11 = *(void *)(a1 + 40);
  if (objc_msgSend_count(v5, v12, v13))
  {
    id v15 = objc_msgSend_objectAtIndexedSubscript_(v5, v14, 0);
    (*(void (**)(uint64_t, void *, __CFString *))(v11 + 16))(v11, v15, v6);
  }
  else
  {
    (*(void (**)(uint64_t, void, __CFString *))(v11 + 16))(v11, 0, v6);
  }
}

void sub_218127CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_218127D1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813EBE0(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_218127D8C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_218127E30;
  v6[3] = &unk_264303470;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v7 = v5;
  objc_msgSend_getAcceptedTermsForAltDSID_reply_(v1, v4, v2, v6);
}

void sub_218127E30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a3;
  long long v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"no error";
    if (v6) {
      uint64_t v8 = v6;
    }
    int v14 = 138412290;
    uint64_t v15 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "getAcceptedTermsForAltDSID came back with %@", (uint8_t *)&v14, 0xCu);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v12, v13);
}

void sub_2181281D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2181281FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813EC58(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_21812826C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_218128320;
  v7[3] = &unk_2643032C0;
  uint64_t v9 = *(void *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v6;
  long long v8 = v6;
  objc_msgSend_moveToFederationAllowed_altDSID_reply_(v1, v5, v2, v3, v7);
}

void sub_218128320(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v6 = a3;
  long long v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = @"no error";
    if (v6) {
      long long v8 = v6;
    }
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "moveToFederationAllowed came back with %@", (uint8_t *)&v11, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
}

void sub_218128624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21812864C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CloudServicesLog();
  id v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_21813ECD0(v3, v4, v5);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2181286BC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21812875C;
  v5[3] = &unk_264303470;
  uint64_t v7 = *(void *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v4;
  long long v6 = v4;
  objc_msgSend_knownICDPFederations_(v1, v3, (uint64_t)v5);
}

void sub_21812875C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = a3;
  long long v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"no error";
    if (v7) {
      uint64_t v9 = v7;
    }
    int v12 = 138412290;
    uint64_t v13 = v9;
    _os_log_impl(&dword_218118000, v8, OS_LOG_TYPE_DEFAULT, "knownICDPFederations came back with %@", (uint8_t *)&v12, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  objc_msgSend_invalidate(*(void **)(a1 + 32), v10, v11);
}

void SecureBackupGetAccountInfoWithInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = (void *)MEMORY[0x21D463270]();
  uint64_t v5 = [SecureBackup alloc];
  uint64_t v7 = objc_msgSend_initWithUserActivityLabel_(v5, v6, @"getAccountInfo (legacy API)");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_218128F58;
  v10[3] = &unk_264303338;
  id v8 = v3;
  id v11 = v8;
  objc_msgSend_getAccountInfoWithInfo_completionBlock_(v7, v9, a1, v10);
}

uint64_t sub_218128F58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void SecureBackupEnableWithInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = (void *)MEMORY[0x21D463270]();
  uint64_t v5 = [SecureBackup alloc];
  uint64_t v7 = objc_msgSend_initWithUserActivityLabel_(v5, v6, @"enable (legacy API)");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_21812903C;
  v10[3] = &unk_264303018;
  id v8 = v3;
  id v11 = v8;
  objc_msgSend_enableWithInfo_completionBlock_(v7, v9, a1, v10);
}

uint64_t sub_21812903C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void SecureBackupRecoverWithInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = (void *)MEMORY[0x21D463270]();
  uint64_t v5 = [SecureBackup alloc];
  uint64_t v7 = objc_msgSend_initWithUserActivityLabel_(v5, v6, @"recover (legacy API)");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_218129120;
  v10[3] = &unk_264303338;
  id v8 = v3;
  id v11 = v8;
  objc_msgSend_recoverWithInfo_completionBlock_(v7, v9, a1, v10);
}

uint64_t sub_218129120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void SecureBackupDisableWithInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = (void *)MEMORY[0x21D463270]();
  uint64_t v5 = [SecureBackup alloc];
  uint64_t v7 = objc_msgSend_initWithUserActivityLabel_(v5, v6, @"disable (legacy API)");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_218129204;
  v10[3] = &unk_264303018;
  id v8 = v3;
  id v11 = v8;
  objc_msgSend_disableWithInfo_completionBlock_(v7, v9, a1, v10);
}

uint64_t sub_218129204(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void SecureBackupUpdateMetadataWithInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = (void *)MEMORY[0x21D463270]();
  uint64_t v5 = [SecureBackup alloc];
  uint64_t v7 = objc_msgSend_initWithUserActivityLabel_(v5, v6, @"updateMetadata (legacy API)");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2181292E8;
  v10[3] = &unk_264303018;
  id v8 = v3;
  id v11 = v8;
  objc_msgSend_updateMetadataWithInfo_completionBlock_(v7, v9, a1, v10);
}

uint64_t sub_2181292E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void SecureBackupBackOffDateWithInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = (void *)MEMORY[0x21D463270]();
  uint64_t v5 = [SecureBackup alloc];
  uint64_t v7 = objc_msgSend_initWithUserActivityLabel_(v5, v6, @"backOffDate (legacy API)");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2181293CC;
  v10[3] = &unk_264303338;
  id v8 = v3;
  id v11 = v8;
  objc_msgSend_backOffDateWithInfo_completionBlock_(v7, v9, a1, v10);
}

uint64_t sub_2181293CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void SecureBackupSetBackOffDateWithInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = (void *)MEMORY[0x21D463270]();
  uint64_t v5 = [SecureBackup alloc];
  uint64_t v7 = objc_msgSend_initWithUserActivityLabel_(v5, v6, @"setBackOffDate (legacy API)");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2181294B0;
  v10[3] = &unk_264303018;
  id v8 = v3;
  id v11 = v8;
  objc_msgSend_setBackOffDateWithInfo_completionBlock_(v7, v9, a1, v10);
}

uint64_t sub_2181294B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void SecureBackupKVSState(void *a1)
{
  id v1 = a1;
  id v2 = (void *)MEMORY[0x21D463270]();
  id v3 = [SecureBackup alloc];
  uint64_t v5 = objc_msgSend_initWithUserActivityLabel_(v3, v4, @"stateCapture (legacy API)");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21812958C;
  v8[3] = &unk_264303338;
  id v6 = v1;
  id v9 = v6;
  objc_msgSend_stateCaptureWithCompletionBlock_(v5, v7, (uint64_t)v8);
}

uint64_t sub_21812958C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void SecureBackupIsGuitarfishEnabledOverride(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1) {
    int v2 = 1;
  }
  else {
    int v2 = 2;
  }
  dword_267BC08A0 = v2;
  id v3 = CloudServicesLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    long long v4 = "disabled";
    if (a1) {
      long long v4 = "enabled";
    }
    int v5 = 136315138;
    id v6 = v4;
    _os_log_impl(&dword_218118000, v3, OS_LOG_TYPE_DEFAULT, "Guitarfish ff overridden to %s", (uint8_t *)&v5, 0xCu);
  }
}

void SecureBackupIsGuitarfishEnabledClearOverride()
{
  dword_267BC08A0 = 0;
  v0 = CloudServicesLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_218118000, v0, OS_LOG_TYPE_DEFAULT, "Guitarfish ff override removed", v1, 2u);
  }
}

BOOL SecureBackupIsGuitarfishEnabled()
{
  if (dword_267BC08A0) {
    return dword_267BC08A0 == 1;
  }
  if (qword_26AC125C8 != -1) {
    dispatch_once(&qword_26AC125C8, &unk_26C91F1C8);
  }
  return byte_267BC08A4 != 0;
}

void sub_218129740()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  byte_267BC08A4 = _os_feature_enabled_impl();
  v0 = CloudServicesLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_267BC08A4) {
      id v1 = "enabled";
    }
    else {
      id v1 = "disabled";
    }
    int v2 = 136315138;
    id v3 = v1;
    _os_log_impl(&dword_218118000, v0, OS_LOG_TYPE_DEFAULT, "Guitarfish set via feature flag to %s", (uint8_t *)&v2, 0xCu);
  }
}

void sub_218129CA0(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_processInfo(MEMORY[0x263F08AB0], a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_processName(v7, v3, v4);
  id v6 = (void *)qword_26AC125D0;
  qword_26AC125D0 = v5;
}

void sub_218129CFC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_218129D1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

BOOL SecureBackupTermsInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_24;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_24;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_24:
          BOOL v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_21812B0C0(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, v4, (uint64_t)v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend_BOOLValue(v5, v6, v7);
  }
  else
  {
    if (v5)
    {
      unsigned int v9 = CloudServicesLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_21813ED8C();
      }
    }
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t sub_21812B174(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, v4, (uint64_t)v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend_integerValue(v5, v6, v7);
  }
  else
  {
    if (v5)
    {
      unsigned int v9 = CloudServicesLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_21813ED8C();
      }
    }
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_21812B74C(id a1)
{
  return a1;
}

void sub_21812B770(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id SecureBackupSetupProtocol(void *a1)
{
  v38[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (qword_26AC125E8 != -1) {
    dispatch_once(&qword_26AC125E8, &unk_26C91F168);
  }
  int v2 = (void *)MEMORY[0x263EFFA08];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v3, (uint64_t)v38, 2);
  id v6 = objc_msgSend_setWithArray_(v2, v5, (uint64_t)v4);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v7, (uint64_t)v6, sel_recoverSilentWithCDPContextInDaemon_allRecords_reply_, 1, 0);
  uint64_t v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v11 = objc_msgSend_setWithObject_(v8, v10, v9);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v12, (uint64_t)v11, sel_recoverSilentWithCDPContextInDaemon_allRecords_reply_, 0, 0);

  char v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  uint64_t v16 = objc_msgSend_setWithObject_(v13, v15, v14);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v17, (uint64_t)v16, sel_recoverWithCDPContextInDaemon_escrowRecord_reply_, 0, 0);

  uint64_t v18 = (void *)MEMORY[0x263EFFA08];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v37[2] = objc_opt_class();
  v37[3] = objc_opt_class();
  v37[4] = objc_opt_class();
  uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v37, 5);
  v22 = objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v23, (uint64_t)v22, sel_restoreKeychainAsyncWithPasswordInDaemon_keybagDigest_haveBottledPeer_viewsNotToBeRestored_reply_, 3, 0);

  v24 = (void *)MEMORY[0x263EFFA08];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  v36[3] = objc_opt_class();
  v36[4] = objc_opt_class();
  v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v25, (uint64_t)v36, 5);
  v28 = objc_msgSend_setWithArray_(v24, v27, (uint64_t)v26);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v29, (uint64_t)v28, sel_createICDPRecordWithRequest_recordContents_reply_, 1, 0);

  v30 = (void *)MEMORY[0x263EFFA08];
  uint64_t v31 = objc_opt_class();
  v33 = objc_msgSend_setWithObject_(v30, v32, v31);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v34, (uint64_t)v33, sel_beginHSA2PasscodeRequest_desirePasscodeImmediately_uuid_reason_reply_, 3, 0);

  return v1;
}

uint64_t sub_21812BAB0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_set(MEMORY[0x263EFF9C0], a2, a3);
  uint64_t v4 = (void *)qword_26AC125E0;
  qword_26AC125E0 = v3;

  for (uint64_t i = 0; i != 13; ++i)
  {
    uint64_t result = (uint64_t)objc_getClass(off_2643034A0[i]);
    if (result) {
      uint64_t result = objc_msgSend_addObject_((void *)qword_26AC125E0, v7, result);
    }
  }
  return result;
}

id SecureBackupSetupConcurrentProtocol(void *a1)
{
  id v1 = a1;
  int v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v6 = objc_msgSend_setWithObjects_(v2, v5, v3, v4, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v7, (uint64_t)v6, sel_getAcceptedTermsForAltDSID_reply_, 0, 1);

  return v1;
}

uint64_t SecureBackupEscrowReasonReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CSStingrayRecordReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = objc_alloc_init(CSStingrayRecordClientMetadata);
          objc_storeStrong((id *)(a1 + 24), v17);
          if PBReaderPlaceMark() && (CSStingrayRecordClientMetadataReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 52) |= 2u;
          while (1)
          {
            uint64_t v22 = *v3;
            unint64_t v23 = *(void *)(a2 + v22);
            if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_44;
            }
            v19 += 7;
            BOOL v14 = v20++ >= 9;
            if (v14)
            {
              uint64_t v21 = 0;
              goto LABEL_46;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v21 = 0;
          }
LABEL_46:
          BOOL v34 = v21 != 0;
          uint64_t v35 = 49;
          goto LABEL_51;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 52) |= 1u;
          break;
        case 4u:
          uint64_t v31 = PBReaderReadData();
          uint64_t v32 = 8;
          goto LABEL_42;
        case 5u:
          uint64_t v31 = PBReaderReadData();
          uint64_t v32 = 32;
          goto LABEL_42;
        case 6u:
          uint64_t v31 = PBReaderReadString();
          uint64_t v32 = 40;
          goto LABEL_42;
        case 7u:
          uint64_t v31 = PBReaderReadData();
          uint64_t v32 = 16;
LABEL_42:
          v33 = *(void **)(a1 + v32);
          *(void *)(a1 + v32) = v31;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v28) = v29 + 1;
        v27 |= (unint64_t)(v30 & 0x7F) << v25;
        if ((v30 & 0x80) == 0) {
          goto LABEL_48;
        }
        v25 += 7;
        BOOL v14 = v26++ >= 9;
        if (v14)
        {
          uint64_t v27 = 0;
          goto LABEL_50;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_48:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v27 = 0;
      }
LABEL_50:
      BOOL v34 = v27 != 0;
      uint64_t v35 = 48;
LABEL_51:
      *(unsigned char *)(a1 + v35) = v34;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CSStingrayRecordClientMetadataKeyRegistryReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(CSStingrayRecordClientMetadataKeyRegistryEntry);
        objc_msgSend_addServiceEntry_(a1, v18, (uint64_t)v17);
        if (!PBReaderPlaceMark() || !CSStingrayRecordClientMetadataKeyRegistryEntryReadFrom(v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CSStingrayRecordClientMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = objc_alloc_init(CSStingrayRecordClientMetadataICloudDataProtection);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark()
          && (CSStingrayRecordClientMetadataICloudDataProtectionReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_29;
        }
        goto LABEL_58;
      case 2u:
        char v17 = objc_alloc_init(CSStingrayRecordClientMetadataKeyRegistry);
        objc_storeStrong((id *)(a1 + 40), v17);
        if (!PBReaderPlaceMark() || (CSStingrayRecordClientMetadataKeyRegistryReadFrom(v17, a2) & 1) == 0) {
          goto LABEL_58;
        }
        goto LABEL_29;
      case 3u:
        char v17 = objc_alloc_init(CSStingrayRecordClientMetadataStableMetadata);
        objc_storeStrong((id *)(a1 + 56), v17);
        if (PBReaderPlaceMark()
          && (CSStingrayRecordClientMetadataStableMetadataReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_56:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_58:

        return 0;
      case 4u:
        uint64_t v19 = PBReaderReadData();
        uint64_t v20 = 32;
        goto LABEL_46;
      case 5u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 64) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_50:
        uint64_t v33 = 8;
        goto LABEL_55;
      case 6u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 64) |= 2u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_54:
        uint64_t v33 = 16;
LABEL_55:
        *(void *)(a1 + v33) = v23;
        goto LABEL_56;
      case 7u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 48;
LABEL_46:
        uint64_t v32 = *(void **)(a1 + v20);
        *(void *)(a1 + v20) = v19;

        goto LABEL_56;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_56;
    }
  }
}

uint64_t CSStingrayRecordClientMetadataICloudDataProtectionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_61;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_63;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_61:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_63:
          BOOL v51 = v19 != 0;
          uint64_t v52 = 32;
          goto LABEL_80;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v26 = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v26 = 0;
          }
LABEL_67:
          BOOL v51 = v26 != 0;
          uint64_t v52 = 33;
          goto LABEL_80;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          *(unsigned char *)(a1 + 40) |= 0x10u;
          while (2)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v34 + 1;
              v32 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                BOOL v14 = v31++ >= 9;
                if (v14)
                {
                  uint64_t v32 = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v32 = 0;
          }
LABEL_71:
          BOOL v51 = v32 != 0;
          uint64_t v52 = 36;
          goto LABEL_80;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          while (2)
          {
            uint64_t v39 = *v3;
            unint64_t v40 = *(void *)(a2 + v39);
            if (v40 == -1 || v40 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
              *(void *)(a2 + v39) = v40 + 1;
              v38 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  uint64_t v38 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v38 = 0;
          }
LABEL_75:
          BOOL v51 = v38 != 0;
          uint64_t v52 = 34;
          goto LABEL_80;
        case 5u:
          uint64_t v42 = PBReaderReadData();
          uint64_t v43 = 16;
          goto LABEL_59;
        case 6u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(unsigned char *)(a1 + 40) |= 8u;
          break;
        case 7u:
          uint64_t v42 = PBReaderReadData();
          uint64_t v43 = 24;
          goto LABEL_59;
        case 8u:
          uint64_t v42 = PBReaderReadData();
          uint64_t v43 = 8;
LABEL_59:
          v50 = *(void **)(a1 + v43);
          *(void *)(a1 + v43) = v42;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v47 = *v3;
        unint64_t v48 = *(void *)(a2 + v47);
        if (v48 == -1 || v48 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
        *(void *)(a2 + v47) = v48 + 1;
        v46 |= (unint64_t)(v49 & 0x7F) << v44;
        if ((v49 & 0x80) == 0) {
          goto LABEL_77;
        }
        v44 += 7;
        BOOL v14 = v45++ >= 9;
        if (v14)
        {
          uint64_t v46 = 0;
          goto LABEL_79;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_77:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v46 = 0;
      }
LABEL_79:
      BOOL v51 = v46 != 0;
      uint64_t v52 = 35;
LABEL_80:
      *(unsigned char *)(a1 + v52) = v51;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CSStingrayAccountStatusReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2)
      {
        char v17 = objc_alloc_init(CSStingrayRecord);
        uint64_t v18 = 8;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
          continue;
        }
        char v17 = objc_alloc_init(CSStingrayRecord);
        uint64_t v18 = 16;
      }
      objc_storeStrong((id *)(a1 + v18), v17);
      if (!PBReaderPlaceMark() || (CSStingrayRecordReadFrom((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CSStingrayRecordClientMetadataStableMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CSStingrayRecordClientMetadataKeyRegistryEntryReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = (void *)a1[1];
        a1[1] = v17;
LABEL_23:

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    if (v18) {
      objc_msgSend_addPublicKeys_(a1, v19, (uint64_t)v18);
    }
    goto LABEL_23;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_2181318F4(uint64_t *a1)
{
  *a1 = ccrng();
  a1[1] = ccsha256_di();
  a1[2] = ccaes_cbc_encrypt_mode();
  a1[3] = ccaes_cbc_decrypt_mode();
  a1[4] = ccaes_gcm_encrypt_mode();
  a1[5] = ccaes_gcm_decrypt_mode();
  ccsrp_gp_rfc5054_2048();
  size_t v2 = ccdh_ccn_size();
  if (v2 >> 62) {
    goto LABEL_8;
  }
  uint64_t v7 = 4 * v2 + 48;
  if (4 * v2 >= 0xFFFFFFFFFFFFFFD0)
  {
LABEL_9:
    __break(0x5500u);
    return MEMORY[0x270ED8DC0](v2, v3, v4, v5, v6);
  }
  unint64_t v8 = *(void *)a1[1];
  if (v8 >> 62)
  {
LABEL_8:
    __break(0x550Cu);
    goto LABEL_9;
  }
  size_t v2 = v7 + 4 * v8;
  if (__CFADD__(v7, 4 * v8)) {
    goto LABEL_9;
  }
  unsigned int v9 = malloc_type_malloc(v2, 0xA83F1E54uLL);
  a1[6] = (uint64_t)v9;
  uint64_t v10 = a1[1];
  uint64_t v4 = ccsrp_gp_rfc5054_2048();
  uint64_t v6 = *a1;
  size_t v2 = (size_t)v9;
  uint64_t v3 = v10;
  uint64_t v5 = 0;

  return MEMORY[0x270ED8DC0](v2, v3, v4, v5, v6);
}

void sub_2181319CC(uint64_t a1)
{
  if (a1)
  {
    unint64_t v2 = ccdh_ccn_size();
    if (!(v2 >> 62))
    {
      if (4 * v2 >= 0xFFFFFFFFFFFFFFD0) {
        goto LABEL_9;
      }
      unint64_t v3 = ***(void ***)(a1 + 48);
      if (!(v3 >> 62))
      {
        if (!__CFADD__(4 * v2 + 48, 4 * v3))
        {
          cc_clear();
          free(*(void **)(a1 + 48));
          *(void *)(a1 + 48) = 0;
          *(_OWORD *)a1 = 0u;
          *(_OWORD *)(a1 + 16) = 0u;
          return;
        }
LABEL_9:
        __break(0x5500u);
        return;
      }
    }
    __break(0x550Cu);
    goto LABEL_9;
  }
}

unint64_t sub_218131A4C(uint64_t a1)
{
  unint64_t result = MEMORY[0x21D462F10](*(void *)(*(void *)(a1 + 48) + 8));
  if (result >> 61) {
    __break(0x550Cu);
  }
  else {
    result *= 8;
  }
  return result;
}

BOOL sub_218131A7C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_218131A4C(a1) <= a3 && ccsrp_client_start_authentication() == 0;
}

uint64_t sub_218131AD8()
{
  return ccsrp_get_session_key_length();
}

unint64_t sub_218131AE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  unint64_t result = MEMORY[0x21D462F10](*(void *)(v1 + 8));
  if (!(result >> 62)) {
    return v1 + 32 * result + 32;
  }
  __break(0x550Cu);
  return result;
}

unint64_t sub_218131B1C(uint64_t a1)
{
  unint64_t result = MEMORY[0x21D462F10](*(void *)(a1 + 8));
  if (!(result >> 62)) {
    return a1 + 32 * result + 32;
  }
  __break(0x550Cu);
  return result;
}

uint64_t sub_218131B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void (*a8)(const char *, ...), uint64_t a9)
{
  return sub_218131B84(a1, a2, a3, a4, a5, a6, a7, 0, a8, a9);
}

uint64_t sub_218131B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, int a8, void (*a9)(const char *, ...), uint64_t a10)
{
  v62[4] = *MEMORY[0x263EF8340];
  size_t v14 = sub_218131A4C(a1);
  uint64_t session_key_length = ccsrp_get_session_key_length();
  if (!session_key_length) {
    return 4294967197;
  }
  int v60 = a8;
  uint64_t v16 = a5 + 44;
  size_t v17 = *(unsigned int *)(a5 + 44 + *(unsigned int *)(a5 + 32));
  if ((v17 - 257) <= 0xFFFFFEFF)
  {
    a9("salt_len (%zu) out of bounds (0,%zu]", *(unsigned int *)(a5 + 44 + *(unsigned int *)(a5 + 32)), 0x100uLL);
    (*(void (**)(uint64_t, const char *, ...))(a10 + 16))(a10, "salt_len (%zu) out of bounds (0,%zu]", v17, 0x100uLL);
    return 4294967294;
  }
  size_t v19 = session_key_length;
  v58 = a6;
  v59 = malloc_type_malloc(v17, 0x409D68E5uLL);
  size_t v20 = *(unsigned int *)(v16 + *(unsigned int *)(a5 + 28));
  if ((v20 - 257) <= 0xFFFFFEFF)
  {
    a9("hsm_id_len %zu not in (0,%d)", v20, 256);
    (*(void (**)(uint64_t, const char *, ...))(a10 + 16))(a10, "hsm_id_len %zu not in (0,%d)", v20, 256);
    unint64_t v21 = 0;
    char v22 = 0;
    uint64_t v23 = 0;
    uint64_t v18 = 4294967294;
    char v24 = v59;
    if (!v59) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v54 = a7;
  size_t v25 = *(unsigned int *)(v16 + *(unsigned int *)(a5 + 36));
  uint64_t v26 = malloc_type_malloc(v20, 0xCE03D9D4uLL);
  uint64_t v27 = (char *)malloc_type_malloc(v14, 0x7237F347uLL);
  v57 = malloc_type_malloc(v19, 0xAB07AF6DuLL);
  __dst = v26;
  cc_clear();
  v56 = v27;
  uint64_t result = cc_clear();
  if (v14 < v25)
  {
    a9("pki_size %zd < B_len %zd", v14, v25);
    (*(void (**)(uint64_t, const char *, ...))(a10 + 16))(a10, "pki_size %zd < B_len %zd", v14, v25);
    uint64_t v18 = 4294967254;
    uint64_t v23 = v57;
    char v24 = v59;
    unint64_t v21 = __dst;
    char v22 = v56;
    if (!v59) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v14 > v25)
  {
    a9("pki_size %zd > B_len %zd", v14, v25);
    uint64_t result = (*(uint64_t (**)(uint64_t, const char *, ...))(a10 + 16))(a10, "pki_size %zd > B_len %zd", v14, v25);
  }
  unint64_t v21 = v26;
  if (v14 < v25)
  {
LABEL_52:
    __break(0x5515u);
  }
  else
  {
    char v29 = (unsigned int *)(v16 + *(unsigned int *)(a5 + 28));
    size_t v30 = *v29;
    if (v20 < v30)
    {
      char v24 = v59;
      char v22 = v56;
      goto LABEL_19;
    }
    unsigned int v53 = *v29;
    memcpy(v26, v29 + 1, v30);
    unsigned int v31 = (unsigned int *)(v16 + *(unsigned int *)(a5 + 32));
    size_t v32 = *v31;
    if (v17 < v32)
    {
      char v24 = v59;
LABEL_18:
      char v22 = v56;
LABEL_19:
      a9("unpack_srp_init_resp_rec failed");
      (*(void (**)(uint64_t, const char *))(a10 + 16))(a10, "unpack_srp_init_resp_rec failed");
      uint64_t v18 = 0xFFFFFFFFLL;
      uint64_t v23 = v57;
      if (!v24)
      {
LABEL_21:
        if (v21)
        {
          cc_clear();
          free(v21);
        }
        if (v22)
        {
          cc_clear();
          free(v22);
        }
        if (v23)
        {
          cc_clear();
          free(v23);
        }
        return v18;
      }
LABEL_20:
      cc_clear();
      free(v24);
      goto LABEL_21;
    }
    char v24 = v59;
    memcpy(v59, v31 + 1, v32);
    uint64_t v33 = (unsigned int *)(v16 + *(unsigned int *)(a5 + 36));
    size_t v34 = *v33;
    if (v25 < v34) {
      goto LABEL_18;
    }
    char v22 = v56;
    memcpy(&v56[v14 - v25], v33 + 1, v34);
    uint64_t v23 = v57;
    uint64_t result = ccsrp_client_process_challenge();
    if (result)
    {
      int v35 = result;
      a9("ccsrp_client_process_challenge failed: %d", result);
      (*(void (**)(uint64_t, const char *, ...))(a10 + 16))(a10, "ccsrp_client_process_challenge failed: %d", v35);
      uint64_t v18 = 4294967293;
LABEL_49:
      if (!v24) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    uint64_t v36 = 0;
    uint64_t v37 = v54;
    *(_DWORD *)(v54 + 4) = 165;
    *(_DWORD *)(v54 + 8) = v60;
    *(_OWORD *)(v54 + 12) = *(_OWORD *)(a5 + 12);
    v62[1] = v26;
    v62[0] = v53;
    v62[3] = v57;
    v62[2] = v19;
    *(_DWORD *)(v54 + 28) = 0;
    uint64_t v38 = v54 + 28;
    uint64_t v39 = v54 + 40;
    unsigned int v40 = *v58;
    unsigned int v61 = *v58;
    while (((16 * v36) | 8uLL) <= 0x20 && (v36 & 0xFFFFFFFFFFFFFFELL) == 0)
    {
      uint64_t v41 = *(unsigned int *)(v38 + 4 * v36);
      uint64_t v42 = (unsigned int *)&v62[2 * v36];
      uint64_t v43 = (const void *)*((void *)v42 + 1);
      if (v43)
      {
        size_t v44 = *v42;
        if (v44 >= 0xFFFFFFFD) {
          goto LABEL_54;
        }
        unsigned int v45 = (v44 + 3) & 0xFFFFFFFC;
        if (v45 < v44) {
          goto LABEL_48;
        }
        unsigned int v46 = v45 + 4;
        if (v45 >= 0xFFFFFFFC) {
          goto LABEL_54;
        }
        if (v45 + 3 >= v40)
        {
LABEL_48:
          a9("pack_srp_recovery_rec failed");
          (*(void (**)(uint64_t, const char *))(a10 + 16))(a10, "pack_srp_recovery_rec failed");
          uint64_t v18 = 4294967291;
          uint64_t v23 = v57;
          char v24 = v59;
          char v22 = v56;
          goto LABEL_49;
        }
        uint64_t v47 = (_DWORD *)(v39 + v41);
        *(_DWORD *)(v39 + v41) = v44;
        uint64_t result = (uint64_t)memcpy((void *)(v39 + v41 + 4), v43, v44);
        *uint64_t v47 = bswap32(v44);
        int v48 = *(_DWORD *)(v38 + 4 * v36);
        BOOL v49 = __CFADD__(v46, v48);
        int v50 = v46 + v48;
        if (v49) {
          goto LABEL_54;
        }
        ++v36;
        *(_DWORD *)(v38 + 4 * v36) = v50;
        BOOL v49 = v40 >= v46;
        v40 -= v46;
        uint64_t v37 = v54;
        if (!v49) {
          goto LABEL_52;
        }
      }
      else
      {
        ++v36;
        *(_DWORD *)(v38 + 4 * v36) = v41;
      }
      if (v36 == 2)
      {
        if (v61 < v40) {
          goto LABEL_52;
        }
        uint64_t v51 = 0;
        uint64_t v52 = v61 - v40 + 40;
        *(void *)v58 = v52;
        *(_DWORD *)uint64_t v37 = bswap32(v52);
        *(int8x8_t *)(v37 + 4) = vrev32_s8(*(int8x8_t *)(v37 + 4));
        char v24 = v59;
        char v22 = v56;
        uint64_t v23 = v57;
        do
        {
          *(_DWORD *)(v37 + 28 + v51) = bswap32(*(_DWORD *)(v37 + 28 + v51));
          v51 += 4;
        }
        while (v51 != 12);
        uint64_t v18 = 0;
        goto LABEL_49;
      }
    }
  }
  __break(1u);
LABEL_54:
  __break(0x5500u);
  return result;
}

uint64_t sub_21813217C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void (*a8)(const char *, ...), uint64_t a9)
{
  return sub_218131B84(a1, a2, a3, a4, a5, a6, a7, 1, a8, a9);
}

uint64_t sub_2181321A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void (*a8)(const char *, ...), uint64_t a9)
{
  return sub_218131B84(a1, a2, a3, a4, a5, a6, a7, 2, a8, a9);
}

uint64_t sub_2181321D4(unint64_t a1, _DWORD *a2)
{
  if (!HIDWORD(a1))
  {
    unsigned int v2 = a1 - 44;
    if (a1 >= 0x2C && *a2 == a1)
    {
      uint64_t v3 = 0;
      unsigned int v4 = 0;
      uint64_t result = -1;
      while (a2[v3 + 7] == v4 && (a2[v3 + 7] & 3) == 0)
      {
        unsigned int v7 = a2[v3 + 8];
        if (v7 < v4) {
          break;
        }
        if (v4 > v2 || v7 > v2) {
          return result;
        }
        BOOL v8 = __CFADD__(v4, v7 - v4);
        unsigned int v4 = a2[v3 + 8];
        if (v8)
        {
          __break(0x5500u);
          return result;
        }
        if (++v3 == 3)
        {
          if (v7 != v2) {
            return -1;
          }
          return *(unsigned int *)((char *)a2 + a2[8] + 44);
        }
      }
    }
  }
  return -1;
}

uint64_t sub_218132268(unint64_t a1, _DWORD *a2, size_t *a3, void *a4)
{
  size_t v7 = sub_2181321D4(a1, a2);
  if (v7 == -1 || v7 > *a3) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v7;
  memcpy(a4, (char *)a2 + a2[8] + 48, v7);
  return 0;
}

unint64_t sub_2181322D8(unint64_t result, unint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(result + 16) + 8);
  unint64_t v3 = a2 / v2 + 1;
  if (a2 / v2 == -1)
  {
    __break(0x5500u);
  }
  else if (is_mul_ok(v3, v2))
  {
    return v3 * v2;
  }
  __break(0x550Cu);
  return result;
}

uint64_t sub_218132308(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 16) + 8) >= 0xFFFFFFFFFFFFFFF0
    || (((void (*)(void))MEMORY[0x270FA5388])(),
        bzero((char *)v6 - v2, v2),
        uint64_t v3 = cccbc_set_iv(),
        **(void **)(a1 + 16) >= 0xFFFFFFFFFFFFFFF0))
  {
    __break(0x5500u);
  }
  MEMORY[0x270FA5388](v3);
  bzero((char *)v6 - v4, v4);
  cccbc_init();
  return ccpad_pkcs7_encrypt();
}

uint64_t sub_218132458(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 24) + 8) >= 0xFFFFFFFFFFFFFFF0
    || (MEMORY[0x270FA5388](a1),
        bzero((char *)v6 - v2, v2),
        uint64_t v3 = cccbc_set_iv(),
        **(void **)(a1 + 24) >= 0xFFFFFFFFFFFFFFF0))
  {
    __break(0x5500u);
  }
  MEMORY[0x270FA5388](v3);
  bzero((char *)v6 - v4, v4);
  cccbc_init();
  return ccpad_pkcs7_decrypt();
}

uint64_t sub_2181325A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v35[1] = a6;
  v35[3] = *MEMORY[0x263EF8340];
  BOOL v8 = malloc_type_malloc(0x40uLL, 0x9E25B47AuLL);
  (**(void (***)(void))a1)();
  uint64_t v9 = sub_218132308(a1);
  uint64_t v10 = *(void *)(a1 + 8);
  unint64_t v11 = *(void *)(v10 + 8);
  unint64_t v12 = v11 + 8;
  if (v11 >= 0xFFFFFFFFFFFFFFF8) {
    goto LABEL_19;
  }
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = __CFADD__(v12, v13);
  uint64_t v15 = v12 + v13;
  if (v14) {
    goto LABEL_19;
  }
  BOOL v14 = __CFADD__(v15, 4);
  uint64_t v16 = v15 + 4;
  if (v14) {
    goto LABEL_19;
  }
  BOOL v14 = __CFADD__(v16, 8);
  uint64_t v17 = v16 + 8;
  if (v14) {
    goto LABEL_19;
  }
  unint64_t v18 = (v17 - 1) & 0xFFFFFFFFFFFFFFF8;
  BOOL v14 = __CFADD__(v18, v11);
  unint64_t v19 = v18 + v11;
  if (v14) {
    goto LABEL_19;
  }
  if (v19 >= 0xFFFFFFFFFFFFFFF8) {
    goto LABEL_19;
  }
  MEMORY[0x270FA5388](v9);
  bzero((char *)v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
  cchmac_init();
  cchmac_update();
  cchmac_update();
  cchmac_final();
  uint64_t v21 = *(void *)(a1 + 8);
  unint64_t v22 = *(void *)(v21 + 8);
  unint64_t v23 = v22 + 8;
  if (v22 >= 0xFFFFFFFFFFFFFFF8) {
    goto LABEL_19;
  }
  uint64_t v24 = *(void *)(v21 + 16);
  BOOL v14 = __CFADD__(v23, v24);
  uint64_t v25 = v23 + v24;
  if (v14) {
    goto LABEL_19;
  }
  BOOL v14 = __CFADD__(v25, 4);
  uint64_t v26 = v25 + 4;
  if (v14) {
    goto LABEL_19;
  }
  BOOL v14 = __CFADD__(v26, 8);
  uint64_t v27 = v26 + 8;
  if (v14 || __CFADD__((v27 - 1) & 0xFFFFFFFFFFFFFFF8, v22)) {
    goto LABEL_19;
  }
  cc_clear();
  if (*a2 >> 61) {
    goto LABEL_20;
  }
  uint64_t v28 = 8 * *a2;
  BOOL v14 = __CFADD__(v28, 8);
  uint64_t v29 = v28 + 8;
  if (v14) {
    goto LABEL_19;
  }
  unint64_t v30 = (v29 - 1) & 0xFFFFFFFFFFFFFFF8;
  if (!is_mul_ok(v30, 3uLL)) {
    goto LABEL_20;
  }
  uint64_t v31 = 3 * v30;
  BOOL v14 = __CFADD__(v31, 40);
  uint64_t v32 = v31 + 40;
  if (v14)
  {
LABEL_19:
    __break(0x5500u);
LABEL_20:
    __break(0x550Cu);
  }
  v35[2] = v32;
  ccsha1_di();
  uint64_t v33 = ccrsa_encrypt_oaep();
  if (v8)
  {
    cc_clear();
    free(v8);
  }
  return v33;
}

uint64_t sub_21813282C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v32[0] = a7;
  v32[1] = a8;
  v32[3] = *MEMORY[0x263EF8340];
  v32[2] = 256;
  uint64_t v9 = malloc_type_malloc(0x100uLL, 0x4D5841B9uLL);
  uint64_t v10 = malloc_type_malloc(**(void **)(a1 + 8), 0xEEDFFF2DuLL);
  uint64_t v11 = *(void *)(a1 + 8);
  unint64_t v12 = *(void *)(v11 + 8);
  unint64_t v13 = v12 + 8;
  if (v12 >= 0xFFFFFFFFFFFFFFF8) {
    goto LABEL_21;
  }
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = __CFADD__(v13, v14);
  uint64_t v16 = v13 + v14;
  if (v15) {
    goto LABEL_21;
  }
  BOOL v15 = __CFADD__(v16, 4);
  uint64_t v17 = v16 + 4;
  if (v15) {
    goto LABEL_21;
  }
  BOOL v15 = __CFADD__(v17, 8);
  uint64_t v18 = v17 + 8;
  if (v15) {
    goto LABEL_21;
  }
  unint64_t v19 = (v18 - 1) & 0xFFFFFFFFFFFFFFF8;
  BOOL v15 = __CFADD__(v19, v12);
  unint64_t v20 = v19 + v12;
  if (v15 || v20 >= 0xFFFFFFFFFFFFFFF8) {
    goto LABEL_21;
  }
  uint64_t v21 = v10;
  MEMORY[0x270FA5388](v10);
  bzero((char *)v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
  ccsha1_di();
  if (ccrsa_decrypt_oaep()) {
    goto LABEL_14;
  }
  cchmac_init();
  cchmac_update();
  cchmac_update();
  cchmac_final();
  uint64_t v23 = *(void *)(a1 + 8);
  unint64_t v24 = *(void *)(v23 + 8);
  unint64_t v25 = v24 + 8;
  if (v24 >= 0xFFFFFFFFFFFFFFF8
    || (v26 = *(void *)(v23 + 16), BOOL v15 = __CFADD__(v25, v26), v27 = v25 + v26, v15)
    || (BOOL v15 = __CFADD__(v27, 4), v28 = v27 + 4, v15)
    || (BOOL v15 = __CFADD__(v28, 8), v29 = v28 + 8, v15)
    || __CFADD__((v29 - 1) & 0xFFFFFFFFFFFFFFF8, v24))
  {
LABEL_21:
    __break(0x5500u);
  }
  cc_clear();
  if (cc_cmp_safe())
  {
LABEL_14:
    uint64_t v30 = -1;
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v30 = sub_218132458(a1);
  if (v9)
  {
LABEL_15:
    cc_clear();
    free(v9);
  }
LABEL_16:
  if (v21)
  {
    cc_clear();
    free(v21);
  }
  return v30;
}

uint64_t sub_218132AA8(unsigned int a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int a9, uint64_t a10, int a11, int a12, unsigned int a13, uint64_t a14, unsigned int *a15, uint64_t a16)
{
  uint64_t v16 = 0;
  uint64_t v17 = a16;
  v35[12] = *MEMORY[0x263EF8340];
  *(void *)(a16 + 4) = 160;
  *(_DWORD *)(a16 + 12) = a11;
  v35[0] = a1;
  v35[1] = a2;
  v35[2] = a7;
  v35[3] = a8;
  void v35[4] = a9;
  v35[5] = a10;
  v35[6] = a13;
  v35[7] = a14;
  v35[8] = a3;
  v35[9] = a4;
  v35[10] = a5;
  v35[11] = a6;
  uint64_t v18 = a16 + 20;
  uint64_t v19 = a16 + 48;
  unsigned int v20 = *a15;
  unsigned int v21 = *a15;
  *(void *)(a16 + 16) = 10;
  do
  {
    if (((16 * v16) | 8uLL) > 0x60 || (unint64_t)(16 * v16) > 0x5F)
    {
      __break(1u);
LABEL_21:
      __break(0x5500u);
LABEL_22:
      __break(0x5515u);
    }
    uint64_t v22 = *(unsigned int *)(v18 + 4 * v16);
    uint64_t v23 = (unsigned int *)&v35[2 * v16];
    unint64_t v24 = (const void *)*((void *)v23 + 1);
    if (v24)
    {
      size_t v25 = *v23;
      if (v25 >= 0xFFFFFFFD) {
        goto LABEL_21;
      }
      unsigned int v26 = (v25 + 3) & 0xFFFFFFFC;
      if (v26 < v25) {
        return 0;
      }
      unsigned int v27 = v26 + 4;
      if (v26 >= 0xFFFFFFFC) {
        goto LABEL_21;
      }
      if (v26 + 3 >= v21) {
        return 0;
      }
      uint64_t v28 = (_DWORD *)(v19 + v22);
      *(_DWORD *)(v19 + v22) = v25;
      memcpy((void *)(v19 + v22 + 4), v24, v25);
      _DWORD *v28 = bswap32(v25);
      int v29 = *(_DWORD *)(v18 + 4 * v16);
      BOOL v30 = __CFADD__(v27, v29);
      int v31 = v27 + v29;
      if (v30) {
        goto LABEL_21;
      }
      ++v16;
      *(_DWORD *)(v18 + 4 * v16) = v31;
      BOOL v30 = v21 >= v27;
      v21 -= v27;
      if (!v30) {
        goto LABEL_22;
      }
    }
    else
    {
      ++v16;
      *(_DWORD *)(v18 + 4 * v16) = v22;
    }
  }
  while (v16 != 6);
  if (v20 < v21) {
    goto LABEL_22;
  }
  uint64_t v32 = v20 - v21 + 48;
  *(void *)a15 = v32;
  *(_DWORD *)a16 = bswap32(v32);
  *(int8x16_t *)(a16 + 4) = vrev32q_s8(*(int8x16_t *)(a16 + 4));
  for (uint64_t i = 20; i != 48; i += 4)
    *(_DWORD *)(a16 + i) = bswap32(*(_DWORD *)(a16 + i));
  return v17;
}

uint64_t sub_218132CA0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t *a8)
{
  uint64_t v11 = malloc_type_malloc(0x10uLL, 0x23AB8765uLL);
  ccpbkdf2_hmac();
  unint64_t v12 = *a8;
  if (v12 < sub_2181322D8(a1, a6))
  {
    uint64_t v13 = 0xFFFFFFFFLL;
    if (!v11) {
      return v13;
    }
    goto LABEL_5;
  }
  sub_218132308(a1);
  uint64_t v13 = 0;
  if (v11)
  {
LABEL_5:
    cc_clear();
    free(v11);
  }
  return v13;
}

unint64_t sub_218132D98(uint64_t a1, unint64_t a2)
{
  unint64_t result = a2 + 5;
  if (a2 >= 0xFFFFFFFFFFFFFFFBLL
    || !(result % *(void *)(*(void *)(a1 + 16) + 8)) && (BOOL v4 = __CFADD__(result, 1), result = a2 + 6, v4))
  {
    __break(0x5500u);
  }
  return result;
}

uint64_t sub_218132DC8(uint64_t a1, unint64_t a2, const void *a3, unint64_t *a4, unsigned char *a5)
{
  unint64_t v9 = sub_218132D98(a1, a2);
  if (*a4 < v9) {
    return 0xFFFFFFFFLL;
  }
  *a4 = v9;
  *a5 = 0;
  a5[1] = BYTE3(a2);
  a5[2] = BYTE2(a2);
  a5[3] = BYTE1(a2);
  a5[4] = a2;
  memcpy(a5 + 5, a3, a2);
  return 0;
}

uint64_t sub_218132E4C(uint64_t result, int a2, int a3, int a4, int a5, size_t a6, uint64_t a7, size_t *a8, void *__dst)
{
  if (!(a6 % *(void *)(*(void *)(result + 16) + 8)))
  {
    uint64_t v13 = result;
    uint64_t v14 = malloc_type_malloc(0x10uLL, 0x9795E4DAuLL);
    ccpbkdf2_hmac();
    BOOL v15 = malloc_type_malloc(a6, 0x7DAE3FEuLL);
    size_t v16 = sub_218132458(v13);
    if (v16 <= *a8)
    {
      size_t v17 = v16;
      memcpy(__dst, v15, v16);
      uint64_t v12 = 0;
      *a8 = v17;
      if (!v15) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v12 = 0xFFFFFFFFLL;
      if (!v15)
      {
LABEL_13:
        if (v14)
        {
          cc_clear();
          free(v14);
        }
        return v12;
      }
    }
    cc_clear();
    free(v15);
    goto LABEL_13;
  }
  if (a6 < 5 || *(unsigned char *)a7) {
    return 0xFFFFFFFFLL;
  }
  size_t v11 = bswap32(*(_DWORD *)(a7 + 1));
  if (v11 < 0xFFFFFFFB)
  {
    if ((v11 + 5) <= a6 && *a8 >= v11)
    {
      *a8 = v11;
      memcpy(__dst, (const void *)(a7 + 5), v11);
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  __break(0x5500u);
  return result;
}

uint64_t sub_218132FEC(uint64_t result, int a2, int a3, unint64_t a4, _DWORD *a5, size_t *a6, void *a7, size_t *a8, void *a9, size_t *a10, void *a11)
{
  size_t v52 = 0;
  size_t v53 = 256;
  if (HIDWORD(a4)) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v11 = a4 - 44;
  if (a4 < 0x2C || *a5 != a4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v18 = result;
  uint64_t v19 = 0;
  unsigned int v20 = 0;
  uint64_t v21 = 0xFFFFFFFFLL;
  do
  {
    if (a5[v19 + 7] != v20 || (a5[v19 + 7] & 3) != 0) {
      return 0xFFFFFFFFLL;
    }
    unsigned int v23 = a5[v19 + 8];
    if (v23 < v20) {
      return 0xFFFFFFFFLL;
    }
    if (v20 > v11 || v23 > v11) {
      return v21;
    }
    BOOL v24 = __CFADD__(v20, v23 - v20);
    unsigned int v20 = a5[v19 + 8];
    if (v24)
    {
      __break(0x5500u);
      goto LABEL_54;
    }
    ++v19;
  }
  while (v19 != 3);
  if (v23 != v11) {
    return 0xFFFFFFFFLL;
  }
  size_t v25 = a5 + 11;
  if (*(_DWORD *)((char *)a5 + a5[9] + 44) > 0x10000u) {
    return 0xFFFFFFFFLL;
  }
  int v48 = a5 + 11;
  size_t size = *(unsigned int *)((char *)a5 + a5[9] + 44);
  size_t v26 = *(unsigned int *)((char *)v25 + a5[8]);
  size_t v50 = *(unsigned int *)((char *)v25 + a5[7]);
  if (ccsrp_sizeof_M_HAMK() != v50 || *(void *)(*(void *)(v18 + 16) + 8) != v26) {
    return 0xFFFFFFFFLL;
  }
  size_t v44 = (int8x16_t *)malloc_type_malloc(size, 0x74C0BDFEuLL);
  unsigned int v45 = malloc_type_malloc(size, 0xD0BB8912uLL);
  __dst = malloc_type_malloc(v50, 0x652E0DABuLL);
  unsigned int v46 = malloc_type_malloc(v26, 0x37C4C7E4uLL);
  unsigned int v27 = (_DWORD *)((char *)v48 + a5[7]);
  if (v50 < *v27)
  {
    uint64_t v28 = 0;
    uint64_t v21 = 0xFFFFFFFFLL;
    goto LABEL_25;
  }
  memcpy(__dst, v27 + 1, *v27);
  int v29 = (_DWORD *)((char *)v48 + a5[8]);
  size_t v30 = *v29;
  if (v26 < v30)
  {
    uint64_t v28 = 0;
    uint64_t v21 = 0xFFFFFFFFLL;
    goto LABEL_25;
  }
  memcpy(v46, v29 + 1, v30);
  uint64_t v32 = (_DWORD *)((char *)v48 + a5[9]);
  size_t v33 = *v32;
  if (size >= v33)
  {
    memcpy(v45, v32 + 1, v33);
    int v31 = __dst;
    if (!ccsrp_client_verify_session())
    {
      uint64_t v28 = 0;
      uint64_t v21 = 0xFFFFFFFFLL;
      goto LABEL_26;
    }
    sub_218131B1C(*(void *)(v18 + 48));
    ccsrp_get_session_key_length();
    unint64_t v34 = sub_218132458(v18);
    unint64_t result = sub_218133470(v34, v44);
    if (!result) {
      goto LABEL_45;
    }
    uint64_t v51 = 0;
    if (size >= 0x24)
    {
      uint64_t v35 = size & 0xFFFFFFFC;
      if (v35 != 36 && v35 != 32)
      {
        unsigned __int32 v37 = v44[2].u32[0];
        unsigned __int32 v36 = v44[2].u32[1];
        size_t v38 = v36 - v37;
        if (v36 >= v37)
        {
          size_t v52 = v36 - v37;
          if (v38 <= 0x10000)
          {
            uint64_t v39 = malloc_type_malloc(0x100uLL, 0x706C6499uLL);
            unsigned int v40 = malloc_type_malloc(v38, 0x4FFC4171uLL);
            uint64_t v41 = v39;
            uint64_t v42 = v39;
            uint64_t v43 = (uint64_t)v40;
            if (sub_218133594((unsigned int *)v44, &v53, v42, &v51, &v52, v40, a8, a9, a10, a11)) {
              uint64_t v21 = sub_218132E4C(v18, a2, a3, 64, (int)v41, v52, v43, a6, a7);
            }
            else {
              uint64_t v21 = 0xFFFFFFFFLL;
            }
            if (v41)
            {
              cc_clear();
              free(v41);
            }
            int v31 = __dst;
            uint64_t v28 = (void *)v43;
            goto LABEL_26;
          }
LABEL_45:
          uint64_t v28 = 0;
          uint64_t v21 = 0xFFFFFFFFLL;
          int v31 = __dst;
          goto LABEL_26;
        }
LABEL_55:
        __break(0x5515u);
        return result;
      }
    }
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  uint64_t v28 = 0;
  uint64_t v21 = 0xFFFFFFFFLL;
LABEL_25:
  int v31 = __dst;
LABEL_26:
  if (v45)
  {
    cc_clear();
    free(v45);
  }
  if (v44)
  {
    cc_clear();
    free(v44);
  }
  if (v28)
  {
    cc_clear();
    free(v28);
  }
  if (v31)
  {
    cc_clear();
    free(v31);
  }
  if (v46)
  {
    cc_clear();
    free(v46);
  }
  return v21;
}

BOOL sub_218133470(unint64_t a1, int8x16_t *a2)
{
  if (a1 < 0x30) {
    return 0;
  }
  unsigned int v3 = a1;
  uint64_t v4 = 0;
  int8x16_t v5 = vrev32q_s8(*a2);
  *a2 = v5;
  a2[1].i32[0] = bswap32(a2[1].u32[0]);
  do
  {
    a2[1].i32[v4 + 1] = bswap32(a2[1].u32[v4 + 1]);
    ++v4;
  }
  while (v4 != 7);
  BOOL result = 0;
  if (v3 >= 0x30 && v5.i32[0] == v3)
  {
    uint64_t v6 = 0;
    unsigned __int32 v7 = 0;
    unsigned __int32 v8 = v5.i32[0] - 48;
    while (a2[1].i32[v6 + 1] == v7 && (a2[1].i32[v6 + 1] & 3) == 0)
    {
      unsigned __int32 v10 = a2[1].u32[v6 + 2];
      if (v10 < v7) {
        break;
      }
      BOOL result = 0;
      if (v7 > v8 || v10 > v8) {
        return result;
      }
      BOOL v11 = __CFADD__(v7, v10 - v7);
      unsigned __int32 v7 = a2[1].u32[v6 + 2];
      if (v11)
      {
LABEL_30:
        __break(0x5500u);
LABEL_31:
        __break(0x5515u);
        return result;
      }
      if (++v6 == 6)
      {
        if (v10 != v8) {
          return 0;
        }
        uint64_t v12 = 0;
        uint64_t v13 = a2 + 3;
        do
        {
          BOOL result = v12 == 6;
          if (v12 == 6) {
            break;
          }
          uint64_t v14 = a2[1].u32[v12 + 1];
          unsigned int v15 = a2[1].u32[v12 + 2];
          unsigned int v16 = v15 - v14;
          if (v15 < v14) {
            goto LABEL_31;
          }
          BOOL v11 = v16 >= 4;
          unsigned int v17 = v16 - 4;
          if (!v11) {
            break;
          }
          unsigned int v18 = bswap32(*(unsigned __int32 *)((char *)v13->u32 + v14));
          *(__int32 *)((char *)v13->i32 + v14) = v18;
          if (v18 >= 0xFFFFFFFD) {
            goto LABEL_30;
          }
          unsigned int v19 = (v18 + 3) & 0xFFFFFFFC;
          ++v12;
        }
        while (v19 >= v18 && v19 == v17);
        return result;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_218133594(unsigned int *a1, size_t *a2, void *__dst, void *a4, size_t *a5, void *a6, size_t *a7, void *a8, size_t *a9, void *__dsta)
{
  *a4 = a1[3];
  unsigned __int32 v10 = a1 + 12;
  BOOL v11 = (unsigned int *)((char *)a1 + a1[6] + 48);
  size_t v12 = *v11;
  if (*a2 < v12) {
    return 0;
  }
  *a2 = v12;
  memcpy(__dst, v11 + 1, v12);
  unsigned int v18 = (unsigned int *)((char *)v10 + a1[8]);
  size_t v19 = *v18;
  if (*a5 < v19) {
    return 0;
  }
  *a5 = v19;
  memcpy(a6, v18 + 1, v19);
  unsigned int v20 = (unsigned int *)((char *)v10 + a1[9]);
  size_t v21 = *v20;
  if (*a7 < v21) {
    return 0;
  }
  *a7 = v21;
  memcpy(a8, v20 + 1, v21);
  uint64_t v22 = (unsigned int *)((char *)v10 + a1[10]);
  size_t v23 = *v22;
  if (*a9 < v23) {
    return 0;
  }
  *a9 = v23;
  memcpy(__dsta, v22 + 1, v23);
  return 1;
}

unint64_t sub_218133694(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _DWORD *a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12)
{
  if (!HIDWORD(a4))
  {
    unsigned int v12 = a4 - 64;
    if (a4 >= 0x40 && *a5 == a4)
    {
      uint64_t v16 = 0;
      unsigned int v17 = 0;
      unint64_t result = a12;
      do
      {
        if (a5[v16 + 11] != v17 || (a5[v16 + 11] & 3) != 0) {
          return 0xFFFFFFFFLL;
        }
        unsigned int v20 = a5[v16 + 12];
        if (v20 < v17 || v17 > v12 || v20 > v12) {
          return 0xFFFFFFFFLL;
        }
        BOOL v21 = __CFADD__(v17, v20 - v17);
        unsigned int v17 = a5[v16 + 12];
        if (v21) {
          goto LABEL_50;
        }
        ++v16;
      }
      while (v16 != 4);
      if (v20 != v12) {
        return 0xFFFFFFFFLL;
      }
      unsigned int v23 = a5[14];
      unsigned int v22 = a5[15];
      if (v22 < v23) {
        goto LABEL_51;
      }
      size_t v24 = *(unsigned int *)((char *)a5 + a5[13] + 64);
      size_t v52 = *(unsigned int *)((char *)a5 + a5[12] + 64);
      if (v24 <= 0x10000)
      {
        unint64_t v49 = v22 - v23;
        size_t v50 = a5 + 16;
        size_t v51 = *(unsigned int *)((char *)a5 + a5[11] + 64);
        size_t v25 = v51;
        if (ccsrp_sizeof_M_HAMK() == v25)
        {
          unsigned int size = v24;
          if (*(void *)(*(void *)(a1 + 16) + 8) == v52 && v49 <= 0x100)
          {
            size_t v44 = malloc_type_malloc(v24, 0xF5C22E46uLL);
            unsigned int v45 = malloc_type_malloc(v24, 0xE85C4225uLL);
            size_t v26 = malloc_type_malloc(v51, 0xF03E6E24uLL);
            unsigned int v46 = v26;
            __dst = malloc_type_malloc(v52, 0x646B3B67uLL);
            unsigned int v27 = (_DWORD *)((char *)v50 + a5[11]);
            size_t v28 = *v27;
            if (v51 < v28
              || (memcpy(v26, v27 + 1, v28),
                  int v29 = (_DWORD *)((char *)v50 + a5[12]),
                  v52 < *v29)
              || (memcpy(__dst, v29 + 1, *v29),
                  size_t v30 = (_DWORD *)((char *)v50 + a5[13]),
                  size_t v31 = *v30,
                  size < v31))
            {
              uint64_t v32 = __dst;
              size_t v33 = v44;
              unint64_t v34 = v45;
LABEL_27:
              if (v34)
              {
                cc_clear();
                free(v34);
              }
              if (v33)
              {
                cc_clear();
                free(v33);
              }
              if (v46)
              {
                cc_clear();
                free(v46);
              }
              if (v32)
              {
                cc_clear();
                free(v32);
              }
              return 0xFFFFFFFFLL;
            }
            unint64_t v34 = v45;
            memcpy(v45, v30 + 1, v31);
            if (!ccsrp_client_verify_session())
            {
              uint64_t v32 = __dst;
              size_t v33 = v44;
              goto LABEL_27;
            }
            unint64_t result = ccrsa_import_pub_n();
            if (!result)
            {
LABEL_49:
              uint64_t v32 = __dst;
              size_t v33 = v44;
              unint64_t v34 = v45;
              goto LABEL_27;
            }
            if (result >> 61) {
              goto LABEL_52;
            }
            if (8 * result >= 0xFFFFFFFFFFFFFFF8) {
              goto LABEL_50;
            }
            unint64_t v35 = (8 * result + 7) & 0xFFFFFFFFFFFFFFF8;
            if (is_mul_ok(v35, 3uLL))
            {
              unint64_t v36 = 3 * v35;
              unint64_t v37 = v36 + 40;
              if (v36 >= 0xFFFFFFFFFFFFFFD8) {
                goto LABEL_50;
              }
              unint64_t v43 = result;
              unint64_t result = (unint64_t)malloc_type_malloc(v36 + 40, 0x280CB78AuLL);
              if (!v37)
              {
LABEL_53:
                __break(1u);
                return result;
              }
              size_t v38 = (void *)result;
              *(void *)unint64_t result = v43;
              unint64_t result = ccrsa_import_pub();
              if (a6 < v49) {
                goto LABEL_51;
              }
              ccsha256_di();
              ccdigest();
              unint64_t result = ccrsa_verify_pkcs1v15();
              if (*v38 >> 61) {
                goto LABEL_52;
              }
              uint64_t v39 = 8 * *v38;
              BOOL v21 = __CFADD__(v39, 8);
              uint64_t v40 = v39 + 8;
              if (v21)
              {
LABEL_50:
                __break(0x5500u);
LABEL_51:
                __break(0x5515u);
                goto LABEL_52;
              }
              unint64_t v41 = (v40 - 1) & 0xFFFFFFFFFFFFFFF8;
              if (is_mul_ok(v41, 3uLL))
              {
                unint64_t v42 = 3 * v41;
                unint64_t result = v42 + 40;
                if (v42 < 0xFFFFFFFFFFFFFFD8)
                {
                  cc_clear();
                  free(v38);
                  goto LABEL_49;
                }
                goto LABEL_50;
              }
            }
LABEL_52:
            __break(0x550Cu);
            goto LABEL_53;
          }
        }
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_218133CD4(uint64_t result, int a2, int a3, unint64_t a4, _DWORD *a5, size_t *a6, void *a7, size_t *a8, void *a9, size_t *a10, void *a11)
{
  if (HIDWORD(a4)) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v11 = a4 - 60;
  if (a4 < 0x3C || *a5 != a4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v18 = result;
  uint64_t v19 = 0;
  unsigned int v20 = 0;
  uint64_t v21 = 0xFFFFFFFFLL;
  do
  {
    if (a5[v19 + 11] != v20 || (a5[v19 + 11] & 3) != 0) {
      return 0xFFFFFFFFLL;
    }
    unsigned int v23 = a5[v19 + 12];
    if (v23 < v20) {
      return 0xFFFFFFFFLL;
    }
    if (v20 > v11 || v23 > v11) {
      return v21;
    }
    BOOL v24 = __CFADD__(v20, v23 - v20);
    unsigned int v20 = a5[v19 + 12];
    if (v24)
    {
      __break(0x5500u);
      goto LABEL_58;
    }
    ++v19;
  }
  while (v19 != 3);
  if (v23 != v11) {
    return 0xFFFFFFFFLL;
  }
  size_t v25 = a5 + 15;
  unint64_t v26 = *(unsigned int *)((char *)a5 + a5[13] + 60);
  if (v26 < 0x10) {
    goto LABEL_58;
  }
  size_t v27 = *(unsigned int *)((char *)v25 + a5[11]);
  size_t v28 = *(unsigned int *)((char *)v25 + a5[12]);
  size_t v49 = 0;
  v50[0] = 0;
  if (v26 > 0x10000) {
    return 0xFFFFFFFFLL;
  }
  size_t v45 = v26;
  size_t v46 = v28;
  size_t size = v26 - 16;
  size_t v47 = v27;
  if (ccsrp_sizeof_M_HAMK() != v27 || *(void *)(*(void *)(v18 + 16) + 8) != v46) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v40 = (int8x16_t *)malloc_type_malloc(size, 0x200FDF81uLL);
  unint64_t v41 = malloc_type_malloc(v45, 0x2C0378D2uLL);
  __dst = malloc_type_malloc(v47, 0xC075FD6BuLL);
  unint64_t v42 = malloc_type_malloc(v46, 0xD7EE0444uLL);
  int v29 = (_DWORD *)((char *)v25 + a5[11]);
  if (v47 < *v29)
  {
    size_t v30 = 0;
    uint64_t v21 = 0xFFFFFFFFLL;
    size_t v31 = v42;
    goto LABEL_41;
  }
  memcpy(__dst, v29 + 1, *v29);
  uint64_t v32 = (_DWORD *)((char *)v25 + a5[12]);
  if (v46 < *v32)
  {
    size_t v30 = 0;
    uint64_t v21 = 0xFFFFFFFFLL;
    size_t v31 = v42;
    goto LABEL_41;
  }
  memcpy(v42, v32 + 1, *v32);
  size_t v33 = (_DWORD *)((char *)v25 + a5[13]);
  unint64_t v34 = *v33;
  if (v45 < v34)
  {
    size_t v30 = 0;
    uint64_t v21 = 0xFFFFFFFFLL;
    goto LABEL_40;
  }
  memcpy(v41, v33 + 1, *v33);
  if (!ccsrp_client_verify_session())
  {
    size_t v30 = 0;
    uint64_t v21 = 0xFFFFFFFFLL;
LABEL_40:
    size_t v31 = v42;
    goto LABEL_41;
  }
  sub_218131B1C(*(void *)(v18 + 48));
  unint64_t result = ccsrp_get_session_key_length();
  if (v34 < 0x10) {
    goto LABEL_58;
  }
  size_t v31 = v42;
  if (ccgcm_one_shot())
  {
    size_t v30 = 0;
    uint64_t v21 = 0xFFFFFFFFLL;
    goto LABEL_41;
  }
  unint64_t result = sub_218133470(size, v40);
  if (!result)
  {
LABEL_39:
    size_t v30 = 0;
    uint64_t v21 = 0xFFFFFFFFLL;
    goto LABEL_40;
  }
  v50[0] = 256;
  uint64_t v48 = 0;
  if (size < 0x24 || (size & 0xFFFFFFFFFFFFFFFCLL) == 0x24 || (size & 0xFFFFFFFFFFFFFFFCLL) == 0x20) {
    goto LABEL_59;
  }
  unsigned __int32 v36 = v40[2].u32[0];
  unsigned __int32 v35 = v40[2].u32[1];
  size_t v37 = v35 - v36;
  if (v35 < v36)
  {
LABEL_58:
    __break(0x5515u);
LABEL_59:
    __break(1u);
    return result;
  }
  size_t v49 = v35 - v36;
  if (v37 > 0x10000) {
    goto LABEL_39;
  }
  size_t v38 = malloc_type_malloc(0x100uLL, 0x9EF96BD7uLL);
  uint64_t v39 = malloc_type_malloc(v37, 0xE402B3B3uLL);
  if (sub_218133594((unsigned int *)v40, v50, v38, &v48, &v49, v39, a8, a9, a10, a11)) {
    uint64_t v21 = sub_218132E4C(v18, a2, a3, 64, (int)v38, v49, (uint64_t)v39, a6, a7);
  }
  else {
    uint64_t v21 = 0xFFFFFFFFLL;
  }
  if (v38)
  {
    cc_clear();
    free(v38);
  }
  size_t v31 = v42;
  size_t v30 = v39;
LABEL_41:
  if (v41)
  {
    cc_clear();
    free(v41);
  }
  if (v40)
  {
    cc_clear();
    free(v40);
  }
  if (v30)
  {
    cc_clear();
    free(v30);
  }
  if (__dst)
  {
    cc_clear();
    free(__dst);
  }
  if (v31)
  {
    cc_clear();
    free(v31);
  }
  return v21;
}

unint64_t sub_218134178(unint64_t result, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  if (result < 0xFFFFFFFD
    && a2 < 0xFFFFFFFD
    && a3 < 0xFFFFFFFD
    && a4 < 0xFFFFFFFD
    && a5 < 0xFFFFFFFD
    && a6 < 0xFFFFFFFD)
  {
    return ((result + 3) & 0xFFFFFFFC)
         + (unint64_t)((a2 + 3) & 0xFFFFFFFC)
         + ((a3 + 3) & 0xFFFFFFFC)
         + (unint64_t)((a4 + 3) & 0xFFFFFFFC)
         + ((a5 + 3) & 0xFFFFFFFC)
         + (unint64_t)((a6 + 3) & 0xFFFFFFFC)
         + 72;
  }
  __break(0x5500u);
  return result;
}

unint64_t sub_2181341E0(unint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  unsigned int v11 = sub_218132D98(a1, a3);

  return sub_218134268(a1, a2, v11, a4, a5, a6);
}

unint64_t sub_218134268(unint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  unsigned int v12 = sub_218131A4C(a1);
  unint64_t v13 = sub_218134178(a2, a4, a5, a6, v12, a3);
  unint64_t v14 = sub_2181322D8(a1, v13);
  unint64_t result = ccrsa_import_pub_n();
  if (!result) {
    return result;
  }
  unint64_t v16 = result;
  if (result >> 61) {
    goto LABEL_15;
  }
  if (8 * result >= 0xFFFFFFFFFFFFFFF8) {
    goto LABEL_16;
  }
  unint64_t v17 = (8 * result + 7) & 0xFFFFFFFFFFFFFFF8;
  if (!is_mul_ok(v17, 3uLL))
  {
LABEL_15:
    __break(0x550Cu);
    goto LABEL_16;
  }
  unint64_t v18 = 3 * v17;
  unint64_t v19 = v18 + 40;
  if (v18 >= 0xFFFFFFFFFFFFFFD8) {
    goto LABEL_16;
  }
  unint64_t result = (unint64_t)malloc_type_malloc(v18 + 40, 0x653CBD54uLL);
  if (!v19)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  unsigned int v20 = (void *)result;
  *(void *)unint64_t result = v16;
  ccrsa_import_pub();
  unint64_t result = ccrsa_block_size();
  if (*v20 >> 61) {
    goto LABEL_15;
  }
  uint64_t v21 = 8 * *v20;
  BOOL v22 = __CFADD__(v21, 8);
  uint64_t v23 = v21 + 8;
  if (v22)
  {
LABEL_16:
    __break(0x5500u);
    goto LABEL_17;
  }
  unint64_t v24 = (v23 - 1) & 0xFFFFFFFFFFFFFFF8;
  if (!is_mul_ok(v24, 3uLL)) {
    goto LABEL_15;
  }
  unsigned int v25 = result;
  unint64_t v26 = 3 * v24;
  unint64_t result = v26 + 40;
  if (v26 >= 0xFFFFFFFFFFFFFFD8) {
    goto LABEL_16;
  }
  cc_clear();
  free(v20);
  uint64_t v27 = **(void **)(a1 + 8);
  uint64_t v28 = *(void *)(*(void *)(a1 + 16) + 8);

  return sub_218135D0C(v14, v27, v28, v25, v27, v27);
}

unint64_t sub_218134408(unint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, unsigned int a5)
{
  unsigned int v9 = sub_2181322D8(a1, a3);

  return sub_218134268(a1, a2, v9, a4, a5, 0x40u);
}

uint64_t sub_218134484(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, const void *a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, uint64_t a11, unsigned int a12, uint64_t a13, void *a14, int a15, uint64_t a16, uint64_t a17)
{
  unint64_t v28 = sub_218132D98(a1, a4);
  unsigned int v25 = malloc_type_malloc(v28, 0x5D56AC73uLL);
  if (!sub_218132DC8(a1, a4, a5, &v28, v25))
  {
    uint64_t v26 = sub_21813459C(a1, a2, a3, v28, (uint64_t)v25, a6, a7, a10, a11, a8, a9, a12, a13, a14, a15, a16, a17);
    if (!v25) {
      return v26;
    }
    goto LABEL_3;
  }
  uint64_t v26 = 0xFFFFFFFFLL;
  if (v25)
  {
LABEL_3:
    cc_clear();
    free(v25);
  }
  return v26;
}

uint64_t sub_21813459C(unint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, uint64_t a11, unsigned int a12, uint64_t a13, void *a14, int a15, uint64_t a16, uint64_t a17)
{
  v65[10] = *MEMORY[0x263EF8340];
  unsigned int v23 = sub_218131A4C(a1);
  unint64_t v64 = sub_218134178(a2, a6, a10, a8, v23, a4);
  v63 = malloc_type_malloc(v64, 0x6BFB72DBuLL);
  unint64_t v24 = (void *)sub_218132AA8(a2, a3, a6, a7, a10, a11, a8, a9, a12, a13, a15, 0, a4, a5, (unsigned int *)&v64, (uint64_t)v63);
  if (!v24)
  {
    int v60 = 0;
    v62 = 0;
    __src = 0;
    unint64_t v28 = 0;
    goto LABEL_5;
  }
  size_t v25 = sub_2181322D8(a1, v64);
  size_t v26 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v27 = ccrsa_block_size();
  unint64_t v28 = malloc_type_malloc(v25, 0xE64807E1uLL);
  int v29 = malloc_type_malloc(v26, 0x6BB27AFuLL);
  size_t v30 = malloc_type_malloc(v27, 0x87745FEDuLL);
  size_t v31 = malloc_type_malloc(**(void **)(a1 + 8), 0x670A48C2uLL);
  (**(void (***)(void))a1)();
  __src = v29;
  int v60 = v31;
  v62 = v30;
  if (sub_2181325A8(a1, a14, v64, (uint64_t)v24, (uint64_t)v29, (uint64_t)v30))
  {
    unint64_t v24 = 0;
LABEL_5:
    uint64_t v32 = 0xFFFFFFFFLL;
    goto LABEL_6;
  }
  ccdigest();
  unint64_t v24 = malloc_type_malloc(**(void **)(a1 + 8), 0x49EEF5A5uLL);
  size_t v34 = MEMORY[0x21D463000](a14);
  unsigned __int32 v35 = malloc_type_malloc(v34, 0x203CDBB3uLL);
  ccrsa_export_pub();
  v57 = v35;
  ccdigest();
  unsigned int v36 = sub_218135D0C(v25, **(void **)(a1 + 8), v26, v27, **(void **)(a1 + 8), **(void **)(a1 + 8));
  unsigned int v37 = v26 + v25;
  if (__CFADD__(v26, v25)) {
    goto LABEL_43;
  }
  unsigned int v38 = v36;
  unsigned int v39 = **(_DWORD **)(a1 + 8);
  uint64_t v40 = (char *)malloc_type_malloc(v26 + v25, 0x7D6C09EEuLL);
  memcpy(v40, __src, v26);
  memcpy(&v40[v26], v28, v25);
  uint64_t v41 = 0;
  *(_OWORD *)a16 = xmmword_218141C10;
  *(void *)(a16 + 16) = 0xA00000000;
  v65[0] = v39;
  v65[1] = v60;
  v56 = v40;
  v65[2] = v37;
  v65[3] = v40;
  v65[4] = v27;
  v65[5] = v62;
  v65[6] = v39;
  v65[7] = v24;
  v65[8] = v39;
  v65[9] = a17;
  *(_DWORD *)(a16 + 24) = 0;
  uint64_t v42 = a16 + 24;
  uint64_t v43 = a16 + 48;
  unsigned int v44 = v38;
  do
  {
    if (((16 * v41) | 8uLL) > 0x50 || (unint64_t)(16 * v41) > 0x4F)
    {
      __break(1u);
LABEL_43:
      __break(0x5500u);
LABEL_44:
      __break(0x5515u);
    }
    uint64_t v45 = *(unsigned int *)(v42 + 4 * v41);
    size_t v46 = (unsigned int *)&v65[2 * v41];
    size_t v47 = (const void *)*((void *)v46 + 1);
    if (v47)
    {
      size_t v48 = *v46;
      if (v48 >= 0xFFFFFFFD) {
        goto LABEL_43;
      }
      unsigned int v49 = (v48 + 3) & 0xFFFFFFFC;
      if (v49 < v48) {
        goto LABEL_37;
      }
      unsigned int v50 = v49 + 4;
      if (v49 >= 0xFFFFFFFC) {
        goto LABEL_43;
      }
      if (v49 + 3 >= v44)
      {
LABEL_37:
        uint64_t v32 = 0xFFFFFFFFLL;
        goto LABEL_38;
      }
      size_t v51 = (_DWORD *)(v43 + v45);
      *(_DWORD *)(v43 + v45) = v48;
      memcpy((void *)(v43 + v45 + 4), v47, v48);
      *size_t v51 = bswap32(v48);
      int v52 = *(_DWORD *)(v42 + 4 * v41);
      BOOL v53 = __CFADD__(v50, v52);
      int v54 = v50 + v52;
      if (v53) {
        goto LABEL_43;
      }
      ++v41;
      *(_DWORD *)(v42 + 4 * v41) = v54;
      BOOL v53 = v44 >= v50;
      v44 -= v50;
      if (!v53) {
        goto LABEL_44;
      }
    }
    else
    {
      ++v41;
      *(_DWORD *)(v42 + 4 * v41) = v45;
    }
  }
  while (v41 != 5);
  if (v38 < v44) {
    goto LABEL_44;
  }
  uint64_t v55 = 0;
  *(_DWORD *)a16 = bswap32(v38 - v44 + 48);
  *(int8x16_t *)(a16 + 4) = vrev32q_s8(*(int8x16_t *)(a16 + 4));
  *(_DWORD *)(a16 + 20) = bswap32(*(_DWORD *)(a16 + 20));
  do
  {
    *(_DWORD *)(a16 + 24 + v55) = bswap32(*(_DWORD *)(a16 + 24 + v55));
    v55 += 4;
  }
  while (v55 != 24);
  uint64_t v32 = 0;
LABEL_38:
  if (v56)
  {
    cc_clear();
    free(v56);
  }
  if (v57)
  {
    cc_clear();
    free(v57);
  }
LABEL_6:
  if (v24)
  {
    cc_clear();
    free(v24);
  }
  if (v60)
  {
    cc_clear();
    free(v60);
  }
  if (v62)
  {
    cc_clear();
    free(v62);
  }
  if (__src)
  {
    cc_clear();
    free(__src);
  }
  if (v28)
  {
    cc_clear();
    free(v28);
  }
  if (v63)
  {
    cc_clear();
    free(v63);
  }
  return v32;
}

uint64_t sub_218134B00(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14)
{
  unint64_t v19 = malloc_type_malloc(0x40uLL, 0x2CC00C69uLL);
  size_t v20 = sub_218131A4C(a1);
  uint64_t v21 = malloc_type_malloc(v20, 0xB6C5DB0EuLL);
  ccsrp_generate_salt_and_verification();
  unsigned int v22 = sub_218131A4C(a1);
  uint64_t v23 = sub_218134C58(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0x40u, (uint64_t)v19, v22, (uint64_t)v21, a12, 10000, a13, a14);
  sub_218131A4C(a1);
  if (v21)
  {
    cc_clear();
    free(v21);
  }
  if (v19)
  {
    cc_clear();
    free(v19);
  }
  return v23;
}

uint64_t sub_218134C58(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, uint64_t a11, unsigned int a12, uint64_t a13, unsigned int a14, uint64_t a15, void *a16, int a17, uint64_t a18, uint64_t a19)
{
  unint64_t v30 = sub_2181322D8(a1, a6);
  uint64_t v27 = malloc_type_malloc(v30, 0x3733EE92uLL);
  if (!sub_218132CA0(a1, a4, a5, 64, a13, a6, a7, &v30))
  {
    uint64_t v28 = sub_21813459C(a1, a2, a3, v30, (uint64_t)v27, a8, a9, a12, a13, a10, a11, a14, a15, a16, a17, a18, a19);
    if (!v27) {
      return v28;
    }
    goto LABEL_3;
  }
  uint64_t v28 = 0xFFFFFFFFLL;
  if (v27)
  {
LABEL_3:
    cc_clear();
    free(v27);
  }
  return v28;
}

uint64_t sub_218134D84(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return MEMORY[0x270ED8E20](a1[6], *a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_218134DAC()
{
  return ccsrp_server_verify_session();
}

uint64_t sub_218134DC8(unint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, uint64_t a7, _DWORD *a8, uint64_t a9)
{
  v38[7] = *MEMORY[0x263EF8340];
  size_t v12 = *(void *)(*(void *)(a1 + 16) + 8);
  unint64_t v13 = malloc_type_malloc(v12, 0xFCFC226DuLL);
  (**(void (***)(void))a1)();
  size_t v14 = sub_2181322D8(a1, a6);
  unsigned int v15 = malloc_type_malloc(v14, 0x5796B476uLL);
  sub_218132308(a1);
  uint64_t v16 = 0;
  *(void *)(a9 + 4) = 164;
  v38[0] = a4;
  v38[1] = a5;
  v38[2] = v12;
  void v38[3] = v13;
  v38[4] = v14;
  unsigned int v37 = v15;
  v38[5] = v15;
  uint64_t v17 = a9 + 44;
  *(_DWORD *)(a9 + 28) = 0;
  uint64_t v18 = a9 + 28;
  size_t v33 = a8;
  unsigned int v19 = *a8;
  unsigned int v34 = *a8;
  while (1)
  {
    if (((16 * v16) | 8uLL) > 0x30 || (unint64_t)(16 * v16) > 0x2F)
    {
      __break(1u);
LABEL_23:
      __break(0x5500u);
      goto LABEL_24;
    }
    uint64_t v20 = *(unsigned int *)(v18 + 4 * v16);
    uint64_t v21 = (unsigned int *)&v38[2 * v16];
    unsigned int v22 = (const void *)*((void *)v21 + 1);
    if (v22) {
      break;
    }
    ++v16;
    *(_DWORD *)(v18 + 4 * v16) = v20;
LABEL_13:
    if (v16 == 3)
    {
      if (v34 >= v19)
      {
        uint64_t v30 = 0;
        uint64_t v31 = v34 - v19 + 44;
        void *v33 = v31;
        *(_DWORD *)a9 = bswap32(v31);
        *(int8x8_t *)(a9 + 4) = vrev32_s8(*(int8x8_t *)(a9 + 4));
        *(int8x16_t *)(a9 + 28) = vrev32q_s8(*(int8x16_t *)(a9 + 28));
        goto LABEL_17;
      }
LABEL_24:
      __break(0x5515u);
    }
  }
  size_t v23 = *v21;
  if (v23 >= 0xFFFFFFFD) {
    goto LABEL_23;
  }
  unsigned int v24 = (v23 + 3) & 0xFFFFFFFC;
  if (v24 >= v23)
  {
    unsigned int v25 = v24 + 4;
    if (v24 >= 0xFFFFFFFC) {
      goto LABEL_23;
    }
    if (v24 + 3 < v19)
    {
      size_t v26 = (_DWORD *)(v17 + v20);
      *(_DWORD *)(v17 + v20) = v23;
      memcpy((void *)(v17 + v20 + 4), v22, v23);
      _DWORD *v26 = bswap32(v23);
      int v27 = *(_DWORD *)(v18 + 4 * v16);
      BOOL v28 = __CFADD__(v25, v27);
      int v29 = v25 + v27;
      if (v28) {
        goto LABEL_23;
      }
      ++v16;
      *(_DWORD *)(v18 + 4 * v16) = v29;
      BOOL v28 = v19 >= v25;
      v19 -= v25;
      if (!v28) {
        goto LABEL_24;
      }
      goto LABEL_13;
    }
  }
  uint64_t v30 = 0xFFFFFFFFLL;
LABEL_17:
  if (v13)
  {
    cc_clear();
    free(v13);
  }
  if (v37)
  {
    cc_clear();
    free(v37);
  }
  return v30;
}

uint64_t sub_218135050(uint64_t a1, uint64_t a2)
{
  uint64_t result = ccsrp_get_session_key_length();
  int v4 = *(_DWORD *)(a2 + *(unsigned int *)(a2 + 28) + 44);
  BOOL v5 = __CFADD__(v4, 3);
  int v6 = v4 + 3;
  if (!v5 && result < 0xFFFFFFFD) {
    return ((result + 3) & 0xFFFFFFFC) + (unint64_t)(v6 & 0xFFFFFFFC) + 48;
  }
  __break(0x5500u);
  return result;
}

uint64_t sub_2181350A8(unint64_t a1, uint64_t a2)
{
  if (a1 < 0x30) {
    return 1;
  }
  unsigned int v3 = a1;
  uint64_t v4 = 0;
  int8x16_t v5 = vrev32q_s8(*(int8x16_t *)a2);
  *(int8x16_t *)a2 = v5;
  *(int8x8_t *)(a2 + 16) = vrev32_s8(*(int8x8_t *)(a2 + 16));
  do
  {
    *(_DWORD *)(a2 + 24 + v4) = bswap32(*(_DWORD *)(a2 + 24 + v4));
    v4 += 4;
  }
  while (v4 != 24);
  uint64_t result = 0xFFFFFFFFLL;
  if (v3 >= 0x30 && v5.i32[0] == v3)
  {
    uint64_t v6 = 0;
    unsigned __int32 v7 = 0;
    unsigned __int32 v8 = v5.i32[0] - 48;
    do
    {
      if (*(_DWORD *)(a2 + v6 + 24) != v7 || (*(_DWORD *)(a2 + v6 + 24) & 3) != 0) {
        return 0xFFFFFFFFLL;
      }
      unsigned __int32 v10 = *(_DWORD *)(a2 + v6 + 28);
      if (v10 < v7) {
        return 0xFFFFFFFFLL;
      }
      if (v7 > v8 || v10 > v8) {
        return result;
      }
      BOOL v11 = __CFADD__(v7, v10 - v7);
      unsigned __int32 v7 = *(_DWORD *)(a2 + v6 + 28);
      if (v11)
      {
LABEL_32:
        __break(0x5500u);
LABEL_33:
        __break(0x5515u);
        return result;
      }
      v6 += 4;
    }
    while (v6 != 20);
    if (v10 != v8) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v12 = 0;
    uint64_t v13 = a2 + 48;
    uint64_t result = 0xFFFFFFFFLL;
    while (v12 != 20)
    {
      uint64_t v14 = *(unsigned int *)(a2 + v12 + 24);
      unsigned int v15 = *(_DWORD *)(a2 + v12 + 28);
      unsigned int v16 = v15 - v14;
      if (v15 < v14) {
        goto LABEL_33;
      }
      BOOL v11 = v16 >= 4;
      unsigned int v17 = v16 - 4;
      if (!v11) {
        return 0xFFFFFFFFLL;
      }
      unsigned int v18 = bswap32(*(_DWORD *)(v13 + v14));
      *(_DWORD *)(v13 + v14) = v18;
      if (v18 >= 0xFFFFFFFD) {
        goto LABEL_32;
      }
      unsigned int v19 = (v18 + 3) & 0xFFFFFFFC;
      v12 += 4;
      if (v19 < v18 || v19 != v17) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_2181351D8(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  int8x16_t v5 = a2 + 12;
  size_t v6 = *(unsigned int *)((char *)a2 + a2[6] + 48);
  if (**(void **)(a1 + 8) != v6) {
    return 0xFFFFFFFFLL;
  }
  size_t v8 = *(unsigned int *)((char *)v5 + a2[7]);
  uint64_t v9 = 0xFFFFFFFFLL;
  if (v8 > 0x10000) {
    return v9;
  }
  size_t v10 = *(unsigned int *)((char *)v5 + a2[8]);
  if (v10 > 0x10000) {
    return v9;
  }
  size_t v12 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v13 = malloc_type_malloc(v6, 0xF60C95EuLL);
  uint64_t v14 = (char *)malloc_type_malloc(v8, 0x57CC9E92uLL);
  size_t __len = v12;
  __dst = malloc_type_malloc(v12, 0x6E2CD6DAuLL);
  unsigned int v29 = v10;
  uint64_t v30 = malloc_type_malloc(v10, 0x3A8B005uLL);
  unsigned int v15 = (unsigned int *)((char *)v5 + a2[6]);
  size_t v16 = *v15;
  if (v6 < v16)
  {
    uint64_t v9 = 0xFFFFFFFFLL;
    unsigned int v17 = v13;
    goto LABEL_12;
  }
  memcpy(v13, v15 + 1, v16);
  unsigned int v18 = (unsigned int *)((char *)v5 + a2[7]);
  unint64_t v19 = *v18;
  if (v8 < v19)
  {
LABEL_11:
    uint64_t v9 = 0xFFFFFFFFLL;
    unsigned int v17 = v13;
LABEL_12:
    if (!v17)
    {
LABEL_14:
      if (v14)
      {
        cc_clear();
        free(v14);
      }
      if (__dst)
      {
        cc_clear();
        free(__dst);
      }
      if (v30)
      {
        cc_clear();
        free(v30);
      }
      return v9;
    }
LABEL_13:
    cc_clear();
    free(v17);
    goto LABEL_14;
  }
  uint64_t result = (uint64_t)memcpy(v14, v18 + 1, *v18);
  size_t v21 = v19 - __len;
  if (v19 < __len)
  {
    __break(0x5515u);
  }
  else
  {
    uint64_t result = (uint64_t)memmove(__dst, v14, __len);
    if (!__CFADD__(v14, __len))
    {
      memmove(v14, &v14[__len], v21);
      unsigned int v22 = (unsigned int *)((char *)v5 + a2[8]);
      uint64_t v23 = *v22;
      if (v29 >= v23)
      {
        memcpy(v30, v22 + 1, *v22);
        uint64_t v24 = a1;
        unsigned int v17 = v13;
        uint64_t v25 = sub_21813282C(v24, a5, (uint64_t)v13, (uint64_t)__dst, v23, (uint64_t)v30, v21, (uint64_t)v14);
        if (v25 < 0)
        {
          uint64_t v9 = 0xFFFFFFFFLL;
        }
        else
        {
          uint64_t v9 = 0;
          *a3 = v25;
        }
        if (!v13) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  __break(0x5500u);
  return result;
}

uint64_t sub_218135464(unsigned int *a1, size_t *a2, void *__dst, size_t *a4, void *a5, size_t *a6, void *a7, size_t *a8, void *a9, size_t *a10, void *__dsta, void *a12, size_t *a13, void *a14)
{
  *a12 = a1[3];
  uint64_t v14 = a1 + 12;
  unsigned int v15 = (unsigned int *)((char *)a1 + a1[5] + 48);
  size_t v16 = *v15;
  if (*a2 < v16) {
    return 0;
  }
  *a2 = v16;
  memcpy(__dst, v15 + 1, v16);
  uint64_t v23 = (unsigned int *)((char *)v14 + a1[9]);
  size_t v24 = *v23;
  if (*a4 < v24) {
    return 0;
  }
  *a4 = v24;
  memcpy(a5, v23 + 1, v24);
  uint64_t v25 = (unsigned int *)((char *)v14 + a1[10]);
  size_t v26 = *v25;
  if (*a6 < v26) {
    return 0;
  }
  *a6 = v26;
  memcpy(a7, v25 + 1, v26);
  int v27 = (unsigned int *)((char *)v14 + a1[6]);
  size_t v28 = *v27;
  if (*a8 < v28) {
    return 0;
  }
  *a8 = v28;
  memcpy(a9, v27 + 1, v28);
  unsigned int v29 = (unsigned int *)((char *)v14 + a1[7]);
  size_t v30 = *v29;
  if (*a10 < v30) {
    return 0;
  }
  *a10 = v30;
  memcpy(__dsta, v29 + 1, v30);
  uint64_t v31 = (unsigned int *)((char *)v14 + a1[8]);
  size_t v32 = *v31;
  if (*a13 < v32) {
    return 0;
  }
  *a13 = v32;
  memcpy(a14, v31 + 1, v32);
  return 1;
}

uint64_t sub_2181355C4(uint64_t a1, _OWORD *a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int *a9, uint64_t a10)
{
  v27[7] = *MEMORY[0x263EF8340];
  *(void *)(a10 + 4) = 164;
  if (a1 == 16)
  {
    uint64_t v10 = 0;
    *(_OWORD *)(a10 + 12) = *a2;
    v27[0] = a3;
    v27[1] = a4;
    v27[2] = a5;
    v27[3] = a6;
    v27[4] = a7;
    v27[5] = a8;
    *(_DWORD *)(a10 + 28) = 0;
    uint64_t v11 = a10 + 28;
    uint64_t v12 = a10 + 44;
    unsigned int v13 = *a9;
    unsigned int v14 = *a9;
    while (((16 * v10) | 8uLL) <= 0x30 && (unint64_t)(16 * v10) <= 0x2F)
    {
      uint64_t v15 = *(unsigned int *)(v11 + 4 * v10);
      size_t v16 = (unsigned int *)&v27[2 * v10];
      unsigned int v17 = (const void *)*((void *)v16 + 1);
      if (v17)
      {
        size_t v18 = *v16;
        if (v18 >= 0xFFFFFFFD) {
          goto LABEL_20;
        }
        unsigned int v19 = (v18 + 3) & 0xFFFFFFFC;
        if (v19 < v18) {
          return 0;
        }
        unsigned int v20 = v19 + 4;
        if (v19 >= 0xFFFFFFFC) {
          goto LABEL_20;
        }
        if (v19 + 3 >= v14) {
          return 0;
        }
        size_t v21 = (_DWORD *)(v12 + v15);
        *(_DWORD *)(v12 + v15) = v18;
        memcpy((void *)(v12 + v15 + 4), v17, v18);
        _DWORD *v21 = bswap32(v18);
        int v22 = *(_DWORD *)(v11 + 4 * v10);
        BOOL v23 = __CFADD__(v20, v22);
        int v24 = v20 + v22;
        if (v23) {
          goto LABEL_20;
        }
        ++v10;
        *(_DWORD *)(v11 + 4 * v10) = v24;
        BOOL v23 = v14 >= v20;
        v14 -= v20;
        if (!v23) {
          goto LABEL_21;
        }
      }
      else
      {
        ++v10;
        *(_DWORD *)(v11 + 4 * v10) = v15;
      }
      if (v10 == 3)
      {
        if (v13 >= v14)
        {
          uint64_t v25 = v13 - v14 + 44;
          *(void *)a9 = v25;
          *(_DWORD *)a10 = bswap32(v25);
          *(int8x8_t *)(a10 + 4) = vrev32_s8(*(int8x8_t *)(a10 + 4));
          *(int8x16_t *)(a10 + 28) = vrev32q_s8(*(int8x16_t *)(a10 + 28));
          return 1;
        }
LABEL_21:
        __break(0x5515u);
      }
    }
    __break(1u);
LABEL_20:
    __break(0x5500u);
    goto LABEL_21;
  }
  return 0;
}

unint64_t sub_218135788(unint64_t result, unsigned int a2, unsigned int a3)
{
  if (result < 0xFFFFFFFD && a2 < 0xFFFFFFFD && a3 < 0xFFFFFFFD) {
    return ((result + 3) & 0xFFFFFFFC)
  }
         + (unint64_t)((a2 + 3) & 0xFFFFFFFC)
         + ((a3 + 3) & 0xFFFFFFFC)
         + 56;
  __break(0x5500u);
  return result;
}

BOOL sub_2181357C0(unint64_t a1, uint64_t a2)
{
  if (a1 < 0x2C) {
    return 0;
  }
  unsigned int v3 = a1;
  BOOL result = 0;
  int8x8_t v4 = vrev32_s8(*(int8x8_t *)a2);
  *(int8x8_t *)a2 = v4;
  *(_DWORD *)(a2 + 8) = bswap32(*(_DWORD *)(a2 + 8));
  *(int8x16_t *)(a2 + 28) = vrev32q_s8(*(int8x16_t *)(a2 + 28));
  if (v3 >= 0x2C && v4.i32[0] == v3)
  {
    uint64_t v5 = 0;
    unsigned __int32 v6 = 0;
    unsigned __int32 v7 = v4.i32[0] - 44;
    while (*(_DWORD *)(a2 + v5 + 28) == v6 && (*(_DWORD *)(a2 + v5 + 28) & 3) == 0)
    {
      unsigned __int32 v9 = *(_DWORD *)(a2 + v5 + 32);
      if (v9 < v6) {
        break;
      }
      BOOL result = 0;
      if (v6 > v7 || v9 > v7) {
        return result;
      }
      BOOL v10 = __CFADD__(v6, v9 - v6);
      unsigned __int32 v6 = *(_DWORD *)(a2 + v5 + 32);
      if (v10)
      {
LABEL_28:
        __break(0x5500u);
LABEL_29:
        __break(0x5515u);
        return result;
      }
      v5 += 4;
      if (v5 == 12)
      {
        if (v9 != v7) {
          return 0;
        }
        uint64_t v11 = 0;
        uint64_t v12 = a2 + 44;
        do
        {
          BOOL result = v11 == 12;
          if (v11 == 12) {
            break;
          }
          uint64_t v13 = *(unsigned int *)(a2 + v11 + 28);
          unsigned int v14 = *(_DWORD *)(a2 + v11 + 32);
          unsigned int v15 = v14 - v13;
          if (v14 < v13) {
            goto LABEL_29;
          }
          BOOL v10 = v15 >= 4;
          unsigned int v16 = v15 - 4;
          if (!v10) {
            break;
          }
          unsigned int v17 = bswap32(*(_DWORD *)(v12 + v13));
          *(_DWORD *)(v12 + v13) = v17;
          if (v17 >= 0xFFFFFFFD) {
            goto LABEL_28;
          }
          unsigned int v18 = (v17 + 3) & 0xFFFFFFFC;
          v11 += 4;
        }
        while (v18 >= v17 && v18 == v16);
        return result;
      }
    }
    return 0;
  }
  return result;
}

BOOL sub_2181358D0(unint64_t a1, int8x8_t *a2)
{
  if (a1 < 0x28) {
    return 0;
  }
  unsigned int v3 = a1;
  uint64_t v4 = 0;
  int8x8_t v5 = vrev32_s8(*a2);
  *a2 = v5;
  a2[1].i32[0] = bswap32(a2[1].u32[0]);
  do
  {
    a2[3].i32[v4 + 1] = bswap32(a2[3].u32[v4 + 1]);
    ++v4;
  }
  while (v4 != 3);
  BOOL result = 0;
  if (v3 >= 0x28 && v5.i32[0] == v3)
  {
    uint64_t v6 = 0;
    unsigned __int32 v7 = 0;
    unsigned __int32 v8 = v5.i32[0] - 40;
    while (a2[3].i32[v6 + 1] == v7 && (a2[3].i32[v6 + 1] & 3) == 0)
    {
      unsigned __int32 v10 = a2[4].u32[v6];
      if (v10 < v7) {
        break;
      }
      BOOL result = 0;
      if (v7 > v8 || v10 > v8) {
        return result;
      }
      BOOL v11 = __CFADD__(v7, v10 - v7);
      unsigned __int32 v7 = a2[4].u32[v6];
      if (v11)
      {
LABEL_30:
        __break(0x5500u);
LABEL_31:
        __break(0x5515u);
        return result;
      }
      if (++v6 == 2)
      {
        if (v10 != v8) {
          return 0;
        }
        uint64_t v12 = 0;
        uint64_t v13 = a2 + 5;
        do
        {
          BOOL result = v12 == 2;
          if (v12 == 2) {
            break;
          }
          uint64_t v14 = a2[3].u32[v12 + 1];
          unsigned int v15 = a2[4].u32[v12];
          unsigned int v16 = v15 - v14;
          if (v15 < v14) {
            goto LABEL_31;
          }
          BOOL v11 = v16 >= 4;
          unsigned int v17 = v16 - 4;
          if (!v11) {
            break;
          }
          unsigned int v18 = bswap32(*(unsigned __int32 *)((char *)v13->u32 + v14));
          *(__int32 *)((char *)v13->i32 + v14) = v18;
          if (v18 >= 0xFFFFFFFD) {
            goto LABEL_30;
          }
          unsigned int v19 = (v18 + 3) & 0xFFFFFFFC;
          ++v12;
        }
        while (v19 >= v18 && v19 == v17);
        return result;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_2181359F4(uint64_t a1, size_t *a2, void *__dst, void *a4, _OWORD *a5, size_t *a6, void *a7)
{
  if (*a4 < 0x10uLL) {
    return 0;
  }
  *a4 = 16;
  *a5 = *(_OWORD *)(a1 + 12);
  uint64_t v8 = a1 + 40;
  unsigned __int32 v9 = (unsigned int *)(a1 + 40 + *(unsigned int *)(a1 + 28));
  size_t v10 = *v9;
  if (*a2 < v10) {
    return 0;
  }
  *a2 = v10;
  memcpy(__dst, v9 + 1, v10);
  uint64_t v13 = (unsigned int *)(v8 + *(unsigned int *)(a1 + 32));
  size_t v14 = *v13;
  if (*a6 < v14) {
    return 0;
  }
  *a6 = v14;
  memcpy(a7, v13 + 1, v14);
  return 1;
}

BOOL sub_218135AA4(unint64_t a1, uint64_t a2)
{
  if (a1 < 0x40) {
    return 0;
  }
  unsigned int v3 = a1;
  uint64_t v4 = 0;
  int8x8_t v5 = vrev32_s8(*(int8x8_t *)a2);
  *(int8x8_t *)a2 = v5;
  *(_DWORD *)(a2 + 8) = bswap32(*(_DWORD *)(a2 + 8));
  *(int8x16_t *)(a2 + 28) = vrev32q_s8(*(int8x16_t *)(a2 + 28));
  do
  {
    *(_DWORD *)(a2 + 44 + v4) = bswap32(*(_DWORD *)(a2 + 44 + v4));
    v4 += 4;
  }
  while (v4 != 20);
  BOOL result = 0;
  if (v3 >= 0x40 && v5.i32[0] == v3)
  {
    uint64_t v6 = 0;
    unsigned __int32 v7 = 0;
    unsigned __int32 v8 = v5.i32[0] - 64;
    while (*(_DWORD *)(a2 + v6 + 44) == v7 && (*(_DWORD *)(a2 + v6 + 44) & 3) == 0)
    {
      unsigned __int32 v10 = *(_DWORD *)(a2 + v6 + 48);
      if (v10 < v7) {
        break;
      }
      BOOL result = 0;
      if (v7 > v8 || v10 > v8) {
        return result;
      }
      BOOL v11 = __CFADD__(v7, v10 - v7);
      unsigned __int32 v7 = *(_DWORD *)(a2 + v6 + 48);
      if (v11)
      {
LABEL_30:
        __break(0x5500u);
LABEL_31:
        __break(0x5515u);
        return result;
      }
      v6 += 4;
      if (v6 == 16)
      {
        if (v10 != v8) {
          return 0;
        }
        uint64_t v12 = 0;
        uint64_t v13 = a2 + 64;
        do
        {
          BOOL result = v12 == 12;
          if (v12 == 12) {
            break;
          }
          uint64_t v14 = *(unsigned int *)(a2 + v12 + 44);
          unsigned int v15 = *(_DWORD *)(a2 + v12 + 48);
          unsigned int v16 = v15 - v14;
          if (v15 < v14) {
            goto LABEL_31;
          }
          BOOL v11 = v16 >= 4;
          unsigned int v17 = v16 - 4;
          if (!v11) {
            break;
          }
          unsigned int v18 = bswap32(*(_DWORD *)(v13 + v14));
          *(_DWORD *)(v13 + v14) = v18;
          if (v18 >= 0xFFFFFFFD) {
            goto LABEL_30;
          }
          unsigned int v19 = (v18 + 3) & 0xFFFFFFFC;
          v12 += 4;
        }
        while (v19 >= v18 && v19 == v17);
        return result;
      }
    }
    return 0;
  }
  return result;
}

BOOL sub_218135BD4(unint64_t a1, uint64_t a2)
{
  if (a1 < 0x3C) {
    return 0;
  }
  unsigned int v3 = a1;
  BOOL result = 0;
  int8x8_t v4 = vrev32_s8(*(int8x8_t *)a2);
  *(int8x8_t *)a2 = v4;
  *(_DWORD *)(a2 + 8) = bswap32(*(_DWORD *)(a2 + 8));
  *(int8x16_t *)(a2 + 28) = vrev32q_s8(*(int8x16_t *)(a2 + 28));
  *(int8x16_t *)(a2 + 44) = vrev32q_s8(*(int8x16_t *)(a2 + 44));
  if (v3 >= 0x3C && v4.i32[0] == v3)
  {
    uint64_t v5 = 0;
    unsigned __int32 v6 = 0;
    unsigned __int32 v7 = v4.i32[0] - 60;
    while (*(_DWORD *)(a2 + v5 + 44) == v6 && (*(_DWORD *)(a2 + v5 + 44) & 3) == 0)
    {
      unsigned __int32 v9 = *(_DWORD *)(a2 + v5 + 48);
      if (v9 < v6) {
        break;
      }
      BOOL result = 0;
      if (v6 > v7 || v9 > v7) {
        return result;
      }
      BOOL v10 = __CFADD__(v6, v9 - v6);
      unsigned __int32 v6 = *(_DWORD *)(a2 + v5 + 48);
      if (v10)
      {
LABEL_28:
        __break(0x5500u);
LABEL_29:
        __break(0x5515u);
        return result;
      }
      v5 += 4;
      if (v5 == 12)
      {
        if (v9 != v7) {
          return 0;
        }
        uint64_t v11 = 0;
        uint64_t v12 = a2 + 60;
        do
        {
          BOOL result = v11 == 12;
          if (v11 == 12) {
            break;
          }
          uint64_t v13 = *(unsigned int *)(a2 + v11 + 44);
          unsigned int v14 = *(_DWORD *)(a2 + v11 + 48);
          unsigned int v15 = v14 - v13;
          if (v14 < v13) {
            goto LABEL_29;
          }
          BOOL v10 = v15 >= 4;
          unsigned int v16 = v15 - 4;
          if (!v10) {
            break;
          }
          unsigned int v17 = bswap32(*(_DWORD *)(v12 + v13));
          *(_DWORD *)(v12 + v13) = v17;
          if (v17 >= 0xFFFFFFFD) {
            goto LABEL_28;
          }
          unsigned int v18 = (v17 + 3) & 0xFFFFFFFC;
          v11 += 4;
        }
        while (v18 >= v17 && v18 == v16);
        return result;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_218135CF0(unint64_t a1, unsigned int *a2)
{
  if (a1 >= 8) {
    return bswap32(*a2);
  }
  else {
    return 0;
  }
}

unint64_t sub_218135D0C(unint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  int v6 = result + a3;
  if (!__CFADD__(result, a3))
  {
    BOOL v7 = __CFADD__(v6, 3);
    int v8 = v6 + 3;
    if (!v7 && a2 < 0xFFFFFFFD && a4 < 0xFFFFFFFD && a5 < 0xFFFFFFFD && a6 < 0xFFFFFFFD) {
      return ((a2 + 3) & 0xFFFFFFFC)
    }
           + (unint64_t)((a4 + 3) & 0xFFFFFFFC)
           + (v8 & 0xFFFFFFFC)
           + ((a5 + 3) & 0xFFFFFFFC)
           + (unint64_t)((a6 + 3) & 0xFFFFFFFC)
           + 68;
  }
  __break(0x5500u);
  return result;
}

uint64_t sub_218135F48(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = (int *)MEMORY[0x263F62298];
  int8x8_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    BOOL v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        BOOL v23 = objc_alloc_init(SecureBackupTermsInfo);
        objc_storeStrong((id *)(a1 + 16), v23);
        if (!PBReaderPlaceMark() || !SecureBackupTermsInfoReadFrom((uint64_t)v23, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_35:
        *(void *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_218136580()
{
  if (qword_267BC08B0 != -1) {
    dispatch_once(&qword_267BC08B0, &unk_26C91F188);
  }
  return byte_267BC08A8;
}

uint64_t sub_2181365C4()
{
  uint64_t result = SecIsInternalRelease();
  byte_267BC08A8 = result;
  return result;
}

BOOL sub_2181365E4(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFDictionaryRef v5 = a1;
  CFDictionaryRef v6 = a2;
  OSStatus v9 = SecItemUpdate(v5, v6);
  if (v9 == -25300)
  {
    unint64_t v10 = objc_msgSend_mutableCopy(v5, v7, v8);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    CFDictionaryRef v11 = v6;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v22, v26, 16);
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v11);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v11, v14, v18, (void)v22);
          objc_msgSend_setObject_forKeyedSubscript_(v10, v20, (uint64_t)v19, v18);
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v22, v26, 16);
      }
      while (v15);
    }

    OSStatus v9 = SecItemAdd((CFDictionaryRef)v10, 0);
  }
  if (a3 && v9)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, *MEMORY[0x263F08410], v9, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 == 0;
}

id CloudServicesLog()
{
  return (id)qword_26AC125A0;
}

void CloudServicesInitializeLogging(id obj)
{
}

id sub_218137554(unsigned int a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  int v9 = _os_feature_enabled_impl();
  char v10 = v9;
  if (a4)
  {
    if (v9) {
      sub_21813EEC0();
    }
    if (sub_218138B28(v8))
    {
      CFDictionaryRef v11 = &unk_26C9247B0;
LABEL_12:
      sub_218138B78(v11);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    }
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v15 = objc_alloc(MEMORY[0x263EFF8F8]);
    if ((a1 & 0xFFFFFFFE) == 2) {
      CFDataRef v17 = (const __CFData *)objc_msgSend_initWithBytes_length_(v15, v16, (uint64_t)&unk_218141C30, 981);
    }
    else {
      CFDataRef v17 = (const __CFData *)objc_msgSend_initWithBytes_length_(v15, v16, (uint64_t)&unk_218142005, 981);
    }
    id v18 = v17;
    if (v17)
    {
      SecCertificateRef v20 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v17);
      if (v20) {
        objc_msgSend_addObject_(v14, v19, (uint64_t)v20);
      }
    }
    long long v22 = (void *)SecCertificateCopyEscrowRoots();
    if (v22) {
      objc_msgSend_addObjectsFromArray_(v14, v21, (uint64_t)v22);
    }
    goto LABEL_25;
  }
  int v12 = sub_218138B28(v8);
  char v13 = v10 ^ 1;
  if ((a1 & 0xFFFFFFFE) == 2) {
    char v13 = 1;
  }
  if (v13)
  {
    if (v12)
    {
      CFDictionaryRef v11 = &unk_26C9247E0;
      goto LABEL_12;
    }
    id v18 = v7;
    if (a1 <= 7)
    {
      if (((1 << a1) & 0x33) != 0)
      {
        size_t v26 = (void *)SecCertificateCopyEscrowRoots();
LABEL_31:
        uint64_t v27 = CloudServicesLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218118000, v27, OS_LOG_TYPE_DEFAULT, "adding extra cert", buf, 2u);
        }

        size_t v30 = objc_msgSend_mutableCopy(v26, v28, v29);
        id v31 = objc_alloc(MEMORY[0x263EFF8F8]);
        CFDataRef v33 = (const __CFData *)objc_msgSend_initWithBytes_length_(v31, v32, (uint64_t)&unk_2181423DA, 981);
        if (v33)
        {
          SecCertificateRef v34 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v33);
          if (v34)
          {
            unsigned int v36 = v34;
            objc_msgSend_addObject_(v30, v35, (uint64_t)v34);
          }
          else
          {
            unsigned int v37 = CloudServicesLog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v45 = 0;
              _os_log_impl(&dword_218118000, v37, OS_LOG_TYPE_DEFAULT, "failed to create SecCertificate", v45, 2u);
            }

            unsigned int v36 = 0;
          }
        }
        else
        {
          unsigned int v36 = CloudServicesLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)unsigned int v44 = 0;
            _os_log_impl(&dword_218118000, v36, OS_LOG_TYPE_DEFAULT, "failed to create cert data", v44, 2u);
          }
        }

        if (v30)
        {
          if (_os_feature_enabled_impl())
          {
            id v38 = v30;
            size_t v30 = v38;
          }
          else
          {
            unsigned int v39 = CloudServicesLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v42 = 0;
              _os_log_impl(&dword_218118000, v39, OS_LOG_TYPE_DEFAULT, "dropping extra cert, feature is disabled", v42, 2u);
            }

            id v38 = v26;
            size_t v26 = v38;
          }
          goto LABEL_52;
        }
LABEL_51:
        id v38 = v26;
        size_t v26 = v38;
        size_t v30 = 0;
LABEL_52:
        id v14 = v38;

        goto LABEL_53;
      }
      if (((1 << a1) & 0xC0) != 0)
      {
        size_t v26 = (void *)SecCertificateCopyEscrowRoots();
        if (!sub_218138920(v18))
        {
          uint64_t v40 = CloudServicesLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v43 = 0;
            _os_log_impl(&dword_218118000, v40, OS_LOG_TYPE_DEFAULT, "skipping extra cert because terms were not accepted", v43, 2u);
          }

          goto LABEL_51;
        }
        goto LABEL_31;
      }
    }
    size_t v26 = (void *)SecCertificateCopyEscrowRoots();
    goto LABEL_51;
  }
  if (v12)
  {
    CFDictionaryRef v11 = &unk_26C9247C8;
    goto LABEL_12;
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v23 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v18 = (id)objc_msgSend_initWithBytes_length_(v23, v24, (uint64_t)&unk_218142005, 981);
  if (v18)
  {
    long long v22 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFDataRef)v18);
    if (v22) {
      objc_msgSend_addObject_(v14, v25, (uint64_t)v22);
    }
LABEL_25:
  }
LABEL_53:

LABEL_54:

  return v14;
}

BOOL sub_218138920(void *a1)
{
  id v1 = a1;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (v1)
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_218138D80;
    v7[3] = &unk_2643039F0;
    char v10 = &v11;
    id v8 = v1;
    unsigned int v3 = v2;
    int v9 = v3;
    objc_msgSend_fetchTermsWithAltDSID_reply_(CSCertOperations, v4, (uint64_t)v8, v7);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v5 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    unsigned int v3 = CloudServicesLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_21813EEF8(v3);
    }
    BOOL v5 = 0;
  }

  _Block_object_dispose(&v11, 8);
  return v5;
}

void sub_218138A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_218138B28(void *a1)
{
  id v1 = a1;
  if (sub_218136580()) {
    uint64_t v3 = objc_msgSend_isEqualToString_(v1, v2, @"PROD") ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id sub_218138B78(void *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v5 = objc_msgSend_count(v1, v3, v4);
  id v26 = (id)objc_msgSend_initWithCapacity_(v2, v6, v5);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v1;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v27, v33, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v15 = objc_alloc(NSURL);
        isDirectory = objc_msgSend_initFileURLWithPath_isDirectory_(v15, v16, v14, 0);
        id v18 = CloudServicesLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          size_t v32 = isDirectory;
          _os_log_impl(&dword_218118000, v18, OS_LOG_TYPE_DEFAULT, "cert URL = %@", buf, 0xCu);
        }

        if (isDirectory)
        {
          id v19 = objc_alloc(MEMORY[0x263EFF8F8]);
          CFDataRef v21 = (const __CFData *)objc_msgSend_initWithContentsOfURL_(v19, v20, (uint64_t)isDirectory);
          if (v21)
          {
            SecCertificateRef v23 = SecCertificateCreateWithData(v12, v21);
            if (v23) {
              objc_msgSend_addObject_(v26, v22, (uint64_t)v23);
            }
          }
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v24, (uint64_t)&v27, v33, 16);
    }
    while (v10);
  }

  return v26;
}

void sub_218138D80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (!a2 || v5)
  {
    CFAllocatorRef v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21813EF3C(a1, (uint64_t)v8, v12);
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend_firstObject(a2, v6, v7);
    CFAllocatorRef v12 = v9;
    if (v9)
    {
      uint64_t v13 = objc_msgSend_countryCode(v9, v10, v11);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend_isEqualToString_(v13, v14, @"CN");
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_21813A1AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21813A1D8(char *a1, ...)
{
  va_start(va, a1);
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = 0;
  if (vasprintf(&v4, a1, va) != -1 && v4 != 0)
  {
    id v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CFDictionaryRef v6 = v4;
      _os_log_impl(&dword_218118000, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    free(v4);
  }
  return 0;
}

uint64_t sub_21813A2B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21813A2C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = &a9;
  SecCertificateRef v23 = 0;
  if (vasprintf(&v23, a2, &a9) != -1 && v23 != 0)
  {
    id v14 = [NSString alloc];
    uint64_t v16 = objc_msgSend_initWithUTF8String_(v14, v15, (uint64_t)v23, &a9);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, *MEMORY[0x263F08320]);

    free(v23);
  }
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v18) {
    objc_msgSend_setObject_forKeyedSubscript_(v11, v12, v18, *MEMORY[0x263F08608]);
  }
  uint64_t v19 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v12, @"EscrowServiceErrorDomain", 102, v11, v22);
  uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
  CFDataRef v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

void sub_21813D104(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21813D120(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21813D148(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_21813D160(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_218118000, log, OS_LOG_TYPE_FAULT, "iCloudPassword must be a PET, not a raw password", v1, 2u);
}

void sub_21813D1A4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_218118000, log, OS_LOG_TYPE_FAULT, "rawPassword must not be a PET", v1, 2u);
}

void sub_21813D1E8(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "getAccountInfoWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D260()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  sub_218129D34();
  sub_218129D1C(&dword_218118000, v0, v1, "fetchStingrayAccountStatus remote proxy error: %@", v2);
}

void sub_21813D2CC(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "enableWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D344(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "recoverWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D3BC(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "recoverRecordContentsWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D434(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "createICDPRecord remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D4AC(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "disableWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D524(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "stashRecoveryDataWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D59C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "updateMetadata remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D614(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "cachePassphraseWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D68C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "uncachePassphraseWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D704(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "cacheRecoveryKeyWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D77C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "uncacheRecoveryKeyWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D7F4(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "startSMSChallengeWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D86C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "getCountrySMSCodesWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D8E4(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "changeSMSTargetWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D95C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "backupWithInfo remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813D9D4(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "backOffDateWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813DA4C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "setBackOffDateWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813DAC4(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "notificationInfoWithReply remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813DB3C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "stateCaptureWithReply remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813DBB4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup getAccountInfoWithError:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813DC30(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup updateMetadataWithError:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813DCAC(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "updateMetadataWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813DD24(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup enableWithError:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813DDA0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup recoverWithError:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813DE1C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup recoverWithCDPContext:escrowRecord:error:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813DE98(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "recoverWithCDPContext: remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813DF10(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup recoverSilentWithCDPContext:allRecords:error:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813DF8C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "recoverSilentWithCDPContextAndRecords: remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813E004(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup isRecoveryKeySet:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E080(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "isRecoveryKeySet: remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813E0F8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup restoreKeychainAsyncWithPassword:keybagDigest:haveBottledPeer:viewsNotToBeRestored:error:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E174(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "restoreKeychainAsyncWithPassword: remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813E1EC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup restoreKeychainWithBackupPassword:error:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E268(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "restoreKeychainWithBackupPassword: remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813E2E0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup verifyRecoveryKey:error:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E35C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "verifyRecoveryKey: remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813E3D4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup removeRecoveryKeyFromBackup:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E450(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "removeRecoveryKeyFromBackup: remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813E4C8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup disableWithError:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E544(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup startSMSChallengeWithError:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E5C0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup changeSMSTargetWithError:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E63C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup backupForRecoveryKeyWithInfo:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E6B8()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  sub_218129D34();
  sub_218129D1C(&dword_218118000, v0, v1, "backupForRecoveryKeyWithInfo remote proxy error: %@", v2);
}

void sub_21813E724(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup backupWithInfo:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E7A0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup prepareHSA2EscrowRecordContents:reply:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E81C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "prepareHSA2EscrowRecordContents remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813E894(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_218129D1C(&dword_218118000, a2, a3, "unknown passcode request state: %llu", (uint8_t *)&v4);
}

void sub_21813E908(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  int v4 = "+[SecureBackup daemonPasscodeRequestOpinion:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813E984(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "daemonPasscodeRequestOpinion remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813E9FC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[SecureBackup beginHSA2PasscodeRequest:uuid:reason:error:]";
  sub_218129D1C(&dword_218118000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
}

void sub_21813EA78(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "beginHSA2PasscodeRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813EAF0(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "getCertificatesWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813EB68(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "saveTermsAcceptance remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813EBE0(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "getAcceptedTermsForAltDSID remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813EC58(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "moveToFederationAllowed remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813ECD0(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  sub_218129D34();
  sub_218129CFC(&dword_218118000, v3, v4, "knownICDPFederations remote proxy error: %ld", v5, v6, v7, v8, v9);
}

void sub_21813ED48(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218118000, log, OS_LOG_TYPE_ERROR, "failed to archive metadata hash", v1, 2u);
}

void sub_21813ED8C()
{
  v0 = objc_opt_class();
  id v1 = sub_21812B74C(v0);
  sub_21812B770(&dword_218118000, v2, v3, "invalid type for key %@: %@", v4, v5, v6, v7, v8);
}

void sub_21813EE14(NSObject *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_218118000, a1, OS_LOG_TYPE_ERROR, "No code for POSIX error: %s (%d)", (uint8_t *)&v5, 0x12u);
}

void sub_21813EEC0()
{
}

void sub_21813EEDC()
{
}

void sub_21813EEF8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_218118000, log, OS_LOG_TYPE_ERROR, "terms requested with no altDSID", v1, 2u);
}

void sub_21813EF3C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138478083;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_218118000, log, OS_LOG_TYPE_ERROR, "failed to get terms for altDSID %{private}@: %@", (uint8_t *)&v4, 0x16u);
}

void sub_21813EFC8()
{
  sub_218129D34();
  sub_21813D104(&dword_218118000, v0, v1, "invalid request: %@", v2, v3, v4, v5, v6);
}

void sub_21813F030()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "derivePassword: no password metadata", v2, v3, v4, v5, v6);
}

void sub_21813F064()
{
  sub_218129D34();
  sub_21813D104(&dword_218118000, v0, v1, "AppleIDAuthSupportPBKDF2SRP failed: %@", v2, v3, v4, v5, v6);
}

void sub_21813F0CC(int *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  sub_21813D148(&dword_218118000, a2, a3, "bad reqVersion (%d) not in [0,2]", (uint8_t *)v4);
}

void sub_21813F140(void *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  objc_msgSend_length(a1, a2, a3);
  sub_218129D34();
  _os_log_error_impl(&dword_218118000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "srp recovery blob too large: %lu bytes", v4, 0xCu);
}

void sub_21813F1C8()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "failed to convert srp init response", v2, v3, v4, v5, v6);
}

void sub_21813F1FC()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "recoveryPassphrase not provided", v2, v3, v4, v5, v6);
}

void sub_21813F230()
{
  sub_218129D34();
  sub_21813D104(&dword_218118000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_21813F298(uint64_t a1, int a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *(_DWORD *)(a1 + 4) = a2;
  sub_21813D148(&dword_218118000, a3, (uint64_t)a3, "unknown reqVersion: %d", (uint8_t *)a1);
}

void sub_21813F2D8(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_218118000, log, OS_LOG_TYPE_ERROR, "srp_challenge_process failed: %d, %@", (uint8_t *)v4, 0x12u);
}

void sub_21813F368()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "can't process recovery blob with no username", v2, v3, v4, v5, v6);
}

void sub_21813F39C()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "username could not be converted to cstring", v2, v3, v4, v5, v6);
}

void sub_21813F3D0(void *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v5[0] = 67109120;
  v5[1] = objc_msgSend_reqVersion(a1, a2, a3);
  sub_21813D148(&dword_218118000, a2, v4, "unsupported reqVersion: %d", (uint8_t *)v5);
}

void sub_21813F454()
{
  sub_218129D34();
  sub_21813D104(&dword_218118000, v0, v1, "verifycert failed: %@", v2, v3, v4, v5, v6);
}

void sub_21813F4BC()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "ckvr_pack_srp_init_resp failed", v2, v3, v4, v5, v6);
}

void sub_21813F4F0()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "Server Start Fails (ckvr_srp_server_start_authentication)", v2, v3, v4, v5, v6);
}

void sub_21813F524()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "ckvr_cylon_process_blob failed", v2, v3, v4, v5, v6);
}

void sub_21813F558()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "ckvr_srp_server_verify_session failed", v2, v3, v4, v5, v6);
}

void sub_21813F58C()
{
  sub_21813D13C();
  sub_21813D120(&dword_218118000, v0, v1, "ckvr_unpack_clubh_recover_req_pkt failed", v2, v3, v4, v5, v6);
}

uint64_t AppleIDAuthSupportCreateVerifier()
{
  return MEMORY[0x270F0D5B0]();
}

uint64_t AppleIDAuthSupportPBKDF2SRP()
{
  return MEMORY[0x270F0D5B8]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x270ED7A80](bytes, count);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t SecCertificateCopyEscrowRoots()
{
  return MEMORY[0x270EFD728]();
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x270EFD780]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecIsInternalRelease()
{
  return MEMORY[0x270EFD968]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x270EFD9C8]();
}

SecPolicyRef SecPolicyCreateWithProperties(CFTypeRef policyIdentifier, CFDictionaryRef properties)
{
  return (SecPolicyRef)MEMORY[0x270EFDBC0](policyIdentifier, properties);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x270EFDD28](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x270EFDDA8](trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x270ED87D0]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x270ED87E0]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x270ED87E8]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x270ED8800]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x270ED8808]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x270ED8828]();
}

uint64_t cccbc_set_iv()
{
  return MEMORY[0x270ED8838]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x270ED89D8]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x270ED8A10]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x270ED8B88]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x270ED8BC8]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x270ED8BD0]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x270ED8BD8]();
}

uint64_t ccpad_pkcs7_decrypt()
{
  return MEMORY[0x270ED8C78]();
}

uint64_t ccpad_pkcs7_encrypt()
{
  return MEMORY[0x270ED8C80]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x270ED8C88]();
}

uint64_t ccrng()
{
  return MEMORY[0x270ED8C90]();
}

uint64_t ccrsa_block_size()
{
  return MEMORY[0x270ED8CA0]();
}

uint64_t ccrsa_ctx_public()
{
  return MEMORY[0x270ED8CA8]();
}

uint64_t ccrsa_decrypt_oaep()
{
  return MEMORY[0x270ED8CB0]();
}

uint64_t ccrsa_encrypt_oaep()
{
  return MEMORY[0x270ED8CB8]();
}

uint64_t ccrsa_export_pub()
{
  return MEMORY[0x270ED8CD0]();
}

uint64_t ccrsa_export_pub_size()
{
  return MEMORY[0x270ED8CD8]();
}

uint64_t ccrsa_generate_fips186_key()
{
  return MEMORY[0x270ED8CE0]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x270ED8D08]();
}

uint64_t ccrsa_import_pub_n()
{
  return MEMORY[0x270ED8D10]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x270ED8D38]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x270ED8D60]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x270ED8D98]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x270ED8DA8]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x270ED8DB0]();
}

uint64_t ccsrp_generate_salt_and_verification()
{
  return MEMORY[0x270ED8DD0]();
}

uint64_t ccsrp_get_session_key_length()
{
  return MEMORY[0x270ED8DE8]();
}

uint64_t ccsrp_gp_rfc5054_2048()
{
  return MEMORY[0x270ED8DF8]();
}

uint64_t ccsrp_server_verify_session()
{
  return MEMORY[0x270ED8E28]();
}

uint64_t ccsrp_sizeof_M_HAMK()
{
  return MEMORY[0x270ED8E38]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}