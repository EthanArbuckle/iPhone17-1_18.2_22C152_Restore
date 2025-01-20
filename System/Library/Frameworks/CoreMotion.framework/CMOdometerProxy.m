@interface CMOdometerProxy
- (CMOdometer)odometer;
- (CMOdometerProxy)initWithOdometer:(id)a3;
- (double)averageSpeed;
- (double)cyclingStartDate;
- (double)startDate;
- (double)totalCyclingDistance;
- (double)totalDistance;
- (void)_startCyclingWorkoutDistanceUpdatesWithHandler:(id)a3;
- (void)_startDaemonConnection;
- (void)_startOdometerUpdatesWithHandler:(id)a3;
- (void)_stopCyclingWorkoutDistanceUpdates;
- (void)_stopOdometerGpsAvailability;
- (void)_stopOdometerUpdates;
- (void)_teardown;
- (void)dealloc;
- (void)setAverageSpeed:(double)a3;
- (void)setCyclingStartDate:(double)a3;
- (void)setOdometer:(id)a3;
- (void)setStartDate:(double)a3;
- (void)setTotalCyclingDistance:(double)a3;
- (void)setTotalDistance:(double)a3;
@end

@implementation CMOdometerProxy

- (CMOdometerProxy)initWithOdometer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMOdometerProxy;
  v4 = [(CMOdometerProxy *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_odometer = (CMOdometer *)a3;
    v4->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometer.internal", 0);
    v5->fCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometer.callback", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMOdometerProxy;
  [(CMOdometerProxy *)&v3 dealloc];
}

- (void)_teardown
{
  objc_msgSend__stopOdometerGpsAvailability(self, a2, v2);
  objc_msgSend__stopOdometerUpdates(self, v4, v5);
  objc_msgSend__stopCyclingWorkoutDistanceUpdates(self, v6, v7);
  if (self->fLocationdConnection)
  {
    uint64_t v8 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v8, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startDaemonConnection
{
  v10[1] = *MEMORY[0x1E4F143B8];
  CLConnectionClient::setDefaultMessageHandler();
  sub_1902C3F54(&v6, "kCLConnectionMessageOdometerGpsAvailability");
  v5[6] = MEMORY[0x1E4F143A8];
  v5[7] = 3221225472;
  v5[8] = sub_19049451C;
  v5[9] = &unk_1E568D558;
  v5[10] = self;
  CLConnectionClient::setHandlerForMessage();
  if (v8 < 0) {
    operator delete(v6);
  }
  v5[1] = MEMORY[0x1E4F143A8];
  v5[2] = 3221225472;
  v5[3] = sub_190494610;
  v5[4] = &unk_1E568D118;
  v5[5] = self;
  CLConnectionClient::setInterruptionHandler();
  CLConnectionClient::start((CLConnectionClient *)self->fLocationdConnection);
  v9 = @"kCLConnectionMessageSubscribeKey";
  v10[0] = MEMORY[0x1E4F1CC38];
  v5[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v10, &v9, 1);
  sub_19049655C("kCLConnectionMessageOdometerGpsAvailability", v5, &v6);
  v4 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v4) {
    sub_1902D8B58(v4);
  }
  if (v7) {
    sub_1902D8B58(v7);
  }
}

- (void)_startOdometerUpdatesWithHandler:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_setTotalDistance_(self, a2, (uint64_t)a3, -1.0);

  self->fHandler = (id)objc_msgSend_copy(a3, v5, v6);
  sub_1902C3F54(&__p, "kCLConnectionMessageStartOdometerUpdate");
  v9[1] = MEMORY[0x1E4F143A8];
  v9[2] = 3221225472;
  v9[3] = sub_1904949E0;
  v9[4] = &unk_1E568D558;
  v9[5] = self;
  CLConnectionClient::setHandlerForMessage();
  if (v12 < 0) {
    operator delete(__p);
  }
  v13 = @"kCLConnectionMessageSubscribeKey";
  v14[0] = MEMORY[0x1E4F1CC38];
  v9[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v14, &v13, 1);
  sub_190445538("kCLConnectionMessageStartOdometerUpdate", v9, &__p);
  char v8 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v8) {
    sub_1902D8B58(v8);
  }
  if (v11) {
    sub_1902D8B58(v11);
  }
}

- (void)_stopOdometerGpsAvailability
{
  v9[1] = *MEMORY[0x1E4F143B8];
  char v8 = @"kCLConnectionMessageSubscribeKey";
  v9[0] = MEMORY[0x1E4F1CC28];
  __p[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v9, &v8, 1);
  sub_19049655C("kCLConnectionMessageOdometerGpsAvailability", __p, &v6);
  uint64_t v4 = v6;
  uint64_t v5 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v5) {
    sub_1902D8B58(v5);
  }
  sub_1902C3F54(__p, "kCLConnectionMessageOdometerGpsAvailability");
  CLConnectionClient::setHandlerForMessage();
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  if (v7) {
    sub_1902D8B58(v7);
  }
}

- (void)_stopOdometerUpdates
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"kCLConnectionMessageSubscribeKey";
  v10[0] = MEMORY[0x1E4F1CC28];
  __p[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v10, &v9, 1);
  sub_190445538("kCLConnectionMessageStartOdometerUpdate", __p, &v7);
  uint64_t v5 = v7;
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1902D8B58(v6);
  }
  sub_1902C3F54(__p, "kCLConnectionMessageStartOdometerUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v4 < 0) {
    operator delete(__p[0]);
  }

  self->fHandler = 0;
  if (v8) {
    sub_1902D8B58(v8);
  }
}

- (void)_startCyclingWorkoutDistanceUpdatesWithHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_setTotalCyclingDistance_(self, a2, (uint64_t)a3, -1.0);
  sub_1902C3F54(&__p, "kCLConnectionMessageCyclingWorkoutDistanceUpdate");
  v8[1] = MEMORY[0x1E4F143A8];
  v8[2] = 3221225472;
  v8[3] = sub_190495374;
  v8[4] = &unk_1E568D348;
  v8[5] = self;
  v8[6] = a3;
  CLConnectionClient::setHandlerForMessage();
  if (v11 < 0) {
    operator delete(__p);
  }
  char v12 = @"kCLConnectionMessageSubscribeKey";
  v13[0] = MEMORY[0x1E4F1CC38];
  v8[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v13, &v12, 1);
  sub_1904966A8(&__p, v8);
  uint64_t v6 = v10;
  uint64_t v7 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v7) {
    sub_1902D8B58(v7);
  }
  if (v6) {
    sub_1902D8B58(v6);
  }
}

- (void)_stopCyclingWorkoutDistanceUpdates
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"kCLConnectionMessageSubscribeKey";
  v10[0] = MEMORY[0x1E4F1CC28];
  __p[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v10, &v9, 1);
  sub_1904966A8(&v7, __p);
  uint64_t v2 = v8;
  uint64_t v5 = v7;
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1902D8B58(v6);
  }
  sub_1902C3F54(__p, "kCLConnectionMessageCyclingWorkoutDistanceUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  if (v2) {
    sub_1902D8B58(v2);
  }
}

- (CMOdometer)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(id)a3
{
  self->_odometer = (CMOdometer *)a3;
}

- (double)totalDistance
{
  return self->_totalDistance;
}

- (void)setTotalDistance:(double)a3
{
  self->_totalDistance = a3;
}

- (double)averageSpeed
{
  return self->_averageSpeed;
}

- (void)setAverageSpeed:(double)a3
{
  self->_averageSpeed = a3;
}

- (double)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(double)a3
{
  self->_startDate = a3;
}

- (double)totalCyclingDistance
{
  return self->_totalCyclingDistance;
}

- (void)setTotalCyclingDistance:(double)a3
{
  self->_totalCyclingDistance = a3;
}

- (double)cyclingStartDate
{
  return self->_cyclingStartDate;
}

- (void)setCyclingStartDate:(double)a3
{
  self->_cyclingStartDate = a3;
}

@end