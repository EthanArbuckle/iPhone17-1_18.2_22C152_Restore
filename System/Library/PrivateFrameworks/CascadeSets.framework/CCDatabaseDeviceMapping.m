@interface CCDatabaseDeviceMapping
- (CCDatabaseDeviceMapping)initWithDeviceRecords:(id)a3;
- (id)description;
- (id)deviceRecordForDeviceRowId:(id)a3;
- (id)deviceRowIdForSiteIdentifier:(id)a3;
- (id)siteIdentifierForDeviceRowId:(id)a3;
- (unint64_t)count;
@end

@implementation CCDatabaseDeviceMapping

- (CCDatabaseDeviceMapping)initWithDeviceRecords:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v22 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CCDatabaseDeviceMapping;
  v4 = [(CCDatabaseDeviceMapping *)&v28 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v22, "count"));
    deviceRowIdMap = v4->_deviceRowIdMap;
    v4->_deviceRowIdMap = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v22, "count"));
    siteIdentifierMap = v4->_siteIdentifierMap;
    v4->_siteIdentifierMap = (NSMutableDictionary *)v7;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v22;
    uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v13 = [v12 deviceRowId];
          v14 = [v12 deviceId];
          v15 = [v14 dataUsingEncoding:4];
          uint64_t v30 = 0;
          v31 = &v30;
          uint64_t v32 = 0x2050000000;
          v16 = (void *)getCKDistributedSiteIdentifierClass_softClass;
          uint64_t v33 = getCKDistributedSiteIdentifierClass_softClass;
          if (!getCKDistributedSiteIdentifierClass_softClass)
          {
            v29[0] = MEMORY[0x263EF8330];
            v29[1] = 3221225472;
            v29[2] = __getCKDistributedSiteIdentifierClass_block_invoke;
            v29[3] = &unk_265279D38;
            v29[4] = &v30;
            __getCKDistributedSiteIdentifierClass_block_invoke((uint64_t)v29);
            v16 = (void *)v31[3];
          }
          v17 = v16;
          _Block_object_dispose(&v30, 8);
          v18 = (void *)[[v17 alloc] initWithIdentifier:v15];
          v19 = v4->_deviceRowIdMap;
          v20 = [MEMORY[0x263F61EA8] tupleWithFirst:v12 second:v18];
          [(NSMutableDictionary *)v19 setObject:v20 forKey:v13];

          [(NSMutableDictionary *)v4->_siteIdentifierMap setObject:v13 forKey:v18];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v9);
    }
  }
  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCDatabaseDeviceMapping;
  v3 = [(CCDatabaseDeviceMapping *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" %@", self->_deviceRowIdMap];

  return v4;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_deviceRowIdMap count];
}

- (id)deviceRecordForDeviceRowId:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_deviceRowIdMap objectForKey:a3];
  v4 = [v3 first];

  return v4;
}

- (id)siteIdentifierForDeviceRowId:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_deviceRowIdMap objectForKey:a3];
  v4 = [v3 second];

  return v4;
}

- (id)deviceRowIdForSiteIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_siteIdentifierMap objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siteIdentifierMap, 0);

  objc_storeStrong((id *)&self->_deviceRowIdMap, 0);
}

@end