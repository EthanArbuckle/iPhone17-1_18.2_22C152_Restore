@interface FMDExtBluetoothDiscoveryFactory
+ (id)configurationDictWithBleDevice:(id)a3;
- (BOOL)isDiscoveryActive;
- (FMDBluetoothDiscoveryCoordinator)discoveryCoordinator;
- (FMDExtAccessoryDelegateProtocol)delegate;
- (FMDExtBluetoothDiscoveryFactory)init;
- (NSString)accessoryId;
- (NSString)address;
- (OS_dispatch_queue)bluetoothDiscoveryQueue;
- (id)newDiscovery;
- (void)didDiscoverDevice:(id)a3;
- (void)didLoseDevice:(id)a3;
- (void)setAccessoryId:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAllAudioChannelsActive:(BOOL)a3;
- (void)setBluetoothDiscoveryQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryCoordinator:(id)a3;
- (void)setupDiscovery;
@end

@implementation FMDExtBluetoothDiscoveryFactory

- (FMDExtBluetoothDiscoveryFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDExtBluetoothDiscoveryFactory;
  v2 = [(FMDExtBluetoothDiscoveryFactory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FMDExtBluetoothDiscoveryFactory *)v2 setupDiscovery];
  }
  return v3;
}

- (id)newDiscovery
{
  v2 = [(FMDExtBluetoothDiscoveryFactory *)self discoveryCoordinator];
  id v3 = [v2 newDiscovery];

  return v3;
}

- (BOOL)isDiscoveryActive
{
  v2 = [(FMDExtBluetoothDiscoveryFactory *)self discoveryCoordinator];
  unsigned __int8 v3 = [v2 isDiscoveryActive];

  return v3;
}

- (void)setupDiscovery
{
  unsigned __int8 v3 = objc_alloc_init(FMDBluetoothDiscoveryXPCProxy);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FindMyDeviceBluetoothExtension.bluetoothdiscoveryqueue", 0);
  [(FMDExtBluetoothDiscoveryFactory *)self setBluetoothDiscoveryQueue:v4];

  objc_super v5 = [[FMDBluetoothDiscoveryCoordinator alloc] initWithDiscovery:v3];
  [(FMDExtBluetoothDiscoveryFactory *)self setDiscoveryCoordinator:v5];

  objc_initWeak(&location, self);
  v6 = sub_1000069F8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "starting up discovery %@", buf, 0xCu);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000F0FC;
  v17[3] = &unk_100021620;
  objc_copyWeak(&v18, &location);
  v7 = [(FMDExtBluetoothDiscoveryFactory *)self discoveryCoordinator];
  [v7 setDidDiscoverDevice:v17];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000F26C;
  v15[3] = &unk_100021620;
  objc_copyWeak(&v16, &location);
  v8 = [(FMDExtBluetoothDiscoveryFactory *)self discoveryCoordinator];
  [v8 setDidLoseDevice:v15];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000F3DC;
  v13[3] = &unk_100021648;
  objc_copyWeak(&v14, &location);
  v9 = [(FMDExtBluetoothDiscoveryFactory *)self discoveryCoordinator];
  [v9 setDidEndDiscovery:v13];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F4F0;
  v11[3] = &unk_100021598;
  objc_copyWeak(&v12, &location);
  v10 = [(FMDExtBluetoothDiscoveryFactory *)self discoveryCoordinator];
  [v10 setDidStartDiscovery:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)setAllAudioChannelsActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(FMDExtBluetoothDiscoveryFactory *)self delegate];
  objc_super v5 = [(FMDExtBluetoothDiscoveryFactory *)self accessoryId];
  if (v3)
  {
    v6 = &off_1000249D0;
    v7 = &stru_100021668;
  }
  else
  {
    v6 = &off_1000249F8;
    v7 = &stru_100021688;
  }
  [v8 availabilitydidChangeFor:v5 status:v6 withCompletion:v7];
}

- (void)didDiscoverDevice:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 bluetoothAddress];
  v6 = [v5 fm_MACAddressString];
  v7 = [(FMDExtBluetoothDiscoveryFactory *)self address];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = [(id)objc_opt_class() configurationDictWithBleDevice:v4];
    v10 = sub_1000069F8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v4 advertisementFields];
      int v14 = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didDiscoverDevice = %@ %@", (uint8_t *)&v14, 0x16u);
    }
    if (v9)
    {
      id v12 = [(FMDExtBluetoothDiscoveryFactory *)self delegate];
      v13 = [(FMDExtBluetoothDiscoveryFactory *)self accessoryId];
      [v12 availabilitydidChangeFor:v13 status:v9 withCompletion:&stru_1000216A8];
    }
  }
}

- (void)didLoseDevice:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 bluetoothAddress];
  v6 = [v5 fm_MACAddressString];
  v7 = [(FMDExtBluetoothDiscoveryFactory *)self address];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = [(id)objc_opt_class() configurationDictWithBleDevice:v4];
    v10 = sub_1000069F8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v4 advertisementFields];
      int v14 = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didLoseDevice = %@ %@", (uint8_t *)&v14, 0x16u);
    }
    if (v9)
    {
      id v12 = [(FMDExtBluetoothDiscoveryFactory *)self delegate];
      v13 = [(FMDExtBluetoothDiscoveryFactory *)self accessoryId];
      [v12 availabilitydidChangeFor:v13 status:v9 withCompletion:&stru_1000216C8];
    }
  }
}

+ (id)configurationDictWithBleDevice:(id)a3
{
  BOOL v3 = [a3 advertisementFields];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"aState"];
  objc_super v5 = (void *)v4;
  v6 = &off_100024A20;
  if (v4) {
    v6 = (_UNKNOWN **)v4;
  }
  v7 = v6;

  unsigned int v35 = [v7 isEqualToNumber:&off_100024A38];
  unsigned int v8 = [v3 objectForKeyedSubscript:@"hsStatus"];
  unsigned int v9 = [v8 unsignedIntValue];
  int v10 = dword_10002D1FC & v9;
  int v11 = dword_10002D1E0 & v9;
  int v12 = dword_10002D1E4 & v9;
  int v13 = dword_10002D1F0 & v9;
  int v14 = dword_10002D1E8 & v9;
  int v15 = dword_10002D1F4 & v9;
  int v16 = dword_10002D200 & v9;
  v17 = sub_100006668();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110656;
    BOOL v39 = v10 != 0;
    __int16 v40 = 1024;
    BOOL v41 = v16 != 0;
    __int16 v42 = 1024;
    BOOL v43 = v11 != 0;
    __int16 v44 = 1024;
    BOOL v45 = v12 != 0;
    __int16 v46 = 1024;
    BOOL v47 = v13 != 0;
    __int16 v48 = 1024;
    BOOL v49 = v14 != 0;
    __int16 v50 = 1024;
    BOOL v51 = v15 != 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MainHSSTATUS L %i P %i U %i C %i OC %i E %i OE %i", buf, 0x2Cu);
  }

  if (v16)
  {
    if (v11) {
      BOOL v18 = v14 == 0;
    }
    else {
      BOOL v18 = 0;
    }
    int v20 = v18 && v15 == 0;
    if (v12) {
      BOOL v21 = v13 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (!v21 || (v12 | v13) == 0) {
      int v23 = v20;
    }
    else {
      int v23 = 0;
    }
    if (v10) {
      v24 = @"right";
    }
    else {
      v24 = @"left";
    }
    if (v10) {
      v25 = @"left";
    }
    else {
      v25 = @"right";
    }
    v26 = v24;
    v27 = v25;
    id v28 = objc_alloc_init((Class)NSMutableArray);
    v29 = v28;
    if ((v23 & 1) != 0 || !v12) {
      [v28 addObject:v27];
    }
    if (v13) {
      int v30 = v23;
    }
    else {
      int v30 = 1;
    }
    if (v11 && v30) {
      [v29 addObject:v26];
    }
    if (v35) {
      id v31 = v29;
    }
    else {
      id v31 = &__NSArray0__struct;
    }
    v36[0] = @"components";
    v36[1] = @"playing";
    v37[0] = v29;
    v37[1] = v31;
    v36[2] = @"statusUpdateTime";
    v33 = +[NSDate date];
    v37[2] = v33;
    v32 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
  }
  else
  {
    v26 = sub_1000069F8();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "ignoring advertisement from non primary bud", buf, 2u);
    }
    v32 = 0;
  }

  return v32;
}

- (FMDExtAccessoryDelegateProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)accessoryId
{
  return self->_accessoryId;
}

- (void)setAccessoryId:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (FMDBluetoothDiscoveryCoordinator)discoveryCoordinator
{
  return self->_discoveryCoordinator;
}

- (void)setDiscoveryCoordinator:(id)a3
{
}

- (OS_dispatch_queue)bluetoothDiscoveryQueue
{
  return self->_bluetoothDiscoveryQueue;
}

- (void)setBluetoothDiscoveryQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDiscoveryQueue, 0);
  objc_storeStrong((id *)&self->_discoveryCoordinator, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_accessoryId, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end