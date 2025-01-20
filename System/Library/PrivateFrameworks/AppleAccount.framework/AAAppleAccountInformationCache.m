@interface AAAppleAccountInformationCache
- (AAAppleAccountInformationCache)init;
- (BOOL)isSignedIn;
- (NSString)accountFullName;
- (NSString)profilePictureCacheURL;
@end

@implementation AAAppleAccountInformationCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePictureCacheURL, 0);

  objc_storeStrong((id *)&self->_accountFullName, 0);
}

- (BOOL)isSignedIn
{
  return self->_isSignedIn;
}

- (AAAppleAccountInformationCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)AAAppleAccountInformationCache;
  v2 = [(AAAppleAccountInformationCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = CFPreferencesCopyAppValue(@"AAAccountFullName", @"com.apple.appleaccount.informationcache");
    accountFullName = v2->_accountFullName;
    v2->_accountFullName = (NSString *)v3;

    v2->_isSignedIn = CFPreferencesCopyAppValue(@"AAIsAccountSignedIn", @"com.apple.appleaccount.informationcache") != 0;
    uint64_t v5 = CFPreferencesCopyAppValue(@"AAProfilePictureCacheURL", @"com.apple.appleaccount.informationcache");
    profilePictureCacheURL = v2->_profilePictureCacheURL;
    v2->_profilePictureCacheURL = (NSString *)v5;
  }
  return v2;
}

- (NSString)accountFullName
{
  return self->_accountFullName;
}

- (NSString)profilePictureCacheURL
{
  return self->_profilePictureCacheURL;
}

@end