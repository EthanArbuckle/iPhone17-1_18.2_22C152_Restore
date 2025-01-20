@interface LNConfirmationRequest
+ (BOOL)supportsSecureCoding;
- (LNConfirmationRequest)initWithCoder:(id)a3;
- (LNConfirmationRequest)initWithIdentifier:(id)a3 parameterName:(id)a4 value:(id)a5 dialog:(id)a6 viewSnippet:(id)a7;
- (LNDialog)dialog;
- (LNValue)value;
- (LNViewSnippet)viewSnippet;
- (NSString)parameterName;
- (NSUUID)identifier;
- (id)completionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)respondWithConfirmation:(BOOL)a3;
- (void)respondWithError:(id)a3;
- (void)respondWithUpdates:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation LNConfirmationRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_viewSnippet, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_parameterName, 0);
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

- (LNViewSnippet)viewSnippet
{
  return self->_viewSnippet;
}

- (LNDialog)dialog
{
  return self->_dialog;
}

- (LNValue)value
{
  return self->_value;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (LNConfirmationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dialog"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"viewSnippet"];

  v10 = 0;
  if (v5 && v6 && v7)
  {
    self = [(LNConfirmationRequest *)self initWithIdentifier:v5 parameterName:v6 value:v7 dialog:v8 viewSnippet:v9];
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNConfirmationRequest *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNConfirmationRequest *)self parameterName];
  [v4 encodeObject:v6 forKey:@"parameterName"];

  v7 = [(LNConfirmationRequest *)self value];
  [v4 encodeObject:v7 forKey:@"value"];

  v8 = [(LNConfirmationRequest *)self dialog];
  [v4 encodeObject:v8 forKey:@"dialog"];

  id v9 = [(LNConfirmationRequest *)self viewSnippet];
  [v4 encodeObject:v9 forKey:@"viewSnippet"];
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
      v8 = [(LNConfirmationRequest *)self identifier];
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
    id v5 = [LNConfirmationResponse alloc];
    v6 = [(LNConfirmationRequest *)self identifier];
    uint64_t v7 = [(LNConfirmationResponse *)v5 initWithIdentifier:v6 confirmed:0 updates:v4];

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
      uint64_t v10 = [(LNConfirmationRequest *)self identifier];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      v14 = v10;
    }
  }
}

- (void)respondWithConfirmation:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_completionHandler)
  {
    BOOL v4 = a3;
    id v5 = [LNConfirmationResponse alloc];
    v6 = [(LNConfirmationRequest *)self identifier];
    int v11 = [(LNConfirmationResponse *)v5 initWithIdentifier:v6 confirmed:v4 updates:0];

    (*((void (**)(void))self->_completionHandler + 2))();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  else
  {
    v8 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = [(LNConfirmationRequest *)self identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
    }
  }
}

- (LNConfirmationRequest)initWithIdentifier:(id)a3 parameterName:(id)a4 value:(id)a5 dialog:(id)a6 viewSnippet:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"LNConfirmationRequest.m", 26, @"Invalid parameter not satisfying: %@", @"parameterName" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"LNConfirmationRequest.m", 25, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"LNConfirmationRequest.m", 27, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

LABEL_4:
  v31.receiver = self;
  v31.super_class = (Class)LNConfirmationRequest;
  v19 = [(LNConfirmationRequest *)&v31 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_parameterName, a4);
    objc_storeStrong((id *)&v20->_value, a5);
    uint64_t v21 = [v17 copy];
    dialog = v20->_dialog;
    v20->_dialog = (LNDialog *)v21;

    uint64_t v23 = [v18 copy];
    viewSnippet = v20->_viewSnippet;
    v20->_viewSnippet = (LNViewSnippet *)v23;

    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = 0;

    v26 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end