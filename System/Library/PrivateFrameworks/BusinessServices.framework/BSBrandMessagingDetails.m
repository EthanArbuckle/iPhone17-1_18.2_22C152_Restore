@interface BSBrandMessagingDetails
- (NSString)localizedResponseTime;
@end

@implementation BSBrandMessagingDetails

- (NSString)localizedResponseTime
{
  if (self) {
    self = (BSBrandMessagingDetails *)self->_shim;
  }
  return [(BSBrandMessagingDetails *)self localizedResponseTime];
}

- (void).cxx_destruct
{
}

@end