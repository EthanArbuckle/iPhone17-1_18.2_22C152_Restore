@interface HMSoftwareUpdate
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isDocumentationAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMFSoftwareVersion)version;
- (HMSoftwareUpdate)init;
- (HMSoftwareUpdate)initWithCoder:(id)a3;
- (HMSoftwareUpdate)initWithVersion:(id)a3 displayableVersion:(id)a4 downloadSize:(unint64_t)a5 state:(int64_t)a6 installDuration:(double)a7 documentationMetadata:(id)a8 releaseDate:(id)a9;
- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4;
- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5;
- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 documentationMetadata:(id)a6;
- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 installDuration:(double)a6 documentationMetadata:(id)a7;
- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 installDuration:(double)a6 documentationMetadata:(id)a7 releaseDate:(id)a8;
- (HMSoftwareUpdateDelegate)delegate;
- (HMSoftwareUpdateDocumentation)documentation;
- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata;
- (NSDate)nextPermittedRequestDocumentationDate;
- (NSDate)releaseDate;
- (NSString)description;
- (NSString)displayableVersion;
- (NSUUID)identifier;
- (NSUUID)uniqueIdentifier;
- (_HMContext)context;
- (double)installDuration;
- (id)logIdentifier;
- (id)messageDestination;
- (int64_t)state;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (unint64_t)needsAttentionReasons;
- (unint64_t)updateType;
- (void)_handleUpdatedDocumentation:(id)a3;
- (void)_handleUpdatedDocumentationMetadata:(id)a3;
- (void)_handleUpdatedNeedsAttentionReasonsMessage:(id)a3;
- (void)_handleUpdatedState:(id)a3;
- (void)_registerNotificationHandlers;
- (void)_requestNeedsAttentionReasonsWithCompletionHandler:(id)a3;
- (void)_unconfigure;
- (void)configureWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchNeedsAttentionReasonsWithCompletionHandler:(id)a3;
- (void)requestDocumentation;
- (void)setAccessory:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentation:(id)a3;
- (void)setDocumentationMetadata:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNeedsAttentionReasons:(unint64_t)a3;
- (void)setNextPermittedRequestDocumentationDate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUpdateType:(unint64_t)a3;
- (void)updateDocumentationMetadata:(id)a3 completionHandler:(id)a4;
- (void)updateState:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation HMSoftwareUpdate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_displayableVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextPermittedRequestDocumentationDate, 0);
  objc_storeStrong((id *)&self->_documentation, 0);
  objc_storeStrong((id *)&self->_documentationMetadata, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setAccessory:(id)a3
{
}

- (HMAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HMAccessory *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
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
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (HMFSoftwareVersion)version
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMSoftwareUpdateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMSoftwareUpdateDelegate *)WeakRetained;
}

- (void)setNeedsAttentionReasons:(unint64_t)a3
{
  self->_needsAttentionReasons = a3;
}

- (unint64_t)needsAttentionReasons
{
  return self->_needsAttentionReasons;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMSoftwareUpdate *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];

  v6 = [(HMSoftwareUpdate *)self version];
  [v4 encodeObject:v6 forKey:@"HM.version"];

  v7 = [(HMSoftwareUpdate *)self displayableVersion];
  [v4 encodeObject:v7 forKey:@"HM.displayableVersion"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMSoftwareUpdate state](self, "state"), @"HM.state");
  objc_msgSend(v4, "encodeInt64:forKey:", -[HMSoftwareUpdate downloadSize](self, "downloadSize"), @"HM.downloadSize");
  [(HMSoftwareUpdate *)self installDuration];
  [v4 encodeInteger:(uint64_t)v8 forKey:@"HM.installDuration"];
  v9 = [(HMSoftwareUpdate *)self documentationMetadata];
  [v4 encodeObject:v9 forKey:@"HM.docMetadata"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMSoftwareUpdate updateType](self, "updateType"));
  [v4 encodeObject:v10 forKey:@"HM.updateType"];

  id v11 = [(HMSoftwareUpdate *)self releaseDate];
  [v4 encodeObject:v11 forKey:@"HM.releaseDate"];
}

- (HMSoftwareUpdate)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.version"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.displayableVersion"];
    if (!v6)
    {
      v6 = [v5 shortVersionString];
    }
    uint64_t v7 = [v4 decodeInt64ForKey:@"HM.downloadSize"];
    double v8 = (double)[v4 decodeIntegerForKey:@"HM.installDuration"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"HM.state"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.docMetadata"];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.releaseDate"];
    v12 = [(HMSoftwareUpdate *)self initWithVersion:v5 displayableVersion:v6 downloadSize:v7 state:v9 installDuration:v10 documentationMetadata:v11 releaseDate:v8];
    if (v12)
    {
      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
      identifier = v12->_identifier;
      v12->_identifier = (NSUUID *)v13;

      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.documentation"];
      documentation = v12->_documentation;
      v12->_documentation = (HMSoftwareUpdateDocumentation *)v15;

      v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.updateType"];
      v12->_updateType = [v17 unsignedIntegerValue];
    }
    v18 = v12;

    v19 = v18;
LABEL_11:

    return v19;
  }
  if (!isInternalBuild())
  {
    v20 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v26 = 138543618;
      v27 = v22;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded version: %@", (uint8_t *)&v26, 0x16u);
    }
    v19 = 0;
    goto LABEL_11;
  }
  v24 = (HMSoftwareUpdate *)_HMFPreconditionFailure();
  return (HMSoftwareUpdate *)[(HMSoftwareUpdate *)v24 messageDestination];
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMSoftwareUpdate *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (id)logIdentifier
{
  v2 = [(HMSoftwareUpdate *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [(HMSoftwareUpdate *)self delegate];
    uint64_t v8 = [v6 state];
    int64_t v9 = [(HMSoftwareUpdate *)self state];
    BOOL v10 = v9 != v8;
    if (v9 != v8)
    {
      [(HMSoftwareUpdate *)self setState:v8];
      if (objc_opt_respondsToSelector())
      {
        id v11 = [(HMSoftwareUpdate *)self context];
        v12 = [v11 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E5945160;
        block[4] = self;
        uint64_t v46 = v8;
        id v45 = v7;
        dispatch_async(v12, block);
      }
    }
    uint64_t v13 = [v6 documentationMetadata];
    v14 = [(HMSoftwareUpdate *)self documentationMetadata];
    char v15 = HMFEqualObjects();

    if ((v15 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x19F3A64A0]();
      v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v48 = v19;
        __int16 v49 = 2112;
        v50 = v13;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Updating documentation metadata: %@", buf, 0x16u);
      }
      int v20 = [(HMSoftwareUpdate *)v17 isDocumentationAvailable];
      [(HMSoftwareUpdate *)v17 setDocumentationMetadata:v13];
      int v21 = [(HMSoftwareUpdate *)v17 isDocumentationAvailable];
      if (v20 != v21)
      {
        char v22 = v21;
        v23 = (void *)MEMORY[0x19F3A64A0]();
        v24 = v17;
        SEL v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          int v26 = HMFGetLogIdentifier();
          HMFBooleanToString();
          v27 = v37 = v23;
          *(_DWORD *)buf = 138543618;
          v48 = v26;
          __int16 v49 = 2112;
          v50 = v27;
          _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@Documentation is available: %@", buf, 0x16u);

          v23 = v37;
        }

        if (objc_opt_respondsToSelector())
        {
          __int16 v28 = [(HMSoftwareUpdate *)v24 context];
          uint64_t v29 = [v28 queue];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_173;
          v41[3] = &unk_1E5944D60;
          v41[4] = v24;
          char v43 = v22;
          id v42 = v7;
          dispatch_async(v29, v41);
        }
      }
      BOOL v10 = 1;
    }

    uint64_t v30 = [v6 documentation];
    v31 = [(HMSoftwareUpdate *)self documentation];
    char v32 = HMFEqualObjects();

    if ((v32 & 1) == 0)
    {
      [(HMSoftwareUpdate *)self setDocumentation:v30];
      if (objc_opt_respondsToSelector())
      {
        v33 = [(HMSoftwareUpdate *)self context];
        v34 = [v33 queue];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_175;
        v38[3] = &unk_1E5945650;
        v38[4] = self;
        id v39 = v30;
        id v40 = v7;
        dispatch_async(v34, v38);
      }
      BOOL v10 = 1;
    }

    uint64_t v35 = [v6 updateType];
    if ([(HMSoftwareUpdate *)self updateType] != v35)
    {
      [(HMSoftwareUpdate *)self setUpdateType:v35];
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E5945160;
  v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  uint64_t v8 = v4;
  id v7 = v5;
  [v3 invokeBlock:v6];
}

void __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_173(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2_174;
  v5[3] = &unk_1E5944D60;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 48);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_175(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2_176;
  v5[3] = &unk_1E5945650;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2_176(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateDocumentation with : %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) softwareUpdate:*(void *)(a1 + 32) didUpdateDocumentation:*(void *)(a1 + 40)];
}

uint64_t __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2_174(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = HMFBooleanToString();
    int v8 = 138543618;
    int64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying clients documentation is available: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) softwareUpdate:*(void *)(a1 + 32) didUpdateDocumentationAvailable:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    int v8 = 138543618;
    int64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateState : %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) softwareUpdate:*(void *)(a1 + 32) didUpdateState:*(void *)(a1 + 48)];
}

- (void)_requestNeedsAttentionReasonsWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMSoftwareUpdate *)self context];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F65488]);
    id v7 = [(HMSoftwareUpdate *)self identifier];
    int v8 = (void *)[v6 initWithTarget:v7];

    int64_t v9 = [MEMORY[0x1E4F654B0] messageWithName:@"HMSU.rn" destination:v8 payload:0];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __71__HMSoftwareUpdate__requestNeedsAttentionReasonsWithCompletionHandler___block_invoke;
    v18 = &unk_1E5944EF0;
    v19 = self;
    id v20 = v4;
    [v9 setResponseHandler:&v15];
    __int16 v10 = objc_msgSend(v5, "messageDispatcher", v15, v16, v17, v18, v19);
    [v10 sendMessage:v9];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v22 = v14;
      __int16 v23 = 2080;
      v24 = "-[HMSoftwareUpdate _requestNeedsAttentionReasonsWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __71__HMSoftwareUpdate__requestNeedsAttentionReasonsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v11;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@needsAttentionReasonsRequest failed: %@", (uint8_t *)&v23, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v12 = objc_msgSend(v6, "hmf_numberForKey:", @"needsAttention");
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    uint64_t v16 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        v18 = HMSoftwareUpdateNeedsAttentionReasonsToString([v12 integerValue]);
        v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
        int v23 = 138543874;
        v24 = v17;
        __int16 v25 = 2112;
        id v26 = v18;
        __int16 v27 = 2112;
        __int16 v28 = v19;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@needsAttentionReasons set to %@ (%@)", (uint8_t *)&v23, 0x20u);
      }
      objc_msgSend(*(id *)(a1 + 32), "setNeedsAttentionReasons:", objc_msgSend(v12, "integerValue"));
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        int v23 = 138543618;
        v24 = v20;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing needsAttentionReasons from message response payload: %@", (uint8_t *)&v23, 0x16u);
      }
      uint64_t v21 = *(void *)(a1 + 40);
      char v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
      (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
    }
  }
}

- (void)_handleUpdatedNeedsAttentionReasonsMessage:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMSoftwareUpdate *)self context];
  id v6 = [v5 pendingRequests];
  id v7 = [v4 identifier];
  int v8 = [v6 removeCompletionBlockForIdentifier:v7];

  id v9 = [v4 numberForKey:@"needsAttention"];
  if (v9)
  {
    unint64_t v10 = [(HMSoftwareUpdate *)self needsAttentionReasons];
    if (v10 == [v9 integerValue])
    {
      if (!v8) {
        goto LABEL_13;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x19F3A64A0]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        uint64_t v21 = HMSoftwareUpdateNeedsAttentionReasonsToString([v9 integerValue]);
        char v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
        *(_DWORD *)buf = 138543874;
        char v32 = v20;
        __int16 v33 = 2112;
        v34 = v21;
        __int16 v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Updated needsAttentionReasons to %@ (%@)", buf, 0x20u);
      }
      -[HMSoftwareUpdate setNeedsAttentionReasons:](v18, "setNeedsAttentionReasons:", [v9 integerValue]);
      if (!v8)
      {
        id v23 = [(HMSoftwareUpdate *)v18 delegate];
        if (objc_opt_respondsToSelector())
        {
          objc_initWeak((id *)buf, v18);
          __int16 v25 = [(HMSoftwareUpdate *)v18 context];
          id v26 = [v25 delegateCaller];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __63__HMSoftwareUpdate__handleUpdatedNeedsAttentionReasonsMessage___block_invoke;
          v27[3] = &unk_1E5941960;
          objc_copyWeak(&v30, (id *)buf);
          id v23 = v23;
          id v28 = v23;
          id v29 = v9;
          [v26 invokeBlock:v27];

          objc_destroyWeak(&v30);
          objc_destroyWeak((id *)buf);
        }
        goto LABEL_12;
      }
    }
    id v23 = [(HMSoftwareUpdate *)self context];
    v24 = [v23 delegateCaller];
    [v24 callCompletion:v8 error:0];

LABEL_12:
LABEL_13:
    [v4 respondWithPayload:0];
    goto LABEL_14;
  }
  uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = HMFGetLogIdentifier();
    uint64_t v15 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    char v32 = v14;
    __int16 v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing needsAttentionReasons from message payload: %@", buf, 0x16u);
  }
  uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  [v4 respondWithError:v16];

LABEL_14:
}

void __63__HMSoftwareUpdate__handleUpdatedNeedsAttentionReasonsMessage___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained) {
    objc_msgSend(a1[4], "softwareUpdate:didUpdateNeedsAttentionReasons:", WeakRetained, objc_msgSend(a1[5], "integerValue"));
  }
}

- (void)fetchNeedsAttentionReasonsWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMSoftwareUpdate *)self context];
  if (v5)
  {
    id v6 = [(HMSoftwareUpdate *)self context];

    if (v6)
    {
      if (v4)
      {
        id v7 = [(HMSoftwareUpdate *)self context];
        int v8 = [v7 queue];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __68__HMSoftwareUpdate_fetchNeedsAttentionReasonsWithCompletionHandler___block_invoke;
        v13[3] = &unk_1E59454E8;
        v13[4] = self;
        id v14 = v4;
        dispatch_async(v8, v13);

        goto LABEL_8;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  unint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v12;
    __int16 v17 = 2080;
    v18 = "-[HMSoftwareUpdate fetchNeedsAttentionReasonsWithCompletionHandler:]";
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
  }
LABEL_8:
}

uint64_t __68__HMSoftwareUpdate_fetchNeedsAttentionReasonsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestNeedsAttentionReasonsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (NSDate)nextPermittedRequestDocumentationDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSDate *)self->_nextPermittedRequestDocumentationDate copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDate *)v4;
}

- (void)setNextPermittedRequestDocumentationDate:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  nextPermittedRequestDocumentationDate = self->_nextPermittedRequestDocumentationDate;
  self->_nextPermittedRequestDocumentationDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setUpdateType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_updateType = a3;

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

- (void)_handleUpdatedDocumentation:(id)a3
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 dataForKey:@"documentation"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    int v8 = [v6 setWithArray:v7];

    id v38 = 0;
    id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v5 error:&v38];
    id v33 = v38;
    if (v9)
    {
      id v10 = v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      id v12 = v11;

      uint64_t v13 = [(HMSoftwareUpdate *)self documentation];
      char v14 = HMFEqualObjects();

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v16 = self;
        __int16 v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v40 = v18;
          __int16 v41 = 2112;
          id v42 = v10;
          _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating with documentation: %@", buf, 0x16u);
        }
        [(HMSoftwareUpdate *)v16 setDocumentation:v10];
        objc_initWeak((id *)buf, v16);
        uint64_t v19 = [(HMSoftwareUpdate *)v16 delegate];
        if (objc_opt_respondsToSelector())
        {
          id WeakRetained = objc_loadWeakRetained((id *)buf);
          uint64_t v21 = [WeakRetained context];
          char v22 = [v21 delegateCaller];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __48__HMSoftwareUpdate__handleUpdatedDocumentation___block_invoke;
          v34[3] = &unk_1E5945650;
          id v35 = v19;
          id v36 = WeakRetained;
          id v37 = v12;
          [v22 invokeBlock:v34];
        }
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      id v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = self;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        char v32 = [v4 messagePayload];
        *(_DWORD *)buf = 138543874;
        id v40 = v31;
        __int16 v41 = 2112;
        id v42 = v32;
        __int16 v43 = 2112;
        id v44 = v33;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation from serialized documentation data: %@: %@", buf, 0x20u);
      }
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v12];
    }
  }
  else
  {
    id v23 = (void *)MEMORY[0x19F3A64A0]();
    v24 = self;
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      __int16 v27 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v40 = v26;
      __int16 v41 = 2112;
      id v42 = v27;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Missing documentation data from message payload: %@", buf, 0x16u);
    }
    int v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v8];
  }
}

uint64_t __48__HMSoftwareUpdate__handleUpdatedDocumentation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) softwareUpdate:*(void *)(a1 + 40) didUpdateDocumentation:*(void *)(a1 + 48)];
}

- (void)requestDocumentation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMSoftwareUpdate *)self context];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__HMSoftwareUpdate_requestDocumentation__block_invoke;
    v10[3] = &unk_1E5945628;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      uint64_t v15 = "-[HMSoftwareUpdate requestDocumentation]";
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __40__HMSoftwareUpdate_requestDocumentation__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Requesting documentation", buf, 0xCu);
  }
  id v6 = (void *)MEMORY[0x1E4F654B0];
  id v7 = [*(id *)(a1 + 32) messageDestination];
  int v8 = [v6 messageWithName:@"HMSU.rd" destination:v7 payload:0];

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__HMSoftwareUpdate_requestDocumentation__block_invoke_161;
  v10[3] = &unk_1E5943F78;
  objc_copyWeak(&v11, (id *)buf);
  [v8 setResponseHandler:v10];
  id v9 = [*(id *)(a1 + 40) messageDispatcher];
  [v9 sendMessage:v8 completionHandler:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __40__HMSoftwareUpdate_requestDocumentation__block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    if ([v5 isHMError] && objc_msgSend(v5, "code") == 3201)
    {
      int v8 = objc_msgSend(v6, "hmf_dateForKey:", @"nextPermittedRequestDocumentationDate");
      [WeakRetained setNextPermittedRequestDocumentationDate:v8];
    }
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      int v18 = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      id v21 = v5;
      uint64_t v13 = "%{public}@Failed to request documentation with error: %@";
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 22;
LABEL_9:
      _os_log_impl(&dword_19D1A8000, v14, v15, v13, (uint8_t *)&v18, v16);
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v12;
      uint64_t v13 = "%{public}@Successfully requested documentation";
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      uint32_t v16 = 12;
      goto LABEL_9;
    }
  }
}

- (void)setDocumentation:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_documentation, a3);
  if (v6)
  {
    nextPermittedRequestDocumentationDate = self->_nextPermittedRequestDocumentationDate;
    self->_nextPermittedRequestDocumentationDate = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (HMSoftwareUpdateDocumentation)documentation
{
  if ([(HMSoftwareUpdate *)self isDocumentationAvailable])
  {
    os_unfair_lock_lock_with_options();
    id v3 = self->_documentation;
    os_unfair_lock_unlock(&self->_lock);
    if (!v3) {
      [(HMSoftwareUpdate *)self requestDocumentation];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)updateDocumentationMetadata:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMSoftwareUpdate *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSoftwareUpdate updateDocumentationMetadata:completionHandler:]", @"completionHandler"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    int v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v20;
      __int16 v28 = 2112;
      id v29 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    objc_initWeak((id *)location, self);
    id v10 = [v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke;
    block[3] = &unk_1E593FC70;
    objc_copyWeak(&v26, (id *)location);
    id v23 = v6;
    id v25 = v7;
    id v24 = v9;
    dispatch_async(v10, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v14;
      __int16 v28 = 2080;
      id v29 = "-[HMSoftwareUpdate updateDocumentationMetadata:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);
    }
    os_log_type_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

void __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke(id *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = WeakRetained;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = a1[4];
    *(_DWORD *)buf = 138543618;
    id v38 = v7;
    __int16 v39 = 2112;
    id v40 = v8;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating documentation metadata: %@", buf, 0x16u);
  }
  id v9 = (void *)MEMORY[0x1E4F654B0];
  id v10 = [v5 messageDestination];
  id v35 = @"metadata";
  id v11 = a1[4];
  if (v11) {
    encodeRootObject(v11);
  }
  else {
  id v12 = [MEMORY[0x1E4F1CA98] null];
  }
  id v36 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  uint64_t v14 = [v9 messageWithName:@"HMSU.dm" destination:v10 payload:v13];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke_160;
  aBlock[3] = &unk_1E5944AE0;
  objc_copyWeak(&v34, v2);
  id v32 = a1[4];
  id v33 = a1[6];
  os_log_type_t v15 = _Block_copy(aBlock);
  uint64_t v16 = [v5 context];
  id v17 = [v16 pendingRequests];

  int v18 = [v14 identifier];
  uint64_t v19 = _Block_copy(v15);
  [v17 addCompletionBlock:v19 forIdentifier:v18];

  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke_2;
  __int16 v27 = &unk_1E5945510;
  id v20 = v17;
  id v28 = v20;
  id v21 = v18;
  id v29 = v21;
  id v22 = v15;
  id v30 = v22;
  [v14 setResponseHandler:&v24];
  id v23 = objc_msgSend(a1[5], "messageDispatcher", v24, v25, v26, v27);
  [v23 sendMessage:v14 completionHandler:0];

  objc_destroyWeak(&v34);
}

void __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke_160(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v8 = WeakRetained;
  if (!v4)
  {
    [WeakRetained setDocumentationMetadata:*(void *)(a1 + 32)];
    id WeakRetained = v8;
  }
  id v6 = [WeakRetained context];
  id v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) error:v4];
}

void __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_handleUpdatedDocumentationMetadata:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMSoftwareUpdate *)self context];
  id v6 = [v5 pendingRequests];
  id v7 = [v4 identifier];
  id v8 = [v6 retrieveCompletionBlockForIdentifier:v7];

  if (v8)
  {
LABEL_16:
    [v4 respondWithPayload:0];
    goto LABEL_17;
  }
  id v9 = [v4 nullForKey:@"metadata"];

  if (v9)
  {
    id v10 = 0;
LABEL_4:
    id v11 = [(HMSoftwareUpdate *)self documentationMetadata];
    char v12 = HMFEqualObjects();

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v14 = self;
      os_log_type_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v55 = v16;
        __int16 v56 = 2112;
        v57 = v10;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating documentation metadata to: %@", buf, 0x16u);
      }
      int v17 = [(HMSoftwareUpdate *)v14 isDocumentationAvailable];
      [(HMSoftwareUpdate *)v14 setDocumentationMetadata:v10];
      int v18 = [(HMSoftwareUpdate *)v14 isDocumentationAvailable];
      char v19 = v18;
      if (v17 != v18)
      {
        id v20 = (void *)MEMORY[0x19F3A64A0]();
        id v21 = v14;
        id v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = HMFGetLogIdentifier();
          uint64_t v24 = HMFBooleanToString();
          *(_DWORD *)buf = 138543618;
          id v55 = v23;
          __int16 v56 = 2112;
          v57 = v24;
          _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Documentation is available: %@", buf, 0x16u);
        }
        objc_initWeak(&location, v21);
        uint64_t v25 = [(HMSoftwareUpdate *)v21 delegate];
        if (objc_opt_respondsToSelector())
        {
          id v26 = (void *)MEMORY[0x19F3A64A0]();
          __int16 v27 = v21;
          HMFGetOSLogHandle();
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            id v30 = HMFBooleanToString();
            *(_DWORD *)buf = 138543618;
            id v55 = v29;
            __int16 v56 = 2112;
            v57 = v30;
            _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_INFO, "%{public}@Notifying clients documentation is available: %@", buf, 0x16u);
          }
          id v31 = objc_loadWeakRetained(&location);
          id v32 = [v31 context];
          id v33 = [v32 delegateCaller];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __56__HMSoftwareUpdate__handleUpdatedDocumentationMetadata___block_invoke;
          v48[3] = &unk_1E5944D60;
          id v49 = v25;
          id v50 = v31;
          char v51 = v19;
          [v33 invokeBlock:v48];
        }
        objc_destroyWeak(&location);
      }
    }

    goto LABEL_16;
  }
  id v34 = [v4 dataForKey:@"metadata"];
  if (v34)
  {
    id v53 = 0;
    id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v34 error:&v53];
    id v35 = v53;
    id v36 = v35;
    if (v10)
    {

      goto LABEL_4;
    }
    __int16 v43 = (void *)MEMORY[0x19F3A64A0]();
    id v44 = self;
    id v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      uint64_t v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v55 = v46;
      __int16 v56 = 2112;
      v57 = v36;
      _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation metadata from metadata data: %@", buf, 0x16u);
    }
    v47 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v47];
  }
  else
  {
    id v37 = (void *)MEMORY[0x19F3A64A0]();
    id v38 = self;
    __int16 v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      id v40 = HMFGetLogIdentifier();
      uint64_t v41 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v55 = v40;
      __int16 v56 = 2112;
      v57 = v41;
      _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_ERROR, "%{public}@Missing documentation metadata from message payload: %@", buf, 0x16u);
    }
    id v42 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v42];
  }
LABEL_17:
}

uint64_t __56__HMSoftwareUpdate__handleUpdatedDocumentationMetadata___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) softwareUpdate:*(void *)(a1 + 40) didUpdateDocumentationAvailable:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setDocumentationMetadata:(id)a3
{
  id v4 = (HMSoftwareUpdateDocumentationMetadata *)a3;
  os_unfair_lock_lock_with_options();
  documentationMetadata = self->_documentationMetadata;
  self->_documentationMetadata = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_documentationMetadata;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)isDocumentationAvailable
{
  id v3 = [(HMSoftwareUpdate *)self nextPermittedRequestDocumentationDate];
  id v4 = [(HMSoftwareUpdate *)self documentationMetadata];
  if (v4)
  {
    if (v3)
    {
      id v5 = [MEMORY[0x1E4F1C9C8] date];
      BOOL v6 = [v3 compare:v5] != 1;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)updateState:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMSoftwareUpdate *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSoftwareUpdate updateState:completionHandler:]", @"completionHandler"];
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    int v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      char v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke;
    block[3] = &unk_1E5945110;
    void block[4] = self;
    int64_t v24 = a3;
    id v23 = v6;
    id v22 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v13;
      __int16 v27 = 2080;
      id v28 = "-[HMSoftwareUpdate updateState:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

void __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = (void *)v5;
    unint64_t v7 = *(void *)(a1 + 56);
    if (v7 > 5) {
      id v8 = @"unknown";
    }
    else {
      id v8 = off_1E593FCE8[v7];
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v5;
    __int16 v37 = 2112;
    id v38 = v8;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating state to '%@'", buf, 0x16u);
  }
  id v33 = @"state";
  id v9 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  id v34 = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];

  id v11 = (void *)MEMORY[0x1E4F654B0];
  char v12 = [*(id *)(a1 + 32) messageDestination];
  uint64_t v13 = [v11 messageWithName:@"HMSU.us" destination:v12 payload:v10];

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke_150;
  aBlock[3] = &unk_1E593FC48;
  objc_copyWeak(v32, (id *)buf);
  v32[1] = *(id *)(a1 + 56);
  id v31 = *(id *)(a1 + 48);
  uint64_t v14 = _Block_copy(aBlock);
  uint64_t v15 = [*(id *)(a1 + 32) context];
  uint64_t v16 = [v15 pendingRequests];

  int v17 = [v13 identifier];
  int v18 = _Block_copy(v14);
  [v16 addCompletionBlock:v18 forIdentifier:v17];

  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke_152;
  id v26 = &unk_1E5945510;
  id v19 = v16;
  id v27 = v19;
  id v20 = v17;
  id v28 = v20;
  id v21 = v14;
  id v29 = v21;
  [v13 setResponseHandler:&v23];
  id v22 = objc_msgSend(*(id *)(a1 + 40), "messageDispatcher", v23, v24, v25, v26);
  [v22 sendMessage:v13 completionHandler:0];

  objc_destroyWeak(v32);
  objc_destroyWeak((id *)buf);
}

void __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = WeakRetained;
  unint64_t v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = (uint64_t)v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to updated state with error: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = (void *)v10;
      unint64_t v12 = *(void *)(a1 + 48);
      if (v12 > 5) {
        uint64_t v13 = @"unknown";
      }
      else {
        uint64_t v13 = off_1E593FCE8[v12];
      }
      int v16 = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated state to '%@'", (uint8_t *)&v16, 0x16u);
    }
    [v6 setState:*(void *)(a1 + 48)];
  }
  uint64_t v14 = [v6 context];
  uint64_t v15 = [v14 delegateCaller];
  [v15 callCompletion:*(void *)(a1 + 32) error:v3];
}

void __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke_152(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_handleUpdatedState:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMSoftwareUpdate *)self context];
  id v6 = [v5 pendingRequests];
  unint64_t v7 = [v4 identifier];
  id v8 = [v6 removeCompletionBlockForIdentifier:v7];

  id v9 = [v4 numberForKey:@"state"];
  if (v9)
  {
    int64_t v10 = [(HMSoftwareUpdate *)self state];
    if (v10 == [v9 integerValue])
    {
      if (!v8) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        unint64_t v21 = [v9 integerValue];
        if (v21 > 5) {
          id v22 = @"unknown";
        }
        else {
          id v22 = off_1E593FCE8[v21];
        }
        *(_DWORD *)buf = 138543618;
        id v32 = v20;
        __int16 v33 = 2112;
        id v34 = v22;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Updated state to '%@'", buf, 0x16u);
      }
      -[HMSoftwareUpdate setState:](v18, "setState:", [v9 integerValue]);
      if (!v8)
      {
        id v23 = [(HMSoftwareUpdate *)v18 delegate];
        if (objc_opt_respondsToSelector())
        {
          objc_initWeak((id *)buf, v18);
          uint64_t v25 = [(HMSoftwareUpdate *)v18 context];
          id v26 = [v25 delegateCaller];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __40__HMSoftwareUpdate__handleUpdatedState___block_invoke;
          v27[3] = &unk_1E5941960;
          objc_copyWeak(&v30, (id *)buf);
          id v23 = v23;
          id v28 = v23;
          id v29 = v9;
          [v26 invokeBlock:v27];

          objc_destroyWeak(&v30);
          objc_destroyWeak((id *)buf);
        }
        goto LABEL_15;
      }
    }
    id v23 = [(HMSoftwareUpdate *)self context];
    uint64_t v24 = [v23 delegateCaller];
    [v24 callCompletion:v8 error:0];

LABEL_15:
LABEL_16:
    [v4 respondWithPayload:0];
    goto LABEL_17;
  }
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  unint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v15;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing state from message payload: %@", buf, 0x16u);
  }
  int v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  [v4 respondWithError:v16];

LABEL_17:
}

void __40__HMSoftwareUpdate__handleUpdatedState___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained) {
    objc_msgSend(a1[4], "softwareUpdate:didUpdateState:", WeakRetained, objc_msgSend(a1[5], "integerValue"));
  }
}

- (void)setState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_identifier);
    uint64_t v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  unint64_t v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)setIdentifier:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)identifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_registerNotificationHandlers
{
  id v3 = [(HMSoftwareUpdate *)self context];
  id v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"HMSU.us" receiver:self selector:sel__handleUpdatedState_];

  uint64_t v5 = [(HMSoftwareUpdate *)self context];
  id v6 = [v5 messageDispatcher];
  [v6 registerForMessage:@"HMSU.dm" receiver:self selector:sel__handleUpdatedDocumentationMetadata_];

  unint64_t v7 = [(HMSoftwareUpdate *)self context];
  id v8 = [v7 messageDispatcher];
  [v8 registerForMessage:@"HMSU.du" receiver:self selector:sel__handleUpdatedDocumentation_];

  id v10 = [(HMSoftwareUpdate *)self context];
  id v9 = [v10 messageDispatcher];
  [v9 registerForMessage:@"HMSU.na" receiver:self selector:sel__handleUpdatedNeedsAttentionReasonsMessage_];
}

- (void)_unconfigure
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring softwareUpdate", (uint8_t *)&v9, 0xCu);
  }
  unint64_t v7 = [(HMSoftwareUpdate *)v4 context];
  id v8 = [v7 messageDispatcher];
  [v8 deregisterReceiver:v4];

  [(HMSoftwareUpdate *)v4 setContext:0];
}

- (void)configureWithContext:(id)a3
{
  -[HMSoftwareUpdate setContext:](self, "setContext:");
  if (a3)
  {
    uint64_t v5 = [(HMSoftwareUpdate *)self identifier];

    if (v5)
    {
      [(HMSoftwareUpdate *)self _registerNotificationHandlers];
      [(HMSoftwareUpdate *)self _requestNeedsAttentionReasonsWithCompletionHandler:&__block_literal_global_17312];
    }
  }
}

- (NSString)description
{
  id v3 = [(HMSoftwareUpdate *)self releaseDate];
  id v4 = NSString;
  uint64_t v5 = [(HMSoftwareUpdate *)self version];
  id v6 = [v5 versionString];
  unint64_t v7 = [(HMSoftwareUpdate *)self displayableVersion];
  unint64_t v8 = [(HMSoftwareUpdate *)self state];
  if (v8 > 5) {
    int v9 = @"unknown";
  }
  else {
    int v9 = off_1E593FCE8[v8];
  }
  [(HMSoftwareUpdate *)self downloadSize];
  id v10 = NSLocalizedFileSizeDescription();
  uint64_t v11 = [(HMSoftwareUpdate *)self documentationMetadata];
  unint64_t v12 = [(HMSoftwareUpdate *)self updateType];
  if (v12 - 1 > 2) {
    uint64_t v13 = @"Unknown";
  }
  else {
    uint64_t v13 = off_1E593FCD0[v12 - 1];
  }
  uint64_t v14 = [v4 stringWithFormat:@"<Software Update, Version = %@, Displayable Version = %@, State = %@, Download Size = %@, Documentation Metadata = %@, Release Date = %@, Update Type = %@>", v6, v7, v9, v10, v11, v3, v13];

  return (NSString *)v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMSoftwareUpdate *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      unint64_t v7 = [(HMSoftwareUpdate *)self version];
      unint64_t v8 = [(HMSoftwareUpdate *)v6 version];
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
  v2 = [(HMSoftwareUpdate *)self version];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 displayableVersion:(id)a4 downloadSize:(unint64_t)a5 state:(int64_t)a6 installDuration:(double)a7 documentationMetadata:(id)a8 releaseDate:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  if (v16)
  {
    uint64_t v20 = v19;
    v35.receiver = self;
    v35.super_class = (Class)HMSoftwareUpdate;
    unint64_t v21 = [(HMSoftwareUpdate *)&v35 init];
    if (v21)
    {
      uint64_t v22 = [v16 copy];
      version = v21->_version;
      v21->_version = (HMFSoftwareVersion *)v22;

      if (v17)
      {
        uint64_t v24 = (NSString *)v17;
      }
      else
      {
        uint64_t v24 = [v16 shortVersionString];
      }
      displayableVersion = v21->_displayableVersion;
      v21->_displayableVersion = v24;

      v21->_downloadSize = a5;
      v21->_int64_t state = a6;
      objc_storeStrong((id *)&v21->_documentationMetadata, a8);
      v21->_installDuration = a7;
      v21->_unint64_t updateType = 0;
      objc_storeStrong((id *)&v21->_releaseDate, a9);
    }

    return v21;
  }
  else
  {
    id v27 = (HMSoftwareUpdate *)_HMFPreconditionFailure();
    return [(HMSoftwareUpdate *)v27 initWithVersion:v29 downloadSize:v30 state:v31 installDuration:v34 documentationMetadata:v32 releaseDate:v33];
  }
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 installDuration:(double)a6 documentationMetadata:(id)a7 releaseDate:(id)a8
{
  return [(HMSoftwareUpdate *)self initWithVersion:a3 displayableVersion:0 downloadSize:a4 state:a5 installDuration:a7 documentationMetadata:a8 releaseDate:a6];
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 installDuration:(double)a6 documentationMetadata:(id)a7
{
  return [(HMSoftwareUpdate *)self initWithVersion:a3 downloadSize:a4 state:a5 installDuration:a7 documentationMetadata:0 releaseDate:a6];
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 documentationMetadata:(id)a6
{
  return [(HMSoftwareUpdate *)self initWithVersion:a3 downloadSize:a4 state:a5 installDuration:a6 documentationMetadata:0 releaseDate:0.0];
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5
{
  return [(HMSoftwareUpdate *)self initWithVersion:a3 downloadSize:a4 state:a5 installDuration:0 documentationMetadata:0 releaseDate:0.0];
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4
{
  return [(HMSoftwareUpdate *)self initWithVersion:a3 downloadSize:a4 state:0 installDuration:0 documentationMetadata:0 releaseDate:0.0];
}

- (HMSoftwareUpdate)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
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
  if (logCategory__hmf_once_t51 != -1) {
    dispatch_once(&logCategory__hmf_once_t51, &__block_literal_global_178);
  }
  v2 = (void *)logCategory__hmf_once_v52;

  return v2;
}

uint64_t __31__HMSoftwareUpdate_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v52;
  logCategory__hmf_once_v52 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end