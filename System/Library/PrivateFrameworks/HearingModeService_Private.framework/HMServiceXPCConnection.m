@interface HMServiceXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)audiogramsReported;
- (BOOL)entitled;
- (HMServiceClient)hearingModeClient;
- (HMServiceDaemon)daemon;
- (NSMutableDictionary)records;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (void)clientActivate:(id)a3 completion:(id)a4;
- (void)clientFetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5;
- (void)clientModifyDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)clientReportDiagnosticRecord:(id)a3;
- (void)clientReportHMDeviceRecordChanged:(id)a3;
- (void)clientReportHMDeviceRecordLost:(id)a3;
- (void)clientReportValidAudiograms:(id)a3 invalidAudiograms:(id)a4 error:(id)a5;
- (void)clientSetOcclusionIndicationShownForDeviceAddress:(id)a3 featureID:(int)a4 type:(int)a5 action:(int)a6;
- (void)clientTriggerFetchAudiograms:(id)a3 completion:(id)a4;
- (void)clientTriggerOnDemandDiagnosticCheckForDeviceIdentifier:(id)a3 completion:(id)a4;
- (void)setAudiogramsReported:(BOOL)a3;
- (void)setDaemon:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setHearingModeClient:(id)a3;
- (void)setRecords:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)xpcConnectionInvalidated;
@end

@implementation HMServiceXPCConnection

- (HMServiceClient)hearingModeClient
{
  return self->_hearingModeClient;
}

- (void)clientReportValidAudiograms:(id)a3 invalidAudiograms:(id)a4 error:(id)a5
{
  if (!self->_audiogramsReported)
  {
    xpcCnx = self->_xpcCnx;
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    v12 = [(NSXPCConnection *)xpcCnx remoteObjectProxy];
    [v12 clientHMAvailableAudiograms:v11 invalidAudiograms:v10 error:v9];

    self->_audiogramsReported = 1;
  }
}

- (BOOL)audiogramsReported
{
  return self->_audiogramsReported;
}

- (void)clientActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __52__HMServiceXPCConnection_clientActivate_completion___block_invoke;
  v23[3] = &unk_265362CD0;
  v25 = &v26;
  id v9 = v8;
  id v24 = v9;
  id v10 = (void (**)(void))MEMORY[0x253398690](v23);
  if (gLogCategory_HMServiceDaemon <= 10
    && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
  {
    id v17 = v7;
    LogPrintF();
  }
  id v11 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  BOOL v12 = -[HMServiceXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v17);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    objc_storeStrong((id *)&self->_hearingModeClient, a3);
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
    [(HMServiceDaemon *)self->_daemon _update];
    v13 = +[HMDeviceManager sharedInstance];
    v14 = [v13 availableRecords];

    if (gLogCategory_HMServiceDaemon <= 30
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v18 = [v14 count];
      LogPrintF();
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __52__HMServiceXPCConnection_clientActivate_completion___block_invoke_2;
    v21[3] = &unk_265362B58;
    v21[4] = self;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v21, v18);
    if ([v7 internalFlags])
    {
      v15 = +[HMDeviceManager sharedInstance];
      v16 = [v15 availableDiagnosticRecords];

      if (gLogCategory_HMServiceDaemon <= 30
        && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
      {
        uint64_t v19 = [v16 count];
        LogPrintF();
      }
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __52__HMServiceXPCConnection_clientActivate_completion___block_invoke_3;
      v20[3] = &unk_265362CF8;
      v20[4] = self;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v20, v19);
    }
  }
  v10[2](v10);

  _Block_object_dispose(&v26, 8);
}

uint64_t __52__HMServiceXPCConnection_clientActivate_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_HMServiceDaemon <= 90
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    result = *(void *)(v1 + 32);
    if (result)
    {
      v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  v5 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.HearingModeService"];
  int v6 = [v5 isEqual:MEMORY[0x263EFFA88]];

  if (v6)
  {
    LOBYTE(v3) = 1;
    self->_entitled = 1;
    return v3;
  }
  if (gLogCategory_HMServiceDaemon > 90)
  {
LABEL_8:
    LOBYTE(v3) = 0;
    return v3;
  }
  if (gLogCategory_HMServiceDaemon != -1 || (int v3 = _LogCategory_Initialize()) != 0)
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
    goto LABEL_8;
  }
  return v3;
}

- (void)setXpcCnx:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setDaemon:(id)a3
{
}

- (void)xpcConnectionInvalidated
{
  id v8 = self->_hearingModeClient;
  hearingModeClient = self->_hearingModeClient;
  self->_hearingModeClient = 0;

  v5 = v8;
  if (v8)
  {
    if (gLogCategory_HMServiceDaemon <= 10)
    {
      if (gLogCategory_HMServiceDaemon != -1 || (int v6 = _LogCategory_Initialize(), v5 = v8, v6))
      {
        id v7 = v5;
        LogPrintF();
        v5 = v8;
      }
    }
    uint64_t v4 = [(HMServiceClient *)v5 invalidate];
    v5 = v8;
  }
  MEMORY[0x270F9A758](v4, v5);
}

uint64_t __52__HMServiceXPCConnection_clientActivate_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientReportHMDeviceRecordChanged:");
}

uint64_t __52__HMServiceXPCConnection_clientActivate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientReportDiagnosticRecord:");
}

- (void)clientFetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  id v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __93__HMServiceXPCConnection_clientFetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke;
  v17[3] = &unk_265362CD0;
  uint64_t v19 = &v20;
  id v10 = v9;
  id v18 = v10;
  id v11 = (void (**)(void))MEMORY[0x253398690](v17);
  if (v8)
  {
    BOOL v12 = (id *)(v21 + 5);
    id obj = (id)v21[5];
    BOOL v13 = [(HMServiceXPCConnection *)self _entitledAndReturnError:&obj];
    objc_storeStrong(v12, obj);
    if (v13) {
      [(HMServiceDaemon *)self->_daemon _fetchOcclusionResultForDeviceIdentifier:v8 featureID:v6 completion:v10];
    }
  }
  else
  {
    uint64_t v14 = NSErrorF();
    v15 = (void *)v21[5];
    void v21[5] = v14;
  }
  v11[2](v11);

  _Block_object_dispose(&v20, 8);
}

uint64_t __93__HMServiceXPCConnection_clientFetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_HMServiceDaemon <= 90
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    result = *(void *)(v1 + 32);
    if (result)
    {
      v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

- (void)clientModifyDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__1;
  uint64_t v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __73__HMServiceXPCConnection_clientModifyDeviceConfig_identifier_completion___block_invoke;
  v19[3] = &unk_265362CD0;
  v21 = &v22;
  id v11 = v10;
  id v20 = v11;
  BOOL v12 = (void (**)(void))MEMORY[0x253398690](v19);
  if (v9 && v8)
  {
    BOOL v13 = (id *)(v23 + 5);
    id obj = (id)v23[5];
    BOOL v14 = [(HMServiceXPCConnection *)self _entitledAndReturnError:&obj];
    objc_storeStrong(v13, obj);
    if (v14)
    {
      if (gLogCategory_HMServiceDaemon <= 30
        && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HMServiceDaemon _modifyDeviceConfig:identifier:completion:](self->_daemon, "_modifyDeviceConfig:identifier:completion:", v8, v9, v11, v8);
      }
      else
      {
        -[HMServiceDaemon _modifyDeviceConfig:identifier:completion:](self->_daemon, "_modifyDeviceConfig:identifier:completion:", v8, v9, v11, v17);
      }
    }
  }
  else
  {
    uint64_t v15 = NSErrorF();
    v16 = (void *)v23[5];
    v23[5] = v15;
  }
  v12[2](v12);

  _Block_object_dispose(&v22, 8);
}

uint64_t __73__HMServiceXPCConnection_clientModifyDeviceConfig_identifier_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_HMServiceDaemon <= 90
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    result = *(void *)(v1 + 32);
    if (result)
    {
      v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

- (void)clientReportHMDeviceRecordChanged:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 bluetoothUUID];
  if (v4)
  {
    v5 = [v10 bluetoothAddress];
    if (v5)
    {
      records = self->_records;
      if (!records)
      {
        id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v8 = self->_records;
        self->_records = v7;

        records = self->_records;
      }
      [(NSMutableDictionary *)records setObject:v10 forKeyedSubscript:v4];
      if (self->_hearingModeClient)
      {
        id v9 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
        [v9 clientHMDeviceRecordChanged:v10];
      }
    }
  }
}

- (void)clientReportHMDeviceRecordLost:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 bluetoothUUID];
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_records objectForKeyedSubscript:v4];

    if (v5)
    {
      hearingModeClient = self->_hearingModeClient;
      if (hearingModeClient)
      {
        records = self->_records;
        id v8 = hearingModeClient;
        [(NSMutableDictionary *)records setObject:0 forKeyedSubscript:v4];
        id v9 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];

        [v9 clientHMDeviceRecordLost:v10];
      }
    }
  }
}

- (void)clientReportDiagnosticRecord:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 bluetoothUUID];
  if (v4)
  {
    v5 = [v7 bluetoothAddress];
    if (v5 && self->_hearingModeClient)
    {
      uint64_t v6 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
      [v6 clientHMDeviceDiagnosticRecordFound:v7];
    }
  }
}

- (void)clientSetOcclusionIndicationShownForDeviceAddress:(id)a3 featureID:(int)a4 type:(int)a5 action:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__1;
  id v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __98__HMServiceXPCConnection_clientSetOcclusionIndicationShownForDeviceAddress_featureID_type_action___block_invoke;
  v22[3] = &unk_265362D20;
  v22[4] = &v23;
  id v11 = (void (**)(void))MEMORY[0x253398690](v22);
  BOOL v12 = (id *)(v24 + 5);
  id obj = (id)v24[5];
  LOBYTE(self) = [(HMServiceXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v12, obj);
  if (self)
  {
    if (gLogCategory_HMServiceDaemon <= 10
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      if (v7 > 8) {
        BOOL v13 = "?";
      }
      else {
        BOOL v13 = off_265362D40[(int)v7];
      }
      if (v8 > 3) {
        BOOL v14 = "?";
      }
      else {
        BOOL v14 = off_265362D88[(int)v8];
      }
      if (v6 > 4) {
        uint64_t v15 = "?";
      }
      else {
        uint64_t v15 = off_265362DA8[(int)v6];
      }
      uint64_t v19 = v14;
      id v20 = v15;
      id v17 = v10;
      id v18 = v13;
      LogPrintF();
    }
    v16 = +[HMDeviceManager sharedInstance];
    [v16 occlusionIndicationShownForDeviceAddress:v10 featureID:v8 type:v7 action:v6];
  }
  v11[2](v11);

  _Block_object_dispose(&v23, 8);
}

uint64_t __98__HMServiceXPCConnection_clientSetOcclusionIndicationShownForDeviceAddress_featureID_type_action___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_HMServiceDaemon <= 90)
    {
      if (gLogCategory_HMServiceDaemon != -1) {
        return LogPrintF();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

- (void)clientTriggerFetchAudiograms:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  uint64_t v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__HMServiceXPCConnection_clientTriggerFetchAudiograms_completion___block_invoke;
  v15[3] = &unk_265362CD0;
  id v17 = &v18;
  id v9 = v8;
  id v16 = v9;
  id v10 = (void (**)(void))MEMORY[0x253398690](v15);
  id v11 = (id *)(v19 + 5);
  id obj = (id)v19[5];
  BOOL v12 = [(HMServiceXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v11, obj);
  if (v12)
  {
    objc_storeStrong((id *)&self->_hearingModeClient, a3);
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
    self->_audiogramsReported = 0;
    BOOL v13 = +[HMHealthKitUtilities sharedInstance];
    [v13 startAudiogramQuery];
  }
  v10[2](v10);

  _Block_object_dispose(&v18, 8);
}

uint64_t __66__HMServiceXPCConnection_clientTriggerFetchAudiograms_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_HMServiceDaemon <= 90
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    result = *(void *)(v1 + 32);
    if (result)
    {
      v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

- (void)clientTriggerOnDemandDiagnosticCheckForDeviceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__1;
  id v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __93__HMServiceXPCConnection_clientTriggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke;
  v16[3] = &unk_265362CD0;
  uint64_t v18 = &v19;
  id v8 = v7;
  id v17 = v8;
  id v9 = (void (**)(void))MEMORY[0x253398690](v16);
  if (v6)
  {
    id v10 = (id *)(v20 + 5);
    id obj = (id)v20[5];
    BOOL v11 = [(HMServiceXPCConnection *)self _entitledAndReturnError:&obj];
    objc_storeStrong(v10, obj);
    if (v11)
    {
      if (gLogCategory_HMServiceDaemon <= 30
        && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HMServiceDaemon _triggerDiagnosticCheckForIdentifier:completion:](self->_daemon, "_triggerDiagnosticCheckForIdentifier:completion:", v6, v8, v6);
      }
      else
      {
        -[HMServiceDaemon _triggerDiagnosticCheckForIdentifier:completion:](self->_daemon, "_triggerDiagnosticCheckForIdentifier:completion:", v6, v8, v14);
      }
    }
  }
  else
  {
    uint64_t v12 = NSErrorF();
    BOOL v13 = (void *)v20[5];
    void v20[5] = v12;
  }
  v9[2](v9);

  _Block_object_dispose(&v19, 8);
}

uint64_t __93__HMServiceXPCConnection_clientTriggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_HMServiceDaemon <= 90
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    result = *(void *)(v1 + 32);
    if (result)
    {
      v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

- (void)setAudiogramsReported:(BOOL)a3
{
  self->_audiogramsReported = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (HMServiceDaemon)daemon
{
  return self->_daemon;
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (void)setHearingModeClient:(id)a3
{
}

- (NSMutableDictionary)records
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecords:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_hearingModeClient, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end