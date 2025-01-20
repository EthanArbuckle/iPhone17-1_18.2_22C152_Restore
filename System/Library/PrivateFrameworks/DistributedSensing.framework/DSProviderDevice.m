@interface DSProviderDevice
- (BOOL)isResponsePending;
- (DSProviderDevice)initWithRapportDevice:(id)a3 queue:(id)a4;
- (void)setIsResponsePending:(BOOL)a3;
@end

@implementation DSProviderDevice

- (DSProviderDevice)initWithRapportDevice:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DSProviderDevice;
  result = [(DSRapportDevice *)&v5 initWithRapportDevice:a3 queue:a4];
  if (result) {
    result->_isResponsePending = 0;
  }
  return result;
}

- (BOOL)isResponsePending
{
  return self->_isResponsePending;
}

- (void)setIsResponsePending:(BOOL)a3
{
  self->_isResponsePending = a3;
}

@end