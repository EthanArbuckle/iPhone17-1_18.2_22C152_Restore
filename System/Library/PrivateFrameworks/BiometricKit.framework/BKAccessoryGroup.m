@interface BKAccessoryGroup
- (BKAccessoryGroup)initWithServerAccessoryGroup:(id)a3 device:(id)a4;
- (BKDevice)device;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccessoryGroup:(id)a3;
- (BOOL)isEqualToServerAccessoryGroup:(id)a3;
- (NSString)name;
- (id)accessoriesWithError:(id *)a3;
- (id)connectedAccessoriesWithError:(id *)a3;
- (id)serverAccessoryGroup;
- (unint64_t)hash;
@end

@implementation BKAccessoryGroup

- (BKAccessoryGroup)initWithServerAccessoryGroup:(id)a3 device:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BKAccessoryGroup;
  v8 = [(BKAccessoryGroup *)&v15 init];
  if (v8)
  {
    if (v6)
    {
      v8->_type = [v6 type];
      uint64_t v9 = [v6 uuid];
      uuid = v8->_uuid;
      v8->_uuid = (NSUUID *)v9;

      uint64_t v11 = [v6 name];
      name = v8->_name;
      v8->_name = (NSString *)v11;

      objc_storeStrong((id *)&v8->_device, a4);
    }
    else
    {
      if (__osLog) {
        v14 = __osLog;
      }
      else {
        v14 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v17 = "serverAccessoryGroup";
        __int16 v18 = 2048;
        uint64_t v19 = 0;
        __int16 v20 = 2080;
        v21 = &unk_1B3B370EE;
        __int16 v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessoryGroup.m";
        __int16 v24 = 1024;
        int v25 = 33;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      v8 = 0;
    }
  }

  return v8;
}

- (id)serverAccessoryGroup
{
  v3 = objc_alloc_init(BiometricKitAccessoryGroup);
  [(BiometricKitAccessoryGroup *)v3 setType:self->_type];
  [(BiometricKitAccessoryGroup *)v3 setUuid:self->_uuid];
  [(BiometricKitAccessoryGroup *)v3 setName:self->_name];

  return v3;
}

- (id)accessoriesWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v5 = __osLogTrace;
  }
  else {
    v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_device->_xpcClient;
    id v7 = v5;
    uint64_t v8 = [(BiometricKitXPCClient *)xpcClient connectionId];
    *(_DWORD *)buf = 134217984;
    v39 = (const char *)v8;
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKAccessoryGroup::accessoriesWithError: (_cid %lu)\n", buf, 0xCu);
  }
  uint64_t v9 = self->_device->_xpcClient;
  id v36 = 0;
  int v10 = -[BiometricKitXPCClient listAccessories:](v9, "listAccessories:", &v36, a3);
  id v11 = v36;
  if (v10)
  {
    __int16 v24 = (void *)v10;
    if (__osLog) {
      int v25 = __osLog;
    }
    else {
      int v25 = v4;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v39 = "err == 0 ";
      __int16 v40 = 2048;
      v41 = v24;
      __int16 v42 = 2080;
      v43 = &unk_1B3B370EE;
      __int16 v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessoryGroup.m";
      __int16 v46 = 1024;
      int v47 = 72;
      _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v24, v30);
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v31 = v11;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v19 = [v18 group];
          BOOL v20 = [(BKAccessoryGroup *)self isEqualToServerAccessoryGroup:v19];

          if (v20)
          {
            v21 = [[BKAccessory alloc] initWithServerAccessory:v18 device:self->_device];
            [v12 addObject:v21];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v15);
    }

    id v11 = v31;
    v4 = MEMORY[0x1E4F14500];
    if (v12)
    {
      if (__osLogTrace) {
        __int16 v22 = __osLogTrace;
      }
      else {
        __int16 v22 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v30;
        if (v30) {
          v23 = (void *)*v30;
        }
        *(_DWORD *)buf = 138412546;
        v39 = (const char *)v12;
        __int16 v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_DEFAULT, "BKAccessoryGroup::accessoriesWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_38;
    }
  }
  if (__osLogTrace) {
    uint64_t v26 = __osLogTrace;
  }
  else {
    uint64_t v26 = v4;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = v30;
    if (v30) {
      v27 = (void *)*v30;
    }
    *(_DWORD *)buf = 138412546;
    v39 = 0;
    __int16 v40 = 2112;
    v41 = v27;
    _os_log_impl(&dword_1B3AF1000, v26, OS_LOG_TYPE_ERROR, "BKAccessoryGroup::accessoriesWithError: -> %@ %@\n", buf, 0x16u);
  }
  v12 = 0;
LABEL_38:

  return v12;
}

- (id)connectedAccessoriesWithError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v5 = __osLogTrace;
  }
  else {
    v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_device->_xpcClient;
    id v7 = v5;
    uint64_t v8 = [(BiometricKitXPCClient *)xpcClient connectionId];
    *(_DWORD *)buf = 134217984;
    v38 = (const char *)v8;
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKAccessoryGroup::connectedAccessoriesWithError: (_cid %lu)\n", buf, 0xCu);
  }
  uint64_t v9 = self->_device->_xpcClient;
  id v35 = 0;
  int v10 = -[BiometricKitXPCClient listAccessories:](v9, "listAccessories:", &v35, a3);
  id v11 = v35;
  if (v10)
  {
    v23 = (void *)v10;
    if (__osLog) {
      __int16 v24 = __osLog;
    }
    else {
      __int16 v24 = v4;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "err == 0 ";
      __int16 v39 = 2048;
      __int16 v40 = v23;
      __int16 v41 = 2080;
      __int16 v42 = &unk_1B3B370EE;
      __int16 v43 = 2080;
      __int16 v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessoryGroup.m";
      __int16 v45 = 1024;
      int v46 = 100;
      _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v23, v29);
    goto LABEL_32;
  }
  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v30 = v11;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v14) {
    goto LABEL_18;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v32 != v16) {
        objc_enumerationMutation(v13);
      }
      __int16 v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      uint64_t v19 = [v18 group];
      if ([(BKAccessoryGroup *)self isEqualToServerAccessoryGroup:v19])
      {
        char v20 = [v18 flags];

        if ((v20 & 2) == 0) {
          continue;
        }
        uint64_t v19 = [[BKAccessory alloc] initWithServerAccessory:v18 device:self->_device];
        [v12 addObject:v19];
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  }
  while (v15);
LABEL_18:

  id v11 = v30;
  v4 = MEMORY[0x1E4F14500];
  if (v12)
  {
    if (__osLogTrace) {
      v21 = __osLogTrace;
    }
    else {
      v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = v29;
      if (v29) {
        __int16 v22 = (void *)*v29;
      }
      *(_DWORD *)buf = 138412546;
      v38 = (const char *)v12;
      __int16 v39 = 2112;
      __int16 v40 = v22;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_DEFAULT, "BKAccessoryGroup::connectedAccessoriesWithError: -> %@ %@\n", buf, 0x16u);
    }
    goto LABEL_40;
  }
LABEL_32:
  if (__osLogTrace) {
    int v25 = __osLogTrace;
  }
  else {
    int v25 = v4;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = v29;
    if (v29) {
      uint64_t v26 = (void *)*v29;
    }
    *(_DWORD *)buf = 138412546;
    v38 = 0;
    __int16 v39 = 2112;
    __int16 v40 = v26;
    _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "BKAccessoryGroup::connectedAccessoriesWithError: -> %@ %@\n", buf, 0x16u);
  }
  v12 = 0;
LABEL_40:

  return v12;
}

- (BOOL)isEqualToServerAccessoryGroup:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (unsigned int type = self->_type, type == [v4 type]))
  {
    uuid = self->_uuid;
    uint64_t v8 = [v5 uuid];
    char v9 = [(NSUUID *)uuid isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualToAccessoryGroup:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_type == *((_DWORD *)v4 + 2)) {
    char v6 = [(NSUUID *)self->_uuid isEqual:*((void *)v4 + 2)];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKAccessoryGroup *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BKAccessoryGroup *)self isEqualToAccessoryGroup:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (BKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end