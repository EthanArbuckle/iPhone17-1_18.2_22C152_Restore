@interface CCDatabaseValueRow
- (CCDatabaseValueRow)init;
- (CCDatabaseValueRow)initWithDatabaseValueArray:(id)a3;
- (id)dataValueAtColumnIndex:(unint64_t)a3;
- (id)description;
- (id)numberValueAtColumnIndex:(unint64_t)a3;
- (id)stringValueAtColumnIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation CCDatabaseValueRow

- (void).cxx_destruct
{
}

- (unint64_t)count
{
  return [(NSArray *)self->_databaseValueArray count];
}

- (CCDatabaseValueRow)initWithDatabaseValueArray:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCDatabaseValueRow;
  v6 = [(CCDatabaseValueRow *)&v11 init];
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_databaseValueArray, a3), (databaseValueArray = v7->_databaseValueArray) != 0)
    && [(NSArray *)databaseValueArray count])
  {
    v9 = v7;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)numberValueAtColumnIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_databaseValueArray objectAtIndex:a3];
  v4 = objc_msgSend(v3, "databaseValue_toNumber");

  return v4;
}

- (id)stringValueAtColumnIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_databaseValueArray objectAtIndex:a3];
  v4 = objc_msgSend(v3, "databaseValue_toString");

  return v4;
}

- (id)dataValueAtColumnIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_databaseValueArray objectAtIndex:a3];
  v4 = objc_msgSend(v3, "databaseValue_toData");

  return v4;
}

- (CCDatabaseValueRow)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (id)description
{
  return [(NSArray *)self->_databaseValueArray description];
}

@end