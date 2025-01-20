@interface HMDMatterAccessory
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)mfiCertifiedACWG;
- (BOOL)supportsACWGProvisioning;
- (BOOL)supportsACWGUWB;
- (BOOL)supportsCHIP;
- (BOOL)supportsIdentify;
- (BOOL)supportsMatterWeekDaySchedule;
- (BOOL)supportsMatterYearDaySchedule;
- (BOOL)supportsWalletKey;
- (HMDBulletinBoard)bulletinBoard;
- (HMDCHIPAccessoryStorage)chipStorage;
- (HMDMatterAccessory)init;
- (HMDMatterAccessory)initWithCoder:(id)a3;
- (HMDMatterAccessory)initWithTransaction:(id)a3 home:(id)a4;
- (HMDMatterAccessoryAdapter)matterAdapter;
- (HMDMessageRouter)primaryResidentMessageRouter;
- (HMMTRAccessoryServer)accessoryServer;
- (NSData)preexistingReaderGroupIdentifierACWG;
- (NSData)publicKey;
- (NSData)readerGroupSubIdentifierACWG;
- (NSData)setupHash;
- (NSNumber)matterNodeID;
- (NSNumber)matterProductID;
- (NSNumber)matterSoftwareVersionNumber;
- (NSNumber)matterVendorID;
- (NSNumber)matterWEDSupport;
- (NSNumber)supportedLinkLayerTypes;
- (NSNumber)supportsMatterAccessCode;
- (NSNumber)supportsMatterWalletKey;
- (NSString)matterExtendedMACAddress;
- (NSString)pairingUsername;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)pairingIdentity;
- (id)transactionWithObjectChangeType:(unint64_t)a3;
- (id)transportReports;
- (int64_t)certificationStatus;
- (int64_t)communicationProtocol;
- (int64_t)reachableTransports;
- (void)_registerForMessages;
- (void)configureCHIPAccessory;
- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6;
- (void)didFindAccessoryServer:(id)a3;
- (void)didRemoveAccessoryServer:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleCHIPSendRemoteRequestMessage:(id)a3;
- (void)handleIdentifyAccessoryMessage:(id)a3;
- (void)handleUpdatedCHIPPropertiesOnAccessoryModel:(id)a3 actions:(id)a4;
- (void)populateAccessoryModel:(id)a3 version:(int64_t)a4;
- (void)populateModelObject:(id)a3 version:(int64_t)a4;
- (void)processUpdatedAccessoryServer:(id)a3;
- (void)removeAllCHIPPairingsWithCompletion:(id)a3;
- (void)savePublicKey:(id)a3 username:(id)a4;
- (void)setAccessoryServer:(id)a3;
- (void)setBulletinBoard:(id)a3;
- (void)setCHIPReportHandler:(id)a3;
- (void)setCertificationStatus:(int64_t)a3;
- (void)setChipStorage:(id)a3;
- (void)setCommunicationProtocol:(int64_t)a3;
- (void)setMatterAdapter:(id)a3;
- (void)setMatterExtendedMACAddress:(id)a3;
- (void)setMatterNodeID:(id)a3;
- (void)setMatterProductID:(id)a3;
- (void)setMatterSoftwareVersionNumber:(id)a3;
- (void)setMatterVendorID:(id)a3;
- (void)setMatterWEDSupport:(id)a3;
- (void)setPairingUsername:(id)a3;
- (void)setPrimaryResidentMessageRouter:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setSetupHash:(id)a3;
- (void)setSupportedLinkLayerTypes:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)unconfigure;
- (void)unconfigureAccessoryWithServerIdentifier:(id)a3 linkType:(int64_t)a4 updateReachability:(BOOL)a5;
@end

@implementation HMDMatterAccessory

- (void)processUpdatedAccessoryServer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22F5B8348(v4);
}

- (void)didFindAccessoryServer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22F5B8764(v4);
}

- (void)didRemoveAccessoryServer:(id)a3
{
  uint64_t v4 = sub_2302DDBB0();
  unint64_t v6 = v5;
  v7 = self;
  sub_22F5B8BC0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)savePublicKey:(id)a3 username:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14 = self;
  uint64_t v8 = sub_2302DD180();
  unint64_t v10 = v9;

  uint64_t v11 = sub_2302DDBB0();
  unint64_t v13 = v12;

  sub_22F5B9038(v8, v10, v11, v13);
  swift_bridgeObjectRelease();
  sub_22F5417E0(v8, v10);
}

- (void)populateAccessoryModel:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_22F5B9A80(v6, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterAdapter, 0);
  objc_storeStrong((id *)&self->_readerGroupSubIdentifierACWG, 0);
  objc_storeStrong((id *)&self->_preexistingReaderGroupIdentifierACWG, 0);
  objc_storeStrong((id *)&self->_supportsMatterWalletKey, 0);
  objc_storeStrong((id *)&self->_supportsMatterAccessCode, 0);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_supportedLinkLayerTypes, 0);
  objc_storeStrong((id *)&self->_matterSoftwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_matterExtendedMACAddress, 0);
  objc_storeStrong((id *)&self->_matterWEDSupport, 0);
  objc_storeStrong((id *)&self->_matterProductID, 0);
  objc_storeStrong((id *)&self->_matterVendorID, 0);
  objc_storeStrong((id *)&self->_matterNodeID, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_primaryResidentMessageRouter, 0);
  objc_storeStrong((id *)&self->_pairingUsername, 0);
  objc_storeStrong((id *)&self->_chipStorage, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_accessoryServer, 0);
}

- (void)setMatterAdapter:(id)a3
{
}

- (HMDMatterAccessoryAdapter)matterAdapter
{
  return self->_matterAdapter;
}

- (BOOL)supportsACWGUWB
{
  return self->_supportsACWGUWB;
}

- (BOOL)supportsACWGProvisioning
{
  return self->_supportsACWGProvisioning;
}

- (BOOL)mfiCertifiedACWG
{
  return self->_mfiCertifiedACWG;
}

- (NSData)readerGroupSubIdentifierACWG
{
  return self->_readerGroupSubIdentifierACWG;
}

- (NSData)preexistingReaderGroupIdentifierACWG
{
  return self->_preexistingReaderGroupIdentifierACWG;
}

- (BOOL)supportsMatterYearDaySchedule
{
  return self->_supportsMatterYearDaySchedule;
}

- (BOOL)supportsMatterWeekDaySchedule
{
  return self->_supportsMatterWeekDaySchedule;
}

- (BOOL)supportsWalletKey
{
  return self->_supportsWalletKey;
}

- (NSNumber)supportsMatterWalletKey
{
  return self->_supportsMatterWalletKey;
}

- (NSNumber)supportsMatterAccessCode
{
  return self->_supportsMatterAccessCode;
}

- (void)setSetupHash:(id)a3
{
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (void)setSupportedLinkLayerTypes:(id)a3
{
}

- (NSNumber)supportedLinkLayerTypes
{
  return self->_supportedLinkLayerTypes;
}

- (void)setMatterSoftwareVersionNumber:(id)a3
{
}

- (NSNumber)matterSoftwareVersionNumber
{
  return self->_matterSoftwareVersionNumber;
}

- (void)setMatterExtendedMACAddress:(id)a3
{
}

- (NSString)matterExtendedMACAddress
{
  return self->_matterExtendedMACAddress;
}

- (void)setMatterWEDSupport:(id)a3
{
}

- (NSNumber)matterWEDSupport
{
  return self->_matterWEDSupport;
}

- (void)setMatterProductID:(id)a3
{
}

- (NSNumber)matterProductID
{
  return self->_matterProductID;
}

- (void)setMatterVendorID:(id)a3
{
}

- (NSNumber)matterVendorID
{
  return self->_matterVendorID;
}

- (void)setMatterNodeID:(id)a3
{
}

- (NSNumber)matterNodeID
{
  return self->_matterNodeID;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPrimaryResidentMessageRouter:(id)a3
{
}

- (HMDMessageRouter)primaryResidentMessageRouter
{
  return self->_primaryResidentMessageRouter;
}

- (void)setPairingUsername:(id)a3
{
}

- (NSString)pairingUsername
{
  return self->_pairingUsername;
}

- (void)setCommunicationProtocol:(int64_t)a3
{
  self->_communicationProtocol = a3;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (void)setChipStorage:(id)a3
{
}

- (HMDCHIPAccessoryStorage)chipStorage
{
  return self->_chipStorage;
}

- (void)setCertificationStatus:(int64_t)a3
{
  self->_certificationStatus = a3;
}

- (int64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (void)setBulletinBoard:(id)a3
{
}

- (HMDBulletinBoard)bulletinBoard
{
  return self->_bulletinBoard;
}

- (void)setAccessoryServer:(id)a3
{
}

- (HMMTRAccessoryServer)accessoryServer
{
  return self->_accessoryServer;
}

- (void)setCHIPReportHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMatterAccessory *)self matterAdapter];
  [v5 setMatterReportHandler:v4];
}

- (void)removeAllCHIPPairingsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMatterAccessory *)self matterAdapter];
  [v5 removeAllMatterPairingsWithCompletion:v4];
}

- (void)handleCHIPSendRemoteRequestMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMatterAccessory *)self matterAdapter];
  [v5 handleRemoteMatterRequestMessage:v4];
}

- (void)handleUpdatedCHIPPropertiesOnAccessoryModel:(id)a3 actions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDMatterAccessory *)self matterAdapter];
  [v8 updateMatterPropertiesWithAccessoryModel:v7 actions:v6];
}

- (void)unconfigureAccessoryWithServerIdentifier:(id)a3 linkType:(int64_t)a4 updateReachability:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = (void *)MEMORY[0x230FBD990]();
  unint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = HMFGetLogIdentifier();
    if ((unint64_t)a4 > 2) {
      unint64_t v13 = @"Undefined";
    }
    else {
      unint64_t v13 = off_264A1CE08[a4];
    }
    v14 = v13;
    int v15 = 138543874;
    v16 = v12;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Unconfiguring from server %@/%@", (uint8_t *)&v15, 0x20u);
  }
  if (v5) {
    [(HMDAccessory *)v10 setReachable:0];
  }
  logAndPostNotification(@"HMDAccessoryUnconfiguredNotification", v10, 0);
}

- (void)unconfigure
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(HMDMatterAccessory *)self matterAdapter];
  [v4 unconfigure];
}

- (void)configureCHIPAccessory
{
  id v2 = [(HMDMatterAccessory *)self matterAdapter];
  [v2 configureMatterAccessory];
}

- (void)populateModelObject:(id)a3 version:(int64_t)a4
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  if (v7) {
    [(HMDMatterAccessory *)self populateAccessoryModel:v7 version:a4];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  id v6 = [(HMDMatterAccessory *)self transactionWithObjectChangeType:a3];
  [(HMDMatterAccessory *)self populateModelObject:v6 version:a4];
  return v6;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return [(HMDMatterAccessory *)self modelObjectWithChangeType:a3 version:4];
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  BOOL v5 = [HMDHAPAccessoryTransaction alloc];
  id v6 = [(HMDAccessory *)self uuid];
  id v7 = [(HMDAccessory *)self home];
  id v8 = [v7 uuid];
  unint64_t v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  return v9;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (v9
    && ([(HMDMatterAccessory *)self matterAdapter],
        unint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    uint64_t v11 = [(HMDMatterAccessory *)self matterAdapter];
    [v11 removeMatterPathModel:v9 message:v7];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDMatterAccessory;
    [(HMDAccessory *)&v12 transactionObjectRemoved:v6 message:v7];
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v12 = v11;
  }
  else {
    objc_super v12 = 0;
  }
  id v13 = v12;

  if (!v13) {
    goto LABEL_30;
  }
  v14 = [(HMDAccessory *)self home];
  v77 = [v10 transactionResult];
  uint64_t v15 = [v13 certificationStatus];
  if (v15)
  {
    v16 = (void *)v15;
    __int16 v17 = [v13 certificationStatus];
    uint64_t v18 = [v17 unsignedIntegerValue];
    int64_t v19 = [(HMDMatterAccessory *)self certificationStatus];

    if (v18 != v19)
    {
      v20 = [v13 certificationStatus];
      -[HMDMatterAccessory setCertificationStatus:](self, "setCertificationStatus:", [v20 unsignedIntegerValue]);

      [v77 markChanged];
    }
  }
  uint64_t v21 = [v13 pairingUsername];
  if (v21)
  {
    v22 = (void *)v21;
    uint64_t v23 = [v13 publicKey];
    if (!v23)
    {

      goto LABEL_16;
    }
    v24 = (void *)v23;
    v25 = [(HMDMatterAccessory *)self pairingUsername];
    v26 = [v13 pairingUsername];
    if ([v25 isEqual:v26])
    {
      [(HMDMatterAccessory *)self publicKey];
      v27 = id v73 = v8;
      [v13 publicKey];
      v75 = v14;
      v29 = id v28 = v10;
      char v71 = [v27 isEqual:v29];

      id v10 = v28;
      v14 = v75;

      id v8 = v73;
      if (v71) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    v30 = [v13 pairingUsername];
    [(HMDMatterAccessory *)self setPairingUsername:v30];

    v31 = [v13 publicKey];
    [(HMDMatterAccessory *)self setPublicKey:v31];

    [v77 markChanged];
  }
LABEL_16:
  uint64_t v32 = [v13 accessorySetupHash];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(HMDMatterAccessory *)self setupHash];
    v35 = [v13 accessorySetupHash];
    char v36 = [v34 isEqual:v35];

    if ((v36 & 1) == 0)
    {
      v37 = [v13 accessorySetupHash];
      [(HMDMatterAccessory *)self setSetupHash:v37];

      [v77 markChanged];
    }
  }
  uint64_t v38 = [v13 communicationProtocol];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [v13 communicationProtocol];
    uint64_t v41 = [v40 integerValue];
    int64_t v42 = [(HMDMatterAccessory *)self communicationProtocol];

    if (v41 != v42)
    {
      v43 = [v13 communicationProtocol];
      -[HMDMatterAccessory setCommunicationProtocol:](self, "setCommunicationProtocol:", [v43 integerValue]);

      [v77 markChanged];
    }
  }
  v44 = [v13 roomUUID];

  if (v44)
  {
    id v74 = v8;
    v76 = v14;
    v72 = v10;
    v45 = [(HMDAccessory *)self room];
    v46 = [v45 name];

    id v47 = objc_alloc(MEMORY[0x263F08C38]);
    v48 = [v13 roomUUID];
    v49 = (void *)[v47 initWithUUIDString:v48];

    v50 = (void *)MEMORY[0x230FBD990]();
    v51 = self;
    v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v68 = HMFGetLogIdentifier();
      v69 = [v76 roomWithUUID:v49];
      v67 = [v69 name];
      [(HMDAccessory *)v51 room];
      v54 = v53 = v46;
      [v54 uuid];
      v55 = v70 = v50;
      HMFEqualObjects();

      v46 = v53;
      v56 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      v80 = v68;
      __int16 v81 = 2112;
      v82 = v53;
      __int16 v83 = 2112;
      v84 = v67;
      __int16 v85 = 2112;
      v86 = v56;
      _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@transactionObjectUpdated: old: %@, new:%@, same Room: %@", buf, 0x2Au);

      v50 = v70;
    }

    if (v49)
    {
      v57 = [v72 transactionResult];
      BOOL v58 = -[HMDAccessory _updateRoom:source:](v51, "_updateRoom:source:", v49, [v57 source]);

      if (v58)
      {
        [v77 markChanged];
        [v77 markSaveToAssistant];
      }
    }

    id v10 = v72;
    id v8 = v74;
    v14 = v76;
  }
  v59 = [v10 transactionResult];
  [(HMDMatterAccessory *)self handleUpdatedCHIPPropertiesOnAccessoryModel:v13 actions:v59];

LABEL_30:
  id v60 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v61 = v60;
  }
  else {
    v61 = 0;
  }
  id v62 = v61;

  if (v62)
  {
    v63 = [(HMDMatterAccessory *)self matterAdapter];
    v64 = [v62 uuid];
    v65 = [v63 matterPathWithUUID:v64];

    if (v65)
    {
      [v65 transactionObjectUpdated:v8 newValues:v60 message:v10];
    }
    else
    {
      v66 = [(HMDMatterAccessory *)self matterAdapter];
      [v66 addMatterPathModel:v62 message:v10];
    }
  }
  else
  {
    v78.receiver = self;
    v78.super_class = (Class)HMDMatterAccessory;
    [(HMDAccessory *)&v78 transactionObjectUpdated:v8 newValues:v60 message:v10];
  }
}

- (id)transportReports
{
  return 0;
}

- (void)_registerForMessages
{
  v4.receiver = self;
  v4.super_class = (Class)HMDMatterAccessory;
  [(HMDAccessory *)&v4 _registerForMessages];
  v3 = [(HMDMatterAccessory *)self matterAdapter];
  [v3 registerForMessages];
}

- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v12 primaryResidentMessageRouter];
  [(HMDMatterAccessory *)self setPrimaryResidentMessageRouter:v13];

  v16.receiver = self;
  v16.super_class = (Class)HMDMatterAccessory;
  [(HMDAccessory *)&v16 configureWithHome:v12 msgDispatcher:v11 configurationTracker:v10 initialConfiguration:v6];

  v14 = [(HMDAccessory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__HMDMatterAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v14, block);
}

void __96__HMDMatterAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) matterAdapter];
  [v1 configureMatterAccessory];
}

- (id)pairingIdentity
{
  id v3 = objc_alloc(MEMORY[0x263F425F0]);
  objc_super v4 = [(HMDMatterAccessory *)self publicKey];
  BOOL v5 = (void *)[v3 initWithPairingKeyData:v4];

  id v6 = objc_alloc(MEMORY[0x263F35A78]);
  id v7 = [(HMDAccessory *)self identifier];
  id v8 = (void *)[v6 initWithIdentifier:v7 publicKey:v5 privateKey:0 permissions:0];

  return v8;
}

- (int64_t)reachableTransports
{
  v5.receiver = self;
  v5.super_class = (Class)HMDMatterAccessory;
  int64_t v3 = [(HMDAccessory *)&v5 reachableTransports];
  return v3 | [(HMDAccessory *)self isReachable];
}

- (void)encodeWithCoder:(id)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  int v6 = objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess");
  char v7 = objc_msgSend(v4, "hmd_homeManagerOptions");
  v30.receiver = self;
  v30.super_class = (Class)HMDMatterAccessory;
  [(HMDAccessory *)&v30 encodeWithCoder:v4];
  if ((v7 & 0x20) != 0)
  {
    int v8 = objc_msgSend(v4, "hmd_isForLocalStore");
    if ((objc_msgSend(v4, "hmd_isForXPCTransport") & 1) == 0)
    {
      if (v5)
      {
        if (((objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess") | v8) & 1) == 0) {
          goto LABEL_8;
        }
      }
      else if (!v8)
      {
        goto LABEL_8;
      }
    }
    [(HMDAccessory *)self encodePreferredMediaUser:v4];
  }
LABEL_8:
  id v9 = [(HMDMatterAccessory *)self matterAdapter];
  int v10 = [v9 shouldEncodeNotifications];

  if (v10)
  {
    id v11 = [(HMDMatterAccessory *)self matterAdapter];
    id v12 = [v11 bulletinBoardNotificationByEndpoint];
    [v4 encodeObject:v12 forKey:@"HM.BulletinBoardNotification"];
  }
  [v4 encodeBool:1 forKey:@"paired"];
  BOOL v13 = [(HMDMatterAccessory *)self supportsCHIP];
  [v4 encodeBool:v13 forKey:*MEMORY[0x263F0B738]];
  v14 = [(HMDMatterAccessory *)self matterNodeID];
  [v4 encodeObject:v14 forKey:*MEMORY[0x263F0B3B8]];

  [v4 encodeBool:1 forKey:*MEMORY[0x263F0B7A8]];
  [v4 encodeInteger:1 forKey:@"linkType"];
  [v4 encodeInteger:1 forKey:@"HM.accessoryTransportTypes"];
  uint64_t v15 = [(HMDMatterAccessory *)self chipStorage];
  [v4 encodeObject:v15 forKey:@"HMDMatter.Storage"];

  uint64_t v16 = [(HMDMatterAccessory *)self publicKey];
  if (v16)
  {
    __int16 v17 = (void *)v16;
    uint64_t v18 = [(HMDMatterAccessory *)self pairingUsername];

    if (v18)
    {
      int64_t v19 = [(HMDMatterAccessory *)self publicKey];
      [v4 encodeObject:v19 forKey:@"accessoryPublicKey"];

      v20 = [(HMDMatterAccessory *)self pairingUsername];
      [v4 encodeObject:v20 forKey:@"accessoryPairingUsername"];
    }
  }
  if ((v5 ^ 1 | v6) == 1)
  {
    int64_t v21 = [(HMDMatterAccessory *)self certificationStatus];
    [v4 encodeInteger:v21 forKey:*MEMORY[0x263F0B1E8]];
  }
  if (!v5)
  {
    uint64_t v23 = [(HMDMatterAccessory *)self setupHash];
    [v4 encodeObject:v23 forKey:@"HM.accessorySetupHash"];
LABEL_22:

    goto LABEL_23;
  }
  if (v6)
  {
    BOOL v22 = [(HMDAccessory *)self isReachable]
       || [(HMDAccessory *)self isRemotelyReachable];
    v24 = [HMDAccessoryTransportInformation alloc];
    v25 = [(HMDAccessory *)self identifier];
    uint64_t v23 = [(HMDAccessoryTransportInformation *)v24 initWithServerIdentifier:v25 instanceID:&unk_26E471DD0 linkType:1];

    [v4 encodeInteger:1 forKey:@"HM.accessoryTransportTypes"];
    [v4 encodeBool:v22 forKey:*MEMORY[0x263F0B250]];
    v31[0] = v23;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    [v4 encodeObject:v26 forKey:@"HM.accessoryTransportInformation"];

    BOOL v27 = [(HMDMatterAccessory *)self supportsACWGUWB];
    [v4 encodeBool:v27 forKey:*MEMORY[0x263F0B7D8]];
    BOOL v28 = [(HMDMatterAccessory *)self mfiCertifiedACWG];
    [v4 encodeBool:v28 forKey:*MEMORY[0x263F0B398]];
    v29 = [(HMDMatterAccessory *)self readerGroupSubIdentifierACWG];
    [v4 encodeObject:v29 forKey:*MEMORY[0x263F0B4A8]];

    goto LABEL_22;
  }
LABEL_23:
}

- (HMDMatterAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMDMatterAccessory;
  int v5 = [(HMDAccessory *)&v21 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"accessoryPublicKey"]
      && [v4 containsValueForKey:@"accessoryPairingUsername"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryPublicKey"];
      publicKey = v5->_publicKey;
      v5->_publicKey = (NSData *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryPairingUsername"];
      pairingUsername = v5->_pairingUsername;
      v5->_pairingUsername = (NSString *)v8;
    }
    uint64_t v10 = *MEMORY[0x263F0B1E8];
    if ([v4 containsValueForKey:*MEMORY[0x263F0B1E8]]) {
      v5->_certificationStatus = [v4 decodeIntegerForKey:v10];
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accessorySetupHash"];
    setupHash = v5->_setupHash;
    v5->_setupHash = (NSData *)v11;

    BOOL v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDMatter.Storage"];
    if (v13)
    {
      objc_storeStrong((id *)&v5->_chipStorage, v13);
      uint64_t v14 = [v13 nodeID];
      matterNodeID = v5->_matterNodeID;
      v5->_matterNodeID = (NSNumber *)v14;

      uint64_t v16 = [v13 vendorID];
      matterVendorID = v5->_matterVendorID;
      v5->_matterVendorID = (NSNumber *)v16;

      uint64_t v18 = [v13 productID];
      matterProductID = v5->_matterProductID;
      v5->_matterProductID = (NSNumber *)v18;

      if (v5->_matterVendorID)
      {
        if (v5->_matterProductID) {
          logAndPostNotification(@"HMDAccessoryVendorIDProductIDUpdatedNotification", v5, 0);
        }
      }
    }
  }
  return v5;
}

- (BOOL)supportsCHIP
{
  return 1;
}

- (void)handleIdentifyAccessoryMessage:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDMatterAccessory *)self matterAdapter];
  uint64_t v6 = [v5 mtrCommandPaths];
  char v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_142955);
  id v9 = [v7 endpoint];

  uint64_t v8 = [(HMDMatterAccessory *)self matterAdapter];
  [v8 identifyEndpoint:v9 identifyTime:&unk_26E471DB8 message:v4];
}

BOOL __53__HMDMatterAccessory_handleIdentifyAccessoryMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 cluster];
  BOOL v3 = [v2 unsignedIntValue] == 3;

  return v3;
}

- (BOOL)supportsIdentify
{
  return 1;
}

- (HMDMatterAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v91.receiver = self;
    v91.super_class = (Class)HMDMatterAccessory;
    uint64_t v11 = [(HMDAccessory *)&v91 initWithTransaction:v8 home:v7];
    if (v11)
    {
      uint64_t v12 = +[HMDBulletinBoard sharedBulletinBoard];
      bulletinBoard = v11->_bulletinBoard;
      v11->_bulletinBoard = (HMDBulletinBoard *)v12;

      uint64_t v14 = [v10 chipNodeID];

      if (v14)
      {
        uint64_t v15 = [v10 chipNodeID];
        matterNodeID = v11->_matterNodeID;
        v11->_matterNodeID = (NSNumber *)v15;
      }
      __int16 v17 = [v10 chipVendorID];

      if (v17)
      {
        uint64_t v18 = [v10 chipVendorID];
        matterVendorID = v11->_matterVendorID;
        v11->_matterVendorID = (NSNumber *)v18;
      }
      v20 = [v10 chipProductID];

      if (v20)
      {
        uint64_t v21 = [v10 chipProductID];
        matterProductID = v11->_matterProductID;
        v11->_matterProductID = (NSNumber *)v21;
      }
      uint64_t v23 = [v8 firmwareVersion];

      if (v23)
      {
        v24 = [HMDAccessoryVersion alloc];
        v25 = [v8 firmwareVersion];
        v26 = [(HMDAccessoryVersion *)v24 initWithMatterVersionString:v25];
        [(HMDAccessory *)v11 setFirmwareVersion:v26];
      }
      BOOL v27 = [v10 setProperties];
      int v28 = [v27 containsObject:@"supportedLinkLayerTypes"];

      if (v28)
      {
        uint64_t v29 = [v10 supportedLinkLayerTypes];
        supportedLinkLayerTypes = v11->_supportedLinkLayerTypes;
        v11->_supportedLinkLayerTypes = (NSNumber *)v29;
      }
      v31 = [v10 chipWEDSupport];

      if (v31)
      {
        uint64_t v32 = [v10 chipWEDSupport];
        matterWEDSupport = v11->_matterWEDSupport;
        v11->_matterWEDSupport = (NSNumber *)v32;
      }
      v34 = [v10 chipExtendedMACAddress];

      if (v34)
      {
        uint64_t v35 = [v10 chipExtendedMACAddress];
        matterExtendedMACAddress = v11->_matterExtendedMACAddress;
        v11->_matterExtendedMACAddress = (NSString *)v35;
      }
      v37 = [v10 matterSoftwareVersionNumber];

      if (v37)
      {
        uint64_t v38 = [v10 matterSoftwareVersionNumber];
        matterSoftwareVersionNumber = v11->_matterSoftwareVersionNumber;
        v11->_matterSoftwareVersionNumber = (NSNumber *)v38;
      }
      v40 = [v10 accessorySetupHash];

      if (v40)
      {
        uint64_t v41 = [v10 accessorySetupHash];
        setupHash = v11->_setupHash;
        v11->_setupHash = (NSData *)v41;
      }
      v43 = [v10 publicKey];

      if (v43)
      {
        uint64_t v44 = [v10 publicKey];
        publicKey = v11->_publicKey;
        v11->_publicKey = (NSData *)v44;
      }
      v46 = [v10 pairingUsername];

      if (v46)
      {
        uint64_t v47 = [v10 pairingUsername];
        pairingUsername = v11->_pairingUsername;
        v11->_pairingUsername = (NSString *)v47;
      }
      v49 = [v10 setProperties];
      int v50 = [v49 containsObject:@"certificationStatus"];

      if (v50)
      {
        v51 = [v10 certificationStatus];
        v11->_certificationStatus = [v51 unsignedIntegerValue];
      }
      v52 = [v10 setProperties];
      int v53 = [v52 containsObject:@"communicationProtocol"];

      if (v53)
      {
        v54 = [v10 communicationProtocol];
        v11->_communicationProtocol = [v54 unsignedIntegerValue];
      }
      v55 = [v10 setProperties];
      int v56 = [v55 containsObject:@"supportsMatterAccessCode"];

      if (v56)
      {
        uint64_t v57 = [v10 supportsMatterAccessCode];
        supportsMatterAccessCode = v11->_supportsMatterAccessCode;
        v11->_supportsMatterAccessCode = (NSNumber *)v57;
      }
      v59 = [v10 setProperties];
      int v60 = [v59 containsObject:@"supportsMatterWalletKey"];

      if (v60)
      {
        uint64_t v61 = [v10 supportsMatterWalletKey];
        supportsMatterWalletKey = v11->_supportsMatterWalletKey;
        v11->_supportsMatterWalletKey = (NSNumber *)v61;
      }
      v63 = [v10 setProperties];
      int v64 = [v63 containsObject:@"supportsMatterWeekDaySchedule"];

      if (v64)
      {
        v65 = [v10 supportsMatterWeekDaySchedule];
        v11->_supportsMatterWeekDaySchedule = [v65 BOOLValue];
      }
      v66 = [v10 setProperties];
      int v67 = [v66 containsObject:@"supportsMatterYearDaySchedule"];

      if (v67)
      {
        v68 = [v10 supportsMatterYearDaySchedule];
        v11->_supportsMatterYearDaySchedule = [v68 BOOLValue];
      }
      v69 = [v10 setProperties];
      int v70 = [v69 containsObject:@"supportsMatCredACP"];

      if (v70)
      {
        char v71 = [v10 supportsMatCredACP];
        v11->_supportsACWGProvisioning = [v71 BOOLValue];
      }
      v72 = [v10 setProperties];
      int v73 = [v72 containsObject:@"supportsMatCredACB"];

      if (v73)
      {
        id v74 = [v10 supportsMatCredACB];
        v11->_supportsACWGUWB = [v74 BOOLValue];
      }
      v75 = [v10 setProperties];
      int v76 = [v75 containsObject:@"matCredRGSI"];

      if (v76)
      {
        uint64_t v77 = [v10 matCredRGSI];
        readerGroupSubIdentifierACWG = v11->_readerGroupSubIdentifierACWG;
        v11->_readerGroupSubIdentifierACWG = (NSData *)v77;
      }
      v79 = [v10 setProperties];
      int v80 = [v79 containsObject:@"preexistingMatCredRGI"];

      if (v80)
      {
        uint64_t v81 = [v10 preexistingMatCredRGI];
        preexistingReaderGroupIdentifierACWG = v11->_preexistingReaderGroupIdentifierACWG;
        v11->_preexistingReaderGroupIdentifierACWG = (NSData *)v81;
      }
      [(HMDCHIPAccessoryStorage *)v11->_chipStorage updateUsingAccessoryModel:v10];
      __int16 v83 = [[HMDMatterAccessoryAdapter alloc] initWithAccessory:v11];
      matterAdapter = v11->_matterAdapter;
      v11->_matterAdapter = v83;
    }
    __int16 v85 = v11;
    v86 = v85;
  }
  else
  {
    uint64_t v87 = (void *)MEMORY[0x230FBD990]();
    __int16 v85 = self;
    v88 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      v89 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v93 = v89;
      _os_log_impl(&dword_22F52A000, v88, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize a matter accessory without a matter accessory model.", buf, 0xCu);
    }
    v86 = 0;
  }

  return v86;
}

- (HMDMatterAccessory)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMDMatterAccessory;
  id v2 = [(HMDAccessory *)&v7 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_certificationStatus = 0;
    v2->_communicationProtocol = 2;
    id v4 = objc_alloc_init(HMDCHIPAccessoryStorage);
    chipStorage = v3->_chipStorage;
    v3->_chipStorage = v4;
  }
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_143003 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_143003, &__block_literal_global_78_143004);
  }
  id v2 = (void *)logCategory__hmf_once_v9_143005;
  return v2;
}

void __33__HMDMatterAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v9_143005;
  logCategory__hmf_once_v9_143005 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end