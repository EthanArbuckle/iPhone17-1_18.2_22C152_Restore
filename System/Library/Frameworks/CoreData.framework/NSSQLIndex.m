@interface NSSQLIndex
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnique;
- (NSFetchIndexDescription)indexDescription;
- (NSSQLEntity)sqlEntity;
- (id)bulkUpdateStatementsForStore:(id)a3;
- (id)dropStatementsForStore:(id)a3;
- (id)generateStatementsForStore:(id)a3;
- (id)initForIndexDescription:(id)a3 sqlEntity:(id)a4;
- (void)dealloc;
@end

@implementation NSSQLIndex

- (id)initForIndexDescription:(id)a3 sqlEntity:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NSSQLIndex;
  v6 = [(NSSQLIndex *)&v8 init];
  if (v6)
  {
    v6->_indexDescription = (NSFetchIndexDescription *)a3;
    v6->_sqlEntity = (NSSQLEntity *)a4;
  }
  return v6;
}

- (void)dealloc
{
  self->_createStrings = 0;
  self->_dropStrings = 0;

  self->_updateStrings = 0;
  self->_indexDescription = 0;
  self->_sqlEntity = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLIndex;
  [(NSSQLIndex *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  sqlEntity = self->_sqlEntity;
  if (sqlEntity != (NSSQLEntity *)[a3 sqlEntity]) {
    return 0;
  }
  indexDescription = self->_indexDescription;
  uint64_t v8 = [a3 indexDescription];
  if (indexDescription == (NSFetchIndexDescription *)v8) {
    return 1;
  }
  uint64_t v9 = v8;
  BOOL result = 0;
  if (indexDescription && v9)
  {
    return -[NSFetchIndexDescription isEqual:](indexDescription, "isEqual:");
  }
  return result;
}

- (id)generateStatementsForStore:(id)a3
{
  return 0;
}

- (id)dropStatementsForStore:(id)a3
{
  return 0;
}

- (id)bulkUpdateStatementsForStore:(id)a3
{
  return 0;
}

- (BOOL)isUnique
{
  return -[NSFetchIndexDescription _isUnique]((uint64_t)self->_indexDescription);
}

- (NSFetchIndexDescription)indexDescription
{
  return self->_indexDescription;
}

- (NSSQLEntity)sqlEntity
{
  return self->_sqlEntity;
}

@end