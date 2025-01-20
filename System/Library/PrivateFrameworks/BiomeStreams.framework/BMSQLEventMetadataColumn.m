@interface BMSQLEventMetadataColumn
- (BMSQLEventMetadataColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 extractBlock:(id)a6 setValueBlock:(id)a7;
- (BOOL)setSQLiteValueFromRow:(id)a3 sqliteContext:(sqlite3_context *)a4 error:(id *)a5;
@end

@implementation BMSQLEventMetadataColumn

- (BMSQLEventMetadataColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 extractBlock:(id)a6 setValueBlock:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  v17.receiver = self;
  v17.super_class = (Class)BMSQLEventMetadataColumn;
  v13 = [(BMSQLColumn *)&v17 initWithName:a3 dataType:a4 requestOnly:v8 extractBlock:a6];
  if (v13)
  {
    v14 = _Block_copy(v12);
    id setValueBlock = v13->_setValueBlock;
    v13->_id setValueBlock = v14;
  }
  return v13;
}

- (BOOL)setSQLiteValueFromRow:(id)a3 sqliteContext:(sqlite3_context *)a4 error:(id *)a5
{
  return *a5 == 0;
}

- (void).cxx_destruct
{
}

@end