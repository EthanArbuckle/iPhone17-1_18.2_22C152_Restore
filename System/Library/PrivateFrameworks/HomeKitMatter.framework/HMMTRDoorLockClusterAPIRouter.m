@interface HMMTRDoorLockClusterAPIRouter
+ (BOOL)isCredentialTypeAliro:(id)a3;
+ (id)aliroCredentialFromCredential:(id)a3 flow:(id)a4;
+ (id)aliroCredentialTypeForCredentialType:(id)a3 flow:(id)a4;
+ (id)aliroGetCredentialParamsFromParams:(id)a3 flow:(id)a4;
+ (id)aliroReaderConfigParamsFromParams:(id)a3;
+ (id)aliroSetCredentialParamsFromParams:(id)a3 flow:(id)a4;
+ (id)credentialTypeForAliroCredentialType:(unsigned __int8)a3 flow:(id)a4;
+ (id)doorLockFeatureMapSupportsAppleCustomAliroBLEUWB:(id)a3;
+ (id)doorLockFeatureMapSupportsAppleCustomAliroProvisioning:(id)a3;
+ (id)mergeAndRemoveDuplicatesFromArray:(id)a3 andArray:(id)a4;
+ (id)readerConfigParamsFromReaderConfig:(id)a3;
- (HMMTRDoorLockClusterAPIRouter)initWithBaseDoorLock:(id)a3 baseDevice:(id)a4 queue:(id)a5;
- (MTRBaseClusterDoorLock)baseDoorLock;
- (MTRBaseDevice)baseDevice;
- (NSNumber)nsNumberIsCustomClusterAvailable;
- (OS_dispatch_queue)queue;
- (id)getAliroCredentialAtIndex:(int64_t)a3 forCredentialType:(int64_t)a4 flow:(id)a5;
- (id)getAllAppleAliroCredentialsForUser:(id)a3 flow:(id)a4;
- (id)getAppleAliroCredentialsForUser:(id)a3 withCredentialType:(int64_t)a4 startingAtIndex:(int64_t)a5 credentials:(id)a6 flow:(id)a7;
- (void)fetchAppleClusterFeaturesWithFlow:(id)a3 completion:(id)a4;
- (void)getCredentialStatusWithParams:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)getUserWithParams:(id)a3 includeAliroCredentials:(BOOL)a4 flow:(id)a5 completion:(id)a6;
- (void)isCustomClusterAvailableWithFlow:(id)a3 completion:(id)a4;
- (void)readAttributeAliroGroupResolvingKeyWithFlow:(id)a3 completion:(id)a4;
- (void)readAttributeAliroReaderGroupIdentifierWithFlow:(id)a3 completion:(id)a4;
- (void)readAttributeAliroReaderVerificationKeyWithFlow:(id)a3 completion:(id)a4;
- (void)setAliroReaderConfigWithConfig:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)setCredentialWithParams:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)setNsNumberIsCustomClusterAvailable:(id)a3;
@end

@implementation HMMTRDoorLockClusterAPIRouter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsNumberIsCustomClusterAvailable, 0);
  objc_storeStrong((id *)&self->_baseDevice, 0);
  objc_storeStrong((id *)&self->_baseDoorLock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setNsNumberIsCustomClusterAvailable:(id)a3
{
}

- (NSNumber)nsNumberIsCustomClusterAvailable
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (MTRBaseDevice)baseDevice
{
  return (MTRBaseDevice *)objc_getProperty(self, a2, 24, 1);
}

- (MTRBaseClusterDoorLock)baseDoorLock
{
  return (MTRBaseClusterDoorLock *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)getAliroCredentialAtIndex:(int64_t)a3 forCredentialType:(int64_t)a4 flow:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = (void *)MEMORY[0x2533B64D0]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v8 UUID];
    *(_DWORD *)buf = 138544130;
    v27 = v12;
    __int16 v28 = 2112;
    v29 = v13;
    __int16 v30 = 2048;
    int64_t v31 = a3;
    __int16 v32 = 2048;
    int64_t v33 = a4;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getCredentialAtIndex: %ld forCredentialType: %ld", buf, 0x2Au);
  }
  v14 = objc_opt_new();
  v15 = [NSNumber numberWithInteger:a4];
  [v14 setCredentialType:v15];

  v16 = [NSNumber numberWithInteger:a3];
  [v14 setCredentialIndex:v16];

  v17 = objc_opt_new();
  [v17 setCredential:v14];
  v18 = objc_opt_new();
  v19 = [(HMMTRDoorLockClusterAPIRouter *)v10 baseDoorLock];
  v20 = [v18 completionHandlerAdapter];
  [v19 appleGetAliroCredentialStatusWithParams:v17 completion:v20];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __82__HMMTRDoorLockClusterAPIRouter_getAliroCredentialAtIndex_forCredentialType_flow___block_invoke;
  v24[3] = &unk_265378660;
  v24[4] = v10;
  id v25 = v8;
  id v21 = v8;
  v22 = [v18 addFailureBlock:v24];

  return v22;
}

void __82__HMMTRDoorLockClusterAPIRouter_getAliroCredentialAtIndex_forCredentialType_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v9 = 138543874;
    v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to get credential with error: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)getAppleAliroCredentialsForUser:(id)a3 withCredentialType:(int64_t)a4 startingAtIndex:(int64_t)a5 credentials:(id)a6 flow:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [(HMMTRDoorLockClusterAPIRouter *)self getAliroCredentialAtIndex:a5 forCredentialType:a4 flow:v14];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __117__HMMTRDoorLockClusterAPIRouter_getAppleAliroCredentialsForUser_withCredentialType_startingAtIndex_credentials_flow___block_invoke;
  v21[3] = &unk_265376CF8;
  id v22 = v12;
  v23 = self;
  int64_t v26 = a4;
  int64_t v27 = a5;
  id v24 = v14;
  id v25 = v13;
  id v16 = v13;
  id v17 = v14;
  id v18 = v12;
  v19 = [v15 flatMap:v21];

  return v19;
}

id __117__HMMTRDoorLockClusterAPIRouter_getAppleAliroCredentialsForUser_withCredentialType_startingAtIndex_credentials_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 credentialExists];
  if ([v4 BOOLValue] && *(void *)(a1 + 32))
  {
    id v5 = [v3 userIndex];
    int v6 = HMFEqualObjects();

    if (!v6) {
      goto LABEL_6;
    }
    v4 = objc_opt_new();
    v7 = [(id)objc_opt_class() credentialTypeForAliroCredentialType:*(unsigned __int8 *)(a1 + 64) flow:*(void *)(a1 + 48)];
    [v4 setCredentialType:v7];

    id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
    [v4 setCredentialIndex:v8];

    [*(id *)(a1 + 56) addObject:v4];
  }

LABEL_6:
  int v9 = [v3 nextCredentialIndex];

  if (v9)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 64);
    id v13 = [v3 nextCredentialIndex];
    id v14 = objc_msgSend(v10, "getAppleAliroCredentialsForUser:withCredentialType:startingAtIndex:credentials:flow:", v11, v12, objc_msgSend(v13, "integerValue"), *(void *)(a1 + 56), *(void *)(a1 + 48));
  }
  else
  {
    id v14 = [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 56)];
  }

  return v14;
}

- (id)getAllAppleAliroCredentialsForUser:(id)a3 flow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  int v9 = [(HMMTRDoorLockClusterAPIRouter *)self getAppleAliroCredentialsForUser:v6 withCredentialType:1 startingAtIndex:1 credentials:v8 flow:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__HMMTRDoorLockClusterAPIRouter_getAllAppleAliroCredentialsForUser_flow___block_invoke;
  v14[3] = &unk_265376CD0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = [v9 flatMap:v14];

  return v12;
}

id __73__HMMTRDoorLockClusterAPIRouter_getAllAppleAliroCredentialsForUser_flow___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [v4 getAppleAliroCredentialsForUser:v5 withCredentialType:2 startingAtIndex:1 credentials:v6 flow:a1[6]];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__HMMTRDoorLockClusterAPIRouter_getAllAppleAliroCredentialsForUser_flow___block_invoke_2;
  v11[3] = &unk_265376CA8;
  id v12 = v3;
  id v8 = v3;
  int v9 = [v7 flatMap:v11];

  return v9;
}

id __73__HMMTRDoorLockClusterAPIRouter_getAllAppleAliroCredentialsForUser_flow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  id v3 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (void)getUserWithParams:(id)a3 includeAliroCredentials:(BOOL)a4 flow:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__HMMTRDoorLockClusterAPIRouter_getUserWithParams_includeAliroCredentials_flow_completion___block_invoke;
  v16[3] = &unk_265376C80;
  v16[4] = self;
  id v17 = v10;
  BOOL v20 = a4;
  id v18 = v11;
  id v19 = v12;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [(HMMTRDoorLockClusterAPIRouter *)self isCustomClusterAvailableWithFlow:v13 completion:v16];
}

void __91__HMMTRDoorLockClusterAPIRouter_getUserWithParams_includeAliroCredentials_flow_completion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) baseDoorLock];
    uint64_t v7 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __91__HMMTRDoorLockClusterAPIRouter_getUserWithParams_includeAliroCredentials_flow_completion___block_invoke_2;
    v11[3] = &unk_265376C58;
    char v15 = a2;
    char v16 = *(unsigned char *)(a1 + 64);
    id v8 = *(id *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    id v14 = v8;
    void v11[4] = v9;
    id v12 = v10;
    id v13 = *(id *)(a1 + 48);
    [v6 getUserWithParams:v7 completion:v11];
  }
}

void __91__HMMTRDoorLockClusterAPIRouter_getUserWithParams_includeAliroCredentials_flow_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 64) && v5 && *(unsigned char *)(a1 + 65))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) userIndex];
    uint64_t v9 = [v7 getAllAppleAliroCredentialsForUser:v8 flow:*(void *)(a1 + 48)];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __91__HMMTRDoorLockClusterAPIRouter_getUserWithParams_includeAliroCredentials_flow_completion___block_invoke_3;
    v16[3] = &unk_265376C30;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 32);
    id v17 = v10;
    uint64_t v18 = v11;
    id v19 = *(id *)(a1 + 56);
    id v12 = [v9 addSuccessBlock:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __91__HMMTRDoorLockClusterAPIRouter_getUserWithParams_includeAliroCredentials_flow_completion___block_invoke_4;
    v14[3] = &unk_2653787C8;
    id v15 = *(id *)(a1 + 56);
    id v13 = (id)[v12 addFailureBlock:v14];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __91__HMMTRDoorLockClusterAPIRouter_getUserWithParams_includeAliroCredentials_flow_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_class();
  id v5 = [*(id *)(a1 + 32) credentials];
  id v6 = [v4 mergeAndRemoveDuplicatesFromArray:v5 andArray:v3];

  [*(id *)(a1 + 32) setCredentials:v6];
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v7();
}

uint64_t __91__HMMTRDoorLockClusterAPIRouter_getUserWithParams_includeAliroCredentials_flow_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAliroReaderConfigWithConfig:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__HMMTRDoorLockClusterAPIRouter_setAliroReaderConfigWithConfig_flow_completion___block_invoke;
  v14[3] = &unk_265377DE8;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(HMMTRDoorLockClusterAPIRouter *)self isCustomClusterAvailableWithFlow:v11 completion:v14];
}

void __80__HMMTRDoorLockClusterAPIRouter_setAliroReaderConfigWithConfig_flow_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = [(id)objc_opt_class() readerConfigParamsFromReaderConfig:*(void *)(a1 + 40)];
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 48) UUID];
      id v12 = [v6 signingKey];
      int v36 = 138543874;
      v37 = v10;
      __int16 v38 = 2112;
      v39 = v11;
      __int16 v40 = 2048;
      uint64_t v41 = [v12 length];
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] signingKeySize: %lu", (uint8_t *)&v36, 0x20u);
    }
    id v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [*(id *)(a1 + 48) UUID];
      uint64_t v18 = [v6 verificationKey];
      uint64_t v19 = [v18 length];
      int v36 = 138543874;
      v37 = v16;
      __int16 v38 = 2112;
      v39 = v17;
      __int16 v40 = 2048;
      uint64_t v41 = v19;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] verificationKey: %lu", (uint8_t *)&v36, 0x20u);
    }
    BOOL v20 = (void *)MEMORY[0x2533B64D0]();
    id v21 = *(id *)(a1 + 32);
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      id v24 = [*(id *)(a1 + 48) UUID];
      id v25 = [v6 groupIdentifier];
      uint64_t v26 = [v25 length];
      int v36 = 138543874;
      v37 = v23;
      __int16 v38 = 2112;
      v39 = v24;
      __int16 v40 = 2048;
      uint64_t v41 = v26;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] groupIdentifier: %lu", (uint8_t *)&v36, 0x20u);
    }
    int64_t v27 = (void *)MEMORY[0x2533B64D0]();
    id v28 = *(id *)(a1 + 32);
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      __int16 v30 = HMFGetLogIdentifier();
      int64_t v31 = [*(id *)(a1 + 48) UUID];
      __int16 v32 = [v6 groupResolvingKey];
      uint64_t v33 = [v32 length];
      int v36 = 138543874;
      v37 = v30;
      __int16 v38 = 2112;
      v39 = v31;
      __int16 v40 = 2048;
      uint64_t v41 = v33;
      _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] groupResolvingKey: %lu", (uint8_t *)&v36, 0x20u);
    }
    if (a2)
    {
      uint64_t v34 = [(id)objc_opt_class() aliroReaderConfigParamsFromParams:v6];
      v35 = [*(id *)(a1 + 32) baseDoorLock];
      [v35 appleSetAliroReaderConfigWithParams:v34 completion:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v34 = [*(id *)(a1 + 32) baseDoorLock];
      [v34 setAliroReaderConfigWithParams:v6 completion:*(void *)(a1 + 56)];
    }
  }
}

- (void)getCredentialStatusWithParams:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__HMMTRDoorLockClusterAPIRouter_getCredentialStatusWithParams_flow_completion___block_invoke;
  v14[3] = &unk_265377DE8;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(HMMTRDoorLockClusterAPIRouter *)self isCustomClusterAvailableWithFlow:v11 completion:v14];
}

void __79__HMMTRDoorLockClusterAPIRouter_getCredentialStatusWithParams_flow_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v11 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (!a2) {
      goto LABEL_6;
    }
    id v6 = objc_opt_class();
    uint64_t v7 = [*(id *)(a1 + 40) credential];
    id v8 = [v7 credentialType];
    LODWORD(v6) = [v6 isCredentialTypeAliro:v8];

    if (v6)
    {
      id v9 = [(id)objc_opt_class() aliroGetCredentialParamsFromParams:*(void *)(a1 + 40) flow:*(void *)(a1 + 48)];
      id v10 = [*(id *)(a1 + 32) baseDoorLock];
      [v10 appleGetAliroCredentialStatusWithParams:v9 completion:*(void *)(a1 + 56)];
    }
    else
    {
LABEL_6:
      id v9 = objc_msgSend(*(id *)(a1 + 32), "baseDoorLock", v5);
      [v9 getCredentialStatusWithParams:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
    }
  }
}

- (void)setCredentialWithParams:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__HMMTRDoorLockClusterAPIRouter_setCredentialWithParams_flow_completion___block_invoke;
  v14[3] = &unk_265377DE8;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(HMMTRDoorLockClusterAPIRouter *)self isCustomClusterAvailableWithFlow:v11 completion:v14];
}

void __73__HMMTRDoorLockClusterAPIRouter_setCredentialWithParams_flow_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v11 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (!a2) {
      goto LABEL_6;
    }
    id v6 = objc_opt_class();
    uint64_t v7 = [*(id *)(a1 + 40) credential];
    id v8 = [v7 credentialType];
    LODWORD(v6) = [v6 isCredentialTypeAliro:v8];

    if (v6)
    {
      id v9 = [(id)objc_opt_class() aliroSetCredentialParamsFromParams:*(void *)(a1 + 40) flow:*(void *)(a1 + 48)];
      id v10 = [*(id *)(a1 + 32) baseDoorLock];
      [v10 appleSetAliroCredentialWithParams:v9 completion:*(void *)(a1 + 56)];
    }
    else
    {
LABEL_6:
      id v9 = objc_msgSend(*(id *)(a1 + 32), "baseDoorLock", v5);
      [v9 setCredentialWithParams:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
    }
  }
}

- (void)readAttributeAliroGroupResolvingKeyWithFlow:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__HMMTRDoorLockClusterAPIRouter_readAttributeAliroGroupResolvingKeyWithFlow_completion___block_invoke;
  v8[3] = &unk_2653782F8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(HMMTRDoorLockClusterAPIRouter *)self isCustomClusterAvailableWithFlow:a3 completion:v8];
}

void __88__HMMTRDoorLockClusterAPIRouter_readAttributeAliroGroupResolvingKeyWithFlow_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) baseDoorLock];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    if (a2) {
      [v5 readAttributeAppleAliroGroupResolvingKeyWithCompletion:v7];
    }
    else {
      [v5 readAttributeAliroGroupResolvingKeyWithCompletion:v7];
    }
  }
}

- (void)readAttributeAliroReaderGroupIdentifierWithFlow:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__HMMTRDoorLockClusterAPIRouter_readAttributeAliroReaderGroupIdentifierWithFlow_completion___block_invoke;
  v8[3] = &unk_2653782F8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(HMMTRDoorLockClusterAPIRouter *)self isCustomClusterAvailableWithFlow:a3 completion:v8];
}

void __92__HMMTRDoorLockClusterAPIRouter_readAttributeAliroReaderGroupIdentifierWithFlow_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) baseDoorLock];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    if (a2) {
      [v5 readAttributeAppleAliroReaderGroupIdentifierWithCompletion:v7];
    }
    else {
      [v5 readAttributeAliroReaderGroupIdentifierWithCompletion:v7];
    }
  }
}

- (void)readAttributeAliroReaderVerificationKeyWithFlow:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__HMMTRDoorLockClusterAPIRouter_readAttributeAliroReaderVerificationKeyWithFlow_completion___block_invoke;
  v8[3] = &unk_2653782F8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(HMMTRDoorLockClusterAPIRouter *)self isCustomClusterAvailableWithFlow:a3 completion:v8];
}

void __92__HMMTRDoorLockClusterAPIRouter_readAttributeAliroReaderVerificationKeyWithFlow_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) baseDoorLock];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    if (a2) {
      [v5 readAttributeAppleAliroReaderVerificationKeyWithCompletion:v7];
    }
    else {
      [v5 readAttributeAliroReaderVerificationKeyWithCompletion:v7];
    }
  }
}

- (void)fetchAppleClusterFeaturesWithFlow:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v6 UUID];
    *(_DWORD *)buf = 138543618;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching apple cluster features", buf, 0x16u);
  }
  id v13 = +[HMMTRDescriptorClusterManager sharedManager];
  id v14 = [(HMMTRDoorLockClusterAPIRouter *)v9 baseDevice];
  id v15 = [(HMMTRDoorLockClusterAPIRouter *)v9 queue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__HMMTRDoorLockClusterAPIRouter_fetchAppleClusterFeaturesWithFlow_completion___block_invoke;
  v18[3] = &unk_265378978;
  v18[4] = v9;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  [v13 endpointForClusterID:&unk_2702B5898 device:v14 callbackQueue:v15 completionHandler:v18];
}

void __78__HMMTRDoorLockClusterAPIRouter_fetchAppleClusterFeaturesWithFlow_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      v29 = v10;
      __int16 v30 = 2112;
      int64_t v31 = v11;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found Apple Lock Cluster on endpoint: %@", buf, 0x20u);
    }
    id v12 = [a1[4] baseDevice];
    id v13 = [a1[4] queue];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __78__HMMTRDoorLockClusterAPIRouter_fetchAppleClusterFeaturesWithFlow_completion___block_invoke_10;
    v25[3] = &unk_265378A90;
    id v14 = a1[5];
    v25[4] = a1[4];
    id v26 = v14;
    id v27 = a1[6];
    [v12 readAttributesWithEndpointID:v5 clusterID:&unk_2702B5898 attributeID:&unk_2702B58B0 params:0 queue:v13 completion:v25];
  }
  else
  {
    id v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = a1[4];
    id v17 = HMFGetOSLogHandle();
    uint64_t v18 = v17;
    if (v6)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [a1[5] UUID];
        *(_DWORD *)buf = 138543874;
        v29 = v19;
        __int16 v30 = 2112;
        int64_t v31 = v20;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error while looking for Apple Lock Cluster: %@", buf, 0x20u);
      }
      id v21 = a1[4];
      uint64_t v22 = 0;
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = HMFGetLogIdentifier();
        id v24 = [a1[5] UUID];
        *(_DWORD *)buf = 138543618;
        v29 = v23;
        __int16 v30 = 2112;
        int64_t v31 = v24;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find Apple Lock Cluster", buf, 0x16u);
      }
      id v21 = a1[4];
      uint64_t v22 = MEMORY[0x263EFFA80];
    }
    [v21 setNsNumberIsCustomClusterAvailable:v22];
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __78__HMMTRDoorLockClusterAPIRouter_fetchAppleClusterFeaturesWithFlow_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 firstObject];
  id v8 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 40) UUID];
      int v25 = 138543874;
      id v26 = v15;
      __int16 v27 = 2112;
      id v28 = v16;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] featureMap: %@", (uint8_t *)&v25, 0x20u);
    }
    id v17 = [(id)objc_opt_class() doorLockFeatureMapSupportsAppleCustomAliroProvisioning:v10];
    uint64_t v18 = [v17 BOOLValue];

    id v19 = [(id)objc_opt_class() doorLockFeatureMapSupportsAppleCustomAliroBLEUWB:v10];
    [v19 BOOLValue];

    id v20 = [NSNumber numberWithBool:v18];
    [*(id *)(a1 + 32) setNsNumberIsCustomClusterAvailable:v20];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      uint64_t v22 = [*(id *)(a1 + 40) UUID];
      int v25 = 138544130;
      id v26 = v21;
      __int16 v27 = 2112;
      id v28 = v22;
      __int16 v29 = 2112;
      id v30 = v5;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not find featureMap, which is required, on Apple custom lock cluster. values: %@, error: %@", (uint8_t *)&v25, 0x2Au);
    }
    [*(id *)(a1 + 32) setNsNumberIsCustomClusterAvailable:0];
    uint64_t v23 = *(void *)(a1 + 48);
    id v24 = [MEMORY[0x263F087E8] hmfErrorWithCode:2, @"Did not find featureMap, which is required, on Apple custom lock cluster." reason];
    (*(void (**)(uint64_t, void, void, void *))(v23 + 16))(v23, 0, 0, v24);
  }
}

- (void)isCustomClusterAvailableWithFlow:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = [(HMMTRDoorLockClusterAPIRouter *)self nsNumberIsCustomClusterAvailable];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v6 UUID];
      id v14 = [(HMMTRDoorLockClusterAPIRouter *)v10 nsNumberIsCustomClusterAvailable];
      [v14 BOOLValue];
      id v15 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Returning cached value for isCustomClusterAvailable: %@", buf, 0x20u);
    }
    id v16 = [(HMMTRDoorLockClusterAPIRouter *)v10 nsNumberIsCustomClusterAvailable];
    v7[2](v7, [v16 BOOLValue], 0);
  }
  else
  {
    id v17 = +[HMMTRDescriptorClusterManager sharedManager];
    uint64_t v18 = [(HMMTRDoorLockClusterAPIRouter *)self baseDevice];
    id v19 = [(HMMTRDoorLockClusterAPIRouter *)self queue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__HMMTRDoorLockClusterAPIRouter_isCustomClusterAvailableWithFlow_completion___block_invoke;
    v20[3] = &unk_265378978;
    v20[4] = self;
    id v21 = v6;
    uint64_t v22 = v7;
    [v17 endpointForClusterID:&unk_2702B5898 device:v18 callbackQueue:v19 completionHandler:v20];
  }
}

void __77__HMMTRDoorLockClusterAPIRouter_isCustomClusterAvailableWithFlow_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      __int16 v31 = v11;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found Apple Lock Cluster on endpoint: %@", buf, 0x20u);
    }
    id v12 = [a1[4] baseDevice];
    id v13 = [a1[4] queue];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __77__HMMTRDoorLockClusterAPIRouter_isCustomClusterAvailableWithFlow_completion___block_invoke_3;
    v25[3] = &unk_265378A90;
    id v14 = a1[5];
    v25[4] = a1[4];
    id v26 = v14;
    id v27 = a1[6];
    [v12 readAttributesWithEndpointID:v5 clusterID:&unk_2702B5898 attributeID:&unk_2702B58B0 params:0 queue:v13 completion:v25];
  }
  else
  {
    id v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = a1[4];
    id v17 = HMFGetOSLogHandle();
    uint64_t v18 = v17;
    if (v6)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [a1[5] UUID];
        *(_DWORD *)buf = 138543874;
        uint64_t v29 = v19;
        __int16 v30 = 2112;
        __int16 v31 = v20;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error while looking for Apple Lock Cluster: %@", buf, 0x20u);
      }
      id v21 = a1[4];
      uint64_t v22 = 0;
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        id v24 = [a1[5] UUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v23;
        __int16 v30 = 2112;
        __int16 v31 = v24;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find Apple Lock Cluster", buf, 0x16u);
      }
      id v21 = a1[4];
      uint64_t v22 = MEMORY[0x263EFFA80];
    }
    [v21 setNsNumberIsCustomClusterAvailable:v22];
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __77__HMMTRDoorLockClusterAPIRouter_isCustomClusterAvailableWithFlow_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 firstObject];
  id v8 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 40) UUID];
      int v24 = 138543874;
      __int16 v25 = v15;
      __int16 v26 = 2112;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] featureMap: %@", (uint8_t *)&v24, 0x20u);
    }
    id v17 = [(id)objc_opt_class() doorLockFeatureMapSupportsAppleCustomAliroProvisioning:v10];
    uint64_t v18 = [v17 BOOLValue];

    id v19 = [NSNumber numberWithBool:v18];
    [*(id *)(a1 + 32) setNsNumberIsCustomClusterAvailable:v19];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      id v21 = [*(id *)(a1 + 40) UUID];
      int v24 = 138544130;
      __int16 v25 = v20;
      __int16 v26 = 2112;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not find featureMap, which is required, on Apple custom lock cluster. values: %@, error: %@", (uint8_t *)&v24, 0x2Au);
    }
    [*(id *)(a1 + 32) setNsNumberIsCustomClusterAvailable:0];
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = [MEMORY[0x263F087E8] hmfErrorWithCode:2, @"Did not find featureMap, which is required, on Apple custom lock cluster." reason];
    (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);
  }
}

- (HMMTRDoorLockClusterAPIRouter)initWithBaseDoorLock:(id)a3 baseDevice:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRDoorLockClusterAPIRouter;
  id v12 = [(HMMTRDoorLockClusterAPIRouter *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseDoorLock, a3);
    objc_storeStrong((id *)&v13->_baseDevice, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

+ (id)mergeAndRemoveDuplicatesFromArray:(id)a3 andArray:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x2533B64D0](a1, a2);
  id v6 = (void *)MEMORY[0x263EFF980];
  id v7 = a4;
  id v8 = a3;
  int v36 = [v6 array];
  id v9 = [MEMORY[0x263EFF9C0] set];
  id v10 = (void *)MEMORY[0x263EFFA68];
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = (void *)MEMORY[0x263EFFA68];
  }
  id v12 = v11;

  if (v7) {
    id v13 = v7;
  }
  else {
    id v13 = v10;
  }
  id v14 = v13;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v29 = v14;
  __int16 v30 = v12;
  v46[0] = v12;
  v46[1] = v14;
  id obj = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
  uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v42;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v15;
        id v16 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v38 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              uint64_t v23 = NSString;
              int v24 = [v22 credentialType];
              __int16 v25 = [v22 credentialIndex];
              __int16 v26 = [v23 stringWithFormat:@"%@_%@", v24, v25];

              if (([v9 containsObject:v26] & 1) == 0)
              {
                [v9 addObject:v26];
                [v36 addObject:v22];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v19);
        }

        uint64_t v15 = v35 + 1;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v34);
  }

  id v27 = (void *)[v36 copy];

  return v27;
}

+ (id)readerConfigParamsFromReaderConfig:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 readerPrivateKey];
  [v4 setSigningKey:v5];

  id v6 = [v3 readerPublicKeyExternalRepresentation];
  [v4 setVerificationKey:v6];

  id v7 = [v3 readerGroupIdentifier];
  [v4 setGroupIdentifier:v7];

  id v8 = [v3 groupResolvingKey];

  [v4 setGroupResolvingKey:v8];
  return v4;
}

+ (id)doorLockFeatureMapSupportsAppleCustomAliroBLEUWB:(id)a3
{
  id v3 = NSNumber;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 2);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

+ (id)doorLockFeatureMapSupportsAppleCustomAliroProvisioning:(id)a3
{
  id v3 = NSNumber;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 1);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

+ (id)aliroReaderConfigParamsFromParams:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 signingKey];
  [v4 setSigningKey:v5];

  id v6 = [v3 verificationKey];
  [v4 setVerificationKey:v6];

  id v7 = [v3 groupIdentifier];
  [v4 setGroupIdentifier:v7];

  id v8 = [v3 groupResolvingKey];

  [v4 setGroupResolvingKey:v8];
  return v4;
}

+ (id)aliroGetCredentialParamsFromParams:(id)a3 flow:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [v7 credential];

  id v10 = [a1 aliroCredentialFromCredential:v9 flow:v6];

  [v8 setCredential:v10];
  return v8;
}

+ (id)credentialTypeForAliroCredentialType:(unsigned __int8)a3 flow:(id)a4
{
  int v5 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (v5 == 3)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [v7 UUID];
      int v15 = 138543874;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = 3;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Cannot convert AliroNonEvictableEndpointKey credential type: %ld to credential type", (uint8_t *)&v15, 0x20u);
    }
    v4 = &unk_2702B58F8;
  }
  else
  {
    if (v5 == 2)
    {
      v4 = &unk_2702B4F20;
    }
    else
    {
      if (v5 != 1) {
        goto LABEL_10;
      }
      v4 = &unk_2702B4F08;
    }
    id v13 = v4;
  }
LABEL_10:

  return v4;
}

+ (id)aliroCredentialTypeForCredentialType:(id)a3 flow:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (HMFEqualObjects())
  {
    id v8 = &unk_2702B58C8;
  }
  else if (HMFEqualObjects())
  {
    id v8 = &unk_2702B58E0;
  }
  else
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = a1;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v7 UUID];
      int v15 = 138543874;
      id v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Cannot convert credential type: %@ to an Apple Aliro custom cluster credential type", (uint8_t *)&v15, 0x20u);
    }
    id v8 = &unk_2702B58F8;
  }

  return v8;
}

+ (id)aliroCredentialFromCredential:(id)a3 flow:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [v7 credentialType];
  id v10 = [a1 aliroCredentialTypeForCredentialType:v9 flow:v6];

  [v8 setCredentialType:v10];
  id v11 = [v7 credentialIndex];

  [v8 setCredentialIndex:v11];
  return v8;
}

+ (id)aliroSetCredentialParamsFromParams:(id)a3 flow:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [v7 operationType];
  [v8 setOperationType:v9];

  id v10 = [v7 userIndex];
  [v8 setUserIndex:v10];

  id v11 = [v7 credential];
  id v12 = [a1 aliroCredentialFromCredential:v11 flow:v6];

  [v8 setCredential:v12];
  id v13 = [v7 credentialData];

  [v8 setCredentialData:v13];
  return v8;
}

+ (BOOL)isCredentialTypeAliro:(id)a3
{
  id v3 = a3;
  if (HMFEqualObjects()) {
    char v4 = 1;
  }
  else {
    char v4 = HMFEqualObjects();
  }

  return v4;
}

@end