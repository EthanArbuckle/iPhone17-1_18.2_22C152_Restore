@interface IMEventListenerResponse
- (BOOL)didSucceed;
- (IMEventListenerResponse)initWithSuccess:(BOOL)a3 userInfo:(id)a4 error:(id)a5;
- (NSDictionary)userInfo;
- (NSError)error;
- (NSString)description;
- (void)setError:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation IMEventListenerResponse

- (IMEventListenerResponse)initWithSuccess:(BOOL)a3 userInfo:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMEventListenerResponse;
  v11 = [(IMEventListenerResponse *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userInfo, a4);
    objc_storeStrong((id *)&v12->_error, a5);
    if (v10) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = a3;
    }
    v12->_success = v13;
  }

  return v12;
}

- (NSString)description
{
  v3 = NSString;
  if ([(IMEventListenerResponse *)self didSucceed]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v5 = [(IMEventListenerResponse *)self error];
  v6 = [(IMEventListenerResponse *)self userInfo];
  v7 = [v3 stringWithFormat:@"command succeeded: %@, error: %@, userInfo: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)didSucceed
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end