@interface NSCloudKitMirroringResetMetadataRequest
- (NSSet)objectIDsToReset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setObjectIDsToReset:(id)a3;
@end

@implementation NSCloudKitMirroringResetMetadataRequest

- (void)dealloc
{
  self->_objectIDsToReset = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringResetMetadataRequest;
  [(NSCloudKitMirroringRequest *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringResetMetadataRequest;
  v4 = [(NSCloudKitMirroringRequest *)&v6 copyWithZone:a3];
  v4[10] = self->_objectIDsToReset;
  return v4;
}

- (NSSet)objectIDsToReset
{
  return self->_objectIDsToReset;
}

- (void)setObjectIDsToReset:(id)a3
{
}

@end