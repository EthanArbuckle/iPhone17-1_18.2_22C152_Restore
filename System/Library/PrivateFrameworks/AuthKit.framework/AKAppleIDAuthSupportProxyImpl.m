@interface AKAppleIDAuthSupportProxyImpl
- (__AppleIDAuthSupportTokenData)appleIDAuthSupportTokenCreateWithExternalizedVersion:(id)a3 error:(id *)a4;
- (id)appleIDAuthSupportCopyAppTokensWithMasterToken:(__AppleIDAuthSupportTokenData *)a3 authURL:(id)a4 serviceIds:(id)a5 authParams:(id)a6 error:(id *)a7;
@end

@implementation AKAppleIDAuthSupportProxyImpl

- (__AppleIDAuthSupportTokenData)appleIDAuthSupportTokenCreateWithExternalizedVersion:(id)a3 error:(id *)a4
{
  v5 = (__AppleIDAuthSupportTokenData *)AppleIDAuthSupportTokenCreateWithExternalizedVersion();
  if (a4) {
    *a4 = 0;
  }
  return v5;
}

- (id)appleIDAuthSupportCopyAppTokensWithMasterToken:(__AppleIDAuthSupportTokenData *)a3 authURL:(id)a4 serviceIds:(id)a5 authParams:(id)a6 error:(id *)a7
{
  v8 = (void *)AppleIDAuthSupportCopyAppTokensOptions();
  if (a7) {
    *a7 = 0;
  }

  return v8;
}

@end