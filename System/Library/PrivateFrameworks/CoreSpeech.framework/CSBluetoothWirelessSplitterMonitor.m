@interface CSBluetoothWirelessSplitterMonitor
+ (id)sharedInstance;
- (unint64_t)splitterState;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)splitterState:(id)a3;
- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4;
@end

@implementation CSBluetoothWirelessSplitterMonitor

+ (id)sharedInstance
{
  if (qword_1002A3BB0 != -1) {
    dispatch_once(&qword_1002A3BB0, &stru_100252A90);
  }
  v2 = (void *)qword_1002A3BB8;
  return v2;
}

- (void)_stopMonitoring
{
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSBluetoothWirelessSplitterMonitor _startMonitoringWithQueue:]", "CSBluetoothWirelessSplitterMonitor.m", 49, "NO");
}

- (void)splitterState:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSBluetoothWirelessSplitterMonitor splitterState:]", "CSBluetoothWirelessSplitterMonitor.m", 45, "NO");
}

- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
}

- (unint64_t)splitterState
{
}

@end