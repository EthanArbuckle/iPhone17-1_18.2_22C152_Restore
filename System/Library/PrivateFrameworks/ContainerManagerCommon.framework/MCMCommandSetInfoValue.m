@interface MCMCommandSetInfoValue
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandSetInfoValue)initWithKey:(id)a3 value:(id)a4 containerIdentity:(id)a5 context:(id)a6 resultPromise:(id)a7;
- (MCMCommandSetInfoValue)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (NSString)key;
- (id)value;
- (void)execute;
@end

@implementation MCMCommandSetInfoValue

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
}

- (id)value
{
  return self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void)execute
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v4 = [(MCMCommandSetInfoValue *)self concreteContainerIdentity];
  v5 = [(MCMCommandSetInfoValue *)self key];
  uint64_t v6 = [(MCMCommandSetInfoValue *)self value];
  objc_opt_class();
  id v7 = v5;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  v33 = (void *)v6;
  v34 = (void *)v4;
  if (!v8)
  {
    v32 = v3;
    v14 = [[MCMError alloc] initWithErrorType:38];
    v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Can't set nil or non-NSString key: %@", buf, 0xCu);
    }
    v16 = 0;
    v13 = 0;
    v11 = 0;
    goto LABEL_21;
  }
  v9 = [(MCMCommand *)self context];
  v10 = [v9 containerCache];
  id v38 = 0;
  v11 = [v10 entryForContainerIdentity:v4 error:&v38];
  id v12 = v38;

  id v37 = v12;
  v13 = [v11 metadataWithError:&v37];
  v14 = (MCMError *)v37;

  if (!v13)
  {
    v32 = v3;
    v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v4;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "No Container with identity: %@", buf, 0xCu);
    }
    v16 = 0;
    v13 = 0;
    goto LABEL_21;
  }
  v15 = [v13 metadataBySettingInfoValue:v6 forKey:v7];
  if (v13 != v15)
  {
    v16 = v15;
    v32 = v3;
    v36 = v14;
    char v17 = [v15 writeMetadataToDiskWithError:&v36];
    v18 = v36;

    if (v17)
    {
      v19 = [(MCMCommand *)self context];
      v20 = [v19 containerCache];
      v35 = v18;
      [v20 addContainerMetadata:v16 error:&v35];
      v22 = v21 = v18;
      v14 = v35;

      if (v22)
      {
LABEL_22:
        v3 = v32;
        goto LABEL_23;
      }
      v23 = container_log_handle_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = [v13 containerPath];
        v25 = [v24 containerRootURL];
        v26 = [v25 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = (uint64_t)v16;
        __int16 v41 = 2112;
        v42 = v26;
        _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, url: %@", buf, 0x16u);
      }
    }
    else
    {
      v23 = container_log_handle_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v29 = [v13 containerPath];
        v30 = [v29 containerRootURL];
        v31 = [v30 path];
        *(_DWORD *)buf = 138412802;
        uint64_t v40 = (uint64_t)v16;
        __int16 v41 = 2112;
        v42 = v31;
        __int16 v43 = 2112;
        v44 = v18;
        _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Failed to write updated metadata: %@, url: %@, error = %@", buf, 0x20u);
      }
      v14 = v18;
    }
LABEL_21:

    goto LABEL_22;
  }
  v16 = v13;
LABEL_23:
  v27 = [[MCMResultBase alloc] initWithError:v14];
  v28 = [(MCMCommand *)self resultPromise];
  [v28 completeWithResult:v27];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];

  LOBYTE(v2) = [v3 isAllowedToAccessInfoMetadata];
  return (char)v2;
}

- (MCMCommandSetInfoValue)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCommandSetInfoValue;
  v9 = [(MCMCommand *)&v17 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;

    uint64_t v12 = [v8 key];
    key = v9->_key;
    v9->_key = (NSString *)v12;

    uint64_t v14 = [v8 value];
    id value = v9->_value;
    v9->_id value = (id)v14;
  }
  return v9;
}

- (MCMCommandSetInfoValue)initWithKey:(id)a3 value:(id)a4 containerIdentity:(id)a5 context:(id)a6 resultPromise:(id)a7
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MCMCommandSetInfoValue;
  v16 = [(MCMCommand *)&v19 initWithContext:a6 resultPromise:a7];
  objc_super v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    objc_storeStrong(&v17->_value, a4);
    objc_storeStrong((id *)&v17->_concreteContainerIdentity, a5);
  }

  return v17;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 5;
}

@end