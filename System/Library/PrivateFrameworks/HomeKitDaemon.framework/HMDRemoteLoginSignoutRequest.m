@interface HMDRemoteLoginSignoutRequest
+ (BOOL)supportsSecureCoding;
+ (NSString)messageName;
+ (id)objWithDict:(id)a3;
+ (id)objWithMessage:(id)a3;
- (NSDictionary)messagePayload;
- (NSString)description;
- (NSString)messageName;
@end

@implementation HMDRemoteLoginSignoutRequest

- (NSString)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteLoginSignoutRequest;
  v3 = [(HMRemoteLoginMessage *)&v6 description];
  v4 = [v2 stringWithFormat:@"HMDRemoteLoginSignoutRequest: %@", v3];

  return (NSString *)v4;
}

- (NSDictionary)messagePayload
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = encodeRootObject();
  v4 = [(HMDRemoteLoginSignoutRequest *)self messageName];
  v7 = v4;
  v8[0] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

- (NSString)messageName
{
  return (NSString *)@"kHMDRemoteLoginSignoutRequest";
}

+ (NSString)messageName
{
  return (NSString *)@"kHMDRemoteLoginSignoutRequest";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objWithMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 messagePayload];
  objc_super v6 = objc_msgSend(v5, "hmf_dataForKey:", @"kHMDRemoteLoginSignoutRequest");

  id v14 = 0;
  v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v14];
  id v8 = v14;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with message from archive data: %@", buf, 0x16u);
    }
  }

  return v7;
}

+ (id)objWithDict:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_dataForKey:", @"kHMDRemoteLoginSignoutRequest");
  id v13 = 0;
  objc_super v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v13];
  id v7 = v13;
  if (!v6)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive object with dictionary from archive data: %@", buf, 0x16u);
    }
  }

  return v6;
}

@end