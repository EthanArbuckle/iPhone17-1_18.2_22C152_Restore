@interface HMMediaSystemBuilder
+ (BOOL)canSupportMediaSystem:(id)a3;
+ (BOOL)isStereoPairingSupportedForAccessories:(id)a3;
+ (BOOL)supportsMediaSystem:(id)a3;
+ (id)logCategory;
- (HMFActivity)activity;
- (HMHome)home;
- (HMMediaSystem)mediaSystem;
- (HMMediaSystemBuilder)initWithHome:(id)a3;
- (HMMediaSystemBuilder)initWithHome:(id)a3 mediaSystemUUID:(id)a4 context:(id)a5 components:(id)a6;
- (HMMediaSystemBuilder)initWithMediaSystem:(id)a3;
- (HMMutableArray)componentsArray;
- (NSArray)components;
- (NSString)builderSessionID;
- (NSString)configuredName;
- (NSString)description;
- (NSString)name;
- (NSUUID)mediaSystemUUID;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)logIdentifier;
- (id)resultingMediaSystemFromResponse:(id)a3 error:(id *)a4;
- (void)_callCompletion:(id)a3 builderSessionID:(id)a4 error:(id)a5 response:(id)a6;
- (void)_commitWithCompletionHandler:(id)a3;
- (void)commitWithCompletionHandler:(id)a3;
- (void)handleResultingMediaSystem:(id)a3;
- (void)legacyHandleResultingMediaSystem:(id)a3;
- (void)setBuilderSessionID:(id)a3;
- (void)setComponents:(id)a3;
- (void)setConfiguredName:(id)a3;
- (void)setContext:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HMMediaSystemBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentsArray, 0);
  objc_storeStrong((id *)&self->_mediaSystem, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_builderSessionID, 0);
  objc_storeStrong((id *)&self->_mediaSystemUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_components, 0);
}

- (HMMutableArray)componentsArray
{
  return self->_componentsArray;
}

- (HMMediaSystem)mediaSystem
{
  return self->_mediaSystem;
}

- (HMHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);

  return (HMHome *)WeakRetained;
}

- (void)setBuilderSessionID:(id)a3
{
}

- (NSString)builderSessionID
{
  return self->_builderSessionID;
}

- (NSUUID)mediaSystemUUID
{
  return self->_mediaSystemUUID;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMFActivity)activity
{
  return (HMFActivity *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setConfiguredName:(id)a3
{
}

- (NSString)configuredName
{
  return self->_configuredName;
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMMediaSystemBuilder *)self uuid];
  v5 = [v4 UUIDString];
  v6 = [(HMMediaSystemBuilder *)self builderSessionID];
  v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

- (void)legacyHandleResultingMediaSystem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMMediaSystemBuilder *)self home];
  if (v5)
  {
    v6 = [(HMMediaSystemBuilder *)self mediaSystem];

    if (v6)
    {
      v7 = (void *)MEMORY[0x19F3A64A0]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = HMFGetLogIdentifier();
        int v18 = 138543618;
        v19 = v10;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging resulting media system: %@", (uint8_t *)&v18, 0x16u);
      }
      v11 = [v4 applicationData];
      v12 = [(HMMediaSystemBuilder *)v8 mediaSystem];
      [v12 setApplicationData:v11];

      v13 = [(HMMediaSystemBuilder *)v8 mediaSystem];
      [v13 mergeFromNewObject:v4 isFromSerializedData:1];
    }
    else
    {
      [v5 stageAddedMediaSystem:v4];
      v13 = [(HMMediaSystemBuilder *)self context];
      objc_msgSend(v4, "__configureWithContext:home:", v13, v5);
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle resulting media system due to no home", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)handleResultingMediaSystem:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v22 = 138543618;
    v23 = v8;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling resulting media system: %@", (uint8_t *)&v22, 0x16u);
  }
  v9 = [(HMMediaSystemBuilder *)v6 home];
  v10 = v9;
  if (v9)
  {
    if ([v9 isFeatureHomeTheaterQFAEnabled])
    {
      v11 = [(HMMediaSystemBuilder *)v6 mediaSystem];

      if (v11)
      {
        v12 = [(HMMediaSystemBuilder *)v6 mediaSystem];
        [v12 mergeFromNewObject:v4 isFromSerializedData:1];
      }
      else
      {
        id v21 = [(HMMediaSystemBuilder *)v6 context];
        objc_msgSend(v4, "__configureWithContext:home:", v21, v10);

        [v10 stageAddedMediaSystem:v4];
        [v4 postConfigure];
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x19F3A64A0]();
      int v18 = v6;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@QFA is not enabled", (uint8_t *)&v22, 0xCu);
      }
      [(HMMediaSystemBuilder *)v18 legacyHandleResultingMediaSystem:v4];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = v6;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v22 = 138543362;
      v23 = v16;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed handle resulting media system due to no home", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (id)resultingMediaSystemFromResponse:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(v6, "hmf_dictionaryForKey:", kMediaSystemCodingKey);
  if (v7)
  {
    v8 = [(HMMediaSystemBuilder *)self home];
    v9 = +[HMMediaSystem mediaSystemWithDictionary:v7 home:v8];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      v16 = (void *)MEMORY[0x19F3A64A0]();
      v17 = self;
      int v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v21 = 138543618;
        int v22 = v19;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create media system from system payload: %@", (uint8_t *)&v21, 0x16u);
      }
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v21 = 138543618;
      int v22 = v15;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media system payload in response: %@", (uint8_t *)&v21, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)_callCompletion:(id)a3 builderSessionID:(id)a4 error:(id)a5 response:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x19F3A64A0]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v42 = v17;
    __int16 v43 = 2112;
    id v44 = v11;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Received response for Builder-Session-ID: %@", buf, 0x16u);
  }
  int v18 = [(HMMediaSystemBuilder *)v15 builderSessionID];
  char v19 = HMFEqualObjects();

  if (v19)
  {
    uint64_t v20 = [(HMMediaSystemBuilder *)v15 setBuilderSessionID:0];
    if (v12)
    {
      int v21 = (void *)MEMORY[0x19F3A64A0](v20);
      int v22 = v15;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v42 = v24;
        __int16 v43 = 2112;
        id v44 = v12;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Builder message responded with error: %@", buf, 0x16u);
      }
      uint64_t v25 = [(HMMediaSystemBuilder *)v22 context];
      uint64_t v26 = [v25 delegateCaller];
      [v26 callCompletion:v10 error:v12 mediaSystem:0];
    }
    else
    {
      id v40 = 0;
      uint64_t v25 = [(HMMediaSystemBuilder *)v15 resultingMediaSystemFromResponse:v13 error:&v40];
      id v12 = v40;
      if (v25)
      {
        [(HMMediaSystemBuilder *)v15 handleResultingMediaSystem:v25];
        v31 = [(HMMediaSystemBuilder *)v15 context];
        v32 = [v31 delegateCaller];
        uint64_t v33 = [(HMMediaSystemBuilder *)v15 mediaSystem];
        v34 = (void *)v33;
        if (v33) {
          v35 = (void *)v33;
        }
        else {
          v35 = v25;
        }
        [v32 callCompletion:v10 error:v12 mediaSystem:v35];
      }
      else
      {
        v36 = (void *)MEMORY[0x19F3A64A0]();
        v37 = v15;
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v42 = v39;
          __int16 v43 = 2112;
          id v44 = v13;
          _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to get resulting media system from response: %@", buf, 0x16u);
        }
        v31 = [(HMMediaSystemBuilder *)v37 context];
        v32 = [v31 delegateCaller];
        [v32 callCompletion:v10 error:v12 mediaSystem:0];
      }
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x19F3A64A0]();
    v28 = v15;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v42 = v30;
      __int16 v43 = 2112;
      id v44 = v11;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to get matching builder session ID: %@", buf, 0x16u);
    }
  }
}

- (void)_commitWithCompletionHandler:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMMediaSystemBuilder *)self builderSessionID];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v71 = v9;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@There is already a builder session ID in progress, cannot submit another commit", buf, 0xCu);
    }
    id v10 = [(HMMediaSystemBuilder *)v7 context];
    id v11 = [v10 delegateCaller];
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
    [v11 callCompletion:v4 error:v12 mediaSystem:0];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];

    [(HMMediaSystemBuilder *)self setBuilderSessionID:v14];
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v59 = (void *)v14;
    [v15 setObject:v14 forKeyedSubscript:kMediaSystemBuilderSessionIDKey];
    v16 = [(HMMediaSystemBuilder *)self configuredName];
    [v15 setObject:v16 forKeyedSubscript:kMediaSystemConfiguredNameCodingKey];

    v17 = [(HMMediaSystemBuilder *)self mediaSystemUUID];
    int v18 = [v17 UUIDString];
    v60 = v15;
    [v15 setObject:v18 forKeyedSubscript:kMediaSystemUUIDCodingKey];

    id v12 = [MEMORY[0x1E4F1CA48] array];
    char v19 = [MEMORY[0x1E4F1CA80] set];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = [(HMMediaSystemBuilder *)self components];
    uint64_t v20 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v67;
      id v58 = v4;
LABEL_7:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v67 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v66 + 1) + 8 * v23);
        uint64_t v25 = (void *)[v24 copy];
        uint64_t v26 = [v25 serialize];
        [v12 addObject:v26];

        v27 = [v24 accessory];
        v28 = [v27 uuid];

        if (!v28) {
          break;
        }
        if ([v19 containsObject:v28])
        {
          context = (void *)MEMORY[0x19F3A64A0]();
          v38 = self;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v39 = HMFGetLogIdentifier();
            id v40 = [(HMMediaSystemBuilder *)v38 components];
            *(_DWORD *)buf = 138543874;
            v71 = v39;
            __int16 v72 = 2112;
            id v73 = v24;
            __int16 v74 = 2112;
            v75 = v40;
            _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Builder session does not have unique accessory UUID for component %@ in components: %@", buf, 0x20u);
          }
          uint64_t v37 = 3;
LABEL_24:
          id v4 = v58;
          id v10 = v59;

          id v41 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v37];
          [(HMMediaSystemBuilder *)self _callCompletion:v58 builderSessionID:v59 error:v41 response:MEMORY[0x1E4F1CC08]];
          goto LABEL_29;
        }
        [v19 addObject:v28];

        if (v21 == ++v23)
        {
          uint64_t v21 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
          id v4 = v58;
          if (v21) {
            goto LABEL_7;
          }
          goto LABEL_14;
        }
      }
      context = (void *)MEMORY[0x19F3A64A0]();
      v34 = self;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v71 = v36;
        __int16 v72 = 2112;
        id v73 = v24;
        _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Builder session could not get accessory UUID for component %@", buf, 0x16u);
      }
      v28 = 0;
      uint64_t v37 = 20;
      goto LABEL_24;
    }
LABEL_14:

    v29 = v60;
    [v60 setObject:v12 forKeyedSubscript:kMediaSystemComponentsCodingKey];
    v30 = [(HMMediaSystemBuilder *)self mediaSystem];
    v31 = &kUpdateMediaSystemRequest;
    if (!v30) {
      v31 = &kAddMediaSystemRequest;
    }
    v32 = *v31;

    uint64_t v33 = [(HMMediaSystemBuilder *)self mediaSystem];
    id obj = v32;
    if (v33) {
      [(HMMediaSystemBuilder *)self mediaSystem];
    }
    else {
    v42 = [(HMMediaSystemBuilder *)self home];
    }
    uint64_t v25 = [v42 uuid];

    __int16 v43 = (void *)MEMORY[0x19F3A64A0]();
    id v44 = self;
    uint64_t v45 = HMFGetOSLogHandle();
    id v10 = v59;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = HMFGetLogIdentifier();
      v47 = [v25 UUIDString];
      *(_DWORD *)buf = 138544130;
      v71 = v46;
      __int16 v72 = 2112;
      id v73 = obj;
      __int16 v74 = 2112;
      v75 = v47;
      __int16 v76 = 2112;
      v77 = v60;
      _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_INFO, "%{public}@Committing the media system builder with message: %@, targetUUID: %@, payload: %@", buf, 0x2Au);

      v29 = v60;
    }

    id v48 = objc_alloc(MEMORY[0x1E4F654B0]);
    v49 = (void *)[objc_alloc(MEMORY[0x1E4F65488]) initWithTarget:v25];
    v28 = (void *)[v48 initWithName:obj destination:v49 payload:v29];

    v50 = [(HMMediaSystemBuilder *)v44 context];
    v51 = [v50 pendingRequests];

    v52 = [v28 identifier];
    v53 = _Block_copy(v4);
    [v51 addMediaSystemBuilder:v44 andCompletionBlock:v53 forIdentifier:v52];

    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __53__HMMediaSystemBuilder__commitWithCompletionHandler___block_invoke;
    v62[3] = &unk_1E59450E8;
    id v63 = v51;
    id v64 = v52;
    id v65 = v59;
    id v54 = v52;
    id v41 = v51;
    [v28 setResponseHandler:v62];
    v55 = [(HMMediaSystemBuilder *)v44 context];
    v56 = [v55 messageDispatcher];
    [v56 sendMessage:v28];

LABEL_29:
    id v11 = v60;
  }
}

void __53__HMMediaSystemBuilder__commitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v5 removeMediaSystemBuilderForIdentifier:v6];
  v9 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  [v10 _callCompletion:v9 builderSessionID:*(void *)(a1 + 48) error:v8 response:v7];
}

- (void)commitWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMMediaSystemBuilder *)self context];
  if (v5)
  {
    id v19 = [(HMMediaSystemBuilder *)self activity];
    [v19 markWithReason:@"commit with completion"];
    uint64_t v6 = [(HMMediaSystemBuilder *)self home];

    if (v6)
    {
      id v7 = [v5 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__HMMediaSystemBuilder_commitWithCompletionHandler___block_invoke;
      block[3] = &unk_1E59454E8;
      block[4] = self;
      id v18 = v4;
      dispatch_async(v7, block);
    }
    else
    {
      id v12 = (void *)MEMORY[0x19F3A64A0]();
      id v13 = self;
      HMFGetOSLogHandle();
      uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v15;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to commit due to no reference to home", buf, 0xCu);
      }
      if (v4)
      {
        v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
        (*((void (**)(id, void *, void))v4 + 2))(v4, v16, 0);
      }
    }
    __HMFActivityScopeLeave();
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v11;
      __int16 v22 = 2080;
      uint64_t v23 = "-[HMMediaSystemBuilder commitWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __52__HMMediaSystemBuilder_commitWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)setComponents:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMediaSystemBuilder *)self componentsArray];
  [v5 setArray:v4];
}

- (NSArray)components
{
  v2 = [(HMMediaSystemBuilder *)self componentsArray];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(HMMediaSystemBuilder *)self logIdentifier];
  id v4 = [v2 stringWithFormat:@"[HMMediaSystemBuilder: %@]", v3];

  return (NSString *)v4;
}

- (HMMediaSystemBuilder)initWithMediaSystem:(id)a3
{
  id v5 = a3;
  id v6 = [v5 home];
  id v7 = [v5 uuid];
  id v8 = [v6 context];
  v9 = [v5 components];
  id v10 = +[HMMutableArray arrayWithArray:v9];
  id v11 = [(HMMediaSystemBuilder *)self initWithHome:v6 mediaSystemUUID:v7 context:v8 components:v10];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaSystem, a3);
    uint64_t v12 = [v5 name];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v5 configuredName];
    configuredName = v11->_configuredName;
    v11->_configuredName = (NSString *)v14;
  }
  return v11;
}

- (HMMediaSystemBuilder)initWithHome:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [v5 context];
  id v8 = +[HMMutableArray array];
  v9 = [(HMMediaSystemBuilder *)self initWithHome:v5 mediaSystemUUID:v6 context:v7 components:v8];

  return v9;
}

- (HMMediaSystemBuilder)initWithHome:(id)a3 mediaSystemUUID:(id)a4 context:(id)a5 components:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMMediaSystemBuilder;
  uint64_t v14 = [(HMMediaSystemBuilder *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v10);
    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v16;

    objc_storeStrong((id *)&v15->_mediaSystemUUID, a4);
    objc_storeStrong((id *)&v15->_context, a5);
    objc_storeStrong((id *)&v15->_componentsArray, a6);
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28 != -1) {
    dispatch_once(&logCategory__hmf_once_t28, &__block_literal_global_50894);
  }
  v2 = (void *)logCategory__hmf_once_v29;

  return v2;
}

uint64_t __35__HMMediaSystemBuilder_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v29;
  logCategory__hmf_once_v29 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isStereoPairingSupportedForAccessories:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] == 2)
  {
    id v5 = [v4 firstObject];
    uint64_t v6 = [v5 supportedStereoPairVersions];

    id v7 = [MEMORY[0x1E4F1CA80] set];
    id v8 = [MEMORY[0x1E4F1CA80] set];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v4;
    uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v43;
      id v39 = a1;
      id v40 = v4;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
        if (!+[HMMediaSystemBuilder supportsMediaSystem:v13])goto LABEL_31; {
        uint64_t v14 = [v13 supportedStereoPairVersions];
        }
        v15 = [v13 uuid];
        if ([v7 containsObject:v15]) {
          break;
        }
        [v7 addObject:v15];
        uint64_t v16 = [v13 serialNumber];
        if (v16)
        {
          if ([v8 containsObject:v16])
          {
            v34 = (void *)MEMORY[0x19F3A64A0]();
            id v35 = v39;
            v36 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              uint64_t v37 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v47 = v37;
              __int16 v48 = 2112;
              id v49 = v16;
              _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@Accessories are not supported for stereo pair as they have same serial number: %@", buf, 0x16u);
            }

LABEL_30:
LABEL_31:

            BOOL v24 = 0;
            id v4 = v40;
            goto LABEL_32;
          }
          [v8 addObject:v16];
        }
        v6 &= v14;

        if (v10 == ++v12)
        {
          uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
          a1 = v39;
          id v4 = v40;
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_14;
        }
      }
      v29 = (void *)MEMORY[0x19F3A64A0]();
      id v30 = v39;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v47 = v32;
        __int16 v48 = 2112;
        id v49 = obj;
        _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Accessories are not supported for stereo pair as they are not unique accessories: %@", buf, 0x16u);
      }
      goto LABEL_30;
    }
LABEL_14:

    v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = a1;
    objc_super v19 = HMFGetOSLogHandle();
    uint64_t v20 = v19;
    if (v6)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = id v21 = v4;
        uint64_t v23 = [NSNumber numberWithUnsignedInteger:v6];
        *(_DWORD *)buf = 138543874;
        v47 = v22;
        __int16 v48 = 2112;
        id v49 = obj;
        __int16 v50 = 2112;
        v51 = v23;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Stereo pairing versions are supported for accessories: %@ stereo pair version: %@", buf, 0x20u);

        id v4 = v21;
      }

      BOOL v24 = 1;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v47 = v33;
        __int16 v48 = 2112;
        id v49 = obj;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Stereo pairing versions are not supported for accessories: %@", buf, 0x16u);
      }
      BOOL v24 = 0;
    }
LABEL_32:
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
    id v26 = a1;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v28;
      __int16 v48 = 2112;
      id v49 = v4;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Stereo pairing is not supported due wrong number of components: %@", buf, 0x16u);
    }
    BOOL v24 = 0;
  }

  return v24;
}

+ (BOOL)supportsMediaSystem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 canSupportMediaSystem:v4])
  {
    *(_OWORD *)uint64_t v14 = *MEMORY[0x1E4F65070];
    *(void *)&v14[16] = *(void *)(MEMORY[0x1E4F65070] + 16);
    id v5 = [MEMORY[0x1E4F65558] versionFromOperatingSystemVersion:v14];
    uint64_t v6 = [v4 softwareVersion];
    char v7 = [v6 isAtLeastVersion:v5];

    if ((v7 & 1) == 0)
    {
      id v8 = (void *)MEMORY[0x19F3A64A0]();
      id v9 = a1;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        uint64_t v12 = [v4 softwareVersion];
        *(_DWORD *)uint64_t v14 = 138543874;
        *(void *)&v14[4] = v11;
        *(_WORD *)&v14[12] = 2112;
        *(void *)&v14[14] = v4;
        *(_WORD *)&v14[22] = 2112;
        v15 = v12;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Does not support media system due to accessory: %@ software version: %@", v14, 0x20u);
      }
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)canSupportMediaSystem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 category];
  uint64_t v6 = [v5 categoryType];
  char v7 = [v6 isEqualToString:@"1D8FD40E-7CAE-4AD5-9973-977D18890DE2"];

  if ((v7 & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = a1;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v4 category];
      int v14 = 138543874;
      v15 = v11;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      objc_super v19 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Returning no since category does not support stereo for accessory: %@ category: %@", (uint8_t *)&v14, 0x20u);
    }
  }

  return v7;
}

@end