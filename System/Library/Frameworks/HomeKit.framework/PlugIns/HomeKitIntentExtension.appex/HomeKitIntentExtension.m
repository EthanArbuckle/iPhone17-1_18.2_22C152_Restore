void sub_100001994(id a1)
{
  uint64_t vars8;

  qword_100008930 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

void sub_100001B98(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) intentTimer];

  if (v2 == v3)
  {
    [*(id *)(a1 + 40) _reportToResponseHandlerWithOutcome:HMIntentOutcomeInProgress];
    v4 = *(void **)(a1 + 40);
    [v4 _resetIntentTimer];
  }
}

void sub_10000237C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000023A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained clientQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000258C;
    v14[3] = &unk_100004208;
    id v15 = *(id *)(a1 + 32);
    v16 = v8;
    id v17 = v5;
    id v18 = *(id *)(a1 + 40);
    dispatch_async(v9, v14);

    id v10 = v15;
  }
  else
  {
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@HMIntentHandler has been set to nil", buf, 0xCu);
    }
    id v10 = [objc_alloc((Class)INControlHomeIntentResponse) initWithCode:5 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10000258C(id *a1)
{
  v2 = objc_msgSend(a1[4], "hmf_numberForKey:", kSiriIntentRequestTypeKey);
  id v3 = [v2 unsignedIntegerValue];

  v4 = HMStringFromIntentRequestType();
  id v5 = [a1[5] intentTimer];

  if (v5)
  {
    id v6 = a1[6];
    if (v6)
    {
      if ([v6 code] != (id)82 || v3)
      {
        id v21 = [a1[6] code];
        id v8 = a1[5];
        v22 = HMFGetOSLogHandle();
        v9 = v22;
        if (v21 == (id)10)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            id v10 = HMFGetLogIdentifier();
            uint64_t v11 = HMIntentOutcomeUnsecuringNotAllowed;
            v12 = HMINControlHomeIntentShortDescription();
            int v25 = 138543618;
            v26 = v10;
            __int16 v27 = 2112;
            v28 = v12;
            v13 = "%{public}@Execution is not allowed for intent: [ %@ ]";
            goto LABEL_15;
          }
          v23 = (uint64_t *)&HMIntentOutcomeUnsecuringNotAllowed;
        }
        else
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            id v10 = HMFGetLogIdentifier();
            uint64_t v11 = HMIntentOutcomeFailure;
            v12 = HMINControlHomeIntentShortDescription();
            id v24 = a1[6];
            int v25 = 138544130;
            v26 = v10;
            __int16 v27 = 2112;
            v28 = v12;
            __int16 v29 = 2112;
            v30 = v4;
            __int16 v31 = 2112;
            id v32 = v24;
            v13 = "%{public}@Failed to %@ intent: [ %@ ] - error %@";
            id v18 = v9;
            os_log_type_t v19 = OS_LOG_TYPE_ERROR;
            uint32_t v20 = 42;
            goto LABEL_19;
          }
          v23 = (uint64_t *)&HMIntentOutcomeFailure;
        }
      }
      else
      {
        id v8 = a1[5];
        v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = HMFGetLogIdentifier();
          uint64_t v11 = HMIntentOutcomeUnsecuringUnlockRequired;
          v12 = HMINControlHomeIntentShortDescription();
          int v25 = 138543618;
          v26 = v10;
          __int16 v27 = 2112;
          v28 = v12;
          v13 = "%{public}@Unlock required for intent: [ %@ ]";
LABEL_15:
          id v18 = v9;
          os_log_type_t v19 = OS_LOG_TYPE_INFO;
          uint32_t v20 = 22;
          goto LABEL_19;
        }
        v23 = (uint64_t *)&HMIntentOutcomeUnsecuringUnlockRequired;
      }
    }
    else
    {
      id v8 = a1[5];
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        uint64_t v11 = HMIntentOutcomeSuccess;
        v12 = HMINControlHomeIntentShortDescription();
        int v25 = 138543874;
        v26 = v10;
        __int16 v27 = 2112;
        v28 = v12;
        __int16 v29 = 2112;
        v30 = v4;
        v13 = "%{public}@Intent: [ %@ ] is %@ successfully";
        id v18 = v9;
        os_log_type_t v19 = OS_LOG_TYPE_INFO;
        uint32_t v20 = 32;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v13, (uint8_t *)&v25, v20);

LABEL_24:
        [a1[5] _reportToResponseHandlerWithOutcome:v11];
        [a1[5] _resetIntentTimer];
        goto LABEL_25;
      }
      v23 = (uint64_t *)&HMIntentOutcomeSuccess;
    }
    uint64_t v11 = *v23;
    goto LABEL_24;
  }
  id v15 = a1[5];
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    int v25 = 138543618;
    v26 = v17;
    __int16 v27 = 2112;
    v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@%@ time takes too long. Timer already fired", (uint8_t *)&v25, 0x16u);
  }
LABEL_25:
}

uint64_t HMDispatchQueueNameString()
{
  return _HMDispatchQueueNameString();
}

uint64_t HMFCreateOSLogHandle()
{
  return _HMFCreateOSLogHandle();
}

uint64_t HMFGetLogIdentifier()
{
  return _HMFGetLogIdentifier();
}

uint64_t HMFGetOSLogHandle()
{
  return _HMFGetOSLogHandle();
}

uint64_t HMINControlHomeIntentShortDescription()
{
  return _HMINControlHomeIntentShortDescription();
}

uint64_t HMStringFromIntentRequestType()
{
  return _HMStringFromIntentRequestType();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint64_t encodeRootObject()
{
  return _encodeRootObject();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__resetIntentTimer(void *a1, const char *a2, ...)
{
  return [a1 _resetIntentTimer];
}

id objc_msgSend__startIntentTimer(void *a1, const char *a2, ...)
{
  return [a1 _startIntentTimer];
}

id objc_msgSend_clientQueue(void *a1, const char *a2, ...)
{
  return [a1 clientQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_intentTimer(void *a1, const char *a2, ...)
{
  return [a1 intentTimer];
}

id objc_msgSend_productClass(void *a1, const char *a2, ...)
{
  return [a1 productClass];
}

id objc_msgSend_productInfo(void *a1, const char *a2, ...)
{
  return [a1 productInfo];
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return [a1 responseHandler];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}