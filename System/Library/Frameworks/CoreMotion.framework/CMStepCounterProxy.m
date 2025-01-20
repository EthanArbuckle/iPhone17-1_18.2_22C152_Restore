@interface CMStepCounterProxy
- (CMStepCounterProxy)init;
- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 onQueue:(id)a4 withHandler:(id)a5;
- (void)_queryStepCountStartingFromInternal:(id)a3 to:(id)a4 toQueue:(id)a5 withHandler:(id)a6;
- (void)_startStepCountingUpdatesToQueue:(id)a3 updateOn:(int64_t)a4 withHandler:(id)a5;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMStepCounterProxy

- (CMStepCounterProxy)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMStepCounterProxy;
  v2 = [(CMStepCounterProxy *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("CMStepCounterQueue", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMStepCounterProxy;
  [(CMStepCounterProxy *)&v3 dealloc];
}

- (void)_teardown
{
  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    MEMORY[0x192FCC3F0](fLocationdConnection, a2);
    JUMPOUT(0x192FCC980);
  }
}

- (void)_queryStepCountStartingFromInternal:(id)a3 to:(id)a4 toQueue:(id)a5 withHandler:(id)a6
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = @"CMPedometerStartTime";
  v7 = NSNumber;
  objc_msgSend_timeIntervalSinceReferenceDate(a3, a2, (uint64_t)a3);
  v21[0] = objc_msgSend_numberWithDouble_(v7, v8, v9);
  v20[1] = @"CMPedometerStopTime";
  v10 = NSNumber;
  objc_msgSend_timeIntervalSinceReferenceDate(a4, v11, v12);
  v21[1] = objc_msgSend_numberWithDouble_(v10, v13, v14);
  uint64_t v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v21, v20, 2);
  sub_1902BB770("kCLConnectionMessageStepCountQuery", &v19, &v17);
  v16 = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v16) {
    sub_1902D8B58(v16);
  }
  if (v18) {
    sub_1902D8B58(v18);
  }
}

- (void)_startStepCountingUpdatesToQueue:(id)a3 updateOn:(int64_t)a4 withHandler:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  self->fStepCountFromStart = -1;
  self->fPrevStepCount = -1;
  sub_1902C3F54(&__p, "kCLConnectionMessageStepCountUpdate");
  v11[1] = MEMORY[0x1E4F143A8];
  v11[2] = 3221225472;
  v11[3] = sub_1905AFA7C;
  v11[4] = &unk_1E56900B8;
  v11[5] = self;
  v11[6] = a3;
  v11[7] = a5;
  v11[8] = a4;
  CLConnectionClient::setHandlerForMessage();
  if (v14 < 0) {
    operator delete(__p);
  }
  v15 = @"kCLConnectionMessageSubscribeKey";
  v16[0] = MEMORY[0x1E4F1CC38];
  v11[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v16, &v15, 1);
  sub_1905255CC("kCLConnectionMessageStepCountUpdate", v11, &__p);
  v10 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v10) {
    sub_1902D8B58(v10);
  }
  self->fStartedUpdates = 1;
  if (v13) {
    sub_1902D8B58(v13);
  }
}

- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 onQueue:(id)a4 withHandler:(id)a5
{
  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v13 = (NSSet *)objc_msgSend_setWithObjects_(v8, v12, v9, v10, v11, 0);
  if (*var0 && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v13)) != 0)
  {
    v16 = DictionaryOfClasses;
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v15, @"CMErrorMessage");
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v18, @"CMPedometerDataObject");
    v22 = objc_msgSend_numberOfSteps(v19, v20, v21);
    uint64_t v25 = objc_msgSend_integerValue(v22, v23, v24);
    if (v17)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = sub_1905B041C;
      v34[3] = &unk_1E568D320;
      v34[4] = v17;
      v34[5] = a4;
      objc_msgSend_addOperationWithBlock_(var1, v26, (uint64_t)v34);
    }
    else if (v19)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = sub_1905B0494;
      v33[3] = &unk_1E568D268;
      v33[4] = a4;
      v33[5] = v25;
      objc_msgSend_addOperationWithBlock_(var1, v26, (uint64_t)v33);
    }
    else
    {
      if (qword_1E929D748 != -1) {
        dispatch_once(&qword_1E929D748, &unk_1EDFD3EC0);
      }
      v29 = qword_1E929D740;
      if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v16;
        _os_log_impl(&dword_1902AF000, v29, OS_LOG_TYPE_FAULT, "Unable to parse mesage (%{public}@) for query response", buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D748 != -1) {
          dispatch_once(&qword_1E929D748, &unk_1EDFD3EC0);
        }
        int v35 = 138543362;
        v36 = v16;
        v30 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMStepCounterProxy _handleQueryResponse:onQueue:withHandler:]", "CoreLocation: %s\n", v30);
        if (v30 != (char *)buf) {
          free(v30);
        }
      }
    }
  }
  else
  {
    if (qword_1E929D748 != -1) {
      dispatch_once(&qword_1E929D748, &unk_1EDFD3EC0);
    }
    v27 = qword_1E929D740;
    if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_ERROR, "Unable to parse message when checking for availability!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D748 != -1) {
        dispatch_once(&qword_1E929D748, &unk_1EDFD3EC0);
      }
      LOWORD(v35) = 0;
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMStepCounterProxy _handleQueryResponse:onQueue:withHandler:]", "CoreLocation: %s\n", v31);
      if (v31 != (char *)buf) {
        free(v31);
      }
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1905B04AC;
    v32[3] = &unk_1E568D2D0;
    v32[4] = a4;
    objc_msgSend_addOperationWithBlock_(var1, v28, (uint64_t)v32);
  }
}

@end