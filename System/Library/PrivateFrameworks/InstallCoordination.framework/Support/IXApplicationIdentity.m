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

+ (id)identitiesForBundleIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [IXApplicationIdentity alloc];
        v12 = -[IXApplicationIdentity initWithBundleIdentifier:](v11, "initWithBundleIdentifier:", v10, (void)v15);
        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3 personaUniqueString:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)IXApplicationIdentity;
  id v5 = a4;
  id v6 = [(IXApplicationIdentity *)&v9 initWithBundleID:a3 persona:v5];
  id v7 = objc_msgSend(v5, "isEqualToString:", @"PersonalPersonaPlaceholderString", v9.receiver, v9.super_class);

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
  id v5 = +[UMUserPersona currentPersona];
  id v6 = [v5 userPersonaUniqueString];

  if (v6)
  {
    self = [(IXApplicationIdentity *)self initWithBundleIdentifier:v4 personaUniqueString:v6];
    id v7 = self;
  }
  else
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10008BCA8(v8);
    }

    id v7 = 0;
  }

  return v7;
}

- (IXApplicationIdentity)initWithPlistKeySerialization:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"/"];
  if ([v5 count])
  {
    if ([v5 count] == (id)1)
    {
      id v6 = [v5 objectAtIndexedSubscript:0];
    }
    else
    {
      if ([v5 count] != (id)2)
      {
        id v6 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          sub_10008BD2C((uint64_t)v4, v5, v6);
        }
        uint64_t v10 = 0;
        id v7 = @"PersonalPersonaPlaceholderString";
        goto LABEL_18;
      }
      id v6 = [v5 objectAtIndexedSubscript:0];
      v11 = [v5 objectAtIndexedSubscript:1];
      unsigned __int8 v12 = [v11 isEqualToString:@"P"];

      if ((v12 & 1) == 0)
      {
        id v7 = [v5 objectAtIndexedSubscript:1];
        goto LABEL_5;
      }
    }
    id v7 = @"PersonalPersonaPlaceholderString";
LABEL_5:
    self = [(IXApplicationIdentity *)self initWithBundleIdentifier:v6 personaUniqueString:v7];
    id v15 = 0;
    unsigned __int8 v8 = [(IXApplicationIdentity *)self resolvePersonaWithError:&v15];
    id v9 = v15;
    if (v8)
    {
      [(IXApplicationIdentity *)self setIsPersonalPersonaPlaceholder:[(__CFString *)v7 isEqualToString:@"PersonalPersonaPlaceholderString"]];
      uint64_t v10 = self;
    }
    else
    {
      id v13 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        long long v17 = "-[IXApplicationIdentity initWithPlistKeySerialization:]";
        __int16 v18 = 2112;
        v19 = v7;
        __int16 v20 = 2112;
        v21 = v6;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s: Failed to resolve persona %@ for %@ : %@", buf, 0x2Au);
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
  id v3 = [(IXApplicationIdentity *)&v6 copyWithZone:a3];
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
    id v3 = [(IXApplicationIdentity *)self personaUniqueString];
  }
  id v4 = [(IXApplicationIdentity *)self bundleID];
  id v5 = +[NSString stringWithFormat:@"%@_%@", v4, v3];

  return (NSString *)v5;
}

- (id)canonicalSerializationForPlistKey
{
  unsigned int v3 = [(IXApplicationIdentity *)self isPersonalPersonaPlaceholder];
  uint64_t v4 = [(IXApplicationIdentity *)self bundleID];
  id v5 = (void *)v4;
  if (v3)
  {
    objc_super v6 = +[NSString stringWithFormat:@"%@", v4];
  }
  else
  {
    id v7 = [(IXApplicationIdentity *)self personaUniqueString];
    objc_super v6 = +[NSString stringWithFormat:@"%@%@%@", v5, @"/", v7];
  }

  return v6;
}

- (id)possibleSerializationsForPlistKey
{
  unsigned int v3 = [(IXApplicationIdentity *)self canonicalSerializationForPlistKey];
  v8[0] = v3;
  uint64_t v4 = [(IXApplicationIdentity *)self bundleID];
  v8[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  objc_super v6 = +[NSSet setWithArray:v5];

  return v6;
}

- (id)description
{
  if ([(IXApplicationIdentity *)self isPersonalPersonaPlaceholder])
  {
    unsigned int v3 = @"P";
  }
  else
  {
    unsigned int v3 = [(IXApplicationIdentity *)self personaUniqueString];
  }
  uint64_t v4 = [(IXApplicationIdentity *)self bundleID];
  id v5 = +[NSString stringWithFormat:@"[%@/%@]", v4, v3];

  return v5;
}

- (IXApplicationIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IXApplicationIdentity;
  id v5 = [(IXApplicationIdentity *)&v14 initWithCoder:v4];
  objc_super v6 = [(IXApplicationIdentity *)v5 bundleID];
  uint64_t v7 = [(IXApplicationIdentity *)v5 personaUniqueString];
  unsigned __int8 v8 = (__CFString *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
LABEL_13:
    id v5 = v5;
    unsigned __int8 v12 = v5;
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
        unsigned __int8 v8 = (__CFString *)v10;
      }
      else {
        unsigned __int8 v8 = @"PersonalPersonaPlaceholderString";
      }
    }
    v11 = [[IXApplicationIdentity alloc] initWithBundleID:v6 persona:v8];

    id v5 = v11;
    goto LABEL_13;
  }
  objc_super v6 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_10008BDD8(v6);
  }
  unsigned __int8 v12 = 0;
LABEL_14:

  return v12;
}

- (BOOL)resolvePersonaWithError:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)IXApplicationIdentity;
  id v14 = 0;
  BOOL v5 = [(IXApplicationIdentity *)&v13 resolvePersonaWithError:&v14];
  id v6 = v14;
  if (!v5)
  {
    uint64_t v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10008BE5C(self, (uint64_t)v6, v7);
    }

    unsigned __int8 v8 = [(IXApplicationIdentity *)self bundleID];
    uint64_t v10 = sub_10003DAE4((uint64_t)"-[IXApplicationIdentity resolvePersonaWithError:]", 234, @"IXErrorDomain", 0x38uLL, v6, 0, @"Client provided invalid persona for %@", v9, (uint64_t)v8);

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
  if ([(IXApplicationIdentity *)self isResolved])
  {
    [(IXApplicationIdentity *)self setIsPersonalPersonaPlaceholder:0];
  }
  else
  {
    v11 = [(IXApplicationIdentity *)self personaUniqueString];
    -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:](self, "setIsPersonalPersonaPlaceholder:", [v11 isEqualToString:@"PersonalPersonaPlaceholderString"]);
  }
  return v5;
}

- (MIAppIdentity)miAppIdentity
{
  id v3 = objc_alloc((Class)MIAppIdentity);
  id v4 = [(IXApplicationIdentity *)self bundleID];
  BOOL v5 = [(IXApplicationIdentity *)self personaUniqueString];
  id v6 = [v3 initWithBundleID:v4 persona:v5];

  objc_msgSend(v6, "setIsResolved:", -[IXApplicationIdentity isResolved](self, "isResolved"));

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
  if (qword_100109DC8 != -1) {
    dispatch_once(&qword_100109DC8, &stru_1000E90C8);
  }
  if (byte_100109DB8)
  {
    id v5 = 0;
    goto LABEL_8;
  }
  id v7 = (id) qword_100109DC0;
  int v8 = byte_100109DB8;
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

- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3
{
  id v5 = +[MIUserManagement sharedInstance];
  BOOL v6 = [(IXApplicationIdentity *)self bundleID];
  id v23 = 0;
  id v7 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v23];
  int v8 = v23;
  if (!v7)
  {
    long long v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000913C4();
    }

    uint64_t v18 = sub_10003DAE4((uint64_t)"-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 48, @"IXErrorDomain", 1uLL, v8, 0, @"Failed to retrieve application record for bundleID: %@", v17, (uint64_t)v6);
    id v9 = 0;
    goto LABEL_13;
  }
  id v9 = [v7 identities];
  if ([v9 count] != (id)1)
  {
    v19 = sub_100004B28((uint64_t)off_100109BB8);
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
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Discovered multiple personas for app %@, so persona resolution is ambiguous. Found identities: %@ : %@", buf, 0x2Au);
    }

    uint64_t v18 = sub_10003DAE4((uint64_t)"-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 58, @"IXErrorDomain", 1uLL, v8, 0, @"Discovered multiple personas for app %@, so persona resolution is ambiguous. Found identities: %@", v20, (uint64_t)v6);
LABEL_13:
    id v11 = 0;
    id v15 = v8;
    int v8 = v18;
    goto LABEL_14;
  }
  uint64_t v10 = [v9 objectAtIndexedSubscript:0];
  id v11 = [v10 personaUniqueString];

  unsigned __int8 v12 = [v5 systemPersonaUniqueString];
  unsigned int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    uint64_t v14 = [v5 primaryPersonaUniqueString];

    id v11 = (void *)v14;
  }
  id v15 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100091448();
  }
LABEL_14:

  if (a3 && !v11) {
    *a3 = v8;
  }
  id v21 = v11;

  return v21;
}

@end