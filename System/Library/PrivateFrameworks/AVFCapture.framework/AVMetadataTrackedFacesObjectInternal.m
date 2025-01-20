@interface AVMetadataTrackedFacesObjectInternal
- (NSDictionary)payload;
- (void)dealloc;
- (void)setPayload:(id)a3;
@end

@implementation AVMetadataTrackedFacesObjectInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataTrackedFacesObjectInternal;
  [(AVMetadataTrackedFacesObjectInternal *)&v3 dealloc];
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

@end