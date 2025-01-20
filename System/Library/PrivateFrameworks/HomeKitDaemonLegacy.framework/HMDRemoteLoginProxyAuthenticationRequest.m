@interface HMDRemoteLoginProxyAuthenticationRequest
+ (BOOL)supportsSecureCoding;
+ (NSString)messageName;
+ (id)objWithDict:(id)a3;
+ (id)objWithMessage:(id)a3;
- (HMDRemoteLoginProxyAuthenticationRequest)initWithCoder:(id)a3;
- (NSDictionary)messagePayload;
- (NSString)altDSID;
- (NSString)description;
- (NSString)messageName;
- (NSString)passwordToken;
- (NSString)rawPassword;
- (NSString)username;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setPasswordToken:(id)a3;
- (void)setRawPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation HMDRemoteLoginProxyAuthenticationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_passwordToken, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setPasswordToken:(id)a3
{
}

- (NSString)passwordToken
{
  return self->_passwordToken;
}

- (void)setRawPassword:(id)a3
{
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (HMDRemoteLoginProxyAuthenticationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDRemoteLoginProxyAuthenticationRequest;
  v5 = [(HMDRemoteLoginAuthenticationRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
    username = v5->_username;
    v5->_username = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passwordToken"];
    passwordToken = v5->_passwordToken;
    v5->_passwordToken = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawPassword"];
    rawPassword = v5->_rawPassword;
    v5->_rawPassword = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteLoginProxyAuthenticationRequest;
  id v4 = a3;
  [(HMDRemoteLoginAuthenticationRequest *)&v9 encodeWithCoder:v4];
  v5 = [(HMDRemoteLoginProxyAuthenticationRequest *)self username];
  [v4 encodeObject:v5 forKey:@"username"];

  uint64_t v6 = [(HMDRemoteLoginProxyAuthenticationRequest *)self passwordToken];
  [v4 encodeObject:v6 forKey:@"passwordToken"];

  v7 = [(HMDRemoteLoginProxyAuthenticationRequest *)self altDSID];
  [v4 encodeObject:v7 forKey:@"altDSID"];

  uint64_t v8 = [(HMDRemoteLoginProxyAuthenticationRequest *)self rawPassword];
  [v4 encodeObject:v8 forKey:@"rawPassword"];
}

- (NSString)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)HMDRemoteLoginProxyAuthenticationRequest;
  id v4 = [(HMDRemoteLoginAuthenticationRequest *)&v12 description];
  v5 = [(HMDRemoteLoginProxyAuthenticationRequest *)self username];
  uint64_t v6 = [(HMDRemoteLoginProxyAuthenticationRequest *)self rawPassword];
  [v6 length];
  v7 = HMFBooleanToString();
  uint64_t v8 = [(HMDRemoteLoginProxyAuthenticationRequest *)self passwordToken];
  objc_super v9 = [(HMDRemoteLoginProxyAuthenticationRequest *)self altDSID];
  uint64_t v10 = [v3 stringWithFormat:@"HMDRemoteLoginProxyAuthenticationRequest: %@, Username: %@, Password Present: %@, Token: %@, altDSID: %@", v4, v5, v7, v8, v9];

  return (NSString *)v10;
}

- (NSDictionary)messagePayload
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = encodeRootObject();
  id v4 = [(HMDRemoteLoginProxyAuthenticationRequest *)self messageName];
  v7 = v4;
  v8[0] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

- (NSString)messageName
{
  return (NSString *)@"kHMDRemoteLoginProxyAuthenticationRequest";
}

+ (NSString)messageName
{
  return (NSString *)@"kHMDRemoteLoginProxyAuthenticationRequest";
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
  uint64_t v6 = objc_msgSend(v5, "hmf_dataForKey:", @"kHMDRemoteLoginProxyAuthenticationRequest");

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
      objc_super v12 = HMFGetLogIdentifier();
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
  v5 = objc_msgSend(v4, "hmf_dataForKey:", @"kHMDRemoteLoginProxyAuthenticationRequest");
  id v13 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v13];
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
      objc_super v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with dictionary from archive data: %@", buf, 0x16u);
    }
  }

  return v6;
}

@end