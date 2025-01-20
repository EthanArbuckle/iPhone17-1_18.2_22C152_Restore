@interface LNActionConfirmationRequest
+ (BOOL)supportsSecureCoding;
- (LNActionConfirmationRequest)initWithCoder:(id)a3;
- (LNActionConfirmationRequest)initWithIdentifier:(id)a3 systemStyle:(id)a4 result:(id)a5;
- (LNConfirmationSystemStyle)systemStyle;
- (LNSuccessResult)result;
- (NSUUID)identifier;
- (id)completionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)respondWithConfirmation:(BOOL)a3;
- (void)respondWithError:(id)a3;
- (void)respondWithUpdates:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation LNActionConfirmationRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_systemStyle, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (LNSuccessResult)result
{
  return self->_result;
}

- (LNConfirmationSystemStyle)systemStyle
{
  return self->_systemStyle;
}

- (LNActionConfirmationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemStyle"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = [(LNActionConfirmationRequest *)self initWithIdentifier:v5 systemStyle:v6 result:v7];
    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionConfirmationRequest *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNActionConfirmationRequest *)self systemStyle];
  [v4 encodeObject:v6 forKey:@"systemStyle"];

  id v7 = [(LNActionConfirmationRequest *)self result];
  [v4 encodeObject:v7 forKey:@"result"];
}

- (void)respondWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  completionHandler = (void (**)(id, void, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a3);
    id v5 = self->_completionHandler;
    self->_completionHandler = 0;
  }
  else
  {
    v6 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = objc_opt_class();
      BOOL v8 = [(LNActionConfirmationRequest *)self identifier];
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      v12 = v8;
    }
  }
}

- (void)respondWithUpdates:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_completionHandler)
  {
    id v5 = [LNActionConfirmationResponse alloc];
    v6 = [(LNActionConfirmationRequest *)self identifier];
    uint64_t v7 = [(LNActionConfirmationResponse *)v5 initWithIdentifier:v6 updates:v4];

    (*((void (**)(void))self->_completionHandler + 2))();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  else
  {
    uint64_t v7 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = [(LNActionConfirmationRequest *)self identifier];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      v14 = v10;
    }
  }
}

- (void)respondWithConfirmation:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    -[LNActionConfirmationRequest respondWithError:](self, "respondWithError:");
    goto LABEL_5;
  }
  if (self->_completionHandler)
  {
    id v4 = [LNActionConfirmationResponse alloc];
    id v5 = [(LNActionConfirmationRequest *)self identifier];
    uint64_t v10 = [(LNActionConfirmationResponse *)v4 initWithIdentifier:v5];

    (*((void (**)(void))self->_completionHandler + 2))();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

LABEL_5:

    return;
  }
  uint64_t v7 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [(LNActionConfirmationRequest *)self identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    v14 = v9;
  }
}

- (LNActionConfirmationRequest)initWithIdentifier:(id)a3 systemStyle:(id)a4 result:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"LNActionConfirmationRequest.m", 23, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)LNActionConfirmationRequest;
  __int16 v13 = [(LNActionConfirmationRequest *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_systemStyle, a4);
    uint64_t v15 = [v12 copy];
    v16 = v14->_result;
    v14->_result = (LNSuccessResult *)v15;

    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = 0;

    v18 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end