@interface CSSmartSiriVolumeManager
+ (CSSmartSiriVolumeManager)sharedInstance;
- (CSConnectionServiceDelegate)delegate;
- (CSSmartSiriVolumeManager)initWithSamplingRate:(float)a3;
- (CSSmartSiriVolumeProcessor)smartSiriVolume;
- (OS_dispatch_queue)queue;
- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5;
- (void)CSAlarmMonitor:(id)a3 didReceiveAlarmChanged:(int64_t)a4;
- (void)CSAutomaticVolumeEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)CSTimerMonitor:(id)a3 didReceiveTimerChanged:(int64_t)a4;
- (void)CSVolumeMonitor:(id)a3 didReceiveAlarmVolumeChanged:(float)a4;
- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4;
- (void)setAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSmartSiriVolume:(id)a3;
- (void)setSmartSiriVolumeDirection:(BOOL)a3;
- (void)setSmartSiriVolumePercentage:(float)a3;
- (void)startSmartSiriVolume;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
@end

@implementation CSSmartSiriVolumeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartSiriVolume, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSmartSiriVolume:(id)a3
{
}

- (CSSmartSiriVolumeProcessor)smartSiriVolume
{
  return self->_smartSiriVolume;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSConnectionServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSConnectionServiceDelegate *)WeakRetained;
}

- (void)CSAutomaticVolumeEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[CSSmartSiriVolumeManager CSAutomaticVolumeEnabledMonitor:didReceiveEnabled:]";
    __int16 v14 = 1026;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Automatic Volume State changed to %{public}d", (uint8_t *)&v12, 0x12u);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 notifyClientsWithBlock:&stru_100252198];
  }
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    uint64_t v7 = kVTEIfirstPassTriggerSource;
    v8 = [v11 objectForKeyedSubscript:kVTEIfirstPassTriggerSource];

    if (v8)
    {
      v9 = [v11 objectForKeyedSubscript:v7];
      unsigned int v10 = [v9 isEqualToString:kVTEIFirstPassTriggeredFromApplicationProcessor];

      if (v10) {
        [(CSSmartSiriVolumeProcessor *)self->_smartSiriVolume didDetectKeywordWithResult:v11];
      }
    }
  }
}

- (void)CSVolumeMonitor:(id)a3 didReceiveAlarmVolumeChanged:(float)a4
{
  id v6 = a3;
  uint64_t v7 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "-[CSSmartSiriVolumeManager CSVolumeMonitor:didReceiveAlarmVolumeChanged:]";
    __int16 v15 = 2050;
    double v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s AlarmVolume changed to %{public}f", (uint8_t *)&v13, 0x16u);
  }
  *(float *)&double v8 = a4;
  [(CSSmartSiriVolumeProcessor *)self->_smartSiriVolume didReceiveAlarmVolumeChanged:v8];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 notifyClientsWithBlock:&stru_100252178];
  }
}

- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4
{
  id v6 = a3;
  uint64_t v7 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "-[CSSmartSiriVolumeManager CSVolumeMonitor:didReceiveMusicVolumeChanged:]";
    __int16 v15 = 2050;
    double v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s MusicVolume changed to %{public}f", (uint8_t *)&v13, 0x16u);
  }
  *(float *)&double v8 = a4;
  [(CSSmartSiriVolumeProcessor *)self->_smartSiriVolume didReceiveMusicVolumeChanged:v8];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 notifyClientsWithBlock:&stru_100252158];
  }
}

- (void)CSTimerMonitor:(id)a3 didReceiveTimerChanged:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    int v13 = "-[CSSmartSiriVolumeManager CSTimerMonitor:didReceiveTimerChanged:]";
    __int16 v14 = 1026;
    int v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s TimerState changed to %{public}d", (uint8_t *)&v12, 0x12u);
  }
  [(CSSmartSiriVolumeProcessor *)self->_smartSiriVolume didReceiveTimerChanged:a4];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 notifyClientsWithBlock:&stru_100252138];
  }
}

- (void)CSAlarmMonitor:(id)a3 didReceiveAlarmChanged:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    int v13 = "-[CSSmartSiriVolumeManager CSAlarmMonitor:didReceiveAlarmChanged:]";
    __int16 v14 = 1026;
    int v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s AlarmState changed to %{public}d", (uint8_t *)&v12, 0x12u);
  }
  [(CSSmartSiriVolumeProcessor *)self->_smartSiriVolume didReceiveAlarmChanged:a4];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 notifyClientsWithBlock:&stru_100252118];
  }
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
}

- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5
{
  return [(CSSmartSiriVolumeProcessor *)self->_smartSiriVolume getVolumeForTTSType:a3 withOverrideMediaVolume:a4 WithRequestTime:a5];
}

- (void)setAsset:(id)a3
{
}

- (void)startSmartSiriVolume
{
}

- (CSSmartSiriVolumeManager)initWithSamplingRate:(float)a3
{
  if ((+[CSUtils supportSmartVolume] & 1) == 0)
  {
    int v13 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSSmartSiriVolumeManager initWithSamplingRate:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Smart Siri Volume not supported on this platform - Bailing out", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v16.receiver = self;
  v16.super_class = (Class)CSSmartSiriVolumeManager;
  self = [(CSSmartSiriVolumeManager *)&v16 init];
  if (self)
  {
    v5 = [CSSmartSiriVolume alloc];
    +[CSConfig inputRecordingSampleRate];
    id v6 = -[CSSmartSiriVolume initWithSamplingRate:](v5, "initWithSamplingRate:");
    smartSiriVolume = self->_smartSiriVolume;
    self->_smartSiriVolume = v6;

    if (self->_smartSiriVolume)
    {
      double v8 = +[CSAlarmMonitor sharedInstance];
      [v8 addObserver:self];

      v9 = +[CSTimerMonitor sharedInstance];
      [v9 addObserver:self];

      char v10 = +[CSVolumeMonitor sharedInstance];
      [v10 addObserver:self];

      id v11 = +[CSAutomaticVolumeEnabledMonitor sharedInstance];
      [v11 addObserver:self];

      goto LABEL_5;
    }
    __int16 v14 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CSSmartSiriVolumeManager initWithSamplingRate:]";
      __int16 v19 = 2050;
      double v20 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed to initialize Smart Siri Volume with sampling %{public}f", buf, 0x16u);
    }
LABEL_10:
    int v12 = 0;
    goto LABEL_11;
  }
LABEL_5:
  self = self;
  int v12 = self;
LABEL_11:

  return v12;
}

+ (CSSmartSiriVolumeManager)sharedInstance
{
  if (qword_1002A3AE0 != -1) {
    dispatch_once(&qword_1002A3AE0, &stru_1002520F8);
  }
  v2 = (void *)qword_1002A3AD8;
  return (CSSmartSiriVolumeManager *)v2;
}

@end