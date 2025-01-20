@interface AUHSXPCSharedListener
+ (id)connectToService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 error:(id *)a6;
+ (id)connectToService:(id)a3 listener:(id)a4 error:(id *)a5;
+ (id)connectionForListenerNamed:(id)a3 fromServiceNamed:(id)a4;
+ (id)connectionForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5;
+ (id)endpointCache;
+ (id)endpointForReply:(id)a3 withListenerName:(id)a4 replyErrorCode:(int64_t *)a5;
+ (id)listenerEndpointForService:(id)a3 listener:(id)a4 error:(id *)a5;
+ (id)sharedServiceListener;
+ (void)_endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 async:(BOOL)a7 completion:(id)a8;
+ (void)_failedToWarmUpClassNamed:(id)a3 inServiceNamed:(id)a4 dueTo:(id)a5;
+ (void)cacheFutureEndpointsForServiceNamed:(id)a3;
+ (void)connectToService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 queue:(id)a6 completion:(id)a7;
+ (void)connectToService:(id)a3 listener:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 async:(BOOL)a7 completion:(id)a8;
+ (void)endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 completion:(id)a7;
+ (void)getSDKVersionOfServiceNamed:(id)a3 reply:(id)a4;
+ (void)listenerEndpointForService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 queue:(id)a6 completion:(id)a7;
+ (void)listenerEndpointForService:(id)a3 listener:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)purgeEndpointCache;
+ (void)service:(id)a3 builtForPlatform:(unsigned int)a4 againstMinimumSDK:(unsigned int)a5 reply:(id)a6;
+ (void)setEndpointCache:(id)a3;
+ (void)warmUpClassNamed:(id)a3 inServiceNamed:(id)a4;
- (BOOL)shouldAcceptNewConnection:(id)a3 forListenerNamed:(id)a4;
- (NSMutableDictionary)listeners;
- (id)listenerEndpointWithName:(id)a3;
- (void)addDelegate:(id)a3;
- (void)addListener:(id)a3 withName:(id)a4;
- (void)dealloc;
- (void)didAcceptNewConnection:(id)a3;
- (void)resume;
- (void)resumeAdditionalService:(id)a3;
- (void)resumeSubService:(id)a3;
- (void)setListeners:(id)a3;
- (void)whileHoldingLock:(id)a3;
@end

@implementation AUHSXPCSharedListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_storeStrong((id *)&self->_listeners, 0);
}

- (void)setListeners:(id)a3
{
}

- (NSMutableDictionary)listeners
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)resumeSubService:(id)a3
{
  id v3 = [a3 UTF8String];

  _xpc_handle_subservice(v3, sub_100005508);
}

- (void)resumeAdditionalService:(id)a3
{
  id v3 = [a3 UTF8String];

  _xpc_handle_service(v3, sub_100005508, 0);
}

- (void)resume
{
}

- (void)whileHoldingLock:(id)a3
{
}

- (BOOL)shouldAcceptNewConnection:(id)a3 forListenerNamed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = self->_delegates;
  id v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v13 shouldAcceptNewConnection:v6] & 1) == 0)
        {
          NSLog(@"delegate %@ of %@ rejected connection for listener %@", v13, self, v7);
          BOOL v14 = 0;
          goto LABEL_12;
        }
      }
      id v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void)didAcceptNewConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_delegates;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "didAcceptNewConnection:", v4, (void)v11);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)listenerEndpointWithName:(id)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = sub_100005DDC;
  long long v14 = sub_100005DEC;
  id v15 = 0;
  p_lock = &self->lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005DF4;
  v7[3] = &unk_1000105A8;
  v7[4] = self;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  sub_1000053E4(p_lock, v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)addListener:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005F40;
  v11[3] = &unk_100010580;
  p_lock = &self->lock;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_1000053E4(p_lock, v11);
  [v10 resume];
}

- (void)addDelegate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000602C;
  v5[3] = &unk_100010558;
  p_lock = &self->lock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  sub_1000053E4(p_lock, v5);
}

- (void)dealloc
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000612C;
  v4[3] = &unk_100010530;
  v4[4] = self;
  sub_1000053E4(&self->lock, v4);
  v3.receiver = self;
  v3.super_class = (Class)AUHSXPCSharedListener;
  [(AUHSXPCSharedListener *)&v3 dealloc];
}

+ (void)service:(id)a3 builtForPlatform:(unsigned int)a4 againstMinimumSDK:(unsigned int)a5 reply:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000061F4;
  v11[3] = &unk_100010A28;
  id v12 = a6;
  unsigned int v13 = a4;
  unsigned int v14 = a5;
  id v10 = v12;
  [a1 connectToService:a3 listener:&stru_100010E08 queue:0 completion:v11];
}

+ (void)getSDKVersionOfServiceNamed:(id)a3 reply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000064FC;
  v7[3] = &unk_1000109D8;
  id v8 = a4;
  id v6 = v8;
  [a1 connectToService:a3 listener:&stru_100010E08 queue:0 completion:v7];
}

+ (void)warmUpClassNamed:(id)a3 inServiceNamed:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000067D4;
  v9[3] = &unk_100010960;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  [a1 connectToService:v7 listener:&stru_100010E08 queue:0 completion:v9];
}

+ (void)_failedToWarmUpClassNamed:(id)a3 inServiceNamed:(id)a4 dueTo:(id)a5
{
}

+ (id)sharedServiceListener
{
  if (qword_1000158C8 != -1) {
    dispatch_once(&qword_1000158C8, &stru_1000108E8);
  }
  v2 = (void *)qword_1000158D0;

  return v2;
}

+ (id)listenerEndpointForService:(id)a3 listener:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100005DDC;
  v24 = sub_100005DEC;
  id v25 = 0;
  id v10 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006C58;
  v15[3] = &unk_1000108A8;
  long long v19 = a5;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  long long v18 = &v20;
  [a1 endpointForListenerNamed:v12 fromServiceNamed:v11 instanceIdentifier:0 queue:v10 async:0 completion:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

+ (void)connectToService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 queue:(id)a6 completion:(id)a7
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006E2C;
  v15[3] = &unk_100010858;
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v12 = v18;
  id v13 = v17;
  id v14 = v16;
  [a1 listenerEndpointForService:v14 instanceIdentifier:a4 listener:v13 queue:a6 completion:v15];
}

+ (id)connectToService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100005DDC;
  v27 = sub_100005DEC;
  id v28 = 0;
  id v13 = dispatch_get_global_queue(0, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007098;
  v18[3] = &unk_1000108A8;
  uint64_t v22 = a6;
  id v14 = v10;
  id v19 = v14;
  id v15 = v12;
  id v20 = v15;
  v21 = &v23;
  [a1 endpointForListenerNamed:v15 fromServiceNamed:v14 instanceIdentifier:v11 queue:v13 async:0 completion:v18];
  id v16 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v16;
}

+ (id)connectToService:(id)a3 listener:(id)a4 error:(id *)a5
{
  return _[a1 connectToService:a3 instanceIdentifier:0 listener:a4 error:a5];
}

+ (void)connectToService:(id)a3 listener:(id)a4 queue:(id)a5 completion:(id)a6
{
}

+ (void)listenerEndpointForService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v15)
  {
    dispatch_get_global_queue(0, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000072E0;
  v22[3] = &unk_100010880;
  id v23 = v14;
  id v24 = v12;
  id v25 = v13;
  id v26 = v15;
  id v27 = v16;
  id v28 = a1;
  id v17 = v16;
  id v18 = v15;
  id v19 = v13;
  id v20 = v12;
  id v21 = v14;
  dispatch_async(v18, v22);
}

+ (void)listenerEndpointForService:(id)a3 listener:(id)a4 queue:(id)a5 completion:(id)a6
{
}

+ (id)connectionForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100005DDC;
  v37 = sub_100005DEC;
  id v38 = 0;
  block = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  id v24 = sub_1000076D0;
  id v25 = &unk_100010830;
  id v32 = a1;
  id v13 = v8;
  id v26 = v13;
  id v14 = v9;
  id v27 = v14;
  id v15 = v10;
  id v28 = v15;
  id v16 = v11;
  v29 = v16;
  v31 = &v33;
  id v17 = v12;
  v30 = v17;
  dispatch_async(v16, &block);
  dispatch_time_t v18 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v17, v18))
  {
    NSLog(@"%s timed out awaiting endpoint for %@ in %@. Did the service fail to bootstrap itself? Is the system absurdly loaded?", "+[AUHSXPCSharedListener connectionForListenerNamed:fromServiceNamed:instanceIdentifier:]", v13, v14, block, v23, v24, v25, v26, v27, v28, v29);
    +[NSException raise:NSInternalInconsistencyException, @"%@ unable to create endpoint for listener named %@", a1, v13 format];
  }
  id v19 = objc_alloc((Class)NSXPCConnection);
  id v20 = [v19 initWithListenerEndpoint:v34[5]];

  _Block_object_dispose(&v33, 8);

  return v20;
}

+ (id)connectionForListenerNamed:(id)a3 fromServiceNamed:(id)a4
{
  return _[a1 connectionForListenerNamed:a3 fromServiceNamed:a4 instanceIdentifier:0];
}

+ (void)endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 completion:(id)a7
{
}

+ (void)endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 async:(BOOL)a7 completion:(id)a8
{
  BOOL v25 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  dispatch_time_t v18 = os_log_create("com.apple.ViewBridge.AUHSXPCSharedListener", "AUHSXPCSharedListener");
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100007BD4;
  v26[3] = &unk_1000107E0;
  os_signpost_id_t v28 = v19;
  id v20 = v17;
  id v27 = v20;
  id v21 = objc_retainBlock(v26);
  os_log_t v22 = os_log_create("com.apple.ViewBridge.AUHSXPCSharedListener", "AUHSXPCSharedListener");
  if (os_signpost_enabled(v22))
  {
    uint64_t v23 = v22;
    id v24 = v23;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 138412802;
      id v30 = v14;
      __int16 v31 = 2112;
      id v32 = v13;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v19, "endpoint-lookup", "%@ %@ %@", buf, 0x20u);
    }
  }
  [a1 _endpointForListenerNamed:v13 fromServiceNamed:v14 instanceIdentifier:v15 queue:v16 async:v25 completion:v21];
}

+ (void)_endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 async:(BOOL)a7 completion:(id)a8
{
  BOOL v43 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  targetq = a6;
  id v47 = a8;
  id v15 = v12;
  id v16 = v13;
  id v17 = v14;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = sub_100005DDC;
  v68 = sub_100005DEC;
  id v69 = 0;
  sub_1000082F4(v15, v16, v17);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100008400;
  v61[3] = &unk_1000106B0;
  v63 = &v64;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v62 = v18;
  sub_100008450(v61);
  id v19 = (id)v65[5];

  _Block_object_dispose(&v64, 8);
  if (!v19)
  {
    uint64_t v45 = objc_opt_new();
    id v20 = v16;
    id v21 = (const char *)[v20 UTF8String];
    uid_t v22 = geteuid();
    if (v22 != 92 && v22 != 203)
    {
      xpc_connection_t v28 = xpc_connection_create(v21, targetq);
      v29 = *(void **)(v45 + 24);
      *(void *)(v45 + 24) = v28;

      goto LABEL_10;
    }
    SecTaskRef v23 = SecTaskCreateFromSelf(kCFAllocatorDefault);
    CFAutorelease(v23);
    id v24 = (void *)SecTaskCopyValueForEntitlement(v23, @"com.apple.private.xpc.launchd.per-user-lookup", 0);
    if (v24)
    {
      if (objc_opt_respondsToSelector())
      {
        unsigned __int8 v25 = [v24 BOOLValue];

        if (v25)
        {
          NSLog(@"%@ working around rdar://problem/35553241", a1);
          xpc_connection_t mach_service = xpc_connection_create_mach_service(v21, targetq, 0);
          id v27 = *(void **)(v45 + 24);
          *(void *)(v45 + 24) = mach_service;

          xpc_connection_set_target_uid();
LABEL_10:
          if (v17)
          {
            uint64_t v64 = 0;
            v65 = 0;
            [v17 getUUIDBytes:&v64];
            xpc_connection_set_oneshot_instance();
          }
          id v30 = v15;
          xpc_object_t v31 = xpc_string_create((const char *)[v30 UTF8String]);
          id v32 = *(void **)(v45 + 32);
          *(void *)(v45 + 32) = v31;

          xpc_object_t v33 = xpc_dictionary_create((const char *const *)&off_100015618, (xpc_object_t *)(v45 + 32), 1uLL);
          id v34 = *(void **)(v45 + 40);
          *(void *)(v45 + 40) = v33;

          uint64_t v35 = *(_xpc_connection_s **)(v45 + 24);
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_1000084FC;
          handler[3] = &unk_100010728;
          id v36 = (id)v45;
          id v56 = v36;
          id v37 = v30;
          id v57 = v37;
          id v38 = v20;
          id v58 = v38;
          xpc_connection_set_event_handler(v35, handler);
          xpc_connection_resume(*(xpc_connection_t *)(v45 + 24));
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_1000085DC;
          v48[3] = &unk_1000107B8;
          id v49 = v36;
          id v54 = a1;
          id v50 = v37;
          id v51 = v38;
          id v52 = v17;
          id v53 = v47;
          v39 = objc_retainBlock(v48);
          v40 = *(_xpc_connection_s **)(v45 + 24);
          v41 = *(void **)(v45 + 40);
          if (v43)
          {
            xpc_connection_send_message_with_reply(v40, v41, targetq, v39);
          }
          else
          {
            xpc_object_t v42 = xpc_connection_send_message_with_reply_sync(v40, v41);
            ((void (*)(void *, xpc_object_t))v39[2])(v39, v42);
          }
          goto LABEL_21;
        }
LABEL_18:
        NSLog(@"%@ should but cannot work around rdar://problem/35553241", a1);
        if (v43)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000084E4;
          block[3] = &unk_1000106D8;
          id v60 = v47;
          dispatch_async(targetq, block);
        }
        else
        {
          (*((void (**)(id, void, void))v47 + 2))(v47, 0, 0);
        }
LABEL_21:

        goto LABEL_22;
      }
      NSLog(@"%s encountered insufficiently BOOLish value of %@", "canWorkAroundRadar35553241", @"com.apple.private.xpc.launchd.per-user-lookup");
    }

    goto LABEL_18;
  }
  (*((void (**)(id, id, void))v47 + 2))(v47, v19, 0);
LABEL_22:
}

+ (void)setEndpointCache:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_100005DDC;
  void v9[4] = sub_100005DEC;
  id v10 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008D8C;
  v8[3] = &unk_100010660;
  v8[4] = v9;
  sub_100008998(v8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008DD4;
  v5[3] = &unk_1000106B0;
  id v7 = v9;
  id v4 = v3;
  id v6 = v4;
  sub_100008450(v5);

  _Block_object_dispose(v9, 8);
}

+ (id)endpointCache
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100005DDC;
  id v9 = sub_100005DEC;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009030;
  v4[3] = &unk_100010638;
  v4[4] = &v5;
  sub_100008450(v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (void)purgeEndpointCache
{
}

+ (void)cacheFutureEndpointsForServiceNamed:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009148;
  v4[3] = &unk_1000105D0;
  id v5 = [a3 copy];
  id v3 = v5;
  sub_100008998(v4);
}

+ (id)endpointForReply:(id)a3 withListenerName:(id)a4 replyErrorCode:(int64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  xpc_type_t type = xpc_get_type(v7);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string_ptr = xpc_string_get_string_ptr(v8);
    string = xpc_dictionary_get_string(v7, _xpc_error_key_description);
    NSLog(@"%s: an error occurred while attempting to obtain endpoint for listener '%s': %s", "+[AUHSXPCSharedListener endpointForReply:withListenerName:replyErrorCode:]", string_ptr, string);
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    int64_t int64 = xpc_dictionary_get_int64(v7, "error-code");
    *a5 = int64;
    if (!int64)
    {
      id v15 = xpc_dictionary_get_value(v7, "listener-endpoint");
      if (v15)
      {
        id v13 = objc_opt_new();
        [v13 _setEndpoint:v15];
      }
      else
      {
        NSLog(@"%s: raw endpoint absent; faking error",
          "+[AUHSXPCSharedListener endpointForReply:withListenerName:replyErrorCode:]");
        id v13 = 0;
        *a5 = 3;
      }

      goto LABEL_7;
    }
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"reply has unknown message type"];
  }
  id v13 = 0;
LABEL_7:

  return v13;
}

@end