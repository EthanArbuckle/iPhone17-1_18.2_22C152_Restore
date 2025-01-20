@interface BMSQLJSONColumn
- (BMSQLJSONColumn)initWithName:(id)a3 requestOnly:(BOOL)a4 extractBlock:(id)a5;
- (BOOL)setSQLiteValueFromRow:(id)a3 sqliteContext:(sqlite3_context *)a4 error:(id *)a5;
@end

@implementation BMSQLJSONColumn

- (BMSQLJSONColumn)initWithName:(id)a3 requestOnly:(BOOL)a4 extractBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMSQLJSONColumn;
  v9 = [(BMSQLColumn *)&v13 initWithName:a3 dataType:5 requestOnly:v5 extractBlock:v8];
  if (v9)
  {
    v10 = _Block_copy(v8);
    id jsonExtractBlock = v9->_jsonExtractBlock;
    v9->_id jsonExtractBlock = v10;
  }
  return v9;
}

- (BOOL)setSQLiteValueFromRow:(id)a3 sqliteContext:(sqlite3_context *)a4 error:(id *)a5
{
  v6 = (*((void (**)(void))self->_jsonExtractBlock + 2))();
  v7 = v6;
  if (v6) {
    sqlite3_result_text(a4, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    sqlite3_result_null(a4);
  }

  return 1;
}

- (void).cxx_destruct
{
}

@end