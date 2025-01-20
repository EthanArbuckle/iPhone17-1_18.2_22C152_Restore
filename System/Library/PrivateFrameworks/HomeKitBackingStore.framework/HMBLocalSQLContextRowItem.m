@interface HMBLocalSQLContextRowItem
- (HMBLocalSQLContextRowItem)initWithItemRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 modelEncoding:(unint64_t)a6 modelData:(id)a7;
- (HMBLocalSQLContextRowItem)initWithStatement:(sqlite3_stmt *)a3 returning:(unint64_t)a4;
- (NSData)externalData;
- (NSData)externalID;
- (NSData)modelData;
- (id)description;
- (unint64_t)itemRow;
- (unint64_t)modelEncoding;
@end

@implementation HMBLocalSQLContextRowItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalData, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_modelData, 0);
}

- (NSData)externalData
{
  return self->_externalData;
}

- (NSData)externalID
{
  return self->_externalID;
}

- (unint64_t)modelEncoding
{
  return self->_modelEncoding;
}

- (NSData)modelData
{
  return self->_modelData;
}

- (unint64_t)itemRow
{
  return self->_itemRow;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(HMBLocalSQLContextRowItem *)self itemRow];
  v5 = [(HMBLocalSQLContextRowItem *)self externalID];
  v6 = [v5 hmbDescription];
  v7 = [(HMBLocalSQLContextRowItem *)self externalData];
  v8 = [v7 hmbDescription];
  unint64_t v9 = [(HMBLocalSQLContextRowItem *)self modelEncoding];
  v10 = [(HMBLocalSQLContextRowItem *)self modelData];
  v11 = [v10 hmbDescription];
  v12 = [v3 stringWithFormat:@"<RowItem: %lu  eid: %@  ed: %@  encoding: %lu data: %@>", v4, v6, v8, v9, v11];

  return v12;
}

- (HMBLocalSQLContextRowItem)initWithStatement:(sqlite3_stmt *)a3 returning:(unint64_t)a4
{
  char v4 = a4;
  sqlite3_int64 v7 = sqlite3_column_int64(a3, 0);
  if (v4)
  {
    unint64_t v9 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a3 column:1];
    v8 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a3 column:2];
    if ((v4 & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    sqlite3_int64 v10 = 0;
    v11 = 0;
    goto LABEL_6;
  }
  v8 = 0;
  unint64_t v9 = 0;
  if ((v4 & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  sqlite3_int64 v10 = sqlite3_column_int64(a3, 3);
  v11 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a3 column:4];
LABEL_6:
  v12 = [(HMBLocalSQLContextRowItem *)self initWithItemRow:v7 externalID:v9 externalData:v8 modelEncoding:v10 modelData:v11];

  return v12;
}

- (HMBLocalSQLContextRowItem)initWithItemRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 modelEncoding:(unint64_t)a6 modelData:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HMBLocalSQLContextRowItem;
  v16 = [(HMBLocalSQLContextRowItem *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_itemRow = a3;
    objc_storeStrong((id *)&v16->_modelData, a7);
    v17->_modelEncoding = a6;
    objc_storeStrong((id *)&v17->_externalID, a4);
    objc_storeStrong((id *)&v17->_externalData, a5);
  }

  return v17;
}

@end