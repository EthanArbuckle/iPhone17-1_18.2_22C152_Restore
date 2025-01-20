@interface ACHAwardsKeyValueClient
- (ACHAwardsKeyValueClient)initWithHealthStore:(id)a3;
- (ACHAwardsKeyValueServerInterface)serverProxy;
- (BOOL)protectedDataAvailable;
- (BOOL)removeValuesForKeys:(id)a3 domain:(id)a4 error:(id *)a5;
- (BOOL)removeValuesForKeysInDomains:(id)a3 error:(id *)a4;
- (BOOL)setLegacyValuesWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)setValue:(id)a3 forKey:(id)a4 domain:(id)a5 error:(id *)a6;
- (BOOL)setValuesWithDictionary:(id)a3 domain:(id)a4 error:(id *)a5;
- (BOOL)setValuesWithDomainDictionary:(id)a3 error:(id *)a4;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSUUID)identifier;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)serverQueue;
- (id)exportedInterface;
- (id)injectedErrorHandler;
- (id)remoteInterface;
- (id)valueForKey:(id)a3 domain:(id)a4 error:(id *)a5;
- (id)valuesForKeys:(id)a3 domain:(id)a4 error:(id *)a5;
- (void)setClientQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInjectedErrorHandler:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)setServerProxy:(id)a3;
- (void)setServerQueue:(id)a3;
@end

@implementation ACHAwardsKeyValueClient

- (ACHAwardsKeyValueClient)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ACHAwardsKeyValueClient;
  v5 = [(ACHAwardsKeyValueClient *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08C38] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = HKCreateSerialDispatchQueueWithQOSClass();
    serverQueue = v5->_serverQueue;
    v5->_serverQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = HKCreateSerialDispatchQueueWithQOSClass();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263F0A818]) initWithHealthStore:v4 taskIdentifier:@"ActivityAchievementsAwardingKeyValueTaskServer" exportedObject:v5 taskUUID:v5->_identifier];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v12;
  }
  return v5;
}

- (BOOL)protectedDataAvailable
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(ACHAwardsKeyValueClient *)self proxyProvider];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke;
  v5[3] = &unk_264512448;
  v5[4] = &v6;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke_3;
  v4[3] = &unk_264512470;
  v4[4] = &v6;
  [v2 getSynchronousProxyWithHandler:v5 errorHandler:v4];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke_2;
  v3[3] = &unk_264512420;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_protectedDataAvailableWithCompletion:", v3);
}

uint64_t __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 domain:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v13 = [(ACHAwardsKeyValueClient *)self proxyProvider];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke;
  v22[3] = &unk_2645124C0;
  id v14 = v10;
  id v23 = v14;
  id v15 = v11;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  v26 = &v28;
  v27 = &v32;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke_3;
  v21[3] = &unk_264512470;
  v21[4] = &v32;
  [v13 getSynchronousProxyWithHandler:v22 errorHandler:v21];

  id v17 = (id)v33[5];
  v18 = v17;
  if (v17)
  {
    if (a6) {
      *a6 = v17;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v19 = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

uint64_t __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke_2;
  v6[3] = &unk_264512498;
  long long v7 = *(_OWORD *)(a1 + 56);
  return objc_msgSend(a2, "remote_setValue:forKey:domain:completion:", v2, v3, v4, v6);
}

void __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)setValuesWithDictionary:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  char v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v10 = [(ACHAwardsKeyValueClient *)self proxyProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke;
  v18[3] = &unk_2645124E8;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  v21 = &v23;
  v22 = &v27;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke_3;
  v17[3] = &unk_264512470;
  v17[4] = &v27;
  [v10 getSynchronousProxyWithHandler:v18 errorHandler:v17];

  id v13 = (id)v28[5];
  id v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v15 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

uint64_t __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke_2;
  v5[3] = &unk_264512498;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setValuesWithDictionary:domain:completion:", v2, v3, v5);
}

void __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)setValuesWithDomainDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  char v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  long long v7 = [(ACHAwardsKeyValueClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v18;
  id v17 = &v22;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v22;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v23[5];
  id v10 = v9;
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

uint64_t __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke_2;
  v4[3] = &unk_264512498;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_setValuesWithDomainDictionary:completion:", v2, v4);
}

void __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)setLegacyValuesWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  char v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  long long v7 = [(ACHAwardsKeyValueClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v18;
  id v17 = &v22;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v22;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v23[5];
  id v10 = v9;
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

uint64_t __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke_2;
  v4[3] = &unk_264512498;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_setLegacyValuesWithDictionary:completion:", v2, v4);
}

void __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)valueForKey:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v10 = [(ACHAwardsKeyValueClient *)self proxyProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke;
  v18[3] = &unk_2645124E8;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  char v21 = &v29;
  uint64_t v22 = &v23;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke_3;
  v17[3] = &unk_264512470;
  v17[4] = &v23;
  [v10 getSynchronousProxyWithHandler:v18 errorHandler:v17];

  id v13 = (id)v24[5];
  id v14 = v13;
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

uint64_t __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke_2;
  v5[3] = &unk_264512538;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_valueForKey:domain:completion:", v2, v3, v5);
}

void __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)valuesForKeys:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = objc_alloc_init(NSDictionary);
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v10 = [(ACHAwardsKeyValueClient *)self proxyProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke;
  v18[3] = &unk_2645124E8;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  char v21 = &v29;
  uint64_t v22 = &v23;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke_3;
  v17[3] = &unk_264512470;
  v17[4] = &v23;
  [v10 getSynchronousProxyWithHandler:v18 errorHandler:v17];

  id v13 = (id)v24[5];
  id v14 = v13;
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

uint64_t __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke_2;
  v5[3] = &unk_264512560;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_valuesForKeys:domain:completion:", v2, v3, v5);
}

void __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)removeValuesForKeys:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v10 = [(ACHAwardsKeyValueClient *)self proxyProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke;
  v18[3] = &unk_2645124E8;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  char v21 = &v23;
  uint64_t v22 = &v27;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke_3;
  v17[3] = &unk_264512470;
  v17[4] = &v27;
  [v10 getSynchronousProxyWithHandler:v18 errorHandler:v17];

  id v13 = (id)v28[5];
  id v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v15 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

uint64_t __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke_2;
  v5[3] = &unk_264512498;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_removeValuesForKeys:domain:completion:", v2, v3, v5);
}

void __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)removeValuesForKeysInDomains:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  char v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v7 = [(ACHAwardsKeyValueClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v18;
  id v17 = &v22;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v22;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v23[5];
  id v10 = v9;
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

uint64_t __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke_2;
  v4[3] = &unk_264512498;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_removeValuesForKeysInDomains:completion:", v2, v4);
}

void __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D0FFCF8];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D106690];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (ACHAwardsKeyValueServerInterface)serverProxy
{
  return self->_serverProxy;
}

- (void)setServerProxy:(id)a3
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
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end