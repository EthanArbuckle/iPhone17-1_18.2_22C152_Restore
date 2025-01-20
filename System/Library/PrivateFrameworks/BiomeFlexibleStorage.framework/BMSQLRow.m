@interface BMSQLRow
- (BMSQLRow)initWithValues:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)allValues;
- (id)description;
- (id)valueAtIdx:(unint64_t)a3;
- (id)values;
- (int64_t)columnCount;
- (unint64_t)hash;
- (void)setAllValues:(id)a3;
@end

@implementation BMSQLRow

- (BMSQLRow)initWithValues:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSQLRow;
  v5 = [(BMSQLRow *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    allValues = v5->_allValues;
    v5->_allValues = (NSMutableArray *)v6;
  }
  return v5;
}

- (id)valueAtIdx:(unint64_t)a3
{
  id v4 = [(BMSQLRow *)self allValues];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)columnCount
{
  v2 = [(BMSQLRow *)self allValues];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)values
{
  v2 = [(BMSQLRow *)self allValues];
  int64_t v3 = (void *)[v2 copy];

  return v3;
}

- (id)description
{
  v2 = [(BMSQLRow *)self values];
  int64_t v3 = [v2 description];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 values];
    uint64_t v6 = [(BMSQLRow *)self values];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_allValues hash];
}

- (NSMutableArray)allValues
{
  return self->_allValues;
}

- (void)setAllValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end