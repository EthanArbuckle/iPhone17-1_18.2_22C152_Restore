@interface HMDRemoteLoginAuthenticationResponse
+ (BOOL)supportsSecureCoding;
+ (NSString)messageName;
+ (id)objWithDict:(id)a3;
+ (id)objWithMessage:(id)a3;
- (ACAccount)loggedInAccount;
- (HMDRemoteLoginAuthenticationResponse)initWithCoder:(id)a3;
- (NSDictionary)messagePayload;
- (NSString)description;
- (NSString)messageName;
- (void)encodeWithCoder:(id)a3;
- (void)setLoggedInAccount:(id)a3;
@end

@implementation HMDRemoteLoginAuthenticationResponse

- (void).cxx_destruct
{
}

- (void)setLoggedInAccount:(id)a3
{
}

- (ACAccount)loggedInAccount
{
  return self->_loggedInAccount;
}

- (HMDRemoteLoginAuthenticationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteLoginAuthenticationResponse;
  v5 = [(HMRemoteLoginMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    loggedInAccount = v5->_loggedInAccount;
    v5->_loggedInAccount = (ACAccount *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteLoginAuthenticationResponse;
  id v4 = a3;
  [(HMRemoteLoginMessage *)&v8 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F4EF40], "sharedInstance", v8.receiver, v8.super_class);
  uint64_t v6 = [(HMDRemoteLoginAuthenticationResponse *)self loggedInAccount];
  v7 = [v5 transportableAuthKitAccount:v6];

  [v4 encodeObject:v7 forKey:@"account"];
}

- (NSString)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteLoginAuthenticationResponse;
  v3 = [(HMRemoteLoginMessage *)&v6 description];
  id v4 = [v2 stringWithFormat:@"HMDRemoteLoginAuthenticationResponse: %@", v3];

  return (NSString *)v4;
}

- (NSDictionary)messagePayload
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = encodeRootObject();
  id v4 = [(HMDRemoteLoginAuthenticationResponse *)self messageName];
  v7 = v4;
  v8[0] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

- (NSString)messageName
{
  return (NSString *)@"kHMDRemoteLoginAuthenticationResponse";
}

+ (NSString)messageName
{
  return (NSString *)@"kHMDRemoteLoginAuthenticationResponse";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objWithMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 messagePayload];
  objc_super v6 = objc_msgSend(v5, "hmf_dataForKey:", @"kHMDRemoteLoginAuthenticationResponse");

  id v14 = 0;
  v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v14];
  id v8 = v14;
  if (!v7)
  {
    objc_super v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = a1;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with message from archive data: %@", buf, 0x16u);
    }
  }

  return v7;
}

+ (id)objWithDict:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_dataForKey:", @"kHMDRemoteLoginAuthenticationResponse");
  id v13 = 0;
  objc_super v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v13];
  id v7 = v13;
  if (!v6)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with dictionary from archive data: %@", buf, 0x16u);
    }
  }

  return v6;
}

@end