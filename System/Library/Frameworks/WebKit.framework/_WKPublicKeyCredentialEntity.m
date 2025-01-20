@interface _WKPublicKeyCredentialEntity
- (NSString)icon;
- (NSString)name;
- (_WKPublicKeyCredentialEntity)initWithName:(id)a3;
- (void)dealloc;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
@end

@implementation _WKPublicKeyCredentialEntity

- (_WKPublicKeyCredentialEntity)initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_WKPublicKeyCredentialEntity;
  v4 = [(_WKPublicKeyCredentialEntity *)&v7 init];
  v5 = v4;
  if (v4) {
    [(_WKPublicKeyCredentialEntity *)v4 setName:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialEntity;
  [(_WKPublicKeyCredentialEntity *)&v3 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

@end