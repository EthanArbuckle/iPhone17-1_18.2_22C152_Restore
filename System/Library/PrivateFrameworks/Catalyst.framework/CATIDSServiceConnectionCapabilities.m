@interface CATIDSServiceConnectionCapabilities
- (BOOL)supportsReliableDelivery;
- (CATIDSServiceConnectionCapabilities)init;
- (CATIDSServiceConnectionCapabilities)initWithMessagingVersion:(unint64_t)a3;
@end

@implementation CATIDSServiceConnectionCapabilities

- (CATIDSServiceConnectionCapabilities)init
{
  return [(CATIDSServiceConnectionCapabilities *)self initWithMessagingVersion:2];
}

- (CATIDSServiceConnectionCapabilities)initWithMessagingVersion:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CATIDSServiceConnectionCapabilities;
  result = [(CATIDSServiceConnectionCapabilities *)&v5 init];
  if (result) {
    result->_supportsReliableDelivery = a3 > 1;
  }
  return result;
}

- (BOOL)supportsReliableDelivery
{
  return self->_supportsReliableDelivery;
}

@end