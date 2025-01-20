@interface HMBLocalZoneQueryResultParentModelID
- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (HMBLocalZoneQueryResultParentModelID)initWithLocalZone:(id)a3 parentModelID:(id)a4;
- (NSUUID)parentModelID;
- (int)parentModelIDOffset;
@end

@implementation HMBLocalZoneQueryResultParentModelID

- (void).cxx_destruct
{
}

- (NSUUID)parentModelID
{
  return self->_parentModelID;
}

- (int)parentModelIDOffset
{
  return self->_parentModelIDOffset;
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v7 = [(HMBLocalZoneQueryResult *)self zoneRowBindOffset];
  v8 = [(HMBLocalZoneQueryResult *)self localZone];
  hmbBindIntSQLite3(a3, v7, [v8 zoneRow], a4);

  int v9 = [(HMBLocalZoneQueryResultParentModelID *)self parentModelIDOffset];
  v10 = [(HMBLocalZoneQueryResultParentModelID *)self parentModelID];
  hmbBindUUIDSQLite3(a3, v9, v10, a4);

  return 1;
}

- (HMBLocalZoneQueryResultParentModelID)initWithLocalZone:(id)a3 parentModelID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3968;
  v23 = __Block_byref_object_dispose__3969;
  id v24 = 0;
  v8 = [v6 sql];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__HMBLocalZoneQueryResultParentModelID_initWithLocalZone_parentModelID___block_invoke;
  v18[3] = &unk_1E69EACB8;
  v18[4] = &v19;
  id v9 = (id)[v8 sqlBlockWithActivity:0 block:v18];

  uint64_t v10 = v20[5];
  unint64_t v11 = +[HMBSQLQueryIterator maximumRowsPerSelect];
  v17.receiver = self;
  v17.super_class = (Class)HMBLocalZoneQueryResultParentModelID;
  v12 = [(HMBLocalZoneQueryResult *)&v17 initWithLocalZone:v6 statement:v10 initialSequence:&unk_1F2C4CA50 arguments:MEMORY[0x1E4F1CC08] maximumRowsPerSelect:v11];
  v13 = v12;
  if (!v12) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v12->_parentModelID, a4);
  v14 = [(id)v20[5] arguments];
  v15 = objc_msgSend(v14, "hmf_numberForKey:", @"_parent_uuid");

  if (v15)
  {
    v13->_parentModelIDOffset = [v15 intValue];

LABEL_4:
    _Block_object_dispose(&v19, 8);

    return v13;
  }
  result = (HMBLocalZoneQueryResultParentModelID *)_HMFPreconditionFailure();
  __break(1u);
  return result;
}

uint64_t __72__HMBLocalZoneQueryResultParentModelID_initWithLocalZone_parentModelID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectAllRecordParentModelIDRows];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

@end