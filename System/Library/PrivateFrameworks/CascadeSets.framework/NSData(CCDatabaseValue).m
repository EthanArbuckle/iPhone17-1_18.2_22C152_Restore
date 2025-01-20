@interface NSData(CCDatabaseValue)
- (id)databaseValue_toNumber;
- (id)databaseValue_toString;
- (uint64_t)databaseValue_blobRepresentationWithLength:()CCDatabaseValue;
- (uint64_t)databaseValue_type;
@end

@implementation NSData(CCDatabaseValue)

- (id)databaseValue_toString
{
  v1 = (void *)[[NSString alloc] initWithData:a1 encoding:4];

  return v1;
}

- (id)databaseValue_toNumber
{
  v1 = objc_msgSend(a1, "databaseValue_toString");
  v2 = objc_msgSend(v1, "databaseValue_toNumber");

  return v2;
}

- (uint64_t)databaseValue_type
{
  return 1;
}

- (uint64_t)databaseValue_blobRepresentationWithLength:()CCDatabaseValue
{
  if (a3) {
    *a3 = [a1 length];
  }
  id v4 = a1;

  return [v4 bytes];
}

@end