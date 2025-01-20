@interface DSSourceDescriptor
+ (id)descriptorCache;
+ (id)sourceDescriptorForSource:(id)a3;
+ (id)sourceDescriptorForSource:(id)a3 localizationBundle:(id)a4;
+ (void)initialize;
+ (void)setDescriptorCache:(uint64_t)a1;
- (BOOL)requiresCellular;
- (BOOL)requiresWifi;
- (BOOL)shouldIgnoreError:(id)a3;
- (BOOL)supportsResourceTypes;
- (NSArray)darwinNotifications;
- (NSDictionary)ignoreErrors;
- (NSString)correspondingApplicationIdentifier;
- (NSString)dataUsageBundleIdentifier;
- (NSString)localizedAlertButtonLabel;
- (NSString)localizedAppName;
- (NSString)localizedName;
- (NSString)localizedStopAllAlertDetail;
- (NSString)localizedStopAllAlertLabel;
- (NSString)localizedStopAllLabel;
- (__CFString)resourceTypeFromResource:(uint64_t)a1;
- (id)_locKeyForResources:(void *)a3 withDescriptorKey:;
- (id)_localizedStopByPerson:(void *)a3 detailTextForDirectlySharedResources:;
- (id)_localizedStopByPerson:(void *)a3 detailTextForIndirectlySharedResources:;
- (id)initWithSourceName:(void *)a3 localizationBundle:;
- (id)localizedAlertDetailForSelectedPeople:(id)a3;
- (id)localizedAlertTextForPerson:(id)a3;
- (id)localizedDetailTextByType:(id)a3;
- (id)localizedPublicSharingDetailTextByType:(id)a3;
- (id)localizedStopAllAlertDetailForPeople:(id)a3;
- (id)localizedStopByPerson:(id)a3;
- (id)localizedStopByTypeSubtitleForSharingType:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)orderedResourceTypes:(id)a1;
- (id)peopleByResourceType:(uint64_t)a1;
- (id)resourceTypeOrder;
- (id)sharedResourcesByResourceType:(uint64_t)a1;
- (int64_t)priority;
- (uint64_t)localizationBundle;
- (uint64_t)sourceName;
- (uint64_t)sourceProperties;
- (void)_sharedResourcesForPeople:(int)a3 isOwnedByUser:;
- (void)localizableKey:(void *)a1;
- (void)setLocalizationBundle:(uint64_t)a1;
- (void)setSourceName:(uint64_t)a1;
- (void)setSourceProperties:(uint64_t)a1;
@end

@implementation DSSourceDescriptor

+ (id)descriptorCache
{
  self;
  v0 = (void *)_descriptorCache;
  if (!_descriptorCache)
  {
    uint64_t v1 = [MEMORY[0x263EFF9A0] dictionary];
    v2 = (void *)_descriptorCache;
    _descriptorCache = v1;

    v0 = (void *)_descriptorCache;
  }
  return v0;
}

+ (void)setDescriptorCache:(uint64_t)a1
{
  id v5 = a2;
  self;
  v2 = v5;
  if ((id)_descriptorCache != v5)
  {
    uint64_t v3 = [v5 copy];
    v4 = (void *)_descriptorCache;
    _descriptorCache = v3;

    v2 = v5;
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogSourceDescriptor = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSSourceDescriptor");
    MEMORY[0x270F9A758]();
  }
}

- (id)initWithSourceName:(void *)a3 localizationBundle:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    if (![v6 length])
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:sel_initWithSourceName_localizationBundle_, a1, @"DSSourceDescriptor.m", 105, @"Invalid parameter not satisfying: %@", @"sourceName.length" object file lineNumber description];
    }
    if (![v6 length])
    {
      id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"No source name provided" userInfo:0];
      objc_exception_throw(v14);
    }
    v15.receiver = a1;
    v15.super_class = (Class)DSSourceDescriptor;
    v8 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      v9 = [a1[2] URLForResource:@"SourceDescriptors" withExtension:@"plist"];
      uint64_t v10 = [NSDictionary dictionaryWithContentsOfURL:v9];
      id v11 = a1[3];
      a1[3] = (id)v10;
    }
  }

  return a1;
}

- (void)setSourceName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setLocalizationBundle:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (uint64_t)localizationBundle
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setSourceProperties:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

+ (id)sourceDescriptorForSource:(id)a3
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "dssd_bundleForSourceDescriptor");
  id v7 = [a1 sourceDescriptorForSource:v5 localizationBundle:v6];

  return v7;
}

+ (id)sourceDescriptorForSource:(id)a3 localizationBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[DSSourceDescriptor descriptorCache]();
  v8 = [v7 objectForKeyedSubscript:v5];

  if (!v8)
  {
    v8 = -[DSSourceDescriptor initWithSourceName:localizationBundle:]((id *)[DSSourceDescriptor alloc], v5, v6);
    v9 = +[DSSourceDescriptor descriptorCache]();
    [v9 setObject:v8 forKeyedSubscript:v5];
  }
  id v10 = v8;

  return v10;
}

- (__CFString)resourceTypeFromResource:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = [a2 displayDetail];
    v4 = @"RESOURCE";
    if (v3)
    {
      id v5 = *(void **)(a1 + 24);
      uint64_t v6 = *(void *)(a1 + 8);
      id v7 = v5;
      v8 = [v7 objectForKeyedSubscript:v6];
      v9 = [v8 objectForKeyedSubscript:@"RESOURCE_TYPES"];

      uint64_t v10 = [v9 objectForKeyedSubscript:v3];
      id v11 = (void *)v10;
      if (v10) {
        v12 = (__CFString *)v10;
      }
      else {
        v12 = @"RESOURCE";
      }
      v4 = v12;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)sourceProperties
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)sourceName
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (id)sharedResourcesByResourceType:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v17 = v3;
  if (a1)
  {
    v4 = v3;
    id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v3);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          -[DSSourceDescriptor resourceTypeFromResource:](a1, v10);
          id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if ([(__CFString *)v11 isEqualToString:@"RESOURCE"])
          {

            id v11 = @"RESOURCES";
          }
          v12 = [v5 objectForKeyedSubscript:v11];
          v13 = v12;
          if (v12)
          {
            id v14 = v12;
          }
          else
          {
            id v14 = [MEMORY[0x263EFF9C0] set];
          }
          objc_super v15 = v14;

          [v15 addObject:v10];
          [v5 setObject:v15 forKeyedSubscript:v11];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)peopleByResourceType:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v19 = v3;
  if (a1)
  {
    v4 = v3;
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [v4 allPeople];
    uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v29;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = v6;
          uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v8 = [v7 sharedResourcesForSourceName:*(void *)(a1 + 8)];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v25 != v11) {
                  objc_enumerationMutation(v8);
                }
                -[DSSourceDescriptor resourceTypeFromResource:](a1, *(void **)(*((void *)&v24 + 1) + 8 * i));
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if ([(__CFString *)v13 isEqualToString:@"RESOURCE"])
                {

                  v13 = @"RESOURCES";
                }
                id v14 = [v5 objectForKeyedSubscript:v13];
                objc_super v15 = v14;
                if (v14)
                {
                  id v16 = v14;
                }
                else
                {
                  id v16 = [MEMORY[0x263EFF9C0] set];
                }
                v17 = v16;

                [v17 addObject:v7];
                [v5 setObject:v17 forKeyedSubscript:v13];
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v10);
          }

          uint64_t v6 = v23 + 1;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v22);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)resourceTypeOrder
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 8);
    id v2 = *(id *)(a1 + 24);
    id v3 = [v2 objectForKeyedSubscript:v1];
    v4 = [v3 objectForKeyedSubscript:@"RESOURCE_TYPE_ORDER"];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      v9[0] = @"RESOURCES";
      id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    }
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)orderedResourceTypes:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = [MEMORY[0x263EFF980] arrayWithArray:a2];
    v4 = -[DSSourceDescriptor resourceTypeOrder]((uint64_t)v2);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__DSSourceDescriptor_orderedResourceTypes___block_invoke;
    v7[3] = &unk_264C9EB18;
    id v8 = v4;
    id v5 = v4;
    [v3 sortUsingComparator:v7];
    id v2 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];
  }
  return v2;
}

uint64_t __43__DSSourceDescriptor_orderedResourceTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 indexOfObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];

  if (v7 >= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 > v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (void)localizableKey:(void *)a1
{
  if (a1)
  {
    a1 = [NSString stringWithFormat:@"%@_%@", a1[1], a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (NSString)localizedName
{
  if (self) {
    localizationBundle = self->_localizationBundle;
  }
  else {
    localizationBundle = 0;
  }
  v4 = localizationBundle;
  id v5 = -[DSSourceDescriptor localizableKey:](self, @"NAME");
  id v6 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_26E96B9B0 table:0];

  return (NSString *)v6;
}

- (NSString)localizedAppName
{
  id v3 = [(DSSourceDescriptor *)self correspondingApplicationIdentifier];
  if (v3)
  {
    id v12 = 0;
    v4 = [MEMORY[0x263F01878] bundleRecordWithApplicationIdentifier:v3 error:&v12];
    id v5 = v12;
    if (!v4)
    {
      if (self) {
        localizationBundle = self->_localizationBundle;
      }
      else {
        localizationBundle = 0;
      }
      uint64_t v10 = localizationBundle;
      -[DSSourceDescriptor localizableKey:](self, @"APP_NAME");
      unint64_t v8 = (NSBundle *)objc_claimAutoreleasedReturnValue();
      id v6 = [(NSBundle *)v10 localizedStringForKey:v8 value:&stru_26E96B9B0 table:0];

      goto LABEL_10;
    }
    id v6 = [v4 localizedName];

    if (v6) {
      goto LABEL_11;
    }
  }
  if (self) {
    unint64_t v7 = self->_localizationBundle;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v8 = v7;
  -[DSSourceDescriptor localizableKey:](self, @"APP_NAME");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(NSBundle *)v8 localizedStringForKey:v5 value:&stru_26E96B9B0 table:0];
LABEL_10:

LABEL_11:
  return (NSString *)v6;
}

- (NSString)localizedAlertButtonLabel
{
  if (self) {
    localizationBundle = self->_localizationBundle;
  }
  else {
    localizationBundle = 0;
  }
  v4 = localizationBundle;
  id v5 = -[DSSourceDescriptor localizableKey:](self, @"ALERT_BUTTON_LABEL");
  id v6 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_26E96B9B0 table:0];

  return (NSString *)v6;
}

- (id)localizedAlertDetailForSelectedPeople:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v52;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(v6);
        }
        if (self) {
          sourceName = self->_sourceName;
        }
        else {
          sourceName = 0;
        }
        id v12 = [*(id *)(*((void *)&v51 + 1) + 8 * v10) sharedResourcesForSourceName:sourceName];
        [v5 unionSet:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v13 = [v6 countByEnumeratingWithState:&v51 objects:v58 count:16];
      uint64_t v8 = v13;
    }
    while (v13);
  }

  id v14 = -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)self, v5);
  objc_super v15 = [v14 allKeys];
  id v16 = -[DSSourceDescriptor orderedResourceTypes:](self, (uint64_t)v15);

  uint64_t v17 = [v6 count];
  v18 = @"ALERT_DETAIL_%@";
  if (v17 == 1) {
    v18 = @"ALERT_DETAIL_SINGLE_PERSON_%@";
  }
  long long v19 = NSString;
  long long v20 = v18;
  uint64_t v21 = [v16 componentsJoinedByString:@"_"];
  uint64_t v22 = objc_msgSend(v19, "stringWithFormat:", v20, v21);

  int v23 = [(__CFString *)v20 isEqualToString:@"ALERT_DETAIL_SINGLE_PERSON_%@"];
  if (v23)
  {
    id v24 = [v6 firstObject];
    v50 = v14;
    if (self) {
      localizationBundle = self->_localizationBundle;
    }
    else {
      localizationBundle = 0;
    }
    long long v26 = localizationBundle;
    long long v27 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v22);
    long long v28 = [(NSBundle *)v26 localizedAttributedStringForKey:v27 value:&stru_26E96B9B0 table:0];

    id v29 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v56 = *MEMORY[0x263F08150];
    long long v30 = [v24 termsOfAddress];
    v55 = v30;
    long long v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
    v57 = v31;
    v32 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    v33 = (void *)[v29 initWithFormat:v28 options:0 locale:0 context:v32];

    uint64_t v34 = [v33 string];
    LODWORD(v30) = [v34 containsString:@"@"];

    if (v30)
    {
      v35 = NSString;
      v36 = [v33 string];
      [v24 displayGivenName];
      v37 = v28;
      v38 = v22;
      v40 = v39 = v16;
      v41 = objc_msgSend(v35, "stringWithFormat:", v36, v40);

      id v16 = v39;
      uint64_t v22 = v38;
      long long v28 = v37;
    }
    else
    {
      v41 = [v33 string];
    }
    id v14 = v50;
  }
  else
  {
    v42 = v16;
    if (self) {
      v43 = self->_localizationBundle;
    }
    else {
      v43 = 0;
    }
    v44 = v43;
    v45 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v22);
    id v24 = [(NSBundle *)v44 localizedStringForKey:v45 value:&stru_26E96B9B0 table:0];

    if ([v24 containsString:@"@"])
    {
      v46 = NSString;
      v47 = [v6 firstObject];
      v48 = [v47 displayGivenName];
      v41 = objc_msgSend(v46, "stringWithFormat:", v24, v48, objc_msgSend(v6, "count") - 1);
    }
    else
    {
      id v24 = v24;
      v41 = v24;
    }
    id v16 = v42;
  }

  return v41;
}

- (NSString)localizedStopAllLabel
{
  if (self) {
    localizationBundle = self->_localizationBundle;
  }
  else {
    localizationBundle = 0;
  }
  id v4 = localizationBundle;
  id v5 = -[DSSourceDescriptor localizableKey:](self, @"STOP_ALL_LABEL");
  id v6 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_26E96B9B0 table:0];

  return (NSString *)v6;
}

- (NSString)localizedStopAllAlertLabel
{
  if (self) {
    localizationBundle = self->_localizationBundle;
  }
  else {
    localizationBundle = 0;
  }
  id v4 = localizationBundle;
  id v5 = -[DSSourceDescriptor localizableKey:](self, @"STOP_ALL_SHARING_ALERT_LABEL");
  id v6 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_26E96B9B0 table:0];

  return (NSString *)v6;
}

- (NSString)localizedStopAllAlertDetail
{
  if (self) {
    localizationBundle = self->_localizationBundle;
  }
  else {
    localizationBundle = 0;
  }
  id v4 = localizationBundle;
  id v5 = -[DSSourceDescriptor localizableKey:](self, @"STOP_ALL_SHARING_ALERT_DETAIL");
  id v6 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_26E96B9B0 table:0];

  return (NSString *)v6;
}

- (id)localizedDetailTextByType:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 allPeople];
  id v6 = [MEMORY[0x263EFF9C0] set];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v7 = [v4 allPeople];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v78;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v78 != v10) {
          objc_enumerationMutation(v7);
        }
        if (self) {
          sourceName = self->_sourceName;
        }
        else {
          sourceName = 0;
        }
        uint64_t v13 = [*(id *)(*((void *)&v77 + 1) + 8 * v11) sharedResourcesForSourceName:sourceName];
        [v6 unionSet:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v14 = [v7 countByEnumeratingWithState:&v77 objects:v84 count:16];
      uint64_t v9 = v14;
    }
    while (v14);
  }

  objc_super v15 = -[DSSourceDescriptor peopleByResourceType:]((uint64_t)self, v4);
  id v16 = -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)self, v6);
  uint64_t v17 = [v16 allKeys];
  v18 = -[DSSourceDescriptor orderedResourceTypes:](self, (uint64_t)v17);

  if ([v16 count] == 1)
  {
    v76 = v5;
    uint64_t v19 = [v18 objectAtIndexedSubscript:0];
    long long v20 = [v16 objectForKeyedSubscript:v19];
    uint64_t v21 = [v20 count];

    id v75 = v4;
    v72 = (void *)v19;
    if (v21 == 1)
    {
      uint64_t v22 = NSString;
      int v23 = [v6 anyObject];
      id v24 = -[DSSourceDescriptor resourceTypeFromResource:]((uint64_t)self, v23);
      long long v25 = [v22 stringWithFormat:@"DETAIL_TEXT_SINGLE_%@_WITH_NAME", v24];

      if (self) {
        localizationBundle = self->_localizationBundle;
      }
      else {
        localizationBundle = 0;
      }
      long long v27 = localizationBundle;
      uint64_t v28 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v25);
      id v29 = [(NSBundle *)v27 localizedStringForKey:v28 value:&stru_26E96B9B0 table:0];

      long long v30 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v25);
      LOBYTE(v28) = [v29 isEqualToString:v30];

      long long v31 = [v6 anyObject];
      v32 = [v31 displayName];

      if ((v28 & 1) == 0 && [v32 length])
      {
        v33 = objc_msgSend(NSString, "localizedStringWithFormat:", v29, objc_msgSend(v76, "count"), v32);
LABEL_37:

        v58 = v72;
LABEL_38:

        id v4 = v75;
        id v5 = v76;
        goto LABEL_39;
      }

      uint64_t v59 = @"SINGLE";
      uint64_t v19 = (uint64_t)v72;
    }
    else
    {
      uint64_t v59 = @"MULTIPLE";
    }
    v60 = NSString;
    v83[0] = v59;
    v83[1] = v19;
    v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:2];
    v62 = [v61 componentsJoinedByString:@"_"];
    long long v25 = [v60 stringWithFormat:@"DETAIL_TEXT_%@", v62];

    if (self) {
      v63 = self->_localizationBundle;
    }
    else {
      v63 = 0;
    }
    v64 = v63;
    v65 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v25);
    id v29 = [(NSBundle *)v64 localizedStringForKey:v65 value:&stru_26E96B9B0 table:0];

    v66 = NSString;
    v32 = [v18 objectAtIndexedSubscript:0];
    v67 = [v15 objectForKeyedSubscript:v32];
    v33 = objc_msgSend(v66, "localizedStringWithFormat:", v29, objc_msgSend(v67, "count"));

    goto LABEL_37;
  }
  if ([v16 count] == 2)
  {
    v74 = v15;
    id v75 = v4;
    v76 = v5;
    uint64_t v34 = [v18 objectAtIndexedSubscript:0];
    v35 = [v16 objectForKeyedSubscript:v34];
    if ([v35 count] == 1) {
      v36 = @"SINGLE";
    }
    else {
      v36 = @"MULTIPLE";
    }
    v82[0] = v36;
    v37 = [v18 objectAtIndexedSubscript:1];
    v38 = [v16 objectForKeyedSubscript:v37];
    if ([v38 count] == 1) {
      v39 = @"SINGLE";
    }
    else {
      v39 = @"MULTIPLE";
    }
    v82[1] = v39;
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:2];

    v41 = NSString;
    v42 = [v40 objectAtIndexedSubscript:0];
    v81[0] = v42;
    v43 = [v18 objectAtIndexedSubscript:0];
    v81[1] = v43;
    v71 = v40;
    v44 = [v40 objectAtIndexedSubscript:1];
    v81[2] = v44;
    v73 = v18;
    v45 = [v18 objectAtIndexedSubscript:1];
    v81[3] = v45;
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
    v47 = [v46 componentsJoinedByString:@"_"];
    uint64_t v48 = [v41 stringWithFormat:@"DETAIL_TEXT_%@", v47];

    if (self) {
      v49 = self->_localizationBundle;
    }
    else {
      v49 = 0;
    }
    v50 = v49;
    long long v51 = -[DSSourceDescriptor localizableKey:](self, v48);
    v69 = [(NSBundle *)v50 localizedStringForKey:v51 value:&stru_26E96B9B0 table:0];

    v70 = (void *)v48;
    long long v52 = NSString;
    v18 = v73;
    long long v53 = [v73 objectAtIndexedSubscript:0];
    objc_super v15 = v74;
    long long v54 = [v74 objectForKeyedSubscript:v53];
    uint64_t v55 = [v54 count];
    uint64_t v56 = [v73 objectAtIndexedSubscript:1];
    v57 = [v74 objectForKeyedSubscript:v56];
    v33 = objc_msgSend(v52, "localizedStringWithFormat:", v69, v55, objc_msgSend(v57, "count"));

    v58 = v71;
    goto LABEL_38;
  }
  if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT)) {
    -[DSSourceDescriptor localizedDetailTextByType:]();
  }
  v33 = 0;
LABEL_39:

  return v33;
}

- (id)localizedPublicSharingDetailTextByType:(id)a3
{
  id v4 = [a3 allPublicResources];
  id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
  id v6 = -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)self, v5);

  uint64_t v7 = [v6 allKeys];
  uint64_t v8 = -[DSSourceDescriptor orderedResourceTypes:](self, (uint64_t)v7);

  uint64_t v9 = NSString;
  uint64_t v10 = [v8 componentsJoinedByString:@"_"];
  uint64_t v11 = [v9 stringWithFormat:@"PUBLIC_SHARING_DETAIL_TEXT_%@", v10];

  if (self) {
    localizationBundle = self->_localizationBundle;
  }
  else {
    localizationBundle = 0;
  }
  uint64_t v13 = localizationBundle;
  uint64_t v14 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v11);
  objc_super v15 = [(NSBundle *)v13 localizedStringForKey:v14 value:&stru_26E96B9B0 table:0];

  if ([v6 count] == 1)
  {
    id v16 = objc_msgSend(NSString, "localizedStringWithFormat:", v15, objc_msgSend(v4, "count"));
  }
  else if ([v6 count] == 2)
  {
    uint64_t v17 = NSString;
    int v23 = [v8 objectAtIndexedSubscript:0];
    v18 = [v6 objectForKeyedSubscript:v23];
    uint64_t v19 = [v18 count];
    long long v20 = [v8 objectAtIndexedSubscript:1];
    uint64_t v21 = [v6 objectForKeyedSubscript:v20];
    id v16 = objc_msgSend(v17, "localizedStringWithFormat:", v15, v19, objc_msgSend(v21, "count"));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT)) {
      -[DSSourceDescriptor localizedDetailTextByType:]();
    }
    id v16 = 0;
  }

  return v16;
}

- (id)_localizedStopByPerson:(void *)a3 detailTextForDirectlySharedResources:
{
  v151[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a1 || (uint64_t v8 = [v6 count]) == 0)
  {
    int v23 = 0;
    goto LABEL_42;
  }
  uint64_t v9 = v8;
  uint64_t v10 = -[DSSourceDescriptor sharedResourcesByResourceType:](a1, v7);
  uint64_t v11 = [v10 allKeys];
  id v12 = -[DSSourceDescriptor orderedResourceTypes:]((id)a1, (uint64_t)v11);

  int v13 = [v5 shareDirectionForSourceName:*(void *)(a1 + 8)];
  v130 = v12;
  if ((~v13 & 3) == 0)
  {
    uint64_t v14 = NSString;
    if (v9 != 1)
    {
      id v24 = [v12 componentsJoinedByString:@"_"];
      long long v25 = [v14 stringWithFormat:@"STOP_BY_PERSON_BOTH_MULTIPLE_%@", v24];

      id v26 = *(id *)(a1 + 16);
      long long v27 = -[DSSourceDescriptor localizableKey:]((void *)a1, (uint64_t)v25);
      uint64_t v28 = [v26 localizedAttributedStringForKey:v27 value:&stru_26E96B9B0 table:0];

      if ([v10 count] == 1)
      {
        id v124 = objc_alloc(MEMORY[0x263F086A0]);
        uint64_t v150 = *MEMORY[0x263F08150];
        id v29 = [v5 termsOfAddress];
        v149 = v29;
        long long v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v149 count:1];
        v151[0] = v30;
        [NSDictionary dictionaryWithObjects:v151 forKeys:&v150 count:1];
        long long v31 = v10;
        v33 = v32 = v25;
        uint64_t v34 = [v5 displayGivenName];
        v35 = objc_msgSend(v124, "initWithFormat:options:locale:context:", v28, 0, 0, v33, v34, v9);

        long long v25 = v32;
        uint64_t v10 = v31;

        int v23 = [v35 string];
      }
      else if ([v10 count] == 2)
      {
        id v115 = objc_alloc(MEMORY[0x263F086A0]);
        uint64_t v147 = *MEMORY[0x263F08150];
        v121 = [v5 termsOfAddress];
        v146 = v121;
        v118 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v146 count:1];
        v148 = v118;
        v110 = [NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
        v73 = [v5 displayGivenName];
        v112 = [v12 objectAtIndexedSubscript:0];
        [v10 objectForKeyedSubscript:v112];
        v74 = v126 = v25;
        uint64_t v75 = [v74 count];
        v76 = [v12 objectAtIndexedSubscript:1];
        long long v77 = [v10 objectForKeyedSubscript:v76];
        long long v78 = objc_msgSend(v115, "initWithFormat:options:locale:context:", v28, 0, 0, v110, v73, v75, objc_msgSend(v77, "count"));

        long long v25 = v126;
        int v23 = [v78 string];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT)) {
          -[DSSourceDescriptor localizedDetailTextByType:]();
        }
        int v23 = 0;
      }

      goto LABEL_41;
    }
    objc_super v15 = [v7 anyObject];
    id v16 = -[DSSourceDescriptor resourceTypeFromResource:](a1, v15);
    uint64_t v17 = [v14 stringWithFormat:@"STOP_BY_PERSON_BOTH_SINGLE_%@", v16];

    id v18 = *(id *)(a1 + 16);
    uint64_t v19 = -[DSSourceDescriptor localizableKey:]((void *)a1, (uint64_t)v17);
    long long v20 = [v18 localizedStringForKey:v19 value:&stru_26E96B9B0 table:0];

    uint64_t v21 = NSString;
    uint64_t v22 = [v5 displayGivenName];
    int v23 = objc_msgSend(v21, "stringWithFormat:", v20, v22);

    goto LABEL_14;
  }
  if (v13)
  {
    v36 = NSString;
    if (v9 == 1)
    {
      v37 = [v7 anyObject];
      v38 = -[DSSourceDescriptor resourceTypeFromResource:](a1, v37);
      uint64_t v17 = [v36 stringWithFormat:@"STOP_BY_PERSON_INCOMING_SINGLE_%@", v38];

      id v39 = *(id *)(a1 + 16);
      v40 = -[DSSourceDescriptor localizableKey:]((void *)a1, (uint64_t)v17);
      v41 = [v39 localizedAttributedStringForKey:v40 value:&stru_26E96B9B0 table:0];

      id v42 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v144 = *MEMORY[0x263F08150];
      v43 = [v5 termsOfAddress];
      v143 = v43;
      v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v143 count:1];
      v145 = v44;
      v45 = [NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
      v46 = [v5 displayGivenName];
      v47 = objc_msgSend(v42, "initWithFormat:options:locale:context:", v41, 0, 0, v45, v46);

      int v23 = [v47 string];

LABEL_14:
      goto LABEL_41;
    }
    long long v79 = [v12 componentsJoinedByString:@"_"];
    long long v80 = [v36 stringWithFormat:@"STOP_BY_PERSON_INCOMING_MULTIPLE_%@", v79];

    id v81 = *(id *)(a1 + 16);
    v82 = -[DSSourceDescriptor localizableKey:]((void *)a1, (uint64_t)v80);
    v83 = [v81 localizedStringForKey:v82 value:&stru_26E96B9B0 table:0];

    if ([v10 count] == 1)
    {
      v84 = NSString;
      uint64_t v85 = [v5 displayGivenName];
      int v23 = objc_msgSend(v84, "localizedStringWithFormat:", v83, v9, v85);

LABEL_40:
      goto LABEL_41;
    }
    if ([v10 count] == 2)
    {
      v122 = NSString;
      v128 = [v12 objectAtIndexedSubscript:0];
      v95 = [v10 objectForKeyedSubscript:v128];
      v96 = v12;
      uint64_t v97 = [v95 count];
      v98 = [v5 displayGivenName];
      v99 = [v96 objectAtIndexedSubscript:1];
      v100 = [v10 objectForKeyedSubscript:v99];
      int v23 = objc_msgSend(v122, "localizedStringWithFormat:", v83, v97, v98, objc_msgSend(v100, "count"));

      goto LABEL_40;
    }
    if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT)) {
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  if ((v13 & 2) != 0)
  {
    uint64_t v48 = NSString;
    if (v9 == 1)
    {
      v49 = [v7 anyObject];
      v50 = -[DSSourceDescriptor resourceTypeFromResource:](a1, v49);
      uint64_t v51 = [v48 stringWithFormat:@"STOP_BY_PERSON_OUTGOING_SINGLE_%@", v50];

      id v52 = *(id *)(a1 + 16);
      v120 = (void *)v51;
      long long v53 = -[DSSourceDescriptor localizableKey:]((void *)a1, v51);
      uint64_t v114 = [v52 localizedAttributedStringForKey:v53 value:&stru_26E96B9B0 table:0];

      long long v54 = NSString;
      uint64_t v55 = [v7 anyObject];
      uint64_t v56 = -[DSSourceDescriptor resourceTypeFromResource:](a1, v55);
      uint64_t v57 = [v54 stringWithFormat:@"STOP_BY_PERSON_OUTGOING_SINGLE_%@_WITH_NAME", v56];

      id v58 = *(id *)(a1 + 16);
      uint64_t v59 = -[DSSourceDescriptor localizableKey:]((void *)a1, v57);
      uint64_t v60 = [v58 localizedAttributedStringForKey:v59 value:&stru_26E96B9B0 table:0];

      v125 = (void *)v60;
      v61 = [(id)v60 string];
      v117 = (void *)v57;
      v62 = -[DSSourceDescriptor localizableKey:]((void *)a1, v57);
      LOBYTE(v60) = [v61 isEqualToString:v62];

      v63 = [v7 anyObject];
      v64 = [v63 displayName];

      if ((v60 & 1) != 0 || ![v64 length])
      {
        v70 = v64;
        id v101 = objc_alloc(MEMORY[0x263F086A0]);
        uint64_t v138 = *MEMORY[0x263F08150];
        v66 = [v5 termsOfAddress];
        v137 = v66;
        v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v137 count:1];
        v139 = v67;
        v68 = [NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
        v69 = [v5 displayGivenName];
        v102 = v101;
        v72 = (void *)v114;
        v71 = objc_msgSend(v102, "initWithFormat:options:locale:context:", v114, 0, 0, v68, v69);
      }
      else
      {
        id v65 = objc_alloc(MEMORY[0x263F086A0]);
        uint64_t v141 = *MEMORY[0x263F08150];
        v66 = [v5 termsOfAddress];
        v140 = v66;
        v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v140 count:1];
        v142 = v67;
        v68 = [NSDictionary dictionaryWithObjects:&v142 forKeys:&v141 count:1];
        v69 = [v5 displayGivenName];
        v70 = v64;
        v71 = objc_msgSend(v65, "initWithFormat:options:locale:context:", v125, 0, 0, v68, v69, v64);
        v72 = (void *)v114;
      }

      int v23 = [v71 string];

      goto LABEL_41;
    }
    v86 = [v12 componentsJoinedByString:@"_"];
    long long v80 = [v48 stringWithFormat:@"STOP_BY_PERSON_OUTGOING_MULTIPLE_%@", v86];

    id v87 = *(id *)(a1 + 16);
    v88 = -[DSSourceDescriptor localizableKey:]((void *)a1, (uint64_t)v80);
    v83 = [v87 localizedAttributedStringForKey:v88 value:&stru_26E96B9B0 table:0];

    if ([v10 count] == 1)
    {
      id v89 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v135 = *MEMORY[0x263F08150];
      v127 = [v5 termsOfAddress];
      v134 = v127;
      v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v134 count:1];
      v136 = v90;
      v91 = [NSDictionary dictionaryWithObjects:&v136 forKeys:&v135 count:1];
      [v5 displayGivenName];
      v93 = v92 = v80;
      v94 = objc_msgSend(v89, "initWithFormat:options:locale:context:", v83, 0, 0, v91, v93, v9);

      long long v80 = v92;
      int v23 = [v94 string];

      goto LABEL_40;
    }
    if ([v10 count] == 2)
    {
      id v116 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v132 = *MEMORY[0x263F08150];
      v123 = [v5 termsOfAddress];
      v131 = v123;
      v119 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v131 count:1];
      v133 = v119;
      v111 = [NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
      v103 = [v5 displayGivenName];
      v113 = [v12 objectAtIndexedSubscript:0];
      v104 = [v10 objectForKeyedSubscript:v113];
      v129 = v80;
      uint64_t v105 = [v104 count];
      v106 = [v12 objectAtIndexedSubscript:1];
      v107 = [v10 objectForKeyedSubscript:v106];
      v108 = objc_msgSend(v116, "initWithFormat:options:locale:context:", v83, 0, 0, v111, v103, v105, objc_msgSend(v107, "count"));

      int v23 = [v108 string];

      long long v80 = v129;
      goto LABEL_40;
    }
    if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT)) {
LABEL_38:
    }
      -[DSSourceDescriptor localizedDetailTextByType:]();
LABEL_39:
    int v23 = 0;
    goto LABEL_40;
  }
  int v23 = 0;
LABEL_41:

LABEL_42:
  return v23;
}

- (id)_localizedStopByPerson:(void *)a3 detailTextForIndirectlySharedResources:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    uint64_t v8 = (void *)[v6 count];
    if (v8)
    {
      uint64_t v9 = -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)a1, v7);
      uint64_t v10 = [v9 allKeys];
      uint64_t v11 = -[DSSourceDescriptor orderedResourceTypes:](a1, (uint64_t)v10);

      id v12 = NSString;
      int v13 = [v11 componentsJoinedByString:@"_"];
      uint64_t v14 = [v12 stringWithFormat:@"STOP_BY_PERSON_INDIRECT_%@", v13];

      id v15 = a1[2];
      id v16 = -[DSSourceDescriptor localizableKey:](a1, (uint64_t)v14);
      uint64_t v17 = [v15 localizedStringForKey:v16 value:&stru_26E96B9B0 table:0];

      if ([v9 count] == 1)
      {
        id v18 = NSString;
        uint64_t v19 = [v5 displayGivenName];
        uint64_t v8 = objc_msgSend(v18, "localizedStringWithFormat:", v17, v19, v8);
      }
      else if ([v9 count] == 2)
      {
        id v26 = NSString;
        long long v20 = [v5 displayGivenName];
        long long v27 = [v11 objectAtIndexedSubscript:0];
        long long v25 = [v9 objectForKeyedSubscript:v27];
        uint64_t v21 = [v25 count];
        uint64_t v22 = [v11 objectAtIndexedSubscript:1];
        int v23 = [v9 objectForKeyedSubscript:v22];
        uint64_t v8 = objc_msgSend(v26, "localizedStringWithFormat:", v17, v20, v21, objc_msgSend(v23, "count"));
      }
      else
      {
        if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT)) {
          -[DSSourceDescriptor localizedDetailTextByType:]();
        }
        uint64_t v8 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)localizedStopByPerson:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (self) {
    sourceName = self->_sourceName;
  }
  else {
    sourceName = 0;
  }
  uint64_t v7 = [v4 sharedResourcesForSourceName:sourceName];
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v5, "shareDirectionForSharedResource:", v15, (void)v23) & 4) != 0) {
          id v16 = v9;
        }
        else {
          id v16 = v8;
        }
        [v16 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  uint64_t v17 = -[DSSourceDescriptor _localizedStopByPerson:detailTextForDirectlySharedResources:]((uint64_t)self, v5, v8);
  id v18 = -[DSSourceDescriptor _localizedStopByPerson:detailTextForIndirectlySharedResources:]((id *)&self->super.isa, v5, v9);
  uint64_t v19 = [MEMORY[0x263EFF980] array];
  long long v20 = v19;
  if (v17) {
    [v19 addObject:v17];
  }
  if (v18) {
    [v20 addObject:v18];
  }
  uint64_t v21 = objc_msgSend(v20, "componentsJoinedByString:", @" ", (void)v23);

  return v21;
}

- (id)localizedAlertTextForPerson:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  if (self) {
    localizationBundle = self->_localizationBundle;
  }
  else {
    localizationBundle = 0;
  }
  id v6 = localizationBundle;
  id v7 = a3;
  uint64_t v8 = -[DSSourceDescriptor localizableKey:](self, @"STOP_BY_PERSON_ALERT");
  uint64_t v9 = [(NSBundle *)v6 localizedAttributedStringForKey:v8 value:&stru_26E96B9B0 table:0];

  id v10 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v20 = *MEMORY[0x263F08150];
  uint64_t v11 = [v7 termsOfAddress];
  uint64_t v19 = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  v21[0] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v14 = [v7 displayName];
  uint64_t v15 = [v7 displayName];

  id v16 = objc_msgSend(v10, "initWithFormat:options:locale:context:", v9, 0, 0, v13, v14, v15);
  uint64_t v17 = [v16 string];

  return v17;
}

- (BOOL)supportsResourceTypes
{
  if (self) {
    sourceName = (__CFString *)self->_sourceName;
  }
  else {
    sourceName = 0;
  }
  return sourceName == @"com.apple.DigitalSeparation.Photos";
}

- (id)localizedStopAllAlertDetailForPeople:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = -[DSSourceDescriptor _sharedResourcesForPeople:isOwnedByUser:](self, v4, 1);
  if ([v6 count])
  {
    [v5 addObject:@"OUTGOING"];
    id v7 = -[DSSourceDescriptor _locKeyForResources:withDescriptorKey:](self, v6, @"STOP_ALL_SHARING_ALERT_DETAIL_TEXT_OUTGOING_%@");
    if (self) {
      localizationBundle = self->_localizationBundle;
    }
    else {
      localizationBundle = 0;
    }
    uint64_t v9 = localizationBundle;
    id v10 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v7);
    uint64_t v11 = [(NSBundle *)v9 localizedStringForKey:v10 value:&stru_26E96B9B0 table:0];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v33 = (void *)v11;
  uint64_t v12 = -[DSSourceDescriptor _sharedResourcesForPeople:isOwnedByUser:](self, v4, 0);
  if ([v12 count])
  {
    [v5 addObject:@"INCOMING"];
    uint64_t v13 = -[DSSourceDescriptor _locKeyForResources:withDescriptorKey:](self, v12, @"STOP_ALL_SHARING_ALERT_DETAIL_TEXT_INCOMING_%@");
    if (self) {
      uint64_t v14 = self->_localizationBundle;
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = v14;
    id v16 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v13);
    uint64_t v17 = [(NSBundle *)v15 localizedStringForKey:v16 value:&stru_26E96B9B0 table:0];
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = NSString;
  uint64_t v19 = v5;
  uint64_t v20 = [v5 componentsJoinedByString:@"_"];
  uint64_t v21 = [v18 stringWithFormat:@"STOP_ALL_SHARING_ALERT_DETAIL_%@", v20];

  uint64_t v22 = v6;
  if (self) {
    long long v23 = self->_localizationBundle;
  }
  else {
    long long v23 = 0;
  }
  long long v24 = v23;
  long long v25 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v21);
  long long v26 = [(NSBundle *)v24 localizedStringForKey:v25 value:&stru_26E96B9B0 table:0];

  long long v27 = v33;
  if (v33 && v17)
  {
    uint64_t v28 = NSString;
    v32 = v17;
LABEL_16:
    objc_msgSend(v28, "stringWithFormat:", v26, v33, v32);
    id v29 = LABEL_19:;
    goto LABEL_20;
  }
  if (v17)
  {
    objc_msgSend(NSString, "stringWithFormat:", v26, v17, v32);
    goto LABEL_19;
  }
  if (v33)
  {
    uint64_t v28 = NSString;
    goto LABEL_16;
  }
  long long v31 = (void *)DSLogSourceDescriptor;
  if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT)) {
    [(DSSourceDescriptor *)self == 0 localizedStopAllAlertDetailForPeople:v31];
  }
  id v29 = 0;
  long long v27 = 0;
LABEL_20:

  return v29;
}

- (void)_sharedResourcesForPeople:(int)a3 isOwnedByUser:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v23 = a1;
  uint64_t v20 = v5;
  if (a1)
  {
    id v6 = v5;
    a1 = objc_msgSend(MEMORY[0x263EFF9C0], "set", v5);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v11 = [v10 sharedResourcesForSourceName:v23[1]];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                uint64_t v17 = [v10 shareDirectionForSharedResource:v16];
                BOOL v18 = (v17 & 0xFFFFFFFFFFFFFFFELL) == 2;
                if (!a3) {
                  BOOL v18 = v17 != 2;
                }
                if (v18) {
                  [a1 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v13);
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v8);
    }
  }
  return a1;
}

- (id)_locKeyForResources:(void *)a3 withDescriptorKey:
{
  v35[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a1)
  {
    id v6 = -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)a1, a2);
    uint64_t v7 = [v6 allKeys];
    uint64_t v8 = -[DSSourceDescriptor orderedResourceTypes:](a1, (uint64_t)v7);

    if ([v6 count] == 1)
    {
      uint64_t v9 = [v8 objectAtIndexedSubscript:0];
      id v10 = [v6 objectForKeyedSubscript:v9];
      uint64_t v11 = [v10 count];
      uint64_t v12 = @"MULTIPLE";
      if (v11 == 1) {
        uint64_t v12 = @"SINGLE";
      }
      uint64_t v13 = v12;

      uint64_t v14 = NSString;
      v35[0] = v13;
      v35[1] = v9;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
      uint64_t v16 = [v15 componentsJoinedByString:@"_"];
      uint64_t v17 = objc_msgSend(v14, "stringWithFormat:", v5, v16);
    }
    else
    {
      if ([v6 count] != 2)
      {
        if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT)) {
          -[DSSourceDescriptor localizedDetailTextByType:]();
        }
        uint64_t v17 = 0;
        goto LABEL_18;
      }
      BOOL v18 = [v8 objectAtIndexedSubscript:0];
      uint64_t v19 = [v6 objectForKeyedSubscript:v18];
      id v32 = v5;
      if ([v19 count] == 1) {
        uint64_t v20 = @"SINGLE";
      }
      else {
        uint64_t v20 = @"MULTIPLE";
      }
      v34[0] = v20;
      uint64_t v21 = [v8 objectAtIndexedSubscript:1];
      uint64_t v22 = [v6 objectForKeyedSubscript:v21];
      if ([v22 count] == 1) {
        long long v23 = @"SINGLE";
      }
      else {
        long long v23 = @"MULTIPLE";
      }
      v34[1] = v23;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];

      long long v24 = NSString;
      long long v25 = [v9 objectAtIndexedSubscript:0];
      v33[0] = v25;
      long long v26 = [v8 objectAtIndexedSubscript:0];
      v33[1] = v26;
      long long v27 = [v9 objectAtIndexedSubscript:1];
      v33[2] = v27;
      long long v28 = [v8 objectAtIndexedSubscript:1];
      v33[3] = v28;
      long long v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
      long long v30 = [v29 componentsJoinedByString:@"_"];
      uint64_t v17 = objc_msgSend(v24, "stringWithFormat:", v32, v30);

      id v5 = v32;
    }

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v17 = 0;
LABEL_19:

  return v17;
}

- (id)localizedStopByTypeSubtitleForSharingType:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = objc_msgSend(v4, "allPeople", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        if (self) {
          sourceName = self->_sourceName;
        }
        else {
          sourceName = 0;
        }
        uint64_t v12 = [*(id *)(*((void *)&v20 + 1) + 8 * v10) sharedResourcesForSourceName:sourceName];
        [v5 unionSet:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v13 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v8 = v13;
    }
    while (v13);
  }

  uint64_t v14 = -[DSSourceDescriptor _locKeyForResources:withDescriptorKey:](self, v5, @"STOP_BY_TYPE_SUBTITLE_%@");
  if (v14)
  {
    if (self) {
      localizationBundle = self->_localizationBundle;
    }
    else {
      localizationBundle = 0;
    }
    uint64_t v16 = localizationBundle;
    uint64_t v17 = -[DSSourceDescriptor localizableKey:](self, (uint64_t)v14);
    BOOL v18 = [(NSBundle *)v16 localizedStringForKey:v17 value:&stru_26E96B9B0 table:0];
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (int64_t)priority
{
  if (self)
  {
    id v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    id v3 = 0;
    sourceName = 0;
  }
  id v5 = [(NSDictionary *)v3 objectForKeyedSubscript:sourceName];
  id v6 = [v5 objectForKeyedSubscript:@"PRIORITY"];
  unint64_t v7 = [v6 integerValue];

  if (v7 <= 1) {
    return 1;
  }
  else {
    return v7;
  }
}

- (NSArray)darwinNotifications
{
  if (self)
  {
    id v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    id v3 = 0;
    sourceName = 0;
  }
  id v5 = [(NSDictionary *)v3 objectForKeyedSubscript:sourceName];
  id v6 = [v5 objectForKeyedSubscript:@"DARWIN_NOTIFICATIONS"];

  if (v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = self;
  if (self)
  {
    id v5 = self->_sourceProperties;
    id v4 = (DSSourceDescriptor *)v4->_sourceName;
  }
  else
  {
    id v5 = 0;
  }
  id v6 = a3;
  unint64_t v7 = [(NSDictionary *)v5 objectForKeyedSubscript:v4];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (NSDictionary)ignoreErrors
{
  if (self)
  {
    id v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    id v3 = 0;
    sourceName = 0;
  }
  id v5 = [(NSDictionary *)v3 objectForKeyedSubscript:sourceName];
  id v6 = [v5 objectForKeyedSubscript:@"IGNORE_ERRORS"];

  if (v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = (void *)MEMORY[0x263EFFA78];
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)shouldIgnoreError:(id)a3
{
  id v4 = a3;
  id v5 = [(DSSourceDescriptor *)self ignoreErrors];
  id v6 = [v4 domain];
  unint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v4 code];

  uint64_t v10 = [v8 numberWithInteger:v9];
  LOBYTE(v8) = [v7 containsObject:v10];

  return (char)v8;
}

- (NSString)dataUsageBundleIdentifier
{
  if (self)
  {
    id v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    id v3 = 0;
    sourceName = 0;
  }
  id v5 = [(NSDictionary *)v3 objectForKeyedSubscript:sourceName];
  id v6 = [v5 objectForKeyedSubscript:@"REQUIRED_DATA_USAGE_POLICY"];
  unint64_t v7 = [v6 objectForKeyedSubscript:@"bundle-identifier"];

  return (NSString *)v7;
}

- (BOOL)requiresWifi
{
  if (self)
  {
    id v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    id v3 = 0;
    sourceName = 0;
  }
  id v5 = [(NSDictionary *)v3 objectForKeyedSubscript:sourceName];
  id v6 = [v5 objectForKeyedSubscript:@"REQUIRED_DATA_USAGE_POLICY"];
  unint64_t v7 = [v6 objectForKeyedSubscript:@"wifi"];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)requiresCellular
{
  if (self)
  {
    id v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    id v3 = 0;
    sourceName = 0;
  }
  id v5 = [(NSDictionary *)v3 objectForKeyedSubscript:sourceName];
  id v6 = [v5 objectForKeyedSubscript:@"REQUIRED_DATA_USAGE_POLICY"];
  unint64_t v7 = [v6 objectForKeyedSubscript:@"cell"];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (NSString)correspondingApplicationIdentifier
{
  if (self)
  {
    id v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    id v3 = 0;
    sourceName = 0;
  }
  id v5 = [(NSDictionary *)v3 objectForKeyedSubscript:sourceName];
  id v6 = [v5 objectForKeyedSubscript:@"APPLICATION_IDENTIFIER"];

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceProperties, 0);
  objc_storeStrong((id *)&self->_localizationBundle, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
}

- (void)localizedDetailTextByType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_236090000, v0, v1, "More than 2 resource types are not supported: %{public}@", v2, v3, v4, v5, v6);
}

- (void)localizedStopAllAlertDetailForPeople:(void *)a3 .cold.1(char a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a2 + 8);
  }
  int v5 = 138543362;
  uint64_t v6 = v3;
  uint64_t v4 = a3;
  _os_log_fault_impl(&dword_236090000, v4, OS_LOG_TYPE_FAULT, "Could not support resource specific alert detail for source: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end