@interface AFDeleteSiriHistoryContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFDeleteSiriHistoryContext)init;
- (AFDeleteSiriHistoryContext)initWithBuilder:(id)a3;
- (AFDeleteSiriHistoryContext)initWithCoder:(id)a3;
- (AFDeleteSiriHistoryContext)initWithSuccessTitle:(id)a3 successBody:(id)a4 successButtonText:(id)a5 errorTitle:(id)a6 errorBody:(id)a7 errorButtonText:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSString)errorBody;
- (NSString)errorButtonText;
- (NSString)errorTitle;
- (NSString)successBody;
- (NSString)successButtonText;
- (NSString)successTitle;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFDeleteSiriHistoryContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorButtonText, 0);
  objc_storeStrong((id *)&self->_errorBody, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_successButtonText, 0);
  objc_storeStrong((id *)&self->_successBody, 0);
  objc_storeStrong((id *)&self->_successTitle, 0);
}

- (NSString)errorButtonText
{
  return self->_errorButtonText;
}

- (NSString)errorBody
{
  return self->_errorBody;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (NSString)successButtonText
{
  return self->_successButtonText;
}

- (NSString)successBody
{
  return self->_successBody;
}

- (NSString)successTitle
{
  return self->_successTitle;
}

- (void)encodeWithCoder:(id)a3
{
  successTitle = self->_successTitle;
  id v5 = a3;
  [v5 encodeObject:successTitle forKey:@"AFDeleteSiriHistoryContext::successTitle"];
  [v5 encodeObject:self->_successBody forKey:@"AFDeleteSiriHistoryContext::successBody"];
  [v5 encodeObject:self->_successButtonText forKey:@"AFDeleteSiriHistoryContext::successButtonText"];
  [v5 encodeObject:self->_errorTitle forKey:@"AFDeleteSiriHistoryContext::errorTitle"];
  [v5 encodeObject:self->_errorBody forKey:@"AFDeleteSiriHistoryContext::errorBody"];
  [v5 encodeObject:self->_errorButtonText forKey:@"AFDeleteSiriHistoryContext::errorButtonText"];
}

- (AFDeleteSiriHistoryContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeleteSiriHistoryContext::successTitle"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeleteSiriHistoryContext::successBody"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeleteSiriHistoryContext::successButtonText"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeleteSiriHistoryContext::errorTitle"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeleteSiriHistoryContext::errorBody"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeleteSiriHistoryContext::errorButtonText"];

  v11 = [(AFDeleteSiriHistoryContext *)self initWithSuccessTitle:v5 successBody:v6 successButtonText:v7 errorTitle:v8 errorBody:v9 errorButtonText:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFDeleteSiriHistoryContext *)a3;
  if (self == v4)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFDeleteSiriHistoryContext *)v5 successTitle];
      successTitle = self->_successTitle;
      if (successTitle == v6 || [(NSString *)successTitle isEqual:v6])
      {
        v8 = [(AFDeleteSiriHistoryContext *)v5 successBody];
        successBody = self->_successBody;
        if (successBody == v8 || [(NSString *)successBody isEqual:v8])
        {
          v10 = [(AFDeleteSiriHistoryContext *)v5 successButtonText];
          successButtonText = self->_successButtonText;
          if (successButtonText == v10 || [(NSString *)successButtonText isEqual:v10])
          {
            v12 = [(AFDeleteSiriHistoryContext *)v5 errorTitle];
            errorTitle = self->_errorTitle;
            if (errorTitle == v12 || [(NSString *)errorTitle isEqual:v12])
            {
              v14 = [(AFDeleteSiriHistoryContext *)v5 errorBody];
              errorBody = self->_errorBody;
              if (errorBody == v14 || [(NSString *)errorBody isEqual:v14])
              {
                v16 = [(AFDeleteSiriHistoryContext *)v5 errorButtonText];
                errorButtonText = self->_errorButtonText;
                BOOL v18 = errorButtonText == v16 || [(NSString *)errorButtonText isEqual:v16];
              }
              else
              {
                BOOL v18 = 0;
              }
            }
            else
            {
              BOOL v18 = 0;
            }
          }
          else
          {
            BOOL v18 = 0;
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_successTitle hash];
  NSUInteger v4 = [(NSString *)self->_successBody hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_successButtonText hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_errorTitle hash];
  NSUInteger v7 = [(NSString *)self->_errorBody hash];
  return v6 ^ v7 ^ [(NSString *)self->_errorButtonText hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFDeleteSiriHistoryContext;
  NSUInteger v5 = [(AFDeleteSiriHistoryContext *)&v8 description];
  NSUInteger v6 = (void *)[v4 initWithFormat:@"%@ {successTitle = %@, successBody = %@, successButtonText = %@, errorTitle = %@, errorBody = %@, errorButtonText = %@}", v5, self->_successTitle, self->_successBody, self->_successButtonText, self->_errorTitle, self->_errorBody, self->_errorButtonText];

  return v6;
}

- (id)description
{
  return [(AFDeleteSiriHistoryContext *)self _descriptionWithIndent:0];
}

- (AFDeleteSiriHistoryContext)initWithSuccessTitle:(id)a3 successBody:(id)a4 successButtonText:(id)a5 errorTitle:(id)a6 errorBody:(id)a7 errorButtonText:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __118__AFDeleteSiriHistoryContext_initWithSuccessTitle_successBody_successButtonText_errorTitle_errorBody_errorButtonText___block_invoke;
  v28[3] = &unk_1E5925E78;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v20 = v19;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  v26 = [(AFDeleteSiriHistoryContext *)self initWithBuilder:v28];

  return v26;
}

void __118__AFDeleteSiriHistoryContext_initWithSuccessTitle_successBody_successButtonText_errorTitle_errorBody_errorButtonText___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setSuccessTitle:v3];
  [v4 setSuccessBody:a1[5]];
  [v4 setSuccessButtonText:a1[6]];
  [v4 setErrorTitle:a1[7]];
  [v4 setErrorBody:a1[8]];
  [v4 setErrorButtonText:a1[9]];
}

- (AFDeleteSiriHistoryContext)init
{
  return [(AFDeleteSiriHistoryContext *)self initWithBuilder:0];
}

- (AFDeleteSiriHistoryContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFDeleteSiriHistoryContextMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)AFDeleteSiriHistoryContext;
  NSUInteger v5 = [(AFDeleteSiriHistoryContext *)&v27 init];
  NSUInteger v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFDeleteSiriHistoryContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFDeleteSiriHistoryContextMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFDeleteSiriHistoryContextMutation *)v7 getSuccessTitle];
      uint64_t v9 = [v8 copy];
      successTitle = v6->_successTitle;
      v6->_successTitle = (NSString *)v9;

      v11 = [(_AFDeleteSiriHistoryContextMutation *)v7 getSuccessBody];
      uint64_t v12 = [v11 copy];
      successBody = v6->_successBody;
      v6->_successBody = (NSString *)v12;

      id v14 = [(_AFDeleteSiriHistoryContextMutation *)v7 getSuccessButtonText];
      uint64_t v15 = [v14 copy];
      successButtonText = v6->_successButtonText;
      v6->_successButtonText = (NSString *)v15;

      id v17 = [(_AFDeleteSiriHistoryContextMutation *)v7 getErrorTitle];
      uint64_t v18 = [v17 copy];
      errorTitle = v6->_errorTitle;
      v6->_errorTitle = (NSString *)v18;

      id v20 = [(_AFDeleteSiriHistoryContextMutation *)v7 getErrorBody];
      uint64_t v21 = [v20 copy];
      errorBody = v6->_errorBody;
      v6->_errorBody = (NSString *)v21;

      id v23 = [(_AFDeleteSiriHistoryContextMutation *)v7 getErrorButtonText];
      uint64_t v24 = [v23 copy];
      errorButtonText = v6->_errorButtonText;
      v6->_errorButtonText = (NSString *)v24;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFDeleteSiriHistoryContextMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_AFDeleteSiriHistoryContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFDeleteSiriHistoryContextMutation *)v5 isDirty])
    {
      NSUInteger v6 = objc_alloc_init(AFDeleteSiriHistoryContext);
      NSUInteger v7 = [(_AFDeleteSiriHistoryContextMutation *)v5 getSuccessTitle];
      uint64_t v8 = [v7 copy];
      successTitle = v6->_successTitle;
      v6->_successTitle = (NSString *)v8;

      v10 = [(_AFDeleteSiriHistoryContextMutation *)v5 getSuccessBody];
      uint64_t v11 = [v10 copy];
      successBody = v6->_successBody;
      v6->_successBody = (NSString *)v11;

      v13 = [(_AFDeleteSiriHistoryContextMutation *)v5 getSuccessButtonText];
      uint64_t v14 = [v13 copy];
      successButtonText = v6->_successButtonText;
      v6->_successButtonText = (NSString *)v14;

      id v16 = [(_AFDeleteSiriHistoryContextMutation *)v5 getErrorTitle];
      uint64_t v17 = [v16 copy];
      errorTitle = v6->_errorTitle;
      v6->_errorTitle = (NSString *)v17;

      id v19 = [(_AFDeleteSiriHistoryContextMutation *)v5 getErrorBody];
      uint64_t v20 = [v19 copy];
      errorBody = v6->_errorBody;
      v6->_errorBody = (NSString *)v20;

      id v22 = [(_AFDeleteSiriHistoryContextMutation *)v5 getErrorButtonText];
      uint64_t v23 = [v22 copy];
      errorButtonText = v6->_errorButtonText;
      v6->_errorButtonText = (NSString *)v23;
    }
    else
    {
      NSUInteger v6 = (AFDeleteSiriHistoryContext *)[(AFDeleteSiriHistoryContext *)self copy];
    }
  }
  else
  {
    NSUInteger v6 = (AFDeleteSiriHistoryContext *)[(AFDeleteSiriHistoryContext *)self copy];
  }

  return v6;
}

@end