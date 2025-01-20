@interface _WKAuthenticationExtensionsClientInputs
- (NSString)appid;
- (void)dealloc;
- (void)setAppid:(id)a3;
@end

@implementation _WKAuthenticationExtensionsClientInputs

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKAuthenticationExtensionsClientInputs;
  [(_WKAuthenticationExtensionsClientInputs *)&v3 dealloc];
}

- (NSString)appid
{
  return self->_appid;
}

- (void)setAppid:(id)a3
{
}

@end