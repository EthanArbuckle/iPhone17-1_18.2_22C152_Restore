@interface INCExtensionError
- (INCExtensionError)initWithErrorCode:(int64_t)a3 underlyingError:(id)a4;
- (NSError)underlyingError;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setUnderlyingError:(id)a3;
@end

@implementation INCExtensionError

- (void).cxx_destruct
{
}

- (void)setUnderlyingError:(id)a3
{
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (INCExtensionError)initWithErrorCode:(int64_t)a3 underlyingError:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INCExtensionError;
  v7 = [(INCExtensionError *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_errorCode = a3;
    uint64_t v9 = [v6 copy];
    underlyingError = v8->_underlyingError;
    v8->_underlyingError = (NSError *)v9;
  }
  return v8;
}

@end