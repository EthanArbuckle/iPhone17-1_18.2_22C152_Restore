@interface HMBLocalSQLIteratorRowRecord
- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (HMBLocalSQLIteratorRowRecord)initWithSQLContext:(id)a3 zoneRow:(unint64_t)a4 returning:(unint64_t)a5;
- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6;
- (int)zoneRowBindOffset;
- (unint64_t)returning;
- (unint64_t)zoneRow;
@end

@implementation HMBLocalSQLIteratorRowRecord

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
  v7 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a3 returning:[(HMBLocalSQLIteratorRowRecord *)self returning]];
  *a5 = [(HMBLocalSQLContextRowRecord *)v7 recordRow];
  return v7;
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  return 1;
}

- (HMBLocalSQLIteratorRowRecord)initWithSQLContext:(id)a3 zoneRow:(unint64_t)a4 returning:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5394;
  v21 = __Block_byref_object_dispose__5395;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__HMBLocalSQLIteratorRowRecord_initWithSQLContext_zoneRow_returning___block_invoke;
  v16[3] = &unk_1E69EACB8;
  v16[4] = &v17;
  id v9 = (id)[v8 sqlBlockWithActivity:0 block:v16];
  uint64_t v10 = v18[5];
  v15.receiver = self;
  v15.super_class = (Class)HMBLocalSQLIteratorRowRecord;
  v11 = [(HMBSQLQueryIterator *)&v15 initWithStatement:v10 initialSequence:&unk_1F2C4CAB0 maximumRowsPerSelect:+[HMBSQLQueryIterator maximumRowsPerSelect] error:0];
  if (!v11) {
    goto LABEL_4;
  }
  v12 = [(id)v18[5] arguments];
  v13 = objc_msgSend(v12, "hmf_numberForKey:", @"_store_id");

  if (v13)
  {
    v11->_zoneRowBindOffset = [v13 intValue];
    v11->_zoneRow = a4;
    v11->_returning = a5;

LABEL_4:
    _Block_object_dispose(&v17, 8);

    return v11;
  }
  result = (HMBLocalSQLIteratorRowRecord *)_HMFPreconditionFailure();
  __break(1u);
  return result;
}

uint64_t __69__HMBLocalSQLIteratorRowRecord_initWithSQLContext_zoneRow_returning___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectAllRecordRows];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

@end