@interface BTCloudServicesClient
- (BTCloudServicesClient)init;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_interrupted;
- (void)_invalidated;
- (void)accountInfoWithCompletion:(id)a3;
- (void)cloudPairingIdentifierForPeripheral:(id)a3 completion:(id)a4;
- (void)createDeviceRecord:(id)a3 completion:(id)a4;
- (void)createDeviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)createMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)createSoundProfileRecord:(id)a3 completion:(id)a4;
- (void)deleteDeviceRecord:(id)a3 completion:(id)a4;
- (void)deleteDeviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)deleteMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)deleteSoundProfileRecordWithCompletion:(id)a3;
- (void)deviceRecord:(id)a3 completion:(id)a4;
- (void)deviceRecordsWithCompletion:(id)a3;
- (void)deviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)deviceSupportInformationRecordsWithCompletion:(id)a3;
- (void)fetchSoundProfileRecordWithCompletion:(id)a3;
- (void)forceCloudPairingForIdentifiers:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)magicSettingsRecord:(id)a3 completion:(id)a4;
- (void)magicSettingsRecordsWithCompletion:(id)a3;
- (void)modifyDeviceRecord:(id)a3 completion:(id)a4;
- (void)modifyDeviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)modifyMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)modifySoundProfileRecord:(id)a3 completion:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
@end

@implementation BTCloudServicesClient

- (BTCloudServicesClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)BTCloudServicesClient;
  v2 = [(BTCloudServicesClient *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BTCloudServicesClient", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    v3 = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    if (v3) {
      v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:v3];
    }
    else {
      v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.BluetoothCloudServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF20B68];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__BTCloudServicesClient__ensureXPCStarted__block_invoke;
    v11[3] = &unk_2644A0AF8;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__BTCloudServicesClient__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_2644A0AF8;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    objc_super v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF20BC8];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];
    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  return 0;
}

uint64_t __42__BTCloudServicesClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __42__BTCloudServicesClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_BTRootCloudServicesClient <= 50
    && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = (void (**)(void))MEMORY[0x223C23220](self->_interruptionHandler);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__BTCloudServicesClient_invalidate__block_invoke;
  block[3] = &unk_2644A0AF8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__BTCloudServicesClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8) = 1;
    if (!*(unsigned char *)(*(void *)(result + 32) + 9)
      && gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(id **)(v2 + 32);
    if (v3[2])
    {
      [v3[2] invalidate];
      v3 = *(id **)(v2 + 32);
    }
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_BTRootCloudServicesClient <= 50
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      uint64_t v3 = MEMORY[0x223C23220](self->_invalidationHandler, a2);
      id v4 = (void *)v3;
      if (v3) {
        (*(void (**)(uint64_t))(v3 + 16))(v3);
      }

      id interruptionHandler = self->_interruptionHandler;
      self->_id interruptionHandler = 0;

      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_BTRootCloudServicesClient <= 10
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)createDeviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke(id *a1)
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke_84;
  v12[3] = &unk_2644A0B20;
  v15 = &v16;
  id v13 = a1[4];
  id v14 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v17[5];
      v17[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 createDeviceRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v17[5];
    v17[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v16, 8);
}

uint64_t __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke_84(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modifyDeviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke(id *a1)
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  v15 = &v16;
  id v13 = a1[4];
  id v14 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v17[5];
      v17[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 modifyDeviceRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v17[5];
    v17[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v16, 8);
}

uint64_t __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteDeviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (a1[4])
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 deleteDeviceRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BTCloudServicesClient_deviceRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __49__BTCloudServicesClient_deviceRecord_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__BTCloudServicesClient_deviceRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (a1[4])
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __49__BTCloudServicesClient_deviceRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 fetchDeviceRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __49__BTCloudServicesClient_deviceRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __49__BTCloudServicesClient_deviceRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke;
  v7[3] = &unk_2644A0BC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke_2;
  v10[3] = &unk_2644A0B98;
  id v12 = &v13;
  id v11 = *(id *)(a1 + 40);
  id v2 = (void (**)(void))MEMORY[0x223C23220](v10);
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v3)
  {
    uint64_t v7 = BTErrorF();
    id v6 = (void *)v14[5];
    v14[5] = v7;
  }
  else
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke_3;
    v8[3] = &unk_2644A0B48;
    id v9 = *(id *)(a1 + 40);
    v5 = [v4 remoteObjectProxyWithErrorHandler:v8];
    [v5 fetchDeviceRecordsWithCompletion:*(void *)(a1 + 40)];

    id v6 = v9;
  }

  v2[2](v2);
  _Block_object_dispose(&v13, 8);
}

uint64_t __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke(id *a1)
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  uint64_t v15 = &v16;
  id v13 = a1[4];
  id v14 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v17[5];
      v17[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 createDeviceSupportInformationRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v17[5];
    v17[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v16, 8);
}

uint64_t __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modifyDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke(id *a1)
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  uint64_t v15 = &v16;
  id v13 = a1[4];
  id v14 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v17[5];
      v17[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 modifyDeviceSupportInformationRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v17[5];
    v17[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v16, 8);
}

uint64_t __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 deleteDeviceSupportInformationRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 fetchBTCloudDeviceSupportInformation:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deviceSupportInformationRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke;
  v7[3] = &unk_2644A0BC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke_2;
  v10[3] = &unk_2644A0B98;
  id v12 = &v13;
  id v11 = *(id *)(a1 + 40);
  id v2 = (void (**)(void))MEMORY[0x223C23220](v10);
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v3)
  {
    uint64_t v7 = BTErrorF();
    id v6 = (void *)v14[5];
    v14[5] = v7;
  }
  else
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke_3;
    v8[3] = &unk_2644A0B48;
    id v9 = *(id *)(a1 + 40);
    v5 = [v4 remoteObjectProxyWithErrorHandler:v8];
    [v5 fetchAllBTCloudDeviceSupportInformationWithCompletion:*(void *)(a1 + 40)];

    id v6 = v9;
  }

  v2[2](v2);
  _Block_object_dispose(&v13, 8);
}

uint64_t __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 createMagicSettingsRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modifyMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 modifyMagicSettingsRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 deleteMagicSettingsRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)magicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke_2;
  v12[3] = &unk_2644A0B20;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = (void *)*((void *)a1[5] + 2);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke_3;
      v10[3] = &unk_2644A0B48;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 fetchMagicSettingsRecord:a1[4] completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)magicSettingsRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__BTCloudServicesClient_magicSettingsRecordsWithCompletion___block_invoke;
  v7[3] = &unk_2644A0BE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __60__BTCloudServicesClient_magicSettingsRecordsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__BTCloudServicesClient_magicSettingsRecordsWithCompletion___block_invoke_2;
    v5[3] = &unk_2644A0B48;
    id v6 = *(id *)(a1 + 40);
    id v4 = [v3 remoteObjectProxyWithErrorHandler:v5];
    [v4 fetchAllMagicSettingsRecordsWithCompletion:*(void *)(a1 + 40)];
  }
}

uint64_t __60__BTCloudServicesClient_magicSettingsRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accountInfoWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke;
  v7[3] = &unk_2644A0BC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke_2;
  v10[3] = &unk_2644A0B98;
  id v12 = &v13;
  id v11 = *(id *)(a1 + 40);
  id v2 = (void (**)(void))MEMORY[0x223C23220](v10);
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v3)
  {
    uint64_t v7 = BTErrorF();
    id v6 = (void *)v14[5];
    v14[5] = v7;
  }
  else
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke_3;
    v8[3] = &unk_2644A0B48;
    id v9 = *(id *)(a1 + 40);
    v5 = [v4 remoteObjectProxyWithErrorHandler:v8];
    [v5 fetchCloudAccountInfoUpdatedWithCompletion:*(void *)(a1 + 40)];

    id v6 = v9;
  }

  v2[2](v2);
  _Block_object_dispose(&v13, 8);
}

uint64_t __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cloudPairingIdentifierForPeripheral:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke(id *a1)
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v2 = a1[4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke_2;
  v13[3] = &unk_2644A0B20;
  uint64_t v15 = &v16;
  v13[4] = v2;
  id v14 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v13);
  if (v2)
  {
    if (gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      id v10 = v2;
      LogPrintF();
    }
    id v4 = objc_msgSend(a1[5], "_ensureXPCStarted", v10);
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v17[5];
      v17[5] = v9;
    }
    else
    {
      v5 = (void *)*((void *)a1[5] + 2);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke_3;
      v11[3] = &unk_2644A0B48;
      id v12 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v11];
      [v6 fetchCloudPairingIdentifierForPeripheral:a1[4] completion:a1[6]];

      id v7 = v12;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v17[5];
    v17[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v16, 8);
}

uint64_t __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceCloudPairingForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke(id *a1)
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v2 = a1[4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke_2;
  v13[3] = &unk_2644A0B20;
  uint64_t v15 = &v16;
  v13[4] = v2;
  id v14 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v13);
  if (v2)
  {
    if (gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      id v10 = v2;
      LogPrintF();
    }
    id v4 = objc_msgSend(a1[5], "_ensureXPCStarted", v10);
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v17[5];
      v17[5] = v9;
    }
    else
    {
      v5 = (void *)*((void *)a1[5] + 2);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke_3;
      v11[3] = &unk_2644A0B48;
      id v12 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v11];
      [v6 forceCloudPairingForIdentifiers:v2 completion:a1[6]];

      id v7 = v12;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v17[5];
    v17[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v16, 8);
}

uint64_t __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createSoundProfileRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke(id *a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  id v2 = a1[4];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_2;
  v16[3] = &unk_2644A0B20;
  v19 = &v20;
  id v17 = a1[4];
  id v18 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v16);
  if (v2
    && ([v2 soundProfileData], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    if (gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      id v11 = v2;
      LogPrintF();
    }
    v5 = objc_msgSend(a1[5], "_ensureXPCStarted", v11);
    if (v5)
    {
      uint64_t v10 = BTErrorF();
      id v6 = (id)v21[5];
      v21[5] = v10;
    }
    else
    {
      id v6 = *((id *)a1[5] + 2);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_3;
      v14[3] = &unk_2644A0B48;
      id v15 = a1[6];
      id v7 = [v6 remoteObjectProxyWithErrorHandler:v14];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_4;
      v12[3] = &unk_2644A0C10;
      id v8 = a1[6];
      void v12[5] = v6;
      id v13 = v8;
      void v12[4] = v2;
      [v7 startSoundProfileRecordFileHandleSessionWithCompletion:v12];
    }
  }
  else
  {
    uint64_t v9 = BTErrorF();
    v5 = (void *)v21[5];
    v21[5] = v9;
  }

  v3[2](v3);
  _Block_object_dispose(&v20, 8);
}

uint64_t __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  id v20 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_5;
  v16[3] = &unk_2644A0B98;
  id v18 = v19;
  id v17 = *(id *)(a1 + 48);
  id v7 = (void (**)(void))MEMORY[0x223C23220](v16);
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = v5;
    if (v8)
    {
      if (gLogCategory_BTRootCloudServicesClient <= 40
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v9 = [*(id *)(a1 + 32) soundProfileData];
      [v8 writeData:v9];

      if (gLogCategory_BTRootCloudServicesClient <= 40
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_6;
      v14[3] = &unk_2644A0B48;
      uint64_t v10 = *(void **)(a1 + 40);
      id v15 = *(id *)(a1 + 48);
      id v11 = [v10 remoteObjectProxyWithErrorHandler:v14];
      [v11 finishSoundProfileRecordSessionHandle:v8 completion:*(void *)(a1 + 48)];

      id v12 = v15;
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v12 = BTErrorF();
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v12);
    }
  }
  v7[2](v7);

  _Block_object_dispose(v19, 8);
}

uint64_t __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_5(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSoundProfileRecordWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke;
  v7[3] = &unk_2644A0BC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke_2;
  v10[3] = &unk_2644A0B98;
  id v12 = &v13;
  id v11 = *(id *)(a1 + 40);
  id v2 = (void (**)(void))MEMORY[0x223C23220](v10);
  if (gLogCategory_BTRootCloudServicesClient <= 30
    && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v3)
  {
    uint64_t v7 = BTErrorF();
    id v6 = (void *)v14[5];
    v14[5] = v7;
  }
  else
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke_3;
    v8[3] = &unk_2644A0B48;
    id v9 = *(id *)(a1 + 40);
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v8];
    [v5 fetchSoundProfileRecordWithCompletion:*(void *)(a1 + 40)];

    id v6 = v9;
  }

  v2[2](v2);
  _Block_object_dispose(&v13, 8);
}

uint64_t __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modifySoundProfileRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__BTCloudServicesClient_modifySoundProfileRecord_completion___block_invoke;
  block[3] = &unk_2644A0B70;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __61__BTCloudServicesClient_modifySoundProfileRecord_completion___block_invoke(id *a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v2 = a1[4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__BTCloudServicesClient_modifySoundProfileRecord_completion___block_invoke_2;
  v10[3] = &unk_2644A0B98;
  id v12 = &v13;
  id v11 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x223C23220](v10);
  if (v2
    && ([v2 soundProfileData], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    if (gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      id v9 = v2;
      LogPrintF();
    }
    id v6 = objc_msgSend(a1[5], "_ensureXPCStarted", v9);
    if (v6)
    {
      uint64_t v7 = BTErrorF();
      id v8 = (void *)v14[5];
      v14[5] = v7;
    }
    else
    {
      [a1[5] createSoundProfileRecord:a1[4] completion:a1[6]];
    }
  }
  else
  {
    uint64_t v5 = BTErrorF();
    id v6 = (void *)v14[5];
    v14[5] = v5;
  }

  v3[2](v3);
  _Block_object_dispose(&v13, 8);
}

uint64_t __61__BTCloudServicesClient_modifySoundProfileRecord_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

- (void)deleteSoundProfileRecordWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke;
  v7[3] = &unk_2644A0BC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke_2;
  v10[3] = &unk_2644A0B98;
  id v12 = &v13;
  id v11 = *(id *)(a1 + 40);
  id v2 = (void (**)(void))MEMORY[0x223C23220](v10);
  if (gLogCategory_BTRootCloudServicesClient <= 30
    && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v3)
  {
    uint64_t v7 = BTErrorF();
    id v6 = (void *)v14[5];
    v14[5] = v7;
  }
  else
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke_3;
    v8[3] = &unk_2644A0B48;
    id v9 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v8];
    [v5 deleteSoundProfileRecordWithCompletion:*(void *)(a1 + 40)];

    id v6 = v9;
  }

  v2[2](v2);
  _Block_object_dispose(&v13, 8);
}

uint64_t __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end