@interface HMSetupAccessoryDescription
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)addAndSetupAccessories;
- (BOOL)doNetworkScan;
- (BOOL)hasAddRequest;
- (BOOL)isEntitledForHomeKitSPI;
- (BOOL)isEntitledForThirdPartyMatterSetupPayload;
- (BOOL)isEntitledForThirdPartySetupAccessoryPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BOOL)isSetupInitiatedByOtherMatterEcosystem;
- (BOOL)retry;
- (BOOL)supportsBTLE;
- (BOOL)supportsIP;
- (BOOL)supportsWAC;
- (BOOL)userConsentedForReplace;
- (HMAccessory)accessoryBeingReplaced;
- (HMAccessoryCategory)category;
- (HMAccessoryOwnershipToken)ownershipToken;
- (HMSetupAccessoryDescription)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 appID:(id)a5 homeName:(id)a6 homeUUID:(id)a7 trustedOrigin:(BOOL)a8;
- (HMSetupAccessoryDescription)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 appID:(id)a5 homeUUID:(id)a6;
- (HMSetupAccessoryDescription)initWithAddRequestIdentifier:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5 setupAccessoryPayload:(id)a6 appID:(id)a7 ownershipToken:(id)a8;
- (HMSetupAccessoryDescription)initWithAppIdentifier:(id)a3 homeUUID:(id)a4;
- (HMSetupAccessoryDescription)initWithCoder:(id)a3;
- (HMSetupAccessoryDescription)initWithDictionaryRepresentation:(id)a3;
- (HMSetupAccessoryDescription)initWithSetupAccessoryPayload:(id)a3 appID:(id)a4 homeUUID:(id)a5 ownershipToken:(id)a6;
- (HMSetupAccessoryDescription)initWithStagedCHIPAccessoryPairingIdentifier:(id)a3;
- (HMSetupAccessoryPayload)setupAccessoryPayload;
- (NSArray)attributeDescriptions;
- (NSData)setupAuthToken;
- (NSDictionary)dictionaryRepresentation;
- (NSError)cancellationReason;
- (NSString)accessoryName;
- (NSString)accessoryServerIdentifier;
- (NSString)appIdentifier;
- (NSString)bundleID;
- (NSString)description;
- (NSString)manufacturerName;
- (NSString)marketingName;
- (NSString)setupCode;
- (NSString)setupID;
- (NSString)shortDescription;
- (NSString)storeID;
- (NSString)suggestedAccessoryName;
- (NSURL)appBundleURL;
- (NSURL)installationGuideURL;
- (NSUUID)accessoryUUID;
- (NSUUID)addRequestIdentifier;
- (NSUUID)homeUUID;
- (NSUUID)setupAuthTokenUUID;
- (NSUUID)suggestedRoomUUID;
- (NSUUID)suggestedRoomUniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initToSetupAccessoriesWithSetupAccessoryPayload:(id)a3 appID:(id)a4 homeName:(id)a5 homeUUID:(id)a6 trustedOrigin:(BOOL)a7 ownershipToken:(id)a8;
- (unint64_t)certificationStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryBeingReplaced:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setAccessoryServerIdentifier:(id)a3;
- (void)setAccessoryUUID:(id)a3;
- (void)setAddAndSetupAccessories:(BOOL)a3;
- (void)setAddRequestIdentifier:(id)a3;
- (void)setAppBundleURL:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCancellationReason:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCertificationStatus:(unint64_t)a3;
- (void)setDoNetworkScan:(BOOL)a3;
- (void)setEntitledForHomeKitSPI:(BOOL)a3;
- (void)setEntitledForThirdPartyMatterSetupPayload:(BOOL)a3;
- (void)setEntitledForThirdPartySetupAccessoryPayload:(BOOL)a3;
- (void)setInstallationGuideURL:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setMarketingName:(id)a3;
- (void)setOwnershipToken:(id)a3;
- (void)setRetry:(BOOL)a3;
- (void)setSetupAccessoryPayload:(id)a3;
- (void)setSetupAuthToken:(id)a3;
- (void)setSetupAuthTokenUUID:(id)a3;
- (void)setSetupCode:(id)a3;
- (void)setSetupInitiatedByOtherMatterEcosystem:(BOOL)a3;
- (void)setStoreID:(id)a3;
- (void)setSuggestedAccessoryName:(id)a3;
- (void)setSuggestedRoomUUID:(id)a3;
- (void)setUserConsentedForReplace:(BOOL)a3;
- (void)updateAccessoryCategory:(id)a3;
- (void)updateAccessoryName:(id)a3;
- (void)updateAppIdentifier:(id)a3;
- (void)updateWithAccessory:(id)a3;
- (void)updateWithAuthToken:(id)a3 uuid:(id)a4;
- (void)updateWithSetupAccessoryPayload:(id)a3;
@end

@implementation HMSetupAccessoryDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryServerIdentifier, 0);
  objc_storeStrong((id *)&self->_addRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
  objc_storeStrong((id *)&self->_suggestedRoomUUID, 0);
  objc_storeStrong((id *)&self->_cancellationReason, 0);
  objc_destroyWeak((id *)&self->_accessoryBeingReplaced);
  objc_storeStrong((id *)&self->_setupAuthTokenUUID, 0);
  objc_storeStrong((id *)&self->_setupAuthToken, 0);
  objc_storeStrong((id *)&self->_setupAccessoryPayload, 0);
  objc_storeStrong((id *)&self->_suggestedAccessoryName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_appBundleURL, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_installationGuideURL, 0);
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);

  objc_storeStrong((id *)&self->_setupCode, 0);
}

- (void)setAccessoryServerIdentifier:(id)a3
{
}

- (NSString)accessoryServerIdentifier
{
  return self->_accessoryServerIdentifier;
}

- (void)setUserConsentedForReplace:(BOOL)a3
{
  self->_userConsentedForReplace = a3;
}

- (BOOL)userConsentedForReplace
{
  return self->_userConsentedForReplace;
}

- (void)setAddRequestIdentifier:(id)a3
{
}

- (NSUUID)addRequestIdentifier
{
  return self->_addRequestIdentifier;
}

- (void)setOwnershipToken:(id)a3
{
}

- (HMAccessoryOwnershipToken)ownershipToken
{
  return self->_ownershipToken;
}

- (void)setSuggestedRoomUUID:(id)a3
{
}

- (NSUUID)suggestedRoomUUID
{
  return self->_suggestedRoomUUID;
}

- (void)setDoNetworkScan:(BOOL)a3
{
  self->_doNetworkScan = a3;
}

- (BOOL)doNetworkScan
{
  return self->_doNetworkScan;
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (BOOL)retry
{
  return self->_retry;
}

- (void)setSetupInitiatedByOtherMatterEcosystem:(BOOL)a3
{
  self->_setupInitiatedByOtherMatterEcosystem = a3;
}

- (BOOL)isSetupInitiatedByOtherMatterEcosystem
{
  return self->_setupInitiatedByOtherMatterEcosystem;
}

- (void)setCancellationReason:(id)a3
{
}

- (NSError)cancellationReason
{
  return self->_cancellationReason;
}

- (void)setAccessoryBeingReplaced:(id)a3
{
}

- (HMAccessory)accessoryBeingReplaced
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryBeingReplaced);

  return (HMAccessory *)WeakRetained;
}

- (void)setCertificationStatus:(unint64_t)a3
{
  self->_certificationStatus = a3;
}

- (unint64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (void)setSetupAuthTokenUUID:(id)a3
{
}

- (NSUUID)setupAuthTokenUUID
{
  return self->_setupAuthTokenUUID;
}

- (void)setSetupAuthToken:(id)a3
{
}

- (NSData)setupAuthToken
{
  return self->_setupAuthToken;
}

- (void)setSetupAccessoryPayload:(id)a3
{
}

- (HMSetupAccessoryPayload)setupAccessoryPayload
{
  return self->_setupAccessoryPayload;
}

- (void)setSuggestedAccessoryName:(id)a3
{
}

- (NSString)suggestedAccessoryName
{
  return self->_suggestedAccessoryName;
}

- (void)setEntitledForThirdPartyMatterSetupPayload:(BOOL)a3
{
  self->_entitledForThirdPartyMatterSetupPayload = a3;
}

- (BOOL)isEntitledForThirdPartyMatterSetupPayload
{
  return self->_entitledForThirdPartyMatterSetupPayload;
}

- (void)setEntitledForThirdPartySetupAccessoryPayload:(BOOL)a3
{
  self->_entitledForThirdPartySetupAccessoryPayload = a3;
}

- (BOOL)isEntitledForThirdPartySetupAccessoryPayload
{
  return self->_entitledForThirdPartySetupAccessoryPayload;
}

- (void)setEntitledForHomeKitSPI:(BOOL)a3
{
  self->_entitledForHomeKitSPI = a3;
}

- (BOOL)isEntitledForHomeKitSPI
{
  return self->_entitledForHomeKitSPI;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void)setAddAndSetupAccessories:(BOOL)a3
{
  self->_addAndSetupAccessories = a3;
}

- (BOOL)addAndSetupAccessories
{
  return self->_addAndSetupAccessories;
}

- (void)setAppBundleURL:(id)a3
{
}

- (NSURL)appBundleURL
{
  return self->_appBundleURL;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setCategory:(id)a3
{
}

- (void)setInstallationGuideURL:(id)a3
{
}

- (NSURL)installationGuideURL
{
  return self->_installationGuideURL;
}

- (void)setMarketingName:(id)a3
{
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HMSetupAccessoryDescription *)self accessoryName];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
    v6 = [(HMSetupAccessoryDescription *)self accessoryName];
    v7 = (void *)[v5 initWithName:@"Accessory Name" value:v6];
    [v3 addObject:v7];
  }
  v8 = [(HMSetupAccessoryDescription *)self accessoryUUID];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
    v10 = [(HMSetupAccessoryDescription *)self accessoryUUID];
    v11 = (void *)[v9 initWithName:@"Accessory UUID" value:v10];
    [v3 addObject:v11];
  }
  v12 = [(HMSetupAccessoryDescription *)self manufacturerName];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
    v14 = [(HMSetupAccessoryDescription *)self manufacturerName];
    v15 = (void *)[v13 initWithName:@"Manufacturer Name" value:v14];
    [v3 addObject:v15];
  }
  v16 = [(HMSetupAccessoryDescription *)self marketingName];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
    v18 = [(HMSetupAccessoryDescription *)self marketingName];
    v19 = (void *)[v17 initWithName:@"Marketing Name" value:v18];
    [v3 addObject:v19];
  }
  v20 = [(HMSetupAccessoryDescription *)self installationGuideURL];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
    v22 = [(HMSetupAccessoryDescription *)self installationGuideURL];
    v23 = (void *)[v21 initWithName:@"Installation Guide URL" value:v22];
    [v3 addObject:v23];
  }
  v24 = [(HMSetupAccessoryDescription *)self category];

  if (v24)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F653F8]);
    v26 = [(HMSetupAccessoryDescription *)self category];
    v27 = (void *)[v25 initWithName:@"Category" value:v26];
    [v3 addObject:v27];
  }
  v28 = [(HMSetupAccessoryDescription *)self appIdentifier];

  if (v28)
  {
    id v29 = objc_alloc(MEMORY[0x1E4F653F8]);
    v30 = [(HMSetupAccessoryDescription *)self appIdentifier];
    v31 = (void *)[v29 initWithName:@"App Identifier" value:v30];
    [v3 addObject:v31];
  }
  v32 = [(HMSetupAccessoryDescription *)self appBundleURL];

  if (v32)
  {
    id v33 = objc_alloc(MEMORY[0x1E4F653F8]);
    v34 = [(HMSetupAccessoryDescription *)self appBundleURL];
    v35 = (void *)[v33 initWithName:@"App Bundle URL" value:v34];
    [v3 addObject:v35];
  }
  if ([(HMSetupAccessoryDescription *)self addAndSetupAccessories])
  {
    id v36 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryDescription *)self addAndSetupAccessories];
    v37 = HMFBooleanToString();
    v38 = (void *)[v36 initWithName:@"Add And Setup" value:v37];
    [v3 addObject:v38];
  }
  v39 = [(HMSetupAccessoryDescription *)self homeUUID];

  if (v39)
  {
    id v40 = objc_alloc(MEMORY[0x1E4F653F8]);
    v41 = [(HMSetupAccessoryDescription *)self homeUUID];
    v42 = (void *)[v40 initWithName:@"Home UUID" value:v41];
    [v3 addObject:v42];
  }
  v43 = [(HMSetupAccessoryDescription *)self storeID];

  if (v43)
  {
    id v44 = objc_alloc(MEMORY[0x1E4F653F8]);
    v45 = [(HMSetupAccessoryDescription *)self storeID];
    v46 = (void *)[v44 initWithName:@"Store ID" value:v45];
    [v3 addObject:v46];
  }
  v47 = [(HMSetupAccessoryDescription *)self bundleID];

  if (v47)
  {
    id v48 = objc_alloc(MEMORY[0x1E4F653F8]);
    v49 = [(HMSetupAccessoryDescription *)self bundleID];
    v50 = (void *)[v48 initWithName:@"Bundle ID" value:v49];
    [v3 addObject:v50];
  }
  v51 = [(HMSetupAccessoryDescription *)self suggestedRoomUUID];

  if (v51)
  {
    id v52 = objc_alloc(MEMORY[0x1E4F653F8]);
    v53 = [(HMSetupAccessoryDescription *)self suggestedRoomUUID];
    v54 = (void *)[v52 initWithName:@"Suggested Room UUID" value:v53];
    [v3 addObject:v54];
  }
  v55 = [(HMSetupAccessoryDescription *)self suggestedAccessoryName];

  if (v55)
  {
    id v56 = objc_alloc(MEMORY[0x1E4F653F8]);
    v57 = [(HMSetupAccessoryDescription *)self suggestedAccessoryName];
    v58 = (void *)[v56 initWithName:@"Suggested Accessory Name" value:v57];
    [v3 addObject:v58];
  }
  if ([(HMSetupAccessoryDescription *)self isEntitledForHomeKitSPI])
  {
    id v59 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryDescription *)self isEntitledForHomeKitSPI];
    v60 = HMFBooleanToString();
    v61 = (void *)[v59 initWithName:@"SPI Entitled" value:v60];
    [v3 addObject:v61];
  }
  if ([(HMSetupAccessoryDescription *)self isEntitledForThirdPartySetupAccessoryPayload])
  {
    id v62 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryDescription *)self isEntitledForThirdPartySetupAccessoryPayload];
    v63 = HMFBooleanToString();
    v64 = (void *)[v62 initWithName:@"Setup Accessory Payload Entitled" value:v63];
    [v3 addObject:v64];
  }
  if ([(HMSetupAccessoryDescription *)self isEntitledForThirdPartyMatterSetupPayload])
  {
    id v65 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryDescription *)self isEntitledForThirdPartyMatterSetupPayload];
    v66 = HMFBooleanToString();
    v67 = (void *)[v65 initWithName:@"Matter Setup Payload Entitled" value:v66];
    [v3 addObject:v67];
  }
  if ([(HMSetupAccessoryDescription *)self isSetupInitiatedByOtherMatterEcosystem])
  {
    id v68 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryDescription *)self isSetupInitiatedByOtherMatterEcosystem];
    v69 = HMFBooleanToString();
    v70 = (void *)[v68 initWithName:@"Setup Initiated By Other Matter Ecosystem" value:v69];
    [v3 addObject:v70];
  }
  v71 = [(HMSetupAccessoryDescription *)self setupAuthTokenUUID];

  if (v71)
  {
    id v72 = objc_alloc(MEMORY[0x1E4F653F8]);
    v73 = [(HMSetupAccessoryDescription *)self setupAuthTokenUUID];
    v74 = (void *)[v72 initWithName:@"Setup Auth Token UUID" value:v73];
    [v3 addObject:v74];
  }
  v75 = [(HMSetupAccessoryDescription *)self setupAuthToken];

  if (v75)
  {
    id v76 = objc_alloc(MEMORY[0x1E4F653F8]);
    v77 = [(HMSetupAccessoryDescription *)self setupAuthToken];
    v78 = (void *)[v76 initWithName:@"Setup Auth Token" value:v77];
    [v3 addObject:v78];
  }
  v79 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];

  if (v79)
  {
    id v80 = objc_alloc(MEMORY[0x1E4F653F8]);
    v81 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
    v82 = (void *)[v80 initWithName:@"Setup Accessory Payload" value:v81];
    [v3 addObject:v82];
  }
  if ([(HMSetupAccessoryDescription *)self certificationStatus])
  {
    id v83 = objc_alloc(MEMORY[0x1E4F653F8]);
    v84 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMSetupAccessoryDescription certificationStatus](self, "certificationStatus"));
    v85 = (void *)[v83 initWithName:@"Certification Status" value:v84];
    [v3 addObject:v85];
  }
  v86 = [(HMSetupAccessoryDescription *)self accessoryBeingReplaced];
  if (v86)
  {
    v87 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"Accessory Being Replaced" value:v86];
    [v3 addObject:v87];
  }
  v88 = [(HMSetupAccessoryDescription *)self cancellationReason];

  if (v88)
  {
    id v89 = objc_alloc(MEMORY[0x1E4F653F8]);
    v90 = [(HMSetupAccessoryDescription *)self cancellationReason];
    v91 = (void *)[v89 initWithName:@"Cancellation Reason" value:v90];
    [v3 addObject:v91];
  }
  v92 = [(HMSetupAccessoryDescription *)self addRequestIdentifier];

  if (v92)
  {
    id v93 = objc_alloc(MEMORY[0x1E4F653F8]);
    v94 = [(HMSetupAccessoryDescription *)self addRequestIdentifier];
    v95 = (void *)[v93 initWithName:@"Add Request Identifier" value:v94];
    [v3 addObject:v95];
  }
  v96 = [(HMSetupAccessoryDescription *)self setupCode];

  if (v96)
  {
    id v97 = objc_alloc(MEMORY[0x1E4F653F8]);
    v98 = [(HMSetupAccessoryDescription *)self setupCode];
    v99 = HMFBooleanToString();
    v100 = (void *)[v97 initWithName:@"Has Setup Code" value:v99];
    [v3 addObject:v100];
  }
  v101 = [(HMSetupAccessoryDescription *)self ownershipToken];

  if (v101)
  {
    id v102 = objc_alloc(MEMORY[0x1E4F653F8]);
    v103 = [(HMSetupAccessoryDescription *)self ownershipToken];
    v104 = HMFBooleanToString();
    v105 = (void *)[v102 initWithName:@"Has Ownership Token" value:v104];
    [v3 addObject:v105];
  }
  v106 = [(HMSetupAccessoryDescription *)self accessoryServerIdentifier];

  if (v106)
  {
    id v107 = objc_alloc(MEMORY[0x1E4F653F8]);
    v108 = [(HMSetupAccessoryDescription *)self accessoryServerIdentifier];
    v109 = (void *)[v107 initWithName:@"Accessory Server Identifier" value:v108];
    [v3 addObject:v109];
  }
  if ([(HMSetupAccessoryDescription *)self doNetworkScan])
  {
    id v110 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryDescription *)self doNetworkScan];
    v111 = HMFBooleanToString();
    v112 = (void *)[v110 initWithName:@"Do Network Scan" value:v111];
    [v3 addObject:v112];
  }
  v113 = (void *)[v3 copy];

  return (NSArray *)v113;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (unint64_t)hash
{
  v3 = [(HMSetupAccessoryDescription *)self accessoryUUID];
  uint64_t v4 = [v3 hash];

  id v5 = [(HMSetupAccessoryDescription *)self addRequestIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
  uint64_t v8 = [v7 hash];

  id v9 = [(HMSetupAccessoryDescription *)self homeUUID];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMSetupAccessoryDescription *)a3;
  if (v4 == self)
  {
    LOBYTE(v71) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (!v6) {
      goto LABEL_32;
    }
    v7 = [(HMSetupAccessoryDescription *)self accessoryUUID];
    uint64_t v8 = [(HMSetupAccessoryDescription *)v6 accessoryUUID];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_32;
    }
    unint64_t v10 = [(HMSetupAccessoryDescription *)self accessoryName];
    v11 = [(HMSetupAccessoryDescription *)v6 accessoryName];
    int v12 = HMFEqualObjects();

    if (!v12) {
      goto LABEL_32;
    }
    id v13 = [(HMSetupAccessoryDescription *)self manufacturerName];
    v14 = [(HMSetupAccessoryDescription *)v6 manufacturerName];
    int v15 = HMFEqualObjects();

    if (!v15) {
      goto LABEL_32;
    }
    v16 = [(HMSetupAccessoryDescription *)self marketingName];
    id v17 = [(HMSetupAccessoryDescription *)v6 marketingName];
    int v18 = HMFEqualObjects();

    if (!v18) {
      goto LABEL_32;
    }
    v19 = [(HMSetupAccessoryDescription *)self installationGuideURL];
    v20 = [(HMSetupAccessoryDescription *)v6 installationGuideURL];
    int v21 = HMFEqualObjects();

    if (!v21) {
      goto LABEL_32;
    }
    v22 = [(HMSetupAccessoryDescription *)self category];
    v23 = [(HMSetupAccessoryDescription *)v6 category];
    int v24 = HMFEqualObjects();

    if (!v24) {
      goto LABEL_32;
    }
    id v25 = [(HMSetupAccessoryDescription *)self appIdentifier];
    v26 = [(HMSetupAccessoryDescription *)v6 appIdentifier];
    int v27 = HMFEqualObjects();

    if (!v27) {
      goto LABEL_32;
    }
    v28 = [(HMSetupAccessoryDescription *)self appBundleURL];
    id v29 = [(HMSetupAccessoryDescription *)v6 appBundleURL];
    int v30 = HMFEqualObjects();

    if (!v30) {
      goto LABEL_32;
    }
    BOOL v31 = [(HMSetupAccessoryDescription *)self addAndSetupAccessories];
    if (v31 != [(HMSetupAccessoryDescription *)v6 addAndSetupAccessories]) {
      goto LABEL_32;
    }
    v32 = [(HMSetupAccessoryDescription *)self homeUUID];
    id v33 = [(HMSetupAccessoryDescription *)v6 homeUUID];
    int v34 = HMFEqualObjects();

    if (!v34) {
      goto LABEL_32;
    }
    v35 = [(HMSetupAccessoryDescription *)self storeID];
    id v36 = [(HMSetupAccessoryDescription *)v6 storeID];
    int v37 = HMFEqualObjects();

    if (!v37) {
      goto LABEL_32;
    }
    v38 = [(HMSetupAccessoryDescription *)self bundleID];
    v39 = [(HMSetupAccessoryDescription *)v6 bundleID];
    int v40 = HMFEqualObjects();

    if (!v40) {
      goto LABEL_32;
    }
    v41 = [(HMSetupAccessoryDescription *)self suggestedRoomUUID];
    v42 = [(HMSetupAccessoryDescription *)v6 suggestedRoomUUID];
    int v43 = HMFEqualObjects();

    if (!v43) {
      goto LABEL_32;
    }
    id v44 = [(HMSetupAccessoryDescription *)self suggestedAccessoryName];
    v45 = [(HMSetupAccessoryDescription *)v6 suggestedAccessoryName];
    int v46 = HMFEqualObjects();

    if (!v46) {
      goto LABEL_32;
    }
    BOOL v47 = [(HMSetupAccessoryDescription *)self isEntitledForHomeKitSPI];
    if (v47 != [(HMSetupAccessoryDescription *)v6 isEntitledForHomeKitSPI]) {
      goto LABEL_32;
    }
    BOOL v48 = [(HMSetupAccessoryDescription *)self isEntitledForThirdPartySetupAccessoryPayload];
    if (v48 != [(HMSetupAccessoryDescription *)v6 isEntitledForThirdPartySetupAccessoryPayload])goto LABEL_32; {
    v49 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
    }
    v50 = [(HMSetupAccessoryDescription *)v6 setupAccessoryPayload];
    int v51 = HMFEqualObjects();

    if (!v51) {
      goto LABEL_32;
    }
    BOOL v52 = [(HMSetupAccessoryDescription *)self isEntitledForThirdPartyMatterSetupPayload];
    if (v52 != [(HMSetupAccessoryDescription *)v6 isEntitledForThirdPartyMatterSetupPayload])goto LABEL_32; {
    BOOL v53 = [(HMSetupAccessoryDescription *)self isSetupInitiatedByOtherMatterEcosystem];
    }
    if (v53 != [(HMSetupAccessoryDescription *)v6 isSetupInitiatedByOtherMatterEcosystem])goto LABEL_32; {
    unint64_t v54 = [(HMSetupAccessoryDescription *)self certificationStatus];
    }
    if (v54 != [(HMSetupAccessoryDescription *)v6 certificationStatus]) {
      goto LABEL_32;
    }
    v55 = [(HMSetupAccessoryDescription *)self accessoryBeingReplaced];
    id v56 = [(HMSetupAccessoryDescription *)v6 accessoryBeingReplaced];
    int v57 = HMFEqualObjects();

    if (!v57) {
      goto LABEL_32;
    }
    v58 = [(HMSetupAccessoryDescription *)self cancellationReason];
    id v59 = [(HMSetupAccessoryDescription *)v6 cancellationReason];
    int v60 = HMFEqualObjects();

    if (!v60) {
      goto LABEL_32;
    }
    v61 = [(HMSetupAccessoryDescription *)self addRequestIdentifier];
    id v62 = [(HMSetupAccessoryDescription *)v6 addRequestIdentifier];
    int v63 = HMFEqualObjects();

    if (!v63) {
      goto LABEL_32;
    }
    v64 = [(HMSetupAccessoryDescription *)self setupCode];
    id v65 = [(HMSetupAccessoryDescription *)v6 setupCode];
    int v66 = HMFEqualObjects();

    if (!v66) {
      goto LABEL_32;
    }
    v67 = [(HMSetupAccessoryDescription *)self accessoryServerIdentifier];
    id v68 = [(HMSetupAccessoryDescription *)v6 accessoryServerIdentifier];
    int v69 = HMFEqualObjects();

    if (v69)
    {
      BOOL v70 = [(HMSetupAccessoryDescription *)self doNetworkScan];
      BOOL v71 = v70 ^ [(HMSetupAccessoryDescription *)v6 doNetworkScan] ^ 1;
    }
    else
    {
LABEL_32:
      LOBYTE(v71) = 0;
    }
  }
  return v71;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];

  if (v4)
  {
    id v5 = [HMSetupAccessoryDescription alloc];
    uint64_t v6 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
    v7 = [(HMSetupAccessoryDescription *)self appIdentifier];
    uint64_t v8 = [(HMSetupAccessoryDescription *)self homeUUID];
    int v9 = [(HMSetupAccessoryDescription *)self ownershipToken];
    uint64_t v10 = [(HMSetupAccessoryDescription *)v5 initWithSetupAccessoryPayload:v6 appID:v7 homeUUID:v8 ownershipToken:v9];
  }
  else
  {
    v11 = [(HMSetupAccessoryDescription *)self accessoryUUID];

    int v12 = [HMSetupAccessoryDescription alloc];
    if (!v11)
    {
      uint64_t v6 = [(HMSetupAccessoryDescription *)self appIdentifier];
      v7 = [(HMSetupAccessoryDescription *)self homeUUID];
      id v13 = [(HMSetupAccessoryDescription *)v12 initWithAppIdentifier:v6 homeUUID:v7];
      goto LABEL_6;
    }
    uint64_t v6 = [(HMSetupAccessoryDescription *)self accessoryUUID];
    v7 = [(HMSetupAccessoryDescription *)self accessoryName];
    uint64_t v8 = [(HMSetupAccessoryDescription *)self appIdentifier];
    int v9 = [(HMSetupAccessoryDescription *)self homeUUID];
    uint64_t v10 = [(HMSetupAccessoryDescription *)v12 initWithAccessoryUUID:v6 accessoryName:v7 appID:v8 homeUUID:v9];
  }
  id v13 = (HMSetupAccessoryDescription *)v10;

LABEL_6:
  v14 = [(HMSetupAccessoryDescription *)self accessoryName];
  [(HMSetupAccessoryDescription *)v13 setAccessoryName:v14];

  int v15 = [(HMSetupAccessoryDescription *)self accessoryUUID];
  [(HMSetupAccessoryDescription *)v13 setAccessoryUUID:v15];

  v16 = [(HMSetupAccessoryDescription *)self appBundleURL];
  [(HMSetupAccessoryDescription *)v13 setAppBundleURL:v16];

  [(HMSetupAccessoryDescription *)v13 setAddAndSetupAccessories:[(HMSetupAccessoryDescription *)self addAndSetupAccessories]];
  [(HMSetupAccessoryDescription *)v13 setCertificationStatus:[(HMSetupAccessoryDescription *)self certificationStatus]];
  id v17 = [(HMSetupAccessoryDescription *)self suggestedRoomUUID];
  [(HMSetupAccessoryDescription *)v13 setSuggestedRoomUUID:v17];

  int v18 = [(HMSetupAccessoryDescription *)self suggestedAccessoryName];
  [(HMSetupAccessoryDescription *)v13 setSuggestedAccessoryName:v18];

  v19 = [(HMSetupAccessoryDescription *)self storeID];
  [(HMSetupAccessoryDescription *)v13 setStoreID:v19];

  v20 = [(HMSetupAccessoryDescription *)self bundleID];
  [(HMSetupAccessoryDescription *)v13 setBundleID:v20];

  [(HMSetupAccessoryDescription *)v13 setUserConsentedForReplace:[(HMSetupAccessoryDescription *)self userConsentedForReplace]];
  int v21 = [(HMSetupAccessoryDescription *)self category];
  [(HMSetupAccessoryDescription *)v13 setCategory:v21];

  v22 = [(HMSetupAccessoryDescription *)self cancellationReason];
  [(HMSetupAccessoryDescription *)v13 setCancellationReason:v22];

  [(HMSetupAccessoryDescription *)v13 setEntitledForHomeKitSPI:[(HMSetupAccessoryDescription *)self isEntitledForHomeKitSPI]];
  [(HMSetupAccessoryDescription *)v13 setEntitledForThirdPartySetupAccessoryPayload:[(HMSetupAccessoryDescription *)self isEntitledForThirdPartySetupAccessoryPayload]];
  [(HMSetupAccessoryDescription *)v13 setEntitledForThirdPartyMatterSetupPayload:[(HMSetupAccessoryDescription *)self isEntitledForThirdPartyMatterSetupPayload]];
  [(HMSetupAccessoryDescription *)v13 setSetupInitiatedByOtherMatterEcosystem:[(HMSetupAccessoryDescription *)self isSetupInitiatedByOtherMatterEcosystem]];
  v23 = [(HMSetupAccessoryDescription *)self accessoryServerIdentifier];
  [(HMSetupAccessoryDescription *)v13 setAccessoryServerIdentifier:v23];

  [(HMSetupAccessoryDescription *)v13 setDoNetworkScan:[(HMSetupAccessoryDescription *)self doNetworkScan]];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  uint64_t v4 = [(HMSetupAccessoryDescription *)self accessoryUUID];
  [v22 encodeObject:v4 forKey:@"uuid"];

  id v5 = [(HMSetupAccessoryDescription *)self accessoryName];
  [v22 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(HMSetupAccessoryDescription *)self appIdentifier];
  [v22 encodeObject:v6 forKey:@"appIdentifier"];

  v7 = [(HMSetupAccessoryDescription *)self appBundleURL];
  [v22 encodeObject:v7 forKey:@"appBundleURL"];

  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription addAndSetupAccessories](self, "addAndSetupAccessories"), @"addAndSetupAccessories");
  uint64_t v8 = [(HMSetupAccessoryDescription *)self homeUUID];
  [v22 encodeObject:v8 forKey:@"homeUUID"];

  int v9 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
  [v22 encodeObject:v9 forKey:@"setupAccessoryPayload"];

  uint64_t v10 = [(HMSetupAccessoryDescription *)self setupAuthTokenUUID];
  [v22 encodeObject:v10 forKey:@"setupAuthTokenUUID"];

  v11 = [(HMSetupAccessoryDescription *)self setupAuthToken];
  [v22 encodeObject:v11 forKey:@"setupAuthToken"];

  int v12 = [(HMSetupAccessoryDescription *)self ownershipToken];
  [v22 encodeObject:v12 forKey:@"ownershipToken"];

  objc_msgSend(v22, "encodeInteger:forKey:", -[HMSetupAccessoryDescription certificationStatus](self, "certificationStatus"), @"certificationStatus");
  id v13 = [(HMSetupAccessoryDescription *)self suggestedRoomUUID];
  [v22 encodeObject:v13 forKey:@"suggestedRoomUUID"];

  v14 = [(HMSetupAccessoryDescription *)self suggestedAccessoryName];
  [v22 encodeObject:v14 forKey:@"suggestedAccessoryName"];

  int v15 = [(HMSetupAccessoryDescription *)self storeID];
  [v22 encodeObject:v15 forKey:@"storeID"];

  v16 = [(HMSetupAccessoryDescription *)self bundleID];
  [v22 encodeObject:v16 forKey:@"bundleID"];

  id v17 = [(HMSetupAccessoryDescription *)self addRequestIdentifier];
  [v22 encodeObject:v17 forKey:@"addRequestIdentifier"];

  int v18 = [(HMSetupAccessoryDescription *)self cancellationReason];
  [v22 encodeObject:v18 forKey:@"cancelationReason"];

  v19 = [(HMSetupAccessoryDescription *)self marketingName];
  [v22 encodeObject:v19 forKey:@"marketingName"];

  v20 = [(HMSetupAccessoryDescription *)self installationGuideURL];
  [v22 encodeObject:v20 forKey:@"installationGuideURL"];

  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription isEntitledForHomeKitSPI](self, "isEntitledForHomeKitSPI"), @"isEntitledForHomeKitSPI");
  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription isEntitledForThirdPartySetupAccessoryPayload](self, "isEntitledForThirdPartySetupAccessoryPayload"), @"isEntitledForThirdPartySetupAccessoryPayload");
  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription isEntitledForThirdPartyMatterSetupPayload](self, "isEntitledForThirdPartyMatterSetupPayload"), @"isEntitledForThirdPartyMatterSetupPayload");
  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription isSetupInitiatedByOtherMatterEcosystem](self, "isSetupInitiatedByOtherMatterEcosystem"), @"isSetupInitiatedByOtherMatterEcosystem");
  int v21 = [(HMSetupAccessoryDescription *)self accessoryServerIdentifier];
  [v22 encodeObject:v21 forKey:@"accessoryServerIdentifier"];

  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription doNetworkScan](self, "doNetworkScan"), @"networkScan");
}

- (HMSetupAccessoryDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)HMSetupAccessoryDescription;
  id v5 = [(HMSetupAccessoryDescription *)&v51 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uint64_t v7 = [v6 copy];
    accessoryUUID = v5->_accessoryUUID;
    v5->_accessoryUUID = (NSUUID *)v7;

    int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    uint64_t v10 = [v9 copy];
    accessoryName = v5->_accessoryName;
    v5->_accessoryName = (NSString *)v10;

    int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appIdentifier"];
    uint64_t v13 = [v12 copy];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v13;

    int v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleURL"];
    uint64_t v16 = [v15 copy];
    appBundleURL = v5->_appBundleURL;
    v5->_appBundleURL = (NSURL *)v16;

    v5->_addAndSetupAccessories = [v4 decodeBoolForKey:@"addAndSetupAccessories"];
    int v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeUUID"];
    uint64_t v19 = [v18 copy];
    homeUUID = v5->_homeUUID;
    v5->_homeUUID = (NSUUID *)v19;

    int v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setupAccessoryPayload"];
    uint64_t v22 = [v21 copy];
    setupAccessoryPayload = v5->_setupAccessoryPayload;
    v5->_setupAccessoryPayload = (HMSetupAccessoryPayload *)v22;

    int v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setupAuthTokenUUID"];
    uint64_t v25 = [v24 copy];
    setupAuthTokenUUID = v5->_setupAuthTokenUUID;
    v5->_setupAuthTokenUUID = (NSUUID *)v25;

    int v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setupAuthToken"];
    uint64_t v28 = [v27 copy];
    setupAuthToken = v5->_setupAuthToken;
    v5->_setupAuthToken = (NSData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownershipToken"];
    ownershipToken = v5->_ownershipToken;
    v5->_ownershipToken = (HMAccessoryOwnershipToken *)v30;

    v5->_certificationStatus = [v4 decodeIntegerForKey:@"certificationStatus"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedRoomUUID"];
    suggestedRoomUUID = v5->_suggestedRoomUUID;
    v5->_suggestedRoomUUID = (NSUUID *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedAccessoryName"];
    suggestedAccessoryName = v5->_suggestedAccessoryName;
    v5->_suggestedAccessoryName = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeID"];
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addRequestIdentifier"];
    addRequestIdentifier = v5->_addRequestIdentifier;
    v5->_addRequestIdentifier = (NSUUID *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelationReason"];
    cancellationReason = v5->_cancellationReason;
    v5->_cancellationReason = (NSError *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"marketingName"];
    marketingName = v5->_marketingName;
    v5->_marketingName = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installationGuideURL"];
    installationGuideURL = v5->_installationGuideURL;
    v5->_installationGuideURL = (NSURL *)v46;

    v5->_entitledForHomeKitSPI = [v4 decodeBoolForKey:@"isEntitledForHomeKitSPI"];
    v5->_entitledForThirdPartySetupAccessoryPayload = [v4 decodeBoolForKey:@"isEntitledForThirdPartySetupAccessoryPayload"];
    v5->_entitledForThirdPartyMatterSetupPayload = [v4 decodeBoolForKey:@"isEntitledForThirdPartyMatterSetupPayload"];
    v5->_setupInitiatedByOtherMatterEcosystem = [v4 decodeBoolForKey:@"isSetupInitiatedByOtherMatterEcosystem"];
    v5->_userConsentedForReplace = 0;
    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryServerIdentifier"];
    accessoryServerIdentifier = v5->_accessoryServerIdentifier;
    v5->_accessoryServerIdentifier = (NSString *)v48;

    v5->_doNetworkScan = [v4 decodeBoolForKey:@"networkScan"];
  }

  return v5;
}

- (NSUUID)suggestedRoomUniqueIdentifier
{
  v3 = [(HMSetupAccessoryDescription *)self suggestedRoomUUID];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F29128];
    id v5 = [(HMSetupAccessoryDescription *)self suggestedRoomUUID];
    uint64_t v6 = objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:", v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSUUID *)v6;
}

- (BOOL)hasAddRequest
{
  v2 = [(HMSetupAccessoryDescription *)self addRequestIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (HMAccessoryCategory)category
{
  category = self->_category;
  if (category)
  {
    BOOL v3 = category;
  }
  else
  {
    id v5 = +[HMHAPMetadata getSharedInstance];
    uint64_t v6 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
    uint64_t v7 = [v6 categoryNumber];
    BOOL v3 = [v5 categoryForIdentifier:v7];
  }

  return v3;
}

- (NSString)setupID
{
  v2 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
  BOOL v3 = [v2 setupID];

  return (NSString *)v3;
}

- (NSString)setupCode
{
  setupCode = self->_setupCode;
  if (setupCode)
  {
    BOOL v3 = setupCode;
  }
  else
  {
    id v4 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
    BOOL v3 = [v4 setupCode];
  }

  return v3;
}

- (void)setSetupCode:(id)a3
{
  id v6 = a3;
  id v5 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];

  if (!v5) {
    objc_storeStrong((id *)&self->_setupCode, a3);
  }
}

- (BOOL)isPaired
{
  v2 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
  char v3 = [v2 isPaired];

  return v3;
}

- (BOOL)supportsBTLE
{
  v2 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
  char v3 = [v2 supportsBTLE];

  return v3;
}

- (BOOL)supportsWAC
{
  v2 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
  char v3 = [v2 supportsWAC];

  return v3;
}

- (BOOL)supportsIP
{
  v2 = [(HMSetupAccessoryDescription *)self setupAccessoryPayload];
  char v3 = [v2 supportsIP];

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  char v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v11];
  id v4 = v11;
  if (v3)
  {
    int v12 = @"HMSADDRK.data";
    uint64_t v13 = v3;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      int v15 = v9;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize device setup request %@: %@", buf, 0x20u);
    }
    id v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return (NSDictionary *)v5;
}

- (void)updateWithAuthToken:(id)a3 uuid:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v13)
  {
    uint64_t v7 = v6;
    uint64_t v8 = (void *)[v13 copy];
    [(HMSetupAccessoryDescription *)self setSetupAuthToken:v8];

    int v9 = (void *)[v7 copy];
    [(HMSetupAccessoryDescription *)self setSetupAuthTokenUUID:v9];
  }
  else
  {
    uint64_t v10 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    [(HMSetupAccessoryDescription *)v10 updateAccessoryName:v12];
  }
}

- (void)updateAccessoryName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    [(HMSetupAccessoryDescription *)self setAccessoryName:v4];
  }
  else
  {
    id v5 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    [(HMSetupAccessoryDescription *)v5 updateAccessoryCategory:v7];
  }
}

- (void)updateAccessoryCategory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    [(HMSetupAccessoryDescription *)self setCategory:v4];
  }
  else
  {
    id v5 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    [(HMSetupAccessoryDescription *)v5 updateAppIdentifier:v7];
  }
}

- (void)updateAppIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    [(HMSetupAccessoryDescription *)self setAppIdentifier:v4];
  }
  else
  {
    id v5 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    [(HMSetupAccessoryDescription *)v5 updateOwnershipToken:v7];
  }
}

- (void)updateWithAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = [v4 uuid];
    [(HMSetupAccessoryDescription *)self setAccessoryUUID:v5];

    SEL v6 = [v12 name];
    [(HMSetupAccessoryDescription *)self setAccessoryName:v6];

    id v7 = [v12 category];
    [(HMSetupAccessoryDescription *)self setCategory:v7];

    id v8 = [v12 manufacturer];
    [(HMSetupAccessoryDescription *)self setManufacturerName:v8];
  }
  else
  {
    int v9 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    [(HMSetupAccessoryDescription *)v9 updateWithSetupAccessoryPayload:v11];
  }
}

- (void)updateWithSetupAccessoryPayload:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    [(HMSetupAccessoryDescription *)self setSetupAccessoryPayload:v4];
  }
  else
  {
    id v5 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    [(HMSetupAccessoryDescription *)v5 initWithDictionaryRepresentation:v7];
  }
}

- (HMSetupAccessoryDescription)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMSetupAccessoryDescription *)self init];
  objc_msgSend(v4, "hmf_dataForKey:", @"HMSADDRK.data");
  SEL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v18 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v18];
    id v8 = v18;

    if (v7)
    {
      int v9 = v7;
    }
    else
    {
      v14 = (void *)MEMORY[0x19F3A64A0]();
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v20 = v16;
        __int16 v21 = 2112;
        uint64_t v22 = v6;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup accessory description from dictionary representation; failed to deserialize data %@: %@",
          buf,
          0x20u);
      }
    }

    id v13 = v7;
  }
  else
  {
    SEL v10 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = v5;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = @"HMSADDRK.data";
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup accessory description from dictionary representation: missing %@ key in dictionary: %@", buf, 0x20u);
    }
    id v13 = 0;
  }

  return v13;
}

- (HMSetupAccessoryDescription)initWithStagedCHIPAccessoryPairingIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    SEL v6 = v5;
    v18.receiver = self;
    v18.super_class = (Class)HMSetupAccessoryDescription;
    id v7 = [(HMSetupAccessoryDescription *)&v18 init];
    id v8 = v7;
    if (v7)
    {
      v7->_addAndSetupAccessories = 1;
      objc_storeStrong((id *)&v7->_accessoryServerIdentifier, a3);
    }

    return v8;
  }
  else
  {
    SEL v10 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    return [(HMSetupAccessoryDescription *)v10 initWithAddRequestIdentifier:v12 accessoryName:v13 accessoryCategory:v14 setupAccessoryPayload:v15 appID:v16 ownershipToken:v17];
  }
}

- (HMSetupAccessoryDescription)initWithAddRequestIdentifier:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5 setupAccessoryPayload:(id)a6 appID:(id)a7 ownershipToken:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMSetupAccessoryDescription;
  id v19 = [(HMSetupAccessoryDescription *)&v26 init];
  uint64_t v20 = v19;
  if (v19)
  {
    v19->_addAndSetupAccessories = 1;
    objc_storeStrong((id *)&v19->_addRequestIdentifier, a3);
    objc_storeStrong((id *)&v20->_accessoryName, a4);
    objc_storeStrong((id *)&v20->_category, a5);
    objc_storeStrong((id *)&v20->_setupAccessoryPayload, a6);
    uint64_t v21 = objc_msgSend(v17, "copy", v24, v25);
    appIdentifier = v20->_appIdentifier;
    v20->_appIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_ownershipToken, a8);
  }

  return v20;
}

- (id)initToSetupAccessoriesWithSetupAccessoryPayload:(id)a3 appID:(id)a4 homeName:(id)a5 homeUUID:(id)a6 trustedOrigin:(BOOL)a7 ownershipToken:(id)a8
{
  return -[HMSetupAccessoryDescription initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:](self, "initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:", a3, a4, a6, a8, a7);
}

- (HMSetupAccessoryDescription)initWithSetupAccessoryPayload:(id)a3 appID:(id)a4 homeUUID:(id)a5 ownershipToken:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMSetupAccessoryDescription;
  id v15 = [(HMSetupAccessoryDescription *)&v21 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    appIdentifier = v15->_appIdentifier;
    v15->_appIdentifier = (NSString *)v16;

    v15->_addAndSetupAccessories = 1;
    uint64_t v18 = [v13 copy];
    homeUUID = v15->_homeUUID;
    v15->_homeUUID = (NSUUID *)v18;

    objc_storeStrong((id *)&v15->_setupAccessoryPayload, a3);
    v15->_certificationStatus = 0;
    objc_storeStrong((id *)&v15->_ownershipToken, a6);
  }

  return v15;
}

- (HMSetupAccessoryDescription)initWithAppIdentifier:(id)a3 homeUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMSetupAccessoryDescription;
  id v8 = [(HMSetupAccessoryDescription *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    appIdentifier = v8->_appIdentifier;
    v8->_appIdentifier = (NSString *)v9;

    v8->_addAndSetupAccessories = 1;
    uint64_t v11 = [v7 copy];
    homeUUID = v8->_homeUUID;
    v8->_homeUUID = (NSUUID *)v11;

    v8->_certificationStatus = 0;
  }

  return v8;
}

- (HMSetupAccessoryDescription)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 appID:(id)a5 homeName:(id)a6 homeUUID:(id)a7 trustedOrigin:(BOOL)a8
{
  return [(HMSetupAccessoryDescription *)self initWithAccessoryUUID:a3 accessoryName:a4 appID:a5 homeUUID:a7];
}

- (HMSetupAccessoryDescription)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 appID:(id)a5 homeUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMSetupAccessoryDescription;
  objc_super v14 = [(HMSetupAccessoryDescription *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    accessoryUUID = v14->_accessoryUUID;
    v14->_accessoryUUID = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    accessoryName = v14->_accessoryName;
    v14->_accessoryName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    appIdentifier = v14->_appIdentifier;
    v14->_appIdentifier = (NSString *)v19;

    v14->_addAndSetupAccessories = 0;
    uint64_t v21 = [v13 copy];
    homeUUID = v14->_homeUUID;
    v14->_homeUUID = (NSUUID *)v21;

    v14->_certificationStatus = 0;
  }

  return v14;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end