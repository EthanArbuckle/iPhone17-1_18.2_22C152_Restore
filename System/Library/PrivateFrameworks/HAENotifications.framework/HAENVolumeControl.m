@interface HAENVolumeControl
+ (id)sharedInstance;
- ($C4267C7EEAC0F1C362AD94E813CFAD30)getStats;
- (BOOL)PME_enabled;
- (BOOL)_RLSAllowsMXVolumeLimit;
- (HAENVolumeControl)init;
- (float)computeLimitedVolume:(float)a3 event:(id)a4 action:(unsigned int *)a5;
- (float)getCurrentVolumeForCategory:(__CFString *)a3 route:(id *)a4;
- (unsigned)limitVolume:(id)a3;
- (void)_fetchCategory:(__CFString *)a3 routeInfo:(id *)a4;
- (void)_setMXVolumeLimit:(BOOL)a3;
- (void)_updateFlags;
- (void)_updateMXVolumeLimit;
- (void)applyVolumeLoweringAtNextSession;
- (void)limitVolumeTo:(float)a3 category:(__CFString *)a4 route:(id *)a5 actionResult:(unsigned int *)a6;
- (void)setDeviceInfo:(id)a3;
- (void)updateMXVolumeLimitStatus;
- (void)wiredHeadphoneConnected:(BOOL)a3;
@end

@implementation HAENVolumeControl

+ (id)sharedInstance
{
  if (+[HAENDefaults isCurrentProcessMediaserverd]
    && sharedInstance_once_2 != -1)
  {
    dispatch_once(&sharedInstance_once_2, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_instance_2;
  return v2;
}

uint64_t __35__HAENVolumeControl_sharedInstance__block_invoke()
{
  sharedInstance_instance_2 = objc_alloc_init(HAENVolumeControl);
  return MEMORY[0x270F9A758]();
}

- (HAENVolumeControl)init
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)HAENVolumeControl;
  v2 = [(HAENVolumeControl *)&v17 init];
  if (v2)
  {
    *((_DWORD *)v2 + 2) = getpid();
    *((_DWORD *)v2 + 10) = 0;
    v3 = +[HAENDefaults sharedInstance];
    v2[12] = [v3 isEUVolumeLimitOn];

    v4 = +[HAENDefaults sharedInstance];
    v2[13] = [v4 isSKVolumeLimitOn];

    v5 = HAENotificationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [NSNumber numberWithBool:v2[12]];
      v7 = [NSNumber numberWithBool:v2[13]];
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "HAENVolumeControl: EU VLT [%@], South Korea VLT [%@]", buf, 0x16u);
    }
    id v8 = objc_alloc_init(MEMORY[0x263F28C30]);
    v9 = [v8 getPreferenceFor:*MEMORY[0x263F28C08]];
    v2[15] = [v9 BOOLValue];

    v2[16] = 0;
    __asm { FMOV            V0.2S, #-1.0 }
    *(void *)(v2 + 20) = _D0;
    v2[44] = 0;
    [v2 _updateFlags];
    if (v2[12]) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = v2[13] != 0;
    }
    [v2 _setMXVolumeLimit:v15];
  }
  return (HAENVolumeControl *)v2;
}

- (float)computeLimitedVolume:(float)a3 event:(id)a4 action:(unsigned int *)a5
{
  unsigned int v8 = 1986817143;
  if ([a4 eventType] == 1818850917)
  {
    v9 = +[HAENDefaults sharedInstance];
    [v9 volumeReductionDelta];
    double v11 = v10;

    double v12 = a3 - v11;
  }
  else
  {
    if ([(HAENVolumeControl *)self PME_enabled])
    {
      float targetVolume80dB = 0.5;
      float targetVolume74dB = 0.38;
    }
    else
    {
      float targetVolume80dB = self->_targetVolume80dB;
      if (targetVolume80dB <= 0.0 || (float targetVolume74dB = self->_targetVolume74dB, targetVolume74dB <= 0.0))
      {
        BOOL v15 = +[HAENUnknownDeviceManager sharedInstance];
        int v16 = [v15 unknownWiredHeadsetConnectedThroughB204];

        float targetVolume74dB = 0.5;
        if (!v16) {
          float targetVolume74dB = 0.56;
        }
        float targetVolume80dB = 0.63;
        if (v16) {
          float targetVolume80dB = 0.59;
        }
      }
    }
    if (targetVolume74dB > a3) {
      float targetVolume74dB = a3;
    }
    if (a3 + -0.001 <= targetVolume80dB) {
      float targetVolume80dB = targetVolume74dB;
    }
    double v12 = targetVolume80dB;
    if (v12 + 0.001 >= a3) {
      unsigned int v8 = 1986814576;
    }
    else {
      unsigned int v8 = 1986817143;
    }
  }
  *a5 = v8;
  return fmin(fmax(v12, 0.0), 1.0);
}

- (float)getCurrentVolumeForCategory:(__CFString *)a3 route:(id *)a4
{
  -[HAENVolumeControl _fetchCategory:routeInfo:](self, "_fetchCategory:routeInfo:");
  if (!CMSessionManagerPerformVolumeOperationWithSequenceNumber()) {
    return -1.0;
  }
  v4 = HAENotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[HAENVolumeControl getCurrentVolumeForCategory:route:]();
  }

  return -1.0;
}

- (void)applyVolumeLoweringAtNextSession
{
  if (self->_lowerHeadphoneVolumeAtNextSession)
  {
    self->_lowerHeadphoneVolumeAtNextSession = 0;
    v2 = dispatch_get_global_queue(25, 0);
    dispatch_async(v2, &__block_literal_global_6);
  }
}

void __53__HAENVolumeControl_applyVolumeLoweringAtNextSession__block_invoke(double a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  LODWORD(a1) = 1057618919;
  [MEMORY[0x263F544F0] applyVolumeReductionToHeadphoneRoutes:a1];
  v1 = HAENotificationsLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 134217984;
    uint64_t v3 = 0x3FE13F7CED916873;
    _os_log_impl(&dword_21FABA000, v1, OS_LOG_TYPE_DEFAULT, "headphone volume will be lowered to %.2f at the next session", (uint8_t *)&v2, 0xCu);
  }
}

- (unsigned)limitVolume:(id)a3
{
  uint64_t v4 = HAENotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "headphone volume lowering will be delayed", v6, 2u);
  }

  self->_lowerHeadphoneVolumeAtNextSession = 1;
  return 1986814576;
}

- (void)limitVolumeTo:(float)a3 category:(__CFString *)a4 route:(id *)a5 actionResult:(unsigned int *)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v9 = HAENotificationsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v14 = a3;
    __int16 v15 = 2112;
    double v16 = *(double *)&a4;
    _os_log_impl(&dword_21FABA000, v9, OS_LOG_TYPE_DEFAULT, ">>> limiting volume to %.2f for category %@, ", buf, 0x16u);
  }

  int v10 = CMSessionManagerPerformVolumeOperationWithSequenceNumber();
  double v11 = HAENotificationsLog();
  double v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HAENVolumeControl limitVolumeTo:category:route:actionResult:]();
    }

    *a6 = 561409132;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v14 = *(double *)&a4;
      __int16 v15 = 2048;
      double v16 = a3;
      _os_log_impl(&dword_21FABA000, v12, OS_LOG_TYPE_DEFAULT, "========> SET %@ volume to: %.2f", buf, 0x16u);
    }
  }
}

- (void)_fetchCategory:(__CFString *)a3 routeInfo:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CMSessionMgrCopyDeviceRouteForRouteConfiguration();
  v6 = HAENotificationsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a4->var0;
    var1 = a4->var1;
    var2 = a4->var2;
    int v10 = 138413058;
    double v11 = a3;
    __int16 v12 = 2112;
    v13 = var0;
    __int16 v14 = 2112;
    __int16 v15 = var1;
    __int16 v16 = 2112;
    uint64_t v17 = var2;
    _os_log_impl(&dword_21FABA000, v6, OS_LOG_TYPE_DEFAULT, ">>> category '%@', route: '%@', device: '%@', route subtype: '%@'", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)_updateFlags
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[HAENDefaults sharedInstance];
  self->_haenFeatureEnabled = [v3 isHAENFeatureEnabled];

  uint64_t v4 = HAENotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [NSNumber numberWithBool:self->_haenFeatureEnabled];
    v6 = [NSNumber numberWithBool:self->_wiredHeadphoneConnected];
    int v7 = 138412546;
    unsigned int v8 = v5;
    __int16 v9 = 2112;
    int v10 = v6;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "HAENVolumeControl: HAEN Feature [%@], wired headphone connected[%@]", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_setMXVolumeLimit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_mxVolumeLimitOn = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F28C30]);
  uint64_t v5 = *MEMORY[0x263F28C08];
  v6 = [NSNumber numberWithBool:v3];
  id v7 = (id)[v4 setPreferenceFor:v5 value:v6];

  unsigned int v8 = HAENotificationsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = "OFF";
    if (v3) {
      __int16 v9 = "ON";
    }
    int v10 = 136315138;
    uint64_t v11 = v9;
    _os_log_impl(&dword_21FABA000, v8, OS_LOG_TYPE_DEFAULT, "*** set MX VLT Status to [%s]", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)_RLSAllowsMXVolumeLimit
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = +[HAENDefaults sharedInstance];
  uint64_t v3 = [v2 isReduceLoudSoundEnabled];

  id v4 = +[HAENDefaults sharedInstance];
  int v5 = [v4 getReduceLoudSoundThreshold];

  v6 = HAENotificationsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithBool:v3];
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl(&dword_21FABA000, v6, OS_LOG_TYPE_DEFAULT, "RLS volume limit %@, threshold %d", (uint8_t *)&v9, 0x12u);
  }
  if (v5 > 99) {
    return 1;
  }
  else {
    return v3 ^ 1;
  }
}

- (void)updateMXVolumeLimitStatus
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HAENVolumeControl *)self _updateFlags];
  [(HAENVolumeControl *)self _updateMXVolumeLimit];
  os_unfair_lock_unlock(p_lock);
}

- (void)_updateMXVolumeLimit
{
  if (self->_wiredHeadphoneConnected
    && (self->_haenFeatureEnabled || self->_EUVolumeLimitFlagOn || self->_SKVolumeLimitFlagOn)
    && [(HAENVolumeControl *)self _RLSAllowsMXVolumeLimit])
  {
    if (self->_mxVolumeLimitOn)
    {
      uint64_t v3 = HAENotificationsLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = 0;
        id v4 = "mx volume limit is already on";
        int v5 = (uint8_t *)&v9;
LABEL_16:
        _os_log_impl(&dword_21FABA000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    v6 = self;
    uint64_t v7 = 1;
  }
  else
  {
    if (!self->_mxVolumeLimitOn)
    {
      uint64_t v3 = HAENotificationsLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = 0;
        id v4 = "mx volume limit is already off";
        int v5 = (uint8_t *)&v8;
        goto LABEL_16;
      }
LABEL_17:

      return;
    }
    v6 = self;
    uint64_t v7 = 0;
  }
  [(HAENVolumeControl *)v6 _setMXVolumeLimit:v7];
}

- (void)wiredHeadphoneConnected:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_wiredHeadphoneConnected = a3;
  [(HAENVolumeControl *)self _updateFlags];
  [(HAENVolumeControl *)self _updateMXVolumeLimit];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)PME_enabled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (objc_opt_class())
  {
    int v2 = [MEMORY[0x263F5D460] sharedInstance];
    if ([v2 personalMediaEnabled])
    {
      uint64_t v3 = [MEMORY[0x263F5D460] sharedInstance];
      unint64_t v4 = ((unint64_t)[v3 personalAudioAccommodationTypes] >> 2) & 1;
    }
    else
    {
      LODWORD(v4) = 0;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }
  int v5 = HAENotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "OFF";
    if (v4) {
      v6 = "ON";
    }
    int v8 = 136315138;
    __int16 v9 = v6;
    _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "PME status: %s", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (void)setDeviceInfo:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  __asm { FMOV            V0.2S, #-1.0 }
  *(void *)&self->_double targetVolume80dB = _D0;
  if (v4)
  {
    __int16 v9 = [v4 objectForKey:@"_HAENMITSV80DB"];
    uint64_t v10 = [v4 objectForKey:@"_HAENMITSV74DB"];
    __int16 v11 = v10;
    if (v10) {
      _ZF = v9 == 0;
    }
    else {
      _ZF = 1;
    }
    if (!_ZF)
    {
      [v10 floatValue];
      self->_double targetVolume74dB = v13;
      [v9 floatValue];
      self->_double targetVolume80dB = v14;
      __int16 v15 = HAENotificationsLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        double targetVolume80dB = self->_targetVolume80dB;
        double targetVolume74dB = self->_targetVolume74dB;
        int v18 = 134218240;
        double v19 = targetVolume80dB;
        __int16 v20 = 2048;
        double v21 = targetVolume74dB;
        _os_log_impl(&dword_21FABA000, v15, OS_LOG_TYPE_DEFAULT, "setting target scalar 80dB volume: %.2f, scalar 74dB volume: %.2f", (uint8_t *)&v18, 0x16u);
      }
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- ($C4267C7EEAC0F1C362AD94E813CFAD30)getStats
{
  int v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = *(void *)&v2->_stats.currVolume;
  LODWORD(v2) = v2->_stats.volumeAction;
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = v4;
  unsigned int v6 = v2;
  result.var0 = *(float *)&v5;
  result.var1 = *((float *)&v5 + 1);
  result.var2 = v6;
  return result;
}

- (void)getCurrentVolumeForCategory:route:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21FABA000, v0, v1, "failed to get %@ volume %lld");
}

- (void)limitVolumeTo:category:route:actionResult:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21FABA000, v0, v1, "failed to SET %@ volume %lld");
}

@end