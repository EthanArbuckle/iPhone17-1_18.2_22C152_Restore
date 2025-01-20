@interface HMDHomeManagerHH2SharedUserLastSync
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (HMDHomeManagerHH2SharedUserLastSync)initWithArchivePath:(id)a3;
- (HMDUser)user;
- (NSData)archive;
- (NSDate)creationDate;
- (NSUUID)homeUUID;
- (id)attributeDescriptions;
- (id)description;
- (id)shortDescription;
- (void)configure;
- (void)removeArchiveFromLocalDisk;
- (void)setHomeUUID:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation HMDHomeManagerHH2SharedUserLastSync

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setUser:(id)a3
{
}

- (HMDUser)user
{
  return (HMDUser *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHomeUUID:(id)a3
{
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDHomeManagerHH2SharedUserLastSync *)self homeUUID];
  v6 = (void *)[v4 initWithName:@"HomeUUID" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDHomeManagerHH2SharedUserLastSync *)self user];
  v9 = [v8 uuid];
  v10 = (void *)[v7 initWithName:@"UserUUID" value:v9];
  [v3 addObject:v10];

  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMDHomeManagerHH2SharedUserLastSync *)self user];
  v13 = [v12 userID];
  v14 = (void *)[v11 initWithName:@"UserID" value:v13];
  [v3 addObject:v14];

  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  v16 = [(HMDHomeManagerHH2SharedUserLastSync *)self creationDate];
  v17 = (void *)[v15 initWithName:@"Created Date" value:v16];
  [v3 addObject:v17];

  v18 = (void *)[v3 copy];
  return v18;
}

- (id)description
{
  return (id)MEMORY[0x270F30880](self, a2);
}

- (id)shortDescription
{
  v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (void)removeArchiveFromLocalDisk
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(NSURL);
  if (self) {
    id Property = objc_getProperty(self, v3, 40, 1);
  }
  else {
    id Property = 0;
  }
  v6 = (void *)[v4 initFileURLWithPath:Property];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v15 = 0;
  [v7 removeItemAtURL:v6 error:&v15];
  id v8 = v15;

  if (v8)
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      if (self) {
        id v14 = objc_getProperty(v10, v12, 40, 1);
      }
      else {
        id v14 = 0;
      }
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while removing sync data file \"%@\" from disk : %@", buf, 0x20u);
    }
  }
}

- (NSData)archive
{
  id v4 = (void *)MEMORY[0x230FBD990](self, a2);
  if (self) {
    id Property = objc_getProperty(self, v3, 40, 1);
  }
  else {
    id Property = 0;
  }
  v6 = +[HMDUser getSyncDataFromLocalDiskWithArchive:Property];
  id v7 = [v6 objectForKeyedSubscript:@"HMD.sync.data.data"];

  return (NSData *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDHomeManagerHH2SharedUserLastSync *)a3;
  if (self == v4)
  {
    char v14 = 1;
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
    if (v6
      && ([(HMDHomeManagerHH2SharedUserLastSync *)self homeUUID],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [(HMDHomeManagerHH2SharedUserLastSync *)v6 homeUUID],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqual:v8],
          v8,
          v7,
          v9))
    {
      v10 = [(HMDHomeManagerHH2SharedUserLastSync *)self user];
      id v11 = [v10 uuid];
      v12 = [(HMDHomeManagerHH2SharedUserLastSync *)v6 user];
      v13 = [v12 uuid];
      char v14 = [v11 isEqual:v13];
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

- (void)configure
{
  id v4 = (void *)MEMORY[0x230FBD990](self, a2);
  if (self) {
    id Property = objc_getProperty(self, v3, 40, 1);
  }
  else {
    id Property = 0;
  }
  v6 = +[HMDUser getSyncDataFromLocalDiskWithArchive:Property];
  id v7 = v6;
  if (v6)
  {
    id v8 = objc_msgSend(v6, "hmf_UUIDForKey:", @"HMD.sync.data.homeUUID");
    [(HMDHomeManagerHH2SharedUserLastSync *)self setHomeUUID:v8];

    int v9 = [v7 objectForKeyedSubscript:@"HMD.sync.data.user"];
    [(HMDHomeManagerHH2SharedUserLastSync *)self setUser:v9];

    id v11 = objc_msgSend(v7, "hmf_dateForKey:", @"HMD.sync.data.timestamp");
    if (self) {
      objc_setProperty_atomic(self, v10, v11, 32);
    }

    v12 = [v7 objectForKeyedSubscript:@"HMD.sync.data.data"];

    if (v12) {
      self->_valid = 1;
    }
  }
}

- (HMDHomeManagerHH2SharedUserLastSync)initWithArchivePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHomeManagerHH2SharedUserLastSync;
  v6 = [(HMDHomeManagerHH2SharedUserLastSync *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_archivePath, a3);
  }

  return v7;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end