@interface CMPedometerProxy
- (CMPedometerProxy)init;
- (id)_strideCalibrationDump;
- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 onQueue:(id)a4 withHandler:(id)a5;
- (void)_handleRecordQueryResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4 shouldStartUpdates:(BOOL)a5;
- (void)_internalQueryPedometerDataFromDate:(id)a3 toDate:(id)a4 onQueue:(id)a5 withHandler:(id)a6;
- (void)_queryPedometerCalibrationBinsWithHandler:(id)a3 forType:(int64_t)a4 forRemote:(BOOL)a5;
- (void)_queryPedometerDataFromDate:(id)a3 toDate:(id)a4 withHandler:(id)a5;
- (void)_queryPedometerDataSinceDataRecord:(id)a3 withHandler:(id)a4 shouldStartUpdates:(BOOL)a5;
- (void)_startPedometerEventUpdatesWithHandler:(id)a3;
- (void)_startPedometerUpdatesFromDate:(id)a3 withHandler:(id)a4;
- (void)_startPedometerUpdatesSinceDataRecord:(id)a3 withHandler:(id)a4;
- (void)_stopPedometerEventUpdates;
- (void)_stopPedometerUpdates;
- (void)_subscribeToCumulativePedometerUpdates:(id)a3;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMPedometerProxy

- (id)_strideCalibrationDump
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  sub_1904424F4("kCLConnectionMessageStrideCalibrationDump", &v19);
  uint64_t v15 = v19;
  v16 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend_sendMessageSync_(CMMotionUtils, v2, (uint64_t)&v15);
  if (v16) {
    sub_1902D8B58(v16);
  }
  if (!v17
    || (v3 = (const std::string *)CLConnectionMessage::name(v17), !std::string::compare(v3, "kCLConnectionMessageError")))
  {
    if (qword_1E929D748 != -1) {
      dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
    }
    v12 = qword_1E929D740;
    if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_ERROR, "Error occurred while trying to write stride calibration data to file!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D748 != -1) {
        dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
      }
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMPedometerProxy _strideCalibrationDump]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    id v11 = 0;
  }
  else
  {
    v4 = v17;
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v10 = (NSSet *)objc_msgSend_setWithObjects_(v5, v9, v6, v7, v8, 0);
    id v11 = (id)CLConnectionMessage::getObjectOfClasses(v4, v10);
  }
  if (v18) {
    sub_1902D8B58(v18);
  }
  if (v20) {
    sub_1902D8B58(v20);
  }
  return v11;
}

- (void)_handleRecordQueryResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4 shouldStartUpdates:(BOOL)a5
{
  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v15 = (NSSet *)objc_msgSend_setWithObjects_(v9, v14, v10, v11, v12, v13, 0);
  if (!*var0 || (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v15)) == 0)
  {
    fAppQueue = self->fAppQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_190523880;
    block[3] = &unk_1E568D2D0;
    block[4] = var1;
    v23 = block;
    goto LABEL_6;
  }
  v18 = DictionaryOfClasses;
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v17, @"CMErrorMessage");
  uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v18, v20, @"CMPedometerDataArray");
  if (v19)
  {
    fAppQueue = self->fAppQueue;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_1905238E4;
    v41[3] = &unk_1E568E9B0;
    v41[5] = self;
    v41[6] = var1;
    char v42 = (char)a4;
    v41[4] = v19;
    v23 = v41;
LABEL_6:
    dispatch_async(fAppQueue, v23);
    return;
  }
  v24 = (void *)v21;
  fAppQueue = self->fAppQueue;
  if (!v24)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = sub_1902DB724;
    v37[3] = &unk_1E568E9D8;
    char v38 = (char)a4;
    v37[4] = self;
    v37[5] = var1;
    v23 = v37;
    goto LABEL_6;
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_190523984;
  v39[3] = &unk_1E568E9B0;
  v39[5] = self;
  v39[6] = var1;
  char v40 = (char)a4;
  v39[4] = v24;
  dispatch_async(fAppQueue, v39);
  uint64_t v27 = objc_msgSend_count(v24, v25, v26);
  v30 = objc_msgSend_maxPedometerEntries(CMPedometerData, v28, v29);
  if (v27 == objc_msgSend_unsignedIntegerValue(v30, v31, v32))
  {
    uint64_t Object = objc_msgSend_lastObject(v24, v33, v34);
    objc_msgSend__queryPedometerDataSinceDataRecord_withHandler_shouldStartUpdates_(self, v36, Object, var1, a4);
  }
}

- (void)_startPedometerEventUpdatesWithHandler:(id)a3
{
  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190523A08;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_queryPedometerDataSinceDataRecord:(id)a3 withHandler:(id)a4 shouldStartUpdates:(BOOL)a5
{
  fInternalQueue = self->fInternalQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1902DB410;
  v6[3] = &unk_1E568E668;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = a4;
  BOOL v7 = a5;
  dispatch_async(fInternalQueue, v6);
}

- (void)_subscribeToCumulativePedometerUpdates:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];

  self->fCumulativeUpdateHandler = 0;
  self->fCumulativeUpdateHandler = a3;
  uint64_t v10 = @"kCLConnectionMessageSubscribeKey";
  v11[0] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v11, &v10, 1);
  sub_1905255CC("kCLConnectionMessageStepCountUpdate", &v7, &v8);
  uint64_t v6 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1902D8B58(v6);
  }
  if (v9) {
    sub_1902D8B58(v9);
  }
}

- (void)_startPedometerUpdatesSinceDataRecord:(id)a3 withHandler:(id)a4
{
  if ((objc_msgSend_isStepCountingAvailable(CMPedometer, a2, (uint64_t)a3) & 1) == 0)
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CMPedometer.mm", 408, @"Step Counting not available on this platform.");
  }

  objc_msgSend__queryPedometerDataSinceDataRecord_withHandler_shouldStartUpdates_(self, v8, (uint64_t)a3, a4, 1);
}

- (CMPedometerProxy)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMPedometerProxy;
  v2 = [(CMPedometerProxy *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMPedometerInternalQueue", 0);
    v2->fAppQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMPedometerUpdateQueue", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  _Block_release(self->fOffsetUpdateHandler);
  self->fOffsetUpdateHandler = 0;

  self->fCumulativeUpdateHandler = 0;
  _Block_release(self->fEventHandler);
  self->fEventHandler = 0;
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  dispatch_release((dispatch_object_t)self->fAppQueue);
  self->fAppQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMPedometerProxy;
  [(CMPedometerProxy *)&v3 dealloc];
}

- (void)_teardown
{
  sub_1902C3F54(&__p, "kCLConnectionMessageStepCountUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0) {
    operator delete(__p);
  }
  if (self->fLocationdConnection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_internalQueryPedometerDataFromDate:(id)a3 toDate:(id)a4 onQueue:(id)a5 withHandler:(id)a6
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = @"CMPedometerStartTime";
  uint64_t v7 = NSNumber;
  objc_msgSend_timeIntervalSinceReferenceDate(a3, a2, (uint64_t)a3);
  v21[0] = objc_msgSend_numberWithDouble_(v7, v8, v9);
  v20[1] = @"CMPedometerStopTime";
  uint64_t v10 = NSNumber;
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

- (void)_queryPedometerDataFromDate:(id)a3 toDate:(id)a4 withHandler:(id)a5
{
  fInternalQueue = self->fInternalQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190522A80;
  v6[3] = &unk_1E568DCF8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  void v6[7] = a5;
  dispatch_async(fInternalQueue, v6);
}

- (void)_startPedometerUpdatesFromDate:(id)a3 withHandler:(id)a4
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190522B0C;
  block[3] = &unk_1E568D410;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_stopPedometerUpdates
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19052316C;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 onQueue:(id)a4 withHandler:(id)a5
{
  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v13 = (NSSet *)objc_msgSend_setWithObjects_(v8, v12, v9, v10, v11, 0);
  if (!*var0 || (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v13)) == 0)
  {
    if (qword_1E929D748 != -1) {
      dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
    }
    uint64_t v21 = qword_1E929D740;
    if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v21, OS_LOG_TYPE_ERROR, "Unable to parse message when checking for availability!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D748 != -1) {
        dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
      }
      LOWORD(v28) = 0;
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMPedometerProxy _handleQueryResponse:onQueue:withHandler:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf) {
        free(v24);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1902DB6BC;
    block[3] = &unk_1E568D320;
    block[4] = 0;
    void block[5] = a4;
    v20 = block;
    goto LABEL_11;
  }
  v16 = DictionaryOfClasses;
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v15, @"CMErrorMessage");
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v18, @"CMPedometerDataObject");
  if (v17)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_190523734;
    v27[3] = &unk_1E568E960;
    v27[5] = v17;
    v27[6] = a4;
    v27[4] = v16;
    v20 = v27;
LABEL_11:
    dispatch_async(var1, v20);
    return;
  }
  if (v19)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1905237B4;
    v26[3] = &unk_1E568E960;
    v26[5] = v16;
    v26[6] = a4;
    v26[4] = v19;
    v20 = v26;
    goto LABEL_11;
  }
  if (qword_1E929D748 != -1) {
    dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
  }
  uint64_t v22 = qword_1E929D740;
  if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v16;
    _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_FAULT, "Unable to parse message (%{public}@) for query response ", buf, 0xCu);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D748 != -1) {
      dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
    }
    int v28 = 138543362;
    uint64_t v29 = v16;
    v23 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMPedometerProxy _handleQueryResponse:onQueue:withHandler:]", "CoreLocation: %s\n", v23);
    if (v23 != (char *)buf) {
      free(v23);
    }
  }
}

- (void)_stopPedometerEventUpdates
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190523BAC;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_queryPedometerCalibrationBinsWithHandler:(id)a3 forType:(int64_t)a4 forRemote:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a5 && (sub_1902BAD40(), !sub_19046BC84()))
  {
    if (qword_1E929D748 != -1) {
      dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
    }
    v20 = qword_1E929D740;
    if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_FAULT, "Remote calibrations not available on this platform", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D748 != -1) {
        dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
      }
      LOWORD(v26) = 0;
      uint64_t v22 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMPedometerProxy _queryPedometerCalibrationBinsWithHandler:forType:forRemote:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
    fAppQueue = self->fAppQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19052407C;
    block[3] = &unk_1E568D2D0;
    block[4] = a3;
    dispatch_async(fAppQueue, block);
  }
  else
  {
    v28[0] = @"CMPedometerFetchRemoteCalibrations";
    v29[0] = objc_msgSend_numberWithBool_(NSNumber, a2, v5);
    v28[1] = @"CMPedometerCalibrationTypeId";
    v29[1] = objc_msgSend_numberWithInteger_(NSNumber, v9, a4);
    uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v29, v28, 2);
    sub_1904EF480("kCLConnectionMessagePedometerCalibrationQuery", &v26, buf);
    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_setWithObjects_(v11, v17, v12, v13, v14, v15, v16, 0);
    uint64_t v24 = *(void *)buf;
    v25 = v31;
    if (v31) {
      atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1905240E4;
    v23[3] = &unk_1E568DE50;
    v23[4] = self;
    v23[5] = a3;
    objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v18, (uint64_t)&v24, v19, v23);
    if (v25) {
      sub_1902D8B58(v25);
    }
    if (v31) {
      sub_1902D8B58(v31);
    }
  }
}

@end