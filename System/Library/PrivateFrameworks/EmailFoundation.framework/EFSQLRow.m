@interface EFSQLRow
- (BOOL)columnExistsAtIndex:(unint64_t)a3;
- (BOOL)columnExistsWithName:(id)a3;
- (BOOL)namedColumnsInitialized;
- (EFSQLPreparedStatement)preparedStatement;
- (EFSQLRow)initWithColumns:(id)a3;
- (EFSQLRow)initWithPreparedStatement:(id)a3;
- (EFSQLRow)initWithSQLiteStatement:(sqlite3_stmt *)a3;
- (NSDictionary)columns;
- (id)_queryString;
- (id)columnNames;
- (id)debugDescription;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (sqlite3_stmt)statement;
- (unint64_t)columnCount;
- (void)setColumnCount:(unint64_t)a3;
- (void)setNamedColumnsInitialized:(BOOL)a3;
- (void)setPreparedStatement:(id)a3;
@end

@implementation EFSQLRow

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v40 = v37;
  id v41 = a3;
  v4 = self;
  v5 = v4;
  BOOL namedColumnsInitialized = v4->_namedColumnsInitialized;
  v42 = v4;
  if (!namedColumnsInitialized)
  {
    unint64_t columnCount = v4->_columnCount;
    if (columnCount > 0xC80000)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      v32 = [NSString stringWithUTF8String:"void _initializeAllNamedColumns(EFSQLRow *__strong)"];
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"EFSQLRow.m", 112, @"Temporary buffer too large or with a negative count (%zu).", columnCount);
    }
    if (columnCount <= 1) {
      size_t v8 = 1;
    }
    else {
      size_t v8 = columnCount;
    }
    if (columnCount >= 0x101) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    size_t v10 = 8 * v9;
    MEMORY[0x1F4188790]();
    v12 = (char *)v37 - v11;
    bzero((char *)v37 - v11, v10);
    v39 = v12;
    if (columnCount > 0x100)
    {
      v13 = (char *)malloc_type_calloc(v8, 8uLL, 0x80040B8603338uLL);
    }
    else
    {
      bzero(v12, 8 * v8);
      v13 = 0;
    }
    v37[1] = v37;
    v38 = v13;
    if (columnCount >= 0x101) {
      v12 = v13;
    }
    v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2 * columnCount];
    if (columnCount)
    {
      uint64_t v15 = 0;
      v16 = (id *)v12;
      do
      {
        v17 = [[EFSQLColumn alloc] initWithSQLiteStatement:v42->_statement index:v15];
        objc_storeStrong(v16, v17);
        v18 = [NSNumber numberWithUnsignedInteger:v15];
        [v14 addObject:v18];

        v19 = [(EFSQLColumn *)v17 name];
        if (v19) {
          [v14 addObject:v19];
        }

        ++v15;
        ++v16;
      }
      while (columnCount != v15);
    }
    v20 = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:v14];
    v21 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:v20];
    if (columnCount)
    {
      for (uint64_t i = 0; i != columnCount; ++i)
      {
        id v23 = *(id *)&v12[8 * i];
        v24 = [NSNumber numberWithUnsignedInteger:i];
        [(NSDictionary *)v21 setObject:v23 forKeyedSubscript:v24];

        v25 = [v23 name];
        if (v25) {
          [(NSDictionary *)v21 setObject:v23 forKeyedSubscript:v25];
        }
        v26 = *(void **)&v12[8 * i];
        *(void *)&v12[8 * i] = 0;
      }
    }
    v5 = v42;
    columns = v42->_columns;
    v42->_columns = v21;

    v5->_BOOL namedColumnsInitialized = 1;
    free(v38);
    v28 = v39 - 8;
    do
    {

      v10 -= 8;
    }
    while (v10);
  }

  v29 = [(NSDictionary *)v5->_columns objectForKeyedSubscript:v41];
  if (!v29)
  {
    id v33 = [NSString alloc];
    v34 = [(EFSQLRow *)v42 _queryString];
    uint64_t v35 = [v33 initWithFormat:@"No matching column named \"%@\" in statement: %@", v41, v34];

    id v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v35 userInfo:0];
    objc_exception_throw(v36);
  }

  return v29;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(EFSQLRow *)self columnCount] <= a3)
  {
    unint64_t v35 = a3;
    id v36 = [NSString alloc];
    v37 = [(EFSQLRow *)self _queryString];
    uint64_t v38 = [v36 initWithFormat:@"Index %lu is out of range for selected columns: %@", v35, v37];

    id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v38 userInfo:0];
    objc_exception_throw(v39);
  }
  uint64_t v43 = &v40;
  unint64_t v44 = a3;
  v5 = self;
  v6 = v5;
  if (!v5->_namedColumnsInitialized)
  {
    unint64_t columnCount = v5->_columnCount;
    if (columnCount > 0xC80000)
    {
      id v33 = [MEMORY[0x1E4F28B00] currentHandler];
      v34 = [NSString stringWithUTF8String:"void _initializeAllNamedColumns(EFSQLRow *__strong)"];
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"EFSQLRow.m", 112, @"Temporary buffer too large or with a negative count (%zu).", columnCount);
    }
    uint64_t v40 = (uint64_t)&v40;
    if (columnCount <= 1) {
      size_t v8 = 1;
    }
    else {
      size_t v8 = columnCount;
    }
    if (columnCount >= 0x101) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    size_t v10 = 8 * v9;
    MEMORY[0x1F4188790](v5);
    v12 = (char *)&v40 - v11;
    bzero((char *)&v40 - v11, v10);
    v42 = v12;
    if (columnCount > 0x100)
    {
      v13 = (char *)malloc_type_calloc(v8, 8uLL, 0x80040B8603338uLL);
    }
    else
    {
      bzero(v12, 8 * v8);
      v13 = 0;
    }
    id v41 = v13;
    if (columnCount >= 0x101) {
      v12 = v13;
    }
    v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2 * columnCount, v40);
    if (columnCount)
    {
      uint64_t v15 = 0;
      v16 = (id *)v12;
      do
      {
        v17 = [[EFSQLColumn alloc] initWithSQLiteStatement:v6->_statement index:v15];
        objc_storeStrong(v16, v17);
        v18 = [NSNumber numberWithUnsignedInteger:v15];
        [v14 addObject:v18];

        v19 = [(EFSQLColumn *)v17 name];
        if (v19) {
          [v14 addObject:v19];
        }

        ++v15;
        ++v16;
      }
      while (columnCount != v15);
    }
    v20 = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:v14];
    v21 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:v20];
    if (columnCount)
    {
      for (uint64_t i = 0; i != columnCount; ++i)
      {
        id v23 = *(id *)&v12[8 * i];
        v24 = [NSNumber numberWithUnsignedInteger:i];
        [(NSDictionary *)v21 setObject:v23 forKeyedSubscript:v24];

        v25 = [v23 name];
        if (v25) {
          [(NSDictionary *)v21 setObject:v23 forKeyedSubscript:v25];
        }
        v26 = *(void **)&v12[8 * i];
        *(void *)&v12[8 * i] = 0;
      }
    }
    columns = v6->_columns;
    v6->_columns = v21;

    v6->_BOOL namedColumnsInitialized = 1;
    free(v41);
    v28 = v42 - 8;
    do
    {

      v10 -= 8;
    }
    while (v10);
  }

  v29 = v6->_columns;
  v30 = [NSNumber numberWithUnsignedInteger:v44];
  v31 = [(NSDictionary *)v29 objectForKeyedSubscript:v30];

  return v31;
}

- (unint64_t)columnCount
{
  return self->_columnCount;
}

- (EFSQLRow)initWithPreparedStatement:(id)a3
{
  id v4 = a3;
  v5 = -[EFSQLRow initWithSQLiteStatement:](self, "initWithSQLiteStatement:", [v4 compiled]);
  [(EFSQLRow *)v5 setPreparedStatement:v4];

  return v5;
}

- (void)setPreparedStatement:(id)a3
{
}

- (EFSQLRow)initWithSQLiteStatement:(sqlite3_stmt *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EFSQLRow;
  id v4 = [(EFSQLRow *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_statement = a3;
    v4->_unint64_t columnCount = sqlite3_column_count(a3);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_preparedStatement, 0);
}

- (BOOL)columnExistsWithName:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v36 = v33;
  id v37 = a3;
  id v4 = self;
  v5 = v4;
  if (!v4->_namedColumnsInitialized)
  {
    uint64_t v38 = v4;
    unint64_t columnCount = v4->_columnCount;
    if (columnCount > 0xC80000)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      v32 = [NSString stringWithUTF8String:"void _initializeAllNamedColumns(EFSQLRow *__strong)"];
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"EFSQLRow.m", 112, @"Temporary buffer too large or with a negative count (%zu).", columnCount);
    }
    if (columnCount <= 1) {
      size_t v7 = 1;
    }
    else {
      size_t v7 = columnCount;
    }
    if (columnCount >= 0x101) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    size_t v9 = 8 * v8;
    MEMORY[0x1F4188790](v4);
    uint64_t v11 = (char *)v33 - v10;
    bzero((char *)v33 - v10, v9);
    unint64_t v35 = v11;
    if (columnCount > 0x100)
    {
      v12 = (char *)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
    }
    else
    {
      bzero(v11, 8 * v7);
      v12 = 0;
    }
    v33[1] = v33;
    v34 = v12;
    if (columnCount >= 0x101) {
      uint64_t v11 = v12;
    }
    v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2 * columnCount];
    if (columnCount)
    {
      uint64_t v14 = 0;
      uint64_t v15 = (id *)v11;
      do
      {
        v16 = [[EFSQLColumn alloc] initWithSQLiteStatement:v38->_statement index:v14];
        objc_storeStrong(v15, v16);
        v17 = [NSNumber numberWithUnsignedInteger:v14];
        [v13 addObject:v17];

        v18 = [(EFSQLColumn *)v16 name];
        if (v18) {
          [v13 addObject:v18];
        }

        ++v14;
        ++v15;
      }
      while (columnCount != v14);
    }
    v19 = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:v13];
    v20 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:v19];
    if (columnCount)
    {
      for (uint64_t i = 0; i != columnCount; ++i)
      {
        id v22 = *(id *)&v11[8 * i];
        id v23 = [NSNumber numberWithUnsignedInteger:i];
        [(NSDictionary *)v20 setObject:v22 forKeyedSubscript:v23];

        v24 = [v22 name];
        if (v24) {
          [(NSDictionary *)v20 setObject:v22 forKeyedSubscript:v24];
        }
        v25 = *(void **)&v11[8 * i];
        *(void *)&v11[8 * i] = 0;
      }
    }
    v5 = v38;
    columns = v38->_columns;
    v38->_columns = v20;

    v5->_BOOL namedColumnsInitialized = 1;
    free(v34);
    v27 = v35 - 8;
    do
    {

      v9 -= 8;
    }
    while (v9);
  }

  v28 = [(NSDictionary *)v5->_columns objectForKeyedSubscript:v37];
  BOOL v29 = v28 != 0;

  return v29;
}

- (EFSQLRow)initWithColumns:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFSQLRow;
  v5 = [(EFSQLRow *)&v9 init];
  if (v5)
  {
    v5->_unint64_t columnCount = [v4 count];
    uint64_t v6 = [v4 copy];
    columns = v5->_columns;
    v5->_columns = (NSDictionary *)v6;

    v5->_BOOL namedColumnsInitialized = 1;
  }

  return v5;
}

- (BOOL)columnExistsAtIndex:(unint64_t)a3
{
  return [(EFSQLRow *)self columnCount] > a3;
}

- (id)columnNames
{
  unint64_t v35 = &v32;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = self;
  v3 = v2;
  if (!v2->_namedColumnsInitialized)
  {
    unint64_t columnCount = v2->_columnCount;
    id v36 = v2;
    if (columnCount > 0xC80000)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = [NSString stringWithUTF8String:"void _initializeAllNamedColumns(EFSQLRow *__strong)"];
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"EFSQLRow.m", 112, @"Temporary buffer too large or with a negative count (%zu).", columnCount);
    }
    uint64_t v32 = (uint64_t)&v32;
    if (columnCount <= 1) {
      size_t v5 = 1;
    }
    else {
      size_t v5 = columnCount;
    }
    if (columnCount >= 0x101) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    size_t v7 = 8 * v6;
    MEMORY[0x1F4188790](v2);
    objc_super v9 = (char *)&v32 - v8;
    bzero((char *)&v32 - v8, v7);
    v34 = v9;
    if (columnCount > 0x100)
    {
      uint64_t v10 = malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
    }
    else
    {
      bzero(v9, 8 * v5);
      uint64_t v10 = 0;
    }
    id v33 = v10;
    if (columnCount >= 0x101) {
      uint64_t v11 = (id *)v10;
    }
    else {
      uint64_t v11 = (id *)v9;
    }
    v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2 * columnCount, v32);
    if (columnCount)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      do
      {
        uint64_t v15 = [[EFSQLColumn alloc] initWithSQLiteStatement:v36->_statement index:v13];
        objc_storeStrong(v14, v15);
        v16 = [NSNumber numberWithUnsignedInteger:v13];
        [v12 addObject:v16];

        v17 = [(EFSQLColumn *)v15 name];
        if (v17) {
          [v12 addObject:v17];
        }

        ++v13;
        ++v14;
      }
      while (columnCount != v13);
    }
    v18 = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:v12];
    v19 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:v18];
    if (columnCount)
    {
      for (uint64_t i = 0; i != columnCount; ++i)
      {
        id v21 = v11[i];
        id v22 = [NSNumber numberWithUnsignedInteger:i];
        [(NSDictionary *)v19 setObject:v21 forKeyedSubscript:v22];

        id v23 = [v21 name];
        if (v23) {
          [(NSDictionary *)v19 setObject:v21 forKeyedSubscript:v23];
        }
        id v24 = v11[i];
        v11[i] = 0;
      }
    }
    v3 = v36;
    columns = v36->_columns;
    v36->_columns = v19;

    v3->_BOOL namedColumnsInitialized = 1;
    free(v33);
    v26 = v34 - 8;
    do
    {

      v7 -= 8;
    }
    while (v7);
  }

  v27 = [(NSDictionary *)v3->_columns allKeys];
  v28 = objc_msgSend(v27, "ef_filter:", &__block_literal_global_35);

  return v28;
}

uint64_t __23__EFSQLRow_columnNames__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; i < [(EFSQLRow *)self columnCount]; ++i)
  {
    columns = self->_columns;
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:i];
    size_t v7 = [(NSDictionary *)columns objectForKeyedSubscript:v6];

    uint64_t v8 = NSString;
    if (v7)
    {
      objc_super v9 = [v7 name];
      uint64_t v10 = [v7 objectValue];
      uint64_t v11 = [v8 stringWithFormat:@"%lu:%@:%@", i, v9, v10];
      [v3 addObject:v11];
    }
    else
    {
      objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu:nil", i);
      [v3 addObject:v9];
    }
  }
  v12 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)EFSQLRow;
  uint64_t v13 = [(EFSQLRow *)&v17 debugDescription];
  uint64_t v14 = [v3 componentsJoinedByString:@"\n"];
  uint64_t v15 = [v12 stringWithFormat:@"%@(\n%@\n)", v13, v14];

  return v15;
}

- (id)_queryString
{
  id v2 = NSString;
  id v3 = sqlite3_sql(self->_statement);
  return (id)[v2 stringWithUTF8String:v3];
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (EFSQLPreparedStatement)preparedStatement
{
  return self->_preparedStatement;
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (BOOL)namedColumnsInitialized
{
  return self->_namedColumnsInitialized;
}

- (void)setNamedColumnsInitialized:(BOOL)a3
{
  self->_BOOL namedColumnsInitialized = a3;
}

- (void)setColumnCount:(unint64_t)a3
{
  self->_unint64_t columnCount = a3;
}

@end