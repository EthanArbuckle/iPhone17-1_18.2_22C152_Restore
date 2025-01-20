@interface AAFamilyEligibilityRequest
+ (Class)responseClass;
- (ACAccount)iTunesAccount;
- (id)urlRequest;
- (id)urlString;
- (void)setITunesAccount:(id)a3;
@end

@implementation AAFamilyEligibilityRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 familyEligibilityURL];

  return v3;
}

- (id)urlRequest
{
  v8.receiver = self;
  v8.super_class = (Class)AAFamilyEligibilityRequest;
  v3 = [(AAFamilyRequest *)&v8 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  if (!self->_iTunesAccount)
  {
    v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "No iTunes account provided to family eligibility request.", v7, 2u);
    }
  }

  return v4;
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setITunesAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end