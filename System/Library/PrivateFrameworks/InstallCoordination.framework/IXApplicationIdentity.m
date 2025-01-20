@interface IXApplicationIdentity
+ (BOOL)supportsSecureCoding;
+ (id)identitiesForBundleIdentifiers:(id)a3;
- (BOOL)isPersonalPersonaPlaceholder;
- (BOOL)resolvePersonaRespectingSandboxingWithError:(id *)a3;
- (BOOL)resolvePersonaWithError:(id *)a3;
- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3;
- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3 personaUniqueString:(id)a4;
- (IXApplicationIdentity)initWithCoder:(id)a3;
- (IXApplicationIdentity)initWithPlistKeySerialization:(id)a3;
- (MIAppIdentity)miAppIdentity;
- (NSString)uniqueIdentifier;
- (id)canonicalSerializationForPlistKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initUsingPersonaFromCurrentThreadAndBundleIdentifier:(id)a3;
- (id)possibleSerializationsForPlistKey;
- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3;
- (void)setIsPersonalPersonaPlaceholder:(BOOL)a3;
@end

@implementation IXApplicationIdentity

- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F6F5D8] sharedInstance];
  v6 = [(MIAppIdentity *)self bundleID];
  id v23 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v23];
  v8 = v23;
  if (!v7)
  {
    v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]();
    }

    uint64_t v18 = _CreateError((uint64_t)"-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 48, @"IXErrorDomain", 1uLL, v8, 0, @"Failed to retrieve application record for bundleID: %@", v17, (uint64_t)v6);
    v9 = 0;
    goto LABEL_13;
  }
  v9 = [v7 identities];
  if ([v9 count] != 1)
  {
    v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]";
      __int16 v26 = 2112;
      v27 = v6;
      __int16 v28 = 2112;
      v29 = v9;
      __int16 v30 = 2112;
      v31 = v8;
      _os_log_error_impl(&dword_1A7B2D000, v19, OS_LOG_TYPE_ERROR, "%s: Discovered multiple personas for app %@, so persona resolution is ambiguous. Found identities: %@ : %@", buf, 0x2Au);
    }

    uint64_t v18 = _CreateError((uint64_t)"-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 58, @"IXErrorDomain", 1uLL, v8, 0, @"Discovered multiple personas for app %@, so persona resolution is ambiguous. Found identities: %@", v20, (uint64_t)v6);
LABEL_13:
    v11 = 0;
    v15 = v8;
    v8 = v18;
    goto LABEL_14;
  }
  v10 = [v9 objectAtIndexedSubscript:0];
  v11 = [v10 personaUniqueString];

  v12 = [v5 systemPersonaUniqueString];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    uint64_t v14 = [v5 primaryPersonaUniqueString];

    v11 = (void *)v14;
  }
  v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]();
  }
LABEL_14:

  if (a3 && !v11) {
    *a3 = v8;
  }
  id v21 = v11;

  return v21;
}

+ (id)identitiesForBundleIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [IXApplicationIdentity alloc];
        v12 = -[IXApplicationIdentity initWithBundleIdentifier:](v11, "initWithBundleIdentifier:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  int v13 = (void *)[v4 copy];

  return v13;
}

- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3 personaUniqueString:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)IXApplicationIdentity;
  id v5 = a4;
  uint64_t v6 = [(MIAppIdentity *)&v9 initWithBundleID:a3 persona:v5];
  uint64_t v7 = objc_msgSend(v5, "isEqualToString:", @"PersonalPersonaPlaceholderString", v9.receiver, v9.super_class);

  [(IXApplicationIdentity *)v6 setIsPersonalPersonaPlaceholder:v7];
  return v6;
}

- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3
{
  return [(IXApplicationIdentity *)self initWithBundleIdentifier:a3 personaUniqueString:@"PersonalPersonaPlaceholderString"];
}

- (id)initUsingPersonaFromCurrentThreadAndBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB3700] currentPersona];
  uint64_t v6 = [v5 userPersonaUniqueString];

  if (v6)
  {
    self = [(IXApplicationIdentity *)self initWithBundleIdentifier:v4 personaUniqueString:v6];
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[IXApplicationIdentity initUsingPersonaFromCurrentThreadAndBundleIdentifier:](v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (IXApplicationIdentity)initWithPlistKeySerialization:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"/"];
  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    }
    else
    {
      if ([v5 count] != 2)
      {
        uint64_t v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          [(IXApplicationIdentity *)(uint64_t)v4 initWithPlistKeySerialization:v6];
        }
        uint64_t v10 = 0;
        uint64_t v7 = @"PersonalPersonaPlaceholderString";
        goto LABEL_18;
      }
      uint64_t v6 = [v5 objectAtIndexedSubscript:0];
      v11 = [v5 objectAtIndexedSubscript:1];
      char v12 = [v11 isEqualToString:@"P"];

      if ((v12 & 1) == 0)
      {
        uint64_t v7 = [v5 objectAtIndexedSubscript:1];
        goto LABEL_5;
      }
    }
    uint64_t v7 = @"PersonalPersonaPlaceholderString";
LABEL_5:
    self = [(IXApplicationIdentity *)self initWithBundleIdentifier:v6 personaUniqueString:v7];
    id v15 = 0;
    BOOL v8 = [(IXApplicationIdentity *)self resolvePersonaWithError:&v15];
    id v9 = v15;
    if (v8)
    {
      [(IXApplicationIdentity *)self setIsPersonalPersonaPlaceholder:[(__CFString *)v7 isEqualToString:@"PersonalPersonaPlaceholderString"]];
      uint64_t v10 = self;
    }
    else
    {
      int v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        long long v17 = "-[IXApplicationIdentity initWithPlistKeySerialization:]";
        __int16 v18 = 2112;
        v19 = v7;
        __int16 v20 = 2112;
        id v21 = v6;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_fault_impl(&dword_1A7B2D000, v13, OS_LOG_TYPE_FAULT, "%s: Failed to resolve persona %@ for %@ : %@", buf, 0x2Au);
      }

      uint64_t v10 = 0;
    }

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v10 = 0;
LABEL_19:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IXApplicationIdentity;
  id v3 = [(MIAppIdentity *)&v6 copyWithZone:a3];
  id v4 = [v3 personaUniqueString];
  objc_msgSend(v3, "setIsPersonalPersonaPlaceholder:", objc_msgSend(v4, "isEqualToString:", @"PersonalPersonaPlaceholderString"));

  return v3;
}

- (NSString)uniqueIdentifier
{
  if ([(IXApplicationIdentity *)self isPersonalPersonaPlaceholder])
  {
    id v3 = @"P";
  }
  else
  {
    id v3 = [(MIAppIdentity *)self personaUniqueString];
  }
  id v4 = NSString;
  id v5 = [(MIAppIdentity *)self bundleID];
  objc_super v6 = [v4 stringWithFormat:@"%@_%@", v5, v3];

  return (NSString *)v6;
}

- (id)canonicalSerializationForPlistKey
{
  BOOL v3 = [(IXApplicationIdentity *)self isPersonalPersonaPlaceholder];
  id v4 = NSString;
  uint64_t v5 = [(MIAppIdentity *)self bundleID];
  objc_super v6 = (void *)v5;
  if (v3)
  {
    uint64_t v7 = [v4 stringWithFormat:@"%@", v5];
  }
  else
  {
    BOOL v8 = [(MIAppIdentity *)self personaUniqueString];
    uint64_t v7 = [v4 stringWithFormat:@"%@%@%@", v6, @"/", v8];
  }

  return v7;
}

- (id)possibleSerializationsForPlistKey
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(IXApplicationIdentity *)self canonicalSerializationForPlistKey];
  v9[0] = v4;
  uint64_t v5 = [(MIAppIdentity *)self bundleID];
  v9[1] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v7 = [v3 setWithArray:v6];

  return v7;
}

- (id)description
{
  if ([(IXApplicationIdentity *)self isPersonalPersonaPlaceholder])
  {
    BOOL v3 = @"P";
  }
  else
  {
    BOOL v3 = [(MIAppIdentity *)self personaUniqueString];
  }
  id v4 = NSString;
  uint64_t v5 = [(MIAppIdentity *)self bundleID];
  objc_super v6 = [v4 stringWithFormat:@"[%@/%@]", v5, v3];

  return v6;
}

- (IXApplicationIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IXApplicationIdentity;
  uint64_t v5 = [(MIAppIdentity *)&v14 initWithCoder:v4];
  objc_super v6 = [(MIAppIdentity *)v5 bundleID];
  uint64_t v7 = [(MIAppIdentity *)v5 personaUniqueString];
  BOOL v8 = (__CFString *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
LABEL_13:
    uint64_t v5 = v5;
    char v12 = v5;
    goto LABEL_14;
  }
  if (v6
    || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"],
        (objc_super v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (!v8)
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
      if (v10) {
        BOOL v8 = (__CFString *)v10;
      }
      else {
        BOOL v8 = @"PersonalPersonaPlaceholderString";
      }
    }
    v11 = [(MIAppIdentity *)[IXApplicationIdentity alloc] initWithBundleID:v6 persona:v8];

    uint64_t v5 = v11;
    goto LABEL_13;
  }
  objc_super v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[IXApplicationIdentity initWithCoder:](v6);
  }
  char v12 = 0;
LABEL_14:

  return v12;
}

- (BOOL)resolvePersonaWithError:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)IXApplicationIdentity;
  id v14 = 0;
  BOOL v5 = [(MIAppIdentity *)&v13 resolvePersonaWithError:&v14];
  id v6 = v14;
  if (!v5)
  {
    uint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(IXApplicationIdentity *)self resolvePersonaWithError:v7];
    }

    BOOL v8 = [(MIAppIdentity *)self bundleID];
    uint64_t v10 = _CreateError((uint64_t)"-[IXApplicationIdentity resolvePersonaWithError:]", 234, @"IXErrorDomain", 0x38uLL, v6, 0, @"Client provided invalid persona for %@", v9, (uint64_t)v8);

    if (a3)
    {
      id v6 = v10;
      *a3 = v6;
    }
    else
    {
      id v6 = v10;
    }
  }
  if ([(MIAppIdentity *)self isResolved])
  {
    [(IXApplicationIdentity *)self setIsPersonalPersonaPlaceholder:0];
  }
  else
  {
    v11 = [(MIAppIdentity *)self personaUniqueString];
    -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:](self, "setIsPersonalPersonaPlaceholder:", [v11 isEqualToString:@"PersonalPersonaPlaceholderString"]);
  }
  return v5;
}

- (MIAppIdentity)miAppIdentity
{
  id v3 = objc_alloc(MEMORY[0x1E4F6F5A8]);
  id v4 = [(MIAppIdentity *)self bundleID];
  BOOL v5 = [(MIAppIdentity *)self personaUniqueString];
  id v6 = (void *)[v3 initWithBundleID:v4 persona:v5];

  objc_msgSend(v6, "setIsResolved:", -[MIAppIdentity isResolved](self, "isResolved"));

  return (MIAppIdentity *)v6;
}

- (BOOL)resolvePersonaRespectingSandboxingWithError:(id *)a3
{
  if (![(IXApplicationIdentity *)self isPersonalPersonaPlaceholder])
  {
    id v5 = 0;
    BOOL v6 = 1;
    goto LABEL_11;
  }
  if (_ProcessCanAccessUM_onceToken != -1) {
    dispatch_once(&_ProcessCanAccessUM_onceToken, &__block_literal_global_10);
  }
  if (_ProcessCanAccessUM_canQueryUM)
  {
    id v5 = 0;
    goto LABEL_8;
  }
  id v7 = (id) _ProcessCanAccessUM_error;
  int v8 = _ProcessCanAccessUM_canQueryUM;
  id v5 = v7;
  if (v8)
  {
LABEL_8:
    id v11 = v5;
    BOOL v6 = [(IXApplicationIdentity *)self resolvePersonaWithError:&v11];
    id v9 = v11;

    id v5 = v9;
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  BOOL v6 = 0;
  if (!a3) {
    goto LABEL_11;
  }
LABEL_9:
  if (!v6)
  {
    id v5 = v5;
    BOOL v6 = 0;
    *a3 = v5;
  }
LABEL_11:

  return v6;
}

- (BOOL)isPersonalPersonaPlaceholder
{
  return self->_isPersonalPersonaPlaceholder;
}

- (void)setIsPersonalPersonaPlaceholder:(BOOL)a3
{
  self->_isPersonalPersonaPlaceholder = a3;
}

- (void)initUsingPersonaFromCurrentThreadAndBundleIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[IXApplicationIdentity initUsingPersonaFromCurrentThreadAndBundleIdentifier:]";
  _os_log_fault_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_FAULT, "%s: UserManagement returned nil for the current thread's persona", (uint8_t *)&v1, 0xCu);
}

- (void)initWithPlistKeySerialization:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a2 count];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_fault_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_FAULT, "%s: Failed to parse the plist key: %@ as there are unexpected components: %lu", (uint8_t *)v6, 0x20u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[IXApplicationIdentity initWithCoder:]";
  _os_log_fault_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_FAULT, "%s: Failed to deserialize bundle ID for identity", (uint8_t *)&v1, 0xCu);
}

- (void)resolvePersonaWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 bundleID];
  v8[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  uint64_t v9 = v6;
  __int16 v10 = v7;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_ERROR, "%s: Client provided invalid persona for %@ : %@", (uint8_t *)v8, 0x20u);
}

@end