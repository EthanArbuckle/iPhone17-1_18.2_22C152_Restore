@interface SLAssistantWeiboPostDelegate
- (BOOL)responseDataIndicatesDuplicatePost:(id)a3 urlResponse:(id)a4;
- (NSBundle)locationPermissionBundle;
- (NSString)accountTypeIdentifier;
- (NSString)lastAccountIdentifier;
- (id)extractErrorDetailsFromResponseData:(id)a3 urlResponse:(id)a4;
- (id)requestForPostWithStatus:(id)a3 latitude:(id)a4 longitude:(id)a5;
- (void)verifyCredentialsForAccount:(id)a3 completion:(id)a4;
- (void)verifyGeotagSettingsForAccount:(id)a3 defaultSetting:(BOOL)a4 completion:(id)a5;
@end

@implementation SLAssistantWeiboPostDelegate

- (NSString)accountTypeIdentifier
{
  return ACAccountTypeIdentifierSinaWeibo;
}

- (NSString)lastAccountIdentifier
{
  return 0;
}

- (NSBundle)locationPermissionBundle
{
  id v2 = [@"/" stringByAppendingPathComponent:@"System/Library/Frameworks/Social.framework/XPCServices/com.apple.weibo.xpc"];

  return +[NSBundle bundleWithPath:v2];
}

- (id)requestForPostWithStatus:(id)a3 latitude:(id)a4 longitude:(id)a5
{
  return 0;
}

- (void)verifyCredentialsForAccount:(id)a3 completion:(id)a4
{
}

- (void)verifyGeotagSettingsForAccount:(id)a3 defaultSetting:(BOOL)a4 completion:(id)a5
{
}

- (id)extractErrorDetailsFromResponseData:(id)a3 urlResponse:(id)a4
{
  if ([a4 statusCode] != &stru_158.reloff) {
    return 0;
  }
  uint64_t v8 = 0;
  id v5 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v8];
  if (!v5) {
    return 0;
  }
  v6 = objc_opt_class();
  if (![v6 isSubclassOfClass:objc_opt_class()]) {
    return 0;
  }
  id result = [v5 objectForKey:@"error"];
  if (!result) {
    return 0;
  }
  return result;
}

- (BOOL)responseDataIndicatesDuplicatePost:(id)a3 urlResponse:(id)a4
{
  id v4 = [(SLAssistantWeiboPostDelegate *)self extractErrorDetailsFromResponseData:a3 urlResponse:a4];
  return v4 && ([v4 isWeiboDuplicatePostError] & 1) != 0;
}

@end