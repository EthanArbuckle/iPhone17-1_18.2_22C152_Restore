@interface HMFConnectivityInfo
+ (BOOL)supportsSecureCoding;
+ (HMFConnectivityInfo)connectivityInfoWithAccessoryIdentifier:(id)a3 wakeConfiguration:(id)a4;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMFConnectivityInfo)initWithAccessoryIdentifier:(id)a3 woBLEInfo:(id)a4 woWLANInfos:(id)a5;
- (HMFConnectivityInfo)initWithCoder:(id)a3;
- (HMFWoBLEInfo)woBLEInfo;
- (HMFWoWLANInfo)woWLANInfo;
- (NSArray)woWLANInfos;
- (NSString)accessoryIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setWoBLEInfo:(id)a3;
- (void)setWoWLANInfos:(id)a3;
@end

@implementation HMFConnectivityInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_woWLANInfos, 0);
  objc_storeStrong((id *)&self->_woBLEInfo, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

- (void)setWoWLANInfos:(id)a3
{
}

- (NSArray)woWLANInfos
{
  return self->_woWLANInfos;
}

- (void)setWoBLEInfo:(id)a3
{
}

- (HMFWoBLEInfo)woBLEInfo
{
  return self->_woBLEInfo;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMFConnectivityInfo *)self accessoryIdentifier];
  v5 = [(HMFConnectivityInfo *)self woBLEInfo];
  v6 = [(HMFConnectivityInfo *)self woWLANInfos];
  v7 = [v3 stringWithFormat:@"Identifier: %@ BLEInfo: %@, WLANInfos: %@", v4, v5, v6];

  return v7;
}

- (HMFConnectivityInfo)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFCI.ID"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HMFCI.woBLE"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v12 = [v10 setWithArray:v11];
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"HMFCI.woWLAN"];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v16 = [v14 setWithArray:v15];
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"HMFCI.All.woWLAN"];

  if (![v17 count] && v13)
  {
    v21 = v13;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];

    v17 = (void *)v18;
  }
  v19 = [(HMFConnectivityInfo *)self initWithAccessoryIdentifier:v5 woBLEInfo:v9 woWLANInfos:v17];

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(HMFConnectivityInfo *)self accessoryIdentifier];
  [v11 encodeObject:v4 forKey:@"HMFCI.ID"];

  v5 = [(HMFConnectivityInfo *)self woBLEInfo];

  if (v5)
  {
    v6 = [(HMFConnectivityInfo *)self woBLEInfo];
    [v11 encodeObject:v6 forKey:@"HMFCI.woBLE"];
  }
  v7 = [(HMFConnectivityInfo *)self woWLANInfo];

  if (v7)
  {
    v8 = [(HMFConnectivityInfo *)self woWLANInfo];
    [v11 encodeObject:v8 forKey:@"HMFCI.woWLAN"];
  }
  v9 = [(HMFConnectivityInfo *)self woWLANInfos];

  if (v9)
  {
    v10 = [(HMFConnectivityInfo *)self woWLANInfos];
    [v11 encodeObject:v10 forKey:@"HMFCI.All.woWLAN"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMFConnectivityInfo *)a3;
  if (self == v4)
  {
    char v15 = 1;
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
    if (!v6) {
      goto LABEL_9;
    }
    v7 = [(HMFConnectivityInfo *)self accessoryIdentifier];
    v8 = [(HMFConnectivityInfo *)v6 accessoryIdentifier];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_9;
    }
    v10 = [(HMFConnectivityInfo *)self woBLEInfo];
    id v11 = [(HMFConnectivityInfo *)v6 woBLEInfo];
    int v12 = HMFEqualObjects();

    if (v12)
    {
      v13 = [(HMFConnectivityInfo *)self woWLANInfos];
      v14 = [(HMFConnectivityInfo *)v6 woWLANInfos];
      char v15 = HMFEqualObjects();
    }
    else
    {
LABEL_9:
      char v15 = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  v3 = [(HMFConnectivityInfo *)self accessoryIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(HMFConnectivityInfo *)self woBLEInfo];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMFConnectivityInfo *)self woWLANInfos];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (HMFWoWLANInfo)woWLANInfo
{
  v2 = [(HMFConnectivityInfo *)self woWLANInfos];
  v3 = [v2 firstObject];

  return (HMFWoWLANInfo *)v3;
}

- (HMFConnectivityInfo)initWithAccessoryIdentifier:(id)a3 woBLEInfo:(id)a4 woWLANInfos:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = v11;
  if (v9 && (v10 || [v11 count]))
  {
    v33.receiver = self;
    v33.super_class = (Class)HMFConnectivityInfo;
    v13 = [(HMFConnectivityInfo *)&v33 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_accessoryIdentifier, a3);
      objc_storeStrong((id *)&v14->_woBLEInfo, a4);
      if (v12)
      {
        char v15 = [MEMORY[0x1E4F1CA48] array];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v16 = v12;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
              if ((objc_msgSend(v15, "containsObject:", v21, (void)v29) & 1) == 0) {
                [v15 addObject:v21];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
          }
          while (v18);
        }

        uint64_t v22 = [v15 copy];
        woWLANInfos = v14->_woWLANInfos;
        v14->_woWLANInfos = (NSArray *)v22;
      }
    }
    self = v14;
    v24 = self;
  }
  else
  {
    v25 = (void *)MEMORY[0x1D9452090]();
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Returning nil for the invalid woBLEInfo and woWLANInfo of accessory: %@", buf, 0x16u);
    }
    v24 = 0;
  }

  return v24;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (HMFConnectivityInfo)connectivityInfoWithAccessoryIdentifier:(id)a3 wakeConfiguration:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 custom1];
  unint64_t v8 = [v7 primaryIdentifier];

  if (v8)
  {
    id v9 = [HMFWoBLEInfo alloc];
    id v10 = [v6 custom1];
    id v11 = [v10 primaryIdentifier];
    int v12 = [(HMFWoBLEInfo *)v9 initWithBLEIdentifier:v11];
  }
  else
  {
    int v12 = 0;
  }
  v13 = [v6 custom2];
  v14 = [v13 primaryIdentifier];

  if (v14)
  {
    char v15 = [HMFWoWLANInfo alloc];
    id v16 = [v6 custom2];
    uint64_t v17 = [v16 primaryIdentifier];
    uint64_t v18 = [v6 custom2];
    uint64_t v19 = [v18 secondaryIdentifier];
    v20 = [(HMFWoWLANInfo *)v15 initWithPrimaryIdentifier:v17 wifiIdentifiers:v19];

    uint64_t v21 = [HMFConnectivityInfo alloc];
    if (v20)
    {
      v25[0] = v20;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      v23 = [(HMFConnectivityInfo *)v21 initWithAccessoryIdentifier:v5 woBLEInfo:v12 woWLANInfos:v22];

      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v21 = [HMFConnectivityInfo alloc];
  }
  v23 = [(HMFConnectivityInfo *)v21 initWithAccessoryIdentifier:v5 woBLEInfo:v12 woWLANInfos:0];
LABEL_9:

  return v23;
}

@end