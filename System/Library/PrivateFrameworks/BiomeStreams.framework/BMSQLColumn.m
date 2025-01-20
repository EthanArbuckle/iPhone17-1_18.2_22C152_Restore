@interface BMSQLColumn
- (BMSQLColumn)initWithName:(id)a3 dataType:(int64_t)a4;
- (BMSQLColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 extractBlock:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)requestOnly;
- (BOOL)setSQLiteValueFromRow:(id)a3 sqliteContext:(sqlite3_context *)a4 error:(id *)a5;
- (NSString)name;
- (id)description;
- (id)extractBlock;
- (int64_t)dataType;
- (unint64_t)hash;
@end

@implementation BMSQLColumn

- (NSString)name
{
  return self->_name;
}

- (id)extractBlock
{
  return self->_extractBlock;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extractBlock, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BMSQLColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 extractBlock:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMSQLColumn;
  v13 = [(BMSQLColumn *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_dataType = a4;
    v14->_requestOnly = a5;
    v15 = _Block_copy(v12);
    id extractBlock = v14->_extractBlock;
    v14->_id extractBlock = v15;
  }
  return v14;
}

- (BMSQLColumn)initWithName:(id)a3 dataType:(int64_t)a4
{
  return [(BMSQLColumn *)self initWithName:a3 dataType:a4 requestOnly:0 extractBlock:&__block_literal_global_117];
}

uint64_t __37__BMSQLColumn_initWithName_dataType___block_invoke()
{
  return 0;
}

- (BOOL)setSQLiteValueFromRow:(id)a3 sqliteContext:(sqlite3_context *)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(BMSQLColumn *)self extractBlock];
  v10 = ((void (**)(void, id, id *))v9)[2](v9, v8, a5);

  if (*a5) {
    goto LABEL_2;
  }
  if (!v10)
  {
    sqlite3_result_null(a4);
LABEL_14:
    BOOL v11 = 1;
    goto LABEL_15;
  }
  id v12 = v10;
  v13 = self;
  if ((unint64_t)[(BMSQLColumn *)v13 dataType] <= 6
    && (id v14 = objc_opt_class()) != 0)
  {
    id v15 = v14;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    v30[0] = *MEMORY[0x1E4F28568];
    v17 = NSString;
    objc_super v18 = [(BMSQLColumn *)v13 name];
    v19 = [v17 stringWithFormat:@"value for column (%@) is type %@ instead of expected type %@", v18, objc_opt_class(), v15];
    v29[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v30 count:1];
    v21 = v16;
    uint64_t v22 = 20;
  }
  else
  {
    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    v30[0] = *MEMORY[0x1E4F28568];
    v24 = NSString;
    uint64_t v25 = [(BMSQLColumn *)v13 dataType];
    objc_super v18 = [(BMSQLColumn *)v13 name];
    v19 = [v24 stringWithFormat:@"unknown data type (%ld) for column '%@'", v25, v18];
    v29[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v30 count:1];
    v21 = v23;
    uint64_t v22 = 1;
  }
  *a5 = (id)[v21 initWithDomain:@"BMSQLDatabaseErrorDomain" code:v22 userInfo:v20];

LABEL_10:
  if (!*a5)
  {
    switch([(BMSQLColumn *)v13 dataType])
    {
      case 0:
        sqlite3_result_int64(a4, [v12 longLongValue]);
        goto LABEL_14;
      case 1:
        [v12 doubleValue];
        goto LABEL_19;
      case 2:
      case 5:
        id v26 = v12;
        sqlite3_result_text(a4, (const char *)[v26 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        goto LABEL_21;
      case 3:
        [v12 timeIntervalSince1970];
LABEL_19:
        sqlite3_result_double(a4, v28);
        goto LABEL_14;
      case 4:
        id v26 = v12;
        sqlite3_result_blob(a4, (const void *)[v26 bytes], objc_msgSend(v26, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_21:

        break;
      case 6:
        v29[0] = 0;
        v29[1] = 0;
        [v12 getUUIDBytes:v29];
        sqlite3_result_blob(a4, v29, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        break;
      default:
        goto LABEL_14;
    }
    goto LABEL_14;
  }
LABEL_2:
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  name = self->_name;
  v6 = BMSQLDataTypeToString(self->_dataType);
  v7 = [NSNumber numberWithBool:self->_requestOnly];
  id v8 = (void *)[v3 initWithFormat:@"<%@ %p> name: %@, datatype: %@, request only: %@", v4, self, name, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  return self->_dataType ^ self->_requestOnly ^ [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMSQLColumn *)self name];
    v7 = [v5 name];
    if ([v6 isEqual:v7]
      && (int64_t dataType = self->_dataType, dataType == [v5 dataType]))
    {
      int requestOnly = self->_requestOnly;
      BOOL v10 = requestOnly == [v5 requestOnly];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)requestOnly
{
  return self->_requestOnly;
}

@end