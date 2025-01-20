@interface VideoEffects
- (BOOL)enabled;
- (BOOL)isAvailable;
- (VideoEffects)initWithVideoEffectsModule:(id)a3;
- (float)intensity;
- (int64_t)controlMode;
- (void)postNotificationWithBundleID:(id)a3;
- (void)setControlMode:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIntensity:(float)a3;
- (void)setIntensity:(float)a3 withBundleID:(id)a4;
- (void)setIsAvailable:(BOOL)a3;
- (void)setState:(BOOL)a3 withBundleID:(id)a4;
- (void)updateAvailabilityWithBundleID:(id)a3;
- (void)updateControlModeWithBundleID:(id)a3;
- (void)updateEnabledWithBundleID:(id)a3;
- (void)updateIntensityWithBundleID:(id)a3;
- (void)updateVideoEffectStatesWithBundleID:(id)a3;
@end

@implementation VideoEffects

- (VideoEffects)initWithVideoEffectsModule:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VideoEffects;
  v6 = [(VideoEffects *)&v9 init];
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_isAvailable = 0;
    v6->_intensity = 0.0;
    v6->_controlMode = 0;
    objc_storeStrong((id *)&v6->_videoEffect, a3);
  }

  return v7;
}

- (void)updateVideoEffectStatesWithBundleID:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    v6 = "-[VideoEffects updateVideoEffectStatesWithBundleID:]";
    __int16 v7 = 1024;
    int v8 = 27;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  [(VideoEffects *)self updateControlModeWithBundleID:v4];
  [(VideoEffects *)self updateEnabledWithBundleID:v4];
  [(VideoEffects *)self updateAvailabilityWithBundleID:v4];
  [(VideoEffects *)self updateIntensityWithBundleID:v4];
}

- (void)updateControlModeWithBundleID:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    v6 = "-[VideoEffects updateControlModeWithBundleID:]";
    __int16 v7 = 1024;
    int v8 = 35;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  self->_controlMode = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
}

- (void)updateEnabledWithBundleID:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    v6 = "-[VideoEffects updateEnabledWithBundleID:]";
    __int16 v7 = 1024;
    int v8 = 40;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  self->_enabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
}

- (void)updateAvailabilityWithBundleID:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    v6 = "-[VideoEffects updateAvailabilityWithBundleID:]";
    __int16 v7 = 1024;
    int v8 = 45;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  self->_isAvailable = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
}

- (void)updateIntensityWithBundleID:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    videoEffect = self->_videoEffect;
    int v16 = 136446722;
    v17 = "-[VideoEffects updateIntensityWithBundleID:]";
    __int16 v18 = 1024;
    int v19 = 50;
    __int16 v20 = 2112;
    v21 = videoEffect;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@", (uint8_t *)&v16, 0x1Cu);
  }
  if ([(NSString *)self->_videoEffect isEqualToString:AVControlCenterVideoEffectBackgroundBlur])
  {
    AVControlCenterVideoEffectsModuleGetEffectIntensityRangeForBundleID();
    double v7 = v6;
    double v9 = v8;
    AVControlCenterVideoEffectsModuleGetEffectIntensityForBundleID();
    if (v9 != v7)
    {
      double v11 = v9 - v10;
LABEL_10:
      float v15 = v11 / (v9 - v7);
      self->_intensity = v15;
    }
  }
  else if ([(NSString *)self->_videoEffect isEqualToString:AVControlCenterVideoEffectStudioLighting])
  {
    AVControlCenterVideoEffectsModuleGetEffectIntensityRangeForBundleID();
    double v7 = v12;
    double v9 = v13;
    AVControlCenterVideoEffectsModuleGetEffectIntensityForBundleID();
    if (v9 != v7)
    {
      double v11 = v14 - v7;
      goto LABEL_10;
    }
  }
}

- (void)setIntensity:(float)a3 withBundleID:(id)a4
{
  id v6 = a4;
  AVControlCenterVideoEffectsModuleGetEffectIntensityRangeForBundleID();
  double v8 = v7;
  double v10 = v9;
  double v11 = v9 - v7;
  double v12 = v7 + (v9 - v7) * a3;
  unsigned int v13 = [(NSString *)self->_videoEffect isEqualToString:AVControlCenterVideoEffectBackgroundBlur];
  double v14 = v10 - v11 * a3;
  if (!v13) {
    double v14 = v12;
  }
  float v15 = v14;
  AVControlCenterVideoEffectsModuleGetEffectIntensityDefaultValueForBundleID();
  if (__RPLogLevel <= 1u)
  {
    float v17 = v16;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      videoEffect = self->_videoEffect;
      int v19 = 136447746;
      __int16 v20 = "-[VideoEffects setIntensity:withBundleID:]";
      __int16 v21 = 1024;
      int v22 = 75;
      __int16 v23 = 2048;
      double v24 = v15;
      __int16 v25 = 2112;
      v26 = videoEffect;
      __int16 v27 = 2048;
      double v28 = v8;
      __int16 v29 = 2048;
      double v30 = v10;
      __int16 v31 = 2048;
      double v32 = v17;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting intensity %f for effect %@. range min %f max %f. default %f", (uint8_t *)&v19, 0x44u);
    }
  }
  AVControlCenterVideoEffectsModuleSetEffectIntensityForBundleID();
  self->_intensity = a3;
  [(VideoEffects *)self postNotificationWithBundleID:v6];
}

- (void)setState:(BOOL)a3 withBundleID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446978;
    double v8 = "-[VideoEffects setState:withBundleID:]";
    __int16 v9 = 1024;
    int v10 = 82;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d state=%d bundleID=%@", (uint8_t *)&v7, 0x22u);
  }
  AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID();
  [(VideoEffects *)self postNotificationWithBundleID:v6];
}

- (void)postNotificationWithBundleID:(id)a3
{
  id v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v11 = "-[VideoEffects postNotificationWithBundleID:]";
    __int16 v12 = 1024;
    int v13 = 88;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  uint64_t v8 = AVControlCenterModulesNotificationBundleIdentifierKey;
  id v9 = v3;
  BOOL v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v5 = objc_alloc((Class)NSNotification);
  id v6 = [v5 initWithName:AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification object:0 userInfo:v4];
  int v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotification:v6];
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (float)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(float)a3
{
  self->_intensity = a3;
}

- (int64_t)controlMode
{
  return self->_controlMode;
}

- (void)setControlMode:(int64_t)a3
{
  self->_controlMode = a3;
}

- (void).cxx_destruct
{
}

@end