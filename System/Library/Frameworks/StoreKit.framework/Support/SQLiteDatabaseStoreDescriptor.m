@interface SQLiteDatabaseStoreDescriptor
- (Class)sessionClass;
- (Class)transactionClass;
- (NSString)schemaName;
- (void)setSchemaName:(id)a3;
- (void)setSessionClass:(Class)a3;
- (void)setTransactionClass:(Class)a3;
@end

@implementation SQLiteDatabaseStoreDescriptor

- (void)setTransactionClass:(Class)a3
{
  self->_transactionClass = a3;
}

- (void)setSessionClass:(Class)a3
{
  self->_sessionClass = a3;
}

- (void)setSchemaName:(id)a3
{
}

- (Class)sessionClass
{
  return self->_sessionClass;
}

- (void).cxx_destruct
{
}

- (NSString)schemaName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (Class)transactionClass
{
  return self->_transactionClass;
}

@end