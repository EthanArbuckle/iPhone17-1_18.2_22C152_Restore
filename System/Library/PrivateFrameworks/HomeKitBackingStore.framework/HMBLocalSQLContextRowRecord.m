@interface HMBLocalSQLContextRowRecord
- (HMBLocalSQLContextRowRecord)initWithRecordRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 modelID:(id)a6 modelEncoding:(unint64_t)a7 modelData:(id)a8 modelSchema:(id)a9 modelType:(id)a10 pushEncoding:(unint64_t)a11 pushData:(id)a12 pushBlockRow:(id)a13;
- (HMBLocalSQLContextRowRecord)initWithStatement:(sqlite3_stmt *)a3 returning:(unint64_t)a4;
- (NSData)externalData;
- (NSData)externalID;
- (NSData)modelData;
- (NSData)pushData;
- (NSNumber)pushBlockRow;
- (NSString)modelType;
- (NSUUID)modelID;
- (NSUUID)modelSchema;
- (id)attributeDescriptions;
- (unint64_t)modelEncoding;
- (unint64_t)pushEncoding;
- (unint64_t)recordRow;
@end

@implementation HMBLocalSQLContextRowRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_pushBlockRow, 0);
  objc_storeStrong((id *)&self->_pushData, 0);
  objc_storeStrong((id *)&self->_modelSchema, 0);
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_externalData, 0);
}

- (NSString)modelType
{
  return self->_modelType;
}

- (NSNumber)pushBlockRow
{
  return self->_pushBlockRow;
}

- (NSData)pushData
{
  return self->_pushData;
}

- (unint64_t)pushEncoding
{
  return self->_pushEncoding;
}

- (NSUUID)modelSchema
{
  return self->_modelSchema;
}

- (NSData)modelData
{
  return self->_modelData;
}

- (unint64_t)modelEncoding
{
  return self->_modelEncoding;
}

- (NSUUID)modelID
{
  return self->_modelID;
}

- (NSData)externalID
{
  return self->_externalID;
}

- (NSData)externalData
{
  return self->_externalData;
}

- (unint64_t)recordRow
{
  return self->_recordRow;
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowRecord recordRow](self, "recordRow"));
  v6 = (void *)[v4 initWithName:@"Record Row" value:v5];
  [v3 addObject:v6];

  v7 = [(HMBLocalSQLContextRowRecord *)self externalID];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
    v9 = [(HMBLocalSQLContextRowRecord *)self externalID];
    v10 = [v9 hmbDescription];
    v11 = (void *)[v8 initWithName:@"External ID" value:v10];
    [v3 addObject:v11];
  }
  v12 = [(HMBLocalSQLContextRowRecord *)self externalData];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
    v14 = [(HMBLocalSQLContextRowRecord *)self externalData];
    v15 = [v14 hmbDescription];
    v16 = (void *)[v13 initWithName:@"External Data" value:v15];
    [v3 addObject:v16];
  }
  id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
  v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowRecord modelEncoding](self, "modelEncoding"));
  v19 = (void *)[v17 initWithName:@"Model Encoding" value:v18];
  [v3 addObject:v19];

  v20 = [(HMBLocalSQLContextRowRecord *)self modelID];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
    v22 = [(HMBLocalSQLContextRowRecord *)self modelID];
    v23 = (void *)[v21 initWithName:@"Model ID" value:v22];
    [v3 addObject:v23];
  }
  v24 = [(HMBLocalSQLContextRowRecord *)self modelData];

  if (v24)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F653F8]);
    v26 = [(HMBLocalSQLContextRowRecord *)self modelData];
    v27 = [v26 hmbDescription];
    v28 = (void *)[v25 initWithName:@"Model Data" value:v27];
    [v3 addObject:v28];
  }
  v29 = [(HMBLocalSQLContextRowRecord *)self modelSchema];

  if (v29)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F653F8]);
    v31 = [(HMBLocalSQLContextRowRecord *)self modelSchema];
    v32 = [v31 UUIDString];
    v33 = (void *)[v30 initWithName:@"Model Schema" value:v32];
    [v3 addObject:v33];
  }
  v34 = [(HMBLocalSQLContextRowRecord *)self modelType];

  if (v34)
  {
    id v35 = objc_alloc(MEMORY[0x1E4F653F8]);
    v36 = [(HMBLocalSQLContextRowRecord *)self modelType];
    v37 = (void *)[v35 initWithName:@"Model Type" value:v36];
    [v3 addObject:v37];
  }
  id v38 = objc_alloc(MEMORY[0x1E4F653F8]);
  v39 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowRecord pushEncoding](self, "pushEncoding"));
  v40 = (void *)[v38 initWithName:@"Push Encoding" value:v39];
  [v3 addObject:v40];

  v41 = [(HMBLocalSQLContextRowRecord *)self pushData];

  if (v41)
  {
    id v42 = objc_alloc(MEMORY[0x1E4F653F8]);
    v43 = [(HMBLocalSQLContextRowRecord *)self pushData];
    v44 = [v43 hmbDescription];
    v45 = (void *)[v42 initWithName:@"Push Data" value:v44];
    [v3 addObject:v45];
  }
  v46 = [(HMBLocalSQLContextRowRecord *)self pushBlockRow];

  if (v46)
  {
    id v47 = objc_alloc(MEMORY[0x1E4F653F8]);
    v48 = [(HMBLocalSQLContextRowRecord *)self pushBlockRow];
    v49 = (void *)[v47 initWithName:@"Push Block Row" value:v48];
    [v3 addObject:v49];
  }
  v50 = (void *)[v3 copy];

  return v50;
}

- (HMBLocalSQLContextRowRecord)initWithStatement:(sqlite3_stmt *)a3 returning:(unint64_t)a4
{
  char v4 = a4;
  sqlite3_int64 v18 = sqlite3_column_int64(a3, 0);
  if (v4)
  {
    v7 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a3 column:1];
    v6 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a3 column:2];
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if ((v4 & 2) != 0)
  {
    sqlite3_int64 v8 = sqlite3_column_int64(a3, 3);
    v9 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a3 column:4];
    v10 = [MEMORY[0x1E4F29128] hmbUUIDWithSQLite3Column:a3 column:5];
    v11 = [NSString hmbStringWithSQLite3Column:a3 column:6];
    if ((v4 & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    sqlite3_int64 v12 = 0;
    id v13 = 0;
    v14 = 0;
    goto LABEL_9;
  }
  sqlite3_int64 v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  if ((v4 & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  sqlite3_int64 v12 = sqlite3_column_int64(a3, 7);
  id v13 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a3 column:8];
  v14 = [MEMORY[0x1E4F28ED0] hmbNumberWithSQLite3Column:a3 column:9];
LABEL_9:
  v15 = [MEMORY[0x1E4F29128] hmbUUIDWithSQLite3Column:a3 column:10];
  v16 = [(HMBLocalSQLContextRowRecord *)self initWithRecordRow:v18 externalID:v7 externalData:v6 modelID:v15 modelEncoding:v8 modelData:v9 modelSchema:v10 modelType:v11 pushEncoding:v12 pushData:v13 pushBlockRow:v14];

  return v16;
}

- (HMBLocalSQLContextRowRecord)initWithRecordRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 modelID:(id)a6 modelEncoding:(unint64_t)a7 modelData:(id)a8 modelSchema:(id)a9 modelType:(id)a10 pushEncoding:(unint64_t)a11 pushData:(id)a12 pushBlockRow:(id)a13
{
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v24 = a12;
  id v19 = a13;
  v31.receiver = self;
  v31.super_class = (Class)HMBLocalSQLContextRowRecord;
  v20 = [(HMBLocalSQLContextRowRecord *)&v31 init];
  id v21 = v20;
  if (v20)
  {
    v20->_recordRow = a3;
    objc_storeStrong((id *)&v20->_externalID, a4);
    objc_storeStrong((id *)&v21->_externalData, a5);
    objc_storeStrong((id *)&v21->_modelID, a6);
    v21->_modelEncoding = a7;
    objc_storeStrong((id *)&v21->_modelData, a8);
    objc_storeStrong((id *)&v21->_modelSchema, a9);
    objc_storeStrong((id *)&v21->_modelType, a10);
    v21->_pushEncoding = a11;
    objc_storeStrong((id *)&v21->_pushData, a12);
    objc_storeStrong((id *)&v21->_pushBlockRow, a13);
  }

  return v21;
}

@end