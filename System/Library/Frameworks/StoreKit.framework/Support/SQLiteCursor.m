@interface SQLiteCursor
- (SQLiteCursor)initWithStatement:(id)a3;
- (double)doubleForColumnIndex:(int)a3;
- (double)doubleForColumnName:(id)a3;
- (id)JSONObjectForColumnIndex:(int)a3;
- (id)URLForColumnIndex:(int)a3;
- (id)URLForColumnName:(id)a3;
- (id)UUIDForColumnIndex:(int)a3;
- (id)UUIDForColumnName:(id)a3;
- (id)dataForColumnIndex:(int)a3;
- (id)dataForColumnName:(id)a3;
- (id)dateForColumnIndex:(int)a3;
- (id)dateForColumnName:(id)a3;
- (id)dictionaryWithValuesForColumnNames:(id)a3;
- (id)dictionaryWithValuesForColumns;
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
- (unsigned)_declaredTypeForColumnIndex:(int)a3;
- (void)dealloc;
@end

@implementation SQLiteCursor

- (void)dealloc
{
  free(self->_columnDeclaredTypes);
  v3.receiver = self;
  v3.super_class = (Class)SQLiteCursor;
  [(SQLiteCursor *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementWrapper, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong(&self->_columnKeySet, 0);

  objc_storeStrong((id *)&self->_columnIndexByName, 0);
}

- (SQLiteCursor)initWithStatement:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SQLiteCursor;
  v6 = [(SQLiteCursor *)&v19 init];
  if (v6)
  {
    v6->_statement = (sqlite3_stmt *)objc_msgSend(v5, "sqlite3_stmt");
    objc_storeStrong((id *)&v6->_statementWrapper, a3);
    int v7 = sqlite3_column_count(v6->_statement);
    v6->_columnCount = v7;
    uint64_t v8 = +[NSMutableArray arrayWithCapacity:v7];
    columnNames = v6->_columnNames;
    v6->_columnNames = (NSMutableArray *)v8;

    v6->_columnDeclaredTypes = (unsigned __int8 *)malloc_type_calloc(v6->_columnCount, 1uLL, 0x100004077774924uLL);
    if (v6->_columnCount >= 1)
    {
      for (uint64_t i = 0; i < v6->_columnCount; ++i)
      {
        v11 = v6->_columnNames;
        v12 = +[NSString stringWithUTF8String:sqlite3_column_name(v6->_statement, i)];
        [(NSMutableArray *)v11 addObject:v12];

        v13 = sqlite3_column_decltype(v6->_statement, i);
        if (v13)
        {
          v14 = v13;
          if (!strcmp(v13, "DATETIME"))
          {
            v6->_columnDeclaredTypes[i] = 1;
            continue;
          }
          if (!strcmp(v14, "JSON"))
          {
            columnDeclaredTypes = v6->_columnDeclaredTypes;
            char v17 = 2;
            goto LABEL_17;
          }
          if (!strcmp(v14, "UUID"))
          {
            columnDeclaredTypes = v6->_columnDeclaredTypes;
            char v17 = 3;
            goto LABEL_17;
          }
          if (!strcmp(v14, "URL"))
          {
            columnDeclaredTypes = v6->_columnDeclaredTypes;
            char v17 = 4;
            goto LABEL_17;
          }
          int v15 = strcmp(v14, "STRING");
          columnDeclaredTypes = v6->_columnDeclaredTypes;
          if (!v15)
          {
            char v17 = 5;
LABEL_17:
            columnDeclaredTypes[i] = v17;
            continue;
          }
        }
        else
        {
          columnDeclaredTypes = v6->_columnDeclaredTypes;
        }
        columnDeclaredTypes[i] = 0;
      }
    }
  }

  return v6;
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
    id v5 = +[NSData dataWithBytes:v6 length:sqlite3_column_bytes(self->_statement, a3)];
  }

  return v5;
}

- (id)dataForColumnName:(id)a3
{
  uint64_t v4 = [(SQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(SQLiteCursor *)self dataForColumnIndex:v4];
  }

  return v5;
}

- (id)dateForColumnIndex:(int)a3
{
  int v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    double v6 = (double)sqlite3_column_int64(self->_statement, a3);
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    double v6 = sqlite3_column_double(self->_statement, a3);
LABEL_5:
    int v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v6];
    goto LABEL_7;
  }
  int v7 = 0;
LABEL_7:

  return v7;
}

- (id)dateForColumnName:(id)a3
{
  uint64_t v4 = [(SQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(SQLiteCursor *)self dateForColumnIndex:v4];
  }

  return v5;
}

- (double)doubleForColumnIndex:(int)a3
{
  return sqlite3_column_double(self->_statement, a3);
}

- (double)doubleForColumnName:(id)a3
{
  unsigned int v4 = [(SQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0) {
    return 0.0;
  }
  int v5 = v4;
  statement = self->_statement;

  return sqlite3_column_double(statement, v5);
}

- (int)intForColumnIndex:(int)a3
{
  return sqlite3_column_int(self->_statement, a3);
}

- (int)intForColumnName:(id)a3
{
  unsigned int v4 = [(SQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0) {
    return 0;
  }
  int v5 = v4;
  statement = self->_statement;

  return sqlite3_column_int(statement, v5);
}

- (int64_t)int64ForColumnIndex:(int)a3
{
  return sqlite3_column_int64(self->_statement, a3);
}

- (int64_t)int64ForColumnName:(id)a3
{
  unsigned int v4 = [(SQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0) {
    return 0;
  }
  int v5 = v4;
  statement = self->_statement;

  return sqlite3_column_int64(statement, v5);
}

- (id)JSONObjectForColumnIndex:(int)a3
{
  int v5 = -[SQLiteCursor dataForColumnIndex:](self, "dataForColumnIndex:");
  if (!v5)
  {
    id v7 = 0;
LABEL_8:
    double v6 = 0;
    goto LABEL_9;
  }
  id v14 = 0;
  double v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v14];
  id v7 = v14;
  if (!v6)
  {
    if (qword_1003A02B0 != -1) {
      dispatch_once(&qword_1003A02B0, &stru_100359D90);
    }
    uint64_t v8 = (void *)qword_1003A0298;
    if (os_log_type_enabled((os_log_t)qword_1003A0298, OS_LOG_TYPE_ERROR))
    {
      columnNames = self->_columnNames;
      v10 = v8;
      v11 = [(NSMutableArray *)columnNames objectAtIndexedSubscript:a3];
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      __int16 v17 = 2114;
      id v18 = v7;
    }
    goto LABEL_8;
  }
LABEL_9:
  id v12 = v6;

  return v12;
}

- (id)numberForColumnIndex:(int)a3
{
  int v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    double v6 = +[NSNumber numberWithLongLong:sqlite3_column_int64(self->_statement, a3)];
  }
  else if (v5 == 2)
  {
    double v6 = +[NSNumber numberWithDouble:sqlite3_column_double(self->_statement, a3)];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)numberForColumnName:(id)a3
{
  uint64_t v4 = [(SQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(SQLiteCursor *)self numberForColumnIndex:v4];
  }

  return v5;
}

- (int64_t)numberOfColumns
{
  return sqlite3_column_count(self->_statement);
}

- (id)stringForColumnIndex:(int)a3
{
  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = (void *)sqlite3_column_text(self->_statement, a3);
    if (v5)
    {
      int v5 = +[NSString stringWithUTF8String:v5];
    }
  }

  return v5;
}

- (id)stringForColumnName:(id)a3
{
  uint64_t v4 = [(SQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(SQLiteCursor *)self stringForColumnIndex:v4];
  }

  return v5;
}

- (id)UUIDForColumnIndex:(int)a3
{
  objc_super v3 = [(SQLiteCursor *)self stringForColumnIndex:*(void *)&a3];
  if (v3) {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)UUIDForColumnName:(id)a3
{
  uint64_t v4 = [(SQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(SQLiteCursor *)self UUIDForColumnIndex:v4];
  }

  return v5;
}

- (id)URLForColumnIndex:(int)a3
{
  objc_super v3 = [(SQLiteCursor *)self stringForColumnIndex:*(void *)&a3];
  if (v3)
  {
    uint64_t v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)URLForColumnName:(id)a3
{
  uint64_t v4 = [(SQLiteCursor *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(SQLiteCursor *)self URLForColumnIndex:v4];
  }

  return v5;
}

- (id)dictionaryWithValuesForColumns
{
  return [(SQLiteCursor *)self dictionaryWithValuesForColumnNames:0];
}

- (id)dictionaryWithValuesForColumnNames:(id)a3
{
  id v4 = a3;
  id columnKeySet = self->_columnKeySet;
  if (!columnKeySet)
  {
    double v6 = +[NSDictionary sharedKeySetForKeys:self->_columnNames];
    id v7 = self->_columnKeySet;
    self->_id columnKeySet = v6;

    id columnKeySet = self->_columnKeySet;
  }
  uint64_t v8 = +[NSMutableDictionary dictionaryWithSharedKeySet:columnKeySet];
  columnNames = self->_columnNames;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007FD70;
  v14[3] = &unk_100359D70;
  id v15 = v4;
  id v16 = v8;
  __int16 v17 = self;
  id v10 = v8;
  id v11 = v4;
  [(NSMutableArray *)columnNames enumerateObjectsUsingBlock:v14];
  id v12 = [v10 copy];

  return v12;
}

- (int)columnIndexForColumnName:(id)a3
{
  return [(NSMutableArray *)self->_columnNames indexOfObject:a3];
}

- (int)_columnTypeForColumnIndex:(int)a3
{
  return sqlite3_column_type(self->_statement, a3);
}

- (unsigned)_declaredTypeForColumnIndex:(int)a3
{
  if (a3 < 0 || self->_columnCount <= a3) {
    return 0;
  }
  else {
    return self->_columnDeclaredTypes[a3];
  }
}

@end