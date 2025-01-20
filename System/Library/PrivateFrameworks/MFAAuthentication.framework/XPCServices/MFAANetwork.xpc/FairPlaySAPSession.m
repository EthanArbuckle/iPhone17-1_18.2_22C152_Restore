@interface FairPlaySAPSession
+ (FairPlaySAPSession)sessionWithDelegate:(id)a3;
- (FPSAPContextOpaque_)sessionContext;
- (FairPlayHWInfo_)hwInfo;
- (FairPlaySAPSession)init;
- (FairPlaySAPSession)initWithDelegate:(id)a3;
- (FairPlaySAPSessionDelegate)delegate;
- (NSDate)expiration;
- (NSUUID)UUID;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)internalQueue;
- (double)TTL;
- (id)description;
- (unint64_t)state;
- (unint64_t)state_int;
- (void)_checkExpiration;
- (void)_close;
- (void)close;
- (void)dealloc;
- (void)openWithCompletionHandler:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setHwInfo:(FairPlayHWInfo_ *)a3;
- (void)setInternalQueue:(id)a3;
- (void)setSessionContext:(FPSAPContextOpaque_ *)a3;
- (void)setState_int:(unint64_t)a3;
- (void)setTTL:(double)a3;
- (void)signatureForData:(id)a3 completionHandler:(id)a4;
- (void)verifySignature:(id)a3 forData:(id)a4 completionHandler:(id)a5;
@end

@implementation FairPlaySAPSession

- (FairPlaySAPSession)initWithDelegate:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FairPlaySAPSession;
  v5 = [(FairPlaySAPSession *)&v26 init];
  if (v5 == self)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    self->_state_int = 0;
    v6 = +[NSUUID UUID];
    UUID = self->_UUID;
    self->_UUID = v6;

    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = +[NSString stringWithFormat:@"%@-%lu.completionQueue", v9, [(FairPlaySAPSession *)self hash]];
    v11 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v10 UTF8String], (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    completionQueue = self->_completionQueue;
    self->_completionQueue = v11;

    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    id v15 = +[NSString stringWithFormat:@"%@-%lu.internalQueue", v14, [(FairPlaySAPSession *)self hash]];
    v16 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v15 UTF8String], 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v16;

    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    id v20 = +[NSString stringWithFormat:@"%@-%lu.delegateQueue", v19, [(FairPlaySAPSession *)self hash]];
    v21 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v20 UTF8String], (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v21;

    self->_sessionContext = 0;
    *(void *)&self->_hwInfo.ID[4] = 0;
    *(void *)&self->_hwInfo.ID[12] = 0;
    *(void *)&self->_hwInfo.IDLength = 0;
    v23 = +[NSDate distantFuture];
    expiration = self->_expiration;
    self->_expiration = v23;
  }
  return v5;
}

- (FairPlaySAPSession)init
{
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector("initWithDelegate:");
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Must use +[%@ %@] instead of +[%@ %@]!", v5, v6, v8, v9);

  return 0;
}

- (void)dealloc
{
  [(FairPlaySAPSession *)self close];
  v3.receiver = self;
  v3.super_class = (Class)FairPlaySAPSession;
  [(FairPlaySAPSession *)&v3 dealloc];
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(FairPlaySAPSession *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_100078A40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _checkExpiration];
  if (objc_msgSend(*(id *)(a1 + 32), "state_int"))
  {
    v2 = [*(id *)(a1 + 32) completionQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2_38;
    v16[3] = &unk_1000787B0;
    id v17 = *(id *)(a1 + 40);
    dispatch_async(v2, v16);

    objc_super v3 = v17;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[#FairPlaySAPSession] Opening session...", buf, 2u);
    }
    cp2g1b9ro(*(void *)(a1 + 32) + 56, *(void *)(a1 + 32) + 72);
    if (v4)
    {
      uint64_t v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      v13 = [*(id *)(a1 + 32) completionQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_20;
      block[3] = &unk_1000787B0;
      id v21 = *(id *)(a1 + 40);
      dispatch_async(v13, block);

      objc_super v3 = v21;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setState_int:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setState_int:", 2);
      v14 = [*(id *)(a1 + 32) delegateQueue];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2;
      v18[3] = &unk_100078A40;
      id v15 = *(void **)(a1 + 40);
      v18[4] = *(void *)(a1 + 32);
      id v19 = v15;
      dispatch_async(v14, v18);

      objc_super v3 = v19;
    }
  }
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[NSError FPSAPS_errorWithCode:-4 andDescription:@"Could not initialize session."];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_3;
  v4[3] = &unk_1000789F0;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  [v2 session:v3 requestCertificateWithCompletionHandler:v4];
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) internalQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4;
  v12[3] = &unk_1000789C8;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4(id *a1)
{
  id v2 = (uint64_t *)(a1 + 4);
  if (a1[4])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_cold_2(v2);
    }
    [a1[5] _close];
    uint64_t v3 = [a1[5] completionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_26;
    block[3] = &unk_100078760;
    id v24 = a1[7];
    id v23 = a1[4];
    dispatch_async(v3, block);

    uint64_t v4 = v24;
LABEL_17:

    return;
  }
  id v5 = a1[6];
  if (!v5 || ![v5 length])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#FairPlaySAPSession] Invalid certificate received!", buf, 2u);
    }
    [a1[5] _close];
    id v10 = [a1[5] completionQueue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_27;
    v20[3] = &unk_1000787B0;
    id v21 = a1[7];
    dispatch_async(v10, v20);

    uint64_t v4 = v21;
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[#FairPlaySAPSession] Received certificate!", buf, 2u);
  }
  objc_msgSend(a1[5], "setState_int:", 3);
  char v19 = -1;
  *(void *)buf = 0;
  int v17 = 0;
  Mib5yocT(200, (uint64_t)a1[5] + 72, (uint64_t)[a1[5] sessionContext], (uint64_t)objc_msgSend(a1[6], "bytes"), (uint64_t)objc_msgSend(a1[6], "length"), (uint64_t)buf, (uint64_t)&v17, (uint64_t)&v19);
  if (!v6 && v19 == 1 && *(void *)buf && v17)
  {
    uint64_t v7 = +[NSData dataWithBytesNoCopy:length:](NSData, "dataWithBytesNoCopy:length:");
    objc_msgSend(a1[5], "setState_int:", 4);
    uint64_t v8 = [a1[5] delegateQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2_30;
    v12[3] = &unk_100078A18;
    void v12[4] = a1[5];
    id v13 = v7;
    id v14 = a1[7];
    id v9 = v7;
    dispatch_async(v8, v12);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_cold_1();
    }
    if (*(void *)buf)
    {
      free(*(void **)buf);
      *(void *)buf = 0;
    }
    [a1[5] _close];
    id v11 = [a1[5] completionQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_28;
    v15[3] = &unk_1000787B0;
    id v16 = a1[7];
    dispatch_async(v11, v15);

    id v9 = v16;
  }
}

uint64_t __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_26(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_27(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[NSError FPSAPS_errorWithCode:-3];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[NSError FPSAPS_errorWithCode:-4];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2_30(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_3_31;
  v5[3] = &unk_1000789F0;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 session:v3 requestHandshakeWithServer:v4 completionHandler:v5];
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_3_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) internalQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_32;
  v12[3] = &unk_1000789C8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_32(id *a1)
{
  id v2 = (uint64_t *)(a1 + 4);
  if (a1[4])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_32_cold_2(v2);
    }
    [a1[5] _close];
    uint64_t v3 = [a1[5] completionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_33;
    block[3] = &unk_100078760;
    id v22 = a1[7];
    id v21 = a1[4];
    dispatch_async(v3, block);

    uint64_t v4 = v22;
  }
  else if (a1[6])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[#FairPlaySAPSession] Received handshake response!", buf, 2u);
    }
    objc_msgSend(a1[5], "setState_int:", 5);
    char v17 = -1;
    *(void *)buf = 0;
    int v15 = 0;
    Mib5yocT(200, (uint64_t)a1[5] + 72, (uint64_t)[a1[5] sessionContext], (uint64_t)objc_msgSend(a1[6], "bytes"), (uint64_t)objc_msgSend(a1[6], "length"), (uint64_t)buf, (uint64_t)&v15, (uint64_t)&v17);
    int v6 = v5;
    if (*(void *)buf)
    {
      free(*(void **)buf);
      *(void *)buf = 0;
    }
    if (v6 || v17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_32_cold_1();
      }
      [a1[5] _close];
      uint64_t v7 = [a1[5] completionQueue];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_36;
      v11[3] = &unk_1000787B0;
      uint64_t v8 = &v12;
      id v12 = a1[7];
      id v9 = v11;
    }
    else
    {
      objc_msgSend(a1[5], "setState_int:", 6);
      uint64_t v7 = [a1[5] completionQueue];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_35;
      v13[3] = &unk_1000787B0;
      uint64_t v8 = &v14;
      id v14 = a1[7];
      id v9 = v13;
    }
    dispatch_async(v7, v9);

    uint64_t v4 = *v8;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#FairPlaySAPSession] Invalid handshake response received!", buf, 2u);
    }
    [a1[5] _close];
    id v10 = [a1[5] completionQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_34;
    v18[3] = &unk_1000787B0;
    id v19 = a1[7];
    dispatch_async(v10, v18);

    uint64_t v4 = v19;
  }
}

uint64_t __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_33(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[NSError FPSAPS_errorWithCode:-3];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

uint64_t __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_35(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[NSError FPSAPS_errorWithCode:-4];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2_38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[NSError FPSAPS_errorWithCode:-7 andDescription:@"Session is already open or initializing."];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)close
{
  uint64_t v3 = [(FairPlaySAPSession *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __27__FairPlaySAPSession_close__block_invoke;
  block[3] = &unk_100078A68;
  void block[4] = self;
  dispatch_async(v3, block);
}

id __27__FairPlaySAPSession_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _close];
}

- (void)signatureForData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(FairPlaySAPSession *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke;
    block[3] = &unk_100078A18;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke(id *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[#FairPlaySAPSession] Generating signature...", buf, 2u);
  }
  [a1[4] _checkExpiration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_msgSend(a1[4], "state_int") == (id)6)
    {
      *(void *)buf = 0;
      int v27 = 0;
      Fc3vhtJDvr((uint64_t)[a1[4] sessionContext], (uint64_t)objc_msgSend(a1[5], "bytes"), (uint64_t)objc_msgSend(a1[5], "length"), (uint64_t)buf, (uint64_t)&v27);
      if (v2)
      {
        uint64_t v3 = v2;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
        }
        if (*(void *)buf)
        {
          free(*(void **)buf);
          *(void *)buf = 0;
        }
        id v11 = [a1[4] completionQueue];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_43;
        v22[3] = &unk_1000787B0;
        id v12 = &v23;
        id v23 = a1[6];
        id v13 = v22;
      }
      else
      {
        id v11 = [a1[4] completionQueue];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_2;
        v24[3] = &unk_100078A90;
        id v12 = (void **)v25;
        v25[0] = a1[6];
        v25[1] = *(void *)buf;
        int v26 = v27;
        id v13 = v24;
      }
      dispatch_async(v11, v13);

      v18 = *v12;
    }
    else
    {
      id v19 = [a1[4] completionQueue];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_2_44;
      v20[3] = &unk_1000787B0;
      id v21 = a1[6];
      dispatch_async(v19, v20);

      v18 = v21;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v14 = (objc_class *)objc_opt_class();
      int v15 = NSStringFromClass(v14);
      id v16 = a1[5];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      __int16 v31 = 2112;
      id v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[#FairPlaySAPSession] Invalid parameter! (data.class: %@, data: %@)", buf, 0x16u);
    }
    char v17 = [a1[4] completionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_42;
    block[3] = &unk_1000787B0;
    id v29 = a1[6];
    dispatch_async(v17, block);

    v18 = v29;
  }
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_42(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError FPSAPS_errorWithCode:-3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSData dataWithBytesNoCopy:*(void *)(a1 + 40) length:*(unsigned int *)(a1 + 48)];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_43(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError FPSAPS_errorWithCode:-3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_2_44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError FPSAPS_errorWithCode:-7 andDescription:@"Session must be open to generate signature."];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)verifySignature:(id)a3 forData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [(FairPlaySAPSession *)self internalQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke;
    v12[3] = &unk_100078AB8;
    id v13 = v8;
    id v14 = v9;
    int v15 = self;
    id v16 = v10;
    dispatch_async(v11, v12);
  }
}

void __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke(id *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[#FairPlaySAPSession] Verifying signature...", buf, 2u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (objc_msgSend(a1[6], "state_int") == (id)6)
    {
      id v2 = [a1[5] mutableCopy];
      [a1[6] sessionContext];
      [a1[4] bytes];
      [a1[4] length];
      id v3 = v2;
      [v3 mutableBytes];
      [v3 length];
      gLg1CWr7p();
      int v5 = v4;
      [a1[6] _checkExpiration];
      if (v5)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v26) = v5;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#FairPlaySAPSession] Signature verification failed! (status: %d)", buf, 8u);
        }
        uint64_t v6 = [a1[6] completionQueue];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_49;
        v19[3] = &unk_1000787B0;
        uint64_t v7 = &v20;
        id v20 = a1[7];
        id v8 = v19;
      }
      else
      {
        uint64_t v6 = [a1[6] completionQueue];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_2;
        v21[3] = &unk_1000787B0;
        uint64_t v7 = &v22;
        id v22 = a1[7];
        id v8 = v21;
      }
      dispatch_async(v6, v8);
    }
    else
    {
      id v16 = [a1[6] completionQueue];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_2_50;
      v17[3] = &unk_1000787B0;
      id v18 = a1[7];
      dispatch_async(v16, v17);

      id v3 = v18;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      id v13 = a1[4];
      id v14 = a1[5];
      *(_DWORD *)buf = 138413058;
      int v26 = v10;
      __int16 v27 = 2112;
      v28 = v12;
      __int16 v29 = 2112;
      id v30 = v13;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[#FairPlaySAPSession] Invalid parameter! (signature.class: %@, data.class: %@, signature: %@, data: %@)", buf, 0x2Au);
    }
    int v15 = [a1[6] completionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_48;
    block[3] = &unk_1000787B0;
    id v24 = a1[7];
    dispatch_async(v15, block);

    id v3 = v24;
  }
}

void __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError FPSAPS_errorWithCode:-3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError FPSAPS_errorWithCode:-3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_2_50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError FPSAPS_errorWithCode:-7 andDescription:@"Session must be open to verify signature."];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_close
{
}

- (void)_checkExpiration
{
  uint64_t v1 = [a1 expiration];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "[#FairPlaySAPSession] Checking expiration for session (expiration: %@)...", (uint8_t *)&v2, 0xCu);
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  unint64_t v5 = [(FairPlaySAPSession *)self state];
  if (v5 > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_100078B28[v5];
  }
  [(FairPlaySAPSession *)self TTL];
  id v8 = +[NSString stringWithFormat:@"%@ <state: %@, TTL: %fs>", v4, v6, v7];

  return v8;
}

- (unint64_t)state
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(FairPlaySAPSession *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __27__FairPlaySAPSession_state__block_invoke;
  v6[3] = &unk_100078AE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

char *__27__FairPlaySAPSession_state__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _checkExpiration];
  uint64_t result = (char *)objc_msgSend(*(id *)(a1 + 32), "state_int");
  if ((unint64_t)(result - 1) <= 5) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = qword_100064B30[(void)(result - 1)];
  }
  return result;
}

- (double)TTL
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(FairPlaySAPSession *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __25__FairPlaySAPSession_TTL__block_invoke;
  v6[3] = &unk_100078AE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __25__FairPlaySAPSession_TTL__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "state_int") == (id)6)
  {
    id v3 = [*(id *)(a1 + 32) expiration];
    [v3 timeIntervalSinceNow];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  }
}

- (void)setTTL:(double)a3
{
  unint64_t v5 = [(FairPlaySAPSession *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __29__FairPlaySAPSession_setTTL___block_invoke;
  v6[3] = &unk_100078B08;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_barrier_sync(v5, v6);
}

void __29__FairPlaySAPSession_setTTL___block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 40);
  id v3 = +[NSDate dateWithTimeIntervalSinceNow:*(double *)(a1 + 40)];
  unint64_t v5 = *(void **)(a1 + 32);
  double v4 = (id *)(a1 + 32);
  [v5 setExpiration:v3];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    __29__FairPlaySAPSession_setTTL___block_invoke_cold_1(v2, v4);
  }
}

- (void)setState_int:(unint64_t)a3
{
  self->_unint64_t state_int = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    unint64_t state_int = self->_state_int;
    if (state_int > 6) {
      unint64_t v5 = 0;
    }
    else {
      unint64_t v5 = off_100078B40[state_int];
    }
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[#FairPlaySAPSession] self.state_int: %@", (uint8_t *)&v6, 0xCu);
  }
}

+ (FairPlaySAPSession)sessionWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDelegate:v4];

  return (FairPlaySAPSession *)v5;
}

- (FairPlaySAPSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FairPlaySAPSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (unint64_t)state_int
{
  return self->_state_int;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (FPSAPContextOpaque_)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(FPSAPContextOpaque_ *)a3
{
  self->_sessionContext = a3;
}

- (FairPlayHWInfo_)hwInfo
{
  *retstr = self[3];
  return self;
}

- (void)setHwInfo:(FairPlayHWInfo_ *)a3
{
  long long v3 = *(_OWORD *)&a3->IDLength;
  *(void *)&self->_hwInfo.ID[12] = *(void *)&a3->ID[12];
  *(_OWORD *)&self->_hwInfo.IDLength = v3;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[#FairPlaySAPSession] Could not generate handshake request data! (status: %d, returnCode: %d)", v0, 0xEu);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_cold_2(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[#FairPlaySAPSession] Error requesting certificate: %@", (uint8_t *)&v2, 0xCu);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_32_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[#FairPlaySAPSession] Could not process handshake response! (status: %d, returnCode: %d)", v0, 0xEu);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_32_cold_2(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[#FairPlaySAPSession] Error requesting handshake: %@", (uint8_t *)&v2, 0xCu);
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __29__FairPlaySAPSession_setTTL___block_invoke_cold_1(uint64_t *a1, id *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = [*a2 expiration];
  int v4 = 134218242;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "[#FairPlaySAPSession] Setting TTL... (TTL: %f, self.expiration: %@)", (uint8_t *)&v4, 0x16u);
}

@end