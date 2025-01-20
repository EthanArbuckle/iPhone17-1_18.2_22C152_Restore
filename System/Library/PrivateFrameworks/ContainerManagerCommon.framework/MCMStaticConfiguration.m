@interface MCMStaticConfiguration
+ (id)defaultPlistDirectoryURL;
- (BOOL)attemptMetadataReconstructionIfMissing;
- (BOOL)errorOnPersonaPropagationFailure;
- (BOOL)loadWithError:(id *)a3;
- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4;
- (Class)containerConfigClass;
- (MCMPOSIXUser)defaultUser;
- (NSDictionary)containerConfigMap;
- (NSString)debugDescription;
- (id)_posixUserFromPlistValue:(id)a3;
- (id)configForContainerClass:(unint64_t)a3;
- (id)descriptionForContainerConfiguration;
- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4;
- (void)setContainerConfigClass:(Class)a3;
@end

@implementation MCMStaticConfiguration

- (id)configForContainerClass:(unint64_t)a3
{
  containerConfigMapByEnum = self->_containerConfigMapByEnum;
  v4 = [NSNumber numberWithUnsignedLongLong:container_class_normalized()];
  v5 = [(NSDictionary *)containerConfigMapByEnum objectForKeyedSubscript:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerConfigMap, 0);
  objc_storeStrong((id *)&self->_defaultUser, 0);

  objc_storeStrong((id *)&self->_containerConfigMapByEnum, 0);
}

- (NSDictionary)containerConfigMap
{
  return self->_containerConfigMap;
}

- (MCMPOSIXUser)defaultUser
{
  return self->_defaultUser;
}

- (BOOL)attemptMetadataReconstructionIfMissing
{
  return self->_attemptMetadataReconstructionIfMissing;
}

- (BOOL)errorOnPersonaPropagationFailure
{
  return self->_errorOnPersonaPropagationFailure;
}

- (void)setContainerConfigClass:(Class)a3
{
  self->_containerConfigClass = a3;
}

- (Class)containerConfigClass
{
  Class containerConfigClass = self->_containerConfigClass;

  return containerConfigClass;
}

- (id)descriptionForContainerConfiguration
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(MCMStaticConfiguration *)self containerConfigMap];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    v6 = @"containerConfiguration: {\n";
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v9 = [(MCMStaticConfiguration *)self containerConfigMap];
        v10 = [v9 objectForKeyedSubscript:v8];

        v11 = [(__CFString *)v6 stringByAppendingFormat:@"\t%@: {\n", v8];

        v12 = [v10 debugDescriptionWithIndentString:@"\t\t"];
        v13 = [v11 stringByAppendingString:v12];

        v6 = [v13 stringByAppendingString:@"\t}\n"];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    v6 = @"containerConfiguration: {\n";
  }

  v14 = [(__CFString *)v6 stringByAppendingString:@"}\n"];

  return v14;
}

- (id)_posixUserFromPlistValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if ([v6 isEqualToString:@"current"])
    {
      v7 = +[MCMPOSIXUser currentPOSIXUser];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = +[MCMPOSIXUser posixUserWithName:v3];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)debugDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MCMStaticConfiguration;
  id v3 = [(MCMPlistReadOnly *)&v10 descriptionOfBoolPropertiesWithIndentString:0];
  uint64_t v4 = NSStringFromSelector(sel_defaultUser);
  id v5 = [(MCMStaticConfiguration *)self defaultUser];
  id v6 = [v3 stringByAppendingFormat:@"%@: %@\n", v4, v5];

  v7 = [(MCMStaticConfiguration *)self descriptionForContainerConfiguration];
  uint64_t v8 = [v6 stringByAppendingString:v7];

  return (NSString *)v8;
}

- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"containerConfiguration"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  v38 = v5;

  v9 = (void *)MEMORY[0x1E4F1CC08];
  if (v8) {
    v9 = v8;
  }
  id v10 = v9;

  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v37 = self;
  v12 = [(MCMStaticConfiguration *)self containerConfigClass];
  if (!v12) {
    v12 = (objc_class *)objc_opt_class();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    uint64_t v17 = MEMORY[0x1E4F1CC08];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        long long v20 = [v13 objectForKeyedSubscript:v19];
        objc_opt_class();
        id v21 = v20;
        if (objc_opt_isKindOfClass()) {
          id v22 = v21;
        }
        else {
          id v22 = 0;
        }

        if (!v22 || (v23 = (void *)[[v12 alloc] initWithPreprocessedPlist:v22 name:v19]) == 0) {
          v23 = (void *)[[v12 alloc] initWithPreprocessedPlist:v17 name:v19];
        }
        [v11 setObject:v23 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v39 count:16];
    }
    while (v15);
  }

  uint64_t v24 = [v11 copy];
  containerConfigMap = v37->_containerConfigMap;
  v37->_containerConfigMap = (NSDictionary *)v24;

  v26 = NSStringFromSelector(sel_defaultUser);
  v27 = [v38 objectForKeyedSubscript:v26];

  if (v27
    && ([(MCMStaticConfiguration *)v37 _posixUserFromPlistValue:v27],
        uint64_t v28 = objc_claimAutoreleasedReturnValue(),
        defaultUser = v37->_defaultUser,
        v37->_defaultUser = (MCMPOSIXUser *)v28,
        defaultUser,
        !v37->_defaultUser))
  {
    v33 = [MCMError alloc];
    v34 = [(MCMPlistReadOnly *)v37 sourceFileURL];
    v35 = [v34 path];
    v30 = [(MCMError *)v33 initWithErrorType:149 category:5 path:v35 POSIXerrno:100];

    if (a4)
    {
      v30 = v30;
      BOOL v31 = 0;
      *a4 = v30;
    }
    else
    {
      BOOL v31 = 0;
    }
  }
  else
  {
    v30 = 0;
    BOOL v31 = 1;
  }

  return v31;
}

- (BOOL)loadWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v26.receiver = self;
  v26.super_class = (Class)MCMStaticConfiguration;
  id v27 = 0;
  unsigned int v6 = [(MCMPlistReadOnly *)&v26 loadWithError:&v27];
  id v7 = v27;
  id v8 = v7;
  if (v6)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v9 = [(MCMStaticConfiguration *)self containerConfigMap];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (!v10)
    {
LABEL_12:

      long long v20 = (NSDictionary *)[v5 copy];
      containerConfigMapByEnum = self->_containerConfigMapByEnum;
      self->_containerConfigMapByEnum = v20;

      BOOL v22 = 1;
      id v18 = v8;
      goto LABEL_17;
    }
    uint64_t v11 = v10;
    uint64_t v24 = a3;
    uint64_t v12 = *(void *)v30;
LABEL_4:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v30 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * v13);
      uint64_t v15 = [(MCMStaticConfiguration *)self containerConfigMap];
      uint64_t v16 = [v15 objectForKeyedSubscript:v14];

      if (v16)
      {
        id v25 = v8;
        int v17 = [v16 loadWithError:&v25];
        id v18 = v25;

        if (!v17)
        {

          a3 = v24;
          if (v24) {
            goto LABEL_14;
          }
LABEL_16:
          BOOL v22 = 0;
          goto LABEL_17;
        }
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "containerClass"));
        [v5 setObject:v16 forKeyedSubscript:v19];

        id v8 = v18;
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
        if (v11) {
          goto LABEL_4;
        }
        goto LABEL_12;
      }
    }
  }
  id v18 = v7;
  if (!a3) {
    goto LABEL_16;
  }
LABEL_14:
  id v18 = v18;
  BOOL v22 = 0;
  *a3 = v18;
LABEL_17:

  return v22;
}

- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MCMStaticConfiguration;
  uint64_t v4 = [(MCMPlistReadOnly *)&v8 initFromPlistAtPathOrName:a3 defaultPlistDirectoryURL:a4 conformingToProtocol:&unk_1F2F1E0A8];
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = (void *)v4[11];
    v4[11] = 0;
  }
  return v5;
}

+ (id)defaultPlistDirectoryURL
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (defaultPlistDirectoryURL_onceToken != -1) {
    dispatch_once(&defaultPlistDirectoryURL_onceToken, &__block_literal_global_6605);
  }
  v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(id)defaultPlistDirectoryURL_defaultURL path];
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D7739000, v2, OS_LOG_TYPE_DEFAULT, "defaultPlistDirectoryURL: [%@]", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = (void *)defaultPlistDirectoryURL_defaultURL;

  return v4;
}

uint64_t __50__MCMStaticConfiguration_defaultPlistDirectoryURL__block_invoke()
{
  defaultPlistDirectoryURL_defaultURL = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:"/System/Library/PrivateFrameworks/ContainerManagerCommon.framework" isDirectory:1 relativeToURL:0];

  return MEMORY[0x1F41817F8]();
}

@end