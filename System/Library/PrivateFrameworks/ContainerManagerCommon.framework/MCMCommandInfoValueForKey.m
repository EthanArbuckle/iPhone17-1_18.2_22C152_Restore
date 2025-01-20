@interface MCMCommandInfoValueForKey
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandInfoValueForKey)infoValueForKeyWithError:(unint64_t *)a3;
- (MCMCommandInfoValueForKey)initWithKey:(id)a3 concreteContainerIdentity:(id)a4 context:(id)a5 resultPromise:(id)a6;
- (MCMCommandInfoValueForKey)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (NSString)key;
- (void)execute;
@end

@implementation MCMCommandInfoValueForKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
}

- (NSString)key
{
  return self->_key;
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (MCMCommandInfoValueForKey)infoValueForKeyWithError:(unint64_t *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v22 = [(MCMCommandInfoValueForKey *)self concreteContainerIdentity];
  v4 = [(MCMCommandInfoValueForKey *)self key];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v6)
  {
    v15 = [[MCMError alloc] initWithErrorType:38];
    v16 = container_log_handle_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Can't get nil or non-NSString key: %@", buf, 0xCu);
    }

    v11 = 0;
    v9 = 0;
    goto LABEL_17;
  }
  v7 = [(MCMCommand *)self context];
  v8 = [v7 containerCache];
  id v24 = 0;
  v9 = [v8 entryForContainerIdentity:v22 error:&v24];
  id v10 = v24;

  id v23 = v10;
  v11 = [v9 metadataWithError:&v23];
  v12 = (MCMError *)v23;

  if (!v11)
  {
    v15 = [[MCMError alloc] initWithErrorType:21];

    v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v22;
      _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "No Container with identity: %@", buf, 0xCu);
    }

    v11 = 0;
    goto LABEL_17;
  }
  v13 = [v11 info];
  v14 = [v13 objectForKeyedSubscript:v5];

  if (!v14)
  {
    v15 = [[MCMError alloc] initWithErrorType:24];

    v18 = container_log_handle_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "Didn't find info value for key: %@", buf, 0xCu);
    }

LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  v15 = v12;
LABEL_18:
  if (a3 && v15) {
    *a3 = [(MCMError *)v15 type];
  }
  v19 = v14;

  return v19;
}

- (void)execute
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v9[0] = 1;
  v4 = [(MCMCommandInfoValueForKey *)self infoValueForKeyWithError:v9];
  if (v9[0] == 1)
  {
    id v5 = [[MCMResultInfoValueForKey alloc] initWithValue:v4];
  }
  else
  {
    id v6 = [MCMError alloc];
    v7 = [(MCMError *)v6 initWithErrorType:v9[0]];
    id v5 = [(MCMResultBase *)[MCMResultInfoValueForKey alloc] initWithError:v7];
  }
  v8 = [(MCMCommand *)self resultPromise];
  [v8 completeWithResult:v5];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];

  LOBYTE(v2) = [v3 isAllowedToAccessInfoMetadata];
  return (char)v2;
}

- (MCMCommandInfoValueForKey)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandInfoValueForKey;
  v9 = [(MCMCommand *)&v15 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;

    uint64_t v12 = [v8 key];
    key = v9->_key;
    v9->_key = (NSString *)v12;
  }
  return v9;
}

- (MCMCommandInfoValueForKey)initWithKey:(id)a3 concreteContainerIdentity:(id)a4 context:(id)a5 resultPromise:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MCMCommandInfoValueForKey;
  v13 = [(MCMCommand *)&v16 initWithContext:a5 resultPromise:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    objc_storeStrong((id *)&v14->_concreteContainerIdentity, a4);
  }

  return v14;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 6;
}

@end