@interface HMDUnpairedHAPAccessoryPairingInformation
- (BOOL)allowAddUnauthenticatedAccessory;
- (BOOL)legacyWAC;
- (BOOL)matchesAccessoryServer:(id)a3;
- (BOOL)matchesUnpairedAccessory:(id)a3;
- (BOOL)provideNetworkCredentialsToAccessory;
- (BOOL)setupCodeProvided;
- (BOOL)wacAccessory;
- (HAPAccessoryPairingRequest)pairingRequest;
- (HMDUnpairedHAPAccessoryPairingInformation)initWithAccessoryDescription:(id)a3 linkType:(int64_t)a4 completionHandler:(id)a5 progressHandler:(id)a6 pairingRequest:(id)a7;
- (HMDUnpairedHAPAccessoryPairingInformation)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 linkType:(int64_t)a5 setupCode:(id)a6 completionHandler:(id)a7 setupCodeProvider:(id)a8 pairingRequest:(id)a9;
- (HMFActivity)pairingActivity;
- (HMFTimer)pairingInterruptionTimer;
- (HMFTimer)pairingRetryTimer;
- (HMFTimer)reconfirmTimer;
- (NSData)setupAuthToken;
- (NSString)accessoryName;
- (NSString)accessoryServerIdentifier;
- (NSString)setupCode;
- (NSString)setupID;
- (NSUUID)accessoryUUID;
- (NSUUID)homeUUID;
- (NSUUID)setupAuthTokenUUID;
- (id)addAccessoryCompletionHandler;
- (id)addAccessoryProgressHandler;
- (id)description;
- (id)setupCodeProviderCompletionHandler;
- (int64_t)linkType;
- (void)setAccessoryName:(id)a3;
- (void)setAccessoryServerIdentifier:(id)a3;
- (void)setAccessoryUUID:(id)a3;
- (void)setAddAccessoryCompletionHandler:(id)a3;
- (void)setAddAccessoryProgressHandler:(id)a3;
- (void)setAllowAddUnauthenticatedAccessory:(BOOL)a3;
- (void)setHomeUUID:(id)a3;
- (void)setLegacyWAC:(BOOL)a3;
- (void)setLinkType:(int64_t)a3;
- (void)setPairingActivity:(id)a3;
- (void)setPairingInterruptionTimer:(id)a3;
- (void)setPairingRetryTimer:(id)a3;
- (void)setProvideNetworkCredentialsToAccessory:(BOOL)a3;
- (void)setReconfirmTimer:(id)a3;
- (void)setSetupAuthToken:(id)a3;
- (void)setSetupAuthTokenUUID:(id)a3;
- (void)setSetupCode:(id)a3;
- (void)setSetupCodeProvided:(BOOL)a3;
- (void)setSetupCodeProviderCompletionHandler:(id)a3;
- (void)setSetupID:(id)a3;
- (void)setWacAccessory:(BOOL)a3;
@end

@implementation HMDUnpairedHAPAccessoryPairingInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAuthToken, 0);
  objc_storeStrong((id *)&self->_setupAuthTokenUUID, 0);
  objc_storeStrong((id *)&self->_setupID, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
  objc_storeStrong((id *)&self->_accessoryServerIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_pairingRequest, 0);
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_reconfirmTimer, 0);
  objc_storeStrong((id *)&self->_pairingRetryTimer, 0);
  objc_storeStrong(&self->_setupCodeProviderCompletionHandler, 0);
  objc_storeStrong(&self->_addAccessoryProgressHandler, 0);
  objc_storeStrong(&self->_addAccessoryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pairingInterruptionTimer, 0);
}

- (void)setLegacyWAC:(BOOL)a3
{
  self->_legacyWAC = a3;
}

- (BOOL)legacyWAC
{
  return self->_legacyWAC;
}

- (void)setWacAccessory:(BOOL)a3
{
  self->_wacAccessory = a3;
}

- (BOOL)wacAccessory
{
  return self->_wacAccessory;
}

- (void)setSetupAuthToken:(id)a3
{
}

- (NSData)setupAuthToken
{
  return self->_setupAuthToken;
}

- (void)setSetupAuthTokenUUID:(id)a3
{
}

- (NSUUID)setupAuthTokenUUID
{
  return self->_setupAuthTokenUUID;
}

- (void)setSetupID:(id)a3
{
}

- (NSString)setupID
{
  return self->_setupID;
}

- (void)setSetupCode:(id)a3
{
}

- (NSString)setupCode
{
  return self->_setupCode;
}

- (void)setAccessoryServerIdentifier:(id)a3
{
}

- (NSString)accessoryServerIdentifier
{
  return self->_accessoryServerIdentifier;
}

- (void)setHomeUUID:(id)a3
{
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (HAPAccessoryPairingRequest)pairingRequest
{
  return self->_pairingRequest;
}

- (void)setPairingActivity:(id)a3
{
}

- (HMFActivity)pairingActivity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingActivity);
  return (HMFActivity *)WeakRetained;
}

- (void)setSetupCodeProvided:(BOOL)a3
{
  self->_setupCodeProvided = a3;
}

- (BOOL)setupCodeProvided
{
  return self->_setupCodeProvided;
}

- (void)setProvideNetworkCredentialsToAccessory:(BOOL)a3
{
  self->_provideNetworkCredentialsToAccessory = a3;
}

- (BOOL)provideNetworkCredentialsToAccessory
{
  return self->_provideNetworkCredentialsToAccessory;
}

- (void)setAllowAddUnauthenticatedAccessory:(BOOL)a3
{
  self->_allowAddUnauthenticatedAccessory = a3;
}

- (BOOL)allowAddUnauthenticatedAccessory
{
  return self->_allowAddUnauthenticatedAccessory;
}

- (void)setReconfirmTimer:(id)a3
{
}

- (HMFTimer)reconfirmTimer
{
  return self->_reconfirmTimer;
}

- (void)setPairingRetryTimer:(id)a3
{
}

- (HMFTimer)pairingRetryTimer
{
  return self->_pairingRetryTimer;
}

- (void)setSetupCodeProviderCompletionHandler:(id)a3
{
}

- (id)setupCodeProviderCompletionHandler
{
  return self->_setupCodeProviderCompletionHandler;
}

- (void)setAddAccessoryProgressHandler:(id)a3
{
}

- (id)addAccessoryProgressHandler
{
  return self->_addAccessoryProgressHandler;
}

- (void)setAddAccessoryCompletionHandler:(id)a3
{
}

- (id)addAccessoryCompletionHandler
{
  return self->_addAccessoryCompletionHandler;
}

- (void)setPairingInterruptionTimer:(id)a3
{
}

- (HMFTimer)pairingInterruptionTimer
{
  return self->_pairingInterruptionTimer;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (BOOL)matchesAccessoryServer:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUnpairedHAPAccessoryPairingInformation *)self setupID];
  v6 = [(HMDUnpairedHAPAccessoryPairingInformation *)self accessoryServerIdentifier];
  char v7 = [v4 matchesSetupID:v5 serverIdentifier:v6];

  return v7;
}

- (BOOL)matchesUnpairedAccessory:(id)a3
{
  id v4 = a3;
  v5 = [v4 preferredAccessoryServer];
  if ([(HMDUnpairedHAPAccessoryPairingInformation *)self matchesAccessoryServer:v5])
  {
    char v6 = 1;
  }
  else
  {
    char v7 = [v4 uuid];
    v8 = [(HMDUnpairedHAPAccessoryPairingInformation *)self accessoryUUID];
    char v6 = [v7 isEqual:v8];
  }
  return v6;
}

- (id)description
{
  int v3 = isInternalBuild();
  id v4 = NSString;
  v5 = [(HMDUnpairedHAPAccessoryPairingInformation *)self accessoryName];
  char v6 = [(HMDUnpairedHAPAccessoryPairingInformation *)self accessoryUUID];
  uint64_t v7 = [v6 UUIDString];
  v8 = (void *)v7;
  if (v3)
  {
    v9 = [(HMDUnpairedHAPAccessoryPairingInformation *)self setupID];
    v10 = [(HMDUnpairedHAPAccessoryPairingInformation *)self setupCode];
    [(HMDUnpairedHAPAccessoryPairingInformation *)self wacAccessory];
    v11 = HMFBooleanToString();
    [(HMDUnpairedHAPAccessoryPairingInformation *)self legacyWAC];
    v12 = HMFBooleanToString();
    v13 = [(HMDUnpairedHAPAccessoryPairingInformation *)self homeUUID];
    v14 = [v4 stringWithFormat:@"accessoryName: %@, accessoryUUID: %@, setupID: %@, setupCode: %@, WAC: %@, legacyWAC: %@ homeUUID: %@", v5, v8, v9, v10, v11, v12, v13];
  }
  else
  {
    v14 = [v4 stringWithFormat:@"accessoryName: %@, accessoryUUID: %@", v5, v7];
  }

  return v14;
}

- (HMDUnpairedHAPAccessoryPairingInformation)initWithAccessoryDescription:(id)a3 linkType:(int64_t)a4 completionHandler:(id)a5 progressHandler:(id)a6 pairingRequest:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  v14 = (HAPAccessoryPairingRequest *)a7;
  v40.receiver = self;
  v40.super_class = (Class)HMDUnpairedHAPAccessoryPairingInformation;
  id v15 = a6;
  v16 = [(HMDUnpairedHAPAccessoryPairingInformation *)&v40 init];
  v16->_linkType = a4;
  if (!a4)
  {
    if (objc_msgSend(v12, "supportsBTLE", v40.receiver, v40.super_class))
    {
      uint64_t v17 = 2;
LABEL_6:
      v16->_linkType = v17;
      goto LABEL_7;
    }
    if ([v12 supportsIP])
    {
      uint64_t v17 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:
  v18 = _Block_copy(v13);
  id addAccessoryCompletionHandler = v16->_addAccessoryCompletionHandler;
  v16->_id addAccessoryCompletionHandler = v18;

  v20 = _Block_copy(v15);
  id addAccessoryProgressHandler = v16->_addAccessoryProgressHandler;
  v16->_id addAccessoryProgressHandler = v20;

  uint64_t v22 = [v12 accessoryUUID];
  accessoryUUID = v16->_accessoryUUID;
  v16->_accessoryUUID = (NSUUID *)v22;

  uint64_t v24 = [v12 accessoryName];
  accessoryName = v16->_accessoryName;
  v16->_accessoryName = (NSString *)v24;

  uint64_t v26 = [v12 accessoryServerIdentifier];
  accessoryServerIdentifier = v16->_accessoryServerIdentifier;
  v16->_accessoryServerIdentifier = (NSString *)v26;

  uint64_t v28 = [v12 setupID];
  setupID = v16->_setupID;
  v16->_setupID = (NSString *)v28;

  uint64_t v30 = [v12 setupCode];
  setupCode = v16->_setupCode;
  v16->_setupCode = (NSString *)v30;

  uint64_t v32 = [v12 homeUUID];
  homeUUID = v16->_homeUUID;
  v16->_homeUUID = (NSUUID *)v32;

  uint64_t v34 = [v12 setupAuthTokenUUID];
  setupAuthTokenUUID = v16->_setupAuthTokenUUID;
  v16->_setupAuthTokenUUID = (NSUUID *)v34;

  uint64_t v36 = [v12 setupAuthToken];
  setupAuthToken = v16->_setupAuthToken;
  v16->_setupAuthToken = (NSData *)v36;

  v16->_wacAccessory = [v12 supportsWAC];
  pairingRequest = v16->_pairingRequest;
  v16->_pairingRequest = v14;

  return v16;
}

- (HMDUnpairedHAPAccessoryPairingInformation)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 linkType:(int64_t)a5 setupCode:(id)a6 completionHandler:(id)a7 setupCodeProvider:(id)a8 pairingRequest:(id)a9
{
  id v15 = (NSString *)a4;
  v16 = (HAPAccessoryPairingRequest *)a9;
  v34.receiver = self;
  v34.super_class = (Class)HMDUnpairedHAPAccessoryPairingInformation;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a3;
  v21 = [(HMDUnpairedHAPAccessoryPairingInformation *)&v34 init];
  v21->_linkType = a5;
  uint64_t v22 = _Block_copy(v18);

  id addAccessoryCompletionHandler = v21->_addAccessoryCompletionHandler;
  v21->_id addAccessoryCompletionHandler = v22;

  uint64_t v24 = _Block_copy(v17);
  id setupCodeProviderCompletionHandler = v21->_setupCodeProviderCompletionHandler;
  v21->_id setupCodeProviderCompletionHandler = v24;

  uint64_t v26 = objc_msgSend(v20, "copy", v34.receiver, v34.super_class);
  accessoryUUID = v21->_accessoryUUID;
  v21->_accessoryUUID = (NSUUID *)v26;

  accessoryName = v21->_accessoryName;
  v21->_accessoryName = v15;
  v29 = v15;

  uint64_t v30 = [v19 copy];
  setupCode = v21->_setupCode;
  v21->_setupCode = (NSString *)v30;

  pairingRequest = v21->_pairingRequest;
  v21->_pairingRequest = v16;

  return v21;
}

@end