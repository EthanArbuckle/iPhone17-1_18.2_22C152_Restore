@interface HMDUserMessagePolicy
+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5;
+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6;
+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6 useProofOfLocality:(BOOL)a7;
+ (HMDUserMessagePolicy)userMessagePolicyWithUserPrivilege:(unint64_t)a3 remoteAccessRequired:(BOOL)a4;
+ (HMDUserMessagePolicy)userMessagePolicyWithUserPrivilege:(unint64_t)a3 remoteAccessRequired:(BOOL)a4 requiresCameraStreamingAccess:(BOOL)a5;
+ (id)userMessagePolicyUsingProofOfLocalityForHome:(id)a3 userPrivilege:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresCameraStreamingAccess;
- (BOOL)requiresRemoteAccess;
- (BOOL)useProofOfLocality;
- (BOOL)validForAnyHomeTheUserIsPartOf;
- (HMDHome)home;
- (HMDUserMessagePolicy)init;
- (NSUUID)homeUUID;
- (id)__initWithHome:(id)a3 homeUUID:(id)a4 userPrivilege:(unint64_t)a5 remoteAccessRequired:(BOOL)a6 requiresCameraStreamingAccess:(BOOL)a7 useProofOfLocality:(BOOL)a8;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)userPrivilege;
- (void)setRequiresCameraStreamingAccess:(BOOL)a3;
- (void)setRequiresRemoteAccess:(BOOL)a3;
- (void)setUseProofOfLocality:(BOOL)a3;
- (void)setUserPrivilege:(unint64_t)a3;
@end

@implementation HMDUserMessagePolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUseProofOfLocality:(BOOL)a3
{
  self->_useProofOfLocality = a3;
}

- (BOOL)useProofOfLocality
{
  return self->_useProofOfLocality;
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

- (BOOL)requiresRemoteAccess
{
  return self->_requiresRemoteAccess;
}

- (void)setUserPrivilege:(unint64_t)a3
{
  self->_userPrivilege = a3;
}

- (unint64_t)userPrivilege
{
  return self->_userPrivilege;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(HMDUserMessagePolicy *)self home];
  v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:[(HMDUserMessagePolicy *)self userPrivilege] remoteAccessRequired:[(HMDUserMessagePolicy *)self requiresRemoteAccess] requiresCameraStreamingAccess:[(HMDUserMessagePolicy *)self requiresCameraStreamingAccess] useProofOfLocality:[(HMDUserMessagePolicy *)self useProofOfLocality]];

  return v5;
}

+ (HMDUserMessagePolicy)userMessagePolicyWithUserPrivilege:(unint64_t)a3 remoteAccessRequired:(BOOL)a4
{
  return (HMDUserMessagePolicy *)[a1 userMessagePolicyWithUserPrivilege:a3 remoteAccessRequired:a4 requiresCameraStreamingAccess:0];
}

+ (HMDUserMessagePolicy)userMessagePolicyWithUserPrivilege:(unint64_t)a3 remoteAccessRequired:(BOOL)a4 requiresCameraStreamingAccess:(BOOL)a5
{
  v5 = objc_msgSend(objc_alloc((Class)a1), "__initWithHome:homeUUID:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:", 0, 0, a3, a4, a5, 0);
  return (HMDUserMessagePolicy *)v5;
}

+ (id)userMessagePolicyUsingProofOfLocalityForHome:(id)a3 userPrivilege:(unint64_t)a4
{
  return (id)[a1 userMessagePolicyWithHome:a3 userPrivilege:a4 remoteAccessRequired:1 requiresCameraStreamingAccess:0 useProofOfLocality:1];
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5
{
  return (HMDUserMessagePolicy *)[a1 userMessagePolicyWithHome:a3 userPrivilege:a4 remoteAccessRequired:a5 requiresCameraStreamingAccess:0];
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6
{
  return (HMDUserMessagePolicy *)[a1 userMessagePolicyWithHome:a3 userPrivilege:a4 remoteAccessRequired:a5 requiresCameraStreamingAccess:a6 useProofOfLocality:0];
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6 useProofOfLocality:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  v14 = [v12 uuid];
  v15 = objc_msgSend(v13, "__initWithHome:homeUUID:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:", v12, v14, a4, v9, v8, v7);

  return (HMDUserMessagePolicy *)v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDUserMessagePolicy *)a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
    BOOL v8 = v7;

    if (!v8) {
      goto LABEL_10;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    v10 = [(HMDUserMessagePolicy *)v8 home];
    int v11 = HMFEqualObjects();

    if (!v11) {
      goto LABEL_10;
    }
    unint64_t userPrivilege = self->_userPrivilege;
    if (userPrivilege == [(HMDUserMessagePolicy *)v8 userPrivilege]
      && (BOOL requiresRemoteAccess = self->_requiresRemoteAccess,
          requiresRemoteAccess == [(HMDUserMessagePolicy *)v8 requiresRemoteAccess]))
    {
      BOOL useProofOfLocality = self->_useProofOfLocality;
      BOOL v15 = useProofOfLocality == [(HMDUserMessagePolicy *)v8 useProofOfLocality];
    }
    else
    {
LABEL_10:
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_homeUUID hash];
  uint64_t v4 = v3 ^ [(HMDUserMessagePolicy *)self requiresRemoteAccess];
  unint64_t v5 = v4 ^ (2 * [(HMDUserMessagePolicy *)self userPrivilege]);
  if ([(HMDUserMessagePolicy *)self requiresCameraStreamingAccess]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0;
  }
  BOOL v7 = [(HMDUserMessagePolicy *)self useProofOfLocality];
  uint64_t v8 = 8;
  if (!v7) {
    uint64_t v8 = 0;
  }
  return v5 ^ v6 ^ v8;
}

- (BOOL)validForAnyHomeTheUserIsPartOf
{
  return self->_homeUUID == 0;
}

- (id)__initWithHome:(id)a3 homeUUID:(id)a4 userPrivilege:(unint64_t)a5 remoteAccessRequired:(BOOL)a6 requiresCameraStreamingAccess:(BOOL)a7 useProofOfLocality:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDUserMessagePolicy;
  v16 = [(HMDUserMessagePolicy *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_home, v14);
    objc_storeStrong((id *)&v17->_homeUUID, a4);
    v17->_unint64_t userPrivilege = a5;
    v17->_BOOL requiresRemoteAccess = a6;
    v17->_requiresCameraStreamingAccess = a7;
    v17->_BOOL useProofOfLocality = v8;
    if (v8 && !a6)
    {
      v19 = (HMDUserMessagePolicy *)_HMFPreconditionFailure();
      [(HMDUserMessagePolicy *)v19 init];
    }
  }

  return v17;
}

- (HMDUserMessagePolicy)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  unint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end