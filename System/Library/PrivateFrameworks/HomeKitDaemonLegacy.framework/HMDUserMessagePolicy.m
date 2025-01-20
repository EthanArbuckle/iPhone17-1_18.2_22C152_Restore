@interface HMDUserMessagePolicy
+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5;
+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6;
+ (HMDUserMessagePolicy)userMessagePolicyWithUserPrivilege:(unint64_t)a3 remoteAccessRequired:(BOOL)a4;
+ (HMDUserMessagePolicy)userMessagePolicyWithUserPrivilege:(unint64_t)a3 remoteAccessRequired:(BOOL)a4 requiresCameraStreamingAccess:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresCameraStreamingAccess;
- (BOOL)requiresRemoteAccess;
- (BOOL)validForAnyHomeTheUserIsPartOf;
- (HMDHome)home;
- (HMDUserMessagePolicy)init;
- (NSUUID)homeUUID;
- (id)__initWithHome:(id)a3 homeUUID:(id)a4 userPrivilege:(unint64_t)a5 remoteAccessRequired:(BOOL)a6 requiresCameraStreamingAccess:(BOOL)a7;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)userPrivilege;
- (void)setRequiresCameraStreamingAccess:(BOOL)a3;
- (void)setRequiresRemoteAccess:(BOOL)a3;
- (void)setUserPrivilege:(unint64_t)a3;
@end

@implementation HMDUserMessagePolicy

- (unint64_t)userPrivilege
{
  return self->_userPrivilege;
}

- (BOOL)requiresRemoteAccess
{
  return self->_requiresRemoteAccess;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRequiresCameraStreamingAccess:(BOOL)a3
{
  self->_requiresCameraStreamingAccess = a3;
}

- (BOOL)requiresCameraStreamingAccess
{
  return self->_requiresCameraStreamingAccess;
}

- (void)setRequiresRemoteAccess:(BOOL)a3
{
  self->_requiresRemoteAccess = a3;
}

- (void)setUserPrivilege:(unint64_t)a3
{
  self->_userPrivilege = a3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(HMDUserMessagePolicy *)self home];
  v5 = +[HMDMutableUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:[(HMDUserMessagePolicy *)self userPrivilege] remoteAccessRequired:[(HMDUserMessagePolicy *)self requiresRemoteAccess] requiresCameraStreamingAccess:[(HMDUserMessagePolicy *)self requiresCameraStreamingAccess]];

  return v5;
}

+ (HMDUserMessagePolicy)userMessagePolicyWithUserPrivilege:(unint64_t)a3 remoteAccessRequired:(BOOL)a4
{
  return (HMDUserMessagePolicy *)[a1 userMessagePolicyWithUserPrivilege:a3 remoteAccessRequired:a4 requiresCameraStreamingAccess:0];
}

+ (HMDUserMessagePolicy)userMessagePolicyWithUserPrivilege:(unint64_t)a3 remoteAccessRequired:(BOOL)a4 requiresCameraStreamingAccess:(BOOL)a5
{
  v5 = objc_msgSend(objc_alloc((Class)a1), "__initWithHome:homeUUID:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", 0, 0, a3, a4, a5);
  return (HMDUserMessagePolicy *)v5;
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5
{
  return (HMDUserMessagePolicy *)[a1 userMessagePolicyWithHome:a3 userPrivilege:a4 remoteAccessRequired:a5 requiresCameraStreamingAccess:0];
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v12 = [v10 uuid];
  v13 = objc_msgSend(v11, "__initWithHome:homeUUID:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", v10, v12, a4, v7, v6);

  return (HMDUserMessagePolicy *)v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDUserMessagePolicy *)a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    BOOL v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
    v8 = v7;

    if (v8
      && (id WeakRetained = objc_loadWeakRetained((id *)&self->_home),
          [(HMDUserMessagePolicy *)v8 home],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = HMFEqualObjects(),
          v10,
          WeakRetained,
          v11)
      && (unint64_t userPrivilege = self->_userPrivilege,
          userPrivilege == [(HMDUserMessagePolicy *)v8 userPrivilege]))
    {
      BOOL requiresRemoteAccess = self->_requiresRemoteAccess;
      BOOL v14 = requiresRemoteAccess == [(HMDUserMessagePolicy *)v8 requiresRemoteAccess];
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_homeUUID hash];
  uint64_t v4 = v3 ^ [(HMDUserMessagePolicy *)self requiresRemoteAccess];
  unint64_t v5 = v4 ^ (2 * [(HMDUserMessagePolicy *)self userPrivilege]);
  BOOL v6 = [(HMDUserMessagePolicy *)self requiresCameraStreamingAccess];
  uint64_t v7 = 4;
  if (!v6) {
    uint64_t v7 = 0;
  }
  return v5 ^ v7;
}

- (BOOL)validForAnyHomeTheUserIsPartOf
{
  return self->_homeUUID == 0;
}

- (id)__initWithHome:(id)a3 homeUUID:(id)a4 userPrivilege:(unint64_t)a5 remoteAccessRequired:(BOOL)a6 requiresCameraStreamingAccess:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDUserMessagePolicy;
  BOOL v14 = [(HMDUserMessagePolicy *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v12);
    objc_storeStrong((id *)&v15->_homeUUID, a4);
    v15->_unint64_t userPrivilege = a5;
    v15->_BOOL requiresRemoteAccess = a6;
    v15->_requiresCameraStreamingAccess = a7;
  }

  return v15;
}

- (HMDUserMessagePolicy)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  unint64_t v5 = NSStringFromSelector(a2);
  BOOL v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end