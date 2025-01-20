@interface MCMContainerIdentityMinimal
+ (id)minimalContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerIdentity:(id)a3;
- (MCMContainerConfiguration)containerConfig;
- (MCMContainerIdentityMinimal)init;
- (MCMContainerIdentityMinimal)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6;
- (MCMContainerIdentityMinimal)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (MCMContainerIdentityMinimal)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8;
- (MCMContainerIdentityMinimal)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (MCMUserIdentity)userIdentity;
- (MCMUserIdentityCache)userIdentityCache;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)identityByChangingUserIdentity:(id)a3;
- (id)identityBySettingPlatform:(unsigned int)a3;
- (id)minimalIdentity;
- (id)plist;
- (unint64_t)containerClass;
- (unint64_t)hash;
- (unsigned)disposition;
- (unsigned)platform;
@end

@implementation MCMContainerIdentityMinimal

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (unint64_t)containerClass
{
  v2 = [(MCMContainerIdentityMinimal *)self containerConfig];
  unint64_t v3 = [v2 containerClass];

  return v3;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MCMContainerIdentityMinimal)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)MCMContainerIdentityMinimal;
  v18 = [(MCMContainerIdentityMinimal *)&v32 init];
  if (!v18)
  {
    unint64_t v24 = 1;
    goto LABEL_24;
  }
  v19 = v18;
  objc_storeStrong((id *)&v18->_userIdentityCache, a7);
  uint64_t v20 = [v17 userIdentityForContainerConfig:v16 originatorUserIdentity:v14];
  userIdentity = v19->_userIdentity;
  v19->_userIdentity = (MCMUserIdentity *)v20;

  if (v19->_userIdentity)
  {
    if (!v15)
    {
      v25 = container_log_handle_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Invalid object: missing identifier", buf, 2u);
      }
      unint64_t v24 = 18;
      goto LABEL_23;
    }
    objc_opt_class();
    id v22 = v15;
    if (objc_opt_isKindOfClass()) {
      v23 = (NSString *)v22;
    }
    else {
      v23 = 0;
    }

    identifier = v19->_identifier;
    v19->_identifier = v23;

    if (v19->_identifier)
    {
      objc_storeStrong((id *)&v19->_containerConfig, a5);
      if (v19->_containerConfig)
      {
        unsigned int v30 = [v16 disposition];
        v19->_platform = a6;
        v19->_disposition = v30;
        goto LABEL_26;
      }
      v25 = container_log_handle_for_category();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      id v34 = v16;
      v26 = "Invalid object: container class = %@";
      goto LABEL_20;
    }
    v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v22;
      v26 = "Invalid object: identifier = [%@]";
LABEL_20:
      v27 = v25;
      uint32_t v28 = 12;
      goto LABEL_21;
    }
  }
  else
  {
    v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid object: no user identity";
      v27 = v25;
      uint32_t v28 = 2;
LABEL_21:
      _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
  }
LABEL_22:
  unint64_t v24 = 11;
LABEL_23:

LABEL_24:
  v19 = 0;
  if (a8) {
    *a8 = v24;
  }
LABEL_26:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_containerConfig, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unsigned)disposition
{
  return self->_disposition;
}

- (unsigned)platform
{
  return self->_platform;
}

- (id)identityBySettingPlatform:(unsigned int)a3
{
  v4 = (_DWORD *)[(MCMContainerIdentityMinimal *)self copy];
  v4[2] = a3;

  return v4;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [MCMContainerIdentityMinimal alloc];
  userIdentity = self->_userIdentity;
  v7 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  v8 = [(MCMContainerIdentityMinimal *)v5 initWithUserIdentity:userIdentity identifier:v7 containerConfig:self->_containerConfig platform:self->_platform userIdentityCache:self->_userIdentityCache error:0];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMContainerIdentityMinimal *)a3;
  BOOL v5 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(MCMContainerIdentityMinimal *)self isEqualToContainerIdentity:v4];
  }

  return v5;
}

- (BOOL)isEqualToContainerIdentity:(id)a3
{
  v4 = a3;
  BOOL v5 = [(NSString *)self->_identifier isEqual:v4[2]]
    && [(MCMUserIdentity *)self->_userIdentity isEqual:v4[4]]
    && [(MCMContainerConfiguration *)self->_containerConfig isEqual:v4[3]];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(MCMUserIdentity *)self->_userIdentity hash];
  return v4 ^ v3 ^ [(MCMContainerConfiguration *)self->_containerConfig hash];
}

- (id)debugDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MCMContainerIdentityMinimal_debugDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  unint64_t v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __47__MCMContainerIdentityMinimal_debugDescription__block_invoke(uint64_t a1, int a2)
{
  v19 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = *(void **)(a1 + 32);
  v7 = [v6 userIdentity];
  v8 = [v7 shortDescription];
  v9 = v8;
  if (a2)
  {
    uint64_t v10 = [v8 redactedDescription];
    v18 = [*(id *)(a1 + 32) identifier];
    v11 = [v18 redactedDescription];
  }
  else
  {
    v11 = [*(id *)(a1 + 32) identifier];
    uint64_t v10 = (uint64_t)v9;
  }
  v12 = [*(id *)(a1 + 32) containerConfig];
  v13 = [v12 debugDescription];
  uint64_t v14 = [*(id *)(a1 + 32) platform];
  id v15 = (void *)v5;
  objc_msgSend(v19, "stringWithFormat:", @"<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d>",
    v5,
    v6,
    v10,
    v11,
    v13,
  id v16 = v14);

  if (a2)
  {

    v11 = (void *)v10;
  }

  return v16;
}

- (id)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MCMContainerIdentityMinimal_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  unint64_t v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __42__MCMContainerIdentityMinimal_description__block_invoke(uint64_t a1, int a2)
{
  unint64_t v4 = NSString;
  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  v6 = v5;
  v7 = v5;
  if (a2)
  {
    v7 = [v5 redactedDescription];
  }
  uint64_t v8 = [*(id *)(a1 + 32) containerConfig];
  v9 = [*(id *)(a1 + 32) userIdentity];
  uint64_t v10 = [v9 shortDescription];
  v11 = v10;
  v12 = v10;
  if (a2)
  {
    v12 = [v10 redactedDescription];
  }
  objc_msgSend(v4, "stringWithFormat:", @"<%@(%@-);%@;pf%d>",
    v7,
    v8,
    v12,
  v13 = [*(id *)(a1 + 32) platform]);
  if (a2)
  {

    v11 = v9;
    v9 = (void *)v8;
  }
  else
  {
    v7 = (void *)v8;
  }

  return v13;
}

- (id)identityByChangingUserIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(MCMContainerIdentityMinimal *)self copy];
  v6 = (void *)v5[4];
  v5[4] = v4;

  return v5;
}

- (id)minimalIdentity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 1;
  v2 = self;
  NSUInteger v3 = v2;
  if (([(MCMContainerIdentityMinimal *)v2 isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    id v4 = [MCMContainerIdentityMinimal alloc];
    uint64_t v5 = [(MCMContainerIdentityMinimal *)v2 userIdentity];
    v6 = [(MCMContainerIdentityMinimal *)v2 identifier];
    v7 = [(MCMContainerIdentityMinimal *)v2 containerConfig];
    uint64_t v8 = [(MCMContainerIdentityMinimal *)v2 platform];
    v9 = [(MCMContainerIdentityMinimal *)v2 userIdentityCache];
    NSUInteger v3 = [(MCMContainerIdentityMinimal *)v4 initWithUserIdentity:v5 identifier:v6 containerConfig:v7 platform:v8 userIdentityCache:v9 error:&v14];
  }
  if (!v3)
  {
    uint64_t v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = v14;
      uint64_t error_description = container_get_error_description();
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      uint64_t v18 = error_description;
      __int16 v19 = 2112;
      uint64_t v20 = v2;
      _os_log_fault_impl(&dword_1D7739000, v10, OS_LOG_TYPE_FAULT, "Failed to create minimal identity; error = (%llu) %s, self = %@",
        buf,
        0x20u);
    }
  }

  return v3;
}

- (MCMContainerIdentityMinimal)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v33 = 1;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"identifier"];
  v11 = [v8 objectForKeyedSubscript:@"containerClass"];
  objc_super v32 = [v8 objectForKeyedSubscript:@"userIdentity"];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v33 = 116;
    uint64_t v20 = container_log_handle_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v35 = @"identifier";
      __int16 v36 = 2112;
      id v37 = (id)objc_opt_class();
      __int16 v38 = 2112;
      id v39 = v8;
      id v24 = v37;
      _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "Invalid container identity plist data. Expected string for %@, got %@. Data: %@", buf, 0x20u);
    }
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    id v12 = 0;
LABEL_17:
    __int16 v19 = 0;
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  id v12 = v10;
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v33 = 116;
    uint64_t v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v35 = @"containerClass";
      __int16 v36 = 2112;
      id v37 = (id)objc_opt_class();
      __int16 v38 = 2112;
      id v39 = v8;
      id v28 = v37;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Invalid container identity plist data. Expected number for %@, got %@. Data: %@", buf, 0x20u);
    }
    uint64_t v16 = 0;
LABEL_16:
    uint64_t v18 = 0;
    goto LABEL_17;
  }
  v31 = self;
  uint64_t v13 = [v11 unsignedIntegerValue];
  id v14 = containermanager_copy_global_configuration();
  id v15 = [v14 staticConfig];
  unsigned int v30 = (__CFString *)v13;
  uint64_t v16 = [v15 configForContainerClass:v13];

  if (v16)
  {
    self = v31;
    if ([v16 supportedOnPlatform])
    {
      uint64_t v17 = +[MCMUserIdentity userIdentityWithPlist:v32 cache:v9 error:&v33];
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        __int16 v19 = [(MCMContainerIdentityMinimal *)v31 initWithUserIdentity:v17 identifier:v12 containerConfig:v16 platform:0 userIdentityCache:v9 error:&v33];
        self = v19;
        if (!a5) {
          goto LABEL_20;
        }
        goto LABEL_18;
      }
      unint64_t v33 = 116;
      v29 = container_log_handle_for_category();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v35 = @"userIdentity";
        __int16 v36 = 2112;
        id v37 = v8;
        _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Invalid container identity plist data. Could not reconstitute user identity from %@. Data: %@", buf, 0x16u);
      }

      goto LABEL_16;
    }
    v27 = container_log_handle_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v30;
      _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "Container class in container_object_t (%llu) is unsupported", buf, 0xCu);
    }

    uint64_t v18 = 0;
    __int16 v19 = 0;
    uint64_t v26 = 72;
  }
  else
  {
    v25 = container_log_handle_for_category();
    self = v31;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v30;
      _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Container class in plist data (%llu) is invalid", buf, 0xCu);
    }

    uint64_t v16 = 0;
    uint64_t v18 = 0;
    __int16 v19 = 0;
    uint64_t v26 = 20;
  }
  unint64_t v33 = v26;
  if (!a5) {
    goto LABEL_20;
  }
LABEL_18:
  if (!v19) {
    *a5 = v33;
  }
LABEL_20:
  id v22 = v19;

  return v22;
}

- (MCMContainerIdentityMinimal)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
      v11 = [v10 objectForKeyedSubscript:@"version"];
      int v12 = [v11 isEqual:@"1"];

      if (v12) {
        self = [(MCMContainerIdentityMinimal *)self initWithVersion1PlistDictionary:v10 userIdentityCache:v9 error:a5];
      }
    }
  }

  return self;
}

- (id)plist
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"1";
  v11[0] = @"version";
  v11[1] = @"identifier";
  NSUInteger v3 = [(MCMContainerIdentityMinimal *)self identifier];
  v12[1] = v3;
  v11[2] = @"containerClass";
  id v4 = NSNumber;
  uint64_t v5 = [(MCMContainerIdentityMinimal *)self containerConfig];
  v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "containerClass"));
  v12[2] = v6;
  v11[3] = @"userIdentity";
  v7 = [(MCMContainerIdentityMinimal *)self userIdentity];
  id v8 = [v7 plist];
  v12[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (MCMContainerIdentityMinimal)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  unint64_t v37 = 1;
  uint64_t identifier = container_get_identifier();
  if (!identifier)
  {
    __int16 v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Identifier in container_object_t is NULL", buf, 2u);
    }

    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    id v22 = 0;
    v23 = 0;
    uint64_t v24 = 11;
LABEL_9:
    unint64_t v37 = v24;
    if (!a6) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  __int16 v36 = a6;
  uint64_t v12 = [NSString stringWithUTF8String:identifier];
  uint64_t v13 = container_get_class();
  id v14 = containermanager_copy_global_configuration();
  id v15 = [v14 staticConfig];
  uint64_t v16 = [v15 configForContainerClass:v13];

  if (v16)
  {
    if ([v16 supportedOnPlatform])
    {
      container_is_transient();
      uint64_t persona_unique_string = container_get_persona_unique_string();
      if (persona_unique_string)
      {
        uint64_t v18 = [NSString stringWithUTF8String:persona_unique_string];
      }
      else
      {
        uint64_t v18 = 0;
      }
      uint64_t v20 = +[MCMPOSIXUser posixUserWithUID:container_get_uid()];
      if ([v16 personaAndUserSpecific])
      {
        if (v18)
        {
          id v28 = [v10 userIdentityForPersonaUniqueString:v18 POSIXUser:v20];
        }
        else
        {
          id v28 = v9;
        }
        uint64_t v21 = v28;
        id v22 = (void *)v12;
        a6 = v36;
        if (!v28)
        {
          uint64_t v35 = container_log_handle_for_category();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = (uint64_t)v18;
            _os_log_error_impl(&dword_1D7739000, v35, OS_LOG_TYPE_ERROR, "Cannot reconstitute a user identity from provided persona unique string; personaUniqueString = [%@]",
              buf,
              0xCu);
          }

          uint64_t v21 = 0;
          goto LABEL_38;
        }
        char v32 = [v9 isNoSpecificPersona];
        char v33 = [v9 isEqual:v21];
        if ((v32 & 1) == 0 && (v33 & 1) == 0)
        {
          id v34 = container_log_handle_for_category();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v39 = (uint64_t)v18;
            __int16 v40 = 1024;
            int v41 = 0;
            __int16 v42 = 1024;
            int v43 = 0;
            _os_log_error_impl(&dword_1D7739000, v34, OS_LOG_TYPE_ERROR, "Persona unique string is not valid for this client; personaUniqueString = [%@], nonspecific = %d, sameAsClient = %d",
              buf,
              0x18u);
          }

LABEL_38:
          v23 = 0;
          uint64_t v24 = 76;
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v21 = 0;
        id v22 = (void *)v12;
        a6 = v36;
      }
      uint64_t v29 = [v10 userIdentityForContainerConfig:v16 originatorUserIdentity:v21];

      v23 = [(MCMContainerIdentityMinimal *)self initWithUserIdentity:v29 identifier:v22 containerConfig:v16 platform:0 userIdentityCache:v10 error:&v37];
      uint64_t v21 = (void *)v29;
      self = v23;
      if (!a6) {
        goto LABEL_27;
      }
      goto LABEL_25;
    }
    v27 = container_log_handle_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = v13;
      _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "Container class in container_object_t (%llu) is unsupported", buf, 0xCu);
    }

    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v18 = 0;
    v23 = 0;
    uint64_t v26 = 72;
  }
  else
  {
    v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = v13;
      _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Container class in container_object_t (%llu) is invalid", buf, 0xCu);
    }

    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    v23 = 0;
    uint64_t v26 = 20;
  }
  unint64_t v37 = v26;
  id v22 = (void *)v12;
  a6 = v36;
  if (!v36) {
    goto LABEL_27;
  }
LABEL_25:
  if (!v23) {
    *a6 = v37;
  }
LABEL_27:
  unsigned int v30 = v23;

  return v30;
}

- (MCMContainerIdentityMinimal)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = container_log_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    v6 = "-[MCMContainerIdentityMinimal init]";
    _os_log_fault_impl(&dword_1D7739000, v3, OS_LOG_TYPE_FAULT, "%s You cannot init this class directly.", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

+ (id)minimalContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithPlist:v9 userIdentityCache:v8 error:a5];

  return v10;
}

@end