@interface NSCloudKitMirroringExportProgressRequest
- (NSCloudKitMirroringExportProgressRequest)initWithOptions:(id)a3 completionBlock:(id)a4;
- (NSSet)objectIDsToFetch;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setObjectIDsToFetch:(id)a3;
@end

@implementation NSCloudKitMirroringExportProgressRequest

- (NSCloudKitMirroringExportProgressRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringExportProgressRequest;
  v4 = [(NSCloudKitMirroringRequest *)&v6 initWithOptions:a3 completionBlock:a4];
  if (v4) {
    v4->_objectIDsToFetch = (NSSet *)(id)NSSet_EmptySet;
  }
  return v4;
}

- (void)dealloc
{
  self->_objectIDsToFetch = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringExportProgressRequest;
  [(NSCloudKitMirroringRequest *)&v3 dealloc];
}

- (void)setObjectIDsToFetch:(id)a3
{
  objectIDsToFetch = self->_objectIDsToFetch;
  if (objectIDsToFetch != a3)
  {

    if (a3) {
      objc_super v6 = (NSSet *)[a3 copy];
    }
    else {
      objc_super v6 = (NSSet *)(id)NSSet_EmptySet;
    }
    self->_objectIDsToFetch = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringExportProgressRequest;
  v4 = [(NSCloudKitMirroringRequest *)&v6 copyWithZone:a3];

  v4[10] = self->_objectIDsToFetch;
  return v4;
}

- (NSSet)objectIDsToFetch
{
  return self->_objectIDsToFetch;
}

@end