@interface MPServerObjectDatabaseMetadataImportRequest
+ (id)_entityTypeForObject:(id)a3;
- (id)performWithDatabaseOperations:(id)a3 augmentingPayload:(id *)a4;
@end

@implementation MPServerObjectDatabaseMetadataImportRequest

- (id)performWithDatabaseOperations:(id)a3 augmentingPayload:(id *)a4
{
  uint64_t v7 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v7 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"MPServerObjectDatabaseImportRequest.m", 137, @"Subclass %@ must implement -%@ defined in %@.", v12, v13, @"[MPServerObjectDatabaseMetadataImportRequest class]" object file lineNumber description];
  }
  v8 = [[MPServerObjectDatabaseImportResult alloc] initWithAnnotatedPayload:a4 playableAssetIdentifiers:0 error:0];

  return v8;
}

+ (id)_entityTypeForObject:(id)a3
{
  return 0;
}

@end