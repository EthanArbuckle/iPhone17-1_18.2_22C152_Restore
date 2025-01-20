uint64_t LBAttendingStatesServiceGetXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D12A6E8];
}

uint64_t LBAttendingStatesServiceDelegateGetXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D12A598];
}

void sub_21F71C9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F720C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F72359C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSXPCClientClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!CoreSpeechLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __CoreSpeechLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264522150;
    uint64_t v8 = 0;
    CoreSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreSpeechLibraryCore_frameworkLibrary)
  {
    v3 = [MEMORY[0x263F08690] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *CoreSpeechLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LBAudioCapture.m", 22, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CSXPCClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = [MEMORY[0x263F08690] currentHandler];
    v5 = [NSString stringWithUTF8String:"Class getCSXPCClientClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"LBAudioCapture.m", 23, @"Unable to find class %s", "CSXPCClient");

LABEL_10:
    __break(1u);
  }
  getCSXPCClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSpeechLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSpeechLibraryCore_frameworkLibrary = result;
  return result;
}

id LBLocalSpeechServiceGetXPCInterface()
{
  v27[6] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D12D8D0];
  v1 = (void *)MEMORY[0x263EFFA08];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  v27[4] = objc_opt_class();
  v27[5] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:6];
  v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_startSpeechRecognitionResultsWithSettings_ argumentIndex:0 ofReply:0];

  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v26 = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_stopSpeechRecognitionWithReason_requestId_ argumentIndex:1 ofReply:0];

  long long v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v25 = objc_opt_class();
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  uint64_t v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_disableLocalSpeechRecognitionForRequestId_ argumentIndex:0 ofReply:0];

  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_sendSpeechCorrectionInfo_interactionIdentifier_ argumentIndex:0 ofReply:0];

  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v23 = objc_opt_class();
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  v15 = [v13 setWithArray:v14];
  [v0 setClasses:v15 forSelector:sel_sendSpeechCorrectionInfo_interactionIdentifier_ argumentIndex:1 ofReply:0];

  v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:3];
  v18 = objc_msgSend(v16, "setWithArray:", v17, v20, v21);
  [v0 setClasses:v18 forSelector:sel_updateTCUState_ argumentIndex:0 ofReply:0];

  return v0;
}

id LBLocalSpeechServiceDelegateGetXPCInterface()
{
  v146[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D129C10];
  v1 = (void *)MEMORY[0x263EFFA08];
  v146[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v146 count:1];
  v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_ argumentIndex:0 ofReply:0];

  v4 = (void *)MEMORY[0x263EFFA08];
  v145[0] = objc_opt_class();
  v145[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:2];
  v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_ argumentIndex:2 ofReply:0];

  long long v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v144 = objc_opt_class();
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v144 count:1];
  uint64_t v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_metadata_ argumentIndex:0 ofReply:0];

  v10 = (void *)MEMORY[0x263EFFA08];
  v143[0] = objc_opt_class();
  v143[1] = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v143 count:2];
  v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_metadata_ argumentIndex:2 ofReply:0];

  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v142 = objc_opt_class();
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v142 count:1];
  v15 = [v13 setWithArray:v14];
  [v0 setClasses:v15 forSelector:sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_metadata_ argumentIndex:3 ofReply:0];

  v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v141 = objc_opt_class();
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v141 count:1];
  v18 = [v16 setWithArray:v17];
  [v0 setClasses:v18 forSelector:sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_speechPackage_metadata_ argumentIndex:0 ofReply:0];

  v19 = (void *)MEMORY[0x263EFFA08];
  v140[0] = objc_opt_class();
  v140[1] = objc_opt_class();
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:2];
  uint64_t v21 = [v19 setWithArray:v20];
  [v0 setClasses:v21 forSelector:sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_speechPackage_metadata_ argumentIndex:2 ofReply:0];

  uint64_t v22 = (void *)MEMORY[0x263EFFA08];
  uint64_t v139 = objc_opt_class();
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v139 count:1];
  uint64_t v24 = [v22 setWithArray:v23];
  [v0 setClasses:v24 forSelector:sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_speechPackage_metadata_ argumentIndex:3 ofReply:0];

  uint64_t v25 = (void *)MEMORY[0x263EFFA08];
  uint64_t v138 = objc_opt_class();
  uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v138 count:1];
  v27 = [v25 setWithArray:v26];
  [v0 setClasses:v27 forSelector:sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_ argumentIndex:0 ofReply:0];

  v28 = (void *)MEMORY[0x263EFFA08];
  uint64_t v137 = objc_opt_class();
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v137 count:1];
  v30 = [v28 setWithArray:v29];
  [v0 setClasses:v30 forSelector:sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_ argumentIndex:1 ofReply:0];

  v31 = (void *)MEMORY[0x263EFFA08];
  uint64_t v136 = objc_opt_class();
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v136 count:1];
  v33 = [v31 setWithArray:v32];
  [v0 setClasses:v33 forSelector:sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_metadata_ argumentIndex:0 ofReply:0];

  v34 = (void *)MEMORY[0x263EFFA08];
  uint64_t v135 = objc_opt_class();
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v135 count:1];
  v36 = [v34 setWithArray:v35];
  [v0 setClasses:v36 forSelector:sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_metadata_ argumentIndex:1 ofReply:0];

  v37 = (void *)MEMORY[0x263EFFA08];
  uint64_t v134 = objc_opt_class();
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v134 count:1];
  v39 = [v37 setWithArray:v38];
  [v0 setClasses:v39 forSelector:sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_metadata_ argumentIndex:2 ofReply:0];

  v40 = (void *)MEMORY[0x263EFFA08];
  uint64_t v133 = objc_opt_class();
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v133 count:1];
  v42 = [v40 setWithArray:v41];
  [v0 setClasses:v42 forSelector:sel_localSpeechServiceDidCompletionRecognitionWithStatistics_requestId_endpointMode_error_ argumentIndex:1 ofReply:0];

  v43 = (void *)MEMORY[0x263EFFA08];
  uint64_t v132 = objc_opt_class();
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v132 count:1];
  v45 = [v43 setWithArray:v44];
  [v0 setClasses:v45 forSelector:sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_ argumentIndex:0 ofReply:0];

  v46 = (void *)MEMORY[0x263EFFA08];
  uint64_t v131 = objc_opt_class();
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v131 count:1];
  v48 = [v46 setWithArray:v47];
  [v0 setClasses:v48 forSelector:sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_ argumentIndex:2 ofReply:0];

  v49 = (void *)MEMORY[0x263EFFA08];
  uint64_t v130 = objc_opt_class();
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v130 count:1];
  v51 = [v49 setWithArray:v50];
  [v0 setClasses:v51 forSelector:sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_metadata_ argumentIndex:0 ofReply:0];

  v52 = (void *)MEMORY[0x263EFFA08];
  uint64_t v129 = objc_opt_class();
  v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v129 count:1];
  v54 = [v52 setWithArray:v53];
  [v0 setClasses:v54 forSelector:sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_metadata_ argumentIndex:2 ofReply:0];

  v55 = (void *)MEMORY[0x263EFFA08];
  uint64_t v128 = objc_opt_class();
  v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v128 count:1];
  v57 = [v55 setWithArray:v56];
  [v0 setClasses:v57 forSelector:sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_metadata_ argumentIndex:4 ofReply:0];

  v58 = (void *)MEMORY[0x263EFFA08];
  uint64_t v127 = objc_opt_class();
  v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v127 count:1];
  v60 = [v58 setWithArray:v59];
  [v0 setClasses:v60 forSelector:sel_localSpeechServiceDidReceivedEagerResultWithRequestId_rcId_shouldAccept_mitigationSignal_featuresToLog_ argumentIndex:0 ofReply:0];

  v61 = (void *)MEMORY[0x263EFFA08];
  uint64_t v126 = objc_opt_class();
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v126 count:1];
  v63 = [v61 setWithArray:v62];
  [v0 setClasses:v63 forSelector:sel_localSpeechServiceDidReceivedEagerResultWithRequestId_rcId_shouldAccept_mitigationSignal_featuresToLog_ argumentIndex:1 ofReply:0];

  v64 = (void *)MEMORY[0x263EFFA08];
  v125[0] = objc_opt_class();
  v125[1] = objc_opt_class();
  v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:2];
  v66 = [v64 setWithArray:v65];
  [v0 setClasses:v66 forSelector:sel_localSpeechServiceDidReceivedEagerResultWithRequestId_rcId_shouldAccept_mitigationSignal_featuresToLog_ argumentIndex:4 ofReply:0];

  v67 = (void *)MEMORY[0x263EFFA08];
  uint64_t v124 = objc_opt_class();
  v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v124 count:1];
  v69 = [v67 setWithArray:v68];
  [v0 setClasses:v69 forSelector:sel_localSpeechServiceDidReceivedVoiceIdScoreCard_ argumentIndex:0 ofReply:0];

  v70 = (void *)MEMORY[0x263EFFA08];
  uint64_t v123 = objc_opt_class();
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v123 count:1];
  v72 = [v70 setWithArray:v71];
  [v0 setClasses:v72 forSelector:sel_localSpeechServiceDidReceivedFinalResultCandidateWithRequestId_speechPackage_ argumentIndex:1 ofReply:0];

  v73 = (void *)MEMORY[0x263EFFA08];
  uint64_t v122 = objc_opt_class();
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v122 count:1];
  v75 = [v73 setWithArray:v74];
  [v0 setClasses:v75 forSelector:sel_localSpeechServiceDidReceivedVoiceCommandCandidateWithRequestId_speechPackage_metadata_ argumentIndex:0 ofReply:0];

  v76 = (void *)MEMORY[0x263EFFA08];
  uint64_t v121 = objc_opt_class();
  v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v121 count:1];
  v78 = [v76 setWithArray:v77];
  [v0 setClasses:v78 forSelector:sel_localSpeechServiceDidReceivedVoiceCommandCandidateWithRequestId_speechPackage_metadata_ argumentIndex:1 ofReply:0];

  v79 = (void *)MEMORY[0x263EFFA08];
  uint64_t v120 = objc_opt_class();
  v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v120 count:1];
  v81 = [v79 setWithArray:v80];
  [v0 setClasses:v81 forSelector:sel_localSpeechServiceDidReceivedVoiceCommandCandidateWithRequestId_speechPackage_metadata_ argumentIndex:2 ofReply:0];

  v82 = (void *)MEMORY[0x263EFFA08];
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2050000000;
  v83 = (void *)getSMTTRPCandidateClass_softClass;
  uint64_t v114 = getSMTTRPCandidateClass_softClass;
  if (!getSMTTRPCandidateClass_softClass)
  {
    uint64_t v106 = MEMORY[0x263EF8330];
    uint64_t v107 = 3221225472;
    v108 = __getSMTTRPCandidateClass_block_invoke;
    v109 = &unk_2645221D8;
    v110 = &v111;
    __getSMTTRPCandidateClass_block_invoke((uint64_t)&v106);
    v83 = (void *)v112[3];
  }
  id v84 = v83;
  _Block_object_dispose(&v111, 8);
  uint64_t v119 = objc_opt_class();
  v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v119 count:1];
  v86 = [v82 setWithArray:v85];
  [v0 setClasses:v86 forSelector:sel_localSpeechServiceDidReceiveTRPCandidatePackage_ argumentIndex:0 ofReply:0];

  v87 = (void *)MEMORY[0x263EFFA08];
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2050000000;
  v88 = (void *)getSMTContinuityEndClass_softClass;
  uint64_t v114 = getSMTContinuityEndClass_softClass;
  if (!getSMTContinuityEndClass_softClass)
  {
    uint64_t v106 = MEMORY[0x263EF8330];
    uint64_t v107 = 3221225472;
    v108 = __getSMTContinuityEndClass_block_invoke;
    v109 = &unk_2645221D8;
    v110 = &v111;
    __getSMTContinuityEndClass_block_invoke((uint64_t)&v106);
    v88 = (void *)v112[3];
  }
  id v89 = v88;
  _Block_object_dispose(&v111, 8);
  uint64_t v118 = objc_opt_class();
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v118 count:1];
  v91 = [v87 setWithArray:v90];
  [v0 setClasses:v91 forSelector:sel_localSpeechServiceDidReceiveContinuityEndDetected_ argumentIndex:0 ofReply:0];

  v92 = (void *)MEMORY[0x263EFFA08];
  v117[0] = objc_opt_class();
  v117[1] = objc_opt_class();
  v117[2] = objc_opt_class();
  v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:3];
  v94 = [v92 setWithArray:v93];
  [v0 setClasses:v94 forSelector:sel_localSpeechServiceDidReceiveTCUStateUpdate_ argumentIndex:0 ofReply:0];

  v95 = (void *)MEMORY[0x263EFFA08];
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2050000000;
  v96 = (void *)getSMTTRPDetectedClass_softClass;
  uint64_t v114 = getSMTTRPDetectedClass_softClass;
  if (!getSMTTRPDetectedClass_softClass)
  {
    uint64_t v106 = MEMORY[0x263EF8330];
    uint64_t v107 = 3221225472;
    v108 = __getSMTTRPDetectedClass_block_invoke;
    v109 = &unk_2645221D8;
    v110 = &v111;
    __getSMTTRPDetectedClass_block_invoke((uint64_t)&v106);
    v96 = (void *)v112[3];
  }
  id v97 = v96;
  _Block_object_dispose(&v111, 8);
  uint64_t v116 = objc_opt_class();
  v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v116 count:1];
  v99 = [v95 setWithArray:v98];
  [v0 setClasses:v99 forSelector:sel_localSpeechServiceDidReceiveTRPDetected_ argumentIndex:0 ofReply:0];

  v100 = (void *)MEMORY[0x263EFFA08];
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2050000000;
  v101 = (void *)getSMTMultiUserTRPCandidateClass_softClass;
  uint64_t v114 = getSMTMultiUserTRPCandidateClass_softClass;
  if (!getSMTMultiUserTRPCandidateClass_softClass)
  {
    uint64_t v106 = MEMORY[0x263EF8330];
    uint64_t v107 = 3221225472;
    v108 = __getSMTMultiUserTRPCandidateClass_block_invoke;
    v109 = &unk_2645221D8;
    v110 = &v111;
    __getSMTMultiUserTRPCandidateClass_block_invoke((uint64_t)&v106);
    v101 = (void *)v112[3];
  }
  id v102 = v101;
  _Block_object_dispose(&v111, 8);
  uint64_t v115 = objc_opt_class();
  v103 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v115 count:1];
  v104 = [v100 setWithArray:v103];
  [v0 setClasses:v104 forSelector:sel_localSpeechServiceDidReceiveMultiUserTRPCandidatePackage_ argumentIndex:0 ofReply:0];

  return v0;
}

void sub_21F726A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSMTTRPCandidateClass_block_invoke(uint64_t a1)
{
  SiriMessageTypesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SMTTRPCandidate");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSMTTRPCandidateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class getSMTTRPCandidateClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LBLocalSpeechService.m", 29, @"Unable to find class %s", "SMTTRPCandidate");

    __break(1u);
  }
}

void __getSMTContinuityEndClass_block_invoke(uint64_t a1)
{
  SiriMessageTypesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SMTContinuityEnd");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSMTContinuityEndClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class getSMTContinuityEndClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LBLocalSpeechService.m", 30, @"Unable to find class %s", "SMTContinuityEnd");

    __break(1u);
  }
}

void __getSMTTRPDetectedClass_block_invoke(uint64_t a1)
{
  SiriMessageTypesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SMTTRPDetected");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSMTTRPDetectedClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class getSMTTRPDetectedClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LBLocalSpeechService.m", 31, @"Unable to find class %s", "SMTTRPDetected");

    __break(1u);
  }
}

void __getSMTMultiUserTRPCandidateClass_block_invoke(uint64_t a1)
{
  SiriMessageTypesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SMTMultiUserTRPCandidate");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSMTMultiUserTRPCandidateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class getSMTMultiUserTRPCandidateClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LBLocalSpeechService.m", 32, @"Unable to find class %s", "SMTMultiUserTRPCandidate");

    __break(1u);
  }
}

void SiriMessageTypesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SiriMessageTypesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SiriMessageTypesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2645221F8;
    uint64_t v5 = 0;
    SiriMessageTypesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SiriMessageTypesLibraryCore_frameworkLibrary)
  {
    v1 = [MEMORY[0x263F08690] currentHandler];
    v2 = [NSString stringWithUTF8String:"void *SiriMessageTypesLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"LBLocalSpeechService.m", 28, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SiriMessageTypesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SiriMessageTypesLibraryCore_frameworkLibrary = result;
  return result;
}

void LBLogInitIfNeeded()
{
  if (LBLogInitIfNeeded_once != -1) {
    dispatch_once(&LBLogInitIfNeeded_once, &__block_literal_global);
  }
}

void __LBLogInitIfNeeded_block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  NSLog(&cfstr_InitializingLo.isa);
  os_log_t v0 = os_log_create((const char *)LBLoggingSubsystem, (const char *)kLBLoggingContextFramework);
  v1 = (void *)LBLogContextFacilityLocalSRBridge;
  LBLogContextFacilityLocalSRBridge = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  v3 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v2;

  long long v4 = (void *)_dateFormatter;
  uint64_t v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  [(id)_dateFormatter setDateFormat:@"yyyyMMdd-HHmmss"];
  uint64_t v6 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "LBLogInitIfNeeded_block_invoke";
    _os_log_impl(&dword_21F71B000, v6, OS_LOG_TYPE_DEFAULT, "%s ::: LocalSRBridge logging initialized", (uint8_t *)&v7, 0xCu);
  }
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}