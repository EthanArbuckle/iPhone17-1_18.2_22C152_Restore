@interface BKAccessory
- (BKAccessory)initWithServerAccessory:(id)a3 device:(id)a4;
- (BKAccessoryGroup)accessoryGroup;
- (BKDevice)device;
- (BOOL)isAuthorized:(BOOL *)a3 error:(id *)a4;
- (BOOL)isConnected:(BOOL *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccessory:(id)a3;
- (BOOL)isEqualToServerAccessory:(id)a3;
- (BOOL)isRemovable;
- (NSData)uid;
- (NSString)name;
- (id)serverAccessory;
- (unint64_t)hash;
@end

@implementation BKAccessory

- (BKAccessory)initWithServerAccessory:(id)a3 device:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BKAccessory;
  v8 = [(BKAccessory *)&v19 init];
  if (v8)
  {
    if (v6)
    {
      v8->_type = [v6 type];
      uint64_t v9 = [v6 uuid];
      uuid = v8->_uuid;
      v8->_uuid = (NSUUID *)v9;

      v8->_flags = [v6 flags];
      uint64_t v11 = [v6 name];
      name = v8->_name;
      v8->_name = (NSString *)v11;

      v13 = [BKAccessoryGroup alloc];
      v14 = [v6 group];
      uint64_t v15 = [(BKAccessoryGroup *)v13 initWithServerAccessoryGroup:v14 device:v7];
      accessoryGroup = v8->_accessoryGroup;
      v8->_accessoryGroup = (BKAccessoryGroup *)v15;

      objc_storeStrong((id *)&v8->_device, a4);
    }
    else
    {
      if (__osLog) {
        v18 = __osLog;
      }
      else {
        v18 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = "serverAccessory";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        v25 = &unk_1B3B370EE;
        __int16 v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
        __int16 v28 = 1024;
        int v29 = 34;
        _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      v8 = 0;
    }
  }

  return v8;
}

- (id)serverAccessory
{
  v3 = objc_alloc_init(BiometricKitAccessory);
  [(BiometricKitAccessory *)v3 setType:self->_type];
  [(BiometricKitAccessory *)v3 setUuid:self->_uuid];
  [(BiometricKitAccessory *)v3 setName:self->_name];
  [(BiometricKitAccessory *)v3 setFlags:self->_flags];
  v4 = [(BKAccessoryGroup *)self->_accessoryGroup serverAccessoryGroup];
  [(BiometricKitAccessory *)v3 setGroup:v4];

  return v3;
}

- (BOOL)isRemovable
{
  return self->_flags & 1;
}

- (NSData)uid
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if (self->_type == 2)
  {
    v4[0] = 0;
    v4[1] = 0;
    [(NSUUID *)self->_uuid getUUIDBytes:v4];
    v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:16];
  }
  else
  {
    v2 = 0;
  }
  return (NSData *)v2;
}

- (BOOL)isEqualToServerAccessory:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (unsigned int type = self->_type, type == [v4 type]))
  {
    uuid = self->_uuid;
    v8 = [v5 uuid];
    char v9 = [(NSUUID *)uuid isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualToAccessory:(id)a3
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
  id v4 = (BKAccessory *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BKAccessory *)self isEqualToAccessory:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isConnected:(BOOL *)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_device->_xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    *(void *)v38 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKAccessory:isConnected: (_cid %lu)\n", buf, 0xCu);
  }
  if (!a3)
  {
    if (__osLog) {
      v25 = __osLog;
    }
    else {
      v25 = v7;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v38 = "connected";
      *(_WORD *)&v38[8] = 2048;
      *(void *)&v38[10] = 0;
      __int16 v39 = 2080;
      v40 = &unk_1B3B370EE;
      __int16 v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
      __int16 v43 = 1024;
      int v44 = 138;
      _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
    id v14 = 0;
    goto LABEL_40;
  }
  uint64_t v11 = self->_device->_xpcClient;
  id v35 = 0;
  int v12 = [(BiometricKitXPCClient *)v11 listAccessories:&v35];
  id v13 = v35;
  id v14 = v13;
  if (v12)
  {
    __int16 v26 = (void *)v12;
    if (__osLog) {
      v27 = __osLog;
    }
    else {
      v27 = v7;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v38 = "err == 0 ";
      *(_WORD *)&v38[8] = 2048;
      *(void *)&v38[10] = v26;
      __int16 v39 = 2080;
      v40 = &unk_1B3B370EE;
      __int16 v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
      __int16 v43 = 1024;
      int v44 = 141;
      _os_log_impl(&dword_1B3AF1000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v26, a4);
LABEL_40:
    if (__osLogTrace) {
      __int16 v28 = __osLogTrace;
    }
    else {
      __int16 v28 = v7;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        BOOL v29 = *a3;
      }
      else {
        BOOL v29 = 0;
      }
      if (a4) {
        id v30 = *a4;
      }
      else {
        id v30 = 0;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = v29;
      *(_WORD *)&v38[4] = 2112;
      *(void *)&v38[6] = v30;
      _os_log_impl(&dword_1B3AF1000, v28, OS_LOG_TYPE_ERROR, "BKAccessory::isConnected: -> %u %@\n", buf, 0x12u);
    }
    BOOL v23 = 0;
    goto LABEL_27;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_super v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (-[BKAccessory isEqualToServerAccessory:](self, "isEqualToServerAccessory:", v19, (void)v31))
        {
          *a3 = ([v19 flags] & 2) != 0;
          goto LABEL_18;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  if (__osLogTrace) {
    v20 = __osLogTrace;
  }
  else {
    v20 = v7;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v21 = *a3;
    if (a4) {
      id v22 = *a4;
    }
    else {
      id v22 = 0;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v38 = v21;
    *(_WORD *)&v38[4] = 2112;
    *(void *)&v38[6] = v22;
    _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_DEFAULT, "BKAccessory::isConnected: -> %u %@\n", buf, 0x12u);
  }
  BOOL v23 = 1;
LABEL_27:

  return v23;
}

- (BOOL)isAuthorized:(BOOL *)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_device->_xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    *(void *)v38 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKAccessory:isAuthorized: (_cid %lu)\n", buf, 0xCu);
  }
  if (!a3)
  {
    if (__osLog) {
      v25 = __osLog;
    }
    else {
      v25 = v7;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v38 = "authorized";
      *(_WORD *)&v38[8] = 2048;
      *(void *)&v38[10] = 0;
      __int16 v39 = 2080;
      v40 = &unk_1B3B370EE;
      __int16 v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
      __int16 v43 = 1024;
      int v44 = 170;
      _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
    id v14 = 0;
    goto LABEL_40;
  }
  uint64_t v11 = self->_device->_xpcClient;
  id v35 = 0;
  int v12 = [(BiometricKitXPCClient *)v11 listAccessories:&v35];
  id v13 = v35;
  id v14 = v13;
  if (v12)
  {
    __int16 v26 = (void *)v12;
    if (__osLog) {
      v27 = __osLog;
    }
    else {
      v27 = v7;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v38 = "err == 0 ";
      *(_WORD *)&v38[8] = 2048;
      *(void *)&v38[10] = v26;
      __int16 v39 = 2080;
      v40 = &unk_1B3B370EE;
      __int16 v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
      __int16 v43 = 1024;
      int v44 = 173;
      _os_log_impl(&dword_1B3AF1000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v26, a4);
LABEL_40:
    if (__osLogTrace) {
      __int16 v28 = __osLogTrace;
    }
    else {
      __int16 v28 = v7;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        BOOL v29 = *a3;
      }
      else {
        BOOL v29 = 0;
      }
      if (a4) {
        id v30 = *a4;
      }
      else {
        id v30 = 0;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = v29;
      *(_WORD *)&v38[4] = 2112;
      *(void *)&v38[6] = v30;
      _os_log_impl(&dword_1B3AF1000, v28, OS_LOG_TYPE_ERROR, "BKAccessory::isAuthorized: -> %u %@\n", buf, 0x12u);
    }
    BOOL v23 = 0;
    goto LABEL_27;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_super v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (-[BKAccessory isEqualToServerAccessory:](self, "isEqualToServerAccessory:", v19, (void)v31))
        {
          *a3 = ([v19 flags] & 4) != 0;
          goto LABEL_18;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  if (__osLogTrace) {
    v20 = __osLogTrace;
  }
  else {
    v20 = v7;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v21 = *a3;
    if (a4) {
      id v22 = *a4;
    }
    else {
      id v22 = 0;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v38 = v21;
    *(_WORD *)&v38[4] = 2112;
    *(void *)&v38[6] = v22;
    _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_DEFAULT, "BKAccessory::isAuthorized: -> %u %@\n", buf, 0x12u);
  }
  BOOL v23 = 1;
LABEL_27:

  return v23;
}

- (NSString)name
{
  return self->_name;
}

- (BKAccessoryGroup)accessoryGroup
{
  return self->_accessoryGroup;
}

- (BKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_accessoryGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end