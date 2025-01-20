@interface HMBLocalZoneQueryResultParentModelIDOfType
- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (HMBLocalZoneQueryResultParentModelIDOfType)initWithLocalZone:(id)a3 parentModelID:(id)a4 modelClassName:(id)a5;
- (NSString)modelClassName;
- (NSUUID)parentModelID;
- (int)modelClassNameOffset;
- (int)parentModelIDOffset;
@end

@implementation HMBLocalZoneQueryResultParentModelIDOfType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelClassName, 0);
  objc_storeStrong((id *)&self->_parentModelID, 0);
}

- (NSString)modelClassName
{
  return self->_modelClassName;
}

- (int)modelClassNameOffset
{
  return self->_modelClassNameOffset;
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

  int v9 = [(HMBLocalZoneQueryResultParentModelIDOfType *)self parentModelIDOffset];
  v10 = [(HMBLocalZoneQueryResultParentModelIDOfType *)self parentModelID];
  hmbBindUUIDSQLite3(a3, v9, v10, a4);

  int v11 = [(HMBLocalZoneQueryResultParentModelIDOfType *)self modelClassNameOffset];
  v12 = [(HMBLocalZoneQueryResultParentModelIDOfType *)self modelClassName];
  hmbBindStringSQLite3(a3, v11, v12, a4);

  return 1;
}

- (HMBLocalZoneQueryResultParentModelIDOfType)initWithLocalZone:(id)a3 parentModelID:(id)a4 modelClassName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3968;
  v31 = __Block_byref_object_dispose__3969;
  id v32 = 0;
  int v11 = [v8 sql];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __93__HMBLocalZoneQueryResultParentModelIDOfType_initWithLocalZone_parentModelID_modelClassName___block_invoke;
  v26[3] = &unk_1E69EACB8;
  v26[4] = &v27;
  id v12 = (id)[v11 sqlBlockWithActivity:0 block:v26];

  uint64_t v13 = v28[5];
  unint64_t v14 = +[HMBSQLQueryIterator maximumRowsPerSelect];
  v25.receiver = self;
  v25.super_class = (Class)HMBLocalZoneQueryResultParentModelIDOfType;
  v15 = [(HMBLocalZoneQueryResult *)&v25 initWithLocalZone:v8 statement:v13 initialSequence:&unk_1F2C4CA50 arguments:MEMORY[0x1E4F1CC08] maximumRowsPerSelect:v14];
  if (!v15) {
    goto LABEL_5;
  }
  uint64_t v16 = [v9 copy];
  parentModelID = v15->_parentModelID;
  v15->_parentModelID = (NSUUID *)v16;

  v18 = [(id)v28[5] arguments];
  v19 = objc_msgSend(v18, "hmf_numberForKey:", @"_parent_uuid");

  if (v19)
  {
    v15->_parentModelIDOffset = [v19 intValue];
    uint64_t v20 = [v10 copy];
    modelClassName = v15->_modelClassName;
    v15->_modelClassName = (NSString *)v20;

    v22 = [(id)v28[5] arguments];
    v23 = objc_msgSend(v22, "hmf_numberForKey:", @"_type");

    if (v23)
    {
      v15->_modelClassNameOffset = [v23 intValue];

LABEL_5:
      _Block_object_dispose(&v27, 8);

      return v15;
    }
  }
  result = (HMBLocalZoneQueryResultParentModelIDOfType *)_HMFPreconditionFailure();
  __break(1u);
  return result;
}

uint64_t __93__HMBLocalZoneQueryResultParentModelIDOfType_initWithLocalZone_parentModelID_modelClassName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectAllRecordParentModelIDTypeRows];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

@end