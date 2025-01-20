@interface CSBluetoothWirelessSplitterMonitorImpIOS
- (CSBluetoothWirelessSplitterMonitorImpIOS)init;
- (unint64_t)splitterState;
- (void)_didReceiveWirelessSplitterStateChange;
- (void)_notifyObserver:(id)a3 splitterState:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)splitterState:(id)a3;
- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4;
@end

@implementation CSBluetoothWirelessSplitterMonitorImpIOS

- (void)_notifyObserver:(id)a3 splitterState:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(CSBluetoothWirelessSplitterMonitorImpIOS *)self notifyObserver:v8];
  if (objc_opt_respondsToSelector()) {
    [v8 CSBluetoothWirelessSplitterMonitor:self didReceiveSplitterStateChange:a4 shouldDisableSpeakerVerificationInSplitterMode:v5];
  }
}

- (void)_didReceiveWirelessSplitterStateChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000F32AC;
  v2[3] = &unk_100252F30;
  v2[4] = self;
  [(CSBluetoothWirelessSplitterMonitorImpIOS *)self splitterState:v2];
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[CSBluetoothWirelessSplitterMonitorImpIOS _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Wireless Splitter", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000F358C;
    handler[3] = &unk_100253680;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", &self->_notifyToken, v4, handler);
    [(CSBluetoothWirelessSplitterMonitorImpIOS *)self _didReceiveWirelessSplitterStateChange];
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSBluetoothWirelessSplitterMonitorImpIOS _startMonitoringWithQueue:]";
      v6 = "%s Start monitoring : Wireless Splitter start";
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSBluetoothWirelessSplitterMonitorImpIOS _startMonitoringWithQueue:]";
      v6 = "%s Cannot start monitoring Wireless Splitter because it was already started";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
}

- (void)splitterState:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[CSBluetoothManager sharedInstance];
    if (v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000F370C;
      v5[3] = &unk_100251770;
      id v6 = v3;
      [v4 getWirelessSplitterInfoWithCompletion:v5];
    }
    else
    {
      (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
    }
  }
}

- (unint64_t)splitterState
{
  return self->_splitterState;
}

- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
}

- (CSBluetoothWirelessSplitterMonitorImpIOS)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CSBluetoothWirelessSplitterMonitorImpIOS;
    v4 = [(CSBluetoothWirelessSplitterMonitorImpIOS *)&v6 init];
    if (v4)
    {
      v4->_int notifyToken = -1;
      v4->_splitterState = 0;
    }
    self = v4;
    id v3 = self;
  }

  return v3;
}

@end