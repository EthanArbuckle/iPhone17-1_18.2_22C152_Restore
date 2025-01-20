@interface HMBLocalSQLIteratorRowBlock
- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (BOOL)isAscending;
- (HMBLocalSQLIteratorRowBlock)initWithSQLContext:(id)a3 zoneRow:(unint64_t)a4 statement:(id)a5 isAscending:(BOOL)a6;
- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6;
- (int)zoneRowBindOffset;
- (unint64_t)zoneRow;
@end

@implementation HMBLocalSQLIteratorRowBlock

- (BOOL)isAscending
{
  return self->_ascending;
}

- (int)zoneRowBindOffset
{
  return self->_zoneRowBindOffset;
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  v9 = [HMBLocalSQLContextRowBlock alloc];
  sqlite3_int64 v10 = sqlite3_column_int64(a3, 0);
  sqlite3_int64 v11 = sqlite3_column_int64(a3, 1);
  v12 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a3 column:2];
  v13 = [(HMBLocalSQLContextRowBlock *)v9 initWithBlockRow:v10 type:v11 options:v12];

  LODWORD(v12) = [(HMBLocalSQLIteratorRowBlock *)self isAscending];
  *a5 = [(HMBLocalSQLContextRowBlock *)v13 blockRow] - (v12 ^ 1);
  return v13;
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  return 1;
}

- (HMBLocalSQLIteratorRowBlock)initWithSQLContext:(id)a3 zoneRow:(unint64_t)a4 statement:(id)a5 isAscending:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  v12 = &unk_1F2C4C9D8;
  if (v6) {
    v12 = &unk_1F2C4C9C0;
  }
  id v13 = v12;
  v22.receiver = self;
  v22.super_class = (Class)HMBLocalSQLIteratorRowBlock;
  v14 = [(HMBSQLQueryIterator *)&v22 initWithStatement:v11 initialSequence:v13 maximumRowsPerSelect:+[HMBSQLQueryIterator maximumRowsPerSelect] error:0];
  if (!v14) {
    goto LABEL_6;
  }
  v15 = [v11 arguments];
  v16 = objc_msgSend(v15, "hmf_numberForKey:", @"_store_id");

  if (v16)
  {
    v14->_zoneRowBindOffset = [v16 intValue];
    v14->_zoneRow = a4;
    v14->_ascending = v6;

LABEL_6:
    return v14;
  }
  v18 = (HMBLocalSQLIteratorRowInputBlock *)_HMFPreconditionFailure();
  return (HMBLocalSQLIteratorRowBlock *)[(HMBLocalSQLIteratorRowInputBlock *)v18 initWithSQLContext:v20 zoneRow:v21];
}

@end