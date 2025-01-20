@interface PHMockSenderIdentityClient
- (BOOL)isTTYSoftwareAvailableForSenderIdentityUUID:(id)a3;
- (BOOL)mockTTYAvailable;
- (void)setMockTTYAvailable:(BOOL)a3;
@end

@implementation PHMockSenderIdentityClient

- (BOOL)isTTYSoftwareAvailableForSenderIdentityUUID:(id)a3
{
  return [(PHMockSenderIdentityClient *)self mockTTYAvailable];
}

- (BOOL)mockTTYAvailable
{
  return self->_mockTTYAvailable;
}

- (void)setMockTTYAvailable:(BOOL)a3
{
  self->_mockTTYAvailable = a3;
}

@end