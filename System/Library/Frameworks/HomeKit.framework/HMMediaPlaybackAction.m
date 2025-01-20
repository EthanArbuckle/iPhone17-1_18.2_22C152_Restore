@interface HMMediaPlaybackAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithProtoBuf:(id)a3 home:(id)a4;
- (BOOL)_handleUpdates:(id)a3;
- (BOOL)_updateWithSerializedAction:(id)a3 home:(id)a4;
- (BOOL)isAffectedByEndEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMMediaPlaybackAction)init;
- (HMMediaPlaybackAction)initWithCoder:(id)a3;
- (HMMediaPlaybackAction)initWithDictionary:(id)a3 home:(id)a4;
- (HMMediaPlaybackAction)initWithMediaProfiles:(id)a3 playbackState:(int64_t)a4 volume:(id)a5 playbackArchive:(id)a6;
- (HMMediaPlaybackAction)initWithUUID:(id)a3;
- (MPPlaybackArchive)playbackArchive;
- (NSNumber)volume;
- (NSSet)mediaProfiles;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProtoBuf;
- (id)initWithMediaProfiles:(uint64_t)a3 playbackState:(void *)a4 volume:(void *)a5 playbackArchive:(uint64_t)a6 uuid:;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)state;
- (unint64_t)type;
- (void)__configureWithContext:(id)a3 actionSet:(id)a4;
- (void)updateWithAction:(id)a3 completionHandler:(id)a4;
@end

@implementation HMMediaPlaybackAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_volume, 0);

  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMMediaPlaybackAction *)a3;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (!v6) {
      goto LABEL_10;
    }
    v7 = [(HMMediaPlaybackAction *)self mediaProfiles];
    v8 = [(HMMediaPlaybackAction *)v6 mediaProfiles];
    int v9 = [v7 isEqualToSet:v8];

    if (!v9) {
      goto LABEL_10;
    }
    v10 = [(HMMediaPlaybackAction *)self playbackArchive];
    v11 = [(HMMediaPlaybackAction *)v6 playbackArchive];
    int v12 = HMFEqualObjects();

    if (!v12) {
      goto LABEL_10;
    }
    int64_t v13 = [(HMMediaPlaybackAction *)self state];
    if (v13 == [(HMMediaPlaybackAction *)v6 state])
    {
      v14 = [(HMMediaPlaybackAction *)self volume];
      v15 = [(HMMediaPlaybackAction *)v6 volume];
      char v16 = HMFEqualObjects();
    }
    else
    {
LABEL_10:
      char v16 = 0;
    }
  }
  return v16;
}

- (BOOL)mergeFromNewObject:(id)a3
{
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
    v7 = [(HMAction *)self actionSet];
    v8 = [v7 home];

    int64_t v9 = [v6 state];
    v10 = [v6 volume];
    v11 = [v6 playbackArchive];
    int v12 = [v6 mediaProfiles];
    os_unfair_lock_lock_with_options();
    int64_t state = self->_state;
    BOOL v14 = state != v9;
    if (state != v9) {
      self->_int64_t state = v9;
    }
    if ((HMFEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_volume, v10);
      BOOL v14 = 1;
    }
    if ((HMFEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_playbackArchive, v11);
      BOOL v14 = 1;
    }
    if ((HMFEqualObjects() & 1) == 0)
    {
      resolveProfiles(v12, v8);
      v15 = (NSSet *)objc_claimAutoreleasedReturnValue();
      mediaProfiles = self->_mediaProfiles;
      self->_mediaProfiles = v15;

      BOOL v14 = 1;
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_handleUpdates:(id)a3
{
  id v4 = a3;
  v5 = [(HMAction *)self actionSet];
  id v6 = [v5 home];
  LOBYTE(self) = [(HMMediaPlaybackAction *)self _updateWithSerializedAction:v4 home:v6];

  return (char)self;
}

- (BOOL)_updateWithSerializedAction:(id)a3 home:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v6, "hmf_numberForKey:", @"kActionType");
  uint64_t v9 = [v8 unsignedIntegerValue];
  BOOL v10 = 0;
  if (v8 && v9 == 1)
  {
    v11 = objc_msgSend(v6, "hmf_numberForKey:", @"state");
    int64_t v12 = [v11 integerValue];
    int64_t v13 = objc_msgSend(v6, "hmf_numberForKey:", @"volume");
    uint64_t v14 = objc_msgSend(v6, "hmf_dataForKey:", @"playbackArchive");
    v42 = (void *)v14;
    if (v14)
    {
      uint64_t v15 = v14;
      char v16 = (void *)MEMORY[0x1E4F28DC0];
      getMPPlaybackArchiveClass();
      id v45 = 0;
      v17 = [v16 unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:&v45];
      id v18 = v45;
      if (!v17)
      {
        id obj = v13;
        context = (void *)MEMORY[0x19F3A64A0]();
        v19 = self;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v47 = v36;
          __int16 v48 = 2112;
          id v49 = v18;
          _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode playbackArchive: %@", buf, 0x16u);
        }
        int64_t v13 = obj;
      }
    }
    else
    {
      v17 = 0;
    }
    if (v12) {
      BOOL v21 = v11 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (!v21 || v13 || v17)
    {
      id obja = v13;
      v26 = objc_msgSend(v6, "hmf_arrayForKey:", @"profiles");
      id v39 = v7;
      if (v26)
      {
        v27 = (void *)MEMORY[0x1E4F1CAD0];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __58__HMMediaPlaybackAction__updateWithSerializedAction_home___block_invoke;
        v43[3] = &unk_1E593FF28;
        id v44 = v7;
        v28 = objc_msgSend(v26, "na_map:", v43);
        v29 = [v27 setWithArray:v28];
      }
      else
      {
        v29 = 0;
      }
      uint64_t v30 = [v29 count];
      BOOL v10 = v30 != 0;
      if (v30)
      {
        os_unfair_lock_lock_with_options();
        self->_int64_t state = v12;
        objc_storeStrong((id *)&self->_volume, obja);
        objc_storeStrong((id *)&self->_playbackArchive, v17);
        objc_storeStrong((id *)&self->_mediaProfiles, v29);
        os_unfair_lock_unlock(&self->_lock);
      }
      else
      {
        v31 = (void *)MEMORY[0x19F3A64A0]();
        v32 = self;
        v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = contexta = v31;
          *(_DWORD *)buf = 138543362;
          v47 = v34;
          _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@_updateWithSerializedAction no media profiles in action", buf, 0xCu);

          v31 = contexta;
        }
      }

      id v7 = v39;
      int64_t v13 = obja;
    }
    else
    {
      v22 = (void *)MEMORY[0x19F3A64A0]();
      v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v47 = v25;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@_updateWithSerializedAction no state, volume, or queue contained in action", buf, 0xCu);
      }
      BOOL v10 = 0;
    }
  }
  return v10;
}

id __58__HMMediaPlaybackAction__updateWithSerializedAction_home___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  id v6 = [*(id *)(a1 + 32) mediaProfileWithProfileUUID:v5];

  return v6;
}

- (BOOL)isAffectedByEndEvents
{
  return [(HMMediaPlaybackAction *)self state] == 1;
}

- (BOOL)isValidWithError:(id *)a3
{
  id v4 = [(HMMediaPlaybackAction *)self mediaProfiles];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 0;
  }
  if ([(HMMediaPlaybackAction *)self state]) {
    return 1;
  }
  id v7 = [(HMMediaPlaybackAction *)self volume];
  if (v7)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(HMMediaPlaybackAction *)self playbackArchive];
    BOOL v6 = v7 != 0;
  }

  return v6;
}

- (id)_serializeForAdd
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if ([(HMAction *)self isValid])
  {
    v25.receiver = self;
    v25.super_class = (Class)HMMediaPlaybackAction;
    v3 = [(HMAction *)&v25 _serializeForAdd];
    id v4 = (void *)[v3 mutableCopy];

    uint64_t v30 = @"state";
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMediaPlaybackAction state](self, "state"));
    v31[0] = v5;
    BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    [v4 addEntriesFromDictionary:v6];

    id v7 = [(HMMediaPlaybackAction *)self volume];

    if (v7)
    {
      v8 = [(HMMediaPlaybackAction *)self volume];
      [v4 setObject:v8 forKey:@"volume"];
    }
    uint64_t v9 = [(HMMediaPlaybackAction *)self playbackArchive];

    if (v9)
    {
      BOOL v10 = (void *)MEMORY[0x1E4F28DB0];
      v11 = [(HMMediaPlaybackAction *)self playbackArchive];
      id v24 = 0;
      int64_t v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v24];
      id v13 = v24;

      if (v12)
      {
        [v4 setObject:v12 forKey:@"playbackArchive"];
      }
      else
      {
        uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
        char v16 = self;
        v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v27 = v18;
          __int16 v28 = 2112;
          id v29 = v13;
          _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode playbackArchive: %@", buf, 0x16u);
        }
      }
    }
    v19 = [(HMMediaPlaybackAction *)self mediaProfiles];
    v20 = (void *)[v19 copy];

    BOOL v21 = objc_msgSend(v20, "na_map:", &__block_literal_global_18323);
    v22 = [v21 allObjects];
    [v4 setObject:v22 forKeyedSubscript:@"profiles"];

    uint64_t v14 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

id __41__HMMediaPlaybackAction__serializeForAdd__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 profileUniqueIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (HMMediaPlaybackAction)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMMediaPlaybackAction;
  v8 = [(HMAction *)&v17 initWithDictionary:v6 home:v7];
  uint64_t v9 = v8;
  if (v8
    && ![(HMMediaPlaybackAction *)v8 _updateWithSerializedAction:v6 home:v7])
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    int64_t v12 = v9;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@", buf, 0x16u);
    }
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = v9;
  }

  return v10;
}

- (void)updateWithAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMMediaPlaybackAction updateWithAction:completionHandler:]", @"action"];
    objc_super v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
LABEL_18:
    __int16 v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v31 = v28;
    __int16 v32 = 2112;
    v33 = (const char *)v24;
    _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_19:
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  v8 = (void (**)(void, void))v7;
  uint64_t v9 = [(HMAction *)self context];
  if (!v8)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMMediaPlaybackAction updateWithAction:completionHandler:]", @"completion"];
    objc_super v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  BOOL v10 = (void *)v9;
  if (v9)
  {
    v11 = [(HMAction *)self actionSet];
    int64_t v12 = [v11 home];
    if (v12)
    {
      id v13 = [v6 _serializeForAdd];
      uint64_t v14 = [(HMAction *)self uuid];

      if (v14)
      {
        [v11 _updateAction:self changes:v13 completionHandler:v8];
LABEL_13:

        goto LABEL_14;
      }
      [(HMMediaPlaybackAction *)self _updateWithSerializedAction:v13 home:v12];
      uint64_t v21 = [v10 delegateCaller];
      __int16 v20 = v21;
      uint64_t v22 = v8;
      v23 = 0;
    }
    else
    {
      id v13 = [v10 delegateCaller];
      __int16 v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      uint64_t v21 = v13;
      uint64_t v22 = v8;
      v23 = v20;
    }
    [v21 callCompletion:v22 error:v23];

    goto LABEL_13;
  }
  uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
  char v16 = self;
  objc_super v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v31 = v18;
    __int16 v32 = 2080;
    v33 = "-[HMMediaPlaybackAction updateWithAction:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  ((void (**)(void, void *))v8)[2](v8, v19);

LABEL_14:
}

- (HMMediaPlaybackAction)initWithCoder:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HMMediaPlaybackAction;
  uint64_t v5 = [(HMAction *)&v31 initWithCoder:v4];
  id v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  id v7 = [(HMAction *)v5 actionSet];
  v8 = [v7 home];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  int64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"HMMPA.profiles"];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __39__HMMediaPlaybackAction_initWithCoder___block_invoke;
  v29[3] = &unk_1E593FEE0;
  id v13 = v8;
  id v30 = v13;
  uint64_t v14 = objc_msgSend(v12, "na_map:", v29);
  mediaProfiles = v6->_mediaProfiles;
  v6->_mediaProfiles = (NSSet *)v14;

  uint64_t v16 = [(NSSet *)v6->_mediaProfiles count];
  if (v16)
  {
    objc_super v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMPA.state"];
    v6->_int64_t state = [v17 integerValue];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMPA.volume"];
    volume = v6->_volume;
    v6->_volume = (NSNumber *)v18;

    getMPPlaybackArchiveClass();
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMPA.archive"];
    playbackArchive = v6->_playbackArchive;
    v6->_playbackArchive = (MPPlaybackArchive *)v20;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x19F3A64A0]();
    v23 = v6;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_super v25 = HMFGetLogIdentifier();
      uint64_t v26 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v33 = v25;
      __int16 v34 = 2112;
      uint64_t v35 = v26;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, no media profiles", buf, 0x16u);
    }
  }

  if (!v16) {
    v27 = 0;
  }
  else {
LABEL_8:
  }
    v27 = v6;

  return v27;
}

id __39__HMMediaPlaybackAction_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 uniqueIdentifier];
  id v4 = [v2 mediaProfileWithUUID:v3];

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = -[HMMediaPlaybackAction initWithMediaProfiles:playbackState:volume:playbackArchive:uuid:]([HMMutableMediaPlaybackAction alloc], self->_mediaProfiles, self->_state, self->_volume, self->_playbackArchive, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)initWithMediaProfiles:(uint64_t)a3 playbackState:(void *)a4 volume:(void *)a5 playbackArchive:(uint64_t)a6 uuid:
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)HMMediaPlaybackAction;
    id v14 = objc_msgSendSuper2(&v20, sel_initWithUUID_, a6);
    if (v14)
    {
      uint64_t v15 = [v11 copy];
      uint64_t v16 = (void *)*((void *)v14 + 7);
      *((void *)v14 + 7) = v15;

      *((void *)v14 + 8) = a3;
      uint64_t v17 = [v12 copy];
      uint64_t v18 = (void *)*((void *)v14 + 9);
      *((void *)v14 + 9) = v17;

      objc_storeStrong((id *)v14 + 10, a5);
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithProtoBuf:(id)a3 home:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = a4;
  v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F29128];
    id v11 = v6[1];
    id v12 = objc_msgSend(v10, "hmf_UUIDWithBytesAsData:", v11);

    if (v12)
    {
      id v51 = a1;
      v53 = v12;
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v14 = v6[3];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v57;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v57 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_UUIDWithBytesAsData:", *(void *)(*((void *)&v56 + 1) + 8 * i));
            uint64_t v20 = [v8 mediaProfileWithUUID:v19];
            if (!v20)
            {
              __int16 v34 = (void *)MEMORY[0x19F3A64A0]();
              uint64_t v35 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                uint64_t v36 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                uint64_t v62 = (uint64_t)v36;
                __int16 v63 = 2112;
                id v64 = v19;
                _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find mediaProfile: %@", buf, 0x16u);
              }
              id v9 = 0;
              id v12 = v53;
              goto LABEL_33;
            }
            uint64_t v21 = (void *)v20;
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v56 objects:v65 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      id v14 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v13];
      uint64_t v50 = *((int *)v6 + 4);
      unint64_t v22 = 0x1E4F28000uLL;
      if (v6[5])
      {
        v23 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v60 = objc_opt_class();
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
        objc_super v25 = [v23 setWithArray:v24];

        uint64_t v26 = (void *)MEMORY[0x1E4F28DC0];
        id v27 = v6[5];
        id v55 = 0;
        v19 = [v26 unarchivedObjectOfClasses:v25 fromData:v27 error:&v55];
        id v28 = v55;

        if (!v19)
        {
          id v29 = (void *)MEMORY[0x19F3A64A0]();
          id v30 = v51;
          objc_super v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            uint64_t v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v62 = v32;
            contexta = v29;
            v33 = (void *)v32;
            __int16 v63 = 2112;
            id v64 = v28;
            _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive volume from volume data: %@", buf, 0x16u);

            id v29 = contexta;
          }
        }

        unint64_t v22 = 0x1E4F28000;
      }
      else
      {
        v19 = 0;
      }
      if (v6[4])
      {
        v40 = *(void **)(v22 + 3520);
        getMPPlaybackArchiveClass();
        uint64_t v41 = objc_opt_class();
        id v42 = v6[4];
        id v54 = 0;
        v43 = [v40 unarchivedObjectOfClass:v41 fromData:v42 error:&v54];
        id v44 = v54;

        id v12 = v53;
        if (!v43)
        {
          context = (void *)MEMORY[0x19F3A64A0]();
          id v45 = v51;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v52 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v62 = (uint64_t)v52;
            __int16 v63 = 2112;
            id v64 = v44;
            _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_ERROR, "%{public}@Can't decode playbackArchive from protobuf: %@", buf, 0x16u);
          }
        }
      }
      else
      {
        v43 = 0;
        id v12 = v53;
      }
      id v9 = -[HMMediaPlaybackAction initWithMediaProfiles:playbackState:volume:playbackArchive:uuid:]([HMMediaPlaybackAction alloc], v14, v50, v19, v43, (uint64_t)v12);

LABEL_33:
    }
    else
    {
      v37 = (void *)MEMORY[0x19F3A64A0]();
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v62 = (uint64_t)v39;
        _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode uuid for action", buf, 0xCu);
      }
      id v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = -[HMMediaPlaybackAction initWithMediaProfiles:playbackState:volume:playbackArchive:uuid:]([HMMediaPlaybackAction alloc], self->_mediaProfiles, self->_state, self->_volume, self->_playbackArchive, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)encodeAsProtoBuf
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(HMPBMediaPlaybackAction);
  id v4 = [(HMAction *)self uuid];
  id v5 = objc_msgSend(v4, "hm_convertToData");
  if (v3) {
    objc_storeStrong((id *)&v3->_actionUUID, v5);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3) {
    objc_storeStrong((id *)&v3->_mediaProfiles, v6);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = [(HMMediaPlaybackAction *)self mediaProfiles];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v43 + 1) + 8 * v11) uniqueIdentifier];
        id v13 = objc_msgSend(v12, "hm_convertToData");

        if (v3) {
          mediaProfiles = v3->_mediaProfiles;
        }
        else {
          mediaProfiles = 0;
        }
        uint64_t v15 = mediaProfiles;
        [(NSMutableArray *)v15 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v16 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
      uint64_t v9 = v16;
    }
    while (v16);
  }

  int v17 = [(HMMediaPlaybackAction *)self state];
  if (v3)
  {
    *(unsigned char *)&v3->_has |= 1u;
    v3->_mediaPlaybackState = v17;
  }
  uint64_t v18 = [(HMMediaPlaybackAction *)self volume];

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v20 = [(HMMediaPlaybackAction *)self volume];
    id v42 = 0;
    uint64_t v21 = [v19 archivedDataWithRootObject:v20 requiringSecureCoding:1 error:&v42];
    id v22 = v42;
    if (v3)
    {
      objc_storeStrong((id *)&v3->_volume, v21);

      volume = v3->_volume;
    }
    else
    {

      volume = 0;
    }
    uint64_t v24 = volume;

    if (!v24)
    {
      uint64_t v32 = MEMORY[0x19F3A64A0]();
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v48 = v34;
        __int16 v49 = 2112;
        id v50 = v22;
        _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode volume: %@", buf, 0x16u);
      }
      uint64_t v35 = (void *)v32;
      goto LABEL_35;
    }
  }
  objc_super v25 = [(HMMediaPlaybackAction *)self playbackArchive];

  if (!v25)
  {
LABEL_28:
    objc_super v31 = objc_alloc_init(HMPBActionContainer);
    [(HMPBActionContainer *)v31 setType:2];
    [(HMPBActionContainer *)v31 setMediaPlaybackAction:v3];
    goto LABEL_36;
  }
  uint64_t v26 = (void *)MEMORY[0x1E4F28DB0];
  id v27 = [(HMMediaPlaybackAction *)self playbackArchive];
  id v41 = 0;
  id v28 = [v26 archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v41];
  id v22 = v41;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_playbackArchive, v28);

    playbackArchive = v3->_playbackArchive;
  }
  else
  {

    playbackArchive = 0;
  }
  id v30 = playbackArchive;

  if (v30)
  {

    goto LABEL_28;
  }
  uint64_t v36 = MEMORY[0x19F3A64A0]();
  v37 = self;
  v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    id v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v48 = v39;
    __int16 v49 = 2112;
    id v50 = v22;
    _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode playbackArchive: %@", buf, 0x16u);
  }
  uint64_t v35 = (void *)v36;
LABEL_35:

  objc_super v31 = 0;
LABEL_36:

  return v31;
}

- (MPPlaybackArchive)playbackArchive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_playbackArchive;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)volume
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_volume;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (NSSet)mediaProfiles
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_mediaProfiles;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unint64_t)type
{
  return 1;
}

- (void)__configureWithContext:(id)a3 actionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMediaPlaybackAction;
  [(HMAction *)&v11 __configureWithContext:v6 actionSet:v7];
  uint64_t v8 = [v7 home];
  os_unfair_lock_lock_with_options();
  resolveProfiles(self->_mediaProfiles, v8);
  uint64_t v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
  mediaProfiles = self->_mediaProfiles;
  self->_mediaProfiles = v9;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMMediaPlaybackAction)initWithMediaProfiles:(id)a3 playbackState:(int64_t)a4 volume:(id)a5 playbackArchive:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![v10 count])
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!a4 && !v11 && !v12)
  {
LABEL_7:
    uint64_t v15 = (HMMediaPlaybackAction *)_HMFPreconditionFailure();
    [(HMMediaPlaybackAction *)v15 initWithUUID:v17];
  }
  id v13 = (HMMediaPlaybackAction *)-[HMMediaPlaybackAction initWithMediaProfiles:playbackState:volume:playbackArchive:uuid:](self, v10, a4, v11, v12, 0);

  return v13;
}

- (HMMediaPlaybackAction)initWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMMediaPlaybackAction)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end