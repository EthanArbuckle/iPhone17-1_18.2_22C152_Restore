@interface CMAltimeterInternal
+ (BOOL)_bundleBeforeTCCCheck;
+ (BOOL)_bundleBeforeTCCCheck:(id)a3;
- (CMAltimeterInternal)init;
- (id).cxx_construct;
- (void)_handleAbsoluteAltitudeUpdate:(shared_ptr<CLConnectionMessage>)a3;
- (void)_queryElevationProfileFromDate:(id)a3 toDate:(id)a4 withBatchSize:(unint64_t)a5 fromRecordId:(int)a6 withHandler:(id)a7;
- (void)_queryElevationProfileFromDate:(id)a3 toDate:(id)a4 withBatchSize:(unint64_t)a5 withHandler:(id)a6;
- (void)_querySignificantElevationChangeFromDate:(id)a3 toDate:(id)a4 withHandler:(id)a5;
- (void)_releaseHandlerObjects;
- (void)_startAbsoluteAltitudeUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)_startElevationUpdatesWithHandler:(id)a3;
- (void)_startRelativeAltitudeUpdates;
- (void)_startSignificantElevationUpdatesWithHandler:(id)a3;
- (void)_stopAbsoluteAltitudeUpdates;
- (void)_stopElevationUpdates;
- (void)_stopRelativeAltitudeUpdates;
- (void)_stopSignificantElevationUpdates;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMAltimeterInternal

- (CMAltimeterInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)CMAltimeterInternal;
  v2 = [(CMAltimeterInternal *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *((unsigned char *)&v2->fBaseAltimeterSample.acceleration + 12) = 0;
    v2->fRelativeAltimeterHandler = 0;
    v2->fRelativeAltimeterQueue = 0;
    v2->fFilteredPressureDispatcher = 0;
    v2->fPressureSamples.__size_.__value_ = (unint64_t)dispatch_queue_create("com.apple.CoreMotion.CMAltimeterInternalQueue", 0);
    v3->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMAltimeterAppQueue", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  _Block_release(self->fLocationdConnection);
  self->fLocationdConnection = 0;
  _Block_release(self->fHandler);
  self->fHandler = 0;
  dispatch_release((dispatch_object_t)self->fPressureSamples.__size_.__value_);
  self->fPressureSamples.__size_.__value_ = 0;
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMAltimeterInternal;
  [(CMAltimeterInternal *)&v3 dealloc];
}

- (void)_teardown
{
  sub_1902C3F54(&__p, "kCLConnectionMessageSignificantElevationUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0) {
    operator delete(__p);
  }
  if (self->fAppQueue)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
  }
  self->fAppQueue = 0;
}

- (void)_startElevationUpdatesWithHandler:(id)a3
{
  value = self->fPressureSamples.__size_.__value_;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905C556C;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(value, v4);
}

- (void)_stopElevationUpdates
{
  value = self->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905C5720;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(value, block);
}

- (void)_startSignificantElevationUpdatesWithHandler:(id)a3
{
  value = self->fPressureSamples.__size_.__value_;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905C58D4;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(value, v4);
}

- (void)_stopSignificantElevationUpdates
{
  value = self->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905C5A88;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(value, block);
}

- (void)_querySignificantElevationChangeFromDate:(id)a3 toDate:(id)a4 withHandler:(id)a5
{
  value = self->fPressureSamples.__size_.__value_;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905C5C2C;
  v6[3] = &unk_1E568DCF8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(value, v6);
}

- (void)_queryElevationProfileFromDate:(id)a3 toDate:(id)a4 withBatchSize:(unint64_t)a5 fromRecordId:(int)a6 withHandler:(id)a7
{
  value = self->fPressureSamples.__size_.__value_;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905C64D8;
  v8[3] = &unk_1E5690448;
  v8[4] = a3;
  v8[5] = a4;
  v8[7] = a7;
  v8[8] = a5;
  int v9 = a6;
  v8[6] = self;
  dispatch_async(value, v8);
}

- (void)_queryElevationProfileFromDate:(id)a3 toDate:(id)a4 withBatchSize:(unint64_t)a5 withHandler:(id)a6
{
  value = self->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905C6D7C;
  block[3] = &unk_1E5690470;
  block[4] = self;
  void block[5] = a3;
  block[7] = a6;
  block[8] = a5;
  block[6] = a4;
  dispatch_async(value, block);
}

+ (BOOL)_bundleBeforeTCCCheck
{
  uint64_t v3 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, v2);
  v6 = objc_msgSend_infoDictionary(v3, v4, v5);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"DTPlatformVersion");

  return MEMORY[0x1F4181798](CMAltimeterInternal, sel__bundleBeforeTCCCheck_, v8);
}

+ (BOOL)_bundleBeforeTCCCheck:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  if (qword_1E929D758 != -1) {
    dispatch_once(&qword_1E929D758, &unk_1EDFC1FA0);
  }
  v4 = qword_1E929D750;
  if (os_log_type_enabled((os_log_t)qword_1E929D750, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v30 = objc_msgSend_UTF8String(a3, v5, v6);
    _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_DEBUG, "app sdk version, %s", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D758 != -1) {
      dispatch_once(&qword_1E929D758, &unk_1EDFC1FA0);
    }
    objc_msgSend_UTF8String(a3, v26, v27);
    v28 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "+[CMAltimeterInternal _bundleBeforeTCCCheck:]", "CoreLocation: %s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
  uint64_t v8 = objc_msgSend_componentsSeparatedByString_(a3, v7, @".");
  if (!objc_msgSend_count(v8, v9, v10)) {
    return 1;
  }
  v12 = objc_msgSend_objectAtIndexedSubscript_(v8, v11, 0);
  if ((int)objc_msgSend_intValue(v12, v13, v14) < 17) {
    return 1;
  }
  v17 = objc_msgSend_objectAtIndexedSubscript_(v8, v15, 0);
  if ((int)objc_msgSend_intValue(v17, v18, v19) > 17) {
    return 0;
  }
  if ((unint64_t)objc_msgSend_count(v8, v20, v21) < 2) {
    return 1;
  }
  v23 = objc_msgSend_objectAtIndexedSubscript_(v8, v22, 1);
  return (int)objc_msgSend_intValue(v23, v24, v25) < 5;
}

- (void)_startRelativeAltitudeUpdates
{
  if ((sub_1902CD6B0() & 0x1000000000) != 0)
  {
    value = self->fPressureSamples.__size_.__value_;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905C70B8;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_async(value, block);
  }
}

- (void)_stopRelativeAltitudeUpdates
{
  value = self->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905C7244;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_async(value, block);
}

- (void)_releaseHandlerObjects
{
  *(void *)&self->fStopRelativeAltitudeUpdates = 0;
  _Block_release(self->fAbsoluteAltitudeClientQueue);
  self->fAbsoluteAltitudeClientQueue = 0;
}

- (void)_startAbsoluteAltitudeUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905C7434;
  v4[3] = &unk_1E568D410;
  v4[5] = self;
  void v4[6] = a4;
  v4[4] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4);
}

- (void)_stopAbsoluteAltitudeUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1905C7674;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)_handleAbsoluteAltitudeUpdate:(shared_ptr<CLConnectionMessage>)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!*(void *)a3.var0)
  {
    if (qword_1E929D788 != -1) {
      dispatch_once(&qword_1E929D788, &unk_1EDFC1F80);
    }
    v23 = qword_1E929D780;
    if (os_log_type_enabled((os_log_t)qword_1E929D780, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v23, OS_LOG_TYPE_ERROR, "Error; NULL message received in AbsoluteAltimeter update",
        buf,
        2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D788 != -1) {
      dispatch_once(&qword_1E929D788, &unk_1EDFC1F80);
    }
    LOWORD(v29) = 0;
LABEL_29:
    v22 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMAltimeterInternal _handleAbsoluteAltitudeUpdate:]", "CoreLocation: %s\n", v22);
    if (v22 == (char *)buf) {
      return;
    }
    goto LABEL_30;
  }
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = (NSSet *)objc_msgSend_setWithObjects_(v5, v9, v6, v7, v8, 0);
  DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v10);
  if (!DictionaryOfClasses)
  {
    if (qword_1E929D788 != -1) {
      dispatch_once(&qword_1E929D788, &unk_1EDFC1F80);
    }
    v24 = qword_1E929D780;
    if (os_log_type_enabled((os_log_t)qword_1E929D780, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v24, OS_LOG_TYPE_ERROR, "Error; NULL dictionary received in AbsoluteAltimeter update",
        buf,
        2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D788 != -1) {
      dispatch_once(&qword_1E929D788, &unk_1EDFC1F80);
    }
    LOWORD(v29) = 0;
    goto LABEL_29;
  }
  v13 = DictionaryOfClasses;
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v12, @"CMErrorMessage");
  if (v14)
  {
    v16 = (void *)v14;
    if (qword_1E929D788 != -1) {
      dispatch_once(&qword_1E929D788, &unk_1EDFC1F80);
    }
    v17 = qword_1E929D780;
    if (os_log_type_enabled((os_log_t)qword_1E929D780, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v32 = objc_msgSend_intValue(v16, v18, v19);
      _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_ERROR, "Error %d received in AbsoluteAltimeter update", buf, 8u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D788 != -1) {
      dispatch_once(&qword_1E929D788, &unk_1EDFC1F80);
    }
    int v29 = 67109120;
    int v30 = objc_msgSend_intValue(v16, v20, v21);
    v22 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMAltimeterInternal _handleAbsoluteAltitudeUpdate:]", "CoreLocation: %s\n", v22);
    if (v22 == (char *)buf) {
      return;
    }
LABEL_30:
    free(v22);
    return;
  }
  id v25 = (id)objc_msgSend_objectForKeyedSubscript_(v13, v15, @"CMAbsoluteAltitudeKey");
  if (v25)
  {
    value = self->fPressureSamples.__size_.__value_;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905C7D98;
    block[3] = &unk_1E568D190;
    block[4] = self;
    void block[5] = v25;
    dispatch_async(value, block);
    return;
  }
  if (qword_1E929D788 != -1) {
    dispatch_once(&qword_1E929D788, &unk_1EDFC1F80);
  }
  uint64_t v27 = qword_1E929D780;
  if (os_log_type_enabled((os_log_t)qword_1E929D780, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_ERROR, "Error; NULL data received in AbsoluteAltimeter update",
      buf,
      2u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D788 != -1) {
      dispatch_once(&qword_1E929D788, &unk_1EDFC1F80);
    }
    LOWORD(v29) = 0;
    goto LABEL_29;
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

@end