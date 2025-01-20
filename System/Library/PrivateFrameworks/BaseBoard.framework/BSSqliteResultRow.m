@interface BSSqliteResultRow
+ (void)resultRowWithStatement:(uint64_t)a1;
- (BOOL)isValid;
- (BSSqliteResultRow)init;
- (double)doubleAtIndex:(unint64_t)a3;
- (double)doubleForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataAtIndex:(unint64_t)a3;
- (id)dataForKey:(id)a3;
- (id)keyAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectForKey:(id)a3;
- (id)stringAtIndex:(unint64_t)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerAtIndex:(unint64_t)a3;
- (int64_t)integerForKey:(id)a3;
- (unint64_t)count;
- (void)_indexForKey:(void *)a1;
- (void)invalidate;
@end

@implementation BSSqliteResultRow

- (void).cxx_destruct
{
}

- (void)invalidate
{
  self->_statement = 0;
}

+ (void)resultRowWithStatement:(uint64_t)a1
{
  v3 = (objc_class *)self;
  if (!a2)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:sel_resultRowWithStatement_, v3, @"BSSqliteResultRow.m", 46, @"Invalid parameter not satisfying: %@", @"statement" object file lineNumber description];
  }
  v4 = [v3 alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)BSSqliteResultRow;
    v4 = objc_msgSendSuper2(&v7, sel_init);
    if (v4) {
      v4[1] = a2;
    }
  }
  return v4;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSSqliteResultRow.m", 75, @"cannot call %s after the row has become invalid", "-[BSSqliteResultRow objectAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    v5 = 0;
  }
  else
  {
    switch(sqlite3_column_type(self->_statement, a3))
    {
      case 1:
        v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BSSqliteResultRow integerAtIndex:](self, "integerAtIndex:", a3));
        break;
      case 2:
        objc_super v7 = NSNumber;
        [(BSSqliteResultRow *)self doubleAtIndex:a3];
        v5 = objc_msgSend(v7, "numberWithDouble:");
        break;
      case 3:
        v5 = [(BSSqliteResultRow *)self stringAtIndex:a3];
        break;
      case 4:
        v5 = [(BSSqliteResultRow *)self dataAtIndex:a3];
        break;
      case 5:
        v5 = [MEMORY[0x1E4F1CA98] null];
        break;
      default:
        goto LABEL_4;
    }
  }
  return v5;
}

- (id)dataAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSSqliteResultRow.m", 140, @"cannot call %s after the row has become invalid", "-[BSSqliteResultRow dataAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    int v6 = sqlite3_column_bytes(self->_statement, a3);
    v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", sqlite3_column_blob(self->_statement, a3), v6);
  }
  return v5;
}

- (BSSqliteResultRow)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSSqliteResultRow.m" lineNumber:32 description:@"init is not allowed"];

  if (!self) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BSSqliteResultRow;
  result = [(BSSqliteResultRow *)&v6 init];
  if (result) {
    result->_statement = 0;
  }
  return result;
}

- (BOOL)isValid
{
  return self->_statement != 0;
}

- (unint64_t)count
{
  statement = self->_statement;
  if (!statement)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSSqliteResultRow.m", 61, @"cannot call %s after the row has become invalid", "-[BSSqliteResultRow count]");

    statement = self->_statement;
  }
  return sqlite3_column_count(statement);
}

- (id)keyAtIndex:(unint64_t)a3
{
  int v3 = a3;
  statement = self->_statement;
  if (!statement)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSSqliteResultRow.m", 66, @"cannot call %s after the row has become invalid", "-[BSSqliteResultRow keyAtIndex:]");

    statement = self->_statement;
  }
  objc_super v6 = NSString;
  objc_super v7 = sqlite3_column_name(statement, v3);
  return (id)[v6 stringWithUTF8String:v7];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = -[BSSqliteResultRow objectAtIndex:](self, "objectAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));

  return v5;
}

- (void)_indexForKey:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)a1[2];
    if (!v4)
    {
      uint64_t v5 = [a1 count];
      objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
      if (v5)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          v8 = [a1 keyAtIndex:i];
          [v6 addObject:v8];
        }
      }
      uint64_t v9 = [v6 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;

      id v4 = (void *)a1[2];
    }
    id v11 = v4;
    a1 = (void *)[v11 indexOfObject:v3];
  }
  return a1;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[BSSqliteResultRow integerAtIndex:](self, "integerAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));

  return v5;
}

- (int64_t)integerAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSSqliteResultRow.m", 102, @"cannot call %s after the row has become invalid", "-[BSSqliteResultRow integerAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  statement = self->_statement;
  return sqlite3_column_int64(statement, a3);
}

- (double)doubleForKey:(id)a3
{
  id v4 = a3;
  -[BSSqliteResultRow doubleAtIndex:](self, "doubleAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));
  double v6 = v5;

  return v6;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSSqliteResultRow.m", 114, @"cannot call %s after the row has become invalid", "-[BSSqliteResultRow doubleAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0.0;
  }
  statement = self->_statement;
  return sqlite3_column_double(statement, a3);
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  double v5 = -[BSSqliteResultRow stringAtIndex:](self, "stringAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));

  return v5;
}

- (id)stringAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSSqliteResultRow.m", 126, @"cannot call %s after the row has become invalid", "-[BSSqliteResultRow stringAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = 0;
  }
  else
  {
    int v6 = sqlite3_column_bytes(self->_statement, a3);
    double v5 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", sqlite3_column_text(self->_statement, a3), v6, 4);
  }
  return v5;
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  double v5 = -[BSSqliteResultRow dataAtIndex:](self, "dataAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BSSqliteFrozenResultRow allocWithZone:a3];
  double v5 = self;
  int v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:sel__initWithResultRow_, v4, @"BSSqliteResultRow.m", 192, @"Invalid parameter not satisfying: %@", @"resultRow" object file lineNumber description];
    }
    v37.receiver = v4;
    v37.super_class = (Class)BSSqliteResultRow;
    objc_super v7 = [(BSSqliteResultRow *)&v37 init];
    v8 = v7;
    if (v7)
    {
      v7->_statement = 0;
      v7[1].super.Class isa = (Class)[(BSSqliteResultRow *)v6 count];
      v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8[1].super.isa];
      v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8[1].super.isa];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8[1].super.isa];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8[1].super.isa];
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8[1].super.isa];
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8[1].super.isa];
      if (v8[1].super.isa)
      {
        v13 = 0;
        do
        {
          v14 = [(BSSqliteResultRow *)v6 keyAtIndex:v13];
          [v36 addObject:v14];

          v15 = [(BSSqliteResultRow *)v6 objectAtIndex:v13];
          [v35 addObject:v15];

          v16 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BSSqliteResultRow integerAtIndex:](v6, "integerAtIndex:", v13));
          [v9 addObject:v16];

          v17 = NSNumber;
          [(BSSqliteResultRow *)v6 doubleAtIndex:v13];
          v18 = objc_msgSend(v17, "numberWithDouble:");
          [v10 addObject:v18];

          v19 = [(BSSqliteResultRow *)v6 stringAtIndex:v13];
          [v11 addObject:v19];

          v20 = [(BSSqliteResultRow *)v6 dataAtIndex:v13];
          [v12 addObject:v20];

          v13 = (objc_class *)((char *)v13 + 1);
        }
        while (v13 < v8[1].super.isa);
      }
      uint64_t v21 = [v36 copy];
      statement = v8[1]._statement;
      v8[1]._statement = (sqlite3_stmt *)v21;

      uint64_t v23 = [v35 copy];
      columnNames = v8[1]._columnNames;
      v8[1]._columnNames = (NSArray *)v23;

      uint64_t v25 = [v9 copy];
      Class isa = v8[2].super.isa;
      v8[2].super.Class isa = (Class)v25;

      uint64_t v27 = [v10 copy];
      v28 = v8[2]._statement;
      v8[2]._statement = (sqlite3_stmt *)v27;

      uint64_t v29 = [v11 copy];
      v30 = v8[2]._columnNames;
      v8[2]._columnNames = (NSArray *)v29;

      uint64_t v31 = [v12 copy];
      Class v32 = v8[3].super.isa;
      v8[3].super.Class isa = (Class)v31;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end