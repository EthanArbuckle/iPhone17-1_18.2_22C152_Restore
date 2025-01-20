@interface LNNeedsValueRequest
+ (BOOL)supportsSecureCoding;
- (LNDialog)dialog;
- (LNNeedsValueRequest)initWithCoder:(id)a3;
- (LNNeedsValueRequest)initWithIdentifier:(id)a3 parameterName:(id)a4 dialog:(id)a5 viewSnippet:(id)a6;
- (LNViewSnippet)viewSnippet;
- (NSString)parameterName;
- (NSUUID)identifier;
- (id)completionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)respondWithError:(id)a3;
- (void)respondWithUpdates:(id)a3;
- (void)respondWithValue:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation LNNeedsValueRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_viewSnippet, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
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

- (NSString)parameterName
{
  return self->_parameterName;
}

- (LNNeedsValueRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dialog"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"viewSnippet"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    self = [(LNNeedsValueRequest *)self initWithIdentifier:v5 parameterName:v6 dialog:v7 viewSnippet:v8];
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNNeedsValueRequest *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNNeedsValueRequest *)self parameterName];
  [v4 encodeObject:v6 forKey:@"parameterName"];

  v7 = [(LNNeedsValueRequest *)self dialog];
  [v4 encodeObject:v7 forKey:@"dialog"];

  id v8 = [(LNNeedsValueRequest *)self viewSnippet];
  [v4 encodeObject:v8 forKey:@"viewSnippet"];
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
      id v8 = [(LNNeedsValueRequest *)self identifier];
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
    id v5 = [LNNeedsValueResponse alloc];
    v6 = [(LNNeedsValueRequest *)self identifier];
    uint64_t v7 = [(LNNeedsValueResponse *)v5 initWithIdentifier:v6 value:0 updates:v4];

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
      uint64_t v10 = [(LNNeedsValueRequest *)self identifier];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      v14 = v10;
    }
  }
}

- (void)respondWithValue:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_completionHandler)
  {
    id v5 = [LNNeedsValueResponse alloc];
    v6 = [(LNNeedsValueRequest *)self identifier];
    uint64_t v7 = [(LNNeedsValueResponse *)v5 initWithIdentifier:v6 value:v4 updates:0];

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
      uint64_t v10 = [(LNNeedsValueRequest *)self identifier];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      v14 = v10;
    }
  }
}

- (LNNeedsValueRequest)initWithIdentifier:(id)a3 parameterName:(id)a4 dialog:(id)a5 viewSnippet:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"LNNeedsValueRequest.m", 25, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNNeedsValueRequest.m", 26, @"Invalid parameter not satisfying: %@", @"parameterName" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)LNNeedsValueRequest;
  v16 = [(LNNeedsValueRequest *)&v27 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v17->_parameterName, a4);
    uint64_t v18 = [v14 copy];
    dialog = v17->_dialog;
    v17->_dialog = (LNDialog *)v18;

    uint64_t v20 = [v15 copy];
    viewSnippet = v17->_viewSnippet;
    v17->_viewSnippet = (LNViewSnippet *)v20;

    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = 0;

    v23 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end