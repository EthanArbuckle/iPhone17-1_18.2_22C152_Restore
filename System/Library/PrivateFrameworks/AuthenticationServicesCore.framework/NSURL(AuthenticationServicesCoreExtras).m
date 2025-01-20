@interface NSURL(AuthenticationServicesCoreExtras)
- (BOOL)as_isPasskeyRegistrationURL;
- (BOOL)as_isPasskeyURL;
- (int64_t)as_passkeyURLType;
@end

@implementation NSURL(AuthenticationServicesCoreExtras)

- (BOOL)as_isPasskeyURL
{
  return +[_ASCABLEQRCodeUtilities isPasskeyURL:a1];
}

- (BOOL)as_isPasskeyRegistrationURL
{
  return +[_ASCABLEQRCodeUtilities isPasskeyRegistrationURL:a1];
}

- (int64_t)as_passkeyURLType
{
  return +[_ASCABLEQRCodeUtilities passkeyURLTypeFromURL:a1];
}

@end