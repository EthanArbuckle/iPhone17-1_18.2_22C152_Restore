@interface AMAmbientIlluminationTrigger
- (AMAmbientIlluminationTrigger)init;
- (AMAmbientIlluminationTrigger)initWithBrightnessSystemClient:(id)a3;
- (AMAmbientIlluminationTriggerDelegate)delegate;
- (BOOL)isTriggered;
- (double)_ambientLux;
- (double)_effectiveDeactivationThresholdLux;
- (double)activationThresholdLux;
- (double)deactivationThresholdLux;
- (void)_evaluateTrigger;
- (void)_setAmbientLux:(double)a3;
- (void)_setTriggered:(BOOL)a3;
- (void)setActivationThresholdLux:(double)a3;
- (void)setDeactivationThresholdLux:(double)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AMAmbientIlluminationTrigger

- (AMAmbientIlluminationTrigger)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F34238]);
  v4 = [(AMAmbientIlluminationTrigger *)self initWithBrightnessSystemClient:v3];

  return v4;
}

- (AMAmbientIlluminationTrigger)initWithBrightnessSystemClient:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMAmbientIlluminationTrigger;
  v6 = [(AMAmbientIlluminationTrigger *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_brightnessSystemClient, a3);
    objc_initWeak(&location, v7);
    brightnessSystemClient = v7->_brightnessSystemClient;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __63__AMAmbientIlluminationTrigger_initWithBrightnessSystemClient___block_invoke;
    v15 = &unk_265223480;
    objc_copyWeak(&v16, &location);
    [(BrightnessSystemClient *)brightnessSystemClient registerNotificationBlock:&v12 forProperties:&unk_26FBC9248];
    v9 = (void *)[(BrightnessSystemClient *)v7->_brightnessSystemClient copyPropertyForKey:@"TrustedLux", v12, v13, v14, v15];
    [v9 doubleValue];
    v7->_ambientLux = v10;
    *(int64x2_t *)&v7->_activationThresholdLux = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v7->_triggered = 0;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __63__AMAmbientIlluminationTrigger_initWithBrightnessSystemClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LODWORD(a1) = [v6 isEqualToString:@"TrustedLux"];

  if (a1)
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v5;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        double v10 = v9;
      }
      else {
        double v10 = 0;
      }
    }
    else
    {
      double v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      id v12 = WeakRetained;
      id v13 = v11;
      BSDispatchMain();
    }
  }
}

uint64_t __63__AMAmbientIlluminationTrigger_initWithBrightnessSystemClient___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) doubleValue];
  return objc_msgSend(v1, "_setAmbientLux:");
}

- (void)setActivationThresholdLux:(double)a3
{
  self->_activationThresholdLux = a3;
  [(AMAmbientIlluminationTrigger *)self _evaluateTrigger];
}

- (void)setDeactivationThresholdLux:(double)a3
{
  self->_deactivationThresholdLux = a3;
  [(AMAmbientIlluminationTrigger *)self _evaluateTrigger];
}

- (void)_setTriggered:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_triggered != a3)
  {
    self->_BOOL triggered = a3;
    v4 = AMLogRedMode();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL triggered = self->_triggered;
      double deactivationThresholdLux = self->_deactivationThresholdLux;
      double ambientLux = self->_ambientLux;
      double activationThresholdLux = self->_activationThresholdLux;
      v10[0] = 67109888;
      v10[1] = triggered;
      __int16 v11 = 2048;
      double v12 = ambientLux;
      __int16 v13 = 2048;
      double v14 = activationThresholdLux;
      __int16 v15 = 2048;
      double v16 = deactivationThresholdLux;
      _os_log_impl(&dword_24782A000, v4, OS_LOG_TYPE_DEFAULT, "ambient illumination trigger triggered: %{BOOL}u [ ambient lux: %f  on threshold: %f  off threshold: %f ]", (uint8_t *)v10, 0x26u);
    }

    id v9 = [(AMAmbientIlluminationTrigger *)self delegate];
    [v9 ambientIlluminationTrigger:self didUpdateTriggered:self->_triggered];
  }
}

- (double)_effectiveDeactivationThresholdLux
{
  [(AMAmbientIlluminationTrigger *)self activationThresholdLux];
  double v4 = v3;
  [(AMAmbientIlluminationTrigger *)self deactivationThresholdLux];
  if (v4 >= result) {
    return v4;
  }
  return result;
}

- (void)_setAmbientLux:(double)a3
{
  self->_double ambientLux = a3;
  [(AMAmbientIlluminationTrigger *)self _evaluateTrigger];
}

- (void)_evaluateTrigger
{
  [(AMAmbientIlluminationTrigger *)self _ambientLux];
  double v4 = v3;
  if (self->_triggered)
  {
    [(AMAmbientIlluminationTrigger *)self _effectiveDeactivationThresholdLux];
LABEL_3:
    if (v4 <= v5) {
      return;
    }
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  [(AMAmbientIlluminationTrigger *)self activationThresholdLux];
  double v8 = v7;
  if (self->_triggered)
  {
    [(AMAmbientIlluminationTrigger *)self _effectiveDeactivationThresholdLux];
    if (v4 > v8) {
      goto LABEL_3;
    }
  }
  else if (v4 > v7)
  {
    return;
  }
  uint64_t v6 = 1;
LABEL_10:
  [(AMAmbientIlluminationTrigger *)self _setTriggered:v6];
}

- (double)activationThresholdLux
{
  return self->_activationThresholdLux;
}

- (double)deactivationThresholdLux
{
  return self->_deactivationThresholdLux;
}

- (BOOL)isTriggered
{
  return self->_triggered;
}

- (double)_ambientLux
{
  return self->_ambientLux;
}

- (AMAmbientIlluminationTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMAmbientIlluminationTriggerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
}

@end