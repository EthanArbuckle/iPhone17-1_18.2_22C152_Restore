@interface AKDeviceListResponse
+ (BOOL)supportsSecureCoding;
+ (id)deviceMapFromResponseBody:(id)a3;
- (AKDeviceListResponse)initWithCoder:(id)a3;
- (AKDeviceListResponse)initWithResponseBody:(id)a3;
- (NSArray)deletedDeviceList;
- (NSArray)deviceList;
- (NSNumber)trustedDevicesUpdateTimestamp;
- (NSString)altDSID;
- (NSString)deletedDeviceHash;
- (NSString)deletedDevicesCacheExpiryOffset;
- (NSString)deviceListVersion;
- (NSString)trustedDeviceHash;
- (id)_computeHashForDevices:(id)a3;
- (id)_parseDeletedDevicesFromResponseBody:(id)a3;
- (id)_parseDevicesFromResponseBody:(id)a3;
- (id)deletedDevicesClientHash;
- (id)description;
- (id)trustedDevicesClientHash;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setDeletedDeviceHash:(id)a3;
- (void)setDeletedDeviceList:(id)a3;
- (void)setDeletedDevicesCacheExpiryOffset:(id)a3;
- (void)setDeviceList:(id)a3;
- (void)setDeviceListVersion:(id)a3;
- (void)setTrustedDeviceHash:(id)a3;
- (void)setTrustedDevicesUpdateTimestamp:(id)a3;
- (void)updateWithDeviceRestrictionState:(id)a3;
@end

@implementation AKDeviceListResponse

- (AKDeviceListResponse)initWithResponseBody:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AKDeviceListResponse;
  v5 = [(AKDeviceListResponse *)&v29 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKeyedSubscript:@"adsid"];
    if (objc_opt_isKindOfClass()) {
      v7 = (NSString *)v6;
    }
    else {
      v7 = 0;
    }

    altDSID = v5->_altDSID;
    v5->_altDSID = v7;

    objc_opt_class();
    id v9 = [v4 objectForKeyedSubscript:@"deviceListVersion"];
    if (objc_opt_isKindOfClass()) {
      v10 = (NSString *)v9;
    }
    else {
      v10 = 0;
    }

    deviceListVersion = v5->_deviceListVersion;
    v5->_deviceListVersion = v10;

    uint64_t v12 = [(AKDeviceListResponse *)v5 _parseDevicesFromResponseBody:v4];
    deviceList = v5->_deviceList;
    v5->_deviceList = (NSArray *)v12;

    uint64_t v14 = [(AKDeviceListResponse *)v5 _parseDeletedDevicesFromResponseBody:v4];
    deletedDeviceList = v5->_deletedDeviceList;
    v5->_deletedDeviceList = (NSArray *)v14;

    objc_opt_class();
    id v16 = [v4 objectForKeyedSubscript:@"deletedDevicesCacheExpiryOffset"];
    if (objc_opt_isKindOfClass()) {
      v17 = (NSString *)v16;
    }
    else {
      v17 = 0;
    }

    deletedDevicesCacheExpiryOffset = v5->_deletedDevicesCacheExpiryOffset;
    v5->_deletedDevicesCacheExpiryOffset = v17;

    objc_opt_class();
    id v19 = [v4 objectForKeyedSubscript:@"trustedDeviceHash"];
    if (objc_opt_isKindOfClass()) {
      v20 = (NSString *)v19;
    }
    else {
      v20 = 0;
    }

    trustedDeviceHash = v5->_trustedDeviceHash;
    v5->_trustedDeviceHash = v20;

    objc_opt_class();
    id v22 = [v4 objectForKeyedSubscript:@"deletedDeviceHash"];
    if (objc_opt_isKindOfClass()) {
      v23 = (NSString *)v22;
    }
    else {
      v23 = 0;
    }

    deletedDeviceHash = v5->_deletedDeviceHash;
    v5->_deletedDeviceHash = v23;

    objc_opt_class();
    id v25 = [v4 objectForKeyedSubscript:@"trustedDevicesUpdateTimestamp"];
    if (objc_opt_isKindOfClass()) {
      v26 = (NSNumber *)v25;
    }
    else {
      v26 = 0;
    }

    trustedDevicesUpdateTimestamp = v5->_trustedDevicesUpdateTimestamp;
    v5->_trustedDevicesUpdateTimestamp = v26;
  }
  return v5;
}

- (AKDeviceListResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKDeviceListResponse *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceListVersion"];
    deviceListVersion = v5->_deviceListVersion;
    v5->_deviceListVersion = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_deviceList"];
    deviceList = v5->_deviceList;
    v5->_deviceList = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_deletedDeviceList"];
    deletedDeviceList = v5->_deletedDeviceList;
    v5->_deletedDeviceList = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deletedDevicesCacheExpiryOffset"];
    deletedDevicesCacheExpiryOffset = v5->_deletedDevicesCacheExpiryOffset;
    v5->_deletedDevicesCacheExpiryOffset = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_trustedDeviceHash"];
    trustedDeviceHash = v5->_trustedDeviceHash;
    v5->_trustedDeviceHash = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deletedDeviceHash"];
    deletedDeviceHash = v5->_deletedDeviceHash;
    v5->_deletedDeviceHash = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_trustedDevicesUpdateTimestamp"];
    trustedDevicesUpdateTimestamp = v5->_trustedDevicesUpdateTimestamp;
    v5->_trustedDevicesUpdateTimestamp = (NSNumber *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_deviceListVersion forKey:@"_deviceListVersion"];
  [v5 encodeObject:self->_deviceList forKey:@"_deviceList"];
  [v5 encodeObject:self->_deletedDeviceList forKey:@"_deletedDeviceList"];
  [v5 encodeObject:self->_deletedDevicesCacheExpiryOffset forKey:@"_deletedDevicesCacheExpiryOffset"];
  [v5 encodeObject:self->_trustedDeviceHash forKey:@"_trustedDeviceHash"];
  [v5 encodeObject:self->_deletedDeviceHash forKey:@"_deletedDeviceHash"];
  [v5 encodeObject:self->_trustedDevicesUpdateTimestamp forKey:@"_trustedDevicesUpdateTimestamp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> altDSID: %@, deviceListVersion: %@, deviceList: %@, deletedDeviceList: %@, deletedDevicesCacheExpiryOffset: %@, trustedDeviceHash: %@, deletedDeviceHash: %@, trustedDevicesUpdateTimestamp: %@", objc_opt_class(), self, self->_altDSID, self->_deviceListVersion, self->_deviceList, self->_deletedDeviceList, self->_deletedDevicesCacheExpiryOffset, self->_trustedDeviceHash, self->_deletedDeviceHash, self->_trustedDevicesUpdateTimestamp];
}

- (id)_parseDevicesFromResponseBody:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 objectForKeyedSubscript:@"devices"];

  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    v7 = objc_msgSend(v6, "aaf_map:", &__block_literal_global_41);
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

AKRemoteDevice *__54__AKDeviceListResponse__parseDevicesFromResponseBody___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[AKRemoteDevice alloc] initWithInfo:v2];

  return v3;
}

- (id)_parseDeletedDevicesFromResponseBody:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 objectForKeyedSubscript:@"deletedDevices"];

  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    v7 = objc_msgSend(v6, "aaf_map:", &__block_literal_global_49);
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

AKRemoteDevice *__61__AKDeviceListResponse__parseDeletedDevicesFromResponseBody___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[AKRemoteDevice alloc] initWithInfo:v2];

  return v3;
}

+ (id)deviceMapFromResponseBody:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  objc_opt_class();
  id v6 = [v4 objectForKeyedSubscript:@"accountInfo"];

  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__AKDeviceListResponse_deviceMapFromResponseBody___block_invoke;
  v12[3] = &unk_1E5761AF8;
  id v13 = v5;
  id v9 = v5;
  [v8 enumerateObjectsUsingBlock:v12];
  v10 = (void *)[v9 copy];

  return v10;
}

void __50__AKDeviceListResponse_deviceMapFromResponseBody___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [[AKDeviceListResponse alloc] initWithResponseBody:v3];

  id v4 = [(AKDeviceListResponse *)v7 altDSID];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [(AKDeviceListResponse *)v7 altDSID];
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

- (void)updateWithDeviceRestrictionState:(id)a3
{
  id v4 = a3;
  id v5 = [(AKDeviceListResponse *)self deviceList];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke;
  v9[3] = &unk_1E5761B20;
  id v6 = v4;
  id v10 = v6;
  id v7 = objc_msgSend(v5, "aaf_firstObjectPassingTest:", v9);

  if (v7)
  {
    [v7 setDeviceRestrictionState:v6];
  }
  else
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AKDeviceListResponse updateWithDeviceRestrictionState:](v6, v8);
    }
  }
}

uint64_t __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 serialNumber];
  id v6 = *(void **)(a1 + 32);
  id v5 = (id *)(a1 + 32);
  id v7 = [v6 serialNumber];
  int v8 = [v4 isEqualToString:v7];

  if (v8)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke_cold_1(v5);
    }
  }
  else
  {
    id v10 = [v3 machineId];
    uint64_t v11 = [*v5 machineId];
    int v12 = [v10 isEqualToString:v11];

    if (!v12)
    {
      uint64_t v13 = 0;
      goto LABEL_9;
    }
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke_cold_2(v5);
    }
  }

  uint64_t v13 = 1;
LABEL_9:

  return v13;
}

- (id)trustedDevicesClientHash
{
  return [(AKDeviceListResponse *)self _computeHashForDevices:self->_deviceList];
}

- (id)deletedDevicesClientHash
{
  return [(AKDeviceListResponse *)self _computeHashForDevices:self->_deletedDeviceList];
}

- (id)_computeHashForDevices:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_msgSend(v3, "aaf_map:", &__block_literal_global_56);
    id v5 = [v4 sortedArrayUsingSelector:sel_compare_];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      id v10 = &stru_1EE40D360;
      do
      {
        uint64_t v11 = 0;
        int v12 = v10;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", *(void *)(*((void *)&v18 + 1) + 8 * v11), (void)v18);
          id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v11;
          int v12 = v10;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      id v10 = &stru_1EE40D360;
    }

    uint64_t v14 = [(__CFString *)v10 dataUsingEncoding:4];
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = objc_msgSend(v14, "ak_SHA256Data");
      uint64_t v13 = objc_msgSend(v16, "aaf_toHexString");
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __47__AKDeviceListResponse__computeHashForDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 machineId];
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)deviceListVersion
{
  return self->_deviceListVersion;
}

- (void)setDeviceListVersion:(id)a3
{
}

- (NSArray)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
}

- (NSArray)deletedDeviceList
{
  return self->_deletedDeviceList;
}

- (void)setDeletedDeviceList:(id)a3
{
}

- (NSString)trustedDeviceHash
{
  return self->_trustedDeviceHash;
}

- (void)setTrustedDeviceHash:(id)a3
{
}

- (NSString)deletedDeviceHash
{
  return self->_deletedDeviceHash;
}

- (void)setDeletedDeviceHash:(id)a3
{
}

- (NSNumber)trustedDevicesUpdateTimestamp
{
  return self->_trustedDevicesUpdateTimestamp;
}

- (void)setTrustedDevicesUpdateTimestamp:(id)a3
{
}

- (NSString)deletedDevicesCacheExpiryOffset
{
  return self->_deletedDevicesCacheExpiryOffset;
}

- (void)setDeletedDevicesCacheExpiryOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedDevicesCacheExpiryOffset, 0);
  objc_storeStrong((id *)&self->_trustedDevicesUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_deletedDeviceHash, 0);
  objc_storeStrong((id *)&self->_trustedDeviceHash, 0);
  objc_storeStrong((id *)&self->_deletedDeviceList, 0);
  objc_storeStrong((id *)&self->_deviceList, 0);
  objc_storeStrong((id *)&self->_deviceListVersion, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)updateWithDeviceRestrictionState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 serialNumber];
  id v5 = [a1 machineId];
  int v6 = 141558786;
  uint64_t v7 = 1752392040;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2160;
  uint64_t v11 = 1752392040;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Failed to find device for serial number %{mask.hash}@ or mid %{mask.hash}@", (uint8_t *)&v6, 0x2Au);
}

void __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke_cold_1(id *a1)
{
  v1 = [*a1 serialNumber];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6(&dword_193494000, v2, v3, "Found device for serial number %{mask.hash}@", v4, v5, v6, v7, v8);
}

void __57__AKDeviceListResponse_updateWithDeviceRestrictionState___block_invoke_cold_2(id *a1)
{
  v1 = [*a1 machineId];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6(&dword_193494000, v2, v3, "Found device for machineId %{mask.hash}@", v4, v5, v6, v7, v8);
}

@end