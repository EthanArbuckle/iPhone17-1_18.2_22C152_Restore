id sub_235F71790()
{
  void *v0;
  uint64_t vars8;

  if (qword_26AEAE410 != -1) {
    dispatch_once(&qword_26AEAE410, &unk_26E94FB88);
  }
  v0 = (void *)qword_26AEAE418;

  return v0;
}

uint64_t sub_235F7186C()
{
  qword_26AEAE418 = (uint64_t)os_log_create("com.apple.adplatforms", "Attribution");

  return MEMORY[0x270F9A758]();
}

id *sub_235F718B0(id *a1, void *a2, char a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a4;
  if (a1 && v8)
  {
    v25.receiver = a1;
    v25.super_class = (Class)AAAttributionRequester;
    v10 = (id *)objc_msgSendSuper2(&v25, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      uint64_t v17 = objc_msgSend_remoteObjectProxy(v11[2], v12, v13, v14, v15, v16);
      id v18 = v11[3];
      v11[3] = (id)v17;

      *((_DWORD *)v11 + 3) = 0;
      *((unsigned char *)v11 + 9) = a3;
      objc_storeStrong(v11 + 4, a4);
      v19 = APPerfLogForCategory();
      v11[5] = (id)os_signpost_id_generate(v19);

      v20 = APPerfLogForCategory();
      v21 = v20;
      os_signpost_id_t v22 = (os_signpost_id_t)v11[5];
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_DWORD *)buf = 134349056;
        os_signpost_id_t v27 = v22;
        _os_signpost_emit_with_name_impl(&dword_235F70000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
      }
    }
    a1 = v11;
    v23 = a1;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

id sub_235F71A44(id val, void *a2)
{
  uint64_t v2 = (uint64_t)val;
  uint64_t v301 = *MEMORY[0x263EF8340];
  if (!val) {
    goto LABEL_72;
  }
  objc_initWeak(&location, val);
  uint64_t v3 = 0;
  uint64_t v290 = 0;
  v291 = &v290;
  uint64_t v292 = 0x3032000000;
  v293 = sub_235F7259C;
  v294 = sub_235F725AC;
  id v295 = 0;
  *(void *)&long long v4 = 134349056;
  long long v280 = v4;
  char v5 = 1;
  while (1)
  {
    char v6 = v5;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v287[0] = MEMORY[0x263EF8330];
    v287[1] = 3221225472;
    v287[2] = sub_235F725B4;
    v287[3] = &unk_264C96B78;
    objc_copyWeak(&v289, &location);
    id v8 = v7;
    v288 = v8;
    id v9 = *(id *)(v2 + 16);
    objc_msgSend_setInterruptionHandler_(v9, v10, (uint64_t)v287, v11, v12, v13);

    objc_msgSend_setConnectionInterrupted_((void *)v2, v14, 0, v15, v16, v17);
    __uint64_t v18 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v19 = APPerfLogForCategory();
    os_signpost_id_t v25 = objc_msgSend_intervalId((void *)v2, v20, v21, v22, v23, v24);
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      uint64_t v31 = objc_msgSend_intervalId((void *)v2, v26, v27, v28, v29, v30);
      *(_DWORD *)buf = 134349312;
      uint64_t v298 = v31;
      __int16 v299 = 2050;
      uint64_t v300 = v3;
      _os_signpost_emit_with_name_impl(&dword_235F70000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v25, "Token Request XPC", "id=%{public, name=id}lld retryCount=%{public, name=retryCount}ld", buf, 0x16u);
    }

    v37 = objc_msgSend_remoteProxy((void *)v2, v32, v33, v34, v35, v36);
    v43 = objc_msgSend_requestTime((void *)v2, v38, v39, v40, v41, v42);
    uint64_t v49 = objc_msgSend_intervalId((void *)v2, v44, v45, v46, v47, v48);
    v283[0] = MEMORY[0x263EF8330];
    v283[1] = 3221225472;
    v283[2] = sub_235F72644;
    v283[3] = &unk_264C96BA0;
    objc_copyWeak(&v286, &location);
    v285 = &v290;
    v50 = v8;
    v284 = v50;
    objc_msgSend_attributionTokenRequestTimestamp_interval_completionHandler_(v37, v51, (uint64_t)v43, v49, (uint64_t)v283, v52);

    if (objc_msgSend_isMainThread((void *)v2, v53, v54, v55, v56, v57)) {
      int64_t v58 = 1500000000;
    }
    else {
      int64_t v58 = 10000000000;
    }
    dispatch_time_t v59 = dispatch_time(0, v58);
    intptr_t v60 = dispatch_semaphore_wait(v50, v59);
    __uint64_t v61 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v62 = APPerfLogForCategory();
    os_signpost_id_t v68 = objc_msgSend_intervalId((void *)v2, v63, v64, v65, v66, v67);
    if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      uint64_t v74 = objc_msgSend_intervalId((void *)v2, v69, v70, v71, v72, v73);
      v75 = NSNumber;
      uint64_t isMainThread = objc_msgSend_isMainThread((void *)v2, v76, v77, v78, v79, v80);
      v86 = objc_msgSend_numberWithBool_(v75, v82, isMainThread, v83, v84, v85);
      *(_DWORD *)buf = 134349314;
      uint64_t v298 = v74;
      __int16 v299 = 2114;
      uint64_t v300 = (uint64_t)v86;
      _os_signpost_emit_with_name_impl(&dword_235F70000, v62, OS_SIGNPOST_INTERVAL_END, v68, "Token Request XPC", "id=%{public, name=id}lld thread=%{public, name=thread}@", buf, 0x16u);
    }
    BOOL v92 = v60 == 0;
    if (v60)
    {
      v93 = APLogForCategory();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235F70000, v93, OS_LOG_TYPE_ERROR, "AAAttribution XPC call timed out.", buf, 2u);
      }

      if (a2)
      {
        objc_msgSend__createInternalError(AAAttributionRequester, v94, v95, v96, v97, v98);
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend__sendAnalyticsAndInvalidateConnection_end_((void *)v2, v94, v18, v61, v97, v98, v280);
      if (objc_msgSend_isMainThread((void *)v2, v99, v100, v101, v102, v103)) {
        objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v104, 1, 0, v105, v106, 0.0);
      }
      else {
        objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v104, 2, 0, v105, v106, 0.0);
      }
      v107 = APPerfLogForCategory();
      os_signpost_id_t v113 = objc_msgSend_intervalId((void *)v2, v108, v109, v110, v111, v112);
      if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
      {
        uint64_t v119 = objc_msgSend_intervalId((void *)v2, v114, v115, v116, v117, v118);
        *(_DWORD *)buf = v280;
        uint64_t v298 = v119;
        _os_signpost_emit_with_name_impl(&dword_235F70000, v107, OS_SIGNPOST_INTERVAL_END, v113, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
      }
LABEL_29:

      int v133 = 0;
      goto LABEL_30;
    }
    if (objc_msgSend_connectionInterrupted((void *)v2, v87, v88, v89, v90, v91))
    {
      v120 = APPerfLogForCategory();
      os_signpost_id_t v126 = objc_msgSend_intervalId((void *)v2, v121, v122, v123, v124, v125);
      if (v126 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v120))
      {
        uint64_t v132 = objc_msgSend_intervalId((void *)v2, v127, v128, v129, v130, v131);
        *(_DWORD *)buf = v280;
        uint64_t v298 = v132;
        _os_signpost_emit_with_name_impl(&dword_235F70000, v120, OS_SIGNPOST_EVENT, v126, "Connection Interrupted", "Connection Interrupted id=%{public, name=id}lld", buf, 0xCu);
      }

      v107 = APLogForCategory();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235F70000, v107, OS_LOG_TYPE_INFO, "AAAttribution XPC call interrupted. Initiating a retry.", buf, 2u);
      }
      goto LABEL_29;
    }
    BOOL v92 = 0;
    int v133 = 1;
LABEL_30:

    objc_destroyWeak(&v286);
    objc_destroyWeak(&v289);

    if (!v92) {
      break;
    }
    char v5 = 0;
    uint64_t v3 = 1;
    if ((v6 & 1) == 0) {
      goto LABEL_35;
    }
  }
  if (!v133)
  {
    uint64_t v2 = 0;
    goto LABEL_71;
  }
LABEL_35:
  if (objc_msgSend_connectionInterrupted((void *)v2, v134, v135, v136, v137, v138, v280))
  {
    if (a2)
    {
      objc_msgSend__createInternalError(AAAttributionRequester, v139, v140, v141, v142, v143);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v144 = APLogForCategory();
    if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235F70000, v144, OS_LOG_TYPE_ERROR, "AAAttribution XPC call failed.", buf, 2u);
    }

    id v145 = *(id *)(v2 + 16);
    objc_msgSend_invalidate(v145, v146, v147, v148, v149, v150);

    objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v151, 0, 0, v152, v153, 0.0);
    v154 = APPerfLogForCategory();
    os_signpost_id_t v160 = objc_msgSend_intervalId((void *)v2, v155, v156, v157, v158, v159);
    if (v160 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
    {
      uint64_t v166 = objc_msgSend_intervalId((void *)v2, v161, v162, v163, v164, v165);
      *(_DWORD *)buf = v281;
      uint64_t v298 = v166;
      _os_signpost_emit_with_name_impl(&dword_235F70000, v154, OS_SIGNPOST_INTERVAL_END, v160, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
    }
    goto LABEL_69;
  }
  objc_msgSend__sendAnalyticsAndInvalidateConnection_end_((void *)v2, v139, v18, v61, v142, v143);
  os_unfair_lock_lock_with_options();
  v154 = (id)v291[5];
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 12));
  if (objc_msgSend_success(v154, v167, v168, v169, v170, v171))
  {
    if (objc_msgSend_source(v154, v172, v173, v174, v175, v176))
    {
      uint64_t v182 = objc_msgSend_source(v154, v177, v178, v179, v180, v181);
      uint64_t v187 = objc_msgSend__tokenStatusFromTokenSource_(AAAttributionRequester, v183, v182, v184, v185, v186);
      v193 = objc_msgSend_storeFront(v154, v188, v189, v190, v191, v192);
      objc_msgSend_daemonRunningTime(v154, v194, v195, v196, v197, v198);
      objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v199, v187, (uint64_t)v193, v200, v201);
    }
    else
    {
      objc_msgSend_cStringUsingEncoding_(@"com.apple.ap.AdPlatformsCommon", v177, 30, v179, v180, v181);
      if (os_variant_has_internal_content()
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        sub_235F730A8();
      }
    }
    v209 = APPerfLogForCategory();
    os_signpost_id_t v215 = objc_msgSend_intervalId((void *)v2, v210, v211, v212, v213, v214);
    if (v215 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v209))
    {
      uint64_t v221 = objc_msgSend_intervalId((void *)v2, v216, v217, v218, v219, v220);
      *(_DWORD *)buf = v281;
      uint64_t v298 = v221;
      _os_signpost_emit_with_name_impl(&dword_235F70000, v209, OS_SIGNPOST_INTERVAL_END, v215, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
    }

    uint64_t v2 = objc_msgSend_token(v154, v222, v223, v224, v225, v226);
    goto LABEL_70;
  }
  if (a2)
  {
    v202 = objc_msgSend_error(v154, v172, v173, v174, v175, v176);
    v208 = v202;
    if (v202)
    {
      *a2 = v202;
    }
    else
    {
      objc_msgSend__createInternalError(AAAttributionRequester, v203, v204, v205, v206, v207);
      id v227 = objc_claimAutoreleasedReturnValue();
      *a2 = v227;
    }
  }
  v233 = objc_msgSend_error(v154, v172, v173, v174, v175, v176);
  if (v233)
  {
    v234 = objc_msgSend_error(v154, v228, v229, v230, v231, v232);
    if (objc_msgSend_code(v234, v235, v236, v237, v238, v239) == 3)
    {
      v245 = objc_msgSend_error(v154, v240, v241, v242, v243, v244);
      v251 = objc_msgSend_domain(v245, v246, v247, v248, v249, v250);
      char isEqualToString = objc_msgSend_isEqualToString_(v251, v252, @"com.apple.ap.adservices.attributionError", v253, v254, v255);

      if (isEqualToString) {
        goto LABEL_65;
      }
    }
    else
    {
    }
  }
  v257 = objc_msgSend_storeFront(v154, v228, v229, v230, v231, v232);
  objc_msgSend_daemonRunningTime(v154, v258, v259, v260, v261, v262);
  objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v263, 0, (uint64_t)v257, v264, v265);

LABEL_65:
  v266 = APPerfLogForCategory();
  os_signpost_id_t v272 = objc_msgSend_intervalId((void *)v2, v267, v268, v269, v270, v271);
  if (v272 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v266))
  {
    uint64_t v278 = objc_msgSend_intervalId((void *)v2, v273, v274, v275, v276, v277);
    *(_DWORD *)buf = v281;
    uint64_t v298 = v278;
    _os_signpost_emit_with_name_impl(&dword_235F70000, v266, OS_SIGNPOST_INTERVAL_END, v272, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
  }

LABEL_69:
  uint64_t v2 = 0;
LABEL_70:

LABEL_71:
  _Block_object_dispose(&v290, 8);

  objc_destroyWeak(&location);
LABEL_72:

  return (id)v2;
}

void sub_235F724C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id *location, id *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  objc_destroyWeak((id *)(v34 - 152));
  _Unwind_Resume(a1);
}

uint64_t sub_235F7259C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_235F725AC(uint64_t a1)
{
}

intptr_t sub_235F725B4(uint64_t a1)
{
  uint64_t v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_235F70000, v2, OS_LOG_TYPE_INFO, "AAAttribution XPC connection interrupted. Lost connection.", v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_setConnectionInterrupted_(WeakRetained, v4, 1, v5, v6, v7);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_235F72644(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    os_unfair_lock_unlock(WeakRetained + 3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_235F728BC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v72[3] = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = objc_msgSend_requestTime(*(void **)(a1 + 40), a2, a3, a4, a5, a6);
  objc_msgSend_timeIntervalSinceDate_(v7, v9, (uint64_t)v8, v10, v11, v12);
  double v14 = v13;

  uint64_t BucketForDaemonRunningTime = objc_msgSend__findBucketForDaemonRunningTime_(AAAttributionRequester, v15, v16, v17, v18, v19, *(double *)(a1 + 56));
  v71[0] = @"tokenClientVendingTime";
  os_signpost_id_t v25 = objc_msgSend_numberWithInteger_(NSNumber, v21, (uint64_t)(v14 * 1000.0), v22, v23, v24);
  v72[0] = v25;
  v71[1] = @"tokenStatus";
  uint64_t v30 = objc_msgSend_numberWithInteger_(NSNumber, v26, *(void *)(a1 + 64), v27, v28, v29);
  v72[1] = v30;
  v71[2] = @"daemonRunningTime";
  uint64_t v35 = objc_msgSend_numberWithInteger_(NSNumber, v31, BucketForDaemonRunningTime, v32, v33, v34);
  v72[2] = v35;
  v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)v72, (uint64_t)v71, 3, v37);

  if (*(void *)(a1 + 48))
  {
    v44 = objc_msgSend_mutableCopy(v38, v39, v40, v41, v42, v43);
    uint64_t v49 = objc_msgSend_componentsSeparatedByString_(*(void **)(a1 + 48), v45, @"-", v46, v47, v48);
    if (objc_msgSend_count(v49, v50, v51, v52, v53, v54))
    {
      intptr_t v60 = objc_msgSend_firstObject(v49, v55, v56, v57, v58, v59);
      objc_msgSend_setObject_forKey_(v44, v61, (uint64_t)v60, @"storeFront", v62, v63);
    }
    else
    {
      objc_msgSend_setObject_forKey_(v44, v55, *(void *)(a1 + 48), @"storeFront", v58, v59);
    }
    uint64_t v69 = objc_msgSend_copy(v44, v64, v65, v66, v67, v68);

    v38 = (void *)v69;
  }

  return v38;
}

uint64_t sub_235F72C38(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    return objc_msgSend_invalidate(*(void **)(v6 + 16), a2, a3, a4, a5, a6);
  }
  else {
    return objc_msgSend_invalidate(0, a2, a3, a4, a5, a6);
  }
}

void sub_235F730A8()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_235F70000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Simulating crash with description: \"Unexpected token source AATokenSourceNone\"", v0, 2u);
}

uint64_t APLogForCategory()
{
  return MEMORY[0x270F08BC8]();
}

uint64_t APPerfLogForCategory()
{
  return MEMORY[0x270F08BD0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
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

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}