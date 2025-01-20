@interface HPHeadphoneEndCallManager
- (BOOL)isStatusUnknown;
- (BluetoothDevice)bluetoothDevice;
- (BluetoothManager)btManager;
- (HPHeadphoneEndCallManager)initWithBluetoothAddress:(id)a3;
- (NSString)bluetoothAddressString;
- (void)setBluetoothDevice:(id)a3;
- (void)setBtManager:(id)a3;
- (void)setConfigForDoubleTap;
- (void)setConfigForSingleTap;
- (void)setStatusToDone;
@end

@implementation HPHeadphoneEndCallManager

- (HPHeadphoneEndCallManager)initWithBluetoothAddress:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HPHeadphoneEndCallManager;
  id v3 = a3;
  v4 = [(HPHeadphoneEndCallManager *)&v11 init];
  v5 = (NSString *)[v3 copy];

  bluetoothAddressString = v4->_bluetoothAddressString;
  v4->_bluetoothAddressString = v5;

  if (dword_1000D4280 <= 30 && (dword_1000D4280 != -1 || _LogCategory_Initialize()))
  {
    v10 = v4->_bluetoothAddressString;
    LogPrintF();
  }
  uint64_t v7 = +[BluetoothManager sharedInstance];
  btManager = v4->_btManager;
  v4->_btManager = (BluetoothManager *)v7;

  return v4;
}

- (BOOL)isStatusUnknown
{
  [(BluetoothManager *)self->_btManager pairedDevices];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = [v8 address];
        unsigned int v10 = [v9 isEqualToString:self->_bluetoothAddressString];

        if (v10)
        {
          objc_storeStrong((id *)&self->_bluetoothDevice, v8);
          if (dword_1000D4280 <= 30 && (dword_1000D4280 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_14;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  unsigned __int16 v11 = (unsigned __int16)[(BluetoothDevice *)self->_bluetoothDevice getCallManagementConfig];
  if (![(BluetoothDevice *)self->_bluetoothDevice getAACPCapabilityBit:80]
    || (_BYTE)v11)
  {
    if (dword_1000D4280 <= 30 && (dword_1000D4280 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = (v11 & 0xFE00) == 0;
  }

  return v12;
}

- (void)setConfigForSingleTap
{
}

- (void)setConfigForDoubleTap
{
}

- (void)setStatusToDone
{
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