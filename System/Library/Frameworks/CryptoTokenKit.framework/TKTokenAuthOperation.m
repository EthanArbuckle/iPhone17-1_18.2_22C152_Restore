@interface TKTokenAuthOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)finishWithError:(NSError *)error;
- (Class)baseClassForUI;
- (NSError)authenticationError;
- (TKTokenAuthOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)importOperation:(id)a3;
- (void)setAuthenticationError:(id)a3;
@end

@implementation TKTokenAuthOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenAuthOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TKTokenAuthOperation;
  v5 = [(TKTokenAuthOperation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_authenticationError);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    authenticationError = v5->_authenticationError;
    v5->_authenticationError = (NSError *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  authenticationError = self->_authenticationError;
  id v4 = a3;
  NSStringFromSelector(sel_authenticationError);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:authenticationError forKey:v5];
}

- (BOOL)finishWithError:(NSError *)error
{
  return 1;
}

- (Class)baseClassForUI
{
  return 0;
}

- (void)importOperation:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      objc_super v11 = NSStringFromClass(v10);
      [v7 handleFailureInMethod:a2, self, @"TKTokenSession.m", 95, @"Attempt to import incompatible %@ into %@", v9, v11 object file lineNumber description];
    }
  }
  id v5 = [v12 authenticationError];
  authenticationError = self->_authenticationError;
  self->_authenticationError = v5;
}

- (NSError)authenticationError
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAuthenticationError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end