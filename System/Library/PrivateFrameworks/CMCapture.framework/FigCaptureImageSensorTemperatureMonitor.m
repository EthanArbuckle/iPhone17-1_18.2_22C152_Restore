@interface FigCaptureImageSensorTemperatureMonitor
+ (void)initialize;
- (FigCaptureImageSensorTemperatureMonitor)initWithPortType:(id)a3 sensorThermalLevelsByTemperature:(id)a4;
- (int)systemPressureLevelFromImageSensorTemperature;
- (void)dealloc;
- (void)startMonitoringImageSensorTemperatureUntilNominalWithQueue:(id)a3 changeHandler:(id)a4;
- (void)updateWithImageSensorTemperature:(float)a3;
@end

@implementation FigCaptureImageSensorTemperatureMonitor

- (int)systemPressureLevelFromImageSensorTemperature
{
  return self->_currentSystemPressureFromImageSensorTemperature;
}

+ (void)initialize
{
}

- (FigCaptureImageSensorTemperatureMonitor)initWithPortType:(id)a3 sensorThermalLevelsByTemperature:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)FigCaptureImageSensorTemperatureMonitor;
  v6 = [(FigCaptureImageSensorTemperatureMonitor *)&v26 init];
  if (v6)
  {
    if (a3 && a4)
    {
      v6->_portType = (NSString *)a3;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Nominal"), "objectForKeyedSubscript:", @"Min"), "floatValue");
      float v8 = v7;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Nominal"), "objectForKeyedSubscript:", @"Max"), "floatValue");
      v6->_systemPressureLevelByImageSensorTemperature[0].float min = v8;
      v6->_systemPressureLevelByImageSensorTemperature[0].max = v9;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Fair"), "objectForKeyedSubscript:", @"Min"), "floatValue");
      float v11 = v10;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Fair"), "objectForKeyedSubscript:", @"Max"), "floatValue");
      v6->_systemPressureLevelByImageSensorTemperature[1].float min = v11;
      v6->_systemPressureLevelByImageSensorTemperature[1].max = v12;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Serious"), "objectForKeyedSubscript:", @"Min"), "floatValue");
      float v14 = v13;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Serious"), "objectForKeyedSubscript:", @"Max"), "floatValue");
      v6->_systemPressureLevelByImageSensorTemperature[2].float min = v14;
      v6->_systemPressureLevelByImageSensorTemperature[2].max = v15;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Critical"), "objectForKeyedSubscript:", @"Min"), "floatValue");
      float v17 = v16;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Critical"), "objectForKeyedSubscript:", @"Max"), "floatValue");
      v6->_systemPressureLevelByImageSensorTemperature[3].float min = v17;
      v6->_systemPressureLevelByImageSensorTemperature[3].max = v18;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Shutdown"), "objectForKeyedSubscript:", @"Min"), "floatValue");
      float v20 = v19;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Shutdown"), "objectForKeyedSubscript:", @"Max"), "floatValue");
      uint64_t v21 = 0;
      v6->_systemPressureLevelByImageSensorTemperature[4].float min = v20;
      v6->_systemPressureLevelByImageSensorTemperature[4].max = v22;
      for (unsigned int i = -1; ; ++i)
      {
        float min = v6->_systemPressureLevelByImageSensorTemperature[v21].min;
        if (min >= v6->_systemPressureLevelByImageSensorTemperature[v21].max
          || v21 * 8 && v6->_systemPressureLevelByImageSensorTemperature[i].max <= min)
        {
          break;
        }
        if (++v21 == 5) {
          return v6;
        }
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  if (self)
  {
    nominalImageSensorTemperatureMonitorTimer = self->_nominalImageSensorTemperatureMonitorTimer;
    if (nominalImageSensorTemperatureMonitorTimer) {
      dispatch_source_cancel(nominalImageSensorTemperatureMonitorTimer);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureImageSensorTemperatureMonitor;
  [(FigCaptureImageSensorTemperatureMonitor *)&v4 dealloc];
}

- (void)updateWithImageSensorTemperature:(float)a3
{
  if (self)
  {
    nominalImageSensorTemperatureMonitorTimer = self->_nominalImageSensorTemperatureMonitorTimer;
    if (nominalImageSensorTemperatureMonitorTimer) {
      dispatch_source_cancel(nominalImageSensorTemperatureMonitorTimer);
    }
  }
  uint64_t currentSystemPressureFromImageSensorTemperature = self->_currentSystemPressureFromImageSensorTemperature;
  float v7 = &self->_systemPressureLevelByImageSensorTemperature[currentSystemPressureFromImageSensorTemperature];
  if (v7->min > a3 || v7->max < a3)
  {
    int v9 = v7->min <= a3 ? 1 : -1;
    unsigned int v10 = currentSystemPressureFromImageSensorTemperature + v9;
    if ((currentSystemPressureFromImageSensorTemperature + v9) > 4) {
      goto LABEL_17;
    }
    do
    {
      float v11 = &self->_systemPressureLevelByImageSensorTemperature[v10];
      if (v11->min <= a3 && v11->max >= a3) {
        break;
      }
      v10 += v9;
    }
    while (v10 < 5);
    if (v10 != currentSystemPressureFromImageSensorTemperature) {
LABEL_17:
    }
      self->_uint64_t currentSystemPressureFromImageSensorTemperature = v10;
  }
}

- (void)startMonitoringImageSensorTemperatureUntilNominalWithQueue:(id)a3 changeHandler:(id)a4
{
  if (!self->_nominalImageSensorTemperatureMonitorTimer)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3052000000;
    v12[3] = __Block_byref_object_copy__41;
    v12[4] = __Block_byref_object_dispose__41;
    uint64_t v13 = 0;
    uint64_t v13 = [a4 copy];
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)a3);
    self->_nominalImageSensorTemperatureMonitorTimer = v6;
    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer((dispatch_source_t)v6, v7, 0x6FC23AC00uLL, 0xF4240uLL);
    nominalImageSensorTemperatureMonitorTimer = self->_nominalImageSensorTemperatureMonitorTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __116__FigCaptureImageSensorTemperatureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithQueue_changeHandler___block_invoke;
    handler[3] = &unk_1E5C24F58;
    handler[4] = self;
    handler[5] = v12;
    dispatch_source_set_event_handler(nominalImageSensorTemperatureMonitorTimer, handler);
    int v9 = self->_nominalImageSensorTemperatureMonitorTimer;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __116__FigCaptureImageSensorTemperatureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithQueue_changeHandler___block_invoke_2;
    v10[3] = &unk_1E5C246B8;
    v10[4] = self;
    v10[5] = v12;
    dispatch_source_set_cancel_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_nominalImageSensorTemperatureMonitorTimer);
    _Block_object_dispose(v12, 8);
  }
}

void __116__FigCaptureImageSensorTemperatureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithQueue_changeHandler___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = *(NSObject **)(v2 + 64);
    if (v3)
    {
      dispatch_source_cancel(v3);
    }
  }
}

void __116__FigCaptureImageSensorTemperatureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithQueue_changeHandler___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
}

@end