@interface ASDTExclavesSensorManager
+ (id)forMic;
+ (id)forSensorName:(id)a3;
- (ASDTExclavesSensorManager)initWithSensorName:(id)a3;
- (id).cxx_construct;
- (void)ioThreadStartStop:(BOOL)a3;
- (void)sensor;
- (void)statusTracker;
@end

@implementation ASDTExclavesSensorManager

+ (id)forSensorName:(id)a3
{
  id v3 = a3;
  if (+[ASDTExclavesSensorManager forSensorName:]::onceToken != -1) {
  v4 = dispatch_once(&+[ASDTExclavesSensorManager forSensorName:]::onceToken, &__block_literal_global_1);
  }
  if (!v4)
  {
    v5 = [[ASDTExclavesSensorManager alloc] initWithSensorName:v3];
    if (v5)
    {
      v4 = v5;
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

uint64_t __43__ASDTExclavesSensorManager_forSensorName___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08958]);

  [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  return MEMORY[0x270F9A758]();
}

+ (id)forMic
{
  id v3 = [NSString stringWithUTF8String:"com.apple.sensors.mic"];
  v4 = [a1 forSensorName:v3];

  return v4;
}

- (ASDTExclavesSensorManager)initWithSensorName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDTExclavesSensorManager;
  if ([(ASDTExclavesSensorManager *)&v9 init])
  {
    v5 = (ASDT::Exclaves::Sensor *)[v4 UTF8String];
    ASDT::Exclaves::Sensor::Create(v5, v6);
  }
  v7 = (ASDTExclavesSensorManager *)0;

  return v7;
}

- (void)sensor
{
  return self->_sensor.__ptr_.__value_;
}

- (void)statusTracker
{
  return self->_statusTracker.__ptr_.__value_;
}

- (void)ioThreadStartStop:(BOOL)a3
{
  BOOL v3 = a3;
  int v12 = 0;
  Status = (ASDTTime *)ASDT::Exclaves::Sensor::GetStatus((uint64_t)self->_sensor.__ptr_.__value_, &v12);
  if (!Status)
  {
    if (v3) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }
    value = self->_statusTracker.__ptr_.__value_;
    int v8 = v12;
    ASDTTime::machAbsoluteTime(Status, (uint64_t)v9 + 8);
    *(void *)&v9[0] = -1;
    int v10 = v8;
    int v11 = v6;
    ASDT::Exclaves::StatusTracker::Push((uint64_t)value, v9);
  }
}

- (void).cxx_destruct
{
  value = self->_statusTracker.__ptr_.__value_;
  self->_statusTracker.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(StatusTracker *, SEL))(*(void *)value + 8))(value, a2);
  }
  id v4 = self->_sensor.__ptr_.__value_;
  self->_sensor.__ptr_.__value_ = 0;
  if (v4)
  {
    v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)initWithSensorName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "ASDTExclavesSensorManager(%@): Exclaves sensor creation fails unexpectedly.", (uint8_t *)&v2, 0xCu);
}

- (void)initWithSensorName:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "ASDTExclavesSensorManager(%@): Failed to allocate memory.", (uint8_t *)&v2, 0xCu);
}

@end