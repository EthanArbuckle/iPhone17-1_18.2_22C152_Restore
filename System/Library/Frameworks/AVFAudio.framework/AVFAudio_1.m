void sub_19D85ACA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  uint64_t a67;
  char a68;
  char a72;
  void *v72;
  void *v73;
  uint64_t v74;
  std::__shared_weak_count *v76;
  std::__shared_weak_count *v77;

  operator delete(__p);
  v76 = *(std::__shared_weak_count **)(v74 - 144);
  if (v76) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v76);
  }
  VCLocker::~VCLocker((VCLocker *)&a64);
  if (a67) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)a67);
  }
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  v77 = *(std::__shared_weak_count **)(v74 - 224);
  if (v77) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v77);
  }
  TraceMethod::~TraceMethod((TraceMethod *)(v74 - 216));

  VCUnlocker::~VCUnlocker((VCUnlocker *)&a34);
  if (a48) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)a48);
  }

  if (a46) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)a46);
  }
  _Block_object_dispose(&a52, 8);
  VCLocker::~VCLocker((VCLocker *)&a56);
  _Block_object_dispose(&a58, 8);

  _Unwind_Resume(a1);
}

void __destroy_helper_block_ea8_72c42_ZTSNSt3__110shared_ptrI14ControllerImplEE96c47_ZTSNSt3__110shared_ptrI19AVVCRecordingEngineEE(uint64_t a1)
{
  v2 = *(std::__shared_weak_count **)(a1 + 104);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  v3 = *(std::__shared_weak_count **)(a1 + 80);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void *__copy_helper_block_ea8_72c42_ZTSNSt3__110shared_ptrI14ControllerImplEE96c47_ZTSNSt3__110shared_ptrI19AVVCRecordingEngineEE(void *result, void *a2)
{
  uint64_t v2 = a2[10];
  result[9] = a2[9];
  result[10] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[13];
  result[12] = a2[12];
  result[13] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_451(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v2 = *(id *)kAVVCScope;
    if (!v2) {
      goto LABEL_11;
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = *(unsigned __int8 *)(a1 + 120);
    v6 = *(void **)(a1 + 64);
    v7 = (*(void (**)(void, void))(**(void **)(a1 + 72) + 64))(*(void *)(a1 + 72), 0);
    unsigned int v8 = [v7 sessionState];
    if (v8 > 7) {
      v9 = "ILLEGAL";
    }
    else {
      v9 = off_1E59658A8[v8];
    }
    *(_DWORD *)buf = 136316162;
    v78 = "ControllerImpl.mm";
    __int16 v79 = 1024;
    int v80 = 5492;
    __int16 v81 = 2048;
    id v82 = v6;
    __int16 v83 = 1024;
    *(_DWORD *)v84 = v5;
    *(_WORD *)&v84[4] = 2080;
    *(void *)&v84[6] = v9;
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d activateAudioSessionForStream for stream(%lu). isPrewarm(%d). CurrentState(%s).", buf, 0x2Cu);
  }
LABEL_11:
  if (kAVVCScope)
  {
    id v10 = *(id *)kAVVCScope;
    if (!v10) {
      goto LABEL_18;
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    (*(void (**)(void, void))(**(void **)(a1 + 72) + 56))(*(void *)(a1 + 72), 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void, void))(**(void **)(a1 + 72) + 64))(*(void *)(a1 + 72), 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = *(void *)(a1 + 72);
    CAX4CCString::CAX4CCString((CAX4CCString *)v76, *(_DWORD *)(v15 + 280));
    v16 = AVVCRouteManager::getRecordDeviceUID(*(id **)(*(void *)(a1 + 72) + 376));
    *(_DWORD *)buf = 136316674;
    v78 = "ControllerImpl.mm";
    __int16 v79 = 1024;
    int v80 = 5494;
    __int16 v81 = 2048;
    id v82 = v13;
    __int16 v83 = 2048;
    *(void *)v84 = v14;
    *(_WORD *)&v84[8] = 2048;
    *(void *)&v84[10] = v15;
    __int16 v85 = 2080;
    v86 = v76;
    __int16 v87 = 2112;
    v88 = v16;
    _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d session (%p) and session mananger (%p) used for engine (%p) with context(%s, %@)", buf, 0x44u);
  }
LABEL_18:
  v17 = (*(void (**)(void, void))(**(void **)(a1 + 72) + 64))(*(void *)(a1 + 72), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v17 setSessionActivationContext:*(void *)(a1 + 32)];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (kAVVCScope)
    {
      v18 = *(id *)kAVVCScope;
      if (!v18)
      {
LABEL_30:
        uint64_t v23 = *(void *)(a1 + 88);
        v24 = *(void **)(a1 + 40);
        BOOL v25 = v24 != 0;
        v26 = v75;
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_452;
        v75[3] = &unk_1E59653F0;
        id v27 = v24;
        uint64_t v28 = *(void *)(a1 + 64);
        uint64_t v29 = *(void *)(a1 + 48);
        v75[4] = v27;
        v75[5] = v29;
        v75[6] = v28;
        ControllerImpl::safeNotifyAlwaysAsync(v23, v25, v75);
        goto LABEL_64;
      }
    }
    else
    {
      v18 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v22 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 136315650;
      v78 = "ControllerImpl.mm";
      __int16 v79 = 1024;
      int v80 = 5500;
      __int16 v81 = 1024;
      LODWORD(v82) = v22;
      _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d activateAudioSessionForStream ERROR: Failed at setSessionActivationContext: %d", buf, 0x18u);
    }

    goto LABEL_30;
  }
  v19 = (*(void (**)(void, void))(**(void **)(a1 + 72) + 64))(*(void *)(a1 + 72), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v19 setSessionCategoryModeOptionsForActivationMode:*(void *)(a1 + 104) withOptions:*(void *)(a1 + 112)];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (kAVVCScope)
    {
      v20 = *(id *)kAVVCScope;
      if (!v20)
      {
LABEL_39:
        uint64_t v34 = *(void *)(a1 + 88);
        v35 = *(void **)(a1 + 40);
        BOOL v36 = v35 != 0;
        v26 = v74;
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_453;
        v74[3] = &unk_1E59653F0;
        id v37 = v35;
        uint64_t v38 = *(void *)(a1 + 64);
        uint64_t v39 = *(void *)(a1 + 48);
        v74[4] = v37;
        v74[5] = v39;
        v74[6] = v38;
        ControllerImpl::safeNotifyAlwaysAsync(v34, v36, v74);
        goto LABEL_64;
      }
    }
    else
    {
      v20 = MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v33 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 136315650;
      v78 = "ControllerImpl.mm";
      __int16 v79 = 1024;
      int v80 = 5512;
      __int16 v81 = 1024;
      LODWORD(v82) = v33;
      _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d activateAudioSessionForStream ERROR: Failed at setSessionCategoryModeOptionsForActivationMode: %d", buf, 0x18u);
    }

    goto LABEL_39;
  }
  v30 = (*(void (**)(void, void))(**(void **)(a1 + 72) + 64))(*(void *)(a1 + 72), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v30 setSessionSampleRateForActivationMode:*(void *)(a1 + 104)];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (kAVVCScope)
    {
      v31 = *(id *)kAVVCScope;
      if (!v31)
      {
LABEL_47:
        uint64_t v45 = *(void *)(a1 + 88);
        v46 = *(void **)(a1 + 40);
        BOOL v47 = v46 != 0;
        v26 = v73;
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_454;
        v73[3] = &unk_1E59653F0;
        id v48 = v46;
        uint64_t v49 = *(void *)(a1 + 64);
        uint64_t v50 = *(void *)(a1 + 48);
        v73[4] = v48;
        v73[5] = v50;
        v73[6] = v49;
        ControllerImpl::safeNotifyAlwaysAsync(v45, v47, v73);
        goto LABEL_64;
      }
    }
    else
    {
      v31 = MEMORY[0x1E4F14500];
      id v43 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v44 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 136315650;
      v78 = "ControllerImpl.mm";
      __int16 v79 = 1024;
      int v80 = 5523;
      __int16 v81 = 1024;
      LODWORD(v82) = v44;
      _os_log_impl(&dword_19D794000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d activateAudioSessionForStream ERROR: Failed at setSessionSampleRateForActivationMode: %d", buf, 0x18u);
    }

    goto LABEL_47;
  }
  v40 = (*(void (**)(void, void))(**(void **)(a1 + 72) + 64))(*(void *)(a1 + 72), 0);
  uint64_t v41 = *(void *)(a1 + 72);
  if (MGGetSInt32Answer() != 4)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)v41 + 320))(v41) == 1)
    {
      uint64_t v42 = 1440;
      goto LABEL_50;
    }
    (*(void (**)(uint64_t))(*(void *)v41 + 320))(v41);
  }
  uint64_t v42 = 256;
LABEL_50:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v40 setSessionBufferSize:v42];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (kAVVCScope)
    {
      v51 = *(id *)kAVVCScope;
      if (!v51)
      {
LABEL_63:
        uint64_t v64 = *(void *)(a1 + 88);
        v65 = *(void **)(a1 + 40);
        BOOL v66 = v65 != 0;
        v26 = v72;
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_455;
        v72[3] = &unk_1E59653F0;
        id v67 = v65;
        uint64_t v68 = *(void *)(a1 + 64);
        uint64_t v69 = *(void *)(a1 + 48);
        v72[4] = v67;
        v72[5] = v69;
        v72[6] = v68;
        ControllerImpl::safeNotifyAlwaysAsync(v64, v66, v72);
        goto LABEL_64;
      }
    }
    else
    {
      v51 = MEMORY[0x1E4F14500];
      id v62 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      int v63 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 136315650;
      v78 = "ControllerImpl.mm";
      __int16 v79 = 1024;
      int v80 = 5534;
      __int16 v81 = 1024;
      LODWORD(v82) = v63;
      _os_log_impl(&dword_19D794000, v51, OS_LOG_TYPE_ERROR, "%25s:%-5d activateAudioSessionForStream ERROR: Failed at setSessionBufferSize: %d", buf, 0x18u);
    }

    goto LABEL_63;
  }
  v52 = (*(void (**)(void, void))(**(void **)(a1 + 72) + 64))(*(void *)(a1 + 72), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v52 setSessionAudioHWControlFlagsForActivationMode:*(void *)(a1 + 104) withOptions:*(void *)(a1 + 112)];

  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v70 = (*(void (**)(void, void))(**(void **)(a1 + 72) + 64))(*(void *)(a1 + 72), 0);
    [v70 setSessionState:1];
    goto LABEL_65;
  }
  v53 = CALog::LogObjIfEnabled(1, kAVVCScope);
  v54 = v53;
  if (v53 && os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    int v55 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 136315650;
    v78 = "ControllerImpl.mm";
    __int16 v79 = 1024;
    int v80 = 5545;
    __int16 v81 = 1024;
    LODWORD(v82) = v55;
    _os_log_impl(&dword_19D794000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d activateAudioSessionForStream ERROR: Failed at setSessionAudioHWControlFlagsForActivationMode: %d", buf, 0x18u);
  }

  uint64_t v56 = *(void *)(a1 + 88);
  v57 = *(void **)(a1 + 40);
  BOOL v58 = v57 != 0;
  v26 = v71;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_456;
  v71[3] = &unk_1E59653F0;
  id v59 = v57;
  uint64_t v60 = *(void *)(a1 + 64);
  uint64_t v61 = *(void *)(a1 + 48);
  v71[4] = v59;
  v71[5] = v61;
  v71[6] = v60;
  ControllerImpl::safeNotifyAlwaysAsync(v56, v58, v71);
LABEL_64:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  v70 = (void *)v26[4];
LABEL_65:
}

void sub_19D85BA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_457(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85BB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_2_458(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 88);
  id v3 = (*(void (**)(void, void))(**(void **)(a1 + 48) + 64))(*(void *)(a1 + 48), 0);
  [v3 setClientRequestsRecording:v2];

  if (*(unsigned char *)(a1 + 89)) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(**(void **)(a1 + 48) + 288))(*(void *)(a1 + 48));
  }
  uint64_t v4 = *(void *)(a1 + 64);
  int v5 = *(void **)(a1 + 32);
  BOOL v6 = v5 != 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_3;
  v10[3] = &unk_1E59653F0;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v9;
  uint64_t v13 = v8;
  ControllerImpl::safeNotifyAlwaysAsync(v4, v6, v10);
}

void sub_19D85BCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_3(void *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = a1[4];
  BOOL v3 = *(_DWORD *)(*(void *)(a1[5] + 8) + 24) == 0;
  objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, BOOL))(v2 + 16))(v2, v1, v3);
}

void sub_19D85BD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_ea8_72c47_ZTSNSt3__110shared_ptrI19AVVCRecordingEngineEE88c42_ZTSNSt3__110shared_ptrI14ControllerImplEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 96);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  BOOL v3 = *(std::__shared_weak_count **)(a1 + 80);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void *__copy_helper_block_ea8_72c47_ZTSNSt3__110shared_ptrI19AVVCRecordingEngineEE88c42_ZTSNSt3__110shared_ptrI14ControllerImplEE(void *result, void *a2)
{
  uint64_t v2 = a2[10];
  result[9] = a2[9];
  result[10] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[12];
  result[11] = a2[11];
  result[12] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_452(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85BEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_453(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85BF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_454(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85BFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_455(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85C098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke_456(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85C138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ControllerImpl::activateAudioSessionForStream(ControllerImpl *this, AVVoiceController *a2, uint64_t a3, char a4, char a5)
{
  uint64_t v9 = a2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbb_block_invoke;
  v13[3] = &unk_1E5965418;
  v16 = this;
  id v10 = v9;
  uint64_t v17 = a3;
  char v18 = a4;
  char v19 = a5;
  id v14 = v10;
  uint64_t v15 = &v20;
  makeSynchronous(v13);
  uint64_t v11 = *((unsigned int *)v21 + 6);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void sub_19D85C238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbb_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  char v6 = *(unsigned char *)(a1 + 64);
  char v7 = *(unsigned char *)(a1 + 65);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbb_block_invoke_2;
  v16[3] = &unk_1E5965210;
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v17 = v3;
  uint64_t v18 = v8;
  id v10 = v3;
  id v11 = v9;
  uint64_t v12 = v16;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v28, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  uint64_t v13 = v28;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3321888768;
  v19[2] = ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbbU13block_pointerFvmbP7NSErrorE_block_invoke;
  v19[3] = &unk_1EEFA8900;
  uint64_t v22 = v5;
  uint64_t v23 = v28;
  v24 = v29;
  if (v29) {
    atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v25 = v4;
  id v14 = v12;
  id v21 = v14;
  char v26 = v6;
  id v15 = v11;
  id v20 = v15;
  char v27 = v7;
  ControllerImpl::safeWork(v13, v19, (uint64_t)"activateAudioSessionForStream");

  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
}

void sub_19D85C3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  if (a24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a24);
  }
  uint64_t v29 = *(std::__shared_weak_count **)(v27 - 72);
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl29activateAudioSessionForStreamEP17AVVoiceControllermbb_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 code];
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_semaphore_signal(v5);
  }
}

void sub_19D85C4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ControllerImpl::deactivateAudioSessionWithOptions(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
}

{
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t vars8;

  uint64_t v9 = a2;
  id v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v24 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___ZN14ControllerImpl29deactivateSessionForListeningEP17AVVoiceControllermbm23AVVCDeactivationOptions_block_invoke;
  v13[3] = &unk_1E5964F18;
  v16 = a1;
  id v20 = 1;
  id v17 = a4;
  uint64_t v18 = a3;
  char v19 = 3;
  uint64_t v12 = v9;
  id v14 = v12;
  id v15 = &v21;
  makeSynchronous(v13);
  id v10 = *((int *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v11 = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = v11;
LABEL_4:
}

void sub_19D85C628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v42, *(void *)(*(void *)(a1 + 56) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 56) + 584), *(void *)(a1 + 72));
  uint64_t v2 = [*(id *)(a1 + 32) activationMode];
  uint64_t v3 = v42;
  if (!v42)
  {
    if (kAVVCScope)
    {
      id v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_27:
        uint64_t v21 = *(void *)(a1 + 56);
        uint64_t v22 = *(void **)(a1 + 40);
        BOOL v23 = v22 != 0;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_468;
        v39[3] = &unk_1E5965A60;
        id v24 = v22;
        uint64_t v25 = *(void *)(a1 + 72);
        id v40 = v24;
        uint64_t v41 = v25;
        ControllerImpl::safeNotifyAlwaysAsync(v21, v23, v39);

        goto LABEL_28;
      }
    }
    else
    {
      id v10 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 136315650;
      uint64_t v45 = "ControllerImpl.mm";
      __int16 v46 = 1024;
      int v47 = 5692;
      __int16 v48 = 2048;
      uint64_t v49 = v20;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: Cannot find recording engine for streamID(%lu). Returning.", buf, 0x1Cu);
    }

    goto LABEL_27;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 472);
  if (!v4 || v4 != *(void *)(a1 + 72))
  {
    if (kAVVCScope)
    {
      uint64_t v9 = *(id *)kAVVCScope;
      if (!v9)
      {
LABEL_22:
        uint64_t v14 = *(void *)(a1 + 56);
        id v15 = *(void **)(a1 + 40);
        BOOL v16 = v15 != 0;
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_469;
        v36[3] = &unk_1E5965A60;
        id v17 = v15;
        uint64_t v18 = *(void *)(a1 + 72);
        id v37 = v17;
        uint64_t v38 = v18;
        ControllerImpl::safeNotifyAlwaysAsync(v14, v16, v36);

        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 72);
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 472);
      *(_DWORD *)buf = 136315906;
      uint64_t v45 = "ControllerImpl.mm";
      __int16 v46 = 1024;
      int v47 = 5701;
      __int16 v48 = 2048;
      uint64_t v49 = v12;
      __int16 v50 = 2048;
      uint64_t v51 = v13;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d setContextForStream: Error! Incoming engine with streamID(%llu) is different from engine that was used to activate the session, streamID(%llu)", buf, 0x26u);
    }

    goto LABEL_22;
  }
  uint64_t v5 = v2;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3321888768;
  v27[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v27[3] = &unk_1EEFA79B8;
  uint64_t v30 = v42;
  v31 = v43;
  if (v43) {
    atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v28 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v6 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v32 = v5;
  uint64_t v33 = v7;
  uint64_t v34 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v26 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v26;
  long long v29 = v26;
  uint64_t v35 = *(void *)(a1 + 72);
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v3 + 360))(v3, v27, "setContextForStream_block_invoke");

  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }

  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
LABEL_28:
  if (v43) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v43);
  }
}

void sub_19D85CA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }

  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }
  uint64_t v25 = *(std::__shared_weak_count **)(v23 - 104);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_468(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85CB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_469(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85CBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  AVVCRecordingEngine::setActivationContextSettings(*(AVVCRecordingEngine **)(a1 + 56), *(AVVCContextSettings **)(a1 + 32));
  *(void *)(*(void *)(a1 + 56) + 280) = *(void *)(a1 + 72);
  if (![*(id *)(a1 + 32) announceCallsEnabled])
  {
    uint64_t v3 = 0;
    goto LABEL_11;
  }
  if (!kAVVCScope)
  {
    id v2 = (id)MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
    goto LABEL_7;
  }
  id v2 = *(id *)kAVVCScope;
  if (v2)
  {
LABEL_7:
    uint64_t v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v24, *(_DWORD *)(a1 + 72));
      *(_DWORD *)buf = 136315650;
      long long v26 = "ControllerImpl.mm";
      __int16 v27 = 1024;
      int v28 = 5727;
      __int16 v29 = 2080;
      uint64_t v30 = v24;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setContextForStream: Announce option set for %s activation mode", buf, 0x1Cu);
    }
  }
  uint64_t v3 = 1;
LABEL_11:
  uint64_t v6 = *(void *)(a1 + 80);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_470;
  v14[3] = &unk_1EEFA7AD0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 80);
  id v15 = v7;
  uint64_t v17 = v8;
  uint64_t v18 = v9;
  id v10 = *(std::__shared_weak_count **)(a1 + 88);
  id v19 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v11 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 56);
  uint64_t v21 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v13 = *(_OWORD *)(a1 + 40);
  id v12 = (id)v13;
  long long v16 = v13;
  uint64_t v22 = *(void *)(a1 + 96);
  uint64_t v23 = v3;
  ControllerImpl::safeWork(v6, v14, (uint64_t)"setContextForStream_block_invoke");

  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
}

void sub_19D85CE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_470(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activationDeviceUID];

  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  if (v2)
  {
    uint64_t v5 = [*(id *)(a1 + 32) activationDeviceUID];
    uint64_t v6 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"activation trigger", v5, @"activation device uid", 0);
  }
  else
  {
    uint64_t v6 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"activation trigger", 0);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 64) + 456), v6);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(std::__shared_weak_count **)(a1 + 72);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SessionLock::SessionLock(v44, v7, v8);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 528);
  uint64_t v10 = *(void *)(a1 + 80);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3321888768;
  v27[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_2_471;
  v27[3] = &unk_1EEFA7BB0;
  uint64_t v30 = *(void *)(a1 + 48);
  id v11 = *(std::__shared_weak_count **)(a1 + 88);
  uint64_t v32 = v10;
  uint64_t v33 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v12 = v6;
  uint64_t v14 = *(void *)(a1 + 64);
  long long v13 = *(std::__shared_weak_count **)(a1 + 72);
  id v28 = v12;
  uint64_t v34 = v14;
  uint64_t v35 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v29 = *(id *)(a1 + 40);
  uint64_t v31 = &v40;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 104);
  uint64_t v36 = *(void *)(a1 + 96);
  uint64_t v37 = v15;
  uint64_t v38 = v16;
  uint64_t v39 = v9;
  (*(void (**)(uint64_t, void *))(*(void *)v10 + 376))(v10, v27);
  if (!*((unsigned char *)v41 + 24))
  {
    uint64_t v17 = *(void *)(a1 + 64);
    *(void *)(v17 + 528) = *(void *)(a1 + 56);
    uint64_t v18 = *(void **)(a1 + 40);
    BOOL v19 = v18 != 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_479;
    v23[3] = &unk_1E59653F0;
    id v20 = v18;
    uint64_t v21 = *(void *)(a1 + 96);
    uint64_t v22 = *(void *)(a1 + 48);
    id v24 = v20;
    uint64_t v25 = v22;
    uint64_t v26 = v21;
    ControllerImpl::safeNotifyAlwaysAsync(v17, v19, v23);
  }
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }

  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
  _Block_object_dispose(&v40, 8);
  VCLocker::~VCLocker((VCLocker *)v44);
}

void sub_19D85D15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,std::__shared_weak_count *a30,uint64_t a31,std::__shared_weak_count *a32)
{
  if (a32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a32);
  }

  if (a30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a30);
  }
  _Block_object_dispose((const void *)(v33 - 96), 8);
  VCLocker::~VCLocker((VCLocker *)(v33 - 64));

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_2_471(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v2 = (*(void (**)(void, void))(**(void **)(a1 + 64) + 64))(*(void *)(a1 + 64), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 setSessionActivationContext:*(void *)(a1 + 32)];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (kAVVCScope)
    {
      id v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_13:
        uint64_t v8 = *(void *)(a1 + 80);
        uint64_t v9 = *(void **)(a1 + 40);
        BOOL v10 = v9 != 0;
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_472;
        v82[3] = &unk_1E59653F0;
        id v11 = v9;
        uint64_t v12 = *(void *)(a1 + 96);
        uint64_t v13 = *(void *)(a1 + 48);
        id v83 = v11;
        uint64_t v84 = v13;
        uint64_t v85 = v12;
        ControllerImpl::safeNotifyAlwaysAsync(v8, v10, v82);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;

        return;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      unsigned int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 136315650;
      __int16 v87 = "ControllerImpl.mm";
      __int16 v88 = 1024;
      int v89 = 5759;
      __int16 v90 = 1024;
      unsigned int v91 = v7;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d setContextForStream ERROR: Failed at setSessionActivationContext: %d", buf, 0x18u);
    }

    goto LABEL_13;
  }
  id v4 = (*(void (**)(void, void))(**(void **)(a1 + 64) + 64))(*(void *)(a1 + 64), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 setSessionCategoryModeOptionsForActivationMode:*(void *)(a1 + 104) withOptions:*(void *)(a1 + 112)];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (kAVVCScope)
    {
      uint64_t v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_22:
        uint64_t v18 = *(void *)(a1 + 80);
        BOOL v19 = *(void **)(a1 + 40);
        BOOL v20 = v19 != 0;
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_473;
        v78[3] = &unk_1E59653F0;
        id v21 = v19;
        uint64_t v22 = *(void *)(a1 + 96);
        uint64_t v23 = *(void *)(a1 + 48);
        id v79 = v21;
        uint64_t v80 = v23;
        uint64_t v81 = v22;
        ControllerImpl::safeNotifyAlwaysAsync(v18, v20, v78);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;

        return;
      }
    }
    else
    {
      uint64_t v5 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v17 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 136315650;
      __int16 v87 = "ControllerImpl.mm";
      __int16 v88 = 1024;
      int v89 = 5770;
      __int16 v90 = 1024;
      unsigned int v91 = v17;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d setContextForStream ERROR: Failed at setSessionCategoryModeOptionsForActivationMode: %d", buf, 0x18u);
    }

    goto LABEL_22;
  }
  uint64_t v14 = (*(void (**)(void, void))(**(void **)(a1 + 64) + 64))(*(void *)(a1 + 64), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v14 setSessionSampleRateForActivationMode:*(void *)(a1 + 104)];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (kAVVCScope)
    {
      uint64_t v15 = *(id *)kAVVCScope;
      if (!v15)
      {
LABEL_31:
        uint64_t v28 = *(void *)(a1 + 80);
        id v29 = *(void **)(a1 + 40);
        BOOL v30 = v29 != 0;
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_474;
        v74[3] = &unk_1E59653F0;
        id v31 = v29;
        uint64_t v32 = *(void *)(a1 + 96);
        uint64_t v33 = *(void *)(a1 + 48);
        id v75 = v31;
        uint64_t v76 = v33;
        uint64_t v77 = v32;
        ControllerImpl::safeNotifyAlwaysAsync(v28, v30, v74);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;

        return;
      }
    }
    else
    {
      uint64_t v15 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v27 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 136315650;
      __int16 v87 = "ControllerImpl.mm";
      __int16 v88 = 1024;
      int v89 = 5781;
      __int16 v90 = 1024;
      unsigned int v91 = v27;
      _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d setContextForStream ERROR: Failed at setSessionSampleRateForActivationMode: %d", buf, 0x18u);
    }

    goto LABEL_31;
  }
  id v24 = (*(void (**)(void, void))(**(void **)(a1 + 64) + 64))(*(void *)(a1 + 64), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v24 setSessionAudioHWControlFlagsForActivationMode:*(void *)(a1 + 104) withOptions:*(void *)(a1 + 112)];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (kAVVCScope)
    {
      uint64_t v25 = *(id *)kAVVCScope;
      if (!v25)
      {
LABEL_39:
        uint64_t v38 = *(void *)(a1 + 80);
        uint64_t v39 = *(void **)(a1 + 40);
        BOOL v40 = v39 != 0;
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_475;
        v70[3] = &unk_1E59653F0;
        id v41 = v39;
        uint64_t v42 = *(void *)(a1 + 96);
        uint64_t v43 = *(void *)(a1 + 48);
        id v71 = v41;
        uint64_t v72 = v43;
        uint64_t v73 = v42;
        ControllerImpl::safeNotifyAlwaysAsync(v38, v40, v70);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;

        return;
      }
    }
    else
    {
      uint64_t v25 = MEMORY[0x1E4F14500];
      id v36 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      unsigned int v37 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 136315650;
      __int16 v87 = "ControllerImpl.mm";
      __int16 v88 = 1024;
      int v89 = 5792;
      __int16 v90 = 1024;
      unsigned int v91 = v37;
      _os_log_impl(&dword_19D794000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d setContextForStream ERROR: Failed at setSessionAudioHWControlFlagsForActivationMode: %d", buf, 0x18u);
    }

    goto LABEL_39;
  }
  uint64_t v34 = *(void *)(a1 + 120);
  if (v34 > 1918986610)
  {
    if (v34 != 1987012963)
    {
      uint64_t v35 = 1918986611;
LABEL_43:
      if (v34 != v35) {
        return;
      }
    }
  }
  else if (v34 != 1668314723)
  {
    uint64_t v35 = 1751414371;
    goto LABEL_43;
  }
  (*(void (**)(void, void))(**(void **)(a1 + 64) + 64))(*(void *)(a1 + 64), 0);
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  if ([v64 isSessionActive])
  {
    uint64_t v44 = *(void *)(a1 + 104);

    if (v44 == 1886352244)
    {
      uint64_t v45 = (*(void (**)(void, void))(**(void **)(a1 + 64) + 64))(*(void *)(a1 + 64), 0);
      unsigned int v46 = [v45 getSessionActivationOptions];

      int v47 = CALog::LogObjIfEnabled(3, kAVVCScope);
      __int16 v48 = v47;
      if (v47 && os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v87 = "ControllerImpl.mm";
        __int16 v88 = 1024;
        int v89 = 5811;
        __int16 v90 = 1024;
        unsigned int v91 = v46;
        _os_log_impl(&dword_19D794000, v48, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setContextForStream: finish 'live' switch by re-activating active session setActive:TRUE, session options : %d", buf, 0x18u);
      }

      uint64_t v49 = (*(void (**)(void, void))(**(void **)(a1 + 64) + 56))(*(void *)(a1 + 64), 0);
      id v69 = 0;
      char v50 = [v49 setActive:1 withOptions:v46 error:&v69];
      id v51 = v69;

      if (v50)
      {
        uint64_t v52 = (*(void (**)(void, void))(**(void **)(a1 + 64) + 64))(*(void *)(a1 + 64), 0);
        [v52 setSessionState:7];

        v53 = CALog::LogObjIfEnabled(3, kAVVCScope);
        v54 = v53;
        if (v53 && os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v87 = "ControllerImpl.mm";
          __int16 v88 = 1024;
          int v89 = 5821;
          _os_log_impl(&dword_19D794000, v54, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setContextForStream: session re-activated -- calling getSessionProperties", buf, 0x12u);
        }

        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = AVVCRecordingEngine::getSessionProperties(*(AVVCRecordingEngine **)(a1 + 64));
      }
      else
      {
        int v55 = CALog::LogObjIfEnabled(1, kAVVCScope);
        uint64_t v56 = v55;
        if (v55)
        {
          v57 = v55;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            unsigned int v58 = [v51 code];
            *(_DWORD *)buf = 136315650;
            __int16 v87 = "ControllerImpl.mm";
            __int16 v88 = 1024;
            int v89 = 5813;
            __int16 v90 = 1024;
            unsigned int v91 = v58;
            _os_log_impl(&dword_19D794000, v57, OS_LOG_TYPE_ERROR, "%25s:%-5d setContextForStream : Session re-activation failed with error : %d", buf, 0x18u);
          }
        }
        uint64_t v59 = *(void *)(a1 + 80);
        uint64_t v60 = *(void **)(a1 + 40);
        BOOL v61 = v60 != 0;
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_476;
        v65[3] = &unk_1E5965260;
        id v62 = v60;
        uint64_t v63 = *(void *)(a1 + 96);
        id v67 = v62;
        uint64_t v68 = v63;
        id v66 = v51;
        ControllerImpl::safeNotifyAlwaysAsync(v59, v61, v65);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
    }
  }
  else
  {
  }
}

void sub_19D85DCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_479(void *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = a1[4];
  BOOL v3 = *(_DWORD *)(*(void *)(a1[5] + 8) + 24) == 0;
  objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, BOOL))(v2 + 16))(v2, v1, v3);
}

void sub_19D85DE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_472(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85DEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_473(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85DF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_474(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85E004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_475(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(a1[5] + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85E0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke_476(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], 0, a1[4]);
}

uint64_t ControllerImpl::setContextForStream(ControllerImpl *this, AVVoiceController *a2, AVVCContextSettings *a3, uint64_t a4)
{
  unsigned int v7 = a2;
  uint64_t v8 = a3;
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsm_block_invoke;
  v13[3] = &unk_1E5965440;
  unsigned int v17 = this;
  uint64_t v9 = v7;
  uint64_t v14 = v9;
  BOOL v10 = v8;
  uint64_t v18 = a4;
  uint64_t v15 = v10;
  id v16 = &v19;
  makeSynchronous(v13);
  uint64_t v11 = *((unsigned int *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  return v11;
}

void sub_19D85E1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsm_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = a1[7];
  uint64_t v4 = a1[8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsm_block_invoke_2;
  v14[3] = &unk_1E5965210;
  unsigned int v7 = (void *)a1[5];
  uint64_t v6 = a1[6];
  id v15 = v3;
  uint64_t v16 = v6;
  id v8 = v3;
  id v9 = v7;
  BOOL v10 = v14;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v24, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3321888768;
  v17[2] = ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsmU13block_pointerFvmbP7NSErrorE_block_invoke;
  v17[3] = &unk_1EEFA8740;
  uint64_t v11 = v24;
  uint64_t v21 = v24;
  int v22 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v23 = v4;
  id v12 = v9;
  id v18 = v12;
  uint64_t v13 = v10;
  id v19 = v13;
  BOOL v20 = v26;
  ControllerImpl::safeWork(v11, v17, (uint64_t)"setContextForStream");

  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  _Block_object_dispose(v26, 8);
}

void sub_19D85E3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }
  uint64_t v28 = *(std::__shared_weak_count **)(v26 - 88);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  _Block_object_dispose((const void *)(v26 - 80), 8);

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl19setContextForStreamEP17AVVoiceControllerP19AVVCContextSettingsm_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 code];
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_semaphore_signal(v5);
  }
}

void sub_19D85E464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ControllerImpl::playAlertWithCompletion(uint64_t a1, void *a2, int a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v22, *(void *)(a1 + 8), *(std::__shared_weak_count **)(a1 + 16));
  uint64_t v11 = v22;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke;
  v14[3] = &unk_1EEFA89E0;
  uint64_t v17 = a1;
  uint64_t v18 = v22;
  id v19 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v12 = v10;
  id v16 = v12;
  int v21 = a3;
  id v13 = v9;
  id v15 = v13;
  uint64_t v20 = a4;
  ControllerImpl::safeWork(v11, v14, (uint64_t)"playAlertWithCompletion");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
}

void sub_19D85E5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  uint64_t v22 = *(std::__shared_weak_count **)(v20 - 56);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v71 = 0;
  uint64_t v72 = &v71;
  uint64_t v73 = 0x2020000000;
  int v74 = 0;
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = ControllerImpl::sessionManagerForStreamID(*(void *)(a1 + 56), 0, 0);
  char v4 = [v3 isSessionActive];

  if ((v4 & 1) == 0)
  {
    if (kAVVCScope)
    {
      id v9 = *(id *)kAVVCScope;
      if (!v9)
      {
LABEL_12:
        *((_DWORD *)v72 + 6) = -11782;
        uint64_t v11 = *(void *)(a1 + 56);
        id v12 = *(void **)(a1 + 40);
        BOOL v13 = v12 != 0;
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_488;
        v67[3] = &unk_1E5965468;
        id v14 = v12;
        int v70 = *(_DWORD *)(a1 + 80);
        id v68 = v14;
        id v69 = &v71;
        ControllerImpl::safeNotifyAlwaysAsync(v11, v13, v67);
        unsigned int v7 = v68;
        goto LABEL_13;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "ControllerImpl.mm";
      __int16 v76 = 1024;
      int v77 = 5871;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d playAlertWithCompletion: called when session inactive--do nothing and return error", buf, 0x12u);
    }

    goto LABEL_12;
  }
  uint64_t v5 = ControllerImpl::sessionManagerForStreamID(*(void *)(a1 + 56), 0, 0);
  id v6 = [v5 playbackRoute];
  unsigned int v7 = (void *)[v6 copy];

  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_18;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "ControllerImpl.mm";
    __int16 v76 = 1024;
    int v77 = 5886;
    __int16 v78 = 2112;
    id v79 = v7;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d Current Playback Route %@", buf, 0x1Cu);
  }

LABEL_18:
  int v16 = [v7 isEqualToString:*MEMORY[0x1E4F4E930]];
  int v17 = *(_DWORD *)(a1 + 80);
  unsigned int v18 = v17 - 1;
  if (v16)
  {
    if (v18 > 2)
    {
      uint64_t v24 = *(void *)(a1 + 56);
      uint64_t v25 = *(void **)(a1 + 40);
      BOOL v26 = v25 != 0;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_493;
      v54[3] = &unk_1E5964EC8;
      id v55 = v25;
      int v56 = *(_DWORD *)(a1 + 80);
      ControllerImpl::safeNotifyAlwaysAsync(v24, v26, v54);

      goto LABEL_13;
    }
    int v19 = v17 + 1109;
    if (kAVVCScope)
    {
      uint64_t v20 = *(id *)kAVVCScope;
      if (!v20)
      {
LABEL_36:
        *(void *)buf = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        *(_WORD *)&buf[8] = 257;
        CACFDictionary::AddBool((__CFDictionary **)buf, (const __CFString *)*MEMORY[0x1E4F18A28]);
        objc_initWeak(&location, *(id *)(a1 + 32));
        BOOL v30 = *(void **)(a1 + 56);
        id v29 = *(std::__shared_weak_count **)(a1 + 64);
        if (v29) {
          atomic_fetch_add_explicit(&v29->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v57 = MEMORY[0x1E4F143A8];
        uint64_t v58 = 3321888768;
        uint64_t v59 = ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_489;
        uint64_t v60 = &unk_1EEFA3BE8;
        objc_copyWeak(v63, &location);
        v63[1] = v30;
        id v64 = v29;
        if (v29) {
          atomic_fetch_add_explicit(&v29->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        int v65 = *(_DWORD *)(a1 + 80);
        id v61 = *(id *)(a1 + 40);
        id v62 = &v71;
        AudioServicesPlaySystemSoundWithOptions();

        if (v64) {
          std::__shared_weak_count::__release_weak(v64);
        }
        objc_destroyWeak(v63);
        if (v29) {
          std::__shared_weak_count::__release_weak(v29);
        }
        objc_destroyWeak(&location);
        CACFDictionary::~CACFDictionary((CACFDictionary *)buf);
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v20 = MEMORY[0x1E4F14500];
      id v28 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ControllerImpl.mm";
      __int16 v76 = 1024;
      int v77 = 5892;
      __int16 v78 = 1024;
      LODWORD(v79) = v19;
      _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d playAlertWithOverride: calling AudioServicesPlaySystemSoundWithOptions with sound ID %d", buf, 0x18u);
    }

    goto LABEL_36;
  }
  if (v18 >= 3)
  {
    if (kAVVCScope)
    {
      int v27 = *(id *)kAVVCScope;
      if (!v27)
      {
LABEL_49:
        *((_DWORD *)v72 + 6) = -11780;
        uint64_t v32 = *(void *)(a1 + 56);
        uint64_t v33 = *(void **)(a1 + 40);
        BOOL v34 = v33 != 0;
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_494;
        v50[3] = &unk_1E5965468;
        id v35 = v33;
        int v53 = *(_DWORD *)(a1 + 80);
        id v51 = v35;
        uint64_t v52 = &v71;
        ControllerImpl::safeNotifyAlwaysAsync(v32, v34, v50);

        goto LABEL_13;
      }
    }
    else
    {
      int v27 = MEMORY[0x1E4F14500];
      id v31 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "ControllerImpl.mm";
      __int16 v76 = 1024;
      int v77 = 5924;
      _os_log_impl(&dword_19D794000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d playAlertWithCompletion: Illegal alertType", buf, 0x12u);
    }

    goto LABEL_49;
  }
  unint64_t v21 = *(void *)(a1 + 72);
  BOOL v22 = v21 != -1;
  switch(v17)
  {
    case 3:
      int v23 = *(_DWORD *)(*(void *)(a1 + 56) + 328);
      break;
    case 2:
      int v23 = *(_DWORD *)(*(void *)(a1 + 56) + 324);
      break;
    case 1:
      int v23 = *(_DWORD *)(*(void *)(a1 + 56) + 320);
      break;
    default:
      int v23 = 0;
      break;
  }
  if (v21 < 5 || (BOOL v36 = v21 == -1, LODWORD(v21) = v23, !v36))
  {
    switch(v17)
    {
      case 3:
        ControllerImpl::setStopWithErrorAlertMode(*(void *)(a1 + 56), v21);
        break;
      case 2:
        ControllerImpl::setStopAlertMode(*(void *)(a1 + 56), v21);
        break;
      case 1:
        ControllerImpl::setStartAlertMode(*(void *)(a1 + 56), v21);
        break;
    }
  }
  uint64_t v37 = *(void *)(a1 + 56);
  *(unsigned char *)(v37 + 409) = 1;
  uint64_t v38 = *(void **)(a1 + 32);
  int v39 = *(_DWORD *)(a1 + 80);
  BOOL v40 = *(AVVoiceController **)(v2 + 472);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3321888768;
  v42[2] = ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_2;
  v42[3] = &unk_1EEFA85B8;
  BOOL v49 = v22;
  int v47 = v39;
  uint64_t v44 = &v71;
  uint64_t v45 = v37;
  id v41 = *(std::__shared_weak_count **)(a1 + 64);
  unsigned int v46 = v41;
  if (v41) {
    atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v48 = v23;
  id v43 = *(id *)(a1 + 40);
  ControllerImpl::playAlert(v37, v38, v39, v40, v42);

  if (v46) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
LABEL_13:

  _Block_object_dispose(&v71, 8);
}

void sub_19D85ED80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,std::__shared_weak_count *a41)
{
  if (a41) {
    std::__shared_weak_count::__release_weak(a41);
  }
  objc_destroyWeak(v43);
  if (v42) {
    std::__shared_weak_count::__release_weak(v42);
  }
  objc_destroyWeak((id *)(v44 - 224));
  CACFDictionary::~CACFDictionary((CACFDictionary *)(v44 - 128));

  _Block_object_dispose((const void *)(v44 - 160), 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_488(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v1, 1);
}

void sub_19D85EF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_489(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    uint64_t v2 = *(id *)kAVVCScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    int v23 = "ControllerImpl.mm";
    __int16 v24 = 1024;
    int v25 = 5899;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d playAlertWithOverride: Finished playing the alert beep", buf, 0x12u);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 64);
  if (!v5)
  {
    id v6 = 0;
    goto LABEL_14;
  }
  id v6 = std::__shared_weak_count::lock(v5);
  if (!v6)
  {
LABEL_14:
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (WeakRetained && v7)
  {
    *(void *)(v7 + 208) = 2;
    id v8 = *(void **)(v7 + 392);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_491;
    v19[3] = &unk_1E5965058;
    objc_copyWeak(v20, (id *)(a1 + 48));
    int v21 = *(_DWORD *)(a1 + 72);
    v20[1] = (id)2;
    v20[2] = v8;
    ControllerImpl::safeNotify(v7, (uint64_t)"playAlertWithCompletion: alertPlaybackFinishedWithSettings", v19);
    id v9 = *(void **)(a1 + 32);
    BOOL v10 = v9 != 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_492;
    v15[3] = &unk_1E5965468;
    id v11 = v9;
    int v18 = *(_DWORD *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 40);
    id v16 = v11;
    uint64_t v17 = v12;
    ControllerImpl::safeNotifyAlwaysAsync(v7, v10, v15);

    objc_destroyWeak(v20);
LABEL_23:
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    goto LABEL_24;
  }
LABEL_15:
  if (kAVVCScope)
  {
    BOOL v13 = *(id *)kAVVCScope;
    if (!v13) {
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    int v23 = "ControllerImpl.mm";
    __int16 v24 = 1024;
    int v25 = 5900;
    __int16 v26 = 2048;
    id v27 = WeakRetained;
    __int16 v28 = 2048;
    uint64_t v29 = v7;
    _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d nil object encountered (avvc: %p, impl: %p). Bailing", buf, 0x26u);
  }

LABEL_22:
  if (v6) {
    goto LABEL_23;
  }
LABEL_24:
}

void sub_19D85F200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_493(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v1, v2, 1);
}

void sub_19D85F2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_494(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v1, 1);
}

void sub_19D85F35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (*(unsigned char *)(a1 + 72))
  {
    int v3 = *(_DWORD *)(a1 + 64);
    switch(v3)
    {
      case 3:
        ControllerImpl::setStopWithErrorAlertMode(*(void *)(a1 + 48), *(_DWORD *)(a1 + 68));
        break;
      case 2:
        ControllerImpl::setStopAlertMode(*(void *)(a1 + 48), *(_DWORD *)(a1 + 68));
        break;
      case 1:
        ControllerImpl::setStartAlertMode(*(void *)(a1 + 48), *(_DWORD *)(a1 + 68));
        break;
    }
  }
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 32);
  BOOL v6 = v5 != 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_3;
  v9[3] = &unk_1E5965468;
  id v7 = v5;
  int v12 = *(_DWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  ControllerImpl::safeNotifyAlwaysAsync(v4, v6, v9);
}

void sub_19D85F47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v1, 1);
}

void sub_19D85F51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_ea8_56c39_ZTSNSt3__18weak_ptrI14ControllerImplEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 64);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t __copy_helper_block_ea8_56c39_ZTSNSt3__18weak_ptrI14ControllerImplEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 64);
  *(void *)(result + 56) = *(void *)(a2 + 56);
  *(void *)(result + 64) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_491(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = [[AVVCAlertInformation alloc] initWithAlertType:*(unsigned int *)(a1 + 56) mode:*(void *)(a1 + 40) endTime:*(void *)(a1 + 48)];
    [WeakRetained alertPlaybackFinishedWithSettings:v3];
  }
  else
  {
    if (kAVVCScope)
    {
      uint64_t v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315650;
      id v7 = "ControllerImpl.mm";
      __int16 v8 = 1024;
      int v9 = 5905;
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d nil object encountered (avvc: %p). Bailing", (uint8_t *)&v6, 0x1Cu);
    }
  }
LABEL_10:
}

void sub_19D85F68C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl23playAlertWithCompletionEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverrideU13block_pointerFvS2_14AVVCAlertStateP7NSErrorE_block_invoke_492(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) userInfo:0];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v1, 1);
}

void sub_19D85F740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ControllerImpl::playAlertWithOverride(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZN14ControllerImpl21playAlertWithOverrideEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverride_block_invoke;
  v11[3] = &unk_1E59654B8;
  uint64_t v14 = a1;
  id v8 = v7;
  int v16 = a3;
  uint64_t v15 = a4;
  id v12 = v8;
  BOOL v13 = &v17;
  makeSynchronous(v11);
  uint64_t v9 = *((unsigned int *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void sub_19D85F830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Block_object_dispose((const void *)(v15 - 64), 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl21playAlertWithOverrideEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverride_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___ZN14ControllerImpl21playAlertWithOverrideEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverride_block_invoke_2;
  v10[3] = &unk_1E5965490;
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v7;
  id v9 = v3;
  ControllerImpl::playAlertWithCompletion(v5, v8, v4, v6, v10);
}

void sub_19D85F910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl21playAlertWithOverrideEP17AVVoiceController16AVVoiceAlertType20AVVoiceAlertOverride_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 code];
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_semaphore_signal(v5);
  }
}

void sub_19D85F988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllermU13block_pointerFvmP20AVVCRecordDeviceInfoP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v24, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v24;
  if (!v24)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_20;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      id v27 = "ControllerImpl.mm";
      __int16 v28 = 1024;
      int v29 = 6000;
      __int16 v30 = 2048;
      uint64_t v31 = v8;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d getRecordDeviceInfoForStream: Nil recording engine for streamID(%llu)", buf, 0x1Cu);
    }

LABEL_20:
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllermU13block_pointerFvmP20AVVCRecordDeviceInfoP7NSErrorE_block_invoke_502;
    v21[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v22 = v12;
    uint64_t v23 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v21);

    id v3 = v25;
    if (!v25) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllermU13block_pointerFvmP20AVVCRecordDeviceInfoP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA86D0;
  id v3 = v25;
  uint64_t v16 = v24;
  uint64_t v17 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = v5;
  int v20 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v15 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "getRecordDeviceInfoForStream_block_invoke");

  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D85FC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (*(void *)(v23 - 88)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v23 - 88));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllermU13block_pointerFvmP20AVVCRecordDeviceInfoP7NSErrorE_block_invoke_502(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D85FCFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllermU13block_pointerFvmP20AVVCRecordDeviceInfoP7NSErrorE_block_invoke_2(void *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [AVVCRecordDeviceInfo alloc];
  id v3 = (std::__shared_weak_count *)a1[6];
  uint64_t v24 = a1[5];
  int v25 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v4 = [(AVVCRecordDeviceInfo *)v2 initWithRecordingEngine:&v24];
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_12;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  id v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[7];
    id v9 = [(AVVCRecordDeviceInfo *)v4 recordRoute];
    BOOL v10 = [(AVVCRecordDeviceInfo *)v4 isRemoteDevice];
    BOOL v11 = [(AVVCRecordDeviceInfo *)v4 remoteProductIdentifier];
    id v12 = [(AVVCRecordDeviceInfo *)v4 remoteDeviceUID];
    unsigned int v13 = [(AVVCRecordDeviceInfo *)v4 remoteDeviceCategory];
    *(_DWORD *)buf = 136316930;
    id v27 = "ControllerImpl.mm";
    __int16 v28 = 1024;
    int v29 = 6008;
    __int16 v30 = 2048;
    uint64_t v31 = v8;
    __int16 v32 = 2112;
    uint64_t v33 = v9;
    __int16 v34 = 1024;
    BOOL v35 = v10;
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    __int16 v38 = 2112;
    int v39 = v12;
    __int16 v40 = 1024;
    unsigned int v41 = v13;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d StreamID(%llu). RecordRoute: %@, isRemoteDevice: %d, productID: %@, uuid: %@, category: %d", buf, 0x46u);
  }
LABEL_12:
  uint64_t v14 = a1[8];
  id v15 = (void *)a1[4];
  BOOL v16 = v15 != 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllermU13block_pointerFvmP20AVVCRecordDeviceInfoP7NSErrorE_block_invoke_504;
  id v20[3] = &unk_1E5965260;
  id v17 = v15;
  uint64_t v18 = a1[7];
  id v22 = v17;
  uint64_t v23 = v18;
  uint64_t v19 = v4;
  int v21 = v19;
  ControllerImpl::safeNotifyAlwaysAsync(v14, v16, v20);
}

void sub_19D85FF68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_ea8_40c47_ZTSNSt3__110shared_ptrI19AVVCRecordingEngineEE64c42_ZTSNSt3__110shared_ptrI14ControllerImplEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  id v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void *__copy_helper_block_ea8_40c47_ZTSNSt3__110shared_ptrI19AVVCRecordingEngineEE64c42_ZTSNSt3__110shared_ptrI14ControllerImplEE(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[9];
  result[8] = a2[8];
  result[9] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllermU13block_pointerFvmP20AVVCRecordDeviceInfoP7NSErrorE_block_invoke_504(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4], 0);
}

id ControllerImpl::getRecordDeviceInfoForStream(ControllerImpl *this, AVVoiceController *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__5561;
  uint64_t v18 = __Block_byref_object_dispose__5562;
  id v19 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllerm_block_invoke;
  v9[3] = &unk_1E5965328;
  id v12 = this;
  uint64_t v13 = a3;
  BOOL v10 = v5;
  BOOL v11 = &v14;
  id v6 = v5;
  makeSynchronous(v9);
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v7;
}

void sub_19D860180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllerm_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = a1[6];
  uint64_t v4 = a1[7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllerm_block_invoke_2;
  v11[3] = &unk_1E59654E0;
  uint64_t v6 = a1[5];
  id v12 = v3;
  uint64_t v13 = v6;
  id v7 = v3;
  uint64_t v8 = v11;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v19, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllermU13block_pointerFvmP20AVVCRecordDeviceInfoP7NSErrorE_block_invoke;
  v14[3] = &unk_1EEFA7FA0;
  uint64_t v9 = v19;
  uint64_t v16 = v19;
  id v17 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v18 = v4;
  BOOL v10 = v8;
  id v15 = v10;
  ControllerImpl::safeWork(v9, v14, (uint64_t)"getRecordDeviceInfoForStream");

  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
}

void sub_19D8602FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,std::__shared_weak_count *a21)
{
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  int v25 = *(std::__shared_weak_count **)(v23 - 40);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28getRecordDeviceInfoForStreamEP17AVVoiceControllerm_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_semaphore_signal(v5);
  }
}

void ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllermU13block_pointerFvmP12NSDictionaryP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v24, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v24;
  if (!v24)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "ControllerImpl.mm";
      __int16 v28 = 1024;
      int v29 = 6037;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d getRecordSettingsForStream: Nil recording engine", buf, 0x12u);
    }

LABEL_20:
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllermU13block_pointerFvmP12NSDictionaryP7NSErrorE_block_invoke_508;
    v21[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v22 = v12;
    uint64_t v23 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v21);

    id v3 = v25;
    if (!v25) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllermU13block_pointerFvmP12NSDictionaryP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA8698;
  id v3 = v25;
  uint64_t v16 = v24;
  id v17 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "getRecordSettingsForStream_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D860624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (*(void *)(v23 - 72)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v23 - 72));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllermU13block_pointerFvmP12NSDictionaryP7NSErrorE_block_invoke_508(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D8606F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllermU13block_pointerFvmP12NSDictionaryP7NSErrorE_block_invoke_2(void *a1)
{
  id v2 = *(id *)(a1[5] + 64);
  uint64_t v3 = a1[7];
  uint64_t v4 = (void *)a1[4];
  BOOL v5 = v4 != 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllermU13block_pointerFvmP12NSDictionaryP7NSErrorE_block_invoke_3;
  v9[3] = &unk_1E5965260;
  id v6 = v4;
  uint64_t v7 = a1[9];
  id v11 = v6;
  uint64_t v12 = v7;
  id v10 = v2;
  id v8 = v2;
  ControllerImpl::safeNotifyAlwaysAsync(v3, v5, v9);
}

void sub_19D8607DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllermU13block_pointerFvmP12NSDictionaryP7NSErrorE_block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4], 0);
}

id ControllerImpl::getRecordSettingsForStream(ControllerImpl *this, AVVoiceController *a2, uint64_t a3)
{
  BOOL v5 = a2;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__5561;
  uint64_t v18 = __Block_byref_object_dispose__5562;
  id v19 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllerm_block_invoke;
  v9[3] = &unk_1E5965328;
  uint64_t v12 = this;
  uint64_t v13 = a3;
  id v10 = v5;
  id v11 = &v14;
  id v6 = v5;
  makeSynchronous(v9);
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v7;
}

void sub_19D860924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllerm_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = a1[6];
  uint64_t v4 = a1[7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllerm_block_invoke_2;
  v11[3] = &unk_1E5965508;
  uint64_t v6 = a1[5];
  id v12 = v3;
  uint64_t v13 = v6;
  id v7 = v3;
  id v8 = v11;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v19, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllermU13block_pointerFvmP12NSDictionaryP7NSErrorE_block_invoke;
  v14[3] = &unk_1EEFA7FA0;
  uint64_t v9 = v19;
  uint64_t v16 = v19;
  id v17 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v18 = v4;
  id v10 = v8;
  id v15 = v10;
  ControllerImpl::safeWork(v9, v14, (uint64_t)"getRecordSettingsForStream");

  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
}

void sub_19D860AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,std::__shared_weak_count *a21)
{
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  int v25 = *(std::__shared_weak_count **)(v23 - 40);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl26getRecordSettingsForStreamEP17AVVoiceControllerm_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_semaphore_signal(v5);
  }
}

void ___ZN14ControllerImpl26isMeteringEnabledForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v24, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v24;
  if (!v24)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "ControllerImpl.mm";
      __int16 v28 = 1024;
      int v29 = 6074;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d isMeteringEnabledForStream: Nil recording engine", buf, 0x12u);
    }

LABEL_20:
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___ZN14ControllerImpl26isMeteringEnabledForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_512;
    v21[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v22 = v12;
    uint64_t v23 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v21);

    id v3 = v25;
    if (!v25) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl26isMeteringEnabledForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA8698;
  id v3 = v25;
  uint64_t v16 = v24;
  id v17 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "isMeteringEnabledForStream_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D860DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (*(void *)(v23 - 72)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v23 - 72));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl26isMeteringEnabledForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_512(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D860E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl26isMeteringEnabledForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  char v3 = *(unsigned char *)(a1[5] + 296);
  uint64_t v4 = a1[7];
  BOOL v5 = v2 != 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___ZN14ControllerImpl26isMeteringEnabledForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_3;
  v8[3] = &unk_1E5965530;
  id v6 = v2;
  uint64_t v7 = a1[9];
  id v9 = v6;
  uint64_t v10 = v7;
  char v11 = v3;
  ControllerImpl::safeNotifyAlwaysAsync(v4, v5, v8);
}

void sub_19D860F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl26isMeteringEnabledForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0);
}

uint64_t ControllerImpl::isMeteringEnabledForStream(ControllerImpl *this, uint64_t a2)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZN14ControllerImpl26isMeteringEnabledForStreamEm_block_invoke;
  v4[3] = &unk_1E5965378;
  v4[5] = this;
  v4[6] = a2;
  v4[4] = &v5;
  makeSynchronous(v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_19D861038(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl26isMeteringEnabledForStreamEm_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = a1[5];
  uint64_t v4 = a1[6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZN14ControllerImpl26isMeteringEnabledForStreamEm_block_invoke_2;
  v11[3] = &unk_1E5965210;
  uint64_t v6 = a1[4];
  id v12 = v3;
  uint64_t v13 = v6;
  id v7 = v3;
  char v8 = v11;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v19, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl26isMeteringEnabledForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke;
  v14[3] = &unk_1EEFA7FA0;
  uint64_t v9 = v19;
  uint64_t v16 = v19;
  id v17 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v18 = v4;
  uint64_t v10 = v8;
  id v15 = v10;
  ControllerImpl::safeWork(v9, v14, (uint64_t)"isMeteringEnabledForStream");

  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
}

void sub_19D8611A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,std::__shared_weak_count *a21)
{
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  int v25 = *(std::__shared_weak_count **)(v23 - 40);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }

  _Unwind_Resume(a1);
}

NSObject *___ZN14ControllerImpl26isMeteringEnabledForStreamEm_block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  result = *(NSObject **)(a1 + 32);
  if (result) {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

void ___ZN14ControllerImpl25updateMeterLevelForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v24, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v24;
  if (!v24)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "ControllerImpl.mm";
      __int16 v28 = 1024;
      int v29 = 6110;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d updateMeterLevelForStream: Nil recording engine", buf, 0x12u);
    }

LABEL_20:
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___ZN14ControllerImpl25updateMeterLevelForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_515;
    v21[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v22 = v12;
    uint64_t v23 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v21);

    id v3 = v25;
    if (!v25) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl25updateMeterLevelForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA8698;
  id v3 = v25;
  uint64_t v16 = v24;
  id v17 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "updateMeterLevelForStream_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D86147C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (*(void *)(v23 - 72)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v23 - 72));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl25updateMeterLevelForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_515(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D861550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl25updateMeterLevelForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 160))(*(void *)(a1 + 40));
  if (v2)
  {
    if (kAVVCScope)
    {
      id v3 = *(id *)kAVVCScope;
      if (!v3) {
        goto LABEL_9;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "ControllerImpl.mm";
      __int16 v16 = 1024;
      int v17 = 6120;
      __int16 v18 = 1024;
      int v19 = v2;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d updateMeterLevelForStream: Error updating meter levels: %d", buf, 0x18u);
    }
  }
LABEL_9:
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 32);
  BOOL v7 = v6 != 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___ZN14ControllerImpl25updateMeterLevelForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_516;
  v10[3] = &unk_1E5965558;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 72);
  id v11 = v8;
  uint64_t v12 = v9;
  int v13 = v2;
  ControllerImpl::safeNotifyAlwaysAsync(v5, v7, v10);
}

void sub_19D861700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl25updateMeterLevelForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_516(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = *(_DWORD *)(a1 + 48) == 0;
  objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, BOOL))(v1 + 16))(v1, v2, v3);
}

void sub_19D8617AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ControllerImpl::updateMeterLevelForStream(ControllerImpl *this, uint64_t a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZN14ControllerImpl25updateMeterLevelForStreamEm_block_invoke;
  v4[3] = &unk_1E5965378;
  v4[5] = this;
  v4[6] = a2;
  v4[4] = &v5;
  makeSynchronous(v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_19D861868(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl25updateMeterLevelForStreamEm_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = a1[5];
  uint64_t v4 = a1[6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZN14ControllerImpl25updateMeterLevelForStreamEm_block_invoke_2;
  v11[3] = &unk_1E5965210;
  uint64_t v6 = a1[4];
  id v12 = v3;
  uint64_t v13 = v6;
  id v7 = v3;
  char v8 = v11;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v19, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl25updateMeterLevelForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke;
  v14[3] = &unk_1EEFA7FA0;
  uint64_t v9 = v19;
  uint64_t v16 = v19;
  int v17 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v18 = v4;
  uint64_t v10 = v8;
  id v15 = v10;
  ControllerImpl::safeWork(v9, v14, (uint64_t)"updateMeterLevelForStream");

  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
}

void sub_19D8619D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,std::__shared_weak_count *a21)
{
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  int v25 = *(std::__shared_weak_count **)(v23 - 40);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }

  _Unwind_Resume(a1);
}

NSObject *___ZN14ControllerImpl25updateMeterLevelForStreamEm_block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  result = *(NSObject **)(a1 + 32);
  if (result) {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

void ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v25, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v25;
  if (!v25)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v28 = "ControllerImpl.mm";
      __int16 v29 = 1024;
      int v30 = 6150;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d getRecordSettingsForStream: Nil recording engine", buf, 0x12u);
    }

LABEL_20:
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_519;
    v22[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v23 = v12;
    uint64_t v24 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v22);

    id v3 = v26;
    if (!v26) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA8938;
  id v3 = v26;
  uint64_t v16 = v25;
  int v17 = v26;
  if (v26) {
    atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v21 = *(_DWORD *)(a1 + 64);
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "getPeakPowerForStreamAndChannel_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D861CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  if (*(void *)(v25 - 72)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v25 - 72));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_519(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, float))(v1 + 16))(v1, v2, -160.0);
}

void sub_19D861D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = *(_DWORD *)(a1 + 80);
  if (*(_DWORD *)(v2 + 52) <= v3) {
    float v4 = -160.0;
  }
  else {
    float v4 = *(float *)(*(void *)(v2 + 304) + 8 * (int)v3 + 4);
  }
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_11;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(v2 + 272);
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "AVVCRecordingEngine.mm";
    __int16 v19 = 1024;
    int v20 = 532;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    __int16 v23 = 2048;
    double v24 = v4;
    __int16 v25 = 1024;
    unsigned int v26 = v3;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d getPeakPowerForChannel on stream(%llu): returning %f for channel %d", buf, 0x2Cu);
  }

LABEL_11:
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void **)(a1 + 32);
  BOOL v10 = v9 != 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_3;
  v13[3] = &unk_1E5965558;
  id v11 = v9;
  uint64_t v12 = *(void *)(a1 + 72);
  id v14 = v11;
  uint64_t v15 = v12;
  float v16 = v4;
  ControllerImpl::safeNotifyAlwaysAsync(v8, v10, v13);
}

void sub_19D861F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0, *(float *)(a1 + 48));
}

float ControllerImpl::getPeakPowerForStreamAndChannel(ControllerImpl *this, uint64_t a2, int a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = -1021313024;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmi_block_invoke;
  v5[3] = &unk_1E59655A8;
  v5[5] = this;
  v5[6] = a2;
  int v6 = a3;
  v5[4] = &v7;
  makeSynchronous(v5);
  float v3 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_19D862050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmi_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmi_block_invoke_2;
  v12[3] = &unk_1E5965580;
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v14 = v7;
  id v8 = v3;
  uint64_t v9 = v12;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v21, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = ___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke;
  v15[3] = &unk_1EEFA8238;
  uint64_t v10 = v21;
  uint64_t v17 = v21;
  uint64_t v18 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v19 = v4;
  id v11 = v9;
  id v16 = v11;
  int v20 = v6;
  ControllerImpl::safeWork(v10, v15, (uint64_t)"getPeakPowerForStreamAndChannel");

  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
}

void sub_19D8621C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  unsigned int v26 = *(std::__shared_weak_count **)(v24 - 56);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }

  _Unwind_Resume(a1);
}

NSObject *___ZN14ControllerImpl31getPeakPowerForStreamAndChannelEmi_block_invoke_2(uint64_t a1, float a2)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  result = *(NSObject **)(a1 + 32);
  if (result) {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

void ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v25, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v25;
  if (!v25)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v28 = "ControllerImpl.mm";
      __int16 v29 = 1024;
      int v30 = 6186;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d getAveragePowerForStreamAndChannel: Nil recording engine", buf, 0x12u);
    }

LABEL_20:
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_527;
    v22[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v23 = v12;
    uint64_t v24 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v22);

    id v3 = v26;
    if (!v26) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA8938;
  id v3 = v26;
  uint64_t v16 = v25;
  uint64_t v17 = v26;
  if (v26) {
    atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v21 = *(_DWORD *)(a1 + 64);
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "getAveragePowerForStreamAndChannel_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D8624AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  if (*(void *)(v25 - 72)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v25 - 72));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_527(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, float))(v1 + 16))(v1, v2, -160.0);
}

void sub_19D862584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = *(_DWORD *)(a1 + 80);
  if (*(_DWORD *)(v2 + 52) <= v3) {
    float v4 = -160.0;
  }
  else {
    float v4 = *(float *)(*(void *)(v2 + 304) + 8 * (int)v3);
  }
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_11;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(v2 + 272);
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "AVVCRecordingEngine.mm";
    __int16 v19 = 1024;
    int v20 = 543;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    __int16 v23 = 2048;
    double v24 = v4;
    __int16 v25 = 1024;
    unsigned int v26 = v3;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d getAveragePowerForChannel on stream(%llu): returning %f for channel %d", buf, 0x2Cu);
  }

LABEL_11:
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void **)(a1 + 32);
  BOOL v10 = v9 != 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_3;
  v13[3] = &unk_1E5965558;
  id v11 = v9;
  uint64_t v12 = *(void *)(a1 + 72);
  id v14 = v11;
  uint64_t v15 = v12;
  float v16 = v4;
  ControllerImpl::safeNotifyAlwaysAsync(v8, v10, v13);
}

void sub_19D862758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0, *(float *)(a1 + 48));
}

float ControllerImpl::getAveragePowerForStreamAndChannel(ControllerImpl *this, uint64_t a2, int a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = -1021313024;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmi_block_invoke;
  v5[3] = &unk_1E59655A8;
  v5[5] = this;
  v5[6] = a2;
  int v6 = a3;
  v5[4] = &v7;
  makeSynchronous(v5);
  float v3 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_19D862848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmi_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmi_block_invoke_2;
  v12[3] = &unk_1E5965580;
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v14 = v7;
  id v8 = v3;
  uint64_t v9 = v12;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v21, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = ___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmiU13block_pointerFvmfP7NSErrorE_block_invoke;
  v15[3] = &unk_1EEFA8238;
  uint64_t v10 = v21;
  uint64_t v17 = v21;
  uint64_t v18 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v19 = v4;
  id v11 = v9;
  id v16 = v11;
  int v20 = v6;
  ControllerImpl::safeWork(v10, v15, (uint64_t)"getAveragePowerForStreamAndChannel");

  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
}

void sub_19D8629C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  unsigned int v26 = *(std::__shared_weak_count **)(v24 - 56);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }

  _Unwind_Resume(a1);
}

NSObject *___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmi_block_invoke_2(uint64_t a1, float a2)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  result = *(NSObject **)(a1 + 32);
  if (result) {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

void ControllerImpl::setRecordStatusChangeBlock(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 copy];
  uint64_t v4 = *(void **)(a1 + 600);
  *(void *)(a1 + 600) = v3;
}

void sub_19D862A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmbU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v26, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v26;
  if (!v26)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      __int16 v29 = "ControllerImpl.mm";
      __int16 v30 = 1024;
      int v31 = 6234;
      __int16 v32 = 2048;
      uint64_t v33 = v9;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d enableSmartRoutingConsideration: Cannot find recording engine for streamID(%lu). Returning.", buf, 0x1Cu);
    }

LABEL_20:
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    BOOL v12 = v10 != 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmbU13block_pointerFvmbP7NSErrorE_block_invoke_531;
    v23[3] = &unk_1E5965A60;
    id v13 = v10;
    uint64_t v14 = *(void *)(a1 + 56);
    id v24 = v13;
    uint64_t v25 = v14;
    ControllerImpl::safeNotifyAlwaysAsync(v11, v12, v23);

    uint64_t v3 = v27;
    if (!v27) {
      return;
    }
    goto LABEL_11;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmbU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v15[3] = &unk_1EEFA8820;
  uint64_t v3 = v27;
  uint64_t v17 = v26;
  uint64_t v18 = v27;
  if (v27) {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v22 = *(unsigned char *)(a1 + 64);
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 40);
  int v20 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v16 = v5;
  uint64_t v21 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v15, "enableSmartRoutingConsideration_block_invoke");

  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D862D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  if (*(void *)(v25 - 88)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v25 - 88));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmbU13block_pointerFvmbP7NSErrorE_block_invoke_531(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D862DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmbU13block_pointerFvmbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void, void))(**(void **)(a1 + 40) + 64))(*(void *)(a1 + 40), 0);
  int v3 = [v2 enableSmartRoutingConsideration:*(unsigned __int8 *)(a1 + 80)];
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(void **)(a1 + 32);
  BOOL v6 = v5 != 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmbU13block_pointerFvmbP7NSErrorE_block_invoke_3;
  v9[3] = &unk_1E5965558;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 72);
  id v10 = v7;
  uint64_t v11 = v8;
  int v12 = v3;
  ControllerImpl::safeNotifyAlwaysAsync(v4, v6, v9);
}

void sub_19D862EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmbU13block_pointerFvmbP7NSErrorE_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = *(_DWORD *)(a1 + 48) == 0;
  objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, BOOL))(v1 + 16))(v1, v2, v3);
}

void sub_19D862FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ControllerImpl::enableSmartRoutingConsideration(ControllerImpl *this, uint64_t a2, char a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmb_block_invoke;
  v5[3] = &unk_1E59655D0;
  v5[5] = this;
  v5[6] = a2;
  char v6 = a3;
  v5[4] = &v7;
  makeSynchronous(v5);
  uint64_t v3 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_19D86306C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmb_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmb_block_invoke_2;
  v12[3] = &unk_1E5965210;
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v14 = v7;
  id v8 = v3;
  uint64_t v9 = v12;
  TraceMethod::TraceMethod((TraceMethod *)v23, "enableSmartRoutingConsideration");
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v21, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmbU13block_pointerFvmbP7NSErrorE_block_invoke;
  v15[3] = &unk_1EEFA8200;
  uint64_t v10 = v21;
  uint64_t v17 = v21;
  uint64_t v18 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v19 = v4;
  uint64_t v11 = v9;
  id v16 = v11;
  char v20 = v6;
  ControllerImpl::safeWork(v10, v15, (uint64_t)"enableSmartRoutingConsideration");

  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v23);
}

void sub_19D8631FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,std::__shared_weak_count *a21)
{
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  uint64_t v25 = *(std::__shared_weak_count **)(v23 - 64);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  TraceMethod::~TraceMethod((TraceMethod *)(v23 - 56));

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl31enableSmartRoutingConsiderationEmb_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 code];
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_semaphore_signal(v5);
  }
}

void sub_19D8632A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordModeU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v23, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v23;
  if (!v23)
  {
    if (kAVVCScope)
    {
      uint64_t v5 = *(id *)kAVVCScope;
      if (!v5) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = "ControllerImpl.mm";
      __int16 v27 = 1024;
      int v28 = 6273;
      __int16 v29 = 2048;
      uint64_t v30 = v7;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d setRecordModeForStream: Cannot find recording engine for streamID(%lu). Returning.", buf, 0x1Cu);
    }

LABEL_20:
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v10 = v8 != 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordModeU13block_pointerFvmbP7NSErrorE_block_invoke_537;
    id v20[3] = &unk_1E5965A60;
    id v11 = v8;
    uint64_t v12 = *(void *)(a1 + 56);
    id v21 = v11;
    uint64_t v22 = v12;
    ControllerImpl::safeNotifyAlwaysAsync(v9, v10, v20);

    id v3 = v24;
    if (!v24) {
      return;
    }
    goto LABEL_11;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordModeU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v13[3] = &unk_1EEFA2CB0;
  long long v15 = *(_OWORD *)(a1 + 56);
  id v3 = v24;
  uint64_t v16 = v23;
  uint64_t v17 = v24;
  if (v24) {
    atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v14 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v13, "setRecordModeForStream_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D863548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  if (*(void *)(v25 - 88)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v25 - 88));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordModeU13block_pointerFvmbP7NSErrorE_block_invoke_537(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D86361C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordModeU13block_pointerFvmbP7NSErrorE_block_invoke_2(void *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!isHACProduct() || a1[5] != 32769)
  {
    uint64_t v8 = a1[6];
    uint64_t v7 = (void *)a1[7];
    if (v8 == v7[42]) {
      goto LABEL_14;
    }
    if (v8 != 1)
    {
LABEL_12:
      id v11 = (*(void (**)(void *, void))(*v7 + 64))(v7, 0);
      [v11 setClientRequestsRecording:v8 == 1];

      int v12 = (*(uint64_t (**)(void))(*(void *)a1[7] + 288))(a1[7]);
      if (v12)
      {
        uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
LABEL_27:
        id v5 = (id)v13;
LABEL_28:
        char v14 = 0;
        goto LABEL_29;
      }
LABEL_14:
      id v5 = 0;
      goto LABEL_15;
    }
    uint64_t v9 = (*(void (**)(void *, void))(*v7 + 64))(v7, 0);
    int v10 = [v9 isSessionActive];

    if (v10)
    {
      uint64_t v8 = a1[6];
      uint64_t v7 = (void *)a1[7];
      goto LABEL_12;
    }
    if (kAVVCScope)
    {
      uint64_t v17 = *(id *)kAVVCScope;
      if (!v17)
      {
LABEL_26:
        uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = a1[5];
      *(_DWORD *)buf = 136315650;
      *(void *)uint64_t v33 = "ControllerImpl.mm";
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = 6311;
      __int16 v34 = 1024;
      int v35 = v19;
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setRecordModeForStream: Switching to Recording mode when session is not active !! streamID(%d)", buf, 0x18u);
    }

    goto LABEL_26;
  }
  uint64_t v2 = a1[6];
  id v3 = (*(void (**)(void, void))(*(void *)a1[7] + 64))(a1[7], 0);
  id v31 = 0;
  char v4 = [v3 setIsUsingBuiltInMicForRecording:v2 == 1 error:&v31];
  id v5 = v31;

  if (v5) {
    char v6 = v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0)
  {
    long long v15 = *(NSObject **)kAVVCScope;
    uint64_t v16 = CALog::Scope::oslog(*(id *)kAVVCScope);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v33 = 0;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = v5;
      _os_log_fault_impl(&dword_19D794000, v15, OS_LOG_TYPE_FAULT, "setIsUsingBuiltInMicForRecording failed: return (%d), error (%@)", buf, 0x12u);
    }

    goto LABEL_28;
  }
  AVVCRecordingEngine::setRecordMode(a1[7], a1[6]);
LABEL_15:
  char v14 = 1;
LABEL_29:
  uint64_t v20 = a1[9];
  id v21 = (void *)a1[4];
  BOOL v22 = v21 != 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordModeU13block_pointerFvmbP7NSErrorE_block_invoke_538;
  void v26[3] = &unk_1E59655F8;
  id v23 = v21;
  uint64_t v24 = a1[5];
  id v28 = v23;
  uint64_t v29 = v24;
  char v30 = v14;
  id v27 = v5;
  id v25 = v5;
  ControllerImpl::safeNotifyAlwaysAsync(v20, v22, v26);
}

void sub_19D8639F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordModeU13block_pointerFvmbP7NSErrorE_block_invoke_538(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
}

uint64_t ControllerImpl::setRecordModeForStream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordMode_block_invoke;
  v5[3] = &unk_1E5965620;
  v5[6] = a2;
  void v5[7] = a3;
  v5[4] = &v6;
  v5[5] = a1;
  makeSynchronous(v5);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_19D863AFC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordMode_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v6 = a1[7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordMode_block_invoke_2;
  v12[3] = &unk_1E5965210;
  uint64_t v7 = a1[4];
  id v13 = v3;
  uint64_t v14 = v7;
  id v8 = v3;
  int v9 = v12;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v21, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordModeU13block_pointerFvmbP7NSErrorE_block_invoke;
  v15[3] = &unk_1EEFA8318;
  uint64_t v10 = v21;
  uint64_t v17 = v21;
  id v18 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v19 = v4;
  id v11 = v9;
  id v16 = v11;
  uint64_t v20 = v6;
  ControllerImpl::safeWork(v10, v15, (uint64_t)"setRecordModeForStream");

  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
}

void sub_19D863C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  uint64_t v26 = *(std::__shared_weak_count **)(v24 - 56);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setRecordModeForStreamEm27AVVoiceControllerRecordMode_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 code];
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_semaphore_signal(v5);
  }
}

void sub_19D863D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22getRecordModeForStreamEmU13block_pointerFvm27AVVoiceControllerRecordModeP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v29, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 48));
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  uint64_t v2 = v29;
  if (!v29)
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_17:
        uint64_t v11 = *(void *)(a1 + 56);
        int v12 = *(void **)(a1 + 32);
        BOOL v13 = v12 != 0;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = ___ZN14ControllerImpl22getRecordModeForStreamEmU13block_pointerFvm27AVVoiceControllerRecordModeP7NSErrorE_block_invoke_545;
        v24[3] = &unk_1E59653F0;
        id v14 = v12;
        uint64_t v15 = *(void *)(a1 + 48);
        id v25 = v14;
        uint64_t v26 = v28;
        uint64_t v27 = v15;
        ControllerImpl::safeNotifyAlwaysAsync(v11, v13, v24);

        id v3 = v30;
        goto LABEL_18;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      __int16 v32 = "ControllerImpl.mm";
      __int16 v33 = 1024;
      int v34 = 6357;
      __int16 v35 = 2048;
      uint64_t v36 = v10;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d getRecordModeForStream: Cannot find recording engine for streamID(%lu). Returning.", buf, 0x1Cu);
    }

    goto LABEL_17;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3321888768;
  v16[2] = ___ZN14ControllerImpl22getRecordModeForStreamEmU13block_pointerFvm27AVVoiceControllerRecordModeP7NSErrorE_block_invoke_2;
  v16[3] = &unk_1EEFA8A18;
  id v3 = v30;
  uint64_t v19 = v29;
  uint64_t v20 = v30;
  if (v30) {
    atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 64);
  id v18 = v28;
  uint64_t v21 = v5;
  BOOL v22 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v17 = v6;
  uint64_t v23 = v7;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v16, "getRecordModeForStream_block_invoke");

  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
LABEL_18:
  _Block_object_dispose(v28, 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_19D863FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  uint64_t v26 = *(std::__shared_weak_count **)(v24 - 88);
  _Block_object_dispose((const void *)(v24 - 128), 8);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22getRecordModeForStreamEmU13block_pointerFvm27AVVoiceControllerRecordModeP7NSErrorE_block_invoke_545(void *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 24);
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v1, v3);
}

void sub_19D8640DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22getRecordModeForStreamEmU13block_pointerFvm27AVVoiceControllerRecordModeP7NSErrorE_block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  if (*(void *)(v2 + 224) == 5) {
    *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(v2 + 336);
  }
  uint64_t v3 = a1[8];
  id v4 = (void *)a1[4];
  BOOL v5 = v4 != 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZN14ControllerImpl22getRecordModeForStreamEmU13block_pointerFvm27AVVoiceControllerRecordModeP7NSErrorE_block_invoke_3;
  v9[3] = &unk_1E59653F0;
  id v6 = v4;
  uint64_t v7 = a1[10];
  uint64_t v8 = a1[5];
  id v10 = v6;
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  ControllerImpl::safeNotifyAlwaysAsync(v3, v5, v9);
}

void sub_19D8641C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl22getRecordModeForStreamEmU13block_pointerFvm27AVVoiceControllerRecordModeP7NSErrorE_block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], a1[6], *(void *)(*(void *)(a1[5] + 8) + 24), 0);
}

uint64_t ControllerImpl::getRecordModeForStream(ControllerImpl *this, uint64_t a2)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZN14ControllerImpl22getRecordModeForStreamEm_block_invoke;
  v4[3] = &unk_1E5965378;
  v4[5] = this;
  v4[6] = a2;
  v4[4] = &v5;
  makeSynchronous(v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_19D8642A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22getRecordModeForStreamEm_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZN14ControllerImpl22getRecordModeForStreamEm_block_invoke_2;
  v11[3] = &unk_1E59653C8;
  uint64_t v6 = a1[4];
  id v12 = v3;
  uint64_t v13 = v6;
  id v7 = v3;
  uint64_t v8 = v11;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v20, *(void *)(v4 + 8), *(std::__shared_weak_count **)(v4 + 16));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl22getRecordModeForStreamEmU13block_pointerFvm27AVVoiceControllerRecordModeP7NSErrorE_block_invoke;
  v14[3] = &unk_1EEFA8388;
  uint64_t v16 = v4;
  uint64_t v17 = v5;
  uint64_t v9 = v20;
  uint64_t v18 = v20;
  uint64_t v19 = v21;
  if (v21) {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v10 = v8;
  id v15 = v10;
  ControllerImpl::safeWork(v9, v14, (uint64_t)"getRecordModeForStream");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
}

void sub_19D864410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  if (a24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a24);
  }
  id v28 = *(std::__shared_weak_count **)(v26 - 56);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }

  _Unwind_Resume(a1);
}

NSObject *___ZN14ControllerImpl22getRecordModeForStreamEm_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  result = *(NSObject **)(a1 + 32);
  if (result) {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

uint64_t ControllerImpl::setAnnounceCallsEnabledForStream(ControllerImpl *this, uint64_t a2, char a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmb_block_invoke;
  v5[3] = &unk_1E59655D0;
  v5[5] = this;
  v5[6] = a2;
  char v6 = a3;
  v5[4] = &v7;
  makeSynchronous(v5);
  uint64_t v3 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_19D86451C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmb_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmb_block_invoke_2;
  v12[3] = &unk_1E5965210;
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v14 = v7;
  id v8 = v3;
  uint64_t v9 = v12;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v21, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke;
  v15[3] = &unk_1EEFA8200;
  uint64_t v10 = v21;
  uint64_t v17 = v21;
  uint64_t v18 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v19 = v4;
  uint64_t v11 = v9;
  id v16 = v11;
  char v20 = v6;
  ControllerImpl::safeWork(v10, v15, (uint64_t)"setAnnounceCallsEnabledForStream");

  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
}

void sub_19D864694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  uint64_t v26 = *(std::__shared_weak_count **)(v24 - 56);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmb_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 code];
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_semaphore_signal(v5);
  }
}

void sub_19D864738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v26, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v26;
  if (!v26)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      uint64_t v29 = "ControllerImpl.mm";
      __int16 v30 = 1024;
      int v31 = 6411;
      __int16 v32 = 2048;
      uint64_t v33 = v9;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d setAnnounceCallsEnabledForStream: Cannot find recording engine for streamID(%lu). Returning.", buf, 0x1Cu);
    }

LABEL_20:
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    BOOL v12 = v10 != 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_553;
    v23[3] = &unk_1E5965A60;
    id v13 = v10;
    uint64_t v14 = *(void *)(a1 + 56);
    id v24 = v13;
    uint64_t v25 = v14;
    ControllerImpl::safeNotifyAlwaysAsync(v11, v12, v23);

    id v3 = v27;
    if (!v27) {
      return;
    }
    goto LABEL_11;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v15[3] = &unk_1EEFA8820;
  id v3 = v27;
  uint64_t v17 = v26;
  uint64_t v18 = v27;
  if (v27) {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v22 = *(unsigned char *)(a1 + 64);
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 40);
  char v20 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v16 = v5;
  uint64_t v21 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v15, "setAnnounceCallsEnabledForStream_block_invoke");

  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D8649E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  if (*(void *)(v25 - 88)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v25 - 88));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_553(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D864AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  AVVCRecordingEngine::getActivationContextSettings(*(AVVCRecordingEngine **)(a1 + 40));
  uint64_t v2 = (AVVCContextSettings *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v2)
  {
    [(AVVCContextSettings *)v2 setAnnounceCallsEnabled:*(unsigned __int8 *)(a1 + 80)];
    AVVCRecordingEngine::setActivationContextSettings(*(AVVCRecordingEngine **)(a1 + 40), v3);
  }
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(void **)(a1 + 32);
  BOOL v6 = v5 != 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_3;
  v9[3] = &unk_1E5965A60;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 72);
  id v10 = v7;
  uint64_t v11 = v8;
  ControllerImpl::safeNotifyAlwaysAsync(v4, v6, v9);
}

void sub_19D864BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl32setAnnounceCallsEnabledForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 1, 0);
}

void ControllerImpl::getInputChannelInfoForStream(uint64_t a1, void *a2)
{
  id v3 = a2;
  TraceMethod::TraceMethod((TraceMethod *)v10, "getInputChannelInfoCompletion");
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v8, *(void *)(a1 + 8), *(std::__shared_weak_count **)(a1 + 16));
  uint64_t v4 = v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___ZN14ControllerImpl28getInputChannelInfoForStreamEmU13block_pointerFvP12NSDictionaryP7NSErrorE_block_invoke;
  v6[3] = &unk_1E5965A18;
  id v5 = v3;
  id v7 = v5;
  ControllerImpl::safeNotifyAlwaysAsync(v4, v3 != 0, v6);

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v10);
}

void sub_19D864CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  TraceMethod::~TraceMethod((TraceMethod *)(v16 - 40));

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28getInputChannelInfoForStreamEmU13block_pointerFvP12NSDictionaryP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

void sub_19D864D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32)) {
    return;
  }
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v28, *(void *)(*(void *)(a1 + 48) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 48) + 584), *(void *)(a1 + 64));
  uint64_t v2 = v28;
  if (!v28)
  {
    if (kAVVCScope)
    {
      uint64_t v9 = *(id *)kAVVCScope;
      if (!v9) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 136315650;
      int v31 = "ControllerImpl.mm";
      __int16 v32 = 1024;
      int v33 = 6532;
      __int16 v34 = 2048;
      uint64_t v35 = v11;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d setDuckOthersForStream: Cannot find recording engine for streamID(%lu). Returning.", buf, 0x1Cu);
    }

LABEL_21:
    BOOL v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    BOOL v14 = v12 != 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsU13block_pointerFvmbP7NSErrorE_block_invoke_556;
    v25[3] = &unk_1E5965A60;
    id v15 = v12;
    uint64_t v16 = *(void *)(a1 + 64);
    id v26 = v15;
    uint64_t v27 = v16;
    ControllerImpl::safeNotifyAlwaysAsync(v13, v14, v25);

    id v3 = v29;
    if (!v29) {
      return;
    }
    goto LABEL_12;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3321888768;
  v17[2] = ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v17[3] = &unk_1EEFA8A88;
  id v3 = v29;
  uint64_t v20 = v28;
  uint64_t v21 = v29;
  if (v29) {
    atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v4 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v5 = *(std::__shared_weak_count **)(a1 + 56);
  id v18 = v4;
  uint64_t v22 = v6;
  uint64_t v23 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  id v19 = v7;
  uint64_t v24 = v8;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v17, "setDuckOthersForStream_block_invoke");

  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }

  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v3) {
LABEL_12:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D865028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  if (*(void *)(v25 - 88)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v25 - 88));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsU13block_pointerFvmbP7NSErrorE_block_invoke_556(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D865104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsU13block_pointerFvmbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void, void))(**(void **)(a1 + 48) + 64))(*(void *)(a1 + 48), 0);
  id v3 = [*(id *)(a1 + 32) duckOverride];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 duckOthers];
    uint64_t v6 = [v4 mixWithOthers];
    id v39 = 0;
    char v7 = [v2 setDuckOthers:v5 mixWithOthers:v6 error:&v39];
    id v8 = v39;

    uint64_t v9 = [v4 duckToLevel];

    if (v9)
    {
      if ([v4 isBlur])
      {
        id v10 = [v4 duckToLevel];
        id v38 = v8;
        uint64_t v11 = &v38;
        [v2 setDuckToLevelDB:v10 error:&v38];
      }
      else
      {
        id v10 = [v4 duckToLevel];
        id v37 = v8;
        uint64_t v11 = &v37;
        [v2 setDuckToLevelScalar:v10 error:&v37];
      }
      id v12 = *v11;

      id v8 = v12;
    }
  }
  else
  {
    id v8 = 0;
    char v7 = 1;
  }
  uint64_t v13 = [*(id *)(a1 + 32) duckLevel];
  BOOL v14 = v13;
  if (v13)
  {
    if ([v13 isBlur])
    {
      id v15 = [v14 value];
      id v36 = v8;
      uint64_t v16 = &v36;
      [v2 setDuckToLevelDB:v15 error:&v36];
    }
    else
    {
      id v15 = [v14 value];
      id v35 = v8;
      uint64_t v16 = &v35;
      [v2 setDuckToLevelScalar:v15 error:&v35];
    }
    id v17 = *v16;

    id v8 = v17;
  }
  id v18 = [*(id *)(a1 + 32) fadeDuration];
  id v19 = v18;
  if (v18)
  {
    uint64_t v20 = [v18 fadeOut];
    uint64_t v21 = [v19 fadeIn];
    id v34 = v8;
    char v7 = [v2 setDuckingFadeOutDuration:v20 fadeInDuration:v21 error:&v34];
    id v22 = v34;

    id v8 = v22;
  }
  uint64_t v23 = *(void *)(a1 + 64);
  uint64_t v24 = *(void **)(a1 + 40);
  BOOL v25 = v24 != 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsU13block_pointerFvmbP7NSErrorE_block_invoke_3;
  v29[3] = &unk_1E59655F8;
  id v26 = v24;
  uint64_t v27 = *(void *)(a1 + 80);
  id v31 = v26;
  uint64_t v32 = v27;
  char v33 = v7;
  id v28 = v8;
  id v30 = v28;
  ControllerImpl::safeNotifyAlwaysAsync(v23, v25, v29);
}

void sub_19D865434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsU13block_pointerFvmbP7NSErrorE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
}

uint64_t ControllerImpl::setDuckOthersForStream(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__5561;
  uint64_t v21 = __Block_byref_object_dispose__5562;
  id v22 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsPU15__autoreleasingP7NSError_block_invoke;
  v11[3] = &unk_1E5965670;
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  id v8 = v7;
  id v12 = v8;
  uint64_t v13 = &v23;
  BOOL v14 = &v17;
  makeSynchronous(v11);
  if (a4) {
    *a4 = (id) v18[5];
  }
  uint64_t v9 = *((unsigned __int8 *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

void sub_19D865638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v25 - 80), 8);

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsPU15__autoreleasingP7NSError_block_invoke_2;
  v13[3] = &unk_1E5965648;
  long long v15 = *(_OWORD *)(a1 + 40);
  id v14 = v3;
  id v7 = v3;
  id v8 = v6;
  uint64_t v9 = v13;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v22, *(void *)(v4 + 8), *(std::__shared_weak_count **)(v4 + 16));
  uint64_t v10 = v22;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3321888768;
  v16[2] = ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsU13block_pointerFvmbP7NSErrorE_block_invoke;
  v16[3] = &unk_1EEFA83F8;
  id v11 = v8;
  id v17 = v11;
  uint64_t v19 = v22;
  uint64_t v20 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v21 = v5;
  id v12 = v9;
  id v18 = v12;
  ControllerImpl::safeWork(v10, v16, (uint64_t)"setDuckOthersForStream");

  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }

  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
}

void sub_19D8657F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }

  id v28 = *(std::__shared_weak_count **)(v26 - 56);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl22setDuckOthersForStreamEmP16AVVCDuckSettingsPU15__autoreleasingP7NSError_block_invoke_2(void *a1, uint64_t a2, char a3, void *a4)
{
  id v8 = a4;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  id v7 = a1[4];
  if (v7) {
    dispatch_semaphore_signal(v7);
  }
}

void ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v24, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v24;
  if (!v24)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "ControllerImpl.mm";
      __int16 v28 = 1024;
      int v29 = 6634;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d isDuckingSupportedOnPickedRouteForStream: Nil recording engine", buf, 0x12u);
    }

LABEL_20:
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_565;
    v21[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v22 = v12;
    uint64_t v23 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v21);

    id v3 = v25;
    if (!v25) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA8698;
  id v3 = v25;
  uint64_t v16 = v24;
  id v17 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "isDuckingSupportedOnPickedRouteForStream_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D865B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (*(void *)(v23 - 72)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v23 - 72));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_565(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D865C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void, void))(**(void **)(a1 + 40) + 64))(*(void *)(a1 + 40), 0);
  char v3 = [v2 isSWVolumeSupportedOnPickedRoute];
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(void **)(a1 + 32);
  BOOL v6 = v5 != 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_3;
  v9[3] = &unk_1E5965530;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 72);
  id v10 = v7;
  uint64_t v11 = v8;
  char v12 = v3;
  ControllerImpl::safeNotifyAlwaysAsync(v4, v6, v9);
}

void sub_19D865D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0);
}

uint64_t ControllerImpl::isDuckingSupportedOnPickedRouteForStream(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5561;
  uint64_t v11 = __Block_byref_object_dispose__5562;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmPU15__autoreleasingP7NSError_block_invoke;
  v6[3] = &unk_1E5965698;
  v6[6] = a1;
  v6[7] = a2;
  void v6[4] = &v13;
  v6[5] = &v7;
  makeSynchronous(v6);
  if (a3) {
    *a3 = (id) v8[5];
  }
  uint64_t v4 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void sub_19D865E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Block_object_dispose((const void *)(v22 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmPU15__autoreleasingP7NSError_block_invoke_2;
  v10[3] = &unk_1E5965648;
  long long v12 = *(_OWORD *)(a1 + 32);
  id v11 = v3;
  id v6 = v3;
  uint64_t v7 = v10;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v18, *(void *)(v5 + 8), *(std::__shared_weak_count **)(v5 + 16));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke;
  v13[3] = &unk_1EEFA7FA0;
  uint64_t v8 = v18;
  uint64_t v15 = v18;
  char v16 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v17 = v4;
  uint64_t v9 = v7;
  id v14 = v9;
  ControllerImpl::safeWork(v8, v13, (uint64_t)"isDuckingSupportedOnPickedRouteForStream");

  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
}

void sub_19D865FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }
  uint64_t v27 = *(std::__shared_weak_count **)(v25 - 40);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl40isDuckingSupportedOnPickedRouteForStreamEmPU15__autoreleasingP7NSError_block_invoke_2(void *a1, uint64_t a2, char a3, void *a4)
{
  id v8 = a4;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  uint64_t v7 = a1[4];
  if (v7) {
    dispatch_semaphore_signal(v7);
  }
}

void ControllerImpl::enableTriangleModeForStream(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v7 = a4;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v16, *(void *)(a1 + 8), *(std::__shared_weak_count **)(a1 + 16));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = ___ZN14ControllerImpl27enableTriangleModeForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke;
  v10[3] = &unk_1EEFA8200;
  uint64_t v8 = v16;
  uint64_t v12 = v16;
  uint64_t v13 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v14 = a2;
  id v9 = v7;
  id v11 = v9;
  char v15 = a3;
  ControllerImpl::safeWork(v8, v10, (uint64_t)"enableTriangleModeForStream");

  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
}

void sub_19D8661A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  uint64_t v19 = *(std::__shared_weak_count **)(v17 - 40);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl27enableTriangleModeForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v25, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v25;
  if (!v25)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v28 = "ControllerImpl.mm";
      __int16 v29 = 1024;
      int v30 = 6687;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d enableTriangleModeForStream: Nil recording engine", buf, 0x12u);
    }

LABEL_20:
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = ___ZN14ControllerImpl27enableTriangleModeForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_568;
    v22[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v23 = v12;
    uint64_t v24 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v22);

    id v3 = v26;
    if (!v26) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl27enableTriangleModeForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA8820;
  id v3 = v26;
  uint64_t v16 = v25;
  uint64_t v17 = v26;
  if (v26) {
    atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v21 = *(unsigned char *)(a1 + 64);
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "enableTriangleModeForStream_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D86645C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  if (*(void *)(v25 - 72)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v25 - 72));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl27enableTriangleModeForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_568(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D866530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl27enableTriangleModeForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void, void))(**(void **)(a1 + 40) + 64))(*(void *)(a1 + 40), 0);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 80);
  id v17 = 0;
  char v4 = [v2 setEnableBTTriangleMode:v3 error:&v17];
  id v5 = v17;
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = *(void **)(a1 + 32);
  BOOL v8 = v7 != 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___ZN14ControllerImpl27enableTriangleModeForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_3;
  v12[3] = &unk_1E59655F8;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 72);
  id v14 = v9;
  uint64_t v15 = v10;
  char v16 = v4;
  id v11 = v5;
  id v13 = v11;
  ControllerImpl::safeNotifyAlwaysAsync(v6, v8, v12);
}

void sub_19D866668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl27enableTriangleModeForStreamEmbU13block_pointerFvmbP7NSErrorE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
}

void ControllerImpl::startKeepAliveQueueForStream(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v13, *(void *)(a1 + 8), *(std::__shared_weak_count **)(a1 + 16));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke;
  v8[3] = &unk_1EEFA7FA0;
  uint64_t v6 = v13;
  uint64_t v10 = v13;
  id v11 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = a2;
  id v7 = v5;
  id v9 = v7;
  ControllerImpl::safeWork(v6, v8, (uint64_t)"startKeepAliveQueueForStream");

  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

void sub_19D8667A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  uint64_t v18 = *(std::__shared_weak_count **)(v16 - 40);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v24, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v24;
  if (!v24)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "ControllerImpl.mm";
      __int16 v28 = 1024;
      int v29 = 6717;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d startKeepAliveQueueForStream: Nil recording engine", buf, 0x12u);
    }

LABEL_20:
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_571;
    v21[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v22 = v12;
    uint64_t v23 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v21);

    uint64_t v3 = v25;
    if (!v25) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA8698;
  uint64_t v3 = v25;
  uint64_t v16 = v24;
  id v17 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "startKeepAliveQueueForStream_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D866A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (*(void *)(v23 - 72)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v23 - 72));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_571(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D866B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  if (AVVCRouteManager::isOutputHandsFree(*(id **)(*(void *)(a1 + 40) + 376)))
  {
    uint64_t v2 = +[AVVCKeepAliveManager sharedManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3321888768;
    v17[2] = ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_3;
    v17[3] = &unk_1EEFA7F68;
    id v3 = *(std::__shared_weak_count **)(a1 + 64);
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = v3;
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 72);
    id v18 = v4;
    uint64_t v21 = v5;
    [v2 createWithCompletion:v17];

    uint64_t v6 = (*(void (**)(void, void))(**(void **)(a1 + 40) + 64))(*(void *)(a1 + 40), 0);
    id v7 = v6;
    if (v6 && (int)[v6 sessionState] >= 5)
    {
      id v8 = +[AVVCKeepAliveManager sharedManager];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3321888768;
      v12[2] = ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_574;
      v12[3] = &unk_1EEFA7F68;
      id v9 = *(std::__shared_weak_count **)(a1 + 64);
      uint64_t v14 = *(void *)(a1 + 56);
      id v15 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 72);
      id v13 = v10;
      uint64_t v16 = v11;
      [v8 startWithCompletion:v12];

      if (v15) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v15);
      }
    }

    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
  }
}

void sub_19D866D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }

  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 code])
  {
    id v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    BOOL v6 = v4 != 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_4;
    v9[3] = &unk_1E5965260;
    id v7 = v4;
    uint64_t v8 = a1[7];
    id v11 = v7;
    uint64_t v12 = v8;
    id v10 = v3;
    ControllerImpl::safeNotifyAlwaysAsync(v5, v6, v9);
  }
}

void sub_19D866E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_574(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  BOOL v6 = v4 != 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2_575;
  v10[3] = &unk_1E5965260;
  id v7 = v4;
  uint64_t v8 = a1[7];
  id v12 = v7;
  uint64_t v13 = v8;
  id v11 = v3;
  id v9 = v3;
  ControllerImpl::safeNotifyAlwaysAsync(v5, v6, v10);
}

void sub_19D866F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2_575(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v4 = [*(id *)(a1 + 32) code] == 0;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, BOOL, uint64_t))(v3 + 16);

  return v6(v3, v2, v4, v5);
}

uint64_t ___ZN14ControllerImpl28startKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v4 = [*(id *)(a1 + 32) code] == 0;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, BOOL, uint64_t))(v3 + 16);

  return v6(v3, v2, v4, v5);
}

void ControllerImpl::stopKeepAliveQueueForStream(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v13, *(void *)(a1 + 8), *(std::__shared_weak_count **)(a1 + 16));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke;
  v8[3] = &unk_1EEFA7FA0;
  uint64_t v6 = v13;
  uint64_t v10 = v13;
  id v11 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = a2;
  id v7 = v5;
  id v9 = v7;
  ControllerImpl::safeWork(v6, v8, (uint64_t)"stopKeepAliveQueueForStream");

  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

void sub_19D8670F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  id v18 = *(std::__shared_weak_count **)(v16 - 40);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }

  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v24, *(void *)(*(void *)(a1 + 40) + 576), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 584), *(void *)(a1 + 56));
  uint64_t v2 = v24;
  if (!v24)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "ControllerImpl.mm";
      __int16 v28 = 1024;
      int v29 = 6756;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d stopKeepAliveQueueForStream: Nil recording engine", buf, 0x12u);
    }

LABEL_20:
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = v9 != 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_578;
    v21[3] = &unk_1E5965A60;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v22 = v12;
    uint64_t v23 = v13;
    ControllerImpl::safeNotifyAlwaysAsync(v10, v11, v21);

    uint64_t v3 = v25;
    if (!v25) {
      return;
    }
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2;
  v14[3] = &unk_1EEFA8698;
  uint64_t v3 = v25;
  uint64_t v16 = v24;
  id v17 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  BOOL v4 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v20 = v6;
  (*(void (**)(uint64_t, void *, const char *))(*(void *)v2 + 360))(v2, v14, "stopKeepAliveQueueForStream_block_invoke");

  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v3) {
LABEL_11:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_19D8673AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (*(void *)(v23 - 72)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)(v23 - 72));
  }
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_578(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11793 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v2, 0);
}

void sub_19D867480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void, void))(**(void **)(a1 + 40) + 64))(*(void *)(a1 + 40), 0);
  id v3 = v2;
  if (v2 && (int)[v2 sessionState] >= 4)
  {
    BOOL v4 = +[AVVCKeepAliveManager sharedManager];
    [v4 stopWithCompletion:0];
  }
  id v5 = +[AVVCKeepAliveManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  v9[2] = ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_3;
  v9[3] = &unk_1EEFA7F68;
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 72);
  id v10 = v7;
  uint64_t v13 = v8;
  [v5 destroyWithCompletion:v9];

  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

void sub_19D8675D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  BOOL v6 = v4 != 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_4;
  v10[3] = &unk_1E5965260;
  id v7 = v4;
  uint64_t v8 = a1[7];
  id v12 = v7;
  uint64_t v13 = v8;
  id v11 = v3;
  id v9 = v3;
  ControllerImpl::safeNotifyAlwaysAsync(v5, v6, v10);
}

void sub_19D8676D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14ControllerImpl27stopKeepAliveQueueForStreamEmU13block_pointerFvmbP7NSErrorE_block_invoke_4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v4 = [*(id *)(a1 + 32) code] == 0;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, BOOL, uint64_t))(v3 + 16);

  return v6(v3, v2, v4, v5);
}

uint64_t ___ZN14ControllerImpl18getDeviceLatenciesEmU13block_pointerFvP12NSDictionaryP7NSErrorE_block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void ___ZN14ControllerImpl48setEnableInterruptionByRecordingClientsForStreamEmb_block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void, void))(**(void **)(a1 + 40) + 64))(*(void *)(a1 + 40), 0);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  id v5 = 0;
  [v2 setPrefersBeingInterruptedByNextActiveRecordingClient:v3 error:&v5];
  id v4 = v5;

  if (v4) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 code];
  }
}

void sub_19D86780C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Initialize_Logging(void)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (Initialize_Logging(void)::once != -1) {
    dispatch_once(&Initialize_Logging(void)::once, &__block_literal_global_6014);
  }
  unsigned int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"debug_level", @"com.apple.avfoundation.avvc", 0);
  switch(AppIntegerValue)
  {
    case 0xFFFFFFFF:
      char v1 = 1;
      unsigned int v2 = 1;
      break;
    case 0u:
      if (kAVVCScope)
      {
        uint64_t v3 = *(NSObject **)kAVVCScope;
        if (!*(void *)kAVVCScope) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v3 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315394;
        id v22 = "AVVC_Log.cpp";
        __int16 v23 = 1024;
        int v24 = 45;
        _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d NOTE: AVVC Details logging is turned on by default for development", (uint8_t *)&v21, 0x12u);
      }
      goto LABEL_14;
    case 1u:
      char v1 = 0;
      unsigned int v2 = 4;
      break;
    case 2u:
LABEL_14:
      char v1 = 0;
      unsigned int v2 = 5;
      break;
    case 3u:
      char v1 = 0;
      unsigned int v2 = 6;
      break;
    default:
      char v1 = 0;
      unsigned int v2 = 7;
      break;
  }
  if (!CFPreferencesGetAppBooleanValue(@"debug_encoding", @"com.apple.avfoundation.avvc", 0))
  {
    uint64_t v5 = 0;
    goto LABEL_24;
  }
  if (!kAVVCScope)
  {
    id v4 = MEMORY[0x1E4F14500];
LABEL_21:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 53;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d debug_encoding on", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_23;
  }
  id v4 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v5 = 0x800000000;
LABEL_24:
  if (!CFPreferencesGetAppBooleanValue(@"debug_endpoint", @"com.apple.avfoundation.avvc", 0)) {
    goto LABEL_32;
  }
  if (!kAVVCScope)
  {
    BOOL v6 = MEMORY[0x1E4F14500];
LABEL_29:
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 54;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d debug_endpoint on", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_31;
  }
  BOOL v6 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_29;
  }
LABEL_31:
  v5 |= 0x1000000000uLL;
LABEL_32:
  if (!CFPreferencesGetAppBooleanValue(@"debug_callbacks", @"com.apple.avfoundation.avvc", 0)) {
    goto LABEL_40;
  }
  if (!kAVVCScope)
  {
    id v7 = MEMORY[0x1E4F14500];
LABEL_37:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 55;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d debug_callbacks on", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_39;
  }
  id v7 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_37;
  }
LABEL_39:
  v5 |= 0x2000000000uLL;
LABEL_40:
  if (!CFPreferencesGetAppBooleanValue(@"debug_locking", @"com.apple.avfoundation.avvc", 0)) {
    goto LABEL_48;
  }
  if (!kAVVCScope)
  {
    uint64_t v8 = MEMORY[0x1E4F14500];
LABEL_45:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 56;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d debug_locking on", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_47;
  }
  uint64_t v8 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_45;
  }
LABEL_47:
  v5 |= 0x8000000000uLL;
LABEL_48:
  if (!CFPreferencesGetAppBooleanValue(@"debug_state", @"com.apple.avfoundation.avvc", 0)) {
    goto LABEL_56;
  }
  if (!kAVVCScope)
  {
    id v9 = MEMORY[0x1E4F14500];
LABEL_53:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 57;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d debug_state on", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_55;
  }
  id v9 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_53;
  }
LABEL_55:
  v5 |= 0x4000000000uLL;
LABEL_56:
  if (!CFPreferencesGetAppBooleanValue(@"debug_trace", @"com.apple.avfoundation.avvc", 0)) {
    goto LABEL_64;
  }
  if (!kAVVCScope)
  {
    id v10 = MEMORY[0x1E4F14500];
LABEL_61:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 58;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d debug_trace on", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_63;
  }
  id v10 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_61;
  }
LABEL_63:
  v5 |= 0x10000000000uLL;
LABEL_64:
  if (!CFPreferencesGetAppBooleanValue(@"debug_timing", @"com.apple.avfoundation.avvc", 0)) {
    goto LABEL_72;
  }
  if (!kAVVCScope)
  {
    id v11 = MEMORY[0x1E4F14500];
LABEL_69:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 59;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d debug_timing on", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_71;
  }
  id v11 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_69;
  }
LABEL_71:
  v5 |= 0x40000000000uLL;
LABEL_72:
  if (!CFPreferencesGetAppBooleanValue(@"debug_delegate", @"com.apple.avfoundation.avvc", 0)) {
    goto LABEL_80;
  }
  if (!kAVVCScope)
  {
    id v12 = MEMORY[0x1E4F14500];
LABEL_77:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 60;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d debug_delegate on", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_79;
  }
  id v12 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_77;
  }
LABEL_79:
  v5 |= 0x20000000000uLL;
LABEL_80:
  if (!CFPreferencesGetAppBooleanValue(@"debug_playback", @"com.apple.avfoundation.avvc", 0)) {
    goto LABEL_88;
  }
  if (!kAVVCScope)
  {
    uint64_t v13 = MEMORY[0x1E4F14500];
LABEL_85:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 61;
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d debug_playback on", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_87;
  }
  uint64_t v13 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_85;
  }
LABEL_87:
  v5 |= 0x400000000uLL;
LABEL_88:
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"debug_deviceselect", @"com.apple.avfoundation.avvc", 0);
  id v15 = (NSObject **)kAVVCScope;
  if (!AppBooleanValue) {
    goto LABEL_96;
  }
  if (!kAVVCScope)
  {
    uint64_t v16 = MEMORY[0x1E4F14500];
LABEL_93:
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 62;
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_INFO, "%25s:%-5d debug_deviceselect on", (uint8_t *)&v21, 0x12u);
      id v15 = (NSObject **)kAVVCScope;
    }
    goto LABEL_95;
  }
  uint64_t v16 = *(NSObject **)kAVVCScope;
  if (*(void *)kAVVCScope) {
    goto LABEL_93;
  }
LABEL_95:
  v5 |= 0x80000000000uLL;
LABEL_96:
  if (v15)
  {
    id v17 = *v15;
    if (!*v15) {
      goto LABEL_102;
    }
  }
  else
  {
    id v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315650;
    id v22 = "AVVC_Log.cpp";
    __int16 v23 = 1024;
    int v24 = 85;
    __int16 v25 = 1024;
    unsigned int v26 = AppIntegerValue;
    _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d debug_level = %d", (uint8_t *)&v21, 0x18u);
    id v15 = (NSObject **)kAVVCScope;
  }
LABEL_102:
  char v18 = v1 ^ 1;
  if (!v5) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    if (v15)
    {
      uint64_t v19 = *v15;
      if (!*v15) {
        return;
      }
    }
    else
    {
      uint64_t v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315394;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 87;
      _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d resetting debug_level to Notify to allow scoped logging", (uint8_t *)&v21, 0x12u);
      id v15 = (NSObject **)kAVVCScope;
    }
    unsigned int v2 = 3;
  }
  if (!v15)
  {
    uint64_t v20 = MEMORY[0x1E4F14500];
LABEL_116:
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 136315906;
      id v22 = "AVVC_Log.cpp";
      __int16 v23 = 1024;
      int v24 = 90;
      __int16 v25 = 1024;
      unsigned int v26 = v2;
      __int16 v27 = 2048;
      uint64_t v28 = v5;
      _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d debug priority: %u scopes: 0x%llx", (uint8_t *)&v21, 0x22u);
    }
    goto LABEL_118;
  }
  uint64_t v20 = *v15;
  if (*v15) {
    goto LABEL_116;
  }
LABEL_118:
  if (v2 >= 6) {
    *(void *)(kAVVCScope + 8) = v5;
  }
}

void ___Z18Initialize_Loggingv_block_invoke()
{
}

void sub_19D8683C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D868498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D86860C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D8686D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D8688B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___Z11GetImplTypev_block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.avfoundation.avvc"];
  char v1 = [v0 objectForKey:@"keepAliveType"];

  if (v1) {
    GetImplType(void)::type = [v0 integerForKey:@"keepAliveType"];
  }
  if (kAVVCScope)
  {
    unsigned int v2 = *(id *)kAVVCScope;
    if (!v2) {
      goto LABEL_10;
    }
  }
  else
  {
    unsigned int v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315650;
    uint64_t v5 = "AVVCKeepAliveManager.mm";
    __int16 v6 = 1024;
    int v7 = 40;
    __int16 v8 = 1024;
    int v9 = GetImplType(void)::type;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Using AVVCKeepAliveImpl of type %d", (uint8_t *)&v4, 0x18u);
  }

LABEL_10:
}

void sub_19D868A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *___ZL25LoadCoreMediaFunctionPtrsv_block_invoke()
{
  result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 1);
  if (result)
  {
    char v1 = result;
    sCMAudioFormatDescriptionGetStreamBasicDescription = dlsym(result, "CMAudioFormatDescriptionGetStreamBasicDescription");
    sCMAudioFormatDescriptionCreate = dlsym(v1, "CMAudioFormatDescriptionCreate");
    sCMAudioFormatDescriptionGetChannelLayout = dlsym(v1, "CMAudioFormatDescriptionGetChannelLayout");
    result = dlsym(v1, "CMAudioFormatDescriptionGetMagicCookie");
    sCMAudioFormatDescriptionGetMagicCookie = result;
  }
  return result;
}

void sub_19D869040(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
}

void sub_19D8693C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);

  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  if (v7) {
    std::recursive_mutex::unlock(v5);
  }
  _Unwind_Resume(a1);
}

void sub_19D869748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);

  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  if (v7) {
    std::recursive_mutex::unlock(v5);
  }
  _Unwind_Resume(a1);
}

void sub_19D869ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);

  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  if (v7) {
    std::recursive_mutex::unlock(v5);
  }
  _Unwind_Resume(a1);
}

void sub_19D869D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ElapsedTime::~ElapsedTime((ElapsedTime *)&a9);
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  _Unwind_Resume(a1);
}

void sub_19D86A0C4(_Unwind_Exception *a1)
{
  if (v4) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(a1);
}

void sub_19D86A26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D86A3F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D86A5A8(_Unwind_Exception *exception_object)
{
}

void sub_19D86A90C(_Unwind_Exception *a1)
{
  if (v3) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(a1);
}

void sub_19D86AA8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v12) {
    std::recursive_mutex::unlock(v10);
  }

  _Unwind_Resume(a1);
}

void sub_19D86AC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D86AD60(_Unwind_Exception *a1)
{
  if (v3) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(a1);
}

void sub_19D86AF20(_Unwind_Exception *exception_object)
{
}

void sub_19D86B100(_Unwind_Exception *exception_object)
{
}

void sub_19D86B2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D86B4B0(_Unwind_Exception *exception_object)
{
  if (v2) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D86BE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, int a12, std::recursive_mutex *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41)
{
  if (a12) {
    std::recursive_mutex::unlock(a13);
  }
  _Unwind_Resume(a1);
}

void sub_19D86C1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D86C424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D86C538(_Unwind_Exception *a1)
{
  if (v3) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(a1);
}

void sub_19D86C714(_Unwind_Exception *exception_object)
{
}

void sub_19D86C830(_Unwind_Exception *a1)
{
  if (v3) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(a1);
}

void sub_19D86C944(_Unwind_Exception *a1)
{
  if (v3) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(a1);
}

void sub_19D86CA94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  if (v3) {
    std::recursive_mutex::unlock(v2);
  }
  _Unwind_Resume(a1);
}

void sub_19D86CB90(_Unwind_Exception *exception_object)
{
  if (v2) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D86CD60(_Unwind_Exception *exception_object)
{
}

void sub_19D86CF38(_Unwind_Exception *exception_object)
{
}

void sub_19D86D110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  _Unwind_Resume(a1);
}

void sub_19D86D2E0(_Unwind_Exception *exception_object)
{
}

void sub_19D86D4A8(_Unwind_Exception *exception_object)
{
}

void sub_19D86D77C(_Unwind_Exception *a1)
{
  if (v4) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(a1);
}

void sub_19D86D950(_Unwind_Exception *exception_object)
{
}

void sub_19D86DB58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D86DD68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D86DF44(_Unwind_Exception *exception_object)
{
}

void sub_19D86E10C(_Unwind_Exception *exception_object)
{
}

void sub_19D86E2D4(_Unwind_Exception *exception_object)
{
}

void sub_19D86E49C(_Unwind_Exception *exception_object)
{
}

void sub_19D86E664(_Unwind_Exception *exception_object)
{
}

void sub_19D86E82C(_Unwind_Exception *exception_object)
{
}

void sub_19D86EA00(_Unwind_Exception *exception_object)
{
}

void sub_19D86EC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D86F748(_Unwind_Exception *a1)
{
  if (v5) {
    std::recursive_mutex::unlock(v1);
  }
  _Unwind_Resume(a1);
}

void sub_19D86FDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, std::recursive_mutex *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  if (v28) {
    std::recursive_mutex::unlock(a11);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6389(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6390(uint64_t a1)
{
}

void sub_19D8700D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19D870478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  if (v10) {
    std::recursive_mutex::unlock(v7);
  }
  _Unwind_Resume(a1);
}

void sub_19D870A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, std::recursive_mutex *a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  ElapsedTime::~ElapsedTime((ElapsedTime *)&a24);
  if (a13) {
    std::recursive_mutex::unlock(a11);
  }
  _Unwind_Resume(a1);
}

void sub_19D870DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);

  if (v10) {
    std::recursive_mutex::unlock(v8);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)va);

  _Unwind_Resume(a1);
}

void sub_19D87126C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  if (v11) {
    std::recursive_mutex::unlock(v9);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)va);

  _Unwind_Resume(a1);
}

void sub_19D871760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  if (v10) {
    std::recursive_mutex::unlock(v7);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  _Unwind_Resume(a1);
}

void sub_19D871DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  if (v11) {
    std::recursive_mutex::unlock(v9);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  _Unwind_Resume(a1);
}

void sub_19D872E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);

  if (v18) {
    std::recursive_mutex::unlock(v15);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  _Unwind_Resume(a1);
}

void sub_19D873C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (v27) {
    std::recursive_mutex::unlock(a9);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)&a27);
  _Unwind_Resume(a1);
}

void sub_19D874124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);

  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  _Unwind_Resume(a1);
}

void sub_19D874540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (v14) {
    std::recursive_mutex::unlock(v13);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)&a13);
  _Unwind_Resume(a1);
}

void sub_19D874B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);

  if (v20) {
    std::recursive_mutex::unlock(v16);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)va);

  _Unwind_Resume(a1);
}

void sub_19D875690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (v23) {
    std::recursive_mutex::unlock(a9);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)&a23);
  _Unwind_Resume(a1);
}

void sub_19D875930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void AVVCAudioCapturer_AudioDiagnostics::dispose(AVVCAudioCapturer_AudioDiagnostics *this)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)this + 32))
  {
    uint64_t v2 = *((void *)this + 5);
    *((void *)this + 5) = 0;
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
    if (kAVVCScope)
    {
      int v3 = *(id *)kAVVCScope;
      if (!v3) {
        return;
      }
    }
    else
    {
      int v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      __int16 v6 = "AVVCAudioCapturer.mm";
      __int16 v7 = 1024;
      int v8 = 220;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mCapturer is reset to NULL", (uint8_t *)&v5, 0x12u);
    }
  }
}

void AVVCAudioCapturer_AudioDiagnostics::logCaptures(AVVCAudioCapturer_AudioDiagnostics *this, AVAudioBuffer *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v5 = a2;
  __int16 v6 = v5;
  if (*((unsigned char *)this + 32) && v5 && *((void *)this + 5))
  {
    __int16 v7 = [(AVAudioBuffer *)v5 format];
    int v8 = *(_DWORD *)([v7 streamDescription] + 8);

    if (v8 == 1936745848 || v8 == 1869641075)
    {
      if (kAVVCScope)
      {
        if (*(unsigned char *)(kAVVCScope + 8))
        {
          int v10 = *(id *)kAVVCScope;
          if (v10)
          {
            int v11 = v10;
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              int v20 = 136315394;
              int v21 = "AVVCAudioCapturer.mm";
              __int16 v22 = 1024;
              int v23 = 206;
              _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCAudioCapturer:logCapture: logging non-lpcm audio", (uint8_t *)&v20, 0x12u);
            }
          }
        }
      }
      int v12 = v6;
      int v13 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(**((void **)this + 5) + 16))(*((void *)this + 5), [(AVAudioBuffer *)v12 data], a3, [(AVAudioBuffer *)v12 packetDescriptions], [(AVAudioBuffer *)v12 packetCount]);
    }
    else
    {
      if (v8 != 1819304813) {
        goto LABEL_32;
      }
      if (kAVVCScope)
      {
        if (*(unsigned char *)(kAVVCScope + 8))
        {
          int v14 = *(id *)kAVVCScope;
          if (v14)
          {
            id v15 = v14;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              int v20 = 136315394;
              int v21 = "AVVCAudioCapturer.mm";
              __int16 v22 = 1024;
              int v23 = 201;
              _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCAudioCapturer:logCapture: logging lpcm audio", (uint8_t *)&v20, 0x12u);
            }
          }
        }
      }
      uint64_t v16 = v6;
      int v13 = (*(uint64_t (**)(void, uint64_t, const AudioBufferList *, uint64_t))(**((void **)this + 5) + 24))(*((void *)this + 5), [(AVAudioBuffer *)v16 frameLength], [(AVAudioBuffer *)v16 audioBufferList], 1);
    }
    int v17 = v13;

    if (v17)
    {
      if (kAVVCScope)
      {
        int v18 = *(id *)kAVVCScope;
        if (!v18) {
          goto LABEL_32;
        }
      }
      else
      {
        int v18 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315650;
        int v21 = "AVVCAudioCapturer.mm";
        __int16 v22 = 1024;
        int v23 = 211;
        __int16 v24 = 1024;
        int v25 = v17;
        _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d Error while logging audio: %d", (uint8_t *)&v20, 0x18u);
      }
    }
  }
LABEL_32:
}

void sub_19D875D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void AVVCAudioCapturer_AudioDiagnostics::setup(AVVCAudioCapturer_AudioDiagnostics *this, unint64_t a2, AudioStreamBasicDescription *a3, AudioStreamBasicDescription *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!*((unsigned char *)this + 32)) {
    return;
  }
  NSHomeDirectory();
  id v8 = objc_claimAutoreleasedReturnValue();
  snprintf(__str, 0x400uLL, "%s/Library/Logs/CrashReporter/Assistant/AVVCCapture/", (const char *)[v8 UTF8String]);

  std::string::basic_string[abi:ne180100]<0>(v42, __str);
  int v9 = *((char *)this + 31);
  if (v9 >= 0) {
    size_t v10 = *((unsigned __int8 *)this + 31);
  }
  else {
    size_t v10 = *((void *)this + 2);
  }
  unint64_t v11 = v10 + 1;
  if (v10 + 1 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v11 >= 0x17)
  {
    uint64_t v13 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v13 = v11 | 7;
    }
    uint64_t v14 = v13 + 1;
    int v12 = (char *)operator new(v13 + 1);
    v38.__r_.__value_.__l.__size_ = v10 + 1;
    v38.__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    v38.__r_.__value_.__r.__words[0] = (std::string::size_type)v12;
    goto LABEL_15;
  }
  memset(&v38, 0, sizeof(v38));
  *((unsigned char *)&v38.__r_.__value_.__s + 23) = v10 + 1;
  if ((v11 & 0x80u) == 0) {
    int v12 = (char *)&v38;
  }
  else {
    int v12 = 0;
  }
  if (v10)
  {
LABEL_15:
    if (v9 >= 0) {
      id v15 = (char *)this + 8;
    }
    else {
      id v15 = (char *)*((void *)this + 1);
    }
    memmove(v12, v15, v10);
  }
  *(_WORD *)&v12[v10] = 45;
  std::to_string(&v37, a2);
  if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v16 = &v37;
  }
  else {
    uint64_t v16 = (std::string *)v37.__r_.__value_.__r.__words[0];
  }
  if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v37.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v37.__r_.__value_.__l.__size_;
  }
  int v18 = std::string::append(&v38, (const std::string::value_type *)v16, size);
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v39.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  int v20 = std::string::append(&v39, "-", 1uLL);
  long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
  *(void *)&__str[16] = *((void *)&v20->__r_.__value_.__l + 2);
  *(_OWORD *)__str = v21;
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  __int16 v22 = [MEMORY[0x1E4F28F80] processInfo];
  std::to_string(&v36, [v22 processIdentifier]);
  if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v23 = &v36;
  }
  else {
    int v23 = (std::string *)v36.__r_.__value_.__r.__words[0];
  }
  if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v24 = HIBYTE(v36.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v24 = v36.__r_.__value_.__l.__size_;
  }
  int v25 = std::string::append((std::string *)__str, (const std::string::value_type *)v23, v24);
  long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  int64_t v41 = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }

  if ((__str[23] & 0x80000000) != 0) {
    operator delete(*(void **)__str);
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v39.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (a3->mFormatID == 1869641075) {
    a3->mFramesPerPacket = 320;
  }
  if (v43 >= 0) {
    int v27 = v42;
  }
  else {
    int v27 = (void **)v42[0];
  }
  if (v41 >= 0) {
    int v28 = __p;
  }
  else {
    int v28 = (void **)__p[0];
  }
  if (NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::once != -1) {
    dispatch_once(&NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::once, &__block_literal_global_6526);
  }
  if (NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction) {
    uint64_t v29 = NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction(278802, v27, v28, 1667327590, a4, a3);
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t v30 = *((void *)this + 5);
  *((void *)this + 5) = v29;
  if (v30)
  {
    (*(void (**)(uint64_t))(*(void *)v30 + 8))(v30);
    uint64_t v29 = *((void *)this + 5);
  }
  if (v29)
  {
    if (kAVVCScope)
    {
      id v31 = *(id *)kAVVCScope;
      if (!v31) {
        goto LABEL_71;
      }
    }
    else
    {
      id v31 = (id)MEMORY[0x1E4F14500];
      id v33 = MEMORY[0x1E4F14500];
    }
    uint64_t v32 = v31;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = (*(uint64_t (**)(void))(**((void **)this + 5) + 56))(*((void *)this + 5));
      *(_DWORD *)__str = 136315906;
      *(void *)&__str[4] = "AVVCAudioCapturer.mm";
      *(_WORD *)&__str[12] = 1024;
      *(_DWORD *)&__str[14] = 185;
      *(_WORD *)&__str[18] = 2048;
      *(void *)&__str[20] = a2;
      __int16 v45 = 2080;
      uint64_t v46 = v34;
      _os_log_impl(&dword_19D794000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Dumping Audio for stream(%lu) at %s", __str, 0x26u);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      uint64_t v32 = *(id *)kAVVCScope;
      if (!v32) {
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F14500];
      id v35 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__str = 136315394;
      *(void *)&__str[4] = "AVVCAudioCapturer.mm";
      *(_WORD *)&__str[12] = 1024;
      *(_DWORD *)&__str[14] = 188;
      _os_log_impl(&dword_19D794000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d Error setting up audio captures", __str, 0x12u);
    }
  }

LABEL_71:
  if (SHIBYTE(v41) < 0) {
    operator delete(__p[0]);
  }
  if (v43 < 0) {
    operator delete(v42[0]);
  }
}

void sub_19D8762B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,void *a47,uint64_t a48,int a49,__int16 a50,char a51,char a52)
{
  if (a40 < 0) {
    operator delete(__p);
  }
  if (a46 < 0) {
    operator delete(a41);
  }
  _Unwind_Resume(a1);
}

void *___Z16NewAudioCapturer20AudioCapturerOptionsPKcS1_jPK27AudioStreamBasicDescriptionRS3__block_invoke()
{
  result = dlopen("/usr/local/lib/libAudioDiagnostics.dylib", 5);
  if (result)
  {
    result = dlsym(result, "NewAudioCapturerImpl");
    if (result) {
      NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction = (uint64_t (*)(void, void, void, void, void, void))result;
    }
  }
  return result;
}

void AVVCAudioCapturer_AudioDiagnostics::~AVVCAudioCapturer_AudioDiagnostics(AVVCAudioCapturer_AudioDiagnostics *this)
{
  AVVCAudioCapturer_AudioDiagnostics::~AVVCAudioCapturer_AudioDiagnostics(this);

  JUMPOUT(0x19F3ABB30);
}

{
  uint64_t v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)this = &unk_1EEFA7440;
  uint64_t v2 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (kAVVCScope)
  {
    int v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    int v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    size_t v10 = 136315394;
    unint64_t v11 = "AVVCAudioCapturer.mm";
    int v12 = 1024;
    uint64_t v13 = 168;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ~AVVCAudioCapturer_AudioDiagnostics(): mCapturer is reset to NULL", (uint8_t *)&v10, 0x12u);
  }

LABEL_10:
  if (kAVVCScope)
  {
    int v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_17;
    }
  }
  else
  {
    int v5 = MEMORY[0x1E4F14500];
    __int16 v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    size_t v10 = 136315394;
    unint64_t v11 = "AVVCAudioCapturer.mm";
    int v12 = 1024;
    uint64_t v13 = 169;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d ~AVVCAudioCapturer_AudioDiagnostics(): destroyed", (uint8_t *)&v10, 0x12u);
  }

LABEL_17:
  __int16 v7 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  *(void *)this = &unk_1EEFA5428;
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_26;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    int v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    size_t v10 = 136315394;
    unint64_t v11 = "AVVCAudioCapturer.mm";
    int v12 = 1024;
    uint64_t v13 = 31;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d ~AVVCAudioCapturer(): destroyed", (uint8_t *)&v10, 0x12u);
  }

LABEL_26:
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

uint64_t NewAVVCAudioCapturer()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  if (CFPreferencesGetAppBooleanValue(@"dump_input", @"com.apple.avfoundation.avvc", 0)) {
    operator new();
  }
  return 0;
}

void sub_19D8768C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  operator delete(__p);
  MEMORY[0x19F3ABB30](v18, 0x10B3C40D5544858);
  _Unwind_Resume(a1);
}

void sub_19D87717C(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_19D87727C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8773A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D877490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D877594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D877684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D87779C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D87793C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D877A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D877C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AVAUPresetEvent;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_19D877CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D877DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<AVAudioFileImpl>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    int v3 = *(OpaqueExtAudioFile **)(v2 + 8);
    if (v3)
    {
      ExtAudioFileDispose(v3);
      *(void *)(v2 + 8) = 0;
    }

    JUMPOUT(0x19F3ABB30);
  }
  return result;
}

uint64_t AVAudioFileImpl::CheckClientFormatSet(AVAudioFileImpl *this)
{
  if (*((unsigned char *)this + 16)) {
    return *((unsigned int *)this + 5);
  }
  *((unsigned char *)this + 16) = 1;
  uint64_t v3 = [*((id *)this + 3) streamDescription];
  uint64_t v4 = *(void *)(v3 + 32);
  long long v5 = *(_OWORD *)(v3 + 16);
  v6[0] = *(_OWORD *)v3;
  v6[1] = v5;
  uint64_t v7 = v4;
  uint64_t result = ExtAudioFileSetProperty(*((ExtAudioFileRef *)this + 1), 0x63666D74u, 0x28u, v6);
  *((_DWORD *)this + 5) = result;
  return result;
}

void sub_19D8783B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _AVAE_CheckAndReturnErr(int a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a4) {
    return 0;
  }
  uint64_t v6 = a5;
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  unint64_t v11 = *(id *)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v18 = "AVAEInternal.h";
    __int16 v19 = 1024;
    int v20 = 83;
    __int16 v21 = 2080;
    __int16 v22 = "AVAudioFile.mm";
    __int16 v23 = 1024;
    int v24 = a1;
    __int16 v25 = 2080;
    uint64_t v26 = a2;
    __int16 v27 = 2080;
    uint64_t v28 = a3;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
  }
  if (a6)
  {
    int v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = [NSString stringWithUTF8String:a3];
    id v15 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, @"false condition", 0);
    *a6 = [v12 errorWithDomain:@"com.apple.coreaudio.avfaudio" code:(int)v6 userInfo:v15];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", a3);
  }
  return v6;
}

void sub_19D8785BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D878768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8787D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D878880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AVAudioFile;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_19D878B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_19D8790B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  MEMORY[0x19F3ABB30](v16, 0x10A0C400E62B68ELL);
  _Unwind_Resume(a1);
}

uint64_t fileTypeFromExtension(NSString *a1)
{
  inSpecifier = a1;
  UInt32 outDataSize = 0;
  if (AudioFileGetGlobalInfoSize(0x74657874u, 8u, &inSpecifier, &outDataSize)) {
    goto LABEL_4;
  }
  uint64_t v1 = malloc_type_malloc(outDataSize, 0xA01074FAuLL);
  if (AudioFileGetGlobalInfo(0x74657874u, 8u, &inSpecifier, &outDataSize, v1))
  {
    free(v1);
LABEL_4:
    uint64_t v2 = 0;
    goto LABEL_5;
  }
  if (outDataSize > 3)
  {
    unsigned int v4 = *v1;
    free(v1);
    if (v4 == 1095321158) {
      uint64_t v2 = 1095321155;
    }
    else {
      uint64_t v2 = v4;
    }
  }
  else
  {
    free(v1);
    uint64_t v2 = 1667327590;
  }
LABEL_5:

  return v2;
}

void sub_19D87927C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t asbdFromSettingsAndFileType2(NSDictionary *a1, NSArray *a2, int a3, AudioStreamBasicDescription *a4)
{
  uint64_t v7 = a1;
  id v8 = a2;
  *(void *)&a4->mBitsPerChannel = 0;
  *(_OWORD *)&a4->mSampleRate = 0u;
  *(_OWORD *)&a4->mBytesPerPacket = 0u;
  LODWORD(outDataSize) = 0;
  id v9 = [(NSDictionary *)v7 objectForKey:@"AVFormatIDKey"];
  AudioFormatID v10 = 1819304813;
  AudioFormatID v11 = 1819304813;
  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_83;
    }
    AudioFormatID v11 = [v9 unsignedIntegerValue];
    LODWORD(outDataSize) = v11;
  }
  a4->AudioFormatID mFormatID = v11;
  id v12 = [(NSDictionary *)v7 objectForKey:@"AVSampleRateKey"];
  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_83;
    }
    [v12 doubleValue];
    double v14 = v13;
    double v15 = 8000.0;
    if (v14 >= 8000.0)
    {
      double v15 = v14;
      if (v14 > 192000.0) {
        double v15 = 192000.0;
      }
    }
  }
  else if (a4->mFormatID == 1768710755)
  {
    double v15 = 8000.0;
  }
  else
  {
    if (AudioSessionClass(void)::once != -1) {
      dispatch_once(&AudioSessionClass(void)::once, &__block_literal_global_164);
    }
    objc_msgSend((id)objc_msgSend((id)AudioSessionClass(void)::gAudioSessionClass, "sharedInstance"), "setActive:error:", 1, 0);
    if (AudioSessionClass(void)::once != -1) {
      dispatch_once(&AudioSessionClass(void)::once, &__block_literal_global_164);
    }
    objc_msgSend((id)objc_msgSend((id)AudioSessionClass(void)::gAudioSessionClass, "sharedInstance"), "sampleRate");
    if (v15 == 0.0) {
      double v15 = 44100.0;
    }
  }
  a4->mSampleRate = v15;
  id v16 = [(NSDictionary *)v7 objectForKey:@"AVNumberOfChannelsKey"];
  if (v16)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_83;
    }
    UInt32 v17 = [v16 unsignedIntegerValue];
    LODWORD(outDataSize) = v17;
    if (v17)
    {
      if (v17 > 0x400) {
        goto LABEL_104;
      }
    }
    else
    {
      UInt32 v17 = 1;
      LODWORD(outDataSize) = 1;
    }
    goto LABEL_27;
  }
  AudioFormatID mFormatID = a4->mFormatID;
  if (mFormatID != 1768710755)
  {
    if (!v8)
    {
      if (AudioSessionClass(void)::once != -1) {
        dispatch_once(&AudioSessionClass(void)::once, &__block_literal_global_164);
      }
      objc_msgSend((id)objc_msgSend((id)AudioSessionClass(void)::gAudioSessionClass, "sharedInstance"), "setActive:error:", 1, 0);
      if (AudioSessionClass(void)::once != -1) {
        dispatch_once(&AudioSessionClass(void)::once, &__block_literal_global_164);
      }
      unsigned int v28 = objc_msgSend((id)objc_msgSend((id)AudioSessionClass(void)::gAudioSessionClass, "sharedInstance"), "inputNumberOfChannels");
      if (v28 <= 1) {
        UInt32 v29 = 1;
      }
      else {
        UInt32 v29 = v28;
      }
      a4->mChannelsPerFrame = v29;
LABEL_28:
      AudioFormatID mFormatID = a4->mFormatID;
      if (mFormatID == 1634492771)
      {
        id v24 = [(NSDictionary *)v7 objectForKey:@"AVEncoderBitDepthHintKey"];
        if (v24 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          unsigned int v25 = [v24 unsignedIntegerValue];
          HIDWORD(v26) = v25;
          LODWORD(v26) = v25 - 16;
          switch((v26 >> 2))
          {
            case 0u:
              AudioFormatFlags v27 = 1;
              goto LABEL_64;
            case 1u:
              AudioFormatFlags v27 = 2;
              goto LABEL_64;
            case 2u:
              AudioFormatFlags v27 = 3;
              goto LABEL_64;
            case 4u:
              AudioFormatFlags v27 = 4;
LABEL_64:
              a4->AudioFormatFlags mFormatFlags = v27;
              break;
            default:
              NSLog(&cfstr_AlacDoesNotSup.isa, [NSNumber numberWithInteger:v25]);
              break;
          }
        }
        goto LABEL_94;
      }
      if (mFormatID != 1819304813) {
        goto LABEL_95;
      }
      id v20 = [(NSDictionary *)v7 objectForKey:@"AVLinearPCMIsNonInterleaved"];
      if (v20)
      {
        if (objc_opt_respondsToSelector())
        {
          LODWORD(outDataSize) = [v20 unsignedIntegerValue];
          if (outDataSize)
          {
            if (a4->mChannelsPerFrame != 1) {
              NSLog(&cfstr_AudioFilesCann.isa);
            }
          }
        }
      }
      AudioFormatFlags mFormatFlags = a4->mFormatFlags;
      AudioFormatFlags v22 = mFormatFlags | 8;
      a4->AudioFormatFlags mFormatFlags = mFormatFlags | 8;
      if (a3 > 1380333107)
      {
        if (a3 == 1667327590)
        {
          if (getUInt32ForKey(v7, &outDataSize, (unsigned int *)&outDataSize + 1, v19))
          {
            AudioFormatFlags v22 = a4->mFormatFlags;
            if (outDataSize)
            {
              AudioFormatFlags v30 = v22 | 2;
              goto LABEL_67;
            }
          }
          else
          {
            AudioFormatFlags v22 = a4->mFormatFlags;
          }
        }
      }
      else
      {
        if (a3 <= 1113011763)
        {
          if (a3 == 1095321155)
          {
LABEL_56:
            AudioFormatFlags v30 = mFormatFlags | 0xA;
            goto LABEL_67;
          }
          int v23 = 1095321158;
          goto LABEL_55;
        }
        if (a3 != 1113011764)
        {
          int v23 = 1315264596;
LABEL_55:
          if (a3 == v23) {
            goto LABEL_56;
          }
        }
      }
      AudioFormatFlags v30 = v22 & 0xFFFFFFFD;
LABEL_67:
      a4->AudioFormatFlags mFormatFlags = v30;
      id v31 = [(NSDictionary *)v7 objectForKey:@"AVLinearPCMIsFloatKey"];
      if (v31 && (objc_opt_respondsToSelector() & 1) != 0 && [v31 unsignedIntegerValue])
      {
        if (a3 > 1463170149)
        {
          if (a3 == 1463170150 || a3 == 1667327590) {
            goto LABEL_78;
          }
          int v32 = 1463899717;
        }
        else
        {
          if (a3 == 1095321155 || a3 == 1113011764) {
            goto LABEL_78;
          }
          int v32 = 1380333108;
        }
        if (a3 == v32)
        {
LABEL_78:
          a4->mFormatFlags |= 1u;
          UInt32 v33 = 32;
          a4->mBitsPerChannel = 32;
LABEL_93:
          UInt32 v37 = (v33 >> 3) * a4->mChannelsPerFrame;
          a4->mBytesPerPacket = v37;
          a4->mFramesPerPacket = 1;
          a4->mBytesPerFrame = v37;
LABEL_94:
          AudioFormatID mFormatID = a4->mFormatID;
LABEL_95:
          if (mFormatID == 1819304813) {
            goto LABEL_96;
          }
          goto LABEL_103;
        }
      }
      id v34 = [(NSDictionary *)v7 objectForKey:@"AVLinearPCMBitDepthKey"];
      if (!v34)
      {
        UInt32 v33 = 16;
        a4->mBitsPerChannel = 16;
        goto LABEL_85;
      }
      if (objc_opt_respondsToSelector())
      {
        UInt32 v33 = ([v34 unsignedIntegerValue] + 7) & 0xFFFFFFF8;
        a4->mBitsPerChannel = v33;
        if (v33 - 33 < 0xFFFFFFE0) {
          goto LABEL_104;
        }
LABEL_85:
        if (a3 > 1463170149)
        {
          if (a3 != 1463899717)
          {
            int v36 = 1463170150;
LABEL_90:
            if (a3 != v36) {
              goto LABEL_92;
            }
          }
        }
        else if (a3 != 1113011764)
        {
          int v36 = 1380333108;
          goto LABEL_90;
        }
        if (v33 == 8) {
          goto LABEL_93;
        }
LABEL_92:
        a4->mFormatFlags |= 4u;
        goto LABEL_93;
      }
LABEL_83:
      uint64_t v35 = 4294967246;
      goto LABEL_105;
    }
    UInt32 v17 = [(NSArray *)v8 count];
LABEL_27:
    a4->mChannelsPerFrame = v17;
    goto LABEL_28;
  }
  a4->mChannelsPerFrame = 1;
LABEL_103:
  HIDWORD(outDataSize) = 0;
  if (AudioFormatGetPropertyInfo(0x61636F66u, 0, 0, (UInt32 *)&outDataSize + 1)) {
    goto LABEL_104;
  }
  int64_t v41 = (char *)malloc_type_malloc(HIDWORD(outDataSize), 0xC8C8A89DuLL);
  if (AudioFormatGetProperty(0x61636F66u, 0, 0, (UInt32 *)&outDataSize + 1, v41) || HIDWORD(outDataSize) < 4)
  {
LABEL_111:
    uint64_t v35 = 1718449215;
    free(v41);
    goto LABEL_105;
  }
  uint64_t v42 = 0;
  while (*(_DWORD *)&v41[v42] != mFormatID)
  {
    v42 += 4;
    if ((HIDWORD(outDataSize) & 0xFFFFFFFC) == v42) {
      goto LABEL_111;
    }
  }
  free(v41);
  AudioFormatID v10 = a4->mFormatID;
LABEL_96:
  LODWORD(outDataSize) = 0;
  HIDWORD(outDataSize) = a3;
  if (AudioFileGetGlobalInfoSize(0x666D6964u, 4u, (char *)&outDataSize + 4, (UInt32 *)&outDataSize))
  {
LABEL_104:
    uint64_t v35 = 1718449215;
    goto LABEL_105;
  }
  std::string v38 = (char *)malloc_type_malloc(outDataSize, 0x2F800E29uLL);
  if (AudioFileGetGlobalInfo(0x666D6964u, 4u, (char *)&outDataSize + 4, (UInt32 *)&outDataSize, v38)
    || outDataSize < 4)
  {
LABEL_102:
    free(v38);
    goto LABEL_104;
  }
  uint64_t v39 = 0;
  while (*(_DWORD *)&v38[v39] != v10)
  {
    v39 += 4;
    if ((outDataSize & 0xFFFFFFFC) == v39) {
      goto LABEL_102;
    }
  }
  free(v38);
  uint64_t v35 = 0;
LABEL_105:

  return v35;
}

void sub_19D879A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AVAudioFileImpl::SetFormats(AVAudioFileImpl *this, AVAudioCommonFormat a2, uint64_t a3, const AudioStreamBasicDescription *a4, AVAudioChannelLayout *a5)
{
  id v9 = a5;
  AudioFormatID v10 = [[AVAudioFormat alloc] initWithStreamDescription:a4 channelLayout:v9];
  uint64_t v11 = 1718449215;
  id v12 = (void *)*((void *)this + 5);
  *((void *)this + 5) = v10;

  if (*((void *)this + 5))
  {
    if (v9) {
      double v13 = [[AVAudioFormat alloc] initWithCommonFormat:a2 sampleRate:a3 interleaved:v9 channelLayout:a4->mSampleRate];
    }
    else {
      double v13 = [[AVAudioFormat alloc] initWithCommonFormat:a2 sampleRate:a4->mChannelsPerFrame channels:a3 interleaved:a4->mSampleRate];
    }
    double v14 = (void *)*((void *)this + 3);
    *((void *)this + 3) = v13;

    if (*((void *)this + 3)) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 1718449215;
    }
  }

  return v11;
}

void sub_19D879B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void AVAudioFileImpl::ReadMagicCookie(AVAudioFileImpl *this)
{
  _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 252, "ReadMagicCookie", "_fileFormat", *((void *)this + 5) != 0);
  if (!*((_DWORD *)this + 14))
  {
    _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 256, "ReadMagicCookie", "_processingFormat", *((void *)this + 3) != 0);
    AVAudioFileImpl::CheckClientFormatSet(this);
  }
  AudioFileID outPropertyData = 0;
  UInt32 __sz_4 = 8;
  uint64_t Property = ExtAudioFileGetProperty(*((ExtAudioFileRef *)this + 1), 0x6166696Cu, &__sz_4, &outPropertyData);
  if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 263, (uint64_t)"ReadMagicCookie", (uint64_t)"ExtAudioFileGetProperty(_extAudioFile, kExtAudioFileProperty_AudioFile, &propSize, &fileID)", Property, 0))
  {
    UInt32 __sz = 0;
    if (!AudioFileGetPropertyInfo(outPropertyData, 0x6D676963u, &__sz, 0))
    {
      size_t v3 = __sz;
      if (__sz)
      {
        unsigned int v4 = operator new(__sz);
        bzero(v4, v3);
        if (!AudioFileGetProperty(outPropertyData, 0x6D676963u, &__sz, v4))
        {
          id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          uint64_t v6 = (void *)[v5 initWithBytes:v4 length:__sz];
          [*((id *)this + 5) setMagicCookie:v6];
        }
        operator delete(v4);
      }
    }
  }
}

void sub_19D879CD8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAudioFileImpl::GetAudioConverter(OpaqueExtAudioFile *a1, void *a2)
{
  uint64_t outPropertyData = 0;
  UInt32 ioPropertyDataSize = 8;
  uint64_t Property = ExtAudioFileGetProperty(a1, 0x61636E76u, &ioPropertyDataSize, &outPropertyData);
  if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 286, (uint64_t)"GetAudioConverter", (uint64_t)"ExtAudioFileGetProperty(_extAudioFile, kExtAudioFileProperty_AudioConverter, &size, &converter)", Property, a2))
  {
    return outPropertyData;
  }
  else
  {
    return 0;
  }
}

void AVAudioFileImpl::setBitRate(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 objectForKey:@"AVEncoderBitRateKey"];
  uint64_t v7 = [v5 objectForKey:@"AVEncoderBitRatePerChannelKey"];
  if (v6 | v7)
  {
    AudioConverter = (OpaqueAudioConverter *)AVAudioFileImpl::GetAudioConverter(*(OpaqueExtAudioFile **)(a1 + 8), a3);
    if (AudioConverter)
    {
      if (v6)
      {
        int inPropertyData = [(id)v6 intValue];
        uint64_t v9 = AudioConverterSetProperty(AudioConverter, 0x62726174u, 4u, &inPropertyData);
        _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 413, (uint64_t)"setBitRate", (uint64_t)"AudioConverterSetProperty(converter, kAudioConverterEncodeBitRate, sizeof(UInt32), &bitRate)", v9, a3);
      }
      else if (v7)
      {
        int v10 = [0 intValue];
        int v12 = [*(id *)(a1 + 40) channelCount] * v10;
        uint64_t v11 = AudioConverterSetProperty(AudioConverter, 0x62726174u, 4u, &v12);
        _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 416, (uint64_t)"setBitRate", (uint64_t)"AudioConverterSetProperty(converter, kAudioConverterEncodeBitRate, sizeof(UInt32), &bitRatePerChannel)", v11, a3);
      }
    }
  }
}

void sub_19D879EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D87A024(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v2, 0x10A0C400E62B68ELL);
  _Unwind_Resume(a1);
}

void AVAudioFileImpl::_initCommonReading(uint64_t a1, AVAudioCommonFormat a2, uint64_t a3, void *a4)
{
  UInt32 ioPropertyDataSize = 40;
  uint64_t Property = ExtAudioFileGetProperty(*(ExtAudioFileRef *)(a1 + 8), 0x66666D74u, &ioPropertyDataSize, &outPropertyData);
  if (!_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 160, (uint64_t)"_initCommonReading", (uint64_t)"ExtAudioFileGetProperty(_extAudioFile, kExtAudioFileProperty_FileDataFormat, &propSize, &fileASBD)", Property, a4))return; {
  uint64_t v9 = 0;
  }
  if (!ExtAudioFileGetPropertyInfo(*(ExtAudioFileRef *)(a1 + 8), 0x66636C6Fu, &ioPropertyDataSize, 0))
  {
    uint64_t v9 = malloc_type_malloc(ioPropertyDataSize, 0xD1017A3uLL);
    if (!ExtAudioFileGetProperty(*(ExtAudioFileRef *)(a1 + 8), 0x66636C6Fu, &ioPropertyDataSize, v9))
    {
      unsigned int v12 = *v9 & 0xFFFF0000;
      if (v12 == -65536 || v12 == 9633792)
      {
        if (outPropertyData.mChannelsPerFrame == (unsigned __int16)*v9) {
          goto LABEL_6;
        }
      }
      else if (v12 || v9[2])
      {
        goto LABEL_6;
      }
    }
  }
  free(v9);
  if (outPropertyData.mChannelsPerFrame < 3)
  {
    int v10 = 0;
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = malloc_type_calloc(1uLL, 0x20uLL, 0x1000040E0EAB150uLL);
  _DWORD *v9 = outPropertyData.mChannelsPerFrame | 0x930000;
LABEL_6:
  int v10 = [[AVAudioChannelLayout alloc] initWithLayout:v9];
LABEL_8:
  free(v9);
  uint64_t v11 = AVAudioFileImpl::SetFormats((AVAudioFileImpl *)a1, a2, a3, &outPropertyData, v10);
  if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 200, (uint64_t)"_initCommonReading", (uint64_t)"SetFormats(format, interleaved, fileASBD, avacl)", v11, a4))
  {
    AVAudioFileImpl::ReadMagicCookie((AVAudioFileImpl *)a1);
  }
}

void sub_19D87A25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D87A41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D87A500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void AVAudioNodeImplBase::GetAttachAndEngineLock(AVAudioNodeImplBase *this, uint64_t a2)
{
  unsigned int v4 = (std::recursive_mutex *)(a2 + 104);
  while (1)
  {
    std::recursive_mutex::lock(v4);
    uint64_t v5 = *(void *)(a2 + 8);
    if (!v5)
    {
      uint64_t v6 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = v5 + 112;
    if (std::recursive_mutex::try_lock((std::recursive_mutex *)(v5 + 112))) {
      break;
    }
    std::recursive_mutex::unlock(v4);
    __ns.__rep_ = 5000000;
    std::this_thread::sleep_for (&__ns);
  }
  LOBYTE(v5) = 1;
LABEL_7:
  *(void *)this = v4;
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 2) = v6;
  *((unsigned char *)this + 24) = v5;
}

uint64_t AVAudioNodeImplBase::GetMixingImpl(AVAudioNodeImplBase *this)
{
  uint64_t result = *((void *)this + 7);
  if (!result) {
    operator new();
  }
  return result;
}

void sub_19D87A770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87A7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87A914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87A9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87AAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87AB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87AC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87AD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87AE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87AEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87AFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87B050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87B170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87B1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87B30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87B390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87B4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87B534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87B654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87B844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t AVAudioNodeImplBase::GetMixingDestination(AVAudioNodeImplBase *this, AVAudioNode *a2, unsigned int a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v11 = "AVAEInternal.h";
      __int16 v12 = 1024;
      int v13 = 71;
      __int16 v14 = 2080;
      double v15 = "AVAudioNode.mm";
      __int16 v16 = 1024;
      int v17 = 887;
      __int16 v18 = 2080;
      __int16 v19 = "GetMixingDestination";
      __int16 v20 = 2080;
      __int16 v21 = "inMixerAVNode";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inMixerAVNode");
  }
  uint64_t v7 = *((void *)this + 8);
  if (v7
    && *(void *)(v7 + 16)
    && (uint64_t v8 = std::__tree<std::__value_type<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>,std::__map_value_compare<std::pair<AVAudioNode *,unsigned int>,std::__value_type<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>,std::less<std::pair<AVAudioNode *,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>>>::find<std::pair<AVAudioNode *,unsigned int>>(v7, (unint64_t)a2, a3), v7 + 8 != v8))
  {
    return *(void *)(v8 + 48);
  }
  else
  {
    return 0;
  }
}

uint64_t std::__tree<std::__value_type<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>,std::__map_value_compare<std::pair<AVAudioNode *,unsigned int>,std::__value_type<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>,std::less<std::pair<AVAudioNode *,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>>>::find<std::pair<AVAudioNode *,unsigned int>>(uint64_t a1, unint64_t a2, unsigned int a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v3 = a1 + 8;
  uint64_t v4 = v5;
  if (!v5) {
    return v3;
  }
  uint64_t v6 = v3;
  do
  {
    unint64_t v7 = *(void *)(v4 + 32);
    BOOL v9 = v7 == a2;
    BOOL v8 = v7 < a2;
    if (v9) {
      BOOL v8 = *(_DWORD *)(v4 + 40) < a3;
    }
    BOOL v9 = !v8;
    if (v8) {
      int v10 = (uint64_t *)(v4 + 8);
    }
    else {
      int v10 = (uint64_t *)v4;
    }
    if (v9) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v10;
  }
  while (*v10);
  if (v6 == v3) {
    return v3;
  }
  unint64_t v11 = *(void *)(v6 + 32);
  BOOL v9 = v11 == a2;
  BOOL v12 = v11 > a2;
  if (v9) {
    BOOL v12 = *(_DWORD *)(v6 + 40) > a3;
  }
  if (v12) {
    return v3;
  }
  return v6;
}

void sub_19D87BAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87BB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87BD50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_19D87C028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_19D87C0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C720(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v2);
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D87C7E8(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v2);
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D87C8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87C9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87CA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87CD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87CE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87CFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87D0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87D218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87D334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87D450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87D56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87D69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87D7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87D868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D87DA7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

AVAudioClock *AVAudioNodeImplBase::CreateClock(AVAudioNodeImplBase *this)
{
  uint64_t v2 = [AVAudioClock alloc];

  return [(AVAudioClock *)v2 initWithNode:this];
}

double AVAudioNodeImplBase::GetOutputPresentationLatency(AVAudioNodeImplBase *this)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v1 = COERCE_DOUBLE(atomic_load((unint64_t *)this + 12));
  uint64_t v2 = *((void *)this + 1);
  if (v2)
  {
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t v5 = (std::recursive_mutex *)(*(void *)v4 + 112);
    if (std::recursive_mutex::try_lock(v5))
    {
      if (!AVAudioEngineGraph::IsNodeInGraph((AVAudioEngineGraph *)v4, this))
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        uint64_t v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          unint64_t v11 = "AVAEInternal.h";
          __int16 v12 = 1024;
          int v13 = 71;
          __int16 v14 = 2080;
          double v15 = "AVAudioEngineGraph.mm";
          __int16 v16 = 1024;
          int v17 = 3248;
          __int16 v18 = 2080;
          __int16 v19 = "GetOutputDeviceLatencyForNode";
          __int16 v20 = 2080;
          __int16 v21 = "IsNodeInGraph(inImpl)";
          _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsNodeInGraph(inImpl)");
      }
      double v7 = 0.0;
      if ((*(unsigned char *)(AVAudioEngineGraph::GetNodeFromMap((AVAudioEngineGraph *)v4, this) + 32) & 2) != 0)
      {
        uint64_t NodeFromMap = AVAudioEngineGraph::GetNodeFromMap((AVAudioEngineGraph *)v4, *(AVAudioNodeImplBase **)(v4 + 24));
        if (NodeFromMap)
        {
          double v7 = (*(double (**)(void))(**(void **)(NodeFromMap + 24) + 216))(*(void *)(NodeFromMap + 24));
          *(double *)(v4 + 224) = v7;
        }
      }
      std::recursive_mutex::unlock(v5);
    }
    else
    {
      double v7 = *(double *)(v4 + 224);
    }
  }
  else
  {
    double v7 = 0.0;
  }
  return v7 + v1;
}

void sub_19D87DDFC(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void AVAudioNodeImplBase::WillDisconnectFromMixer(AVAudioNodeImplBase *this, AVAudioNode *a2, unsigned int a3, int a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*((void *)this + 7))
  {
    uint64_t v5 = (void *)*((void *)this + 8);
    if (v5)
    {
      if (v5[2])
      {
        if (a4)
        {
          uint64_t v6 = (void *)*v5;
          if ((void *)*v5 != v5 + 1)
          {
            do
            {

              double v7 = (void *)v6[1];
              if (v7)
              {
                do
                {
                  BOOL v8 = v7;
                  double v7 = (void *)*v7;
                }
                while (v7);
              }
              else
              {
                do
                {
                  BOOL v8 = (void *)v6[2];
                  BOOL v9 = *v8 == (void)v6;
                  uint64_t v6 = v8;
                }
                while (!v9);
              }
              uint64_t v6 = v8;
            }
            while (v8 != v5 + 1);
            uint64_t v5 = (void *)*((void *)this + 8);
          }
          std::__tree<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::__map_value_compare<AUGraphNodeBaseV3 *,std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::less<AUGraphNodeBaseV3 *>,true>,std::allocator<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>>>::destroy((void *)v5[1]);
          *uint64_t v5 = v5 + 1;
          v5[2] = 0;
          v5[1] = 0;
        }
        else
        {
          MixingDestination = (void *)AVAudioNodeImplBase::GetMixingDestination(this, a2, a3);
          if (!MixingDestination)
          {
            if (AVAudioEngineLogCategory(void)::once != -1) {
              dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
            }
            int v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
            if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v22 = "AVAEInternal.h";
              __int16 v23 = 1024;
              int v24 = 71;
              __int16 v25 = 2080;
              unint64_t v26 = "AVAudioNode.mm";
              __int16 v27 = 1024;
              int v28 = 951;
              __int16 v29 = 2080;
              AudioFormatFlags v30 = "WillDisconnectFromMixer";
              __int16 v31 = 2080;
              int v32 = "mixingDest";
              _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
            }
            objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "mixingDest");
          }
          __int16 v14 = (void *)*((void *)this + 8);
          uint64_t v15 = std::__tree<std::__value_type<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>,std::__map_value_compare<std::pair<AVAudioNode *,unsigned int>,std::__value_type<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>,std::less<std::pair<AVAudioNode *,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>>>::find<std::pair<AVAudioNode *,unsigned int>>((uint64_t)v14, (unint64_t)a2, a3);
          if (v14 + 1 != (void *)v15)
          {
            __int16 v16 = (uint64_t *)v15;
            int v17 = *(void **)(v15 + 8);
            if (v17)
            {
              do
              {
                __int16 v18 = v17;
                int v17 = (void *)*v17;
              }
              while (v17);
            }
            else
            {
              __int16 v19 = (void *)v15;
              do
              {
                __int16 v18 = (void *)v19[2];
                BOOL v9 = *v18 == (void)v19;
                __int16 v19 = v18;
              }
              while (!v9);
            }
            if (*v14 == v15) {
              *__int16 v14 = v18;
            }
            __int16 v20 = (uint64_t *)v14[1];
            --v14[2];
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v20, v16);
            operator delete(v16);
          }
        }
      }
    }
  }
}

uint64_t AVAudioNodeImplBase::DidConnectToMixer(AVAudioNodeImplBase *this, AVAudioNode *a2, unsigned int a3)
{
  uint64_t v6 = [(AVAudioNode *)a2 impl];
  if (((*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 408))(this) & 1) != 0
    || (double v7 = (unsigned int *)(*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 256))(this),
        uint64_t result = ValidSourceComponentTypeForMixingProtocol((const AudioComponentDescription *)*v7, v7[1]),
        result))
  {
    BOOL v9 = (unsigned int *)(*(uint64_t (**)(void *))(*(void *)v6 + 256))(v6);
    uint64_t result = ValidSourceComponentTypeForMixingProtocol((const AudioComponentDescription *)*v9, v9[1]);
    if (result)
    {
      uint64_t result = AVAudioNodeImplBase::GetMixingDestination(this, a2, a3);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(void *))(*(void *)v6 + 256))(v6);
        int v10 = *(_DWORD *)(result + 4);
        if (v10 == 862217581) {
          operator new();
        }
        if (v10 == 1835232632) {
          operator new();
        }
      }
    }
  }
  return result;
}

void sub_19D87E7E4(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v1, 0x10E1C40661BC0D6);
  _Unwind_Resume(a1);
}

BOOL ValidSourceComponentTypeForMixingProtocol(const AudioComponentDescription *a1, int a2)
{
  int v2 = (int)a1;
  BOOL result = 1;
  if (v2 <= 1635085687)
  {
    if (v2 == 1635084142 || v2 == 1635085685) {
      return result;
    }
    return 0;
  }
  if (v2 == 1635086953 || v2 == 1635086197) {
    return result;
  }
  if (v2 != 1635085688) {
    return 0;
  }
  return a2 == 1835232632 || a2 == 862217581;
}

uint64_t *std::unique_ptr<std::map<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    std::__tree<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::__map_value_compare<AUGraphNodeBaseV3 *,std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::less<AUGraphNodeBaseV3 *>,true>,std::allocator<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>>>::destroy(*(void **)(v2 + 8));
    JUMPOUT(0x19F3ABB30);
  }
  return result;
}

uint64_t AVAudioNodeImplBase::CurrentTime(AVAudioNodeImplBase *this)
{
  (*(void (**)(AVAudioNodeImplBase *))(*(void *)this + 32))(this);
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  int v4 = *(unsigned __int8 *)(v3 + 208);
  uint64_t v5 = (unsigned char *)(v3 + 184);
  uint64_t v6 = (unsigned char *)(v2 + 64);
  if (!v4) {
    uint64_t v6 = v5;
  }
  if (!*v6 || !*((unsigned char *)this + 48)) {
    return 0;
  }
  double v7 = (void *)*((void *)this + 2);
  if (!v7)
  {
    int v9 = 0;
    (*(void (**)(AVAudioNodeImplBase *))(*(void *)this + 352))(this);
    [*((id *)this + 2) awaitIOCycle:&v9];
    double v7 = (void *)*((void *)this + 2);
  }
  return [v7 currentTime];
}

void AVAudioNodeImplBase::AudioUnitWillBeDisposed(AVAudioNodeImplBase *this)
{
  *((void *)this + 2) = 0;
}

AVAudioNodeImplBase *AVAudioNodeImplBase::NodeWillUninitialize(AVAudioNodeImplBase *this)
{
  *((unsigned char *)this + 48) = 0;
  *((void *)this + 11) = 0;
  return this;
}

double AVAudioNodeImplBase::NodeDidInitialize(AVAudioNodeImplBase *this)
{
  *((unsigned char *)this + 48) = 1;
  uint64_t v2 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  double result = fmax((*(double (**)(uint64_t))(*(void *)v2 + 168))(v2), 0.0);
  *((double *)this + 11) = result;
  return result;
}

uint64_t AVAudioNodeImplBase::DisconnectInput(AVAudioNodeImplBase *this, uint64_t a2, AVAudioNodeImplBase *a3, uint64_t a4)
{
  (*(void (**)(AVAudioNodeImplBase *))(*(void *)this + 32))(this);
  uint64_t v8 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  if (a3) {
    uint64_t v9 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)a3 + 40))(a3);
  }
  else {
    uint64_t v9 = 0;
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t))(*(void *)v8 + 224))(v8, 0, a2, v9, a4);
  if (*((void *)this + 4) > (unint64_t)a2) {
    *(void *)(*((void *)this + 3) + (((unint64_t)a2 >> 3) & 0x1FFFFFF8)) &= ~(1 << a2);
  }
  uint64_t v10 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)v10 + 64))(v10, 1, a2, 0);
  if (a3)
  {
    uint64_t v11 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)a3 + 40))(a3);
    (*(void (**)(uint64_t, void, uint64_t, void))(*(void *)v11 + 64))(v11, 0, a4, 0);
  }
  return 1;
}

uint64_t AVAudioNodeImplBase::ConnectInput(AVAudioNodeImplBase *this, uint64_t a2, AVAudioNodeImplBase *a3, uint64_t a4)
{
  (*(void (**)(AVAudioNodeImplBase *))(*(void *)this + 32))(this);
  uint64_t v8 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  if (a3) {
    uint64_t v9 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)a3 + 40))(a3);
  }
  else {
    uint64_t v9 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v8 + 224))(v8, 1, a2, v9, a4);
  unint64_t v10 = *((void *)this + 4);
  if ((int)v10 <= (int)a2)
  {
    while (1)
    {
      uint64_t v12 = *((void *)this + 5);
      if (v10 == v12 << 6) {
        break;
      }
LABEL_34:
      *((void *)this + 4) = v10 + 1;
      uint64_t v11 = *((void *)this + 3);
      *(void *)(v11 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v10);
      unint64_t v10 = *((void *)this + 4);
      if ((int)v10 > (int)a2) {
        goto LABEL_35;
      }
    }
    if ((uint64_t)(v10 + 1) < 0) {
      goto LABEL_38;
    }
    if (v10 > 0x3FFFFFFFFFFFFFFELL)
    {
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 >= 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_33:
        unint64_t v10 = *((void *)this + 4);
        goto LABEL_34;
      }
    }
    else
    {
      unint64_t v13 = v12 << 7;
      if (v13 <= v10 + 64) {
        unint64_t v13 = v10 + 64;
      }
      if (v10 >= v13) {
        goto LABEL_33;
      }
      if ((v13 & 0x8000000000000000) != 0) {
LABEL_38:
      }
        std::vector<EExtAudioGraphNodeState>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v14 = ((v13 - 1) >> 6) + 1;
    uint64_t v15 = (uint64_t *)operator new(8 * v14);
    __int16 v16 = (void *)*((void *)this + 3);
    unint64_t v17 = (v10 - 1) >> 6;
    if (v10 < 0x41) {
      unint64_t v17 = 0;
    }
    v15[v17] = 0;
    if (v10 > 0x3F || (v10 & 0x3F) != 0)
    {
      int v18 = 0;
      int v19 = 0;
      __int16 v20 = v15;
      __int16 v21 = v16;
      do
      {
        uint64_t v22 = 1 << v18;
        if ((*v21 >> v19)) {
          uint64_t v23 = *v20 | v22;
        }
        else {
          uint64_t v23 = *v20 & ~v22;
        }
        uint64_t *v20 = v23;
        v21 += v19 == 63;
        if (v19 == 63) {
          int v19 = 0;
        }
        else {
          ++v19;
        }
        v20 += v18 == 63;
        if (v18 == 63) {
          int v18 = 0;
        }
        else {
          ++v18;
        }
      }
      while (v21 != &v16[v10 >> 6] || v19 != (v10 & 0x3F));
    }
    *(void *)&long long v24 = v10;
    *((void *)&v24 + 1) = v14;
    *((void *)this + 3) = v15;
    *((_OWORD *)this + 2) = v24;
    if (v16) {
      operator delete(v16);
    }
    goto LABEL_33;
  }
  uint64_t v11 = *((void *)this + 3);
LABEL_35:
  *(void *)(v11 + (((unint64_t)a2 >> 3) & 0x1FFFFFF8)) |= 1 << a2;
  uint64_t v25 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v25 + 64))(v25, 1, a2, 1);
  if (a3)
  {
    uint64_t v26 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)a3 + 40))(a3);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)v26 + 64))(v26, 0, a4, 1);
  }
  return 1;
}

uint64_t AVAudioNodeImplBase::RemoveStreamFormatObserver(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 40))(a1);
  uint64_t result = (*(uint64_t (**)(void))(v1 + 264))();
  if (result)
  {
    uint64_t v3 = result;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v6 = "AVAEInternal.h";
      __int16 v7 = 1024;
      int v8 = 104;
      __int16 v9 = 2080;
      unint64_t v10 = "AVAudioNode.mm";
      __int16 v11 = 1024;
      int v12 = 981;
      __int16 v13 = 2080;
      unint64_t v14 = "RemoveStreamFormatObserver";
      __int16 v15 = 2080;
      __int16 v16 = "AUI().RemoveV2PropertyListener(kAudioUnitProperty_StreamFormat, observer.mProc, observer.mUserData)";
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    return objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v3);
  }
  return result;
}

uint64_t AVAudioNodeImplBase::AddStreamFormatObserver(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 40))(a1);
  uint64_t result = (*(uint64_t (**)(void))(v1 + 256))();
  if (result)
  {
    uint64_t v3 = result;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v6 = "AVAEInternal.h";
      __int16 v7 = 1024;
      int v8 = 104;
      __int16 v9 = 2080;
      unint64_t v10 = "AVAudioNode.mm";
      __int16 v11 = 1024;
      int v12 = 976;
      __int16 v13 = 2080;
      unint64_t v14 = "AddStreamFormatObserver";
      __int16 v15 = 2080;
      __int16 v16 = "AUI().AddV2PropertyListener(kAudioUnitProperty_StreamFormat, observer.mProc, observer.mUserData)";
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    return objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v3);
  }
  return result;
}

uint64_t AVAudioNodeImplBase::SetPropertyAndReturnError(AVAudioNodeImplBase *this, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6)
{
  uint64_t v11 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, const void *, uint64_t))(*(void *)v11 + 232);

  return v12(v11, a2, a3, a4, a5, a6);
}

BOOL AVAudioNodeImplBase::GetProperty(AVAudioNodeImplBase *this, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  int v12 = a6;
  uint64_t v10 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, int *))(*(void *)v10 + 240))(v10, a2, a3, a4, a5, &v12) == 0;
}

BOOL AVAudioNodeImplBase::SetProperty(AVAudioNodeImplBase *this, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6)
{
  uint64_t v11 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, const void *, uint64_t))(*(void *)v11 + 232))(v11, a2, a3, a4, a5, a6) == 0;
}

uint64_t AVAudioNodeImplBase::GetParameter(AVAudioNodeImplBase *this, uint64_t a2, uint64_t a3, uint64_t a4, float *a5)
{
  uint64_t v9 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, float *))(*(void *)v9 + 128);

  return v10(v9, a2, a3, a4, a5);
}

uint64_t AVAudioNodeImplBase::SetParameter(AVAudioNodeImplBase *this, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  uint64_t v9 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(*(void *)v9 + 120);
  v11.n128_f32[0] = a5;

  return v10(v9, a2, a3, a4, v11);
}

uint64_t AVAudioNodeImplBase::Reset(AVAudioNodeImplBase *this)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this)
                           + 56);

  return v1();
}

uint64_t AVAudioNodeImplBase::SetInputFormat(AVAudioNodeImplBase *this, uint64_t a2, AVAudioFormat *a3)
{
  uint64_t v6 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  uint64_t v7 = (*(uint64_t (**)(AVAudioNodeImplBase *, uint64_t))(*(void *)this + 240))(this, a2);
  int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, AVAudioFormat *))(*(void *)v6 + 48);

  return v8(v6, 1, v7, a3);
}

uint64_t AVAudioNodeImplBase::GetInputFormat(AVAudioNodeImplBase *this, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  uint64_t v5 = (*(uint64_t (**)(AVAudioNodeImplBase *, uint64_t))(*(void *)this + 240))(this, a2);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v4 + 40);

  return v6(v4, 1, v5);
}

uint64_t AVAudioNodeImplBase::SetOutputFormat(AVAudioNodeImplBase *this, uint64_t a2, AVAudioFormat *a3)
{
  uint64_t v6 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  uint64_t v7 = (*(uint64_t (**)(AVAudioNodeImplBase *, uint64_t))(*(void *)this + 240))(this, a2);
  int v8 = *(uint64_t (**)(uint64_t, void, uint64_t, AVAudioFormat *))(*(void *)v6 + 48);

  return v8(v6, 0, v7, a3);
}

uint64_t AVAudioNodeImplBase::GetOutputFormat(AVAudioNodeImplBase *this)
{
  return (*(uint64_t (**)(void))(*(void *)this + 48))();
}

uint64_t AVAudioNodeImplBase::GetOutputFormat(AVAudioNodeImplBase *this, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(AVAudioNodeImplBase *))(*(void *)this + 40))(this);
  uint64_t v5 = (*(uint64_t (**)(AVAudioNodeImplBase *, uint64_t))(*(void *)this + 240))(this, a2);
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)v4 + 40);

  return v6(v4, 0, v5);
}

AVAudioNodeImplBase *AVAudioNodeImplBase::AVAE_CheckNodeHasEngine(AVAudioNodeImplBase *this)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!*((void *)this + 1))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v1 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v3 = "AVAEInternal.h";
      __int16 v4 = 1024;
      int v5 = 71;
      __int16 v6 = 2080;
      uint64_t v7 = "AVAudioNodeImpl.h";
      __int16 v8 = 1024;
      int v9 = 78;
      __int16 v10 = 2080;
      __n128 v11 = "AVAE_CheckNodeHasEngine";
      __int16 v12 = 2080;
      __int16 v13 = "_engine != nil";
      _os_log_impl(&dword_19D794000, v1, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    return (AVAudioNodeImplBase *)objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_engine != nil");
  }
  return this;
}

void AVAudioNodeImplBase::DidDetachFromEngine(AVAudioNodeImplBase *this, AVAudioEngine *a2)
{
  uint64_t v3 = (std::recursive_mutex *)((char *)this + 104);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)this + 104));
  *((void *)this + 1) = 0;

  std::recursive_mutex::unlock(v3);
}

void AVAudioNodeImplBase::DidAttachToEngine(AVAudioNodeImplBase *this, AVAudioEngine *a2)
{
  __int16 v4 = (std::recursive_mutex *)((char *)this + 104);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)this + 104));
  *((void *)this + 1) = [(AVAudioEngine *)a2 implementation];

  std::recursive_mutex::unlock(v4);
}

void sub_19D87FBB0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAudioNodeImpl::CurrentTime(AVAudioNodeImplBase *this)
{
  if (*((_DWORD *)this + 42))
  {
    if (*((unsigned char *)this + 48))
    {
      uint64_t v2 = (void *)*((void *)this + 2);
      if (!v2)
      {
        int v4 = 0;
        (*(void (**)(AVAudioNodeImplBase *))(*(void *)this + 352))(this);
        uint64_t result = [*((id *)this + 2) awaitIOCycle:&v4];
        if (!result) {
          return result;
        }
        uint64_t v2 = (void *)*((void *)this + 2);
      }
      return [v2 currentTime];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return AVAudioNodeImplBase::CurrentTime(this);
  }
}

void AVAudioNodeImpl::GetConverterNodes(uint64_t a1, char **a2)
{
  if (*(_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 256))(a1) == 1635083875)
  {
    int v5 = a2[1];
    unint64_t v4 = (unint64_t)a2[2];
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v7 = *a2;
      uint64_t v8 = (v5 - *a2) >> 3;
      unint64_t v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 61) {
        std::vector<EExtAudioGraphNodeState>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v10 = v4 - (void)v7;
      if (v10 >> 2 > v9) {
        unint64_t v9 = v10 >> 2;
      }
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v9;
      }
      if (v11)
      {
        if (v11 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        __int16 v12 = (char *)operator new(8 * v11);
      }
      else
      {
        __int16 v12 = 0;
      }
      __int16 v13 = &v12[8 * v8];
      *(void *)__int16 v13 = a1;
      __int16 v6 = v13 + 8;
      if (v5 != v7)
      {
        do
        {
          uint64_t v14 = *((void *)v5 - 1);
          v5 -= 8;
          *((void *)v13 - 1) = v14;
          v13 -= 8;
        }
        while (v5 != v7);
        int v5 = *a2;
      }
      *a2 = v13;
      a2[1] = v6;
      a2[2] = &v12[8 * v11];
      if (v5) {
        operator delete(v5);
      }
    }
    else
    {
      *(void *)int v5 = a1;
      __int16 v6 = v5 + 8;
    }
    a2[1] = v6;
  }
}

void AVAudioNodeImpl::~AVAudioNodeImpl(id *this)
{
  AVAudioNodeImpl::~AVAudioNodeImpl(this);

  JUMPOUT(0x19F3ABB30);
}

{
  id v2;
  uint64_t vars8;

  *this = &unk_1EEFA4600;

  this[2] = 0;
  uint64_t v2 = this[22];
  this[22] = 0;
  if (v2) {
    (*(void (**)(id))(*(void *)v2 + 8))(v2);
  }

  AVAudioNodeImplBase::~AVAudioNodeImplBase((AVAudioNodeImplBase *)this);
}

void AVAudioNodeImplBase::~AVAudioNodeImplBase(AVAudioNodeImplBase *this)
{
  *(void *)this = &unk_1EEFA5800;

  uint64_t v2 = (void *)*((void *)this + 8);
  if (v2)
  {
    int v5 = (void *)*v2;
    uint64_t v3 = v2 + 1;
    unint64_t v4 = v5;
    if (v5 != v3)
    {
      do
      {

        __int16 v6 = (void *)v4[1];
        if (v6)
        {
          do
          {
            uint64_t v7 = v6;
            __int16 v6 = (void *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            uint64_t v7 = (void *)v4[2];
            BOOL v8 = *v7 == (void)v4;
            unint64_t v4 = v7;
          }
          while (!v8);
        }
        unint64_t v4 = v7;
      }
      while (v7 != v3);
    }
  }
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)this + 104));
  std::unique_ptr<std::map<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>>::reset[abi:ne180100]((uint64_t *)this + 8, 0);
  uint64_t v9 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  uint64_t v10 = (void *)*((void *)this + 3);
  if (v10) {
    operator delete(v10);
  }
}

void AVAudioNodeImplBase::AVAudioNodeImplBase(AVAudioNodeImplBase *this)
{
  *(void *)this = &unk_1EEFA5800;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 34) = 0u;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((unsigned char *)this + 72) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 10) = 1;
  MEMORY[0x19F3AB9F0]((char *)this + 104);
}

void sub_19D87FFE8(_Unwind_Exception *a1)
{
  std::unique_ptr<std::map<std::pair<AVAudioNode *,unsigned int>,AVAudioMixingDestination *>>::reset[abi:ne180100](v1 + 8, 0);
  uint64_t v3 = v1[7];
  v1[7] = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  unint64_t v4 = (void *)v1[3];
  if (v4) {
    operator delete(v4);
  }
  _Unwind_Resume(a1);
}

void AVAudioNodeImpl::AVAudioNodeImpl(AVAudioNodeImplBase *a1, uint64_t a2, uint64_t a3, int a4)
{
  AVAudioNodeImplBase::AVAudioNodeImplBase(a1);
  *(void *)uint64_t v5 = &unk_1EEFA4600;
  *(_DWORD *)(v5 + 168) = a4;
  *(void *)(v5 + 176) = 0;
  operator new();
}

void sub_19D880110(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v2, 0x10A1C4060B6163ELL);
  uint64_t v4 = *(void *)(v1 + 176);
  *(void *)(v1 + 176) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  AVAudioNodeImplBase::~AVAudioNodeImplBase((AVAudioNodeImplBase *)v1);
  _Unwind_Resume(a1);
}

uint64_t AUInterfaceV3::IsRunning(AUInterfaceV3 *this)
{
  return 0;
}

uint64_t AUInterfaceBaseV3::ScheduleMIDIEventListBlock(AUInterfaceBaseV3 *this)
{
  uint64_t v1 = *((void *)this + 10);
  if (v1) {
    return *(void *)v1;
  }
  else {
    return 0;
  }
}

uint64_t AUInterfaceBaseV3::ScheduleMIDIEventBlock(AUInterfaceBaseV3 *this)
{
  uint64_t v1 = *((void *)this + 9);
  if (v1) {
    return *(void *)v1;
  }
  else {
    return 0;
  }
}

uint64_t AUInterfaceBaseV3::ParameterTree(AUInterfaceBaseV3 *this)
{
  uint64_t v1 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);

  return [v1 parameterTree];
}

uint64_t AUInterfaceBaseV3::auv3(AUInterfaceBaseV3 *this)
{
  return *((void *)this + 5);
}

uint64_t AUInterfaceV3::StopIO(AUInterfaceV3 *this)
{
  return 0;
}

uint64_t AUInterfaceV3::StartIO(AUInterfaceV3 *this)
{
  return 0;
}

uint64_t AUInterfaceBaseV3::auv2(AUInterfaceBaseV3 *this)
{
  return *((void *)this + 4);
}

uint64_t AUInterfaceV3::CanPerformIO(AUInterfaceV3 *this)
{
  return 0;
}

uint64_t AUInterfaceBaseV3::GetComponentDescription(AUInterfaceBaseV3 *this)
{
  return (uint64_t)this + 8;
}

void AUInterfaceV3::~AUInterfaceV3(const void ***this)
{
  AUInterfaceBaseV3::~AUInterfaceBaseV3(this);

  JUMPOUT(0x19F3ABB30);
}

void sub_19D8805F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D880718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void AVAudioUnitSamplerImpl::SetSoundBankURL(AVAudioUnitSamplerImpl *this, CFTypeRef cf)
{
  if (cf)
  {
    *((unsigned char *)this + 184) = 1;
    uint64_t v4 = (const void *)*((void *)this + 24);
    if (v4) {
      CFRelease(v4);
    }
    *((void *)this + 24) = cf;
    CFRetain(cf);
  }
  else
  {
    uint64_t v5 = (const void *)*((void *)this + 24);
    if (v5)
    {
      CFRelease(v5);
      *((void *)this + 24) = 0;
    }
    *((unsigned char *)this + 184) = 0;
  }
}

void sub_19D880970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D880A18(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v1, 0x10F1C40CA7A8F2DLL);
  _Unwind_Resume(a1);
}

void AVAudioUnitSamplerImpl::~AVAudioUnitSamplerImpl(AVAudioUnitSamplerImpl *this)
{
  AVAudioUnitSamplerImpl::~AVAudioUnitSamplerImpl(this);

  JUMPOUT(0x19F3ABB30);
}

{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_1EEFA6618;
  if (*((unsigned char *)this + 184))
  {
    uint64_t v2 = (const void *)*((void *)this + 24);
    if (v2) {
      CFRelease(v2);
    }
  }

  AVAudioUnitImpl::~AVAudioUnitImpl((id *)this);
}

AVAudioFormat *AVAudioIOUnit::_GetHWFormat(AVAudioIOUnit *this, int a2, unsigned int *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a3) {
    int v5 = *(unsigned char *)a3 & 1;
  }
  else {
    int v5 = 0;
  }
  uint64_t v6 = 32;
  if (a2)
  {
    uint64_t v7 = (void **)((char *)this + 32);
  }
  else
  {
    uint64_t v6 = 40;
    uint64_t v7 = (void **)((char *)this + 40);
  }
  BOOL v8 = *(void **)((char *)this + v6);
  if (!v8
    || ([*(id *)((char *)this + v6) sampleRate], v9 <= 0.0)
    || (![v8 channelCount] ? (int v10 = 1) : (int v10 = v5), v10 == 1))
  {
    int v28 = v7;
    unsigned int v11 = 0;
    uint64_t v12 = 0;
    char v13 = 1;
    while (1)
    {
      char v14 = v13;
      if (v12) {
        __int16 v15 = (id *)((char *)this + 32);
      }
      else {
        __int16 v15 = (id *)((char *)this + 40);
      }
      id v16 = *v15;
      if (*v15)
      {
        [*v15 sampleRate];
        if (v17 > 0.0)
        {
          int v18 = [v16 channelCount] ? v5 : 1;
          if (v18 != 1) {
            goto LABEL_38;
          }
        }
      }
      uint64_t v19 = (*(uint64_t (**)(AVAudioIOUnit *))(*(void *)this + 16))(this);
      __int16 v20 = (AVAudioFormat *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v19 + 40))(v19, v12 & 1, v12);
      if (v20)
      {
        __int16 v21 = v20;
        [(AVAudioFormat *)v20 sampleRate];
        if (v22 > 0.0
          && [(AVAudioFormat *)v21 channelCount]
          && [(AVAudioFormat *)v21 isInterleaved])
        {
          uint64_t v23 = (void *)[(NSDictionary *)[(AVAudioFormat *)v21 settings] mutableCopy];
          objc_msgSend(v23, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AVLinearPCMIsNonInterleaved");
          __int16 v21 = [[AVAudioFormat alloc] initWithSettings:v23];
        }
      }
      else
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        long long v24 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          AudioFormatFlags v30 = "AVAEInternal.h";
          __int16 v31 = 1024;
          int v32 = 71;
          __int16 v33 = 2080;
          id v34 = "AVAudioIONodeImpl.mm";
          __int16 v35 = 1024;
          int v36 = 430;
          __int16 v37 = 2080;
          std::string v38 = "_GetHWFormat";
          __int16 v39 = 2080;
          __int16 v40 = "hwFormat";
          _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "hwFormat");
        __int16 v21 = 0;
      }
      if (!*v15) {
        break;
      }
      if (!-[AVAudioFormat isEqual:](v21, "isEqual:"))
      {
        id v25 = *v15;
LABEL_37:

        *__int16 v15 = v21;
        uint64_t v26 = v21;
        v11 |= 2u;
      }
LABEL_38:
      char v13 = 0;
      uint64_t v12 = 1;
      if ((v14 & 1) == 0)
      {
        BOOL v8 = *v28;
        if (a3) {
          goto LABEL_40;
        }
        goto LABEL_41;
      }
    }
    id v25 = 0;
    goto LABEL_37;
  }
  unsigned int v11 = 0;
  if (a3) {
LABEL_40:
  }
    *a3 = v11;
LABEL_41:
  if (!v8) {
    return +[AVAudioFormat formatWithInvalidSampleRateAndChannelCount];
  }
  return (AVAudioFormat *)v8;
}

uint64_t AVAudioIOUnit::IsRunning(AVAudioIOUnit *this)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v1 = *((void *)this + 1);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZNK13AVAudioIOUnit9IsRunningEv_block_invoke;
  v4[3] = &unk_1E5965960;
  v4[4] = &v5;
  v4[5] = this;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___ZNK13AVAudioIOUnit9IsRunningEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(uint64_t (**)(void))(**(void **)(a1 + 40) + 16))(*(void *)(a1 + 40));
  uint64_t result = (*(uint64_t (**)(void))(v2 + 336))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t AVAudioIOUnit::GetDeviceLatency(AVAudioIOUnit *this, int a2)
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F4E9F8] sharedInstance];
  if (a2)
  {
    return [v3 inputLatency];
  }
  else
  {
    return [v3 outputLatency];
  }
}

uint64_t AVAudioIOUnit::GetClientFormat(AVAudioIOUnit *this, int a2)
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3052000000;
  int v10 = __Block_byref_object_copy__7264;
  unsigned int v11 = __Block_byref_object_dispose__7265;
  uint64_t v12 = 0;
  uint64_t v2 = *((void *)this + 1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN13AVAudioIOUnit15GetClientFormatEj_block_invoke;
  block[3] = &unk_1E5965938;
  int v6 = a2;
  block[4] = &v7;
  block[5] = this;
  dispatch_sync(v2, block);
  uint64_t v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __Block_byref_object_copy__7264(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__7265(uint64_t a1)
{
}

uint64_t ___ZN13AVAudioIOUnit15GetClientFormatEj_block_invoke(uint64_t a1)
{
  BOOL v2 = *(_DWORD *)(a1 + 48) == 0;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 16))(*(void *)(a1 + 40));
  uint64_t result = (*(uint64_t (**)(uint64_t, BOOL, void))(*(void *)v3 + 40))(v3, v2, *(unsigned int *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t AVAudioIOUnit::GetHWFormat(AVAudioIOUnit *this, int a2, unsigned int *a3)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  unsigned int v11 = __Block_byref_object_copy__7264;
  uint64_t v12 = __Block_byref_object_dispose__7265;
  uint64_t v13 = 0;
  uint64_t v3 = *((void *)this + 1);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _OWORD v6[2] = ___ZN13AVAudioIOUnit11GetHWFormatEjPj_block_invoke;
  v6[3] = &unk_1E5965910;
  void v6[4] = &v8;
  v6[5] = this;
  int v7 = a2;
  v6[6] = a3;
  dispatch_sync(v3, v6);
  uint64_t v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

id ___ZN13AVAudioIOUnit11GetHWFormatEjPj_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = (*(uint64_t (**)(void, void, void))(**(void **)(a1 + 40) + 72))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return v2;
}

uint64_t AVAudioIOUnit::AUI(AVAudioIOUnit *this)
{
  return *((void *)this + 3);
}

void AVAudioIOUnit::~AVAudioIOUnit(dispatch_queue_t *this)
{
  AVAudioIOUnit::~AVAudioIOUnit(this);

  JUMPOUT(0x19F3ABB30);
}

{
  uint64_t v2;
  unsigned int *v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_queue_t v8;

  *this = (dispatch_queue_t)&unk_1EEFA40F8;
  id v2 = IOUnitPropertyList();
  uint64_t v3 = *(unsigned int **)v2;
  uint64_t v4 = *(unsigned int **)(v2 + 8);
  while (v3 != v4)
  {
    uint64_t v5 = *v3;
    int v6 = ((uint64_t (*)(dispatch_queue_t *))(*this)[2].isa)(this);
    (*(void (**)(uint64_t, uint64_t, void (*)(NSObject **, void *, OpaqueAudioComponentInstance *, int, int), dispatch_queue_t *))(*(void *)v6 + 264))(v6, v5, AVAudioIOUnit::IOUnitPropertyListener, this);
    ++v3;
  }
  dispatch_sync(this[1], &__block_literal_global_7266);
  dispatch_release(this[1]);

  int v7 = this[9];
  if (v7)
  {
    this[10] = v7;
    operator delete(v7);
  }
  uint64_t v8 = this[3];
  this[3] = 0;
  if (v8) {
    (*((void (**)(dispatch_queue_t))v8->isa + 1))(v8);
  }
}

uint64_t IOUnitPropertyList(void)
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  {
    operator new();
  }
  return IOUnitPropertyList(void)::sPropList;
}

void sub_19D881540(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v1, 0x10C402FEFCB83);
  _Unwind_Resume(a1);
}

void AVAudioIOUnit::IOUnitPropertyListener(NSObject **this, void *a2, OpaqueAudioComponentInstance *a3, int a4, int a5)
{
  if (a3 == 2001)
  {
    uint64_t v6 = *(void *)((uint64_t (*)(NSObject **, void *))(*this)[2].isa)(this, a2);
    if ((*(uint64_t (**)(void))(v6 + 336))()) {
      return;
    }
    int v7 = this[1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___ZN13AVAudioIOUnit24Listener_IsRunningChangeEv_block_invoke;
    v13[3] = &__block_descriptor_40_e5_v8__0l;
    void v13[4] = this;
    uint64_t v8 = v13;
  }
  else
  {
    int v7 = this[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN13AVAudioIOUnit22IOUnitPropertyListenerEPvP28OpaqueAudioComponentInstancejjj_block_invoke;
    block[3] = &__block_descriptor_60_e5_v8__0l;
    int v10 = (int)a3;
    int v11 = a5;
    int v12 = a4;
    block[4] = this;
    block[5] = a2;
    uint64_t v8 = block;
  }
  dispatch_async(v7, v8);
}

void ___ZN13AVAudioIOUnit22IOUnitPropertyListenerEPvP28OpaqueAudioComponentInstancejjj_block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 48);
  if (v1 != 19 && v1 != 8) {
    return;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 52);
  if (!v4)
  {
    if (*(_DWORD *)(a1 + 56) != 2) {
      goto LABEL_23;
    }
LABEL_11:
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = 4;
    if (!v4) {
      uint64_t v6 = 5;
    }
    int v7 = (void *)v5[v6];
    if (v7)
    {
      [(id)v5[v6] sampleRate];
      LODWORD(v7) = v8 > 0.0 && [v7 channelCount] != 0;
    }
    int v16 = 1;
    (*(void (**)(void *, uint64_t, int *))(*v5 + 72))(v5, v4, &v16);
    if ((v16 & 2) != 0 && v7)
    {
      uint64_t v9 = v5[2];
      if (!*(void *)(v9 + 88))
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = ___ZN17AVAudioEngineImpl26IOUnitConfigurationChangedEv_block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0l;
        block[4] = v9;
        *(void *)(v9 + 88) = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
      }
      int v10 = *(NSObject **)(v9 + 72);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = ___ZN17AVAudioEngineImpl26IOUnitConfigurationChangedEv_block_invoke_2;
      v17[3] = &__block_descriptor_40_e5_v8__0l;
      void v17[4] = v9;
      dispatch_async(v10, v17);
    }
    int v1 = *(_DWORD *)(a1 + 48);
    goto LABEL_23;
  }
  if (v4 == 1 && *(_DWORD *)(a1 + 56) == 1) {
    goto LABEL_11;
  }
LABEL_23:
  if (v1 == 8)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(v11 + 72);
    uint64_t v13 = *(void *)(v11 + 80);
    while (v12 != v13)
    {
      __int16 v15 = *(void (**)(uint64_t, void, void, void, void))v12;
      uint64_t v14 = *(void *)(v12 + 8);
      v12 += 16;
      v15(v14, *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 52));
    }
  }
}

void ___ZN13AVAudioIOUnit24Listener_IsRunningChangeEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 16);
  id v2 = *(NSObject **)(v1 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN17AVAudioEngineImpl13IOUnitStoppedEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v1;
  dispatch_async(v2, block);
}

void *std::vector<unsigned int>::vector[abi:ne180100](void *a1, const void *a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >> 62) {
      std::vector<EExtAudioGraphNodeState>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<EExtAudioGraphNodeState>>(a3);
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[4 * v7];
    memmove(v6, a2, 4 * a3);
    a1[1] = &v6[4 * a3];
  }
  return a1;
}

void sub_19D881988(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AVAudioIONodeImpl::GetComponentDescription(AVAudioIONodeImpl *this)
{
  return *((void *)this + 21) + 48;
}

uint64_t AVAudioIONodeImpl::BusForElement(AVAudioIONodeImpl *this)
{
  return 0;
}

uint64_t AVAudioIONodeImpl::ElementForBus(AVAudioIONodeImpl *this)
{
  return *((unsigned __int8 *)this + 176);
}

uint64_t AVAudioIONodeImpl::GetAudioUnitV3(AVAudioIONodeImpl *this)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(AVAudioIONodeImpl *))(*(void *)this + 40))(this)
                           + 304);

  return v1();
}

uint64_t AVAudioIONodeImpl::GetAudioUnitV2(AVAudioIONodeImpl *this)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(AVAudioIONodeImpl *))(*(void *)this + 40))(this)
                           + 272);

  return v1();
}

uint64_t AVAudioIONodeImpl::GetDeviceLatency(AVAudioIONodeImpl *this)
{
  return (*(uint64_t (**)(void, void))(**((void **)this + 21) + 40))(*((void *)this + 21), *((unsigned __int8 *)this + 176));
}

void AVAudioIONodeImpl::RemoveStreamFormatObserver(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZN13AVAudioIOUnit26RemoveStreamFormatObserverERK30AVAEStreamFormatObserverStruct_block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_sync(v3, v4);
}

uint64_t ___ZN13AVAudioIOUnit26RemoveStreamFormatObserverERK30AVAEStreamFormatObserverStruct_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v3 = *(void **)(v1 + 72);
  uint64_t v2 = *(void **)(v1 + 80);
  if (v3 != v2)
  {
    uint64_t v4 = *(void **)(result + 40);
    uint64_t v5 = *(void **)(v1 + 72);
    while (*v5 != *v4 || v5[1] != v4[1])
    {
      v5 += 2;
      if (v5 == v2)
      {
        uint64_t v5 = *(void **)(v1 + 80);
        break;
      }
    }
    if (v5 != v2)
    {
      if (v3 == v2)
      {
        uint64_t v6 = *(void **)(v1 + 72);
      }
      else
      {
        uint64_t v6 = *(void **)(v1 + 72);
        while (*v6 != *v4 || v6[1] != v4[1])
        {
          v6 += 2;
          if (v6 == v2)
          {
            uint64_t v6 = *(void **)(v1 + 80);
            break;
          }
        }
      }
      if (v6 != v2)
      {
        uint64_t v7 = v6 + 2;
        if (v6 + 2 != v2)
        {
          do
          {
            if (*v7 != *v4 || v7[1] != v4[1])
            {
              *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
              v6 += 2;
            }
            v7 += 2;
          }
          while (v7 != v2);
          uint64_t v2 = *(void **)(v1 + 80);
        }
        if (v2 != v6) {
          *(void *)(v1 + 80) = v6;
        }
      }
    }
  }
  return result;
}

void AVAudioIONodeImpl::AddStreamFormatObserver(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZN13AVAudioIOUnit23AddStreamFormatObserverERK30AVAEStreamFormatObserverStruct_block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_sync(v3, v4);
}

void ___ZN13AVAudioIOUnit23AddStreamFormatObserverERK30AVAEStreamFormatObserverStruct_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = (char *)v1[9];
  uint64_t v4 = (char *)v1[10];
  if (v3 == v4)
  {
    uint64_t v5 = (char *)v1[9];
  }
  else
  {
    uint64_t v5 = (char *)v1[9];
    while (*(void *)v5 != *v2 || *((void *)v5 + 1) != v2[1])
    {
      v5 += 16;
      if (v5 == v4)
      {
        uint64_t v5 = (char *)v1[10];
        break;
      }
    }
  }
  if (v5 == v4)
  {
    unint64_t v6 = v1[11];
    if ((unint64_t)v4 >= v6)
    {
      uint64_t v8 = (v4 - v3) >> 4;
      unint64_t v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 60) {
        std::vector<EExtAudioGraphNodeState>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v10 = v6 - (void)v3;
      if (v10 >> 3 > v9) {
        unint64_t v9 = v10 >> 3;
      }
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v9;
      }
      if (v11)
      {
        if (v11 >> 60) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v12 = (char *)operator new(16 * v11);
      }
      else
      {
        uint64_t v12 = 0;
      }
      uint64_t v13 = &v12[16 * v8];
      *(_OWORD *)uint64_t v13 = *(_OWORD *)v2;
      uint64_t v7 = v13 + 16;
      if (v3 != v4)
      {
        do
        {
          *((_OWORD *)v13 - 1) = *((_OWORD *)v4 - 1);
          v13 -= 16;
          v4 -= 16;
        }
        while (v4 != v3);
        uint64_t v3 = (char *)v1[9];
      }
      v1[9] = v13;
      v1[10] = v7;
      v1[11] = &v12[16 * v11];
      if (v3) {
        operator delete(v3);
      }
    }
    else
    {
      *(_OWORD *)uint64_t v4 = *(_OWORD *)v2;
      uint64_t v7 = v4 + 16;
    }
    v1[10] = v7;
  }
}

uint64_t AVAudioIONodeImpl::NumberOutputs(AVAudioIONodeImpl *this)
{
  return 1;
}

uint64_t AVAudioIONodeImpl::NumberInputs(AVAudioIONodeImpl *this)
{
  return 1;
}

uint64_t AVAudioIONodeImpl::SetInputFormat(AVAudioIONodeImpl *this, uint64_t a2, AVAudioFormat *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)this + 176))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    unint64_t v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      unint64_t v11 = "AVAEInternal.h";
      __int16 v12 = 1024;
      int v13 = 71;
      __int16 v14 = 2080;
      __int16 v15 = "AVAudioIONodeImpl.mm";
      __int16 v16 = 1024;
      int v17 = 1346;
      __int16 v18 = 2080;
      uint64_t v19 = "SetInputFormat";
      __int16 v20 = 2080;
      __int16 v21 = "!_isInput";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "!_isInput");
  }
  if (!a3
    || ([(AVAudioFormat *)a3 sampleRate], v7 <= 0.0)
    || ![(AVAudioFormat *)a3 channelCount])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      unint64_t v11 = "AVAEInternal.h";
      __int16 v12 = 1024;
      int v13 = 71;
      __int16 v14 = 2080;
      __int16 v15 = "AVAudioIONodeImpl.mm";
      __int16 v16 = 1024;
      int v17 = 1347;
      __int16 v18 = 2080;
      uint64_t v19 = "SetInputFormat";
      __int16 v20 = 2080;
      __int16 v21 = "IsFormatSampleRateAndChannelCountValid(format)";
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsFormatSampleRateAndChannelCountValid(format)");
  }
  return AVAudioNodeImplBase::SetInputFormat((AVAudioNodeImplBase *)this, a2, a3);
}

AVAudioFormat *AVAudioIONodeImpl::GetInputFormat(AVAudioIONodeImpl *this)
{
  if (*((unsigned char *)this + 176))
  {
    int v2 = *((unsigned __int8 *)this + 48);
    if (!*((unsigned char *)this + 48))
    {
      uint64_t v6 = (*(uint64_t (**)(AVAudioIONodeImpl *))(*(void *)this + 40))(this);
      if ((*(unsigned int (**)(uint64_t))(*(void *)v6 + 24))(v6)) {
        goto LABEL_10;
      }
    }
    uint64_t v3 = (*(uint64_t (**)(void, uint64_t, void))(**((void **)this + 21) + 24))(*((void *)this + 21), 1, 0);
    if (!v2)
    {
      uint64_t v4 = (*(uint64_t (**)(AVAudioIONodeImpl *))(*(void *)this + 40))(this);
      (*(void (**)(uint64_t))(*(void *)v4 + 32))(v4);
    }
    if (!v3) {
      goto LABEL_10;
    }
    return (AVAudioFormat *)v3;
  }
  uint64_t v3 = (*(uint64_t (**)(void, void))(**((void **)this + 21) + 32))(*((void *)this + 21), 0);
  if (v3) {
    return (AVAudioFormat *)v3;
  }
LABEL_10:

  return +[AVAudioFormat formatWithInvalidSampleRateAndChannelCount];
}

uint64_t AVAudioIONodeImpl::SetOutputFormat(AVAudioIONodeImpl *this, uint64_t a2, AVAudioFormat *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!*((unsigned char *)this + 176))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      id v25 = "AVAEInternal.h";
      __int16 v26 = 1024;
      int v27 = 71;
      __int16 v28 = 2080;
      __int16 v29 = "AVAudioIONodeImpl.mm";
      __int16 v30 = 1024;
      *(_DWORD *)__int16 v31 = 1310;
      *(_WORD *)&v31[4] = 2080;
      *(void *)&v31[6] = "SetOutputFormat";
      __int16 v32 = 2080;
      __int16 v33 = "_isInput";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_isInput");
    if (!a3) {
      goto LABEL_11;
    }
LABEL_9:
    [(AVAudioFormat *)a3 sampleRate];
    if (v7 > 0.0 && [(AVAudioFormat *)a3 channelCount]) {
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (a3) {
    goto LABEL_9;
  }
LABEL_11:
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  uint64_t v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316418;
    id v25 = "AVAEInternal.h";
    __int16 v26 = 1024;
    int v27 = 71;
    __int16 v28 = 2080;
    __int16 v29 = "AVAudioIONodeImpl.mm";
    __int16 v30 = 1024;
    *(_DWORD *)__int16 v31 = 1311;
    *(_WORD *)&v31[4] = 2080;
    *(void *)&v31[6] = "SetOutputFormat";
    __int16 v32 = 2080;
    __int16 v33 = "IsFormatSampleRateAndChannelCountValid(format)";
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsFormatSampleRateAndChannelCountValid(format)");
LABEL_16:
  unint64_t v9 = (_DWORD *)(*(uint64_t (**)(AVAudioIONodeImpl *))(*(void *)this + 256))(this);
  if (*v9 != 1635086197 || v9[1] != 1987078511 || v9[2] != 1634758764)
  {
    __int16 v12 = (void *)(*(uint64_t (**)(AVAudioIONodeImpl *, uint64_t))(*(void *)this + 72))(this, a2);
    if (v12
      && (int v13 = v12, [v12 sampleRate], v14 > 0.0)
      && [v13 channelCount])
    {
      [(AVAudioFormat *)a3 sampleRate];
      double v16 = v15;
      [v13 sampleRate];
      if (v16 == v17) {
        return AVAudioNodeImplBase::SetOutputFormat((AVAudioNodeImplBase *)this, a2, a3);
      }
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      uint64_t v23 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        id v25 = "AVAudioIONodeImpl.mm";
        __int16 v26 = 1024;
        int v27 = 1329;
        __int16 v28 = 2112;
        __int16 v29 = (char *)v13;
        __int16 v30 = 2112;
        *(void *)__int16 v31 = a3;
        _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Format mismatch: input hw %@, client format %@", buf, 0x26u);
      }
      __int16 v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"OSStatus", &unk_1EEFB5690, 0);
      uint64_t v22 = @"Input HW format and tap format not matching";
    }
    else
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      uint64_t v19 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v25 = "AVAudioIONodeImpl.mm";
        __int16 v26 = 1024;
        int v27 = 1317;
        _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: input hw format invalid", buf, 0x12u);
      }
      __int16 v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"OSStatus", &unk_1EEFB5690, 0);
      uint64_t v22 = @"Input HW format is invalid";
    }
    objc_exception_throw((id)[v20 exceptionWithName:@"com.apple.coreaudio.avfaudio" reason:v22 userInfo:v21]);
  }
  return AVAudioNodeImplBase::SetOutputFormat((AVAudioNodeImplBase *)this, a2, a3);
}

AVAudioFormat *AVAudioIONodeImpl::GetOutputFormat(AVAudioIONodeImpl *this, unint64_t a2, char a3)
{
  if (a3)
  {
    int v3 = *((unsigned __int8 *)this + 176);
    BOOL v4 = *((unsigned char *)this + 176) == 0;
    uint64_t v5 = (dispatch_queue_t *)*((void *)this + 21);
    dispatch_assert_queue_V2(v5[1]);
    if (v3 == v4)
    {
      uint64_t v6 = 5;
      if (v3) {
        uint64_t v6 = 4;
      }
      dispatch_queue_t v7 = v5[v6];
      uint64_t v8 = v7;
      if (v7) {
        return (AVAudioFormat *)v7;
      }
    }
    else
    {
      uint64_t v11 = ((uint64_t (*)(dispatch_queue_t *))(*v5)[2].isa)(v5);
      dispatch_queue_t v7 = (dispatch_queue_t)(*(uint64_t (**)(uint64_t, BOOL, BOOL))(*(void *)v11 + 40))(v11, v3 != 0, v4);
      if (v7) {
        return (AVAudioFormat *)v7;
      }
    }
    return +[AVAudioFormat formatWithInvalidSampleRateAndChannelCount];
  }
  else
  {
    uint64_t v10 = *(uint64_t (**)(void))(*(void *)this + 48);
    return (AVAudioFormat *)v10();
  }
}

AVAudioFormat *AVAudioIONodeImpl::GetOutputFormat(AVAudioIONodeImpl *this)
{
  if (*((unsigned char *)this + 176))
  {
    uint64_t v2 = (*(uint64_t (**)(void, uint64_t))(**((void **)this + 21) + 32))(*((void *)this + 21), 1);
    if (!v2) {
      goto LABEL_11;
    }
    return (AVAudioFormat *)v2;
  }
  int v3 = *((unsigned __int8 *)this + 48);
  if (*((unsigned char *)this + 48)
    || (uint64_t v6 = (*(uint64_t (**)(AVAudioIONodeImpl *))(*(void *)this + 40))(this),
        !(*(unsigned int (**)(uint64_t))(*(void *)v6 + 24))(v6)))
  {
    uint64_t v4 = (*(uint64_t (**)(void, void, void))(**((void **)this + 21) + 24))(*((void *)this + 21), 0, 0);
    uint64_t v2 = v4;
    if (v3)
    {
      if (v4) {
        return (AVAudioFormat *)v2;
      }
    }
    else
    {
      uint64_t v7 = (*(uint64_t (**)(AVAudioIONodeImpl *))(*(void *)this + 40))(this);
      (*(void (**)(uint64_t))(*(void *)v7 + 32))(v7);
      if (v2) {
        return (AVAudioFormat *)v2;
      }
    }
  }
LABEL_11:

  return +[AVAudioFormat formatWithInvalidSampleRateAndChannelCount];
}

uint64_t AVAudioIONodeImpl::AUI(AVAudioIONodeImpl *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 21) + 16))();
}

void AVAudioIONodeImpl::~AVAudioIONodeImpl(id *this)
{
  AVAudioIONodeImpl::~AVAudioIONodeImpl(this);

  JUMPOUT(0x19F3ABB30);
}

{
  uint64_t vars8;

  *this = &unk_1EEFA4FE8;

  this[2] = 0;

  AVAudioNodeImplBase::~AVAudioNodeImplBase((AVAudioNodeImplBase *)this);
}

void AVAudioIOUnit::Create(AVAudioIOUnit *this, AVAudioEngineImpl *a2, BOOL a3, BOOL a4, AVAudioSession *a5)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  operator new();
}

void sub_19D882F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t *a11)
{
  MEMORY[0x19F3ABB30](v12, 0x10A1C4060B6163ELL);
  double v14 = *a10;
  if (*a10)
  {
    *(void *)(v11 + 80) = v14;
    operator delete(v14);
  }
  uint64_t v15 = *a11;
  *a11 = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  MEMORY[0x19F3ABB30](v11, 0x10A1C402E4ADA58);
  _Unwind_Resume(a1);
}

uint64_t AVAudioIOUnit::OverrideAudioSession(AVAudioIOUnit *this, AVAudioSession *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 0;
  }
  int v8 = [(AVAudioSession *)a2 opaqueSessionID];
  uint64_t v3 = (*(uint64_t (**)(AVAudioIOUnit *))(*(void *)this + 16))(this);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, void, void, int *, uint64_t))(*(void *)v3 + 232))(v3, 2023, 0, 0, &v8, 4);
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  uint64_t v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *((void *)this + 2);
    *(_DWORD *)buf = 136316162;
    uint64_t v10 = "AVAudioIONodeImpl.mm";
    __int16 v11 = 1024;
    int v12 = 235;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    __int16 v15 = 1024;
    int v16 = v8;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: associating with audio session (0x%x), error %d", buf, 0x28u);
  }
  return v4;
}

void AUInterfaceVoiceIOV3::~AUInterfaceVoiceIOV3(const void ***this)
{
  AUInterfaceBaseV3::~AUInterfaceBaseV3(this);

  JUMPOUT(0x19F3ABB30);
}

uint64_t ___ZN13AVAudioIOUnit9EnableBusEj_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(void))(**(void **)(a1 + 32) + 16))(*(void *)(a1 + 32))
                           + 280);

  return v1();
}

uint64_t AVAudioIOUnit::CanPerformIO(AVAudioIOUnit *this, int a2)
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v2 = *((void *)this + 1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZNK13AVAudioIOUnit12CanPerformIOEj_block_invoke;
  block[3] = &unk_1E5965938;
  int v6 = a2;
  block[4] = &v7;
  void block[5] = this;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t ___ZNK13AVAudioIOUnit12CanPerformIOEj_block_invoke(uint64_t a1)
{
  BOOL v2 = *(_DWORD *)(a1 + 48) != 0;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 16))(*(void *)(a1 + 40));
  uint64_t result = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)v3 + 80))(v3, v2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_19D883740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D883A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }

  _Unwind_Resume(a1);
}

void sub_19D883DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }

  _Unwind_Resume(a1);
}

void sub_19D88423C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_19D884714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19D8849E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_19D884DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_19D8850B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D88563C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_19D8857C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D8858B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8859C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D886748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D886A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D886AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D886B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D886D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_19D886DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D886EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AVAudioSequencer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_19D887010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D887368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CallbackMessenger *a9)
{
  std::unique_ptr<CallbackMessenger>::reset[abi:ne180100](&a9);

  MEMORY[0x19F3ABB30](v11, 0xA0C40B908FCF4);
  _Unwind_Resume(a1);
}

void sub_19D887728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CallbackMessenger *a9)
{
  std::unique_ptr<CallbackMessenger>::reset[abi:ne180100](&a9);

  MEMORY[0x19F3ABB30](v10, 0xA0C40B908FCF4);
  _Unwind_Resume(a1);
}

void sub_19D887C7C(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

void sub_19D888014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D888160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D888230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D8885B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D888654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D8886F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D88879C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D888840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D8888E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D888988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D888A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D888AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D888B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D8897CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

void sub_19D889984(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

void sub_19D889A98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D889BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D889E68(_Unwind_Exception *a1)
{
}

void sub_19D889F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D88A038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D88A2E8(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v2);
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D88A390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D88A550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

AVAudioTime *AVAudioPlayerNodeImpl::PlayerTimeForNodeTime(AVAudioPlayerNodeImpl *this, AVAudioTime *a2)
{
  if (*((_DWORD *)this + 48) != 1) {
    return 0;
  }
  long long v3 = 0uLL;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (!a2
    || ([(AVAudioTime *)a2 audioTimeStamp], long long v3 = 0uLL, LOBYTE(v4) = BYTE8(v16), (~DWORD2(v16) & 3) != 0))
  {
    long long v11 = v3;
    long long v12 = v3;
    long long v9 = v3;
    long long v10 = v3;
    uint64_t v5 = (void *)(*(uint64_t (**)(AVAudioPlayerNodeImpl *))(*(void *)this + 352))(this);
    if (v5)
    {
      [v5 currentAudioTimeStamp];
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
    }
    objc_msgSend(*((id *)this + 23), "sampleRate", v9);
    int v4 = DWORD2(v16);
    if ((~DWORD2(v16) & 7) != 0 && (BYTE8(v16) & 3) != 0 && (BYTE8(v12) & 3) == 3)
    {
      if ((BYTE8(v16) & 4) != 0)
      {
        double v8 = *(double *)&v14;
        if ((BYTE8(v16) & 2) == 0) {
          goto LABEL_22;
        }
      }
      else
      {
        double v8 = 1.0;
        if ((BYTE8(v12) & 4) == 0)
        {
          if ((BYTE8(v16) & 2) != 0) {
            goto LABEL_14;
          }
LABEL_22:
          *((void *)&v13 + 1) = (unint64_t)((double)*((uint64_t *)&v9 + 1)
                                                   + (*(double *)&v13 - *(double *)&v9) * (v8 * 24000000.0 / v7));
          if (v4) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
        int v4 = DWORD2(v16) | 4;
        double v8 = *(double *)&v10;
        *(void *)&long long v14 = v10;
        if ((BYTE8(v16) & 2) == 0) {
          goto LABEL_22;
        }
      }
LABEL_14:
      if (v4)
      {
LABEL_16:
        v4 |= 3u;
        DWORD2(v16) = v4;
        goto LABEL_17;
      }
LABEL_15:
      *(double *)&long long v13 = *(double *)&v9
                      + round(v7 / (v8 * 24000000.0) * (double)(uint64_t)(*((void *)&v13 + 1) - *((void *)&v9 + 1)));
      goto LABEL_16;
    }
  }
LABEL_17:
  DWORD2(v12) = v4 & 7;
  *(void *)&long long v10 = v14;
  *((void *)&v9 + 1) = *((void *)&v13 + 1);
  *(double *)&long long v9 = *(double *)&v13 - *((double *)this + 25);
  objc_msgSend(*((id *)this + 23), "sampleRate", (void)v9, *((void *)&v13 + 1), __PAIR128__(*((unint64_t *)&v10 + 1), v14), v11, v12);
  return +[AVAudioTime timeWithAudioTimeStamp:sampleRate:](AVAudioTime, "timeWithAudioTimeStamp:sampleRate:", &v9);
}

void sub_19D88AA88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_19D88AB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D88ABA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D88AC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D88ACCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D88B1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

id AVAudioPlayerNodeImpl::ScheduleSegment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_6:
  }
    operator new();
  long long v11 = (void *)[*(id *)(a1 + 264) objectForKey:a2];
  if (v11)
  {
    if ((a4 & 0x8000000000000000) == 0)
    {
LABEL_5:
      [*(id *)(a1 + 184) sampleRate];
      objc_msgSend((id)objc_msgSend(v11, "fileFormat"), "sampleRate");
      goto LABEL_6;
    }
LABEL_4:
    [v11 length];
    goto LABEL_5;
  }
  id result = [[AVAudioFile alloc] initSecondaryReader:a2 format:*(void *)(a1 + 184) error:0];
  if (result)
  {
    long long v11 = result;
    [*(id *)(a1 + 264) setObject:result forKey:a2];

    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (a7) {
    operator new();
  }
  return result;
}

void sub_19D88B3C8(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v1, 0x10A1C402D66DAB1);
  _Unwind_Resume(a1);
}

uint64_t AVAudioPlayerNodeImpl::Command::Command(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t a5, uint64_t a6)
{
  *(void *)a1 = &unk_1EEFA76E8;
  *(void *)(a1 + 8) = a2;
  id v10 = a4;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = a3;
  *(unsigned char *)(a1 + 36) = 0;
  *(void *)(a1 + 40) = a5;
  *(unsigned char *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 80) = 0;
  if (a6) {
    operator new();
  }
  return a1;
}

void sub_19D88B4CC(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v3, 0x80C40B8603338);
  if (*(unsigned char *)(v1 + 80)) {
    std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100]((const void ***)(v1 + 72), 0);
  }
  std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100](v2, 0);
  _Unwind_Resume(a1);
}

void AVAudioPlayerNodeImpl::CommandQueue::AddCommand(atomic_ullong *a1, unint64_t a2)
{
  do
  {
    atomic_ullong v2 = *a1;
    *(void *)(a2 + 24) = *a1;
    atomic_ullong v3 = v2;
    atomic_compare_exchange_strong(a1, (unint64_t *)&v3, a2);
  }
  while (v3 != v2);
  int v4 = a1[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN21AVAudioPlayerNodeImpl12CommandQueue10WakeWorkerEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v4, block);
}

void ___ZN21AVAudioPlayerNodeImpl12CommandQueue10WakeWorkerEv_block_invoke(uint64_t a1)
{
}

void AVAudioPlayerNodeImpl::CommandQueue::PerformWork(atomic_ullong *this, int a2)
{
  while (1)
  {
    atomic_ullong v4 = *this;
    if (!*this) {
      break;
    }
    atomic_ullong v5 = *this;
    atomic_compare_exchange_strong(this, (unint64_t *)&v5, 0);
    if (v5 == v4)
    {
      atomic_ullong v6 = 0;
      do
      {
        atomic_ullong v7 = v6;
        atomic_ullong v6 = v4;
        atomic_ullong v4 = *(void *)(v4 + 24);
        *(void *)(v6 + 24) = v7;
      }
      while (v4);
      do
      {
        double v8 = operator new(0x18uLL);
        v8[1] = this + 2;
        v8[2] = v6;
        atomic_ullong v9 = this[2];
        *double v8 = v9;
        *(void *)(v9 + 8) = v8;
        this[2] = (atomic_ullong)v8;
        uint64_t v10 = this[4] + 1;
        this[4] = v10;
        atomic_ullong v6 = *(void *)(v6 + 24);
      }
      while (v6);
      if (!v10) {
        return;
      }
      while (1)
      {
LABEL_9:
        long long v11 = (uint64_t *)this[3];
        uint64_t v12 = v11[2];
        if (a2)
        {
          if (v12)
          {
            (*(void (**)(uint64_t))(*(void *)v12 + 8))(v11[2]);
            long long v11 = (uint64_t *)this[3];
            uint64_t v10 = this[4];
          }
          uint64_t v13 = *v11;
          *(void *)(v13 + 8) = v11[1];
          *(void *)v11[1] = v13;
          this[4] = v10 - 1;
          operator delete(v11);
        }
        else
        {
          if (!(*(unsigned int (**)(uint64_t))(*(void *)v12 + 16))(v11[2])) {
            return;
          }
          char v14 = (*(uint64_t (**)(uint64_t, atomic_ullong *))(*(void *)v12 + 24))(v12, this);
          uint64_t v16 = v15;
          if (v14)
          {
            __int16 v17 = (uint64_t *)this[3];
            atomic_ullong v18 = this[4];
            uint64_t v19 = *v17;
            *(void *)(v19 + 8) = v17[1];
            *(void *)v17[1] = v19;
            this[4] = v18 - 1;
            operator delete(v17);
          }
          if (v16)
          {
            __int16 v20 = operator new(0x18uLL);
            uint64_t v21 = (void *)this[3];
            atomic_ullong v22 = this[4];
            void *v20 = this + 2;
            v20[1] = v21;
            v20[2] = v16;
            *uint64_t v21 = v20;
            uint64_t v10 = v22 + 1;
            this[3] = (atomic_ullong)v20;
            this[4] = v22 + 1;
            if (v22 == -1) {
              return;
            }
            continue;
          }
        }
        uint64_t v10 = this[4];
        if (!v10) {
          return;
        }
      }
    }
  }
  uint64_t v10 = this[4];
  if (v10) {
    goto LABEL_9;
  }
}

void AVAudioPlayerNodeImpl::Command::~Command(AVAudioPlayerNodeImpl::Command *this)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  *(void *)this = &unk_1EEFA76E8;
  uint64_t v2 = *((void *)this + 1);
  int v3 = *((_DWORD *)this + 8);
  int v4 = *((unsigned __int8 *)this + 36);
  uint64_t v5 = *((void *)this + 5);
  atomic_ullong v6 = (const void ***)((char *)this + 48);
  atomic_ullong v7 = (const void **)*((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v3 || *(unsigned char *)(v2 + 49))
  {
    if (!v7) {
      goto LABEL_17;
    }
  }
  else
  {
    long long v11 = *(NSObject **)(v2 + 224);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___ZN21AVAudioPlayerNodeImpl12CommandQueue10WakeWorkerEv_block_invoke;
    *(void *)&buf[24] = &__block_descriptor_40_e5_v8__0l;
    *(void *)&buf[32] = v2 + 216;
    dispatch_async(v11, buf);
    if (!v7) {
      goto LABEL_17;
    }
  }
  double v8 = *v7;
  if (!*v7)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    atomic_ullong v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "AVAudioPlayerNode.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 895;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = "HandleCompletionOfCommand";
      __int16 v25 = 2080;
      __int16 v26 = "completionHandler != nil";
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "completionHandler != nil");
    goto LABEL_16;
  }
  if (v3 == 3 || !v5)
  {
    CallCompletionHandler(*(dispatch_queue_t *)(v2 + 272), v5, (uint64_t)v8);
    goto LABEL_16;
  }
  if (v5 == 1)
  {
    if (v3 == 1)
    {
      CallCompletionHandler(*(dispatch_queue_t *)(v2 + 272), 0, (uint64_t)v8);
      goto LABEL_35;
    }
LABEL_32:
    if (v3 && v3 != 2) {
      goto LABEL_16;
    }
    uint64_t v16 = (uint64_t *)v7;
    atomic_ullong v7 = 0;
    goto LABEL_45;
  }
  BOOL v13 = v5 == 2 && *(unsigned char *)(v2 + 72) == 0;
  if (v3 != 1)
  {
    if (!v13) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
  CallCompletionHandler(*(dispatch_queue_t *)(v2 + 272), 0, (uint64_t)v8);
  if (!v13) {
    goto LABEL_16;
  }
LABEL_35:
  if (!*((unsigned char *)this + 80))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    char v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "AVAudioPlayerNode.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 927;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = "HandleCompletionOfCommand";
      __int16 v25 = 2080;
      __int16 v26 = "bufferFromFileInfo.has_value()";
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "bufferFromFileInfo.has_value()");
  }
  if (*((unsigned char *)this + 56))
  {
    uint64_t v15 = (uint64_t *)*((void *)this + 9);
    *((void *)this + 9) = 0;
    if (v15)
    {
      uint64_t v16 = v15;
LABEL_45:
      if (!*v16)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        __int16 v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = "AVAEInternal.h";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = 71;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "AVAudioPlayerNode.mm";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 1004;
          *(_WORD *)&buf[34] = 2080;
          *(void *)&buf[36] = "SignalEndOfRender";
          __int16 v25 = 2080;
          __int16 v26 = "completionHandlerWrapperPtr && completionHandlerWrapperPtr->Block()";
          _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "completionHandlerWrapperPtr && completionHandlerWrapperPtr->Block()", v16);
      }
      if (v5 != 1 && v4)
      {
        double v18 = (*(double (**)(uint64_t))(*(void *)v2 + 400))(v2);
        [*(id *)(v2 + 184) sampleRate];
        double v19 = 0.0;
        if (v20 > 0.0)
        {
          uint64_t v21 = [(id)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 352))(v2) currentIONumberFrames];
          [*(id *)(v2 + 184) sampleRate];
          double v19 = (double)v21 / v22;
        }
        if (v18 + v19 > 0.0) {
          operator new();
        }
      }
      CallCompletionHandler(*(dispatch_queue_t *)(v2 + 272), v5, *v16);
      uint64_t v23 = AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>::~AVAEBlock((const void **)v16);
      MEMORY[0x19F3ABB30](v23, 0x80C40B8603338);
      goto LABEL_58;
    }
LABEL_16:
    uint64_t v10 = AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>::~AVAEBlock(v7);
    MEMORY[0x19F3ABB30](v10, 0x80C40B8603338);
    goto LABEL_17;
  }
LABEL_58:
  if (v7) {
    goto LABEL_16;
  }
LABEL_17:

  if (*((unsigned char *)this + 80)) {
    std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100]((const void ***)this + 9, 0);
  }
  std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100](v6, 0);
}

void sub_19D88BF10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void **a10, const void **a11, const void **a12, uint64_t a13)
{
  if (a2)
  {
    std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](&a13);
    std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100](v14, 0);
    std::unique_ptr<AVAEDispatchQueueTimer>::reset[abi:ne180100](v13, 0);
    std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100](&a12, 0);
    MEMORY[0x19F3ABB30](v13, 0xA0C40A8488062);
    std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100](&a10, 0);
    std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100](&a11, 0);
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

const void **AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>::~AVAEBlock(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    _Block_release(v2);
    *a1 = 0;
  }
  return a1;
}

const void **std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100](const void ***a1, const void **a2)
{
  id result = *a1;
  *a1 = a2;
  if (result)
  {
    AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>::~AVAEBlock(result);
    JUMPOUT(0x19F3ABB30);
  }
  return result;
}

void CallCompletionHandler(dispatch_queue_t queue, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (queue)
    {
LABEL_3:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___ZL21CallCompletionHandlerPU28objcproto17OS_dispatch_queue8NSObject39AVAudioPlayerNodeCompletionCallbackTypeU13block_pointerFvS2_E_block_invoke;
      block[3] = &unk_1E5965A60;
      block[4] = a3;
      void block[5] = a2;
      dispatch_sync(queue, block);
      return;
    }
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    atomic_ullong v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      atomic_ullong v9 = "AVAEInternal.h";
      __int16 v10 = 1024;
      int v11 = 71;
      __int16 v12 = 2080;
      BOOL v13 = "AVAudioPlayerNode.mm";
      __int16 v14 = 1024;
      int v15 = 66;
      __int16 v16 = 2080;
      __int16 v17 = "CallCompletionHandler";
      __int16 v18 = 2080;
      double v19 = "completionHandler";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "completionHandler");
    if (queue) {
      goto LABEL_3;
    }
  }
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a2);
}

void std::__function::__func<CompletionHandlerTimer::CompletionHandlerTimer(double,NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>)::{lambda(BOOL)#1},std::allocator<CompletionHandlerTimer::CompletionHandlerTimer(double,NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>)::{lambda(BOOL)#1}>,void ()(BOOL)>::operator()(uint64_t a1, unsigned char *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (*a2) {
    int v3 = 0;
  }
  else {
    int v3 = *(NSObject **)(v2 + 8);
  }
  CallCompletionHandler(v3, 2, **(void **)(v2 + 16));
}

uint64_t std::__function::__func<CompletionHandlerTimer::CompletionHandlerTimer(double,NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>)::{lambda(BOOL)#1},std::allocator<CompletionHandlerTimer::CompletionHandlerTimer(double,NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>)::{lambda(BOOL)#1}>,void ()(BOOL)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EEFA7790;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<CompletionHandlerTimer::CompletionHandlerTimer(double,NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>)::{lambda(BOOL)#1},std::allocator<CompletionHandlerTimer::CompletionHandlerTimer(double,NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>)::{lambda(BOOL)#1}>,void ()(BOOL)>::__clone(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_1EEFA7790;
  result[1] = v3;
  return result;
}

void std::__function::__func<CompletionHandlerTimer::CompletionHandlerTimer(double,NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>)::{lambda(BOOL)#1},std::allocator<CompletionHandlerTimer::CompletionHandlerTimer(double,NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>)::{lambda(BOOL)#1}>,void ()(BOOL)>::~__func()
{
}

uint64_t ___ZL21CallCompletionHandlerPU28objcproto17OS_dispatch_queue8NSObject39AVAudioPlayerNodeCompletionCallbackTypeU13block_pointerFvS2_E_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t AVAudioPlayerNodeImpl::FileCommand::Perform(id *this, id *a2)
{
  if (!*((unsigned char *)this + 128))
  {
    [this[11] setFramePosition:this[13]];
    *((unsigned char *)this + 128) = 1;
  }
  int v4 = (id *)this[1];
  [v4[23] sampleRate];
  unsigned int v6 = (v5 * 1.5);
  [v4[23] sampleRate];
  LODWORD(v8) = (((v7 * 1.5) >> 2) + 1023) & 0x7FFFFC00;
  double v9 = (double)((unsigned char *)this[14] - (unsigned char *)this[15]) * *((double *)this + 12) + 0.5;
  if (*((_DWORD *)v4 + 49) <= v6 - v8) {
    uint64_t v8 = v8;
  }
  else {
    uint64_t v8 = 0;
  }
  if ((uint64_t)v9 >= v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = (uint64_t)v9;
  }
  uint64_t v11 = *((void *)this[1] + 23);
  __int16 v12 = (AVAudioPCMBuffer *)[a2[5] anyObject];
  if (!v12)
  {
LABEL_14:
    BOOL v13 = [[AVAudioPCMBuffer alloc] initWithPCMFormat:v11 frameCapacity:v10];
    if (!v13) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  BOOL v13 = v12;
  if ([(AVAudioPCMBuffer *)v12 frameCapacity] < v10
    || ![(AVAudioFormat *)[(AVAudioBuffer *)v13 format] isEqual:v11])
  {
    [a2[5] removeObject:v13];
    goto LABEL_14;
  }
  __int16 v14 = v13;
  [a2[5] removeObject:v13];
LABEL_15:
  uint64_t v18 = 0;
  if ([this[11] readIntoBuffer:v13 frameCount:v10 error:&v18])
  {
    if (!*((unsigned char *)this + 36)) {
      *((unsigned char *)this + 36) = 1;
    }
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    char v17 = 0;
    operator new();
  }
LABEL_19:
  (*((void (**)(id *))*this + 1))(this);
  return 1;
}

void sub_19D88C658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100](v12, 0);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN21AVAudioPlayerNodeImpl11FileCommand7PerformERNS_12CommandQueueE_block_invoke(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v2 = a1[6];
    uint64_t v3 = a1[4];
    int v4 = *(NSObject **)(v2 + 8);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = ___ZN21AVAudioPlayerNodeImpl12CommandQueue14BufferCompleteEP16AVAudioPCMBuffer_block_invoke;
    v5[3] = &unk_1E5965AB0;
    v5[4] = v3;
    v5[5] = v2;
    dispatch_async(v4, v5);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
}

uint64_t AVAudioPlayerNodeImpl::BufferCommand::BufferCommand(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v11 = AVAudioPlayerNodeImpl::Command::Command(a1, a2, a3, a4, a6, a7);
  *(unsigned char *)(v11 + 104) = 0;
  *(void *)uint64_t v11 = &unk_1EEFA7690;
  *(void *)(v11 + 88) = &unk_1EEFA76C0;
  *(void *)(v11 + 96) = 0;
  *(void *)(a1 + 112) = a8;
  *(void *)(a1 + 120) = a5;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  CADeprecated::TSingleton<CADeprecated::RealtimeDeallocator>::instance();
  return a1;
}

void sub_19D88C7E8(_Unwind_Exception *a1)
{
  AVAudioPlayerNodeImpl::Command::~Command(v1);
  _Unwind_Resume(a1);
}

uint64_t CADeprecated::TSingleton<CADeprecated::RealtimeDeallocator>::instance()
{
  if (atomic_load_explicit((atomic_ullong *volatile)&CADeprecated::TSingleton<CADeprecated::RealtimeDeallocator>::sOnce, memory_order_acquire) != -1)
  {
    uint64_t v3 = &v1;
    uint64_t v2 = &v3;
    std::__call_once(&CADeprecated::TSingleton<CADeprecated::RealtimeDeallocator>::sOnce, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CADeprecated::TSingleton<CADeprecated::RealtimeDeallocator>::instance(void)::{lambda(void)#1} &&>>);
  }
  return CADeprecated::TSingleton<CADeprecated::RealtimeDeallocator>::sInstance;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<CADeprecated::TSingleton<CADeprecated::RealtimeDeallocator>::instance(void)::{lambda(void)#1} &&>>()
{
}

void sub_19D88C8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
  MEMORY[0x19F3ABB30](v10, 0x10A0C404FA34CF3);
  _Unwind_Resume(a1);
}

uint64_t CADeprecated::RealtimeDeallocator::Object::RealtimeMessenger_Perform(uint64_t this)
{
  if (this) {
    return (*(uint64_t (**)(void))(*(void *)this + 8))();
  }
  return this;
}

void non-virtual thunk to'AVAudioPlayerNodeImpl::BufferCommand::~BufferCommand(AVAudioPlayerNodeImpl::BufferCommand *this)
{
  AVAudioPlayerNodeImpl::BufferCommand::~BufferCommand((AVAudioPlayerNodeImpl::BufferCommand *)((char *)this - 88));

  JUMPOUT(0x19F3ABB30);
}

{
  AVAudioPlayerNodeImpl::BufferCommand::~BufferCommand((AVAudioPlayerNodeImpl::BufferCommand *)((char *)this - 88));
}

void AVAudioPlayerNodeImpl::BufferCommand::~BufferCommand(AVAudioPlayerNodeImpl::BufferCommand *this)
{
  *(void *)this = &unk_1EEFA7690;
  *((void *)this + 11) = &unk_1EEFA76C0;

  AVAudioPlayerNodeImpl::Command::~Command(this);
}

{
  uint64_t vars8;

  AVAudioPlayerNodeImpl::BufferCommand::~BufferCommand(this);

  JUMPOUT(0x19F3ABB30);
}

uint64_t AVAudioPlayerNodeImpl::BufferCommand::Perform(AVAudioPlayerNodeImpl::BufferCommand *this, AVAudioPlayerNodeImpl::CommandQueue *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *((void *)this + 1);
  unsigned int v4 = [*((id *)this + 14) frameLength];
  *((_DWORD *)this + 46) = 0;
  *((void *)this + 24) = AVAudioPlayerNodeImpl::BufferCommand::SliceComplete;
  *((void *)this + 25) = this;
  *((void *)this + 26) = 0;
  double v5 = (_DWORD *)((char *)this + 208);
  *((void *)this + 27) = 0;
  *((_DWORD *)this + 56) = [*((id *)this + 14) frameLength];
  *((void *)this + 29) = [*((id *)this + 14) mutableAudioBufferList];
  if (*(unsigned char *)(v3 + 72))
  {
    unsigned int v6 = (void *)*((void *)this + 2);
    if (!v6) {
      goto LABEL_23;
    }
    if ([v6 isSampleTimeValid])
    {
      *((_DWORD *)this + 46) = 1;
      uint64_t v7 = [*((id *)this + 2) sampleTime];
      goto LABEL_22;
    }
    if (*(unsigned char *)(v3 + 72)) {
      goto LABEL_23;
    }
  }
  uint64_t v8 = (AVAudioTime *)*((void *)this + 2);
  if (!v8) {
    goto LABEL_23;
  }
  if (([*((id *)this + 2) isSampleTimeValid] & 1) == 0)
  {
    if (![(AVAudioTime *)v8 isHostTimeValid])
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      double v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        int v15 = "AVAEInternal.h";
        __int16 v16 = 1024;
        int v17 = 71;
        __int16 v18 = 2080;
        double v19 = "AVAudioPlayerNode.mm";
        __int16 v20 = 1024;
        int v21 = 989;
        __int16 v22 = 2080;
        uint64_t v23 = "ResolveToPlayerSampleTime";
        __int16 v24 = 2080;
        __int16 v25 = "when.hostTimeValid";
        _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "when.hostTimeValid");
    }
    uint64_t v10 = AVAudioPlayerNodeImpl::PlayerTimeForNodeTime((AVAudioPlayerNodeImpl *)v3, v8);
    uint64_t v8 = v10;
    if (!v10 || ![(AVAudioTime *)v10 isSampleTimeValid])
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      uint64_t v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        int v15 = "AVAEInternal.h";
        __int16 v16 = 1024;
        int v17 = 71;
        __int16 v18 = 2080;
        double v19 = "AVAudioPlayerNode.mm";
        __int16 v20 = 1024;
        int v21 = 992;
        __int16 v22 = 2080;
        uint64_t v23 = "ResolveToPlayerSampleTime";
        __int16 v24 = 2080;
        __int16 v25 = "playerTime && playerTime.sampleTimeValid";
        _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "playerTime && playerTime.sampleTimeValid");
    }
  }
  uint64_t v7 = [(AVAudioTime *)v8 sampleTime];
  *((_DWORD *)this + 46) = 1;
LABEL_22:
  *((double *)this + 16) = (double)v7;
LABEL_23:
  uint64_t v12 = *((void *)this + 15);
  if (v12)
  {
    *v5 |= 8u;
    if ((v12 & 2) == 0)
    {
LABEL_25:
      if ((v12 & 4) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v12 & 2) == 0)
  {
    goto LABEL_25;
  }
  *v5 |= 0x10u;
  if ((v12 & 4) != 0) {
LABEL_26:
  }
    *v5 |= 0x20u;
LABEL_27:
  if ((*(uint64_t (**)(uint64_t, uint64_t, void, void, char *, uint64_t))(*(void *)v3 + 144))(v3, 3300, 0, 0, (char *)this + 128, 112))atomic_fetch_add_explicit((atomic_uint *volatile)(v3 + 196), v4, memory_order_relaxed); {
  else
  }
    (*(void (**)(AVAudioPlayerNodeImpl::BufferCommand *))(*(void *)this + 8))(this);
  return 1;
}

void sub_19D88CDC4(_Unwind_Exception *exception_object)
{
}

void AVAudioPlayerNodeImpl::BufferCommand::SliceComplete(AVAudioPlayerNodeImpl::BufferCommand *this, void *a2, ScheduledAudioSlice *a3)
{
  atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)this + 1) + 196), -*((_DWORD *)this + 56), memory_order_relaxed);
  *((unsigned char *)this + 36) = (*((_DWORD *)this + 52) & 6) != 0;
  uint64_t v4 = *((void *)this + 1);
  if (*(unsigned char *)(v4 + 49))
  {
    double v5 = *(NSObject **)(v4 + 224);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN21AVAudioPlayerNodeImpl12CommandQueue14WakeWorkerSyncEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v4 + 216;
    dispatch_sync(v5, block);
  }
  uint64_t v6 = CADeprecated::TSingleton<CADeprecated::RealtimeDeallocator>::instance();
  CADeprecated::RealtimeMessenger::PerformAsync(v6, (unsigned char *)this + 88);
}

void ___ZN21AVAudioPlayerNodeImpl12CommandQueue14WakeWorkerSyncEv_block_invoke(uint64_t a1)
{
}

BOOL AVAudioPlayerNodeImpl::BufferCommand::ShouldPerform(AVAudioPlayerNodeImpl::BufferCommand *this)
{
  uint64_t v2 = (void *)*((void *)this + 2);
  return !v2 || ([v2 isSampleTimeValid] & 1) != 0 || *(_DWORD *)(*((void *)this + 1) + 192) == 1;
}

void ___ZN21AVAudioPlayerNodeImpl12CommandQueue14BufferCompleteEP16AVAudioPCMBuffer_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(v1 + 40), "addObject:");
  }

  AVAudioPlayerNodeImpl::CommandQueue::PerformWork((atomic_ullong *)v1, 0);
}

BOOL AVAudioPlayerNodeImpl::FileCommand::ShouldPerform(AVAudioPlayerNodeImpl::FileCommand *this)
{
  uint64_t v1 = *((void *)this + 1);
  [*(id *)(v1 + 184) sampleRate];
  unsigned int v3 = (v2 * 1.5);
  [*(id *)(v1 + 184) sampleRate];
  unsigned int v5 = (((v4 * 1.5) >> 2) + 1023) & 0x7FFFFC00;
  return *(_DWORD *)(v1 + 196) <= v3 - v5 && v5 != 0;
}

void AVAudioPlayerNodeImpl::FileCommand::~FileCommand(id *this)
{
  AVAudioPlayerNodeImpl::FileCommand::~FileCommand(this);

  JUMPOUT(0x19F3ABB30);
}

{
  uint64_t vars8;

  *this = &unk_1EEFA7660;

  AVAudioPlayerNodeImpl::Command::~Command((AVAudioPlayerNodeImpl::Command *)this);
}

uint64_t AVAudioPlayerNodeImpl::NilCommand::Perform(AVAudioPlayerNodeImpl::NilCommand *this, AVAudioPlayerNodeImpl::CommandQueue *a2)
{
  if (this) {
    (*(void (**)(AVAudioPlayerNodeImpl::NilCommand *, AVAudioPlayerNodeImpl::CommandQueue *))(*(void *)this + 8))(this, a2);
  }
  return 1;
}

uint64_t AVAudioPlayerNodeImpl::NilCommand::ShouldPerform(AVAudioPlayerNodeImpl::NilCommand *this)
{
  return 1;
}

void AVAudioPlayerNodeImpl::NilCommand::~NilCommand(AVAudioPlayerNodeImpl::NilCommand *this)
{
  AVAudioPlayerNodeImpl::Command::~Command(this);

  JUMPOUT(0x19F3ABB30);
}

void sub_19D88D498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D88D848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  MEMORY[0x19F3ABB30](v3, 0x10A1C404C1B6C09);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D88DAA8(_Unwind_Exception *a1)
{
  AVAudioBufferCache::~AVAudioBufferCache(v3);
  std::__list_imp<AUGraphConnection>::clear(v2);
  AVAudioUnitImpl::~AVAudioUnitImpl(v1);
  MEMORY[0x19F3ABB30](v1, 0x10B1C40FB79B7E4);
  _Unwind_Resume(a1);
}

void AVAudioPlayerNodeImpl::CommandQueue::~CommandQueue(AVAudioPlayerNodeImpl::CommandQueue *this)
{
  double v2 = *((void *)this + 1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN21AVAudioPlayerNodeImpl12CommandQueue5ResetEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);
  dispatch_release(*((dispatch_object_t *)this + 1));

  std::__list_imp<AUGraphConnection>::clear((void *)this + 2);
}

void ___ZN21AVAudioPlayerNodeImpl12CommandQueue5ResetEv_block_invoke(uint64_t a1)
{
}

void AVAudioBufferCache::~AVAudioBufferCache(id *this)
{
}

uint64_t AVAudioPlayerNodeImpl::StopImpl(AVAudioPlayerNodeImpl *this)
{
  double v2 = (char *)this + 216;
  uint64_t v3 = *((void *)this + 28);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN21AVAudioPlayerNodeImpl12CommandQueue5ResetEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v2;
  dispatch_sync(v3, block);
  (*(void (**)(AVAudioPlayerNodeImpl *))(*(void *)this + 88))(this);
  (*(void (**)(AVAudioPlayerNodeImpl *))(*(void *)this + 400))(this);
  double v4 = (CADeprecated::RealtimeMessenger *)CADeprecated::TSingleton<CADeprecated::RealtimeDeallocator>::instance();
  CADeprecated::RealtimeMessenger::_PerformPendingMessages(v4);
  unsigned int v5 = (uint64_t *)*((void *)this + 35);
  uint64_t v6 = (uint64_t *)*((void *)this + 36);
  if (v5 != v6)
  {
    do
    {
      uint64_t v7 = *v5;
      if (*v5)
      {
        AVAEDispatchQueueTimer::CancelTimer(*(AVAEDispatchQueueTimer **)v7);
        std::unique_ptr<AVAEBlock<void({block_pointer})(AVAudioPlayerNodeCompletionCallbackType)>>::reset[abi:ne180100]((const void ***)(v7 + 16), 0);
        std::unique_ptr<AVAEDispatchQueueTimer>::reset[abi:ne180100]((AVAEDispatchQueueTimer **)v7, 0);
        MEMORY[0x19F3ABB30](v7, 0xA0C40A8488062);
      }
      ++v5;
    }
    while (v5 != v6);
    unsigned int v5 = (uint64_t *)*((void *)this + 35);
  }
  *((void *)this + 36) = v5;
  dispatch_sync(*((dispatch_queue_t *)this + 34), &__block_literal_global_209);
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  return [*((id *)this + 33) removeAllObjects];
}

uint64_t AVAudioPlayerNodeImpl::PauseImpl(uint64_t this)
{
  if ((*(_DWORD *)(this + 192) | 2) != 2)
  {
    uint64_t v1 = (_DWORD *)this;
    *(double *)(this + 208) = (double)objc_msgSend((id)objc_msgSend((id)(*(uint64_t (**)(uint64_t))(*(void *)this + 352))(this), "currentTime"), "sampleTime");
    v1[48] = 2;
    v2[14] = 0;
    return (*(uint64_t (**)(_DWORD *, uint64_t, void, void, _DWORD *, uint64_t))(*(void *)v1 + 144))(v1, 3301, 0, 0, v2, 64);
  }
  return this;
}

void AVAudioPlayerNodeImpl::StartImpl(AVAudioPlayerNodeImpl *this, AVAudioTime *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a2
    && ![(AVAudioTime *)a2 isSampleTimeValid]
    && ![(AVAudioTime *)a2 isHostTimeValid])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    double v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "AVAudioPlayerNode.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 580;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = "StartImpl";
      *(_WORD *)&unsigned char buf[44] = 2080;
      *(void *)&buf[46] = "when == nil || when.sampleTimeValid || when.hostTimeValid";
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "when == nil || when.sampleTimeValid || when.hostTimeValid");
  }
  (*(void (**)(AVAudioPlayerNodeImpl *))(*(void *)this + 32))(this);
  uint64_t v5 = *((void *)this + 1);
  uint64_t v6 = *(void *)(v5 + 8);
  if (!v6) {
    goto LABEL_24;
  }
  int v7 = *(unsigned __int8 *)(v6 + 208);
  uint64_t v8 = (unsigned char *)(v6 + 184);
  if (v7) {
    uint64_t v8 = (unsigned char *)(v5 + 64);
  }
  if (!*v8)
  {
LABEL_24:
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)(v5 + 96));
    if (v14)
    {
      if (AVAudioPlayerNodeLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioPlayerNodeLogCategory(void)::once, &__block_literal_global_199);
      }
      __int16 v20 = *(NSObject **)AVAudioPlayerNodeLogCategory(void)::category;
      if (!os_log_type_enabled(*(os_log_t *)AVAudioPlayerNodeLogCategory(void)::category, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVAudioPlayerNode.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 588;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = this;
      __int16 v16 = "%25s:%-5d Player@%p: Engine is in the middle of a config change, cannot play yet!";
      goto LABEL_34;
    }
    if (AVAudioPlayerNodeLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioPlayerNodeLogCategory(void)::once, &__block_literal_global_199);
    }
    int v15 = *(NSObject **)AVAudioPlayerNodeLogCategory(void)::category;
    if (!os_log_type_enabled(*(os_log_t *)AVAudioPlayerNodeLogCategory(void)::category, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioPlayerNode.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 594;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = this;
    __int16 v16 = "%25s:%-5d Player@%p: Engine is not running because it was not explicitly started or may have stopped because o"
          "f an interruption. Cannot play yet!";
LABEL_29:
    int v17 = buf;
    __int16 v18 = v15;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_35:
    uint32_t v21 = 28;
LABEL_36:
    _os_log_impl(&dword_19D794000, v18, v19, v16, v17, v21);
    return;
  }
  if (!*((unsigned char *)this + 48)) {
    [MEMORY[0x1E4F1CA00] raise:@"com.apple.coreaudio.avfaudio" format:@"player started when in a disconnected state"];
  }
  if (*((_DWORD *)this + 48) == 1) {
    return;
  }
  double v9 = *(AVAudioNodeImplBase ***)(*((void *)this + 1) + 8);
  uint64_t v10 = (std::recursive_mutex *)((char *)*v9 + 112);
  std::recursive_mutex::lock(v10);
  if (*((unsigned char *)v9 + 184)) {
    goto LABEL_17;
  }
  if (*((unsigned char *)v9 + 187) || !*((unsigned char *)v9 + 208))
  {
    std::recursive_mutex::unlock(v10);
LABEL_40:
    if (AVAudioPlayerNodeLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioPlayerNodeLogCategory(void)::once, &__block_literal_global_199);
    }
    int v15 = *(NSObject **)AVAudioPlayerNodeLogCategory(void)::category;
    if (!os_log_type_enabled(*(os_log_t *)AVAudioPlayerNodeLogCategory(void)::category, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioPlayerNode.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 608;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = this;
    __int16 v16 = "%25s:%-5d Player@%p: Engine could not start the audio hardware dynamically, cannot play!";
    goto LABEL_29;
  }
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  __int16 v35 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioEngineGraph.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1512;
    _os_log_impl(&dword_19D794000, v35, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioEngine (auto shutdown mode): starting IO dynamically", buf, 0x12u);
  }
  int v48 = 0;
  AVAudioEngineGraph::Start(v9, &v48);
  if (!v48)
  {
LABEL_17:
    std::recursive_mutex::unlock(v10);
    goto LABEL_18;
  }
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  int v36 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  BOOL v37 = os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR);
  std::string v38 = v48;
  if (v37)
  {
    CAX4CCString::CAX4CCString((CAX4CCString *)block, [(NSError *)v48 code]);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioEngineGraph.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1517;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = block;
    _os_log_impl(&dword_19D794000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d AVAudioEngine (auto shutdown mode): could not dynamically start the audio hardware, err = %s", buf, 0x1Cu);
    std::string v38 = v48;
  }
  std::recursive_mutex::unlock(v10);
  if (v38) {
    goto LABEL_40;
  }
LABEL_18:
  (*(void (**)(AVAudioPlayerNodeImpl *))(*(void *)this + 352))(this);
  if (!a2)
  {
    uint64_t v11 = *(void *)(*((void *)this + 1) + 8);
    if (!*(unsigned char *)(v11 + 187)) {
      goto LABEL_52;
    }
LABEL_45:
    uint64_t v22 = *(void *)(v11 + 200);
    [*((id *)this + 23) sampleRate];
    double v24 = v23;
    [(AVAudioFormat *)AVAudioEngineImpl::GetManualRenderingFormat(*((AVAudioEngineImpl **)this + 1)) sampleRate];
    double v13 = ceil(v24 * (double)v22 / v25);
    goto LABEL_46;
  }
  if (![(AVAudioTime *)a2 isSampleTimeValid])
  {
    uint64_t v11 = *(void *)(*((void *)this + 1) + 8);
    if (*(unsigned char *)(v11 + 187)) {
      goto LABEL_45;
    }
  }
  if ([(AVAudioTime *)a2 isSampleTimeValid])
  {
    uint64_t v12 = [(AVAudioTime *)a2 sampleTime];
LABEL_23:
    double v13 = (double)v12;
LABEL_46:
    double v26 = *((double *)this + 25) + v13 - *((double *)this + 26);
    *((double *)this + 25) = v26;
    goto LABEL_47;
  }
  if (*(unsigned char *)(*(void *)(*((void *)this + 1) + 8) + 187))
  {
    double v26 = *((double *)this + 25);
LABEL_47:
    *(_DWORD *)&buf[56] = 1;
    *(double *)buf = v26;
    (*(void (**)(AVAudioPlayerNodeImpl *, uint64_t, void, void, uint8_t *, uint64_t))(*(void *)this
                                                                                                 + 144))(this, 3301, 0, 0, buf, 64);
    *((_DWORD *)this + 48) = 1;
    uint64_t v27 = *((void *)this + 28);
    if (*((unsigned char *)this + 49))
    {
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = ___ZN21AVAudioPlayerNodeImpl12CommandQueue14WakeWorkerSyncEv_block_invoke;
      *(void *)&block[24] = &__block_descriptor_40_e5_v8__0l;
      *(void *)&block[32] = (char *)this + 216;
      dispatch_sync(v27, block);
    }
    else
    {
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = ___ZN21AVAudioPlayerNodeImpl12CommandQueue10WakeWorkerEv_block_invoke;
      *(void *)&block[24] = &__block_descriptor_40_e5_v8__0l;
      *(void *)&block[32] = (char *)this + 216;
      dispatch_async(v27, block);
    }
    return;
  }
LABEL_52:
  if (!*((unsigned char *)this + 72))
  {
    *(_DWORD *)buf = 0;
    __int16 v39 = (void *)[(id)(*(uint64_t (**)(AVAudioPlayerNodeImpl *))(*(void *)this + 352))(this) awaitIOCycle:buf];
    __int16 v40 = v39;
    if (v39)
    {
      int v41 = *(_DWORD *)buf;
      unint64_t v42 = [v39 hostTime];
      [v40 sampleRate];
      double v44 = v43;
      uint64_t v45 = [v40 sampleTime];
      [v40 sampleRate];
      uint64_t v46 = +[AVAudioTime timeWithHostTime:sampleTime:atRate:](AVAudioTime, "timeWithHostTime:sampleTime:atRate:", (unint64_t)((double)v42 + (double)(2 * v41) / v44 * 24000000.0), (uint64_t)((double)(2 * v41) + (double)v45));
      if (v46) {
        goto LABEL_84;
      }
    }
  }
  unsigned __int8 v28 = atomic_load((unsigned __int8 *)(*((void *)this + 1) + 96));
  if (v28)
  {
    if (AVAudioPlayerNodeLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioPlayerNodeLogCategory(void)::once, &__block_literal_global_199);
    }
    __int16 v20 = *(NSObject **)AVAudioPlayerNodeLogCategory(void)::category;
    if (!os_log_type_enabled(*(os_log_t *)AVAudioPlayerNodeLogCategory(void)::category, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioPlayerNode.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 650;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = this;
    __int16 v16 = "%25s:%-5d Player@%p: Engine config changed when waiting for playback to begin, cannot play yet!";
    goto LABEL_34;
  }
  if ((AVAudioEngineImpl::IsIOUnitRunning(*((AVAudioEngineImpl **)this + 1)) & 1) == 0)
  {
    if (AVAudioPlayerNodeLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioPlayerNodeLogCategory(void)::once, &__block_literal_global_199);
    }
    __int16 v20 = *(NSObject **)AVAudioPlayerNodeLogCategory(void)::category;
    if (!os_log_type_enabled(*(os_log_t *)AVAudioPlayerNodeLogCategory(void)::category, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioPlayerNode.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 654;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = this;
    __int16 v16 = "%25s:%-5d Player@%p: IOUnit stopped when waiting for playback to begin, cannot play yet!";
LABEL_34:
    int v17 = buf;
    __int16 v18 = v20;
    os_log_type_t v19 = OS_LOG_TYPE_INFO;
    goto LABEL_35;
  }
  AVAudioEngineImpl::LastRenderErrorInChain((AVAudioEngineImpl *)&v48, *(AVAudioNodeImplBase **)(*((void *)this + 1) + 8), (AVAudioNodeImplBase *)this);
  if (!v50)
  {
    [MEMORY[0x1E4F1CA00] raise:@"com.apple.coreaudio.avfaudio" format:@"player did not see an IO cycle."];
    uint64_t v46 = 0;
LABEL_84:
    if (a2)
    {
      _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioPlayerNode.mm", 682, "StartImpl", "when.hostTimeValid", [(AVAudioTime *)a2 isHostTimeValid]);
      memset(buf, 0, 64);
      [(AVAudioTime *)a2 audioTimeStamp];
      [*((id *)this + 23) sampleRate];
      uint64_t v47 = [+[AVAudioTime timeWithAudioTimeStamp:sampleRate:](AVAudioTime, "timeWithAudioTimeStamp:sampleRate:", buf) extrapolateTimeFromAnchor:v46];
      _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioPlayerNode.mm", 687, "StartImpl", "inTimeFull.sampleTimeValid", [(AVAudioTime *)v47 isSampleTimeValid]);
      uint64_t v12 = [(AVAudioTime *)v47 sampleTime];
    }
    else
    {
      _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioPlayerNode.mm", 673, "StartImpl", "nearFutureTime.sampleTimeValid", [(AVAudioTime *)v46 isSampleTimeValid]);
      uint64_t v12 = [(AVAudioTime *)v46 sampleTime];
    }
    goto LABEL_23;
  }
  uint64_t v29 = (int)v48;
  id v30 = v49;
  uint64_t v31 = [v49 impl];
  __int16 v32 = (const AudioComponentDescription *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 256))(v31);
  AudioComponentDescriptionAsString(v32, (char *)buf, v33);
  if (AVAudioPlayerNodeLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioPlayerNodeLogCategory(void)::once, &__block_literal_global_199);
  }
  uint64_t v34 = *(NSObject **)AVAudioPlayerNodeLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioPlayerNodeLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)block = 136316418;
    *(void *)&block[4] = "AVAudioPlayerNode.mm";
    *(_WORD *)&block[12] = 1024;
    *(_DWORD *)&block[14] = 662;
    *(_WORD *)&block[18] = 2048;
    *(void *)&block[20] = this;
    *(_WORD *)&block[28] = 2048;
    *(void *)&block[30] = v29;
    *(_WORD *)&block[38] = 2048;
    id v52 = v30;
    __int16 v53 = 2080;
    v54 = buf;
    __int16 v16 = "%25s:%-5d Player@%p: Engine returned render error: %ld, node: %p {%s}, cannot play!";
    int v17 = block;
    __int16 v18 = v34;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    uint32_t v21 = 58;
    goto LABEL_36;
  }
}

void sub_19D88E994(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ___ZL28AVAudioPlayerNodeLogCategoryv_block_invoke()
{
}

BOOL AVAudioPlayerNodeImpl::IsPlayingImpl(AVAudioPlayerNodeImpl *this)
{
  return *((_DWORD *)this + 48) == 1;
}

void AVAudioPlayerNodeImpl::WillDisconnectFromMixer(AVAudioNodeImplBase *this, AVAudioNode *a2, unsigned int a3, int a4)
{
  AVAudioNodeImplBase::WillDisconnectFromMixer(this, a2, a3, a4);

  AVAudioNodeImplBase::Stop(this);
}

uint64_t AVAudioPlayerNodeImpl::Reset(AVAudioPlayerNodeImpl *this)
{
  uint64_t v2 = (*(uint64_t (**)(AVAudioPlayerNodeImpl *))(*(void *)this + 40))(this);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 56))(v2);
  if (*((unsigned char *)this + 72))
  {
    *((void *)this + 25) = 0;
    *((void *)this + 26) = 0;
  }
  return result;
}

uint64_t AVAudioPlayerNodeImpl::SetOutputFormat(AVAudioPlayerNodeImpl *this, uint64_t a2, AVAudioFormat *a3)
{
  uint64_t v6 = AVAudioNodeImplBase::SetOutputFormat((AVAudioNodeImplBase *)this, a2, a3);
  uint64_t v7 = v6;
  if (!a2 && v6)
  {

    *((void *)this + 23) = a3;
    uint64_t v8 = a3;
  }
  return v7;
}

uint64_t AVAudioPlayerNodeImpl::GetOutputFormat(AVAudioNodeImplBase *this, uint64_t a2)
{
  if (a2) {
    return AVAudioNodeImplBase::GetOutputFormat(this, a2);
  }
  if (!*((void *)this + 23))
  {
    a2 = 0;
    return AVAudioNodeImplBase::GetOutputFormat(this, a2);
  }
  return *((void *)this + 23);
}

void AVAudioPlayerNodeImpl::~AVAudioPlayerNodeImpl(AVAudioPlayerNodeImpl *this)
{
  AVAudioPlayerNodeImpl::~AVAudioPlayerNodeImpl(this);

  JUMPOUT(0x19F3ABB30);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_1EEFA60A8;
  AVAudioNodeImplBase::Stop((AVAudioNodeImplBase *)this);
  dispatch_sync(*((dispatch_queue_t *)this + 34), &__block_literal_global_8017);
  dispatch_release(*((dispatch_object_t *)this + 34));

  uint64_t v2 = (void *)*((void *)this + 35);
  if (v2)
  {
    *((void *)this + 36) = v2;
    operator delete(v2);
  }
  AVAudioPlayerNodeImpl::CommandQueue::~CommandQueue((AVAudioPlayerNodeImpl *)((char *)this + 216));

  AVAudioUnitImpl::~AVAudioUnitImpl((id *)this);
}

void sub_19D88ECDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D88ED40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D88EDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D88F4DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D88F6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8252(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8253(uint64_t a1)
{
}

void sub_19D88F9C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D88FB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D88FCA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D88FD54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ElapsedTime::~ElapsedTime((ElapsedTime *)va);
  _Unwind_Resume(a1);
}

void sub_19D88FE8C(_Unwind_Exception *a1)
{
  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D890194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D890358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8905AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8906EC(_Unwind_Exception *a1)
{
  double v4 = v2;

  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D890938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D890AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D890CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D890E24(_Unwind_Exception *a1)
{
  double v4 = v2;

  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D891070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D891210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D89141C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D891578(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  TraceMethod::~TraceMethod((TraceMethod *)(v4 - 40));
  _Unwind_Resume(a1);
}

void sub_19D8918D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D891A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D891C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D891DC0(_Unwind_Exception *a1)
{
  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D8920C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D89228C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8924E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D892620(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D89286C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D892A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D892C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D892D84(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  TraceMethod::~TraceMethod((TraceMethod *)(v4 - 40));
  _Unwind_Resume(a1);
}

void sub_19D893090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D893248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D893458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D893644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, ...)
{
  va_start(va, a8);

  _Block_object_dispose(va, 8);
  TraceMethod::~TraceMethod((TraceMethod *)(v9 - 56));
  _Unwind_Resume(a1);
}

void sub_19D8937A4(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D8939F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D893B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D893D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D893F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, ...)
{
  va_start(va, a8);

  _Block_object_dispose(va, 8);
  TraceMethod::~TraceMethod((TraceMethod *)(v9 - 56));
  _Unwind_Resume(a1);
}

void sub_19D8940E8(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D894334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8944D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8946E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8948A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, ...)
{
  va_start(va, a6);

  TraceMethod::~TraceMethod((TraceMethod *)va);
  _Unwind_Resume(a1);
}

void sub_19D8949EC(_Unwind_Exception *a1)
{
  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D894CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D894EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D89510C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8951EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  uint64_t v4 = v3;

  TraceMethod::~TraceMethod((TraceMethod *)va);
  _Unwind_Resume(a1);
}

void sub_19D895410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);

  TraceMethod::~TraceMethod((TraceMethod *)va);
  _Unwind_Resume(a1);
}

void sub_19D895670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D895834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D895A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D895C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, ...)
{
  va_start(va, a6);

  TraceMethod::~TraceMethod((TraceMethod *)va);
  _Unwind_Resume(a1);
}

void sub_19D895D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  uint64_t v9 = v7;

  _Block_object_dispose(va, 8);
  TraceMethod::~TraceMethod((TraceMethod *)(v8 - 24));
  _Unwind_Resume(a1);
}

void sub_19D895EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D89604C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8960C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D896128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D896254(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D8964A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D896640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D896834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::addKeyIfExists(_anonymous_namespace_ *this, NSDictionary *a2, NSString *a3, NSMutableDictionary *a4, NSString *a5)
{
  uint64_t v10 = a3;
  uint64_t v8 = a4;
  uint64_t v9 = [(_anonymous_namespace_ *)this objectForKey:a2];
  if (v9) {
    [(NSString *)v10 setObject:v9 forKeyedSubscript:v8];
  }
}

void sub_19D8968F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D896A34(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  TraceMethod::~TraceMethod((TraceMethod *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_19D896C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D896E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D896FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D897244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_19D8973B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8975F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D8977AC(_Unwind_Exception *a1)
{
  uint64_t v3 = v1;

  _Unwind_Resume(a1);
}

void sub_19D897958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D897C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D897C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D897ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, char a13)
{
  unsigned __int8 v14 = v13;

  TraceMethod::~TraceMethod((TraceMethod *)&a13);
  a10.super_class = (Class)AVVoiceTriggerClient;
  [(_Unwind_Exception *)&a10 dealloc];
  _Unwind_Resume(a1);
}

void sub_19D89826C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  uint64_t v11 = v9;

  TraceMethod::~TraceMethod((TraceMethod *)va);
  _Unwind_Resume(a1);
}

uint64_t CADeprecated::CAGuard::NotifyAll(CADeprecated::CAGuard *this)
{
  uint64_t result = pthread_cond_broadcast((pthread_cond_t *)((char *)this + 88));
  if (result)
  {
    int v3 = result;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D794000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, " CAGuard::NotifyAll: failed", buf, 2u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_1EEFA3DC8;
    exception[2] = v3;
  }
  return result;
}

uint64_t CADeprecated::CAGuard::Notify(CADeprecated::CAGuard *this)
{
  uint64_t result = pthread_cond_signal((pthread_cond_t *)((char *)this + 88));
  if (result)
  {
    int v3 = result;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D794000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, " CAGuard::Notify: failed", buf, 2u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_1EEFA3DC8;
    exception[2] = v3;
  }
  return result;
}

uint64_t CADeprecated::CAGuard::WaitUntil(CADeprecated::CAGuard *this, unint64_t a2)
{
  mach_absolute_time();
  unint64_t v4 = __udivti3();
  if (a2 <= v4) {
    return 1;
  }
  uint64_t v5 = *(uint64_t (**)(CADeprecated::CAGuard *, unint64_t))(*(void *)this + 64);

  return v5(this, a2 - v4);
}

BOOL CADeprecated::CAGuard::WaitFor(CADeprecated::CAGuard *this, unint64_t a2)
{
  unint64_t v4 = pthread_self();
  uint64_t v5 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (!pthread_equal(v4, v5))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13.tv_sec) = 0;
      _os_log_error_impl(&dword_19D794000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, " CAGuard::WaitFor: A thread has to have locked a guard be for it can wait", (uint8_t *)&v13, 2u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_1EEFA3DC8;
    exception[2] = 1;
LABEL_14:
  }
  if (a2 <= 0x3B9AC9FF)
  {
    __darwin_time_t v6 = 0;
  }
  else
  {
    __darwin_time_t v6 = a2 / 0x3B9ACA00;
    a2 %= 0x3B9ACA00uLL;
  }
  v13.tv_sec = v6;
  v13.tv_nsec = a2;
  uint64_t v7 = (unint64_t *)((char *)this + 16);
  atomic_store(0, (unint64_t *)this + 2);
  int v8 = pthread_cond_timedwait_relative_np((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24), &v13);
  int v9 = v8;
  if (v8 && v8 != 60)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl(&dword_19D794000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, " CAGuard::WaitFor: Wait got an error", v12, 2u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_1EEFA3DC8;
    exception[2] = v9;
    goto LABEL_14;
  }
  atomic_store((unint64_t)pthread_self(), v7);
  return v9 == 60;
}

pthread_t CADeprecated::CAGuard::Wait(CADeprecated::CAGuard *this)
{
  uint64_t v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (!pthread_equal(v2, v3))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D794000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, " CAGuard::Wait: A thread has to have locked a guard before it can wait", buf, 2u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_1EEFA3DC8;
    exception[2] = 1;
LABEL_10:
  }
  atomic_store(0, (unint64_t *)this + 2);
  int v4 = pthread_cond_wait((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24));
  if (v4)
  {
    int v7 = v4;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_error_impl(&dword_19D794000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, " CAGuard::Wait: Could not wait for a signal", v8, 2u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_1EEFA3DC8;
    exception[2] = v7;
    goto LABEL_10;
  }
  pthread_t result = pthread_self();
  atomic_store((unint64_t)result, (unint64_t *)this + 2);
  return result;
}

void CADeprecated::CAGuard::~CAGuard(CADeprecated::CAGuard *this)
{
  CADeprecated::CAGuard::~CAGuard(this);

  JUMPOUT(0x19F3ABB30);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1EEFA7528;
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 88));

  CADeprecated::CAMutex::~CAMutex(this);
}

NSObject *AVAE_GetHighPriorityWorkloop(void)
{
  {
    operator new();
  }
  uint64_t v0 = GetTargetWorkloopWithPriority(int,BOOL)::workloops;
  os_unfair_lock_lock((os_unfair_lock_t)GetTargetWorkloopWithPriority(int,BOOL)::workloops);
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  if (v1 != v2)
  {
    while (*(_DWORD *)v1 != 56 || *(unsigned char *)(v1 + 4))
    {
      v1 += 16;
      if (v1 == v2) {
        goto LABEL_11;
      }
    }
  }
  if (v1 == v2 || (inactive = *(NSObject **)(v1 + 8)) == 0)
  {
LABEL_11:
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v20);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v21, (uint64_t)"com.apple.coreaudio.avfaudio.workloop(", 38);
    int v4 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)")", 1);
    std::stringbuf::str[abi:ne180100]<std::allocator<char>>(__p, (uint64_t)v22);
    if (v19 >= 0) {
      uint64_t v5 = __p;
    }
    else {
      uint64_t v5 = (void **)__p[0];
    }
    inactive = dispatch_workloop_create_inactive((const char *)v5);
    if (v19 < 0) {
      operator delete(__p[0]);
    }
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate(inactive);
    int v7 = *(char **)(v0 + 16);
    unint64_t v6 = *(void *)(v0 + 24);
    if ((unint64_t)v7 >= v6)
    {
      int v9 = *(char **)(v0 + 8);
      uint64_t v10 = (v7 - v9) >> 4;
      unint64_t v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 60) {
        std::vector<EExtAudioGraphNodeState>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v6 - (void)v9;
      if (v12 >> 3 > v11) {
        unint64_t v11 = v12 >> 3;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        if (v13 >> 60) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        unsigned __int8 v14 = (char *)operator new(16 * v13);
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
      int v15 = &v14[16 * v10];
      *(void *)int v15 = 56;
      *((void *)v15 + 1) = inactive;
      int v8 = v15 + 16;
      if (v7 != v9)
      {
        do
        {
          *((_OWORD *)v15 - 1) = *((_OWORD *)v7 - 1);
          v15 -= 16;
          v7 -= 16;
        }
        while (v7 != v9);
        int v7 = *(char **)(v0 + 8);
      }
      *(void *)(v0 + 8) = v15;
      *(void *)(v0 + 16) = v8;
      *(void *)(v0 + 24) = &v14[16 * v13];
      if (v7) {
        operator delete(v7);
      }
    }
    else
    {
      *(void *)int v7 = 56;
      *((void *)v7 + 1) = inactive;
      int v8 = v7 + 16;
    }
    *(void *)(v0 + 16) = v8;
    v20[0] = *MEMORY[0x1E4FBA408];
    uint64_t v16 = *(void *)(MEMORY[0x1E4FBA408] + 72);
    *(void *)((char *)v20 + *(void *)(v20[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
    uint64_t v21 = v16;
    v22[0] = MEMORY[0x1E4FBA470] + 16;
    if (v23 < 0) {
      operator delete((void *)v22[8]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x19F3ABAB0](&v24);
  }
  else if (!v0)
  {
    return inactive;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v0);
  return inactive;
}

void sub_19D898EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
}

char *AudioComponentDescriptionAsString(const AudioComponentDescription *a1, char *a2, int16x8_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    CAStringForOSType(a1->componentType, __dst, a3);
    CAStringForOSType(a1->componentSubType, v9, v5);
    CAStringForOSType(a1->componentManufacturer, v8, v6);
    snprintf(a2, 0x80uLL, "%s %s %s", __dst, v9, v8);
  }
  return a2;
}

void sub_19D899160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D899218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D8992F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D89940C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D899528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::pair<std::unique_lock<std::recursive_mutex>,std::unique_lock<std::recursive_mutex>>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19D8995FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D899694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19D899844(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v1, 0x10B1C4016FEDC95);
  _Unwind_Resume(a1);
}

void sub_19D899B3C(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v1, 0x10B1C4016FEDC95);
  _Unwind_Resume(a1);
}

void sub_19D899BB0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D899E04(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ___Z24AVAudioEngineLogCategoryv_block_invoke()
{
}

void sub_19D89A0E8(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D89A520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::recursive_mutex *a12)
{
}

void sub_19D89A7A0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D89A834(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAudioEngineImpl::ConnectMIDI(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  int v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(char **)a1;
    *(_DWORD *)buf = 136316418;
    id v30 = "AVAudioEngine.mm";
    __int16 v31 = 1024;
    int v32 = 1082;
    __int16 v33 = 2048;
    uint64_t v34 = v10;
    __int16 v35 = 2048;
    *(void *)int v36 = a2;
    *(_WORD *)&v36[8] = 2080;
    *(void *)&v36[10] = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    *(_WORD *)&v36[18] = 2080;
    *(void *)&v36[20] = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: connect MIDI node: %p -> %s, format: %s", buf, 0x3Au);
  }
  if (!a2 || !a3 || ![a3 count])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      id v30 = "AVAEInternal.h";
      __int16 v31 = 1024;
      int v32 = 71;
      __int16 v33 = 2080;
      uint64_t v34 = "AVAudioEngine.mm";
      __int16 v35 = 1024;
      *(_DWORD *)int v36 = 1084;
      *(_WORD *)&void v36[4] = 2080;
      *(void *)&v36[6] = "ConnectMIDI";
      *(_WORD *)&v36[14] = 2080;
      *(void *)&v36[16] = "nil != sourceNode && nil != destNodes && [destNodes count] > 0";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nil != sourceNode && nil != destNodes && [destNodes count] > 0");
  }
  if (([*(id *)(a1 + 24) containsObject:a2] & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      id v30 = "AVAEInternal.h";
      __int16 v31 = 1024;
      int v32 = 71;
      __int16 v33 = 2080;
      uint64_t v34 = "AVAudioEngine.mm";
      __int16 v35 = 1024;
      *(_DWORD *)int v36 = 1085;
      *(_WORD *)&void v36[4] = 2080;
      *(void *)&v36[6] = "ConnectMIDI";
      *(_WORD *)&v36[14] = 2080;
      *(void *)&v36[16] = "[_nodes containsObject: sourceNode]";
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_nodes containsObject: sourceNode]");
  }
  uint64_t v19 = a1;
  __int16 v20 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(a3);
        }
        if (!*(void *)(*((void *)&v24 + 1) + 8 * v16) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          int v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            id v30 = "AVAEInternal.h";
            __int16 v31 = 1024;
            int v32 = 71;
            __int16 v33 = 2080;
            uint64_t v34 = "AVAudioEngine.mm";
            __int16 v35 = 1024;
            *(_DWORD *)int v36 = 1087;
            *(_WORD *)&void v36[4] = 2080;
            *(void *)&v36[6] = "ConnectMIDI";
            *(_WORD *)&v36[14] = 2080;
            *(void *)&v36[16] = "object && [object isKindOfClass: [AVAudioNode class]]";
            _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "object && [object isKindOfClass: [AVAudioNode class]]");
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }
  return AVAudioEngineGraph::ConnectMIDI(*(AVAudioEngineGraph **)(v19 + 8), v20, a3, a4, a5, a6);
}

{
  NSObject *v12;
  char *v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  unsigned char v23[28];
  uint64_t v24;

  long long v24 = *MEMORY[0x1E4F143B8];
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  uint64_t v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(char **)a1;
    *(_DWORD *)buf = 136316418;
    int v17 = "AVAudioEngine.mm";
    __int16 v18 = 1024;
    uint64_t v19 = 1068;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    uint64_t v22 = 2048;
    *(void *)char v23 = a2;
    *(_WORD *)&char v23[8] = 2048;
    *(void *)&v23[10] = a3;
    *(_WORD *)&v23[18] = 2080;
    *(void *)&v23[20] = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: connect MIDI node: %p -> node: %p, format: %s", buf, 0x3Au);
  }
  if (a2 == a3 || !a2 || !a3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      int v17 = "AVAEInternal.h";
      __int16 v18 = 1024;
      uint64_t v19 = 71;
      __int16 v20 = 2080;
      uint64_t v21 = "AVAudioEngine.mm";
      uint64_t v22 = 1024;
      *(_DWORD *)char v23 = 1070;
      *(_WORD *)&void v23[4] = 2080;
      *(void *)&v23[6] = "ConnectMIDI";
      *(_WORD *)&v23[14] = 2080;
      *(void *)&v23[16] = "node1 != nil && node2 != nil && node1 != node2";
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node1 != nil && node2 != nil && node1 != node2");
  }
  return AVAudioEngineGraph::ConnectMIDI(*(AVAudioEngineGraph **)(a1 + 8), a2, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", a3, 0), a4, a5, a6);
}

void sub_19D89ADF0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D89B100(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D89B194(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D89B474(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAudioEngineImpl::GetIOUnit(AVAudioEngineImpl *this, BOOL a2, AVAudioSession *a3, uint64_t a4, AVAudioSession *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*((void *)this + 1) + 187))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136316418;
      *(void *)&buf[1] = "AVAEInternal.h";
      __int16 v10 = 1024;
      int v11 = 71;
      __int16 v12 = 2080;
      uint64_t v13 = "AVAudioEngine.mm";
      __int16 v14 = 1024;
      int v15 = 652;
      __int16 v16 = 2080;
      int v17 = "GetIOUnit";
      __int16 v18 = 2080;
      uint64_t v19 = "!IsInManualRenderingMode()";
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", (uint8_t *)buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "!IsInManualRenderingMode()");
  }
  uint64_t result = *((void *)this + 7);
  if (!result) {
    AVAudioIOUnit::Create((AVAudioIOUnit *)buf, this, 0, a2, a5);
  }
  return result;
}

void sub_19D89B684(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

id AVAudioEngineImpl::GetAudioSession(AVAudioEngineImpl *this)
{
  if (*(unsigned char *)(*((void *)this + 1) + 187)) {
    return 0;
  }
  uint64_t v2 = (void *)*((void *)this + 2);
  if (v2)
  {
    id v3 = v2;
    return v3;
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F4E9F8];
    return (id)[v4 sharedInstance];
  }
}

void sub_19D89B884(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D89B98C(_Unwind_Exception *a1)
{
  MEMORY[0x19F3ABB30](v2, 0x80C40B8603338);
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN17AVAudioEngineImpl23GetManualRenderingBlockEv_block_invoke(uint64_t a1, uint64_t a2, AudioBufferList *a3, int *a4)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (a4) {
    *a4 = 0;
  }
  if (!a3 || !a3->mNumberBuffers)
  {
    int v9 = -50;
    goto LABEL_15;
  }
  int v9 = -80800;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(v10 + 8);
  if (!*(unsigned char *)(v11 + 187)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)(v11 + 208)) {
    __int16 v12 = (unsigned char *)(v10 + 64);
  }
  else {
    __int16 v12 = (unsigned char *)(v11 + 184);
  }
  if (!*v12)
  {
    int v9 = -80802;
    if (!a4) {
      return -1;
    }
    goto LABEL_16;
  }
  uint64_t v13 = *(void *)(v11 + 192);
  if (!v13)
  {
    __int16 v16 = (std::recursive_mutex *)(v8 + 112);
    uint64_t v17 = v8 + 176;
    std::lock[abi:ne180100]<std::recursive_mutex,caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>((std::recursive_mutex *)(v8 + 112), v8 + 176);
    uint64_t v14 = AVAudioEngineGraph::RenderToABL(*(AVAudioNodeImplBase ***)(*(void *)(a1 + 40) + 8), a2, a3, a4);
    caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock(v17);
    std::recursive_mutex::unlock(v16);
    return v14;
  }
  if (v13 != 1)
  {
LABEL_15:
    if (!a4) {
      return -1;
    }
LABEL_16:
    *a4 = v9;
    return -1;
  }
  uint64_t v20 = v10 + 176;
  char v21 = caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::try_lock(v10 + 176);
  if (v21)
  {
    uint64_t v14 = AVAudioEngineGraph::RenderToABL(*(AVAudioNodeImplBase ***)(*(void *)(a1 + 40) + 8), a2, a3, a4);
  }
  else
  {
    uint64_t mNumberBuffers = a3->mNumberBuffers;
    if (mNumberBuffers)
    {
      p_mDataByteSize = &a3->mBuffers[0].mDataByteSize;
      uint64_t v14 = 2;
      do
      {
        UInt32 *p_mDataByteSize = 0;
        p_mDataByteSize += 4;
        --mNumberBuffers;
      }
      while (mNumberBuffers);
    }
    else
    {
      uint64_t v14 = 2;
    }
  }
  std::unique_lock<caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>::~unique_lock[abi:ne180100]((uint64_t)&v20);
  return v14;
}

void sub_19D89BB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const void ***std::unique_ptr<AVAEBlock<AVAudioEngineManualRenderingStatus({block_pointer})(unsigned int,AudioBufferList *,int *)>>::reset[abi:ne180100](const void ***result, const void **a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    if (*v2)
    {
      _Block_release(*v2);
      void *v2 = 0;
    }
    JUMPOUT(0x19F3ABB30);
  }
  return result;
}

uint64_t std::lock[abi:ne180100]<std::recursive_mutex,caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>(std::recursive_mutex *this, uint64_t a2)
{
  while (1)
  {
    std::recursive_mutex::lock(this);
    uint64_t result = caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::try_lock(a2);
    if (result) {
      break;
    }
    std::recursive_mutex::unlock(this);
    sched_yield();
    uint64_t v5 = a2;
    char v6 = 1;
    caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::lock(a2);
    if (std::recursive_mutex::try_lock(this))
    {
      uint64_t v5 = 0;
      char v6 = 0;
      return std::unique_lock<caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>::~unique_lock[abi:ne180100]((uint64_t)&v5);
    }
    std::unique_lock<caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>::~unique_lock[abi:ne180100]((uint64_t)&v5);
    sched_yield();
  }
  return result;
}

void sub_19D89BC5C(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D89BE18(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void AVAudioEngineImpl::Stop(AVAudioEngineImpl *this, NSError **a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v4 = (std::recursive_mutex *)((char *)this + 112);
  uint64_t v5 = (char *)this + 176;
  std::lock[abi:ne180100]<std::recursive_mutex,caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>((std::recursive_mutex *)((char *)this + 112), (uint64_t)this + 176);
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  char v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)this;
    uint64_t v8 = (unsigned __int8 *)*((void *)this + 1);
    if (v8)
    {
      int v9 = v8[208];
      v8 += 184;
      if (v9) {
        uint64_t v8 = (unsigned __int8 *)this + 64;
      }
      LODWORD(v8) = *v8;
    }
    int v15 = 136315906;
    __int16 v16 = "AVAudioEngine.mm";
    __int16 v17 = 1024;
    int v18 = 1233;
    __int16 v19 = 2048;
    uint64_t v20 = v7;
    __int16 v21 = 1024;
    int v22 = (int)v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: stop, was running %d", (uint8_t *)&v15, 0x22u);
  }
  AVAudioEngineImpl::Pause(this, a2);
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  uint64_t v10 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)this;
    int v15 = 136315650;
    __int16 v16 = "AVAudioEngine.mm";
    __int16 v17 = 1024;
    int v18 = 1159;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: uninitialize", (uint8_t *)&v15, 0x1Cu);
  }
  uint64_t v12 = *((void *)this + 1);
  if (v12)
  {
    uint64_t v13 = (std::recursive_mutex *)(*(void *)v12 + 112);
    std::recursive_mutex::lock(v13);
    if (*(unsigned char *)(v12 + 185)) {
      uint64_t v14 = AVAudioEngineGraph::_Uninitialize((AVAudioNodeImplBase **)v12, a2);
    }
    else {
      uint64_t v14 = 0;
    }
    std::recursive_mutex::unlock(v13);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 1161, "Uninitialize", "_graph->Uninitialize(outErr)", v14, a2);
  }
  caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock((uint64_t)v5);
  std::recursive_mutex::unlock(v4);
}

void sub_19D89C0C0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v3);
  caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock(v2);
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void AVAudioEngineImpl::Reset(AVAudioEngineImpl *this)
{
  uint64_t v2 = (std::recursive_mutex *)((char *)this + 112);
  id v3 = (char *)this + 176;
  std::lock[abi:ne180100]<std::recursive_mutex,caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>((std::recursive_mutex *)((char *)this + 112), (uint64_t)this + 176);
  int v4 = (void *)*((void *)this + 1);
  uint64_t v5 = (std::recursive_mutex *)(*v4 + 112);
  std::recursive_mutex::lock(v5);
  char v6 = (void *)v4[1];
  if (v6)
  {
    int v9 = (void *)*v6;
    uint64_t v7 = v6 + 1;
    uint64_t v8 = v9;
    if (v9 != v7)
    {
      do
      {
        (*(void (**)(void))(**(void **)(v8[5] + 24) + 88))(*(void *)(v8[5] + 24));
        uint64_t v10 = (void *)v8[1];
        if (v10)
        {
          do
          {
            uint64_t v11 = v10;
            uint64_t v10 = (void *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            uint64_t v11 = (void *)v8[2];
            BOOL v12 = *v11 == (void)v8;
            uint64_t v8 = v11;
          }
          while (!v12);
        }
        uint64_t v8 = v11;
      }
      while (v11 != v7);
    }
  }
  v4[25] = 0;
  std::recursive_mutex::unlock(v5);
  caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock((uint64_t)v3);

  std::recursive_mutex::unlock(v2);
}

void sub_19D89C200(_Unwind_Exception *a1)
{
  caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock(v2);
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAudioEngineImpl::UpdateIONodes(AVAudioEngineImpl *this)
{
  AVAudioEngineImpl::UpdateOutputNode((uint64_t)this, 0);
  uint64_t result = AVAudioEngineImpl::UpdateInputNode((uint64_t)this, 0);
  if (*(unsigned char *)(*((void *)this + 1) + 187))
  {
    uint64_t result = *((void *)this + 7);
    *((void *)this + 7) = 0;
    if (result) {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    }
    *((void *)this + 2) = 0;
  }
  return result;
}

uint64_t AVAudioEngineImpl::UpdateOutputNode(uint64_t this, char a2)
{
  uint64_t v2 = this;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(this + 40);
  if (a2)
  {
    uint64_t v4 = this + 8;
    int v5 = *(unsigned char *)(*(void *)(this + 8) + 187) != 0;
    if (!v3) {
      goto LABEL_12;
    }
  }
  else
  {
    if (!v3) {
      return this;
    }
    uint64_t v4 = this + 8;
    int v5 = *(unsigned char *)(*(void *)(this + 8) + 187) != 0;
  }
  this = [*(id *)(this + 40) isInManualRenderingMode];
  if (v5) {
    BOOL v6 = this == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    this = [v3 manualRenderingMode];
    if (this == *(void *)(*(void *)v4 + 192)) {
      return this;
    }
    goto LABEL_15;
  }
  if (v5 == this) {
    return this;
  }
LABEL_12:
  if ((v5 & 1) == 0)
  {
    unsigned __int8 AudioSession = AVAudioEngineImpl::GetAudioSession((AVAudioEngineImpl *)v2);
    uint64_t IOUnit = AVAudioEngineImpl::GetIOUnit((AVAudioEngineImpl *)v2, AudioSession, v8, v9, v10);
    int v12 = 0;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t IOUnit = 0;
  int v12 = 1;
LABEL_16:
  uint64_t v13 = *(AVAudioNode **)(v2 + 40);
  if (v13)
  {
    InputConnectionPointForNode = AVAudioEngineImpl::GetInputConnectionPointForNode((AVAudioEngineImpl *)v2, v13, 0);
    id v15 = *(id *)(v2 + 40);
    AVAudioEngineGraph::RemoveIONode(*(AVAudioEngineGraph **)(v2 + 8), *(AVAudioNode **)(v2 + 40), 0, 0);
    AVAudioEngineImpl::DetachNode((id *)v2, *(AVAudioNode **)(v2 + 40), 1, 0);
    __int16 v16 = *(AVAudioOutputNode **)(v2 + 40);
    if (v12) {
      goto LABEL_18;
    }
LABEL_25:
    if (![(AVAudioIONode *)v16 enableRealtimeRenderingModeWithIOUnit:IOUnit isInput:0 forceIOUnitReset:0])
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      int v18 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "AVAEInternal.h";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 71;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "AVAudioEngine.mm";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 767;
        *(_WORD *)&buf[34] = 2080;
        *(void *)&buf[36] = "UpdateOutputNode";
        __int16 v25 = 2080;
        long long v26 = "[_outputNode enableRealtimeRenderingModeWithIOUnit:ioUnit isInput:isInputNode forceIOUnitReset:false]";
        _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_outputNode enableRealtimeRenderingModeWithIOUnit:ioUnit isInput:isInputNode forceIOUnitReset:false]");
    }
    __int16 v19 = *(NSObject **)(IOUnit + 8);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = ___ZN13AVAudioIOUnit9EnableBusEj_block_invoke;
    *(void *)&buf[24] = &__block_descriptor_44_e5_v8__0l;
    *(void *)&buf[32] = IOUnit;
    *(_DWORD *)&buf[40] = 0;
    dispatch_sync(v19, buf);
    goto LABEL_32;
  }
  __int16 v16 = [(AVAudioIONode *)[AVAudioOutputNode alloc] initWithIOUnit:IOUnit isInput:0];
  InputConnectionPointForNode = 0;
  *(void *)(v2 + 40) = v16;
  if (!v12) {
    goto LABEL_25;
  }
LABEL_18:
  if (![(AVAudioIONode *)v16 enableManualRenderingMode:*(void *)(*(void *)v4 + 192) isInput:0])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "AVAudioEngine.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 764;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = "UpdateOutputNode";
      __int16 v25 = 2080;
      long long v26 = "[_outputNode enableManualRenderingMode:GetManualRenderingMode() isInput:isInputNode]";
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_outputNode enableManualRenderingMode:GetManualRenderingMode() isInput:isInputNode]");
  }
LABEL_32:
  AVAudioEngineImpl::AttachNode((AVAudioEngineImpl *)v2, *(AVAudioNode **)(v2 + 40), 1);

  AVAudioEngineGraph::AddIONode(*(AVAudioEngineGraph **)(v2 + 8), *(AVAudioNode **)(v2 + 40), 0);
  uint64_t v20 = (void *)[*(id *)(v2 + 40) outputFormatForBus:0];
  if (v20)
  {
    __int16 v21 = v20;
    [v20 sampleRate];
    if (v22 > 0.0)
    {
      if ([v21 channelCount]) {
        [*(id *)(v2 + 40) setInputFormat:v21 forBus:0];
      }
    }
  }
  if (InputConnectionPointForNode) {
    AVAudioEngineImpl::Connect((id *)v2, [(AVAudioConnectionPoint *)InputConnectionPointForNode node], *(AVAudioNode **)(v2 + 40), [(AVAudioConnectionPoint *)InputConnectionPointForNode bus], 0, 0);
  }
  this = AVAudioEngineImpl::AreRenderingModesIdentical((AVAudioEngineImpl *)v2, *(AVAudioIONode **)(v2 + 40));
  if ((this & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v23 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "AVAudioEngine.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 788;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = "UpdateOutputNode";
      __int16 v25 = 2080;
      long long v26 = "AreRenderingModesIdentical(_outputNode)";
      _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    return objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "AreRenderingModesIdentical(_outputNode)");
  }
  return this;
}

uint64_t AVAudioEngineImpl::UpdateInputNode(uint64_t this, char a2)
{
  uint64_t v2 = this;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(this + 32);
  if (a2)
  {
    uint64_t v4 = this + 8;
    int v5 = *(unsigned char *)(*(void *)(this + 8) + 187) != 0;
    if (!v3) {
      goto LABEL_12;
    }
  }
  else
  {
    if (!v3) {
      return this;
    }
    uint64_t v4 = this + 8;
    int v5 = *(unsigned char *)(*(void *)(this + 8) + 187) != 0;
  }
  this = [*(id *)(this + 32) isInManualRenderingMode];
  if (v5) {
    BOOL v6 = this == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    this = [v3 manualRenderingMode];
    if (this == *(void *)(*(void *)v4 + 192)) {
      return this;
    }
    goto LABEL_15;
  }
  if (v5 == this) {
    return this;
  }
LABEL_12:
  if (v5)
  {
LABEL_15:
    uint64_t IOUnit = 0;
    int v12 = 1;
    goto LABEL_16;
  }
  unsigned __int8 AudioSession = AVAudioEngineImpl::GetAudioSession((AVAudioEngineImpl *)v2);
  uint64_t IOUnit = (void *)AVAudioEngineImpl::GetIOUnit((AVAudioEngineImpl *)v2, AudioSession, v8, v9, v10);
  int v12 = 0;
LABEL_16:
  uint64_t v13 = *(AVAudioNode **)(v2 + 32);
  if (v13)
  {
    OutputConnectionPointsForNode = (NSArray *)AVAudioEngineImpl::GetOutputConnectionPointsForNode((AVAudioEngineImpl *)v2, v13, 0);
    id v15 = *(id *)(v2 + 32);
    AVAudioEngineGraph::RemoveIONode(*(AVAudioEngineGraph **)(v2 + 8), *(AVAudioNode **)(v2 + 32), 1, 0);
    AVAudioEngineImpl::DetachNode((id *)v2, *(AVAudioNode **)(v2 + 32), 1, 0);
    __int16 v16 = *(AVAudioInputNode **)(v2 + 32);
  }
  else
  {
    __int16 v16 = [(AVAudioIONode *)[AVAudioInputNode alloc] initWithIOUnit:IOUnit isInput:1];
    OutputConnectionPointsForNode = 0;
    *(void *)(v2 + 32) = v16;
  }
  if (v12)
  {
    if (![(AVAudioIONode *)v16 enableManualRenderingMode:*(void *)(*(void *)v4 + 192) isInput:1])
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      __int16 v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "AVAEInternal.h";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 71;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "AVAudioEngine.mm";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 823;
        *(_WORD *)&buf[34] = 2080;
        *(void *)&buf[36] = "UpdateInputNode";
        __int16 v25 = 2080;
        long long v26 = "[_inputNode enableManualRenderingMode:GetManualRenderingMode() isInput:isInputNode]";
        _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_inputNode enableManualRenderingMode:GetManualRenderingMode() isInput:isInputNode]");
    }
  }
  else
  {
    if (![(AVAudioIONode *)v16 enableRealtimeRenderingModeWithIOUnit:IOUnit isInput:1 forceIOUnitReset:0])
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      int v18 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "AVAEInternal.h";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 71;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "AVAudioEngine.mm";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 826;
        *(_WORD *)&buf[34] = 2080;
        *(void *)&buf[36] = "UpdateInputNode";
        __int16 v25 = 2080;
        long long v26 = "[_inputNode enableRealtimeRenderingModeWithIOUnit:ioUnit isInput:isInputNode forceIOUnitReset:false]";
        _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_inputNode enableRealtimeRenderingModeWithIOUnit:ioUnit isInput:isInputNode forceIOUnitReset:false]");
    }
    (*(void (**)(void *))(*IOUnit + 64))(IOUnit);
    __int16 v19 = IOUnit[1];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = ___ZN13AVAudioIOUnit9EnableBusEj_block_invoke;
    *(void *)&buf[24] = &__block_descriptor_44_e5_v8__0l;
    *(void *)&buf[32] = IOUnit;
    *(_DWORD *)&buf[40] = 1;
    dispatch_sync(v19, buf);
  }
  AVAudioEngineImpl::AttachNode((AVAudioEngineImpl *)v2, *(AVAudioNode **)(v2 + 32), 1);

  AVAudioEngineGraph::AddIONode(*(AVAudioEngineGraph **)(v2 + 8), *(AVAudioNode **)(v2 + 32), 1);
  uint64_t v20 = (void *)[*(id *)(v2 + 32) inputFormatForBus:0];
  __int16 v21 = v20;
  if (v20)
  {
    [v20 sampleRate];
    if (v22 > 0.0)
    {
      if ([v21 channelCount]) {
        [*(id *)(v2 + 32) setOutputFormat:v21 forBus:0];
      }
    }
  }
  if ([(NSArray *)OutputConnectionPointsForNode count]) {
    AVAudioEngineImpl::ConnectMultipleOutputs((id *)v2, *(AVAudioNode **)(v2 + 32), OutputConnectionPointsForNode, 0, 0);
  }
  this = AVAudioEngineImpl::AreRenderingModesIdentical((AVAudioEngineImpl *)v2, *(AVAudioIONode **)(v2 + 32));
  if ((this & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v23 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "AVAudioEngine.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 875;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = "UpdateInputNode";
      __int16 v25 = 2080;
      long long v26 = "AreRenderingModesIdentical(_inputNode)";
      _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    return objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "AreRenderingModesIdentical(_inputNode)");
  }
  return this;
}

void sub_19D89CFC8(_Unwind_Exception *a1)
{
}

uint64_t AVAudioEngineImpl::GetOutputConnectionPointsForNode(AVAudioEngineImpl *this, AVAudioNode *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2 && [*((id *)this + 3) containsObject:a2])
  {
    BOOL v6 = (AVAudioEngineGraph *)*((void *)this + 1);
    return AVAudioEngineGraph::GetOutputConnectionPointsForNode(v6, a2, a3);
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v10 = "AVAEInternal.h";
      __int16 v11 = 1024;
      int v12 = 71;
      __int16 v13 = 2080;
      uint64_t v14 = "AVAudioEngine.mm";
      __int16 v15 = 1024;
      int v16 = 1145;
      __int16 v17 = 2080;
      int v18 = "GetOutputConnectionPointsForNode";
      __int16 v19 = 2080;
      uint64_t v20 = "node != nil && [_nodes containsObject: node]";
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node != nil && [_nodes containsObject: node]");
    return AVAudioEngineGraph::GetOutputConnectionPointsForNode(*((AVAudioEngineGraph **)this + 1), a2, a3);
  }
}

void AVAudioEngineImpl::DetachNode(id *this, AVAudioNode *a2, char a3, NSError **a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!_AVAE_CheckAndReturnErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 598, "DetachNode", "node != nil", a2 != 0, 4294967246, a4))
  {
    if ((a3 & 1) != 0
      || (!a2 ? (char v8 = 1) : this[6] == a2 || this[5] == a2 ? (char v8 = 0) : (char v8 = this[4] != a2),
          !_AVAE_CheckAndReturnErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 602, "DetachNode", "!IsInternalNode(node)", v8, 4294967246, a4)))
    {
      uint64_t v9 = [(AVAudioNode *)a2 impl];
      uint64_t v10 = (void **)v9[1];
      if (v10)
      {
        id v11 = *v10;
        if (v11)
        {
          int v12 = v9;
          _AVAE_CheckAndReturnErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 607, "DetachNode", "nil == owningEngine || GetEngine() == owningEngine", *this == v11, 4294967246, a4);
          [(AVAudioNode *)a2 didDetachFromEngine:*this error:a4];
          _AVAE_CheckAndReturnErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 616, "DetachNode", "!nodeimpl->HasEngineImpl()", v12[1] == 0, 4294967246, a4);
          [this[3] removeObject:a2];
          if ((unint64_t)[this[3] count] >= 0x33)
          {
            if (AVAudioEngineLogCategory(void)::once != -1) {
              dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
            }
            __int16 v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
            if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = *this;
              int v15 = [this[3] count];
              int v16 = 136315906;
              __int16 v17 = "AVAudioEngine.mm";
              __int16 v18 = 1024;
              int v19 = 622;
              __int16 v20 = 2048;
              id v21 = v14;
              __int16 v22 = 1024;
              int v23 = v15;
              _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: total number of attached nodes %d", (uint8_t *)&v16, 0x22u);
            }
          }
        }
      }
    }
  }
}

void AVAudioEngineImpl::AttachNode(AVAudioEngineImpl *this, AVAudioNode *a2, char a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    BOOL v6 = "node != nil";
    if (!os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v18 = "AVAEInternal.h";
    __int16 v19 = 1024;
    int v20 = 71;
    __int16 v21 = 2080;
    __int16 v22 = "AVAudioEngine.mm";
    __int16 v23 = 1024;
    int v7 = 569;
    goto LABEL_14;
  }
  if ((a3 & 1) == 0
    && (*((AVAudioNode **)this + 6) == a2 || *((AVAudioNode **)this + 5) == a2 || *((AVAudioNode **)this + 4) == a2))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    BOOL v6 = "!IsInternalNode(node)";
    if (!os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v18 = "AVAEInternal.h";
    __int16 v19 = 1024;
    int v20 = 71;
    __int16 v21 = 2080;
    __int16 v22 = "AVAudioEngine.mm";
    __int16 v23 = 1024;
    int v7 = 573;
LABEL_14:
    int v24 = v7;
    __int16 v25 = 2080;
    long long v26 = "AttachNode";
    __int16 v27 = 2080;
    unsigned __int8 v28 = v6;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
LABEL_15:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", v6);
  }
  char v8 = [(AVAudioNode *)a2 impl];
  uint64_t v9 = (AVAudioNode **)v8[1];
  if (v9)
  {
    uint64_t v10 = *v9;
    id v11 = *(AVAudioNode **)this;
    if (v10)
    {
      if (v11 != v10)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        int v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          __int16 v18 = "AVAEInternal.h";
          __int16 v19 = 1024;
          int v20 = 71;
          __int16 v21 = 2080;
          __int16 v22 = "AVAudioEngine.mm";
          __int16 v23 = 1024;
          int v24 = 577;
          __int16 v25 = 2080;
          long long v26 = "AttachNode";
          __int16 v27 = 2080;
          unsigned __int8 v28 = "nil == owningEngine || GetEngine() == owningEngine";
          _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nil == owningEngine || GetEngine() == owningEngine");
      }
      return;
    }
  }
  else
  {
    id v11 = *(AVAudioNode **)this;
  }
  [(AVAudioNode *)a2 didAttachToEngine:v11];
  if (!v8[1])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v18 = "AVAEInternal.h";
      __int16 v19 = 1024;
      int v20 = 71;
      __int16 v21 = 2080;
      __int16 v22 = "AVAudioEngine.mm";
      __int16 v23 = 1024;
      int v24 = 586;
      __int16 v25 = 2080;
      long long v26 = "AttachNode";
      __int16 v27 = 2080;
      unsigned __int8 v28 = "nodeimpl->HasEngineImpl()";
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nodeimpl->HasEngineImpl()");
  }
  [*((id *)this + 3) addObject:a2];
  if ((unint64_t)[*((id *)this + 3) count] >= 0x33)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    id v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(AVAudioNode **)this;
      int v16 = [*((id *)this + 3) count];
      *(_DWORD *)buf = 136315906;
      __int16 v18 = "AVAudioEngine.mm";
      __int16 v19 = 1024;
      int v20 = 592;
      __int16 v21 = 2048;
      __int16 v22 = (char *)v15;
      __int16 v23 = 1024;
      int v24 = v16;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: total number of attached nodes %d", buf, 0x22u);
    }
  }
}

void AVAudioEngineImpl::ConnectMultipleOutputs(id *this, AVAudioNode *a2, NSArray *a3, uint64_t a4, AVAudioFormat *a5)
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  int v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    id v6 = *this;
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v161);
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    uint64_t v7 = [(NSArray *)a3 countByEnumeratingWithState:&v145 objects:v171 count:16];
    id v132 = v6;
    if (v7)
    {
      uint64_t v8 = *(void *)v146;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v146 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = *(void **)(*((void *)&v145 + 1) + 8 * i);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v163[2], (uint64_t)" node: ", 7);
          [v10 node];
          id v11 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" (bus: ", 7);
          [v10 bus];
          int v12 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)")", 1);
        }
        uint64_t v7 = [(NSArray *)a3 countByEnumeratingWithState:&v145 objects:v171 count:16];
      }
      while (v7);
    }
    std::stringbuf::str[abi:ne180100]<std::allocator<char>>(__dst, (uint64_t)&v163[10]);
    *(void *)v161 = *MEMORY[0x1E4FBA408];
    uint64_t v13 = *(void *)(MEMORY[0x1E4FBA408] + 72);
    *(void *)&v161[*(void *)(*(void *)v161 - 24)] = *(void *)(MEMORY[0x1E4FBA408] + 64);
    *(void *)&v163[2] = v13;
    *(void *)&v163[10] = MEMORY[0x1E4FBA470] + 16;
    if (v169 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x19F3ABAB0](&v170);
    if (__dst[23] >= 0) {
      id v14 = __dst;
    }
    else {
      id v14 = *(unsigned char **)__dst;
    }
    uint64_t v15 = objc_msgSend(-[AVAudioFormat description](a5, "description"), "UTF8String");
    *(_DWORD *)buf = 136316674;
    *(void *)&uint8_t buf[4] = "AVAudioEngine.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1005;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v132;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = a2;
    *(_WORD *)&buf[38] = 2048;
    *(void *)&buf[40] = a4;
    LOWORD(v160[0]) = 2080;
    *(void *)((char *)v160 + 2) = v14;
    WORD5(v160[0]) = 2080;
    *(void *)((char *)v160 + 12) = v15;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: connect node: %p (from bus: %lu) ->%s, format: %s", buf, 0x44u);
    if ((__dst[23] & 0x80000000) != 0) {
      operator delete(*(void **)__dst);
    }
  }
  if (a2) {
    BOOL v16 = a3 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = !v16;
  int v127 = v17;
  if (v16 || ![(NSArray *)a3 count])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v18 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v161 = 136316418;
      *(void *)&v161[4] = "AVAEInternal.h";
      __int16 v162 = 1024;
      *(_DWORD *)v163 = 71;
      *(_WORD *)&v163[4] = 2080;
      *(void *)&v163[6] = "AVAudioEngine.mm";
      *(_WORD *)&v163[14] = 1024;
      *(_DWORD *)&v163[16] = 1007;
      __int16 v164 = 2080;
      v165 = "ConnectMultipleOutputs";
      __int16 v166 = 2080;
      v167 = "nil != sourceNode && nil != destNodes && [destNodes count] > 0";
      _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nil != sourceNode && nil != destNodes && [destNodes count] > 0");
  }
  if (([this[3] containsObject:a2] & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v19 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v161 = 136316418;
      *(void *)&v161[4] = "AVAEInternal.h";
      __int16 v162 = 1024;
      *(_DWORD *)v163 = 71;
      *(_WORD *)&v163[4] = 2080;
      *(void *)&v163[6] = "AVAudioEngine.mm";
      *(_WORD *)&v163[14] = 1024;
      *(_DWORD *)&v163[16] = 1008;
      __int16 v164 = 2080;
      v165 = "ConnectMultipleOutputs";
      __int16 v166 = 2080;
      v167 = "[_nodes containsObject: sourceNode]";
      _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_nodes containsObject: sourceNode]");
  }
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  uint64_t v20 = [(NSArray *)a3 countByEnumeratingWithState:&v138 objects:v158 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v139;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v139 != v21) {
          objc_enumerationMutation(a3);
        }
        __int16 v23 = *(void **)(*((void *)&v138 + 1) + 8 * j);
        if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          int v24 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v161 = 136316418;
            *(void *)&v161[4] = "AVAEInternal.h";
            __int16 v162 = 1024;
            *(_DWORD *)v163 = 71;
            *(_WORD *)&v163[4] = 2080;
            *(void *)&v163[6] = "AVAudioEngine.mm";
            *(_WORD *)&v163[14] = 1024;
            *(_DWORD *)&v163[16] = 1010;
            __int16 v164 = 2080;
            v165 = "ConnectMultipleOutputs";
            __int16 v166 = 2080;
            v167 = "object && [object isKindOfClass: [AVAudioConnectionPoint class]]";
            _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "object && [object isKindOfClass: [AVAudioConnectionPoint class]]");
        }
        if ((objc_msgSend(this[3], "containsObject:", objc_msgSend(v23, "node")) & 1) == 0)
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          __int16 v25 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v161 = 136316418;
            *(void *)&v161[4] = "AVAEInternal.h";
            __int16 v162 = 1024;
            *(_DWORD *)v163 = 71;
            *(_WORD *)&v163[4] = 2080;
            *(void *)&v163[6] = "AVAudioEngine.mm";
            *(_WORD *)&v163[14] = 1024;
            *(_DWORD *)&v163[16] = 1013;
            __int16 v164 = 2080;
            v165 = "ConnectMultipleOutputs";
            __int16 v166 = 2080;
            v167 = "[_nodes containsObject: connPoint.node]";
            _os_log_impl(&dword_19D794000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_nodes containsObject: connPoint.node]");
        }
        if ((AVAudioNode *)[v23 node] == a2)
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          long long v26 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v161 = 136316418;
            *(void *)&v161[4] = "AVAEInternal.h";
            __int16 v162 = 1024;
            *(_DWORD *)v163 = 71;
            *(_WORD *)&v163[4] = 2080;
            *(void *)&v163[6] = "AVAudioEngine.mm";
            *(_WORD *)&v163[14] = 1024;
            *(_DWORD *)&v163[16] = 1014;
            __int16 v164 = 2080;
            v165 = "ConnectMultipleOutputs";
            __int16 v166 = 2080;
            v167 = "sourceNode != connPoint.node";
            _os_log_impl(&dword_19D794000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "sourceNode != connPoint.node");
        }
      }
      uint64_t v20 = [(NSArray *)a3 countByEnumeratingWithState:&v138 objects:v158 count:16];
    }
    while (v20);
  }
  uint64_t v27 = (uint64_t)this[1];
  if (!v127 || ![(NSArray *)a3 count])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    unsigned __int8 v28 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v161 = 136316418;
      *(void *)&v161[4] = "AVAEInternal.h";
      __int16 v162 = 1024;
      *(_DWORD *)v163 = 71;
      *(_WORD *)&v163[4] = 2080;
      *(void *)&v163[6] = "AVAudioEngineGraph.mm";
      *(_WORD *)&v163[14] = 1024;
      *(_DWORD *)&v163[16] = 2420;
      __int16 v164 = 2080;
      v165 = "ConnectMultipleOutputs";
      __int16 v166 = 2080;
      v167 = "inSrcAVNode && inDestAVConnectionPoints && inDestAVConnectionPoints.count > 0";
      _os_log_impl(&dword_19D794000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inSrcAVNode && inDestAVConnectionPoints && inDestAVConnectionPoints.count > 0");
  }
  v128 = (std::recursive_mutex *)(*(void *)v27 + 112);
  std::recursive_mutex::lock(v128);
  uint64_t v29 = [(AVAudioNode *)a2 impl];
  unsigned int v126 = (*(uint64_t (**)(AVAudioNodeImplBase *, uint64_t))(*(void *)v29 + 240))(v29, a4);
  if (!AVAudioEngineGraph::IsNodeInGraph((AVAudioEngineGraph *)v27, v29))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    id v30 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v161 = 136316418;
      *(void *)&v161[4] = "AVAEInternal.h";
      __int16 v162 = 1024;
      *(_DWORD *)v163 = 71;
      *(_WORD *)&v163[4] = 2080;
      *(void *)&v163[6] = "AVAudioEngineGraph.mm";
      *(_WORD *)&v163[14] = 1024;
      *(_DWORD *)&v163[16] = 2431;
      __int16 v164 = 2080;
      v165 = "ConnectMultipleOutputs";
      __int16 v166 = 2080;
      v167 = "IsNodeInGraph(inSrcImpl)";
      _os_log_impl(&dword_19D794000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsNodeInGraph(inSrcImpl)");
  }
  if (a5)
  {
    [(AVAudioFormat *)a5 sampleRate];
    if (v31 <= 0.0 || ![(AVAudioFormat *)a5 channelCount])
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      int v32 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v161 = 136316418;
        *(void *)&v161[4] = "AVAEInternal.h";
        __int16 v162 = 1024;
        *(_DWORD *)v163 = 71;
        *(_WORD *)&v163[4] = 2080;
        *(void *)&v163[6] = "AVAudioEngineGraph.mm";
        *(_WORD *)&v163[14] = 1024;
        *(_DWORD *)&v163[16] = 2434;
        __int16 v164 = 2080;
        v165 = "ConnectMultipleOutputs";
        __int16 v166 = 2080;
        v167 = "IsFormatSampleRateAndChannelCountValid(format)";
        _os_log_impl(&dword_19D794000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsFormatSampleRateAndChannelCountValid(format)");
    }
  }
  uint64_t NodeFromMap = (void **)AVAudioEngineGraph::GetNodeFromMap((AVAudioEngineGraph *)v27, v29);
  if (((unsigned int (*)(void **))(*NodeFromMap)[14])(NodeFromMap))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v34 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v161 = 136316418;
      *(void *)&v161[4] = "AVAEInternal.h";
      __int16 v162 = 1024;
      *(_DWORD *)v163 = 71;
      *(_WORD *)&v163[4] = 2080;
      *(void *)&v163[6] = "AVAudioEngineGraph.mm";
      *(_WORD *)&v163[14] = 1024;
      *(_DWORD *)&v163[16] = 2441;
      __int16 v164 = 2080;
      v165 = "ConnectMultipleOutputs";
      __int16 v166 = 2080;
      v167 = "!inSrcNode->IsSplitterNode()";
      _os_log_impl(&dword_19D794000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "!inSrcNode->IsSplitterNode()");
  }
  uint64_t v124 = (*(uint64_t (**)(void *, uint64_t))(*NodeFromMap[3] + 48))(NodeFromMap[3], a4);
  if (a5) {
    char v35 = !-[AVAudioFormat isEqual:](a5, "isEqual:");
  }
  else {
    char v35 = 0;
  }
  uint64_t v155 = (uint64_t)&v155;
  v156 = &v155;
  unint64_t v157 = 0;
  AUGraphNodeBase::GetValidConnectionPoints(NodeFromMap, &v155);
  unint64_t v36 = v157;
  if (v157 >= 2)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v37 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v161 = 136316418;
      *(void *)&v161[4] = "AVAEInternal.h";
      __int16 v162 = 1024;
      *(_DWORD *)v163 = 71;
      *(_WORD *)&v163[4] = 2080;
      *(void *)&v163[6] = "AVAudioEngineGraph.mm";
      *(_WORD *)&v163[14] = 1024;
      *(_DWORD *)&v163[16] = 2450;
      __int16 v164 = 2080;
      v165 = "ConnectMultipleOutputs";
      __int16 v166 = 2080;
      v167 = "currentConnPoints.size() <= 1";
      _os_log_impl(&dword_19D794000, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "currentConnPoints.size() <= 1");
    unint64_t v36 = v157;
  }
  v123 = v29;
  v130 = NodeFromMap;
  if (v36)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)v156[2] + 112))(v156[2]))
    {
      uint64_t NodeFromMap = (void **)v156[2];
      AUGraphNodeBase::GetValidConnectionPoints(NodeFromMap, &v155);
      if (v157 <= 1)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        std::string v38 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v161 = 136316418;
          *(void *)&v161[4] = "AVAEInternal.h";
          __int16 v162 = 1024;
          *(_DWORD *)v163 = 71;
          *(_WORD *)&v163[4] = 2080;
          *(void *)&v163[6] = "AVAudioEngineGraph.mm";
          *(_WORD *)&v163[14] = 1024;
          *(_DWORD *)&v163[16] = 2456;
          __int16 v164 = 2080;
          v165 = "ConnectMultipleOutputs";
          __int16 v166 = 2080;
          v167 = "currentConnPoints.size() > 1";
          _os_log_impl(&dword_19D794000, v38, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v161, 0x36u);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "currentConnPoints.size() > 1");
      }
    }
  }
  v152 = &v152;
  v153 = &v152;
  uint64_t v154 = 0;
  NSUInteger v133 = [(NSArray *)a3 count];
  v137 = (AVAudioEngineGraph *)v27;
  if (v35)
  {
    std::__list_imp<AUGraphConnection>::clear(&v152);
    unint64_t v41 = v157;
    if (v157)
    {
      uint64_t v43 = v155;
      unint64_t v42 = v156;
      uint64_t v44 = *v156;
      *(void *)(v44 + 8) = *(void *)(v155 + 8);
      **(void **)(v43 + 8) = v44;
      uint64_t v45 = v152;
      *((void *)v152 + 1) = v42;
      *unint64_t v42 = (uint64_t)v45;
      *(void *)(v43 + 8) = &v152;
      v152 = (_OWORD *)v43;
      v154 += v41;
      unint64_t v157 = 0;
    }
    goto LABEL_130;
  }
  for (k = v156; k != &v155; k = (uint64_t *)k[1])
  {
    v160[0] = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v47 = [(NSArray *)a3 countByEnumeratingWithState:buf objects:v161 count:16];
    int v48 = k + 2;
    if (v47)
    {
      uint64_t v49 = **(void **)&buf[16];
LABEL_113:
      uint64_t v50 = 0;
      while (1)
      {
        if (**(void **)&buf[16] != v49) {
          objc_enumerationMutation(a3);
        }
        id v51 = *(void **)(*(void *)&buf[8] + 8 * v50);
        if (!v51)
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          id v52 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v171 = 136316418;
            *(void *)&v171[4] = "AVAEInternal.h";
            *(_WORD *)&v171[12] = 1024;
            *(_DWORD *)&v171[14] = 71;
            *(_WORD *)&v171[18] = 2080;
            *(void *)&v171[20] = "AVAudioEngineGraph.mm";
            __int16 v172 = 1024;
            int v173 = 2474;
            __int16 v174 = 2080;
            v175 = "ConnectMultipleOutputs";
            __int16 v176 = 2080;
            v177 = "avConnPoint";
            _os_log_impl(&dword_19D794000, v52, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v171, 0x36u);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "avConnPoint");
        }
        if ([v51 node] == *(void *)(*v48 + 16))
        {
          uint64_t v53 = [v51 bus];
          if (v53 == (*(uint64_t (**)(void, void))(**(void **)(k[2] + 24) + 248))(*(void *)(k[2] + 24), *((unsigned int *)k + 6)))break; {
        }
          }
        if (v47 == ++v50)
        {
          uint64_t v47 = [(NSArray *)a3 countByEnumeratingWithState:buf objects:v161 count:16];
          if (v47) {
            goto LABEL_113;
          }
          goto LABEL_126;
        }
      }
    }
    else
    {
LABEL_126:
      v54 = operator new(0x20uLL);
      v54[1] = *(_OWORD *)v48;
      id v55 = v152;
      *(void *)v54 = v152;
      *((void *)v54 + 1) = &v152;
      *((void *)v55 + 1) = v54;
      v152 = v54;
      ++v154;
    }
  }
  uint64_t v27 = (uint64_t)v137;
  if (v154 || v133 > v157)
  {
LABEL_130:
    uint64_t v149 = (uint64_t)&v149;
    v150 = &v149;
    uint64_t v151 = 0;
    if (!*(unsigned char *)(v27 + 185) || !*((unsigned char *)NodeFromMap[3] + 48))
    {
      int v125 = 2;
LABEL_150:
      for (m = v150; m != &v149; m = (uint64_t *)m[1])
      {
        AUGraphParser::PrepareForDisconnection(v137, (const AVAudioEngineGraph *)m[4], 0, v39, v40);
        uint64_t Disconnection = AVAudioEngineGraph::MakeDisconnection(v137, *(AVAudioNodeImplBase **)(m[4] + 24), *((unsigned int *)m + 10), 0);
        if (Disconnection)
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          id v62 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v171 = 136316674;
            *(void *)&v171[4] = "AVAEInternal.h";
            *(_WORD *)&v171[12] = 1024;
            *(_DWORD *)&v171[14] = 104;
            *(_WORD *)&v171[18] = 2080;
            *(void *)&v171[20] = "AVAudioEngineGraph.mm";
            __int16 v172 = 1024;
            int v173 = 2545;
            __int16 v174 = 2080;
            v175 = "ConnectMultipleOutputs";
            __int16 v176 = 2080;
            v177 = "MakeDisconnection(conn.destNode->NodeImpl(), conn.destBus)";
            __int16 v178 = 1024;
            int v179 = Disconnection;
            _os_log_impl(&dword_19D794000, v62, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", v171, 0x3Cu);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", Disconnection);
        }
      }
      uint64_t v65 = AVAudioEngineGraph::PerformCommand((uint64_t)v137, NodeFromMap, 4, 0, 0);
      if (v65)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        id v66 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v171 = 136316674;
          *(void *)&v171[4] = "AVAEInternal.h";
          *(_WORD *)&v171[12] = 1024;
          *(_DWORD *)&v171[14] = 104;
          *(_WORD *)&v171[18] = 2080;
          *(void *)&v171[20] = "AVAudioEngineGraph.mm";
          __int16 v172 = 1024;
          int v173 = 2551;
          __int16 v174 = 2080;
          v175 = "ConnectMultipleOutputs";
          __int16 v176 = 2080;
          v177 = "PerformCommand(*finalSrcNode, kAUUninitialize, NULL, 0)";
          __int16 v178 = 1024;
          int v179 = v65;
          _os_log_impl(&dword_19D794000, v66, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", v171, 0x3Cu);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v65);
      }
      for (n = v153; n != &v152; n = (void *)n[1])
      {
        AUGraphParser::PrepareForDisconnection(v137, (const AVAudioEngineGraph *)n[2], 0, v63, v64);
        uint64_t v68 = AVAudioEngineGraph::_DisconnectInput(v137, *(AVAudioNodeImplBase **)(n[2] + 24), *((unsigned int *)n + 6));
        if (v68)
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          id v69 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v171 = 136316674;
            *(void *)&v171[4] = "AVAEInternal.h";
            *(_WORD *)&v171[12] = 1024;
            *(_DWORD *)&v171[14] = 104;
            *(_WORD *)&v171[18] = 2080;
            *(void *)&v171[20] = "AVAudioEngineGraph.mm";
            __int16 v172 = 1024;
            int v173 = 2561;
            __int16 v174 = 2080;
            v175 = "ConnectMultipleOutputs";
            __int16 v176 = 2080;
            v177 = "_DisconnectInput(connPoint.node->NodeImpl(), connPoint.bus)";
            __int16 v178 = 1024;
            int v179 = v68;
            _os_log_impl(&dword_19D794000, v69, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", v171, 0x3Cu);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v68);
        }
        if ((*(unsigned int (**)(void))(*(void *)n[2] + 120))(n[2]))
        {
          *(void *)v171 = v171;
          *(void *)&v171[8] = v171;
          *(void *)&v171[16] = 0;
          for (iuint64_t i = v150; ii != &v149; iuint64_t i = (uint64_t *)jj[1])
          {
            uint64_t v71 = ii[4];
            if (v71 == n[2])
            {
              int v72 = *((_DWORD *)ii + 10);
              if (v72 == *((_DWORD *)n + 6))
              {
                for (juint64_t j = (uint64_t *)ii[1]; jj != &v149; juint64_t j = (uint64_t *)jj[1])
                {
                  if (jj[4] != v71 || *((_DWORD *)jj + 10) != v72)
                  {
                    std::list<AUGraphConnection>::splice((uint64_t)v171, (uint64_t *)v171, (uint64_t)&v149, ii, jj);
                    goto LABEL_182;
                  }
                }
                std::list<AUGraphConnection>::splice((uint64_t)v171, (uint64_t *)v171, (uint64_t)&v149, ii, &v149);
                break;
              }
            }
            juint64_t j = ii;
LABEL_182:
            ;
          }
          std::__list_imp<AUGraphConnection>::clear(v171);
        }
      }
      if (v133 <= 1)
      {
        if (v133 == 1 && ((unsigned int (*)(void **))(*NodeFromMap)[14])(NodeFromMap))
        {
          id v79 = (AVAudioNode *)NodeFromMap[2];
          uint64_t NodeFromMap = v130;
          uint64_t v80 = AVAudioEngineGraph::RemoveNode((uint64_t ***)v137, v79, 0);
          if (v80)
          {
            if (AVAudioEngineLogCategory(void)::once != -1) {
              dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
            }
            uint64_t v81 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
            if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v171 = 136316674;
              *(void *)&v171[4] = "AVAEInternal.h";
              *(_WORD *)&v171[12] = 1024;
              *(_DWORD *)&v171[14] = 104;
              *(_WORD *)&v171[18] = 2080;
              *(void *)&v171[20] = "AVAudioEngineGraph.mm";
              __int16 v172 = 1024;
              int v173 = 2588;
              __int16 v174 = 2080;
              v175 = "ConnectMultipleOutputs";
              __int16 v176 = 2080;
              v177 = "RemoveNode(avNode)";
              __int16 v178 = 1024;
              int v179 = v80;
              _os_log_impl(&dword_19D794000, v81, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", v171, 0x3Cu);
            }
            objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v80);
          }
          id v82 = v79;
          uint64_t v84 = (AVAudioNode **)*((void *)v137 + 4);
          id v83 = (AVAudioNode **)*((void *)v137 + 5);
          if (v84 != v83)
          {
            while (*v84 != v79)
            {
              if (++v84 == v83)
              {
                uint64_t v84 = (AVAudioNode **)*((void *)v137 + 5);
                break;
              }
            }
          }
          int64_t v85 = (char *)v83 - (char *)(v84 + 1);
          if (v83 != v84 + 1) {
            memmove(v84, v84 + 1, (char *)v83 - (char *)(v84 + 1));
          }
          *((void *)v137 + 5) = (char *)v84 + v85;
        }
      }
      else if ((((uint64_t (*)(void **))(*NodeFromMap)[14])(NodeFromMap) & 1) == 0)
      {
        int v74 = objc_alloc_init(AVAudioUnitSplitter);
        p_super = &v74->super.super;
        int v77 = (AVAudioUnitSplitter **)*((void *)v137 + 5);
        unint64_t v76 = *((void *)v137 + 6);
        if ((unint64_t)v77 >= v76)
        {
          uint64_t v86 = *((void *)v137 + 4);
          uint64_t v87 = ((uint64_t)v77 - v86) >> 3;
          if ((unint64_t)(v87 + 1) >> 61) {
            std::vector<EExtAudioGraphNodeState>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v88 = v76 - v86;
          uint64_t v89 = v88 >> 2;
          if (v88 >> 2 <= (unint64_t)(v87 + 1)) {
            uint64_t v89 = v87 + 1;
          }
          if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v90 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v90 = v89;
          }
          if (v90)
          {
            if (v90 >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            unsigned int v91 = (char *)operator new(8 * v90);
          }
          else
          {
            unsigned int v91 = 0;
          }
          uint64_t v92 = (AVAudioNode **)&v91[8 * v87];
          v93 = &v91[8 * v90];
          *uint64_t v92 = p_super;
          __int16 v78 = v92 + 1;
          v95 = (char *)*((void *)v137 + 4);
          v94 = (char *)*((void *)v137 + 5);
          if (v94 != v95)
          {
            do
            {
              v96 = (AVAudioNode *)*((void *)v94 - 1);
              v94 -= 8;
              *--uint64_t v92 = v96;
            }
            while (v94 != v95);
            v94 = (char *)*((void *)v137 + 4);
          }
          *((void *)v137 + 4) = v92;
          *((void *)v137 + 5) = v78;
          *((void *)v137 + 6) = v93;
          if (v94) {
            operator delete(v94);
          }
        }
        else
        {
          *int v77 = v74;
          __int16 v78 = v77 + 1;
        }
        *((void *)v137 + 5) = v78;
        AVAudioEngineGraph::AddNode(v137, p_super);
        uint64_t v97 = AVAudioEngineGraph::_Connect((AVAudioNodeImplBase **)v137, v123, (AVAudioNodeImplBase *)[(AVAudioNode *)p_super impl], v126, 0, a5);
        if (v97)
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          v98 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v171 = 136316674;
            *(void *)&v171[4] = "AVAEInternal.h";
            *(_WORD *)&v171[12] = 1024;
            *(_DWORD *)&v171[14] = 104;
            *(_WORD *)&v171[18] = 2080;
            *(void *)&v171[20] = "AVAudioEngineGraph.mm";
            __int16 v172 = 1024;
            int v173 = 2578;
            __int16 v174 = 2080;
            v175 = "ConnectMultipleOutputs";
            __int16 v176 = 2080;
            v177 = "_Connect(inSrcImpl, [splitter impl], inSrcBus, kAudioUnitElement_Default, format)";
            __int16 v178 = 1024;
            int v179 = v97;
            _os_log_impl(&dword_19D794000, v98, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", v171, 0x3Cu);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v97);
        }
        uint64_t NodeFromMap = (void **)AVAudioEngineGraph::GetNodeFromMap(v137, (AVAudioNodeImplBase *)[(AVAudioNode *)p_super impl]);
      }
      if (((unsigned int (*)(void **))(*NodeFromMap)[13])(NodeFromMap))
      {
        uint64_t v99 = AVAudioEngineGraph::PerformCommand((uint64_t)v137, NodeFromMap, 4, 0, 0);
        if (v99)
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          v100 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v171 = 136316674;
            *(void *)&v171[4] = "AVAEInternal.h";
            *(_WORD *)&v171[12] = 1024;
            *(_DWORD *)&v171[14] = 104;
            *(_WORD *)&v171[18] = 2080;
            *(void *)&v171[20] = "AVAudioEngineGraph.mm";
            __int16 v172 = 1024;
            int v173 = 2598;
            __int16 v174 = 2080;
            v175 = "ConnectMultipleOutputs";
            __int16 v176 = 2080;
            v177 = "PerformCommand(*finalSrcNode, AVAudioEngineGraph::kAUUninitialize, NULL, 0)";
            __int16 v178 = 1024;
            int v179 = v99;
            _os_log_impl(&dword_19D794000, v100, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", v171, 0x3Cu);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v99);
        }
        (*(void (**)(void *, NSUInteger))(*NodeFromMap[3] + 120))(NodeFromMap[3], v133);
        if (a5) {
          v101 = a5;
        }
        else {
          v101 = (AVAudioFormat *)v124;
        }
        if (v101 && v133)
        {
          uint64_t v102 = 0;
          do
          {
            (*(void (**)(void *, uint64_t, AVAudioFormat *))(*NodeFromMap[3] + 64))(NodeFromMap[3], v102, v101);
            v103 = NodeFromMap[14];
            if (v103)
            {
              v104 = (void *)(*(uint64_t (**)(void, void))(*(void *)v103[3] + 48))(v103[3], 0);
              if ((objc_msgSend(v104, "isEqual:", (*(uint64_t (**)(void *, void))(*NodeFromMap[3] + 48))(NodeFromMap[3], 0)) & 1) == 0)
              {
                if (AVAudioEngineLogCategory(void)::once != -1) {
                  dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
                }
                v105 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
                if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v171 = 136316418;
                  *(void *)&v171[4] = "AVAEInternal.h";
                  *(_WORD *)&v171[12] = 1024;
                  *(_DWORD *)&v171[14] = 71;
                  *(_WORD *)&v171[18] = 2080;
                  *(void *)&v171[20] = "AVAudioEngineGraph.mm";
                  __int16 v172 = 1024;
                  int v173 = 2609;
                  __int16 v174 = 2080;
                  v175 = "ConnectMultipleOutputs";
                  __int16 v176 = 2080;
                  v177 = "[midiInputImpl->GetOutputFormat(0) isEqual:finalSrcNode->NodeImpl()->GetOutputFormat(0)]";
                  _os_log_impl(&dword_19D794000, v105, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v171, 0x36u);
                }
                objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[midiInputImpl->GetOutputFormat(0) isEqual:finalSrcNode->NodeImpl()->GetOutputFormat(0)]");
              }
            }
            ++v102;
          }
          while (v133 != v102);
        }
      }
      if (((unsigned int (*)(void **))(*NodeFromMap)[14])(NodeFromMap)) {
        uint64_t v106 = 0;
      }
      else {
        uint64_t v106 = v126;
      }
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      uint64_t v107 = [(NSArray *)a3 countByEnumeratingWithState:&v145 objects:v171 count:16];
      if (v107)
      {
        uint64_t v108 = *(void *)v146;
        do
        {
          uint64_t v109 = 0;
          do
          {
            if (*(void *)v146 != v108) {
              objc_enumerationMutation(a3);
            }
            v110 = *(void **)(*((void *)&v145 + 1) + 8 * v109);
            if (!v110)
            {
              if (AVAudioEngineLogCategory(void)::once != -1) {
                dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
              }
              v111 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
              if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__dst = 136316418;
                *(void *)&__dst[4] = "AVAEInternal.h";
                *(_WORD *)&__dst[12] = 1024;
                *(_DWORD *)&__dst[14] = 71;
                *(_WORD *)&__dst[18] = 2080;
                *(void *)&__dst[20] = "AVAudioEngineGraph.mm";
                __int16 v181 = 1024;
                int v182 = 2621;
                __int16 v183 = 2080;
                v184 = "ConnectMultipleOutputs";
                __int16 v185 = 2080;
                v186 = "avConnPoint";
                _os_log_impl(&dword_19D794000, v111, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", __dst, 0x36u);
              }
              objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "avConnPoint");
            }
            v112 = (AVAudioNodeImplBase *)objc_msgSend((id)objc_msgSend(v110, "node"), "impl");
            uint64_t v113 = AVAudioEngineGraph::GetNodeFromMap(v137, v112);
            uint64_t v114 = (*(uint64_t (**)(AVAudioNodeImplBase *, uint64_t))(*(void *)v112 + 240))(v112, [v110 bus]);
            if (*((unsigned char *)v137 + 185)
              && *(unsigned char *)(*(void *)(v113 + 24) + 48)
              && (*(unsigned int (**)(uint64_t))(*(void *)v113 + 120))(v113)
              && (*(unsigned char *)(v113 + 32) & 2) != 0)
            {
              *(void *)__dst = NodeFromMap;
              *(_DWORD *)&__dst[8] = v106;
              *(void *)&__dst[16] = v113;
              *(_DWORD *)&char __dst[24] = v114;
              AVAudioEngineGraph::AddPendingConnection((uint64_t)v137, 0, (uint64_t)__dst, 0);
            }
            else
            {
              uint64_t v115 = AVAudioEngineGraph::_Connect((AVAudioNodeImplBase **)v137, (AVAudioNodeImplBase *)NodeFromMap[3], v112, v106, v114, a5);
              if (v115)
              {
                if (AVAudioEngineLogCategory(void)::once != -1) {
                  dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
                }
                v116 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
                if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)__dst = 136316674;
                  *(void *)&__dst[4] = "AVAEInternal.h";
                  *(_WORD *)&__dst[12] = 1024;
                  *(_DWORD *)&__dst[14] = 104;
                  *(_WORD *)&__dst[18] = 2080;
                  *(void *)&__dst[20] = "AVAudioEngineGraph.mm";
                  __int16 v181 = 1024;
                  int v182 = 2635;
                  __int16 v183 = 2080;
                  v184 = "ConnectMultipleOutputs";
                  __int16 v185 = 2080;
                  v186 = "_Connect(finalSrcNode->NodeImpl(), destImpl, srcBus, destBus, format)";
                  __int16 v187 = 1024;
                  int v188 = v115;
                  _os_log_impl(&dword_19D794000, v116, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", __dst, 0x3Cu);
                }
                objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v115);
              }
            }
            if ((*(unsigned int (**)(uint64_t))(*(void *)v113 + 120))(v113))
            {
              *(void *)__dst = __dst;
              *(void *)&__dst[8] = __dst;
              *(void *)&__dst[16] = 0;
              for (kk = v150; kk != &v149; kk = (uint64_t *)mm[1])
              {
                if (kk[4] == v113 && *((_DWORD *)kk + 10) == v114)
                {
                  for (mm = (uint64_t *)kk[1]; mm != &v149; mm = (uint64_t *)mm[1])
                  {
                    if (mm[4] != v113 || *((_DWORD *)mm + 10) != v114)
                    {
                      std::list<AUGraphConnection>::splice((uint64_t)__dst, (uint64_t *)__dst, (uint64_t)&v149, kk, mm);
                      goto LABEL_287;
                    }
                  }
                  std::list<AUGraphConnection>::splice((uint64_t)__dst, (uint64_t *)__dst, (uint64_t)&v149, kk, &v149);
                  break;
                }
                mm = kk;
LABEL_287:
                ;
              }
              std::__list_imp<AUGraphConnection>::clear(__dst);
            }
            uint64_t v106 = v106 + ((unsigned int (*)(void **))(*NodeFromMap)[14])(NodeFromMap);
            ++v109;
          }
          while (v109 != v107);
          uint64_t v119 = [(NSArray *)a3 countByEnumeratingWithState:&v145 objects:v171 count:16];
          uint64_t v107 = v119;
        }
        while (v119);
      }
      for (nn = v150; nn != &v149; nn = (uint64_t *)nn[1])
        AVAudioEngineGraph::AddPendingConnection((uint64_t)v137, 0, (uint64_t)(nn + 2), 0);
      v142 = 0;
      v143 = 0;
      uint64_t v144 = 0;
      uint64_t updated = AVAudioEngineGraph::UpdateGraphAfterReconfig(v137, (uint64_t **)&v142, v125);
      if (updated)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        v122 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__dst = 136316674;
          *(void *)&__dst[4] = "AVAEInternal.h";
          *(_WORD *)&__dst[12] = 1024;
          *(_DWORD *)&__dst[14] = 104;
          *(_WORD *)&__dst[18] = 2080;
          *(void *)&__dst[20] = "AVAudioEngineGraph.mm";
          __int16 v181 = 1024;
          int v182 = 2657;
          __int16 v183 = 2080;
          v184 = "ConnectMultipleOutputs";
          __int16 v185 = 2080;
          v186 = "UpdateGraphAfterReconfig(&disjointNodes, graphTraversalMode)";
          __int16 v187 = 1024;
          int v188 = updated;
          _os_log_impl(&dword_19D794000, v122, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", __dst, 0x3Cu);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", updated);
      }
      if (v142)
      {
        v143 = v142;
        operator delete(v142);
      }
      std::__list_imp<AUGraphConnection>::clear(&v149);
      goto LABEL_306;
    }
    if (((_BYTE)NodeFromMap[4] & 2) != 0)
    {
      LOBYTE(v145) = 0;
      AUGraphParser::GetNodeConnectionsToMixer((uint64_t)NodeFromMap, &v149, &v145);
      if (v151) {
        BOOL v56 = v145 == 0;
      }
      else {
        BOOL v56 = 0;
      }
      int v57 = v56;
      if (!*(unsigned char *)(v27 + 184))
      {
        if (v57) {
          int v59 = 2;
        }
        else {
          int v59 = 1;
        }
LABEL_147:
        int v125 = v59;
        if (AUGraphParser::IsNodeConnectedToTarget(0, (uint64_t)NodeFromMap, (void *)(v27 + 88))) {
          AVAudioEngineGraph::SetNodesToPullEnabled(v27, 0);
        }
        goto LABEL_150;
      }
      if ((v57 & 1) == 0)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        uint64_t v58 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v171 = 136316418;
          *(void *)&v171[4] = "AVAEInternal.h";
          *(_WORD *)&v171[12] = 1024;
          *(_DWORD *)&v171[14] = 71;
          *(_WORD *)&v171[18] = 2080;
          *(void *)&v171[20] = "AVAudioEngineGraph.mm";
          __int16 v172 = 1024;
          int v173 = 2528;
          __int16 v174 = 2080;
          v175 = "ConnectMultipleOutputs";
          __int16 v176 = 2080;
          v177 = "!srcNodeMixerConns.empty() && !isSrcNodeConnectedToIONode";
          _os_log_impl(&dword_19D794000, v58, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v171, 0x36u);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "!srcNodeMixerConns.empty() && !isSrcNodeConnectedToIONode");
      }
    }
    int v59 = 2;
    goto LABEL_147;
  }
LABEL_306:
  std::__list_imp<AUGraphConnection>::clear(&v152);
  std::__list_imp<AUGraphConnection>::clear(&v155);
  std::recursive_mutex::unlock(v128);
}

void sub_19D8A0060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::recursive_mutex *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
}

BOOL AVAudioEngineImpl::AreRenderingModesIdentical(AVAudioEngineImpl *this, AVAudioIONode *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = *((void *)this + 1);
  int v5 = *(unsigned __int8 *)(v4 + 187);
  BOOL v6 = *(unsigned char *)(v4 + 187) != 0;
  BOOL v7 = [(AVAudioIONode *)a2 isInManualRenderingMode];
  BOOL result = v7 ^ v6 ^ 1u;
  if (v7)
  {
    if (v5) {
      return [(AVAudioIONode *)a2 manualRenderingMode] == *(void *)(*((void *)this + 1) + 192);
    }
  }
  return result;
}

AVAudioConnectionPoint *AVAudioEngineImpl::GetInputConnectionPointForNode(AVAudioEngineImpl *this, AVAudioNode *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2 && [*((id *)this + 3) containsObject:a2])
  {
    BOOL v6 = (AVAudioEngineGraph *)*((void *)this + 1);
    return AVAudioEngineGraph::GetInputConnectionPointForNode(v6, a2, a3);
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v10 = "AVAEInternal.h";
      __int16 v11 = 1024;
      int v12 = 71;
      __int16 v13 = 2080;
      id v14 = "AVAudioEngine.mm";
      __int16 v15 = 1024;
      int v16 = 1139;
      __int16 v17 = 2080;
      __int16 v18 = "GetInputConnectionPointForNode";
      __int16 v19 = 2080;
      uint64_t v20 = "node != nil && [_nodes containsObject: node]";
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node != nil && [_nodes containsObject: node]");
    return AVAudioEngineGraph::GetInputConnectionPointForNode(*((AVAudioEngineGraph **)this + 1), a2, a3);
  }
}

BOOL AVAudioEngineImpl::Connect(id *this, AVAudioNode *a2, AVAudioNode *a3, uint64_t a4, uint64_t a5, AVAudioFormat *a6)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  int v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = (char *)*this;
    *(_DWORD *)buf = 136316930;
    double v31 = "AVAudioEngine.mm";
    __int16 v32 = 1024;
    int v33 = 971;
    __int16 v34 = 2048;
    char v35 = v13;
    __int16 v36 = 2048;
    *(void *)uint64_t v37 = a2;
    *(_WORD *)&v37[8] = 2048;
    *(void *)&v37[10] = a4;
    *(_WORD *)&v37[18] = 2048;
    *(void *)&v37[20] = a3;
    __int16 v38 = 2048;
    uint64_t v39 = a5;
    __int16 v40 = 2080;
    uint64_t v41 = objc_msgSend(-[AVAudioFormat description](a6, "description"), "UTF8String");
    _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: connect node1: %p (from bus: %lu) -> node2: %p (to bus: %lu), format: %s", buf, 0x4Eu);
  }
  uint64_t v28 = a4;
  uint64_t v29 = a5;
  if (a2) {
    BOOL v14 = a3 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  char v15 = !v14;
  if (v14)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      double v31 = "AVAEInternal.h";
      __int16 v32 = 1024;
      int v33 = 71;
      __int16 v34 = 2080;
      char v35 = "AVAudioEngine.mm";
      __int16 v36 = 1024;
      *(_DWORD *)uint64_t v37 = 973;
      *(_WORD *)&v37[4] = 2080;
      *(void *)&v37[6] = "Connect";
      *(_WORD *)&v37[14] = 2080;
      *(void *)&v37[16] = "node1 != nil && node2 != nil";
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node1 != nil && node2 != nil");
  }
  if (a2 == a3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      double v31 = "AVAEInternal.h";
      __int16 v32 = 1024;
      int v33 = 71;
      __int16 v34 = 2080;
      char v35 = "AVAudioEngine.mm";
      __int16 v36 = 1024;
      *(_DWORD *)uint64_t v37 = 974;
      *(_WORD *)&v37[4] = 2080;
      *(void *)&v37[6] = "Connect";
      *(_WORD *)&v37[14] = 2080;
      *(void *)&v37[16] = "node1 != node2";
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node1 != node2");
  }
  if (![this[3] containsObject:a2]
    || ([this[3] containsObject:a3] & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v18 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      double v31 = "AVAEInternal.h";
      __int16 v32 = 1024;
      int v33 = 71;
      __int16 v34 = 2080;
      char v35 = "AVAudioEngine.mm";
      __int16 v36 = 1024;
      *(_DWORD *)uint64_t v37 = 975;
      *(_WORD *)&v37[4] = 2080;
      *(void *)&v37[6] = "Connect";
      *(_WORD *)&v37[14] = 2080;
      *(void *)&v37[16] = "[_nodes containsObject: node1] && [_nodes containsObject: node2]";
      _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_nodes containsObject: node1] && [_nodes containsObject: node2]");
  }
  __int16 v19 = (AVAudioNodeImplBase **)this[1];
  if ((v15 & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v20 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      double v31 = "AVAEInternal.h";
      __int16 v32 = 1024;
      int v33 = 71;
      __int16 v34 = 2080;
      char v35 = "AVAudioEngineGraph.mm";
      __int16 v36 = 1024;
      *(_DWORD *)uint64_t v37 = 2146;
      *(_WORD *)&v37[4] = 2080;
      *(void *)&v37[6] = "Connect";
      *(_WORD *)&v37[14] = 2080;
      *(void *)&v37[16] = "inSrcAVNode && inDestAVNode";
      _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inSrcAVNode && inDestAVNode");
  }
  uint64_t v21 = [(AVAudioNode *)a2 impl];
  __int16 v22 = [(AVAudioNode *)a3 impl];
  __int16 v23 = v22;
  if (!v21 || !v22)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v24 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      double v31 = "AVAEInternal.h";
      __int16 v32 = 1024;
      int v33 = 71;
      __int16 v34 = 2080;
      char v35 = "AVAudioEngineGraph.mm";
      __int16 v36 = 1024;
      *(_DWORD *)uint64_t v37 = 2150;
      *(_WORD *)&v37[4] = 2080;
      *(void *)&v37[6] = "Connect";
      *(_WORD *)&v37[14] = 2080;
      *(void *)&v37[16] = "inSrcImpl && inDestImpl";
      _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inSrcImpl && inDestImpl");
  }
  uint64_t v25 = (*(uint64_t (**)(AVAudioNodeImplBase *, uint64_t))(*(void *)v21 + 240))(v21, v28);
  uint64_t v26 = (*(uint64_t (**)(AVAudioNodeImplBase *, uint64_t))(*(void *)v23 + 240))(v23, v29);
  return AVAudioEngineGraph::_Connect(v19, v21, v23, v25, v26, a6) == 0;
}

void AVAudioEngineImpl::Pause(AVAudioEngineImpl *this, NSError **a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (std::recursive_mutex *)((char *)this + 112);
  int v5 = (char *)this + 176;
  std::lock[abi:ne180100]<std::recursive_mutex,caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>((std::recursive_mutex *)((char *)this + 112), (uint64_t)this + 176);
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  BOOL v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)this;
    uint64_t v8 = (unsigned __int8 *)*((void *)this + 1);
    if (v8)
    {
      int v9 = v8[208];
      v8 += 184;
      if (v9) {
        uint64_t v8 = (unsigned __int8 *)this + 64;
      }
      LODWORD(v8) = *v8;
    }
    int v12 = 136315906;
    __int16 v13 = "AVAudioEngine.mm";
    __int16 v14 = 1024;
    int v15 = 1216;
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    __int16 v18 = 1024;
    int v19 = (int)v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: pause, was running %d", (uint8_t *)&v12, 0x22u);
  }
  uint64_t v10 = (AVAudioNodeImplBase **)*((void *)this + 1);
  if (v10)
  {
    uint64_t v11 = AVAudioEngineGraph::Stop(v10, a2);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 1218, "Pause", "_graph->Stop(outErr)", v11, a2);
  }
  *((unsigned char *)this + 64) = 0;
  caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock((uint64_t)v5);
  std::recursive_mutex::unlock(v4);
}

void sub_19D8A0C00(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_19D8A0DE8(_Unwind_Exception *a1)
{
  caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock(v3);
  std::recursive_mutex::unlock(v2);
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAudioEngineImpl::GetOutputNode(AVAudioEngineImpl *this)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(*((void *)this + 1) + 187);
    int v4 = [*((id *)this + 5) isInManualRenderingMode];
    if (v4) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (v4 == (v3 != 0)) {
        return *((void *)this + 5);
      }
    }
    else if ([v2 manualRenderingMode] == *(void *)(*((void *)this + 1) + 192))
    {
      return *((void *)this + 5);
    }
  }
  AVAudioEngineImpl::UpdateOutputNode((uint64_t)this, 1);
  if (!*((void *)this + 5))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    BOOL v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      int v9 = "AVAEInternal.h";
      __int16 v10 = 1024;
      int v11 = 71;
      __int16 v12 = 2080;
      __int16 v13 = "AVAudioEngine.mm";
      __int16 v14 = 1024;
      int v15 = 665;
      __int16 v16 = 2080;
      uint64_t v17 = "GetOutputNode";
      __int16 v18 = 2080;
      int v19 = "_outputNode != nil";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_outputNode != nil");
  }
  return *((void *)this + 5);
}

void sub_19D8A1084(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A10E0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

AVAudioFormat *AVAudioEngineImpl::GetManualRenderingFormat(AVAudioEngineImpl *this)
{
  if (*(unsigned char *)(*((void *)this + 1) + 187))
  {
    OutputNode = (void *)AVAudioEngineImpl::GetOutputNode(this);
    return (AVAudioFormat *)[OutputNode outputFormatForBus:0];
  }
  else
  {
    return +[AVAudioFormat formatWithInvalidSampleRateAndChannelCount];
  }
}

void sub_19D8A1264(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v2);
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A13D4(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A1788(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A206C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::recursive_mutex *a13, std::recursive_mutex *a14, FILE *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,char a36)
{
}

void sub_19D8A216C(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A21E0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A2244(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A22A4(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A2308(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A2454(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAudioEngineImpl::Initialize(AVAudioEngineImpl *this, NSError **a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  int v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)this;
    int v9 = 136315650;
    __int16 v10 = "AVAudioEngine.mm";
    __int16 v11 = 1024;
    int v12 = 1151;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: initialize", (uint8_t *)&v9, 0x1Cu);
  }
  BOOL v6 = (AVAudioEngineGraph *)*((void *)this + 1);
  if (!*((unsigned char *)v6 + 187))
  {
    uint64_t v7 = *((void *)this + 7);
    if (v7)
    {
      (*(void (**)(void))(*(void *)v7 + 56))(*((void *)this + 7));
      BOOL v6 = (AVAudioEngineGraph *)*((void *)this + 1);
    }
  }
  return AVAudioEngineGraph::Initialize(v6, a2);
}

void sub_19D8A27EC(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A30CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::recursive_mutex *a11, std::recursive_mutex *a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_19D8A39D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::recursive_mutex *a11, std::recursive_mutex *a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_19D8A41CC(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v2);
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A4840(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A48D0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A498C(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A4A2C(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A4BD4(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A4DBC(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A4E18(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A4E90(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D8A4F04(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<AVAudioEngineGraph>::reset[abi:ne180100](uint64_t *result)
{
  uint64_t v1 = *result;
  void *result = 0;
  if (v1)
  {
    uint64_t v2 = (std::recursive_mutex *)(*(void *)v1 + 112);
    std::recursive_mutex::lock(v2);
    uint64_t v21 = 0;
    AVAudioEngineGraph::Stop((AVAudioNodeImplBase **)v1, &v21);
    std::unique_ptr<AVAEGraphStateTracker>::reset[abi:ne180100]((uint64_t *)(v1 + 216), 0);
    int v3 = *(void **)(v1 + 80);
    if (v3)
    {
      if (v3[1] && v3[2])
      {
        MusicSequenceSetAudioGraph();
        v3[1] = 0;
      }
      uint64_t v4 = v3[2];
      if (v4) {
        MEMORY[0x19F3ABB30](v4, 0x80C40C96DFCA5);
      }
      v3[2] = 0;
      uint64_t v5 = v3[3];
      if (v5) {
        MEMORY[0x19F3ABB30](v5, 0x80C40803F642BLL);
      }
      v3[3] = 0;
      MEMORY[0x19F3ABB30](v3, 0x20C40769AC3DALL);
    }
    *(void *)(v1 + 80) = 0;
    BOOL v6 = *(void **)(v1 + 8);
    if (v6)
    {
      int v9 = (void *)*v6;
      uint64_t v7 = v6 + 1;
      uint64_t v8 = v9;
      if (v9 != v7)
      {
        do
        {
          uint64_t v10 = v8[5];
          if (v10) {
            (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
          }
          __int16 v11 = (void *)v8[1];
          if (v11)
          {
            do
            {
              int v12 = v11;
              __int16 v11 = (void *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              int v12 = (void *)v8[2];
              BOOL v13 = *v12 == (void)v8;
              uint64_t v8 = v12;
            }
            while (!v13);
          }
          uint64_t v8 = v12;
        }
        while (v12 != v7);
      }
    }
    uint64_t v14 = *(id **)(v1 + 32);
    uint64_t v15 = *(id **)(v1 + 40);
    while (v14 != v15)
      id v16 = *v14++;
    uint64_t v17 = *(void *)(v1 + 8);
    if (v17)
    {
      std::__tree<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::__map_value_compare<AUGraphNodeBaseV3 *,std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::less<AUGraphNodeBaseV3 *>,true>,std::allocator<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>>>::destroy(*(void **)(v17 + 8));
      MEMORY[0x19F3ABB30](v17, 0x1020C4062D53EE8);
    }
    std::recursive_mutex::unlock(v2);
    std::unique_ptr<AVAEGraphStateTracker>::reset[abi:ne180100]((uint64_t *)(v1 + 216), 0);
    std::__list_imp<AUGraphConnection>::clear((void *)(v1 + 160));
    std::__list_imp<AUGraphConnection>::clear((void *)(v1 + 136));
    __int16 v18 = *(void **)(v1 + 88);
    if (v18)
    {
      *(void *)(v1 + 96) = v18;
      operator delete(v18);
    }
    int v19 = *(void **)(v1 + 56);
    if (v19)
    {
      *(void *)(v1 + 64) = v19;
      operator delete(v19);
    }
    uint64_t v20 = *(void **)(v1 + 32);
    if (v20)
    {
      *(void *)(v1 + 40) = v20;
      operator delete(v20);
    }
    JUMPOUT(0x19F3ABB30);
  }
  return result;
}

void sub_19D8A5584(_Unwind_Exception *a1)
{
  std::unique_ptr<AVAEBlock<AVAudioEngineManualRenderingStatus({block_pointer})(unsigned int,AudioBufferList *,int *)>>::reset[abi:ne180100](v3, 0);
  uint64_t v5 = *(void *)(v1 + 56);
  *(void *)(v1 + 56) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  std::unique_ptr<AVAudioEngineGraph>::reset[abi:ne180100](v2);
  MEMORY[0x19F3ABB30](v1, 0x10A0C40461284F8);
  _Unwind_Resume(a1);
}

void ___ZN17AVAudioEngineImplC2EP13AVAudioEngine_block_invoke()
{
}

void sub_19D8A570C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
  MEMORY[0x19F3ABB30](v10, 0x10A0C404FA34CF3);
  _Unwind_Resume(a1);
}

uint64_t AVAudioEngineImpl::SetInputNodeRenderCallback(AVAudioNodeImplBase **a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = (std::recursive_mutex *)((char *)*a1 + 112);
  std::recursive_mutex::lock(v6);
  if (*((unsigned char *)a1 + 187)
    && !*((unsigned char *)a1 + 185)
    && (uint64_t NodeFromMap = AVAudioEngineGraph::GetNodeFromMap((AVAudioEngineGraph *)a1, a1[2])) != 0)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)NodeFromMap + 160))(NodeFromMap, a2, a3);
  }
  else
  {
    uint64_t v7 = 0;
  }
  std::recursive_mutex::unlock(v6);
  return v7;
}

void sub_19D8A57E8(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ___ZN17AVAudioEngineImpl26IOUnitConfigurationChangedEv_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  int v2 = *((_DWORD *)v1 + 20) - 1;
  *((_DWORD *)v1 + 20) = v2;
  if (!v2)
  {
    id v3 = (id)*v1;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (id)*v1;
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVAudioEngine.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1434;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v5;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: iounit configuration changed > posting notification", buf, 0x1Cu);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVAudioEngineConfigurationChangeNotification", *v1);
    atomic_store(0, (unsigned __int8 *)v1 + 96);
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    BOOL v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
    {
      id v7 = (id)*v1;
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVAudioEngine.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1439;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v7;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: iounit configuration changed < posted notification", buf, 0x1Cu);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3052000000;
    *(void *)&buf[24] = __Block_byref_object_copy__8738;
    __int16 v11 = __Block_byref_object_dispose__8739;
    id v12 = (id)*v1;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN17AVAudioEngineImpl26IOUnitConfigurationChangedEv_block_invoke_176;
    block[3] = &unk_1E5965E38;
    block[4] = buf;
    dispatch_async(global_queue, block);
    _Block_object_dispose(buf, 8);
  }
}

void ___ZN17AVAudioEngineImpl26IOUnitConfigurationChangedEv_block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(uint64_t **)(a1 + 32);
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  int v2 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *v1;
    int v10 = 136315650;
    __int16 v11 = "AVAudioEngine.mm";
    __int16 v12 = 1024;
    int v13 = 1453;
    __int16 v14 = 2048;
    uint64_t v15 = v3;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: iounit configuration changed > setting flag", (uint8_t *)&v10, 0x1Cu);
  }
  atomic_store(1u, (unsigned __int8 *)v1 + 96);
  std::recursive_mutex::lock((std::recursive_mutex *)(v1 + 14));
  uint64_t v4 = v1[1];
  if (v4)
  {
    int v5 = *(unsigned __int8 *)(v4 + 208);
    BOOL v6 = (unsigned char *)(v4 + 184);
    if (v5) {
      BOOL v6 = v1 + 8;
    }
    if (*v6)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      id v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *v1;
        int v10 = 136315650;
        __int16 v11 = "AVAudioEngine.mm";
        __int16 v12 = 1024;
        int v13 = 1458;
        __int16 v14 = 2048;
        uint64_t v15 = v8;
        _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: iounit configuration changed > stopping the engine", (uint8_t *)&v10, 0x1Cu);
      }
      AVAudioEngineImpl::Stop((AVAudioEngineImpl *)v1, 0);
    }
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)(v1 + 14));
  ++*((_DWORD *)v1 + 20);
  dispatch_time_t v9 = dispatch_time(0, 100000000);
  dispatch_after(v9, (dispatch_queue_t)v1[9], (dispatch_block_t)v1[11]);
}

void sub_19D8A5C80(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__8738(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__8739(uint64_t a1)
{
}

void ___ZN17AVAudioEngineImpl26IOUnitConfigurationChangedEv_block_invoke_176(uint64_t a1)
{
}

void ___ZN17AVAudioEngineImpl13IOUnitStoppedEv_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(uint64_t **)(a1 + 32);
  std::recursive_mutex::lock((std::recursive_mutex *)(v1 + 14));
  int v2 = (unsigned __int8 *)v1[1];
  if (v2)
  {
    if (v2[208]) {
      uint64_t v3 = (unsigned __int8 *)(v1 + 8);
    }
    else {
      uint64_t v3 = v2 + 184;
    }
    int v4 = *v3;
    if (v2[232]) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4 == 0;
    }
    if (!v5)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      BOOL v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *v1;
        int v8 = 136315650;
        dispatch_time_t v9 = "AVAudioEngine.mm";
        __int16 v10 = 1024;
        int v11 = 1481;
        __int16 v12 = 2048;
        uint64_t v13 = v7;
        _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: iounit stopped unexpectedly > pausing the engine", (uint8_t *)&v8, 0x1Cu);
      }
      AVAudioEngineImpl::Pause((AVAudioEngineImpl *)v1, 0);
      int v2 = (unsigned __int8 *)v1[1];
    }
    v2[232] = 0;
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)(v1 + 14));
}

void sub_19D8A5E1C(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAudioEngineImpl::IsIOUnitRunning(AVAudioEngineImpl *this)
{
  uint64_t v1 = (unsigned __int8 *)*((void *)this + 1);
  if (v1[187])
  {
    int v2 = v1[208];
    uint64_t v3 = v1 + 184;
    if (v2) {
      uint64_t v3 = (unsigned __int8 *)this + 64;
    }
    return *v3 != 0;
  }
  else
  {
    uint64_t result = *((void *)this + 7);
    if (result) {
      return (*(uint64_t (**)(void))(*(void *)result + 48))();
    }
  }
  return result;
}

void *AVAudioEngineImpl::LastRenderErrorInChain(AVAudioEngineImpl *this, AVAudioNodeImplBase *a2, AVAudioNodeImplBase *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *(unsigned char *)this = 0;
    *((unsigned char *)this + 16) = 0;
    BOOL v5 = (AVAudioEngineGraph *)a2;
    BOOL v6 = a3;
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      __int16 v15 = 2080;
      *(void *)uint64_t v16 = "AVAudioEngineGraph.mm";
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = 4286;
      __int16 v17 = 2080;
      __int16 v18 = "LastRenderErrorInChain";
      __int16 v19 = 2080;
      uint64_t v20 = "startNodeImpl";
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "startNodeImpl");
    *(unsigned char *)this = 0;
    *((unsigned char *)this + 16) = 0;
    BOOL v5 = (AVAudioEngineGraph *)a2;
    BOOL v6 = 0;
  }
  uint64_t NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(v5, v6);
  uint64_t v9 = NodeFromMap;
  if (NodeFromMap)
  {
    uint64_t v10 = NodeFromMap + 32;
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 71;
      __int16 v15 = 2080;
      *(void *)uint64_t v16 = "AVAudioEngineGraph.mm";
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = 4291;
      __int16 v17 = 2080;
      __int16 v18 = "LastRenderErrorInChain";
      __int16 v19 = 2080;
      uint64_t v20 = "startNode";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "startNode");
    uint64_t v10 = 32;
  }
  BOOL v12 = ((*(_DWORD *)v10 >> 1) & 1) == 0;
  *(void *)buf = &unk_1EEFA37B0;
  *(void *)&buf[8] = this;
  *(void *)&void v16[4] = buf;
  AUGraphParser::TraverseGraphNodes(v12, 1, v9, 0, (uint64_t)buf);
  return std::__function::__value_func<ETraversalStatus ()(AUGraphNodeBaseV3 &,AUGraphConnection *)>::~__value_func[abi:ne180100](buf);
}

void sub_19D8A615C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

void AVAudioEngineImpl::InstallTapOnNode(char **a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  BOOL v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *a1;
    *(_DWORD *)buf = 136316674;
    uint64_t v47 = "AVAudioEngine.mm";
    __int16 v48 = 1024;
    int v49 = 1533;
    __int16 v50 = 2048;
    id v51 = v13;
    __int16 v52 = 2048;
    *(void *)uint64_t v53 = a2;
    *(_WORD *)&v53[8] = 2048;
    *(void *)&v53[10] = a3;
    *(_WORD *)&v53[18] = 1024;
    *(_DWORD *)&v53[20] = a4;
    __int16 v54 = 2080;
    uint64_t v55 = objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
    _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: install tap on node %p, bus%lu, bufferSize %d, format: %s", buf, 0x40u);
  }
  uint64_t v14 = (AVAudioEngineGraph *)a1[1];
  if (!a2)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v15 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v47 = "AVAEInternal.h";
      __int16 v48 = 1024;
      int v49 = 71;
      __int16 v50 = 2080;
      id v51 = "AVAudioEngineGraph.mm";
      __int16 v52 = 1024;
      *(_DWORD *)uint64_t v53 = 2012;
      *(_WORD *)&v53[4] = 2080;
      *(void *)&v53[6] = "InstallTapOnNode";
      *(_WORD *)&v53[14] = 2080;
      *(void *)&v53[16] = "inAVNode";
      _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inAVNode");
  }
  uint64_t v16 = (AVAudioNodeImplBase *)[a2 impl];
  __int16 v17 = (std::recursive_mutex *)(*(void *)v14 + 112);
  std::recursive_mutex::lock(v17);
  if (!AVAudioEngineGraph::IsNodeInGraph(v14, v16))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v18 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v47 = "AVAEInternal.h";
      __int16 v48 = 1024;
      int v49 = 71;
      __int16 v50 = 2080;
      id v51 = "AVAudioEngineGraph.mm";
      __int16 v52 = 1024;
      *(_DWORD *)uint64_t v53 = 2017;
      *(_WORD *)&v53[4] = 2080;
      *(void *)&v53[6] = "InstallTapOnNode";
      *(_WORD *)&v53[14] = 2080;
      *(void *)&v53[16] = "IsNodeInGraph(inImpl)";
      _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsNodeInGraph(inImpl)");
  }
  uint64_t NodeFromMap = (AVAudioEngineGraph *)AVAudioEngineGraph::GetNodeFromMap(v14, *((AVAudioNodeImplBase **)v14 + 2));
  uint64_t v20 = AVAudioEngineGraph::GetNodeFromMap(v14, v16);
  if (*((unsigned char *)v14 + 185) && NodeFromMap)
  {
    char v21 = (*(uint64_t (**)(AVAudioEngineGraph *))(*(void *)NodeFromMap + 136))(NodeFromMap);
    char v22 = a5 ? v21 : 1;
    if (v22 & 1) == 0 && (*(unsigned char *)(v20 + 32))
    {
      __int16 v23 = (void *)(*(uint64_t (**)(void, void))(**((void **)NodeFromMap + 3) + 72))(*((void *)NodeFromMap + 3), 0);
      [a5 sampleRate];
      double v25 = v24;
      [v23 sampleRate];
      if (v25 != v26)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        uint64_t v27 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v47 = "AVAEInternal.h";
          __int16 v48 = 1024;
          int v49 = 71;
          __int16 v50 = 2080;
          id v51 = "AVAudioEngineGraph.mm";
          __int16 v52 = 1024;
          *(_DWORD *)uint64_t v53 = 2031;
          *(_WORD *)&v53[4] = 2080;
          *(void *)&v53[6] = "InstallTapOnNode";
          *(_WORD *)&v53[14] = 2080;
          *(void *)&v53[16] = "format.sampleRate == inputHWFormat.sampleRate";
          _os_log_impl(&dword_19D794000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "format.sampleRate == inputHWFormat.sampleRate");
      }
    }
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, void *, uint64_t))(*(void *)v20 + 80))(v20, a3, a4, a5, a6) == -10868)
  {
    unsigned __int8 v28 = atomic_load((unsigned __int8 *)(*(void *)v14 + 96));
    if (v28)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      int v33 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v47 = "AVAudioEngineGraph.mm";
        __int16 v48 = 1024;
        int v49 = 2037;
        _os_log_impl(&dword_19D794000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create tap, config change pending!", buf, 0x12u);
      }
      goto LABEL_48;
    }
    [MEMORY[0x1E4F1CA00] raise:@"com.apple.coreaudio.avfaudio", @"Failed to create tap due to format mismatch, %@", a5 format];
  }
  if (!*((unsigned char *)v14 + 185)
    || !NodeFromMap
    || (*(unsigned char *)(v20 + 32) & 2) != 0
    || AUGraphParser::IsNodeConnectedToTarget(0, v20, (void *)v14 + 11))
  {
LABEL_48:
    std::recursive_mutex::unlock(v17);
    return;
  }
  v44[0] = v44;
  v44[1] = v44;
  uint64_t v45 = 0;
  AVAudioEngineGraph::GetPendingConnection((uint64_t)v14, 1, v20, v44);
  if (*(unsigned char *)(*(void *)(v20 + 24) + 48)) {
    goto LABEL_55;
  }
  uint64_t v29 = *(void **)(v20 + 48);
  id v30 = *(void **)(v20 + 56);
  if (v29 == v30)
  {
    int v31 = 0;
  }
  else
  {
    int v31 = 0;
    do
    {
      if (*v29++) {
        ++v31;
      }
    }
    while (v29 != v30);
  }
  if (v31 || v45 != 0)
  {
LABEL_55:
    AVAudioEngineGraph::SetNodesToPullEnabled((uint64_t)v14, 0);
    uint64_t active = AUGraphParser::InitializeActiveNodesInInputChain((AVAudioNodeImplBase **)v14, NodeFromMap, v35);
    if (!active) {
      goto LABEL_67;
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)v20 + 88))(v20, a3);
    uint64_t v37 = (void *)[NSString stringWithFormat:@"Failed to initialize active nodes in input chain! Engine@%p, err = %d", **(void **)v14, active];
    unsigned __int8 v38 = atomic_load((unsigned __int8 *)(*(void *)v14 + 96));
    if ((v38 & 1) == 0)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      uint64_t v39 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = [v37 UTF8String];
        *(_DWORD *)buf = 136315650;
        uint64_t v47 = "AVAudioEngineGraph.mm";
        __int16 v48 = 1024;
        int v49 = 2086;
        __int16 v50 = 2080;
        id v51 = (char *)v40;
        _os_log_impl(&dword_19D794000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"%s", objc_msgSend(v37, "UTF8String"));
      goto LABEL_67;
    }
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v41 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = [v37 UTF8String];
      *(_DWORD *)buf = 136315650;
      uint64_t v47 = "AVAudioEngineGraph.mm";
      __int16 v48 = 1024;
      int v49 = 2083;
      __int16 v50 = 2080;
      id v51 = (char *)v42;
      _os_log_impl(&dword_19D794000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d %s, config change pending", buf, 0x1Cu);
    }
  }
  uint64_t active = 0;
LABEL_67:
  std::__list_imp<AUGraphConnection>::clear(v44);
  std::recursive_mutex::unlock(v17);
  if (active)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v43 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v47 = "AVAEInternal.h";
      __int16 v48 = 1024;
      int v49 = 104;
      __int16 v50 = 2080;
      id v51 = "AVAudioEngine.mm";
      __int16 v52 = 1024;
      *(_DWORD *)uint64_t v53 = 1534;
      *(_WORD *)&v53[4] = 2080;
      *(void *)&v53[6] = "InstallTapOnNode";
      *(_WORD *)&v53[14] = 2080;
      *(void *)&v53[16] = "_graph->InstallTapOnNode(inNode, bus, bufferSize, format, tapBlock)";
      __int16 v54 = 1024;
      LODWORD(v55) = active;
      _os_log_impl(&dword_19D794000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", active);
  }
}

void sub_19D8A6B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__list_imp<AUGraphConnection>::clear((uint64_t *)va);
  std::recursive_mutex::unlock(v4);
  _Unwind_Resume(a1);
}

void AVAudioEngineImpl::RemoveTapOnNode(AVAudioEngineImpl *this, AVAudioNode *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  BOOL v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(char **)this;
    *(_DWORD *)buf = 136316162;
    double v25 = "AVAudioEngine.mm";
    __int16 v26 = 1024;
    int v27 = 1538;
    __int16 v28 = 2048;
    uint64_t v29 = v7;
    __int16 v30 = 2048;
    *(void *)int v31 = a2;
    *(_WORD *)&v31[8] = 2048;
    *(void *)&v31[10] = a3;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: remove tap from node %p, bus%lu", buf, 0x30u);
  }
  uint64_t v8 = *((void *)this + 1);
  if (!a2)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      double v25 = "AVAEInternal.h";
      __int16 v26 = 1024;
      int v27 = 71;
      __int16 v28 = 2080;
      uint64_t v29 = "AVAudioEngineGraph.mm";
      __int16 v30 = 1024;
      *(_DWORD *)int v31 = 2099;
      *(_WORD *)&v31[4] = 2080;
      *(void *)&v31[6] = "RemoveTapOnNode";
      *(_WORD *)&unsigned char v31[14] = 2080;
      *(void *)&v31[16] = "inAVNode";
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inAVNode");
  }
  uint64_t v10 = [(AVAudioNode *)a2 impl];
  int v11 = (std::recursive_mutex *)(*(void *)v8 + 112);
  std::recursive_mutex::lock(v11);
  if (!AVAudioEngineGraph::IsNodeInGraph((AVAudioEngineGraph *)v8, v10))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    BOOL v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      double v25 = "AVAEInternal.h";
      __int16 v26 = 1024;
      int v27 = 71;
      __int16 v28 = 2080;
      uint64_t v29 = "AVAudioEngineGraph.mm";
      __int16 v30 = 1024;
      *(_DWORD *)int v31 = 2104;
      *(_WORD *)&v31[4] = 2080;
      *(void *)&v31[6] = "RemoveTapOnNode";
      *(_WORD *)&unsigned char v31[14] = 2080;
      *(void *)&v31[16] = "IsNodeInGraph(inImpl)";
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsNodeInGraph(inImpl)");
  }
  uint64_t NodeFromMap = (AVAudioEngineGraph *)AVAudioEngineGraph::GetNodeFromMap((AVAudioEngineGraph *)v8, *(AVAudioNodeImplBase **)(v8 + 16));
  uint64_t v14 = (unsigned char *)AVAudioEngineGraph::GetNodeFromMap((AVAudioEngineGraph *)v8, v10);
  __int16 v15 = v14;
  __int16 v17 = *(void **)(v8 + 88);
  uint64_t v16 = *(void **)(v8 + 96);
  if (v17 == v16)
  {
LABEL_21:
    __int16 v18 = *(void **)(v8 + 96);
  }
  else
  {
    __int16 v18 = *(void **)(v8 + 88);
    while ((unsigned char *)*v18 != v14)
    {
      if (++v18 == v16) {
        goto LABEL_21;
      }
    }
  }
  if (*(unsigned char *)(v8 + 185)) {
    BOOL v19 = NodeFromMap == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19 || (v14[32] & 2) != 0 || v17 == v16 || v16 == v18)
  {
    (*(void (**)(unsigned char *, uint64_t))(*(void *)v14 + 88))(v14, a3);
    goto LABEL_40;
  }
  AVAudioEngineGraph::SetNodesToPullEnabled(v8, 0);
  (*(void (**)(unsigned char *, uint64_t))(*(void *)v15 + 88))(v15, a3);
  uint64_t active = AUGraphParser::InitializeActiveNodesInInputChain((AVAudioNodeImplBase **)v8, NodeFromMap, v20);
  if (!active)
  {
LABEL_40:
    std::recursive_mutex::unlock(v11);
    return;
  }
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  char v22 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316674;
    double v25 = "AVAEInternal.h";
    __int16 v26 = 1024;
    int v27 = 104;
    __int16 v28 = 2080;
    uint64_t v29 = "AVAudioEngineGraph.mm";
    __int16 v30 = 1024;
    *(_DWORD *)int v31 = 2133;
    *(_WORD *)&v31[4] = 2080;
    *(void *)&v31[6] = "RemoveTapOnNode";
    *(_WORD *)&unsigned char v31[14] = 2080;
    *(void *)&v31[16] = "err = AUGraphParser::InitializeActiveNodesInInputChain(ThisGraph, *inputNode)";
    __int16 v32 = 1024;
    int v33 = active;
    _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", active);
  std::recursive_mutex::unlock(v11);
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  __int16 v23 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316674;
    double v25 = "AVAEInternal.h";
    __int16 v26 = 1024;
    int v27 = 104;
    __int16 v28 = 2080;
    uint64_t v29 = "AVAudioEngine.mm";
    __int16 v30 = 1024;
    *(_DWORD *)int v31 = 1539;
    *(_WORD *)&v31[4] = 2080;
    *(void *)&v31[6] = "RemoveTapOnNode";
    *(_WORD *)&unsigned char v31[14] = 2080;
    *(void *)&v31[16] = "_graph->RemoveTapOnNode(inNode, bus)";
    __int16 v32 = 1024;
    int v33 = active;
    _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", active);
}

void sub_19D8A71BC(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void AVAudioEngineImpl::NodeRenderingStateChanged(AVAudioEngineImpl *this, AVAudioNodeImplBase *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = (std::recursive_mutex *)(*(void *)this + 112);
  std::recursive_mutex::lock(v4);
  if (!AVAudioEngineGraph::IsNodeInGraph(this, a2))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    BOOL v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v10 = "AVAEInternal.h";
      __int16 v11 = 1024;
      int v12 = 71;
      __int16 v13 = 2080;
      uint64_t v14 = "AVAudioEngineGraph.mm";
      __int16 v15 = 1024;
      int v16 = 3230;
      __int16 v17 = 2080;
      __int16 v18 = "NodeRenderingStateChanged";
      __int16 v19 = 2080;
      uint64_t v20 = "IsNodeInGraph(inImpl)";
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsNodeInGraph(inImpl)");
  }
  uint64_t NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(this, a2);
  uint64_t v8 = (void *)*((void *)this + 7);
  uint64_t v7 = (void *)*((void *)this + 8);
  if (v8 != v7)
  {
    while (*v8 != NodeFromMap)
    {
      if (++v8 == v7)
      {
        uint64_t v8 = (void *)*((void *)this + 8);
        break;
      }
    }
  }
  if (v8 != v7) {
    AVAudioEngineGraph::MonitorState(this);
  }
  std::recursive_mutex::unlock(v4);
}

void sub_19D8A73A4(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAudio3DMixingImpl::SetOcclusion(AVAudio3DMixingImpl *this, float a2)
{
  if (fabsf(a2) == INFINITY) {
    a2 = -100.0;
  }
  if (*((float *)this + 15) == a2) {
    return 0;
  }
  float v2 = 0.0;
  if (a2 < 0.0) {
    float v2 = a2;
  }
  if (a2 <= -100.0) {
    float v3 = -100.0;
  }
  else {
    float v3 = v2;
  }
  *((float *)this + 15) = v3;
  int v4 = *(uint64_t (**)(__n128))(*(void *)[*((id *)this + 9) impl] + 128);
  v5.n128_f32[0] = v3;

  return v4(v5);
}

uint64_t AVAudio3DMixingImpl::SetObstruction(AVAudio3DMixingImpl *this, float a2)
{
  if (fabsf(a2) == INFINITY) {
    a2 = -100.0;
  }
  if (*((float *)this + 14) == a2) {
    return 0;
  }
  float v2 = 0.0;
  if (a2 < 0.0) {
    float v2 = a2;
  }
  if (a2 <= -100.0) {
    float v3 = -100.0;
  }
  else {
    float v3 = v2;
  }
  *((float *)this + 14) = v3;
  int v4 = *(uint64_t (**)(__n128))(*(void *)[*((id *)this + 9) impl] + 128);
  v5.n128_f32[0] = v3;

  return v4(v5);
}

uint64_t AVAudio3DMixingImpl::SetPosition(AVAudio3DMixingImpl *this, AVAudio3DPoint a2)
{
  if (*((float *)this + 11) == a2.x && *((float *)this + 12) == a2.y && *((float *)this + 13) == a2.z) {
    return 0;
  }
  *(AVAudio3DPoint *)((char *)this + 44) = a2;
  return AVAudio3DMixingImpl::RecalculateAndSetSphericalCoordsOnMixer(this);
}

uint64_t AVAudio3DMixingImpl::RecalculateAndSetSphericalCoordsOnMixer(AVAudio3DMixingImpl *this)
{
  float v3 = *((float *)this + 11);
  float v2 = *((float *)this + 12);
  float v4 = *((float *)this + 13);
  if (*((_DWORD *)this + 7) != 3)
  {
    __n128 v5 = (float *)[*((id *)this + 9) impl];
    float v3 = v3 - v5[66];
    float v2 = v2 - v5[67];
    float v4 = v4 - v5[68];
  }
  float v6 = sqrtf((float)((float)(v2 * v2) + (float)(v3 * v3)) + (float)(v4 * v4));
  float v7 = 0.0;
  float v8 = 0.0;
  if (v6 > 0.0)
  {
    float v7 = atan2f(v3, -v4) * 180.0 * 0.318309873;
    float v9 = hypotf(v3, v4);
    float v10 = atan2f(v2, v9) * 180.0 * 0.318309873;
    if (v10 <= 90.0) {
      float v8 = v10;
    }
    else {
      float v8 = 180.0 - v10;
    }
    if (v8 < -90.0) {
      float v8 = -180.0 - v8;
    }
  }
  uint64_t v11 = *((unsigned int *)this + 16);
  uint64_t v12 = [*((id *)this + 9) impl];
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, float))(*(void *)v12 + 128))(v12, 0, 1, v11, v7);
  uint64_t v13 = *((unsigned int *)this + 16);
  uint64_t v14 = [*((id *)this + 9) impl];
  LODWORD(v11) = v11 & (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, float))(*(void *)v14 + 128))(v14, 1, 1, v13, v8);
  __int16 v15 = (void *)*((void *)this + 9);
  uint64_t v16 = *((unsigned int *)this + 16);
  uint64_t v17 = [v15 impl];
  return v11 & (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, float))(*(void *)v17 + 128))(v17, 2, 1, v16, v6);
}

uint64_t AVAudio3DMixingImpl::SetReverbBlend(AVAudio3DMixingImpl *this, float a2)
{
  if (fabsf(a2) == INFINITY) {
    a2 = 0.0;
  }
  if (*((float *)this + 10) == a2) {
    return 0;
  }
  float v2 = 1.0;
  if (a2 < 1.0) {
    float v2 = a2;
  }
  BOOL v3 = a2 > 0.0;
  float v4 = 0.0;
  if (v3) {
    float v4 = v2;
  }
  *((float *)this + 10) = v4;
  float v5 = v4 * 100.0;
  float v6 = *(uint64_t (**)(__n128))(*(void *)[*((id *)this + 9) impl] + 128);
  v7.n128_f32[0] = v5;

  return v6(v7);
}

uint64_t AVAudio3DMixingImpl::SetRate(AVAudio3DMixingImpl *this, float a2)
{
  if (fabsf(a2) == INFINITY) {
    a2 = 0.5;
  }
  if (*((float *)this + 9) == a2) {
    return 0;
  }
  float v2 = 2.0;
  if (a2 < 2.0) {
    float v2 = a2;
  }
  if (a2 <= 0.5) {
    float v3 = 0.5;
  }
  else {
    float v3 = v2;
  }
  *((float *)this + 9) = v3;
  float v4 = *(uint64_t (**)(__n128))(*(void *)[*((id *)this + 9) impl] + 128);
  v5.n128_f32[0] = v3;

  return v4(v5);
}

uint64_t AVAudio3DMixingImpl::SetPointSourceInHeadMode(AVAudio3DMixingImpl *this, unsigned int a2)
{
  if (a2 <= 1)
  {
    uint64_t v8 = v2;
    uint64_t v9 = v3;
    if (*((_DWORD *)this + 8) != a2)
    {
      *((_DWORD *)this + 8) = a2;
      BOOL v7 = a2 == 1;
      uint64_t v5 = [*((id *)this + 9) impl];
      (*(void (**)(uint64_t, uint64_t, uint64_t, void, BOOL *, uint64_t))(*(void *)v5 + 144))(v5, 3103, 1, *((unsigned int *)this + 16), &v7, 4);
    }
  }
  return 0;
}

uint64_t AVAudio3DMixingImpl::SetSourceMode(AVAudio3DMixingImpl *this, unsigned int a2)
{
  uint64_t result = 0;
  if (a2 <= 3 && *((_DWORD *)this + 7) != a2)
  {
    *((_DWORD *)this + 7) = a2;
    if (a2 - 1 >= 3) {
      unsigned int v4 = 0;
    }
    else {
      unsigned int v4 = a2;
    }
    unsigned int v7 = v4;
    uint64_t v5 = [*((id *)this + 9) impl];
    int v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, unsigned int *, uint64_t))(*(void *)v5 + 144))(v5, 3005, 1, *((unsigned int *)this + 16), &v7, 4);
    return v6 & AVAudio3DMixingImpl::RecalculateAndSetSphericalCoordsOnMixer(this);
  }
  return result;
}

uint64_t AVAudio3DMixingImpl::SetRenderingAlgorithm(AVAudio3DMixingImpl *this, unsigned int a2)
{
  uint64_t result = 0;
  unsigned int v5 = a2;
  if (a2 <= 7 && *((_DWORD *)this + 6) != a2)
  {
    *((_DWORD *)this + 6) = a2;
    uint64_t v4 = [*((id *)this + 9) impl];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, unsigned int *, uint64_t))(*(void *)v4 + 144))(v4, 3000, 1, *((unsigned int *)this + 16), &v5, 4);
  }
  return result;
}

uint64_t AVAudio3DMixingImpl::SetGain(AVAudio3DMixingImpl *this, float a2)
{
  if (fabsf(a2) == INFINITY) {
    a2 = 0.0;
  }
  if (*((float *)this + 4) == a2) {
    return 0;
  }
  float v2 = 100000.0;
  if (a2 < 100000.0) {
    float v2 = a2;
  }
  BOOL v3 = a2 > 0.0;
  float v4 = 0.0;
  if (v3) {
    float v4 = v2;
  }
  *((float *)this + 4) = v4;
  unsigned int v5 = (void *)*((void *)this + 9);
  if (v4 <= 0.0) {
    float v6 = -120.0;
  }
  else {
    float v6 = log10f(v4) * 20.0;
  }
  uint64_t v8 = *(uint64_t (**)(__n128))(*(void *)[v5 impl] + 128);
  v9.n128_f32[0] = v6;

  return v8(v9);
}

AVAudioConnectionPoint *AVAudio3DMixingImpl::GetMixerConnectionPoint(id *this)
{
  uint64_t v2 = [this[9] impl];
  uint64_t v3 = (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 248))(v2, *((unsigned int *)this + 16));
  id v4 = this[9];

  return +[AVAudioConnectionPoint connectionPointWithNode:v4 bus:v3];
}

BOOL AVAudio3DMixingImpl::IsConnectedToMixer(AVAudioNode **this, AVAudioNode *a2, int a3)
{
  return this[9] == a2 && *((_DWORD *)this + 16) == a3;
}

void AVAudio3DMixingImpl::~AVAudio3DMixingImpl(id *this)
{
  AVAudio3DMixingImpl::~AVAudio3DMixingImpl(this);

  JUMPOUT(0x19F3ABB30);
}

{
  void *v2;
  void *v3;
  void *v4;
  uint64_t *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  BOOL v12;
  uint64_t *v13;

  *this = &unk_1EEFA5780;
  uint64_t v2 = (void *)[this[9] impl];
  uint64_t v3 = v2;
  id v4 = (void *)v2[40];
  if (v4)
  {
    unsigned int v5 = v2 + 40;
    do
    {
      float v6 = v4[4];
      unsigned int v7 = v6 >= (unint64_t)this;
      if (v6 >= (unint64_t)this) {
        uint64_t v8 = v4;
      }
      else {
        uint64_t v8 = v4 + 1;
      }
      if (v7) {
        unsigned int v5 = v4;
      }
      id v4 = (void *)*v8;
    }
    while (*v8);
    if (v5 != v2 + 40 && v5[4] <= (unint64_t)this)
    {
      (*(void (**)(void *, uint64_t, uint64_t, void, double))(*v2 + 128))(v2, 5, 1, *((unsigned int *)this + 16), 0.0);
      __n128 v9 = (uint64_t *)v5[1];
      if (v9)
      {
        do
        {
          float v10 = v9;
          __n128 v9 = (uint64_t *)*v9;
        }
        while (v9);
      }
      else
      {
        uint64_t v11 = v5;
        do
        {
          float v10 = (uint64_t *)v11[2];
          uint64_t v12 = *v10 == (void)v11;
          uint64_t v11 = v10;
        }
        while (!v12);
      }
      if ((uint64_t *)v3[39] == v5) {
        v3[39] = v10;
      }
      uint64_t v13 = (uint64_t *)v3[40];
      --v3[41];
      std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v13, v5);
      operator delete(v5);
    }
  }
  *((_DWORD *)this + 16) = 0;
  this[9] = 0;
}

uint64_t AUInterfaceBase::RemoveV2PropertyListener(AUInterfaceBase *this, AudioUnitPropertyID a2, void (__cdecl *a3)(void *, AudioUnit, AudioUnitPropertyID, AudioUnitScope, AudioUnitElement), void *a4)
{
  unsigned int v7 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(AUInterfaceBase *))(*(void *)this + 272))(this);

  return AudioUnitRemovePropertyListenerWithUserData(v7, a2, a3, a4);
}

uint64_t AUInterfaceBase::AddV2PropertyListener(AUInterfaceBase *this, AudioUnitPropertyID a2, void (__cdecl *a3)(void *, AudioUnit, AudioUnitPropertyID, AudioUnitScope, AudioUnitElement), void *a4)
{
  unsigned int v7 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(AUInterfaceBase *))(*(void *)this + 272))(this);

  return AudioUnitAddPropertyListener(v7, a2, a3, a4);
}

uint64_t AUInterfaceBase::GetV2PropertyInfo(AUInterfaceBase *this, AudioUnitPropertyID a2, AudioUnitScope a3, AudioUnitElement a4, unsigned int *a5, unsigned __int8 *a6)
{
  uint64_t v11 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(AUInterfaceBase *))(*(void *)this + 272))(this);

  return AudioUnitGetPropertyInfo(v11, a2, a3, a4, a5, a6);
}

uint64_t AUInterfaceBase::GetV2Property(AUInterfaceBase *this, AudioUnitPropertyID a2, AudioUnitScope a3, AudioUnitElement a4, void *a5, unsigned int *a6)
{
  uint64_t v11 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(AUInterfaceBase *))(*(void *)this + 272))(this);

  return AudioUnitGetProperty(v11, a2, a3, a4, a5, a6);
}

uint64_t AUInterfaceBase::SetV2Property(AUInterfaceBase *this, AudioUnitPropertyID a2, AudioUnitScope a3, AudioUnitElement a4, const void *a5, UInt32 a6)
{
  uint64_t v11 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(AUInterfaceBase *))(*(void *)this + 272))(this);

  return AudioUnitSetProperty(v11, a2, a3, a4, a5, a6);
}

uint64_t AUInterfaceBase::RemoveRenderCallback(AUInterfaceBase *this, uint64_t a2, const AURenderCallbackStruct *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  inputProcRefCon = a3->inputProcRefCon;
  v7[0] = 0;
  v7[1] = inputProcRefCon;
  uint64_t result = (*(uint64_t (**)(AUInterfaceBase *, uint64_t, uint64_t, uint64_t, void *, uint64_t))(*(void *)this + 232))(this, 23, 1, a2, v7, 16);
  if (result)
  {
    uint64_t v5 = result;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    float v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      __n128 v9 = "AVAEInternal.h";
      __int16 v10 = 1024;
      int v11 = 104;
      __int16 v12 = 2080;
      uint64_t v13 = "AUInterface.mm";
      __int16 v14 = 1024;
      int v15 = 59;
      __int16 v16 = 2080;
      uint64_t v17 = "RemoveRenderCallback";
      __int16 v18 = 2080;
      __int16 v19 = "SetV2Property(kAudioUnitProperty_SetRenderCallback, kAudioUnitScope_Input, element, &rcb, sizeof(rcb))";
      __int16 v20 = 1024;
      int v21 = v5;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    return objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v5);
  }
  return result;
}

uint64_t AUInterfaceBase::AddRenderCallback(AUInterfaceBase *this, uint64_t a2, const AURenderCallbackStruct *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t result = (*(uint64_t (**)(AUInterfaceBase *, uint64_t, uint64_t, uint64_t, const AURenderCallbackStruct *, uint64_t))(*(void *)this + 232))(this, 23, 1, a2, a3, 16);
  if (result)
  {
    uint64_t v4 = result;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      unsigned int v7 = "AVAEInternal.h";
      __int16 v8 = 1024;
      int v9 = 104;
      __int16 v10 = 2080;
      int v11 = "AUInterface.mm";
      __int16 v12 = 1024;
      int v13 = 53;
      __int16 v14 = 2080;
      int v15 = "AddRenderCallback";
      __int16 v16 = 2080;
      uint64_t v17 = "SetV2Property(kAudioUnitProperty_SetRenderCallback, kAudioUnitScope_Input, element, &inRenderCallback, sizeo"
            "f(inRenderCallback))";
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    return objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v4);
  }
  return result;
}

const void **AUInterfaceBaseV3::RemoveRenderObserver(const void **this, const AURenderCallbackStruct *a2)
{
  uint64_t v3 = (const void ***)this[6];
  uint64_t v2 = (const void ***)this[7];
  if (v3 != v2)
  {
    uint64_t v4 = this;
    while (v3[2] != (const void **)a2->inputProc || v3[3] != a2->inputProcRefCon)
    {
      v3 += 4;
      if (v3 == v2) {
        return this;
      }
    }
    if (v3 != v2)
    {
      uint64_t v5 = v3 + 4;
      this = (const void **)[(id)(*((uint64_t (**)(const void **))*this + 38))(this) removeRenderObserver:*v3];
      float v6 = (const void ***)v4[7];
      if (v3 + 4 != v6)
      {
        do
        {
          uint64_t v3 = v5;
          unsigned int v7 = v5[1];
          *(v5 - 4) = *v5;
          v5[1] = 0;
          this = std::unique_ptr<AVAEBlock<void({block_pointer})(unsigned int,AudioTimeStamp const*,unsigned int,long)>>::reset[abi:ne180100](v5 - 3, v7);
          *((_OWORD *)v5 - 1) = *((_OWORD *)v5 + 1);
          v5 += 4;
        }
        while (v5 != v6);
        uint64_t v5 = (const void ***)v4[7];
      }
      for (; v5 != v3; v5 -= 4)
        this = std::unique_ptr<AVAEBlock<void({block_pointer})(unsigned int,AudioTimeStamp const*,unsigned int,long)>>::reset[abi:ne180100](v5 - 3, 0);
      void v4[7] = v3;
    }
  }
  return this;
}

const void **std::unique_ptr<AVAEBlock<void({block_pointer})(unsigned int,AudioTimeStamp const*,unsigned int,long)>>::reset[abi:ne180100](const void ***a1, const void **a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    AVAEBlock<void({block_pointer})(unsigned int,AudioTimeStamp const*,unsigned int,long)>::~AVAEBlock(result);
    JUMPOUT(0x19F3ABB30);
  }
  return result;
}

const void **AVAEBlock<void({block_pointer})(unsigned int,AudioTimeStamp const*,unsigned int,long)>::~AVAEBlock(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    _Block_release(v2);
    *a1 = 0;
  }
  return a1;
}

void AUInterfaceBaseV3::AddRenderObserver(AUInterfaceBaseV3 *this, const AURenderCallbackStruct *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a2->inputProc)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v2 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      int buf = 136316418;
      *(void *)buf_4 = "AVAEInternal.h";
      *(_WORD *)&buf_4[8] = 1024;
      *(_DWORD *)&buf_4[10] = 71;
      __int16 v5 = 2080;
      float v6 = "AUInterface.mm";
      __int16 v7 = 1024;
      int v8 = 682;
      __int16 v9 = 2080;
      __int16 v10 = "AddRenderObserver";
      __int16 v11 = 2080;
      __int16 v12 = "inRenderCallback.inputProc";
      _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", (uint8_t *)&buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inRenderCallback.inputProc");
  }
  *(void *)&buf_4[4] = 0;
  operator new();
}

void sub_19D8A88A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t ___ZN17AUInterfaceBaseV317AddRenderObserverERK22AURenderCallbackStruct_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6 = a2;
  return (*(uint64_t (**)(void, int *, uint64_t, uint64_t, uint64_t, void))(a1 + 32))(*(void *)(a1 + 40), &v6, a3, a5, a4, 0);
}

uint64_t AUInterfaceBaseV3::SetOfflineMode(AUInterfaceBaseV3 *this, uint64_t a2)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);

  return [v3 setRenderingOffline:a2];
}

uint64_t AUInterfaceBaseV3::IsOffline(AUInterfaceBaseV3 *this)
{
  uint64_t v1 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);

  return [v1 isRenderingOffline];
}

double AUInterfaceBaseV3::GetProcessingLatency(AUInterfaceBaseV3 *this)
{
  [(id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this) latency];
  return fmax(v1, 0.0);
}

uint64_t AUInterfaceBaseV3::SetMaxFramesPerSlice(AUInterfaceBaseV3 *this, uint64_t a2)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);

  return [v3 setMaximumFramesToRender:a2];
}

uint64_t AUInterfaceBaseV3::GetMaxFramesPerSlice(AUInterfaceBaseV3 *this)
{
  double v1 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);

  return [v1 maximumFramesToRender];
}

uint64_t AUInterfaceBaseV3::SendMIDIEventList(AUInterfaceBaseV3 *this, int a2, uint64_t a3, const MIDIEventList *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 328))(this))
  {
    if (a4) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  int v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 136316418;
    uint64_t v13 = "AVAEInternal.h";
    __int16 v14 = 1024;
    int v15 = 71;
    __int16 v16 = 2080;
    uint64_t v17 = "AUInterface.mm";
    __int16 v18 = 1024;
    int v19 = 647;
    __int16 v20 = 2080;
    int v21 = "SendMIDIEventList";
    __int16 v22 = 2080;
    __int16 v23 = "nil != ScheduleMIDIEventListBlock()";
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nil != ScheduleMIDIEventListBlock()");
  if (!a4)
  {
LABEL_9:
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136316418;
      uint64_t v13 = "AVAEInternal.h";
      __int16 v14 = 1024;
      int v15 = 71;
      __int16 v16 = 2080;
      uint64_t v17 = "AUInterface.mm";
      __int16 v18 = 1024;
      int v19 = 648;
      __int16 v20 = 2080;
      int v21 = "SendMIDIEventList";
      __int16 v22 = 2080;
      __int16 v23 = "nullptr != eventList";
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nullptr != eventList");
  }
LABEL_14:
  uint64_t v10 = (*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 328))(this);
  (*(void (**)(uint64_t, unint64_t, uint64_t, const MIDIEventList *))(v10 + 16))(v10, *(void *)&a2 | 0xFFFFFFFF00000000, a3, a4);
  return 1;
}

uint64_t AUInterfaceBaseV3::SendMIDIEvent(AUInterfaceBaseV3 *this, BOOL a2, int a3, uint64_t a4, unsigned int a5, const unsigned __int8 *a6)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 320))(this))
  {
    if (a6) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  __int16 v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 136316418;
    __int16 v16 = "AVAEInternal.h";
    __int16 v17 = 1024;
    int v18 = 71;
    __int16 v19 = 2080;
    __int16 v20 = "AUInterface.mm";
    __int16 v21 = 1024;
    int v22 = 637;
    __int16 v23 = 2080;
    uint64_t v24 = "SendMIDIEvent";
    __int16 v25 = 2080;
    __int16 v26 = "nil != ScheduleMIDIEventBlock()";
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nil != ScheduleMIDIEventBlock()");
  if (!a6)
  {
LABEL_9:
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136316418;
      __int16 v16 = "AVAEInternal.h";
      __int16 v17 = 1024;
      int v18 = 71;
      __int16 v19 = 2080;
      __int16 v20 = "AUInterface.mm";
      __int16 v21 = 1024;
      int v22 = 638;
      __int16 v23 = 2080;
      uint64_t v24 = "SendMIDIEvent";
      __int16 v25 = 2080;
      __int16 v26 = "nullptr != midiBytes";
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nullptr != midiBytes");
  }
LABEL_14:
  uint64_t v13 = (*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 320))(this);
  (*(void (**)(uint64_t, unint64_t, uint64_t, void, const unsigned __int8 *))(v13 + 16))(v13, *(void *)&a3 | 0xFFFFFFFF00000000, a4, a5, a6);
  return 1;
}

uint64_t AUInterfaceBaseV3::GetParameter(AUInterfaceBaseV3 *this, uint64_t a2, uint64_t a3, uint64_t a4, float *a5)
{
  uint64_t result = (*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 312))(this);
  if (result)
  {
    uint64_t result = [(id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 312))(this) parameterWithID:a2 scope:a3 element:a4];
    if (result
      || (uint64_t result = [(id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 312))(this) parameterWithAddress:a2]) != 0)
    {
      [(id)result value];
      *(_DWORD *)a5 = v11;
      return 1;
    }
  }
  return result;
}

uint64_t AUInterfaceBaseV3::SetParameter(AUInterfaceBaseV3 *this, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  uint64_t result = (*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 312))(this);
  if (result)
  {
    uint64_t result = [(id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 312))(this) parameterWithID:a2 scope:a3 element:a4];
    if (result
      || (uint64_t result = [(id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 312))(this) parameterWithAddress:a2]) != 0)
    {
      *(float *)&double v11 = a5;
      [(id)result setValue:v11];
      return 1;
    }
  }
  return result;
}

uint64_t AUInterfaceBaseV3::SetNumberOutputs(AUInterfaceBaseV3 *this, unsigned int a2)
{
  *(void *)__int16 v5 = 0;
  uint64_t v2 = (const char *)objc_msgSend((id)objc_msgSend((id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this), "outputBusses"), "setBusCount:error:", a2, v5);
  return _AVAE_CheckSuccessAndNoNSError(587, (uint64_t)"SetNumberOutputs", "[[auv3() outputBusses] setBusCount:(NSUInteger)numberOutputs error:&nsErr]", v2, *(void **)v5, v3);
}

uint64_t _AVAE_CheckSuccessAndNoNSError(uint64_t result, uint64_t a2, const char *a3, const char *a4, void *a5, NSError *a6)
{
  int v7 = (int)a4;
  int v10 = result;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a5 || (a4 & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    double v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      if (v7) {
        __int16 v12 = "true";
      }
      else {
        __int16 v12 = "false";
      }
      *(_DWORD *)int buf = 136316930;
      int v15 = "AVAEInternal.h";
      __int16 v16 = 1024;
      int v17 = 125;
      __int16 v18 = 2080;
      __int16 v19 = "AUInterface.mm";
      __int16 v20 = 1024;
      int v21 = v10;
      __int16 v22 = 2080;
      uint64_t v23 = a2;
      __int16 v24 = 2080;
      __int16 v25 = a3;
      __int16 v26 = 2080;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = [a5 description];
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s)] returned %s, error %@", buf, 0x4Au);
    }
    if (v7) {
      uint64_t v13 = "true";
    }
    else {
      uint64_t v13 = "false";
    }
    return [MEMORY[0x1E4F1CA00] raise:@"com.apple.coreaudio.avfaudio", @"%s: returned %s, error %@", a3, v13, objc_msgSend(a5, "description") format];
  }
  return result;
}

uint64_t AUInterfaceBaseV3::SetNumberInputs(AUInterfaceBaseV3 *this, unsigned int a2)
{
  *(void *)__int16 v5 = 0;
  uint64_t v2 = (const char *)objc_msgSend((id)objc_msgSend((id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this), "inputBusses"), "setBusCount:error:", a2, v5);
  return _AVAE_CheckSuccessAndNoNSError(581, (uint64_t)"SetNumberInputs", "[[auv3() inputBusses] setBusCount:(NSUInteger)numberInputs error:&nsErr]", v2, *(void **)v5, v3);
}

uint64_t AUInterfaceBaseV3::NumberOutputs(AUInterfaceBaseV3 *this)
{
  return objc_msgSend((id)objc_msgSend((id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this), "outputBusses"), "count");
}

uint64_t AUInterfaceBaseV3::NumberInputs(AUInterfaceBaseV3 *this)
{
  return objc_msgSend((id)objc_msgSend((id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this), "inputBusses"), "count");
}

uint64_t AUInterfaceBaseV3::IsBusEnabled(AUInterfaceBaseV3 *this, int a2, unsigned int a3)
{
  __int16 v5 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);
  if (a2) {
    int v6 = (void *)[v5 inputBusses];
  }
  else {
    int v6 = (void *)[v5 outputBusses];
  }
  int v7 = v6;
  if ([v6 count] <= a3) {
    return 0;
  }
  int v8 = (void *)[v7 objectAtIndexedSubscript:a3];

  return [v8 isEnabled];
}

uint64_t AUInterfaceBaseV3::EnableBus(AUInterfaceBaseV3 *this, int a2, unsigned int a3, uint64_t a4)
{
  int v7 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);
  if (a2) {
    int v8 = (void *)[v7 inputBusses];
  }
  else {
    int v8 = (void *)[v7 outputBusses];
  }
  __int16 v9 = v8;
  uint64_t result = [v8 count];
  if (result > a3)
  {
    double v11 = (void *)[v9 objectAtIndexedSubscript:a3];
    return [v11 setEnabled:a4];
  }
  return result;
}

uint64_t AUInterfaceBaseV3::Reset(AUInterfaceBaseV3 *this)
{
  double v1 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);

  return [v1 reset];
}

uint64_t AUInterfaceBaseV3::SetFormat(AUInterfaceBaseV3 *this, int a2, unsigned int a3, AVAudioFormat *a4)
{
  int v7 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);
  if (a2) {
    int v8 = (void *)[v7 inputBusses];
  }
  else {
    int v8 = (void *)[v7 outputBusses];
  }
  *(void *)__int16 v12 = 0;
  __int16 v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", a3), "setFormat:error:", a4, v12);
  _AVAE_CheckSuccessAndNoNSError(539, (uint64_t)"SetFormat", "[[busArray objectAtIndexedSubscript:(NSUInteger)element] setFormat:format error:&nsErr]", v9, *(void **)v12, v10);
  return 1;
}

uint64_t AUInterfaceBaseV3::GetFormat(AUInterfaceBaseV3 *this, int a2, unsigned int a3)
{
  __int16 v5 = (void *)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this);
  if (a2) {
    int v6 = (void *)[v5 inputBusses];
  }
  else {
    int v6 = (void *)[v5 outputBusses];
  }
  int v7 = (void *)[v6 objectAtIndexedSubscript:a3];

  return [v7 format];
}

uint64_t AUInterfaceBaseV3::Uninitialize(AUInterfaceBaseV3 *this)
{
  return 0;
}

uint64_t AUInterfaceBaseV3::Initialize(AUInterfaceBaseV3 *this)
{
  id v3 = 0;
  if ([(id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this) allocateRenderResourcesAndReturnError:&v3])BOOL v1 = v3 == 0; {
  else
  }
    BOOL v1 = 0;
  if (v1) {
    return 0;
  }
  if ([v3 code]) {
    return [v3 code];
  }
  return 4294967246;
}

uint64_t AUInterfaceIOV3::SetInputHandler(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 304))(a1);

  return [v3 setInputHandler:a2];
}

uint64_t AUInterfaceIOV3::SetOutputProvider(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 304))(a1);

  return [v3 setOutputProvider:a2];
}

uint64_t AUInterfaceIOV3::IsRunning(AUInterfaceIOV3 *this)
{
  BOOL v1 = (void *)(*(uint64_t (**)(AUInterfaceIOV3 *))(*(void *)this + 304))(this);

  return [v1 isRunning];
}

uint64_t AUInterfaceIOV3::StopIO(AUInterfaceIOV3 *this)
{
  return 0;
}

uint64_t AUInterfaceIOV3::StartIO(AUInterfaceIOV3 *this)
{
  id v3 = 0;
  if ([(id)(*(uint64_t (**)(AUInterfaceIOV3 *))(*(void *)this + 304))(this) startHardwareAndReturnError:&v3])BOOL v1 = v3 == 0; {
  else
  }
    BOOL v1 = 0;
  if (v1) {
    return 0;
  }
  if ([v3 code]) {
    return [v3 code];
  }
  return 4294967246;
}

uint64_t AUInterfaceIOV3::EnableIO(AUInterfaceIOV3 *this, uint64_t a2, uint64_t a3)
{
  int v4 = a2;
  if ((a3 & 1) == 0
    || (uint64_t result = (*(uint64_t (**)(AUInterfaceIOV3 *, uint64_t))(*(void *)this + 80))(this, a2),
        result))
  {
    int v7 = (void *)(*(uint64_t (**)(AUInterfaceIOV3 *))(*(void *)this + 304))(this);
    if (v4)
    {
      return [v7 setInputEnabled:a3];
    }
    else
    {
      return [v7 setOutputEnabled:a3];
    }
  }
  return result;
}

uint64_t AUInterfaceIOV3::CanPerformIO(AUInterfaceIOV3 *this, int a2)
{
  id v3 = (void *)(*(uint64_t (**)(AUInterfaceIOV3 *))(*(void *)this + 304))(this);
  if (a2)
  {
    return [v3 canPerformInput];
  }
  else
  {
    return [v3 canPerformOutput];
  }
}

void AUInterfaceIOV3::~AUInterfaceIOV3(const void ***this)
{
  AUInterfaceBaseV3::~AUInterfaceBaseV3(this);

  JUMPOUT(0x19F3ABB30);
}

void AUInterfaceBaseV3::~AUInterfaceBaseV3(const void ***this)
{
  *this = (const void **)&unk_1EEFA4E70;
  uint64_t v2 = this + 9;
  std::unique_ptr<AVAEBlock<void({block_pointer})(long long,unsigned char,long,unsigned char const*)>>::reset[abi:ne180100](this + 9, 0);
  id v3 = this[6];
  int v4 = this[7];
  if (v3 != v4)
  {
    do
    {
      [(id)((uint64_t (*)(const void ***))(*this)[38])(this) removeRenderObserver:*v3];
      v3 += 4;
    }
    while (v3 != v4);
    __int16 v5 = this[6];
    id v3 = this[7];
    if (v3 != v5)
    {
      do
      {
        std::unique_ptr<AVAEBlock<void({block_pointer})(unsigned int,AudioTimeStamp const*,unsigned int,long)>>::reset[abi:ne180100]((const void ***)v3 - 3, 0);
        v3 -= 4;
      }
      while (v3 != v5);
      id v3 = v5;
    }
  }
  this[7] = v3;
  [(id)((uint64_t (*)(const void ***))(*this)[38])(this) invalidateAudioUnit];

  this[5] = 0;
  if (((uint64_t (*)(const void ***))(*this)[34])(this))
  {
    int v6 = (OpaqueAudioComponentInstance *)((uint64_t (*)(const void ***))(*this)[34])(this);
    AudioComponentInstanceDispose(v6);
    this[4] = 0;
  }
  std::unique_ptr<AVAEBlock<int({block_pointer})(long long,unsigned char,MIDIEventList const*)>>::reset[abi:ne180100](this + 10, 0);
  std::unique_ptr<AVAEBlock<void({block_pointer})(long long,unsigned char,long,unsigned char const*)>>::reset[abi:ne180100](v2, 0);
  int v7 = (void **)(this + 6);
  std::vector<AUInterfaceBaseV3::RenderObserver>::__destroy_vector::operator()[abi:ne180100](&v7);
}

const void ***std::unique_ptr<AVAEBlock<void({block_pointer})(long long,unsigned char,long,unsigned char const*)>>::reset[abi:ne180100](const void ***result, const void **a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    if (*v2)
    {
      _Block_release(*v2);
      const char *v2 = 0;
    }
    JUMPOUT(0x19F3ABB30);
  }
  return result;
}

void std::vector<AUInterfaceBaseV3::RenderObserver>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  BOOL v1 = *a1;
  uint64_t v2 = (const void ***)**a1;
  if (v2)
  {
    int v4 = (const void ***)v1[1];
    __int16 v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        int v6 = v4 - 4;
        std::unique_ptr<AVAEBlock<void({block_pointer})(unsigned int,AudioTimeStamp const*,unsigned int,long)>>::reset[abi:ne180100](v4 - 3, 0);
        int v4 = v6;
      }
      while (v6 != v2);
      __int16 v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void AUInterfaceBaseV3::AUInterfaceBaseV3(AUInterfaceBaseV3 *this, const AudioComponentDescription *a2, OpaqueAudioComponentInstance *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  *(void *)this = &unk_1EEFA4E70;
  long long v4 = *(_OWORD *)&a2->componentType;
  UInt32 componentFlagsMask = a2->componentFlagsMask;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_DWORD *)this + 6) = componentFlagsMask;
  *((void *)this + 4) = a3;
  int v6 = (AudioComponentInstance *)((char *)this + 32);
  *(_OWORD *)((char *)this + 8) = v4;
  *(_OWORD *)((char *)this + 40) = 0u;
  int v7 = (void **)((char *)this + 40);
  *(_OWORD *)((char *)this + 56) = 0u;
  if (!a3)
  {
    Next = AudioComponentFindNext(0, (const AudioComponentDescription *)((char *)this + 8));
    if (!Next)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      __int16 v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136316418;
        __int16 v19 = "AVAEInternal.h";
        __int16 v20 = 1024;
        int v21 = 71;
        __int16 v22 = 2080;
        uint64_t v23 = "AUInterface.mm";
        __int16 v24 = 1024;
        int v25 = 466;
        __int16 v26 = 2080;
        uint64_t v27 = "AUInterfaceBaseV3";
        __int16 v28 = 2080;
        uint64_t v29 = "comp != nullptr";
        _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "comp != nullptr");
    }
    uint64_t v10 = AudioComponentInstanceNew(Next, v6);
    if (v10)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      double v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136316674;
        __int16 v19 = "AVAEInternal.h";
        __int16 v20 = 1024;
        int v21 = 104;
        __int16 v22 = 2080;
        uint64_t v23 = "AUInterface.mm";
        __int16 v24 = 1024;
        int v25 = 468;
        __int16 v26 = 2080;
        uint64_t v27 = "AUInterfaceBaseV3";
        __int16 v28 = 2080;
        uint64_t v29 = "AudioComponentInstanceNew(comp, &_auv2)";
        __int16 v30 = 1024;
        int v31 = v10;
        _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v10);
    }
    if (!*v6)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      __int16 v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136316418;
        __int16 v19 = "AVAEInternal.h";
        __int16 v20 = 1024;
        int v21 = 71;
        __int16 v22 = 2080;
        uint64_t v23 = "AUInterface.mm";
        __int16 v24 = 1024;
        int v25 = 469;
        __int16 v26 = 2080;
        uint64_t v27 = "AUInterfaceBaseV3";
        __int16 v28 = 2080;
        uint64_t v29 = "_auv2 != nullptr";
        _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_auv2 != nullptr");
    }
    if (*v7)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      uint64_t v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136316418;
        __int16 v19 = "AVAEInternal.h";
        __int16 v20 = 1024;
        int v21 = 71;
        __int16 v22 = 2080;
        uint64_t v23 = "AUInterface.mm";
        __int16 v24 = 1024;
        int v25 = 473;
        __int16 v26 = 2080;
        uint64_t v27 = "AUInterfaceBaseV3";
        __int16 v28 = 2080;
        uint64_t v29 = "_auv3 == nil";
        _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_auv3 == nil");
    }
  }
  __int16 v14 = (void *)[MEMORY[0x1E4F4EA90] auAudioUnitForAudioUnit:*v6];
  void *v7 = v14;
  if (!v14)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v15 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136316418;
      __int16 v19 = "AVAEInternal.h";
      __int16 v20 = 1024;
      int v21 = 71;
      __int16 v22 = 2080;
      uint64_t v23 = "AUInterface.mm";
      __int16 v24 = 1024;
      int v25 = 475;
      __int16 v26 = 2080;
      uint64_t v27 = "AUInterfaceBaseV3";
      __int16 v28 = 2080;
      uint64_t v29 = "_auv3 != nil";
      _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_auv3 != nil");
    __int16 v14 = *v7;
  }
  id v16 = v14;
  if ([(id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this) isMusicDeviceOrEffect])
  {
    if (![(id)(*(uint64_t (**)(AUInterfaceBaseV3 *))(*(void *)this + 304))(this) scheduleMIDIEventBlock])
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      int v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136316418;
        __int16 v19 = "AVAEInternal.h";
        __int16 v20 = 1024;
        int v21 = 71;
        __int16 v22 = 2080;
        uint64_t v23 = "AUInterface.mm";
        __int16 v24 = 1024;
        int v25 = 482;
        __int16 v26 = 2080;
        uint64_t v27 = "AUInterfaceBaseV3";
        __int16 v28 = 2080;
        uint64_t v29 = "nil != midiEventBlock";
        _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "nil != midiEventBlock");
    }
    operator new();
  }
}

void sub_19D8AA8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void **a11)
{
  MEMORY[0x19F3ABB30](v14, 0x80C40B8603338);
  std::unique_ptr<AVAEBlock<int({block_pointer})(long long,unsigned char,MIDIEventList const*)>>::reset[abi:ne180100](v13, 0);
  std::unique_ptr<AVAEBlock<void({block_pointer})(long long,unsigned char,long,unsigned char const*)>>::reset[abi:ne180100](v12, 0);
  a11 = (void **)(v11 + 48);
  std::vector<AUInterfaceBaseV3::RenderObserver>::__destroy_vector::operator()[abi:ne180100](&a11);
  _Unwind_Resume(a1);
}

OSStatus AUGraphAddNode(AUGraph inGraph, const AudioComponentDescription *inDescription, AUNode *outNode)
{
  return MEMORY[0x1F40D4B28](inGraph, inDescription, outNode);
}

OSStatus AUGraphConnectNodeInput(AUGraph inGraph, AUNode inSourceNode, UInt32 inSourceOutputNumber, AUNode inDestNode, UInt32 inDestInputNumber)
{
  return MEMORY[0x1F40D4B30](inGraph, *(void *)&inSourceNode, *(void *)&inSourceOutputNumber, *(void *)&inDestNode, *(void *)&inDestInputNumber);
}

OSStatus AUGraphGetIndNode(AUGraph inGraph, UInt32 inIndex, AUNode *outNode)
{
  return MEMORY[0x1F40D4B38](inGraph, *(void *)&inIndex, outNode);
}

OSStatus AUGraphGetNodeCount(AUGraph inGraph, UInt32 *outNumberOfNodes)
{
  return MEMORY[0x1F40D4B40](inGraph, outNumberOfNodes);
}

OSStatus AUGraphInitialize(AUGraph inGraph)
{
  return MEMORY[0x1F40D4B48](inGraph);
}

OSStatus AUGraphNodeInfo(AUGraph inGraph, AUNode inNode, AudioComponentDescription *outDescription, AudioUnit *outAudioUnit)
{
  return MEMORY[0x1F40D4B50](inGraph, *(void *)&inNode, outDescription, outAudioUnit);
}

OSStatus AUGraphOpen(AUGraph inGraph)
{
  return MEMORY[0x1F40D4B58](inGraph);
}

OSStatus AUParameterListenerNotify(AUParameterListenerRef inSendingListener, void *inSendingObject, const AudioUnitParameter *inParameter)
{
  return MEMORY[0x1F410B3F0](inSendingListener, inSendingObject, inParameter);
}

OSStatus AudioComponentCopyConfigurationInfo(AudioComponent inComponent, CFDictionaryRef *outConfigurationInfo)
{
  return MEMORY[0x1F410B450](inComponent, outConfigurationInfo);
}

UIImage *__cdecl AudioComponentCopyIcon(AudioComponent comp)
{
  return (UIImage *)MEMORY[0x1F410B458](comp);
}

OSStatus AudioComponentCopyName(AudioComponent inComponent, CFStringRef *outName)
{
  return MEMORY[0x1F410B460](inComponent, outName);
}

uint64_t AudioComponentCopyTagsInfo()
{
  return MEMORY[0x1F410B468]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x1F410B478](inComponent, inDesc);
}

OSStatus AudioComponentGetDescription(AudioComponent inComponent, AudioComponentDescription *outDesc)
{
  return MEMORY[0x1F410B480](inComponent, outDesc);
}

OSStatus AudioComponentGetVersion(AudioComponent inComponent, UInt32 *outVersion)
{
  return MEMORY[0x1F410B488](inComponent, outVersion);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x1F410B498](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x1F410B4A8](inComponent, outInstance);
}

void AudioComponentInstantiate(AudioComponent inComponent, AudioComponentInstantiationOptions inOptions, void *inCompletionHandler)
{
}

OSStatus AudioComponentValidate(AudioComponent inComponent, CFDictionaryRef inValidationParameters, AudioComponentValidationResult *outValidationResult)
{
  return MEMORY[0x1F410B4C0](inComponent, inValidationParameters, outValidationResult);
}

OSStatus AudioComponentValidateWithResults(AudioComponent inComponent, CFDictionaryRef inValidationParameters, void *inCompletionHandler)
{
  return MEMORY[0x1F410B4C8](inComponent, inValidationParameters, inCompletionHandler);
}

OSStatus AudioConverterConvertComplexBuffer(AudioConverterRef inAudioConverter, UInt32 inNumberPCMFrames, const AudioBufferList *inInputData, AudioBufferList *outOutputData)
{
  return MEMORY[0x1F410B4D8](inAudioConverter, *(void *)&inNumberPCMFrames, inInputData, outOutputData);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1F410B4E0](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x1F410B4E8](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterGetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F410B4F8](inAudioConverter, *(void *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioConverterGetPropertyInfo(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *outSize, Boolean *outWritable)
{
  return MEMORY[0x1F410B500](inAudioConverter, *(void *)&inPropertyID, outSize, outWritable);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x1F410B508](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterReset(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1F410B528](inAudioConverter);
}

OSStatus AudioConverterSetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1F410B530](inAudioConverter, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x1F410B538](inAudioFile);
}

OSStatus AudioFileCreateWithURL(CFURLRef inFileRef, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inFormat, AudioFileFlags inFlags, AudioFileID *outAudioFile)
{
  return MEMORY[0x1F410B540](inFileRef, *(void *)&inFileType, inFormat, *(void *)&inFlags, outAudioFile);
}

OSStatus AudioFileGetGlobalInfo(AudioFilePropertyID inPropertyID, UInt32 inSpecifierSize, void *inSpecifier, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x1F410B548](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, ioDataSize, outPropertyData);
}

OSStatus AudioFileGetGlobalInfoSize(AudioFilePropertyID inPropertyID, UInt32 inSpecifierSize, void *inSpecifier, UInt32 *outDataSize)
{
  return MEMORY[0x1F410B550](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, outDataSize);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x1F410B558](inAudioFile, *(void *)&inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileGetPropertyInfo(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *outDataSize, UInt32 *isWritable)
{
  return MEMORY[0x1F410B560](inAudioFile, *(void *)&inPropertyID, outDataSize, isWritable);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x1F410B568](inFileRef, inPermissions, *(void *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioFileOpenWithCallbacks(void *inClientData, AudioFile_ReadProc inReadFunc, AudioFile_WriteProc inWriteFunc, AudioFile_GetSizeProc inGetSizeFunc, AudioFile_SetSizeProc inSetSizeFunc, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x1F410B570](inClientData, inReadFunc, inWriteFunc, inGetSizeFunc, inSetSizeFunc, *(void *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioFileReadPacketData(AudioFileID inAudioFile, Boolean inUseCache, UInt32 *ioNumBytes, AudioStreamPacketDescription *outPacketDescriptions, SInt64 inStartingPacket, UInt32 *ioNumPackets, void *outBuffer)
{
  return MEMORY[0x1F410B580](inAudioFile, inUseCache, ioNumBytes, outPacketDescriptions, inStartingPacket, ioNumPackets, outBuffer);
}

OSStatus AudioFileSetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 inDataSize, const void *inPropertyData)
{
  return MEMORY[0x1F410B590](inAudioFile, *(void *)&inPropertyID, *(void *)&inDataSize, inPropertyData);
}

OSStatus AudioFileWritePackets(AudioFileID inAudioFile, Boolean inUseCache, UInt32 inNumBytes, const AudioStreamPacketDescription *inPacketDescriptions, SInt64 inStartingPacket, UInt32 *ioNumPackets, const void *inBuffer)
{
  return MEMORY[0x1F410B598](inAudioFile, inUseCache, *(void *)&inNumBytes, inPacketDescriptions, inStartingPacket, ioNumPackets, inBuffer);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F410B5A0](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioFormatGetPropertyInfo(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *outPropertyDataSize)
{
  return MEMORY[0x1F410B5A8](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, outPropertyDataSize);
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x1F40D4CD8](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x1F40D4CE0](inAQ, *(void *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueAllocateBufferWithPacketDescriptions(AudioQueueRef inAQ, UInt32 inBufferByteSize, UInt32 inNumberPacketDescriptions, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x1F40D4CF0](inAQ, *(void *)&inBufferByteSize, *(void *)&inNumberPacketDescriptions, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x1F40D4D18](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x1F40D4D20](inAQ, inBuffer, *(void *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueEnqueueBufferWithParameters(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs, UInt32 inTrimFramesAtStart, UInt32 inTrimFramesAtEnd, UInt32 inNumParamValues, const AudioQueueParameterEvent *inParamValues, const AudioTimeStamp *inStartTime, AudioTimeStamp *outActualStartTime)
{
  return MEMORY[0x1F40D4D28](inAQ, inBuffer, *(void *)&inNumPacketDescs, inPacketDescs, *(void *)&inTrimFramesAtStart, *(void *)&inTrimFramesAtEnd, *(void *)&inNumParamValues, inParamValues);
}

OSStatus AudioQueueFlush(AudioQueueRef inAQ)
{
  return MEMORY[0x1F40D4D38](inAQ);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x1F40D4D40](inAQ, inBuffer);
}

OSStatus AudioQueueGetCurrentTime(AudioQueueRef inAQ, AudioQueueTimelineRef inTimeline, AudioTimeStamp *outTimeStamp, Boolean *outTimelineDiscontinuity)
{
  return MEMORY[0x1F40D4D48](inAQ, inTimeline, outTimeStamp, outTimelineDiscontinuity);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x1F40D4D58](inAQ, *(void *)&inID, outData, ioDataSize);
}

OSStatus AudioQueueGetPropertySize(AudioQueueRef inAQ, AudioQueuePropertyID inID, UInt32 *outDataSize)
{
  return MEMORY[0x1F40D4D60](inAQ, *(void *)&inID, outDataSize);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x1F40D4D68](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(void *)&inFlags, outAQ);
}

uint64_t AudioQueueNewInputWithAudioSession()
{
  return MEMORY[0x1F40D4D70]();
}

OSStatus AudioQueueNewOutput(const AudioStreamBasicDescription *inFormat, AudioQueueOutputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x1F40D4D80](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(void *)&inFlags, outAQ);
}

uint64_t AudioQueueNewOutputWithAudioSession()
{
  return MEMORY[0x1F40D4D88]();
}

OSStatus AudioQueuePause(AudioQueueRef inAQ)
{
  return MEMORY[0x1F40D4D90](inAQ);
}

OSStatus AudioQueuePrime(AudioQueueRef inAQ, UInt32 inNumberOfFramesToPrepare, UInt32 *outNumberOfFramesPrepared)
{
  return MEMORY[0x1F40D4D98](inAQ, *(void *)&inNumberOfFramesToPrepare, outNumberOfFramesPrepared);
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x1F40D4DC8](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueReset(AudioQueueRef inAQ)
{
  return MEMORY[0x1F40D4DD0](inAQ);
}

OSStatus AudioQueueSetParameter(AudioQueueRef inAQ, AudioQueueParameterID inParamID, AudioQueueParameterValue inValue)
{
  return MEMORY[0x1F40D4DE0](inAQ, *(void *)&inParamID, inValue);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1F40D4DE8](inAQ, *(void *)&inID, inData, *(void *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x1F40D4DF0](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x1F40D4E00](inAQ, inImmediate);
}

uint64_t AudioServicesCreateSystemSoundIDWithOptions()
{
  return MEMORY[0x1F40D4E18]();
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x1F40D4E28](*(void *)&inSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x1F40D4E48]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x1F40D4E70]();
}

uint64_t AudioSessionCreatePrimarySession_Priv()
{
  return MEMORY[0x1F40D4E88]();
}

uint64_t AudioSessionSetActive_Priv()
{
  return MEMORY[0x1F40D4EA0]();
}

OSStatus AudioUnitAddPropertyListener(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitPropertyListenerProc inProc, void *inProcUserData)
{
  return MEMORY[0x1F410B618](inUnit, *(void *)&inID, inProc, inProcUserData);
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x1F410B638](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitGetPropertyInfo(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, UInt32 *outDataSize, Boolean *outWritable)
{
  return MEMORY[0x1F410B640](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outDataSize, outWritable);
}

OSStatus AudioUnitRemovePropertyListenerWithUserData(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitPropertyListenerProc inProc, void *inProcUserData)
{
  return MEMORY[0x1F410B660](inUnit, *(void *)&inID, inProc, inProcUserData);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x1F410B688](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, *(void *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1F410B690](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1F40D70D8](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFArrayRef CFBundleCopyExecutableArchitecturesForURL(CFURLRef url)
{
  return (CFArrayRef)MEMORY[0x1F40D7468](url);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D7CA0](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D86F8]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

OSStatus DisposeAUGraph(AUGraph inGraph)
{
  return MEMORY[0x1F40D4F38](inGraph);
}

OSStatus DisposeMusicEventIterator(MusicEventIterator inIterator)
{
  return MEMORY[0x1F40D4F40](inIterator);
}

OSStatus DisposeMusicPlayer(MusicPlayer inPlayer)
{
  return MEMORY[0x1F40D4F48](inPlayer);
}

OSStatus DisposeMusicSequence(MusicSequence inSequence)
{
  return MEMORY[0x1F40D4F50](inSequence);
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1F410B6C0](inURL, *(void *)&inFileType, inStreamDesc, inChannelLayout, *(void *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x1F410B6C8](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F410B6D0](inExtAudioFile, *(void *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileGetPropertyInfo(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *outSize, Boolean *outWritable)
{
  return MEMORY[0x1F410B6D8](inExtAudioFile, *(void *)&inPropertyID, outSize, outWritable);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1F410B6E0](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1F410B6E8](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSeek(ExtAudioFileRef inExtAudioFile, SInt64 inFrameOffset)
{
  return MEMORY[0x1F410B6F0](inExtAudioFile, inFrameOffset);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1F410B6F8](inExtAudioFile, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileTell(ExtAudioFileRef inExtAudioFile, SInt64 *outFrameOffset)
{
  return MEMORY[0x1F410B700](inExtAudioFile, outFrameOffset);
}

OSStatus ExtAudioFileWrapAudioFileID(AudioFileID inFileID, Boolean inForWriting, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1F410B708](inFileID, inForWriting, outExtAudioFile);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x1F410B710](inExtAudioFile, *(void *)&inNumberFrames, ioData);
}

uint64_t ExtendedAudioBufferList_Create()
{
  return MEMORY[0x1F410B720]();
}

uint64_t ExtendedAudioBufferList_Destroy()
{
  return MEMORY[0x1F410B730]();
}

uint64_t ExtendedAudioBufferList_Prepare()
{
  return MEMORY[0x1F410B738]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1F417CE50]();
}

OSStatus MusicEventIteratorDeleteEvent(MusicEventIterator inIterator)
{
  return MEMORY[0x1F40D4FC0](inIterator);
}

OSStatus MusicEventIteratorGetEventInfo(MusicEventIterator inIterator, MusicTimeStamp *outTimeStamp, MusicEventType *outEventType, const void **outEventData, UInt32 *outEventDataSize)
{
  return MEMORY[0x1F40D4FC8](inIterator, outTimeStamp, outEventType, outEventData, outEventDataSize);
}

OSStatus MusicEventIteratorHasCurrentEvent(MusicEventIterator inIterator, Boolean *outHasCurEvent)
{
  return MEMORY[0x1F40D4FD0](inIterator, outHasCurEvent);
}

OSStatus MusicEventIteratorHasNextEvent(MusicEventIterator inIterator, Boolean *outHasNextEvent)
{
  return MEMORY[0x1F40D4FD8](inIterator, outHasNextEvent);
}

OSStatus MusicEventIteratorHasPreviousEvent(MusicEventIterator inIterator, Boolean *outHasPrevEvent)
{
  return MEMORY[0x1F40D4FE0](inIterator, outHasPrevEvent);
}

OSStatus MusicEventIteratorNextEvent(MusicEventIterator inIterator)
{
  return MEMORY[0x1F40D4FE8](inIterator);
}

OSStatus MusicEventIteratorPreviousEvent(MusicEventIterator inIterator)
{
  return MEMORY[0x1F40D4FF0](inIterator);
}

OSStatus MusicEventIteratorSeek(MusicEventIterator inIterator, MusicTimeStamp inTimeStamp)
{
  return MEMORY[0x1F40D4FF8](inIterator, inTimeStamp);
}

OSStatus MusicEventIteratorSetEventInfo(MusicEventIterator inIterator, MusicEventType inEventType, const void *inEventData)
{
  return MEMORY[0x1F40D5000](inIterator, *(void *)&inEventType, inEventData);
}

OSStatus MusicEventIteratorSetEventTime(MusicEventIterator inIterator, MusicTimeStamp inTimeStamp)
{
  return MEMORY[0x1F40D5008](inIterator, inTimeStamp);
}

OSStatus MusicPlayerGetBeatsForHostTime(MusicPlayer inPlayer, UInt64 inHostTime, MusicTimeStamp *outBeats)
{
  return MEMORY[0x1F40D5010](inPlayer, inHostTime, outBeats);
}

OSStatus MusicPlayerGetHostTimeForBeats(MusicPlayer inPlayer, MusicTimeStamp inBeats, UInt64 *outHostTime)
{
  return MEMORY[0x1F40D5018](inPlayer, outHostTime, inBeats);
}

OSStatus MusicPlayerGetPlayRateScalar(MusicPlayer inPlayer, Float64 *outScaleRate)
{
  return MEMORY[0x1F40D5020](inPlayer, outScaleRate);
}

OSStatus MusicPlayerGetTime(MusicPlayer inPlayer, MusicTimeStamp *outTime)
{
  return MEMORY[0x1F40D5028](inPlayer, outTime);
}

OSStatus MusicPlayerIsPlaying(MusicPlayer inPlayer, Boolean *outIsPlaying)
{
  return MEMORY[0x1F40D5030](inPlayer, outIsPlaying);
}

OSStatus MusicPlayerPreroll(MusicPlayer inPlayer)
{
  return MEMORY[0x1F40D5038](inPlayer);
}

OSStatus MusicPlayerSetPlayRateScalar(MusicPlayer inPlayer, Float64 inScaleRate)
{
  return MEMORY[0x1F40D5040](inPlayer, inScaleRate);
}

OSStatus MusicPlayerSetSequence(MusicPlayer inPlayer, MusicSequence inSequence)
{
  return MEMORY[0x1F40D5048](inPlayer, inSequence);
}

OSStatus MusicPlayerSetTime(MusicPlayer inPlayer, MusicTimeStamp inTime)
{
  return MEMORY[0x1F40D5050](inPlayer, inTime);
}

OSStatus MusicPlayerStart(MusicPlayer inPlayer)
{
  return MEMORY[0x1F40D5058](inPlayer);
}

OSStatus MusicPlayerStop(MusicPlayer inPlayer)
{
  return MEMORY[0x1F40D5060](inPlayer);
}

OSStatus MusicSequenceDisposeTrack(MusicSequence inSequence, MusicTrack inTrack)
{
  return MEMORY[0x1F40D5068](inSequence, inTrack);
}

OSStatus MusicSequenceFileCreate(MusicSequence inSequence, CFURLRef inFileRef, MusicSequenceFileTypeID inFileType, MusicSequenceFileFlags inFlags, SInt16 inResolution)
{
  return MEMORY[0x1F40D5070](inSequence, inFileRef, *(void *)&inFileType, *(void *)&inFlags, inResolution);
}

OSStatus MusicSequenceFileCreateData(MusicSequence inSequence, MusicSequenceFileTypeID inFileType, MusicSequenceFileFlags inFlags, SInt16 inResolution, CFDataRef *outData)
{
  return MEMORY[0x1F40D5078](inSequence, *(void *)&inFileType, *(void *)&inFlags, inResolution, outData);
}

OSStatus MusicSequenceFileLoad(MusicSequence inSequence, CFURLRef inFileRef, MusicSequenceFileTypeID inFileTypeHint, MusicSequenceLoadFlags inFlags)
{
  return MEMORY[0x1F40D5080](inSequence, inFileRef, *(void *)&inFileTypeHint, *(void *)&inFlags);
}

OSStatus MusicSequenceFileLoadData(MusicSequence inSequence, CFDataRef inData, MusicSequenceFileTypeID inFileTypeHint, MusicSequenceLoadFlags inFlags)
{
  return MEMORY[0x1F40D5088](inSequence, inData, *(void *)&inFileTypeHint, *(void *)&inFlags);
}

OSStatus MusicSequenceGetAUGraph(MusicSequence inSequence, AUGraph *outGraph)
{
  return MEMORY[0x1F40D5090](inSequence, outGraph);
}

OSStatus MusicSequenceGetBeatsForSeconds(MusicSequence inSequence, Float64 inSeconds, MusicTimeStamp *outBeats)
{
  return MEMORY[0x1F40D5098](inSequence, outBeats, inSeconds);
}

OSStatus MusicSequenceGetIndTrack(MusicSequence inSequence, UInt32 inTrackIndex, MusicTrack *outTrack)
{
  return MEMORY[0x1F40D50A0](inSequence, *(void *)&inTrackIndex, outTrack);
}

CFDictionaryRef MusicSequenceGetInfoDictionary(MusicSequence inSequence)
{
  return (CFDictionaryRef)MEMORY[0x1F40D50A8](inSequence);
}

OSStatus MusicSequenceGetSecondsForBeats(MusicSequence inSequence, MusicTimeStamp inBeats, Float64 *outSeconds)
{
  return MEMORY[0x1F40D50B0](inSequence, outSeconds, inBeats);
}

OSStatus MusicSequenceGetTempoTrack(MusicSequence inSequence, MusicTrack *outTrack)
{
  return MEMORY[0x1F40D50B8](inSequence, outTrack);
}

OSStatus MusicSequenceGetTrackCount(MusicSequence inSequence, UInt32 *outNumberOfTracks)
{
  return MEMORY[0x1F40D50C0](inSequence, outNumberOfTracks);
}

OSStatus MusicSequenceGetTrackIndex(MusicSequence inSequence, MusicTrack inTrack, UInt32 *outTrackIndex)
{
  return MEMORY[0x1F40D50C8](inSequence, inTrack, outTrackIndex);
}

OSStatus MusicSequenceNewTrack(MusicSequence inSequence, MusicTrack *outTrack)
{
  return MEMORY[0x1F40D50D0](inSequence, outTrack);
}

OSStatus MusicSequenceReverse(MusicSequence inSequence)
{
  return MEMORY[0x1F40D50D8](inSequence);
}

OSStatus MusicSequenceSetAUGraph(MusicSequence inSequence, AUGraph inGraph)
{
  return MEMORY[0x1F40D50E0](inSequence, inGraph);
}

uint64_t MusicSequenceSetAudioGraph()
{
  return MEMORY[0x1F40D50E8]();
}

OSStatus MusicSequenceSetUserCallback(MusicSequence inSequence, MusicSequenceUserCallback inCallback, void *inClientData)
{
  return MEMORY[0x1F40D50F0](inSequence, inCallback, inClientData);
}

OSStatus MusicTrackClear(MusicTrack inTrack, MusicTimeStamp inStartTime, MusicTimeStamp inEndTime)
{
  return MEMORY[0x1F40D50F8](inTrack, inStartTime, inEndTime);
}

OSStatus MusicTrackCopyInsert(MusicTrack inSourceTrack, MusicTimeStamp inSourceStartTime, MusicTimeStamp inSourceEndTime, MusicTrack inDestTrack, MusicTimeStamp inDestInsertTime)
{
  return MEMORY[0x1F40D5100](inSourceTrack, inDestTrack, inSourceStartTime, inSourceEndTime, inDestInsertTime);
}

OSStatus MusicTrackCut(MusicTrack inTrack, MusicTimeStamp inStartTime, MusicTimeStamp inEndTime)
{
  return MEMORY[0x1F40D5108](inTrack, inStartTime, inEndTime);
}

OSStatus MusicTrackGetDestMIDIEndpoint(MusicTrack inTrack, MIDIEndpointRef *outEndpoint)
{
  return MEMORY[0x1F40D5110](inTrack, outEndpoint);
}

OSStatus MusicTrackGetProperty(MusicTrack inTrack, UInt32 inPropertyID, void *outData, UInt32 *ioLength)
{
  return MEMORY[0x1F40D5118](inTrack, *(void *)&inPropertyID, outData, ioLength);
}

OSStatus MusicTrackGetSequence(MusicTrack inTrack, MusicSequence *outSequence)
{
  return MEMORY[0x1F40D5120](inTrack, outSequence);
}

uint64_t MusicTrackIsValid()
{
  return MEMORY[0x1F40D5128]();
}

OSStatus MusicTrackMerge(MusicTrack inSourceTrack, MusicTimeStamp inSourceStartTime, MusicTimeStamp inSourceEndTime, MusicTrack inDestTrack, MusicTimeStamp inDestInsertTime)
{
  return MEMORY[0x1F40D5130](inSourceTrack, inDestTrack, inSourceStartTime, inSourceEndTime, inDestInsertTime);
}

OSStatus MusicTrackMoveEvents(MusicTrack inTrack, MusicTimeStamp inStartTime, MusicTimeStamp inEndTime, MusicTimeStamp inMoveTime)
{
  return MEMORY[0x1F40D5138](inTrack, inStartTime, inEndTime, inMoveTime);
}

OSStatus MusicTrackNewAUPresetEvent(MusicTrack inTrack, MusicTimeStamp inTimeStamp, const AUPresetEvent *inPresetEvent)
{
  return MEMORY[0x1F40D5140](inTrack, inPresetEvent, inTimeStamp);
}

OSStatus MusicTrackNewExtendedNoteEvent(MusicTrack inTrack, MusicTimeStamp inTimeStamp, const ExtendedNoteOnEvent *inInfo)
{
  return MEMORY[0x1F40D5148](inTrack, inInfo, inTimeStamp);
}

OSStatus MusicTrackNewExtendedTempoEvent(MusicTrack inTrack, MusicTimeStamp inTimeStamp, Float64 inBPM)
{
  return MEMORY[0x1F40D5150](inTrack, inTimeStamp, inBPM);
}

OSStatus MusicTrackNewMIDIChannelEvent(MusicTrack inTrack, MusicTimeStamp inTimeStamp, const MIDIChannelMessage *inMessage)
{
  return MEMORY[0x1F40D5158](inTrack, inMessage, inTimeStamp);
}

OSStatus MusicTrackNewMIDINoteEvent(MusicTrack inTrack, MusicTimeStamp inTimeStamp, const MIDINoteMessage *inMessage)
{
  return MEMORY[0x1F40D5160](inTrack, inMessage, inTimeStamp);
}

OSStatus MusicTrackNewMIDIRawDataEvent(MusicTrack inTrack, MusicTimeStamp inTimeStamp, const MIDIRawData *inRawData)
{
  return MEMORY[0x1F40D5168](inTrack, inRawData, inTimeStamp);
}

OSStatus MusicTrackNewMetaEvent(MusicTrack inTrack, MusicTimeStamp inTimeStamp, const MIDIMetaEvent *inMetaEvent)
{
  return MEMORY[0x1F40D5170](inTrack, inMetaEvent, inTimeStamp);
}

OSStatus MusicTrackNewParameterEvent(MusicTrack inTrack, MusicTimeStamp inTimeStamp, const ParameterEvent *inInfo)
{
  return MEMORY[0x1F40D5178](inTrack, inInfo, inTimeStamp);
}

OSStatus MusicTrackNewUserEvent(MusicTrack inTrack, MusicTimeStamp inTimeStamp, const MusicEventUserData *inUserData)
{
  return MEMORY[0x1F40D5180](inTrack, inUserData, inTimeStamp);
}

OSStatus MusicTrackSetDestMIDIEndpoint(MusicTrack inTrack, MIDIEndpointRef inEndpoint)
{
  return MEMORY[0x1F40D5188](inTrack, *(void *)&inEndpoint);
}

uint64_t MusicTrackSetDestinationAU()
{
  return MEMORY[0x1F40D5190]();
}

OSStatus MusicTrackSetProperty(MusicTrack inTrack, UInt32 inPropertyID, void *inData, UInt32 inLength)
{
  return MEMORY[0x1F40D5198](inTrack, *(void *)&inPropertyID, inData, *(void *)&inLength);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

OSStatus NewAUGraph(AUGraph *outGraph)
{
  return MEMORY[0x1F40D51A0](outGraph);
}

OSStatus NewMusicEventIterator(MusicTrack inTrack, MusicEventIterator *outIterator)
{
  return MEMORY[0x1F40D51A8](inTrack, outIterator);
}

OSStatus NewMusicPlayer(MusicPlayer *outPlayer)
{
  return MEMORY[0x1F40D51B0](outPlayer);
}

OSStatus NewMusicSequence(MusicSequence *outSequence)
{
  return MEMORY[0x1F40D51B8](outSequence);
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1F40C99E8](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
}

uint64_t RegisterForIsolatedAudio()
{
  return MEMORY[0x1F41276E0]();
}

uint64_t RequestIsolatedAudio()
{
  return MEMORY[0x1F41276E8]();
}

uint64_t SetAudioLapseHandler()
{
  return MEMORY[0x1F41276F8]();
}

uint64_t StartIsolatedAudio()
{
  return MEMORY[0x1F4127710]();
}

uint64_t StartIsolatedAudioAtTime()
{
  return MEMORY[0x1F4127718]();
}

uint64_t StopIsolatedAudio()
{
  return MEMORY[0x1F4127720]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t MIDI::LegacyPacketList::create()
{
  return MEMORY[0x1F40DB690]();
}

uint64_t MIDI::LegacyPacketListDeleter::operator()()
{
  return MEMORY[0x1F40DB698]();
}

uint64_t caulk::concurrent::details::lf_read_sync_write_impl::end_mutate(caulk::concurrent::details::lf_read_sync_write_impl *this)
{
  return MEMORY[0x1F41778C0](this);
}

uint64_t caulk::concurrent::details::lf_read_sync_write_impl::begin_mutate(caulk::concurrent::details::lf_read_sync_write_impl *this)
{
  return MEMORY[0x1F41778C8](this);
}

uint64_t caulk::concurrent::details::lf_read_sync_write_impl::lf_read_sync_write_impl(caulk::concurrent::details::lf_read_sync_write_impl *this)
{
  return MEMORY[0x1F41778D0](this);
}

void caulk::concurrent::message::~message(caulk::concurrent::message *this)
{
}

uint64_t caulk::concurrent::messenger::drain(caulk::concurrent::messenger *this)
{
  return MEMORY[0x1F41778F0](this);
}

uint64_t caulk::concurrent::messenger::enqueue(caulk::concurrent::messenger *this, caulk::concurrent::message *a2)
{
  return MEMORY[0x1F41778F8](this, a2);
}

uint64_t caulk::concurrent::messenger::messenger()
{
  return MEMORY[0x1F4177900]();
}

void caulk::concurrent::messenger::~messenger(caulk::concurrent::messenger *this)
{
}

uint64_t caulk::pooled_semaphore_mutex::_lock(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x1F4177948](this);
}

uint64_t caulk::pooled_semaphore_mutex::_unlock(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x1F4177950](this);
}

uint64_t caulk::pooled_semaphore_mutex::try_lock(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x1F4177958](this);
}

uint64_t caulk::pooled_semaphore_mutex::pooled_semaphore_mutex(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x1F4177960](this);
}

uint64_t caulk::semaphore::timed_wait(caulk::semaphore *this, double a2)
{
  return MEMORY[0x1F4177B70](this, a2);
}

uint64_t caulk::semaphore::signal(caulk::semaphore *this)
{
  return MEMORY[0x1F4177B78](this);
}

uint64_t caulk::semaphore::semaphore(caulk::semaphore *this)
{
  return MEMORY[0x1F4177B80](this);
}

void caulk::semaphore::~semaphore(caulk::semaphore *this)
{
}

uint64_t caulk::concurrent::details::lf_read_sync_write_impl::end_access(caulk::concurrent::details::lf_read_sync_write_impl *this)
{
  return MEMORY[0x1F4177B90](this);
}

uint64_t caulk::concurrent::details::lf_read_sync_write_impl::begin_access(caulk::concurrent::details::lf_read_sync_write_impl *this)
{
  return MEMORY[0x1F4177B98](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E438](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E868]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8B0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

BOOL std::recursive_mutex::try_lock(std::recursive_mutex *this)
{
  return MEMORY[0x1F417E9C8](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x1F417E9D0](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __udivti3()
{
  return MEMORY[0x1F40C9D08]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40C9F90]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1F40CC320](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

float hypotf(float a1, float a2)
{
  MEMORY[0x1F40CC640](a1, a2);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1F40CD920](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1F40CD950](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD958](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1F40CD9A0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x1F40CD9E0](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA90](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_issue_generic()
{
  return MEMORY[0x1F40CDE20]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int sched_yield(void)
{
  return MEMORY[0x1F40CDEC8]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_rmsqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vflt16(const __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vflt32(const int *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}