@interface HMDCapabilityFlags
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)hasCapabilities:(id)a3;
- (HMDCapabilityFlags)initWithCapabilities:(id)a3;
- (HMDCapabilityFlags)initWithCapabilityOptions:(unint64_t)a3;
- (HMDCapabilityFlags)initWithCoder:(id)a3;
- (HMDCapabilityFlags)initWithData:(id)a3;
- (NSData)bytesData;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCapabilityFlags

- (void).cxx_destruct
{
}

- (NSData)bytesData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)hasCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bytesData];
  uint64_t v6 = [v5 bytes];

  id v7 = [(HMDCapabilityFlags *)self bytesData];
  uint64_t v8 = [v7 bytes];

  v9 = [v4 bytesData];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    unint64_t v11 = 0;
    while (1)
    {
      v12 = [(HMDCapabilityFlags *)self bytesData];
      unint64_t v13 = [v12 length];

      if (v11 >= v13 || (*(unsigned __int8 *)(v6 + v11) & ~*(unsigned __int8 *)(v8 + v11)) != 0) {
        break;
      }
      ++v11;
      v14 = [v4 bytesData];
      unint64_t v15 = [v14 length];

      if (v11 >= v15) {
        goto LABEL_6;
      }
    }
    BOOL v16 = 0;
  }
  else
  {
LABEL_6:
    BOOL v16 = 1;
  }

  return v16;
}

- (HMDCapabilityFlags)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCapabilityFlags;
  uint64_t v6 = [(HMDCapabilityFlags *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bytesData, a3);
  }

  return v7;
}

- (HMDCapabilityFlags)initWithCapabilities:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 sortedArrayUsingSelector:sel_compare_];
  uint64_t v6 = [v5 valueForKeyPath:@"@max.self"];
  unint64_t v7 = [v6 unsignedIntegerValue];

  if ((v7 & 7) == 0 && v7 >= 8) {
    size_t v9 = v7 >> 3;
  }
  else {
    size_t v9 = (v7 >> 3) + 1;
  }
  if (v9 >= 9)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    unint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Ran over 64 bits, you sure this is expected?", buf, 0xCu);
    }
  }
  unint64_t v13 = malloc_type_malloc(v9, 0xB3867B94uLL);
  bzero(v13, v9);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        unint64_t v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "unsignedIntegerValue", (void)v23);
        *((unsigned char *)v13 + (v19 >> 3)) |= 1 << (v19 & 7);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v13 length:v9 freeWhenDone:1];
  v21 = [(HMDCapabilityFlags *)self initWithData:v20];

  return v21;
}

- (HMDCapabilityFlags)initWithCapabilityOptions:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  do
  {
    if ((a3 >> v6)) {
      uint64_t v8 = v7;
    }
    size_t v9 = [NSNumber numberWithUnsignedChar:(a3 >> v6)];
    [v5 addObject:v9];

    ++v7;
    v6 += 8;
  }
  while (v7 != 8);
  uint64_t v10 = v8 + 1;
  unint64_t v11 = malloc_type_malloc(v8 + 1, 0x100004077774924uLL);
  bzero(v11, v8 + 1);
  if (v8 != -1)
  {
    uint64_t v12 = 0;
    do
    {
      unint64_t v13 = [v5 objectAtIndexedSubscript:v12];
      *((unsigned char *)v11 + v12) = [v13 unsignedCharValue];

      ++v12;
    }
    while (v10 != v12);
  }
  id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v11 length:v10 freeWhenDone:1];
  uint64_t v15 = [(HMDCapabilityFlags *)self initWithData:v14];

  return v15;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDCapabilityFlags *)self bytesData];
  id v4 = [v2 stringWithFormat:@"[HMDCapabilityFlags %@]", v3];

  return v4;
}

- (HMDCapabilityFlags)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.rqcp"];

  if (v5)
  {
    self = [(HMDCapabilityFlags *)self initWithData:v5];
    char v6 = self;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCapabilityFlags *)self bytesData];
  [v4 encodeObject:v5 forKey:@"HMD.rqcp"];
}

+ (id)shortDescription
{
  return @"HMDCapabilityFlags";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end