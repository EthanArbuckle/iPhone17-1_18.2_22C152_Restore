@interface MCMEntitlementBypassList
+ (id)sharedBypassList;
- (BOOL)containerIdIsWellknown:(id)a3 class:(unint64_t)a4;
- (BOOL)isLookupAllowedToBypassEntitlementFromCodeSignIdentifier:(id)a3 forContainerClass:(unint64_t)a4 containerIdentifier:(id)a5;
- (BOOL)systemContainerIdIsWellknown:(id)a3;
- (BOOL)systemGroupContainerIdIsWellknown:(id)a3;
- (MCMEntitlementBypassList)initWithSystemContainerMapping:(id)a3 systemGroupContainerMapping:(id)a4 bypassListedCodeSignIdentifierMapping:(id)a5;
- (NSDictionary)systemEntitlementBypassList;
- (NSDictionary)systemGroupEntitlementBypassList;
- (id)_convertArraysToSetsInNestedDictionary:(id)a3;
- (id)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet;
- (id)wellknownContainerForId:(id)a3 class:(unint64_t)a4;
- (id)wellknownSystemContainerForId:(id)a3;
- (id)wellknownSystemContainers;
- (id)wellknownSystemGroupContainerForId:(id)a3;
- (id)wellknownSystemGroupContainers;
- (void)setSystemEntitlementBypassList:(id)a3;
- (void)setSystemGroupEntitlementBypassList:(id)a3;
@end

@implementation MCMEntitlementBypassList

+ (id)sharedBypassList
{
  if (sharedBypassList_onceToken != -1) {
    dispatch_once(&sharedBypassList_onceToken, &__block_literal_global_1352);
  }
  v2 = (void *)sharedBypassList_sharedInstance;

  return v2;
}

- (BOOL)systemGroupContainerIdIsWellknown:(id)a3
{
  id v4 = a3;
  v5 = [(MCMEntitlementBypassList *)self systemGroupEntitlementBypassList];
  v6 = [v5 valueForKey:v4];

  return v6 != 0;
}

- (NSDictionary)systemGroupEntitlementBypassList
{
  return self->_systemGroupEntitlementBypassList;
}

- (BOOL)isLookupAllowedToBypassEntitlementFromCodeSignIdentifier:(id)a3 forContainerClass:(unint64_t)a4 containerIdentifier:(id)a5
{
  id v8 = a5;
  if (a4 <= 0xE)
  {
    v10 = [(NSDictionary *)self->_bypassListedLookupByCodeSignIdentifier objectForKeyedSubscript:a3];
    if (v10)
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      char v12 = [v10 isEqual:v11];

      if (v12)
      {
        v13 = 0;
LABEL_9:
        char v9 = 1;
LABEL_11:

        goto LABEL_12;
      }
      v14 = [NSNumber numberWithUnsignedLongLong:a4];
      v13 = [v10 objectForKeyedSubscript:v14];

      if (v13)
      {
        v15 = [MEMORY[0x1E4F1CA98] null];
        char v16 = [v13 isEqual:v15];

        if ((v16 & 1) == 0)
        {
          char v9 = [v13 containsObject:v8];
          goto LABEL_11;
        }
        goto LABEL_9;
      }
    }
    else
    {
      v13 = 0;
    }
    char v9 = 0;
    goto LABEL_11;
  }
  char v9 = 0;
LABEL_12:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGroupEntitlementBypassList, 0);
  objc_storeStrong((id *)&self->_systemEntitlementBypassList, 0);

  objc_storeStrong((id *)&self->_bypassListedLookupByCodeSignIdentifier, 0);
}

- (void)setSystemGroupEntitlementBypassList:(id)a3
{
  p_systemGroupEntitlementBypassList = &self->_systemGroupEntitlementBypassList;

  objc_storeStrong((id *)p_systemGroupEntitlementBypassList, a3);
}

- (void)setSystemEntitlementBypassList:(id)a3
{
  p_systemEntitlementBypassList = &self->_systemEntitlementBypassList;

  objc_storeStrong((id *)p_systemEntitlementBypassList, a3);
}

- (NSDictionary)systemEntitlementBypassList
{
  return self->_systemEntitlementBypassList;
}

- (id)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet
{
  if (wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_onceToken != -1) {
    dispatch_once(&wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_onceToken, &__block_literal_global_97);
  }
  v2 = (void *)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_set;

  return v2;
}

uint64_t __91__MCMEntitlementBypassList_wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet__block_invoke()
{
  wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_set = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.facetime", @"com.apple.iBooks", @"com.apple.Maps", @"com.apple.mobilenotes", @"com.apple.mobilesafari", @"com.apple.podcasts", 0);

  return MEMORY[0x1F41817F8]();
}

- (id)_convertArraysToSetsInNestedDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v21 = v3;
  v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];
  v22 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
  if ([v5 count])
  {
    do
    {
      v6 = [v5 lastObject];
      v7 = v5;
      [v5 removeLastObject];
      id v8 = [v22 lastObject];
      [v22 removeLastObject];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            v15 = [v9 objectForKeyedSubscript:v14];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
              [v8 setObject:v16 forKeyedSubscript:v14];

              [v7 addObject:v15];
              v17 = [v8 objectForKeyedSubscript:v14];
              [v22 addObject:v17];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
                [v8 setObject:v18 forKeyedSubscript:v14];
              }
              else
              {
                [v8 setObject:v15 forKeyedSubscript:v14];
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v23 count:16];
        }
        while (v11);
      }

      v5 = v7;
    }
    while ([v7 count]);
  }
  v19 = (void *)[v4 copy];

  return v19;
}

- (id)wellknownContainerForId:(id)a3 class:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 13)
  {
    uint64_t v7 = [(MCMEntitlementBypassList *)self wellknownSystemGroupContainerForId:v6];
    goto LABEL_5;
  }
  if (a4 == 12)
  {
    uint64_t v7 = [(MCMEntitlementBypassList *)self wellknownSystemContainerForId:v6];
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)containerIdIsWellknown:(id)a3 class:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 13)
  {
    BOOL v7 = [(MCMEntitlementBypassList *)self systemGroupContainerIdIsWellknown:v6];
  }
  else
  {
    if (a4 != 12)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    BOOL v7 = [(MCMEntitlementBypassList *)self systemContainerIdIsWellknown:v6];
  }
  BOOL v8 = v7;
LABEL_7:

  return v8;
}

- (id)wellknownSystemGroupContainers
{
  v2 = [(MCMEntitlementBypassList *)self systemGroupEntitlementBypassList];
  id v3 = [v2 allKeys];

  return v3;
}

- (id)wellknownSystemGroupContainerForId:(id)a3
{
  id v4 = a3;
  v5 = [(MCMEntitlementBypassList *)self systemGroupEntitlementBypassList];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (id)wellknownSystemContainers
{
  v2 = [(MCMEntitlementBypassList *)self systemEntitlementBypassList];
  id v3 = [v2 allKeys];

  return v3;
}

- (BOOL)systemContainerIdIsWellknown:(id)a3
{
  id v4 = a3;
  v5 = [(MCMEntitlementBypassList *)self systemEntitlementBypassList];
  id v6 = [v5 valueForKey:v4];

  return v6 != 0;
}

- (id)wellknownSystemContainerForId:(id)a3
{
  id v4 = a3;
  v5 = [(MCMEntitlementBypassList *)self systemEntitlementBypassList];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (MCMEntitlementBypassList)initWithSystemContainerMapping:(id)a3 systemGroupContainerMapping:(id)a4 bypassListedCodeSignIdentifierMapping:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MCMEntitlementBypassList;
  uint64_t v11 = [(MCMEntitlementBypassList *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    [(MCMEntitlementBypassList *)v11 setSystemEntitlementBypassList:v8];
    [(MCMEntitlementBypassList *)v12 setSystemGroupEntitlementBypassList:v9];
    uint64_t v13 = [(MCMEntitlementBypassList *)v12 _convertArraysToSetsInNestedDictionary:v10];
    bypassListedLookupByCodeSignIdentifier = v12->_bypassListedLookupByCodeSignIdentifier;
    v12->_bypassListedLookupByCodeSignIdentifier = (NSDictionary *)v13;
  }
  return v12;
}

void __44__MCMEntitlementBypassList_sharedBypassList__block_invoke()
{
  v22[9] = *MEMORY[0x1E4F143B8];
  v21[0] = @"com.apple.mobile.MobileHouseArrest";
  uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  v22[0] = v14;
  v21[1] = @"com.apple.accountsd";
  v19 = &unk_1F2F11978;
  v20 = &unk_1F2F123E0;
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v22[1] = v0;
  v21[2] = @"com.apple.itunescloudd";
  v1 = [MEMORY[0x1E4F1CA98] null];
  v22[2] = v1;
  v21[3] = @"com.apple.CacheDeleteDaily";
  v2 = [MEMORY[0x1E4F1CA98] null];
  v22[3] = v2;
  v21[4] = @"com.apple.Safari.History";
  uint64_t v17 = &unk_1F2F11990;
  v18 = &unk_1F2F123F8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v22[4] = v3;
  v21[5] = @"com.apple.mobile_installation_proxy";
  id v4 = [MEMORY[0x1E4F1CA98] null];
  v22[5] = v4;
  v21[6] = @"com.apple.AppPredictionWidget.extension";
  v5 = [MEMORY[0x1E4F1CA98] null];
  v22[6] = v5;
  v21[7] = @"com.apple.Maps.Widget";
  v15 = &unk_1F2F11990;
  objc_super v16 = &unk_1F2F12410;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v22[7] = v6;
  v21[8] = @"com.apple.filecoordinationd";
  BOOL v7 = [MEMORY[0x1E4F1CA98] null];
  v22[8] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:9];

  id v9 = containermanager_copy_global_configuration();
  LODWORD(v0) = [v9 isInternalImage];

  if (v0)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:&unk_1F2F10F40];
    [v10 setValue:@"systemgroup.com.apple.codecoveragedata" forKey:@"systemgroup.com.apple.codecoveragedata"];
    uint64_t v11 = (void *)[v10 copy];
  }
  else
  {
    uint64_t v11 = &unk_1F2F10F40;
  }
  uint64_t v12 = [[MCMEntitlementBypassList alloc] initWithSystemContainerMapping:&unk_1F2F10F18 systemGroupContainerMapping:v11 bypassListedCodeSignIdentifierMapping:v8];
  uint64_t v13 = (void *)sharedBypassList_sharedInstance;
  sharedBypassList_sharedInstance = (uint64_t)v12;
}

@end