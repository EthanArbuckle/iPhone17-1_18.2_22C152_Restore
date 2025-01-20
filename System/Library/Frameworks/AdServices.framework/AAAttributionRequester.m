@interface AAAttributionRequester
+ (id)_createInternalError;
+ (int64_t)_findBucketForDaemonRunningTime:(double)a3;
+ (int64_t)_tokenStatusFromTokenSource:(int64_t)a3;
- (AAAttribution_XPC)remoteProxy;
- (BOOL)connectionInterrupted;
- (BOOL)isMainThread;
- (NSDate)requestTime;
- (os_unfair_lock_s)unfairLock;
- (unint64_t)intervalId;
- (void)_reportTokenStatus:(int64_t)a3 storeFront:(id)a4 daemonRunningTime:(double)a5;
- (void)_sendAnalyticsAndInvalidateConnection:(unint64_t)a3 end:(unint64_t)a4;
- (void)setConnectionInterrupted:(BOOL)a3;
- (void)setIsMainThread:(BOOL)a3;
- (void)setRemoteProxy:(id)a3;
- (void)setRequestTime:(id)a3;
- (void)setUnfairLock:(os_unfair_lock_s)a3;
@end

@implementation AAAttributionRequester

+ (int64_t)_findBucketForDaemonRunningTime:(double)a3
{
  for (int64_t result = 0; result != 10; ++result)
  {
    if (qword_235F736B0[result] >= (uint64_t)(a3 * 1000.0)) {
      break;
    }
  }
  return result;
}

- (void)_reportTokenStatus:(int64_t)a3 storeFront:(id)a4 daemonRunningTime:(double)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = APPerfLogForCategory();
  uint64_t v14 = objc_msgSend_intervalId(self, v9, v10, v11, v12, v13);
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134349312;
      uint64_t v30 = objc_msgSend_intervalId(self, v16, v17, v18, v19, v20);
      __int16 v31 = 2050;
      int64_t v32 = a3;
      _os_signpost_emit_with_name_impl(&dword_235F70000, v8, OS_SIGNPOST_EVENT, v15, "Token Status", "Token Status id=%{public, name=id}lld status=%{public, name=status}ld", buf, 0x16u);
    }
  }

  v26 = objc_msgSend_now(MEMORY[0x263EFF910], v21, v22, v23, v24, v25);
  id v27 = v7;
  id v28 = v26;
  AnalyticsSendEventLazy();
}

+ (int64_t)_tokenStatusFromTokenSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3 + 2;
  }
}

+ (id)_createInternalError
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = @"An internal error occurred";
  v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v10, (uint64_t)&v9, 1, v2);
  id v7 = objc_msgSend_errorWithDomain_code_userInfo_(v3, v5, @"com.apple.ap.adservices.attributionError", 2, (uint64_t)v4, v6);

  return v7;
}

- (void)_sendAnalyticsAndInvalidateConnection:(unint64_t)a3 end:(unint64_t)a4
{
  uint64_t v9 = objc_msgSend_remoteProxy(self, a2, a3, a4, v4, v5);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_235F72C38;
  v12[3] = &unk_264C96BF0;
  v12[4] = self;
  objc_msgSend_attributionAnalytics_end_Handler_(v9, v10, a3, a4, (uint64_t)v12, v11);
}

- (BOOL)connectionInterrupted
{
  return self->_connectionInterrupted;
}

- (void)setConnectionInterrupted:(BOOL)a3
{
  self->_connectionInterrupted = a3;
}

- (AAAttribution_XPC)remoteProxy
{
  return self->_remoteProxy;
}

- (void)setRemoteProxy:(id)a3
{
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (BOOL)isMainThread
{
  return self->_isMainThread;
}

- (void)setIsMainThread:(BOOL)a3
{
  self->_isMainThread = a3;
}

- (NSDate)requestTime
{
  return self->_requestTime;
}

- (void)setRequestTime:(id)a3
{
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_remoteProxy, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end