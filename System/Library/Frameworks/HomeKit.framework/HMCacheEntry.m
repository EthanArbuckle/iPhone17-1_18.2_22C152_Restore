@interface HMCacheEntry
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isExpired;
- (HMCacheEntry)initWithCoder:(id)a3;
- (HMCacheEntry)initWithData:(id)a3 lastModificationDate:(id)a4;
- (NSData)data;
- (NSDate)lastModificationDate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCacheEntry

- (BOOL)isExpired
{
  v2 = [(HMCacheEntry *)self lastModificationDate];
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

- (NSDate)lastModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (HMCacheEntry)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCacheEntryLastModificationDateKey"];
    if (v6)
    {
      self = [(HMCacheEntry *)self initWithData:v5 lastModificationDate:v6];
      v7 = self;
    }
    else
    {
      v11 = (void *)MEMORY[0x19F3A64A0]();
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        int v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive lastModificationDate for HMCacheEntry", (uint8_t *)&v15, 0xCu);
      }
      v7 = 0;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive data for HMCacheEntry", (uint8_t *)&v15, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (HMCacheEntry)initWithData:(id)a3 lastModificationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMCacheEntry;
  v8 = [(HMCacheEntry *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    data = v8->_data;
    v8->_data = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    lastModificationDate = v8->_lastModificationDate;
    v8->_lastModificationDate = (NSDate *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMCacheEntry *)self data];
  [v4 encodeObject:v5 forKey:@"Data"];

  id v6 = [(HMCacheEntry *)self lastModificationDate];
  [v4 encodeObject:v6 forKey:@"HMCacheEntryLastModificationDateKey"];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end