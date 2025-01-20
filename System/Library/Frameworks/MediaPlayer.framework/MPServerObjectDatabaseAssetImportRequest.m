@interface MPServerObjectDatabaseAssetImportRequest
- (BOOL)performWithDatabaseOperations:(id)a3 error:(id *)a4;
@end

@implementation MPServerObjectDatabaseAssetImportRequest

- (BOOL)performWithDatabaseOperations:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v6 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"MPServerObjectDatabaseImportRequest.m", 803, @"Subclass %@ must implement -%@ defined in %@.", v10, v11, @"[MPServerObjectDatabaseAssetImportRequest class]" object file lineNumber description];
  }
  return 0;
}

@end