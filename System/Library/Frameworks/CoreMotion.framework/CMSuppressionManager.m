@interface CMSuppressionManager
+ (BOOL)isAvailable;
+ (BOOL)isSourceAvailable:(unint64_t)a3;
- (BOOL)isCameraCapturePose;
- (CMSuppressionEventStruct)currentSuppressionEvent;
- (CMSuppressionManager)init;
- (CMSuppressionManager)initWithClientType:(int64_t)a3;
- (id)initPrivateWithClientType:(int64_t)a3;
- (id)staticPoseBlocking;
- (id)viewObstructedBlocking;
- (int64_t)cameraCapturePoseUIHint;
- (int64_t)suppressionClientType;
- (void)connect;
- (void)dealloc;
- (void)deallocPrivate;
- (void)didDetectSignificantUserInteraction;
- (void)feedDevicePresenceEvent:(int64_t)a3 timestamp:(double)a4 force:(BOOL)a5;
- (void)feedSmartPowerNapEvent:(int64_t)a3 timestamp:(double)a4 force:(BOOL)a5;
- (void)feedViewObstructedEvent:(int64_t)a3 facedown:(unint64_t)a4 timeSinceLastFacedownStatic:(double)a5 timestamp:(double)a6 force:(BOOL)a7;
- (void)handleSmartPowerNapState:(unsigned __int8)a3;
- (void)managerDidDetectEvent:(unint64_t)a3;
- (void)managerDidFindError:(unint64_t)a3;
- (void)onCameraCapturePoseData:(const CameraCapturePose *)a3;
- (void)onEclipseData:(const Suppress *)a3;
- (void)onNotification:(id)a3;
- (void)onViewObstructedStateData:(const ViewObstructedState *)a3;
- (void)sendServiceRequestPrivate;
- (void)sendSuppressionEventToClientPrivate;
- (void)sendViewObstructedRequestPrivate;
- (void)sendViewObstructedStateToClientPrivate:(float)a3;
- (void)simulateSignificantUserInteraction;
- (void)startCameraCapturePoseUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startCameraCapturePoseUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)startService;
- (void)startSuppressionUpdatesPrivateToQueue:(id)a3 withOptions:(unint64_t)a4 withHandler:(id)a5;
- (void)startSuppressionUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)startSuppressionUpdatesToQueue:(id)a3 withOptions:(unint64_t)a4 withHandler:(id)a5;
- (void)startViewObstructedStateUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startViewObstructedStateUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)stopCameraCapturePoseUpdates;
- (void)stopCameraCapturePoseUpdatesPrivate;
- (void)stopService;
- (void)stopSuppressionUpdates;
- (void)stopSuppressionUpdatesPrivate;
- (void)stopViewObstructedStateUpdates;
- (void)stopViewObstructedStateUpdatesPrivate;
- (void)updateCurrentSuppressionEvent:(int64_t)a3 timestamp:(double)a4 reason:(unint64_t)a5 facedownState:(unint64_t)a6 timeSinceLastFacedownStatic:(double)a7;
- (void)updateSuppressionStateAndSendToClient;
@end

@implementation CMSuppressionManager

+ (BOOL)isAvailable
{
  if (qword_1E929E528 != -1) {
    dispatch_once(&qword_1E929E528, &unk_1EDFC1BA0);
  }
  unint64_t v2 = ((unint64_t)sub_1902CD6B0() >> 8) & 1;
  if (byte_1E929E520) {
    return 1;
  }
  else {
    return v2;
  }
}

+ (BOOL)isSourceAvailable:(unint64_t)a3
{
  BOOL result = objc_msgSend_isAvailable(CMSuppressionManager, a2, a3);
  if (a3 >= 0x20) {
    return 0;
  }
  return result;
}

- (CMSuppressionManager)init
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_1902DD1C4;
  v11 = sub_1902DD0F8;
  uint64_t v12 = 0;
  uint64_t v3 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905B7268;
  v6[3] = &unk_1E568DDB0;
  v6[4] = self;
  v6[5] = &v7;
  sub_1902CDE98(v3, (uint64_t)v6);
  v4 = (CMSuppressionManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (CMSuppressionManager)initWithClientType:(int64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = sub_1902DD1C4;
  v13 = sub_1902DD0F8;
  uint64_t v14 = 0;
  uint64_t v5 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905B7398;
  v8[3] = &unk_1E56901D8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  sub_1902CDE98(v5, (uint64_t)v8);
  v6 = (CMSuppressionManager *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)initPrivateWithClientType:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMSuppressionManager;
  v4 = [(CMSuppressionManager *)&v6 init];
  if (v4)
  {
    v4->_internal = objc_alloc_init(CMSuppressionManagerInternal);
    v4->_isCameraCapturePose = 1;
    v4->_cameraCapturePoseUIHint = 0;
    v4->_suppressionClientType = a3;
  }
  return v4;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_1902DD1C4;
  v6[4] = sub_1902DD0F8;
  v6[5] = self;
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1905B7534;
  v5[3] = &unk_1E568DDD8;
  v5[4] = v6;
  sub_1902CDE98(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMSuppressionManager;
  [(CMSuppressionManager *)&v4 dealloc];
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
  objc_msgSend_stopSuppressionUpdatesPrivate(self, a2, v2);
  objc_msgSend_stopViewObstructedStateUpdatesPrivate(self, v4, v5);
  objc_msgSend_stopCameraCapturePoseUpdatesPrivate(self, v6, v7);
  objc_msgSend_teardownPrivate(self->_internal, v8, v9);
  id internal = self->_internal;
}

- (void)connect
{
  id internal = self->_internal;
  if (!internal[27])
  {
    internal[28] = dispatch_queue_create("com.apple.CoreMotion.CMSuppressionManager", 0);
    operator new();
  }
}

- (void)sendServiceRequestPrivate
{
  v21[3] = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  objc_msgSend_connect(self, v3, v4);
  id internal = self->_internal;
  uint64_t v6 = *((unsigned __int8 *)internal + 232);
  BOOL v7 = (internal[42] & 0x18) != 0;
  v20[0] = @"CMEclipseServiceEnable";
  v21[0] = objc_msgSend_numberWithBool_(NSNumber, v8, v6);
  v20[1] = @"CMSuppressionManagerClientType";
  uint64_t v9 = NSNumber;
  uint64_t v12 = objc_msgSend_suppressionClientType(self, v10, v11);
  v21[1] = objc_msgSend_numberWithInteger_(v9, v13, v12);
  v20[2] = @"CMSuppressionManagerAlwaysOnViewObstructedRequested";
  v21[2] = objc_msgSend_numberWithBool_(NSNumber, v14, v7);
  uint64_t v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v21, v20, 3);
  sub_19044F990("kCLConnectionMessageEclipseServiceRequest", &v19, &v17);
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

- (void)sendViewObstructedRequestPrivate
{
  v22[1] = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  objc_msgSend_connect(self, v3, v4);
  uint64_t v5 = *((unsigned __int8 *)self->_internal + 233);
  v21 = @"CMViewObstructedStateEnable";
  v22[0] = objc_msgSend_numberWithBool_(NSNumber, v6, v5);
  uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v22, &v21, 1);
  sub_1904BE50C("kCLConnectionMessageEclipseViewObstructedStateRequest", &v20, &v18);
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v13 = objc_msgSend_setWithObjects_(v8, v11, v9, v10, 0);
  uint64_t v16 = v18;
  uint64_t v17 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1905B8200;
  v14[3] = &unk_1E56901F8;
  char v15 = v5;
  objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v12, (uint64_t)&v16, v13, v14);
  if (v17) {
    sub_1902D8B58(v17);
  }
  if (v19) {
    sub_1902D8B58(v19);
  }
}

- (void)startService
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905B8744;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)stopService
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905B8AE0;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)startSuppressionUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905B8E98;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_1902CE9BC(v7, (uint64_t)v8);
}

- (void)startSuppressionUpdatesToQueue:(id)a3 withOptions:(unint64_t)a4 withHandler:(id)a5
{
  uint64_t v9 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1905B8F40;
  v10[3] = &unk_1E568DE28;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a5;
  v10[7] = a4;
  sub_1902CE9BC(v9, (uint64_t)v10);
}

- (void)stopSuppressionUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905B9248;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CE9BC(v3, (uint64_t)v4);
}

- (void)didDetectSignificantUserInteraction
{
  if (qword_1E929E9B0 != -1) {
    dispatch_once(&qword_1E929E9B0, &unk_1EDFD20A0);
  }
  if (qword_1E929E9B8)
  {
    uint64_t v3 = sub_1902D6BD0();
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = sub_1905B9300;
    v4[3] = &unk_1E568D118;
    v4[4] = self;
    sub_1902CE9BC(v3, (uint64_t)v4);
  }
}

- (void)startCameraCapturePoseUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v7 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "Starting CameraCapturePose updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    __int16 v11 = 0;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager startCameraCapturePoseUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  uint64_t v8 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1905B971C;
  v10[3] = &unk_1E568D398;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  sub_1902CE9BC(v8, (uint64_t)v10);
}

- (void)stopCameraCapturePoseUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v3 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Stopping CameraCapturePose updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    __int16 v7 = 0;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager stopCameraCapturePoseUpdates]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v4 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905B9914;
  v6[3] = &unk_1E568D118;
  v6[4] = self;
  sub_1902CE9BC(v4, (uint64_t)v6);
}

- (void)simulateSignificantUserInteraction
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v2 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v2, OS_LOG_TYPE_DEFAULT, "Simulated significant user interaction detected", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager simulateSignificantUserInteraction]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  if (qword_1E929E9B0 != -1) {
    dispatch_once(&qword_1E929E9B0, &unk_1EDFD20A0);
  }
  if (qword_1E929E9B8)
  {
    uint64_t v3 = sub_1902D6BD0();
    sub_1902CE9BC(v3, (uint64_t)&unk_1EDFC3918);
  }
}

- (id)viewObstructedBlocking
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isAvailable(CMSuppressionManager, a2, v2))
  {
    *(void *)buf = 0;
    __int16 v11 = buf;
    uint64_t v12 = 0x3052000000;
    uint64_t v13 = sub_1902DD1C4;
    uint64_t v14 = sub_1902DD0F8;
    uint64_t v15 = 0;
    uint64_t v3 = sub_1902D6BD0();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1905B9DB0;
    v8[3] = &unk_1E568DDD8;
    v8[4] = buf;
    sub_1902CDE98(v3, (uint64_t)v8);
    id v4 = *((id *)v11 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v5 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_ERROR, "Suppression is not supported on this hardware.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D708 != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      __int16 v9 = 0;
      __int16 v7 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSuppressionManager viewObstructedBlocking]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    return 0;
  }
  return v4;
}

- (id)staticPoseBlocking
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isAvailable(CMSuppressionManager, a2, v2))
  {
    *(void *)buf = 0;
    __int16 v11 = buf;
    uint64_t v12 = 0x3052000000;
    uint64_t v13 = sub_1902DD1C4;
    uint64_t v14 = sub_1902DD0F8;
    uint64_t v15 = 0;
    uint64_t v3 = sub_1902D6BD0();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1905BA0D0;
    v8[3] = &unk_1E568DDD8;
    v8[4] = buf;
    sub_1902CDE98(v3, (uint64_t)v8);
    id v4 = *((id *)v11 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v5 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_ERROR, "Suppression is not supported on this hardware.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D708 != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      __int16 v9 = 0;
      __int16 v7 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSuppressionManager staticPoseBlocking]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    return 0;
  }
  return v4;
}

- (void)sendSuppressionEventToClientPrivate
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  if (*((void *)internal + 7))
  {
    uint64_t v4 = MEMORY[0x192FCD2F0]();
    if ((unint64_t)(*((void *)internal + 2) - 1) > 1
      || !*((void *)internal + 3)
      || (double v5 = *((double *)internal + 1), v5 == 0.0))
    {
      __assert_rtn("-[CMSuppressionManager sendSuppressionEventToClientPrivate]", "CMSuppressionManager.mm", 550, "internal->fCurrentSuppressionEvent.isInitialized()");
    }
    uint64_t v6 = (void *)v4;
    uint64_t v7 = *((void *)internal + 42);
    if ((v7 & 0xF) != 0) {
      uint64_t v8 = *((void *)internal + 2);
    }
    else {
      uint64_t v8 = 0;
    }
    if ((v7 & 0xF) != 0) {
      uint64_t v9 = *((void *)internal + 3);
    }
    else {
      uint64_t v9 = 0;
    }
    if ((v7 & 0x10) != 0)
    {
      uint64_t v10 = *((void *)internal + 4);
      double v11 = *((double *)internal + 5);
    }
    else
    {
      uint64_t v10 = 0;
      double v11 = 10000.0;
    }
    uint64_t v12 = [CMSuppressionEvent alloc];
    FacedownStatic = objc_msgSend_initWithEventType_reason_facedownState_timestamp_timeSinceLastFacedownStatic_(v12, v13, v8, v9, v10, v5, v11);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v15 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_msgSend_suppressionClientType(self, v16, v17);
      uint64_t v19 = *((void *)internal + 43);
      uint64_t v20 = mach_absolute_time();
      *(_DWORD *)buf = 134349826;
      uint64_t v40 = v18;
      __int16 v41 = 2114;
      uint64_t v42 = v19;
      __int16 v43 = 2114;
      v44 = FacedownStatic;
      __int16 v45 = 2050;
      double v46 = sub_1902D8D34(v20);
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}ld][%{public}@] Sending to client: %{public}@,now,%{public}f", buf, 0x2Au);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D708 != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      uint64_t v26 = objc_msgSend_suppressionClientType(self, v24, v25);
      uint64_t v27 = *((void *)internal + 43);
      uint64_t v28 = mach_absolute_time();
      int v31 = 134349826;
      uint64_t v32 = v26;
      __int16 v33 = 2114;
      uint64_t v34 = v27;
      __int16 v35 = 2114;
      v36 = FacedownStatic;
      __int16 v37 = 2050;
      double v38 = sub_1902D8D34(v28);
      v29 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager sendSuppressionEventToClientPrivate]", "CoreLocation: %s\n", v29);
      if (v29 != (char *)buf) {
        free(v29);
      }
    }
    uint64_t v23 = *((void *)internal + 6);
    v22 = (void *)*((void *)internal + 7);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1905BA4D0;
    v30[3] = &unk_1E568D320;
    v30[4] = FacedownStatic;
    v30[5] = v23;
    objc_msgSend_addOperationWithBlock_(v22, v21, (uint64_t)v30);
  }
}

- (void)onEclipseData:(const Suppress *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    double v5 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_msgSend_suppressionClientType(self, v6, v7);
      int fLux_low = LOBYTE(a3->fLux);
      uint64_t v10 = *(void *)&a3->fType;
      *(_DWORD *)buf = 134349568;
      uint64_t v19 = v8;
      __int16 v20 = 1026;
      int v21 = fLux_low;
      __int16 v22 = 2050;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_INFO, "[%{public}ld] Incoming view obstructed event, shouldSuppress,%{public}u, timestampSecs,%{public}f", buf, 0x1Cu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D708 != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      objc_msgSend_suppressionClientType(self, v14, v15);
      uint64_t v16 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager onEclipseData:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    if (LOBYTE(a3->fLux)) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
    if (BYTE1(a3->fLux)) {
      objc_msgSend_feedViewObstructedEvent_facedown_timeSinceLastFacedownStatic_timestamp_force_(self, v11, v12, 1, 0, *(double *)&a3->fFacedownStatic, *(double *)&a3->fType);
    }
    else {
      objc_msgSend_feedViewObstructedEvent_facedown_timeSinceLastFacedownStatic_timestamp_force_(self, v11, v12, 2, 0, *(double *)&a3->fFacedownStatic, *(double *)&a3->fType);
    }
  }
  else
  {
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v13 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D708 != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      uint64_t v17 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSuppressionManager onEclipseData:]", "CoreLocation: %s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
}

- (void)onNotification:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"CMSuppressionEventTypeKey");
  uint64_t v10 = objc_msgSend_userInfo(a3, v8, v9);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"CMSuppressionEventReasonKey");
  if (v7) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v16 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_FAULT, "Invalid notification payload!", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 == -1)
    {
LABEL_37:
      uint64_t v27 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSuppressionManager onNotification:]", "CoreLocation: %s\n", v27);
      if (v27 != (char *)buf) {
        free(v27);
      }
      return;
    }
LABEL_47:
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    goto LABEL_37;
  }
  uint64_t v17 = (void *)v12;
  int v20 = objc_msgSend_intValue(v7, v13, v14);
  uint64_t v21 = objc_msgSend_unsignedIntValue(v17, v18, v19);
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  __int16 v22 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v23, v20);
    __int16 v42 = 2114;
    uint64_t v43 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v24, v21);
    _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_INFO, "Incoming suppression notification: %{public}@ (%{public}@)", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    objc_msgSend_stringForEventType_(CMSuppressionEvent, v37, v20);
    objc_msgSend_stringForEventReason_(CMSuppressionEvent, v38, v21);
    v39 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager onNotification:]", "CoreLocation: %s\n", v39);
    if (v39 != (char *)buf) {
      free(v39);
    }
  }
  if ((v20 - 1) >= 2)
  {
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v25 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v41 = v20;
      _os_log_impl(&dword_1902AF000, v25, OS_LOG_TYPE_FAULT, "Notification event type %{public}lu is invalid!", buf, 0xCu);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 == -1) {
      goto LABEL_37;
    }
    goto LABEL_47;
  }
  if ((v21 & 7) != 0)
  {
    if (v21)
    {
      uint64_t v28 = mach_absolute_time();
      double v29 = sub_1902D8D34(v28);
      objc_msgSend_feedViewObstructedEvent_facedown_timeSinceLastFacedownStatic_timestamp_force_(self, v30, v20, 2, 0, 0.0, v29);
      if ((v21 & 2) == 0)
      {
LABEL_22:
        if ((v21 & 4) == 0) {
          return;
        }
LABEL_41:
        uint64_t v34 = mach_absolute_time();
        double v35 = sub_1902D8D34(v34);
        objc_msgSend_feedDevicePresenceEvent_timestamp_force_(self, v36, v20, 0, v35);
        return;
      }
    }
    else if ((v21 & 2) == 0)
    {
      goto LABEL_22;
    }
    uint64_t v31 = mach_absolute_time();
    double v32 = sub_1902D8D34(v31);
    objc_msgSend_feedSmartPowerNapEvent_timestamp_force_(self, v33, v20, 0, v32);
    if ((v21 & 4) == 0) {
      return;
    }
    goto LABEL_41;
  }
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v26 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v41 = v21;
    _os_log_impl(&dword_1902AF000, v26, OS_LOG_TYPE_FAULT, "Notification event reason %{public}lu is invalid!", buf, 0xCu);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 == -1) {
      goto LABEL_37;
    }
    goto LABEL_47;
  }
}

- (void)updateCurrentSuppressionEvent:(int64_t)a3 timestamp:(double)a4 reason:(unint64_t)a5 facedownState:(unint64_t)a6 timeSinceLastFacedownStatic:(double)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = (double *)self->_internal;
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v14 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_msgSend_suppressionClientType(self, v15, v16);
    uint64_t v18 = *((void *)internal + 43);
    *(_DWORD *)buf = 134350082;
    uint64_t v27 = v17;
    __int16 v28 = 2114;
    uint64_t v29 = v18;
    __int16 v30 = 2114;
    uint64_t v31 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v19, a3);
    __int16 v32 = 2114;
    uint64_t v33 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v20, a5);
    __int16 v34 = 2050;
    double v35 = a4;
    _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}ld][%{public}@] ==== Updating current suppression event: %{public}@ (%{public}@) @ %{public}f", buf, 0x34u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    objc_msgSend_suppressionClientType(self, v21, v22);
    objc_msgSend_stringForEventType_(CMSuppressionEvent, v23, a3);
    objc_msgSend_stringForEventReason_(CMSuppressionEvent, v24, a5);
    uint64_t v25 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager updateCurrentSuppressionEvent:timestamp:reason:facedownState:timeSinceLastFacedownStatic:]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf) {
      free(v25);
    }
  }
  internal[1] = a4;
  *((void *)internal + 2) = a3;
  *((void *)internal + 3) = a5;
  *((void *)internal + 4) = a6;
  internal[5] = a7;
}

- (CMSuppressionEventStruct)currentSuppressionEvent
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x5812000000;
  uint64_t v13 = sub_1905BB254;
  uint64_t v14 = nullsub_180;
  BOOL v15 = &unk_190687D59;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v18 = 0;
  uint64_t v5 = sub_1902D6BD0();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1905BB26C;
  v9[3] = &unk_1E568E110;
  v9[4] = self;
  v9[5] = &v10;
  sub_1902CDE98(v5, (uint64_t)v9);
  uint64_t v6 = v11;
  long long v7 = *((_OWORD *)v11 + 4);
  *(_OWORD *)&retstr->timestamp = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->reason = v7;
  *(void *)&retstr->timeSinceLastFacedownStatic = v6[10];
  _Block_object_dispose(&v10, 8);
  return result;
}

- (void)feedViewObstructedEvent:(int64_t)a3 facedown:(unint64_t)a4 timeSinceLastFacedownStatic:(double)a5 timestamp:(double)a6 force:(BOOL)a7
{
  uint64_t v13 = sub_1902D6BD0();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1905BB340;
  v14[3] = &unk_1E5690220;
  BOOL v15 = a7;
  void v14[4] = self;
  v14[5] = a3;
  *(double *)&v14[6] = a6;
  v14[7] = a4;
  *(double *)&v14[8] = a5;
  sub_1902CE9BC(v13, (uint64_t)v14);
}

- (void)feedSmartPowerNapEvent:(int64_t)a3 timestamp:(double)a4 force:(BOOL)a5
{
  uint64_t v9 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1905BB99C;
  v10[3] = &unk_1E5690248;
  BOOL v11 = a5;
  v10[4] = self;
  v10[5] = a3;
  *(double *)&v10[6] = a4;
  sub_1902CE9BC(v9, (uint64_t)v10);
}

- (void)feedDevicePresenceEvent:(int64_t)a3 timestamp:(double)a4 force:(BOOL)a5
{
  uint64_t v9 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1905BC1C4;
  v10[3] = &unk_1E5690248;
  BOOL v11 = a5;
  v10[4] = self;
  v10[5] = a3;
  *(double *)&v10[6] = a4;
  sub_1902CE9BC(v9, (uint64_t)v10);
}

- (void)updateSuppressionStateAndSendToClient
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  uint64_t v5 = *((void *)internal + 2);
  uint64_t v4 = *((void *)internal + 3);
  double v6 = *((double *)internal + 1);
  long long v7 = &OBJC_IVAR___CMHeadphoneActivityManagerInternal_fLogger;
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v8 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = objc_msgSend_suppressionClientType(self, v9, v10);
    uint64_t v12 = *((void *)internal + 43);
    *(_DWORD *)buf = 134350082;
    uint64_t v67 = v11;
    __int16 v68 = 2114;
    uint64_t v69 = v12;
    __int16 v70 = 2114;
    uint64_t v71 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v13, v5);
    __int16 v72 = 2114;
    uint64_t v73 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v14, v4);
    __int16 v74 = 2050;
    double v75 = v6;
    _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_INFO, "[%{public}ld][%{public}@] Previous: %{public}@ (%{public}@) @ %{public}f", buf, 0x34u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    objc_msgSend_suppressionClientType(self, v54, v55);
    objc_msgSend_stringForEventType_(CMSuppressionEvent, v56, v5);
    objc_msgSend_stringForEventReason_(CMSuppressionEvent, v57, v4);
    v58 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager updateSuppressionStateAndSendToClient]", "CoreLocation: %s\n", v58);
    if (v58 != (char *)buf) {
      free(v58);
    }
  }
  uint64_t v15 = *((void *)internal + 10);
  if (v15 != 1)
  {
    unint64_t v16 = v4 & 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_10;
  }
  unint64_t v16 = v4 | 1;
  double v17 = *((double *)internal + 9);
  if (v17 <= 0.0) {
LABEL_10:
  }
    double v17 = 0.0;
  uint64_t v18 = *((void *)internal + 16);
  if (v18 != 1)
  {
    unint64_t v19 = v16 & 0xFFFFFFFFFFFFFFFDLL;
    goto LABEL_15;
  }
  unint64_t v19 = v16 | 2;
  double v20 = *((double *)internal + 15);
  if (v20 <= v17) {
LABEL_15:
  }
    double v20 = v17;
  uint64_t v21 = *((void *)internal + 12);
  double v22 = *((double *)internal + 13);
  uint64_t v23 = *((void *)internal + 21);
  if (v23 == 1)
  {
    uint64_t v24 = v19 | 4;
    if (*((double *)internal + 20) > v20) {
      double v20 = *((double *)internal + 20);
    }
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v24 = v19 & 0xFFFFFFFFFFFFFFFBLL;
    uint64_t v25 = 1;
    if (v15 != 1 && v18 != 1)
    {
      if (v15 == 2 && *((double *)internal + 9) > v20)
      {
        uint64_t v24 = 1;
        double v20 = *((double *)internal + 9);
      }
      if (v18 == 2 && *((double *)internal + 15) > v20)
      {
        uint64_t v24 = 2;
        double v20 = *((double *)internal + 15);
      }
      if (v23 == 2 && *((double *)internal + 20) > v20)
      {
        uint64_t v24 = 4;
        double v20 = *((double *)internal + 20);
      }
      if (v20 == 0.0) {
        __assert_rtn("-[CMSuppressionManager updateSuppressionStateAndSendToClient]", "CMSuppressionManager.mm", 845, "nextTimestamp != 0.");
      }
      uint64_t v25 = 2;
    }
  }
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v26 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_INFO))
  {
    uint64_t v64 = objc_msgSend_suppressionClientType(self, v27, v28);
    uint64_t v65 = *((void *)internal + 43);
    __int16 v30 = self;
    uint64_t v31 = v4;
    uint64_t v32 = v5;
    uint64_t v33 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v29, v25);
    uint64_t v35 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v34, v24);
    *(_DWORD *)buf = 134350082;
    uint64_t v67 = v64;
    __int16 v68 = 2114;
    uint64_t v69 = v65;
    long long v7 = &OBJC_IVAR___CMHeadphoneActivityManagerInternal_fLogger;
    __int16 v70 = 2114;
    uint64_t v71 = v33;
    uint64_t v5 = v32;
    uint64_t v4 = v31;
    self = v30;
    __int16 v72 = 2114;
    uint64_t v73 = v35;
    __int16 v74 = 2050;
    double v75 = v20;
    _os_log_impl(&dword_1902AF000, v26, OS_LOG_TYPE_INFO, "[%{public}ld][%{public}@] Next: %{public}@ (%{public}@) @ %{public}f", buf, 0x34u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    objc_msgSend_suppressionClientType(self, v59, v60);
    objc_msgSend_stringForEventType_(CMSuppressionEvent, v61, v25);
    objc_msgSend_stringForEventReason_(CMSuppressionEvent, v62, v24);
    v63 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager updateSuppressionStateAndSendToClient]", "CoreLocation: %s\n", v63);
    if (v63 != (char *)buf) {
      free(v63);
    }
    long long v7 = &OBJC_IVAR___CMHeadphoneActivityManagerInternal_fLogger;
  }
  if (v25 == v5 && v24 == v4)
  {
    if (*((void *)v7 + 225) != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    __int16 v37 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = objc_msgSend_suppressionClientType(self, v38, v39);
      uint64_t v41 = v7;
      uint64_t v42 = *((void *)internal + 43);
      uint64_t v44 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v43, v5);
      uint64_t v46 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v45, v4);
      *(_DWORD *)buf = 134350082;
      uint64_t v67 = v40;
      __int16 v68 = 2114;
      uint64_t v69 = v42;
      long long v7 = v41;
      __int16 v70 = 2114;
      uint64_t v71 = v44;
      __int16 v72 = 2114;
      uint64_t v73 = v46;
      __int16 v74 = 2050;
      double v75 = v6;
      _os_log_impl(&dword_1902AF000, v37, OS_LOG_TYPE_INFO, "[%{public}ld][%{public}@] No Transition: %{public}@ (%{public}@) @ %{public}f", buf, 0x34u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (*((void *)v7 + 225) != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      objc_msgSend_suppressionClientType(self, v47, v48);
      objc_msgSend_stringForEventType_(CMSuppressionEvent, v49, v5);
      objc_msgSend_stringForEventReason_(CMSuppressionEvent, v50, v4);
      v51 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager updateSuppressionStateAndSendToClient]", "CoreLocation: %s\n", v51);
      if (v51 != (char *)buf) {
        free(v51);
      }
    }
  }
  else
  {
    objc_msgSend_updateCurrentSuppressionEvent_timestamp_reason_facedownState_timeSinceLastFacedownStatic_(self, v36, v25, v24, v21, v20, v22);
    objc_msgSend_sendSuppressionEventToClientPrivate(self, v52, v53);
  }
}

- (void)startSuppressionUpdatesPrivateToQueue:(id)a3 withOptions:(unint64_t)a4 withHandler:(id)a5
{
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v9, v10))
  {
    id v12 = (id)*((void *)internal + 7);
    if (v12 != a3)
    {

      *((void *)internal + 7) = a3;
    }
    id v13 = (id)*((void *)internal + 6);
    if (v13 != a5)
    {

      *((void *)internal + 6) = objc_msgSend_copy(a5, v14, v15);
    }
    objc_msgSend_updateCurrentSuppressionEvent_timestamp_reason_facedownState_timeSinceLastFacedownStatic_(self, v11, 0, 0, 0, 0.0, 0.0);
    if ((*((unsigned char *)internal + 336) & 0x19) != 0 && !*((void *)internal + 14) && (sub_1902CD6B0() & 0x100) != 0) {
      operator new();
    }
    if (qword_1E929E9B0 != -1) {
      dispatch_once(&qword_1E929E9B0, &unk_1EDFD20A0);
    }
    if (qword_1E929E9B8 && !*((void *)internal + 41)) {
      operator new();
    }
    uint64_t v18 = *((void *)internal + 42);
    if ((v18 & 2) != 0 && !*((void *)internal + 25))
    {
      *((void *)internal + 25) = objc_alloc_init((Class)off_1EB3BE8A0[0]());
      unint64_t v19 = *((void *)internal + 8);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = sub_1905BD4B8;
      v29[3] = &unk_1E568D190;
      v29[4] = internal;
      v29[5] = self;
      dispatch_async(v19, v29);
      uint64_t v18 = *((void *)internal + 42);
    }
    if ((v18 & 4) != 0 && !*((void *)internal + 26))
    {
      id v20 = objc_alloc((Class)off_1EB3BE8A8[0]());
      double v22 = objc_msgSend_initWithDelegate_(v20, v21, (uint64_t)self);
      *((void *)internal + 26) = v22;
      objc_msgSend_registerForWatchPresence(v22, v23, v24);
      objc_msgSend_getCurrentWatchPresenceStatus(*((void **)internal + 26), v25, v26);
    }
    uint64_t v27 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v16, v17);
    objc_msgSend_addObserver_selector_name_object_suspensionBehavior_(v27, v28, (uint64_t)self, sel_onNotification_, @"CMSuppressionEventSendNotification", 0, 4);
  }
}

- (void)stopSuppressionUpdatesPrivate
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = (char *)self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v4, v5))
  {
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    double v6 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_msgSend_suppressionClientType(self, v7, v8);
      uint64_t v10 = self;
      uint64_t v11 = *((void *)internal + 43);
      uint64_t v13 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v12, *((void *)internal + 10));
      uint64_t v14 = *((void *)internal + 9);
      uint64_t v16 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v15, *((void *)internal + 16));
      uint64_t v17 = *((void *)internal + 15);
      uint64_t v19 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v18, *((void *)internal + 21));
      uint64_t v20 = *((void *)internal + 20);
      *(_DWORD *)buf = 134350850;
      uint64_t v41 = v9;
      __int16 v42 = 2114;
      uint64_t v43 = v11;
      self = v10;
      __int16 v44 = 2114;
      uint64_t v45 = v13;
      __int16 v46 = 2050;
      uint64_t v47 = v14;
      __int16 v48 = 2114;
      uint64_t v49 = v16;
      __int16 v50 = 2050;
      uint64_t v51 = v17;
      __int16 v52 = 2114;
      uint64_t v53 = v19;
      __int16 v54 = 2050;
      uint64_t v55 = v20;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}ld][%{public}@] Stopping suppression updates. Final states: VO: %{public}@ @ %{public}f, SPN: %{public}@ @ %{public}f, DP: %{public}@ @ %{public}f", buf, 0x52u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D708 != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      objc_msgSend_suppressionClientType(self, v34, v35);
      objc_msgSend_stringForEventType_(CMSuppressionEvent, v36, *((void *)internal + 10));
      objc_msgSend_stringForEventType_(CMSuppressionEvent, v37, *((void *)internal + 16));
      objc_msgSend_stringForEventType_(CMSuppressionEvent, v38, *((void *)internal + 21));
      uint64_t v39 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager stopSuppressionUpdatesPrivate]", "CoreLocation: %s\n", v39);
      if (v39 != (char *)buf) {
        free(v39);
      }
    }
    uint64_t v23 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v21, v22);
    objc_msgSend_removeObserver_name_object_(v23, v24, (uint64_t)self, @"CMSuppressionEventSendNotification", 0);
    uint64_t v27 = *((void *)internal + 42);
    if ((v27 & 2) != 0)
    {
      uint64_t v28 = (void *)*((void *)internal + 25);
      if (v28)
      {
        objc_msgSend_unregister(v28, v25, v26);

        *((void *)internal + 25) = 0;
        uint64_t v27 = *((void *)internal + 42);
      }
    }
    if ((v27 & 4) != 0)
    {
      uint64_t v29 = (void *)*((void *)internal + 26);
      if (v29)
      {
        objc_msgSend_unregisterForWatchPresence(v29, v25, v26);

        *((void *)internal + 26) = 0;
        uint64_t v27 = *((void *)internal + 42);
      }
    }
    if ((v27 & 0x19) != 0 && *((void *)internal + 14))
    {
      if (qword_1E929E9B0 != -1) {
        dispatch_once(&qword_1E929E9B0, &unk_1EDFD20A0);
      }
      sub_1902CDE08(qword_1E929E9B8, 0, *((void *)internal + 14));
      uint64_t v30 = *((void *)internal + 14);
      if (v30) {
        (*(void (**)(uint64_t))(*(void *)v30 + 8))(v30);
      }
      *((void *)internal + 14) = 0;
    }
    if (*((void *)internal + 41))
    {
      if (qword_1E929E9B0 != -1) {
        dispatch_once(&qword_1E929E9B0, &unk_1EDFD20A0);
      }
      sub_1902CDE08(qword_1E929E9B8, 2, *((void *)internal + 41));
      uint64_t v31 = *((void *)internal + 41);
      if (v31) {
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
      }
      *((void *)internal + 41) = 0;
      self->_isCameraCapturePose = 1;
      self->_cameraCapturePoseUIHint = 0;
    }
    uint64_t v32 = (void *)*((void *)internal + 7);
    if (v32)
    {

      *((void *)internal + 7) = 0;
    }
    uint64_t v33 = (void *)*((void *)internal + 6);
    if (v33)
    {

      *((void *)internal + 6) = 0;
    }
    *((void *)internal + 5) = 0;
    *(_OWORD *)(internal + 24) = 0u;
    *(_OWORD *)(internal + 8) = 0u;
    *(_OWORD *)(internal + 72) = 0u;
    *(_OWORD *)(internal + 88) = 0u;
    *((void *)internal + 13) = 0;
    *(_OWORD *)(internal + 120) = 0u;
    *(_OWORD *)(internal + 136) = 0u;
    *(_OWORD *)(internal + 152) = 0u;
    *(_OWORD *)(internal + 168) = 0u;
    *(_OWORD *)(internal + 184) = 0u;
  }
}

- (void)onViewObstructedStateData:(const ViewObstructedState *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id internal = (char *)self->_internal;
    long long v5 = *(_OWORD *)&a3->fSuppress.fTimeSinceLastFacedownStatic;
    long long v6 = *(_OWORD *)&a3->fMeanProbabilities[3];
    long long v7 = *(_OWORD *)&a3->fSuppress.fOrientation;
    *((_DWORD *)internal + 74) = LODWORD(a3->fMeanProbabilities[7]);
    *(_OWORD *)(internal + 248) = v7;
    *(_OWORD *)(internal + 264) = v5;
    *(_OWORD *)(internal + 280) = v6;
    float v8 = *(double *)&a3->fType;
    uint64_t v9 = sub_1902D6BD0();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1905BDDEC;
    v12[3] = &unk_1E568FC48;
    v12[4] = self;
    float v13 = v8;
    sub_1902CE9BC(v9, (uint64_t)v12);
  }
  else
  {
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v10 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D708 != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      __int16 v14 = 0;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSuppressionManager onViewObstructedStateData:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)onCameraCapturePoseData:(const CameraCapturePose *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL var1 = a3->var1;
    uint64_t var2 = a3->var2;
    uint64_t v6 = sub_1902D6BD0();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1905BDFF0;
    v9[3] = &unk_1E568E898;
    BOOL v10 = var1;
    v9[4] = self;
    v9[5] = var2;
    sub_1902CE9BC(v6, (uint64_t)v9);
  }
  else
  {
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    long long v7 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D708 != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      __int16 v11 = 0;
      float v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSuppressionManager onCameraCapturePoseData:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)startViewObstructedStateUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  long long v7 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "Starting view obstructed state updates.", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    __int16 v11 = 0;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager startViewObstructedStateUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  uint64_t v8 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1905BE2B0;
  v10[3] = &unk_1E568D398;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  sub_1902CE9BC(v8, (uint64_t)v10);
}

- (void)stopViewObstructedStateUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v3 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Stopping view obstructed state updates.", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    __int16 v7 = 0;
    long long v5 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager stopViewObstructedStateUpdates]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v4 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905BE4E8;
  v6[3] = &unk_1E568D118;
  v6[4] = self;
  sub_1902CE9BC(v4, (uint64_t)v6);
}

- (void)sendViewObstructedStateToClientPrivate:(float)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = (char *)self->_internal;
  if (*((void *)internal + 7))
  {
    __int16 v7 = (void *)MEMORY[0x192FCD2F0]();
    unint64_t v8 = internal[253];
    if (v8 > 6) {
      uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Unexpected");
    }
    else {
      uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)off_1E56902B8[v8]);
    }
    uint64_t v10 = v9;
    __int16 v11 = NSString;
    sub_1904F1708(internal[254], __p);
    if (v67 >= 0) {
      uint64_t v13 = objc_msgSend_stringWithUTF8String_(v11, v12, (uint64_t)__p);
    }
    else {
      uint64_t v13 = objc_msgSend_stringWithUTF8String_(v11, v12, *(uint64_t *)__p);
    }
    uint64_t v14 = v13;
    if (SHIBYTE(v67) < 0) {
      operator delete(*(void **)__p);
    }
    id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v19 = objc_msgSend_initWithCapacity_(v15, v16, 8);
    for (uint64_t i = 0; i != 32; i += 4)
    {
      LODWORD(v20) = *(_DWORD *)&internal[i + 268];
      uint64_t v22 = objc_msgSend_numberWithFloat_(NSNumber, v17, v18, v20);
      objc_msgSend_addObject_(v19, v23, v22);
    }
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v24 = off_1E929D6F8;
    if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_INFO))
    {
      int v25 = internal[250];
      int v26 = internal[252];
      int v27 = internal[253];
      int v28 = internal[254];
      double v29 = *(float *)(internal + 255);
      double v30 = *(float *)(internal + 259);
      *(_DWORD *)__p = 134350850;
      *(double *)&__p[4] = a3;
      __int16 v64 = 1026;
      int v65 = v25;
      __int16 v66 = 1026;
      int v67 = v26;
      __int16 v68 = 1026;
      int v69 = v27;
      __int16 v70 = 1026;
      int v71 = v28;
      __int16 v72 = 2050;
      double v73 = v29;
      __int16 v74 = 2050;
      double v75 = v30;
      __int16 v76 = 2114;
      v77 = v19;
      _os_log_impl(&dword_1902AF000, v24, OS_LOG_TYPE_INFO, "Incoming view obstructed state event, timestampSecs,%{public}f,shouldSuppress,%{public}u,currentState,%{public}u,orientation,%{public}u,motionType,%{public}u,lux,%{public}f,pocketProbability,%{public}f,meanProbabilities,%{public}@", __p, 0x42u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D708 != -1) {
        dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
      }
      int v39 = internal[250];
      int v40 = internal[252];
      int v41 = internal[253];
      int v42 = internal[254];
      double v43 = *(float *)(internal + 255);
      double v44 = *(float *)(internal + 259);
      int v47 = 134350850;
      double v48 = a3;
      __int16 v49 = 1026;
      int v50 = v39;
      __int16 v51 = 1026;
      int v52 = v40;
      __int16 v53 = 1026;
      int v54 = v41;
      __int16 v55 = 1026;
      int v56 = v42;
      __int16 v57 = 2050;
      double v58 = v43;
      __int16 v59 = 2050;
      double v60 = v44;
      __int16 v61 = 2114;
      v62 = v19;
      uint64_t v45 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager sendViewObstructedStateToClientPrivate:]", "CoreLocation: %s\n", v45);
      if (v45 != __p) {
        free(v45);
      }
    }
    uint64_t v31 = [CMViewObstructedStateEvent alloc];
    LODWORD(v32) = *(_DWORD *)(internal + 255);
    LODWORD(v33) = *(_DWORD *)(internal + 259);
    ShouldSupress_currentState_orientation_motionType_lux_pocketProbability_meanProbabilitiesFloatArray = objc_msgSend_initWithShouldSupress_currentState_orientation_motionType_lux_pocketProbability_meanProbabilitiesFloatArray_(v31, v34, internal[250], internal[252], v10, v14, v19, v32, v33);
    uint64_t v36 = *((void *)internal + 30);
    __int16 v37 = (void *)*((void *)internal + 7);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = sub_1905BE96C;
    v46[3] = &unk_1E568D320;
    v46[4] = ShouldSupress_currentState_orientation_motionType_lux_pocketProbability_meanProbabilitiesFloatArray;
    v46[5] = v36;
    objc_msgSend_addOperationWithBlock_(v37, v38, (uint64_t)v46);
  }
}

- (void)startViewObstructedStateUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v8, v9))
  {
    id v10 = (id)internal[7];
    if (v10 != a3)
    {

      internal[7] = a3;
    }
    id v11 = (id)internal[30];
    if (v11 != a4)
    {

      internal[30] = objc_msgSend_copy(a4, v12, v13);
    }
    if (qword_1E929E9B0 != -1) {
      dispatch_once(&qword_1E929E9B0, &unk_1EDFD20A0);
    }
    if (qword_1E929E9B8) {
      operator new();
    }
  }
}

- (void)stopViewObstructedStateUpdatesPrivate
{
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = (char *)self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v4, v5))
  {
    if (*((void *)internal + 38))
    {
      if (qword_1E929E9B0 != -1) {
        dispatch_once(&qword_1E929E9B0, &unk_1EDFD20A0);
      }
      sub_1902CDE08(qword_1E929E9B8, 1, *((void *)internal + 38));
      uint64_t v6 = *((void *)internal + 38);
      if (v6) {
        (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
      }
      *((void *)internal + 38) = 0;
    }
    __int16 v7 = (void *)*((void *)internal + 7);
    if (v7)
    {

      *((void *)internal + 7) = 0;
    }
    unint64_t v8 = (void *)*((void *)internal + 30);
    if (v8)
    {

      *((void *)internal + 30) = 0;
    }
    *(_OWORD *)(internal + 248) = 0u;
    uint64_t v9 = internal + 248;
    *((_DWORD *)v9 + 12) = 0;
    *((_OWORD *)v9 + 1) = 0u;
    *((_OWORD *)v9 + 2) = 0u;
  }
}

- (void)startCameraCapturePoseUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v8, v9))
  {
    id v10 = (id)internal[39];
    if (v10 != a3)
    {

      internal[39] = a3;
    }
    id v11 = (id)internal[40];
    if (v11 != a4)
    {

      internal[40] = objc_msgSend_copy(a4, v12, v13);
    }
  }
}

- (void)stopCameraCapturePoseUpdatesPrivate
{
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v4, v5))
  {
    uint64_t v6 = (void *)internal[39];
    if (v6)
    {

      internal[39] = 0;
    }
    __int16 v7 = (void *)internal[40];
    if (v7)
    {

      internal[40] = 0;
    }
  }
}

- (void)handleSmartPowerNapState:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v5 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    uint64_t v16 = objc_msgSend_suppressionClientType(self, v6, v7);
    __int16 v17 = 1026;
    int v18 = v3;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_INFO, "[%{public}ld] Incoming smart power nap event, %{public}u", buf, 0x12u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    objc_msgSend_suppressionClientType(self, v12, v13);
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager handleSmartPowerNapState:]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  if (v3 == 1)
  {
    uint64_t v8 = 1;
  }
  else
  {
    if (v3) {
      return;
    }
    uint64_t v8 = 2;
  }
  uint64_t v9 = mach_absolute_time();
  double v10 = sub_1902D8D34(v9);
  objc_msgSend_feedSmartPowerNapEvent_timestamp_force_(self, v11, v8, 0, v10);
}

- (void)managerDidDetectEvent:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v5 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    uint64_t v16 = objc_msgSend_suppressionClientType(self, v6, v7);
    __int16 v17 = 2050;
    unint64_t v18 = a3;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_INFO, "[%{public}ld] Incoming device presence event, %{public}lu", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    objc_msgSend_suppressionClientType(self, v12, v13);
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSuppressionManager managerDidDetectEvent:]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  if (a3 == 1)
  {
    uint64_t v8 = 2;
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    uint64_t v8 = 1;
  }
  uint64_t v9 = mach_absolute_time();
  double v10 = sub_1902D8D34(v9);
  objc_msgSend_feedDevicePresenceEvent_timestamp_force_(self, v11, v8, 0, v10);
}

- (void)managerDidFindError:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D708 != -1) {
    dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
  }
  uint64_t v4 = off_1E929D6F8;
  if (os_log_type_enabled((os_log_t)off_1E929D6F8, OS_LOG_TYPE_ERROR))
  {
    if (a3 > 5) {
      uint64_t v5 = "Unexpected";
    }
    else {
      uint64_t v5 = off_1E56902F0[a3];
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v8 = v5;
    __int16 v9 = 2050;
    unint64_t v10 = a3;
    _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_ERROR, "Device presence error: %{public}s %{public}lu", buf, 0x16u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D708 != -1) {
      dispatch_once(&qword_1E929D708, &unk_1EDFD4440);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMSuppressionManager managerDidFindError:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (BOOL)isCameraCapturePose
{
  return self->_isCameraCapturePose;
}

- (int64_t)cameraCapturePoseUIHint
{
  return self->_cameraCapturePoseUIHint;
}

- (int64_t)suppressionClientType
{
  return self->_suppressionClientType;
}

@end