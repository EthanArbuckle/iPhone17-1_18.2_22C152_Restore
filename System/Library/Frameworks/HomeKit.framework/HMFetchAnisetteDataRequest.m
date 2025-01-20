@interface HMFetchAnisetteDataRequest
+ (BOOL)supportsSecureCoding;
+ (NSString)messageName;
+ (id)objWithDict:(id)a3;
+ (id)objWithMessage:(id)a3;
- (BOOL)shouldProvision;
- (HMFetchAnisetteDataRequest)initWithCoder:(id)a3;
- (NSDictionary)messagePayload;
- (NSString)description;
- (NSString)messageName;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldProvision:(BOOL)a3;
@end

@implementation HMFetchAnisetteDataRequest

- (void)setShouldProvision:(BOOL)a3
{
  self->_shouldProvision = a3;
}

- (BOOL)shouldProvision
{
  return self->_shouldProvision;
}

- (HMFetchAnisetteDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMFetchAnisetteDataRequest;
  v5 = [(HMRemoteLoginMessage *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_shouldProvision = [v4 decodeBoolForKey:@"TRAnisetteDataMessages_sP"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMFetchAnisetteDataRequest;
  id v4 = a3;
  [(HMRemoteLoginMessage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[HMFetchAnisetteDataRequest shouldProvision](self, "shouldProvision", v5.receiver, v5.super_class), @"TRAnisetteDataMessages_sP");
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMFetchAnisetteDataRequest;
  id v4 = [(HMRemoteLoginMessage *)&v8 description];
  [(HMFetchAnisetteDataRequest *)self shouldProvision];
  objc_super v5 = HMFBooleanToString();
  v6 = [v3 stringWithFormat:@"[HMFetchAnisetteDataRequest: %@, should-provision %@]", v4, v5];

  return (NSString *)v6;
}

- (NSDictionary)messagePayload
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = encodeRootObject(self);
  id v4 = [(HMFetchAnisetteDataRequest *)self messageName];
  objc_super v7 = v4;
  v8[0] = v3;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

- (NSString)messageName
{
  return (NSString *)@"kHMFetchAnisetteDataRequest";
}

+ (NSString)messageName
{
  return (NSString *)@"kHMFetchAnisetteDataRequest";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objWithMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 messagePayload];
  v6 = objc_msgSend(v5, "hmf_dataForKey:", @"kHMFetchAnisetteDataRequest");

  id v14 = 0;
  objc_super v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v14];
  id v8 = v14;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = a1;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with message from archive data: %@", buf, 0x16u);
    }
  }

  return v7;
}

+ (id)objWithDict:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = objc_msgSend(v4, "hmf_dataForKey:", @"kHMFetchAnisetteDataRequest");
  id v13 = 0;
  v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v13];
  id v7 = v13;
  if (!v6)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with dictionary from archive data: %@", buf, 0x16u);
    }
  }

  return v6;
}

@end