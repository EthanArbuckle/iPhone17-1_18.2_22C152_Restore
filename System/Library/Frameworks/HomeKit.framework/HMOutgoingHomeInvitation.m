@interface HMOutgoingHomeInvitation
+ (BOOL)supportsSecureCoding;
+ (id)homeInvitationsFromData:(id)a3 home:(id)a4;
+ (id)homeInvitationsFromEncodedData:(id)a3 home:(id)a4;
- (BOOL)_mergeWithNewAccessoryInvitations:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMOutgoingHomeInvitation)initWithCoder:(id)a3;
- (HMOutgoingHomeInvitation)initWithInvitationData:(id)a3 home:(id)a4;
- (HMUser)invitee;
- (NSArray)accessoryInvitations;
- (NSDictionary)appleSharingDict;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_cancelInviteWithCompletionHandler:(id)a3;
- (void)_unconfigure;
- (void)cancelInviteWithCompletionHandler:(id)a3;
@end

@implementation HMOutgoingHomeInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitee, 0);

  objc_storeStrong((id *)&self->_accessoryInvitations, 0);
}

- (HMUser)invitee
{
  return self->_invitee;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 accessoryInvitations];
    BOOL v7 = [(HMOutgoingHomeInvitation *)self _mergeWithNewAccessoryInvitations:v6];
    int64_t v8 = [(HMHomeInvitation *)self invitationState];
    if (v8 != [v5 invitationState])
    {
      -[HMHomeInvitation _updateInvitationState:](self, "_updateInvitationState:", [v5 invitationState]);
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (HMOutgoingHomeInvitation)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.invitationData"];
  v20.receiver = self;
  v20.super_class = (Class)HMOutgoingHomeInvitation;
  v6 = [(HMHomeInvitation *)&v20 initWithCoder:v4 invitationData:v5];
  if (v6)
  {
    BOOL v7 = [HMUser alloc];
    int64_t v8 = [v5 inviteeUserID];
    v9 = [v5 inviteeName];
    v10 = [v5 inviteeUUID];
    v11 = [(HMHomeInvitation *)v6 home];
    uint64_t v12 = [(HMUser *)v7 initWithUserID:v8 name:v9 uuid:v10 home:v11];
    invitee = v6->_invitee;
    v6->_invitee = (HMUser *)v12;

    accessoryInvitations = v6->_accessoryInvitations;
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v17 = [v15 setWithArray:v16];
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"HM.accessoryInvitations"];
    [(HMMutableArray *)accessoryInvitations setArray:v18];
  }
  return v6;
}

- (BOOL)_mergeWithNewAccessoryInvitations:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  v6 = [(HMOutgoingHomeInvitation *)self accessoryInvitations];
  BOOL v7 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v6 newObjects:v4];

  int64_t v8 = [(HMObjectMergeCollection *)v7 removedObjects];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__HMOutgoingHomeInvitation__mergeWithNewAccessoryInvitations___block_invoke;
  v13[3] = &unk_1E59434D8;
  v13[4] = self;
  [v8 enumerateObjectsUsingBlock:v13];

  v9 = [(HMObjectMergeCollection *)v7 addedObjects];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__HMOutgoingHomeInvitation__mergeWithNewAccessoryInvitations___block_invoke_132;
  v12[3] = &unk_1E59434D8;
  v12[4] = self;
  [v9 enumerateObjectsUsingBlock:v12];

  [(HMObjectMergeCollection *)v7 mergeCommonObjects];
  v10 = [(HMObjectMergeCollection *)v7 finalObjects];
  [(HMMutableArray *)self->_accessoryInvitations setArray:v10];

  LOBYTE(self) = [(HMObjectMergeCollection *)v7 isModified];
  return (char)self;
}

void __62__HMOutgoingHomeInvitation__mergeWithNewAccessoryInvitations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed accessory invitation via merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __62__HMOutgoingHomeInvitation__mergeWithNewAccessoryInvitations___block_invoke_132(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added accessory invitation via merge: %@", (uint8_t *)&v13, 0x16u);
  }
  int v8 = [v3 accessory];
  v9 = [*(id *)(a1 + 32) home];
  __int16 v10 = [v9 accessories];
  id v11 = [v8 uniqueIdentifier];
  uint64_t v12 = objc_msgSend(v10, "hmf_firstObjectWithUniqueIdentifier:", v11);

  [v3 setAccessory:v12];
}

- (void)_cancelInviteWithCompletionHandler:(id)a3
{
  id v9 = a3;
  id v4 = [(HMHomeInvitation *)self home];
  id v5 = v4;
  if (v4)
  {
    [v4 _cancelInvitation:self completionHandler:v9];
  }
  else
  {
    v6 = [(HMHomeInvitation *)self context];
    BOOL v7 = [v6 delegateCaller];
    int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    [v7 callCompletion:v9 error:v8];
  }
}

- (void)cancelInviteWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHomeInvitation *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMOutgoingHomeInvitation cancelInviteWithCompletionHandler:]", @"completion"];
    v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2112;
      v24 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__HMOutgoingHomeInvitation_cancelInviteWithCompletionHandler___block_invoke;
    block[3] = &unk_1E59454E8;
    block[4] = self;
    id v20 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      __int16 v23 = 2080;
      v24 = "-[HMOutgoingHomeInvitation cancelInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

uint64_t __62__HMOutgoingHomeInvitation_cancelInviteWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelInviteWithCompletionHandler:*(void *)(a1 + 40)];
}

- (NSArray)accessoryInvitations
{
  return [(HMMutableArray *)self->_accessoryInvitations array];
}

- (void)_unconfigure
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMHomeInvitation *)self context];

  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  v6 = HMFGetOSLogHandle();
  BOOL v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring home invitation", (uint8_t *)&v10, 0xCu);
    }
    [(HMHomeInvitation *)v5 setHome:0];
    [(HMHomeInvitation *)v5 setContext:0];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6 = a4;
  [(HMHomeInvitation *)self setContext:a3];
  [(HMHomeInvitation *)self setHome:v6];
}

- (HMOutgoingHomeInvitation)initWithInvitationData:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMOutgoingHomeInvitation;
  int v8 = [(HMHomeInvitation *)&v18 initWithInvitationData:v6 home:v7];
  if (v8)
  {
    id v9 = [HMUser alloc];
    int v10 = [v6 inviteeUserID];
    id v11 = [v6 inviteeName];
    uint64_t v12 = [v6 inviteeUUID];
    uint64_t v13 = [(HMUser *)v9 initWithUserID:v10 name:v11 uuid:v12 home:v7];
    invitee = v8->_invitee;
    v8->_invitee = (HMUser *)v13;

    uint64_t v15 = +[HMMutableArray array];
    accessoryInvitations = v8->_accessoryInvitations;
    v8->_accessoryInvitations = (HMMutableArray *)v15;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)homeInvitationsFromData:(id)a3 home:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [HMOutgoingHomeInvitation alloc];
        uint64_t v15 = -[HMOutgoingHomeInvitation initWithInvitationData:home:](v14, "initWithInvitationData:home:", v13, v6, (void)v18);
        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = (void *)[v7 copy];

  return v16;
}

+ (id)homeInvitationsFromEncodedData:(id)a3 home:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    uint64_t v11 = [v9 setWithArray:v10];
    id v23 = 0;
    uint64_t v12 = [v8 unarchivedObjectOfClasses:v11 fromData:v6 error:&v23];
    id v13 = v23;

    if (!v12)
    {
      v14 = (void *)MEMORY[0x19F3A64A0]();
      id v15 = a1;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v17;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive outgoing home invitation data from encoded invitations data: %@", buf, 0x16u);
      }
    }
    id v18 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v19 = v18;
    }
    else {
      long long v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      long long v21 = +[HMOutgoingHomeInvitation homeInvitationsFromData:v20 home:v7];
    }
    else
    {
      long long v21 = 0;
    }
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

- (NSDictionary)appleSharingDict
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"HMHomeInvitationIdentifierKey";
  v2 = [(HMHomeInvitation *)self identifier];
  id v3 = [v2 UUIDString];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

@end