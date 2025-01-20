@interface BMDSL(BMDSLPersistentDerivatives)
- (BMDSLPersistentDerivatives)trackDerivatesInDBAtURL:()BMDSLPersistentDerivatives derivedTableName:;
@end

@implementation BMDSL(BMDSLPersistentDerivatives)

- (BMDSLPersistentDerivatives)trackDerivatesInDBAtURL:()BMDSLPersistentDerivatives derivedTableName:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[BMDSLPersistentDerivatives alloc] initWithUpstream:a1 databaseURL:v7 derivedTableName:v6];

  return v8;
}

@end