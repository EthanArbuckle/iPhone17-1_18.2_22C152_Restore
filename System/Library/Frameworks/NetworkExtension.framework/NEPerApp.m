@interface NEPerApp
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)noRestriction;
- (BOOL)removeAppRuleByID:(id)a3;
- (BOOL)restrictDomains;
- (NEPerApp)init;
- (NEPerApp)initWithCoder:(id)a3;
- (NSArray)appRules;
- (NSArray)excludedDomains;
- (id)copyAppRuleByID:(id)a3;
- (id)copyAppRuleIDs;
- (id)copyCachedMachOUUIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAppRules:(id)a3;
- (void)setExcludedDomains:(id)a3;
- (void)setNoRestriction:(BOOL)a3;
- (void)setRestrictDomains:(BOOL)a3;
- (void)updateAppRulesForUID:(unsigned int)a3;
@end

@implementation NEPerApp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedDomains, 0);

  objc_storeStrong((id *)&self->_appRules, 0);
}

- (void)setExcludedDomains:(id)a3
{
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRestrictDomains:(BOOL)a3
{
  self->_restrictDomains = a3;
}

- (BOOL)restrictDomains
{
  return self->_restrictDomains;
}

- (void)setNoRestriction:(BOOL)a3
{
  self->_noRestriction = a3;
}

- (BOOL)noRestriction
{
  return self->_noRestriction;
}

- (void)setAppRules:(id)a3
{
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyCachedMachOUUIDs
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(NEPerApp *)self appRules];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [v9 cachedMachOUUIDs];
        uint64_t v11 = [v10 count];

        if (v11)
        {
          v12 = [v9 cachedMachOUUIDs];
          [v3 addObjectsFromArray:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    v13 = v3;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (void)updateAppRulesForUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obj = self->_appRules;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v43;
    v9 = &off_1E598D000;
    unsigned int v31 = v3;
    uint64_t v30 = *(void *)v43;
    do
    {
      uint64_t v10 = 0;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
        v12 = [v11 matchSigningIdentifier];

        if (v12)
        {
          v13 = v9[206];
          id v14 = [v11 matchSigningIdentifier];
          id v41 = 0;
          v15 = [v13 bundleProxyForIdentifier:v14 uid:v3 plugins:&v41];
          id v16 = v41;

          v36 = v16;
          if (v15 && [v16 count])
          {
            v33 = v15;
            uint64_t v34 = v10;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v38;
              do
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v38 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                  v23 = [v22 identifier];
                  id v24 = [(NEPerApp *)self copyAppRuleByID:v23];

                  if (!v24)
                  {
                    v25 = [NEAppRule alloc];
                    v26 = [v22 identifier];
                    v27 = [(NEAppRule *)v25 initWithSigningIdentifier:v26];

                    if (v27)
                    {
                      if (!v7) {
                        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                      }
                      [v7 addObject:v27];
                    }
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
              }
              while (v19);
            }

            uint64_t v3 = v31;
            uint64_t v8 = v30;
            uint64_t v6 = v32;
            v15 = v33;
            v9 = &off_1E598D000;
            uint64_t v10 = v34;
          }
        }
        ++v10;
      }
      while (v10 != v6);
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  if ([v7 count])
  {
    v28 = [(NEPerApp *)self appRules];
    v29 = [v28 arrayByAddingObjectsFromArray:v7];
    [(NEPerApp *)self setAppRules:v29];
  }
}

- (id)copyAppRuleIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_appRules, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_appRules;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "matchSigningIdentifier", (void)v12);
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)removeAppRuleByID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  appRules = self->_appRules;
  p_appRules = &self->_appRules;
  uint64_t v8 = (void *)[v5 initWithArray:appRules];
  if ([v8 count])
  {
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = [v8 objectAtIndex:v9];
      uint64_t v11 = [v10 matchSigningIdentifier];
      int v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }

      if (++v9 >= (unint64_t)[v8 count]) {
        goto LABEL_5;
      }
    }
    [v8 removeObjectAtIndex:v9];
    objc_storeStrong((id *)p_appRules, v8);

    BOOL v13 = 1;
  }
  else
  {
LABEL_5:
    BOOL v13 = 0;
  }

  return v13;
}

- (id)copyAppRuleByID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = v5->_appRules;
  uint64_t v7 = (void *)[(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "matchSigningIdentifier", (void)v14);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          uint64_t v7 = (void *)[v10 copy];
          goto LABEL_11;
        }
      }
      uint64_t v7 = (void *)[(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v8 = [(NEPerApp *)self appRules];
  [v7 appendPrettyObject:v8 withName:@"appRules" andIndent:v5 options:a4];

  uint64_t v9 = [(NEPerApp *)self excludedDomains];
  [v7 appendPrettyObject:v9 withName:@"excludedDomains" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NEPerApp *)self appRules];

  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [(NEPerApp *)self appRules];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      char v10 = 1;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          int v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (![v12 checkValidityAndCollectErrors:v4]) {
              char v10 = 0;
            }
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid app rule", v4);
            char v10 = 0;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    else
    {
      char v10 = 1;
    }

    BOOL v13 = v10 & 1;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NEPerApp *)self appRules];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v7 = [(NEPerApp *)self appRules];
    uint64_t v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setAppRules:v8];
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
  char v10 = [(NEPerApp *)self excludedDomains];
  uint64_t v11 = (void *)[v9 initWithArray:v10 copyItems:1];
  [v4 setExcludedDomains:v11];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEPerApp *)self appRules];
  [v4 encodeObject:v5 forKey:@"Rules"];

  id v6 = [(NEPerApp *)self excludedDomains];
  [v4 encodeObject:v6 forKey:@"ExcludedDomains"];
}

- (NEPerApp)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEPerApp *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Rules"];
    appRules = v5->_appRules;
    v5->_appRules = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    BOOL v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"ExcludedDomains"];
    excludedDomains = v5->_excludedDomains;
    v5->_excludedDomains = (NSArray *)v14;
  }
  return v5;
}

- (NEPerApp)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEPerApp;
  result = [(NEPerApp *)&v3 init];
  if (result) {
    result->_noRestriction = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end