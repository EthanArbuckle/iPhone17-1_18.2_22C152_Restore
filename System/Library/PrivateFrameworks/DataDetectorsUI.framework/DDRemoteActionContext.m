@interface DDRemoteActionContext
+ (BOOL)isClassAllowedFromString:(id)a3;
+ (BOOL)supportsSecureCoding;
- (DDRemoteActionContext)initWithCoder:(id)a3;
- (DDRemoteActionContext)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 associatedResults:(id)a6 associatedVisualResults:(id)a7 className:(id)a8;
- (NSArray)associatedResults;
- (NSArray)associatedVisualResults;
- (NSDictionary)context;
- (NSString)actionClass;
- (NSString)hostApplicationIdentifier;
- (NSURL)URL;
- (__DDResult)result;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActionClass:(id)a3;
- (void)setAssociatedResults:(id)a3;
- (void)setContext:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setResult:(__DDResult *)a3;
- (void)setURL:(id)a3;
@end

@implementation DDRemoteActionContext

+ (BOOL)isClassAllowedFromString:(id)a3
{
  if (a3) {
    return objc_msgSend(&unk_1EF50FF78, "containsObject:");
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  result = self->_result;
  if (result)
  {
    CFRelease(result);
    self->_result = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DDRemoteActionContext;
  [(DDRemoteActionContext *)&v4 dealloc];
}

- (DDRemoteActionContext)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 associatedResults:(id)a6 associatedVisualResults:(id)a7 className:(id)a8
{
  id v23 = a3;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)DDRemoteActionContext;
  v18 = [(DDRemoteActionContext *)&v24 init];
  if (!v18)
  {
LABEL_7:
    v20 = 0;
    goto LABEL_10;
  }
  if (!+[DDRemoteActionContext isClassAllowedFromString:](DDRemoteActionContext, "isClassAllowedFromString:", v17, v22, v23))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      -[DDRemoteActionContext initWithURL:result:context:associatedResults:associatedVisualResults:className:]();
    }
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v18->_URL, a3);
  if (a4) {
    v19 = (__DDResult *)CFRetain(a4);
  }
  else {
    v19 = 0;
  }
  v18->_result = v19;
  objc_storeStrong((id *)&v18->_context, a5);
  objc_storeStrong((id *)&v18->_actionClass, a8);
  objc_storeStrong((id *)&v18->_associatedResults, a6);
  objc_storeStrong((id *)&v18->_associatedVisualResults, a7);
  v20 = v18;
LABEL_10:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_super v4 = +[DDAction encodableContextWithContext:self->_context];
  [v9 encodeObject:v4 forKey:@"context"];

  [v9 encodeObject:self->_actionClass forKey:@"actionClass"];
  if (self->_result)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F5F150], "resultFromCoreResult:");
    [v9 encodeObject:v5 forKey:@"result"];
  }
  if (self->_associatedResults)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F5F150], "resultsFromCoreResults:");
    [v9 encodeObject:v6 forKey:@"associatedResults"];
  }
  associatedVisualResults = self->_associatedVisualResults;
  if (associatedVisualResults) {
    [v9 encodeObject:associatedVisualResults forKey:@"associatedVisualResults"];
  }
  v8 = [(DDRemoteActionContext *)self URL];
  [v9 encodeObject:v8 forKey:@"url"];
}

- (DDRemoteActionContext)initWithCoder:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)DDRemoteActionContext;
  v6 = [(DDRemoteActionContext *)&v47 init];
  if (v6)
  {
    SEL v42 = a2;
    v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    [(DDRemoteActionContext *)v6 setURL:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    id v17 = [v5 decodeObjectOfClasses:v16 forKey:@"context"];
    v18 = (void *)[v8 initWithDictionary:v17];
    [(DDRemoteActionContext *)v6 setContext:v18];

    if ([v5 containsValueForKey:@"result"])
    {
      v19 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
      -[DDRemoteActionContext setResult:](v6, "setResult:", CFRetain((CFTypeRef)[v19 coreResult]));
    }
    if ([v5 containsValueForKey:@"associatedResults"])
    {
      v20 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      id v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      objc_super v24 = [v5 decodeObjectOfClasses:v23 forKey:@"associatedResults"];

      v25 = (NSArray *)objc_opt_new();
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v26 = v24;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v44;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v44 != v29) {
              objc_enumerationMutation(v26);
            }
            -[NSArray addObject:](v25, "addObject:", [*(id *)(*((void *)&v43 + 1) + 8 * v30++) coreResult]);
          }
          while (v28 != v30);
          uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v28);
      }

      associatedResults = v6->_associatedResults;
      v6->_associatedResults = v25;
    }
    if ([v5 containsValueForKey:@"associatedVisualResults"])
    {
      v32 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = objc_opt_class();
      v35 = objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
      uint64_t v36 = [v5 decodeObjectOfClasses:v35 forKey:@"associatedVisualResults"];
      associatedVisualResults = v6->_associatedVisualResults;
      v6->_associatedVisualResults = (NSArray *)v36;
    }
    v38 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"actionClass"];
    if (+[DDRemoteActionContext isClassAllowedFromString:v38])
    {
      [(DDRemoteActionContext *)v6 setActionClass:v38];
    }
    else
    {
      v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:v42 object:v6 file:@"DDRemoteAction.m" lineNumber:632 description:@"Trying to create a context with an invalid preview action class or an empty class."];
    }
    v40 = v6;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setURL:(id)a3
{
}

- (__DDResult)result
{
  return self->_result;
}

- (void)setResult:(__DDResult *)a3
{
  self->_result = a3;
}

- (NSDictionary)context
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContext:(id)a3
{
}

- (NSArray)associatedResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssociatedResults:(id)a3
{
}

- (NSArray)associatedVisualResults
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)hostApplicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (NSString)actionClass
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActionClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionClass, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedVisualResults, 0);
  objc_storeStrong((id *)&self->_associatedResults, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)initWithURL:result:context:associatedResults:associatedVisualResults:className:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Trying to create a context with an invalid preview action class.", v0, 2u);
}

@end