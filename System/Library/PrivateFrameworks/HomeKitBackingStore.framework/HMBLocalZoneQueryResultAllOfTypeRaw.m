@interface HMBLocalZoneQueryResultAllOfTypeRaw
- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (HMBLocalZoneQueryResultAllOfTypeRaw)initWithLocalZone:(id)a3 zoneRow:(unint64_t)a4 modelType:(id)a5 returning:(unint64_t)a6;
- (NSString)modelType;
- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6;
- (int)modelTypeBindOffset;
- (int)zoneRowBindOffset;
- (unint64_t)returning;
- (unint64_t)zoneRow;
@end

@implementation HMBLocalZoneQueryResultAllOfTypeRaw

- (void).cxx_destruct
{
}

- (int)modelTypeBindOffset
{
  return self->_modelTypeBindOffset;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (int)zoneRowBindOffset
{
  return self->_zoneRowBindOffset;
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (unint64_t)returning
{
  return self->_returning;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  v7 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a3 returning:[(HMBLocalZoneQueryResultAllOfTypeRaw *)self returning]];
  *a5 = [(HMBLocalSQLContextRowRecord *)v7 recordRow];
  return v7;
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  hmbBindIntSQLite3(a3, [(HMBLocalZoneQueryResultAllOfTypeRaw *)self zoneRowBindOffset], [(HMBLocalZoneQueryResultAllOfTypeRaw *)self zoneRow], a4);
  int v7 = [(HMBLocalZoneQueryResultAllOfTypeRaw *)self modelTypeBindOffset];
  v8 = [(HMBLocalZoneQueryResultAllOfTypeRaw *)self modelType];
  hmbBindStringSQLite3(a3, v7, v8, a4);

  return 1;
}

- (HMBLocalZoneQueryResultAllOfTypeRaw)initWithLocalZone:(id)a3 zoneRow:(unint64_t)a4 modelType:(id)a5 returning:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1707;
  v27 = __Block_byref_object_dispose__1708;
  id v28 = 0;
  v12 = [v10 sql];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__HMBLocalZoneQueryResultAllOfTypeRaw_initWithLocalZone_zoneRow_modelType_returning___block_invoke;
  v22[3] = &unk_1E69EACB8;
  v22[4] = &v23;
  id v13 = (id)[v12 sqlBlockWithActivity:0 block:v22];

  uint64_t v14 = v24[5];
  v21.receiver = self;
  v21.super_class = (Class)HMBLocalZoneQueryResultAllOfTypeRaw;
  v15 = [(HMBSQLQueryIterator *)&v21 initWithStatement:v14 initialSequence:&unk_1F2C4C9F0 maximumRowsPerSelect:+[HMBSQLQueryIterator maximumRowsPerSelect] error:0];
  if (!v15) {
    goto LABEL_5;
  }
  v16 = [(id)v24[5] arguments];
  v17 = objc_msgSend(v16, "hmf_numberForKey:", @"_store_id");

  if (v17)
  {
    v18 = [(id)v24[5] arguments];
    v19 = objc_msgSend(v18, "hmf_numberForKey:", @"_model_type");

    if (v19)
    {
      v15->_zoneRowBindOffset = [v17 intValue];
      v15->_modelTypeBindOffset = [v19 intValue];
      objc_storeStrong((id *)&v15->_modelType, a5);
      v15->_zoneRow = a4;
      v15->_returning = a6;

LABEL_5:
      _Block_object_dispose(&v23, 8);

      return v15;
    }
  }
  result = (HMBLocalZoneQueryResultAllOfTypeRaw *)_HMFPreconditionFailure();
  __break(1u);
  return result;
}

uint64_t __85__HMBLocalZoneQueryResultAllOfTypeRaw_initWithLocalZone_zoneRow_modelType_returning___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectAllRecordTypeRows];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

@end