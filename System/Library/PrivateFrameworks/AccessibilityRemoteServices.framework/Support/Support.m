void sub_100002630(id a1)
{
  uint64_t vars8;

  qword_10000CCD8 = [[AXRemoteDaemon alloc] _init];

  _objc_release_x1();
}

void sub_100002908(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xpc_dictionary_get_string(xdict, _xpc_event_key_name))
  {
    v3 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
    unsigned int v4 = [v3 isEqualToString:AXRemoteDaemonServiceType];

    if (v4)
    {
      if (xpc_dictionary_get_BOOL(xdict, "replyRequired"))
      {
        [*(id *)(a1 + 32) _resetTransactionTimer];
        xpc_object_t reply = xpc_dictionary_create_reply(xdict);
        xpc_dictionary_send_reply();
      }
    }
  }
}

void sub_100002A4C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transaction];

  if (!v2)
  {
    v3 = ax_remote_daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "creating os_transaction", (uint8_t *)buf, 2u);
    }

    unsigned int v4 = (void *)os_transaction_create();
    [*(id *)(a1 + 32) setTransaction:v4];
  }
  objc_initWeak(buf, *(id *)(a1 + 32));
  v5 = [*(id *)(a1 + 32) transactionTimeoutTimer];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002BAC;
  v6[3] = &unk_1000085E8;
  objc_copyWeak(&v7, buf);
  [v5 afterDelay:v6 processBlock:60.0];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void sub_100002B88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_100002BAC(uint64_t a1)
{
  uint64_t v2 = ax_remote_daemon_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "timed out, clearing os_transaction", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelTransactionIfNecessary];
}

id sub_100003308(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelTransactionIfNecessary];
}

id sub_1000033CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelTransactionIfNecessary];
}

void sub_1000034C0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:AXRBannerPayloadKey];
  v3 = v2;
  if (v2)
  {
    unsigned int v4 = [v2 objectForKeyedSubscript:AXRBannerPayloadTitleKey];
    v5 = [v3 objectForKeyedSubscript:AXRBannerPayloadMessageKey];
    v6 = [v3 objectForKeyedSubscript:AXRBannerPayloadDurationKey];
    [v6 doubleValue];
    double v8 = v7;

    v9 = +[AXBannerServices sharedInstance];
    [v9 presentBannerWithTitle:v4 message:v5 duration:v8];
  }
  v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:AXRDeviceRemoteActionPayloadKey];
  v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:AXRVoiceOverEventPayloadKey];
  v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:AXRScrollEventPayloadKey];
  v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:AXRHandGestureEventPayloadKey];
  v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:AXRHandGestureCustomizedActionsKey];
  uint64_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:AXRTouchEventPayloadKey];
  v16 = (void *)v15;
  if (v10)
  {
    v17 = [v10 objectForKeyedSubscript:AXRDeviceRemoteActionNameKey];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    v18 = +[AXRDeviceRemoteActionHelper sharedInstance];
    [v18 performAction:v17];
LABEL_13:

    [*(id *)(a1 + 40) _notifyUserEventOccured];
    goto LABEL_14;
  }
  if (v11)
  {
    v73 = (void *)v15;
    v19 = [v11 objectForKeyedSubscript:AXRVoiceOverEventCommandNameKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = +[AXVoiceOverServer server];
      unsigned int v21 = [v20 triggerEventCommand:v19];

      if (v21) {
        [*(id *)(a1 + 40) _notifyUserEventOccured];
      }
    }

    v16 = v73;
  }
  else
  {
    if (v13)
    {
      v22 = [v13 objectForKeyedSubscript:AXRHandGestureEventPayloadGestureKey];
      id v23 = [v22 integerValue];

      v24 = [v13 objectForKeyedSubscript:AXRHandGestureEventPayloadProbabilityKey];
      [v24 floatValue];
      int v26 = v25;

      v27 = [v13 objectForKeyedSubscript:AXRHandGestureEventPayloadLatencyKey];
      [v27 floatValue];
      int v29 = v28;

      LODWORD(v30) = v26;
      LODWORD(v31) = v29;
      v17 = +[AXEventRepresentation accessibilityEventRepresentationWithSender:6 usagePage:2 usage:v23 modifierFlags:0 eventValue1:v30 eventValue2:v31];
      v18 = +[AXEventTapManager sharedManager];
      [v18 sendHIDSystemEvent:v17 senderID:0x8000000817319384];
      goto LABEL_13;
    }
    if (v14)
    {
      v17 = +[AXSettings sharedInstance];
      [v17 setRemoteHandGestureCustomizedActions:v14];
      goto LABEL_14;
    }
    if (v12)
    {
      v32 = [v12 objectForKeyedSubscript:AXRScrollEventPayloadAmountKey];
      signed int v33 = [v32 intValue];

      v34 = [*(id *)(a1 + 40) scrollAccumulator];
      [v34 accumulateScrollAmount:v33];

      [*(id *)(a1 + 40) _notifyUserEventOccured];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (qword_10000CCF0 != -1) {
          dispatch_once(&qword_10000CCF0, &stru_100008630);
        }
        id v93 = 0;
        v35 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:qword_10000CCE8 fromData:v16 error:&v93];
        id v36 = v93;
        if (v36)
        {
          obj = ax_remote_daemon_log();
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
            sub_100005294((uint64_t)v36, obj);
          }
        }
        else
        {
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          obj = v35;
          id v88 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
          if (v88)
          {
            v66 = 0;
            v67 = v35;
            v72 = 0;
            v74 = v16;
            v68 = 0;
            v69 = 0;
            v70 = 0;
            v71 = 0;
            uint64_t v87 = *(void *)v90;
            uint64_t v86 = AXRTouchEventPayloadHandInfoKey;
            uint64_t v85 = AXRTouchEventPayloadIsGeneratedEventKey;
            uint64_t v84 = AXRTouchEventPayloadGenerationCountKey;
            uint64_t v83 = AXRTouchEventPayloadWillUpdateMaskKey;
            uint64_t v82 = AXRTouchEventPayloadDidUpdateMaskKey;
            uint64_t v81 = AXRTouchEventPayloadUseOriginalHIDTimeKey;
            uint64_t v80 = AXRTouchEventPayloadHIDTimeKey;
            uint64_t v79 = AXRTouchEventPayloadIsDisplayIntegratedKey;
            uint64_t v78 = AXRTouchEventPayloadSenderIDKey;
            uint64_t v77 = AXRTouchEventPayloadContextIdKey;
            uint64_t v76 = AXRTouchEventPayloadHIDAttributeDataKey;
            v37 = &AXDeviceGetType_ptr;
            do
            {
              for (i = 0; i != v88; i = (char *)i + 1)
              {
                if (*(void *)v90 != v87) {
                  objc_enumerationMutation(obj);
                }
                v39 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                v40 = v37[166];
                v41 = objc_msgSend(v39, "objectForKeyedSubscript:", v86, v66, v67, v68, v69, v70, v71, v72);
                v42 = [v40 secureUnarchiveData:v41 withExpectedClass:objc_opt_class() otherAllowedClasses:0];

                if (v42)
                {
                  uint64_t v43 = mach_absolute_time();
                  v44 = [v42 paths];
                  v45 = [v44 firstObject];
                  [v45 pathLocation];
                  double v47 = v46;
                  double v49 = v48;
                  v50 = [v42 paths];
                  v51 = [v50 firstObject];
                  [v51 pathLocation];
                  v54 = +[AXEventRepresentation representationWithType:subtype:time:location:windowLocation:handInfo:](AXEventRepresentation, "representationWithType:subtype:time:location:windowLocation:handInfo:", 3001, 0, v43, v42, v47, v49, v52, v53);

                  v55 = [v39 objectForKeyedSubscript:v85];
                  objc_msgSend(v54, "setIsGeneratedEvent:", objc_msgSend(v55, "BOOLValue"));

                  v56 = [v39 objectForKeyedSubscript:v84];
                  objc_msgSend(v54, "setGenerationCount:", objc_msgSend(v56, "longLongValue"));

                  v57 = [v39 objectForKeyedSubscript:v83];
                  objc_msgSend(v54, "setWillUpdateMask:", objc_msgSend(v57, "intValue"));

                  v58 = [v39 objectForKeyedSubscript:v82];
                  objc_msgSend(v54, "setDidUpdateMask:", objc_msgSend(v58, "intValue"));

                  v59 = [v39 objectForKeyedSubscript:v81];
                  objc_msgSend(v54, "setUseOriginalHIDTime:", objc_msgSend(v59, "BOOLValue"));

                  v60 = [v39 objectForKeyedSubscript:v80];
                  objc_msgSend(v54, "setHIDTime:", objc_msgSend(v60, "longLongValue"));

                  v61 = [v39 objectForKeyedSubscript:v79];
                  objc_msgSend(v54, "setIsDisplayIntegrated:", objc_msgSend(v61, "BOOLValue"));

                  v62 = [v39 objectForKeyedSubscript:v78];
                  objc_msgSend(v54, "setSenderID:", objc_msgSend(v62, "longLongValue"));

                  v63 = [v39 objectForKeyedSubscript:v77];
                  objc_msgSend(v54, "setContextId:", objc_msgSend(v63, "intValue"));

                  v64 = [v39 objectForKeyedSubscript:v76];
                  [v54 setHIDAttributeData:v64];

                  v65 = +[AXEventTapManager sharedManager];
                  [v65 sendHIDSystemEvent:v54 senderID:0x8000000817319384];

                  v37 = &AXDeviceGetType_ptr;
                }
              }
              id v88 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
            }
            while (v88);
            v11 = v71;
            v10 = v72;
            v13 = v69;
            v12 = v70;
            v35 = v67;
            v14 = v68;
            v16 = v74;
            id v36 = v66;
          }
        }
      }
    }
  }
LABEL_15:
}

void sub_100003DD0(id a1)
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v1 = +[NSArray arrayWithObjects:&v4 count:5];
  uint64_t v2 = +[NSSet setWithArray:](NSSet, "setWithArray:", v1, v4, v5, v6, v7);
  v3 = (void *)qword_10000CCE8;
  qword_10000CCE8 = v2;
}

uint64_t start()
{
  v1 = ax_remote_daemon_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Starting up axremoted", v9, 2u);
  }

  uint64_t v2 = getpwnam("mobile");
  uid_t pw_uid = v2->pw_uid;
  gid_t pw_gid = v2->pw_gid;
  if (pw_uid) {
    BOOL v5 = pw_gid == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || (getgid() == pw_gid || !setgid(pw_gid)) && (getuid() == pw_uid || !setuid(pw_uid)))
  {
    uint64_t v6 = +[AXRemoteDaemon sharedInstance];
    [v6 run];

    uint64_t v7 = +[NSRunLoop currentRunLoop];
    [v7 run];
  }
  return 0;
}

id sub_1000041A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_accumulateScrollAmount:", *(void *)(a1 + 40));
}

void sub_100004340(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 scrollAccumulator:*(void *)(a1 + 32) didAccumulateScrollInDirection:1];
}

void sub_100004398(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 scrollAccumulator:*(void *)(a1 + 32) didAccumulateScrollInDirection:2];
}

void sub_1000044BC(id a1)
{
  qword_10000CCF8 = [[AXRDeviceRemoteActionHelper alloc] _init];

  _objc_release_x1();
}

uint64_t sub_100004BC4(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t, void))off_10000CD08;
  uint64_t v8 = off_10000CD08;
  if (!off_10000CD08)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100004EA0;
    v4[3] = &unk_1000086C8;
    v4[4] = &v5;
    sub_100004EA0((uint64_t)v4);
    id v2 = (uint64_t (*)(uint64_t, void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    sub_100005394();
  }
  return v2(a1, 0);
}

void sub_100004C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004D00()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_10000CD18;
  uint64_t v7 = qword_10000CD18;
  if (!qword_10000CD18)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005054;
    v3[3] = &unk_1000086C8;
    v3[4] = &v4;
    sub_100005054((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100004DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100004EA0(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_10000CD10)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100004FE0;
    v5[4] = &unk_100008700;
    v5[5] = v5;
    long long v6 = off_1000086E8;
    uint64_t v7 = 0;
    qword_10000CD10 = _sl_dlopen();
    v3 = (void *)v5[0];
    id v2 = (void *)qword_10000CD10;
    if (qword_10000CD10)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_10000CD10;
LABEL_5:
  result = dlsym(v2, "MRMediaRemoteSendCommand");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CD08 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004FE0()
{
  uint64_t result = _sl_dlopen();
  qword_10000CD10 = result;
  return result;
}

Class sub_100005054(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_10000CD20)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100005198;
    v3[4] = &unk_100008700;
    void v3[5] = v3;
    long long v4 = off_100008720;
    uint64_t v5 = 0;
    qword_10000CD20 = _sl_dlopen();
    if (!qword_10000CD20)
    {
      abort_report_np();
LABEL_8:
      sub_1000053B8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AVSystemController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_10000CD18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100005198()
{
  uint64_t result = _sl_dlopen();
  qword_10000CD20 = result;
  return result;
}

void sub_10000520C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "did receive payload: %@, withOptions: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100005294(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to unarchive touch event payload due to: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000530C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "scroll accumulator going up", v1, 2u);
}

void sub_100005350(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "scroll accumulator going down", v1, 2u);
}

void sub_100005394()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_1000053B8(v0);
}

void sub_1000053B8()
{
}

uint64_t AXDeviceGetType()
{
  return _AXDeviceGetType();
}

uint64_t AXDeviceIsAudioAccessory()
{
  return _AXDeviceIsAudioAccessory();
}

uint64_t AXDeviceIsTV()
{
  return _AXDeviceIsTV();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXRDeviceRemoteActionsPayloadForCurrentDevice()
{
  return _AXRDeviceRemoteActionsPayloadForCurrentDevice();
}

uint64_t AXRLocalizedStringForKey()
{
  return _AXRLocalizedStringForKey();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return __AXSAssistiveTouchScannerEnabled();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return __AXSVoiceOverTouchSetEnabled();
}

uint64_t _AXSVoiceOverTouchSetUsageConfirmed()
{
  return __AXSVoiceOverTouchSetUsageConfirmed();
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
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t ax_remote_daemon_log()
{
  return _ax_remote_daemon_log();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

gid_t getgid(void)
{
  return _getgid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int setgid(gid_t a1)
{
  return _setgid(a1);
}

int setuid(uid_t a1)
{
  return _setuid(a1);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend__cancelTransactionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _cancelTransactionIfNecessary];
}

id objc_msgSend__getCurrentVolume(void *a1, const char *a2, ...)
{
  return [a1 _getCurrentVolume];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__notifyUserEventOccured(void *a1, const char *a2, ...)
{
  return [a1 _notifyUserEventOccured];
}

id objc_msgSend__resetTransactionTimer(void *a1, const char *a2, ...)
{
  return [a1 _resetTransactionTimer];
}

id objc_msgSend_activateHomeButton(void *a1, const char *a2, ...)
{
  return [a1 activateHomeButton];
}

id objc_msgSend_activateSiri(void *a1, const char *a2, ...)
{
  return [a1 activateSiri];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_pathLocation(void *a1, const char *a2, ...)
{
  return [a1 pathLocation];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_pressTVMenuButton(void *a1, const char *a2, ...)
{
  return [a1 pressTVMenuButton];
}

id objc_msgSend_pressTVSelectButton(void *a1, const char *a2, ...)
{
  return [a1 pressTVSelectButton];
}

id objc_msgSend_previousVoiceOverEnabledState(void *a1, const char *a2, ...)
{
  return [a1 previousVoiceOverEnabledState];
}

id objc_msgSend_remoteHandGestureCustomizedActions(void *a1, const char *a2, ...)
{
  return [a1 remoteHandGestureCustomizedActions];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scrollAccumulator(void *a1, const char *a2, ...)
{
  return [a1 scrollAccumulator];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_startXPCService(void *a1, const char *a2, ...)
{
  return [a1 startXPCService];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_toggleAppSwitcher(void *a1, const char *a2, ...)
{
  return [a1 toggleAppSwitcher];
}

id objc_msgSend_toggleControlCenter(void *a1, const char *a2, ...)
{
  return [a1 toggleControlCenter];
}

id objc_msgSend_toggleNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 toggleNotificationCenter];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return [a1 transaction];
}

id objc_msgSend_transactionTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 transactionTimeoutTimer];
}

id objc_msgSend_userEventOccurred(void *a1, const char *a2, ...)
{
  return [a1 userEventOccurred];
}

id objc_msgSend_wakeUpDeviceIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 wakeUpDeviceIfNecessary];
}

id objc_msgSend_warm(void *a1, const char *a2, ...)
{
  return [a1 warm];
}