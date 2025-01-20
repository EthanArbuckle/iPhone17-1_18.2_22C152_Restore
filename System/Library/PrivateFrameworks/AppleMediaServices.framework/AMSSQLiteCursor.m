@interface AMSSQLiteCursor
- (AMSSQLiteCursor)initWithStatement:(id)a3;
- (double)doubleForColumnIndex:(int)a3;
- (double)doubleForColumnName:(id)a3;
- (id)URLForColumnIndex:(int)a3;
- (id)URLForColumnName:(id)a3;
- (id)dataForColumnIndex:(int)a3;
- (id)dataForColumnName:(id)a3;
- (id)dateForColumnIndex:(int)a3;
- (id)dateForColumnName:(id)a3;
- (id)numberForColumnIndex:(int)a3;
- (id)numberForColumnName:(id)a3;
- (id)stringForColumnIndex:(int)a3;
- (id)stringForColumnName:(id)a3;
- (int)_columnTypeForColumnIndex:(int)a3;
- (int)columnIndexForColumnName:(id)a3;
- (int)intForColumnIndex:(int)a3;
- (int)intForColumnName:(id)a3;
- (int64_t)int64ForColumnIndex:(int)a3;
- (int64_t)int64ForColumnName:(id)a3;
- (int64_t)numberOfColumns;
@end

@implementation AMSSQLiteCursor

- (id)stringForColumnName:(id)a3
{
  uint64_t v4 = [(AMSSQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(AMSSQLiteCursor *)self stringForColumnIndex:v4];
  }
  return v5;
}

- (id)stringForColumnIndex:(int)a3
{
  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)sqlite3_column_text(self->_statement, a3);
    if (v5)
    {
      v5 = [NSString stringWithUTF8String:v5];
    }
  }
  return v5;
}

- (int)columnIndexForColumnName:(id)a3
{
  id v4 = a3;
  columnIndexByName = self->_columnIndexByName;
  if (!columnIndexByName)
  {
    v6 = [(AMSSQLiteStatement *)self->_statementWrapper columnIndexByName];
    v7 = self->_columnIndexByName;
    self->_columnIndexByName = v6;

    columnIndexByName = self->_columnIndexByName;
  }
  v8 = [(NSDictionary *)columnIndexByName objectForKey:v4];
  v9 = v8;
  if (v8) {
    int v10 = [v8 intValue];
  }
  else {
    int v10 = -1;
  }

  return v10;
}

- (AMSSQLiteCursor)initWithStatement:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSSQLiteCursor;
  v6 = [(AMSSQLiteCursor *)&v8 init];
  if (v6)
  {
    v6->_statement = (sqlite3_stmt *)objc_msgSend(v5, "sqlite3_stmt");
    objc_storeStrong((id *)&v6->_statementWrapper, a3);
  }

  return v6;
}

- (int64_t)int64ForColumnIndex:(int)a3
{
  return sqlite3_column_int64(self->_statement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementWrapper, 0);
  objc_storeStrong((id *)&self->_columnIndexByName, 0);
}

- (double)doubleForColumnIndex:(int)a3
{
  return sqlite3_column_double(self->_statement, a3);
}

- (int)intForColumnIndex:(int)a3
{
  return sqlite3_column_int(self->_statement, a3);
}

- (id)dataForColumnIndex:(int)a3
{
  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    id v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_blob(self->_statement, a3);
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v6, sqlite3_column_bytes(self->_statement, a3));
  }
  return v5;
}

- (id)dataForColumnName:(id)a3
{
  uint64_t v4 = [(AMSSQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(AMSSQLiteCursor *)self dataForColumnIndex:v4];
  }
  return v5;
}

- (id)dateForColumnIndex:(int)a3
{
  int v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    v6 = (void *)MEMORY[0x1E4F1C9C8];
    double v7 = (double)sqlite3_column_int64(self->_statement, a3);
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    v6 = (void *)MEMORY[0x1E4F1C9C8];
    double v7 = sqlite3_column_double(self->_statement, a3);
LABEL_5:
    objc_super v8 = [v6 dateWithTimeIntervalSinceReferenceDate:v7];
    goto LABEL_7;
  }
  objc_super v8 = 0;
LABEL_7:
  return v8;
}

- (id)dateForColumnName:(id)a3
{
  uint64_t v4 = [(AMSSQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(AMSSQLiteCursor *)self dateForColumnIndex:v4];
  }
  return v5;
}

- (double)doubleForColumnName:(id)a3
{
  int v4 = [(AMSSQLiteCursor *)self columnIndexForColumnName:a3];
  if (v4 < 0) {
    return 0.0;
  }
  int v5 = v4;
  statement = self->_statement;
  return sqlite3_column_double(statement, v5);
}

- (int)intForColumnName:(id)a3
{
  int v4 = [(AMSSQLiteCursor *)self columnIndexForColumnName:a3];
  if (v4 < 0) {
    return 0;
  }
  int v5 = v4;
  statement = self->_statement;
  return sqlite3_column_int(statement, v5);
}

- (int64_t)int64ForColumnName:(id)a3
{
  int v4 = [(AMSSQLiteCursor *)self columnIndexForColumnName:a3];
  if (v4 < 0) {
    return 0;
  }
  int v5 = v4;
  statement = self->_statement;
  return sqlite3_column_int64(statement, v5);
}

- (id)numberForColumnIndex:(int)a3
{
  int v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", sqlite3_column_int64(self->_statement, a3));
  }
  else if (v5 == 2)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", sqlite3_column_double(self->_statement, a3));
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)numberForColumnName:(id)a3
{
  uint64_t v4 = [(AMSSQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(AMSSQLiteCursor *)self numberForColumnIndex:v4];
  }
  return v5;
}

- (int64_t)numberOfColumns
{
  return sqlite3_column_count(self->_statement);
}

- (id)URLForColumnIndex:(int)a3
{
  v3 = [(AMSSQLiteCursor *)self stringForColumnIndex:*(void *)&a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)URLForColumnName:(id)a3
{
  uint64_t v4 = [(AMSSQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(AMSSQLiteCursor *)self URLForColumnIndex:v4];
  }
  return v5;
}

- (int)_columnTypeForColumnIndex:(int)a3
{
  return sqlite3_column_type(self->_statement, a3);
}

@end