@interface LNDisambiguationRequest
+ (BOOL)supportsSecureCoding;
- (LNDialog)dialog;
- (LNDisambiguationRequest)initWithCoder:(id)a3;
- (LNDisambiguationRequest)initWithIdentifier:(id)a3 parameterName:(id)a4 providedValues:(id)a5 dialog:(id)a6;
- (NSArray)providedValues;
- (NSString)parameterName;
- (NSUUID)identifier;
- (id)completionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)respondWithError:(id)a3;
- (void)respondWithSelectedIndex:(int64_t)a3;
- (void)respondWithSelectedItemIndex:(int64_t)a3;
- (void)respondWithUpdates:(id)a3;
- (void)respondWithValue:(id)a3;
- (void)responseWithSelectedIndex:(id)a3 value:(id)a4;
- (void)setCompletionHandler:(id)a3;
@end

@implementation LNDisambiguationRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_providedValues, 0);
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

- (LNDialog)dialog
{
  return self->_dialog;
}

- (NSArray)providedValues
{
  return self->_providedValues;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (LNDisambiguationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterName"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"providedValues"];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dialog"];

  v12 = 0;
  if (v5 && v6 && v10)
  {
    self = [(LNDisambiguationRequest *)self initWithIdentifier:v5 parameterName:v6 providedValues:v10 dialog:v11];
    v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNDisambiguationRequest *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNDisambiguationRequest *)self parameterName];
  [v4 encodeObject:v6 forKey:@"parameterName"];

  v7 = [(LNDisambiguationRequest *)self providedValues];
  [v4 encodeObject:v7 forKey:@"providedValues"];

  id v8 = [(LNDisambiguationRequest *)self dialog];
  [v4 encodeObject:v8 forKey:@"dialog"];
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
      id v8 = [(LNDisambiguationRequest *)self identifier];
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
    id v5 = [LNDisambiguationResponse alloc];
    v6 = [(LNDisambiguationRequest *)self identifier];
    uint64_t v7 = [(LNDisambiguationResponse *)v5 initWithIdentifier:v6 selectedIndex:0 value:0 updates:v4];

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
      uint64_t v10 = [(LNDisambiguationRequest *)self identifier];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      v14 = v10;
    }
  }
}

- (void)responseWithSelectedIndex:(id)a3 value:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_completionHandler)
  {
    id v8 = [LNDisambiguationResponse alloc];
    uint64_t v9 = [(LNDisambiguationRequest *)self identifier];
    uint64_t v10 = [(LNDisambiguationResponse *)v8 initWithIdentifier:v9 selectedIndex:v6 value:v7 updates:0];

    (*((void (**)(void))self->_completionHandler + 2))();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  else
  {
    uint64_t v10 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class();
      __int16 v13 = [(LNDisambiguationRequest *)self identifier];
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      v17 = v13;
    }
  }
}

- (void)respondWithValue:(id)a3
{
}

- (void)respondWithSelectedIndex:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(LNDisambiguationRequest *)self responseWithSelectedIndex:v4 value:0];
}

- (LNDisambiguationRequest)initWithIdentifier:(id)a3 parameterName:(id)a4 providedValues:(id)a5 dialog:(id)a6
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
LABEL_8:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LNDisambiguationRequest.m", 25, @"Invalid parameter not satisfying: %@", @"parameterName" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LNDisambiguationRequest.m", 24, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNDisambiguationRequest.m", 26, @"Invalid parameter not satisfying: %@", @"providedValues" object file lineNumber description];

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)LNDisambiguationRequest;
  __int16 v16 = [(LNDisambiguationRequest *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v17->_parameterName, a4);
    objc_storeStrong((id *)&v17->_providedValues, a5);
    uint64_t v18 = [v15 copy];
    dialog = v17->_dialog;
    v17->_dialog = (LNDialog *)v18;

    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = 0;

    v21 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)respondWithSelectedItemIndex:(int64_t)a3
{
  id v5 = [(LNDisambiguationRequest *)self providedValues];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  [(LNDisambiguationRequest *)self respondWithValue:v6];
}

@end