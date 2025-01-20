@interface ATIDSSocket
- (ATIDSService)service;
- (ATIDSSocket)initWithDevice:(id)a3 service:(id)a4 priority:(int64_t)a5;
- (BOOL)open;
- (IDSDevice)device;
- (int64_t)priority;
- (void)addTransportUpgradeException;
- (void)closeDescriptor;
- (void)connectWithCompletion:(id)a3;
- (void)dealloc;
- (void)removeTransportUpgradeException;
@end

@implementation ATIDSSocket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_deviceConnection, 0);
}

- (int64_t)priority
{
  return self->_priority;
}

- (ATIDSService)service
{
  return self->_service;
}

- (IDSDevice)device
{
  return self->_device;
}

- (void)removeTransportUpgradeException
{
  v3.receiver = self;
  v3.super_class = (Class)ATIDSSocket;
  [(ATSocket *)&v3 removeTransportUpgradeException];
  if (![(ATSocket *)self transportUpdgradeExceptionCount])
  {
    [(ATIDSService *)self->_service setPreferWifi:0];
    [(ATSocket *)self setWriteBufferSize:self->_btWriteBufferSize];
  }
}

- (void)addTransportUpgradeException
{
  v3.receiver = self;
  v3.super_class = (Class)ATIDSSocket;
  [(ATSocket *)&v3 addTransportUpgradeException];
  if ([(ATSocket *)self transportUpdgradeExceptionCount] == 1)
  {
    [(ATIDSService *)self->_service setPreferWifi:1];
    [(ATSocket *)self setWriteBufferSize:self->_wifiWriteBufferSize];
  }
}

- (void)closeDescriptor
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_deviceConnection)
  {
    objc_super v3 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ closing IDS connection", (uint8_t *)&v5, 0xCu);
    }

    [(IDSDeviceConnection *)self->_deviceConnection close];
    [(ATSocket *)self setDescriptor:0];
    deviceConnection = self->_deviceConnection;
    self->_deviceConnection = 0;
  }
}

- (BOOL)open
{
  v3.receiver = self;
  v3.super_class = (Class)ATIDSSocket;
  return [(ATSocket *)&v3 open];
}

- (void)dealloc
{
  if ([(ATSocket *)self isOpen]) {
    [(ATSocket *)self close];
  }
  v3.receiver = self;
  v3.super_class = (Class)ATIDSSocket;
  [(ATSocket *)&v3 dealloc];
}

- (void)connectWithCompletion:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F6A8F8];
  v24[0] = &unk_1F33DCA58;
  uint64_t v6 = *MEMORY[0x1E4F6A8E8];
  v23[0] = v5;
  v23[1] = v6;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATIDSSocket priority](self, "priority"));
  v24[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  v9 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(IDSDevice *)self->_device uniqueID];
    *(_DWORD *)buf = 138543618;
    v20 = self;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ creating connection to %{public}@", buf, 0x16u);
  }
  id v11 = objc_alloc(MEMORY[0x1E4F6AAF0]);
  device = self->_device;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v18 = v4;
  id v13 = v4;
  v14 = [(ATSocket *)self queue];
  v15 = (IDSDeviceConnection *)[v11 initSocketWithDevice:device options:v8 completionHandler:&v17 queue:v14];
  deviceConnection = self->_deviceConnection;
  self->_deviceConnection = v15;
}

void __37__ATIDSSocket_connectWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = [*(id *)(v7 + 65672) uniqueID];
    int v11 = 138544130;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    v14 = v8;
    __int16 v15 = 1024;
    int v16 = a2;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ connection to %{public}@ completed. fd=%d, error=%{public}@", (uint8_t *)&v11, 0x26u);
  }
  v9 = *(void **)(a1 + 32);
  if (v5) {
    [v9 closeDescriptor];
  }
  else {
    [v9 setDescriptor:a2];
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);
  }
}

- (ATIDSSocket)initWithDevice:(id)a3 service:(id)a4 priority:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATIDSSocket;
  int v11 = [(ATSocket *)&v20 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a3);
    v12->_priority = a5;
    objc_storeStrong((id *)&v12->_service, a4);
    v12->_unsigned int wifiWriteBufferSize = 0x8000;
    v12->_unsigned int btWriteBufferSize = 0x8000;
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"IDSSocketWiFiWriteBufferSize", @"com.apple.atc", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && AppIntegerValue) {
      v12->_unsigned int wifiWriteBufferSize = AppIntegerValue << 10;
    }
    CFIndex v14 = CFPreferencesGetAppIntegerValue(@"IDSSocketBTWriteBufferSize", @"com.apple.atc", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && v14) {
      v12->_unsigned int btWriteBufferSize = v14 << 10;
    }
    __int16 v15 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int wifiWriteBufferSize = v12->_wifiWriteBufferSize;
      unsigned int btWriteBufferSize = v12->_btWriteBufferSize;
      *(_DWORD *)buf = 138543874;
      v22 = v12;
      __int16 v23 = 1024;
      unsigned int v24 = wifiWriteBufferSize;
      __int16 v25 = 1024;
      unsigned int v26 = btWriteBufferSize;
      _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ creating new IDS socket. _wifiWriteBufferSize=%uk, _btWriteBufferSize=%uk", buf, 0x18u);
    }

    [(ATSocket *)v12 setWriteBufferSize:v12->_btWriteBufferSize];
  }

  return v12;
}

@end