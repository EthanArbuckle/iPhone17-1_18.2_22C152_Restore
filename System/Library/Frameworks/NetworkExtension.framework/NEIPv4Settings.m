@interface NEIPv4Settings
+ (BOOL)supportsSecureCoding;
+ (NEIPv4Settings)settingsWithAutomaticAddressing;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)hasDefaultRoute;
- (BOOL)overridePrimary;
- (NEIPv4Settings)init;
- (NEIPv4Settings)initWithAddresses:(NSArray *)addresses subnetMasks:(NSArray *)subnetMasks;
- (NEIPv4Settings)initWithCoder:(id)a3;
- (NEIPv4Settings)initWithConfigMethod:(int64_t)a3;
- (NSArray)addresses;
- (NSArray)excludedRoutes;
- (NSArray)includedRoutes;
- (NSArray)subnetMasks;
- (NSString)router;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)configMethod;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigMethod:(int64_t)a3;
- (void)setExcludedRoutes:(NSArray *)excludedRoutes;
- (void)setIncludedRoutes:(NSArray *)includedRoutes;
- (void)setOverridePrimary:(BOOL)a3;
- (void)setRouter:(NSString *)router;
@end

@implementation NEIPv4Settings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedRoutes, 0);
  objc_storeStrong((id *)&self->_includedRoutes, 0);
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_subnetMasks, 0);

  objc_storeStrong((id *)&self->_addresses, 0);
}

- (void)setConfigMethod:(int64_t)a3
{
  self->_configMethod = a3;
}

- (int64_t)configMethod
{
  return self->_configMethod;
}

- (void)setOverridePrimary:(BOOL)a3
{
  self->_overridePrimary = a3;
}

- (BOOL)overridePrimary
{
  return self->_overridePrimary;
}

- (void)setExcludedRoutes:(NSArray *)excludedRoutes
{
}

- (NSArray)excludedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIncludedRoutes:(NSArray *)includedRoutes
{
}

- (NSArray)includedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRouter:(NSString *)router
{
}

- (NSString)router
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)subnetMasks
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)addresses
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)hasDefaultRoute
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_includedRoutes;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isDefaultRoute", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(NEIPv4Settings *)self initWithConfigMethod:2];
  if (!v6) {
    goto LABEL_54;
  }
  long long v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41C70]];
  if (isa_nsstring(v7))
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F420A8]])
    {
      uint64_t v8 = 2;
LABEL_9:
      v6->_configMethod = v8;
      goto LABEL_10;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F42080]])
    {
      uint64_t v8 = 1;
      goto LABEL_9;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F420A0]])
    {
      uint64_t v8 = 3;
      goto LABEL_9;
    }
    if ([v7 isEqualToString:@"Off"])
    {

      v6 = 0;
      goto LABEL_54;
    }
  }
LABEL_10:
  uint64_t v9 = *MEMORY[0x1E4F41C60];
  long long v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41C60]];
  int v11 = isa_nsarray(v10);

  if (v11)
  {
    uint64_t v12 = [v5 objectForKeyedSubscript:v9];
    if ([v12 count])
    {
      v13 = [v12 objectAtIndexedSubscript:0];
      int v14 = isa_nsstring(v13);

      if (v14)
      {
        uint64_t v15 = [v12 copy];
        addresses = v6->_addresses;
        v6->_addresses = (NSArray *)v15;
      }
    }
  }
  uint64_t v17 = *MEMORY[0x1E4F41CB0];
  v18 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41CB0]];
  int v19 = isa_nsarray(v18);

  if (v19)
  {
    v20 = [v5 objectForKeyedSubscript:v17];
    if ([v20 count])
    {
      v21 = [v20 objectAtIndexedSubscript:0];
      int v22 = isa_nsstring(v21);

      if (v22)
      {
        uint64_t v23 = [v20 copy];
        subnetMasks = v6->_subnetMasks;
        v6->_subnetMasks = (NSArray *)v23;
      }
    }
  }
  uint64_t v25 = *MEMORY[0x1E4F41CA8];
  v26 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41CA8]];
  int v27 = isa_nsstring(v26);

  if (v27)
  {
    v28 = [v5 objectForKeyedSubscript:v25];
    uint64_t v29 = [v28 copy];
    router = v6->_router;
    v6->_router = (NSString *)v29;
  }
  uint64_t v31 = *MEMORY[0x1E4F41D40];
  v32 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41D40]];
  int v33 = isa_nsnumber(v32);
  v34 = (uint64_t *)MEMORY[0x1E4F41C80];
  if (!v33
    || ([v5 objectForKeyedSubscript:v31],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        ![v3 BOOLValue]))
  {
    v35 = [v5 objectForKeyedSubscript:*v34];
    int v36 = isa_nsarray(v35);

    if (v33)
    {

      if (v36) {
        goto LABEL_29;
      }
    }
    else
    {

      if (v36) {
        goto LABEL_29;
      }
    }
    id v37 = 0;
    goto LABEL_30;
  }

LABEL_29:
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
LABEL_30:
  v38 = [v5 objectForKeyedSubscript:v31];
  int v39 = isa_nsnumber(v38);

  if (v39)
  {
    v40 = [v5 objectForKeyedSubscript:v31];
    v6->_overridePrimary = [v40 BOOLValue];

    if (v6->_overridePrimary)
    {
      v41 = +[NEIPv4Route defaultRoute];
      [v37 addObject:v41];
    }
  }
  uint64_t v42 = *v34;
  v43 = [v5 objectForKeyedSubscript:*v34];
  int v44 = isa_nsarray(v43);

  if (v44)
  {
    v45 = [v5 objectForKeyedSubscript:v42];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v70 != v48) {
            objc_enumerationMutation(v45);
          }
          id v50 = [[NEIPv4Route alloc] initFromLegacyDictionary:*(void *)(*((void *)&v69 + 1) + 8 * i)];
          [v37 addObject:v50];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v69 objects:v74 count:16];
      }
      while (v47);
    }
  }
  if (v37) {
    objc_storeStrong((id *)&v6->_includedRoutes, v37);
  }
  uint64_t v51 = *MEMORY[0x1E4F41C78];
  v52 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41C78]];
  int v53 = isa_nsarray(v52);

  if (v53)
  {
    v64 = v7;
    v54 = [v5 objectForKeyedSubscript:v51];
    v55 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v56 = v54;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v66 != v59) {
            objc_enumerationMutation(v56);
          }
          id v61 = [[NEIPv4Route alloc] initFromLegacyDictionary:*(void *)(*((void *)&v65 + 1) + 8 * j)];
          [(NSArray *)v55 addObject:v61];
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v65 objects:v73 count:16];
      }
      while (v58);
    }

    excludedRoutes = v6->_excludedRoutes;
    v6->_excludedRoutes = v55;

    long long v7 = v64;
  }

LABEL_54:
  return v6;
}

- (id)copyLegacyDictionary
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NEIPv4Settings *)self configMethod] == 2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F420A8];
LABEL_5:
    [v3 setObject:*v4 forKeyedSubscript:*MEMORY[0x1E4F41C70]];
    goto LABEL_6;
  }
  if ([(NEIPv4Settings *)self configMethod] == 1)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F42080];
    goto LABEL_5;
  }
  if ([(NEIPv4Settings *)self configMethod] == 3)
  {
    [v3 setObject:*MEMORY[0x1E4F420A0] forKeyedSubscript:*MEMORY[0x1E4F420A0]];
    uint64_t v25 = [(NEIPv4Settings *)self addresses];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      int v27 = [(NEIPv4Settings *)self addresses];
      [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F41C60]];
    }
    v28 = [(NEIPv4Settings *)self subnetMasks];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      v30 = [(NEIPv4Settings *)self subnetMasks];
      [v3 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F41CB0]];
    }
    uint64_t v31 = [(NEIPv4Settings *)self router];

    if (v31)
    {
      v32 = [(NEIPv4Settings *)self router];
      [v3 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F41CA8]];
    }
  }
LABEL_6:
  if ([(NEIPv4Settings *)self overridePrimary]) {
    [v3 setObject:&unk_1EF08D120 forKeyedSubscript:*MEMORY[0x1E4F41D40]];
  }
  id v5 = [(NEIPv4Settings *)self includedRoutes];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v7 = [(NEIPv4Settings *)self includedRoutes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      uint64_t v11 = *MEMORY[0x1E4F41D40];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v13 isDefaultRoute])
          {
            [v3 setObject:&unk_1EF08D120 forKeyedSubscript:v11];
          }
          else
          {
            int v14 = (void *)[v13 copyLegacyDictionary];
            [v6 addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v9);
    }
  }
  uint64_t v15 = [(NEIPv4Settings *)self excludedRoutes];

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v17 = [(NEIPv4Settings *)self excludedRoutes];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          int v22 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          if (([v22 isDefaultRoute] & 1) == 0)
          {
            uint64_t v23 = (void *)[v22 copyLegacyDictionary];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v19);
    }
  }
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  unint64_t v9 = [(NEIPv4Settings *)self configMethod] - 1;
  if (v9 <= 2) {
    [v7 appendPrettyObject:off_1E5991830[v9] withName:@"configMethod" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];
  }
  uint64_t v10 = [(NEIPv4Settings *)self addresses];
  unint64_t v11 = a4 | 9;
  [v7 appendPrettyObject:v10 withName:@"addresses" andIndent:v5 options:a4 | 9];

  uint64_t v12 = [(NEIPv4Settings *)self subnetMasks];
  unint64_t v13 = a4 | 8;
  [v7 appendPrettyObject:v12 withName:@"subnetMasks" andIndent:v5 options:v13];

  int v14 = [(NEIPv4Settings *)self router];
  [v7 appendPrettyObject:v14 withName:@"router" andIndent:v5 options:v11];

  uint64_t v15 = [(NEIPv4Settings *)self includedRoutes];
  [v7 appendPrettyObject:v15 withName:@"includedRoutes" andIndent:v5 options:v13];

  id v16 = [(NEIPv4Settings *)self excludedRoutes];
  [v7 appendPrettyObject:v16 withName:@"excludedRoutes" andIndent:v5 options:v13];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPv4Settings overridePrimary](self, "overridePrimary"), @"overridePrimary", v5, v8);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ([(NEIPv4Settings *)self configMethod] != 3) {
    return 1;
  }
  int v46 = 0;
  uint64_t v4 = [(NEIPv4Settings *)self addresses];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(NEIPv4Settings *)self addresses];
    id v7 = [v6 objectAtIndexedSubscript:0];
    int v8 = inet_pton(2, (const char *)[v7 UTF8String], &v46);

    if (v8) {
      goto LABEL_8;
    }
    unint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Invalid IPv4 address";
LABEL_43:
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    }
  }
  else
  {
    unint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Missing IPv4 address";
      goto LABEL_43;
    }
  }

LABEL_8:
  unint64_t v11 = [(NEIPv4Settings *)self subnetMasks];
  uint64_t v12 = [v11 count];
  unint64_t v13 = [(NEIPv4Settings *)self addresses];
  uint64_t v14 = [v13 count];

  if (v12 != v14)
  {
    uint64_t v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Missing IPv4 subnet mask", buf, 2u);
    }
  }
  id v16 = [(NEIPv4Settings *)self subnetMasks];
  if ([v16 count])
  {
    uint64_t v17 = [(NEIPv4Settings *)self subnetMasks];
    id v18 = [v17 objectAtIndexedSubscript:0];
    int v19 = inet_pton(2, (const char *)[v18 UTF8String], &v46);

    if (v19) {
      goto LABEL_17;
    }
    id v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "Invalid IPv4 subnet mask", buf, 2u);
    }
  }

LABEL_17:
  uint64_t v20 = [(NEIPv4Settings *)self router];
  if (v20)
  {
    v21 = (void *)v20;
    id v22 = [(NEIPv4Settings *)self router];
    int v23 = inet_pton(2, (const char *)[v22 UTF8String], &v46);

    if (!v23)
    {
      v24 = ne_log_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_ERROR, "Invalid IPv4 router", buf, 2u);
      }
    }
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v26 = [(NEIPv4Settings *)self includedRoutes];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * i) checkValidityAndCollectErrors:v25];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v28);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v31 = [(NEIPv4Settings *)self excludedRoutes];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * j) checkValidityAndCollectErrors:v25];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v33);
  }

  if ([v25 count])
  {
    long long v36 = ne_log_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v25;
      _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "IPv4 routes are invalid: %@", buf, 0xCu);
    }
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NEIPv4Settings allocWithZone:a3];
  uint64_t v5 = [(NEIPv4Settings *)self addresses];
  id v6 = [(NEIPv4Settings *)self subnetMasks];
  id v7 = [(NEIPv4Settings *)v4 initWithAddresses:v5 subnetMasks:v6];

  [(NEIPv4Settings *)v7 setConfigMethod:[(NEIPv4Settings *)self configMethod]];
  int v8 = [(NEIPv4Settings *)self router];
  [(NEIPv4Settings *)v7 setRouter:v8];

  unint64_t v9 = [(NEIPv4Settings *)self includedRoutes];
  [(NEIPv4Settings *)v7 setIncludedRoutes:v9];

  uint64_t v10 = [(NEIPv4Settings *)self excludedRoutes];
  [(NEIPv4Settings *)v7 setExcludedRoutes:v10];

  [(NEIPv4Settings *)v7 setOverridePrimary:[(NEIPv4Settings *)self overridePrimary]];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeInt32:forKey:", -[NEIPv4Settings configMethod](self, "configMethod"), @"ConfigMethod");
  uint64_t v4 = [(NEIPv4Settings *)self addresses];
  [v9 encodeObject:v4 forKey:@"AddressArray"];

  uint64_t v5 = [(NEIPv4Settings *)self subnetMasks];
  [v9 encodeObject:v5 forKey:@"SubnetMaskArray"];

  id v6 = [(NEIPv4Settings *)self router];
  [v9 encodeObject:v6 forKey:@"Router"];

  id v7 = [(NEIPv4Settings *)self includedRoutes];
  [v9 encodeObject:v7 forKey:@"IncludeRoutes"];

  int v8 = [(NEIPv4Settings *)self excludedRoutes];
  [v9 encodeObject:v8 forKey:@"ExcludeRoutes"];

  objc_msgSend(v9, "encodeBool:forKey:", -[NEIPv4Settings overridePrimary](self, "overridePrimary"), @"OverridePrimary");
}

- (NEIPv4Settings)initWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)NEIPv4Settings;
  uint64_t v5 = [(NEIPv4Settings *)&v39 init];
  if (v5)
  {
    v5->_configMethod = (int)[v4 decodeInt32ForKey:@"ConfigMethod"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    int v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AddressArray"];
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v9;

    if (!v5->_addresses)
    {
      unint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
      if (v11)
      {
        uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v11, 0);
        unint64_t v13 = v5->_addresses;
        v5->_addresses = (NSArray *)v12;

        uint64_t v14 = ne_log_obj();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          long long v37 = v5->_addresses;
          *(_DWORD *)buf = 138412290;
          long long v41 = v37;
          _os_log_debug_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEBUG, "initwithcoder single router IPv4address %@", buf, 0xCu);
        }
      }
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"SubnetMaskArray"];
    subnetMasks = v5->_subnetMasks;
    v5->_subnetMasks = (NSArray *)v18;

    if (!v5->_subnetMasks)
    {
      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SubnetMask"];
      if (v20)
      {
        uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v20, 0);
        id v22 = v5->_subnetMasks;
        v5->_subnetMasks = (NSArray *)v21;

        int v23 = ne_log_obj();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          long long v38 = v5->_subnetMasks;
          *(_DWORD *)buf = 138412290;
          long long v41 = v38;
          _os_log_debug_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEBUG, "initwithcoder subnet mask %@", buf, 0xCu);
        }
      }
    }
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Router"];
    router = v5->_router;
    v5->_router = (NSString *)v24;

    uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"IncludeRoutes"];
    includedRoutes = v5->_includedRoutes;
    v5->_includedRoutes = (NSArray *)v29;

    uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"ExcludeRoutes"];
    excludedRoutes = v5->_excludedRoutes;
    v5->_excludedRoutes = (NSArray *)v34;

    v5->_overridePrimary = [v4 decodeBoolForKey:@"OverridePrimary"];
  }

  return v5;
}

- (NEIPv4Settings)initWithConfigMethod:(int64_t)a3
{
  result = [(NEIPv4Settings *)self init];
  if (result) {
    result->_configMethod = a3;
  }
  return result;
}

- (NEIPv4Settings)initWithAddresses:(NSArray *)addresses subnetMasks:(NSArray *)subnetMasks
{
  id v6 = addresses;
  uint64_t v7 = subnetMasks;
  v15.receiver = self;
  v15.super_class = (Class)NEIPv4Settings;
  int v8 = [(NEIPv4Settings *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_configMethod = 3;
    uint64_t v10 = [(NSArray *)v6 copy];
    unint64_t v11 = v9->_addresses;
    v9->_addresses = (NSArray *)v10;

    uint64_t v12 = [(NSArray *)v7 copy];
    unint64_t v13 = v9->_subnetMasks;
    v9->_subnetMasks = (NSArray *)v12;
  }
  return v9;
}

- (NEIPv4Settings)init
{
  v9.receiver = self;
  v9.super_class = (Class)NEIPv4Settings;
  v2 = [(NEIPv4Settings *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    v2->_configMethod = 3;
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    addresses = v3->_addresses;
    v3->_addresses = v4;

    id v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    subnetMasks = v3->_subnetMasks;
    v3->_subnetMasks = v6;
  }
  return v3;
}

+ (NEIPv4Settings)settingsWithAutomaticAddressing
{
  v2 = [[NEIPv4Settings alloc] initWithConfigMethod:1];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end