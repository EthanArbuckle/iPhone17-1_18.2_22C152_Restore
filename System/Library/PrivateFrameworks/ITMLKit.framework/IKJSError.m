@interface IKJSError
- (IKJSError)initWithError:(id)a3 appContext:(id)a4;
- (IKJSError)underlyingError;
- (NSDictionary)userInfo;
- (NSError)wrappedError;
- (NSNumber)code;
- (NSString)description;
- (NSString)domain;
- (NSString)failureReason;
- (NSString)recoverySuggestion;
@end

@implementation IKJSError

- (IKJSError)initWithError:(id)a3 appContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(IKJSObject *)self initWithAppContext:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrappedError, a3);
    v11 = [(NSError *)v10->_wrappedError userInfo];
    v12 = [v11 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v12)
    {
      v13 = [[IKJSError alloc] initWithError:v12 appContext:v8];
      jsUnderlyingError = v10->_jsUnderlyingError;
      v10->_jsUnderlyingError = v13;

      v15 = [v8 jsContext];
      v16 = [v15 virtualMachine];
      [v16 addManagedReference:v10->_jsUnderlyingError withOwner:v10];
    }
  }

  return v10;
}

- (NSNumber)code
{
  v2 = NSNumber;
  v3 = [(IKJSError *)self wrappedError];
  v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "code"));

  return (NSNumber *)v4;
}

- (NSString)domain
{
  v2 = [(IKJSError *)self wrappedError];
  v3 = [v2 domain];

  return (NSString *)v3;
}

- (NSString)description
{
  v2 = [(IKJSError *)self wrappedError];
  v3 = [v2 localizedDescription];

  return (NSString *)v3;
}

- (NSString)failureReason
{
  v2 = [(IKJSError *)self wrappedError];
  v3 = [v2 localizedFailureReason];

  return (NSString *)v3;
}

- (NSString)recoverySuggestion
{
  v2 = [(IKJSError *)self wrappedError];
  v3 = [v2 localizedRecoverySuggestion];

  return (NSString *)v3;
}

- (NSDictionary)userInfo
{
  v2 = [(IKJSError *)self wrappedError];
  v3 = [v2 userInfo];

  return (NSDictionary *)v3;
}

- (IKJSError)underlyingError
{
  return self->_jsUnderlyingError;
}

- (NSError)wrappedError
{
  return self->_wrappedError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedError, 0);
  objc_storeStrong((id *)&self->_jsUnderlyingError, 0);
}

@end