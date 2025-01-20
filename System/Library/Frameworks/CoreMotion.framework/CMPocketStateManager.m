@interface CMPocketStateManager
+ (BOOL)isPocketStateAvailable;
+ (BOOL)isPocketStateSupported;
- (CMPocketStateDelegate)delegate;
- (CMPocketStateManager)init;
- (id).cxx_construct;
- (id)externalStateToString:(int64_t)a3;
- (int)translateExternalState:(int64_t)a3;
- (int64_t)translateInternalState:(int)a3;
- (void)_disableDispatcher;
- (void)_prepareDispatcher;
- (void)addToAggdScalarWithName:(id)a3 andScalar:(unint64_t)a4;
- (void)dealloc;
- (void)onNotification:(id)a3;
- (void)onPocketStateUpdated:(int)a3;
- (void)queryStateOntoQueue:(id)a3 andMonitorFor:(double)a4 withTimeout:(double)a5 andHandler:(id)a6;
- (void)queryStateOntoQueue:(id)a3 withTimeout:(double)a4 andHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CMPocketStateManager

- (CMPocketStateManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CMPocketStateManager;
  v2 = [(CMPocketStateManager *)&v8 init];
  if (v2)
  {
    v2->fQueryBlocks = (NSMutableArray *)objc_opt_new();
    v2->fQueryTimer = 0;
    v2->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMPocketStatePrivateQueue", 0);
    v2->fCachedState = 0;
    objc_initWeak(&location, v2);
    fPrivateQueue = v2->fPrivateQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_190572C6C;
    v5[3] = &unk_1E568E510;
    objc_copyWeak(&v6, &location);
    dispatch_async(fPrivateQueue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_prepareDispatcher
{
  if (qword_1E929E558 != -1) {
    dispatch_once(&qword_1E929E558, &unk_1EDFD25A0);
  }
  if (!self->fDispatcher.__ptr_.__value_)
  {
    *(void *)&self->fMaxMonitorTime = qword_1E929E3E0;
    operator new();
  }
}

- (void)dealloc
{
  if (objc_msgSend_isPocketStateAvailable(CMPocketStateManager, a2, v2))
  {
    id v6 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v4, v5);
    objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, @"CMSetPocketStateNotification", 0);
    if (self->fDispatcher.__ptr_.__value_)
    {
      uint64_t v8 = sub_1904E0110();
      sub_1902CDE08(v8, 0, (uint64_t)self->fDispatcher.__ptr_.__value_);
    }
  }
  fQueryBlocks = self->fQueryBlocks;
  if (fQueryBlocks) {

  }
  fQueryTimer = self->fQueryTimer;
  if (fQueryTimer)
  {
    dispatch_source_cancel(fQueryTimer);
    dispatch_release((dispatch_object_t)self->fQueryTimer);
    self->fQueryTimer = 0;
  }
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  v11.receiver = self;
  v11.super_class = (Class)CMPocketStateManager;
  [(CMPocketStateManager *)&v11 dealloc];
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMPocketStateDelegate *)a3;
  MEMORY[0x1F4181798](self, sel_onPocketStateUpdated_, self->fCachedState);
}

+ (BOOL)isPocketStateAvailable
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BF5E8 != -1) {
    dispatch_once(&qword_1EB3BF5E8, &unk_1EDFD33A0);
  }
  if (byte_1EB3BF5E0)
  {
    if (qword_1E929D778 != -1) {
      dispatch_once(&qword_1E929D778, &unk_1EDFC3668);
    }
    v3 = qword_1E929D770;
    if (os_log_type_enabled((os_log_t)qword_1E929D770, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Pocket state disabled by defaults write", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D778 != -1) {
        dispatch_once(&qword_1E929D778, &unk_1EDFC3668);
      }
      uint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "+[CMPocketStateManager isPocketStateAvailable]", "CoreLocation: %s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    return 0;
  }
  else
  {
    return objc_msgSend_isPocketStateSupported(CMPocketStateManager, a2, v2);
  }
}

+ (BOOL)isPocketStateSupported
{
  sub_1902BAD40();
  if (sub_19046BC40()) {
    return 1;
  }
  sub_1902BAD40();

  return sub_19046BCE8();
}

- (void)_disableDispatcher
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D778 != -1) {
    dispatch_once(&qword_1E929D778, &unk_1EDFC3668);
  }
  v3 = qword_1E929D770;
  if (os_log_type_enabled((os_log_t)qword_1E929D770, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "disabling dispatcher", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D778 != -1) {
      dispatch_once(&qword_1E929D778, &unk_1EDFC3668);
    }
    __int16 v7 = 0;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMPocketStateManager _disableDispatcher]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190573448;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fPrivateQueue, block);
}

- (int64_t)translateInternalState:(int)a3
{
  if ((a3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_19060C5C8[a3 - 1];
  }
}

- (int)translateExternalState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 3;
  }
  else {
    return dword_19060C5E8[a3 - 1];
  }
}

- (id)externalStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E568FC68[a3];
  }
}

- (void)addToAggdScalarWithName:(id)a3 andScalar:(unint64_t)a4
{
  if (MEMORY[0x1E4F49EC0])
  {
    fPrivateQueue = self->fPrivateQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_190573588;
    v5[3] = &unk_1E568DB10;
    void v5[4] = a3;
    v5[5] = a4;
    dispatch_async(fPrivateQueue, v5);
  }
}

- (void)queryStateOntoQueue:(id)a3 withTimeout:(double)a4 andHandler:(id)a5
{
}

- (void)queryStateOntoQueue:(id)a3 andMonitorFor:(double)a4 withTimeout:(double)a5 andHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_isPocketStateAvailable(CMPocketStateManager, a2, (uint64_t)a3) & 1) != 0
    || (objc_msgSend_isPocketStateSupported(CMPocketStateManager, v11, v12) & 1) != 0)
  {
    if (qword_1E929D778 != -1) {
      dispatch_once(&qword_1E929D778, &unk_1EDFC3668);
    }
    v13 = qword_1E929D770;
    if (os_log_type_enabled((os_log_t)qword_1E929D770, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = mach_absolute_time();
      *(_DWORD *)buf = 134217984;
      double v25 = sub_1902D8D34(v14);
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEFAULT, "QueryRequest,%f", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D778 != -1) {
        dispatch_once(&qword_1E929D778, &unk_1EDFC3668);
      }
      uint64_t v18 = mach_absolute_time();
      int v22 = 134217984;
      double v23 = sub_1902D8D34(v18);
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMPocketStateManager queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CoreMotion.PocketState.queryStart", 0, 0, 4u);
    fPrivateQueue = self->fPrivateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_190573B5C;
    block[3] = &unk_1E568E008;
    block[4] = self;
    void block[5] = a3;
    block[6] = a6;
    *(double *)&block[7] = a5;
    *(double *)&block[8] = a4;
    dispatch_sync(fPrivateQueue, block);
  }
  else
  {
    if (qword_1E929D778 != -1) {
      dispatch_once(&qword_1E929D778, &unk_1EDFC3668);
    }
    v17 = qword_1E929D770;
    if (os_log_type_enabled((os_log_t)qword_1E929D770, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_FAULT, "Pocket state query is called on an unsupported platform", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D778 != -1) {
        dispatch_once(&qword_1E929D778, &unk_1EDFC3668);
      }
      LOWORD(v22) = 0;
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMPocketStateManager queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
  }
}

- (void)onNotification:(id)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190574914;
  v6[3] = &unk_1E568D190;
  v6[4] = a3;
  v6[5] = self;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (void)onPocketStateUpdated:(int)a3
{
  fPrivateQueue = self->fPrivateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190574BB4;
  v4[3] = &unk_1E568FC48;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(fPrivateQueue, v4);
}

- (CMPocketStateDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  value = self->fDispatcher.__ptr_.__value_;
  self->fDispatcher.__ptr_.__value_ = 0;
  if (value) {
    (*((void (**)(void))value->var0 + 1))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end