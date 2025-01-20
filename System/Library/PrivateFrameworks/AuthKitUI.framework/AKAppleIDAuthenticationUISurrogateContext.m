@interface AKAppleIDAuthenticationUISurrogateContext
- (AKAppleIDAuthenticationUISurrogateContext)initWithSurrogateID:(id)a3;
@end

@implementation AKAppleIDAuthenticationUISurrogateContext

- (AKAppleIDAuthenticationUISurrogateContext)initWithSurrogateID:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithUUIDString:v5];

  v7 = (AKAppleIDAuthenticationUISurrogateContext *)[(AKAppleIDAuthenticationUISurrogateContext *)self _initWithIdentifier:v6];
  return v7;
}

@end