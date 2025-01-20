@interface _LSStringLocalizer
+ (BOOL)useLegacyLocalizationListForPlatform:(unsigned int)a3 sdkVersion:(unsigned int)a4;
+ (NSArray)preferredLocalizationsForXCTests;
+ (NSString)missingLocalizationPlaceholder;
+ (_LSStringLocalizer)coreTypesLocalizer;
+ (id)localizedStringForCanonicalString:(id)a3 preferredLocalizations:(id)a4 context:(LSContext *)a5;
+ (id)localizedStringsForCanonicalString:(id)a3 context:(LSContext *)a4;
+ (id)newFrameworkBundleLocalizer;
+ (void)findKeysToLocalizeInInfoDictionary:(id)a3 forArrayKey:(__CFString *)a4 stringKey:(__CFString *)a5 localizedKeys:(id)a6;
+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7;
+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 legacyLocalizationList:(BOOL)a6;
+ (void)gatherLocalizedStringsForLSBundleProvider:(id)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7;
+ (void)newFrameworkBundleLocalizer;
+ (void)setPreferredLocalizationsForXCTests:(id)a3;
- (_LSBundleProvider)bundleProvider;
- (_LSStringLocalizer)init;
- (_LSStringLocalizer)initWithBundleProvider:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5;
- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4;
- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 checkMainBundle:(BOOL)a5 legacyLocalizationList:(BOOL)a6;
- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5;
- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4;
- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5;
- (_LSStringLocalizer)initWithDatabase:(id)a3 bundleUnit:(unsigned int)a4 delegate:(unsigned int)a5;
- (_LSStringLocalizer)initWithDatabase:(id)a3 pluginUnit:(unsigned int)a4;
- (id)debugDescription;
- (id)localizedStringDictionaryWithString:(id)a3 defaultValue:(id)a4;
- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 localeCode:(id)a5;
- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 preferredLocalizations:(id)a5;
- (id)localizedStringWithString:(id)a3 preferredLocalizations:(id)a4;
- (id)localizedStringsWithStrings:(id)a3 preferredLocalizations:(id)a4;
- (void)dealloc;
- (void)enumerateLocalizedStringsForKeys:(id)a3 usingBlock:(id)a4;
- (void)enumerateLocalizedStringsUsingBlock:(id)a3;
@end

@implementation _LSStringLocalizer

- (_LSBundleProvider)bundleProvider
{
  return self->_bundleProvider;
}

+ (id)newFrameworkBundleLocalizer
{
  uint64_t v2 = _LSGetBundle();
  if (!v2
    || (v3 = [[_LSStringLocalizer alloc] initWithCFBundle:v2 stringsFile:@"Localized"]) == 0)
  {
    v3 = objc_alloc_init(_LSStringLocalizer);
    v4 = _LSDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[_LSStringLocalizer newFrameworkBundleLocalizer];
    }
  }
  return v3;
}

+ (_LSStringLocalizer)coreTypesLocalizer
{
  if (+[_LSStringLocalizer coreTypesLocalizer]::once != -1) {
    dispatch_once(&+[_LSStringLocalizer coreTypesLocalizer]::once, &__block_literal_global_75);
  }
  uint64_t v2 = (void *)+[_LSStringLocalizer coreTypesLocalizer]::result;

  return (_LSStringLocalizer *)v2;
}

- (_LSStringLocalizer)init
{
  return [(_LSStringLocalizer *)self initWithBundleURL:0 stringsFile:0];
}

- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5
{
  return [(_LSStringLocalizer *)self initWithBundleURL:a3 stringsFile:a4 checkMainBundle:1 legacyLocalizationList:a5];
}

- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 checkMainBundle:(BOOL)a5 legacyLocalizationList:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)MEMORY[0x18530F680]();
  if (!v10 || !v7)
  {
    if (!v10)
    {
      v18 = 0;
      goto LABEL_9;
    }
LABEL_7:
    v17 = [[_LSBundleProvider alloc] initWithURL:v10 useCacheIfPossible:1];
    v18 = [(_LSStringLocalizer *)self initWithBundleProvider:v17 stringsFile:v11 legacyLocalizationList:v6];
    self = (_LSStringLocalizer *)v17;
LABEL_9:

    v16 = v18;
    goto LABEL_10;
  }
  v13 = _LSGetMainBundleURL();
  v14 = v13;
  if (!v13) {
    goto LABEL_7;
  }
  int v15 = [v13 isEqual:v10];

  if (!v15) {
    goto LABEL_7;
  }
  v16 = [(_LSStringLocalizer *)self initWithCFBundle:CFBundleGetMainBundle() stringsFile:v11 legacyLocalizationList:v6];
LABEL_10:

  return v16;
}

- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4
{
  return [(_LSStringLocalizer *)self initWithBundleURL:a3 stringsFile:a4 checkMainBundle:1 legacyLocalizationList:0];
}

- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4
{
  return [(_LSStringLocalizer *)self initWithCFBundle:a3 stringsFile:a4 legacyLocalizationList:0];
}

- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = [[_LSBundleProvider alloc] initWithCFBundle:a3];
  id v10 = [(_LSStringLocalizer *)self initWithBundleProvider:v9 stringsFile:v8 legacyLocalizationList:v5];

  return v10;
}

- (_LSStringLocalizer)initWithBundleProvider:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v9 = (__CFString *)a3;
  id v10 = a4;
  v55.receiver = self;
  v55.super_class = (Class)_LSStringLocalizer;
  id v11 = [(_LSStringLocalizer *)&v55 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_38;
  }
  objc_storeStrong((id *)&v11->_bundleProvider, a3);
  v13 = (_LSStringsFileContent *)-[_LSStringsFileContent initWithStringsFile:]([_LSStringsFileContent alloc], v10);
  stringsContent = v12->_stringsContent;
  v12->_stringsContent = v13;

  int v15 = (void *)MEMORY[0x18530F680]();
  v16 = [(_LSStringLocalizer *)v12 bundleProvider];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    p_bundleLocalizations = (id *)&v12->_bundleLocalizations;
    if (!v12->_bundleLocalizations)
    {
      v19 = 0;
      goto LABEL_33;
    }
LABEL_25:
    id v40 = *p_bundleLocalizations;
    v19 = @"en";
    goto LABEL_26;
  }
  v18 = [(_LSStringLocalizer *)v12 bundleProvider];
  v19 = (__CFString *)LSBundleProvider::CFBundleCopyDevelopmentRegion((LSBundleProvider *)[v18 provider]);

  if ([v10 isEqual:@"InfoPlist"])
  {
    v20 = [(_LSStringLocalizer *)v12 bundleProvider];
    v21 = [v20 infoDictionary];
    BOOL v22 = v21 == 0;

    if (v22)
    {
      if (![(__CFString *)v9 cfBundleRef:1 reason:@"Need to load non-Info.Plist file"]) {
        goto LABEL_8;
      }
      v23 = (void *)_CFBundleCopyInfoPlistURL();
      if (!v23) {
        goto LABEL_7;
      }
      uint64_t v38 = +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:]((uint64_t)_LSLazyPropertyList, v23);
      unlocalizedInfoPlistStrings = v12->_unlocalizedInfoPlistStrings;
      v12->_unlocalizedInfoPlistStrings = (_LSLazyPropertyList *)v38;
    }
    else
    {
      v23 = [(_LSStringLocalizer *)v12 bundleProvider];
      unlocalizedInfoPlistStrings = [v23 infoDictionary];
      uint64_t v25 = +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, unlocalizedInfoPlistStrings);
      v26 = v12->_unlocalizedInfoPlistStrings;
      v12->_unlocalizedInfoPlistStrings = (_LSLazyPropertyList *)v25;
    }
LABEL_7:
  }
LABEL_8:
  v27 = [(_LSStringLocalizer *)v12 bundleProvider];
  v28 = LSBundleProvider::CFBundleCopyBundleLocalizations((LSBundleProvider *)[v27 provider]);
  p_bundleLocalizations = (id *)&v12->_bundleLocalizations;
  bundleLocalizations = v12->_bundleLocalizations;
  v12->_bundleLocalizations = (NSArray *)v28;

  if (v5 && v19 && [*p_bundleLocalizations containsObject:v19])
  {
    v31 = _LSDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v9;
      _os_log_impl(&dword_182959000, v31, OS_LOG_TYPE_DEFAULT, "Applying legacy localization list behavior to bundle %@", buf, 0xCu);
    }

    v32 = [(_LSStringLocalizer *)v12 bundleProvider];
    v33 = [v32 bundleURL];
    Unique = (const void *)_CFBundleCreateUnique();

    if (Unique)
    {
      v35 = (void *)MEMORY[0x18530E180](Unique, 1);
      uint64_t v36 = [v35 copy];
      id v37 = *p_bundleLocalizations;
      id *p_bundleLocalizations = (id)v36;

      CFRelease(Unique);
    }
    else
    {
      v39 = _LSDefaultLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[_LSStringLocalizer initWithBundleProvider:stringsFile:legacyLocalizationList:](v39);
      }
    }
  }
  id v40 = *p_bundleLocalizations;
  if (!*p_bundleLocalizations) {
    goto LABEL_33;
  }
  if (!v19) {
    goto LABEL_25;
  }
LABEL_26:
  uint64_t v41 = [v40 indexOfObject:v19];
  uint64_t v42 = v41;
  if (v41)
  {
    if (v41 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v43 = _LSDefaultLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = [(_LSStringLocalizer *)v12 bundleProvider];
        v45 = [v44 bundleURL];
        *(_DWORD *)buf = 138543619;
        v57 = v19;
        __int16 v58 = 2113;
        v59 = v45;
        _os_log_error_impl(&dword_182959000, v43, OS_LOG_TYPE_ERROR, "LSStringLocalizer development region %{public}@ not found in localizations available for bundle %{private}@", buf, 0x16u);
      }
    }
    else
    {
      v43 = [*p_bundleLocalizations mutableCopy];
      [v43 removeObjectAtIndex:v42];
      [v43 insertObject:v19 atIndex:0];
      uint64_t v46 = [v43 copy];
      id v47 = *p_bundleLocalizations;
      id *p_bundleLocalizations = (id)v46;
    }
  }
  CFArrayRef v48 = (const __CFArray *)*p_bundleLocalizations;
  if (*p_bundleLocalizations) {
    goto LABEL_34;
  }
LABEL_33:
  id v49 = *p_bundleLocalizations;
  id *p_bundleLocalizations = (id)MEMORY[0x1E4F1CBF0];

  CFArrayRef v48 = (const __CFArray *)*p_bundleLocalizations;
  if (*p_bundleLocalizations)
  {
LABEL_34:
    CFArrayRef v50 = [(id)__LSDefaultsGetSharedInstance() preferredLocalizations];
    CFArrayRef v51 = CFBundleCopyLocalizationsForPreferences(v48, v50);
    uint64_t v52 = [(__CFArray *)v51 copy];
    bundleLocalizationsWithDefaultPrefLocs = v12->_bundleLocalizationsWithDefaultPrefLocs;
    v12->_bundleLocalizationsWithDefaultPrefLocs = (NSArray *)v52;
  }
  if (!v12->_bundleLocalizationsWithDefaultPrefLocs)
  {
    v12->_bundleLocalizationsWithDefaultPrefLocs = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
LABEL_38:

  return v12;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_LSStringLocalizer;
  [(_LSStringLocalizer *)&v2 dealloc];
}

- (id)localizedStringWithString:(id)a3 preferredLocalizations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 291, @"Invalid parameter not satisfying: %@", @"string != nil" object file lineNumber description];
  }
  v9 = [(_LSStringLocalizer *)self bundleProvider];
  uint64_t v10 = [v9 cfBundleRef];

  if (v10)
  {
    id v11 = [(_LSStringLocalizer *)self bundleProvider];
    v12 = -[_LSStringLocalizer localizedStringWithString:inBundle:preferredLocalizations:](self, "localizedStringWithString:inBundle:preferredLocalizations:", v7, [v11 cfBundleRef], v8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)localizedStringsWithStrings:(id)a3 preferredLocalizations:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21 = v7;
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 304, @"Invalid parameter not satisfying: %@", @"strings != nil" object file lineNumber description];
  }
  context = (void *)MEMORY[0x18530F680]();
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v10 = [(_LSBundleProvider *)self->_bundleProvider cfBundleRef];
  if (v10)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v16 = [(_LSStringLocalizer *)self localizedStringWithString:v15 inBundle:v10 preferredLocalizations:v8];
          if (v16) {
            [v9 setObject:v16 forKeyedSubscript:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
  }
  BOOL v17 = (void *)[v9 copy];

  return v17;
}

- (id)localizedStringDictionaryWithString:(id)a3 defaultValue:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v23 = a4;
  long long v25 = v7;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 328, @"Invalid parameter not satisfying: %@", @"string != nil" object file lineNumber description];
  }
  context = (void *)MEMORY[0x18530F680]();
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = [(_LSStringLocalizer *)self bundleProvider];
  uint64_t v9 = [v8 cfBundleRef];

  if (v9)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v10 = self->_bundleLocalizations;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v10);
          }
          CFStringRef v15 = *(const __CFString **)(*((void *)&v26 + 1) + 8 * i);
          v16 = [(_LSStringLocalizer *)self localizedStringWithString:v25 inBundle:v9 localeCode:v15];
          if (v16)
          {
            CFLocaleIdentifier CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(v13, v15);
            v18 = (__CFString *)CanonicalLanguageIdentifierFromString;
            if (CanonicalLanguageIdentifierFromString) {
              CFLocaleIdentifier v19 = CanonicalLanguageIdentifierFromString;
            }
            else {
              CFLocaleIdentifier v19 = v15;
            }
            [v24 setObject:v16 forKeyedSubscript:v19];
          }
        }
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }
  }
  if (v23) {
    [v24 setObject:v23 forKeyedSubscript:@"LSDefaultLocalizedValue"];
  }

  return v24;
}

- (void)enumerateLocalizedStringsUsingBlock:(id)a3
{
}

- (void)enumerateLocalizedStringsForKeys:(id)a3 usingBlock:(id)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v64 = (void (**)(id, uint64_t, id, id, void *))a4;
  v72 = v7;
  v67 = self;
  if (!v64)
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 358, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  context = (void *)MEMORY[0x18530F680]();
  if ([(NSArray *)self->_bundleLocalizations count])
  {
    int v8 = [(id)__LSDefaultsGetSharedInstance() isRegionChina];
    char v9 = v8 ^ 1;
    if (!v7) {
      char v9 = 1;
    }
    int v75 = v8;
    if (v9)
    {
      v71 = 0;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x18530F680]();
      uint64_t v11 = (void *)[v7 mutableCopy];
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v89 objects:v98 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v90 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = [*(id *)(*((void *)&v89 + 1) + 8 * i) stringByAppendingString:@"#CH"];
            [v11 addObject:v16];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v89 objects:v98 count:16];
        }
        while (v13);
      }

      v71 = (void *)[v11 copy];
    }
    BOOL v17 = (void *)MEMORY[0x18530F680]();
    id v18 = [NSString alloc];
    CFLocaleIdentifier v19 = [(_LSStringLocalizer *)v67 bundleProvider];
    v20 = [v19 bundleURL];
    v21 = [v20 path];
    id v22 = (id)[v18 initWithFormat:@"Reading localized string from %@", v21];
    if (_LSLoggingQueue(void)::onceToken != -1) {
      dispatch_once(&_LSLoggingQueue(void)::onceToken, &__block_literal_global_208);
    }
    id v23 = _LSLoggingQueue(void)::logQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZL18_LSSetCrashMessageP8NSString_block_invoke_1;
    block[3] = &unk_1E522D3E8;
    id v94 = v22;
    id v24 = v22;
    dispatch_sync(v23, block);

    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v73 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    obuint64_t j = v67->_bundleLocalizations;
    uint64_t v68 = [(NSArray *)obj countByEnumeratingWithState:&v85 objects:v97 count:16];
    if (v68)
    {
      uint64_t v66 = *(void *)v86;
      do
      {
        long long v25 = 0;
        do
        {
          if (*(void *)v86 != v66) {
            objc_enumerationMutation(obj);
          }
          v69 = v25;
          long long v26 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v25);
          long long v27 = (void *)MEMORY[0x18530F680]();
          long long v28 = v71;
          if (!v71) {
            long long v28 = v72;
          }
          if (!v72) {
            long long v28 = 0;
          }
          id v29 = v28;
          stringsContent = v67->_stringsContent;
          uint64_t v31 = [(_LSStringLocalizer *)v67 bundleProvider];
          v32 = -[_LSStringsFileContent uncheckedObjectsForKeys:forLocaleCode:fromBundle:cacheLocalizations:](stringsContent, v29, v26, [v31 cfBundleRef], v67->_bundleLocalizationsWithDefaultPrefLocs);

          if (v32) {
            BOOL v33 = v72 != 0;
          }
          else {
            BOOL v33 = 1;
          }
          if (!v33)
          {
            v34 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v35 = [v32 allKeys];
            uint64_t v36 = (void *)v35;
            if (v35) {
              uint64_t v37 = v35;
            }
            else {
              uint64_t v37 = MEMORY[0x1E4F1CBF0];
            }
            v72 = [v34 setWithArray:v37];
          }
          if (v32)
          {
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v38 = v72;
            uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:v96 count:16];
            if (!v39) {
              goto LABEL_54;
            }
            uint64_t v40 = *(void *)v82;
            while (1)
            {
              for (uint64_t j = 0; j != v39; ++j)
              {
                if (*(void *)v82 != v40) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v42 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                v43 = (void *)MEMORY[0x18530F680]();
                if (v75
                  && ([v42 stringByAppendingString:@"#CH"],
                      v44 = objc_claimAutoreleasedReturnValue(),
                      [v32 objectForKeyedSubscript:v44],
                      v45 = objc_claimAutoreleasedReturnValue(),
                      v44,
                      v45)
                  || ([v32 objectForKeyedSubscript:v42],
                      (v45 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  if (!_NSIsNSString()) {
                    goto LABEL_52;
                  }
                  id v46 = [v74 objectForKeyedSubscript:v42];
                  if (!v46)
                  {
                    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                    [v74 setObject:v46 forKeyedSubscript:v42];
                  }
                  [v46 setObject:v45 forKeyedSubscript:v26];
                }
                else
                {
                  id v46 = [v73 objectForKeyedSubscript:v42];
                  if (!v46)
                  {
                    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                    [v73 setObject:v46 forKeyedSubscript:v42];
                  }
                  [v46 addObject:v26];
                  v45 = 0;
                }

LABEL_52:
              }
              uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:v96 count:16];
              if (!v39)
              {
LABEL_54:

                break;
              }
            }
          }

          long long v25 = v69 + 1;
        }
        while (v69 + 1 != (char *)v68);
        uint64_t v68 = [(NSArray *)obj countByEnumeratingWithState:&v85 objects:v97 count:16];
      }
      while (v68);
    }

    if (_LSLoggingQueue(void)::onceToken != -1) {
      dispatch_once(&_LSLoggingQueue(void)::onceToken, &__block_literal_global_208);
    }
    dispatch_sync((dispatch_queue_t)_LSLoggingQueue(void)::logQueue, &__block_literal_global_211);
    id v76 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v70 = v72;
    uint64_t v48 = [v70 countByEnumeratingWithState:&v77 objects:v95 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v78;
LABEL_61:
      uint64_t v50 = 0;
      while (1)
      {
        if (*(void *)v78 != v49) {
          objc_enumerationMutation(v70);
        }
        uint64_t v51 = *(void *)(*((void *)&v77 + 1) + 8 * v50);
        uint64_t v52 = (void *)MEMORY[0x18530F680]();
        uint64_t v53 = [v74 objectForKeyedSubscript:v51];
        v54 = (void *)v53;
        objc_super v55 = v76;
        if (v53) {
          objc_super v55 = (void *)v53;
        }
        id v56 = v55;

        uint64_t v57 = [v73 objectForKeyedSubscript:v51];
        __int16 v58 = (void *)v57;
        id v59 = v57 ? (id)v57 : v47;
        id v60 = v59;

        LOBYTE(block[0]) = 0;
        v64[2](v64, v51, v56, v60, block);
        int v61 = LOBYTE(block[0]);

        if (v61) {
          break;
        }
        if (v48 == ++v50)
        {
          uint64_t v48 = [v70 countByEnumeratingWithState:&v77 objects:v95 count:16];
          if (v48) {
            goto LABEL_61;
          }
          break;
        }
      }
    }

    id v7 = v70;
  }
}

+ (NSString)missingLocalizationPlaceholder
{
  if (+[_LSStringLocalizer missingLocalizationPlaceholder]::once != -1) {
    dispatch_once(&+[_LSStringLocalizer missingLocalizationPlaceholder]::once, &__block_literal_global_48);
  }
  objc_super v2 = (void *)+[_LSStringLocalizer missingLocalizationPlaceholder]::result;

  return (NSString *)v2;
}

+ (BOOL)useLegacyLocalizationListForPlatform:(unsigned int)a3 sdkVersion:(unsigned int)a4
{
  if (a3 - 1 > 8) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = dword_182AF91F0[a3 - 1];
  }
  return v4 > a4;
}

+ (void)gatherLocalizedStringsForLSBundleProvider:(id)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7
{
  BOOL v7 = a7;
  char v9 = a5;
  v43[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (_LSStringLocalizer *)[objc_alloc((Class)a1) initWithBundleProvider:v12 stringsFile:@"InfoPlist" legacyLocalizationList:v7];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__48;
  v41[4] = __Block_byref_object_dispose__48;
  id v42 = 0;
  if (v14)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16 = v15;
    if (v29 && v15)
    {
      _LSStringLocalizerPrewarmAllLocalizations(v14);
      BOOL v17 = (void *)MEMORY[0x1E4F1CA80];
      if (v9)
      {
        uint64_t v19 = *MEMORY[0x1E4F1D008];
        v43[0] = *MEMORY[0x1E4F1CC48];
        v43[1] = v19;
        v43[2] = @"NSMicrophoneUsageDescription";
        v43[3] = @"NSIdentityUsageDescription";
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
        v21 = [v17 setWithArray:v20];

        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke;
        v39[3] = &unk_1E5230B58;
        id v18 = v21;
        id v40 = v18;
        _LSBundleDisplayNameContextEnumerate(v39);
        [v16 setObject:v18 forKeyedSubscript:&stru_1ECB1A570];
      }
      else
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [v16 setObject:v18 forKeyedSubscript:&stru_1ECB1A570];
      }

      if ((v9 & 4) != 0) {
        [a1 findKeysToLocalizeInInfoDictionary:v13 forArrayKey:*MEMORY[0x1E4F1CC50] stringKey:*MEMORY[0x1E4F1CC90] localizedKeys:v16];
      }
      if ((v9 & 2) != 0)
      {
        [a1 findKeysToLocalizeInInfoDictionary:v13 forArrayKey:@"UTExportedTypeDeclarations" stringKey:@"UTTypeDescription" localizedKeys:v16];
        [a1 findKeysToLocalizeInInfoDictionary:v13 forArrayKey:@"UTImportedTypeDeclarations" stringKey:@"UTTypeDescription" localizedKeys:v16];
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2;
      v30[3] = &unk_1E5230BA8;
      uint64_t v31 = v14;
      id v22 = v13;
      id v32 = v22;
      uint64_t v35 = v41;
      id v33 = v12;
      id v36 = a1;
      BOOL v37 = a6;
      BOOL v38 = v7;
      id v23 = v29;
      id v34 = v23;
      [v16 enumerateKeysAndObjectsUsingBlock:v30];
      if ([v23 count])
      {
        uint64_t v24 = *MEMORY[0x1E4F1CC48];
        long long v25 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F1CC48]];
        long long v26 = v25;
        if (!v25 || ![v25 count])
        {
          if (_LSGetBooleanFromDict((const __CFDictionary *)v22, @"LSHasLocalizedDisplayName"))
          {
            uint64_t v27 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F1D008]];

            long long v26 = (void *)v27;
            [v23 setObject:v27 forKeyedSubscript:v24];
          }
        }
        long long v28 = (void *)[v23 copy];
        [v22 setObject:v28 forKeyedSubscript:@"_LSLocalizedStringsDictionary"];
      }
    }
  }
  _Block_object_dispose(v41, 8);
}

+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7
{
  BOOL v7 = a7;
  char v9 = a5;
  v43[4] = *MEMORY[0x1E4F143B8];
  id v29 = a4;
  id v12 = (void *)MEMORY[0x18530F680]();
  id v13 = (_LSStringLocalizer *)[objc_alloc((Class)a1) initWithCFBundle:a3 stringsFile:@"InfoPlist" legacyLocalizationList:v7];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__48;
  v41[4] = __Block_byref_object_dispose__48;
  id v42 = 0;
  if (v13)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = v14;
    if (v28 && v14)
    {
      _LSStringLocalizerPrewarmAllLocalizations(v13);
      v16 = (void *)MEMORY[0x1E4F1CA80];
      if (v9)
      {
        uint64_t v18 = *MEMORY[0x1E4F1D008];
        v43[0] = *MEMORY[0x1E4F1CC48];
        v43[1] = v18;
        v43[2] = @"NSMicrophoneUsageDescription";
        v43[3] = @"NSIdentityUsageDescription";
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
        v20 = [v16 setWithArray:v19];

        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke;
        v39[3] = &unk_1E5230B58;
        id v17 = v20;
        id v40 = v17;
        _LSBundleDisplayNameContextEnumerate(v39);
        [v15 setObject:v17 forKeyedSubscript:&stru_1ECB1A570];
      }
      else
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [v15 setObject:v17 forKeyedSubscript:&stru_1ECB1A570];
      }

      if ((v9 & 4) != 0) {
        [a1 findKeysToLocalizeInInfoDictionary:v29 forArrayKey:*MEMORY[0x1E4F1CC50] stringKey:*MEMORY[0x1E4F1CC90] localizedKeys:v15];
      }
      if ((v9 & 2) != 0)
      {
        [a1 findKeysToLocalizeInInfoDictionary:v29 forArrayKey:@"UTExportedTypeDeclarations" stringKey:@"UTTypeDescription" localizedKeys:v15];
        [a1 findKeysToLocalizeInInfoDictionary:v29 forArrayKey:@"UTImportedTypeDeclarations" stringKey:@"UTTypeDescription" localizedKeys:v15];
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2;
      v30[3] = &unk_1E5230BD0;
      uint64_t v31 = v13;
      id v21 = v29;
      id v32 = v21;
      id v34 = v41;
      uint64_t v35 = a3;
      id v36 = a1;
      BOOL v37 = a6;
      BOOL v38 = v7;
      id v22 = v28;
      id v33 = v22;
      [v15 enumerateKeysAndObjectsUsingBlock:v30];
      if ([v22 count])
      {
        uint64_t v23 = *MEMORY[0x1E4F1CC48];
        uint64_t v24 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F1CC48]];
        long long v25 = v24;
        if (!v24 || ![v24 count])
        {
          if (_LSGetBooleanFromDict((const __CFDictionary *)v21, @"LSHasLocalizedDisplayName"))
          {
            uint64_t v26 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F1D008]];

            long long v25 = (void *)v26;
            [v22 setObject:v26 forKeyedSubscript:v23];
          }
        }
        uint64_t v27 = objc_msgSend(v22, "copy", v28);
        [v21 setObject:v27 forKeyedSubscript:@"_LSLocalizedStringsDictionary"];
      }
    }
  }
  _Block_object_dispose(v41, 8);
}

+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 legacyLocalizationList:(BOOL)a6
{
}

- (id)debugDescription
{
  BOOL v5 = NSString;
  BOOL v6 = (objc_class *)objc_opt_class();
  BOOL v7 = NSStringFromClass(v6);
  int v8 = [(_LSStringLocalizer *)self bundleProvider];
  char v9 = [v8 bundleURL];
  if (v9)
  {
    objc_super v2 = [(_LSStringLocalizer *)self bundleProvider];
    v3 = [v2 bundleURL];
    uint64_t v10 = [v3 lastPathComponent];
  }
  else
  {
    uint64_t v10 = @"(no bundle)";
  }
  uint64_t v11 = [(_LSStringsFileContent *)self->_stringsContent debugDescription];
  id v12 = [v5 stringWithFormat:@"<%@ %p> { '%@'; %@ }", v7, self, v10, v11];

  if (v9)
  {
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleProvider, 0);
  objc_storeStrong((id *)&self->_bundleLocalizationsWithDefaultPrefLocs, 0);
  objc_storeStrong((id *)&self->_bundleLocalizations, 0);
  objc_storeStrong((id *)&self->_unlocalizedInfoPlistStrings, 0);

  objc_storeStrong((id *)&self->_stringsContent, 0);
}

- (_LSStringLocalizer)initWithDatabase:(id)a3 bundleUnit:(unsigned int)a4 delegate:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v17 = 0;
  if (_LSBundleCopyNode(v8, v6, v5, 0, &v17))
  {
    char v9 = [(_LSStringLocalizer *)self init];
  }
  else
  {
    uint64_t v10 = _LSBundleGet(v8, v6);
    if (v10)
    {
      uint64_t v11 = *(unsigned int *)(v10 + 20);
      uint64x2_t v12 = *(uint64x2_t *)(v10 + 76);
      v18[0] = *(uint64x2_t *)(v10 + 60);
      v18[1] = v12;
      uint64_t v13 = _LSMakeDYLDVersionFromVersionNumber(v18);
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v13 = 0;
    }
    BOOL v14 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:v11 sdkVersion:v13];
    id v15 = [v17 URL];
    char v9 = [(_LSStringLocalizer *)self initWithBundleURL:v15 stringsFile:@"InfoPlist" legacyLocalizationList:v14];
  }
  return v9;
}

- (_LSStringLocalizer)initWithDatabase:(id)a3 pluginUnit:(unsigned int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _LSGetPlugin((uint64_t)v6, a4);
  id v8 = (int *)v7;
  if (!v7) {
    goto LABEL_6;
  }
  if (!*(_DWORD *)v7) {
    goto LABEL_6;
  }
  uint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64x2_t v10 = *(uint64x2_t *)(v7 + 76);
  v17[0] = *(uint64x2_t *)(v7 + 60);
  v17[1] = v10;
  BOOL v11 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:v9 sdkVersion:_LSMakeDYLDVersionFromVersionNumber(v17)];
  uint64x2_t v12 = _LSAliasCopyResolvedNode(v6, *v8, 0, 0, 0);
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_6;
  }
  BOOL v14 = [v12 URL];

  if (v14)
  {
    id v15 = [(_LSStringLocalizer *)self initWithBundleURL:v14 stringsFile:@"InfoPlist" legacyLocalizationList:v11];
  }
  else
  {
LABEL_6:
    id v15 = [(_LSStringLocalizer *)self init];
  }

  return v15;
}

+ (NSArray)preferredLocalizationsForXCTests
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure]
    && (objc_super v2 = getenv("LS_PREFERRED_LOCALIZATIONS")) != 0)
  {
    v3 = [NSString stringWithUTF8String:v2];
    unsigned int v4 = [v3 componentsSeparatedByString:@"||"];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return (NSArray *)v4;
}

+ (void)setPreferredLocalizationsForXCTests:(id)a3
{
  id v4 = a3;
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    if (v4)
    {
      id v3 = [v4 componentsJoinedByString:@"||"];
      setenv("LS_PREFERRED_LOCALIZATIONS", (const char *)[v3 UTF8String], 1);
    }
    else
    {
      unsetenv("LS_PREFERRED_LOCALIZATIONS");
    }
  }
}

+ (id)localizedStringForCanonicalString:(id)a3 preferredLocalizations:(id)a4 context:(LSContext *)a5
{
  uint64_t v7 = (_LSDatabase *)a3;
  id v9 = a4;
  if (!v7) {
    goto LABEL_6;
  }
  uint64x2_t v10 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find((LaunchServices::CanonicalString *)a5->db, v7, v8);
  if (!v10) {
    goto LABEL_6;
  }
  uint64_t LocalizedString = LaunchServices::CanonicalString::getLocalizedString(v10);
  uint64x2_t v12 = LaunchServices::LocalizedString::localizeUnsafely(LocalizedString, a5->db, v9);
  uint64_t v13 = v12;
  if (v12 && [v12 isEqual:v7])
  {

LABEL_6:
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)localizedStringsForCanonicalString:(id)a3 context:(LSContext *)a4
{
  id v6 = (_LSDatabase *)a3;
  if (v6
    && (uint64_t v7 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find((LaunchServices::CanonicalString *)a4->db, v6, v5)) != 0)
  {
    uint64_t LocalizedString = (LaunchServices::LocalizedString *)LaunchServices::CanonicalString::getLocalizedString(v7);
    id v9 = LaunchServices::LocalizedString::getAllUnsafeLocalizations(LocalizedString, a4->db, 0, 0, 0);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 preferredLocalizations:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = v10;
  if (v9)
  {
    if (!v10)
    {
LABEL_4:
      BOOL v14 = self->_bundleLocalizationsWithDefaultPrefLocs;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 1019, @"Invalid parameter not satisfying: %@", @"string != nil" object file lineNumber description];

    if (!v11) {
      goto LABEL_4;
    }
  }
  uint64x2_t v12 = [(id)__LSDefaultsGetSharedInstance() preferredLocalizations];
  int v13 = [v11 isEqual:v12];

  if (v13) {
    goto LABEL_4;
  }
  BOOL v14 = (NSArray *)CFBundleCopyLocalizationsForPreferences((CFArrayRef)self->_bundleLocalizations, (CFArrayRef)v11);
LABEL_6:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v14;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = [(_LSStringLocalizer *)self localizedStringWithString:v9 inBundle:a4 localeCode:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        v20 = v19;
        if (v19 && [(NSArray *)v19 length])
        {
          id v22 = v15;
          goto LABEL_20;
        }
      }
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v21 = [(_LSLazyPropertyList *)self->_unlocalizedInfoPlistStrings objectForKey:v9 ofClass:objc_opt_class()];
  id v22 = v21;
  if (v21 && [(NSArray *)v21 length])
  {
    id v22 = v22;
    v20 = v22;
  }
  else
  {
    v20 = 0;
  }
LABEL_20:

  return v20;
}

- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 localeCode:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  long long v25 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 1060, @"Invalid parameter not satisfying: %@", @"string != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 1061, @"Invalid parameter not satisfying: %@", @"localeCode != nil" object file lineNumber description];

LABEL_3:
  uint64x2_t v12 = (void *)MEMORY[0x18530F680]();
  CFURLRef v13 = CFBundleCopyBundleURL(a4);
  id v14 = [NSString alloc];
  id v15 = [(__CFURL *)v13 path];
  id v16 = (id)[v14 initWithFormat:@"Reading localized string from %@", v15];
  uint64_t v17 = v9;
  if (_LSLoggingQueue(void)::onceToken != -1) {
    dispatch_once(&_LSLoggingQueue(void)::onceToken, &__block_literal_global_208);
  }
  uint64_t v18 = _LSLoggingQueue(void)::logQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZL18_LSSetCrashMessageP8NSString_block_invoke_1;
  block[3] = &unk_1E522D3E8;
  id v27 = v16;
  id v19 = v16;
  dispatch_sync(v18, block);

  v20 = v17;
  id v21 = -[_LSStringsFileContent stringForString:forLocale:fromBundle:cacheLocalizations:](&self->_stringsContent->super.isa, v17, v25, (uint64_t)a4, self->_bundleLocalizationsWithDefaultPrefLocs);
  if (_LSLoggingQueue(void)::onceToken != -1) {
    dispatch_once(&_LSLoggingQueue(void)::onceToken, &__block_literal_global_208);
  }
  dispatch_sync((dispatch_queue_t)_LSLoggingQueue(void)::logQueue, &__block_literal_global_211);

  return v21;
}

+ (void)findKeysToLocalizeInInfoDictionary:(id)a3 forArrayKey:(__CFString *)a4 stringKey:(__CFString *)a5 localizedKeys:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v29 = a6;
  context = (void *)MEMORY[0x18530F680]();
  long long v28 = v9;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [v9 objectForKey:a4];
  uint64x2_t v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64x2_t v12 = 0;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
        if (_NSIsNSDictionary())
        {
          uint64_t v19 = [v18 objectForKeyedSubscript:@"_LSBundleLibraryDelegate"];
          v20 = (void *)v19;
          id v21 = &stru_1ECB1A570;
          if (v19) {
            id v21 = (__CFString *)v19;
          }
          id v22 = v21;

          uint64_t v23 = [v29 objectForKeyedSubscript:v22];
          if (!v23)
          {
            uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
            [v29 setObject:v23 forKeyedSubscript:v22];
          }
          uint64_t v24 = objc_opt_class();
          uint64_t v25 = [v18 objectForKey:a5];
          long long v26 = (void *)v25;
          if (v24 && v25)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              long long v26 = 0;
LABEL_23:

              goto LABEL_24;
            }
          }
          else if (!v25)
          {
            goto LABEL_23;
          }
          [v23 addObject:v26];
          goto LABEL_23;
        }
LABEL_24:
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }
}

+ (void)newFrameworkBundleLocalizer
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "frameworkBundleLocalizer init fallback localizer %{private}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithBundleProvider:(os_log_t)log stringsFile:legacyLocalizationList:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[_LSStringLocalizer initWithBundleProvider:stringsFile:legacyLocalizationList:]";
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "could not create fresh unique bundle in %s", (uint8_t *)&v1, 0xCu);
}

@end