@interface GCDualSenseAdaptiveTrigger
- (GCDualSenseAdaptiveTriggerMode)mode;
- (GCDualSenseAdaptiveTriggerStatus)status;
- (float)armPosition;
- (int)index;
- (void)dealloc;
- (void)locateAdaptiveTriggerComponent;
- (void)locateControllerManagerApp;
- (void)observeChangesForAdaptiveTriggers:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendAdaptiveTriggerPayload:(id)a3;
- (void)sendAdaptiveTriggerPayloadDict:(id)a3;
- (void)setArmPosition:(float)a3;
- (void)setIndex:(int)a3;
- (void)setMode:(int64_t)a3;
- (void)setModeFeedbackWithResistiveStrengths:(GCDualSenseAdaptiveTriggerPositionalResistiveStrengths *)positionalResistiveStrengths;
- (void)setModeFeedbackWithStartPosition:(float)startPosition resistiveStrength:(float)resistiveStrength;
- (void)setModeOff;
- (void)setModeSlopeFeedbackWithStartPosition:(float)startPosition endPosition:(float)endPosition startStrength:(float)startStrength endStrength:(float)endStrength;
- (void)setModeVibrationWithAmplitudes:(GCDualSenseAdaptiveTriggerPositionalAmplitudes *)positionalAmplitudes frequency:(float)frequency;
- (void)setModeVibrationWithStartPosition:(float)startPosition amplitude:(float)amplitude frequency:(float)frequency;
- (void)setModeWeaponWithStartPosition:(float)startPosition endPosition:(float)endPosition resistiveStrength:(float)resistiveStrength;
- (void)setStatus:(int64_t)a3;
- (void)stopObservingChangesForAdaptiveTriggers:(id)a3;
- (void)updateStatus;
@end

@implementation GCDualSenseAdaptiveTrigger

- (void)dealloc
{
  [(GCDualSenseAdaptiveTrigger *)self stopObservingChangesForAdaptiveTriggers:self->_adaptiveTriggers];
  v3.receiver = self;
  v3.super_class = (Class)GCDualSenseAdaptiveTrigger;
  [(GCDualSenseAdaptiveTrigger *)&v3 dealloc];
}

- (void)setModeSlopeFeedbackWithStartPosition:(float)startPosition endPosition:(float)endPosition startStrength:(float)startStrength endStrength:(float)endStrength
{
  if (startPosition <= endPosition)
  {
    v11 = [GCDeviceAdaptiveTriggersPayload alloc];
    HIDWORD(v14) = 0;
    *(float *)&double v15 = fmaxf(startPosition, 0.0);
    if (*(float *)&v15 > 1.0) {
      *(float *)&double v15 = 1.0;
    }
    *(float *)&double v12 = fmaxf(endPosition, 0.0);
    if (*(float *)&v12 > 1.0) {
      *(float *)&double v12 = 1.0;
    }
    *(float *)&double v13 = fmaxf(startStrength, 0.0);
    if (*(float *)&v13 > 1.0) {
      *(float *)&double v13 = 1.0;
    }
    *(float *)&double v14 = fmaxf(endStrength, 0.0);
    if (*(float *)&v14 > 1.0) {
      *(float *)&double v14 = 1.0;
    }
    id v16 = [(GCDeviceAdaptiveTriggersPayload *)v11 initSlopeFeedbackWithStartPosition:v15 endPosition:v12 startStrength:v13 endStrength:v14];
    [(GCDualSenseAdaptiveTrigger *)self sendAdaptiveTriggerPayload:v16];
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException format:@"endPosition must be larger than startPosition"];
  }
}

- (void)setModeFeedbackWithStartPosition:(float)startPosition resistiveStrength:(float)resistiveStrength
{
  v7 = [GCDeviceAdaptiveTriggersPayload alloc];
  HIDWORD(v8) = 0;
  *(float *)&double v9 = fmaxf(startPosition, 0.0);
  if (*(float *)&v9 > 1.0) {
    *(float *)&double v9 = 1.0;
  }
  *(float *)&double v8 = fmaxf(resistiveStrength, 0.0);
  if (*(float *)&v8 > 1.0) {
    *(float *)&double v8 = 1.0;
  }
  id v10 = [(GCDeviceAdaptiveTriggersPayload *)v7 initFeedbackWithStartPosition:v9 resistiveStrength:v8];
  [(GCDualSenseAdaptiveTrigger *)self sendAdaptiveTriggerPayload:v10];
}

- (void)setModeWeaponWithStartPosition:(float)startPosition endPosition:(float)endPosition resistiveStrength:(float)resistiveStrength
{
  double v9 = [GCDeviceAdaptiveTriggersPayload alloc];
  HIDWORD(v11) = 0;
  *(float *)&double v12 = fmaxf(startPosition, 0.0);
  if (*(float *)&v12 > 1.0) {
    *(float *)&double v12 = 1.0;
  }
  if (startPosition >= endPosition) {
    *(float *)&double v10 = startPosition;
  }
  else {
    *(float *)&double v10 = endPosition;
  }
  if (*(float *)&v10 > 1.0) {
    *(float *)&double v10 = 1.0;
  }
  *(float *)&double v11 = fmaxf(resistiveStrength, 0.0);
  if (*(float *)&v11 > 1.0) {
    *(float *)&double v11 = 1.0;
  }
  id v13 = [(GCDeviceAdaptiveTriggersPayload *)v9 initWeaponWithStartPosition:v12 endPosition:v10 resistiveStrength:v11];
  [(GCDualSenseAdaptiveTrigger *)self sendAdaptiveTriggerPayload:v13];
}

- (void)setModeFeedbackWithResistiveStrengths:(GCDualSenseAdaptiveTriggerPositionalResistiveStrengths *)positionalResistiveStrengths
{
  _Q1 = vmaxnmq_f32(*(float32x4_t *)positionalResistiveStrengths->values, (float32x4_t)0);
  __asm { FMOV            V3.4S, #1.0 }
  int8x16_t v13 = vbslq_s8((int8x16_t)vcgtq_f32(_Q1, _Q3), (int8x16_t)_Q3, (int8x16_t)_Q1);
  float32x4_t v10 = vmaxnmq_f32(*(float32x4_t *)&positionalResistiveStrengths->values[4], (float32x4_t)0);
  int8x16_t v12 = vbslq_s8((int8x16_t)vcgtq_f32(v10, _Q3), (int8x16_t)_Q3, (int8x16_t)v10);
  *(float32x2_t *)v10.f32 = vmaxnm_f32(*(float32x2_t *)&positionalResistiveStrengths->values[8], 0);
  __asm { FMOV            V1.2S, #1.0 }
  v14[0] = v13;
  v14[1] = v12;
  int8x8_t v15 = vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v10.f32, *(float32x2_t *)_Q1.f32), *(int8x8_t *)_Q1.f32, *(int8x8_t *)v10.f32);
  id v11 = [[GCDeviceAdaptiveTriggersPayload alloc] initFeedbackWithResistiveStrengths:v14];
  [(GCDualSenseAdaptiveTrigger *)self sendAdaptiveTriggerPayload:v11];
}

- (void)setModeVibrationWithStartPosition:(float)startPosition amplitude:(float)amplitude frequency:(float)frequency
{
  double v9 = [GCDeviceAdaptiveTriggersPayload alloc];
  HIDWORD(v11) = 0;
  *(float *)&double v12 = fmaxf(startPosition, 0.0);
  if (*(float *)&v12 > 1.0) {
    *(float *)&double v12 = 1.0;
  }
  *(float *)&double v10 = fmaxf(amplitude, 0.0);
  if (*(float *)&v10 > 1.0) {
    *(float *)&double v10 = 1.0;
  }
  *(float *)&double v11 = fmaxf(frequency, 0.0);
  if (*(float *)&v11 > 1.0) {
    *(float *)&double v11 = 1.0;
  }
  id v13 = [(GCDeviceAdaptiveTriggersPayload *)v9 initVibrationWithStartPosition:v12 amplitude:v10 frequency:v11];
  [(GCDualSenseAdaptiveTrigger *)self sendAdaptiveTriggerPayload:v13];
}

- (void)setModeVibrationWithAmplitudes:(GCDualSenseAdaptiveTriggerPositionalAmplitudes *)positionalAmplitudes frequency:(float)frequency
{
  _Q1 = vmaxnmq_f32(*(float32x4_t *)positionalAmplitudes->values, (float32x4_t)0);
  __asm { FMOV            V3.4S, #1.0 }
  int8x16_t v15 = vbslq_s8((int8x16_t)vcgtq_f32(_Q1, _Q3), (int8x16_t)_Q3, (int8x16_t)_Q1);
  float32x4_t v12 = vmaxnmq_f32(*(float32x4_t *)&positionalAmplitudes->values[4], (float32x4_t)0);
  int8x16_t v14 = vbslq_s8((int8x16_t)vcgtq_f32(v12, _Q3), (int8x16_t)_Q3, (int8x16_t)v12);
  *(float32x2_t *)v12.f32 = vmaxnm_f32(*(float32x2_t *)&positionalAmplitudes->values[8], 0);
  __asm { FMOV            V1.2S, #1.0 }
  v16[0] = v15;
  v16[1] = v14;
  int8x8_t v17 = vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)_Q1.f32), *(int8x8_t *)_Q1.f32, *(int8x8_t *)v12.f32);
  id v13 = [[GCDeviceAdaptiveTriggersPayload alloc] initVibrationWithAmplitudes:v16 frequency:COERCE_DOUBLE(__PAIR64__(v14.u32[1], LODWORD(frequency)))];
  [(GCDualSenseAdaptiveTrigger *)self sendAdaptiveTriggerPayload:v13];
}

- (void)setModeOff
{
  id v3 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
  [(GCDualSenseAdaptiveTrigger *)self sendAdaptiveTriggerPayload:v3];
}

- (void)locateControllerManagerApp
{
  if (!self->_controllerManagerApp)
  {
    id v3 = [(GCControllerElement *)self device];
    objc_opt_class();
    long long v20 = 0u;
    long long v21 = 0u;
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    v5 = [v4 components];
    v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v11 conformsToProtocol:&unk_26D293850])
          {
            objc_storeStrong((id *)&self->_hidInfo, v11);

            goto LABEL_15;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

LABEL_15:
    hidInfo = self->_hidInfo;
    if (hidInfo
      && ([(GCControllerHIDInfo *)hidInfo registryID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      int8x16_t v14 = +[_GCControllerManager sharedInstance];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v16 = +[_GCControllerManager sharedInstance];
        p_super = &self->_controllerManagerApp->super.super;
        self->_controllerManagerApp = v16;
        goto LABEL_19;
      }
      if (!gc_isInternalBuild()) {
        goto LABEL_24;
      }
      p_super = getGCLogger();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_WORD *)v19 = 0;
      v18 = "Unable to _controllerManagerApp";
    }
    else
    {
      if (!gc_isInternalBuild()) {
        goto LABEL_24;
      }
      p_super = getGCLogger();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

LABEL_24:
        return;
      }
      *(_WORD *)v19 = 0;
      v18 = "Unable to locate _hidInfo || _hidInfo.registryID";
    }
    _os_log_impl(&dword_220998000, p_super, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
    goto LABEL_19;
  }
}

- (void)locateAdaptiveTriggerComponent
{
  p_adaptiveTriggers = &self->_adaptiveTriggers;
  if (!self->_adaptiveTriggers)
  {
    v4 = [(GCControllerElement *)self device];
    objc_opt_class();
    long long v15 = 0u;
    long long v16 = 0u;
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    long long v17 = 0uLL;
    long long v18 = 0uLL;
    v6 = [v5 components];
    uint64_t v7 = (void *)[v6 copy];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          float32x4_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v12 conformsToProtocol:&unk_26D29E068])
          {
            objc_storeStrong((id *)p_adaptiveTriggers, v12);
            [(GCDualSenseAdaptiveTrigger *)self observeChangesForAdaptiveTriggers:*p_adaptiveTriggers];
            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    if (!*p_adaptiveTriggers && gc_isInternalBuild())
    {
      id v13 = getGCLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int8x16_t v14 = 0;
        _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_DEFAULT, "Unable to locate GCAdaptiveTriggers", v14, 2u);
      }
    }
  }
}

- (void)sendAdaptiveTriggerPayload:(id)a3
{
  id v7 = a3;
  [(GCDualSenseAdaptiveTrigger *)self locateAdaptiveTriggerComponent];
  adaptiveTriggers = self->_adaptiveTriggers;
  if (adaptiveTriggers)
  {
    if (self->_index) {
      [(GCAdaptiveTriggers *)adaptiveTriggers rightTrigger];
    }
    else {
    v5 = [(GCAdaptiveTriggers *)adaptiveTriggers leftTrigger];
    }
    if (([v5 isEqual:v7] & 1) == 0)
    {
      v6 = self->_adaptiveTriggers;
      if (self->_index) {
        [(GCAdaptiveTriggers *)v6 setRightTrigger:v7];
      }
      else {
        [(GCAdaptiveTriggers *)v6 setLeftTrigger:v7];
      }
    }
  }
}

- (void)sendAdaptiveTriggerPayloadDict:(id)a3
{
  id v8 = a3;
  [(GCDualSenseAdaptiveTrigger *)self locateControllerManagerApp];
  controllerManagerApp = self->_controllerManagerApp;
  if (controllerManagerApp)
  {
    v5 = [(GCControllerHIDInfo *)self->_hidInfo registryID];
    [(_GCControllerManagerAppClient *)controllerManagerApp setProperty:v8 forKey:@"AdaptiveTriggerPayload" forHIDServiceClientWithRegistryID:v5];

    LODWORD(v5) = self->_index;
    adaptiveTriggers = self->_adaptiveTriggers;
    id v7 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
    if (v5) {
      [(GCAdaptiveTriggers *)adaptiveTriggers setRightTrigger:v7];
    }
    else {
      [(GCAdaptiveTriggers *)adaptiveTriggers setLeftTrigger:v7];
    }
  }
}

- (void)observeChangesForAdaptiveTriggers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_index) {
      v5 = @"rightStatus";
    }
    else {
      v5 = @"leftStatus";
    }
    id v6 = v4;
    [v4 addObserver:self forKeyPath:v5 options:0 context:0];
    id v4 = v6;
  }
}

- (void)stopObservingChangesForAdaptiveTriggers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_index) {
      v5 = @"rightStatus";
    }
    else {
      v5 = @"leftStatus";
    }
    id v6 = v4;
    [v4 removeObserver:self forKeyPath:v5];
    id v4 = v6;
  }
}

- (void)updateStatus
{
  int index = self->_index;
  adaptiveTriggers = self->_adaptiveTriggers;
  if (index) {
    [(GCAdaptiveTriggers *)adaptiveTriggers rightStatus];
  }
  else {
  id v16 = [(GCAdaptiveTriggers *)adaptiveTriggers leftStatus];
  }
  v5 = [v16 mode];
  unsigned int v6 = [v5 unsignedIntValue];

  if ([(GCDualSenseAdaptiveTrigger *)self mode] != v6) {
    [(GCDualSenseAdaptiveTrigger *)self setMode:v6];
  }
  id v7 = [v16 armPosition];
  float v8 = (float)[v7 unsignedIntValue] / 9.0;

  [(GCDualSenseAdaptiveTrigger *)self armPosition];
  if (v8 != *(float *)&v9)
  {
    *(float *)&double v9 = v8;
    [(GCDualSenseAdaptiveTrigger *)self setArmPosition:v9];
  }
  uint64_t v10 = [v16 status];
  char v11 = [v10 unsignedIntValue];

  switch([(GCDualSenseAdaptiveTrigger *)self mode])
  {
    case GCDualSenseAdaptiveTriggerModeFeedback:
      uint64_t v12 = v11 == 1;
      break;
    case GCDualSenseAdaptiveTriggerModeWeapon:
      uint64_t v13 = 2;
      if (v11 == 2) {
        uint64_t v13 = 4;
      }
      BOOL v14 = v11 == 1;
      uint64_t v15 = 3;
      goto LABEL_20;
    case GCDualSenseAdaptiveTriggerModeVibration:
      if (v11 == 1) {
        uint64_t v12 = 6;
      }
      else {
        uint64_t v12 = 5;
      }
      break;
    case GCDualSenseAdaptiveTriggerModeSlopeFeedback:
      uint64_t v13 = 7;
      if (v11 == 2) {
        uint64_t v13 = 9;
      }
      BOOL v14 = v11 == 1;
      uint64_t v15 = 8;
LABEL_20:
      if (v14) {
        uint64_t v12 = v15;
      }
      else {
        uint64_t v12 = v13;
      }
      break;
    default:
      uint64_t v12 = -1;
      break;
  }
  if (v12 != [(GCDualSenseAdaptiveTrigger *)self status]) {
    [(GCDualSenseAdaptiveTrigger *)self setStatus:v12];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  char v11 = v10;
  if (self->_adaptiveTriggers == a4)
  {
    if (([v10 isEqualToString:@"leftStatus"] & 1) != 0
      || [v11 isEqualToString:@"rightStatus"])
    {
      [(GCDualSenseAdaptiveTrigger *)self updateStatus];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)GCDualSenseAdaptiveTrigger;
    [(GCDualSenseAdaptiveTrigger *)&v12 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (GCDualSenseAdaptiveTriggerMode)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (GCDualSenseAdaptiveTriggerStatus)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (float)armPosition
{
  return self->_armPosition;
}

- (void)setArmPosition:(float)a3
{
  self->_armPosition = a3;
}

- (int)index
{
  return self->_index;
}

- (void)setIndex:(int)a3
{
  self->_int index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptiveTriggers, 0);
  objc_storeStrong((id *)&self->_hidInfo, 0);

  objc_storeStrong((id *)&self->_controllerManagerApp, 0);
}

@end