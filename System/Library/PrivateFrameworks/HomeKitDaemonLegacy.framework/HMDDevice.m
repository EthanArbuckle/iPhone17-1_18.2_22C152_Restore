@interface HMDDevice
+ (BOOL)supportsSecureCoding;
+ (HMDDevice)deviceWithDestination:(id)a3;
+ (HMDDevice)deviceWithHandle:(id)a3;
+ (id)destinationForDevice:(id)a3 service:(id)a4;
+ (id)logCategory;
- (BOOL)isBackingStorageEqual:(id)a3;
- (BOOL)isCloudTracked;
- (BOOL)isCurrentDevice;
- (BOOL)isDirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocallyTracked;
- (BOOL)isPublishingOnObservedNetService;
- (BOOL)isRelatedToDevice:(id)a3;
- (BOOL)isSameAccountWithDevice:(id)a3;
- (BOOL)mergeObject:(id)a3;
- (BOOL)supportsHH2;
- (Class)modelClass;
- (HMDAccount)account;
- (HMDDevice)init;
- (HMDDevice)initWithCoder:(id)a3;
- (HMDDevice)initWithDeviceAddress:(id)a3;
- (HMDDevice)initWithIdentifier:(id)a3 handles:(id)a4 name:(id)a5 productInfo:(id)a6 version:(id)a7 capabilities:(id)a8;
- (HMDDevice)initWithObjectModel:(id)a3;
- (HMDDevice)initWithService:(id)a3 device:(id)a4;
- (HMDDeviceAddress)deviceAddress;
- (HMDDeviceCapabilities)capabilities;
- (HMDHomeKitVersion)derivedVersion;
- (HMDHomeKitVersion)localOnlyVersionFromIDS;
- (HMDHomeKitVersion)version;
- (HMDRPIdentity)rpIdentity;
- (HMFProductInfo)productInfo;
- (NSArray)attributeDescriptions;
- (NSArray)identities;
- (NSData)pushToken;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)identifier;
- (NSUUID)idsIdentifier;
- (NSUUID)idsIdentifierHash;
- (NSUUID)modelIdentifier;
- (NSUUID)modelParentIdentifier;
- (NSUUID)sharedUserIDSIdentifier;
- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)deviceForIDSService:(id)a3;
- (id)globalDestination;
- (id)globalHandles;
- (id)handles;
- (id)localHandles;
- (id)logIdentifier;
- (id)modelBackedObjects;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)remoteDestinationString;
- (uint64_t)_swapToNetServiceKVOCancellation:(void *)a3 swapToObservedNetService:;
- (unint64_t)hash;
- (void)__handleAccountHandleUpdated:(id)a3;
- (void)__updateDeviceWithActions:(id)a3;
- (void)_postIsPublishingChanged:(void *)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setCloudTracked:(BOOL)a3;
- (void)setDirty:(BOOL)a3;
- (void)setHandles:(id)a3;
- (void)setIDSIdentifierHash:(id)a3;
- (void)setLocalOnlyVersionFromIDS:(id)a3;
- (void)setLocallyTracked:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setProductInfo:(id)a3;
- (void)setRpIdentity:(id)a3;
- (void)setSharedUserIDSIdentifier:(id)a3;
- (void)setVersion:(id)a3;
- (void)startObservingIsPublishingForService:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateVersion:(id)a3;
- (void)updateWithDevice:(id)a3;
@end

@implementation HMDDevice

- (id)deviceForIDSService:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(HMDDevice *)self localHandles];
  v7 = [v5 setWithArray:v6];

  if ([v7 count])
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = [v4 devices];
    id v10 = (id)[v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      v19 = v8;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1E4F1CAD0];
          v15 = objc_msgSend(v13, "hmd_handlesForService:", v4);
          v16 = [v14 setWithArray:v15];
          int v17 = [v7 intersectsSet:v16];

          if (v17)
          {
            id v10 = v13;
            goto LABEL_12;
          }
        }
        id v10 = (id)[v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_12:
      v8 = v19;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (HMDDevice)initWithService:(id)a3 device:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "hmd_handlesForService:", v6);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v12 = 0;
      uint64_t v13 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v15, "isGlobal", (void)v30))
          {
            uint64_t v16 = [v15 identifier];

            v12 = (void *)v16;
            goto LABEL_16;
          }
          if (!v12)
          {
            if ([v15 isLocal])
            {
              v12 = [v15 identifier];
            }
            else
            {
              v12 = 0;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_16:

      if (v12)
      {
        int v17 = [v8 name];
        v18 = objc_msgSend(v8, "hmd_productInfo");
        v19 = objc_msgSend(v8, "hmd_version");
        long long v20 = objc_msgSend(v8, "hmd_capabilities");
        long long v21 = [(HMDDevice *)self initWithIdentifier:v12 handles:v9 name:v17 productInfo:v18 version:v19 capabilities:v20];

        long long v22 = v21;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    v26 = (void *)MEMORY[0x1D9452090]();
    long long v21 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v28;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device identifier", buf, 0xCu);
    }
    long long v22 = 0;
    goto LABEL_25;
  }
  long long v23 = (void *)MEMORY[0x1D9452090]();
  long long v21 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v25;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Device is required", buf, 0xCu);
  }
  long long v22 = 0;
LABEL_26:

  return v22;
}

+ (id)destinationForDevice:(id)a3 service:(id)a4
{
  id v4 = objc_msgSend(a3, "hmd_preferredHandleForService:", a4);
  v5 = [v4 destination];

  return v5;
}

- (NSArray)identities
{
  v3 = +[HMDIdentityRegistry sharedRegistry];
  id v4 = [v3 identitiesForDevice:self];

  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifierHash, 0);
  objc_storeStrong((id *)&self->_localOnlyVersionFromIDS, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_rpIdentity, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productInfo, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_netServiceKVOCancellation, 0);
  objc_storeStrong((id *)&self->_observedNetService, 0);
}

- (void)setSharedUserIDSIdentifier:(id)a3
{
}

- (NSUUID)sharedUserIDSIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCloudTracked:(BOOL)a3
{
  self->_cloudTracked = a3;
}

- (BOOL)isCloudTracked
{
  return self->_cloudTracked;
}

- (void)setLocallyTracked:(BOOL)a3
{
  self->_locallyTracked = a3;
}

- (BOOL)isLocallyTracked
{
  return self->_locallyTracked;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 120, 1);
}

- (NSUUID)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)dealloc
{
  -[HMDDevice _swapToNetServiceKVOCancellation:swapToObservedNetService:]((uint64_t)self, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)HMDDevice;
  [(HMDDevice *)&v3 dealloc];
}

- (uint64_t)_swapToNetServiceKVOCancellation:(void *)a3 swapToObservedNetService:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    int v8 = [*(id *)(a1 + 8) isPublishing];
    id v9 = *(id *)(a1 + 16);
    id v12 = *(id *)(a1 + 8);
    objc_storeStrong((id *)(a1 + 16), a2);
    objc_storeStrong((id *)(a1 + 8), a3);
    uint64_t v10 = v8 ^ [*(id *)(a1 + 8) isPublishing];
    if (v10 == 1) {
      *(unsigned char *)(a1 + 24) = [*(id *)(a1 + 8) isPublishing];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28));
    if (v9)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__HMDDevice__swapToNetServiceKVOCancellation_swapToObservedNetService___block_invoke;
      block[3] = &unk_1E6A197C8;
      id v14 = v9;
      id v15 = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __71__HMDDevice__swapToNetServiceKVOCancellation_swapToObservedNetService___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)startObservingIsPublishingForService:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HMDDevice_startObservingIsPublishingForService___block_invoke;
  aBlock[3] = &unk_1E6A0FE70;
  objc_copyWeak(&v13, &location);
  v5 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HMDDevice_startObservingIsPublishingForService___block_invoke_2;
  block[3] = &unk_1E6A193D0;
  uint64_t v10 = self;
  id v11 = v5;
  id v9 = v4;
  id v6 = v5;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __50__HMDDevice_startObservingIsPublishingForService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v10;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  if (WeakRetained && v9)
  {
    os_unfair_lock_lock_with_options();
    if (v9 == *((id *)WeakRetained + 1) && WeakRetained[24] != [v9 isPublishing])
    {
      WeakRetained[24] = [*((id *)WeakRetained + 1) isPublishing];
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 7);
      -[HMDDevice _postIsPublishingChanged:](WeakRetained);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 7);
    }
  }
}

void __50__HMDDevice_startObservingIsPublishingForService___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hmf_registerObserverForKeyPath:options:handler:", @"isPublishing", 1, *(void *)(a1 + 48));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (-[HMDDevice _swapToNetServiceKVOCancellation:swapToObservedNetService:](*(void *)(a1 + 40), v2, *(void **)(a1 + 32)))-[HMDDevice _postIsPublishingChanged:](*(void **)(a1 + 40)); {
}
  }

- (void)_postIsPublishingChanged:(void *)a1
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MEMORY[0x1E4F1CC08];
  id v3 = MEMORY[0x1E4F1CC08];
  if (a1)
  {
    int v17 = @"isPublishing";
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isPublishingOnObservedNetService"));
    v18[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = a1;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543874;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v2;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Posting HMDDeviceIsPublishingChangedNotification with userInfo: %@, changeDictionary: %@", (uint8_t *)&v11, 0x20u);
    }
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"HMDDeviceIsPublishingChangedNotification" object:v7 userInfo:v5];
  }
}

- (BOOL)isPublishingOnObservedNetService
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_lastKnownIsPublishingStateValue;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (BOOL)isBackingStorageEqual:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (![(HMDDevice *)self isEqual:v6]) {
    goto LABEL_27;
  }
  id v7 = [(HMDDevice *)self idsIdentifier];
  int v8 = [v6 idsIdentifier];
  char v9 = HMFEqualObjects();

  if ((v9 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    long long v30 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v30 idsIdentifier];
    v34 = [v6 idsIdentifier];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device IDS Identifier from %@ to %@";
LABEL_25:
    _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, v35, buf, 0x20u);

    goto LABEL_26;
  }
  id v10 = [(HMDDevice *)self name];
  int v11 = [v6 name];
  char v12 = HMFEqualObjects();

  if ((v12 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v36 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v36 name];
    v34 = [v6 name];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device name from %@ to %@";
    goto LABEL_25;
  }
  __int16 v13 = [(HMDDevice *)self productInfo];
  id v14 = [v6 productInfo];
  char v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    uint64_t v37 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v37 productInfo];
    v34 = [v6 productInfo];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device Product Info from %@ to %@";
    goto LABEL_25;
  }
  uint64_t v16 = [(HMDDevice *)self version];
  int v17 = [v6 version];
  char v18 = HMFEqualObjects();

  if ((v18 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v38 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v38 version];
    v34 = [v6 version];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device version from %@ to %@";
    goto LABEL_25;
  }
  v19 = [(HMDDevice *)self capabilities];
  long long v20 = [v6 capabilities];
  char v21 = HMFEqualObjects();

  if ((v21 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v39 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v39 capabilities];
    v34 = [v6 capabilities];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device capabilities from %@ to %@";
    goto LABEL_25;
  }
  long long v22 = [(HMDDevice *)self pushToken];
  long long v23 = [v6 pushToken];
  char v24 = HMFEqualObjects();

  if ((v24 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v40 = self;
    long long v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      long long v32 = HMFGetLogIdentifier();
      long long v33 = [(HMDDevice *)v40 pushToken];
      v34 = [v6 pushToken];
      *(_DWORD *)buf = 138543874;
      v57 = v32;
      __int16 v58 = 2112;
      v59 = v33;
      __int16 v60 = 2112;
      v61 = v34;
      v35 = "%{public}@Updating Push Token from %@ to %@";
      goto LABEL_25;
    }
LABEL_26:

LABEL_27:
    BOOL v28 = 0;
    goto LABEL_28;
  }
  uint64_t v25 = [(HMDDevice *)self rpIdentity];
  v26 = [v6 rpIdentity];
  char v27 = HMFEqualObjects();

  if ((v27 & 1) == 0)
  {
    v42 = (void *)MEMORY[0x1D9452090]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      v46 = [(HMDDevice *)v43 rpIdentity];
      v47 = [v6 rpIdentity];
      *(_DWORD *)buf = 138543874;
      v57 = v45;
      __int16 v58 = 2112;
      v59 = v46;
      __int16 v60 = 2112;
      v61 = v47;
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Updating Device Rapport identity from %@ to %@", buf, 0x20u);
    }
    v29 = (void *)MEMORY[0x1D9452090]();
    v48 = v43;
    long long v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v49 = HMFGetLogIdentifier();
      v55 = [(HMDDevice *)v48 rpIdentity];
      v54 = [v55 deviceIRK];
      v50 = [v54 data];
      v51 = [v6 rpIdentity];
      v52 = [v51 deviceIRK];
      v53 = [v52 data];
      *(_DWORD *)buf = 138543874;
      v57 = v49;
      __int16 v58 = 2112;
      v59 = v50;
      __int16 v60 = 2112;
      v61 = v53;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Rapport identity changed from %@ to %@", buf, 0x20u);
    }
    goto LABEL_26;
  }
  BOOL v28 = 1;
LABEL_28:

  return v28;
}

- (id)modelBackedObjects
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObject:self];
  id v4 = [(HMDDevice *)self capabilities];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = (void *)[v3 copy];

  return v5;
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  id v7 = -[HMDDevice modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:");
  if (v7)
  {
    int v8 = [MEMORY[0x1E4F1CA48] array];
    [v8 addObject:v7];
    char v9 = [(HMDDevice *)self capabilities];
    id v10 = v9;
    if (v9)
    {
      int v11 = [v9 modelObjectWithChangeType:a3 version:a4];
      [v8 addObject:v11];
    }
    char v12 = (void *)[v8 copy];
  }
  else
  {
    char v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = [HMDDeviceModel alloc];
  id v7 = [(HMDDevice *)self modelIdentifier];
  int v8 = [(HMDDevice *)self modelParentIdentifier];
  char v9 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:a3 uuid:v7 parentUUID:v8];

  id v10 = [(HMDDevice *)self identifier];
  [(HMDDeviceModel *)v9 setIdentifier:v10];

  int v11 = [(HMDDevice *)self name];
  char v12 = (void *)[v11 copy];
  [(HMDDeviceModel *)v9 setName:v12];

  __int16 v13 = [(HMDDevice *)self version];
  id v14 = (void *)[v13 copy];
  [(HMDDeviceModel *)v9 setVersion:v14];

  char v15 = [(HMDDevice *)self productInfo];
  uint64_t v16 = (void *)[v15 copy];
  [(HMDDeviceModel *)v9 setProductInfo:v16];

  int v17 = [(HMDDevice *)self rpIdentity];

  if (v17)
  {
    char v18 = [(HMDDevice *)self rpIdentity];
    v19 = (void *)[v18 copy];
    [(HMDDeviceModel *)v9 setRpIdentity:v19];
  }
  long long v20 = [(HMDDevice *)self handles];
  char v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        char v27 = encodeRootObjectForRemoteDeviceOnSameAccountMigrateToHH2(*(void **)(*((void *)&v30 + 1) + 8 * i), 1, 0);
        if (v27) {
          objc_msgSend(v21, "addObject:", v27, (void)v30);
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v24);
  }

  BOOL v28 = (void *)[v21 copy];
  [(HMDDeviceModel *)v9 setHandles:v28];

  return v9;
}

- (NSUUID)modelParentIdentifier
{
  uint64_t v2 = [(HMDDevice *)self account];
  id v3 = [v2 modelIdentifier];

  return (NSUUID *)v3;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)__updateDeviceWithActions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDDevice *)self account];
  id v6 = [v5 manager];

  if ([v4 source] == 2)
  {
    if ([(HMDDevice *)self isCurrentDevice]
      || [v6 isCurrentDeviceDataOwnerForDevice:self])
    {
      uint64_t v7 = [(HMDDevice *)self isLocallyTracked];
      if ((v7 & 1) == 0) {
        uint64_t v7 = [(HMDDevice *)self setLocallyTracked:1];
      }
      int v8 = (void *)MEMORY[0x1D9452090](v7);
      char v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = HMFGetLogIdentifier();
        int v23 = 138543362;
        uint64_t v24 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Not marking cloud transaction as a change for current device", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_22;
    }
    uint64_t v18 = [(HMDDevice *)self isCloudTracked];
    if ((v18 & 1) == 0) {
      uint64_t v18 = [(HMDDevice *)self setCloudTracked:1];
    }
    __int16 v13 = (void *)MEMORY[0x1D9452090](v18);
    id v14 = self;
    char v15 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
LABEL_21:

      [v4 markChanged];
      goto LABEL_22;
    }
    uint64_t v16 = HMFGetLogIdentifier();
    int v23 = 138543362;
    uint64_t v24 = v16;
    int v17 = "%{public}@Marking cloud transaction as a change";
LABEL_20:
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v23, 0xCu);

    goto LABEL_21;
  }
  if ([v4 source]) {
    goto LABEL_22;
  }
  if ([(HMDDevice *)self isCurrentDevice]
    || [v6 isCurrentDeviceDataOwnerForDevice:self])
  {
    uint64_t v12 = [(HMDDevice *)self isLocallyTracked];
    if ((v12 & 1) == 0) {
      uint64_t v12 = [(HMDDevice *)self setLocallyTracked:1];
    }
    __int16 v13 = (void *)MEMORY[0x1D9452090](v12);
    id v14 = self;
    char v15 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    uint64_t v16 = HMFGetLogIdentifier();
    int v23 = 138543362;
    uint64_t v24 = v16;
    int v17 = "%{public}@Marking local transaction for cloud upload";
    goto LABEL_20;
  }
  if (!isWatch())
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    long long v20 = self;
    char v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      int v23 = 138543362;
      uint64_t v24 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Not marking local transaction for cloud upload", (uint8_t *)&v23, 0xCu);
    }
    [(HMDDevice *)v20 setCloudTracked:1];
  }
  [v4 markLocalChanged];
LABEL_22:
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v11 = v9;
  }
  else {
    int v11 = 0;
  }
  unint64_t v12 = v11;
  id v13 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  unint64_t v15 = v14;

  if (v12 | v15)
  {
    uint64_t v16 = [v10 transactionResult];
    [(HMDDevice *)self __updateDeviceWithActions:v16];
    int v17 = [(HMDDevice *)self account];
    uint64_t v18 = [v17 manager];
    int v19 = [v18 shouldDevice:self processModel:v13 actions:v16];

    if (v19)
    {
      if (v12)
      {
        __transactionDeviceUpdated(self, (void *)v12, v10);
      }
      else if (v15)
      {
        uint64_t v25 = self;
        id v26 = (id)v15;
        id v27 = v10;
        BOOL v28 = [v27 transactionResult];
        v29 = [(HMDDevice *)v25 capabilities];
        v38 = v27;
        v39 = v26;
        uint64_t v37 = v29;
        if (v29)
        {
          [v29 transactionObjectUpdated:0 newValues:v26 message:v27];
          long long v30 = v28;
        }
        else
        {
          long long v31 = [[HMDDeviceCapabilities alloc] initWithObjectModel:v26];
          [(HMDDevice *)v25 setCapabilities:v31];

          long long v32 = [(HMDDevice *)v25 capabilities];

          long long v30 = v28;
          if (v32)
          {
            [v28 markChanged];
            long long v33 = [(HMDDevice *)v25 capabilities];
            v45[0] = @"HMDDeviceCapabilitiesUpdatedDifferingFieldsNotificationKey";
            v36 = [v39 setProperties];
            *(void *)buf = v36;
            v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v45 count:1];
            logAndPostNotification(@"HMDDeviceCapabilitiiesUpdatedNotification", v33, v34);
          }
        }
        if ([v30 changed])
        {
          [(HMDDevice *)v25 setDirty:1];
          uint64_t v35 = [v30 backingStore];
          __HMDDeviceMarkDirty(v25, v35);
        }
      }
    }
  }
  else
  {
    long long v20 = (void *)MEMORY[0x1D9452090]();
    char v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v23;
      __int16 v41 = 2112;
      id v42 = v13;
      __int16 v43 = 2112;
      id v44 = (id)objc_opt_class();
      id v24 = v44;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated:newValues:message:]", buf, 0x20u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v10 respondWithError:v16];
  }
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  int v11 = HMFGetOSLogHandle();
  unint64_t v12 = v11;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Received remove capabilities", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v17 = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = (id)objc_opt_class();
      id v15 = v22;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved:message:]", (uint8_t *)&v17, 0x20u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v7 respondWithError:v16];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v33 = a3;
  int v4 = objc_msgSend(v33, "hmd_isForXPCTransport");
  id v5 = [(HMDDevice *)self identifier];
  if (v4)
  {
    [v33 encodeObject:v5 forKey:@"HM.identifier"];

    id v6 = [(HMDDevice *)self name];
    [v33 encodeObject:v6 forKey:@"HM.name"];

    id v7 = [(HMDDevice *)self productInfo];
    [v33 encodeObject:v7 forKey:*MEMORY[0x1E4F2D0A0]];

    objc_msgSend(v33, "encodeBool:forKey:", -[HMDDevice isCurrentDevice](self, "isCurrentDevice"), @"HM.currentDevice");
    id v8 = [(HMDDevice *)self idsIdentifier];
    [v33 encodeObject:v8 forKey:*MEMORY[0x1E4F2D098]];

    if ((objc_msgSend(v33, "hmd_entitlements") & 0x1000) != 0)
    {
      id v9 = [(HMDDevice *)self remoteDestinationString];
      [v33 encodeObject:v9 forKey:*MEMORY[0x1E4F2D090]];
    }
    id v10 = [(HMDDevice *)self rpIdentity];
    int v11 = [v10 deviceIRK];
    [v33 encodeObject:v11 forKey:*MEMORY[0x1E4F2D0A8]];

    BOOL v12 = [(HMDDevice *)self supportsHH2];
    [v33 encodeBool:v12 forKey:*MEMORY[0x1E4F2D110]];
  }
  else
  {
    [v33 encodeObject:v5 forKey:@"HM.identifier"];

    id v13 = [(HMDDevice *)self handles];
    [v33 encodeObject:v13 forKey:@"HM.handles"];

    id v14 = [(HMDDevice *)self name];
    [v33 encodeObject:v14 forKey:@"HM.name"];

    id v15 = [(HMDDevice *)self version];
    [v33 encodeObject:v15 forKey:@"HM.version2"];

    if ((objc_msgSend(v33, "hmd_isForLocalStore") & 1) != 0
      || objc_msgSend(v33, "hmd_isForRemoteTransportOnSameAccount"))
    {
      uint64_t v16 = [(HMDDevice *)self productInfo];
      [v33 encodeObject:v16 forKey:@"HM.productInfo"];
    }
    int v17 = [(HMDDevice *)self version];
    uint64_t v18 = v17;
    if (v17)
    {
      __int16 v19 = objc_msgSend(NSString, "stringWithFormat:", @"%tu.%tu", objc_msgSend(v17, "majorVersion"), objc_msgSend(v17, "minorVersion"));
      id v20 = NSNumber;
      [v19 doubleValue];
      __int16 v21 = objc_msgSend(v20, "numberWithDouble:");
    }
    else
    {
      __int16 v21 = 0;
    }
    [v33 encodeObject:v21 forKey:@"HM.version"];

    id v22 = [(HMDDevice *)self remoteDestinationString];
    [v33 encodeObject:v22 forKey:@"HM.destination"];

    uint64_t v23 = [(HMDDevice *)self idsIdentifier];
    [v33 encodeObject:v23 forKey:@"HM.idsIdentifier"];

    id v24 = [(HMDDevice *)self idsIdentifierHash];
    [v33 encodeObject:v24 forKey:@"HM.accountIdentifier"];

    uint64_t v25 = [(HMDDevice *)self rpIdentity];
    [v33 encodeObject:v25 forKey:@"HM.rpIdentity"];

    id v26 = [(HMDDevice *)self capabilities];
    [v33 encodeObject:v26 forKey:@"HM.capabilities"];
    if (v26)
    {
      id v27 = [(HMDDevice *)self capabilities];
      objc_msgSend(v33, "encodeBool:forKey:", objc_msgSend(v27, "supportsKeychainSync"), @"HM.supportsKeychainSync");

      BOOL v28 = [(HMDDevice *)self capabilities];
      objc_msgSend(v33, "encodeBool:forKey:", objc_msgSend(v28, "supportsCloudDataSync"), @"HM.supportsCloudDataSync");

      v29 = [(HMDDevice *)self capabilities];
      objc_msgSend(v33, "encodeBool:forKey:", objc_msgSend(v29, "isResidentCapable"), @"HM.residentCapable");

      long long v30 = [(HMDDevice *)self capabilities];
      objc_msgSend(v33, "encodeBool:forKey:", objc_msgSend(v30, "isRemoteGatewayCapable"), @"HM.remoteGatewayCapable");
    }
    if (objc_msgSend(v33, "hmd_isForLocalStore"))
    {
      long long v31 = [(HMDDevice *)self modelIdentifier];
      [v33 encodeObject:v31 forKey:@"HM.modelIdentifier"];

      objc_msgSend(v33, "encodeBool:forKey:", -[HMDDevice isLocallyTracked](self, "isLocallyTracked"), @"HM.locallyTracked");
      objc_msgSend(v33, "encodeBool:forKey:", -[HMDDevice isCloudTracked](self, "isCloudTracked"), @"HM.cloudTracked");
      long long v32 = [(HMDDevice *)self sharedUserIDSIdentifier];
      [v33 encodeObject:v32 forKey:@"HM.sharedUserIDSIdentifier"];
    }
  }
}

- (HMDDevice)initWithCoder:(id)a3
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = 0x1E4F29000uLL;
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.name"];
  v50 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.productInfo"];
  if ([v3 containsValueForKey:@"HM.handles"])
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    id v9 = [v7 setWithArray:v8];
    uint64_t v10 = [v3 decodeObjectOfClasses:v9 forKey:@"HM.handles"];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    id v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.idsIdentifier"];
    if (v9)
    {
      int v11 = [[_HMDLocalDeviceHandle alloc] initWithDeviceIdentifier:v9];
      if (v11)
      {
        BOOL v12 = [[HMDDeviceHandle alloc] initWithInternal:v11];
        [v8 addObject:v12];
      }
    }
    id v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.destination"];
    id v14 = +[HMDDeviceHandle deviceHandleForDestination:v13];

    if (v14) {
      [v8 addObject:v14];
    }

    uint64_t v10 = [v8 copy];
  }
  id v15 = (void *)v10;

  v48 = v15;
  if ([v3 containsValueForKey:@"HM.version2"])
  {
    id v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.version2"];
    int v17 = fixHomeKitVersion(v16);
  }
  else
  {
    int v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.version"];
    if (v17)
    {
      uint64_t v18 = v6;
      __int16 v19 = v5;
      id v20 = (void *)MEMORY[0x1D9452090]();
      __int16 v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        id v24 = [v17 stringValue];
        *(_DWORD *)buf = 138543618;
        v52 = v23;
        __int16 v53 = 2112;
        v54 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating the version of device '%@'", buf, 0x16u);
      }
      id v16 = v17;
      uint64_t v25 = [HMDHomeKitVersion alloc];
      id v26 = [v16 stringValue];

      id v27 = [(HMDHomeKitVersion *)v25 initWithVersionString:v26];
      int v17 = fixHomeKitVersion(v27);

      id v5 = v19;
      id v6 = v18;
      unint64_t v4 = 0x1E4F29000;
      id v15 = v48;
    }
    else
    {
      id v16 = 0;
    }
  }

  if ([v3 containsValueForKey:@"HM.capabilities"])
  {
    BOOL v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.capabilities"];
  }
  else
  {
    v29 = [HMDDeviceCapabilitiesModel alloc];
    long long v30 = [*(id *)(v4 + 296) UUID];
    long long v31 = [(HMDBackingStoreModelObject *)v29 initWithUUID:v30];

    long long v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", @"HM.supportsKeychainSync"));
    [(HMDDeviceCapabilitiesModel *)v31 setSupportsKeychainSync:v32];

    id v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", @"HM.supportsCloudDataSync"));
    [(HMDDeviceCapabilitiesModel *)v31 setSupportsCloudDataSync:v33];

    v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", @"HM.residentCapable"));
    [(HMDDeviceCapabilitiesModel *)v31 setResidentCapable:v34];

    uint64_t v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", @"HM.remoteGatewayCapable"));
    [(HMDDeviceCapabilitiesModel *)v31 setRemoteGatewayCapable:v35];

    BOOL v28 = [[HMDDeviceCapabilities alloc] initWithObjectModel:v31];
  }
  v36 = [(HMDDevice *)self initWithIdentifier:v5 handles:v15 name:v6 productInfo:v50 version:v17 capabilities:v28];
  if (v36)
  {
    if ([v3 containsValueForKey:@"HM.modelIdentifier"])
    {
      uint64_t v37 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.modelIdentifier"];
    }
    else
    {
      uint64_t v37 = [(NSUUID *)v36->_identifier copy];
    }
    modelIdentifier = v36->_modelIdentifier;
    v36->_modelIdentifier = (NSUUID *)v37;

    uint64_t v39 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accountIdentifier"];
    idsIdentifierHash = v36->_idsIdentifierHash;
    v36->_idsIdentifierHash = (NSUUID *)v39;

    __int16 v41 = [(HMDDeviceCapabilities *)v36->_capabilities modelParentIdentifier];
    char v42 = HMFEqualObjects();

    if ((v42 & 1) == 0) {
      [(HMDDeviceCapabilities *)v36->_capabilities setModelParentIdentifier:v36->_modelIdentifier];
    }
    if ([v3 containsValueForKey:@"HM.rpIdentity"])
    {
      uint64_t v43 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.rpIdentity"];
      rpIdentity = v36->_rpIdentity;
      v36->_rpIdentity = (HMDRPIdentity *)v43;
    }
    v36->_locallyTracked = [v3 decodeBoolForKey:@"HM.locallyTracked"];
    v36->_cloudTracked = [v3 decodeBoolForKey:@"HM.cloudTracked"];
    uint64_t v45 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.sharedUserIDSIdentifier"];
    sharedUserIDSIdentifier = v36->_sharedUserIDSIdentifier;
    v36->_sharedUserIDSIdentifier = (NSUUID *)v45;

    id v15 = v48;
  }

  return v36;
}

- (BOOL)mergeObject:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6) {
    goto LABEL_46;
  }
  id v7 = [(HMDDevice *)self idsIdentifier];
  if (v7)
  {

LABEL_7:
    int v8 = 0;
    goto LABEL_8;
  }
  uint64_t v33 = [v6 idsIdentifierHash];
  if (!v33) {
    goto LABEL_7;
  }
  v34 = (void *)v33;
  uint64_t v35 = [(HMDDevice *)self idsIdentifierHash];
  v36 = [v6 idsIdentifierHash];
  char v37 = [v35 isEqual:v36];

  if (v37) {
    goto LABEL_7;
  }
  v38 = (void *)MEMORY[0x1D9452090]();
  uint64_t v39 = self;
  v40 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    __int16 v41 = HMFGetLogIdentifier();
    char v42 = [v6 idsIdentifierHash];
    int v89 = 138543618;
    v90 = v41;
    __int16 v91 = 2112;
    v92 = v42;
    _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Updating device account identifier to %@", (uint8_t *)&v89, 0x16u);
  }
  uint64_t v43 = [v6 idsIdentifierHash];
  [(HMDDevice *)v39 setIDSIdentifierHash:v43];

  int v8 = 1;
LABEL_8:
  id v9 = [(HMDDevice *)self name];
  uint64_t v10 = [v6 name];
  char v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    BOOL v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [v6 name];
      int v89 = 138543618;
      v90 = v15;
      __int16 v91 = 2112;
      v92 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Updating device name to %@", (uint8_t *)&v89, 0x16u);
    }
    int v17 = [v6 name];
    [(HMDDevice *)v13 setName:v17];

    int v8 = 1;
  }
  uint64_t v18 = [v6 productInfo];
  if (v18)
  {
    __int16 v19 = (void *)v18;
    id v20 = [(HMDDevice *)self productInfo];
    __int16 v21 = [v6 productInfo];
    char v22 = [v20 isEqual:v21];

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v26 = HMFGetLogIdentifier();
        id v27 = [v6 productInfo];
        int v89 = 138543618;
        v90 = v26;
        __int16 v91 = 2112;
        v92 = v27;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Updating device product info to %@", (uint8_t *)&v89, 0x16u);
      }
      BOOL v28 = [v6 productInfo];
      [(HMDDevice *)v24 setProductInfo:v28];

      int v8 = 1;
    }
  }
  v29 = [v6 version];

  if (v29)
  {
    if ([(HMDDevice *)self isCurrentDevice])
    {
      long long v30 = [(HMDDevice *)self version];
      long long v31 = [v6 version];
      char v32 = [v30 isEqual:v31];

      if (v32) {
        goto LABEL_30;
      }
    }
    else
    {
      id v44 = [v6 version];
      uint64_t v45 = [(HMDDevice *)self version];
      int v46 = [v44 isGreaterThanVersion:v45];

      if (!v46) {
        goto LABEL_30;
      }
    }
    v47 = (void *)MEMORY[0x1D9452090]();
    v48 = self;
    v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      v50 = HMFGetLogIdentifier();
      v51 = [v6 version];
      int v89 = 138543618;
      v90 = v50;
      __int16 v91 = 2112;
      v92 = v51;
      _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_DEBUG, "%{public}@Updating device version to %@", (uint8_t *)&v89, 0x16u);
    }
    v52 = [v6 version];
    [(HMDDevice *)v48 setVersion:v52];

    int v8 = 1;
  }
LABEL_30:
  uint64_t v53 = [v6 capabilities];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(HMDDevice *)self capabilities];
    v56 = [v6 capabilities];
    char v57 = [v55 isEqual:v56];

    if ((v57 & 1) == 0)
    {
      __int16 v58 = (void *)MEMORY[0x1D9452090]();
      v59 = self;
      __int16 v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        v61 = HMFGetLogIdentifier();
        uint64_t v62 = [v6 capabilities];
        int v89 = 138543618;
        v90 = v61;
        __int16 v91 = 2112;
        v92 = v62;
        _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_DEBUG, "%{public}@Updating device capabilities to: %@", (uint8_t *)&v89, 0x16u);
      }
      v63 = [v6 capabilities];
      [(HMDDevice *)v59 setCapabilities:v63];

      int v8 = 1;
    }
  }
  uint64_t v64 = [v6 rpIdentity];
  if (v64)
  {
    v65 = (void *)v64;
    v66 = [v6 rpIdentity];
    v67 = [(HMDDevice *)self rpIdentity];
    char v68 = [v66 isEqual:v67];

    if ((v68 & 1) == 0)
    {
      v69 = [v6 rpIdentity];
      [(HMDDevice *)self setRpIdentity:v69];

      int v8 = 1;
    }
  }
  v70 = (void *)MEMORY[0x1E4F1CA80];
  v71 = [(HMDDevice *)self handles];
  v72 = [v70 setWithArray:v71];

  v73 = (void *)MEMORY[0x1E4F1CAD0];
  v74 = [v6 handles];
  v75 = [v73 setWithArray:v74];
  int v76 = [v72 mergeObject:v75];

  if (v76)
  {
    v77 = (void *)MEMORY[0x1D9452090]();
    v78 = self;
    v79 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      v80 = HMFGetLogIdentifier();
      int v89 = 138543618;
      v90 = v80;
      __int16 v91 = 2112;
      v92 = v72;
      _os_log_impl(&dword_1D49D5000, v79, OS_LOG_TYPE_DEBUG, "%{public}@Updating handles: %@", (uint8_t *)&v89, 0x16u);
    }
    v81 = [v72 allObjects];
    [(HMDDevice *)v78 setHandles:v81];

    goto LABEL_43;
  }

  if (!v8)
  {
LABEL_46:
    BOOL v87 = 0;
    goto LABEL_47;
  }
LABEL_43:
  v82 = (void *)MEMORY[0x1D9452090]();
  v83 = self;
  v84 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
  {
    v85 = HMFGetLogIdentifier();
    int v89 = 138543362;
    v90 = v85;
    _os_log_impl(&dword_1D49D5000, v84, OS_LOG_TYPE_INFO, "%{public}@Merge resulted in changes, posting update notification", (uint8_t *)&v89, 0xCu);
  }
  v86 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v86 postNotificationName:@"HMDDeviceUpdatedNotification" object:v83];

  BOOL v87 = 1;
LABEL_47:

  return v87;
}

- (id)logIdentifier
{
  uint64_t v2 = [(HMDDevice *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)setRpIdentity:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (HMDRPIdentity *)a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    char v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Setting RPIdentity %@", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  rpIdentity = v6->_rpIdentity;
  v6->_rpIdentity = v4;

  os_unfair_lock_unlock(&v6->_lock.lock);
}

- (HMDRPIdentity)rpIdentity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_rpIdentity;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (id)remoteDestinationString
{
  id v3 = [(HMDDevice *)self globalHandles];
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [v4 destination];
  }
  else
  {
    id v6 = [(HMDDevice *)self localHandles];
    id v7 = [v6 firstObject];

    id v5 = [v7 destination];
  }
  return v5;
}

- (void)setIDSIdentifierHash:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSUUID *)[v6 copy];
  idsIdentifierHash = self->_idsIdentifierHash;
  self->_idsIdentifierHash = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (NSUUID)idsIdentifierHash
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_idsIdentifierHash;
  os_unfair_lock_unlock(&p_lock->lock);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(HMDDevice *)self idsIdentifier];
    if (v6)
    {
      id v7 = [(HMDDevice *)self idsIdentifier];
      int v8 = [v7 UUIDString];
      if ([v8 length])
      {
        if (__idsIdentifierHashFromIDSIdentifier_onceToken != -1) {
          dispatch_once(&__idsIdentifierHashFromIDSIdentifier_onceToken, &__block_literal_global_414);
        }
        id v9 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v10 = __idsIdentifierHashFromIDSIdentifier_namespace;
        char v11 = [v8 dataUsingEncoding:4];
        id v5 = (NSUUID *)[v9 initWithNamespace:v10 data:v11];
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (void)setDirty:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_dirty = a3;
  os_unfair_lock_unlock(&p_lock->lock);
}

- (BOOL)isDirty
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_dirty;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (void)setCapabilities:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (HMDDeviceCapabilities *)[v7 copy];
  capabilities = self->_capabilities;
  self->_capabilities = v4;

  if (self->_modelIdentifier)
  {
    id v6 = [(HMDDeviceCapabilities *)self->_capabilities modelParentIdentifier];

    if (!v6) {
      [(HMDDeviceCapabilities *)self->_capabilities setModelParentIdentifier:self->_modelIdentifier];
    }
  }
  os_unfair_lock_unlock(&self->_lock.lock);
}

- (HMDDeviceCapabilities)capabilities
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_capabilities;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (HMDHomeKitVersion)derivedVersion
{
  uint64_t v3 = [(HMDDevice *)self localOnlyVersionFromIDS];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = (void *)v3;
  id v5 = [(HMDDevice *)self localOnlyVersionFromIDS];
  id v6 = [(HMDDevice *)self version];
  int v7 = [v5 isGreaterThanVersion:v6];

  if (v7)
  {
    int v8 = [(HMDDevice *)self localOnlyVersionFromIDS];
  }
  else
  {
LABEL_4:
    int v8 = [(HMDDevice *)self version];
  }
  return (HMDHomeKitVersion *)v8;
}

- (BOOL)supportsHH2
{
  uint64_t v2 = [(HMDDevice *)self derivedVersion];
  uint64_t v3 = HMDMinimumHomeKitVersionSupportingHH2();
  char v4 = [v2 isAtLeastVersion:v3];

  return v4;
}

- (void)setLocalOnlyVersionFromIDS:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_localOnlyVersionFromIDS && !objc_msgSend(v8, "isGreaterThanVersion:"))
  {
    os_unfair_lock_unlock(&self->_lock.lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_localOnlyVersionFromIDS, a3);
    os_unfair_lock_unlock(&self->_lock.lock);
    [(HMDDevice *)self setDirty:1];
    id v5 = [(HMDDevice *)self account];
    id v6 = [v5 manager];

    int v7 = [v6 backingStore];
    __HMDDeviceMarkDirty(self, v7);
  }
}

- (HMDHomeKitVersion)localOnlyVersionFromIDS
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  char v4 = self->_localOnlyVersionFromIDS;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)updateWithDevice:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  char v4 = (HMDDevice *)a3;
  id v5 = v4;
  if (v4 && self != v4)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    int v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v47 = v9;
      __int16 v48 = 2112;
      v49 = v7;
      __int16 v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating with device -- local: %@, remote: %@", buf, 0x20u);
    }
    uint64_t v10 = [(HMDDevice *)v7 account];
    char v11 = [v10 manager];

    uint64_t v45 = v11;
    __int16 v12 = [v11 backingStore];
    id v13 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v43 = v12;
    uint64_t v14 = [v12 transaction:@"Update Device" options:v13];

    id v15 = [(HMDDevice *)v7 modelObjectWithChangeType:2 version:4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    uint64_t v18 = [(HMDDevice *)v5 modelObjectWithChangeType:2 version:4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v19 = v18;
    }
    else {
      __int16 v19 = 0;
    }
    id v20 = v19;

    if ([v17 diff:v20 differingFields:0])
    {
      id v21 = (id)[v17 merge:v20];
      uint64_t v22 = [v17 uuid];
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        id v24 = [v17 parentUUID];

        if (v24) {
          [v14 add:v17];
        }
      }
    }
    id v44 = v14;
    uint64_t v25 = [(HMDDevice *)v7 capabilities];
    id v26 = [v25 modelObjectWithChangeType:2 version:4];

    id v27 = [(HMDDevice *)v5 capabilities];
    BOOL v28 = [v27 modelObjectWithChangeType:2 version:4];

    v29 = v26;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v30 = v29;
    }
    else {
      long long v30 = 0;
    }
    long long v31 = v30;

    id v32 = v28;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v33 = v32;
    }
    else {
      uint64_t v33 = 0;
    }
    id v34 = v33;

    uint64_t v35 = v29;
    if (!v31)
    {
      v36 = [(HMDDevice *)v7 modelIdentifier];
      if (v36) {
        +[HMDDeviceCapabilities deviceCapabilitiesModelIdentifierWithParentIdentifier:v36];
      }
      else {
      char v37 = [MEMORY[0x1E4F29128] UUID];
      }
      uint64_t v35 = [(HMDBackingStoreModelObject *)[HMDDeviceCapabilitiesModel alloc] initWithObjectChangeType:1 uuid:v37 parentUUID:v36];
    }
    if ([(HMDBackingStoreModelObject *)v35 diff:v34 differingFields:0])
    {
      id v38 = [(HMDBackingStoreModelObject *)v35 merge:v34];
      uint64_t v39 = [(HMDBackingStoreModelObject *)v35 uuid];
      if (v39)
      {
        v40 = (void *)v39;
        __int16 v41 = [(HMDBackingStoreModelObject *)v35 parentUUID];

        if (v41) {
          [v44 add:v35];
        }
      }
    }
    if ([v45 shouldSyncDevice:v7])
    {
      [v44 run];
    }
    else
    {
      __transactionDeviceUpdated(v7, v17, 0);
      char v42 = [[HMDDeviceCapabilities alloc] initWithObjectModel:v35];
      [(HMDDevice *)v7 setCapabilities:v42];
    }
  }
}

- (void)updateVersion:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [(HMDDevice *)self setVersion:a3];
  [(HMDDevice *)self setDirty:1];
  char v4 = [(HMDDevice *)self account];
  id v5 = [v4 manager];

  id v6 = [v5 backingStore];
  __HMDDeviceMarkDirty(self, v6);

  if ([v5 shouldSyncDevice:self])
  {
    int v7 = [v5 backingStore];
    v9[0] = self;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v7 updateModelObjects:v8 destination:2];
  }
}

- (void)setVersion:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  char v4 = (HMDHomeKitVersion *)[v6 copy];
  version = self->_version;
  self->_version = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (HMDHomeKitVersion)version
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  char v4 = self->_version;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setProductInfo:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  char v4 = (HMFProductInfo *)[v6 copy];
  productInfo = self->_productInfo;
  self->_productInfo = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (HMFProductInfo)productInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  char v4 = self->_productInfo;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setAccount:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 primaryHandle];
  id v6 = [v4 handles];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_account, v4);
  if (v4)
  {
    if (!self->_modelIdentifier)
    {
      id v8 = [v4 modelIdentifier];
      id v9 = self;
      p_isa = (id *)&v9->super.super.isa;
      id v31 = v8;
      if (v31)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F29128];
        char v11 = [(HMDDevice *)v9 identifier];
        __int16 v12 = [v11 UUIDString];
        *(void *)buf = v12;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
        objc_msgSend(v10, "hm_deriveUUIDFromBaseUUID:withSalts:", v31, v13);
        uint64_t v14 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = v9;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v18;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing parent identifier while updating model identifier.", buf, 0xCu);
        }
        uint64_t v14 = 0;
      }

      modelIdentifier = self->_modelIdentifier;
      self->_modelIdentifier = v14;

      id v20 = [p_isa[10] modelParentIdentifier];
      BOOL v21 = v20 == 0;

      if (v21) {
        [p_isa[10] setModelParentIdentifier:self->_modelIdentifier];
      }
    }
    id v22 = v4;
    uint64_t v23 = self;
    __deregisterForAccountHandleUpdates(v23);
    id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v23 selector:sel___handleAccountHandleUpdated_ name:@"HMDAccountHandlesUpdatedNotification" object:v22];

    uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
    id v26 = [(NSSet *)v23->_handles allObjects];
    id v27 = __deviceHandlesForAccount(v26, v6, v5);
    uint64_t v28 = [v25 setWithArray:v27];
    handles = v23->_handles;
    v23->_handles = (NSSet *)v28;
  }
  else
  {
    __deregisterForAccountHandleUpdates(self);
  }
  os_unfair_lock_unlock(&p_lock->lock);
}

- (HMDAccount)account
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
  os_unfair_lock_unlock(&p_lock->lock);
  return (HMDAccount *)WeakRetained;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (BOOL)isCurrentDevice
{
  uint64_t v2 = [(HMDDevice *)self idsIdentifier];
  uint64_t v3 = +[HMDDeviceAddress localDeviceIDSIdentifier];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (NSUUID)idsIdentifier
{
  uint64_t v2 = [(HMDDevice *)self localHandles];
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    char v4 = [v3 internal];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    int v7 = [v6 deviceIdentifier];
  }
  else
  {
    int v7 = 0;
  }

  return (NSUUID *)v7;
}

- (void)__handleAccountHandleUpdated:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(HMDDevice *)self account];

    if (v7 == v8)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      uint64_t v10 = self;
      char v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Processing updated account handle", (uint8_t *)&v19, 0xCu);
      }
      id v13 = [v7 handles];
      if ((objc_msgSend(v13, "hmf_isEmpty") & 1) == 0)
      {
        uint64_t v14 = [v7 primaryHandle];
        if (v14)
        {
          os_unfair_lock_lock_with_options();
          id v15 = [(NSSet *)v10->_handles allObjects];
          id v16 = __deviceHandlesForAccount(v15, v13, v14);

          uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
          handles = v10->_handles;
          v10->_handles = (NSSet *)v17;

          os_unfair_lock_unlock(&v10->_lock.lock);
        }
      }
    }
  }
}

- (void)setHandles:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = [(HMDDevice *)self account];
    id v6 = (void *)[v12 copy];
    if (v5)
    {
      id v7 = [v5 handles];
      id v8 = [v5 primaryHandle];
      uint64_t v9 = __deviceHandlesForAccount(v6, v7, v8);

      id v6 = (void *)v9;
    }
    os_unfair_lock_lock_with_options();
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    handles = self->_handles;
    self->_handles = v10;

    os_unfair_lock_unlock(&self->_lock.lock);
    id v4 = v12;
  }
}

- (NSData)pushToken
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(HMDDevice *)self globalHandles];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) pushToken];
        if (v7)
        {
          id v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return (NSData *)v8;
}

- (id)globalDestination
{
  uint64_t v2 = [(HMDDevice *)self globalHandles];
  if ([v2 count])
  {
    uint64_t v3 = [v2 firstObject];
    uint64_t v4 = [v3 destination];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)globalHandles
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(HMDDevice *)self handles];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isGlobal", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)localHandles
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(HMDDevice *)self handles];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLocal", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)handles
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSSet *)self->_handles allObjects];
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (HMDDeviceAddress)deviceAddress
{
  uint64_t v3 = [(HMDDevice *)self idsIdentifier];
  id v4 = [(HMDDevice *)self globalHandles];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 destination];
  uint64_t v7 = +[HMDDeviceAddress addressWithIDSIdentifier:v3 idsDestination:v6];

  return (HMDDeviceAddress *)v7;
}

- (BOOL)isSameAccountWithDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (HMDDevice *)a3;
  uint64_t v5 = [(HMDDevice *)self account];
  uint64_t v6 = [(HMDDevice *)v4 account];
  uint64_t v7 = (void *)v6;
  if (v5 && v6)
  {
    char v8 = HMFEqualObjects();
  }
  else
  {
    if (v5) {
      uint64_t v9 = v4;
    }
    else {
      uint64_t v9 = self;
    }
    long long v10 = v9;
    long long v11 = (void *)MEMORY[0x1D9452090]();
    long long v12 = self;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      int v19 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Device is missing account %@", (uint8_t *)&v16, 0x16u);
    }

    char v8 = 0;
  }

  return v8;
}

- (BOOL)isRelatedToDevice:(id)a3
{
  id v4 = a3;
  if ([(HMDDevice *)self isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v7 = [v4 handles];
    char v8 = [v6 setWithArray:v7];

    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    long long v10 = [(HMDDevice *)self handles];
    long long v11 = [v9 setWithArray:v10];
    [v8 intersectSet:v11];

    BOOL v5 = [v8 count] != 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDDevice *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(HMDDevice *)v4 identifier];
      uint64_t v6 = [(HMDDevice *)self identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2 = [(HMDDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)attributeDescriptions
{
  v36[8] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v35 = [(HMDDevice *)self identifier];
  id v34 = [v35 UUIDString];
  uint64_t v33 = objc_msgSend(v3, "initWithName:value:", @"ID");
  v36[0] = v33;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v5 = [(HMDDevice *)self name];
  id v31 = [MEMORY[0x1E4F65538] defaultFormatter];
  id v32 = (void *)v5;
  long long v30 = objc_msgSend(v4, "initWithName:value:options:formatter:", @"Nm", v5, 0);
  v36[1] = v30;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v29 = [(HMDDevice *)self version];
  if (v29)
  {
    char v7 = [(HMDDevice *)self version];
  }
  else
  {
    char v7 = @"Unknown";
  }
  uint64_t v28 = objc_msgSend(v6, "initWithName:value:", @"Ver", v7, v7);
  v36[2] = v28;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v27 = [(HMDDevice *)self capabilities];
  id v26 = [v27 shortDescription];
  uint64_t v9 = objc_msgSend(v8, "initWithName:value:", @"Cap");
  v36[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  long long v11 = [(HMDDevice *)self sharedUserIDSIdentifier];
  long long v12 = (void *)[v10 initWithName:@"SHID" value:v11];
  v36[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  long long v14 = [(HMDDevice *)self localOnlyVersionFromIDS];
  if (v14)
  {
    uint64_t v15 = [(HMDDevice *)self localOnlyVersionFromIDS];
  }
  else
  {
    uint64_t v15 = @"Unknown";
  }
  int v16 = (void *)[v13 initWithName:@"IdsVer" value:v15];
  v36[5] = v16;
  id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
  __int16 v18 = [(HMDDevice *)self idsIdentifier];
  int v19 = (void *)[v17 initWithName:@"IDS" value:v18];
  v36[6] = v19;
  id v20 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v21 = [(HMDDevice *)self handles];
  id v22 = (void *)[v20 initWithName:@"Hndl" value:v21];
  v36[7] = v22;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:8];

  if (v14) {
  if (v29)
  }

  return (NSArray *)v25;
}

- (NSString)shortDescription
{
  int v3 = isInternalBuild();
  id v4 = NSString;
  uint64_t v5 = [(HMDDevice *)self identifier];
  id v6 = (void *)v5;
  if (v3)
  {
    char v7 = [(HMDDevice *)self name];
    id v8 = [v4 stringWithFormat:@"%@/%@", v6, v7];
  }
  else
  {
    id v8 = [v4 stringWithFormat:@"%@", v5];
  }

  return (NSString *)v8;
}

- (HMDDevice)initWithObjectModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 uuid];
  }
  id v8 = v7;

  uint64_t v9 = [v4 deviceHandles];
  id v10 = [v4 name];
  long long v11 = [v4 productInfo];
  long long v12 = [v4 version];
  id v13 = [(HMDDevice *)self initWithIdentifier:v8 handles:v9 name:v10 productInfo:v11 version:v12 capabilities:0];

  if (v13)
  {
    uint64_t v14 = [v4 uuid];
    modelIdentifier = v13->_modelIdentifier;
    v13->_modelIdentifier = (NSUUID *)v14;

    int v16 = [v4 rpIdentity];
    uint64_t v17 = [v16 copy];
    rpIdentity = v13->_rpIdentity;
    v13->_rpIdentity = (HMDRPIdentity *)v17;
  }
  return v13;
}

- (HMDDevice)initWithDeviceAddress:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 idsDestination];
  id v6 = +[HMDDeviceHandle deviceHandleForDestination:v5];

  id v7 = [v4 idsIdentifier];
  id v8 = +[HMDDeviceHandle deviceHandleForDeviceIdentifier:v7];

  if (([v6 isGlobal] & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_5:
    _HMFPreconditionFailure();
  }
  if (([v8 isLocal] & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v9 = [v6 identifier];
  v13[0] = v6;
  v13[1] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  long long v11 = [(HMDDevice *)self initWithIdentifier:v9 handles:v10 name:0 productInfo:0 version:0 capabilities:0];

  return v11;
}

- (HMDDevice)initWithIdentifier:(id)a3 handles:(id)a4 name:(id)a5 productInfo:(id)a6 version:(id)a7 capabilities:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v33.receiver = self;
  v33.super_class = (Class)HMDDevice;
  id v20 = [(HMDDevice *)&v33 init];
  uint64_t v21 = v20;
  if (v20)
  {
    v20->_lock.lock._os_unfair_lock_opaque = 0;
    uint64_t v22 = [v14 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSUUID *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
    handles = v21->_handles;
    v21->_handles = (NSSet *)v24;

    uint64_t v26 = [v16 copy];
    name = v21->_name;
    v21->_name = (NSString *)v26;

    uint64_t v28 = [v17 copy];
    productInfo = v21->_productInfo;
    v21->_productInfo = (HMFProductInfo *)v28;

    objc_storeStrong((id *)&v21->_version, a7);
    uint64_t v30 = [v19 copy];
    capabilities = v21->_capabilities;
    v21->_capabilities = (HMDDeviceCapabilities *)v30;

    objc_storeStrong((id *)&v21->_localOnlyVersionFromIDS, a7);
  }

  return v21;
}

- (HMDDevice)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33_116274 != -1) {
    dispatch_once(&logCategory__hmf_once_t33_116274, &__block_literal_global_116275);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v34_116276;
  return v2;
}

uint64_t __24__HMDDevice_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v34_116276;
  logCategory__hmf_once_v34_116276 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDDevice)deviceWithHandle:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 identifier];
  v10[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  id v8 = (void *)[v5 initWithIdentifier:v6 handles:v7 name:0 productInfo:0 version:0 capabilities:0];
  return (HMDDevice *)v8;
}

+ (HMDDevice)deviceWithDestination:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[HMDDeviceHandle deviceHandleForDestination:v4];
  if (v5)
  {
    id v6 = [a1 deviceWithHandle:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = a1;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid destination: %@", (uint8_t *)&v12, 0x16u);
    }
    id v6 = 0;
  }

  return (HMDDevice *)v6;
}

@end