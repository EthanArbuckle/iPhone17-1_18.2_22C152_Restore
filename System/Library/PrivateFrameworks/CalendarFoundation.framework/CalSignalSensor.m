@interface CalSignalSensor
- (CalSignalSensor)initWithSignal:(int)a3;
- (id)description;
- (id)fireBlock;
- (int)signal;
- (void)_shutDownSource;
- (void)dealloc;
- (void)setFireBlock:(id)a3;
- (void)setSignal:(int)a3;
- (void)startSensor;
- (void)stopSensor;
@end

@implementation CalSignalSensor

- (CalSignalSensor)initWithSignal:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CalSignalSensor;
  result = [(CalSignalSensor *)&v5 init];
  if (result) {
    result->_signal = a3;
  }
  return result;
}

- (void)dealloc
{
  [(CalSignalSensor *)self _shutDownSource];
  v3.receiver = self;
  v3.super_class = (Class)CalSignalSensor;
  [(CalSignalSensor *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalSignalSensor;
  v4 = [(CalSignalSensor *)&v9 description];
  objc_super v5 = [(CalDescriptionBuilder *)v3 initWithSuperclassDescription:v4];

  v6 = self;
  objc_sync_enter(v6);
  [(CalDescriptionBuilder *)v5 setKey:@"signal" withInt:[(CalSignalSensor *)v6 signal]];
  [(CalDescriptionBuilder *)v5 setKey:@"source" withPointerAddress:v6->_signalSource];
  objc_sync_exit(v6);

  v7 = [(CalDescriptionBuilder *)v5 build];

  return v7;
}

- (void)startSensor
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Signal sensor already started.  Will not start.  Sensor: [%@]", v2, v3, v4, v5, v6);
}

void __30__CalSignalSensor_startSensor__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __30__CalSignalSensor_startSensor__block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  uint64_t v9 = [*(id *)(a1 + 32) fireBlock];
  v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(a1 + 32));
  }
}

- (void)stopSensor
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Stopped signal sensor: [%@]", v2, v3, v4, v5, v6);
}

- (void)_shutDownSource
{
  signalSource = self->_signalSource;
  if (signalSource)
  {
    dispatch_source_cancel(signalSource);
    uint64_t v4 = self->_signalSource;
    self->_signalSource = 0;
  }
}

- (int)signal
{
  return self->_signal;
}

- (void)setSignal:(int)a3
{
  self->_signal = a3;
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);

  objc_storeStrong((id *)&self->_signalSource, 0);
}

void __30__CalSignalSensor_startSensor__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end