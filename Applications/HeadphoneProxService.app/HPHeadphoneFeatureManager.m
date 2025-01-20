@interface HPHeadphoneFeatureManager
- (BOOL)shouldShowAdaptiveControlsProxCard;
- (BOOL)shouldShowMuteCallProxCard;
- (BOOL)shouldShowProxCardForFeature:(int)a3;
- (BluetoothDevice)bluetoothDevice;
- (BluetoothManager)btManager;
- (HPHeadphoneFeatureManager)initWithBluetoothAddress:(id)a3 productID:(unsigned int)a4;
- (NSString)bluetoothAddressString;
- (id)getFeatureName:(int)a3;
- (unsigned)getColorCode;
- (void)setAdaptiveControlsAdaptiveMode:(BOOL)a3;
- (void)setAdaptiveControlsConfigDisabled;
- (void)setAdaptiveControlsConfigEnabled;
- (void)setAdaptiveControlsConversationAwareness:(BOOL)a3;
- (void)setAdaptiveControlsCustomized:(BOOL)a3 autoVolumeEnabled:(BOOL)a4 conversationDetectionEnabled:(BOOL)a5;
- (void)setAdaptiveControlsPersonalizedVolume:(BOOL)a3;
- (void)setAdaptiveControlsStatus;
- (void)setBluetoothDevice:(id)a3;
- (void)setBtManager:(id)a3;
- (void)setMuteCallConfig;
- (void)setMuteCallStatus;
@end

@implementation HPHeadphoneFeatureManager

- (HPHeadphoneFeatureManager)initWithBluetoothAddress:(id)a3 productID:(unsigned int)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HPHeadphoneFeatureManager;
  id v5 = a3;
  v6 = [(HPHeadphoneFeatureManager *)&v13 init];
  v7 = (NSString *)[v5 copy];

  bluetoothAddressString = v6->_bluetoothAddressString;
  v6->_bluetoothAddressString = v7;

  v6->_productID = a4;
  if (dword_1000D4120 <= 30 && (dword_1000D4120 != -1 || _LogCategory_Initialize()))
  {
    v12 = v6->_bluetoothAddressString;
    LogPrintF();
  }
  uint64_t v9 = +[BluetoothManager sharedInstance];
  btManager = v6->_btManager;
  v6->_btManager = (BluetoothManager *)v9;

  return v6;
}

- (BOOL)shouldShowProxCardForFeature:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3)
  {
    if (a3 != 1)
    {
      if (dword_1000D4120 <= 90 && (dword_1000D4120 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      return 0;
    }
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 1;
  }
  [(BluetoothManager *)self->_btManager pairedDevices];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [v11 address];
        unsigned int v13 = [v12 isEqualToString:self->_bluetoothAddressString];

        if (v13)
        {
          objc_storeStrong((id *)&self->_bluetoothDevice, v11);
          if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize()))
          {
            bluetoothDevice = self->_bluetoothDevice;
            LogPrintF();
          }
          goto LABEL_21;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  unsigned __int8 v14 = [(BluetoothDevice *)self->_bluetoothDevice isProxCardShowedForFeature:v5];
  char v15 = [(BluetoothDevice *)self->_bluetoothDevice isProxCardSupportedForFeature:v5] & ~v14;
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize()))
  {
    v16 = -[HPHeadphoneFeatureManager getFeatureName:](self, "getFeatureName:", v3, bluetoothDevice);
    LogPrintF();
  }
  return v15;
}

- (id)getFeatureName:(int)a3
{
  CFStringRef v3 = @"Unknown";
  if (a3 == 1) {
    CFStringRef v3 = @"Adaptive Controls";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Mute Call";
  }
}

- (BOOL)shouldShowMuteCallProxCard
{
  return 0;
}

- (void)setMuteCallConfig
{
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unint64_t v3 = (unint64_t)[(BluetoothDevice *)self->_bluetoothDevice getCallManagementConfig] & 0xFFFFFF | 0x2020302000000;
  bluetoothDevice = self->_bluetoothDevice;

  [(BluetoothDevice *)bluetoothDevice setCallConfig:v3];
}

- (void)setMuteCallStatus
{
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unint64_t v3 = (unint64_t)[(BluetoothDevice *)self->_bluetoothDevice getCallManagementConfig] & 0xFF00FF00FFFFFFLL | 0x20002000000;
  bluetoothDevice = self->_bluetoothDevice;

  [(BluetoothDevice *)bluetoothDevice setCallConfig:v3];
}

- (unsigned)getColorCode
{
  int v3 = 1;
  [(BluetoothDevice *)self->_bluetoothDevice getDeviceColor:&v3];
  return v3;
}

- (BOOL)shouldShowAdaptiveControlsProxCard
{
  return [(HPHeadphoneFeatureManager *)self shouldShowProxCardForFeature:1];
}

- (void)setAdaptiveControlsConfigEnabled
{
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(BluetoothDevice *)self->_bluetoothDevice setListeningMode:4];
  [(BluetoothDevice *)self->_bluetoothDevice setListeningModeConfigs:10];
  [(BluetoothDevice *)self->_bluetoothDevice setAdaptiveVolumeMode:1];
  bluetoothDevice = self->_bluetoothDevice;

  [(BluetoothDevice *)bluetoothDevice setConversationDetectMode:1];
}

- (void)setAdaptiveControlsConfigDisabled
{
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(BluetoothDevice *)self->_bluetoothDevice setAdaptiveVolumeMode:2];
  bluetoothDevice = self->_bluetoothDevice;

  [(BluetoothDevice *)bluetoothDevice setConversationDetectMode:2];
}

- (void)setAdaptiveControlsStatus
{
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  bluetoothDevice = self->_bluetoothDevice;

  [(BluetoothDevice *)bluetoothDevice setProxCardShowedForFeature:2 showed:1];
}

- (void)setAdaptiveControlsCustomized:(BOOL)a3 autoVolumeEnabled:(BOOL)a4 conversationDetectionEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize()))
  {
    BOOL v13 = v6;
    BOOL v14 = v5;
    BOOL v12 = v7;
    LogPrintF();
  }
  if (v7)
  {
    [(BluetoothDevice *)self->_bluetoothDevice setListeningMode:4];
    [(BluetoothDevice *)self->_bluetoothDevice setListeningModeConfigs:10];
  }
  if (v6) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  -[BluetoothDevice setAdaptiveVolumeMode:](self->_bluetoothDevice, "setAdaptiveVolumeMode:", v9, v12, v13, v14);
  bluetoothDevice = self->_bluetoothDevice;
  if (v5) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }

  [(BluetoothDevice *)bluetoothDevice setConversationDetectMode:v11];
}

- (void)setAdaptiveControlsAdaptiveMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v3)
  {
    [(BluetoothDevice *)self->_bluetoothDevice setListeningMode:4];
    bluetoothDevice = self->_bluetoothDevice;
    [(BluetoothDevice *)bluetoothDevice setListeningModeConfigs:10];
  }
}

- (void)setAdaptiveControlsPersonalizedVolume:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  bluetoothDevice = self->_bluetoothDevice;
  if (v3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }

  [(BluetoothDevice *)bluetoothDevice setAdaptiveVolumeMode:v6];
}

- (void)setAdaptiveControlsConversationAwareness:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1000D4120 <= 50 && (dword_1000D4120 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  bluetoothDevice = self->_bluetoothDevice;
  if (v3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }

  [(BluetoothDevice *)bluetoothDevice setConversationDetectMode:v6];
}

- (NSString)bluetoothAddressString
{
  return self->_bluetoothAddressString;
}

- (BluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setBluetoothDevice:(id)a3
{
}

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);

  objc_storeStrong((id *)&self->_bluetoothAddressString, 0);
}

@end