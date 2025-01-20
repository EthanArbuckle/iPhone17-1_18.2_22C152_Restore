@interface CCDatabaseValueRowEnumerator
- (CCDatabaseEnumerationResult)enumerationResult;
- (CCDatabaseValueRowEnumerator)initWithEnumerationResult:(id)a3;
- (id)error;
- (id)next;
- (id)peek;
@end

@implementation CCDatabaseValueRowEnumerator

- (id)next
{
  v2 = [(CCDatabaseEnumerationResult *)self->_enumerationResult next];
  if (v2) {
    v3 = [[CCDatabaseValueRow alloc] initWithDatabaseValueArray:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)error
{
  return [(CCDatabaseEnumerationResult *)self->_enumerationResult error];
}

- (CCDatabaseValueRowEnumerator)initWithEnumerationResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCDatabaseValueRowEnumerator;
  v6 = [(CCDatabaseValueRowEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_enumerationResult, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (id)peek
{
  v2 = [(CCDatabaseEnumerationResult *)self->_enumerationResult peek];
  if (v2) {
    v3 = [[CCDatabaseValueRow alloc] initWithDatabaseValueArray:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (CCDatabaseEnumerationResult)enumerationResult
{
  return self->_enumerationResult;
}

@end