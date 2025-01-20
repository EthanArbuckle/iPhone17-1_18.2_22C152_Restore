@interface AMSSignInContext
- (AMSSignInContext)init;
- (BOOL)canMakeAccountActive;
- (BOOL)ignoreAccountConversion;
- (BOOL)skipAuthentication;
- (NSString)debugReason;
- (NSString)hashedDescription;
- (void)setCanMakeAccountActive:(BOOL)a3;
- (void)setDebugReason:(id)a3;
- (void)setIgnoreAccountConversion:(BOOL)a3;
- (void)setSkipAuthentication:(BOOL)a3;
@end

@implementation AMSSignInContext

- (AMSSignInContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSSignInContext;
  result = [(AMSSignInContext *)&v3 init];
  if (result) {
    *(_WORD *)&result->_canMakeAccountActive = 257;
  }
  return result;
}

- (NSString)hashedDescription
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(AMSSignInContext *)self canMakeAccountActive]) {
    v5 = @"true";
  }
  else {
    v5 = @"false";
  }
  v6 = [(AMSSignInContext *)self debugReason];
  if ([(AMSSignInContext *)self ignoreAccountConversion]) {
    v7 = @"true";
  }
  else {
    v7 = @"false";
  }
  if ([(AMSSignInContext *)self skipAuthentication]) {
    v8 = @"true";
  }
  else {
    v8 = @"false";
  }
  v9 = [v3 stringWithFormat:@"<%@: %p canMakeAccountActive = %@ | debugReason = %@ | ignoreAccountConversion = %@ | skipAuthentication = %@>", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)canMakeAccountActive
{
  return self->_canMakeAccountActive;
}

- (void)setCanMakeAccountActive:(BOOL)a3
{
  self->_canMakeAccountActive = a3;
}

- (NSString)debugReason
{
  return self->_debugReason;
}

- (void)setDebugReason:(id)a3
{
}

- (BOOL)ignoreAccountConversion
{
  return self->_ignoreAccountConversion;
}

- (void)setIgnoreAccountConversion:(BOOL)a3
{
  self->_ignoreAccountConversion = a3;
}

- (BOOL)skipAuthentication
{
  return self->_skipAuthentication;
}

- (void)setSkipAuthentication:(BOOL)a3
{
  self->_skipAuthentication = a3;
}

- (void).cxx_destruct
{
}

@end