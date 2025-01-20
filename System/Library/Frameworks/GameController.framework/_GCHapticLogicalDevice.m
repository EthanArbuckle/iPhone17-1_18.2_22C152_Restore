@interface _GCHapticLogicalDevice
- (BOOL)hasClients;
- (_GCHapticLogicalDevice)initWithIdentifier:(id)a3 clientConnection:(id)a4;
- (void)registerHapticClient:(id)a3;
- (void)stopAllHaptics;
- (void)unregisterHapticClient:(id)a3;
@end

@implementation _GCHapticLogicalDevice

- (_GCHapticLogicalDevice)initWithIdentifier:(id)a3 clientConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_GCHapticLogicalDevice;
  v9 = [(_GCHapticLogicalDevice *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    uint64_t v11 = +[NSMutableArray array];
    hapticClients = v10->_hapticClients;
    v10->_hapticClients = (NSMutableArray *)v11;

    uint64_t v13 = +[NSMutableArray array];
    hapticPlayers = v10->_hapticPlayers;
    v10->_hapticPlayers = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v10->_clientConnection, a4);
    if (([v8 isMockClient] & 1) == 0)
    {
      v15 = +[_GCControllerManager sharedInstance];
      v16 = [v15 logicalDevices];
      v17 = [v16 objectForKey:v10->_identifier];
      if ([v17 conformsToProtocol:&unk_26D2932A0])
      {
        id v18 = v17;
        uint64_t v19 = [v18 hapticDriver];
        driver = v10->_driver;
        v10->_driver = (_GCDriverClientHapticInterface *)v19;
      }
      logicalDevice = v10->_logicalDevice;
      v10->_logicalDevice = (_GCLogicalDevice *)v17;
    }
  }

  return v10;
}

- (void)registerHapticClient:(id)a3
{
}

- (void)unregisterHapticClient:(id)a3
{
}

- (BOOL)hasClients
{
  return [(NSMutableArray *)self->_hapticClients count] != 0;
}

- (void)stopAllHaptics
{
  if (gc_isInternalBuild())
  {
    v3 = getGCHapticsLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      int v5 = 138412290;
      v6 = identifier;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "Stop all haptics for %@", (uint8_t *)&v5, 0xCu);
    }
  }
  [(_GCDriverClientHapticInterface *)self->_driver setHapticMotor:0 frequency:0.0 amplitude:0.0];
  [(_GCDriverClientHapticInterface *)self->_driver setHapticMotor:1 frequency:0.0 amplitude:0.0];
  [(_GCDriverClientHapticInterface *)self->_driver setHapticMotor:2 frequency:0.0 amplitude:0.0];
  [(_GCDriverClientHapticInterface *)self->_driver setHapticMotor:3 frequency:0.0 amplitude:0.0];
  [(_GCDriverClientHapticInterface *)self->_driver enableHaptics];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_hapticPlayers, 0);
  objc_storeStrong((id *)&self->_hapticClients, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_logicalDevice, 0);
}

@end