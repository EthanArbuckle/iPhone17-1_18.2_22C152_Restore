@interface ASUSQLiteCursor
- (double)doubleForColumnIndex:(int)a3;
- (double)doubleForColumnName:(id)a3;
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
- (int)intForColumnIndex:(int)a3;
- (int)intForColumnName:(id)a3;
- (int64_t)int64ForColumnIndex:(int)a3;
- (int64_t)int64ForColumnName:(id)a3;
- (int64_t)numberOfColumns;
- (void)dealloc;
@end

@implementation ASUSQLiteCursor

- (void)dealloc
{
  free(self->_columnDeclaredTypes);
  v3.receiver = self;
  v3.super_class = (Class)ASUSQLiteCursor;
  [(ASUSQLiteCursor *)&v3 dealloc];
}

- (id)dataForColumnIndex:(int)a3
{
  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_blob(self->_statement, a3);
    v5 = +[NSData dataWithBytes:v6 length:sqlite3_column_bytes(self->_statement, a3)];
  }

  return v5;
}

- (id)dataForColumnName:(id)a3
{
  id v4 = a3;
  if (self
    && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = -[ASUSQLiteCursor dataForColumnIndex:](self, "dataForColumnIndex:");
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
    v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v6];
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (id)dateForColumnName:(id)a3
{
  id v4 = a3;
  if (self
    && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = -[ASUSQLiteCursor dateForColumnIndex:](self, "dateForColumnIndex:");
  }

  return v5;
}

- (double)doubleForColumnIndex:(int)a3
{
  return sqlite3_column_double(self->_statement, a3);
}

- (double)doubleForColumnName:(id)a3
{
  id v4 = a3;
  if (self)
  {
    int v5 = [(NSMutableArray *)self->_columnNames indexOfObject:v4];
    if (v5 < 0)
    {
      double v6 = 0.0;
      goto LABEL_5;
    }
  }
  else
  {
    int v5 = 0;
  }
  double v6 = sqlite3_column_double(self->_statement, v5);
LABEL_5:

  return v6;
}

- (int)intForColumnIndex:(int)a3
{
  return sqlite3_column_int(self->_statement, a3);
}

- (int)intForColumnName:(id)a3
{
  id v4 = a3;
  if (self)
  {
    int v5 = [(NSMutableArray *)self->_columnNames indexOfObject:v4];
    if (v5 < 0)
    {
      int v6 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    int v5 = 0;
  }
  int v6 = sqlite3_column_int(self->_statement, v5);
LABEL_5:

  return v6;
}

- (int64_t)int64ForColumnIndex:(int)a3
{
  return sqlite3_column_int64(self->_statement, a3);
}

- (int64_t)int64ForColumnName:(id)a3
{
  id v4 = a3;
  if (self)
  {
    int v5 = [(NSMutableArray *)self->_columnNames indexOfObject:v4];
    if (v5 < 0)
    {
      sqlite3_int64 v6 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    int v5 = 0;
  }
  sqlite3_int64 v6 = sqlite3_column_int64(self->_statement, v5);
LABEL_5:

  return v6;
}

- (id)numberForColumnIndex:(int)a3
{
  int v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    sqlite3_int64 v6 = +[NSNumber numberWithLongLong:sqlite3_column_int64(self->_statement, a3)];
  }
  else if (v5 == 2)
  {
    sqlite3_int64 v6 = +[NSNumber numberWithDouble:sqlite3_column_double(self->_statement, a3)];
  }
  else
  {
    sqlite3_int64 v6 = 0;
  }

  return v6;
}

- (id)numberForColumnName:(id)a3
{
  id v4 = a3;
  if (self
    && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = -[ASUSQLiteCursor numberForColumnIndex:](self, "numberForColumnIndex:");
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
  id v4 = a3;
  if (self
    && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = -[ASUSQLiteCursor stringForColumnIndex:](self, "stringForColumnIndex:");
  }

  return v5;
}

- (id)UUIDForColumnIndex:(int)a3
{
  objc_super v3 = [(ASUSQLiteCursor *)self stringForColumnIndex:*(void *)&a3];
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
  id v4 = a3;
  if (self
    && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = -[ASUSQLiteCursor UUIDForColumnIndex:](self, "UUIDForColumnIndex:");
  }

  return v5;
}

- (id)URLForColumnIndex:(int)a3
{
  objc_super v3 = [(ASUSQLiteCursor *)self stringForColumnIndex:*(void *)&a3];
  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)URLForColumnName:(id)a3
{
  id v4 = a3;
  if (self
    && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = -[ASUSQLiteCursor URLForColumnIndex:](self, "URLForColumnIndex:");
  }

  return v5;
}

- (id)dictionaryWithValuesForColumns
{
  return [(ASUSQLiteCursor *)self dictionaryWithValuesForColumnNames:0];
}

- (id)dictionaryWithValuesForColumnNames:(id)a3
{
  id v4 = a3;
  id columnKeySet = self->_columnKeySet;
  if (!columnKeySet)
  {
    sqlite3_int64 v6 = +[NSDictionary sharedKeySetForKeys:self->_columnNames];
    id v7 = self->_columnKeySet;
    self->_id columnKeySet = v6;

    id columnKeySet = self->_columnKeySet;
  }
  v8 = +[NSMutableDictionary dictionaryWithSharedKeySet:columnKeySet];
  columnNames = self->_columnNames;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100165D64;
  v14[3] = &unk_100635BD8;
  id v15 = v4;
  id v16 = v8;
  v17 = self;
  id v10 = v8;
  id v11 = v4;
  [(NSMutableArray *)columnNames enumerateObjectsUsingBlock:v14];
  id v12 = [v10 copy];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementWrapper, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong(&self->_columnKeySet, 0);

  objc_storeStrong((id *)&self->_columnIndexByName, 0);
}

@end