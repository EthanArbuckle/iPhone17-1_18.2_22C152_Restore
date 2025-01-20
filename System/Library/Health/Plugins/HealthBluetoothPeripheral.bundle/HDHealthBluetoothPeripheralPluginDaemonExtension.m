@interface HDHealthBluetoothPeripheralPluginDaemonExtension
- (BOOL)daemonDidReceiveNotification:(const char *)a3;
- (HDDaemon)daemon;
- (HDHealthBluetoothPeripheralPluginDaemonExtension)initWithDaemon:(id)a3;
@end

@implementation HDHealthBluetoothPeripheralPluginDaemonExtension

- (HDHealthBluetoothPeripheralPluginDaemonExtension)initWithDaemon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHealthBluetoothPeripheralPluginDaemonExtension;
  v5 = [(HDHealthBluetoothPeripheralPluginDaemonExtension *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_daemon, v4);
  }

  return v6;
}

- (BOOL)daemonDidReceiveNotification:(const char *)a3
{
  if (!strcasecmp("com.apple.nearfield.handoff.terminal", a3))
  {
    v6 = +[NSNotificationCenter defaultCenter];
    v7 = &HDWorkoutNotificationTerminalHandoffFieldDetected;
  }
  else
  {
    if (strcasecmp(kHKConnectedGymPreferencesChangedNotificationKey, a3)) {
      return 0;
    }
    v6 = +[NSNotificationCenter defaultCenter];
    v7 = &HDConnectedGymPreferencesChanged;
  }
  objc_super v8 = *v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  [v6 postNotificationName:v8 object:WeakRetained];

  return 1;
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end