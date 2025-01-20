@interface CSSiriBluetoothManager
+ (id)sharedInstance;
- (id)_init;
- (id)deviceWithAddress:(id)a3;
- (id)deviceWithUID:(id)a3;
- (void)prewarmDeviceWithIdentifier:(id)a3;
@end

@implementation CSSiriBluetoothManager

- (void).cxx_destruct
{
}

- (id)deviceWithUID:(id)a3
{
  return [(CSSiriMobileBluetoothDeviceDataSource *)self->_dataSource deviceWithUID:a3];
}

- (id)deviceWithAddress:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((unint64_t)[v4 length] >= 0x12)
  {
    v5 = [v4 substringToIndex:17];
  }
  v6 = [(CSSiriMobileBluetoothDeviceDataSource *)self->_dataSource deviceWithAddress:v5];

  return v6;
}

- (void)prewarmDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    if (v5) {
      [(CSSiriBluetoothManager *)self deviceWithUID:v5];
    }
    else {
    v6 = [(CSSiriBluetoothManager *)self deviceWithAddress:v7];
    }
    [v6 prewarm];

    id v4 = v7;
  }
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)CSSiriBluetoothManager;
  v2 = [(CSSiriBluetoothManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CSSiriMobileBluetoothDeviceDataSource);
    dataSource = v2->_dataSource;
    v2->_dataSource = v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_18139 != -1) {
    dispatch_once(&sharedInstance_onceToken_18139, &__block_literal_global_18140);
  }
  v2 = (void *)sharedInstance_sSharedInstance_18141;
  return v2;
}

void __40__CSSiriBluetoothManager_sharedInstance__block_invoke()
{
  id v0 = [[CSSiriBluetoothManager alloc] _init];
  v1 = (void *)sharedInstance_sSharedInstance_18141;
  sharedInstance_sSharedInstance_18141 = (uint64_t)v0;
}

@end