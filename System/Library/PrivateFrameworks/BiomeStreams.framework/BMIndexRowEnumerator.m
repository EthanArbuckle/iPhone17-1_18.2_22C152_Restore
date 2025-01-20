@interface BMIndexRowEnumerator
- (BMIndexRowEnumerator)initWithDatabase:(sqlite3 *)a3 statement:(sqlite3_stmt *)a4 index:(id)a5;
- (id)allRows;
- (id)error;
- (id)next;
- (id)nextBookmark;
- (void)dealloc;
@end

@implementation BMIndexRowEnumerator

- (BMIndexRowEnumerator)initWithDatabase:(sqlite3 *)a3 statement:(sqlite3_stmt *)a4 index:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMIndexRowEnumerator;
  v10 = [(BMIndexRowEnumerator *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_db = a3;
    v10->_stmt = a4;
    objc_storeStrong((id *)&v10->_index, a5);
  }

  return v11;
}

- (id)next
{
  uint64_t v4 = sqlite3_step(self->_stmt);
  if (v4 == 101)
  {
    v25 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    if (v4 == 100)
    {
      uint64_t v6 = sqlite3_column_count(self->_stmt);
      int v33 = v6 - 5;
      if ((int)v6 <= 5)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BMIndexRow.m", 76, @"Invalid column count: %d", v6);
      }
      id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(int)v6];
      if ((int)v6 >= 1)
      {
        int v8 = 0;
        do
        {
          uint64_t v9 = sqlite3_column_type(self->_stmt, v8);
          switch((int)v9)
          {
            case 1:
              uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(self->_stmt, v8));
              goto LABEL_14;
            case 2:
              uint64_t v10 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(self->_stmt, v8));
              goto LABEL_14;
            case 3:
              uint64_t v10 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(self->_stmt, v8));
              goto LABEL_14;
            case 4:
              v14 = sqlite3_column_blob(self->_stmt, v8);
              uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", v14, sqlite3_column_bytes(self->_stmt, v8));
              goto LABEL_14;
            case 5:
              uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
LABEL_14:
              objc_super v13 = (void *)v10;
              break;
            default:
              uint64_t v11 = v9;
              v12 = [MEMORY[0x1E4F28B00] currentHandler];
              objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BMIndexRow.m", 96, @"Invalid sqlite type: %d", v11);

              objc_super v13 = 0;
              break;
          }
          [v7 addObject:v13];

          ++v8;
        }
        while (v6 != v8);
      }
      error = objc_msgSend(v7, "subarrayWithRange:", 0, v33);
      v16 = objc_msgSend(v7, "subarrayWithRange:", v33, 4);
      id v17 = objc_alloc(MEMORY[0x1E4F50270]);
      v18 = [v16 objectAtIndexedSubscript:0];
      v19 = [v16 objectAtIndexedSubscript:1];
      v20 = [v16 objectAtIndexedSubscript:2];
      [v20 doubleValue];
      double v22 = v21;
      v23 = [v16 objectAtIndexedSubscript:3];
      v24 = objc_msgSend(v17, "initWithStream:segment:iterationStartTime:offset:", v18, v19, objc_msgSend(v23, "unsignedIntValue"), v22);

      v25 = [[BMIndexRow alloc] initWithIndexFields:error storeBookmark:v24];
    }
    else
    {
      v26 = NSString;
      v27 = [(BMIndex *)self->_index name];
      v28 = [v26 stringWithFormat:@"Error stepping index search result on %@", v27];

      db = self->_db;
      id v7 = v28;
      BMSQLDatabaseError(v5, db, (const char *)[v7 UTF8String]);
      v30 = (NSError *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      error = self->_error;
      self->_error = v30;
    }
  }

  return v25;
}

- (id)allRows
{
  v3 = objc_opt_new();
  uint64_t v4 = [(BMIndexRowEnumerator *)self next];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    do
    {
      [v3 addObject:v5];

      uint64_t v5 = [(BMIndexRowEnumerator *)self next];
    }
    while (v5);
  }

  return v3;
}

- (id)nextBookmark
{
  v2 = [(BMIndexRowEnumerator *)self next];
  v3 = [v2 storeBookmark];

  return v3;
}

- (id)error
{
  return self->_error;
}

- (void)dealloc
{
  sqlite3_finalize(self->_stmt);
  v3.receiver = self;
  v3.super_class = (Class)BMIndexRowEnumerator;
  [(BMIndexRowEnumerator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_index, 0);
}

@end