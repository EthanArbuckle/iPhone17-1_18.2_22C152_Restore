@interface LNSuccessResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAction)action;
- (LNActionAppContext)actionAppContext;
- (LNActionOutput)output;
- (LNSuccessResult)initWithAction:(id)a3 output:(id)a4 actionAppContext:(id)a5 predictions:(id)a6;
- (LNSuccessResult)initWithActionData:(id)a3 outputData:(id)a4 appContextData:(id)a5 predictionsData:(id)a6;
- (LNSuccessResult)initWithCoder:(id)a3;
- (NSArray)predictions;
- (NSData)actionData;
- (NSData)appContextData;
- (NSData)outputData;
- (NSData)predictionsData;
- (id)description;
- (id)verboseDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSuccessResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionsData, 0);
  objc_storeStrong((id *)&self->_appContextData, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_actionAppContext, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (NSData)predictionsData
{
  return self->_predictionsData;
}

- (NSData)appContextData
{
  return self->_appContextData;
}

- (NSData)outputData
{
  return self->_outputData;
}

- (NSData)actionData
{
  return self->_actionData;
}

- (LNSuccessResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionData"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputData"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appContextData"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionsData"];
  v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v8 == 0)
  {
    v21 = v7;
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"output"];
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionAppContext"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"predictions"];

    v19 = 0;
    if (v12 && v13 && v18)
    {
      self = [(LNSuccessResult *)self initWithAction:v12 output:v13 actionAppContext:v14 predictions:v18];
      v19 = self;
    }

    v7 = v21;
  }
  else
  {
    self = [(LNSuccessResult *)self initWithActionData:v5 outputData:v6 appContextData:v7 predictionsData:v8];
    v19 = self;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNSuccessResult *)self actionData];
  [v4 encodeObject:v5 forKey:@"actionData"];

  v6 = [(LNSuccessResult *)self outputData];
  [v4 encodeObject:v6 forKey:@"outputData"];

  v7 = [(LNSuccessResult *)self appContextData];
  [v4 encodeObject:v7 forKey:@"appContextData"];

  id v8 = [(LNSuccessResult *)self predictionsData];
  [v4 encodeObject:v8 forKey:@"predictionsData"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNSuccessResult *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    v7 = [(LNSuccessResult *)self actionData];
    id v8 = [(LNSuccessResult *)v6 actionData];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_33;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    uint64_t v16 = [(LNSuccessResult *)self outputData];
    v17 = [(LNSuccessResult *)v6 outputData];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_32;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    v22 = [(LNSuccessResult *)self appContextData];
    v23 = [(LNSuccessResult *)v6 appContextData];
    id v20 = v22;
    id v24 = v23;
    id v31 = v20;
    v32 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          int v12 = [v20 isEqual:v24];

          if (!v12)
          {
            v19 = v32;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      id v20 = v31;
      v19 = v32;
      goto LABEL_32;
    }

LABEL_24:
    v26 = [(LNSuccessResult *)self predictionsData];
    v27 = [(LNSuccessResult *)v6 predictionsData];
    id v28 = v26;
    id v29 = v27;
    v25 = v29;
    if (v28 == v29)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v29) {
        LOBYTE(v12) = [v28 isEqual:v29];
      }
    }

    id v20 = v28;
    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNSuccessResult *)self actionData];
  uint64_t v4 = [v3 hash];
  v5 = [(LNSuccessResult *)self outputData];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNSuccessResult *)self appContextData];
  uint64_t v8 = [v7 hash];
  id v9 = [(LNSuccessResult *)self predictionsData];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)verboseDescription
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNSuccessResult *)self action];
  v7 = [(LNSuccessResult *)self output];
  uint64_t v8 = [(LNSuccessResult *)self actionAppContext];
  id v9 = [(LNSuccessResult *)self predictions];
  unint64_t v10 = [v3 stringWithFormat:@"<%@: %p, action: %@, output: %@, appContext: %@, predictions: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNSuccessResult *)self actionData];
  v7 = [(LNSuccessResult *)self outputData];
  uint64_t v8 = [(LNSuccessResult *)self appContextData];
  id v9 = [(LNSuccessResult *)self predictionsData];
  unint64_t v10 = [v3 stringWithFormat:@"<%@: %p, actionData: %@, outputData: %@, appContextData: %@, predictionsData: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (NSArray)predictions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  predictions = self->_predictions;
  if (!predictions)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
    uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
    id v9 = [(LNSuccessResult *)self predictionsData];
    id v16 = 0;
    unint64_t v10 = [v8 unarchivedObjectOfClasses:v7 fromData:v9 error:&v16];
    id v11 = v16;

    if (v11 || !v10)
    {
      int v12 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [(LNSuccessResult *)self predictionsData];
        *(_DWORD *)buf = 138412802;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v13;
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_impl(&dword_1A4419000, v12, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);
      }
    }

    id v14 = self->_predictions;
    self->_predictions = v10;

    predictions = self->_predictions;
  }
  return predictions;
}

- (LNActionAppContext)actionAppContext
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  actionAppContext = self->_actionAppContext;
  if (!actionAppContext)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(LNSuccessResult *)self appContextData];
    id v14 = 0;
    v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v14];
    id v8 = v14;

    if (v8 || !v7)
    {
      id v9 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = objc_opt_class();
        id v11 = [(LNSuccessResult *)self appContextData];
        *(_DWORD *)buf = 138412802;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        id v18 = v11;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);
      }
    }

    int v12 = self->_actionAppContext;
    self->_actionAppContext = v7;

    actionAppContext = self->_actionAppContext;
  }
  return actionAppContext;
}

- (LNActionOutput)output
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  output = self->_output;
  if (!output)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(LNSuccessResult *)self outputData];
    id v14 = 0;
    v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v14];
    id v8 = v14;

    if (v8 || !v7)
    {
      id v9 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = objc_opt_class();
        id v11 = [(LNSuccessResult *)self outputData];
        *(_DWORD *)buf = 138412802;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        id v18 = v11;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);
      }
    }

    int v12 = self->_output;
    self->_output = v7;

    output = self->_output;
  }
  return output;
}

- (LNAction)action
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  action = self->_action;
  if (!action)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(LNSuccessResult *)self actionData];
    id v14 = 0;
    v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v14];
    id v8 = v14;

    if (v8 || !v7)
    {
      id v9 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = objc_opt_class();
        id v11 = [(LNSuccessResult *)self actionData];
        *(_DWORD *)buf = 138412802;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        id v18 = v11;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);
      }
    }

    int v12 = self->_action;
    self->_action = v7;

    action = self->_action;
  }
  return action;
}

- (LNSuccessResult)initWithActionData:(id)a3 outputData:(id)a4 appContextData:(id)a5 predictionsData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"LNSuccessResult.m", 38, @"Invalid parameter not satisfying: %@", @"outputData" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNSuccessResult.m", 37, @"Invalid parameter not satisfying: %@", @"actionData" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"LNSuccessResult.m", 39, @"Invalid parameter not satisfying: %@", @"predictionsData" object file lineNumber description];

LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)LNSuccessResult;
  int v15 = [(LNSuccessResult *)&v29 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    actionData = v15->_actionData;
    v15->_actionData = (NSData *)v16;

    uint64_t v18 = [v12 copy];
    outputData = v15->_outputData;
    v15->_outputData = (NSData *)v18;

    uint64_t v20 = [v13 copy];
    appContextData = v15->_appContextData;
    v15->_appContextData = (NSData *)v20;

    uint64_t v22 = [v14 copy];
    predictionsData = v15->_predictionsData;
    v15->_predictionsData = (NSData *)v22;

    id v24 = v15;
  }

  return v15;
}

- (LNSuccessResult)initWithAction:(id)a3 output:(id)a4 actionAppContext:(id)a5 predictions:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v32 = 0;
  id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v32];
  id v14 = v32;
  if (v14) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v13 == 0;
  }
  if (v15)
  {
    uint64_t v16 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v14;
      _os_log_impl(&dword_1A4419000, v16, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }
  }
  id v31 = 0;
  __int16 v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v31];
  id v18 = v31;
  if (v18 || !v17)
  {
    __int16 v19 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v18;
      _os_log_impl(&dword_1A4419000, v19, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }
  }
  id v30 = 0;
  uint64_t v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v30];
  id v21 = v30;
  if (v21 || !v20)
  {
    uint64_t v22 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v11;
      __int16 v35 = 2112;
      id v36 = v21;
      _os_log_impl(&dword_1A4419000, v22, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }
  }
  id v29 = 0;
  uint64_t v23 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v29];
  id v24 = v29;
  if (v24 || !v23)
  {
    v25 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v12;
      __int16 v35 = 2112;
      id v36 = v24;
      _os_log_impl(&dword_1A4419000, v25, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }
  }
  v26 = [(LNSuccessResult *)self initWithActionData:v13 outputData:v17 appContextData:v20 predictionsData:v23];

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end