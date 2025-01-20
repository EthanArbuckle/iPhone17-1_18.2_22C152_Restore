@interface CDPStateHandlerResult
+ (id)resultWithCloudDataProtectionEnabled:(BOOL)a3 shouldCompleteSignIn:(BOOL)a4 error:(id)a5;
+ (id)resultWithCloudDataProtectionEnabled:(BOOL)a3 shouldCompleteSignIn:(BOOL)a4 peeriCloudKeychainState:(unint64_t)a5 error:(id)a6;
+ (id)resultWithError:(id)a3;
+ (id)successResult;
- (BOOL)cloudDataProtectionEnabled;
- (BOOL)shouldCompleteSignIn;
- (NSError)error;
- (unint64_t)peeriCloudKeychainState;
- (void)setCloudDataProtectionEnabled:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setPeeriCloudKeychainState:(unint64_t)a3;
- (void)setShouldCompleteSignIn:(BOOL)a3;
@end

@implementation CDPStateHandlerResult

+ (id)resultWithCloudDataProtectionEnabled:(BOOL)a3 shouldCompleteSignIn:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = objc_alloc_init((Class)objc_opt_class());
  [v8 setCloudDataProtectionEnabled:v6];
  [v8 setShouldCompleteSignIn:v5];
  [v8 setPeeriCloudKeychainState:0];
  [v8 setError:v7];

  return v8;
}

+ (id)resultWithCloudDataProtectionEnabled:(BOOL)a3 shouldCompleteSignIn:(BOOL)a4 peeriCloudKeychainState:(unint64_t)a5 error:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v9 = a6;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 setCloudDataProtectionEnabled:v8];
  [v10 setShouldCompleteSignIn:v7];
  [v10 setPeeriCloudKeychainState:a5];
  [v10 setError:v9];

  return v10;
}

+ (id)resultWithError:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() resultWithCloudDataProtectionEnabled:0 shouldCompleteSignIn:0 error:v3];

  return v4;
}

+ (id)successResult
{
  v2 = objc_opt_class();
  return (id)[v2 resultWithCloudDataProtectionEnabled:1 shouldCompleteSignIn:1 error:0];
}

- (BOOL)cloudDataProtectionEnabled
{
  return self->_cloudDataProtectionEnabled;
}

- (void)setCloudDataProtectionEnabled:(BOOL)a3
{
  self->_cloudDataProtectionEnabled = a3;
}

- (BOOL)shouldCompleteSignIn
{
  return self->_shouldCompleteSignIn;
}

- (void)setShouldCompleteSignIn:(BOOL)a3
{
  self->_shouldCompleteSignIn = a3;
}

- (unint64_t)peeriCloudKeychainState
{
  return self->_peeriCloudKeychainState;
}

- (void)setPeeriCloudKeychainState:(unint64_t)a3
{
  self->_peeriCloudKeychainState = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end