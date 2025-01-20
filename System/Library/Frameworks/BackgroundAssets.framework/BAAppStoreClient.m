@interface BAAppStoreClient
+ (id)_errorWithCode:(void *)a3 errorObject:;
- (BAAppStoreClient)init;
- (BOOL)performEventWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)prepareForAppInstallWithDescriptor:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation BAAppStoreClient

- (BAAppStoreClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)BAAppStoreClient;
  v2 = [(BAAppStoreClient *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(BAAgentSystemProxy);
    systemProxy = v2->_systemProxy;
    v2->_systemProxy = v3;
  }
  return v2;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (BAAppStoreClient *)self->_systemProxy;
  }
  [(BAAppStoreClient *)self invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)BAAppStoreClient;
  [(BAAppStoreClient *)&v3 dealloc];
}

- (BOOL)prepareForAppInstallWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, 5, v6);
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v7 = [v6 appBundleIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    if (a4)
    {
      v14 = [v6 appBundleIdentifier];
      uint64_t v15 = 2;
LABEL_13:
      +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, v15, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  v8 = [v6 appBundleIdentifier];
  uint64_t v9 = [v8 length];

  if (!v9) {
    goto LABEL_11;
  }
  v10 = [v6 appStoreMetadata];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!a4) {
      goto LABEL_14;
    }
    v14 = [v6 appBundleIdentifier];
    uint64_t v15 = 3;
    goto LABEL_13;
  }
  if (self) {
    systemProxy = self->_systemProxy;
  }
  else {
    systemProxy = 0;
  }
  BOOL v13 = [(BAAgentSystemProxy *)systemProxy applicationPrepareWithDescriptor:v6 error:a4];
LABEL_15:

  return v13;
}

+ (id)_errorWithCode:(void *)a3 errorObject:
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  self;
  if ((unint64_t)(a2 - 1) > 5)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", off_2647E8E50[a2 - 1], v4);
  }
  id v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v6 errorWithDomain:@"BAAppStoreClientErrorDomain" code:a2 userInfo:v7];

  return v8;
}

- (BOOL)performEventWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 appBundleIdentifier];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [v6 appBundleURL];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v9 isFileURL])
      {
        if ([v6 eventType] == 22)
        {
LABEL_8:
          if (self) {
            systemProxy = self->_systemProxy;
          }
          else {
            systemProxy = 0;
          }
          BOOL v12 = [(BAAgentSystemProxy *)systemProxy applicationEventPerformedWithDescriptor:v6 error:a4];
          goto LABEL_22;
        }
        uint64_t v10 = [MEMORY[0x263F086E0] bundleWithURL:v9];
        if (v10)
        {

          goto LABEL_8;
        }
        if (a4)
        {
          uint64_t v14 = 4;
          goto LABEL_18;
        }
      }
      else if (a4)
      {
        uint64_t v14 = 1;
LABEL_18:
        +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, v14, v9);
        BOOL v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_23;
      }
      BOOL v12 = 0;
      goto LABEL_22;
    }
    if (a4)
    {
      BOOL v13 = [v6 appBundleIdentifier];
      +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, 2, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
  if (!a4)
  {
LABEL_15:
    BOOL v12 = 0;
    goto LABEL_23;
  }
  +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, 6, v6);
  BOOL v12 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v12;
}

- (void).cxx_destruct
{
}

@end