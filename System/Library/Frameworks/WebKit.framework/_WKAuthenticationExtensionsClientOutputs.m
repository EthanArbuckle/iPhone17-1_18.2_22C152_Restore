@interface _WKAuthenticationExtensionsClientOutputs
- (BOOL)appid;
- (_WKAuthenticationExtensionsClientOutputs)initWithAppid:(BOOL)a3;
@end

@implementation _WKAuthenticationExtensionsClientOutputs

- (_WKAuthenticationExtensionsClientOutputs)initWithAppid:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_WKAuthenticationExtensionsClientOutputs;
  result = [(_WKAuthenticationExtensionsClientOutputs *)&v5 init];
  if (result) {
    result->_appid = a3;
  }
  return result;
}

- (BOOL)appid
{
  return self->_appid;
}

@end