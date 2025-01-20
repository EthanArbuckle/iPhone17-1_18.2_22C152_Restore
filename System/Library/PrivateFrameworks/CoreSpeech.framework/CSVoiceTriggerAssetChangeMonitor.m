@interface CSVoiceTriggerAssetChangeMonitor
+ (id)sharedMonitor;
- (CSVoiceTriggerAssetChangeDelegate)delegate;
- (CSVoiceTriggerAssetChangeMonitor)init;
- (void)notifyVoiceTriggerAssetChanged;
- (void)setDelegate:(id)a3;
- (void)startMonitoring;
@end

@implementation CSVoiceTriggerAssetChangeMonitor

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSVoiceTriggerAssetChangeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerAssetChangeDelegate *)WeakRetained;
}

- (void)notifyVoiceTriggerAssetChanged
{
}

- (void)startMonitoring
{
  objc_initWeak(&location, self);
  if (self->_notifyToken == -1)
  {
    queue = self->_queue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003BE14;
    v4[3] = &unk_100250AE0;
    objc_copyWeak(&v5, &location);
    notify_register_dispatch("com.apple.corespeech.voicetriggerassetchange", &self->_notifyToken, queue, v4);
    objc_destroyWeak(&v5);
  }
  objc_destroyWeak(&location);
}

- (CSVoiceTriggerAssetChangeMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSVoiceTriggerAssetChangeMonitor;
  v2 = [(CSVoiceTriggerAssetChangeMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    dispatch_queue_t v4 = dispatch_queue_create("VoiceTrigger Asset Change Monitor", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

+ (id)sharedMonitor
{
  if (qword_1002A3690 != -1) {
    dispatch_once(&qword_1002A3690, &stru_10024EFE8);
  }
  v2 = (void *)qword_1002A3698;
  return v2;
}

@end