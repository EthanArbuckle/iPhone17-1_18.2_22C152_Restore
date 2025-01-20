@interface HKNanoSyncPairedDevicesSnapshot
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKNanoSyncPairedDeviceInfo)activeDeviceInfo;
- (HKNanoSyncPairedDevicesSnapshot)initWithCoder:(id)a3;
- (HKNanoSyncPairedDevicesSnapshot)initWithPairedDeviceInfos:(id)a3;
- (NSSet)allDeviceInfos;
- (id)description;
- (id)deviceInfoForSourceBundleIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKNanoSyncPairedDevicesSnapshot

- (HKNanoSyncPairedDevicesSnapshot)initWithPairedDeviceInfos:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKNanoSyncPairedDevicesSnapshot.m", 20, @"Invalid parameter not satisfying: %@", @"deviceInfos != nil" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)HKNanoSyncPairedDevicesSnapshot;
  v6 = [(HKNanoSyncPairedDevicesSnapshot *)&v21 init];
  if (v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v12 isActive])
          {
            objc_storeStrong((id *)&v6->_activeDeviceInfo, v12);
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    allDeviceInfos = v6->_allDeviceInfos;
    v6->_allDeviceInfos = (NSSet *)v13;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    activeDeviceInfo = self->_activeDeviceInfo;
    id v7 = (HKNanoSyncPairedDeviceInfo *)v5[1];
    BOOL v8 = (activeDeviceInfo == v7 || v7 && -[HKNanoSyncPairedDeviceInfo isEqual:](activeDeviceInfo, "isEqual:"))
      && [(NSSet *)self->_allDeviceInfos isEqualToSet:v5[2]];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDeviceInfos, 0);

  objc_storeStrong((id *)&self->_activeDeviceInfo, 0);
}

- (HKNanoSyncPairedDeviceInfo)activeDeviceInfo
{
  return self->_activeDeviceInfo;
}

- (NSSet)allDeviceInfos
{
  return self->_allDeviceInfos;
}

- (id)deviceInfoForSourceBundleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKNanoSyncPairedDevicesSnapshot.m", 43, @"Invalid parameter not satisfying: %@", @"sourceBundleIdentifier != nil" object file lineNumber description];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = self->_allDeviceInfos;
  id v7 = (id)[(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 sourceBundleIdentifier];
        if (v11 && ([v5 isEqualToString:v11] & 1) != 0)
        {
          id v7 = v10;

          goto LABEL_14;
        }
      }
      id v7 = (id)[(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKNanoSyncPairedDeviceInfo *)self->_activeDeviceInfo hash];
  return [(NSSet *)self->_allDeviceInfos hash] ^ v3;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@:%p devices={", objc_opt_class(), self];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_allDeviceInfos;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if (*(HKNanoSyncPairedDeviceInfo **)(*((void *)&v13 + 1) + 8 * i) == self->_activeDeviceInfo) {
          uint64_t v9 = " (active)";
        }
        else {
          uint64_t v9 = "";
        }
        [v3 appendFormat:@"\n\t%@%s,", *(void *)(*((void *)&v13 + 1) + 8 * i), v9, (void)v13];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  NSUInteger v10 = [(NSSet *)self->_allDeviceInfos count];
  v11 = "\n";
  if (!v10) {
    v11 = "";
  }
  objc_msgSend(v3, "appendFormat:", @"%s}>", v11);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNanoSyncPairedDevicesSnapshot)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"allDevices"];

  if (v8)
  {
    self = [(HKNanoSyncPairedDevicesSnapshot *)self initWithPairedDeviceInfos:v8];
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  allDeviceInfos = self->_allDeviceInfos;
  id v4 = a3;
  id v5 = [(NSSet *)allDeviceInfos allObjects];
  [v4 encodeObject:v5 forKey:@"allDevices"];
}

@end