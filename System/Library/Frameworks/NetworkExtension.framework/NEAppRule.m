@interface NEAppRule
+ (BOOL)supportsSecureCoding;
- (BOOL)allowEmptyDesignatedRequirement;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)noDivertDNS;
- (BOOL)noRestriction;
- (BOOL)overlapsWithRule:(id)a3;
- (BOOL)signingIdentifierAllowed:(id)a3 domainsOrAccountsRequired:(BOOL *)a4;
- (NEAppRule)initWithCoder:(id)a3;
- (NEAppRule)initWithSigningIdentifier:(NSString *)signingIdentifier;
- (NSArray)cachedMachOUUIDs;
- (NSArray)matchAccountIdentifiers;
- (NSArray)matchDomains;
- (NSArray)matchTools;
- (NSString)matchDesignatedRequirement;
- (NSString)matchPath;
- (NSString)matchSigningIdentifier;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowEmptyDesignatedRequirement:(BOOL)a3;
- (void)setCachedMachOUUIDs:(id)a3;
- (void)setMatchAccountIdentifiers:(id)a3;
- (void)setMatchDomains:(NSArray *)matchDomains;
- (void)setMatchPath:(NSString *)matchPath;
- (void)setMatchTools:(NSArray *)matchTools;
- (void)setNoDivertDNS:(BOOL)a3;
- (void)setNoRestriction:(BOOL)a3;
@end

@implementation NEAppRule

- (NSString)matchSigningIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NEAppRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NEAppRule;
  v5 = [(NEAppRule *)&v21 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MatchDomains"];
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"MatchAccountIdentifiers"];
    matchAccountIdentifiers = v5->_matchAccountIdentifiers;
    v5->_matchAccountIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SigningIdentifier"];
    matchSigningIdentifier = v5->_matchSigningIdentifier;
    v5->_matchSigningIdentifier = (NSString *)v16;

    v5->_allowEmptyDesignatedRequirement = [v4 decodeBoolForKey:@"AllowEmptyDesignatedRequirement"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Path"];
    matchPath = v5->_matchPath;
    v5->_matchPath = (NSString *)v18;

    v5->_noDivertDNS = [v4 decodeBoolForKey:@"NoDivertDNS"];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedMachOUUIDs, 0);
  objc_storeStrong((id *)&self->_matchTools, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_matchPath, 0);
  objc_storeStrong((id *)&self->_matchDesignatedRequirement, 0);

  objc_storeStrong((id *)&self->_matchSigningIdentifier, 0);
}

- (void)setAllowEmptyDesignatedRequirement:(BOOL)a3
{
  self->_allowEmptyDesignatedRequirement = a3;
}

- (BOOL)allowEmptyDesignatedRequirement
{
  return self->_allowEmptyDesignatedRequirement;
}

- (void)setNoDivertDNS:(BOOL)a3
{
  self->_noDivertDNS = a3;
}

- (BOOL)noDivertDNS
{
  return self->_noDivertDNS;
}

- (void)setMatchAccountIdentifiers:(id)a3
{
}

- (NSArray)matchAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCachedMachOUUIDs:(id)a3
{
}

- (NSArray)cachedMachOUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNoRestriction:(BOOL)a3
{
  self->_noRestriction = a3;
}

- (BOOL)noRestriction
{
  return self->_noRestriction;
}

- (void)setMatchTools:(NSArray *)matchTools
{
}

- (NSArray)matchTools
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMatchDomains:(NSArray *)matchDomains
{
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMatchPath:(NSString *)matchPath
{
}

- (NSString)matchPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)matchDesignatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)signingIdentifierAllowed:(id)a3 domainsOrAccountsRequired:(BOOL *)a4
{
  id v5 = a3;
  *a4 = 0;
  if ([v5 hasPrefix:@"com.apple."])
  {
    uint64_t v6 = 0;
    while (strcmp((const char *)[v5 UTF8String], (&signingIdentifierAllowed_domainsOrAccountsRequired__com_apple_exceptions)[v6]))
    {
      v6 += 2;
      if (v6 == 24) {
        goto LABEL_7;
      }
    }
    *a4 = 1;
  }
LABEL_7:

  return 1;
}

- (BOOL)overlapsWithRule:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NEAppRule *)self matchSigningIdentifier];
  uint64_t v6 = [v4 matchSigningIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_46;
  }
  v8 = [(NEAppRule *)self matchDomains];
  if ([v8 count])
  {
  }
  else
  {
    uint64_t v9 = [v4 matchDomains];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      int v30 = 0;
      char v16 = 0;
      goto LABEL_24;
    }
  }
  v11 = [(NEAppRule *)self matchDomains];
  if (![v11 count])
  {

    goto LABEL_21;
  }
  uint64_t v12 = [v4 matchDomains];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
LABEL_21:
    int v30 = 1;
    char v16 = 1;
    goto LABEL_24;
  }
  uint64_t v14 = [(NEAppRule *)self matchDomains];
  uint64_t v15 = [v14 count];

  char v16 = 0;
  if (v15)
  {
    unint64_t v17 = 0;
    do
    {
      uint64_t v18 = [(NEAppRule *)self matchDomains];
      v19 = [v18 objectAtIndexedSubscript:v17];

      v20 = [v4 matchDomains];
      uint64_t v21 = [v20 count];
      int v22 = v16 & 1;

      if (v21 && (v16 & 1) == 0)
      {
        unint64_t v23 = 1;
        do
        {
          v24 = [v4 matchDomains];
          v25 = [v24 objectAtIndexedSubscript:v23 - 1];

          if (([v19 hasSuffix:v25] & 1) != 0 || objc_msgSend(v25, "hasSuffix:", v19)) {
            char v16 = 1;
          }

          v26 = [v4 matchDomains];
          unint64_t v27 = [v26 count];
          int v22 = v16 & 1;

          if (v23 >= v27) {
            break;
          }
          ++v23;
        }
        while ((v16 & 1) == 0);
      }

      ++v17;
      v28 = [(NEAppRule *)self matchDomains];
      unint64_t v29 = [v28 count];

      int v30 = 1;
    }
    while (v17 < v29 && !v22);
  }
  else
  {
    int v30 = 1;
  }
LABEL_24:
  v31 = [(NEAppRule *)self matchAccountIdentifiers];
  if ([v31 count])
  {

    char v32 = v16 & 1;
  }
  else
  {
    v33 = [v4 matchAccountIdentifiers];
    uint64_t v34 = [v33 count];

    char v32 = v16 & 1;
    if (!v34)
    {
      int v53 = 0;
      int v54 = 0;
      goto LABEL_43;
    }
  }
  v35 = [(NEAppRule *)self matchAccountIdentifiers];
  if (![v35 count])
  {

    goto LABEL_47;
  }
  v36 = [v4 matchAccountIdentifiers];
  uint64_t v37 = [v36 count];

  if (v37)
  {
    v38 = [(NEAppRule *)self matchAccountIdentifiers];
    uint64_t v39 = [v38 count];

    if (v39)
    {
      unint64_t v40 = 0;
      char v41 = 0;
      do
      {
        v42 = [(NEAppRule *)self matchAccountIdentifiers];
        v43 = [v42 objectAtIndexedSubscript:v40];

        v44 = [v4 matchAccountIdentifiers];
        uint64_t v45 = [v44 count];

        if (v45)
        {
          unint64_t v46 = 0;
          do
          {
            v47 = [v4 matchAccountIdentifiers];
            v48 = [v47 objectAtIndexedSubscript:v46];

            if ([v43 isEqualToString:v48]) {
              char v41 = 1;
            }

            ++v46;
            v49 = [v4 matchAccountIdentifiers];
            unint64_t v50 = [v49 count];
          }
          while (v46 < v50);
        }

        ++v40;
        v51 = [(NEAppRule *)self matchAccountIdentifiers];
        unint64_t v52 = [v51 count];
        int v53 = v41 & 1;
      }
      while (v40 < v52 && (v41 & 1) == 0);
    }
    else
    {
      int v53 = 0;
    }
    int v54 = 1;
LABEL_43:
    if ((v30 | v54) == 1 && (v32 & 1) == 0 && !v53)
    {
LABEL_46:
      BOOL v55 = 0;
      goto LABEL_50;
    }
  }
LABEL_47:
  v56 = ne_log_obj();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = [(NEAppRule *)self matchSigningIdentifier];
    int v59 = 138412290;
    v60 = v57;
    _os_log_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_DEFAULT, "App Rule for %@ overlaps with an existing app rule", (uint8_t *)&v59, 0xCu);
  }
  BOOL v55 = 1;
LABEL_50:

  return v55;
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)NEAppRule;
  id v5 = [(NEAppRule *)&v47 init];
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F42120];
    int v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42120]];
    int v8 = isa_nsarray(v7);

    if (v8)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:v6];
      if ([v9 count])
      {
        uint64_t v10 = [v9 objectAtIndexedSubscript:0];
        uint64_t v11 = *MEMORY[0x1E4F42128];
        uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F42128]];
        int v13 = isa_nsstring(v12);

        if (v13)
        {
          uint64_t v14 = [v10 objectForKeyedSubscript:v11];
          uint64_t v15 = [v14 copy];
          matchSigningIdentifier = v5->_matchSigningIdentifier;
          v5->_matchSigningIdentifier = (NSString *)v15;
        }
      }
    }
    uint64_t v17 = *MEMORY[0x1E4F42118];
    uint64_t v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42118]];
    int v19 = isa_nsarray(v18);

    if (v19)
    {
      [v4 objectForKeyedSubscript:v17];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v20 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v44;
        while (2)
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(v20);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v43 + 1) + 8 * v24)))
            {
              matchDomains = v20;
              goto LABEL_19;
            }
            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v43 objects:v49 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      uint64_t v25 = [(NSArray *)v20 copy];
      matchDomains = v5->_matchDomains;
      v5->_matchDomains = (NSArray *)v25;
LABEL_19:
    }
    uint64_t v27 = *MEMORY[0x1E4F42110];
    v28 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42110]];
    int v29 = isa_nsarray(v28);

    if (v29)
    {
      [v4 objectForKeyedSubscript:v27];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      int v30 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v40;
        while (2)
        {
          uint64_t v34 = 0;
          do
          {
            if (*(void *)v40 != v33) {
              objc_enumerationMutation(v30);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v39 + 1) + 8 * v34)))
            {
              matchAccountIdentifiers = v30;
              goto LABEL_31;
            }
            ++v34;
          }
          while (v32 != v34);
          uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v39 objects:v48 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }

      uint64_t v35 = [(NSArray *)v30 copy];
      matchAccountIdentifiers = v5->_matchAccountIdentifiers;
      v5->_matchAccountIdentifiers = (NSArray *)v35;
LABEL_31:
    }
    uint64_t v37 = v5;
  }

  return v5;
}

- (id)copyLegacyDictionary
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [(NEAppRule *)self matchSigningIdentifier];

  if (v5)
  {
    uint64_t v6 = [(NEAppRule *)self matchSigningIdentifier];
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F42130]];

    int v7 = [(NEAppRule *)self matchSigningIdentifier];
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F42128]];
  }
  v14[0] = v4;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F42120]];

  uint64_t v9 = [(NEAppRule *)self matchDomains];

  if (v9)
  {
    uint64_t v10 = [(NEAppRule *)self matchDomains];
    [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F42118]];
  }
  uint64_t v11 = [(NEAppRule *)self matchAccountIdentifiers];

  if (v11)
  {
    uint64_t v12 = [(NEAppRule *)self matchAccountIdentifiers];
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F42110]];
  }
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  uint64_t v9 = [(NEAppRule *)self matchSigningIdentifier];
  a4 |= 8uLL;
  [v7 appendPrettyObject:v9 withName:@"matchSigningIdentifier" andIndent:v5 options:a4];

  uint64_t v10 = [(NEAppRule *)self matchPath];
  [v7 appendPrettyObject:v10 withName:@"matchPath" andIndent:v5 options:a4];

  uint64_t v11 = [(NEAppRule *)self matchDomains];
  [v7 appendPrettyObject:v11 withName:@"matchDomains" andIndent:v5 options:a4];

  uint64_t v12 = [(NEAppRule *)self matchAccountIdentifiers];
  [v7 appendPrettyObject:v12 withName:@"accountIdentifiers" andIndent:v5 options:v8];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAppRule allowEmptyDesignatedRequirement](self, "allowEmptyDesignatedRequirement"), @"allowEmptyDesignatedRequirement", v5, v8);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAppRule noDivertDNS](self, "noDivertDNS"), @"noDivertDNS", v5, v8);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v36 = 0;
  uint64_t v5 = [(NEAppRule *)self matchSigningIdentifier];

  if (v5)
  {
    uint64_t v6 = [(NEAppRule *)self matchSigningIdentifier];
    BOOL v7 = [(NEAppRule *)self signingIdentifierAllowed:v6 domainsOrAccountsRequired:&v36];

    if (v7)
    {
      char v8 = 1;
      goto LABEL_7;
    }
    uint64_t v9 = NSString;
    uint64_t v10 = [(NEAppRule *)self matchSigningIdentifier];
    uint64_t v11 = [v9 stringWithFormat:@"Dis-allowed app rule signing identifier (starts with com.apple): %@", v10];
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v11, v4);
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing signing identifier in app rule match executable", v4);
  }
  char v8 = 0;
LABEL_7:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v12 = [(NEAppRule *)self matchDomains];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
  uint64_t v27 = v13;
  if (v13)
  {
    uint64_t v14 = *(void *)v33;
    uint64_t v15 = v13;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v12);
        }
        if ((isa_nsstring(*(void **)(*((void *)&v32 + 1) + 8 * i)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid app rule match domain", v4);
          char v8 = 0;
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v15);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v17 = [(NEAppRule *)self matchAccountIdentifiers];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
  uint64_t v19 = v18;
  if (v18)
  {
    uint64_t v20 = *(void *)v29;
    uint64_t v21 = v18;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        if ((isa_nsstring(*(void **)(*((void *)&v28 + 1) + 8 * j)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid account identifier", v4);
          char v8 = 0;
        }
      }
      uint64_t v21 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v21);
  }

  if ((ne_session_disable_restrictions() & 1) == 0)
  {
    if (!(v19 | v27) && v36)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"At least one match domain or match account identifier is required for this app rule", v4);
LABEL_32:
      char v8 = 0;
      goto LABEL_33;
    }
    if (v19 | v27 && !v36)
    {
      uint64_t v23 = NSString;
      uint64_t v24 = [(NEAppRule *)self matchSigningIdentifier];
      uint64_t v25 = [v23 stringWithFormat:@"App rule matching %@ cannot have matchDomains or matchAccountIdentifiers", v24];
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v25, v4);

      goto LABEL_32;
    }
  }
LABEL_33:

  return v8 & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NEAppRule *)self matchSigningIdentifier];
  uint64_t v6 = (void *)[v4 initWithSigningIdentifier:v5];

  BOOL v7 = [(NEAppRule *)self matchPath];
  [v6 setMatchPath:v7];

  char v8 = [(NEAppRule *)self matchDomains];
  [v6 setMatchDomains:v8];

  uint64_t v9 = [(NEAppRule *)self matchAccountIdentifiers];
  [v6 setMatchAccountIdentifiers:v9];

  objc_msgSend(v6, "setNoDivertDNS:", -[NEAppRule noDivertDNS](self, "noDivertDNS"));
  objc_msgSend(v6, "setAllowEmptyDesignatedRequirement:", -[NEAppRule allowEmptyDesignatedRequirement](self, "allowEmptyDesignatedRequirement"));
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(NEAppRule *)self matchDomains];
  [v8 encodeObject:v4 forKey:@"MatchDomains"];

  uint64_t v5 = [(NEAppRule *)self matchAccountIdentifiers];
  [v8 encodeObject:v5 forKey:@"MatchAccountIdentifiers"];

  uint64_t v6 = [(NEAppRule *)self matchSigningIdentifier];
  [v8 encodeObject:v6 forKey:@"SigningIdentifier"];

  objc_msgSend(v8, "encodeBool:forKey:", -[NEAppRule allowEmptyDesignatedRequirement](self, "allowEmptyDesignatedRequirement"), @"AllowEmptyDesignatedRequirement");
  BOOL v7 = [(NEAppRule *)self matchPath];
  [v8 encodeObject:v7 forKey:@"Path"];

  objc_msgSend(v8, "encodeBool:forKey:", -[NEAppRule noDivertDNS](self, "noDivertDNS"), @"NoDivertDNS");
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NEAppRule;
  [(NEAppRule *)&v2 dealloc];
}

- (NEAppRule)initWithSigningIdentifier:(NSString *)signingIdentifier
{
  id v4 = signingIdentifier;
  v9.receiver = self;
  v9.super_class = (Class)NEAppRule;
  uint64_t v5 = [(NEAppRule *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)v4 copy];
    matchSigningIdentifier = v5->_matchSigningIdentifier;
    v5->_matchSigningIdentifier = (NSString *)v6;

    v5->_noRestriction = 1;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end