@interface BPSPublisher(BMPersistentDerivatives)
- (BMPersistentDerivatives)trackDerivativesInDatabaseWithURL:()BMPersistentDerivatives derivedTableName:;
@end

@implementation BPSPublisher(BMPersistentDerivatives)

- (BMPersistentDerivatives)trackDerivativesInDatabaseWithURL:()BMPersistentDerivatives derivedTableName:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[BMPersistentDerivatives alloc] initWithUpstream:a1 derivativeDatabaseURL:v7 derivedTableName:v6];

  return v8;
}

@end