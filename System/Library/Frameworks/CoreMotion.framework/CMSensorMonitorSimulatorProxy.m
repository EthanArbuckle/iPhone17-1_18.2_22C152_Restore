@interface CMSensorMonitorSimulatorProxy
- (CMSensorMonitorSimulatorProxy)initWithSensorMonitorTests;
- (id).cxx_construct;
- (void)_simulateMotionSensorDataForType:(unint64_t)a3 payload:(id)a4 withHandler:(id)a5;
- (void)dealloc;
@end

@implementation CMSensorMonitorSimulatorProxy

- (CMSensorMonitorSimulatorProxy)initWithSensorMonitorTests
{
  v4.receiver = self;
  v4.super_class = (Class)CMSensorMonitorSimulatorProxy;
  v2 = [(CMSensorMonitorSimulatorProxy *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMSensorMonitorSimulator", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  sub_190421DA8((uint64_t *)&self->fLocationdConnection, 0);
  v3.receiver = self;
  v3.super_class = (Class)CMSensorMonitorSimulatorProxy;
  [(CMSensorMonitorSimulatorProxy *)&v3 dealloc];
}

- (void)_simulateMotionSensorDataForType:(unint64_t)a3 payload:(id)a4 withHandler:(id)a5
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"CMSensorMonitorMotionSensorTypeId";
  v11[1] = @"CMSensorMonitorMotionSensorPayload";
  v12[0] = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3);
  v12[1] = a4;
  uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v12, v11, 2);
  sub_19050F15C("kCLConnectionMessageSimulateMotionSensorData", &v10, &v8);
  v7 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v7) {
    sub_1902D8B58(v7);
  }
  if (v9) {
    sub_1902D8B58(v9);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end