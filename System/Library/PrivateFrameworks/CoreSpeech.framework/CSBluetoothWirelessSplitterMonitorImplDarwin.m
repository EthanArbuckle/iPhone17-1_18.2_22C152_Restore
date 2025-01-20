@interface CSBluetoothWirelessSplitterMonitorImplDarwin
- (CSBluetoothWirelessSplitterMonitorImplDarwin)init;
- (unint64_t)splitterState;
- (void)_didReceiveWirelessSplitterStateChange;
- (void)_notifyObserver:(id)a3 splitterState:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)splitterState:(id)a3;
- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4;
@end

@implementation CSBluetoothWirelessSplitterMonitorImplDarwin

- (void)_notifyObserver:(id)a3 splitterState:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(CSBluetoothWirelessSplitterMonitorImplDarwin *)self notifyObserver:v8];
  if (objc_opt_respondsToSelector()) {
    [v8 CSBluetoothWirelessSplitterMonitor:self didReceiveSplitterStateChange:a4 shouldDisableSpeakerVerificationInSplitterMode:v5];
  }
}

- (void)_didReceiveWirelessSplitterStateChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100118CAC;
  v2[3] = &unk_100252F30;
  v2[4] = self;
  [(CSBluetoothWirelessSplitterMonitorImplDarwin *)self splitterState:v2];
}

- (void)_stopMonitoring
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSBluetoothWirelessSplitterMonitorImplDarwin _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Wireless Splitter", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  [(CSBluetoothWirelessSplitterMonitorImplDarwin *)self _didReceiveWirelessSplitterStateChange];
  int v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[CSBluetoothWirelessSplitterMonitorImplDarwin _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Wireless Splitter start", (uint8_t *)&v4, 0xCu);
  }
}

- (unint64_t)splitterState
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[CSBluetoothWirelessSplitterMonitorImplDarwin splitterState]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s This call is not supported on darwinOS device (splitterState)", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (void)splitterState:(id)a3
{
  if (a3) {
    (*((void (**)(id, unint64_t, BOOL))a3 + 2))(a3, self->_splitterState, self->_shouldDisableSpeakerVerificationInSplitterMode);
  }
}

- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    *(void *)&v9[4] = "-[CSBluetoothWirelessSplitterMonitorImplDarwin updateSplitterState:shouldDisableSpeakerVerificat"
                        "ionInSplitterMode:]";
    *(_DWORD *)v9 = 136315650;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_WORD *)&v9[12] = 2050;
    *(void *)&v9[14] = a3;
    __int16 v10 = 2114;
    CFStringRef v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s splitterState : %{public}lu, shouldDisableSpeakerVerification : %{public}@", v9, 0x20u);
  }
  self->_splitterState = a3;
  self->_shouldDisableSpeakerVerificationInSplitterMode = v4;
  [(CSBluetoothWirelessSplitterMonitorImplDarwin *)self _didReceiveWirelessSplitterStateChange];
}

- (CSBluetoothWirelessSplitterMonitorImplDarwin)init
{
  if (+[CSUtils isDarwinOS])
  {
    v6.receiver = self;
    v6.super_class = (Class)CSBluetoothWirelessSplitterMonitorImplDarwin;
    int v3 = [(CSBluetoothWirelessSplitterMonitorImplDarwin *)&v6 init];
    if (v3)
    {
      v3->_splitterState = 0;
      v3->_shouldDisableSpeakerVerificationInSplitterMode = 0;
    }
    self = v3;
    BOOL v4 = self;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end