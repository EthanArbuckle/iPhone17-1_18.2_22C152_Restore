@interface HMDSoftwareUpdate
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)modelNamespace;
- (BOOL)allowExtraUpdate;
- (BOOL)hasRegisteredDocumentationMetadata;
- (BOOL)isEqual:(id)a3;
- (HMDAccessory)accessory;
- (HMDSoftwareUpdate)initWithCoder:(id)a3;
- (HMDSoftwareUpdate)initWithModel:(id)a3;
- (HMDSoftwareUpdate)initWithVersion:(id)a3 displayableVersion:(id)a4 downloadSize:(unint64_t)a5 state:(int64_t)a6 installDuration:(double)a7 documentationMetadata:(id)a8 releaseDate:(id)a9;
- (HMDSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 installDuration:(double)a6 documentationMetadata:(id)a7 releaseDate:(id)a8;
- (HMDSoftwareUpdateDataSource)dataSource;
- (HMDSoftwareUpdateModel)model;
- (HMFMessageDispatcher)messageDispatcher;
- (HMFSoftwareVersion)version;
- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata;
- (NSDate)releaseDate;
- (NSString)displayableVersion;
- (NSString)propertyDescription;
- (NSUUID)identifier;
- (OS_dispatch_queue)messageReceiveQueue;
- (double)installDuration;
- (id)logIdentifier;
- (id)messageDestination;
- (id)transactionWithObjectChangeType:(unint64_t)a3;
- (id)transactionWithObjectChangeType:(unint64_t)a3 forAccessoryUUID:(id)a4;
- (int64_t)state;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (unint64_t)needsAttentionReasons;
- (unint64_t)updateType;
- (void)_handleDocumentationRequest:(id)a3;
- (void)_handleDocumentationStateNotification:(id)a3;
- (void)_handleNeedsAttentionReasonsRequest:(id)a3;
- (void)_handleUpdateDocumentationMetadata:(id)a3;
- (void)_handleUpdateState:(id)a3;
- (void)_updateState:(int64_t)a3 message:(id)a4 options:(id)a5;
- (void)configureWithAccessory:(id)a3 dataSource:(id)a4 messageDispatcher:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)registerForMessages;
- (void)setAccessory:(id)a3;
- (void)setAllowExtraUpdate:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDocumentationMetadata:(id)a3;
- (void)setHasRegisteredDocumentationMetadata:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setNeedsAttentionReasons:(unint64_t)a3;
- (void)setReleaseDate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUpdateType:(unint64_t)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateLocalState:(int64_t)a3;
@end

@implementation HMDSoftwareUpdate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_displayableVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_documentationMetadata, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAccessory:(id)a3
{
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDSoftwareUpdateDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDSoftwareUpdateDataSource *)WeakRetained;
}

- (void)setAllowExtraUpdate:(BOOL)a3
{
  self->_allowExtraUpdate = a3;
}

- (BOOL)allowExtraUpdate
{
  return self->_allowExtraUpdate;
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (double)installDuration
{
  return self->_installDuration;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (NSString)displayableVersion
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (HMFSoftwareVersion)version
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  v4 = [(HMDSoftwareUpdate *)self identifier];
  [v17 encodeObject:v4 forKey:*MEMORY[0x1E4F2E0B0]];

  v5 = [(HMDSoftwareUpdate *)self version];
  [v17 encodeObject:v5 forKey:*MEMORY[0x1E4F2E158]];

  v6 = [(HMDSoftwareUpdate *)self displayableVersion];
  [v17 encodeObject:v6 forKey:*MEMORY[0x1E4F2E078]];

  int64_t v7 = [(HMDSoftwareUpdate *)self state];
  [v17 encodeInteger:v7 forKey:*MEMORY[0x1E4F2E130]];
  unint64_t v8 = [(HMDSoftwareUpdate *)self downloadSize];
  [v17 encodeInt64:v8 forKey:*MEMORY[0x1E4F2E0A8]];
  [(HMDSoftwareUpdate *)self installDuration];
  [v17 encodeInteger:(uint64_t)v9 forKey:*MEMORY[0x1E4F2E0B8]];
  v10 = [(HMDSoftwareUpdate *)self documentationMetadata];
  [v17 encodeObject:v10 forKey:*MEMORY[0x1E4F2E090]];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSoftwareUpdate updateType](self, "updateType"));
  [v17 encodeObject:v11 forKey:*MEMORY[0x1E4F2E150]];

  v12 = [(HMDSoftwareUpdate *)self releaseDate];
  [v17 encodeObject:v12 forKey:*MEMORY[0x1E4F2E118]];

  if (objc_msgSend(v17, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    v13 = +[HMDSoftwareUpdateDocumentationManager sharedManager];
    v14 = [(HMDSoftwareUpdate *)self documentationMetadata];
    v15 = [v13 assetForDocumentationMetadata:v14];

    v16 = [v15 documentation];
    [v17 encodeObject:v16 forKey:*MEMORY[0x1E4F2E080]];
  }
}

- (HMDSoftwareUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E158]];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E078]];
  if (!v6)
  {
    v6 = [v5 shortVersionString];
  }
  uint64_t v7 = [v4 decodeInt64ForKey:*MEMORY[0x1E4F2E0A8]];
  uint64_t v8 = [v4 decodeIntegerForKey:*MEMORY[0x1E4F2E130]];
  double v9 = (double)[v4 decodeIntegerForKey:*MEMORY[0x1E4F2E0B8]];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E090]];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E118]];
  v12 = [(HMDSoftwareUpdate *)self initWithVersion:v5 displayableVersion:v6 downloadSize:v7 state:v8 installDuration:v10 documentationMetadata:v11 releaseDate:v9];
  if (v12)
  {
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E0B0]];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;
  }
  return v12;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMDSoftwareUpdate *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (id)logIdentifier
{
  v2 = [(HMDSoftwareUpdate *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    v14 = self;
    id v15 = v13;
    id v16 = v10;
    v80 = [v16 transactionResult];
    id v17 = [v15 state];

    if (v17)
    {
      v18 = [v15 state];
      uint64_t v19 = [v18 unsignedIntegerValue];

      if (v19 != [(HMDSoftwareUpdate *)v14 state])
      {
        id v71 = v10;
        id v74 = v8;
        v20 = (void *)MEMORY[0x1D9452090]();
        v77 = v14;
        v21 = v14;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = HMFGetLogIdentifier();
          v24 = HMSoftwareUpdateStateToString();
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v23;
          __int16 v82 = 2112;
          v83 = v24;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating state: %@", buf, 0x16u);
        }
        [(HMDSoftwareUpdate *)v21 setState:v19];
        v25 = (void *)MEMORY[0x1E4F654B0];
        uint64_t v26 = *MEMORY[0x1E4F2E148];
        v27 = v21;
        v28 = [v16 identifier];
        v86[0] = *MEMORY[0x1E4F2E138];
        v29 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSoftwareUpdate state](v27, "state"));
        *(void *)buf = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v86 count:1];
        v31 = [v25 entitledMessageWithName:v26 identifier:v28 messagePayload:v30];

        v32 = [(HMDSoftwareUpdate *)v27 messageDestination];

        [v31 setDestination:v32];
        v33 = (void *)[v31 copy];

        v34 = [(HMDSoftwareUpdate *)v27 messageDispatcher];
        [v34 sendMessage:v33 completionHandler:0];

        [v80 markChanged];
        id v10 = v71;
        id v8 = v74;
        v14 = v77;
      }
    }
    if ([v15 propertyWasSet:@"documentationMetadata"])
    {
      v35 = [v15 documentationMetadata];
      v36 = [(HMDSoftwareUpdate *)v14 documentationMetadata];
      char v37 = HMFEqualObjects();

      if ((v37 & 1) == 0)
      {
        id v75 = v8;
        uint64_t v38 = MEMORY[0x1D9452090]();
        v39 = v14;
        v40 = (void *)v38;
        v78 = v39;
        v41 = v39;
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = id v43 = v10;
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v44;
          __int16 v82 = 2112;
          v83 = v35;
          _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Updating documentation metadata: %@", buf, 0x16u);

          id v10 = v43;
        }

        [(HMDSoftwareUpdate *)v41 setDocumentationMetadata:v35];
        id v45 = v35;
        v46 = (void *)MEMORY[0x1E4F654B0];
        uint64_t v68 = *MEMORY[0x1E4F2E140];
        v47 = v41;
        v48 = [v16 identifier];
        v86[0] = *MEMORY[0x1E4F2E098];
        v70 = v45;
        id v72 = v10;
        if (v45) {
          encodeRootObjectForIncomingXPCMessage(v45, 0);
        }
        else {
        v51 = [MEMORY[0x1E4F1CA98] null];
        }
        *(void *)buf = v51;
        v52 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", buf, v86, 1, v68);
        v53 = [v46 entitledMessageWithName:v69 identifier:v48 messagePayload:v52];

        v54 = [(HMDSoftwareUpdate *)v47 messageDestination];

        [v53 setDestination:v54];
        v55 = (void *)[v53 copy];

        v56 = [(HMDSoftwareUpdate *)v47 messageDispatcher];
        [v56 sendMessage:v55 completionHandler:0];

        [v80 markChanged];
        id v10 = v72;
        id v8 = v75;
        v14 = v78;
      }
    }
    v57 = [v15 releaseDate];

    if (v57)
    {
      v58 = [v15 releaseDate];
      v59 = [(HMDSoftwareUpdate *)v14 releaseDate];
      char v60 = [v58 isEqualToDate:v59];

      if ((v60 & 1) == 0)
      {
        v61 = (void *)MEMORY[0x1D9452090]();
        v79 = v14;
        v62 = v14;
        v63 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v64 = id v73 = v10;
          [(HMDSoftwareUpdate *)v62 releaseDate];
          v65 = id v76 = v8;
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v64;
          __int16 v82 = 2112;
          v83 = v65;
          __int16 v84 = 2112;
          v85 = v58;
          _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_INFO, "%{public}@Updating releaseDate from %@ to %@", buf, 0x20u);

          id v8 = v76;
          id v10 = v73;
        }

        [(HMDSoftwareUpdate *)v62 setReleaseDate:v58];
        [v80 markChanged];
        v14 = v79;
      }
    }
    v66 = [v16 responseHandler];

    if (v66)
    {
      v67 = [v16 responseHandler];
      v67[2](v67, 0, 0);
    }
  }
  else
  {
    v49 = [v10 responseHandler];
    v50 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(void, void *, void))v49)[2](v49, v50, 0);
  }
}

- (id)transactionWithObjectChangeType:(unint64_t)a3 forAccessoryUUID:(id)a4
{
  v5 = (void *)[a4 copy];
  id v6 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  objc_msgSend(v5, "getUUIDBytes:", objc_msgSend(v6, "mutableBytes"));
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  id v8 = +[HMDSoftwareUpdate modelNamespace];
  id v9 = (void *)[v7 initWithNamespace:v8 data:v6];

  id v10 = [(HMDBackingStoreModelObject *)[HMDSoftwareUpdateModel alloc] initWithObjectChangeType:a3 uuid:v9 parentUUID:v5];
  return v10;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  id v4 = [(HMDSoftwareUpdate *)self accessory];
  v5 = [v4 uuid];

  id v6 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  objc_msgSend(v5, "getUUIDBytes:", objc_msgSend(v6, "mutableBytes"));
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  id v8 = +[HMDSoftwareUpdate modelNamespace];
  id v9 = (void *)[v7 initWithNamespace:v8 data:v6];

  id v10 = [(HMDBackingStoreModelObject *)[HMDSoftwareUpdateModel alloc] initWithObjectChangeType:a3 uuid:v9 parentUUID:v5];
  return v10;
}

- (HMDSoftwareUpdateModel)model
{
  id v3 = [(HMDSoftwareUpdate *)self transactionWithObjectChangeType:0];
  id v4 = [(HMDSoftwareUpdate *)self version];
  [v3 setSoftwareVersion:v4];

  v5 = [(HMDSoftwareUpdate *)self displayableVersion];
  [v3 setDisplayableSoftwareVersion:v5];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSoftwareUpdate state](self, "state"));
  [v3 setState:v6];

  id v7 = NSNumber;
  [(HMDSoftwareUpdate *)self installDuration];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setInstallDuration:v8];

  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDSoftwareUpdate downloadSize](self, "downloadSize"));
  [v3 setDownloadSize:v9];

  id v10 = [(HMDSoftwareUpdate *)self releaseDate];
  [v3 setReleaseDate:v10];

  id v11 = [(HMDSoftwareUpdate *)self documentationMetadata];

  if (v11)
  {
    v12 = [(HMDSoftwareUpdate *)self documentationMetadata];
    id v13 = (void *)[v12 copy];
    [v3 setDocumentationMetadata:v13];
  }
  return (HMDSoftwareUpdateModel *)v3;
}

- (void)setReleaseDate:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  if (![(NSDate *)self->_releaseDate isEqualToDate:v6])
  {
    id v4 = (NSDate *)[v6 copy];
    releaseDate = self->_releaseDate;
    self->_releaseDate = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)releaseDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSDate *)self->_releaseDate copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDate *)v4;
}

- (void)_handleNeedsAttentionReasonsRequest:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 responseHandler];

  if (v5)
  {
    uint64_t v21 = *MEMORY[0x1E4F2E108];
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSoftwareUpdate needsAttentionReasons](self, "needsAttentionReasons"));
    v22[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *MEMORY[0x1E4F2E128];
      int v15 = 138543874;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending %@ reply with payload %@", (uint8_t *)&v15, 0x20u);
    }
    id v13 = [v4 responseHandler];
    v14 = (void *)[v7 copy];
    ((void (**)(void, void, void *))v13)[2](v13, 0, v14);
  }
}

- (void)setNeedsAttentionReasons:(unint64_t)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_needsAttentionReasons == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_needsAttentionReasons = a3;
    os_unfair_lock_unlock(p_lock);
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = HMSoftwareUpdateNeedsAttentionReasonsToString();
      int v23 = 138543618;
      v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@NeedsAttentionReasons updated to %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v29 = *MEMORY[0x1E4F2E108];
    id v11 = [NSNumber numberWithUnsignedInteger:a3];
    v30[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

    id v13 = objc_alloc(MEMORY[0x1E4F65488]);
    v14 = [(HMDSoftwareUpdate *)v7 identifier];
    int v15 = (void *)[v13 initWithTarget:v14];

    id v16 = (void *)*MEMORY[0x1E4F2E100];
    __int16 v17 = [MEMORY[0x1E4F654B0] messageWithName:*MEMORY[0x1E4F2E100] destination:v15 payload:v12];
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = v7;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v23 = 138543874;
      v24 = v21;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ to %@", (uint8_t *)&v23, 0x20u);
    }
    v22 = [(HMDSoftwareUpdate *)v19 messageDispatcher];
    [v22 sendMessage:v17 completionHandler:0];
  }
}

- (unint64_t)needsAttentionReasons
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t needsAttentionReasons = self->_needsAttentionReasons;
  os_unfair_lock_unlock(p_lock);
  return needsAttentionReasons;
}

- (void)setUpdateType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_updateType != a3) {
    self->_updateType = a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)updateType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t updateType = self->_updateType;
  os_unfair_lock_unlock(p_lock);
  return updateType;
}

- (void)_handleDocumentationStateNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HMDSoftwareUpdate__handleDocumentationStateNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __59__HMDSoftwareUpdate__handleDocumentationStateNotification___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  v5 = [v4 metadata];
  id v6 = [*(id *)(a1 + 40) documentationMetadata];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) userInfo];
    id v9 = objc_msgSend(v8, "hmf_numberForKey:", @"state");

    if (v9 && [v9 integerValue] == 4)
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = *(id *)(a1 + 40);
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v27 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification documentation is available, notifying clients", buf, 0xCu);
      }
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"SUDocumentation"];
      int v15 = [v4 documentation];
      id v16 = v15;
      if (v15)
      {
        uint64_t v24 = *MEMORY[0x1E4F2E088];
        __int16 v17 = encodeRootObjectForIncomingXPCMessage(v15, 0);
        __int16 v25 = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

        __int16 v19 = objc_msgSend(MEMORY[0x1E4F654B0], "entitledMessageWithName:messagePayload:", *MEMORY[0x1E4F2E0A0], v18, v24);
        v20 = [*(id *)(a1 + 40) messageDestination];
        [v19 setDestination:v20];

        uint64_t v21 = [*(id *)(a1 + 40) messageDispatcher];
        [v21 sendMessage:v19 completionHandler:0];

        v22 = [*(id *)(a1 + 40) dataSource];
        int v23 = [*(id *)(a1 + 40) identifier];
        [v22 updateGenerationCounterWithReason:@"SoftwareUpdateDocumentationCached" sourceUUID:v23 shouldNotifyClients:0];
      }
    }
  }
}

- (void)_handleDocumentationRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDSoftwareUpdate *)self documentationMetadata];
  if (v5)
  {
    id v6 = +[HMDSoftwareUpdateDocumentationManager sharedManager];
    int v7 = [v6 assetForDocumentationMetadata:v5];

    if (!v7)
    {
      id v16 = (void *)MEMORY[0x1D9452090]();
      __int16 v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v27 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Missing asset", buf, 0xCu);
      }
      int v7 = [v4 responseHandler];

      if (v7)
      {
        v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        uint64_t v21 = [v4 responseHandler];
        ((void (**)(void, void *, void))v21)[2](v21, v20, 0);

        int v7 = 0;
      }
      goto LABEL_17;
    }
    if ([v7 state] <= 1 && (objc_msgSend(v7, "isDownloadPermitted") & 1) == 0)
    {
      id v9 = objc_msgSend(v7, "nextPermittedDownloadDate", *MEMORY[0x1E4F2E110]);
      __int16 v25 = v9;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      int v23 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3201];
      [v4 respondWithPayload:v22 error:v23];

      goto LABEL_12;
    }
    [v7 startCaching];
    id v8 = [v4 responseHandler];

    if (!v8)
    {
LABEL_17:

      goto LABEL_18;
    }
    id v9 = [v4 responseHandler];
    id v10 = (void (*)(void))v9[2];
LABEL_11:
    v10();
LABEL_12:

    goto LABEL_17;
  }
  id v11 = (void *)MEMORY[0x1D9452090]();
  uint64_t v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot get documentation without documentation metadata", buf, 0xCu);
  }
  int v15 = [v4 responseHandler];

  if (v15)
  {
    int v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    id v9 = [v4 responseHandler];
    id v10 = (void (*)(void))v9[2];
    goto LABEL_11;
  }
LABEL_18:
}

- (void)_handleUpdateDocumentationMetadata:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (__shouldAcceptMessage(self, v4))
  {
    uint64_t v5 = *MEMORY[0x1E4F2E098];
    id v6 = [v4 nullForKey:*MEMORY[0x1E4F2E098]];

    if (v6)
    {
      int v7 = 0;
      goto LABEL_4;
    }
    uint64_t v22 = [v4 dataForKey:v5];
    if (v22)
    {
      int v15 = (void (**)(void, void, void))v22;
      id v39 = 0;
      int v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v22 error:&v39];
      id v23 = v39;
      uint64_t v24 = v23;
      if (v7)
      {

LABEL_4:
        id v8 = (void *)MEMORY[0x1D9452090]();
        id v9 = self;
        id v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v41 = v11;
          __int16 v42 = 2112;
          id v43 = v7;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updating with documentation metadata: %@", buf, 0x16u);
        }
        uint64_t v12 = [(HMDSoftwareUpdate *)v9 documentationMetadata];
        char v13 = HMFEqualObjects();

        if (v13)
        {
          v14 = [v4 responseHandler];

          if (!v14)
          {
LABEL_24:

            goto LABEL_25;
          }
          int v15 = [v4 responseHandler];
          v15[2](v15, 0, 0);
        }
        else
        {
          int v15 = [(HMDSoftwareUpdate *)v9 transactionWithObjectChangeType:2];
          [v15 setDocumentationMetadata:v7];
          id v16 = [(HMDSoftwareUpdate *)v9 accessory];
          __int16 v17 = [v16 home];
          uint64_t v18 = [v17 backingStore];
          __int16 v19 = [v4 name];
          v20 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
          uint64_t v21 = [v18 transaction:v19 options:v20];

          [v21 add:v15 withMessage:v4];
          [v21 run];
        }
LABEL_23:

        goto LABEL_24;
      }
      v32 = (void *)MEMORY[0x1D9452090]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v41 = v35;
        __int16 v42 = 2112;
        id v43 = v24;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation metadata from metadata data: %@", buf, 0x16u);
      }
      v36 = [v4 responseHandler];

      if (v36)
      {
        char v37 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        uint64_t v38 = [v4 responseHandler];
        ((void (**)(void, void *, void))v38)[2](v38, v37, 0);
      }
    }
    else
    {
      __int16 v25 = (void *)MEMORY[0x1D9452090]();
      uint64_t v26 = self;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        uint64_t v29 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v41 = v28;
        __int16 v42 = 2112;
        id v43 = v29;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Missing documentation metadata from message payload: %@", buf, 0x16u);
      }
      v30 = [v4 responseHandler];

      if (!v30)
      {
        int v7 = 0;
        goto LABEL_24;
      }
      int v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v31 = [v4 responseHandler];
      v31[2](v31, v15, 0);
    }
    int v7 = 0;
    goto LABEL_23;
  }
LABEL_25:
}

- (void)setHasRegisteredDocumentationMetadata:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasRegisteredDocumentationMetadata = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasRegisteredDocumentationMetadata
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasRegisteredDocumentationMetadata;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDocumentationMetadata:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id v6 = self->_documentationMetadata;
  if (HMFEqualObjects())
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_documentationMetadata, a3);
    os_unfair_lock_unlock(&self->_lock);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HMDSoftwareUpdate_setDocumentationMetadata___block_invoke;
    block[3] = &unk_1E6A19668;
    block[4] = self;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(queue, block);
  }
}

void __46__HMDSoftwareUpdate_setDocumentationMetadata___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Updated documentation metadata: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = a1[4];
  if (a1[5])
  {
    [v7 setHasRegisteredDocumentationMetadata:1];
    __registerDocumentationMetadata(a1[4], a1[5]);
  }
  else
  {
    __unregisterDocumentationMetadata(v7, a1[6]);
    [a1[4] setHasRegisteredDocumentationMetadata:0];
  }
}

- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_documentationMetadata;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_handleUpdateState:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (__shouldAcceptMessage(self, v4))
  {
    id v5 = [v4 numberForKey:*MEMORY[0x1E4F2E138]];
    id v6 = v5;
    if (v5)
    {
      unint64_t v7 = [v5 integerValue];
      if (v7 < 6)
      {
        int v8 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
        [(HMDSoftwareUpdate *)self _updateState:v7 message:v4 options:v8];
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      __int16 v17 = (void *)MEMORY[0x1D9452090]();
      uint64_t v18 = self;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = HMFGetLogIdentifier();
        int v23 = 138543618;
        uint64_t v24 = v20;
        __int16 v25 = 2048;
        unint64_t v26 = v7;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid state: %ld", (uint8_t *)&v23, 0x16u);
      }
      uint64_t v21 = [v4 responseHandler];

      if (!v21) {
        goto LABEL_15;
      }
      int v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = 43;
    }
    else
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      __int16 v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        char v13 = [v4 messagePayload];
        int v23 = 138543618;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        unint64_t v26 = (unint64_t)v13;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing state from message payload: %@", (uint8_t *)&v23, 0x16u);
      }
      v14 = [v4 responseHandler];

      if (!v14) {
        goto LABEL_15;
      }
      int v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = 3;
    }
    int v8 = [v15 hmErrorWithCode:v16];
    uint64_t v22 = [v4 responseHandler];
    ((void (**)(void, void *, void))v22)[2](v22, v8, 0);

    goto LABEL_14;
  }
LABEL_16:
}

- (void)_updateState:(int64_t)a3 message:(id)a4 options:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = HMFGetLogIdentifier();
    v14 = HMSoftwareUpdateStateToString();
    [(HMDSoftwareUpdate *)v11 state];
    int v15 = HMSoftwareUpdateStateToString();
    int v28 = 138543874;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    v31 = v14;
    __int16 v32 = 2112;
    v33 = v15;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updating state: %@ from current state: %@", (uint8_t *)&v28, 0x20u);
  }
  if (a3 == 3 && ![(HMDSoftwareUpdate *)v11 allowExtraUpdate]) {
    [(HMDSoftwareUpdate *)v11 setAllowExtraUpdate:1];
  }
  if ([(HMDSoftwareUpdate *)v11 state] == a3 && ![(HMDSoftwareUpdate *)v11 allowExtraUpdate])
  {
    uint64_t v27 = [v8 responseHandler];

    if (!v27) {
      goto LABEL_20;
    }
    uint64_t v16 = [v8 responseHandler];
    v16[2](v16, 0, 0);
  }
  else
  {
    uint64_t v16 = [(HMDSoftwareUpdate *)v11 transactionWithObjectChangeType:2];
    __int16 v17 = [NSNumber numberWithInteger:a3];
    [v16 setState:v17];

    uint64_t v18 = [(HMDSoftwareUpdate *)v11 accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v19 = v18;
    }
    else {
      __int16 v19 = 0;
    }
    id v20 = v19;
    if (v20 && ([v18 isCurrentAccessory] & 1) != 0) {
      uint64_t v21 = &HMDAppleMediaAccessorySoftwareUpdateLabel;
    }
    else {
      uint64_t v21 = &HMDAccessorySoftwareUpdateLabel;
    }
    uint64_t v22 = *v21;

    int v23 = [v18 home];
    uint64_t v24 = [v23 backingStore];
    __int16 v25 = [v24 transaction:v22 options:v9];

    [v25 add:v16 withMessage:v8];
    [v25 run];
    BOOL v26 = [(HMDSoftwareUpdate *)v11 allowExtraUpdate];
    if (a3 != 3 && v26) {
      [(HMDSoftwareUpdate *)v11 setAllowExtraUpdate:0];
    }
  }
LABEL_20:
}

- (void)updateLocalState:(int64_t)a3
{
  id v5 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
  [(HMDSoftwareUpdate *)self _updateState:a3 message:0 options:v5];
}

- (void)setState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_state == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_state = a3;
    os_unfair_lock_unlock(p_lock);
    id v7 = [(HMDSoftwareUpdate *)self accessory];
    id v6 = [v7 home];
    [v6 reevaluateAccessoryInfo];
  }
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)registerForMessages
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDSoftwareUpdate *)self accessory];
  id v4 = [v3 home];
  id v5 = [(HMDSoftwareUpdate *)self messageDispatcher];
  id v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  if (([v3 isCurrentAccessory] & 1) != 0 || objc_msgSend(v3, "supportsFirmwareUpdate"))
  {
    v13[0] = v6;
    id v7 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v13[1] = v7;
    id v8 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:3 remoteAccessRequired:0];
    v13[2] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];

    [v5 registerForMessage:*MEMORY[0x1E4F2E148] receiver:self policies:v9 selector:sel__handleUpdateState_];
    [v5 registerForMessage:*MEMORY[0x1E4F2E140] receiver:self policies:v9 selector:sel__handleUpdateDocumentationMetadata_];
  }
  __int16 v10 = +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0, v6);
  v12[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  [v5 registerForMessage:*MEMORY[0x1E4F2E120] receiver:self policies:v11 selector:sel__handleDocumentationRequest_];
  [v5 registerForMessage:*MEMORY[0x1E4F2E128] receiver:self policies:v11 selector:sel__handleNeedsAttentionReasonsRequest_];
}

- (void)invalidate
{
  id v3 = [(HMDSoftwareUpdate *)self documentationMetadata];
  __unregisterDocumentationMetadata(self, v3);
}

- (void)configureWithAccessory:(id)a3 dataSource:(id)a4 messageDispatcher:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v32 = 138543362;
      v33 = v21;
      uint64_t v22 = "%{public}@Missing data source";
LABEL_15:
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v32, 0xCu);
    }
LABEL_16:

    goto LABEL_28;
  }
  if (!v8)
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v32 = 138543362;
      v33 = v21;
      uint64_t v22 = "%{public}@Missing accessory for update";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  [(HMDSoftwareUpdate *)self setDataSource:v9];
  [(HMDSoftwareUpdate *)self setAccessory:v8];
  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  id v14 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v15 = v14;
  }
  else {
    int v15 = 0;
  }
  id v16 = v15;

  if (v13)
  {
    uint64_t v17 = 1;
  }
  else if (v16)
  {
    if ([v16 isAppleAccessory]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 3;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  [(HMDSoftwareUpdate *)self setUpdateType:v17];
  int v23 = [(HMDSoftwareUpdate *)self identifier];

  if (!v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F29128]);
    __int16 v25 = [v14 uuid];
    BOOL v26 = [(HMDSoftwareUpdate *)self version];
    uint64_t v27 = [v26 versionString];
    int v28 = [v27 dataUsingEncoding:4];
    uint64_t v29 = (void *)[v24 initWithNamespace:v25 data:v28];
    [(HMDSoftwareUpdate *)self setIdentifier:v29];
  }
  if (v10)
  {
    [(HMDSoftwareUpdate *)self setMessageDispatcher:v10];
    __int16 v30 = [(HMDSoftwareUpdate *)self identifier];

    if (v30) {
      [(HMDSoftwareUpdate *)self registerForMessages];
    }
  }
  [(HMDSoftwareUpdate *)self setHasRegisteredDocumentationMetadata:1];
  v31 = [(HMDSoftwareUpdate *)self documentationMetadata];
  __registerDocumentationMetadata(self, v31);

LABEL_28:
}

- (NSString)propertyDescription
{
  id v3 = [(HMDSoftwareUpdate *)self releaseDate];
  id v4 = NSString;
  id v5 = [(HMDSoftwareUpdate *)self version];
  id v6 = [v5 versionString];
  id v7 = [(HMDSoftwareUpdate *)self displayableVersion];
  [(HMDSoftwareUpdate *)self state];
  id v8 = HMSoftwareUpdateStateToString();
  [(HMDSoftwareUpdate *)self downloadSize];
  id v9 = NSLocalizedFileSizeDescription();
  [(HMDSoftwareUpdate *)self updateType];
  id v10 = HMSoftwareUpdateUpdateTypeToString();
  id v11 = [v4 stringWithFormat:@", Version = %@, Displayable Version = %@, State = %@, Download Size = %@, Release Date = %@, Update Type = %@", v6, v7, v8, v9, v3, v10];

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDSoftwareUpdate *)a3;
  if (self == v4)
  {
    char v9 = 1;
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
    id v6 = v5;
    if (v6)
    {
      id v7 = [(HMDSoftwareUpdate *)self version];
      id v8 = [(HMDSoftwareUpdate *)v6 version];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDSoftwareUpdate *)self version];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  unint64_t v3 = [(HMDSoftwareUpdate *)self documentationMetadata];
  if (v3 && [(HMDSoftwareUpdate *)self hasRegisteredDocumentationMetadata])
  {
    id v4 = +[HMDSoftwareUpdateDocumentationManager sharedManager];
    [v4 unregisterDocumentationMetadata:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)HMDSoftwareUpdate;
  [(HMDSoftwareUpdate *)&v5 dealloc];
}

- (HMDSoftwareUpdate)initWithVersion:(id)a3 displayableVersion:(id)a4 downloadSize:(unint64_t)a5 state:(int64_t)a6 installDuration:(double)a7 documentationMetadata:(id)a8 releaseDate:(id)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = a9;
  v36.receiver = self;
  v36.super_class = (Class)HMDSoftwareUpdate;
  uint64_t v21 = [(HMDSoftwareUpdate *)&v36 init];
  if (v21)
  {
    int64_t v33 = a6;
    id v34 = v20;
    uint64_t v22 = v17;
    unint64_t v23 = a5;
    id v35 = v19;
    HMDispatchQueueNameString();
    id v24 = objc_claimAutoreleasedReturnValue();
    __int16 v25 = (const char *)[v24 UTF8String];
    BOOL v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create(v25, v26);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v27;

    objc_storeStrong((id *)&v21->_version, a3);
    if (v18)
    {
      uint64_t v29 = objc_msgSend(v18, "hm_truncatedDisplayableVersionString");
      displayableVersion = v21->_displayableVersion;
      v21->_displayableVersion = (NSString *)v29;
      id v17 = v22;
    }
    else
    {
      id v17 = v22;
      uint64_t v31 = [v22 shortVersionString];
      displayableVersion = v21->_displayableVersion;
      v21->_displayableVersion = (NSString *)v31;
    }

    v21->_int64_t state = v33;
    v21->_downloadSize = v23;
    v21->_installDuration = a7;
    objc_storeStrong((id *)&v21->_documentationMetadata, a8);
    v21->_unint64_t updateType = 0;
    objc_storeStrong((id *)&v21->_releaseDate, a9);
    id v20 = v34;
    id v19 = v35;
  }

  return v21;
}

- (HMDSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 installDuration:(double)a6 documentationMetadata:(id)a7 releaseDate:(id)a8
{
  return [(HMDSoftwareUpdate *)self initWithVersion:a3 displayableVersion:0 downloadSize:a4 state:a5 installDuration:a7 documentationMetadata:a8 releaseDate:a6];
}

- (HMDSoftwareUpdate)initWithModel:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 softwareVersion];

  if (v5)
  {
    uint64_t v6 = [v4 displayableSoftwareVersion];
    if (!v6)
    {
      id v7 = [v4 softwareVersion];
      uint64_t v6 = [v7 shortVersionString];
    }
    id v8 = [v4 softwareVersion];
    char v9 = [v4 downloadSize];
    [v9 unsignedLongLongValue];
    id v10 = [v4 state];
    [v10 integerValue];
    id v11 = [v4 installDuration];
    double v12 = (double)[v11 integerValue];
    id v13 = [v4 documentationMetadata];
    uint64_t v14 = [v4 releaseDate];
    int v15 = (void *)v6;
    id v16 = (void *)v14;
    uint64_t v29 = v15;
    id v17 = -[HMDSoftwareUpdate initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", v8, v12);

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F29128]);
      id v19 = [v4 parentUUID];
      id v20 = [(HMFSoftwareVersion *)v17->_version versionString];
      uint64_t v21 = [v20 dataUsingEncoding:4];
      uint64_t v22 = [v18 initWithNamespace:v19 data:v21];
      identifier = v17->_identifier;
      v17->_identifier = (NSUUID *)v22;
    }
    self = v17;

    id v24 = self;
  }
  else
  {
    __int16 v25 = (void *)MEMORY[0x1D9452090]();
    BOOL v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      dispatch_queue_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Software version is required", buf, 0xCu);
    }
    id v24 = 0;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t40_84002 != -1) {
    dispatch_once(&logCategory__hmf_once_t40_84002, &__block_literal_global_46_84003);
  }
  v2 = (void *)logCategory__hmf_once_v41_84004;
  return v2;
}

uint64_t __32__HMDSoftwareUpdate_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v41_84004;
  logCategory__hmf_once_v41_84004 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)modelNamespace
{
  if (modelNamespace_onceToken_84009 != -1) {
    dispatch_once(&modelNamespace_onceToken_84009, &__block_literal_global_84010);
  }
  v2 = (void *)modelNamespace_namespace_84011;
  return v2;
}

uint64_t __35__HMDSoftwareUpdate_modelNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AE2B13F5-9554-489C-BFE0-C6740C4E70B7"];
  uint64_t v1 = modelNamespace_namespace_84011;
  modelNamespace_namespace_84011 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end