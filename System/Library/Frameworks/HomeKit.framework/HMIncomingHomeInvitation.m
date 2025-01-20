@interface HMIncomingHomeInvitation
+ (BOOL)supportsSecureCoding;
+ (id)incomingHomeInvitationFromEncodedData:(id)a3 homeManager:(id)a4;
+ (id)shortDescription;
- (BOOL)homeHasCameras;
- (BOOL)isForPKSharingMessageInvitationWithAppleSharingDict:(id)a3;
- (BOOL)isInviteeRestrictedGuest;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMHomeManager)homeManager;
- (HMIncomingHomeInvitation)initWithCoder:(id)a3;
- (HMIncomingHomeInvitation)initWithInvitationData:(id)a3 homeManager:(id)a4;
- (HMRestrictedGuestHomeAccessSchedule)restrictedGuestSchedule;
- (HMUser)inviter;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)homeName;
- (NSString)shortDescription;
- (NSUUID)homeUUID;
- (void)__configureWithContext:(id)a3 homeManager:(id)a4;
- (void)_unconfigure;
- (void)acceptInviteWithCompletionHandler:(id)a3;
- (void)acceptInviteWithPresenceAuthStatus:(unint64_t)a3 completionHandler:(id)a4;
- (void)cancelInviteWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)ignoreInviteWithCompletionHandler:(id)a3;
- (void)reportJunkInviteWithCompletionHandler:(id)a3;
- (void)setHomeManager:(id)a3;
@end

@implementation HMIncomingHomeInvitation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_restrictedGuestSchedule, 0);

  objc_storeStrong((id *)&self->_inviter, 0);
}

- (void)setHomeManager:(id)a3
{
}

- (HMHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);

  return (HMHomeManager *)WeakRetained;
}

- (HMRestrictedGuestHomeAccessSchedule)restrictedGuestSchedule
{
  return self->_restrictedGuestSchedule;
}

- (BOOL)isInviteeRestrictedGuest
{
  return self->_inviteeRestrictedGuest;
}

- (BOOL)homeHasCameras
{
  return self->_homeHasCameras;
}

- (HMUser)inviter
{
  return self->_inviter;
}

- (NSArray)attributeDescriptions
{
  v25[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v24 = [(HMHomeInvitation *)self uniqueIdentifier];
  v23 = (void *)[v3 initWithName:@"ID" value:v24];
  v25[0] = v23;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = [(HMIncomingHomeInvitation *)self inviter];
  v21 = [v22 userID];
  v20 = (void *)[v4 initWithName:@"Inviter UserID" value:v21];
  v25[1] = v20;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = [(HMIncomingHomeInvitation *)self inviter];
  v7 = [v6 name];
  v8 = (void *)[v5 initWithName:@"Inviter Name" value:v7];
  v25[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMIncomingHomeInvitation *)self isInviteeRestrictedGuest];
  v10 = HMFBooleanToString();
  v11 = (void *)[v9 initWithName:@"Is RG" value:v10];
  v25[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMIncomingHomeInvitation *)self homeHasCameras];
  v13 = HMFBooleanToString();
  v14 = (void *)[v12 initWithName:@"DoesHomeHasCameras" value:v13];
  v25[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  v16 = [(HMIncomingHomeInvitation *)self restrictedGuestSchedule];
  v17 = (void *)[v15 initWithName:@"rgSchedule" value:v16];
  v25[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];

  return (NSArray *)v18;
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

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(HMHomeInvitation *)self invitationState];
    uint64_t v7 = [v5 invitationState];
    BOOL v8 = v6 == v7;
    BOOL v9 = v6 != v7;
    if (!v8) {
      -[HMHomeInvitation _updateInvitationState:](self, "_updateInvitationState:", [v5 invitationState]);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHomeInvitation *)self invitationData];
  [v4 encodeObject:v5 forKey:@"HM.invitationData"];
}

- (HMIncomingHomeInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.invitationData"];
  v17.receiver = self;
  v17.super_class = (Class)HMIncomingHomeInvitation;
  int64_t v6 = [(HMHomeInvitation *)&v17 initWithCoder:v4 invitationData:v5];
  if (v6)
  {
    uint64_t v7 = [HMUser alloc];
    BOOL v8 = [v5 inviterUserID];
    BOOL v9 = [v5 inviterName];
    v10 = [v5 inviterUUID];
    v11 = [(HMHomeInvitation *)v6 home];
    uint64_t v12 = [(HMUser *)v7 initWithUserID:v8 name:v9 uuid:v10 home:v11];
    inviter = v6->_inviter;
    v6->_inviter = (HMUser *)v12;

    v6->_homeHasCameras = [v4 decodeBoolForKey:@"HMIncomingInvitationHomeHasCamerasCodingKey"];
    v6->_inviteeRestrictedGuest = [v4 decodeBoolForKey:@"HM.u.isRG"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.RG.Schedule"];
    restrictedGuestSchedule = v6->_restrictedGuestSchedule;
    v6->_restrictedGuestSchedule = (HMRestrictedGuestHomeAccessSchedule *)v14;
  }
  return v6;
}

- (void)reportJunkInviteWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(HMHomeInvitation *)self context];
  if (!v4)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMIncomingHomeInvitation reportJunkInviteWithCompletionHandler:]", @"completion"];
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      __int16 v25 = 2112;
      v26 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  int64_t v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v8 = self;
  BOOL v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling a junk invitation.", buf, 0xCu);
    }
    uint64_t v12 = [(HMIncomingHomeInvitation *)v8 homeManager];
    if (v12)
    {
      v13 = v12;
      [v12 _reportJunkInvitation:v8 completionHandler:v4];
    }
    else
    {
      id v15 = [v6 delegateCaller];
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v15 callCompletion:v4 error:v16];

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      __int16 v25 = 2080;
      v26 = "-[HMIncomingHomeInvitation reportJunkInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v4[2](v4, v13);
  }
}

- (void)acceptInviteWithPresenceAuthStatus:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int64_t v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(HMHomeInvitation *)self context];
  if (!v6)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMIncomingHomeInvitation acceptInviteWithPresenceAuthStatus:completionHandler:]", @"completion"];
    v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v24;
      __int16 v28 = 2112;
      v29 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  BOOL v8 = (void *)v7;
  BOOL v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      HMUserPresenceAuthorizationStatusAsString(a3);
      uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v13;
      __int16 v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling accepted invitation with presenceAuthStatus: %@.", buf, 0x16u);
    }
    id v15 = [(HMIncomingHomeInvitation *)v10 homeManager];
    if (v15)
    {
      v16 = v15;
      [v15 _acceptInvitation:v10 presenceAuthStatus:a3 completionHandler:v6];
    }
    else
    {
      v18 = [v8 delegateCaller];
      v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:21 userInfo:0];
      [v18 callCompletion:v6 error:v19];

      v16 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v17;
      __int16 v28 = 2080;
      v29 = "-[HMIncomingHomeInvitation acceptInviteWithPresenceAuthStatus:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v6[2](v6, v16);
  }
}

- (void)acceptInviteWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(HMHomeInvitation *)self context];
  if (!v4)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMIncomingHomeInvitation acceptInviteWithCompletionHandler:]", @"completion"];
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      __int16 v25 = 2112;
      v26 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  int64_t v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v8 = self;
  BOOL v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling accepted invitation.", buf, 0xCu);
    }
    uint64_t v12 = [(HMIncomingHomeInvitation *)v8 homeManager];
    if (v12)
    {
      v13 = v12;
      [v12 _acceptInvitation:v8 completionHandler:v4];
    }
    else
    {
      id v15 = [v6 delegateCaller];
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:21 userInfo:0];
      [v15 callCompletion:v4 error:v16];

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      __int16 v25 = 2080;
      v26 = "-[HMIncomingHomeInvitation acceptInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v4[2](v4, v13);
  }
}

- (void)ignoreInviteWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(HMHomeInvitation *)self context];
  if (!v4)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMIncomingHomeInvitation ignoreInviteWithCompletionHandler:]", @"completion"];
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      __int16 v25 = 2112;
      v26 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  int64_t v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v8 = self;
  BOOL v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling ignored invitation.", buf, 0xCu);
    }
    uint64_t v12 = [(HMIncomingHomeInvitation *)v8 homeManager];
    if (v12)
    {
      v13 = v12;
      [v12 _ignoreInvitation:v8 completionHandler:v4];
    }
    else
    {
      id v15 = [v6 delegateCaller];
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v15 callCompletion:v4 error:v16];

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      __int16 v25 = 2080;
      v26 = "-[HMIncomingHomeInvitation ignoreInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v4[2](v4, v13);
  }
}

- (void)cancelInviteWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(HMHomeInvitation *)self context];
  if (!v4)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMIncomingHomeInvitation cancelInviteWithCompletionHandler:]", @"completion"];
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      __int16 v25 = 2112;
      v26 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  int64_t v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v8 = self;
  BOOL v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling declined invitation.", buf, 0xCu);
    }
    uint64_t v12 = [(HMIncomingHomeInvitation *)v8 homeManager];
    if (v12)
    {
      v13 = v12;
      [v12 _declineInvitation:v8 completionHandler:v4];
    }
    else
    {
      id v15 = [v6 delegateCaller];
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v15 callCompletion:v4 error:v16];

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      __int16 v25 = 2080;
      v26 = "-[HMIncomingHomeInvitation cancelInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v4[2](v4, v13);
  }
}

- (NSUUID)homeUUID
{
  v2 = [(HMHomeInvitation *)self invitationData];
  id v3 = [v2 homeUUID];

  return (NSUUID *)v3;
}

- (NSString)homeName
{
  v2 = [(HMHomeInvitation *)self invitationData];
  id v3 = [v2 homeName];

  return (NSString *)v3;
}

- (void)_unconfigure
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMHomeInvitation *)self context];

  id v4 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v5 = self;
  int64_t v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring incoming Home invitation", (uint8_t *)&v10, 0xCu);
    }
    [(HMIncomingHomeInvitation *)v5 setHomeManager:0];
    [(HMHomeInvitation *)v5 setContext:0];
  }
}

- (void)__configureWithContext:(id)a3 homeManager:(id)a4
{
  id v6 = a4;
  [(HMHomeInvitation *)self setContext:a3];
  [(HMIncomingHomeInvitation *)self setHomeManager:v6];
}

- (HMIncomingHomeInvitation)initWithInvitationData:(id)a3 homeManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMIncomingHomeInvitation;
  BOOL v8 = [(HMHomeInvitation *)&v16 initWithInvitationData:v6 home:0];
  if (v8)
  {
    BOOL v9 = [HMUser alloc];
    int v10 = [v6 inviterUserID];
    v11 = [v6 inviterName];
    uint64_t v12 = [v6 inviterUUID];
    uint64_t v13 = [(HMUser *)v9 initWithUserID:v10 name:v11 uuid:v12 home:0];
    inviter = v8->_inviter;
    v8->_inviter = (HMUser *)v13;

    objc_storeWeak((id *)&v8->_homeManager, v7);
  }

  return v8;
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

+ (id)incomingHomeInvitationFromEncodedData:(id)a3 homeManager:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    BOOL v8 = (void *)MEMORY[0x1E4F28DC0];
    BOOL v9 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v11 = [v9 setWithArray:v10];
    id v23 = 0;
    uint64_t v12 = [v8 unarchivedObjectOfClasses:v11 fromData:v6 error:&v23];
    id v13 = v23;

    if (v12)
    {
      id v14 = v12;
      objc_opt_class();
      int v15 = objc_opt_isKindOfClass() & 1;
      if (v15) {
        objc_super v16 = v14;
      }
      else {
        objc_super v16 = 0;
      }
      id v17 = v16;

      if (v15) {
        goto LABEL_12;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x19F3A64A0]();
      id v19 = a1;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v25 = v21;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive incoming home invitation data from encoded invitations data: %@", buf, 0x16u);
      }
    }
  }
  id v14 = (id)MEMORY[0x1E4F1CBF0];
LABEL_12:

  return v14;
}

- (BOOL)isForPKSharingMessageInvitationWithAppleSharingDict:(id)a3
{
  id v4 = objc_msgSend(a3, "hmf_stringForKey:", @"HMHomeInvitationIdentifierKey");
  uint64_t v5 = [(HMHomeInvitation *)self identifier];
  id v6 = [v5 UUIDString];
  char v7 = [v4 isEqualToString:v6];

  return v7;
}

@end