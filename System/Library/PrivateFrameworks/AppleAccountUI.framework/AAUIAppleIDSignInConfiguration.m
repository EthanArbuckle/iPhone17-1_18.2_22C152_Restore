@interface AAUIAppleIDSignInConfiguration
- (AAUIAppleIDSignInConfiguration)initWithNavController:(id)a3;
- (AAUIServiceSignInConfiguration)signInConfiguration;
- (void)setLocalSecret:(id)a3;
- (void)setSignInConfiguration:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation AAUIAppleIDSignInConfiguration

- (AAUIAppleIDSignInConfiguration)initWithNavController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIAppleIDSignInConfiguration;
  v5 = [(AAUIAppleIDSignInConfiguration *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(AAUIServiceSignInConfiguration);
    signInConfiguration = v5->_signInConfiguration;
    v5->_signInConfiguration = v6;

    [(AAUIServiceSignInConfiguration *)v5->_signInConfiguration setNavigationController:v4];
  }

  return v5;
}

- (void)setUsername:(id)a3
{
}

- (void)setLocalSecret:(id)a3
{
}

- (AAUIServiceSignInConfiguration)signInConfiguration
{
  return self->_signInConfiguration;
}

- (void)setSignInConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end