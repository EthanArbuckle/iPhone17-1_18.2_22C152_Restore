@interface __HMDLegacyResidentUser
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isRemoteGateway;
- (HMDResidentUser)residentUser;
- (__HMDLegacyResidentUser)initWithCoder:(id)a3;
- (__HMDLegacyResidentUser)initWithResidentUser:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation __HMDLegacyResidentUser

- (void).cxx_destruct
{
}

- (HMDResidentUser)residentUser
{
  return self->_residentUser;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(__HMDLegacyResidentUser *)self residentUser];
  [v5 encodeWithCoder:v4];
}

- (__HMDLegacyResidentUser)initWithCoder:(id)a3
{
  return 0;
}

- (BOOL)isRemoteGateway
{
  return 1;
}

- (__HMDLegacyResidentUser)initWithResidentUser:(id)a3
{
  id v5 = a3;
  v6 = [v5 accountHandle];
  v7 = [v5 home];
  v8 = [v5 pairingIdentity];
  v12.receiver = self;
  v12.super_class = (Class)__HMDLegacyResidentUser;
  v9 = -[HMDUser initWithAccountHandle:home:pairingIdentity:privilege:](&v12, sel_initWithAccountHandle_home_pairingIdentity_privilege_, v6, v7, v8, [v5 privilege]);

  if (v9)
  {
    v10 = [v5 uuid];
    [(HMDUser *)v9 _setUuidUnsafely:v10];

    objc_storeStrong((id *)&v9->_residentUser, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  v3 = (void *)MEMORY[0x1E4F28DB0];
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setClassName:v5 forClass:a1];
}

@end