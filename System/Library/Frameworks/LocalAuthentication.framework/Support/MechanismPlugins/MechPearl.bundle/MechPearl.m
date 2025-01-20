id sub_20C0()
{
  void *v0;
  uint64_t vars8;

  if (qword_114C8 != -1) {
    dispatch_once(&qword_114C8, &stru_C2D8);
  }
  v0 = (void *)qword_114D0;

  return v0;
}

id sub_238C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doneWaiting];
}

void sub_2884(id a1)
{
  qword_114D0 = (uint64_t)os_log_create("com.apple.LocalAuthentication", "CoachingFeedbackFilter");

  _objc_release_x1();
}

void sub_28C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_28F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

void sub_3300(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_331C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _matchOperation:*(void *)(a1 + 32) matchedWithResult:*(void *)(a1 + 40)];
}

void sub_3464(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_3480(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained + 11;
    uint64_t v5 = WeakRetained;
    objc_storeStrong(WeakRetained + 11, *(id *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v4 = *v3;
    *v3 = 0;

    id WeakRetained = v5;
  }
}

void sub_40A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_40CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  CFStringRef v7 = @"Result";
  uint64_t v8 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  uint64_t v5 = [*(id *)(a1 + 40) identity];
  v6 = [v5 uuid];
  [WeakRetained _succeedAuthenticationWithResult:v4 identityUUID:v6];
}

void sub_4280(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_429C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _operation:*(void *)(a1 + 32) finishedWithReason:*(void *)(a1 + 48)];
}

void sub_4574(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_4590(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _operation:*(void *)(a1 + 32) stateChanged:*(void *)(a1 + 48)];
}

void sub_4D18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_4D34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _operation:*(void *)(a1 + 32) presenceStateChanged:*(unsigned __int8 *)(a1 + 48)];
}

id sub_4FE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFaceDetectTimeout];
}

void sub_50C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_50E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _operation:*(void *)(a1 + 32) failedWithReason:*(void *)(a1 + 48)];
}

void sub_54BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_54D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _operation:*(void *)(a1 + 32) providedFeedback:*(void *)(a1 + 48)];
}

void *sub_607C(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[3])
  {
    result = [result isRunning];
    if (result)
    {
      result = *(void **)(a1 + 32);
      if (*(void *)(a1 + 40) == result[6])
      {
        return [result _finishFaceDetectPhase];
      }
    }
  }
  return result;
}

_UNKNOWN **sub_6A88(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) preCompanion];
  uint64_t v3 = [v2 rootMechanism];
  v4 = [v3 eventsDelegate];

  if (v4)
  {
    uint64_t v5 = &off_CBD0;
  }
  else
  {
    if (!v2) {
      goto LABEL_6;
    }
    if ([v2 axMode]) {
      goto LABEL_6;
    }
    v6 = [*(id *)(a1 + 32) request];
    CFStringRef v7 = [v6 options];
    uint64_t v8 = [v7 objectForKeyedSubscript:&off_CA20];
    unsigned __int8 v9 = [v8 BOOLValue];

    if (v9)
    {
LABEL_6:
      uint64_t v5 = 0;
    }
    else
    {
      unsigned int v11 = [v2 isCredentialValid];
      v12 = &off_CA98;
      if (v11) {
        v12 = &off_CB58;
      }
      uint64_t v5 = v12;
    }
  }

  return v5;
}

void sub_6EC0(void *a1)
{
  uint64_t v2 = a1[4];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[7];
    uint64_t v4 = a1[5];
    uint64_t v5 = (id *)(a1[6] + 64);
    v6 = v2;
    id WeakRetained = objc_loadWeakRetained(v5);
    v9[0] = 67109634;
    v9[1] = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    id v13 = WeakRetained;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Sending mechanism event after coaching %d (%@) to %@", (uint8_t *)v9, 0x1Cu);
  }
  id v8 = objc_loadWeakRetained((id *)(a1[6] + 64));
  [v8 mechanismEvent:a1[7] value:a1[5] reply:&stru_C568];
}

void sub_71A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_71CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isRunning]) {
    [WeakRetained _expireMatchThatStartedAt:*(void *)(a1 + 32)];
  }
}

void sub_7514(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_DWORD *)(a1 + 40) == dword_114D8)
  {
    uint64_t v3 = LACLogBiometry();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = WeakRetained;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ restarting after secure UI movement", (uint8_t *)&v4, 0xCu);
    }

    [WeakRetained pause:0 forEvent:7 error:0];
  }
}

void sub_77D8()
{
  sub_28E4();
  sub_28C8(&dword_0, v0, v1, "ignoring repeating feedback", v2, v3, v4, v5, v6);
}

void sub_780C(int a1, NSObject *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_28F0(&dword_0, a2, a3, "pending feedback: %d", (uint8_t *)v3);
}

void sub_787C(int a1, NSObject *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_28F0(&dword_0, a2, a3, "scheduling feedback: %d", (uint8_t *)v3);
}

void sub_78EC()
{
  sub_28E4();
  sub_28C8(&dword_0, v0, v1, "done waiting, no pending feedback", v2, v3, v4, v5, v6);
}

void sub_7920(id *a1, NSObject *a2)
{
  unsigned int v3 = [*a1 intValue];
  v5[0] = 67109120;
  v5[1] = v3;
  sub_28F0(&dword_0, a2, v4, "done waiting, found pending feedback: %d", (uint8_t *)v5);
}

void sub_79A8()
{
  sub_28E4();
  sub_28C8(&dword_0, v0, v1, "finished", v2, v3, v4, v5, v6);
}

void sub_79DC()
{
  sub_28E4();
  sub_28C8(&dword_0, v0, v1, "dispatched directly", v2, v3, v4, v5, v6);
}

void sub_7A10(uint64_t a1, NSObject *a2)
{
  unsigned int v3 = [*(id *)(a1 + 32) count];
  v5[0] = 67109120;
  v5[1] = v3;
  sub_28F0(&dword_0, a2, v4, "pending block[%d]", (uint8_t *)v5);
}

void sub_7A98(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 identity];
  [v5 userID];
  sub_77C4();
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_0, a3, OS_LOG_TYPE_FAULT, "failed to get hash for matched user %u: %{public}@", v6, 0x12u);
}

void sub_7B44(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Unknown coaching feedback: %d", (uint8_t *)v2, 8u);
}

void sub_7BBC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ will not restart in biolockout", (uint8_t *)&v2, 0xCu);
}

void sub_7C34(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%@ will not restart in biolockout.", (uint8_t *)&v2, 0xCu);
}

void sub_7CAC(void *a1, uint64_t a2, NSObject *a3)
{
  [a1 intValue];
  sub_77C4();
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Failed to pause/resume for feedback %d: %{public}@", v5, 0x12u);
}

void sub_7D3C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ failed to pause after secure UI movement: %{public}@", (uint8_t *)&v2, 0x16u);
}

uint64_t LACLogBiometry()
{
  return _LACLogBiometry();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__dispatchPendingBlocks(void *a1, const char *a2, ...)
{
  return [a1 _dispatchPendingBlocks];
}

id objc_msgSend__exceededFailureLimit(void *a1, const char *a2, ...)
{
  return [a1 _exceededFailureLimit];
}

id objc_msgSend__generateArtificialFaceOutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _generateArtificialFaceOutIfNeeded];
}

id objc_msgSend__pauseFaceIdAfterSecureUIMovement(void *a1, const char *a2, ...)
{
  return [a1 _pauseFaceIdAfterSecureUIMovement];
}

id objc_msgSend__setupCoachingFilter(void *a1, const char *a2, ...)
{
  return [a1 _setupCoachingFilter];
}

id objc_msgSend__shouldRespectFailureLimit(void *a1, const char *a2, ...)
{
  return [a1 _shouldRespectFailureLimit];
}

id objc_msgSend__shouldShowUIBeforeFailure(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowUIBeforeFailure];
}

id objc_msgSend__startBiometry(void *a1, const char *a2, ...)
{
  return [a1 _startBiometry];
}

id objc_msgSend__startMatching(void *a1, const char *a2, ...)
{
  return [a1 _startMatching];
}

id objc_msgSend__stopBiometry(void *a1, const char *a2, ...)
{
  return [a1 _stopBiometry];
}

id objc_msgSend_actionSuccess(void *a1, const char *a2, ...)
{
  return [a1 actionSuccess];
}

id objc_msgSend_analytics(void *a1, const char *a2, ...)
{
  return [a1 analytics];
}

id objc_msgSend_axMode(void *a1, const char *a2, ...)
{
  return [a1 axMode];
}

id objc_msgSend_backoffCounter(void *a1, const char *a2, ...)
{
  return [a1 backoffCounter];
}

id objc_msgSend_biolockout(void *a1, const char *a2, ...)
{
  return [a1 biolockout];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_checkCredentialValid(void *a1, const char *a2, ...)
{
  return [a1 checkCredentialValid];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credentialAdded(void *a1, const char *a2, ...)
{
  return [a1 credentialAdded];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_evaluationMode(void *a1, const char *a2, ...)
{
  return [a1 evaluationMode];
}

id objc_msgSend_eventIdentifier(void *a1, const char *a2, ...)
{
  return [a1 eventIdentifier];
}

id objc_msgSend_eventsDelegate(void *a1, const char *a2, ...)
{
  return [a1 eventsDelegate];
}

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return [a1 externalizedContext];
}

id objc_msgSend_faceIdInstance(void *a1, const char *a2, ...)
{
  return [a1 faceIdInstance];
}

id objc_msgSend_failureLimit(void *a1, const char *a2, ...)
{
  return [a1 failureLimit];
}

id objc_msgSend_failures(void *a1, const char *a2, ...)
{
  return [a1 failures];
}

id objc_msgSend_hasUI(void *a1, const char *a2, ...)
{
  return [a1 hasUI];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_identityUUIDs(void *a1, const char *a2, ...)
{
  return [a1 identityUUIDs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalOptions(void *a1, const char *a2, ...)
{
  return [a1 internalOptions];
}

id objc_msgSend_isCredentialValid(void *a1, const char *a2, ...)
{
  return [a1 isCredentialValid];
}

id objc_msgSend_isDynamicIslandAvailable(void *a1, const char *a2, ...)
{
  return [a1 isDynamicIslandAvailable];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isLastRestartAttempt(void *a1, const char *a2, ...)
{
  return [a1 isLastRestartAttempt];
}

id objc_msgSend_isMirroringUI(void *a1, const char *a2, ...)
{
  return [a1 isMirroringUI];
}

id objc_msgSend_isPurposeApplePay(void *a1, const char *a2, ...)
{
  return [a1 isPurposeApplePay];
}

id objc_msgSend_isRestartable(void *a1, const char *a2, ...)
{
  return [a1 isRestartable];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isRunningDTOPolicy(void *a1, const char *a2, ...)
{
  return [a1 isRunningDTOPolicy];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return [a1 isSupported];
}

id objc_msgSend_lockoutState(void *a1, const char *a2, ...)
{
  return [a1 lockoutState];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_noRestartWithDoublePress(void *a1, const char *a2, ...)
{
  return [a1 noRestartWithDoublePress];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return [a1 policy];
}

id objc_msgSend_policyOptions(void *a1, const char *a2, ...)
{
  return [a1 policyOptions];
}

id objc_msgSend_preCompanion(void *a1, const char *a2, ...)
{
  return [a1 preCompanion];
}

id objc_msgSend_prepareForRestart(void *a1, const char *a2, ...)
{
  return [a1 prepareForRestart];
}

id objc_msgSend_purpose(void *a1, const char *a2, ...)
{
  return [a1 purpose];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resultIgnored(void *a1, const char *a2, ...)
{
  return [a1 resultIgnored];
}

id objc_msgSend_rootMechanism(void *a1, const char *a2, ...)
{
  return [a1 rootMechanism];
}

id objc_msgSend_serverQueue(void *a1, const char *a2, ...)
{
  return [a1 serverQueue];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_tccService(void *a1, const char *a2, ...)
{
  return [a1 tccService];
}

id objc_msgSend_unlocked(void *a1, const char *a2, ...)
{
  return [a1 unlocked];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return [a1 userID];
}

id objc_msgSend_userId(void *a1, const char *a2, ...)
{
  return [a1 userId];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}