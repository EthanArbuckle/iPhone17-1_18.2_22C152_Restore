@interface CKFetchTranscodeServerPublicKeyOperationInfo
- (NSString)transcodeServerHostname;
- (int64_t)type;
- (void)setTranscodeServerHostname:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CKFetchTranscodeServerPublicKeyOperationInfo

- (NSString)transcodeServerHostname
{
  return self->_transcodeServerHostname;
}

- (void)setTranscodeServerHostname:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end