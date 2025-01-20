@interface NSNull(CCDatabaseValue)
- (uint64_t)databaseValue_toData;
- (uint64_t)databaseValue_toNumber;
- (uint64_t)databaseValue_toString;
- (uint64_t)databaseValue_type;
@end

@implementation NSNull(CCDatabaseValue)

- (uint64_t)databaseValue_type
{
  return 4;
}

- (uint64_t)databaseValue_toData
{
  return 0;
}

- (uint64_t)databaseValue_toString
{
  return 0;
}

- (uint64_t)databaseValue_toNumber
{
  return 0;
}

@end