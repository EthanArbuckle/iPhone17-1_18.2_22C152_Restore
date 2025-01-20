@interface _HMSiriEndpointProfile
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)_mergeAssistants:(id)a3;
- (BOOL)manuallyDisabled;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMSiriEndpointProfilesMessenger)messenger;
- (NSArray)assistants;
- (NSArray)attributeDescriptions;
- (NSNumber)activeIdentifier;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)siriEndpointVersion;
- (NSString)siriEngineVersion;
- (NSUUID)sessionHubIdentifier;
- (_HMSiriEndpointProfile)initWithCoder:(id)a3;
- (_HMSiriEndpointProfileDelegate)delegate;
- (id)logIdentifier;
- (id)messageDestination;
- (int64_t)multifunctionButton;
- (int64_t)sessionState;
- (unint64_t)capability;
- (void)__configureWithContext:(id)a3 accessory:(id)a4;
- (void)_handleUpdateProfileState:(id)a3;
- (void)_registerNotificationHandlers;
- (void)applyOnboardingSelections:(id)a3 completionHandler:(id)a4;
- (void)deleteSiriHistoryWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)notifyClientDidUpdateSessionState;
- (void)refreshStateWithCompletionHandler:(id)a3;
- (void)setActiveIdentifier:(id)a3;
- (void)setAssistants:(id)a3;
- (void)setCapability:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setManuallyDisabled:(BOOL)a3;
- (void)setMessenger:(id)a3;
- (void)setMultifunctionButton:(int64_t)a3;
- (void)setNotifications:(BOOL)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)setSessionHubIdentifier:(id)a3;
- (void)setSessionState:(int64_t)a3;
- (void)setSiriEndpointVersion:(id)a3;
- (void)setSiriEngineVersion:(id)a3;
@end

@implementation _HMSiriEndpointProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assistants, 0);
  objc_storeStrong((id *)&self->_activeIdentifier, 0);
  objc_storeStrong((id *)&self->_siriEngineVersion, 0);
  objc_storeStrong((id *)&self->_siriEndpointVersion, 0);

  objc_storeStrong((id *)&self->_sessionHubIdentifier, 0);
}

- (void)setMessenger:(id)a3
{
}

- (HMSiriEndpointProfilesMessenger)messenger
{
  return (HMSiriEndpointProfilesMessenger *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDelegate:(id)a3
{
}

- (_HMSiriEndpointProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HMSiriEndpointProfileDelegate *)WeakRetained;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (id)logIdentifier
{
  v2 = [(_HMAccessoryProfile *)self accessory];
  v3 = [v2 uniqueIdentifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (NSArray)attributeDescriptions
{
  v33[9] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v32 = [(_HMAccessoryProfile *)self accessory];
  v31 = [v32 uniqueIdentifier];
  v30 = (void *)[v3 initWithName:@"accessoryUniqueIdentifier" value:v31];
  v33[0] = v30;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v29 = HMSiriEndpointProfileSessionStateTypeToString([(_HMSiriEndpointProfile *)self sessionState]);
  v28 = (void *)[v4 initWithName:@"sessionState" value:v29];
  v33[1] = v28;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v27 = [(_HMSiriEndpointProfile *)self sessionHubIdentifier];
  v26 = (void *)[v5 initWithName:@"sessionHubIdentifier" value:v27];
  v33[2] = v26;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = [(_HMSiriEndpointProfile *)self siriEndpointVersion];
  v24 = (void *)[v6 initWithName:@"siriEndpointVersion" value:v25];
  v33[3] = v24;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v23 = HMSiriEndpointProfileCapabilityToString([(_HMSiriEndpointProfile *)self capability]);
  v8 = (void *)[v7 initWithName:@"capability" value:v23];
  v33[4] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(_HMSiriEndpointProfile *)self siriEngineVersion];
  v11 = (void *)[v9 initWithName:@"siriEngineVersion" value:v10];
  v33[5] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(_HMSiriEndpointProfile *)self activeIdentifier];
  v14 = (void *)[v12 initWithName:@"activeIdentifier" value:v13];
  v33[6] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(_HMSiriEndpointProfile *)self manuallyDisabled];
  v16 = HMFBooleanToString();
  v17 = (void *)[v15 initWithName:@"manuallyDisabled" value:v16];
  v33[7] = v17;
  id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
  v19 = HMSiriEndpointProfileMultifunctionButtonTypeToString([(_HMSiriEndpointProfile *)self multifunctionButton]);
  v20 = (void *)[v18 initWithName:@"multifunctionButton" value:v19];
  v33[8] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:9];

  return (NSArray *)v21;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
    id v7 = [(_HMSiriEndpointProfile *)self delegate];
    uint64_t v8 = [v6 sessionState];
    int64_t v9 = [(_HMSiriEndpointProfile *)self sessionState];
    BOOL v10 = v8 == v9;
    BOOL v11 = v8 != v9;
    if (!v10)
    {
      id v12 = (void *)MEMORY[0x19F3A64A0]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v15 = v59 = v7;
        v16 = HMSiriEndpointProfileSessionStateTypeToString([v6 sessionState]);
        v17 = HMSiriEndpointProfileSessionStateTypeToString([(_HMSiriEndpointProfile *)v13 sessionState]);
        *(_DWORD *)buf = 138543874;
        v78 = v15;
        __int16 v79 = 2112;
        v80 = v16;
        __int16 v81 = 2112;
        v82 = v17;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating session state during merge to session state: %@ from session state: %@", buf, 0x20u);

        id v7 = v59;
      }

      -[_HMSiriEndpointProfile setSessionState:](v13, "setSessionState:", [v6 sessionState]);
      id v18 = [(_HMAccessoryProfile *)v13 context];
      v19 = [v18 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke;
      block[3] = &unk_1E59452E8;
      block[4] = v13;
      dispatch_async(v19, block);
    }
    v20 = [v6 sessionHubIdentifier];
    v21 = [(_HMSiriEndpointProfile *)self sessionHubIdentifier];
    char v22 = HMFEqualObjects();

    if ((v22 & 1) == 0)
    {
      v23 = [v6 sessionHubIdentifier];
      [(_HMSiriEndpointProfile *)self setSessionHubIdentifier:v23];

      if (objc_opt_respondsToSelector())
      {
        v24 = [(_HMAccessoryProfile *)self context];
        v25 = [v24 queue];
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2;
        v74[3] = &unk_1E5945628;
        v74[4] = self;
        id v75 = v7;
        dispatch_async(v25, v74);
      }
      BOOL v11 = 1;
    }
    v26 = [v6 siriEndpointVersion];
    v27 = [(_HMSiriEndpointProfile *)self siriEndpointVersion];
    char v28 = HMFEqualObjects();

    if ((v28 & 1) == 0)
    {
      v29 = [v6 siriEndpointVersion];
      [(_HMSiriEndpointProfile *)self setSiriEndpointVersion:v29];

      BOOL v11 = 1;
    }
    uint64_t v30 = [v6 capability];
    if (v30 != [(_HMSiriEndpointProfile *)self capability])
    {
      int v31 = [(_HMSiriEndpointProfile *)self capability];
      -[_HMSiriEndpointProfile setCapability:](self, "setCapability:", [v6 capability]);
      if ((([(_HMSiriEndpointProfile *)self capability] ^ v31) & 1) != 0
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v32 = [(_HMAccessoryProfile *)self context];
        v33 = [v32 queue];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_41;
        v72[3] = &unk_1E5945628;
        v72[4] = self;
        id v73 = v7;
        dispatch_async(v33, v72);
      }
      if ((([(_HMSiriEndpointProfile *)self capability] ^ v31) & 2) != 0
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v34 = [(_HMAccessoryProfile *)self context];
        v35 = [v34 queue];
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_43;
        v70[3] = &unk_1E5945628;
        v70[4] = self;
        id v71 = v7;
        dispatch_async(v35, v70);
      }
      BOOL v11 = 1;
    }
    v36 = [v6 siriEngineVersion];
    v37 = [(_HMSiriEndpointProfile *)self siriEngineVersion];
    char v38 = HMFEqualObjects();

    if ((v38 & 1) == 0)
    {
      v39 = [v6 siriEngineVersion];
      [(_HMSiriEndpointProfile *)self setSiriEngineVersion:v39];

      if (objc_opt_respondsToSelector())
      {
        v40 = [(_HMAccessoryProfile *)self context];
        v41 = [v40 queue];
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_45;
        v68[3] = &unk_1E5945628;
        v68[4] = self;
        id v69 = v7;
        dispatch_async(v41, v68);
      }
      BOOL v11 = 1;
    }
    v42 = [v6 assistants];
    BOOL v43 = [(_HMSiriEndpointProfile *)self _mergeAssistants:v42];

    if (v43 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v44 = [(_HMAccessoryProfile *)self context];
      v45 = [v44 queue];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_47;
      v66[3] = &unk_1E5945628;
      v66[4] = self;
      id v67 = v7;
      dispatch_async(v45, v66);
    }
    v46 = [v6 activeIdentifier];
    v47 = [(_HMSiriEndpointProfile *)self activeIdentifier];
    char v48 = HMFEqualObjects();

    if ((v48 & 1) == 0)
    {
      v49 = [v6 activeIdentifier];
      [(_HMSiriEndpointProfile *)self setActiveIdentifier:v49];

      if (objc_opt_respondsToSelector())
      {
        v50 = [(_HMAccessoryProfile *)self context];
        v51 = [v50 queue];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_49;
        v64[3] = &unk_1E5945628;
        v64[4] = self;
        id v65 = v7;
        dispatch_async(v51, v64);
      }
      BOOL v11 = 1;
    }
    int v52 = [v6 manuallyDisabled];
    if (v52 != [(_HMSiriEndpointProfile *)self manuallyDisabled])
    {
      -[_HMSiriEndpointProfile setManuallyDisabled:](self, "setManuallyDisabled:", [v6 manuallyDisabled]);
      if (objc_opt_respondsToSelector())
      {
        v53 = [(_HMAccessoryProfile *)self context];
        v54 = [v53 queue];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_51;
        v62[3] = &unk_1E5945628;
        v62[4] = self;
        id v63 = v7;
        dispatch_async(v54, v62);
      }
      BOOL v11 = 1;
    }
    uint64_t v55 = [v6 multifunctionButton];
    if (v55 != [(_HMSiriEndpointProfile *)self multifunctionButton])
    {
      -[_HMSiriEndpointProfile setMultifunctionButton:](self, "setMultifunctionButton:", [v6 multifunctionButton]);
      if (objc_opt_respondsToSelector())
      {
        v56 = [(_HMAccessoryProfile *)self context];
        v57 = [v56 queue];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_53;
        v60[3] = &unk_1E5945628;
        v60[4] = self;
        id v61 = v7;
        dispatch_async(v57, v60);
      }
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_mergeAssistants:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  id v6 = [(_HMSiriEndpointProfile *)self assistants];
  id v7 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v6 newObjects:v4];

  [(HMObjectMergeCollection *)v7 mergeCommonObjects];
  if ([(HMObjectMergeCollection *)v7 isModified])
  {
    uint64_t v8 = [(HMObjectMergeCollection *)v7 finalObjects];
    [(_HMSiriEndpointProfile *)self setAssistants:v8];
  }
  BOOL v9 = [(HMObjectMergeCollection *)v7 isModified];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  BOOL v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (_HMSiriEndpointProfile)initWithCoder:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HMSiriEndpointProfile;
  id v5 = [(_HMAccessoryProfile *)&v29 initWithCoder:v4];
  if (v5)
  {
    char v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session-state"];
    v5->_sessionState = [v28 integerValue];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session-hub-id"];
    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
    }
    else
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_zeroUUID");
    }
    uint64_t v8 = v7;
    objc_storeStrong((id *)&v5->_sessionHubIdentifier, v7);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    id v10 = (void *)v9;
    if (v9) {
      BOOL v11 = (__CFString *)v9;
    }
    else {
      BOOL v11 = &stru_1EEE9DD88;
    }
    objc_storeStrong((id *)&v5->_siriEndpointVersion, v11);
    v5->_capability = [v4 decodeIntegerForKey:@"capability"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siri-engine-version"];
    v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = &stru_1EEE9DD88;
    }
    objc_storeStrong((id *)&v5->_siriEngineVersion, v14);
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"active-identifier"];
    activeIdentifier = v5->_activeIdentifier;
    v5->_activeIdentifier = (NSNumber *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manually-disabled"];
    id v18 = v17;
    if (v17) {
      *(&v5->_manuallyDisabled + 4) = [v17 BOOLValue];
    }
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multifunction-button"];
    v20 = v19;
    if (v19) {
      v5->_multifunctionButton = [v19 integerValue];
    }
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    char v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v23 = [v21 setWithArray:v22];
    v24 = [v4 decodeObjectOfClasses:v23 forKey:@"assistants"];

    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithArray:v24];
    assistants = v5->_assistants;
    v5->_assistants = (NSArray *)v25;
  }
  return v5;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(_HMAccessoryProfile *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)setNotifications:(BOOL)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [(_HMAccessoryProfile *)self context];
  id v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
      objc_exception_throw(v16);
    }
    BOOL v11 = [v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69___HMSiriEndpointProfile_setNotifications_options_completionHandler___block_invoke;
    block[3] = &unk_1E5942240;
    BOOL v21 = a3;
    unint64_t v20 = a4;
    block[4] = self;
    id v19 = v8;
    id v18 = v10;
    dispatch_async(v11, block);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context", buf, 0xCu);
    }
  }
}

- (void)_handleUpdateProfileState:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_HMAccessoryProfile *)self context];
  uint64_t v6 = [v5 pendingRequests];

  id v7 = [v4 identifier];
  id v75 = v6;
  v74 = [v6 removeCompletionBlockForIdentifier:v7];

  id v8 = [(_HMSiriEndpointProfile *)self delegate];
  uint64_t v9 = [v4 numberForKey:@"session-state"];
  int64_t v10 = [(_HMSiriEndpointProfile *)self sessionState];
  v76 = v9;
  if (v9)
  {
    uint64_t v11 = v10;
    if ([v9 integerValue] != v10)
    {
      uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        id v16 = HMSiriEndpointProfileSessionStateTypeToString(v11);
        HMSiriEndpointProfileSessionStateTypeToString([v9 integerValue]);
        id v18 = v17 = v8;
        *(_DWORD *)buf = 138543874;
        v105 = v15;
        __int16 v106 = 2112;
        v107 = v16;
        __int16 v108 = 2112;
        v109 = v18;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating session state due to message from session state: %@ to sessionState: %@", buf, 0x20u);

        id v8 = v17;
        uint64_t v9 = v76;
      }
      -[_HMSiriEndpointProfile setSessionState:](v13, "setSessionState:", [v9 integerValue]);
      [(_HMSiriEndpointProfile *)v13 notifyClientDidUpdateSessionState];
    }
  }
  uint64_t v19 = [v4 uuidForKey:@"session-hub-id"];
  unint64_t v20 = [(_HMSiriEndpointProfile *)self sessionHubIdentifier];
  char v21 = HMFEqualObjects();

  if ((v21 & 1) == 0)
  {
    [(_HMSiriEndpointProfile *)self setSessionHubIdentifier:v19];
    if (objc_opt_respondsToSelector())
    {
      char v22 = [(_HMAccessoryProfile *)self context];
      v23 = [v22 delegateCaller];
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke;
      v100[3] = &unk_1E5945628;
      id v101 = v8;
      v102 = self;
      [v23 invokeBlock:v100];
    }
  }
  uint64_t v24 = [v4 stringForKey:@"version"];
  if (v24)
  {
    uint64_t v25 = [(_HMSiriEndpointProfile *)self siriEndpointVersion];
    char v26 = HMFEqualObjects();

    if ((v26 & 1) == 0) {
      [(_HMSiriEndpointProfile *)self setSiriEndpointVersion:v24];
    }
  }
  uint64_t v27 = [v4 stringForKey:@"siri-engine-version"];
  if (v27)
  {
    char v28 = [(_HMSiriEndpointProfile *)self siriEngineVersion];
    char v29 = HMFEqualObjects();

    if ((v29 & 1) == 0)
    {
      [(_HMSiriEndpointProfile *)self setSiriEngineVersion:v27];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v30 = [(_HMAccessoryProfile *)self context];
        int v31 = [v30 delegateCaller];
        v97[0] = MEMORY[0x1E4F143A8];
        v97[1] = 3221225472;
        v97[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_2;
        v97[3] = &unk_1E5945628;
        id v98 = v8;
        v99 = self;
        [v31 invokeBlock:v97];
      }
    }
  }
  v32 = [v4 numberForKey:@"capability"];
  v33 = v32;
  if (v32)
  {
    uint64_t v34 = [v32 integerValue];
    if (v34 != [(_HMSiriEndpointProfile *)self capability])
    {
      int v35 = [(_HMSiriEndpointProfile *)self capability];
      -[_HMSiriEndpointProfile setCapability:](self, "setCapability:", [v33 integerValue]);
      if ((([(_HMSiriEndpointProfile *)self capability] ^ v35) & 1) != 0
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v36 = [(_HMAccessoryProfile *)self context];
        v37 = [v36 delegateCaller];
        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_3;
        v94[3] = &unk_1E5945628;
        id v95 = v8;
        v96 = self;
        [v37 invokeBlock:v94];
      }
      if ((([(_HMSiriEndpointProfile *)self capability] ^ v35) & 2) != 0
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        char v38 = [(_HMAccessoryProfile *)self context];
        v39 = [v38 delegateCaller];
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_4;
        v91[3] = &unk_1E5945628;
        id v92 = v8;
        v93 = self;
        [v39 invokeBlock:v91];
      }
    }
  }
  id v73 = (void *)v19;
  uint64_t v40 = [v4 numberForKey:@"active-identifier"];
  if (v40)
  {
    v41 = [(_HMSiriEndpointProfile *)self activeIdentifier];
    char v42 = HMFEqualObjects();

    if ((v42 & 1) == 0)
    {
      [(_HMSiriEndpointProfile *)self setActiveIdentifier:v40];
      if (objc_opt_respondsToSelector())
      {
        BOOL v43 = [(_HMAccessoryProfile *)self context];
        v44 = [v43 delegateCaller];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_5;
        v88[3] = &unk_1E5945628;
        id v89 = v8;
        v90 = self;
        [v44 invokeBlock:v88];
      }
    }
  }
  v72 = (void *)v24;
  v45 = [v4 numberForKey:@"manually-disabled"];
  v46 = v45;
  if (v45)
  {
    int v47 = [v45 BOOLValue];
    if (v47 != [(_HMSiriEndpointProfile *)self manuallyDisabled])
    {
      -[_HMSiriEndpointProfile setManuallyDisabled:](self, "setManuallyDisabled:", [v46 BOOLValue]);
      if (objc_opt_respondsToSelector())
      {
        char v48 = [(_HMAccessoryProfile *)self context];
        v49 = [v48 delegateCaller];
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_6;
        v85[3] = &unk_1E5945628;
        id v86 = v8;
        v87 = self;
        [v49 invokeBlock:v85];
      }
    }
  }
  v70 = v33;
  id v71 = (void *)v27;
  v50 = objc_msgSend(v4, "numberForKey:", @"multifunction-button", v40);
  v51 = v50;
  if (v50)
  {
    uint64_t v52 = [v50 integerValue];
    if (v52 != [(_HMSiriEndpointProfile *)self multifunctionButton])
    {
      -[_HMSiriEndpointProfile setMultifunctionButton:](self, "setMultifunctionButton:", [v51 integerValue]);
      if (objc_opt_respondsToSelector())
      {
        v53 = [(_HMAccessoryProfile *)self context];
        v54 = [v53 delegateCaller];
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_7;
        v82[3] = &unk_1E5945628;
        id v83 = v8;
        v84 = self;
        [v54 invokeBlock:v82];
      }
    }
  }
  v77 = v8;
  uint64_t v55 = [v4 dataForKey:@"assistants"];
  v56 = (void *)MEMORY[0x1E4F28DC0];
  v57 = (void *)MEMORY[0x1E4F1CAD0];
  v103[0] = objc_opt_class();
  v103[1] = objc_opt_class();
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:2];
  v59 = [v57 setWithArray:v58];
  id v81 = 0;
  v60 = [v56 unarchivedObjectOfClasses:v59 fromData:v55 error:&v81];
  id v61 = v81;

  id v62 = v60;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v63 = v62;
  }
  else {
    id v63 = 0;
  }
  id v64 = v63;

  if (v64
    && [(_HMSiriEndpointProfile *)self _mergeAssistants:v64]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v65 = [(_HMAccessoryProfile *)self context];
    v66 = [v65 delegateCaller];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_8;
    v78[3] = &unk_1E5945628;
    id v79 = v77;
    v80 = self;
    [v66 invokeBlock:v78];
  }
  if (v74)
  {
    id v67 = [(_HMAccessoryProfile *)self context];
    v68 = [v67 delegateCaller];
    [v68 callCompletion:v74 error:0];
  }
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_HMAccessoryProfile *)self context];
  uint64_t v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
      objc_exception_throw(v12);
    }
    id v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60___HMSiriEndpointProfile_refreshStateWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v15 = v4;
    id v14 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    int64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context", buf, 0xCu);
    }
  }
}

- (void)setAssistants:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSArray *)[v6 copy];
  assistants = self->_assistants;
  self->_assistants = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSArray)assistants
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_assistants;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setMultifunctionButton:(int64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_multifunctionButton = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)multifunctionButton
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  int64_t multifunctionButton = self->_multifunctionButton;
  os_unfair_lock_unlock(p_lock);
  return multifunctionButton;
}

- (void)setManuallyDisabled:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_manuallyDisabled + 4) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)manuallyDisabled
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_manuallyDisabled + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setActiveIdentifier:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  activeIdentifier = self->_activeIdentifier;
  self->_activeIdentifier = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSNumber)activeIdentifier
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_activeIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSiriEngineVersion:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  siriEngineVersion = self->_siriEngineVersion;
  self->_siriEngineVersion = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)siriEngineVersion
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_siriEngineVersion;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCapability:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_capability = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)capability
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t capability = self->_capability;
  os_unfair_lock_unlock(p_lock);
  return capability;
}

- (void)setSiriEndpointVersion:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  siriEndpointVersion = self->_siriEndpointVersion;
  self->_siriEndpointVersion = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)siriEndpointVersion
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_siriEndpointVersion;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSessionHubIdentifier:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  sessionHubIdentifier = self->_sessionHubIdentifier;
  self->_sessionHubIdentifier = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSUUID)sessionHubIdentifier
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_sessionHubIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSessionState:(int64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_sessionState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)sessionState
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  int64_t sessionState = self->_sessionState;
  os_unfair_lock_unlock(p_lock);
  return sessionState;
}

- (void)notifyClientDidUpdateSessionState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(_HMAccessoryProfile *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    id v5 = [(_HMSiriEndpointProfile *)self delegate];
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      unint64_t v20 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did update session state using delegate: %@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59___HMSiriEndpointProfile_notifyClientDidUpdateSessionState__block_invoke;
      v14[3] = &unk_1E5945628;
      id v15 = v5;
      id v16 = v7;
      [v4 invokeBlock:v14];
    }
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      unint64_t v20 = v3;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated session state due to no delgate caller from context: %@", buf, 0x16u);
    }
  }
}

- (void)deleteSiriHistoryWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(_HMSiriEndpointProfile *)self messenger];
  if (v5)
  {
    id v6 = [(_HMAccessoryProfile *)self accessory];
    id v7 = [v6 uuid];

    [v5 sendDeleteSiriHistoryRequestWithAccessoryUUID:v7 completionHandler:v4];
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    int64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete siri history due to no messenger", (uint8_t *)&v13, 0xCu);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    v4[2](v4, v12);
  }
}

- (void)applyOnboardingSelections:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, uint64_t))a4;
  id v8 = [(_HMSiriEndpointProfile *)self messenger];
  if (v8)
  {
    uint64_t v9 = [(_HMAccessoryProfile *)self accessory];
    int64_t v10 = [v9 uuid];

    [v8 sendApplyOnboardingSelectionsRequestWithAccessoryUUID:v10 onboardingSelections:v6 completionHandler:v7];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to apply onboarding selections due to no messenger", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    v7[2](v7, v15, 1);
  }
}

- (void)_registerNotificationHandlers
{
  id v4 = [(_HMAccessoryProfile *)self context];
  id v3 = [v4 messageDispatcher];
  [v3 registerForMessage:@"HMSE.up" receiver:self selector:sel__handleUpdateProfileState_];
}

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  int64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    int v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring siri endpoint profile: %@ with context: %@", buf, 0x20u);
  }
  v14.receiver = v9;
  v14.super_class = (Class)_HMSiriEndpointProfile;
  [(_HMAccessoryProfile *)&v14 __configureWithContext:v6 accessory:v7];
  id v12 = [(_HMAccessoryProfile *)v9 home];
  int v13 = [v12 createSiriEndpointProfilesMessenger];
  [(_HMSiriEndpointProfile *)v9 setMessenger:v13];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t37 != -1) {
    dispatch_once(&logCategory__hmf_once_t37, &__block_literal_global_31918);
  }
  v2 = (void *)logCategory__hmf_once_v38;

  return v2;
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