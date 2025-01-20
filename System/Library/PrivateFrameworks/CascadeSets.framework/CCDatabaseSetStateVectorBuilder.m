@interface CCDatabaseSetStateVectorBuilder
- (CCDatabaseSetStateVectorBuilder)init;
- (CCDatabaseSetStateVectorBuilder)initWithDeviceMapping:(id)a3 missingAtomsImplied:(BOOL)a4;
- (id)_indexSetForAtomState:(unsigned __int8)a3 deviceRowId:(id)a4 maxIndex:(unint64_t)a5;
- (id)build;
- (void)addClockValue:(unint64_t)a3 withAtomState:(unsigned __int8)a4 forDeviceRowId:(id)a5;
- (void)addClockValueRange:(_NSRange)a3 withAtomState:(unsigned __int8)a4 forDeviceRowId:(id)a5;
- (void)addClockValueSet:(id)a3 withAtomState:(unsigned __int8)a4 forDeviceRowId:(id)a5;
@end

@implementation CCDatabaseSetStateVectorBuilder

- (CCDatabaseSetStateVectorBuilder)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCDatabaseSetStateVectorBuilder)initWithDeviceMapping:(id)a3 missingAtomsImplied:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCDatabaseSetStateVectorBuilder;
  v8 = [(CCDatabaseSetStateVectorBuilder *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_deviceMapping, a3);
    v9->_missingAtomsImplied = a4;
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[CCDatabaseDeviceMapping count](v9->_deviceMapping, "count"));
    allDeviceClockValues = v9->_allDeviceClockValues;
    v9->_allDeviceClockValues = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (id)_indexSetForAtomState:(unsigned __int8)a3 deviceRowId:(id)a4 maxIndex:(unint64_t)a5
{
  int v7 = a3;
  id v9 = a4;
  if (([v9 isEqual:self->_lastDeviceRowId] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastDeviceRowId, a4);
    uint64_t v10 = [(NSMutableDictionary *)self->_allDeviceClockValues objectForKey:self->_lastDeviceRowId];
    deviceClockValues = self->_deviceClockValues;
    self->_deviceClockValues = v10;

    if (!self->_deviceClockValues)
    {
      v12 = [[CCDatabaseDeviceClockValues alloc] initWithDeviceRowId:self->_lastDeviceRowId missingAtomsImplied:self->_missingAtomsImplied];
      objc_super v13 = self->_deviceClockValues;
      self->_deviceClockValues = v12;

      [(NSMutableDictionary *)self->_allDeviceClockValues setObject:self->_deviceClockValues forKey:self->_lastDeviceRowId];
    }
  }
  [(CCDatabaseDeviceClockValues *)self->_deviceClockValues updateMax:a5];
  switch(v7)
  {
    case 3:
      uint64_t v14 = [(CCDatabaseDeviceClockValues *)self->_deviceClockValues missing];
      goto LABEL_10;
    case 2:
      uint64_t v14 = [(CCDatabaseDeviceClockValues *)self->_deviceClockValues tombstoned];
      goto LABEL_10;
    case 1:
      uint64_t v14 = [(CCDatabaseDeviceClockValues *)self->_deviceClockValues present];
LABEL_10:
      v15 = (void *)v14;
      goto LABEL_12;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (void)addClockValue:(unint64_t)a3 withAtomState:(unsigned __int8)a4 forDeviceRowId:(id)a5
{
  id v6 = [(CCDatabaseSetStateVectorBuilder *)self _indexSetForAtomState:a4 deviceRowId:a5 maxIndex:a3];
  [v6 addIndex:a3];
}

- (void)addClockValueRange:(_NSRange)a3 withAtomState:(unsigned __int8)a4 forDeviceRowId:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = [(CCDatabaseSetStateVectorBuilder *)self _indexSetForAtomState:a4 deviceRowId:a5 maxIndex:a3.length + a3.location - 1];
  objc_msgSend(v7, "addIndexesInRange:", location, length);
}

- (void)addClockValueSet:(id)a3 withAtomState:(unsigned __int8)a4 forDeviceRowId:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  -[CCDatabaseSetStateVectorBuilder _indexSetForAtomState:deviceRowId:maxIndex:](self, "_indexSetForAtomState:deviceRowId:maxIndex:", v5, v8, [v9 lastIndex]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v10 addIndexes:v9];
}

- (id)build
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v3 = (void *)getCKDistributedTimestampStateVectorClass_softClass_2;
  uint64_t v27 = getCKDistributedTimestampStateVectorClass_softClass_2;
  if (!getCKDistributedTimestampStateVectorClass_softClass_2)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCKDistributedTimestampStateVectorClass_block_invoke_2;
    v30 = &unk_265279D38;
    v31 = &v24;
    __getCKDistributedTimestampStateVectorClass_block_invoke_2((uint64_t)buf);
    v3 = (void *)v25[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v24, 8);
  uint64_t v5 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = self->_allDeviceClockValues;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v8 = 138412802;
    long long v19 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v12 = -[NSMutableDictionary objectForKey:](self->_allDeviceClockValues, "objectForKey:", v11, v19, (void)v20);
        objc_super v13 = [(CCDatabaseDeviceMapping *)self->_deviceMapping siteIdentifierForDeviceRowId:v11];
        if (v13)
        {
          if (self->_missingAtomsImplied) {
            objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 1, objc_msgSend(v12, "max"));
          }
          else {
          v16 = [v12 missing];
          }
          [v5 addClockValuesInIndexSet:v16 withAtomState:3 forSiteIdentifier:v13];

          v17 = [v12 present];
          [v5 addClockValuesInIndexSet:v17 withAtomState:1 forSiteIdentifier:v13];

          uint64_t v14 = [v12 tombstoned];
          [v5 addClockValuesInIndexSet:v14 withAtomState:2 forSiteIdentifier:v13];
        }
        else
        {
          uint64_t v14 = __biome_log_for_category();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            deviceMapping = self->_deviceMapping;
            *(_DWORD *)buf = v19;
            *(void *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = deviceMapping;
            *(_WORD *)&buf[22] = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_249B92000, v14, OS_LOG_TYPE_ERROR, "Ignoring provenance row(s) for deviceRowId: %@ without a siteIdentifier mapping: %@ clockValues: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClockValues, 0);
  objc_storeStrong((id *)&self->_lastDeviceRowId, 0);
  objc_storeStrong((id *)&self->_allDeviceClockValues, 0);

  objc_storeStrong((id *)&self->_deviceMapping, 0);
}

@end