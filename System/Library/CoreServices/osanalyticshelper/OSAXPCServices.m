@interface OSAXPCServices
+ (BOOL)handleDefaultsRequestWithParams:(id)a3 forReply:(id)a4;
+ (void)handleStabilityMonitorRequest:(id)a3 fromConnection:(id)a4 forReply:(id)a5;
- (BOOL)generateCrackShotWithParams:(id)a3;
- (BOOL)generateStackShotWithParams:(id)a3;
- (BOOL)generateSystemMemoryResetWithParams:(id)a3;
- (BOOL)serviceRequest:(id)a3 forOperation:(unint64_t)a4 fromConnection:(id)a5 forReply:(id)a6;
- (OSAXPCServices)init;
- (void)dealloc;
@end

@implementation OSAXPCServices

- (BOOL)serviceRequest:(id)a3 forOperation:(unint64_t)a4 fromConnection:(id)a5 forReply:(id)a6
{
  id v10 = a3;
  v11 = (_xpc_connection_s *)a5;
  id v12 = a6;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  switch(a4)
  {
    case 2uLL:
      unsigned __int8 v13 = [(OSAXPCServices *)self generateStackShotWithParams:v10];
      goto LABEL_13;
    case 3uLL:
      unsigned __int8 v13 = [(OSAXPCServices *)self generateCrackShotWithParams:v10];
      goto LABEL_13;
    case 4uLL:
      unsigned __int8 v13 = [(OSAXPCServices *)self generateSystemMemoryResetWithParams:v10];
      goto LABEL_13;
    case 5uLL:
      string = xpc_dictionary_get_string(v10, "log_countkey");
      v15 = xpc_dictionary_get_string(v10, "log_filepath");
      if (v15)
      {
        v16 = +[NSString stringWithUTF8String:v15];
        if (string) {
          v17 = string;
        }
        else {
          v17 = "<unknown>";
        }
        v18 = +[NSString stringWithUTF8String:v17];
        +[OSABridgeLinkProxy transfer:v16 key:v18];

        *((unsigned char *)v31 + 24) = 1;
      }
      break;
    case 6uLL:
      unsigned __int8 v13 = +[OSALogHelper createForSubmissionWithXPCRequest:v10 forReply:v12];
LABEL_13:
      *((unsigned char *)v31 + 24) = v13;
      break;
    case 7uLL:
      v21 = (void *)xpc_connection_copy_entitlement_value();
      v22 = v21;
      if (v21 && xpc_get_type(v21) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v22))
      {
        defaultsQueue = self->_defaultsQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100010998;
        block[3] = &unk_100021248;
        v29 = &v30;
        id v27 = v10;
        id v28 = v12;
        dispatch_sync(defaultsQueue, block);
      }
      else
      {
        id v24 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          pid_t pid = xpc_connection_get_pid(v11);
          sub_1000157C4(buf, pid);
        }

        *((unsigned char *)v31 + 24) = 0;
      }

      break;
    case 8uLL:
      +[OSAXPCServices handleStabilityMonitorRequest:v10 fromConnection:v11 forReply:v12];
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100015748();
      }
      break;
  }
  BOOL v19 = *((unsigned char *)v31 + 24) != 0;
  _Block_object_dispose(&v30, 8);

  return v19;
}

- (OSAXPCServices)init
{
  v12.receiver = self;
  v12.super_class = (Class)OSAXPCServices;
  v2 = [(OSAXPCServices *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.osanalytics.defaultsQueue", 0);
    defaultsQueue = v2->_defaultsQueue;
    v2->_defaultsQueue = (OS_dispatch_queue *)v3;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.osanalytics.osanalyticshelper", 0, 1uLL);
    listenerConnection = v2->_listenerConnection;
    v2->_listenerConnection = mach_service;

    if (v2->_listenerConnection)
    {
      +[OSABridgeLinkRemote instantiate];
      +[OSALogHelper instantiate];
      objc_initWeak(&location, v2);
      v7 = v2->_listenerConnection;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100004454;
      v9[3] = &unk_100021220;
      objc_copyWeak(&v10, &location);
      xpc_connection_set_event_handler(v7, v9);
      xpc_connection_resume(v2->_listenerConnection);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000156C0();
      }

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  listenerConnection = self->_listenerConnection;
  if (listenerConnection) {
    xpc_connection_cancel(listenerConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)OSAXPCServices;
  [(OSAXPCServices *)&v4 dealloc];
}

+ (BOOL)handleDefaultsRequestWithParams:(id)a3 forReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  string = xpc_dictionary_get_string(v5, "defaults_key");
  id v8 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.osanalytics.internal"];
  switch(xpc_dictionary_get_uint64(v5, "defaults_operation"))
  {
    case 0uLL:
      BOOL v9 = 0;
      if (v6 && string)
      {
        id v10 = +[NSString stringWithUTF8String:string];
        unsigned __int8 v11 = [v8 BOOLForKey:v10];

        xpc_dictionary_set_BOOL(v6, "defaults_value", v11);
        BOOL v9 = 1;
      }
      goto LABEL_43;
    case 1uLL:
      objc_super v12 = xpc_dictionary_get_value(v5, "defaults_value");
      unsigned __int8 v13 = v12;
      BOOL v9 = 0;
      if (string && v12)
      {
        if (xpc_get_type(v12) == (xpc_type_t)&_xpc_type_BOOL)
        {
          BOOL value = xpc_BOOL_get_value(v13);
          v29 = +[NSString stringWithUTF8String:string];
          [v8 setBool:value forKey:v29];

          BOOL v9 = 1;
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      goto LABEL_39;
    case 2uLL:
      BOOL v9 = 0;
      if (v6 && string)
      {
        v14 = +[NSString stringWithUTF8String:string];
        v15 = [v8 objectForKey:v14];

        if (v15)
        {
          v16 = ns2xpc();
          if (v16)
          {
            xpc_dictionary_set_value(v6, "defaults_value", v16);
            int v17 = 1;
          }
          else
          {
            int v17 = 0;
          }
        }
        else
        {
          int v17 = 0;
        }

        BOOL v9 = v17 != 0;
      }
      goto LABEL_43;
    case 3uLL:
      unsigned __int8 v13 = xpc_dictionary_get_value(v5, "defaults_value");
      if (!v13)
      {
        BOOL v19 = +[NSString stringWithUTF8String:string];
        [v8 removeObjectForKey:v19];
LABEL_37:
        BOOL v9 = 1;
        goto LABEL_38;
      }
      uint64_t v18 = xpc2ns();
      BOOL v19 = (void *)v18;
      BOOL v9 = 0;
      if (string && v18)
      {
        v20 = +[NSNull null];
        unsigned __int8 v21 = [v19 isEqual:v20];

        if (v21)
        {
          BOOL v9 = 0;
          goto LABEL_38;
        }
        uint64_t v30 = +[NSString stringWithUTF8String:string];
        [v8 setObject:v19 forKey:v30];

        goto LABEL_37;
      }
LABEL_38:

LABEL_39:
LABEL_43:

      return v9;
    case 4uLL:
      xpc_dictionary_get_remote_connection(v6);
      v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)xpc_connection_copy_entitlement_value();
      id v24 = v23;
      if (v23 && xpc_get_type(v23) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v24))
      {
        uint64_t v25 = [v8 dictionaryRepresentation];
        v26 = (void *)v25;
        if (v6 && v25)
        {
          id v27 = ns2xpc();
          xpc_dictionary_set_value(v6, "defaults_value", v27);
        }
        BOOL v9 = 1;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10001588C(v22);
        }
        BOOL v9 = 0;
      }

      goto LABEL_43;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100015810();
      }
      BOOL v9 = 0;
      goto LABEL_43;
  }
}

+ (void)handleStabilityMonitorRequest:(id)a3 fromConnection:(id)a4 forReply:(id)a5
{
  id v7 = a3;
  id v8 = (_xpc_connection_s *)a4;
  id v9 = a5;
  id v10 = (void *)xpc_connection_copy_entitlement_value();
  unsigned __int8 v11 = v10;
  if (v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v11))
  {
    objc_super v12 = xpc_dictionary_get_value(v7, "stability_parameters");
    if (v12)
    {
      uint64_t v13 = xpc2ns();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = xpc_dictionary_get_value(v7, "stability_bundleID");
        if (!v15)
        {
          +[OSAStabilityMonitor evaluateStabilityWithParameters:v14];
          if (v9)
          {
            xpc_dictionary_set_BOOL(v9, "result", 1);
            xpc_connection_send_message(v8, v9);
          }

          v23 = 0;
          goto LABEL_39;
        }
        v16 = v15;
        string_ptr = xpc_string_get_string_ptr(v15);
        if (string_ptr)
        {
          uint64_t v18 = string_ptr;
          BOOL v19 = xpc_dictionary_get_value(v7, "stability_coalitionName");
          id v28 = v19;
          if (v19)
          {
            v20 = xpc_string_get_string_ptr(v19);
            if (!v20)
            {
              unsigned __int8 v21 = 0;
LABEL_31:
              int v25 = 1;
              v23 = "Unable to handle coalition name from XPC message";
              goto LABEL_33;
            }
            unsigned __int8 v21 = +[NSString stringWithUTF8String:v20];
            if (!v21) {
              goto LABEL_31;
            }
          }
          else
          {
            unsigned __int8 v21 = 0;
          }
          if (v9)
          {
            id v24 = +[NSString stringWithUTF8String:v18];
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_100011148;
            v29[3] = &unk_100021270;
            id v30 = v9;
            v31 = v8;
            +[OSAStabilityMonitor evaluateStabilityOfBundleID:v24 coalitionName:v21 parameters:v14 completionHandler:v29];

            v23 = 0;
            int v25 = 0;
          }
          else
          {
            int v25 = 1;
            v23 = "No XPC reply given for per-process stability monitor";
          }
LABEL_33:

          if (v25) {
            goto LABEL_34;
          }
LABEL_39:
          int v22 = 0;
          goto LABEL_15;
        }

        v23 = "Unable to handle bundle ID from XPC message";
      }
      else
      {
        v23 = "Unable to convert stability parameters to NSDictionary";
      }
    }
    else
    {
      v23 = "Missing stability parameters from XPC message";
    }
LABEL_34:
    v26 = xpc_copy_description(v7);
    id v27 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10001599C();
    }

    if (v26) {
      free(v26);
    }
    int v22 = 1;
    goto LABEL_15;
  }
  objc_super v12 = OSAStabilityMonitorLogDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100015910(v8, v12);
  }
  int v22 = 1;
  v23 = "Client is not entitled to run the stability monitor";
LABEL_15:

  if (v9 && v22)
  {
    xpc_dictionary_set_BOOL(v9, "result", 0);
    if (v23) {
      xpc_dictionary_set_string(v9, "error_desc", v23);
    }
    xpc_connection_send_message(v8, v9);
  }
}

- (BOOL)generateStackShotWithParams:(id)a3
{
  id v3 = a3;
  if (qword_1000262D8 != -1) {
    dispatch_once(&qword_1000262D8, &stru_100021290);
  }
  string = xpc_dictionary_get_string(v3, "reason");
  id v5 = xpc_dictionary_get_string(v3, "caller");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "exception_code");
  uint64_t v51 = uint64;
  uint64_t v7 = xpc_dictionary_get_uint64(v3, "PID");
  uint64_t v8 = xpc_dictionary_get_uint64(v3, "flags");
  xpc_dictionary_get_value(v3, "additional_payload");
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  ++dword_1000262F8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = "<anonymous>";
    if (v5) {
      id v9 = v5;
    }
    *(_DWORD *)buf = 136446722;
    double v54 = *(double *)&v9;
    if (string) {
      id v10 = string;
    }
    else {
      id v10 = "<unknown>";
    }
    __int16 v55 = 2048;
    uint64_t v56 = uint64;
    __int16 v57 = 2080;
    v58 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stackshot requested by %{public}s, code: %llx, reason: %s", buf, 0x20u);
  }
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)qword_1000262D0, 0))
  {
LABEL_20:
    id v15 = objc_alloc((Class)NSString);
    if (v5) {
      v16 = v5;
    }
    else {
      v16 = "<anonymous>";
    }
    id v17 = [v15 initWithUTF8String:v16];
    uint64_t v18 = (void *)qword_1000262E8;
    qword_1000262E8 = (uint64_t)v17;

    qword_1000262E0 = CFAbsoluteTimeGetCurrent();
    v44 = v16;
    if (v7)
    {
      id v19 = [objc_alloc((Class)VMUProcInfo) initWithPid:v7];
      v20 = v19;
      if (v19)
      {
        v47 = [v19 name];
      }
      else
      {
        v47 = 0;
      }
    }
    else
    {
      v47 = 0;
    }
    int v22 = +[OSASystemConfiguration sharedInstance];
    v23 = +[NSString stringWithFormat:@"stackshot_%llx", uint64];
    id v24 = [v22 getTaskingKey:v23];

    int v25 = +[NSSet set];
    v26 = +[OSASystemConfiguration sharedInstance];
    v45 = v24;
    v46 = v25;
    if ([v26 appleInternal])
    {

LABEL_41:
      id v31 = objc_alloc((Class)OSAStackShotReport);
      uint64_t v32 = v31;
      if (string)
      {
        char v33 = +[NSString stringWithUTF8String:string];
        id v28 = [v32 initForPid:v7 process:v47 withReason:v33 exceptionCode:&v51 exceptionCodeCount:1 stackshotFlags:v8];
      }
      else
      {
        id v28 = [v31 initForPid:v7 process:v47 withReason:@"(null)" exceptionCode:&v51 exceptionCodeCount:1 stackshotFlags:v8];
      }
      clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      [v28 acquireStackshot];
      clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      objc_msgSend(v28, "ss_trace_length");
      if (xdict)
      {
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472;
        applier[2] = sub_100011A84;
        applier[3] = &unk_1000212B8;
        id v34 = objc_alloc_init((Class)NSMutableDictionary);
        id v50 = v34;
        xpc_dictionary_apply(xdict, applier);
        [v28 setAdditionalPayload:v34];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100015A20();
        }
      }
      v35 = +[NSString stringWithFormat:@"Requested by %s", v44];
      v52 = v35;
      v36 = +[NSArray arrayWithObjects:&v52 count:1];
      [v28 addNotes:v36];

      unsigned __int8 v21 = [v28 saveWithOptions:0];
      v37 = [v28 getExtraData:@"stackshot_duration_nsec"];
      [v37 longLongValue];

      v38 = [v28 getExtraData:@"stackshot_duration_outer_nsec"];
      [v38 longLongValue];

      v39 = [v28 getExtraData:@"stackshot_duration_prior_nsec"];
      [v39 longLongValue];

      v40 = [v28 getExtraData:@"stackshot_size_estimate"];
      [v40 longLongValue];

      v41 = [v28 getExtraData:@"stackshot_size_estimate_adj"];
      [v41 longLongValue];

LABEL_49:
      qword_1000262E0 = 0;
      v42 = (void *)qword_1000262E8;
      qword_1000262E8 = 0;

      dword_1000262F0 = 0;
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000262D0);

      goto LABEL_50;
    }
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unsigned __int8 v27 = [v24 BOOLValue];

      if (v27) {
        goto LABEL_41;
      }
    }
    else
    {
      v29 = +[NSNumber numberWithLongLong:uint64];
      unsigned __int8 v30 = [v25 containsObject:v29];

      if ((v30 & 1) == 0) {
        goto LABEL_41;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      double v54 = *(double *)&v5;
      __int16 v55 = 2048;
      uint64_t v56 = uint64;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ignoring stackshot requested by %{public}s with exception code 0x%llx because it is not tasked.", buf, 0x16u);
    }
    unsigned __int8 v21 = 0;
    id v28 = v45;
    goto LABEL_49;
  }
  id v11 = (id)qword_1000262E8;
  double v12 = *(double *)&qword_1000262E0;
  if (*(double *)&qword_1000262E0 == 0.0)
  {
    ++dword_1000262F0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stackshot already in progress (just now), ignoring", buf, 2u);
    }
  }
  else
  {
    double v13 = CFAbsoluteTimeGetCurrent() - v12;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v54 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stackshot already in progress (%.2f ago), ignoring", buf, 0xCu);
    }
    if (v13 > 300.0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100015A9C(v13);
      }
      v14 = "<anonymous>";
      if (v5) {
        v14 = v5;
      }
      id v3 = +[NSString stringWithFormat:@"Stackshot wedged (originally requested by %@). Found by %s (ignored %d others)", v11, v14, dword_1000262F0];
      +[OSASystemConfiguration sharedInstance];
      [(id)objc_claimAutoreleasedReturnValue() appleInternal];
      abort_with_reason();
      goto LABEL_20;
    }
  }

  unsigned __int8 v21 = 0;
LABEL_50:
  analytics_send_event_lazy();

  return v21;
}

- (BOOL)generateCrackShotWithParams:(id)a3
{
  id v3 = a3;
  string = xpc_dictionary_get_string(v3, "reason");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "PID");
  int v18 = xpc_dictionary_get_uint64(v3, "ers_namespace");
  uint64_t v19 = xpc_dictionary_get_uint64(v3, "ers_code");
  uint64_t v20 = xpc_dictionary_get_uint64(v3, "ers_flags");
  id v6 = xpc_dictionary_get_value(v3, "additional_payload");

  id v7 = objc_alloc((Class)OSACrackShotReport);
  uint64_t v8 = +[NSString stringWithUTF8String:string];
  id v9 = [v7 initForPid:uint64 exitSnapshot:&v18 reason:v8];

  if (v6)
  {
    double v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100011EBC;
    v16 = &unk_1000212B8;
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    id v17 = v10;
    xpc_dictionary_apply(v6, &v13);
    objc_msgSend(v9, "setAdditionalPayload:", v10, v13, v14, v15, v16);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100015A20();
    }
  }
  [v9 acquireStackshot];
  unsigned __int8 v11 = [v9 saveWithOptions:0];

  return v11;
}

- (BOOL)generateSystemMemoryResetWithParams:(id)a3
{
  id v3 = a3;
  string = xpc_dictionary_get_string(v3, "reason");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "event_code");

  id v6 = [OSASystemMemoryResetReport alloc];
  id v7 = v6;
  if (string)
  {
    uint64_t v8 = +[NSString stringWithUTF8String:string];
    id v9 = [(OSASystemMemoryResetReport *)v7 initWithEvent:v8 code:uint64];
  }
  else
  {
    id v9 = [(OSASystemMemoryResetReport *)v6 initWithEvent:0 code:uint64];
  }
  [(OSASystemMemoryResetReport *)v9 acquireJetsamData];
  unsigned __int8 v10 = [(OSASystemMemoryResetReport *)v9 saveWithOptions:0];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsQueue, 0);

  objc_storeStrong((id *)&self->_listenerConnection, 0);
}

@end