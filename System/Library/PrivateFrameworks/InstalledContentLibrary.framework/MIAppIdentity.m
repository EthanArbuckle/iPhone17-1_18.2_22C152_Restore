@interface MIAppIdentity
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateAppIdentity:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResolved;
- (BOOL)resolvePersonaWithError:(id *)a3;
- (MIAppIdentity)initWithBundleID:(id)a3;
- (MIAppIdentity)initWithBundleID:(id)a3 persona:(id)a4;
- (MIAppIdentity)initWithCoder:(id)a3;
- (NSString)bundleID;
- (NSString)personaUniqueString;
- (id)_eligiblePersonaForBundle:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setIsResolved:(BOOL)a3;
- (void)setPersonaUniqueString:(id)a3;
@end

@implementation MIAppIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIAppIdentity)initWithBundleID:(id)a3 persona:(id)a4
{
  id v7 = a3;
  v8 = (__CFString *)a4;
  v12.receiver = self;
  v12.super_class = (Class)MIAppIdentity;
  v9 = [(MIAppIdentity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    if (!v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        -[MIAppIdentity initWithBundleID:persona:]((uint64_t)v7);
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      v8 = @"PersonalPersonaPlaceholderString";
    }
    objc_storeStrong((id *)&v10->_personaUniqueString, v8);
    v10->_isResolved = 0;
  }

  return v10;
}

- (MIAppIdentity)initWithBundleID:(id)a3
{
  return [(MIAppIdentity *)self initWithBundleID:a3 persona:@"PersonalPersonaPlaceholderString"];
}

- (MIAppIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIAppIdentity;
  v5 = [(MIAppIdentity *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v8;

    v5->_isResolved = [v4 decodeBoolForKey:@"isResolved"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(MIAppIdentity *)self bundleID];
  [v6 encodeObject:v4 forKey:@"bundleID"];

  v5 = [(MIAppIdentity *)self personaUniqueString];
  [v6 encodeObject:v5 forKey:@"personaUniqueString"];

  objc_msgSend(v6, "encodeBool:forKey:", -[MIAppIdentity isResolved](self, "isResolved"), @"isResolved");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(MIAppIdentity *)self bundleID];
  [v4 setBundleID:v5];

  id v6 = [(MIAppIdentity *)self personaUniqueString];
  [v4 setPersonaUniqueString:v6];

  objc_msgSend(v4, "setIsResolved:", -[MIAppIdentity isResolved](self, "isResolved"));
  return v4;
}

- (unint64_t)hash
{
  v3 = [(MIAppIdentity *)self bundleID];
  uint64_t v4 = [v3 hash];
  v5 = [(MIAppIdentity *)self personaUniqueString];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MIAppIdentity *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(MIAppIdentity *)self bundleID];
      id v7 = [(MIAppIdentity *)v5 bundleID];
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        v9 = [(MIAppIdentity *)self personaUniqueString];
        v10 = [(MIAppIdentity *)v5 personaUniqueString];
        BOOL v11 = MICompareObjects(v9, v10);
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(MIAppIdentity *)self bundleID];
  v5 = [(MIAppIdentity *)self personaUniqueString];
  unint64_t v6 = [v3 stringWithFormat:@"[%@/%@]", v4, v5];

  return v6;
}

+ (BOOL)validateAppIdentity:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v7 = v5;
  if (v5)
  {
    BOOL v8 = [v5 bundleID];

    if (v8)
    {
      v9 = [v7 personaUniqueString];

      if (v9)
      {
        id v10 = 0;
        BOOL v11 = 1;
        goto LABEL_11;
      }
      objc_super v12 = @"app identity has nil personaUniqueString";
      uint64_t v13 = 147;
    }
    else
    {
      objc_super v12 = @"app identity has nil bundle identifier";
      uint64_t v13 = 142;
    }
  }
  else
  {
    objc_super v12 = @"app identity is nil";
    uint64_t v13 = 137;
  }
  _CreateError((uint64_t)"+[MIAppIdentity validateAppIdentity:withError:]", v13, @"MIInstallerErrorDomain", 25, 0, 0, v12, v6, v15);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    id v10 = v10;
    BOOL v11 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)_eligiblePersonaForBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[MIUserManagement sharedInstance];
  BOOL v8 = +[MIGlobalConfiguration sharedInstance];
  v9 = [v8 systemAppPlaceholderBundleIDs];
  int v10 = [v9 containsObject:v6];

  if (v10)
  {
    BOOL v11 = [v7 primaryPersonaUniqueString];
    objc_super v12 = 0;
    goto LABEL_18;
  }
  id v28 = 0;
  uint64_t v13 = +[MIBundleContainer appBundleContainerForIdentifier:v6 inDomain:2 withError:&v28];
  id v14 = v28;
  objc_super v12 = v14;
  if (v13)
  {
    uint64_t v15 = [v13 bundle];

    if (v15)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_25;
      }
      id v27 = v12;
      BOOL v11 = [(MIAppIdentity *)self resolvePersonaUsingModuleSpecificLogicWithError:&v27];
      id v16 = v27;

      if (v11) {
        goto LABEL_29;
      }
      v17 = [v16 domain];
      if ([v17 isEqualToString:@"MIInstallerErrorDomain"])
      {
        uint64_t v18 = [v16 code];

        if (v18 == 161)
        {
LABEL_24:

          objc_super v12 = 0;
          goto LABEL_25;
        }
      }
      else
      {
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 4)
      {
        v24 = v13;
        id v25 = v16;
        id v23 = v6;
        MOLogWrite();
      }
      goto LABEL_24;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 4)
    {
      id v23 = v13;
      MOLogWrite();
    }
LABEL_25:
    id v26 = v12;
    BOOL v11 = objc_msgSend(v7, "personaForBundleID:error:", v6, &v26, v23, v24, v25);
    id v21 = v26;

    objc_super v12 = v21;
    if (!a4) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  v19 = [v14 domain];
  if ([v19 isEqualToString:@"MIContainerManagerErrorDomain"])
  {
    uint64_t v20 = [v12 code];

    if (v20 == 21) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  BOOL v11 = 0;
LABEL_18:
  uint64_t v13 = 0;
  if (!a4) {
    goto LABEL_28;
  }
LABEL_26:
  if (!v11)
  {
    id v16 = v12;
    *a4 = v16;
    goto LABEL_29;
  }
LABEL_28:
  id v16 = v12;
LABEL_29:

  return v11;
}

- (BOOL)resolvePersonaWithError:(id *)a3
{
  BOOL v5 = [(MIAppIdentity *)self isResolved];
  id v6 = [(MIAppIdentity *)self personaUniqueString];
  id v7 = [(MIAppIdentity *)self bundleID];
  if (v5)
  {
    id v8 = 0;
    id v9 = 0;
    BOOL v10 = 1;
    goto LABEL_30;
  }
  BOOL v11 = +[MIGlobalConfiguration sharedInstance];
  int v12 = [v11 isSharediPad];

  if (v12)
  {
    id v9 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14060]];
    id v8 = 0;
    goto LABEL_5;
  }
  if (v6)
  {
    if ([v6 isEqualToString:@"Invalid"])
    {
      _CreateAndLogError((uint64_t)"-[MIAppIdentity resolvePersonaWithError:]", 238, @"MIInstallerErrorDomain", 191, 0, 0, @"Client provided invalid persona for %@", v13, (uint64_t)v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!a3) {
        goto LABEL_29;
      }
LABEL_26:
      id v8 = v8;
      BOOL v10 = 0;
      id v9 = 0;
      *a3 = v8;
      goto LABEL_30;
    }
    if ([v6 isEqualToString:@"PersonalPersonaPlaceholderString"])
    {
      id v32 = 0;
      id v9 = [(MIAppIdentity *)self _eligiblePersonaForBundle:v7 error:&v32];
      id v8 = v32;
      if (!v9)
      {
        _CreateAndLogError((uint64_t)"-[MIAppIdentity resolvePersonaWithError:]", 243, @"MIInstallerErrorDomain", 191, v8, 0, @"Failed to resolve persona %@", v15, (uint64_t)self);
        goto LABEL_25;
      }
      goto LABEL_5;
    }
    id v16 = +[MIUserManagement sharedInstance];
    id v31 = 0;
    char v17 = [v16 isKnownPersonaUniqueString:v6 error:&v31];
    id v19 = v31;
    if (v17)
    {
      uint64_t v20 = [v16 systemPersonaUniqueString];
      int v21 = [v6 isEqualToString:v20];

      if (!v21)
      {
        id v8 = v19;
LABEL_32:
        id v9 = v6;

        id v6 = v9;
        goto LABEL_5;
      }
      id v30 = v19;
      v22 = [v16 multiPersonaSADAppBundleIDsWithError:&v30];
      id v8 = v30;

      if (v22)
      {
        if ([v22 containsObject:v7])
        {
          uint64_t v23 = [v16 primaryPersonaUniqueString];

          id v6 = (void *)v23;
        }

        goto LABEL_32;
      }
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MIAppIdentity resolvePersonaWithError:]", 250, @"MIInstallerErrorDomain", 191, v19, 0, @"Client provided invalid persona for %@", v18, (uint64_t)v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a3) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }
  id v29 = 0;
  id v9 = [(MIAppIdentity *)self _eligiblePersonaForBundle:v7 error:&v29];
  id v8 = v29;
  if (!v9)
  {
    _CreateAndLogError((uint64_t)"-[MIAppIdentity resolvePersonaWithError:]", 271, @"MIInstallerErrorDomain", 191, v8, 0, @"Failed to resolve persona %@", v14, (uint64_t)self);
    uint64_t v24 = LABEL_25:;

    id v8 = (id)v24;
    if (a3) {
      goto LABEL_26;
    }
LABEL_29:
    BOOL v10 = 0;
    id v9 = 0;
    goto LABEL_30;
  }
  id v6 = 0;
LABEL_5:
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    id v27 = v6;
    id v28 = v9;
    id v26 = v7;
    MOLogWrite();
  }
  -[MIAppIdentity setPersonaUniqueString:](self, "setPersonaUniqueString:", v9, v26, v27, v28);
  BOOL v10 = 1;
  [(MIAppIdentity *)self setIsResolved:1];
LABEL_30:

  return v10;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (BOOL)isResolved
{
  return self->_isResolved;
}

- (void)setIsResolved:(BOOL)a3
{
  self->_isResolved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)initWithBundleID:(uint64_t)a1 persona:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  v2 = "-[MIAppIdentity initWithBundleID:persona:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_fault_impl(&dword_1BCA62000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: Unexpectedly got nil persona for %@", (uint8_t *)&v1, 0x16u);
}

@end