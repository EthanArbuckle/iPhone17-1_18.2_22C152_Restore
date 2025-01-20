@interface NEIPv6Settings
+ (BOOL)supportsSecureCoding;
+ (NEIPv6Settings)settingsWithAutomaticAddressing;
+ (NEIPv6Settings)settingsWithLinkLocalAddressing;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)hasDefaultRoute;
- (NEIPv6Settings)init;
- (NEIPv6Settings)initWithAddresses:(NSArray *)addresses networkPrefixLengths:(NSArray *)networkPrefixLengths;
- (NEIPv6Settings)initWithCoder:(id)a3;
- (NEIPv6Settings)initWithConfigMethod:(int64_t)a3;
- (NSArray)addresses;
- (NSArray)excludedRoutes;
- (NSArray)includedRoutes;
- (NSArray)networkPrefixLengths;
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
- (void)setRouter:(id)a3;
@end

@implementation NEIPv6Settings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_excludedRoutes, 0);
  objc_storeStrong((id *)&self->_includedRoutes, 0);
  objc_storeStrong((id *)&self->_networkPrefixLengths, 0);

  objc_storeStrong((id *)&self->_addresses, 0);
}

- (void)setRouter:(id)a3
{
}

- (NSString)router
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConfigMethod:(int64_t)a3
{
  self->_configMethod = a3;
}

- (int64_t)configMethod
{
  return self->_configMethod;
}

- (void)setExcludedRoutes:(NSArray *)excludedRoutes
{
}

- (NSArray)excludedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIncludedRoutes:(NSArray *)includedRoutes
{
}

- (NSArray)includedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)networkPrefixLengths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)addresses
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
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
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(NEIPv6Settings *)self initWithConfigMethod:1];
  if (!v6) {
    goto LABEL_55;
  }
  long long v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41CC8]];
  if (isa_nsstring(v7))
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F420B8]])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F420C0]])
    {
      uint64_t v8 = 2;
    }
    else
    {
      if (![v7 isEqualToString:*MEMORY[0x1E4F420B0]]) {
        goto LABEL_10;
      }
      uint64_t v8 = 1;
    }
    v6->_configMethod = v8;
  }
LABEL_10:
  uint64_t v9 = *MEMORY[0x1E4F41CC0];
  long long v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41CC0]];
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
  uint64_t v17 = *MEMORY[0x1E4F41CE8];
  v18 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41CE8]];
  int v19 = isa_nsarray(v18);

  if (v19)
  {
    v20 = [v5 objectForKeyedSubscript:v17];
    if ([v20 count])
    {
      v21 = [v20 objectAtIndexedSubscript:0];
      int v22 = isa_nsnumber(v21);

      if (v22)
      {
        uint64_t v23 = [v20 copy];
        networkPrefixLengths = v6->_networkPrefixLengths;
        v6->_networkPrefixLengths = (NSArray *)v23;
      }
    }
  }
  uint64_t v25 = *MEMORY[0x1E4F41D10];
  v26 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41D10]];
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
  v34 = (uint64_t *)MEMORY[0x1E4F41CE0];
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
  if (!isa_nsnumber(v38))
  {
LABEL_33:

    goto LABEL_34;
  }
  v39 = [v5 objectForKeyedSubscript:v31];
  int v40 = [v39 BOOLValue];

  if (v40)
  {
    v38 = +[NEIPv6Route defaultRoute];
    [v37 addObject:v38];
    goto LABEL_33;
  }
LABEL_34:
  uint64_t v41 = *v34;
  v42 = [v5 objectForKeyedSubscript:*v34];
  int v43 = isa_nsarray(v42);

  if (v43)
  {
    v44 = [v5 objectForKeyedSubscript:v41];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v68 objects:v73 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v69;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v69 != v47) {
            objc_enumerationMutation(v44);
          }
          id v49 = [[NEIPv6Route alloc] initFromLegacyDictionary:*(void *)(*((void *)&v68 + 1) + 8 * v48)];
          [v37 addObject:v49];

          ++v48;
        }
        while (v46 != v48);
        uint64_t v46 = [v44 countByEnumeratingWithState:&v68 objects:v73 count:16];
      }
      while (v46);
    }
  }
  if (v37) {
    objc_storeStrong((id *)&v6->_includedRoutes, v37);
  }
  uint64_t v50 = *MEMORY[0x1E4F41CD0];
  v51 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F41CD0]];
  int v52 = isa_nsarray(v51);

  if (v52)
  {
    v63 = v7;
    v53 = [v5 objectForKeyedSubscript:v50];
    v54 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v55 = v53;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v65;
      do
      {
        uint64_t v59 = 0;
        do
        {
          if (*(void *)v65 != v58) {
            objc_enumerationMutation(v55);
          }
          id v60 = [[NEIPv6Route alloc] initFromLegacyDictionary:*(void *)(*((void *)&v64 + 1) + 8 * v59)];
          [(NSArray *)v54 addObject:v60];

          ++v59;
        }
        while (v57 != v59);
        uint64_t v57 = [v55 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v57);
    }

    excludedRoutes = v6->_excludedRoutes;
    v6->_excludedRoutes = v54;

    long long v7 = v63;
  }

LABEL_55:
  return v6;
}

- (id)copyLegacyDictionary
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NEIPv6Settings *)self configMethod] == 3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F420B8];
LABEL_5:
    [v3 setObject:*v4 forKeyedSubscript:*MEMORY[0x1E4F41CC8]];
    goto LABEL_6;
  }
  if ([(NEIPv6Settings *)self configMethod] == 1)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F420B0];
    goto LABEL_5;
  }
  if ([(NEIPv6Settings *)self configMethod] == 2)
  {
    [v3 setObject:*MEMORY[0x1E4F420C0] forKeyedSubscript:*MEMORY[0x1E4F41CC8]];
    uint64_t v25 = [(NEIPv6Settings *)self addresses];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      int v27 = [(NEIPv6Settings *)self addresses];
      [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F41CC0]];
    }
    v28 = [(NEIPv6Settings *)self networkPrefixLengths];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      v30 = [(NEIPv6Settings *)self networkPrefixLengths];
      [v3 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F41CE8]];
    }
    uint64_t v31 = [(NEIPv6Settings *)self router];

    if (v31)
    {
      v32 = [(NEIPv6Settings *)self router];
      [v3 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F41D10]];
    }
  }
LABEL_6:
  id v5 = [(NEIPv6Settings *)self includedRoutes];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v7 = [(NEIPv6Settings *)self includedRoutes];
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
            [v3 setObject:&unk_1EF08D150 forKeyedSubscript:v11];
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
  uint64_t v15 = [(NEIPv6Settings *)self excludedRoutes];

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v17 = [(NEIPv6Settings *)self excludedRoutes];
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
  unint64_t v8 = [(NEIPv6Settings *)self configMethod] - 1;
  if (v8 <= 2) {
    [v7 appendPrettyObject:off_1E5991848[v8] withName:@"configMethod" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];
  }
  uint64_t v9 = [(NEIPv6Settings *)self addresses];
  unint64_t v10 = a4 | 9;
  [v7 appendPrettyObject:v9 withName:@"addresses" andIndent:v5 options:a4 | 9];

  uint64_t v11 = [(NEIPv6Settings *)self networkPrefixLengths];
  unint64_t v12 = a4 | 8;
  [v7 appendPrettyObject:v11 withName:@"networkPrefixLengths" andIndent:v5 options:v12];

  v13 = [(NEIPv6Settings *)self router];
  [v7 appendPrettyObject:v13 withName:@"router" andIndent:v5 options:v10];

  int v14 = [(NEIPv6Settings *)self includedRoutes];
  [v7 appendPrettyObject:v14 withName:@"includedRoutes" andIndent:v5 options:v12];

  uint64_t v15 = [(NEIPv6Settings *)self excludedRoutes];
  [v7 appendPrettyObject:v15 withName:@"excludedRoutes" andIndent:v5 options:v12];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if ([(NEIPv6Settings *)self configMethod] != 2) {
    return 1;
  }
  v50[0] = 0;
  v50[1] = 0;
  uint64_t v4 = [(NEIPv6Settings *)self addresses];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    uint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unint64_t v10 = "Missing IPv6 address";
      goto LABEL_43;
    }
LABEL_7:

    goto LABEL_8;
  }
  id v6 = [(NEIPv6Settings *)self addresses];
  id v7 = [v6 objectAtIndexedSubscript:0];
  int v8 = inet_pton(30, (const char *)[v7 UTF8String], v50);

  if (!v8)
  {
    uint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unint64_t v10 = "Invalid IPv6 address";
LABEL_43:
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v11 = [(NEIPv6Settings *)self router];
  if (v11)
  {
    unint64_t v12 = (void *)v11;
    id v13 = [(NEIPv6Settings *)self router];
    int v14 = inet_pton(30, (const char *)[v13 UTF8String], v50);

    if (!v14)
    {
      uint64_t v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Invalid IPv6 router", buf, 2u);
      }
    }
  }
  id v16 = [(NEIPv6Settings *)self networkPrefixLengths];
  uint64_t v17 = [v16 count];
  uint64_t v18 = [(NEIPv6Settings *)self addresses];
  uint64_t v19 = [v18 count];

  if (v17 != v19)
  {
    uint64_t v20 = ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v38 = [(NEIPv6Settings *)self addresses];
      uint64_t v39 = [v38 count];
      long long v40 = [(NEIPv6Settings *)self networkPrefixLengths];
      uint64_t v41 = [v40 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v54 = v39;
      __int16 v55 = 2048;
      uint64_t v56 = v41;
      _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, "Missing networkPrefixLengths (address count = %lu, prefix length count = %lu)", buf, 0x16u);
    }
  }
  v21 = [(NEIPv6Settings *)self networkPrefixLengths];
  if (![v21 count]) {
    goto LABEL_21;
  }
  int v22 = [(NEIPv6Settings *)self networkPrefixLengths];
  uint64_t v23 = [v22 objectAtIndex:0];
  int v24 = [v23 intValue];

  if (v24 >= 129)
  {
    v21 = ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_ERROR, "Invalid IPv6 prefix length", buf, 2u);
    }
LABEL_21:
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v26 = [(NEIPv6Settings *)self includedRoutes];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * i) checkValidityAndCollectErrors:v25];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v28);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v31 = [(NEIPv6Settings *)self excludedRoutes];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * j) checkValidityAndCollectErrors:v25];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v33);
  }

  if ([v25 count])
  {
    long long v36 = ne_log_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = (uint64_t)v25;
      _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "IPv6 routes are invalid: %@", buf, 0xCu);
    }
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NEIPv6Settings allocWithZone:a3];
  uint64_t v5 = [(NEIPv6Settings *)self addresses];
  id v6 = [(NEIPv6Settings *)self networkPrefixLengths];
  id v7 = [(NEIPv6Settings *)v4 initWithAddresses:v5 networkPrefixLengths:v6];

  [(NEIPv6Settings *)v7 setConfigMethod:[(NEIPv6Settings *)self configMethod]];
  int v8 = [(NEIPv6Settings *)self router];
  [(NEIPv6Settings *)v7 setRouter:v8];

  uint64_t v9 = [(NEIPv6Settings *)self includedRoutes];
  [(NEIPv6Settings *)v7 setIncludedRoutes:v9];

  unint64_t v10 = [(NEIPv6Settings *)self excludedRoutes];
  [(NEIPv6Settings *)v7 setExcludedRoutes:v10];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEIPv6Settings configMethod](self, "configMethod"), @"ConfigMethod");
  uint64_t v5 = [(NEIPv6Settings *)self addresses];
  [v4 encodeObject:v5 forKey:@"AddressArray"];

  id v6 = [(NEIPv6Settings *)self router];
  [v4 encodeObject:v6 forKey:@"Router"];

  id v7 = [(NEIPv6Settings *)self networkPrefixLengths];
  [v4 encodeObject:v7 forKey:@"PrefixLengthArray"];

  int v8 = [(NEIPv6Settings *)self includedRoutes];
  [v4 encodeObject:v8 forKey:@"IncludeRoutes"];

  id v9 = [(NEIPv6Settings *)self excludedRoutes];
  [v4 encodeObject:v9 forKey:@"ExcludeRoutes"];
}

- (NEIPv6Settings)initWithCoder:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NEIPv6Settings;
  uint64_t v5 = [(NEIPv6Settings *)&v41 init];
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
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
      if (v11)
      {
        uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v11, 0);
        id v13 = v5->_addresses;
        v5->_addresses = (NSArray *)v12;

        int v14 = ne_log_obj();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v39 = v5->_addresses;
          *(_DWORD *)buf = 138412290;
          long long v43 = v39;
          _os_log_debug_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEBUG, "initwithcoder single router IPv6address %@", buf, 0xCu);
        }
      }
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"PrefixLengthArray"];
    networkPrefixLengths = v5->_networkPrefixLengths;
    v5->_networkPrefixLengths = (NSArray *)v18;

    if (!v5->_networkPrefixLengths)
    {
      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrefixLength"];

      if (v20)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F1C978]);
        int v22 = [NSNumber numberWithInt:v20];
        uint64_t v23 = objc_msgSend(v21, "initWithObjects:", v22, 0);
        int v24 = v5->_networkPrefixLengths;
        v5->_networkPrefixLengths = (NSArray *)v23;

        id v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          long long v40 = v5->_networkPrefixLengths;
          *(_DWORD *)buf = 138412290;
          long long v43 = v40;
          _os_log_debug_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEBUG, "initwithcoder single prefixLength %@", buf, 0xCu);
        }
      }
    }
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Router"];
    router = v5->_router;
    v5->_router = (NSString *)v26;

    uint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"IncludeRoutes"];
    includedRoutes = v5->_includedRoutes;
    v5->_includedRoutes = (NSArray *)v31;

    uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    long long v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"ExcludeRoutes"];
    excludedRoutes = v5->_excludedRoutes;
    v5->_excludedRoutes = (NSArray *)v36;
  }
  return v5;
}

- (NEIPv6Settings)initWithConfigMethod:(int64_t)a3
{
  result = [(NEIPv6Settings *)self init];
  if (result) {
    result->_configMethod = a3;
  }
  return result;
}

- (NEIPv6Settings)initWithAddresses:(NSArray *)addresses networkPrefixLengths:(NSArray *)networkPrefixLengths
{
  id v6 = addresses;
  uint64_t v7 = networkPrefixLengths;
  v15.receiver = self;
  v15.super_class = (Class)NEIPv6Settings;
  int v8 = [(NEIPv6Settings *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_configMethod = 2;
    uint64_t v10 = [(NSArray *)v6 copy];
    uint64_t v11 = v9->_addresses;
    v9->_addresses = (NSArray *)v10;

    uint64_t v12 = [(NSArray *)v7 copy];
    id v13 = v9->_networkPrefixLengths;
    v9->_networkPrefixLengths = (NSArray *)v12;
  }
  return v9;
}

- (NEIPv6Settings)init
{
  v9.receiver = self;
  v9.super_class = (Class)NEIPv6Settings;
  v2 = [(NEIPv6Settings *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    v2->_configMethod = 2;
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    addresses = v3->_addresses;
    v3->_addresses = v4;

    id v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    networkPrefixLengths = v3->_networkPrefixLengths;
    v3->_networkPrefixLengths = v6;
  }
  return v3;
}

+ (NEIPv6Settings)settingsWithLinkLocalAddressing
{
  v2 = [[NEIPv6Settings alloc] initWithConfigMethod:3];

  return v2;
}

+ (NEIPv6Settings)settingsWithAutomaticAddressing
{
  v2 = [[NEIPv6Settings alloc] initWithConfigMethod:1];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end