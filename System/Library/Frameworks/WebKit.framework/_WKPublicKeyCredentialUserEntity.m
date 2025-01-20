@interface _WKPublicKeyCredentialUserEntity
- (NSData)identifier;
- (NSString)displayName;
- (_WKPublicKeyCredentialUserEntity)initWithName:(id)a3 identifier:(id)a4 displayName:(id)a5;
- (void)dealloc;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation _WKPublicKeyCredentialUserEntity

- (_WKPublicKeyCredentialUserEntity)initWithName:(id)a3 identifier:(id)a4 displayName:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_WKPublicKeyCredentialUserEntity;
  v7 = [(_WKPublicKeyCredentialEntity *)&v10 initWithName:a3];
  v8 = v7;
  if (v7)
  {
    [(_WKPublicKeyCredentialUserEntity *)v7 setIdentifier:a4];
    [(_WKPublicKeyCredentialUserEntity *)v8 setDisplayName:a5];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialUserEntity;
  [(_WKPublicKeyCredentialEntity *)&v3 dealloc];
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

@end