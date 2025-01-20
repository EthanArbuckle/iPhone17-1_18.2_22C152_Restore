@interface ACHAwardsClient
- (ACHAwardsClient)initWithHealthStore:(id)a3;
- (ACHAwardsServerInterface)serverProxy;
- (BOOL)addEarnedInstances:(id)a3 error:(id *)a4;
- (BOOL)addTemplates:(id)a3 error:(id *)a4;
- (BOOL)addTemplates:(id)a3 removingTemplates:(id)a4 error:(id *)a5;
- (BOOL)isProtectedDataAvailable;
- (BOOL)removeAllEarnedInstancesWithError:(id *)a3;
- (BOOL)removeAllTemplatesWithError:(id *)a3;
- (BOOL)removeEarnedInstances:(id)a3 error:(id *)a4;
- (BOOL)removeEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4;
- (BOOL)removeTemplate:(id)a3 error:(id *)a4;
- (BOOL)removeTemplates:(id)a3 error:(id *)a4;
- (HKNanoSyncControl)nanoSyncControl;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSUUID)identifier;
- (id)addEarnedInstances:(id)a3 removingEarnedInstances:(id)a4 error:(id *)a5;
- (id)countOfEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4;
- (id)countOfEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4;
- (id)exportedInterface;
- (id)fetchAllEarnedInstancesWithError:(id *)a3;
- (id)fetchAllTemplatesWithError:(id *)a3;
- (id)fetchEarnedInstancesForEarnedDateComponents:(id)a3 error:(id *)a4;
- (id)fetchEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4;
- (id)fetchMostRecentEarnedInstanceForTemplateUniqueName:(id)a3 error:(id *)a4;
- (id)fetchMostRecentEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4;
- (id)injectedErrorHandler;
- (void)setIdentifier:(id)a3;
- (void)setInjectedErrorHandler:(id)a3;
- (void)setNanoSyncControl:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)setServerProxy:(id)a3;
- (void)triggerSyncWithCompletion:(id)a3;
@end

@implementation ACHAwardsClient

- (ACHAwardsClient)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHAwardsClient;
  v5 = [(ACHAwardsClient *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08C38] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F0A818]) initWithHealthStore:v4 taskIdentifier:@"ActivityAchievementsAwardingTaskServer" exportedObject:v5 taskUUID:v5->_identifier];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F0A558]) initWithHealthStore:v4];
    nanoSyncControl = v5->_nanoSyncControl;
    v5->_nanoSyncControl = (HKNanoSyncControl *)v10;
  }
  return v5;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D106810];
}

- (BOOL)isProtectedDataAvailable
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(ACHAwardsClient *)self proxyProvider];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke;
  v5[3] = &unk_264512448;
  v5[4] = &v6;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke_3;
  v4[3] = &unk_264512470;
  v4[4] = &v6;
  [v2 getSynchronousProxyWithHandler:v5 errorHandler:v4];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke_2;
  v3[3] = &unk_264512420;
  v3[4] = *(void *)(a1 + 32);
  return [a2 protectedDataAvailableWithCompletion:v3];
}

uint64_t __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

- (id)fetchAllTemplatesWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  id v4 = [(ACHAwardsClient *)self proxyProvider];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke;
  v10[3] = &unk_264512798;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke_3;
  v9[3] = &unk_264512470;
  v9[4] = &v11;
  [v4 getSynchronousProxyWithHandler:v10 errorHandler:v9];

  id v5 = (id)v12[5];
  uint64_t v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke_2;
  v3[3] = &unk_2645126D0;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchAllTemplatesWithCompletion:", v3);
}

void __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)addTemplates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __38__ACHAwardsClient_addTemplates_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__ACHAwardsClient_addTemplates_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v11 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __38__ACHAwardsClient_addTemplates_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__ACHAwardsClient_addTemplates_error___block_invoke_2;
  v4[3] = &unk_264512498;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_addTemplates:completion:", v2, v4);
}

void __38__ACHAwardsClient_addTemplates_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __38__ACHAwardsClient_addTemplates_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)addTemplates:(id)a3 removingTemplates:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__2;
  char v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  uint64_t v10 = [(ACHAwardsClient *)self proxyProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke;
  v18[3] = &unk_2645124E8;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  v21 = &v29;
  id v22 = &v23;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke_3;
  v17[3] = &unk_264512470;
  v17[4] = &v23;
  [v10 getSynchronousProxyWithHandler:v18 errorHandler:v17];

  id v13 = (id)v24[5];
  v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v15 = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v15;
}

uint64_t __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke_2;
  v5[3] = &unk_264512498;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_addTemplates:removingTemplates:completion:", v2, v3, v5);
}

void __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)removeTemplate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__ACHAwardsClient_removeTemplate_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__ACHAwardsClient_removeTemplate_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v11 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

void __40__ACHAwardsClient_removeTemplate_error___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  v8[0] = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  long long v5 = [v3 arrayWithObjects:v8 count:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__ACHAwardsClient_removeTemplate_error___block_invoke_2;
  v6[3] = &unk_264512498;
  long long v7 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "remote_removeTemplates:completion:", v5, v6);
}

void __40__ACHAwardsClient_removeTemplate_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __40__ACHAwardsClient_removeTemplate_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)removeTemplates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  long long v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__ACHAwardsClient_removeTemplates_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__ACHAwardsClient_removeTemplates_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v11 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __41__ACHAwardsClient_removeTemplates_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__ACHAwardsClient_removeTemplates_error___block_invoke_2;
  v4[3] = &unk_264512498;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_removeTemplates:completion:", v2, v4);
}

void __41__ACHAwardsClient_removeTemplates_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __41__ACHAwardsClient_removeTemplates_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)removeAllTemplatesWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  id v4 = [(ACHAwardsClient *)self proxyProvider];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke;
  v10[3] = &unk_264512798;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke_3;
  v9[3] = &unk_264512470;
  v9[4] = &v11;
  [v4 getSynchronousProxyWithHandler:v10 errorHandler:v9];

  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke_2;
  v3[3] = &unk_264512498;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_removeAllTemplatesWithCompletion:", v3);
}

void __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)addEarnedInstances:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__2;
  uint64_t v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  char v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__ACHAwardsClient_addEarnedInstances_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v18;
  uint64_t v17 = &v22;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__ACHAwardsClient_addEarnedInstances_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v22;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v23[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v11 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

uint64_t __44__ACHAwardsClient_addEarnedInstances_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__ACHAwardsClient_addEarnedInstances_error___block_invoke_2;
  v4[3] = &unk_264512498;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_addEarnedInstances:completion:", v2, v4);
}

void __44__ACHAwardsClient_addEarnedInstances_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __44__ACHAwardsClient_addEarnedInstances_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)removeEarnedInstances:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  char v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v11 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke_2;
  v4[3] = &unk_264512498;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_removeEarnedInstances:completion:", v2, v4);
}

void __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)addEarnedInstances:(id)a3 removingEarnedInstances:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  char v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__2;
  char v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  uint64_t v10 = [(ACHAwardsClient *)self proxyProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke;
  v18[3] = &unk_2645124E8;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  char v21 = &v29;
  uint64_t v22 = &v23;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke_3;
  v17[3] = &unk_264512470;
  v17[4] = &v23;
  [v10 getSynchronousProxyWithHandler:v18 errorHandler:v17];

  id v13 = (id)v24[5];
  v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v15 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke_2;
  v5[3] = &unk_2645126D0;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_addEarnedInstances:removingEarnedInstances:completion:", v2, v3, v5);
}

void __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)removeEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v11 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke_2;
  v4[3] = &unk_264512498;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_removeEarnedInstancesForTemplateUniqueName:completion:", v2, v4);
}

void __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)removeAllEarnedInstancesWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  long long v4 = [(ACHAwardsClient *)self proxyProvider];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke;
  v10[3] = &unk_264512798;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke_3;
  v9[3] = &unk_264512470;
  v9[4] = &v11;
  [v4 getSynchronousProxyWithHandler:v10 errorHandler:v9];

  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke_2;
  v3[3] = &unk_264512498;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_removeAllEarnedInstancesWithCompletion:", v3);
}

void __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)fetchAllEarnedInstancesWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__2;
  char v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  long long v4 = [(ACHAwardsClient *)self proxyProvider];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke;
  v10[3] = &unk_264512798;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke_3;
  v9[3] = &unk_264512470;
  v9[4] = &v11;
  [v4 getSynchronousProxyWithHandler:v10 errorHandler:v9];

  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke_2;
  v3[3] = &unk_2645126D0;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchAllEarnedInstancesWithCompletion:", v3);
}

void __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)fetchEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  char v27 = __Block_byref_object_copy__2;
  id v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v11 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke_2;
  v4[3] = &unk_2645126D0;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchEarnedInstancesForTemplateUniqueName:completion:", v2, v4);
}

void __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)fetchMostRecentEarnedInstanceForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  char v27 = __Block_byref_object_copy__2;
  id v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v11 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke_2;
  v4[3] = &unk_2645127C0;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchMostRecentEarnedInstanceForTemplateUniqueName:completion:", v2, v4);
}

void __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)fetchEarnedInstancesForEarnedDateComponents:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = ACHYearMonthDayStringFromDateComponents(v6);
  if (v7)
  {
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__2;
    char v32 = __Block_byref_object_dispose__2;
    id v33 = 0;
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__2;
    uint64_t v26 = __Block_byref_object_dispose__2;
    id v27 = 0;
    id v8 = [(ACHAwardsClient *)self proxyProvider];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke;
    v18[3] = &unk_264512510;
    id v19 = v7;
    uint64_t v20 = &v28;
    char v21 = &v22;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke_3;
    v17[3] = &unk_264512470;
    v17[4] = &v22;
    [v8 getSynchronousProxyWithHandler:v18 errorHandler:v17];

    id v9 = (id)v23[5];
    uint64_t v10 = v9;
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v15 = (id)v29[5];
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    v35[0] = @"Unable to parse date components";
    id v12 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v13 = [v11 errorWithDomain:@"com.apple.ActivityAchievements" code:133 userInfo:v12];
    v14 = v13;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v15 = 0;
  }

  return v15;
}

uint64_t __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke_2;
  v4[3] = &unk_2645126D0;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchEarnedInstancesForEarnedDateComponentsString:completion:", v2, v4);
}

void __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)countOfEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (v19[5])
  {
    id v11 = 0;
  }
  else
  {
    id v11 = [NSNumber numberWithUnsignedInteger:v25[3]];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke_2;
  v4[3] = &unk_2645126F8;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_countOfEarnedInstancesForTemplateUniqueName:completion:", v2, v4);
}

void __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)fetchMostRecentEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  uint64_t v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (v19[5]) {
    id v11 = 0;
  }
  else {
    id v11 = (id)v25[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke_2;
  v4[3] = &unk_264512560;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames:completion:", v2, v4);
}

void __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)countOfEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  uint64_t v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v7 = [(ACHAwardsClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (v19[5]) {
    id v11 = 0;
  }
  else {
    id v11 = (id)v25[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke_2;
  v4[3] = &unk_264512560;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_countOfEarnedInstancesForUniqueNames:completion:", v2, v4);
}

void __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)triggerSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHAwardsClient *)self nanoSyncControl];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__ACHAwardsClient_triggerSyncWithCompletion___block_invoke;
  v7[3] = &unk_2645127E8;
  id v8 = v4;
  id v6 = v4;
  [v5 forceNanoSyncWithOptions:0 completion:v7];
}

uint64_t __45__ACHAwardsClient_triggerSyncWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (ACHAwardsServerInterface)serverProxy
{
  return self->_serverProxy;
}

- (void)setServerProxy:(id)a3
{
}

- (HKNanoSyncControl)nanoSyncControl
{
  return self->_nanoSyncControl;
}

- (void)setNanoSyncControl:(id)a3
{
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
}

- (id)injectedErrorHandler
{
  return self->_injectedErrorHandler;
}

- (void)setInjectedErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_injectedErrorHandler, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_nanoSyncControl, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end