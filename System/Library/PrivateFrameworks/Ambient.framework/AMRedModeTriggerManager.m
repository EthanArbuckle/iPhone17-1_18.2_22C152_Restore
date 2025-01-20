@interface AMRedModeTriggerManager
- (AMRedModeTriggerManager)init;
- (AMRedModeTriggerManager)initWithContext:(id)a3;
- (BOOL)isRedModeDetectionEnabled;
- (BOOL)isRedModeTriggered;
- (id)_getNewAmbientIlluminationTrigger;
- (void)_setRedModeTriggered:(BOOL)a3;
- (void)_updateTriggerState;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setRedModeDetectionEnabled:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation AMRedModeTriggerManager

- (AMRedModeTriggerManager)init
{
  return [(AMRedModeTriggerManager *)self initWithContext:0];
}

- (AMRedModeTriggerManager)initWithContext:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMRedModeTriggerManager;
  v6 = [(AMRedModeTriggerManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_initializationContext, a3);
    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    uint64_t v10 = +[AMRedModeDomain rootSettings];
    redModeSettings = v7->_redModeSettings;
    v7->_redModeSettings = (AMRedModeSettings *)v10;

    [(PTSettings *)v7->_redModeSettings addKeyObserver:v7];
  }

  return v7;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)setRedModeDetectionEnabled:(BOOL)a3
{
  if (self->_redModeDetectionEnabled != a3)
  {
    self->_redModeDetectionEnabled = a3;
    if (a3)
    {
      v4 = [(AMRedModeTriggerManager *)self _getNewAmbientIlluminationTrigger];
      ambientIlluminationTrigger = self->_ambientIlluminationTrigger;
      self->_ambientIlluminationTrigger = v4;

      [(AMAmbientIlluminationTrigger *)self->_ambientIlluminationTrigger setDelegate:self];
      v6 = self->_ambientIlluminationTrigger;
      [(AMRedModeSettings *)self->_redModeSettings onLuxThreshold];
      -[AMAmbientIlluminationTrigger setActivationThresholdLux:](v6, "setActivationThresholdLux:");
      v7 = self->_ambientIlluminationTrigger;
      [(AMRedModeSettings *)self->_redModeSettings offLuxThreshold];
      -[AMAmbientIlluminationTrigger setDeactivationThresholdLux:](v7, "setDeactivationThresholdLux:");
      [(AMRedModeTriggerManager *)self _updateTriggerState];
    }
    else
    {
      [(AMAmbientIlluminationTrigger *)self->_ambientIlluminationTrigger setDelegate:0];
      uint64_t v8 = self->_ambientIlluminationTrigger;
      self->_ambientIlluminationTrigger = 0;

      [(AMRedModeTriggerManager *)self _setRedModeTriggered:0];
    }
  }
}

- (void)_setRedModeTriggered:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_redModeTriggered != a3)
  {
    self->_redModeTriggered = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = self->_observers;
    uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "redModeTriggerManager:didUpdateRedModeTriggeredState:", self, self->_redModeTriggered, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_redModeSettings == a3)
  {
    long long v10 = v6;
    if ([v6 isEqualToString:@"onLuxThreshold"])
    {
      ambientIlluminationTrigger = self->_ambientIlluminationTrigger;
      [(AMRedModeSettings *)self->_redModeSettings onLuxThreshold];
      id v6 = (id)-[AMAmbientIlluminationTrigger setActivationThresholdLux:](ambientIlluminationTrigger, "setActivationThresholdLux:");
    }
    else
    {
      id v6 = (id)[v10 isEqualToString:@"offLuxThreshold"];
      id v7 = v10;
      if (!v6) {
        goto LABEL_7;
      }
      long long v9 = self->_ambientIlluminationTrigger;
      [(AMRedModeSettings *)self->_redModeSettings offLuxThreshold];
      id v6 = (id)-[AMAmbientIlluminationTrigger setDeactivationThresholdLux:](v9, "setDeactivationThresholdLux:");
    }
    id v7 = v10;
  }
LABEL_7:
  MEMORY[0x270F9A758](v6, v7);
}

- (void)_updateTriggerState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = [(AMAmbientIlluminationTrigger *)self->_ambientIlluminationTrigger isTriggered];
  v4 = AMLogRedMode();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109376;
    v5[1] = v3;
    __int16 v6 = 1024;
    BOOL v7 = v3;
    _os_log_impl(&dword_24782A000, v4, OS_LOG_TYPE_DEFAULT, "Red mode should trigger: %{BOOL}u [ isDarkEnvironment : %{BOOL}u ]", (uint8_t *)v5, 0xEu);
  }

  [(AMRedModeTriggerManager *)self _setRedModeTriggered:v3];
}

- (id)_getNewAmbientIlluminationTrigger
{
  v2 = [(AMRedModeTriggerManagerContext *)self->_initializationContext ambientIlluminationTrigger];
  if (!v2) {
    v2 = objc_alloc_init(AMAmbientIlluminationTrigger);
  }
  return v2;
}

- (BOOL)isRedModeDetectionEnabled
{
  return self->_redModeDetectionEnabled;
}

- (BOOL)isRedModeTriggered
{
  return self->_redModeTriggered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_redModeSettings, 0);
  objc_storeStrong((id *)&self->_ambientIlluminationTrigger, 0);
  objc_storeStrong((id *)&self->_initializationContext, 0);
}

@end