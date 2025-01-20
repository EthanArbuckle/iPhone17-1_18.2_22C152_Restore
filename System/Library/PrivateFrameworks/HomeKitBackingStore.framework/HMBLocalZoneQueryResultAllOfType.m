@interface HMBLocalZoneQueryResultAllOfType
- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (HMBLocalZoneQueryResultAllOfType)initWithLocalZone:(id)a3 modelClassName:(id)a4;
- (NSString)modelClassName;
- (int)modelClassNameOffset;
@end

@implementation HMBLocalZoneQueryResultAllOfType

- (void).cxx_destruct
{
}

- (NSString)modelClassName
{
  return self->_modelClassName;
}

- (int)modelClassNameOffset
{
  return self->_modelClassNameOffset;
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v7 = [(HMBLocalZoneQueryResult *)self zoneRowBindOffset];
  v8 = [(HMBLocalZoneQueryResult *)self localZone];
  hmbBindIntSQLite3(a3, v7, [v8 zoneRow], a4);

  int v9 = [(HMBLocalZoneQueryResultAllOfType *)self modelClassNameOffset];
  v10 = [(HMBLocalZoneQueryResultAllOfType *)self modelClassName];
  hmbBindStringSQLite3(a3, v9, v10, a4);

  return 1;
}

- (HMBLocalZoneQueryResultAllOfType)initWithLocalZone:(id)a3 modelClassName:(id)a4
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
  v18[2] = __69__HMBLocalZoneQueryResultAllOfType_initWithLocalZone_modelClassName___block_invoke;
  v18[3] = &unk_1E69EACB8;
  v18[4] = &v19;
  id v9 = (id)[v8 sqlBlockWithActivity:0 block:v18];

  uint64_t v10 = v20[5];
  unint64_t v11 = +[HMBSQLQueryIterator maximumRowsPerSelect];
  v17.receiver = self;
  v17.super_class = (Class)HMBLocalZoneQueryResultAllOfType;
  v12 = [(HMBLocalZoneQueryResult *)&v17 initWithLocalZone:v6 statement:v10 initialSequence:&unk_1F2C4CA50 arguments:MEMORY[0x1E4F1CC08] maximumRowsPerSelect:v11];
  v13 = v12;
  if (!v12) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v12->_modelClassName, a4);
  v14 = [(id)v20[5] arguments];
  v15 = objc_msgSend(v14, "hmf_numberForKey:", @"_model_type");

  if (v15)
  {
    v13->_modelClassNameOffset = [v15 intValue];

LABEL_4:
    _Block_object_dispose(&v19, 8);

    return v13;
  }
  result = (HMBLocalZoneQueryResultAllOfType *)_HMFPreconditionFailure();
  __break(1u);
  return result;
}

uint64_t __69__HMBLocalZoneQueryResultAllOfType_initWithLocalZone_modelClassName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectAllRecordTypeRows];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

@end