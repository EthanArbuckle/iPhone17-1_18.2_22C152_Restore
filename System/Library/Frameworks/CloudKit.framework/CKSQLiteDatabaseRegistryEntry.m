@interface CKSQLiteDatabaseRegistryEntry
- (NSData)uniquingKey;
- (NSNumber)databaseID;
- (NSString)databaseDirectory;
- (void)setDatabaseDirectory:(id)a3;
- (void)setDatabaseID:(id)a3;
- (void)setUniquingKey:(id)a3;
@end

@implementation CKSQLiteDatabaseRegistryEntry

- (NSNumber)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(id)a3
{
}

- (NSData)uniquingKey
{
  return self->_uniquingKey;
}

- (void)setUniquingKey:(id)a3
{
}

- (NSString)databaseDirectory
{
  return self->_databaseDirectory;
}

- (void)setDatabaseDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
  objc_storeStrong((id *)&self->_uniquingKey, 0);

  objc_storeStrong((id *)&self->_databaseID, 0);
}

@end