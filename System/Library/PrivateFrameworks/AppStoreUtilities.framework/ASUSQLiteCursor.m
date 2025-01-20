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
- (sqlite3_stmt)initWithStatement:(sqlite3_stmt *)a1;
- (void)dealloc;
@end

@implementation ASUSQLiteCursor

- (sqlite3_stmt)initWithStatement:(sqlite3_stmt *)a1
{
  v4 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)ASUSQLiteCursor;
    v5 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = (sqlite3_stmt **)v5;
    if (v5)
    {
      v6 = v4 ? (void *)v4[2] : 0;
      v5[6] = v6;
      objc_storeStrong(v5 + 7, a2);
      int v7 = sqlite3_column_count(a1[6]);
      *((_DWORD *)a1 + 2) = v7;
      uint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
      v9 = a1[5];
      a1[5] = (sqlite3_stmt *)v8;

      a1[2] = (sqlite3_stmt *)malloc_type_calloc(*((int *)a1 + 2), 1uLL, 0x100004077774924uLL);
      if (*((int *)a1 + 2) >= 1)
      {
        for (uint64_t i = 0; i < *((int *)a1 + 2); ++i)
        {
          v11 = a1[5];
          v12 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(a1[6], i));
          [(sqlite3_stmt *)v11 addObject:v12];

          v13 = sqlite3_column_decltype(a1[6], i);
          if (v13)
          {
            v14 = v13;
            if (!strcmp(v13, "DATETIME"))
            {
              *((unsigned char *)a1[2] + i) = 1;
              continue;
            }
            if (!strcmp(v14, "JSON"))
            {
              v16 = a1[2];
              char v17 = 2;
              goto LABEL_20;
            }
            if (!strcmp(v14, "UUID"))
            {
              v16 = a1[2];
              char v17 = 3;
              goto LABEL_20;
            }
            if (!strcmp(v14, "URL"))
            {
              v16 = a1[2];
              char v17 = 4;
              goto LABEL_20;
            }
            int v15 = strcmp(v14, "STRING");
            v16 = a1[2];
            if (!v15)
            {
              char v17 = 5;
LABEL_20:
              *((unsigned char *)v16 + i) = v17;
              continue;
            }
          }
          else
          {
            v16 = a1[2];
          }
          *((unsigned char *)v16 + i) = 0;
        }
      }
    }
  }

  return a1;
}

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
    v5 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v6, sqlite3_column_bytes(self->_statement, a3));
  }

  return v5;
}

- (id)dataForColumnName:(id)a3
{
  id v4 = a3;
  if (self && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
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
    v6 = (void *)MEMORY[0x263EFF910];
    double v7 = (double)sqlite3_column_int64(self->_statement, a3);
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    v6 = (void *)MEMORY[0x263EFF910];
    double v7 = sqlite3_column_double(self->_statement, a3);
LABEL_5:
    uint64_t v8 = [v6 dateWithTimeIntervalSinceReferenceDate:v7];
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)dateForColumnName:(id)a3
{
  id v4 = a3;
  if (self && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
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
    sqlite3_int64 v6 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(self->_statement, a3));
  }
  else if (v5 == 2)
  {
    sqlite3_int64 v6 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(self->_statement, a3));
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
  if (self && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
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
      int v5 = [NSString stringWithUTF8String:v5];
    }
  }

  return v5;
}

- (id)stringForColumnName:(id)a3
{
  id v4 = a3;
  if (self && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
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
    id v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)UUIDForColumnName:(id)a3
{
  id v4 = a3;
  if (self && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
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
    id v4 = [NSURL URLWithString:v3];
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
  if (self && ([(NSMutableArray *)self->_columnNames indexOfObject:v4] & 0x80000000) != 0)
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
    sqlite3_int64 v6 = [NSDictionary sharedKeySetForKeys:self->_columnNames];
    id v7 = self->_columnKeySet;
    self->_id columnKeySet = v6;

    id columnKeySet = self->_columnKeySet;
  }
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionaryWithSharedKeySet:columnKeySet];
  columnNames = self->_columnNames;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__ASUSQLiteCursor_dictionaryWithValuesForColumnNames___block_invoke;
  v14[3] = &unk_26522F670;
  id v15 = v4;
  id v16 = v8;
  char v17 = self;
  id v10 = v8;
  id v11 = v4;
  [(NSMutableArray *)columnNames enumerateObjectsUsingBlock:v14];
  v12 = (void *)[v10 copy];

  return v12;
}

void __54__ASUSQLiteCursor_dictionaryWithValuesForColumnNames___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  int v5 = *(void **)(a1 + 32);
  if (!v5 || [v5 containsObject:v7])
  {
    sqlite3_int64 v6 = ASUSQLiteCopyFoundationValue(*(void **)(a1 + 48), a3);
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementWrapper, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong(&self->_columnKeySet, 0);

  objc_storeStrong((id *)&self->_columnIndexByName, 0);
}

@end