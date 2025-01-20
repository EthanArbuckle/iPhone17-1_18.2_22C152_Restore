@interface NSCloudKitMirroringDelegateSetupResult
- (NSCloudKitMirroringDelegateSetupResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 error:(id)a6 container:(id)a7 database:(id)a8;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringDelegateSetupResult

- (NSCloudKitMirroringDelegateSetupResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 error:(id)a6 container:(id)a7 database:(id)a8
{
  v12.receiver = self;
  v12.super_class = (Class)NSCloudKitMirroringDelegateSetupResult;
  v10 = [(NSCloudKitMirroringResult *)&v12 initWithRequest:a3 storeIdentifier:a4 success:a5 madeChanges:0 error:a6];
  if (v10)
  {
    v10->_container = (CKContainer *)a7;
    v10->_database = (CKDatabase *)a8;
  }
  return v10;
}

- (void)dealloc
{
  self->_container = 0;
  self->_database = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegateSetupResult;
  [(NSCloudKitMirroringResult *)&v3 dealloc];
}

@end