@interface CRSQLRow
+ (id)dataAtIndex:(int)a3 copyBytes:(BOOL)a4 statement:(sqlite3_stmt *)a5;
+ (id)numberWithDoubleAtIndex:(int)a3 statement:(sqlite3_stmt *)a4;
+ (id)numberWithIntegerAtIndex:(int)a3 statement:(sqlite3_stmt *)a4;
+ (id)objectAtIndex:(int)a3 statement:(sqlite3_stmt *)a4;
+ (id)rowWithStatement:(sqlite3_stmt *)a3;
+ (id)stringAtIndex:(int)a3 statement:(sqlite3_stmt *)a4;
+ (int)enumerateRowsInStatement:(sqlite3_stmt *)a3 usingBlock:(id)a4;
+ (int)step:(sqlite3_stmt *)a3;
- (CRSQLRow)initWithStatement:(sqlite3_stmt *)a3;
- (id)dataAtIndex:(int)a3 copyBytes:(BOOL)a4;
- (id)numberWithDoubleAtIndex:(int)a3;
- (id)numberWithIntegerAtIndex:(int)a3;
- (id)objectAtIndex:(int)a3;
- (id)stringAtIndex:(int)a3;
@end

@implementation CRSQLRow

+ (int)enumerateRowsInStatement:(sqlite3_stmt *)a3 usingBlock:(id)a4
{
  int v7 = objc_msgSend(a1, "step:");
  if (v7 == 100)
  {
    do
    {
      v8 = (void *)[objc_alloc((Class)a1) initWithStatement:a3];
      (*((void (**)(id, void *))a4 + 2))(a4, v8);

      int v9 = [a1 step:a3];
    }
    while (v9 == 100);
    int v7 = v9;
  }
  sqlite3_reset(a3);
  return v7;
}

+ (int)step:(sqlite3_stmt *)a3
{
  do
    int result = sqlite3_step(a3);
  while (result - 7 > 0xFFFFFFFD);
  return result;
}

+ (id)rowWithStatement:(sqlite3_stmt *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithStatement:a3];
  return v3;
}

- (CRSQLRow)initWithStatement:(sqlite3_stmt *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRSQLRow;
  int result = [(CRSQLRow *)&v5 init];
  if (result) {
    result->_stmt = a3;
  }
  return result;
}

- (id)stringAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = objc_opt_class();
  stmt = self->_stmt;
  return (id)[v5 stringAtIndex:v3 statement:stmt];
}

- (id)objectAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = objc_opt_class();
  stmt = self->_stmt;
  return (id)[v5 objectAtIndex:v3 statement:stmt];
}

- (id)dataAtIndex:(int)a3 copyBytes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  int v7 = objc_opt_class();
  stmt = self->_stmt;
  return (id)[v7 dataAtIndex:v5 copyBytes:v4 statement:stmt];
}

- (id)numberWithIntegerAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = objc_opt_class();
  stmt = self->_stmt;
  return (id)[v5 numberWithIntegerAtIndex:v3 statement:stmt];
}

- (id)numberWithDoubleAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = objc_opt_class();
  stmt = self->_stmt;
  return (id)[v5 numberWithDoubleAtIndex:v3 statement:stmt];
}

+ (id)stringAtIndex:(int)a3 statement:(sqlite3_stmt *)a4
{
  if (a3 < 0) {
    return 0;
  }
  BOOL v4 = sqlite3_column_text(a4, a3);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  v6 = NSString;
  return (id)[v6 stringWithUTF8String:v5];
}

+ (id)objectAtIndex:(int)a3 statement:(sqlite3_stmt *)a4
{
  uint64_t v4 = [a1 dataAtIndex:*(void *)&a3 copyBytes:0 statement:a4];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F98];
  return (id)[v5 propertyListWithData:v4 options:0 format:0 error:0];
}

+ (id)dataAtIndex:(int)a3 copyBytes:(BOOL)a4 statement:(sqlite3_stmt *)a5
{
  if (a3 < 0) {
    return 0;
  }
  BOOL v6 = a4;
  v8 = sqlite3_column_blob(a5, a3);
  if (!v8) {
    return 0;
  }
  int v9 = v8;
  int v10 = sqlite3_column_bytes(a5, a3);
  v11 = (void *)MEMORY[0x1E4F1C9B8];
  if (v6)
  {
    return (id)[v11 dataWithBytes:v9 length:v10];
  }
  else
  {
    return (id)[v11 dataWithBytesNoCopy:v9 length:v10 freeWhenDone:0];
  }
}

+ (id)numberWithIntegerAtIndex:(int)a3 statement:(sqlite3_stmt *)a4
{
  if (a3 < 0 || sqlite3_column_type(a4, a3) == 5) {
    return 0;
  }
  int v7 = NSNumber;
  sqlite3_int64 v8 = sqlite3_column_int64(a4, a3);
  return (id)[v7 numberWithLongLong:v8];
}

+ (id)numberWithDoubleAtIndex:(int)a3 statement:(sqlite3_stmt *)a4
{
  if (a3 < 0 || sqlite3_column_type(a4, a3) == 5) {
    return 0;
  }
  int v7 = NSNumber;
  double v8 = sqlite3_column_double(a4, a3);
  return (id)[v7 numberWithDouble:v8];
}

@end