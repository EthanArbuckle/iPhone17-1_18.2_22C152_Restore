@interface FigCaptureSystemPressureMonitor
+ (void)initialize;
- (FigCaptureSystemPressureMonitor)initWithPearlModuleType:(int)a3 sensorThermalLevelsByTemperatureByPortType:(id)a4;
- (id)systemPressureLevelChangedHandler;
- (int)systemPressureLevelFromImageSensorWithPortType:(id)a3;
- (int)systemPressureLevelFromPearlProjector;
- (uint64_t)_callChangeHandler;
- (uint64_t)_registerForPeakPowerNotifications;
- (uint64_t)_registerForThermalNotifications;
- (uint64_t)_updateSystemPressureForPeakPowerAndCallChangeHandler:(uint64_t)result;
- (uint64_t)_updateSystemPressureForThermalPressureAndCallChangeHandler:(uint64_t)result;
- (uint64_t)_updateWithPearlProjectorTemperature:(uint64_t)result;
- (void)_releasePearlProjectorPollingResources;
- (void)callSystemPressureLevelChangedHandler;
- (void)dealloc;
- (void)setSystemPressureLevelChangedHandler:(id)a3;
- (void)startMonitoringImageSensorTemperatureUntilNominalWithPortType:(id)a3;
- (void)startMonitoringPearlProjectorTemperatureUntilNominal;
- (void)updateWithPearlProjectorTemperature:(float)a3;
- (void)updateWithPortType:(id)a3 imageSensorTemperature:(float)a4;
@end

@implementation FigCaptureSystemPressureMonitor

- (uint64_t)_callChangeHandler
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!result)
    {
      fig_log_get_emitter();
      uint64_t v10 = v1;
      LODWORD(v9) = 0;
      result = FigDebugAssert3();
    }
    if (*(void *)(v2 + 8))
    {
      v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v4 = *(void **)(v2 + 160);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 160), "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * i), v9, v10), "systemPressureLevelFromImageSensorTemperature")), *(void *)(*((void *)&v11 + 1) + 8 * i));
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
      return (*(uint64_t (**)(void))(*(void *)(v2 + 8) + 16))();
    }
  }
  return result;
}

uint64_t __72__FigCaptureSystemPressureMonitor_callSystemPressureLevelChangedHandler__block_invoke(uint64_t a1)
{
  return -[FigCaptureSystemPressureMonitor _callChangeHandler](*(void *)(a1 + 32));
}

- (void)callSystemPressureLevelChangedHandler
{
  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__FigCaptureSystemPressureMonitor_callSystemPressureLevelChangedHandler__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(systemPressureLevelChangedHandlerQueue, block);
}

+ (void)initialize
{
}

- (FigCaptureSystemPressureMonitor)initWithPearlModuleType:(int)a3 sensorThermalLevelsByTemperatureByPortType:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)FigCaptureSystemPressureMonitor;
  uint64_t v6 = [(FigCaptureSystemPressureMonitor *)&v20 init];
  if (v6)
  {
    *((void *)v6 + 2) = FigDispatchQueueCreateWithPriority();
    *(_OWORD *)(v6 + 28) = xmmword_1A5F0D0C0;
    *((_DWORD *)v6 + 11) = 40;
    *(_OWORD *)(v6 + 56) = xmmword_1A5F0D0C0;
    *((_DWORD *)v6 + 18) = 40;
    *((_OWORD *)v6 + 5) = xmmword_1A5F0D0D0;
    float v7 = 61.0;
    *((void *)v6 + 12) = 0x426C000042480000;
    if (a3 == 2) {
      float v7 = 70.0;
    }
    *((_DWORD *)v6 + 26) = 1112539136;
    *((float *)v6 + 27) = v7;
    *((void *)v6 + 14) = 0x42C6000042580000;
    uint64_t v8 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v6 + 136) = *MEMORY[0x1E4F1F9F8];
    *((void *)v6 + 19) = *(void *)(v8 + 16);
    if ([a4 count])
    {
      *((void *)v6 + 20) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v9 = [a4 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(a4);
            }
            uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            long long v14 = -[FigCaptureImageSensorTemperatureMonitor initWithPortType:sensorThermalLevelsByTemperature:]([FigCaptureImageSensorTemperatureMonitor alloc], "initWithPortType:sensorThermalLevelsByTemperature:", v13, [a4 objectForKeyedSubscript:v13]);
            [*((id *)v6 + 20) setObject:v14 forKeyedSubscript:v13];
          }
          uint64_t v10 = [a4 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v10);
      }
    }
    -[FigCaptureSystemPressureMonitor _registerForThermalNotifications]((uint64_t)v6);
    -[FigCaptureSystemPressureMonitor _registerForPeakPowerNotifications]((uint64_t)v6);
  }
  return (FigCaptureSystemPressureMonitor *)v6;
}

- (uint64_t)_registerForThermalNotifications
{
  if (result)
  {
    uint64_t v1 = (const char *)*MEMORY[0x1E4F14918];
    uint64_t v2 = *(NSObject **)(result + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __67__FigCaptureSystemPressureMonitor__registerForThermalNotifications__block_invoke;
    handler[3] = &unk_1E5C25910;
    handler[4] = result;
    return notify_register_dispatch(v1, (int *)(result + 24), v2, handler);
  }
  return result;
}

- (uint64_t)_registerForPeakPowerNotifications
{
  if (result)
  {
    uint64_t v1 = *(NSObject **)(result + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__FigCaptureSystemPressureMonitor__registerForPeakPowerNotifications__block_invoke;
    handler[3] = &unk_1E5C25910;
    handler[4] = result;
    return notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)(result + 52), v1, handler);
  }
  return result;
}

- (void)dealloc
{
  int thermalPressureNotificationToken = self->_thermalPressureNotificationToken;
  if (thermalPressureNotificationToken) {
    notify_cancel(thermalPressureNotificationToken);
  }
  int peakPowerNotificationToken = self->_peakPowerNotificationToken;
  if (peakPowerNotificationToken) {
    notify_cancel(peakPowerNotificationToken);
  }
  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FigCaptureSystemPressureMonitor_dealloc__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(systemPressureLevelChangedHandlerQueue, block);

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureSystemPressureMonitor;
  [(FigCaptureSystemPressureMonitor *)&v6 dealloc];
}

void __42__FigCaptureSystemPressureMonitor_dealloc__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 24) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 52) = 0;
  -[FigCaptureSystemPressureMonitor _releasePearlProjectorPollingResources](*(void *)(a1 + 32));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 160);
}

- (void)_releasePearlProjectorPollingResources
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    uint64_t v2 = *(NSObject **)(a1 + 128);
    if (v2)
    {
      dispatch_source_cancel(v2);
    }
  }
}

- (id)systemPressureLevelChangedHandler
{
  return self->_systemPressureLevelChangedHandler;
}

- (void)setSystemPressureLevelChangedHandler:(id)a3
{
  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__FigCaptureSystemPressureMonitor_setSystemPressureLevelChangedHandler___block_invoke;
  v4[3] = &unk_1E5C24E50;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(systemPressureLevelChangedHandlerQueue, v4);
}

uint64_t __72__FigCaptureSystemPressureMonitor_setSystemPressureLevelChangedHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 40) copy];
  -[FigCaptureSystemPressureMonitor _updateSystemPressureForPeakPowerAndCallChangeHandler:](*(void *)(a1 + 32), 0);
  uint64_t v2 = *(void *)(a1 + 32);
  return -[FigCaptureSystemPressureMonitor _updateSystemPressureForThermalPressureAndCallChangeHandler:](v2, 1);
}

- (uint64_t)_updateSystemPressureForPeakPowerAndCallChangeHandler:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    result = *(unsigned int *)(v3 + 52);
    if (result)
    {
      uint64_t state64 = 0;
      result = notify_get_state(result, &state64);
      if (!result)
      {
        for (uint64_t i = 0; i != 4; ++i)
        {
          if (state64 <= *(int *)(v3 + 4 * i + 56)) {
            break;
          }
        }
        *(_DWORD *)(v3 + 76) = i;
        if (a2) {
          return -[FigCaptureSystemPressureMonitor _callChangeHandler](v3);
        }
      }
    }
  }
  return result;
}

- (uint64_t)_updateSystemPressureForThermalPressureAndCallChangeHandler:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    result = *(unsigned int *)(v3 + 24);
    if (result)
    {
      uint64_t state64 = 0;
      result = notify_get_state(result, &state64);
      if (!result)
      {
        for (uint64_t i = 0; i != 4; ++i)
        {
          if (state64 <= *(int *)(v3 + 4 * i + 28)) {
            break;
          }
        }
        *(_DWORD *)(v3 + 48) = i;
        if (a2) {
          return -[FigCaptureSystemPressureMonitor _callChangeHandler](v3);
        }
      }
    }
  }
  return result;
}

- (int)systemPressureLevelFromPearlProjector
{
  return self->_currentSystemPressureFromProjectorTemperature;
}

- (void)updateWithPearlProjectorTemperature:(float)a3
{
  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__FigCaptureSystemPressureMonitor_updateWithPearlProjectorTemperature___block_invoke;
  v4[3] = &unk_1E5C262A0;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(systemPressureLevelChangedHandlerQueue, v4);
}

uint64_t __71__FigCaptureSystemPressureMonitor_updateWithPearlProjectorTemperature___block_invoke(uint64_t a1)
{
  -[FigCaptureSystemPressureMonitor _releasePearlProjectorPollingResources](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  float v3 = *(float *)(a1 + 40);
  return -[FigCaptureSystemPressureMonitor _updateWithPearlProjectorTemperature:](v2, v3);
}

- (uint64_t)_updateWithPearlProjectorTemperature:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!result)
    {
      fig_log_get_emitter();
      result = FigDebugAssert3();
    }
    uint64_t v4 = *(int *)(v3 + 120);
    float v5 = (float *)(v3 + 80 + 8 * v4);
    if (*v5 > a2 || v5[1] < a2)
    {
      int v7 = *v5 <= a2 ? 1 : -1;
      unsigned int v8 = v4 + v7;
      if ((v4 + v7) > 4) {
        goto LABEL_17;
      }
      do
      {
        uint64_t v9 = (float *)(v3 + 80 + 8 * v8);
        if (*v9 <= a2 && v9[1] >= a2) {
          break;
        }
        v8 += v7;
      }
      while (v8 < 5);
      if (v8 != v4)
      {
LABEL_17:
        *(_DWORD *)(v3 + 120) = v8;
        return -[FigCaptureSystemPressureMonitor _callChangeHandler](v3);
      }
    }
  }
  return result;
}

- (void)startMonitoringPearlProjectorTemperatureUntilNominal
{
  if (!self->_pearlPollTimer)
  {
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_systemPressureLevelChangedHandlerQueue);
    self->_pearlPollTimer = v3;
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer((dispatch_source_t)v3, v4, 0x77359400uLL, 0xF4240uLL);
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&lhs, HostTimeClock);
    CMTimeMake(&rhs, 60, 1);
    CMTimeAdd(&v12, &lhs, &rhs);
    self->_pollingTimerStopTime = ($95D729B680665BEAEFA1D6FCA8238556)v12;
    pearlPollTimer = self->_pearlPollTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __87__FigCaptureSystemPressureMonitor_startMonitoringPearlProjectorTemperatureUntilNominal__block_invoke;
    handler[3] = &unk_1E5C24430;
    handler[4] = self;
    dispatch_source_set_event_handler(pearlPollTimer, handler);
    int v7 = self->_pearlPollTimer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__FigCaptureSystemPressureMonitor_startMonitoringPearlProjectorTemperatureUntilNominal__block_invoke_2;
    v8[3] = &unk_1E5C24430;
    v8[4] = self;
    dispatch_source_set_cancel_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_pearlPollTimer);
  }
}

void __87__FigCaptureSystemPressureMonitor_startMonitoringPearlProjectorTemperatureUntilNominal__block_invoke(uint64_t a1)
{
  int v7 = 0;
  objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "structuredLightProjectorStandbyTemperatureWithError:", &v7);
  if (!v7) {
    -[FigCaptureSystemPressureMonitor _updateWithPearlProjectorTemperature:](*(void *)(a1 + 32), v2);
  }
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&time1, HostTimeClock);
  CMTime v5 = *(CMTime *)(*(void *)(a1 + 32) + 136);
  if (CMTimeCompare(&time1, &v5) >= 1)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 120) = 0;
    -[FigCaptureSystemPressureMonitor _callChangeHandler](*(void *)(a1 + 32));
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v4 + 120)) {
    -[FigCaptureSystemPressureMonitor _releasePearlProjectorPollingResources](v4);
  }
}

void __87__FigCaptureSystemPressureMonitor_startMonitoringPearlProjectorTemperatureUntilNominal__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 128) = 0;
}

- (int)systemPressureLevelFromImageSensorWithPortType:(id)a3
{
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_imageSensorTemperatureMonitorByPortType objectForKeyedSubscript:a3];
  return [v3 systemPressureLevelFromImageSensorTemperature];
}

- (void)updateWithPortType:(id)a3 imageSensorTemperature:(float)a4
{
  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FigCaptureSystemPressureMonitor_updateWithPortType_imageSensorTemperature___block_invoke;
  block[3] = &unk_1E5C26F78;
  block[4] = self;
  void block[5] = a3;
  float v6 = a4;
  dispatch_async(systemPressureLevelChangedHandlerQueue, block);
}

uint64_t __77__FigCaptureSystemPressureMonitor_updateWithPortType_imageSensorTemperature___block_invoke(uint64_t a1)
{
  float v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 160) objectForKeyedSubscript:*(void *)(a1 + 40)];
  LODWORD(v3) = *(_DWORD *)(a1 + 48);
  [v2 updateWithImageSensorTemperature:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  return -[FigCaptureSystemPressureMonitor _callChangeHandler](v4);
}

- (void)startMonitoringImageSensorTemperatureUntilNominalWithPortType:(id)a3
{
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_imageSensorTemperatureMonitorByPortType objectForKeyedSubscript:a3];
  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__FigCaptureSystemPressureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithPortType___block_invoke;
  v6[3] = &unk_1E5C24430;
  v6[4] = self;
  [v4 startMonitoringImageSensorTemperatureUntilNominalWithQueue:systemPressureLevelChangedHandlerQueue changeHandler:v6];
}

uint64_t __97__FigCaptureSystemPressureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithPortType___block_invoke(uint64_t a1)
{
  return -[FigCaptureSystemPressureMonitor _callChangeHandler](*(void *)(a1 + 32));
}

uint64_t __67__FigCaptureSystemPressureMonitor__registerForThermalNotifications__block_invoke(uint64_t a1)
{
  return -[FigCaptureSystemPressureMonitor _updateSystemPressureForThermalPressureAndCallChangeHandler:](*(void *)(a1 + 32), 1);
}

uint64_t __69__FigCaptureSystemPressureMonitor__registerForPeakPowerNotifications__block_invoke(uint64_t a1)
{
  return -[FigCaptureSystemPressureMonitor _updateSystemPressureForPeakPowerAndCallChangeHandler:](*(void *)(a1 + 32), 1);
}

@end