@interface AFPairedBluetoothDevicesObserver
+ (id)sharedObserver;
- (AFPairedBluetoothDevicesObserver)init;
- (id)pairedBluetoothDevices;
- (void)updatePairedDevices:(id)a3;
@end

@implementation AFPairedBluetoothDevicesObserver

- (void).cxx_destruct
{
}

- (id)pairedBluetoothDevices
{
  p_pairedDevicesLock = &self->_pairedDevicesLock;
  os_unfair_lock_lock(&self->_pairedDevicesLock);
  v4 = self->_pairedDevices;
  os_unfair_lock_unlock(p_pairedDevicesLock);
  return v4;
}

- (void)updatePairedDevices:(id)a3
{
  v4 = [getBluetoothManagerClass() sharedInstance];
  v5 = [v4 pairedDevices];

  os_unfair_lock_lock(&self->_pairedDevicesLock);
  pairedDevices = self->_pairedDevices;
  self->_pairedDevices = v5;

  os_unfair_lock_unlock(&self->_pairedDevicesLock);
}

- (AFPairedBluetoothDevicesObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)AFPairedBluetoothDevicesObserver;
  v2 = [(AFPairedBluetoothDevicesObserver *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_pairedDevicesLock._os_unfair_lock_opaque = 0;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = getBluetoothPairedStatusChangedNotification();
    [v4 addObserver:v3 selector:sel_updatePairedDevices_ name:v5 object:0];

    [(AFPairedBluetoothDevicesObserver *)v3 updatePairedDevices:0];
  }
  return v3;
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken_45428 != -1) {
    dispatch_once(&sharedObserver_onceToken_45428, &__block_literal_global_569);
  }
  v2 = (void *)sharedObserver_sBTObserver;
  return v2;
}

void __50__AFPairedBluetoothDevicesObserver_sharedObserver__block_invoke()
{
  v0 = objc_alloc_init(AFPairedBluetoothDevicesObserver);
  v1 = (void *)sharedObserver_sBTObserver;
  sharedObserver_sBTObserver = (uint64_t)v0;
}

@end