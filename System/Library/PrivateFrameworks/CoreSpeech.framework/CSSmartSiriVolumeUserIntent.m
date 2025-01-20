@interface CSSmartSiriVolumeUserIntent
- (BOOL)permanentOffsetIsEnabled;
- (CSSmartSiriVolumeUserIntent)initWithStoredInformationAndAsset:(id)a3;
- (double)applyLowerAndUpperBoundsToVolume:(float)a3;
- (double)applyLowerAndUpperBoundsToVolumeOffset:(float)a3;
- (float)decreaseSiriVolumeBasedOnUserIntent;
- (float)increaseSiriVolumeBasedOnUserIntent;
- (float)latestVolume;
- (float)permanentOffsetFactor;
- (float)userIntentVolume;
- (int64_t)latestVolumeTime;
- (int64_t)userIntentTime;
- (unint64_t)userIntentType;
- (unint64_t)userIntentValidForSeconds;
- (void)setLatestVolume:(float)a3;
- (void)setLatestVolumeTime:(int64_t)a3;
- (void)setPermanentOffsetFactor:(float)a3;
- (void)setPermanentOffsetIsEnabled:(BOOL)a3;
- (void)setUserIntentTime:(int64_t)a3;
- (void)setUserIntentType:(unint64_t)a3;
- (void)setUserIntentValidForSeconds:(unint64_t)a3;
- (void)setUserIntentVolume:(float)a3;
- (void)storeASVStateInformation;
@end

@implementation CSSmartSiriVolumeUserIntent

- (void)setPermanentOffsetIsEnabled:(BOOL)a3
{
  self->_permanentOffsetIsEnabled = a3;
}

- (BOOL)permanentOffsetIsEnabled
{
  return self->_permanentOffsetIsEnabled;
}

- (void)setPermanentOffsetFactor:(float)a3
{
  self->_permanentOffsetFactor = a3;
}

- (float)permanentOffsetFactor
{
  return self->_permanentOffsetFactor;
}

- (void)setLatestVolume:(float)a3
{
  self->_latestVolume = a3;
}

- (float)latestVolume
{
  return self->_latestVolume;
}

- (void)setUserIntentVolume:(float)a3
{
  self->_userIntentVolume = a3;
}

- (float)userIntentVolume
{
  return self->_userIntentVolume;
}

- (void)setLatestVolumeTime:(int64_t)a3
{
  self->_latestVolumeTime = a3;
}

- (int64_t)latestVolumeTime
{
  return self->_latestVolumeTime;
}

- (void)setUserIntentTime:(int64_t)a3
{
  self->_userIntentTime = a3;
}

- (int64_t)userIntentTime
{
  return self->_userIntentTime;
}

- (void)setUserIntentValidForSeconds:(unint64_t)a3
{
  self->_userIntentValidForSeconds = a3;
}

- (unint64_t)userIntentValidForSeconds
{
  return self->_userIntentValidForSeconds;
}

- (void)setUserIntentType:(unint64_t)a3
{
  self->_userIntentType = a3;
}

- (unint64_t)userIntentType
{
  return self->_userIntentType;
}

- (double)applyLowerAndUpperBoundsToVolumeOffset:(float)a3
{
  double v3 = fminf(fmaxf(a3, self->kSSVCAUserIntentPermanentOffsetFactorLowerBound), self->kSSVCAUserIntentPermanentOffsetFactorUpperBound);
  v4 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSSmartSiriVolumeUserIntent applyLowerAndUpperBoundsToVolumeOffset:]";
    __int16 v8 = 2050;
    double v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s TTS volume offset post lower and upper bounds is: %{public}f", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (void)storeASVStateInformation
{
  id v3 = +[CSFPreferences sharedPreferences];
  [v3 setASVUserIntent:self];
}

- (float)decreaseSiriVolumeBasedOnUserIntent
{
  *(float *)&double v2 = self->_latestVolume * self->kSSVCAUserIntentVolumeDecreaseFactor;
  [(CSSmartSiriVolumeUserIntent *)self applyLowerAndUpperBoundsToVolume:v2];
  return v3;
}

- (float)increaseSiriVolumeBasedOnUserIntent
{
  *(float *)&double v2 = self->_latestVolume * self->kSSVCAUserIntentVolumeIncreaseFactor;
  [(CSSmartSiriVolumeUserIntent *)self applyLowerAndUpperBoundsToVolume:v2];
  return v3;
}

- (CSSmartSiriVolumeUserIntent)initWithStoredInformationAndAsset:(id)a3
{
  id v4 = a3;
  self->unint64_t kSSVCAUserIntentValidForSeconds = (unint64_t)[v4 SSVCAUserIntentValidForSeconds];
  [v4 SSVCAUserIntentVolumeIncreaseFactor];
  self->kSSVCAUserIntentVolumeIncreaseFactor = v5;
  [v4 SSVCAUserIntentVolumeDecreaseFactor];
  self->kSSVCAUserIntentVolumeDecreaseFactor = v6;
  [v4 SSVCAUserIntentPermanentOffsetFactorDelta];
  self->kSSVCAUserIntentPermanentOffsetFactorDelta = v7;
  [v4 SSVCAUserIntentPermanentOffsetFactorLowerBound];
  self->kSSVCAUserIntentPermanentOffsetFactorLowerBound = v8;
  [v4 SSVCAUserIntentPermanentOffsetFactorUpperBound];
  self->kSSVCAUserIntentPermanentOffsetFactorUpperBound = v9;
  [v4 SSVCADeviceSimpleMinTTSVolume];
  self->kSSVCA_DEVICE_SIMPLE_MIN_TTS_VOLUME = v10;
  [v4 SSVCADeviceSimpleMaxTTSVolume];
  self->kSSVCA_DEVICE_SIMPLE_MAX_TTS_VOLUME = v11;
  [v4 SSVCADeviceDefaultMinTTSVolume];
  self->kSSVCA_DEVICE_DEFAULT_MIN_TTS_VOLUME = v12;
  [v4 SSVCADeviceDefaultMaxTTSVolume];
  float v14 = v13;

  self->kSSVCA_DEVICE_DEFAULT_MAX_TTS_VOLUME = v14;
  v15 = +[CSFPreferences sharedPreferences];
  [v15 getASVUserIntent:self];

  unint64_t kSSVCAUserIntentValidForSeconds = self->kSSVCAUserIntentValidForSeconds;
  return (CSSmartSiriVolumeUserIntent *)[(CSSmartSiriVolumeUserIntent *)self setUserIntentValidForSeconds:kSSVCAUserIntentValidForSeconds];
}

- (double)applyLowerAndUpperBoundsToVolume:(float)a3
{
  id v5 = +[CSUtils horsemanDeviceType];
  uint64_t v6 = 36;
  if (v5 == (id)1) {
    uint64_t v6 = 44;
  }
  uint64_t v7 = 40;
  if (v5 == (id)1) {
    uint64_t v7 = 48;
  }
  double v8 = fminf(fmaxf(a3, *(float *)((char *)&self->super.isa + v6)), *(float *)((char *)&self->super.isa + v7));
  float v9 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    float v12 = "-[CSSmartSiriVolumeUserIntent applyLowerAndUpperBoundsToVolume:]";
    __int16 v13 = 2048;
    double v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolumeContextAware TTS volume post lower and upper bounds is: %f", (uint8_t *)&v11, 0x16u);
  }
  return v8;
}

@end