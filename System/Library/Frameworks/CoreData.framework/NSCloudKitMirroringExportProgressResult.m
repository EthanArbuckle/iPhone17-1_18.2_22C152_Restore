@interface NSCloudKitMirroringExportProgressResult
- (NSCloudKitMirroringExportProgressResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 objectIDToLastExportedToken:(id)a5 error:(id)a6;
- (NSDictionary)objectIDToLastExportedToken;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringExportProgressResult

- (NSCloudKitMirroringExportProgressResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 objectIDToLastExportedToken:(id)a5 error:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)NSCloudKitMirroringExportProgressResult;
  v7 = [(NSCloudKitMirroringResult *)&v9 initWithRequest:a3 storeIdentifier:a4 success:a5 != 0 madeChanges:0 error:a6];
  if (v7) {
    v7->_objectIDToLastExportedToken = (NSDictionary *)a5;
  }
  return v7;
}

- (void)dealloc
{
  self->_objectIDToLastExportedToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringExportProgressResult;
  [(NSCloudKitMirroringResult *)&v3 dealloc];
}

- (NSDictionary)objectIDToLastExportedToken
{
  return self->_objectIDToLastExportedToken;
}

@end