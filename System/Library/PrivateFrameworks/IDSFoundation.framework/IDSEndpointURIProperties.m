@interface IDSEndpointURIProperties
- (IDSEndpointURIProperties)init;
- (NSString)senderCorrelationIdentifier;
- (NSString)shortHandle;
- (void)setSenderCorrelationIdentifier:(id)a3;
- (void)setShortHandle:(id)a3;
@end

@implementation IDSEndpointURIProperties

- (IDSEndpointURIProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSEndpointURIProperties;
  return [(IDSEndpointURIProperties *)&v3 init];
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
}

- (NSString)shortHandle
{
  return self->_shortHandle;
}

- (void)setShortHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortHandle, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
}

@end