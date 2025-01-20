@interface ADBluetoothManager
+ (id)sharedInstance;
- (id)_init;
- (id)deviceWithAddress:(id)a3;
- (id)deviceWithRecordingInfo:(id)a3;
- (id)deviceWithUID:(id)a3;
- (id)headGestureConfigurationForBTAddress:(id)a3;
- (id)wirelessSplitterSession;
- (void)getConnectedDevicesWithCompletion:(id)a3;
- (void)getPairedDevicesWithCompletion:(id)a3;
- (void)prewarmDeviceWithIdentifier:(id)a3;
@end

@implementation ADBluetoothManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbDataSource, 0);
  objc_storeStrong((id *)&self->_mbDataSource, 0);
}

- (id)wirelessSplitterSession
{
  return [(ADMobileBluetoothDeviceDataSource *)self->_mbDataSource wirelessSplitterSession];
}

- (void)getPairedDevicesWithCompletion:(id)a3
{
}

- (void)getConnectedDevicesWithCompletion:(id)a3
{
}

- (id)headGestureConfigurationForBTAddress:(id)a3
{
  return [(ADCoreBluetoothV2DeviceSource *)self->_cbDataSource headGestureConfigurationForBTAddress:a3];
}

- (id)deviceWithUID:(id)a3
{
  return [(ADCoreBluetoothV2DeviceSource *)self->_cbDataSource deviceWithUID:a3];
}

- (id)deviceWithAddress:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v4];
  if (v5)
  {
    v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[ADBluetoothManager deviceWithAddress:]";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s This SPI should not be called with a CBUUID: %@", (uint8_t *)&v11, 0x16u);
    }
    v7 = [(ADBluetoothManager *)self deviceWithUID:v5];
  }
  else
  {
    id v8 = v4;
    if ((unint64_t)[v8 length] >= 0x12)
    {
      uint64_t v9 = [v8 substringToIndex:17];

      id v8 = (id)v9;
    }
    v7 = [(ADCoreBluetoothV2DeviceSource *)self->_cbDataSource deviceWithAddress:v8];
  }
  return v7;
}

- (id)deviceWithRecordingInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 source];
  unsigned int v6 = [v5 isEqualToString:SASStartSpeechAudioSourceBluetoothDoAPDeviceValue];

  if (v6)
  {
    v7 = [v4 deviceInfo];
    id v8 = [v7 remoteDeviceUID];

    uint64_t v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315394;
      v18 = "-[ADBluetoothManager deviceWithRecordingInfo:]";
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Recording DoAP Headset with Bluetooth UID: %@", (uint8_t *)&v17, 0x16u);
      if (v8) {
        goto LABEL_4;
      }
    }
    else if (v8)
    {
LABEL_4:
      uint64_t v10 = [(ADBluetoothManager *)self deviceWithUID:v8];
LABEL_9:
      __int16 v13 = (void *)v10;

      goto LABEL_12;
    }
  }
  else
  {
    int v11 = [v4 headsetAddress];

    if (v11)
    {
      v12 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v15 = v12;
        v16 = [v4 headsetAddress];
        int v17 = 136315394;
        v18 = "-[ADBluetoothManager deviceWithRecordingInfo:]";
        __int16 v19 = 2112;
        v20 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Recording Headset with Bluetooth Address: %@", (uint8_t *)&v17, 0x16u);
      }
      id v8 = [v4 headsetAddress];
      uint64_t v10 = [(ADBluetoothManager *)self deviceWithAddress:v8];
      goto LABEL_9;
    }
  }
  __int16 v13 = 0;
LABEL_12:

  return v13;
}

- (void)prewarmDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v4];
    if (v5) {
      [(ADBluetoothManager *)self deviceWithUID:v5];
    }
    else {
    unsigned int v6 = [(ADBluetoothManager *)self deviceWithAddress:v7];
    }
    [v6 prewarm];

    id v4 = v7;
  }
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)ADBluetoothManager;
  v2 = [(ADBluetoothManager *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(ADMobileBluetoothDeviceDataSource);
    mbDataSource = v2->_mbDataSource;
    v2->_mbDataSource = v3;

    id v5 = objc_alloc_init(ADCoreBluetoothV2DeviceSource);
    cbDataSource = v2->_cbDataSource;
    v2->_cbDataSource = v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100586410 != -1) {
    dispatch_once(&qword_100586410, &stru_10050D638);
  }
  v2 = (void *)qword_100586408;
  return v2;
}

@end