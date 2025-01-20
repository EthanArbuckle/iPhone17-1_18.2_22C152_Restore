@interface AVMetadataOfflineVideoStabilizationMotionObjectInternal
- (NSDictionary)payload;
- (void)dealloc;
- (void)setPayload:(id)a3;
@end

@implementation AVMetadataOfflineVideoStabilizationMotionObjectInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataOfflineVideoStabilizationMotionObjectInternal;
  [(AVMetadataOfflineVideoStabilizationMotionObjectInternal *)&v3 dealloc];
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

@end