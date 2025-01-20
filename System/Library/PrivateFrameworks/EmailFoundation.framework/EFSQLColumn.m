@interface EFSQLColumn
- (BOOL)BOOLValue;
- (EFSQLColumn)initWithPreparedStatement:(id)a3 index:(int64_t)a4;
- (EFSQLColumn)initWithSQLiteStatement:(sqlite3_stmt *)a3 index:(int64_t)a4;
- (NSData)dataValue;
- (NSDate)dateValue;
- (NSNumber)numberValue;
- (NSString)name;
- (NSString)stringValue;
- (double)doubleValue;
- (id)debugDescription;
- (id)objectValue;
- (int64_t)index;
- (int64_t)int64Value;
- (int64_t)integerValue;
- (sqlite3_stmt)statement;
@end

@implementation EFSQLColumn

- (int64_t)int64Value
{
  int v3 = sqlite3_column_type(self->_statement, self->_index);
  if (v3 == 1)
  {
    statement = self->_statement;
    int index = self->_index;
    return sqlite3_column_int64(statement, index);
  }
  else
  {
    if (v3 != 5)
    {
      if ((v3 - 2) > 2) {
        v7 = @"UNKNOWN";
      }
      else {
        v7 = off_1E61230B8[v3 - 2];
      }
      id v8 = (id) [[NSString alloc] initWithFormat:@"Expected %@, got %@", @"SQLITE_INTEGER", v7];
      qword_1E9D92540 = [v8 UTF8String];
      uint64_t v9 = [[NSString alloc] initWithFormat:@"Type mismatch -- %@", v8];
      id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v9 userInfo:0];
      objc_exception_throw(v10);
    }
    return 0;
  }
}

- (NSString)name
{
  v2 = (void *)sqlite3_column_name(self->_statement, self->_index);
  if (v2)
  {
    v2 = [NSString stringWithUTF8String:v2];
  }
  return (NSString *)v2;
}

- (EFSQLColumn)initWithSQLiteStatement:(sqlite3_stmt *)a3 index:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EFSQLColumn;
  result = [(EFSQLColumn *)&v7 init];
  if (result)
  {
    result->_int index = a4;
    result->_statement = a3;
  }
  return result;
}

- (NSString)stringValue
{
  if (sqlite3_column_type(self->_statement, self->_index) == 5)
  {
    int v3 = 0;
  }
  else
  {
    statement = self->_statement;
    int index = self->_index;
    int v3 = (unsigned __int8 *)sqlite3_column_text(statement, index);
    if (v3) {
      int v3 = (unsigned __int8 *)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", v3, sqlite3_column_bytes(statement, index), 4);
    }
  }
  return (NSString *)v3;
}

- (BOOL)BOOLValue
{
  int v3 = sqlite3_column_type(self->_statement, self->_index);
  if (v3 == 1) {
    return sqlite3_column_int(self->_statement, self->_index) != 0;
  }
  if (v3 != 5)
  {
    if ((v3 - 2) > 2) {
      v5 = @"UNKNOWN";
    }
    else {
      v5 = off_1E61230B8[v3 - 2];
    }
    id v6 = (id) [[NSString alloc] initWithFormat:@"Expected %@, got %@", @"SQLITE_INTEGER", v5];
    qword_1E9D92540 = [v6 UTF8String];
    uint64_t v7 = [[NSString alloc] initWithFormat:@"Type mismatch -- %@", v6];
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v7 userInfo:0];
    objc_exception_throw(v8);
  }
  return 0;
}

- (NSNumber)numberValue
{
  v2 = [(EFSQLColumn *)self objectValue];
  int v3 = (objc_class *)objc_opt_class();
  id v4 = v2;
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = NSStringFromClass(v3);
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = v6;
    id v10 = v8;
    id v11 = (id) [[NSString alloc] initWithFormat:@"Expected %@, got %@", v9, v10];
    qword_1E9D92540 = [v11 UTF8String];
    uint64_t v12 = [[NSString alloc] initWithFormat:@"Type mismatch -- %@", v11];
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v12 userInfo:0];
    objc_exception_throw(v13);
  }

  return (NSNumber *)v4;
}

- (id)objectValue
{
  statement = self->_statement;
  int index = self->_index;
  switch(sqlite3_column_type(statement, index))
  {
    case 1:
      id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(statement, index));
      break;
    case 2:
      id v4 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(statement, index));
      break;
    case 3:
      id v5 = [NSString alloc];
      id v6 = sqlite3_column_text(statement, index);
      id v4 = objc_msgSend(v5, "initWithBytes:length:encoding:", v6, sqlite3_column_bytes(statement, index), 4);
      break;
    case 4:
      uint64_t v7 = (void *)MEMORY[0x1E4F1C9B8];
      id v8 = sqlite3_column_blob(statement, index);
      int v9 = sqlite3_column_bytes(statement, index);
      id v4 = [v7 dataWithBytes:v8 length:v9 & ~(v9 >> 31)];
      break;
    default:
      id v4 = 0;
      break;
  }
  return v4;
}

- (NSDate)dateValue
{
  int v3 = sqlite3_column_type(self->_statement, self->_index);
  if ((v3 - 1) >= 2)
  {
    if (v3 != 5)
    {
      id v6 = @"UNKNOWN";
      if (v3 == 4) {
        id v6 = @"SQLITE_BLOB";
      }
      if (v3 == 3) {
        id v6 = @"SQLITE_TEXT";
      }
      uint64_t v7 = v6;
      id v8 = (id) [[NSString alloc] initWithFormat:@"Expected %@, got %@", @"SQLITE_INTEGER", v7];
      qword_1E9D92540 = [v8 UTF8String];
      uint64_t v9 = [[NSString alloc] initWithFormat:@"Type mismatch -- %@", v8];
      id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v9 userInfo:0];
      objc_exception_throw(v10);
    }
    id v4 = 0;
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(self->_statement, self->_index));
  }
  return (NSDate *)v4;
}

- (int64_t)integerValue
{
  int v3 = sqlite3_column_type(self->_statement, self->_index);
  if (v3 == 1) {
    return sqlite3_column_int(self->_statement, self->_index);
  }
  if (v3 != 5)
  {
    if ((v3 - 2) > 2) {
      id v5 = @"UNKNOWN";
    }
    else {
      id v5 = off_1E61230B8[v3 - 2];
    }
    id v6 = (id) [[NSString alloc] initWithFormat:@"Expected %@, got %@", @"SQLITE_INTEGER", v5];
    qword_1E9D92540 = [v6 UTF8String];
    uint64_t v7 = [[NSString alloc] initWithFormat:@"Type mismatch -- %@", v6];
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v7 userInfo:0];
    objc_exception_throw(v8);
  }
  return 0;
}

- (NSData)dataValue
{
  if (sqlite3_column_type(self->_statement, self->_index) == 5)
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(EFSQLColumn *)self objectValue];
    id v5 = (objc_class *)objc_opt_class();
    id v3 = v4;
    if (v3 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = NSStringFromClass(v5);
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      id v10 = v7;
      id v11 = v9;
      id v12 = (id) [[NSString alloc] initWithFormat:@"Expected %@, got %@", v10, v11];
      qword_1E9D92540 = [v12 UTF8String];
      uint64_t v13 = [[NSString alloc] initWithFormat:@"Type mismatch -- %@", v12];
      id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v13 userInfo:0];
      objc_exception_throw(v14);
    }
  }
  return (NSData *)v3;
}

- (EFSQLColumn)initWithPreparedStatement:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = -[EFSQLColumn initWithSQLiteStatement:index:](self, "initWithSQLiteStatement:index:", [v6 compiled], a4);

  return v7;
}

- (double)doubleValue
{
  int v3 = sqlite3_column_type(self->_statement, self->_index);
  if (v3 == 2)
  {
    statement = self->_statement;
    int index = self->_index;
    return sqlite3_column_double(statement, index);
  }
  else
  {
    if (v3 != 5)
    {
      if ((v3 - 1) > 3) {
        uint64_t v7 = @"UNKNOWN";
      }
      else {
        uint64_t v7 = off_1E61230D0[v3 - 1];
      }
      id v8 = (id) [[NSString alloc] initWithFormat:@"Expected %@, got %@", @"SQLITE_FLOAT", v7];
      qword_1E9D92540 = [v8 UTF8String];
      uint64_t v9 = [[NSString alloc] initWithFormat:@"Type mismatch -- %@", v8];
      id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v9 userInfo:0];
      objc_exception_throw(v10);
    }
    return 0.0;
  }
}

- (id)debugDescription
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(EFSQLColumn *)self index];
  id v6 = [(EFSQLColumn *)self name];
  uint64_t v7 = [(EFSQLColumn *)self objectValue];
  id v8 = [v3 stringWithFormat:@"<%@: %p index=%ld name=%@ value=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (int64_t)index
{
  return self->_index;
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

@end