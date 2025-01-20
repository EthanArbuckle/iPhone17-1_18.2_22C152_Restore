@interface CalError
- (CalError)initWithDictionary:(id)a3;
- (NSString)errorCode;
- (NSString)errorMessage;
- (NSString)errorTitle;
- (int64_t)retryAfter;
- (void)setErrorCode:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setErrorTitle:(id)a3;
- (void)setRetryAfter:(int64_t *)a3;
@end

@implementation CalError

- (CalError)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CalError;
  v5 = [(CalError *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"errorTitle"];
    errorTitle = v5->_errorTitle;
    v5->_errorTitle = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"errorMessage"];
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v8;
  }
  return v5;
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (void)setErrorTitle:(id)a3
{
}

- (int64_t)retryAfter
{
  return self->_retryAfter;
}

- (void)setRetryAfter:(int64_t *)a3
{
  self->_retryAfter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);

  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end