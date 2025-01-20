@interface CMOdometerSuitabilityManagerProxy
- (CMOdometerSuitabilityManager)odometerSuitabilityManager;
- (CMOdometerSuitabilityManagerProxy)initWithOdometerSuitability:(id)a3;
- (double)startDate;
- (double)suitableForRunning;
- (double)suitableForWalking;
- (void)_startDaemonConnection;
- (void)_startOdometerSuitabilityUpdatesWithHandler:(id)a3;
- (void)_stopOdometerSuitabilityUpdates;
- (void)_teardown;
- (void)dealloc;
- (void)setOdometerSuitabilityManager:(id)a3;
- (void)setStartDate:(double)a3;
- (void)setSuitableForRunning:(double)a3;
- (void)setSuitableForWalking:(double)a3;
@end

@implementation CMOdometerSuitabilityManagerProxy

- (CMOdometerSuitabilityManagerProxy)initWithOdometerSuitability:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMOdometerSuitabilityManagerProxy;
  v4 = [(CMOdometerSuitabilityManagerProxy *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_odometerSuitabilityManager = (CMOdometerSuitabilityManager *)a3;
    v4->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometerSuitability.internal", 0);
    v5->fCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometerSuitability.callback", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMOdometerSuitabilityManagerProxy;
  [(CMOdometerSuitabilityManagerProxy *)&v3 dealloc];
}

- (void)_teardown
{
  objc_msgSend__stopOdometerSuitabilityUpdates(self, a2, v2);
  if (self->fLocationdConnection)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startDaemonConnection
{
}

- (void)_startOdometerSuitabilityUpdatesWithHandler:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];

  self->fHandler = (id)objc_msgSend_copy(a3, v5, v6);
  sub_1902C3F54(&__p, "kCLConnectionMessageOdometerSuitabilityUpdate");
  v10[1] = MEMORY[0x1E4F143A8];
  v10[2] = 3221225472;
  v10[3] = sub_1904F588C;
  v10[4] = &unk_1E568D558;
  v10[5] = self;
  CLConnectionClient::setHandlerForMessage();
  if (v13 < 0) {
    operator delete(__p);
  }
  v14 = @"kCLConnectionMessageSubscribeKey";
  v15[0] = MEMORY[0x1E4F1CC38];
  v10[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v15, &v14, 1);
  sub_1904F6150(&__p, v10);
  v8 = v12;
  v9 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v9) {
    sub_1902D8B58(v9);
  }
  if (v8) {
    sub_1902D8B58(v8);
  }
}

- (void)_stopOdometerSuitabilityUpdates
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10 = @"kCLConnectionMessageSubscribeKey";
  v11[0] = MEMORY[0x1E4F1CC28];
  __p[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v11, &v10, 1);
  sub_1904F6150(&v8, __p);
  objc_super v3 = v9;
  uint64_t v6 = v8;
  objc_super v7 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v7) {
    sub_1902D8B58(v7);
  }
  sub_1902C3F54(__p, "kCLConnectionMessageOdometerSuitabilityUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0) {
    operator delete(__p[0]);
  }

  self->fHandler = 0;
  if (v3) {
    sub_1902D8B58(v3);
  }
}

- (CMOdometerSuitabilityManager)odometerSuitabilityManager
{
  return self->_odometerSuitabilityManager;
}

- (void)setOdometerSuitabilityManager:(id)a3
{
  self->_odometerSuitabilityManager = (CMOdometerSuitabilityManager *)a3;
}

- (double)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(double)a3
{
  self->_startDate = a3;
}

- (double)suitableForRunning
{
  return self->_suitableForRunning;
}

- (void)setSuitableForRunning:(double)a3
{
  self->_suitableForRunning = a3;
}

- (double)suitableForWalking
{
  return self->_suitableForWalking;
}

- (void)setSuitableForWalking:(double)a3
{
  self->_suitableForWalking = a3;
}

@end