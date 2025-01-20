@interface DSScanManager
- (BOOL)_shouldUpdateDiscovery;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (unint64_t)dsScanFlags;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_updateBLEDiscoveryFlags;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDsScanFlags:(unint64_t)a3;
- (void)startScanning;
- (void)stopScanning;
@end

@implementation DSScanManager

- (void)startScanning
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = self->_bleDiscovery;
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEF30]);
    [v4 setDispatchQueue:self->_dispatchQueue];
    [v4 setDiscoveryFlags:self->_bleDiscoveryFlags];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __30__DSScanManager_startScanning__block_invoke;
    v16[3] = &unk_2646D5038;
    id v5 = v4;
    id v17 = v5;
    v18 = self;
    [v5 setDeviceFoundHandler:v16];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __30__DSScanManager_startScanning__block_invoke_2;
    v13[3] = &unk_2646D5038;
    id v6 = v5;
    id v14 = v6;
    v15 = self;
    [v6 setDeviceLostHandler:v13];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __30__DSScanManager_startScanning__block_invoke_3;
    v10[3] = &unk_2646D5060;
    v3 = (CBDiscovery *)v6;
    v11 = v3;
    v12 = self;
    [(CBDiscovery *)v3 activateWithCompletion:v10];
    if (onceTokenDSScanManager != -1) {
      dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
    }
    v7 = logObjDSScanManager;
    if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "Starting Scanner", v9, 2u);
    }
    objc_storeStrong((id *)&self->_bleDiscovery, v4);
  }
  if ([(DSScanManager *)self _shouldUpdateDiscovery])
  {
    if (onceTokenDSScanManager != -1) {
      dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
    }
    v8 = logObjDSScanManager;
    if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "Updating Discovery flags", v9, 2u);
    }
    [(CBDiscovery *)self->_bleDiscovery setDiscoveryFlags:self->_bleDiscoveryFlags];
  }
}

void *__30__DSScanManager_startScanning__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[2]) {
    return (void *)[result _deviceFound:a2];
  }
  return result;
}

void *__30__DSScanManager_startScanning__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[2]) {
    return (void *)[result _deviceLost:a2];
  }
  return result;
}

void __30__DSScanManager_startScanning__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 16))
  {
    if (v3)
    {
      if (onceTokenDSScanManager != -1) {
        dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
      }
      id v5 = logObjDSScanManager;
      if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_ERROR, "Failed to activate CBDiscovery", buf, 2u);
      }
      [*(id *)(a1 + 32) invalidate];
    }
    else
    {
      if (onceTokenDSScanManager != -1) {
        dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
      }
      id v6 = logObjDSScanManager;
      if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "CBDiscovery Activated", v7, 2u);
      }
    }
  }
}

- (void)setDsScanFlags:(unint64_t)a3
{
  if (self->_dsScanFlags != a3)
  {
    self->_dsScanFlags = a3;
    [(DSScanManager *)self _updateBLEDiscoveryFlags];
  }
}

- (void)_updateBLEDiscoveryFlags
{
  self->_unint64_t bleDiscoveryFlags = 0;
  unint64_t dsScanFlags = self->_dsScanFlags;
  if ((dsScanFlags & 2) == 0)
  {
    unint64_t bleDiscoveryFlags = 0;
    if ((dsScanFlags & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  self->_unint64_t bleDiscoveryFlags = 0x800000000000000;
  if (onceTokenDSScanManager != -1) {
    dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
  }
  id v5 = logObjDSScanManager;
  if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "Set DSInfo Discovery flag", buf, 2u);
  }
  unint64_t bleDiscoveryFlags = self->_bleDiscoveryFlags;
  if ((self->_dsScanFlags & 4) != 0)
  {
LABEL_9:
    self->_unint64_t bleDiscoveryFlags = bleDiscoveryFlags | 0x1000000000000000;
    if (onceTokenDSScanManager != -1) {
      dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
    }
    id v6 = logObjDSScanManager;
    if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "Set DSAction Discovery flag", v7, 2u);
    }
    unint64_t bleDiscoveryFlags = self->_bleDiscoveryFlags;
  }
LABEL_14:
  if (bleDiscoveryFlags) {
    self->_unint64_t bleDiscoveryFlags = bleDiscoveryFlags | 0x1002000000;
  }
}

- (BOOL)_shouldUpdateDiscovery
{
  bleDiscovery = self->_bleDiscovery;
  if (bleDiscovery)
  {
    if ([(CBDiscovery *)bleDiscovery discoveryFlags] == self->_bleDiscoveryFlags)
    {
      LOBYTE(bleDiscovery) = 0;
    }
    else
    {
      if (onceTokenDSScanManager != -1) {
        dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
      }
      id v4 = logObjDSScanManager;
      if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "Discovery flags need to be updated", v6, 2u);
      }
      LOBYTE(bleDiscovery) = 1;
    }
  }
  return (char)bleDiscovery;
}

- (void)stopScanning
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSScanManager != -1) {
    dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
  }
  id v3 = logObjDSScanManager;
  if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Stopping Scan", v7, 2u);
  }
  [(CBDiscovery *)self->_bleDiscovery invalidate];
  bleDiscovery = self->_bleDiscovery;
  self->_bleDiscovery = 0;

  self->_unint64_t bleDiscoveryFlags = 0;
  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0;

  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0;
}

- (void)_deviceFound:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (onceTokenDSScanManager != -1) {
    dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
  }
  id v5 = logObjDSScanManager;
  if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "Device found %@", (uint8_t *)&v7, 0xCu);
  }
  id deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
  if (deviceFoundHandler) {
    deviceFoundHandler[2](deviceFoundHandler, v4);
  }
}

- (void)_deviceLost:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (onceTokenDSScanManager != -1) {
    dispatch_once(&onceTokenDSScanManager, &__block_literal_global_3);
  }
  id v5 = logObjDSScanManager;
  if (os_log_type_enabled((os_log_t)logObjDSScanManager, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "Device lost %@", (uint8_t *)&v7, 0xCu);
  }
  id deviceLostHandler = (void (**)(id, id))self->_deviceLostHandler;
  if (deviceLostHandler) {
    deviceLostHandler[2](deviceLostHandler, v4);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)dsScanFlags
{
  return self->_dsScanFlags;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bleDiscovery, 0);
}

@end