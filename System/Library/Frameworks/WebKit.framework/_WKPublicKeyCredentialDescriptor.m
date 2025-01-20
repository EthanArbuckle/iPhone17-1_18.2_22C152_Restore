@interface _WKPublicKeyCredentialDescriptor
- (NSArray)transports;
- (NSData)identifier;
- (_WKPublicKeyCredentialDescriptor)initWithIdentifier:(id)a3;
- (void)dealloc;
- (void)setIdentifier:(id)a3;
- (void)setTransports:(id)a3;
@end

@implementation _WKPublicKeyCredentialDescriptor

- (_WKPublicKeyCredentialDescriptor)initWithIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WKPublicKeyCredentialDescriptor;
  v4 = [(_WKPublicKeyCredentialDescriptor *)&v7 init];
  v5 = v4;
  if (v4) {
    [(_WKPublicKeyCredentialDescriptor *)v4 setIdentifier:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialDescriptor;
  [(_WKPublicKeyCredentialDescriptor *)&v3 dealloc];
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)transports
{
  return self->_transports;
}

- (void)setTransports:(id)a3
{
}

@end