void sub_37C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_37E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _matchOperation:*(void *)(a1 + 32) matchedWithResult:*(void *)(a1 + 40)];
}

void sub_4244(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_4260(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _operation:*(void *)(a1 + 32) finishedWithReason:*(void *)(a1 + 48)];
}

void sub_455C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_4578(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _operation:*(void *)(a1 + 32) stateChanged:*(void *)(a1 + 48)];
}

void sub_4974(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_4990(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _operation:*(void *)(a1 + 32) presenceStateChanged:*(unsigned __int8 *)(a1 + 48)];
}

id sub_4BC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFingerDetectTimeout];
}

void *sub_548C(uint64_t a1)
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
        return [result _finishFingerDetectPhase];
      }
    }
  }
  return result;
}

void sub_594C(void *a1, uint64_t a2, NSObject *a3)
{
  v5 = [a1 identity];
  v6[0] = 67109378;
  v6[1] = [v5 userID];
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_0, a3, OS_LOG_TYPE_FAULT, "failed to get hash for matched user %u: %{public}@", (uint8_t *)v6, 0x12u);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

void objc_release(id a1)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__exceededFailureLimit(void *a1, const char *a2, ...)
{
  return [a1 _exceededFailureLimit];
}

id objc_msgSend__shouldFailForUnboundMatches(void *a1, const char *a2, ...)
{
  return [a1 _shouldFailForUnboundMatches];
}

id objc_msgSend__shouldShowUIBeforeFailure(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowUIBeforeFailure];
}

id objc_msgSend__startBiometryMain(void *a1, const char *a2, ...)
{
  return [a1 _startBiometryMain];
}

id objc_msgSend__startMatching(void *a1, const char *a2, ...)
{
  return [a1 _startMatching];
}

id objc_msgSend_actionSuccess(void *a1, const char *a2, ...)
{
  return [a1 actionSuccess];
}

id objc_msgSend_analytics(void *a1, const char *a2, ...)
{
  return [a1 analytics];
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

id objc_msgSend_credentialAdded(void *a1, const char *a2, ...)
{
  return [a1 credentialAdded];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceSupportsSecureDoubleClick(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsSecureDoubleClick];
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

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return [a1 externalizedContext];
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

id objc_msgSend_isFallbackVisible(void *a1, const char *a2, ...)
{
  return [a1 isFallbackVisible];
}

id objc_msgSend_isPurposeInAppPayment(void *a1, const char *a2, ...)
{
  return [a1 isPurposeInAppPayment];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isRunningDTOPolicy(void *a1, const char *a2, ...)
{
  return [a1 isRunningDTOPolicy];
}

id objc_msgSend_lockoutState(void *a1, const char *a2, ...)
{
  return [a1 lockoutState];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return [a1 policy];
}

id objc_msgSend_policyOptions(void *a1, const char *a2, ...)
{
  return [a1 policyOptions];
}

id objc_msgSend_purpose(void *a1, const char *a2, ...)
{
  return [a1 purpose];
}

id objc_msgSend_remoteUiDelegate(void *a1, const char *a2, ...)
{
  return [a1 remoteUiDelegate];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resultIgnored(void *a1, const char *a2, ...)
{
  return [a1 resultIgnored];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_touchIdInstance(void *a1, const char *a2, ...)
{
  return [a1 touchIdInstance];
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

id objc_msgSend_willTryToRecover(void *a1, const char *a2, ...)
{
  return [a1 willTryToRecover];
}