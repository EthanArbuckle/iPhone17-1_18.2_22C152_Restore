@interface AASignInWithAppleManagementUIRequest
- (BOOL)_isPasswordAppInstalled;
- (id)urlRequest;
- (id)urlString;
- (void)_isPasswordAppInstalled;
@end

@implementation AASignInWithAppleManagementUIRequest

- (id)urlString
{
  v2 = [MEMORY[0x1E4F4F0C8] sharedBag];
  if (objc_opt_respondsToSelector())
  {
    v3 = [MEMORY[0x1E4F4F0C8] sharedBag];
    v4 = [v3 siwaManagementURL];
    v5 = [v4 absoluteString];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)urlRequest
{
  BOOL v3 = [(AASignInWithAppleManagementUIRequest *)self _isPasswordAppInstalled];
  v8.receiver = self;
  v8.super_class = (Class)AASignInWithAppleManagementUIRequest;
  v4 = [(AAAppleIDSettingsRequest *)&v8 urlRequest];
  v5 = (void *)[v4 mutableCopy];

  v6 = kAATrueString;
  if (!v3) {
    v6 = kAAFalseString;
  }
  [v5 addValue:*v6 forHTTPHeaderField:@"X-Apple-I-PAI"];

  return v5;
}

- (BOOL)_isPasswordAppInstalled
{
  id v8 = 0;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.Passwords" allowPlaceholder:1 error:&v8];
  id v3 = v8;
  if (v2)
  {
    v4 = [v2 applicationState];
    if ([v4 isInstalled])
    {
      char v5 = 1;
    }
    else
    {
      v6 = [v2 applicationState];
      char v5 = [v6 isPlaceholder];
    }
  }
  else
  {
    v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(AASignInWithAppleManagementUIRequest *)(uint64_t)v3 _isPasswordAppInstalled];
    }
    char v5 = 0;
  }

  return v5;
}

- (void)_isPasswordAppInstalled
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  id v3 = @"com.apple.Passwords";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "Error creating appRecord for %@. %@", (uint8_t *)&v2, 0x16u);
}

@end