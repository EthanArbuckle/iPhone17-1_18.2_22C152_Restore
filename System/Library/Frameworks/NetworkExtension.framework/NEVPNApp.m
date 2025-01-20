@interface NEVPNApp
+ (BOOL)compareAppRules:(id)a3 newAppRules:(id)a4 noExistingDomain:(BOOL *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)findRuleWithSameDomains:(id)a3 matchSigningIdentifier:(id)a4 startIndex:(int64_t *)a5;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)installSigningIdentifiersWithFlowDivertControlSocket:(int)a3;
- (BOOL)noRestriction;
- (BOOL)removeAppRuleByID:(id)a3;
- (BOOL)restrictDomains;
- (NEVPNApp)init;
- (NEVPNApp)initWithCoder:(id)a3;
- (NSArray)appRules;
- (NSArray)excludedDomains;
- (id)copyAppRuleByID:(id)a3;
- (id)copyAppRuleIDs;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppRules:(id)a3;
- (void)setExcludedDomains:(id)a3;
- (void)setNoRestriction:(BOOL)a3;
- (void)setRestrictDomains:(BOOL)a3;
- (void)updateAppRulesForUID:(unsigned int)a3;
@end

@implementation NEVPNApp

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
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
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
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
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
        v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
        v12 = [v11 matchSigningIdentifier];

        if (v12)
        {
          v13 = v9[206];
          v14 = [v11 matchSigningIdentifier];
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
                  id v24 = [(NEVPNApp *)self copyAppRuleByID:v23];

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
    v28 = [(NEVPNApp *)self appRules];
    v29 = [v28 arrayByAddingObjectsFromArray:v7];
    [(NEVPNApp *)self setAppRules:v29];
  }
}

- (BOOL)installSigningIdentifiersWithFlowDivertControlSocket:(int)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  int v53 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v50 = 0;
  if (self)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v5 = [(NEVPNApp *)self appRules];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v54 objects:buf count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v55 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v11 = [v10 matchSigningIdentifier];
          if (v11)
          {
            v12 = (void *)v11;
            v13 = [v10 matchSigningIdentifier];
            v14 = [v4 objectForKeyedSubscript:v13];

            if (!v14)
            {
              v15 = [v10 matchSigningIdentifier];
              id v16 = [v10 matchSigningIdentifier];
              [v4 setObject:v15 forKeyedSubscript:v16];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v54 objects:buf count:16];
      }
      while (v7);
    }

    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
  }
  else
  {
    id v17 = 0;
  }
  if ([(NEVPN *)self tunnelType] == 2)
  {
    if ([v17 count])
    {
      uint64_t v18 = (void *)NEFlowTLVMsgCreate();
      NEFlowTLVAdd();
      ssize_t v19 = send(a3, v18, v50 - v52, 0);
      uint64_t v20 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
      if (v19 < 0)
      {
        uint64_t v34 = ne_log_obj();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          long long v40 = __error();
          id v41 = strerror(*v40);
          *(_DWORD *)buf = 136315138;
          v60 = v41;
          _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE message: %s", buf, 0xCu);
        }
        id v32 = 0;
        id v21 = 0;
      }
      else
      {
        CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v18);
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v22 = [v17 allKeys];
        if ([v22 count])
        {
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          unsigned int v25 = 0;
          do
          {
            if ([v22 count])
            {
              uint64_t v26 = 0;
              unsigned int v27 = 0;
              do
              {
                if (v25 != v27)
                {
                  v28 = [v22 objectAtIndexedSubscript:v23];
                  v29 = [v22 objectAtIndexedSubscript:v26];
                  uint64_t v30 = [v28 commonPrefixWithString:v29 options:2];

                  if ([v30 length]) {
                    [v21 setObject:v30 forKeyedSubscript:v30];
                  }
                }
                uint64_t v26 = ++v27;
              }
              while ([v22 count] > (unint64_t)v27);
            }
            id v31 = [v22 objectAtIndexedSubscript:v23];
            v24 += strlen((const char *)[v31 cStringUsingEncoding:1]);

            uint64_t v23 = ++v25;
          }
          while ([v22 count] > (unint64_t)v25);
          uint64_t v20 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
        }
        int v53 = [v21 count];
        [v22 count];
        uint64_t v18 = (void *)NEFlowTLVMsgCreate();
        NEFlowTLVAdd();
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v32 = v22;
        uint64_t v35 = [v32 countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v47 != v37) {
                objc_enumerationMutation(v32);
              }
              strlen((const char *)[*(id *)(*((void *)&v46 + 1) + 8 * j) cStringUsingEncoding:1]);
              NEFlowTLVAdd();
            }
            uint64_t v36 = [v32 countByEnumeratingWithState:&v46 objects:v58 count:16];
          }
          while (v36);
        }

        if ((send(a3, v18, v50 - v52, 0) & 0x8000000000000000) == 0)
        {
          BOOL v33 = 1;
          if (!v18) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
        uint64_t v34 = ne_log_obj();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          long long v42 = (char *)(v50 - v52);
          long long v43 = __error();
          long long v44 = strerror(*v43);
          *(_DWORD *)buf = 134218242;
          v60 = v42;
          __int16 v61 = 2080;
          v62 = v44;
          _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE with size %lu bytes: %s", buf, 0x16u);
        }
      }

      BOOL v33 = 0;
      if (v18) {
LABEL_45:
      }
        CFAllocatorDeallocate(*v20, v18);
    }
    else
    {
      id v32 = 0;
      id v21 = 0;
      BOOL v33 = 1;
    }
  }
  else
  {
    id v32 = 0;
    id v21 = 0;
    BOOL v33 = 0;
  }
LABEL_46:

  return v33;
}

- (id)copyAppRuleIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_appRules, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_appRules;
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
  p_appRules = &self->_appRules;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_appRules];
  if ([v6 count])
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [v6 objectAtIndex:v7];
      v9 = [v8 matchSigningIdentifier];
      int v10 = [v9 isEqualToString:v4];

      if (v10) {
        break;
      }

      if (++v7 >= (unint64_t)[v6 count]) {
        goto LABEL_5;
      }
    }
    [v6 removeObjectAtIndex:v7];
    objc_storeStrong((id *)p_appRules, v6);

    BOOL v11 = 1;
  }
  else
  {
LABEL_5:
    BOOL v11 = 0;
  }

  return v11;
}

- (id)copyAppRuleByID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v11 = objc_msgSend(v10, "matchSigningIdentifier", (void)v14);
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

- (id)copyLegacyDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)NEVPNApp;
  id v3 = [(NEVPN *)&v6 copyLegacyDictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"));
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F41FA8]];

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NEVPNApp;
  id v5 = [(NEVPN *)&v27 initFromLegacyDictionary:v4];
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F41FA8];
    uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FA8]];
    char v8 = isa_nsnumber(v7);

    if ((v8 & 1) != 0
      || (uint64_t v6 = *MEMORY[0x1E4F41FA0],
          [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FA0]],
          v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = isa_nsnumber(v9),
          v9,
          v10))
    {
      BOOL v11 = [v4 objectForKeyedSubscript:v6];
      objc_msgSend(v5, "setOnDemandEnabled:", objc_msgSend(v11, "BOOLValue"));
    }
    int v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41F10]];
    if (isa_nsarray(v12))
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (isa_nsdictionary(v19))
            {
              uint64_t v20 = [NEAppRule alloc];
              id v21 = -[NEAppRule initFromLegacyDictionary:](v20, "initFromLegacyDictionary:", v19, (void)v23);
              if (v21) {
                [v13 addObject:v21];
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v16);
      }

      if ([v13 count]) {
        [v5 setAppRules:v13];
      }
    }
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v13.receiver = self;
  v13.super_class = (Class)NEVPNApp;
  char v8 = [(NEVPN *)&v13 descriptionWithIndent:v5 options:a4];
  v9 = (void *)[v7 initWithString:v8];

  int v10 = [(NEVPNApp *)self appRules];
  [v9 appendPrettyObject:v10 withName:@"appRules" andIndent:v5 options:a4];

  BOOL v11 = [(NEVPNApp *)self excludedDomains];
  [v9 appendPrettyObject:v11 withName:@"excludedDomains" andIndent:v5 options:a4];

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)NEVPNApp;
  BOOL v5 = [(NEVPN *)&v94 checkValidityAndCollectErrors:v4];
  uint64_t v6 = [(NEVPNApp *)self appRules];

  if (v6)
  {
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v72 = self;
    id v7 = [(NEVPNApp *)self appRules];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          BOOL v12 = v5;
          if (*(void *)v91 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v13 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v13 checkValidityAndCollectErrors:v4]) {
              BOOL v5 = v12;
            }
            else {
              BOOL v5 = 0;
            }
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid app rule", v4);
            BOOL v5 = 0;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v90 objects:v99 count:16];
      }
      while (v9);
    }

    LOBYTE(v5) = v5;
    self = v72;
  }
  id v14 = [(NEVPNApp *)self excludedDomains];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v16 = [(NEVPNApp *)self excludedDomains];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v98 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      BOOL v19 = v5;
      uint64_t v20 = *(void *)v87;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v87 != v20) {
            objc_enumerationMutation(v16);
          }
          v22 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ![v22 length])
          {
            long long v23 = NEResourcesCopyLocalizedNSString(@"APP_VPN_EMPTY_EXCLUDED_DOMAIN", @"APP_VPN_EMPTY_EXCLUDED_DOMAIN");
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v23, v4);

            LOBYTE(v5) = 0;
            goto LABEL_27;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v86 objects:v98 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      LOBYTE(v5) = v19;
    }
LABEL_27:
  }
  if ([(NEVPNApp *)self restrictDomains])
  {
    long long v24 = [(NEVPN *)self protocol];
    long long v25 = [v24 serverAddress];

    if (v25)
    {
      long long v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v25];
      objc_super v27 = v26;
      if (!v26 || ([v26 host], (id v28 = (id)objc_claimAutoreleasedReturnValue()) == 0)) {
        id v28 = v25;
      }
      uint64_t v29 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"."];
      uint64_t v30 = [v28 stringByTrimmingCharactersInSet:v29];

      v65 = v30;
      id v31 = [v30 componentsSeparatedByString:@"."];
      if ((unint64_t)[v31 count] > 1)
      {
        v62 = v27;
        uint64_t v63 = v25;
        BOOL v64 = v5;
        v67 = v4;
        __int16 v61 = v31;
        v60 = objc_msgSend(v31, "subarrayWithRange:", objc_msgSend(v31, "count") - 2, 2);
        [v60 componentsJoinedByString:@"."];
        uint64_t v34 = v36 = self;
        v73 = [@"." stringByAppendingString:v34];
        id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        obuint64_t j = [(NEVPNApp *)v36 appRules];
        uint64_t v69 = [obj countByEnumeratingWithState:&v82 objects:v97 count:16];
        if (v69)
        {
          uint64_t v68 = *(void *)v83;
          do
          {
            long long v38 = 0;
            do
            {
              if (*(void *)v83 != v68) {
                objc_enumerationMutation(obj);
              }
              v70 = v38;
              long long v39 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v38);
              long long v78 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v40 = [v39 matchDomains];
              uint64_t v41 = [v40 countByEnumeratingWithState:&v78 objects:v96 count:16];
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v79;
                do
                {
                  for (uint64_t k = 0; k != v42; ++k)
                  {
                    if (*(void *)v79 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    long long v45 = *(void **)(*((void *)&v78 + 1) + 8 * k);
                    long long v46 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"*."];
                    long long v47 = [v45 stringByTrimmingCharactersInSet:v46];

                    unint64_t v48 = [v47 length];
                    if (v48 > [v34 length] && !objc_msgSend(v47, "hasSuffix:", v73)
                      || (uint64_t v49 = [v47 length], v49 == objc_msgSend(v34, "length"))
                      && ![v47 isEqualToString:v34]
                      || (unint64_t v50 = [v47 length], v50 < objc_msgSend(v34, "length")))
                    {
                      [v37 setObject:v47 forKeyedSubscript:v47];
                    }
                  }
                  uint64_t v42 = [v40 countByEnumeratingWithState:&v78 objects:v96 count:16];
                }
                while (v42);
              }

              long long v38 = v70 + 1;
            }
            while (v70 + 1 != (char *)v69);
            uint64_t v69 = [obj countByEnumeratingWithState:&v82 objects:v97 count:16];
          }
          while (v69);
        }

        LOBYTE(v5) = v64;
        if ([v37 count])
        {
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v71 = v37;
          uint64_t v51 = [v71 countByEnumeratingWithState:&v74 objects:v95 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v53 = *(void *)v75;
            do
            {
              for (uint64_t m = 0; m != v52; ++m)
              {
                if (*(void *)v75 != v53) {
                  objc_enumerationMutation(v71);
                }
                uint64_t v55 = *(void *)(*((void *)&v74 + 1) + 8 * m);
                id v56 = [NSString alloc];
                long long v57 = NEResourcesCopyLocalizedNSString(@"APP_VPN_INVALID_MATCH_DOMAIN", @"APP_VPN_INVALID_MATCH_DOMAIN");
                v58 = objc_msgSend(v56, "initWithFormat:", v57, v55, v34);
                [v67 addObject:v58];
              }
              uint64_t v52 = [v71 countByEnumeratingWithState:&v74 objects:v95 count:16];
            }
            while (v52);
          }

          LOBYTE(v5) = 0;
        }

        id v4 = v67;
        objc_super v27 = v62;
        long long v25 = v63;
        BOOL v33 = v60;
        id v31 = v61;
      }
      else
      {
        id v32 = [NSString alloc];
        BOOL v33 = NEResourcesCopyLocalizedNSString(@"APP_VPN_INVALID_DOMAIN", @"APP_VPN_INVALID_DOMAIN");
        uint64_t v34 = objc_msgSend(v32, "initWithFormat:", v33, objc_msgSend(v31, "count"));
        [v4 addObject:v34];
        LOBYTE(v5) = 0;
      }

      uint64_t v35 = v65;
    }
    else
    {
      uint64_t v35 = NEResourcesCopyLocalizedNSString(@"APP_VPN_NO_DOMAIN", @"APP_VPN_NO_DOMAIN");
      [v4 addObject:v35];
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NEVPNApp;
  id v4 = [(NEVPN *)&v13 copyWithZone:a3];
  BOOL v5 = [(NEVPNApp *)self appRules];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v7 = [(NEVPNApp *)self appRules];
    uint64_t v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setAppRules:v8];
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v10 = [(NEVPNApp *)self excludedDomains];
  BOOL v11 = (void *)[v9 initWithArray:v10 copyItems:1];
  [v4 setExcludedDomains:v11];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NEVPNApp;
  id v4 = a3;
  [(NEVPN *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(NEVPNApp *)self appRules];
  [v4 encodeObject:v5 forKey:@"Rules"];

  id v6 = [(NEVPNApp *)self excludedDomains];
  [v4 encodeObject:v6 forKey:@"ExcludedDomains"];
}

- (NEVPNApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEVPNApp;
  BOOL v5 = [(NEVPN *)&v17 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Rules"];
    appRules = v5->_appRules;
    v5->_appRules = (NSArray *)v9;

    BOOL v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    objc_super v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"ExcludedDomains"];
    excludedDomains = v5->_excludedDomains;
    v5->_excludedDomains = (NSArray *)v14;
  }
  return v5;
}

- (NEVPNApp)init
{
  v5.receiver = self;
  v5.super_class = (Class)NEVPNApp;
  v2 = [(NEVPN *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(NEVPN *)v2 setEnabled:1];
    [(NEVPN *)v3 setTunnelType:2];
    v3->_noRestriction = 1;
  }
  return v3;
}

+ (id)findRuleWithSameDomains:(id)a3 matchSigningIdentifier:(id)a4 startIndex:(int64_t *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v45 = a4;
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = [v7 count];
  uint64_t v9 = 0;
  if (!a5 || !v8) {
    goto LABEL_15;
  }
  uint64_t v10 = a5;
  int64_t v11 = *a5;
  if (v11 >= [v7 count])
  {
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v12 = v7;
  uint64_t v9 = (void *)[v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v9)
  {
    long long v46 = v10;
    id v43 = v7;
    id v13 = 0;
    uint64_t v14 = *(void *)v53;
LABEL_7:
    uint64_t v15 = 0;
    uint64_t v16 = v13;
    while (1)
    {
      if (*(void *)v53 != v14) {
        objc_enumerationMutation(v12);
      }
      id v13 = *(id *)(*((void *)&v52 + 1) + 8 * (void)v15);

      objc_super v17 = [v13 matchSigningIdentifier];
      char v18 = [v17 isEqualToString:v45];

      if (v18) {
        break;
      }
      uint64_t v15 = (char *)v15 + 1;
      uint64_t v16 = v13;
      if (v9 == v15)
      {
        uint64_t v9 = (void *)[v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v9) {
          goto LABEL_7;
        }

        id v13 = v12;
        id v7 = v43;
        goto LABEL_39;
      }
    }

    if (!v13)
    {
      uint64_t v9 = 0;
      id v7 = v43;
      goto LABEL_15;
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = v12;
    uint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      int64_t v22 = 0;
      long long v44 = 0;
      uint64_t v23 = *(void *)v49;
      long long v24 = v46;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(obj);
          }
          if (v22 + i >= *v24)
          {
            long long v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            objc_super v27 = [v26 matchSigningIdentifier];
            id v28 = [v13 matchSigningIdentifier];
            char v29 = [v27 isEqualToString:v28];

            if ((v29 & 1) == 0)
            {
              uint64_t v30 = [v26 matchDomains];
              uint64_t v31 = [v30 count];

              if (v31)
              {
                id v32 = [v26 matchDomains];
                uint64_t v33 = [v32 count];
                uint64_t v34 = [v13 matchDomains];
                uint64_t v35 = [v34 count];

                if (v33 == v35)
                {
                  uint64_t v36 = (void *)MEMORY[0x1E4F1CAD0];
                  id v37 = [v26 matchDomains];
                  long long v38 = [v36 setWithArray:v37];

                  long long v39 = (void *)MEMORY[0x1E4F1CAD0];
                  long long v40 = [v13 matchDomains];
                  uint64_t v41 = [v39 setWithArray:v40];

                  if ([v38 isEqualToSet:v41])
                  {
                    uint64_t v42 = [v26 matchSigningIdentifier];

                    long long v44 = (void *)v42;
                  }
                  long long v24 = v46;
                }
                else
                {
                  long long v24 = v46;
                }
              }
            }
          }
        }
        v22 += v21;
        uint64_t v21 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v21);
    }
    else
    {
      int64_t v22 = 0;
      long long v44 = 0;
      long long v24 = v46;
    }

    *long long v24 = v22;
    id v7 = v43;
    uint64_t v9 = v44;
  }
  else
  {
    id v13 = v12;
  }
LABEL_39:

LABEL_15:

  return v9;
}

+ (BOOL)compareAppRules:(id)a3 newAppRules:(id)a4 noExistingDomain:(BOOL *)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7 || ![v7 count])
  {
LABEL_53:
    BOOL v53 = 0;
    if (a5) {
      *a5 = 1;
    }
    goto LABEL_60;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v79 objects:v87 count:16];
  if (!v10)
  {

    goto LABEL_53;
  }
  uint64_t v11 = v10;
  id v60 = v7;
  int v12 = 0;
  uint64_t v13 = *(void *)v80;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v80 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = [*(id *)(*((void *)&v79 + 1) + 8 * i) matchDomains];
      v12 += [v15 count];
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v79 objects:v87 count:16];
  }
  while (v11);

  id v7 = v60;
  if (!v12) {
    goto LABEL_53;
  }
  if (v8 && [v8 count])
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    obuint64_t j = v9;
    id v61 = v8;
    uint64_t v58 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
    if (v58)
    {
      id v56 = *(id *)v76;
      while (2)
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(id *)v76 != v56) {
            objc_enumerationMutation(obj);
          }
          objc_super v17 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          char v18 = [v17 matchDomains];
          uint64_t v19 = [v18 count];

          if (v19)
          {
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v20 = v8;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v71 objects:v85 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v72;
LABEL_21:
              uint64_t v24 = 0;
              while (1)
              {
                if (*(void *)v72 != v23) {
                  objc_enumerationMutation(v20);
                }
                long long v25 = *(void **)(*((void *)&v71 + 1) + 8 * v24);
                long long v26 = [v17 matchSigningIdentifier];
                objc_super v27 = [v25 matchSigningIdentifier];
                int v28 = [v26 isEqualToString:v27];

                if (v28) {
                  break;
                }
                if (v22 == ++v24)
                {
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v71 objects:v85 count:16];
                  if (v22) {
                    goto LABEL_21;
                  }
                  goto LABEL_57;
                }
              }
              char v29 = [v17 matchDomains];
              uint64_t v30 = [v29 count];
              uint64_t v31 = [v25 matchDomains];
              uint64_t v32 = [v31 count];

              if (v30 == v32)
              {
                uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v34 = [v17 matchDomains];
                uint64_t v35 = [v33 setWithArray:v34];

                uint64_t v36 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v37 = [v25 matchDomains];
                long long v38 = [v36 setWithArray:v37];

                LOBYTE(v37) = [v35 isEqualToSet:v38];
                if (v37)
                {

                  id v8 = v61;
                  continue;
                }
              }
            }
LABEL_57:

            long long v54 = obj;
LABEL_59:

            BOOL v53 = 1;
            id v7 = v60;
            id v8 = v61;
            goto LABEL_60;
          }
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
        if (v58) {
          continue;
        }
        break;
      }
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v57 = v8;
    uint64_t v39 = [v57 countByEnumeratingWithState:&v67 objects:v84 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v59 = *(void *)v68;
      while (2)
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v68 != v59) {
            objc_enumerationMutation(v57);
          }
          uint64_t v42 = *(void **)(*((void *)&v67 + 1) + 8 * k);
          id v43 = [v42 matchDomains];
          uint64_t v44 = [v43 count];

          if (v44)
          {
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            id v45 = obj;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v63 objects:v83 count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v64;
              while (2)
              {
                for (uint64_t m = 0; m != v47; ++m)
                {
                  if (*(void *)v64 != v48) {
                    objc_enumerationMutation(v45);
                  }
                  long long v50 = [*(id *)(*((void *)&v63 + 1) + 8 * m) matchSigningIdentifier];
                  long long v51 = [v42 matchSigningIdentifier];
                  char v52 = [v50 isEqualToString:v51];

                  if (v52)
                  {

                    id v8 = v61;
                    goto LABEL_49;
                  }
                }
                uint64_t v47 = [v45 countByEnumeratingWithState:&v63 objects:v83 count:16];
                if (v47) {
                  continue;
                }
                break;
              }
            }

            long long v54 = v57;
            goto LABEL_59;
          }
LABEL_49:
          ;
        }
        uint64_t v40 = [v57 countByEnumeratingWithState:&v67 objects:v84 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }

    BOOL v53 = 0;
    id v7 = v60;
  }
  else
  {
    BOOL v53 = 1;
  }
LABEL_60:

  return v53;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end