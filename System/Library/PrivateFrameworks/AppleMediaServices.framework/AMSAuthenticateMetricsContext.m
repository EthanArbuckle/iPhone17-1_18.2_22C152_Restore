@interface AMSAuthenticateMetricsContext
- (ACAccount)account;
- (AMSAuthenticateMetricsContext)initWithOptions:(id)a3 account:(id)a4;
- (AMSAuthenticateOptions)options;
- (BOOL)isServerRequested;
- (NSError)error;
- (void)setAccount:(id)a3;
- (void)setError:(id)a3;
- (void)setIsServerRequested:(BOOL)a3;
- (void)setOptions:(id)a3;
@end

@implementation AMSAuthenticateMetricsContext

- (AMSAuthenticateMetricsContext)initWithOptions:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAuthenticateMetricsContext;
  v9 = [(AMSAuthenticateMetricsContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a4);
    objc_storeStrong((id *)&v10->_options, a3);
  }

  return v10;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isServerRequested
{
  return self->_isServerRequested;
}

- (void)setIsServerRequested:(BOOL)a3
{
  self->_isServerRequested = a3;
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end