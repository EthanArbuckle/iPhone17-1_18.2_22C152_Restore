@interface _WKPublicKeyCredentialRelyingPartyEntity
- (NSString)identifier;
- (_WKPublicKeyCredentialRelyingPartyEntity)initWithName:(id)a3;
- (void)dealloc;
- (void)setIdentifier:(id)a3;
@end

@implementation _WKPublicKeyCredentialRelyingPartyEntity

- (_WKPublicKeyCredentialRelyingPartyEntity)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_WKPublicKeyCredentialRelyingPartyEntity;
  return [(_WKPublicKeyCredentialEntity *)&v4 initWithName:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialRelyingPartyEntity;
  [(_WKPublicKeyCredentialEntity *)&v3 dealloc];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

@end