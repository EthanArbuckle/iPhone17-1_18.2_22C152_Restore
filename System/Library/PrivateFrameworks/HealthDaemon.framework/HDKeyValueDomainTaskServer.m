@interface HDKeyValueDomainTaskServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDKeyValueDomainTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_unitTest_overrideKeyValueDomainCategory:(int64_t)a3;
- (void)didUpdateKeyValueDomain:(id)a3;
- (void)remote_allValuesWithCompletion:(id)a3;
- (void)remote_dataForKey:(id)a3 completion:(id)a4;
- (void)remote_dateForKey:(id)a3 completion:(id)a4;
- (void)remote_numberForKey:(id)a3 completion:(id)a4;
- (void)remote_observeChanges:(BOOL)a3 completion:(id)a4;
- (void)remote_removeValuesForKeys:(id)a3 completion:(id)a4;
- (void)remote_setData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)remote_setDate:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)remote_setNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)remote_setString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)remote_setValueForAllKeys:(id)a3 completion:(id)a4;
- (void)remote_setValuesWithDictionary:(id)a3 completion:(id)a4;
- (void)remote_stringForKey:(id)a3 completion:(id)a4;
@end

@implementation HDKeyValueDomainTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F29EE0];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (HDKeyValueDomainTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HDKeyValueDomainTaskServer;
  v12 = [(HDStandardTaskServer *)&v23 initWithUUID:a3 configuration:v10 client:v11 delegate:a6];
  if (v12)
  {
    unint64_t v13 = [v10 category];
    if (v13 > 4) {
      uint64_t v14 = -1;
    }
    else {
      uint64_t v14 = *(void *)&aI_2[8 * v13];
    }
    v15 = [v10 domainName];
    if ([v15 isEqualToString:@"HDKeyValueEntityDefaultDomain"])
    {
      v16 = &stru_1F1728D60;
    }
    else
    {
      v16 = [v10 domainName];
    }
    v17 = v16;

    v18 = [HDKeyValueDomain alloc];
    v19 = [v11 profile];
    uint64_t v20 = [(HDKeyValueDomain *)v18 initWithCategory:v14 domainName:v17 profile:v19];
    keyValueDomain = v12->_keyValueDomain;
    v12->_keyValueDomain = (HDKeyValueDomain *)v20;
  }
  return v12;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 domainName];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"{public}%@: domain name must be non-empty", objc_opt_class());
    goto LABEL_11;
  }
  if ((unint64_t)[v7 category] >= 5)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "category"));
    objc_msgSend(v12, "hk_assignError:code:format:", a5, 3, @"{public}%@: invalid HKKeyValueCategory: %@", v13, v14);

    goto LABEL_11;
  }
  if (([v8 hasEntitlement:*MEMORY[0x1E4F2A548]] & 1) == 0)
  {
    unint64_t v15 = [v7 category];
    self;
    if (v15 <= 4 && ((0x1Bu >> v15) & 1) != 0)
    {
      id v16 = **((id **)&unk_1E6300168 + v15);
      if (v16)
      {
        uint64_t v20 = [v8 entitlements];
        v21 = [v7 domainName];
        char v22 = [v20 arrayEntitlement:v16 containsString:v21];

        if (v22)
        {

          goto LABEL_4;
        }
      }
    }
    else
    {
      id v16 = 0;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    v18 = [v7 domainName];
    objc_msgSend(v17, "hk_assignError:code:format:", a5, 4, @"Unauthorized access to key-value domain %@", v18);

LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
LABEL_4:
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (void)_unitTest_overrideKeyValueDomainCategory:(int64_t)a3
{
  v5 = [HDKeyValueDomain alloc];
  id v9 = [(HDKeyValueDomain *)self->_keyValueDomain domainName];
  v6 = [(HDStandardTaskServer *)self profile];
  id v7 = [(HDKeyValueDomain *)v5 initWithCategory:a3 domainName:v9 profile:v6];
  keyValueDomain = self->_keyValueDomain;
  self->_keyValueDomain = v7;
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B138] clientInterface];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B138] serverInterface];
}

- (void)remote_setNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t, id))a5;
  keyValueDomain = self->_keyValueDomain;
  id v12 = 0;
  uint64_t v10 = [(HDKeyValueDomain *)keyValueDomain setNumber:a3 forKey:a4 error:&v12];
  id v11 = v12;
  if (v8) {
    v8[2](v8, v10, v11);
  }
}

- (void)remote_setData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t, id))a5;
  keyValueDomain = self->_keyValueDomain;
  id v12 = 0;
  uint64_t v10 = [(HDKeyValueDomain *)keyValueDomain setData:a3 forKey:a4 error:&v12];
  id v11 = v12;
  if (v8) {
    v8[2](v8, v10, v11);
  }
}

- (void)remote_setDate:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t, id))a5;
  keyValueDomain = self->_keyValueDomain;
  id v12 = 0;
  uint64_t v10 = [(HDKeyValueDomain *)keyValueDomain setDate:a3 forKey:a4 error:&v12];
  id v11 = v12;
  if (v8) {
    v8[2](v8, v10, v11);
  }
}

- (void)remote_setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t, id))a5;
  keyValueDomain = self->_keyValueDomain;
  id v12 = 0;
  uint64_t v10 = [(HDKeyValueDomain *)keyValueDomain setString:a3 forKey:a4 error:&v12];
  id v11 = v12;
  if (v8) {
    v8[2](v8, v10, v11);
  }
}

- (void)remote_setValuesWithDictionary:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  keyValueDomain = self->_keyValueDomain;
  id v10 = 0;
  uint64_t v8 = [(HDKeyValueDomain *)keyValueDomain setValuesWithDictionary:a3 error:&v10];
  id v9 = v10;
  if (v6) {
    v6[2](v6, v8, v9);
  }
}

- (void)remote_setValueForAllKeys:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  keyValueDomain = self->_keyValueDomain;
  id v10 = 0;
  uint64_t v8 = [(HDKeyValueDomain *)keyValueDomain setValueForAllKeys:a3 error:&v10];
  id v9 = v10;
  if (v6) {
    v6[2](v6, v8, v9);
  }
}

- (void)remote_removeValuesForKeys:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  keyValueDomain = self->_keyValueDomain;
  id v10 = 0;
  uint64_t v8 = [(HDKeyValueDomain *)keyValueDomain removeValuesForKeys:a3 error:&v10];
  id v9 = v10;
  if (v6) {
    v6[2](v6, v8, v9);
  }
}

- (void)remote_numberForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__91;
  uint64_t v20 = __Block_byref_object_dispose__91;
  id v21 = 0;
  uint64_t v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__HDKeyValueDomainTaskServer_remote_numberForKey_completion___block_invoke;
  v12[3] = &unk_1E62FA2E8;
  uint64_t v14 = &v16;
  id v15 = 0;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  [v9 performHighPriorityTransactionsWithError:&v15 block:v12];
  id v11 = v15;

  if (v7) {
    v7[2](v7, v17[5], v11);
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t __61__HDKeyValueDomainTaskServer_remote_numberForKey_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 40) numberForKey:a1[5] error:a2];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_dataForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__91;
  uint64_t v20 = __Block_byref_object_dispose__91;
  id v21 = 0;
  uint64_t v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__HDKeyValueDomainTaskServer_remote_dataForKey_completion___block_invoke;
  v12[3] = &unk_1E62FA2E8;
  uint64_t v14 = &v16;
  id v15 = 0;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  [v9 performHighPriorityTransactionsWithError:&v15 block:v12];
  id v11 = v15;

  if (v7) {
    v7[2](v7, v17[5], v11);
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t __59__HDKeyValueDomainTaskServer_remote_dataForKey_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 40) dataForKey:a1[5] error:a2];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_dateForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__91;
  uint64_t v20 = __Block_byref_object_dispose__91;
  id v21 = 0;
  uint64_t v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__HDKeyValueDomainTaskServer_remote_dateForKey_completion___block_invoke;
  v12[3] = &unk_1E62FA2E8;
  uint64_t v14 = &v16;
  id v15 = 0;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  [v9 performHighPriorityTransactionsWithError:&v15 block:v12];
  id v11 = v15;

  if (v7) {
    v7[2](v7, v17[5], v11);
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t __59__HDKeyValueDomainTaskServer_remote_dateForKey_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 40) dateForKey:a1[5] error:a2];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_stringForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__91;
  uint64_t v20 = __Block_byref_object_dispose__91;
  id v21 = 0;
  uint64_t v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__HDKeyValueDomainTaskServer_remote_stringForKey_completion___block_invoke;
  v12[3] = &unk_1E62FA2E8;
  uint64_t v14 = &v16;
  id v15 = 0;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  [v9 performHighPriorityTransactionsWithError:&v15 block:v12];
  id v11 = v15;

  if (v7) {
    v7[2](v7, v17[5], v11);
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t __61__HDKeyValueDomainTaskServer_remote_stringForKey_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 40) stringForKey:a1[5] error:a2];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_allValuesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__91;
  uint64_t v14 = __Block_byref_object_dispose__91;
  id v15 = 0;
  v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HDKeyValueDomainTaskServer_remote_allValuesWithCompletion___block_invoke;
  v8[3] = &unk_1E62FA2C0;
  v8[5] = &v10;
  id v9 = 0;
  v8[4] = self;
  [v6 performHighPriorityTransactionsWithError:&v9 block:v8];
  id v7 = v9;

  if (v4) {
    v4[2](v4, v11[5], v7);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __61__HDKeyValueDomainTaskServer_remote_allValuesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) allValuesWithError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_observeChanges:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  keyValueDomain = self->_keyValueDomain;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (v4) {
    [(HDKeyValueDomain *)keyValueDomain startObservation:self];
  }
  else {
    [(HDKeyValueDomain *)keyValueDomain stopObservation:self];
  }
  v7[2](v7, 1, 0);
}

- (void)didUpdateKeyValueDomain:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HDKeyValueDomainTaskServer_didUpdateKeyValueDomain___block_invoke;
  v9[3] = &unk_1E62F3170;
  v9[4] = self;
  BOOL v4 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v9];
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
    {
      keyValueDomain = self->_keyValueDomain;
      id v7 = v5;
      uint64_t v8 = [(HDKeyValueDomain *)keyValueDomain domainName];
      *(_DWORD *)buf = 138543618;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v8;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "%{public}@: Notify client for domain:%{public}@ change", buf, 0x16u);
    }
    objc_msgSend(v4, "clientRemote_didUpdate");
  }
}

void __54__HDKeyValueDomainTaskServer_didUpdateKeyValueDomain___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 40);
    v5 = v2;
    id v6 = [v4 domainName];
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client for domain:%{public}@ change", (uint8_t *)&v7, 0x16u);
  }
}

- (void).cxx_destruct
{
}

@end