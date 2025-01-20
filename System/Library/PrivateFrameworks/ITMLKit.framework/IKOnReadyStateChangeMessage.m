@interface IKOnReadyStateChangeMessage
- (IKOnReadyStateChangeMessage)initWithReadyState:(unsigned int)a3 statusCode:(unsigned int)a4 statusText:(id)a5 error:(id)a6;
- (NSError)error;
- (NSString)statusText;
- (unsigned)readyState;
- (unsigned)statusCode;
- (void)setError:(id)a3;
- (void)setStatusText:(id)a3;
@end

@implementation IKOnReadyStateChangeMessage

- (IKOnReadyStateChangeMessage)initWithReadyState:(unsigned int)a3 statusCode:(unsigned int)a4 statusText:(id)a5 error:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IKOnReadyStateChangeMessage;
  v12 = [(IKOnReadyStateChangeMessage *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_readyState = a3;
    v12->_statusCode = a4;
    uint64_t v14 = [v10 copy];
    statusText = v13->_statusText;
    v13->_statusText = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    error = v13->_error;
    v13->_error = (NSError *)v16;
  }
  return v13;
}

- (unsigned)readyState
{
  return self->_readyState;
}

- (unsigned)statusCode
{
  return self->_statusCode;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
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
  objc_storeStrong((id *)&self->_statusText, 0);
}

@end