@interface HMDMediaPlaybackAction
+ (BOOL)isPlaybackActionValidWithProfiles:(id)a3 state:(int64_t)a4 volume:(id)a5;
+ (BOOL)supportsSecureCoding;
+ (HMDMediaPlaybackAction)actionWithDictionaryRepresentation:(id)a3 home:(id)a4;
+ (id)logCategory;
- (BOOL)encodePlaybackArchiveForExecution;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (BOOL)isCompatibleWithAction:(id)a3;
- (BOOL)isUnsecuringAction;
- (Class)modelClass;
- (HMDHome)home;
- (HMDMediaPlaybackAction)initWithCoder:(id)a3;
- (HMDMediaPlaybackAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5;
- (HMDMediaPlaybackAction)initWithUUID:(id)a3 mediaProfiles:(id)a4 playbackState:(int64_t)a5 volume:(id)a6 playbackArchive:(id)a7 actionSet:(id)a8;
- (HMDMediaPlaybackActionAsCharacteristicWriteRequests)convertedCharacteristicWriteRequests;
- (MPPlaybackArchive)playbackArchive;
- (NSNumber)volume;
- (NSSet)mediaProfiles;
- (NSSet)profileUUIDs;
- (NSString)description;
- (id)associatedAccessories;
- (id)dictionaryRepresentation;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)modelObjectWithUpdatedMediaProfiles:(id)a3;
- (id)stateDump;
- (id)validate;
- (int64_t)state;
- (unint64_t)type;
- (void)_processPlaybackActionModelUpdated:(id)a3 message:(id)a4;
- (void)configureWithHome:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5;
- (void)setEncodePlaybackArchiveForExecution:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setMediaProfiles:(id)a3;
- (void)setPlaybackArchive:(id)a3;
- (void)setProfileUUIDs:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setVolume:(id)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDMediaPlaybackAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUUIDs, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

- (void)setProfileUUIDs:(id)a3
{
}

- (NSSet)profileUUIDs
{
  return self->_profileUUIDs;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setEncodePlaybackArchiveForExecution:(BOOL)a3
{
  self->_encodePlaybackArchiveForExecution = a3;
}

- (BOOL)encodePlaybackArchiveForExecution
{
  return self->_encodePlaybackArchiveForExecution;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setPlaybackArchive:(id)a3
{
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setVolume:(id)a3
{
}

- (NSNumber)volume
{
  return self->_volume;
}

- (void)setMediaProfiles:(id)a3
{
}

- (NSSet)mediaProfiles
{
  return self->_mediaProfiles;
}

- (id)modelObjectWithUpdatedMediaProfiles:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAction *)self modelObjectWithChangeType:2];
  if (v5)
  {
    v6 = [(HMDMediaPlaybackAction *)self home];
    if (!v6)
    {
      v7 = [(HMDAction *)self actionSet];
      v6 = [v7 home];
    }
    v8 = __mapProfilesToProfileUUIDs(v4);
    [v5 setProfiles:v8];
    v9 = mapProfilesToAccessoryUUIDs(v6, v8);
    [v5 setAccessories:v9];

    v10 = mapProfilesToServiceUUIDs(v6, v8);
    [v5 setServices:v10];

    id v11 = v5;
  }

  return v5;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  if (a4 < 4)
  {
    v10 = 0;
  }
  else
  {
    v6 = [(HMDAction *)self actionSet];
    v7 = [HMDMediaPlaybackActionModel alloc];
    v8 = [(HMDAction *)self uuid];
    v9 = [v6 uuid];
    v10 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:a3 uuid:v8 parentUUID:v9];

    id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDMediaPlaybackAction state](self, "state"));
    [(HMDMediaPlaybackActionModel *)v10 setState:v11];

    v12 = [(HMDMediaPlaybackAction *)self volume];
    [(HMDMediaPlaybackActionModel *)v10 setVolume:v12];

    v13 = [(HMDMediaPlaybackAction *)self home];
    if (!v13)
    {
      v13 = [v6 home];
    }
    v14 = [(HMDMediaPlaybackAction *)self profileUUIDs];
    v15 = (void *)[v14 copy];
    [(HMDMediaPlaybackActionModel *)v10 setProfiles:v15];

    v16 = [(HMDMediaPlaybackAction *)self profileUUIDs];
    v17 = mapProfilesToAccessoryUUIDs(v13, v16);
    [(HMDMediaPlaybackActionModel *)v10 setAccessories:v17];

    v18 = [(HMDMediaPlaybackAction *)self profileUUIDs];
    v19 = mapProfilesToServiceUUIDs(v13, v18);
    [(HMDMediaPlaybackActionModel *)v10 setServices:v19];

    v20 = [(HMDMediaPlaybackAction *)self playbackArchive];
    [(HMDMediaPlaybackActionModel *)v10 setEncodedPlaybackArchive:v20];
  }
  return v10;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (HMDMediaPlaybackAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      v16 = [v15 home];
      v17 = [v12 profiles];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __59__HMDMediaPlaybackAction_initWithModelObject_parent_error___block_invoke;
      v46[3] = &unk_1E6A16F58;
      id v18 = v16;
      id v47 = v18;
      v19 = objc_msgSend(v17, "na_map:", v46);

      if ([v19 count])
      {
        v42 = v19;
        id v44 = v15;
        id v41 = v18;
        uint64_t v20 = [v19 count];
        v21 = [v12 profiles];
        uint64_t v22 = [v21 count];

        if (v20 != v22)
        {
          v23 = (void *)MEMORY[0x1D9452090]();
          v24 = self;
          v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = HMFGetLogIdentifier();
            v27 = [v12 profiles];
            *(_DWORD *)buf = 138543874;
            v49 = v26;
            __int16 v50 = 2112;
            v51 = v42;
            __int16 v52 = 2112;
            v53 = v27;
            _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Couldn't find all media profiles on the home, found: %@ from UUIDs: %@", buf, 0x20u);
          }
        }
        v28 = [v12 uuid];
        v29 = [v12 state];
        uint64_t v30 = [v29 integerValue];
        v31 = [v12 volume];
        [v12 encodedPlaybackArchive];
        v33 = id v32 = v9;
        v19 = v42;
        self = [(HMDMediaPlaybackAction *)self initWithUUID:v28 mediaProfiles:v42 playbackState:v30 volume:v31 playbackArchive:v33 actionSet:v44];

        id v9 = v32;
        id v15 = v44;
        v34 = self;
        id v18 = v41;
      }
      else
      {
        v35 = (void *)MEMORY[0x1D9452090]();
        self = self;
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = v43 = v35;
          [v12 profiles];
          id v45 = v15;
          v39 = v38 = v19;
          *(_DWORD *)buf = 138543618;
          v49 = v37;
          __int16 v50 = 2112;
          v51 = v39;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find any media profiles in the home for the UUIDs: %@", buf, 0x16u);

          v19 = v38;
          id v15 = v45;

          v35 = v43;
        }

        if (a5)
        {
          [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          v34 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v34 = 0;
        }
      }
    }
    else if (a5)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      v34 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
    v34 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

id __59__HMDMediaPlaybackAction_initWithModelObject_parent_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  v6 = [*(id *)(a1 + 32) mediaProfileWithUUID:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HMDMediaPlaybackAction;
  [(HMDAction *)&v24 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDMediaPlaybackAction state](self, "state"));
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F2D928]];

  v6 = [(HMDMediaPlaybackAction *)self volume];
  [v4 encodeObject:v6 forKey:*MEMORY[0x1E4F2D938]];

  v7 = [(HMDMediaPlaybackAction *)self playbackArchive];
  [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F2D908]];

  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    id v8 = [(HMDMediaPlaybackAction *)self mediaProfiles];
    [v4 encodeObject:v8 forKey:*MEMORY[0x1E4F2D918]];

    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [(HMDAction *)v10 uuid];
      v14 = [v13 UUIDString];
      uint64_t v15 = [(HMDMediaPlaybackAction *)v10 state];
      v16 = [(HMDMediaPlaybackAction *)v10 mediaProfiles];
      v17 = [(HMDMediaPlaybackAction *)v10 playbackArchive];
      *(_DWORD *)buf = 138544386;
      v26 = v12;
      __int16 v27 = 2112;
      v28 = v14;
      __int16 v29 = 2048;
      uint64_t v30 = v15;
      __int16 v31 = 2112;
      id v32 = v16;
      __int16 v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@XPC Encoded Playback action uuid %@ state %tu profiles %@ playbackArchive %@", buf, 0x34u);

LABEL_6:
    }
  }
  else
  {
    id v18 = [(HMDMediaPlaybackAction *)self profileUUIDs];
    [v4 encodeObject:v18 forKey:@"HDMPA.profileUUIDs"];

    id v9 = (void *)MEMORY[0x1D9452090]();
    v19 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v20 = [(HMDAction *)v19 uuid];
      v21 = [v20 UUIDString];
      uint64_t v22 = [(HMDMediaPlaybackAction *)v19 state];
      v23 = [(HMDMediaPlaybackAction *)v19 profileUUIDs];
      *(_DWORD *)buf = 138544130;
      v26 = v12;
      __int16 v27 = 2112;
      v28 = v21;
      __int16 v29 = 2048;
      uint64_t v30 = v22;
      __int16 v31 = 2112;
      id v32 = v23;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Cloud Encoded Playback action uuid %@ state %tu profiles %@", buf, 0x2Au);

      goto LABEL_6;
    }
  }
}

- (HMDMediaPlaybackAction)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMDAction alloc] initWithCoder:v4];
  if (v5)
  {
    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2D928]];
    uint64_t v24 = [v25 integerValue];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2D938]];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    id v9 = [v7 setWithArray:v8];

    id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HDMPA.profileUUIDs"];
    id v11 = (void *)[v10 mutableCopy];

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2D908]];
    id v13 = [(HMDAction *)v5 actionSet];
    v14 = [(HMDAction *)v5 uuid];
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] set];
    v16 = [(HMDMediaPlaybackAction *)self initWithUUID:v14 mediaProfiles:v15 playbackState:v24 volume:v6 playbackArchive:v12 actionSet:v13];

    [(HMDMediaPlaybackAction *)v16 setProfileUUIDs:v11];
    v17 = v16;

    id v18 = v17;
  }
  else
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      v26.receiver = v17;
      v26.super_class = (Class)HMDMediaPlaybackAction;
      id v22 = [(HMDMediaPlaybackAction *)&v26 class];
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v21;
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode base class: %@", buf, 0x16u);
    }
    id v18 = 0;
  }

  return v18;
}

- (void)_processPlaybackActionModelUpdated:(id)a3 message:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 transactionResult];
  id v9 = [v6 setProperties];
  int v10 = [v9 containsObject:@"state"];

  if (v10)
  {
    id v11 = [v6 state];
    -[HMDMediaPlaybackAction setState:](self, "setState:", [v11 integerValue]);
  }
  id v12 = [v6 setProperties];
  int v13 = [v12 containsObject:@"volume"];

  if (v13)
  {
    v14 = [v6 volume];
    [(HMDMediaPlaybackAction *)self setVolume:v14];

    int v10 = 1;
  }
  uint64_t v15 = [v6 setProperties];
  int v16 = [v15 containsObject:@"encodedPlaybackArchive"];

  if (v16)
  {
    v17 = [v6 encodedPlaybackArchive];
    [(HMDMediaPlaybackAction *)self setPlaybackArchive:v17];

    int v10 = 1;
  }
  id v18 = [v6 setProperties];
  int v19 = [v18 containsObject:@"profiles"];

  if (v19)
  {
    uint64_t v20 = [(HMDMediaPlaybackAction *)self home];
    v21 = [v6 profiles];
    id v22 = __mapUUIDsToProfiles(v20, v21);
    [(HMDMediaPlaybackAction *)self setMediaProfiles:v22];

    v23 = [v6 profiles];
    uint64_t v24 = (void *)[v23 mutableCopy];
    [(HMDMediaPlaybackAction *)self setProfileUUIDs:v24];
  }
  else if (!v10)
  {
    v25 = 0;
    goto LABEL_17;
  }
  v25 = [(HMDAction *)self actionSet];
  uint64_t v26 = [v25 home];
  __int16 v27 = (void *)v26;
  if (v25 && v26)
  {
    v46[0] = @"kActionUUID";
    id v45 = [(HMDAction *)self uuid];
    v28 = [v45 UUIDString];
    v47[0] = v28;
    v46[1] = @"kActionInfo";
    __int16 v29 = [(HMDMediaPlaybackAction *)self dictionaryRepresentation];
    v47[1] = v29;
    v46[2] = @"kHomeUUID";
    [v27 uuid];
    v31 = __int16 v30 = v8;
    [v31 UUIDString];
    id v44 = v27;
    v33 = id v32 = v7;
    v47[2] = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];

    id v7 = v32;
    id v8 = v30;

    v25 = (void *)v34;
LABEL_17:
    v40 = (void *)MEMORY[0x1D9452090]([v7 respondWithPayload:v25]);
    id v41 = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v43;
      __int16 v50 = 2112;
      id v51 = v25;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Responding to client after updating action with response: %@", buf, 0x16u);
    }
    [v8 markChanged];
    goto LABEL_20;
  }
  uint64_t v35 = (void *)MEMORY[0x1D9452090]();
  v36 = self;
  v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v38 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v49 = v38;
    __int16 v50 = 2112;
    id v51 = v6;
    __int16 v52 = 2112;
    v53 = v25;
    __int16 v54 = 2112;
    v55 = v27;
    _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Playback action Model object (%@) missing actionset %@ or home %@ ", buf, 0x2Au);
  }
  v39 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  [v7 respondWithError:v39];

LABEL_20:
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    [(HMDMediaPlaybackAction *)self _processPlaybackActionModelUpdated:v13 message:v10];
  }
  else
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v20 = 138543874;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = (id)objc_opt_class();
      id v18 = v25;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v20, 0x20u);
    }
    int v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v10 respondWithError:v19];
  }
}

- (BOOL)isUnsecuringAction
{
  return 0;
}

- (id)associatedAccessories
{
  v2 = [(HMDMediaPlaybackAction *)self mediaProfiles];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_38_174461);
  id v4 = [v3 allObjects];

  return v4;
}

uint64_t __47__HMDMediaPlaybackAction_associatedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDMediaPlaybackAction;
  if ([(HMDAction *)&v9 isCompatibleWithAction:v4])
  {
    v5 = [(HMDMediaPlaybackAction *)self mediaProfiles];
    id v6 = [v4 mediaProfiles];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 home];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(HMDMediaPlaybackAction *)self profileUUIDs];
  char v7 = (void *)[v6 copy];
  id v8 = mapProfilesToAccessoryUUIDs(v5, v7);

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v4 uuid];
        v14 = [v13 UUIDString];
        LOBYTE(v12) = [v12 isEqualToString:v14];

        if (v12)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (NSString)description
{
  v3 = [(HMDMediaPlaybackAction *)self mediaProfiles];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_174464);
  v5 = [v4 allObjects];
  id v6 = [v5 componentsJoinedByString:@",\n"];

  char v7 = NSString;
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = [(HMDAction *)self uuid];
  int64_t v11 = [(HMDMediaPlaybackAction *)self state];
  id v12 = [(HMDMediaPlaybackAction *)self volume];
  id v13 = [(HMDMediaPlaybackAction *)self playbackArchive];
  v14 = [v7 stringWithFormat:@"%@<uuid %@ play state %ld volume %@ playbackArchive %@ mediaProfiles {%@}>", v9, v10, v11, v12, v13, v6];

  return (NSString *)v14;
}

uint64_t __37__HMDMediaPlaybackAction_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (HMDMediaPlaybackActionAsCharacteristicWriteRequests)convertedCharacteristicWriteRequests
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDMediaPlaybackAction *)self playbackArchive];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    v5 = [(HMDMediaPlaybackAction *)self mediaProfiles];
    id v6 = [v5 allObjects];

    v36 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
    char v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2 * objc_msgSend(v6, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v14 = v13;
          }
          else {
            v14 = 0;
          }
          id v15 = v14;

          if (v15)
          {
            if ([(HMDMediaPlaybackAction *)self state])
            {
              long long v16 = objc_msgSend(v15, "playStateWriteRequestWithPlaybackState:", -[HMDMediaPlaybackAction state](self, "state"));
              if (v16) {
                [v7 addObject:v16];
              }
            }
            long long v17 = [(HMDMediaPlaybackAction *)self volume];

            if (v17)
            {
              long long v18 = [(HMDMediaPlaybackAction *)self volume];
              [v18 floatValue];
              float v20 = v19 / 100.0;

              *(float *)&double v21 = v20;
              [NSNumber numberWithFloat:v21];
              v23 = __int16 v22 = v7;
              __int16 v24 = [v15 volumeWriteRequestWithVolumePercentage:v23];

              char v7 = v22;
              if (v24) {
                [v22 addObject:v24];
              }
            }
          }
          else
          {
            [v36 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      id v25 = v36;
      if ([v36 count])
      {
        uint64_t v26 = [HMDMediaPlaybackAction alloc];
        __int16 v27 = [(HMDAction *)self uuid];
        int64_t v28 = [(HMDMediaPlaybackAction *)self state];
        [(HMDMediaPlaybackAction *)self volume];
        __int16 v30 = v29 = v7;
        id v31 = [(HMDMediaPlaybackAction *)self playbackArchive];
        id v32 = [(HMDAction *)self actionSet];
        __int16 v33 = [(HMDMediaPlaybackAction *)v26 initWithUUID:v27 mediaProfiles:v36 playbackState:v28 volume:v30 playbackArchive:v31 actionSet:v32];

        char v7 = v29;
        uint64_t v34 = [(HMDMediaPlaybackAction *)self home];
        [(HMDMediaPlaybackAction *)v33 configureWithHome:v34];
      }
      else
      {
        __int16 v33 = 0;
      }
      id v4 = [[HMDMediaPlaybackActionAsCharacteristicWriteRequests alloc] initWithAction:v33 characteristicWriteRequests:v7];
    }
    else
    {
      id v4 = 0;
      id v25 = v36;
    }
  }
  return v4;
}

- (id)validate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDMediaPlaybackAction *)self mediaProfiles];
  int64_t v4 = [(HMDMediaPlaybackAction *)self state];
  v5 = [(HMDMediaPlaybackAction *)self volume];
  BOOL v6 = +[HMDMediaPlaybackAction isPlaybackActionValidWithProfiles:v3 state:v4 volume:v5];

  if (v6)
  {
    char v7 = 0;
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [(HMDMediaPlaybackAction *)v9 state];
      id v13 = [(HMDMediaPlaybackAction *)v9 volume];
      v14 = [(HMDMediaPlaybackAction *)v9 mediaProfiles];
      int v16 = 138544130;
      long long v17 = v11;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      double v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = [v14 count];
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid configuration for media playback action - state: %tu  volume: %@  #Profiles: %tu", (uint8_t *)&v16, 0x2Au);
    }
    char v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Invalid configuration for media playback action" reason:0 suggestion:0];
  }
  return v7;
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HMDMediaPlaybackAction *)self home];
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      double v21 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Executing media playback action", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v12);
    id v15 = [v10 mediaActionRouter];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__HMDMediaPlaybackAction_executeWithSource_clientName_completionHandler___block_invoke;
    v17[3] = &unk_1E6A16F80;
    objc_copyWeak(&v19, (id *)buf);
    id v18 = v9;
    [v15 routeMediaActionForExecution:v12 source:a3 clientName:v8 completion:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else if (v9)
  {
    int v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
    (*((void (**)(id, void *))v9 + 2))(v9, v16);
  }
}

void __73__HMDMediaPlaybackAction_executeWithSource_clientName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  char v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v9 = HMFGetLogIdentifier();
    int v15 = 138543874;
    int v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v3;
    uint64_t v10 = "%{public}@Failed to execute %@ with error: %@";
    uint64_t v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v9 = HMFGetLogIdentifier();
    int v15 = 138543618;
    int v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    uint64_t v10 = "%{public}@Successfully executed %@";
    uint64_t v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 22;
  }
  _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v15, v13);

LABEL_7:
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaPlaybackAction;
  id v3 = [(HMDAction *)&v22 dictionaryRepresentation];
  int64_t v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDMediaPlaybackAction state](self, "state"));
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2D930]];

  id v6 = [(HMDMediaPlaybackAction *)self volume];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2D940]];

  char v7 = [(HMDMediaPlaybackAction *)self mediaProfiles];
  id v8 = __mapProfilesToProfileUUIDs(v7);
  id v9 = [v8 allObjects];
  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F2D920]];

  uint64_t v10 = [(HMDMediaPlaybackAction *)self playbackArchive];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28DB0];
    os_log_type_t v12 = [(HMDMediaPlaybackAction *)self playbackArchive];
    id v21 = 0;
    uint32_t v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v21];
    id v14 = v21;

    if (v13)
    {
      [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F2D910]];
    }
    else
    {
      int v15 = (void *)MEMORY[0x1D9452090]();
      int v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode playbackArchive: %@", buf, 0x16u);
      }
    }
  }
  __int16 v19 = (void *)[v4 copy];

  return v19;
}

- (id)stateDump
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  int64_t v4 = [(HMDAction *)self uuid];
  v5 = [v4 UUIDString];
  int64_t v6 = [(HMDMediaPlaybackAction *)self state];
  char v7 = [(HMDMediaPlaybackAction *)self volume];
  id v8 = [(HMDMediaPlaybackAction *)self playbackArchive];
  id v9 = [(HMDMediaPlaybackAction *)self profileUUIDs];
  uint64_t v10 = [v3 stringWithFormat:@"Action uuid: %@, state: %tu, volume: %@, playbackArchive: %@, profileUUIDs: %@", v5, v6, v7, v8, v9];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [(HMDMediaPlaybackAction *)self mediaProfiles];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) uniqueIdentifier];
        __int16 v17 = [v16 UUIDString];
        [v10 appendFormat:@" %@", v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  id v18 = (void *)[v10 copy];
  return v18;
}

- (unint64_t)type
{
  return 1;
}

- (void)configureWithHome:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HMDMediaPlaybackAction *)self setHome:v4];
  v5 = [(HMDMediaPlaybackAction *)self profileUUIDs];
  int64_t v6 = __mapUUIDsToProfiles(v4, v5);
  [(HMDMediaPlaybackAction *)self setMediaProfiles:v6];

  char v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [(HMDMediaPlaybackAction *)v8 profileUUIDs];
    uint64_t v12 = [(HMDMediaPlaybackAction *)v8 mediaProfiles];
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    int v16 = v11;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Mapped profile UUIDs %@ to profiles %@", (uint8_t *)&v13, 0x20u);
  }
}

- (HMDMediaPlaybackAction)initWithUUID:(id)a3 mediaProfiles:(id)a4 playbackState:(int64_t)a5 volume:(id)a6 playbackArchive:(id)a7 actionSet:(id)a8
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMDMediaPlaybackAction;
  uint64_t v19 = [(HMDAction *)&v26 initWithUUID:a3 actionSet:v18];
  long long v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_mediaProfiles, a4);
    long long v21 = __mapProfilesToProfileUUIDs(v15);
    uint64_t v22 = [v21 mutableCopy];
    profileUUIDs = v20->_profileUUIDs;
    v20->_profileUUIDs = (NSSet *)v22;

    objc_storeStrong((id *)&v20->_volume, a6);
    v20->_state = a5;
    objc_storeStrong((id *)&v20->_playbackArchive, a7);
    uint64_t v24 = [v18 home];
    objc_storeWeak((id *)&v20->_home, v24);
  }
  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_174504 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_174504, &__block_literal_global_63_174505);
  }
  v2 = (void *)logCategory__hmf_once_v25_174506;
  return v2;
}

uint64_t __37__HMDMediaPlaybackAction_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v25_174506;
  logCategory__hmf_once_v25_174506 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isPlaybackActionValidWithProfiles:(id)a3 state:(int64_t)a4 volume:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v8 floatValue];
  if (v9 >= -0.00000011921)
  {
    [v8 floatValue];
    BOOL v10 = v11 <= 100.0;
  }
  else
  {
    BOOL v10 = 0;
  }
  BOOL v12 = (unint64_t)a4 < 3 && v10;
  if (![v7 count]) {
    BOOL v12 = 0;
  }

  return v12;
}

+ (HMDMediaPlaybackAction)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_numberForKey:", @"kActionType");
  if ([v8 unsignedIntegerValue] == 1)
  {
    float v9 = [HMDMediaPlaybackActionModel alloc];
    BOOL v10 = [MEMORY[0x1E4F29128] UUID];
    float v11 = [v7 uuid];
    BOOL v12 = [(HMDBackingStoreModelObject *)v9 initWithObjectChangeType:0 uuid:v10 parentUUID:v11];

    [(HMDMediaPlaybackActionModel *)v12 loadModelWithActionInformation:v6];
    int v13 = [(HMDMediaPlaybackActionModel *)v12 profiles];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __66__HMDMediaPlaybackAction_actionWithDictionaryRepresentation_home___block_invoke;
    v42[3] = &unk_1E6A16F58;
    id v43 = v7;
    uint64_t v14 = objc_msgSend(v13, "na_map:", v42);

    if ([v14 count])
    {
      id v41 = v8;
      uint64_t v15 = [v14 count];
      id v16 = [(HMDMediaPlaybackActionModel *)v12 profiles];
      uint64_t v17 = [v16 count];

      if (v15 != v17)
      {
        id v18 = (void *)MEMORY[0x1D9452090]();
        id v19 = a1;
        long long v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          long long v21 = HMFGetLogIdentifier();
          uint64_t v22 = [(HMDMediaPlaybackActionModel *)v12 profiles];
          *(_DWORD *)buf = 138543874;
          id v45 = v21;
          __int16 v46 = 2112;
          id v47 = v14;
          __int16 v48 = 2112;
          v49 = v22;
          _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Couldn't find all media profiles on the home, found: %@ from UUIDs: %@", buf, 0x20u);
        }
      }
      long long v23 = [HMDMediaPlaybackAction alloc];
      uint64_t v24 = [(HMDBackingStoreModelObject *)v12 uuid];
      uint64_t v25 = [(HMDMediaPlaybackActionModel *)v12 state];
      uint64_t v26 = [v25 integerValue];
      uint64_t v27 = [(HMDMediaPlaybackActionModel *)v12 volume];
      [(HMDMediaPlaybackActionModel *)v12 encodedPlaybackArchive];
      __int16 v29 = v28 = v7;
      __int16 v30 = [(HMDMediaPlaybackAction *)v23 initWithUUID:v24 mediaProfiles:v14 playbackState:v26 volume:v27 playbackArchive:v29 actionSet:0];

      id v7 = v28;
      id v8 = v41;
    }
    else
    {
      uint64_t v35 = (void *)MEMORY[0x1D9452090]();
      id v36 = a1;
      long long v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        long long v38 = HMFGetLogIdentifier();
        long long v39 = [(HMDMediaPlaybackActionModel *)v12 profiles];
        *(_DWORD *)buf = 138543618;
        id v45 = v38;
        __int16 v46 = 2112;
        id v47 = v39;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find any media profiles in the home for the UUIDs: %@", buf, 0x16u);
      }
      __int16 v30 = 0;
    }
  }
  else
  {
    id v31 = (void *)MEMORY[0x1D9452090]();
    id v32 = a1;
    __int16 v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v45 = v34;
      __int16 v46 = 2112;
      id v47 = v8;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Invalid action type: %@", buf, 0x16u);
    }
    __int16 v30 = 0;
  }

  return v30;
}

id __66__HMDMediaPlaybackAction_actionWithDictionaryRepresentation_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  id v6 = [*(id *)(a1 + 32) mediaProfileWithUUID:v5];

  return v6;
}

@end