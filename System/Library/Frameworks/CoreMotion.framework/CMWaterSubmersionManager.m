@interface CMWaterSubmersionManager
+ (BOOL)isAuthorizedAndEntitled;
+ (BOOL)waterSubmersionAvailable;
+ (CMAuthorizationStatus)authorizationStatus;
- (CMWaterSubmersionManager)init;
- (NSMeasurement)maximumDepth;
- (id)delegate;
- (void)_connect;
- (void)_disconnect;
- (void)_handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)_setDelegate:(id)a3;
- (void)dealloc;
- (void)notifySubmersionStateProcessingCompleted;
- (void)setDelegate:(id)delegate;
@end

@implementation CMWaterSubmersionManager

+ (BOOL)waterSubmersionAvailable
{
  if (qword_1EB3BE970 != -1) {
    dispatch_once(&qword_1EB3BE970, &unk_1EDFC1FE0);
  }
  return ((dword_1EB3BE95C - 115) < 0x13) & (0x787E1u >> (dword_1EB3BE95C - 115));
}

+ (CMAuthorizationStatus)authorizationStatus
{
  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2);
}

+ (BOOL)isAuthorizedAndEntitled
{
  if (objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2) == 3)
  {
    if ((objc_msgSend_hasEntitlement_(CMMotionUtils, v3, @"com.apple.developer.submerged-depth-and-pressure") & 1) != 0|| (int hasEntitlement = objc_msgSend_hasEntitlement_(CMMotionUtils, v4, @"com.apple.developer.submerged-shallow-depth-and-pressure")) != 0)
    {
      LOBYTE(hasEntitlement) = 1;
    }
  }
  else
  {
    LOBYTE(hasEntitlement) = 0;
  }
  return hasEntitlement;
}

- (void)notifySubmersionStateProcessingCompleted
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"WaterSubmersion/kCLConnectionMessageWaterSubmersionCompletionHandler";
  v7[0] = MEMORY[0x1E4F1CC38];
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v7, &v6, 1);
  v3 = (std::__shared_weak_count *)operator new(0x70uLL);
  v3->__shared_owners_ = 0;
  v3->__shared_weak_owners_ = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "WaterSubmersion/kCLConnectionMessageWaterSubmersionCompletionHandler");
  MEMORY[0x192FCC420](&v3[1], __p, v2);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  CLConnectionClient::sendMessage();
  if (v3) {
    sub_1902D8B58(v3);
  }
  sub_1902D8B58(v3);
}

- (NSMeasurement)maximumDepth
{
  if (!objc_msgSend_waterSubmersionAvailable(CMWaterSubmersionManager, a2, v2)
    || !objc_msgSend_isAuthorizedAndEntitled(CMWaterSubmersionManager, v4, v5))
  {
    return 0;
  }
  result = self->_maximumDepth;
  if (!result)
  {
    uint64_t hasEntitlement = objc_msgSend_hasEntitlement_(CMMotionUtils, v6, @"com.apple.developer.submerged-depth-and-pressure");
    v9 = [CLSubmersionStateMachine alloc];
    v11 = objc_msgSend_initWithType_(v9, v10, hasEntitlement);
    id v12 = objc_alloc(MEMORY[0x1E4F28E28]);
    objc_msgSend_pastMaxDepthThreshold(v11, v13, v14);
    double v16 = v15;
    uint64_t v19 = objc_msgSend_meters(MEMORY[0x1E4F291E0], v17, v18);
    self->_maximumDepth = (NSMeasurement *)objc_msgSend_initWithDoubleValue_unit_(v12, v20, v19, v16);

    return self->_maximumDepth;
  }
  return result;
}

- (CMWaterSubmersionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CMWaterSubmersionManager;
  uint64_t v2 = [(CMWaterSubmersionManager *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CoreMotion.CMWaterSubmersionManager", 0);
    v2->_locationConnection = 0;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
    v2->_maximumDepth = 0;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_set_specific((dispatch_queue_t)self->_dispatchQueue, &unk_1E929E920, &unk_1E929E920, 0);
  if (dispatch_get_specific(&unk_1E929E920) == &unk_1E929E920)
  {
    objc_msgSend__disconnect(self, v3, v4);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905031E4;
    block[3] = &unk_1E568D118;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }

  self->_dispatchQueue = 0;
  self->_maximumDepth = 0;
  v6.receiver = self;
  v6.super_class = (Class)CMWaterSubmersionManager;
  [(CMWaterSubmersionManager *)&v6 dealloc];
}

- (void)setDelegate:(id)delegate
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_190503264;
  v3[3] = &unk_1E568D190;
  v3[4] = self;
  v3[5] = delegate;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v3);
}

- (void)_setDelegate:(id)a3
{
}

- (void)_connect
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_locationConnection) {
    operator new();
  }
}

- (void)_handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = (CLConnectionMessage **)a3.var0;
  objc_super v5 = (void *)CLConnectionMessage::name(*(CLConnectionMessage **)a3.var0);
  int v6 = *((char *)v5 + 23);
  if (v6 < 0)
  {
    if (v5[1] != 62) {
      goto LABEL_9;
    }
    objc_super v5 = (void *)*v5;
  }
  else if (v6 != 62)
  {
    goto LABEL_9;
  }
  if (!memcmp(v5, "WaterSubmersion/kCLConnectionMessageWaterSubmersionEventUpdate", 0x3EuLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    v7 = *var0;
    v8 = (objc_class *)objc_opt_class();
    uint64_t ObjectOfClass = CLConnectionMessage::getObjectOfClass(v7, v8);
    id v12 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v10, v11);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = sub_190503A2C;
    v44[3] = &unk_1E568D190;
    v44[4] = self;
    v44[5] = ObjectOfClass;
    objc_msgSend_addOperationWithBlock_(v12, v13, (uint64_t)v44);
  }
LABEL_9:
  uint64_t v14 = (void *)CLConnectionMessage::name(*var0);
  int v15 = *((char *)v14 + 23);
  if (v15 < 0)
  {
    if (v14[1] != 68) {
      goto LABEL_17;
    }
    uint64_t v14 = (void *)*v14;
  }
  else if (v15 != 68)
  {
    goto LABEL_17;
  }
  if (!memcmp(v14, "WaterSubmersion/kCLConnectionMessageWaterSubmersionMeasurementUpdate", 0x44uLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    double v16 = *var0;
    v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = CLConnectionMessage::getObjectOfClass(v16, v17);
    v21 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v19, v20);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = sub_190503A6C;
    v43[3] = &unk_1E568D190;
    v43[4] = self;
    v43[5] = v18;
    objc_msgSend_addOperationWithBlock_(v21, v22, (uint64_t)v43);
  }
LABEL_17:
  v23 = (void *)CLConnectionMessage::name(*var0);
  int v24 = *((char *)v23 + 23);
  if (v24 < 0)
  {
    if (v23[1] != 68) {
      goto LABEL_25;
    }
    v23 = (void *)*v23;
  }
  else if (v24 != 68)
  {
    goto LABEL_25;
  }
  if (!memcmp(v23, "WaterSubmersion/kCLConnectionMessageWaterSubmersionTemperatureUpdate", 0x44uLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    v25 = *var0;
    v26 = (objc_class *)objc_opt_class();
    uint64_t v27 = CLConnectionMessage::getObjectOfClass(v25, v26);
    v30 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v28, v29);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = sub_190503AAC;
    v42[3] = &unk_1E568D190;
    v42[4] = self;
    v42[5] = v27;
    objc_msgSend_addOperationWithBlock_(v30, v31, (uint64_t)v42);
  }
LABEL_25:
  v32 = (void *)CLConnectionMessage::name(*var0);
  int v33 = *((char *)v32 + 23);
  if (v33 < 0)
  {
    if (v32[1] != 64) {
      return;
    }
    v32 = (void *)*v32;
  }
  else if (v33 != 64)
  {
    return;
  }
  if (!memcmp(v32, "WaterSubmersion/kCLConnectionMessageWaterSubmersionErrorOccurred", 0x40uLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v34 = *var0;
      v35 = (objc_class *)objc_opt_class();
      uint64_t v36 = CLConnectionMessage::getObjectOfClass(v34, v35);
      v39 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v37, v38);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_190503AEC;
      v41[3] = &unk_1E568D190;
      v41[4] = self;
      v41[5] = v36;
      objc_msgSend_addOperationWithBlock_(v39, v40, (uint64_t)v41);
    }
  }
}

- (void)_disconnect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_locationConnection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
    self->_locationConnection = 0;
  }
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end