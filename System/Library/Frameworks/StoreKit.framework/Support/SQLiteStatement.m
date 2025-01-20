@interface SQLiteStatement
- (BOOL)isReadOnly;
- (NSDictionary)columnIndexByName;
- (NSString)SQL;
- (SQLiteConnection)connection;
- (SQLiteStatement)initWithStatement:(sqlite3_stmt *)a3 onConnection:(id)a4;
- (int)clearBindings;
- (int)finalizeStatement;
- (int)reset;
- (int)step;
- (sqlite3_stmt)sqlite3_stmt;
- (void)bindArray:(id)a3 atPosition:(int)a4;
- (void)bindData:(id)a3 atPosition:(int)a4;
- (void)bindDataCopy:(id)a3 atPosition:(int)a4;
- (void)bindDate:(id)a3 atPosition:(int)a4;
- (void)bindDictionary:(id)a3 atPosition:(int)a4;
- (void)bindDouble:(double)a3 atPosition:(int)a4;
- (void)bindFloat:(float)a3 atPosition:(int)a4;
- (void)bindInt64:(int64_t)a3 atPosition:(int)a4;
- (void)bindInt:(int)a3 atPosition:(int)a4;
- (void)bindNullAtPosition:(int)a3;
- (void)bindNumber:(id)a3 atPosition:(int)a4;
- (void)bindString:(id)a3 atPosition:(int)a4;
- (void)bindStringCopy:(id)a3 atPosition:(int)a4;
- (void)bindURL:(id)a3 atPosition:(int)a4;
- (void)bindUUID:(id)a3 atPosition:(int)a4;
@end

@implementation SQLiteStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongSelf, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
  CFNumberRef v6 = (const __CFNumber *)a3;
  CFNumberRef v10 = v6;
  if (self->_statement)
  {
    CFNumberType Type = CFNumberGetType(v6);
    if ((unint64_t)Type > kCFNumberCGFloatType) {
      goto LABEL_8;
    }
    if (((1 << Type) & 0x38E) != 0)
    {
      sqlite3_bind_int(self->_statement, a4, (int)[(__CFNumber *)v10 intValue]);
      goto LABEL_9;
    }
    if (((1 << Type) & 0x10060) != 0)
    {
      statement = self->_statement;
      [(__CFNumber *)v10 doubleValue];
      sqlite3_bind_double(statement, a4, v9);
    }
    else
    {
LABEL_8:
      sqlite3_bind_int64(self->_statement, a4, (sqlite3_int64)[(__CFNumber *)v10 longLongValue]);
    }
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
  }
LABEL_9:
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
  CFStringRef v6 = (const __CFString *)a3;
  theString = (__CFString *)v6;
  if (!self->_statement)
  {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
    goto LABEL_11;
  }
  CFStringEncoding FastestEncoding = CFStringGetFastestEncoding(v6);
  if (FastestEncoding == 256)
  {
    CharactersPtr = CFStringGetCharactersPtr(theString);
    if (CharactersPtr)
    {
      v14 = CharactersPtr;
      statement = self->_statement;
      int Length = CFStringGetLength(theString);
      sqlite3_bind_text16(statement, a4, v14, 2 * Length, 0);
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (FastestEncoding != 134217984 || (CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u)) == 0)
  {
LABEL_9:
    v17 = self->_statement;
    double v9 = (const char *)[(__CFString *)theString UTF8String];
    CFNumberRef v10 = v17;
    int v11 = a4;
    uint64_t v12 = -1;
    goto LABEL_10;
  }
  double v9 = CStringPtr;
  CFNumberRef v10 = self->_statement;
  int v11 = a4;
  uint64_t v12 = 0;
LABEL_10:
  sqlite3_bind_text(v10, v11, v9, -1, (void (__cdecl *)(void *))v12);
LABEL_11:
}

- (int)finalizeStatement
{
  statement = self->_statement;
  if (statement)
  {
    int v4 = sqlite3_finalize(statement);
    strongSelf = self->_strongSelf;
    self->_statement = 0;
    self->_strongSelf = 0;

    LODWORD(statement) = v4;
  }
  return (int)statement;
}

- (int)reset
{
  statement = self->_statement;
  if (statement) {
    return sqlite3_reset(statement);
  }
  else {
    return 21;
  }
}

- (int)step
{
  statement = self->_statement;
  if (statement)
  {
    return sqlite3_step(statement);
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
    return 21;
  }
}

- (SQLiteStatement)initWithStatement:(sqlite3_stmt *)a3 onConnection:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SQLiteStatement;
  v8 = [(SQLiteStatement *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_statement = a3;
    objc_storeStrong((id *)&v9->_strongSelf, v9);
  }

  return v9;
}

- (sqlite3_stmt)sqlite3_stmt
{
  return self->_statement;
}

- (SQLiteConnection)connection
{
  return self->_connection;
}

- (NSDictionary)columnIndexByName
{
  statement = self->_statement;
  if (statement)
  {
    int v4 = sqlite3_column_count(statement);
    v5 = +[NSMutableDictionary dictionaryWithCapacity:v4];
    if (v4 >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        id v7 = [objc_alloc((Class)NSNumber) initWithInt:v6];
        id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", sqlite3_column_name(self->_statement, v6));
        [v5 setObject:v7 forKey:v8];

        uint64_t v6 = (v6 + 1);
      }
      while (v4 != v6);
    }
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
    v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (BOOL)isReadOnly
{
  statement = self->_statement;
  if (statement) {
    return sqlite3_stmt_readonly(statement) != 0;
  }
  +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
  return 1;
}

- (NSString)SQL
{
  statement = self->_statement;
  if (statement)
  {
    v3 = +[NSString stringWithUTF8String:sqlite3_sql(statement)];
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
    v3 = &stru_10036C970;
  }

  return (NSString *)v3;
}

- (void)bindArray:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = +[NSJSONSerialization dataWithJSONObject:a3 options:0 error:0];
  [(SQLiteStatement *)self bindData:v6 atPosition:v4];
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
  id v6 = a3;
  statement = self->_statement;
  id v9 = v6;
  if (statement)
  {
    id v8 = v6;
    sqlite3_bind_blob(statement, a4, [v8 bytes], (int)objc_msgSend(v8, "length"), 0);
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
  }
}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
  id v6 = a3;
  statement = self->_statement;
  id v9 = v6;
  if (statement)
  {
    id v8 = v6;
    sqlite3_bind_blob(statement, a4, [v8 bytes], (int)objc_msgSend(v8, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
  }
}

- (void)bindDate:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [a3 timeIntervalSinceReferenceDate];

  -[SQLiteStatement bindDouble:atPosition:](self, "bindDouble:atPosition:", v4);
}

- (void)bindDictionary:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = +[NSJSONSerialization dataWithJSONObject:a3 options:0 error:0];
  [(SQLiteStatement *)self bindData:v6 atPosition:v4];
}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_double(statement, a4, a3);
  }
  else {
    +[NSException raise:NSInternalInconsistencyException, @"Statement already finalized", a3 format];
  }
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_double(statement, a4, a3);
  }
  else {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
  }
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_int(statement, a4, a3);
  }
  else {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
  }
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_int64(statement, a4, a3);
  }
  else {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
  }
}

- (void)bindNullAtPosition:(int)a3
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_null(statement, a3);
  }
  else {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
  }
}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement)
  {
    id v6 = (const char *)[a3 UTF8String];
    sqlite3_bind_text(statement, a4, v6, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"Statement already finalized"];
  }
}

- (void)bindUUID:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 UUIDString];
  [(SQLiteStatement *)self bindString:v6 atPosition:v4];
}

- (void)bindURL:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 absoluteString];
  [(SQLiteStatement *)self bindString:v6 atPosition:v4];
}

- (int)clearBindings
{
  statement = self->_statement;
  if (statement) {
    return sqlite3_clear_bindings(statement);
  }
  else {
    return 21;
  }
}

@end