@interface DNDSSyncEngineMetadataStore
- (BOOL)addZoneName:(id)a3;
- (BOOL)isEncryptionAvailable;
- (BOOL)removeZoneName:(id)a3;
- (DNDSSyncEngineMetadataStore)init;
- (DNDSSyncEngineMetadataStore)initWithURL:(id)a3;
- (NSData)metadata;
- (NSString)userRecordID;
- (id)_decodeRecordIDFromData:(id)a3;
- (id)_encodedRecordIDFromRecordID:(id)a3;
- (id)_encodedSystemFieldsFromRecord:(id)a3;
- (id)recordIDsWithZoneID:(id)a3;
- (id)recordWithID:(id)a3;
- (id)zoneNames;
- (int64_t)accountStatus;
- (void)_read;
- (void)_removeSystemFieldsForRecordID:(id)a3;
- (void)_updateSystemFieldsForRecord:(id)a3;
- (void)_write;
- (void)addRecord:(id)a3;
- (void)purge;
- (void)removeRecordWithID:(id)a3;
- (void)removeRecordsWithZoneID:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setEncryptionAvailable:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setUserRecordID:(id)a3;
@end

@implementation DNDSSyncEngineMetadataStore

- (DNDSSyncEngineMetadataStore)init
{
  return [(DNDSSyncEngineMetadataStore *)self initWithURL:0];
}

- (DNDSSyncEngineMetadataStore)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSSyncEngineMetadataStore;
  v5 = [(DNDSSyncEngineMetadataStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    [(DNDSSyncEngineMetadataStore *)v5 _read];
  }

  return v5;
}

- (NSData)metadata
{
  v2 = (void *)[(NSData *)self->_metadata copy];
  return (NSData *)v2;
}

- (void)setMetadata:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  metadata = self->_metadata;
  self->_metadata = v4;

  [(DNDSSyncEngineMetadataStore *)self _write];
}

- (NSString)userRecordID
{
  v2 = (void *)[(NSString *)self->_userRecordID copy];
  return (NSString *)v2;
}

- (void)setUserRecordID:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  userRecordID = self->_userRecordID;
  self->_userRecordID = v4;

  [(DNDSSyncEngineMetadataStore *)self _write];
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
  [(DNDSSyncEngineMetadataStore *)self _write];
}

- (BOOL)isEncryptionAvailable
{
  return self->_encryptionAvailable;
}

- (void)setEncryptionAvailable:(BOOL)a3
{
  self->_encryptionAvailable = a3;
  [(DNDSSyncEngineMetadataStore *)self _write];
}

- (id)recordWithID:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_systemFieldsByRecordID objectForKeyedSubscript:v4];
  if (v5)
  {
    id v11 = 0;
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v11];
    id v7 = v11;
    if (v7)
    {
      v8 = (void *)DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
        [(DNDSSyncEngineMetadataStore *)v8 recordWithID:(uint64_t)v7];
      }
      objc_super v9 = 0;
    }
    else
    {
      objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithCoder:v6];
    }
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)addRecord:(id)a3
{
  [(DNDSSyncEngineMetadataStore *)self _updateSystemFieldsForRecord:a3];
  [(DNDSSyncEngineMetadataStore *)self _write];
}

- (void)removeRecordWithID:(id)a3
{
  [(DNDSSyncEngineMetadataStore *)self _removeSystemFieldsForRecordID:a3];
  [(DNDSSyncEngineMetadataStore *)self _write];
}

- (void)removeRecordsWithZoneID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_systemFieldsByRecordID;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v12 = [v11 zoneID];
        int v13 = [v12 isEqual:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          -[DNDSSyncEngineMetadataStore _removeSystemFieldsForRecordID:](self, "_removeSystemFieldsForRecordID:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }

    [(DNDSSyncEngineMetadataStore *)self _write];
  }
}

- (void)purge
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Failed to delete metadata store: %@", (uint8_t *)&v2, 0xCu);
}

- (id)recordIDsWithZoneID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_systemFieldsByRecordID;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "zoneID", (void)v15);
        int v13 = [v12 isEqual:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)addZoneName:(id)a3
{
  id v4 = a3;
  char v5 = [(NSMutableSet *)self->_zoneNames containsObject:v4];
  if ((v5 & 1) == 0)
  {
    [(NSMutableSet *)self->_zoneNames addObject:v4];
    [(DNDSSyncEngineMetadataStore *)self _write];
  }

  return v5 ^ 1;
}

- (BOOL)removeZoneName:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableSet *)self->_zoneNames containsObject:v4];
  if (v5)
  {
    [(NSMutableSet *)self->_zoneNames removeObject:v4];
    [(DNDSSyncEngineMetadataStore *)self _write];
  }

  return v5;
}

- (id)zoneNames
{
  int v2 = (void *)[(NSMutableSet *)self->_zoneNames copy];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  int v5 = v4;

  return v5;
}

- (void)_read
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Failed to load metadata store at url %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_write
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Failed to write metadata store: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateSystemFieldsForRecord:(id)a3
{
  id v4 = a3;
  id v6 = [v4 recordID];
  uint64_t v5 = [(DNDSSyncEngineMetadataStore *)self _encodedSystemFieldsFromRecord:v4];

  [(NSMutableDictionary *)self->_systemFieldsByRecordID setObject:v5 forKeyedSubscript:v6];
}

- (void)_removeSystemFieldsForRecordID:(id)a3
{
}

- (id)_encodedSystemFieldsFromRecord:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v4 encodeSystemFieldsWithCoder:v5];

  id v6 = [v5 encodedData];

  return v6;
}

- (id)_encodedRecordIDFromRecordID:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v4 encodeWithCoder:v5];

  id v6 = [v5 encodedData];

  return v6;
}

- (id)_decodeRecordIDFromData:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithCoder:v5];
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_systemFieldsByRecordID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)recordWithID:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  id v6 = [a2 recordName];
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1D3052000, v5, OS_LOG_TYPE_ERROR, "Failed to decode system fields for record %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end