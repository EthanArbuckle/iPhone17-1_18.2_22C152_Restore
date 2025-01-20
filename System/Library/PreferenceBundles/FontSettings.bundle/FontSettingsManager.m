@interface FontSettingsManager
+ (id)sharedManager;
- (FontSettingsManager)init;
- (NSArray)installedFontFamilies;
- (NSMutableArray)systemFontFamilies;
- (id)downloadProgressForFont:(id)a3;
- (id)identifierFromFilePath:(id)a3;
- (id)identifierUUIDFromFilePath:(id)a3;
- (id)postscriptNamesForDownloadedFamily:(id)a3;
- (id)providerIdentifierAndLocalizedName:(id *)a3 fromFilePath:(id)a4;
- (id)systemFontFamiliesWithDownloadableFaces:(id)a3 andCachedDownloadFamilies:(id)a4;
- (void)dealloc;
- (void)deltaUpdateSystemAsync;
- (void)reloadFonts;
- (void)removeFontFamilies:(id)a3;
- (void)setBackupTimer;
- (void)setInstalledFontFamilies:(id)a3;
- (void)setSystemFontFamilies:(id)a3;
- (void)startDownloadForFont:(id)a3;
- (void)updateSystemAsyncWithCompletion:(id)a3;
@end

@implementation FontSettingsManager

+ (id)sharedManager
{
  if (qword_24830 != -1) {
    dispatch_once(&qword_24830, &stru_1C9D8);
  }
  v2 = (void *)qword_24828;

  return v2;
}

- (FontSettingsManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)FontSettingsManager;
  v2 = [(FontSettingsManager *)&v25 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    v4 = +[NSOperationQueue mainQueue];
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_A3E4;
    v23 = &unk_1CA00;
    v5 = v2;
    v24 = v5;
    id v6 = [v3 addObserverForName:@"SystemFontsDataChanged" object:0 queue:v4 usingBlock:&v20];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_A3EC, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_A3EC, FontProviderDidChangeDistributedNotification, 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_A3EC, kCTFontManagerRegisteredFontsChangedNotification, 0, CFNotificationSuspensionBehaviorCoalesce);
    uint64_t v8 = +[NSPredicate predicateWithFormat:@"NOT SELF BEGINSWITH %@", @".", v20, v21, v22, v23];
    v9 = (void *)_visibleNameFilter;
    _visibleNameFilter = v8;

    uint64_t v10 = +[NSMutableDictionary dictionaryWithCapacity:0];
    v11 = (void *)_fontsDownloadProgress;
    _fontsDownloadProgress = v10;

    uint64_t v12 = +[NSMutableSet setWithCapacity:0];
    v13 = (void *)_downloading;
    _downloading = v12;

    uint64_t v14 = +[NSMutableSet setWithCapacity:0];
    v15 = (void *)_removing;
    _removing = v14;

    v16 = dispatch_get_global_queue(25, 0);
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("com.apple.Preferences.Fonts.UpdateQueue", 0, v16);
    v18 = (void *)_assetUpdateBackgroundQueue;
    _assetUpdateBackgroundQueue = (uint64_t)v17;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"SystemFontsDataChanged" object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveEveryObserver(DistributedCenter, self);
  v6.receiver = self;
  v6.super_class = (Class)FontSettingsManager;
  [(FontSettingsManager *)&v6 dealloc];
}

- (void)reloadFonts
{
  installedFontFamilies = self->_installedFontFamilies;
  self->_installedFontFamilies = 0;

  [(FontSettingsManager *)self reloadSystem];
}

- (id)identifierUUIDFromFilePath:(id)a3
{
  id v3 = a3;
  id v5 = 0;
  if (IsPathUserInstalledFontFile(v3, v4))
  {
    objc_super v6 = 0;
    do
    {
      v7 = v5;
      uint64_t v8 = v3;
      id v5 = v6;

      objc_super v6 = [v3 lastPathComponent];

      id v3 = [v3 stringByDeletingLastPathComponent];
    }
    while ((unint64_t)[v3 length] >= 2
         && ![v6 isEqualToString:@"FontFiles"]);
  }

  return v5;
}

- (id)identifierFromFilePath:(id)a3
{
  id v3 = [(FontSettingsManager *)self identifierUUIDFromFilePath:a3];
  v4 = +[FSUserFontManager identifierFromDirectoryName:v3];

  return v4;
}

- (id)providerIdentifierAndLocalizedName:(id *)a3 fromFilePath:(id)a4
{
  id v6 = a4;
  if (!_directoryNameToProviderLocalizedNameMap)
  {
    uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:0];
    uint64_t v8 = (void *)_directoryNameToProviderLocalizedNameMap;
    _directoryNameToProviderLocalizedNameMap = v7;
  }
  if (!_directoryNameToProviderIdentifierMap)
  {
    uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:0];
    uint64_t v10 = (void *)_directoryNameToProviderIdentifierMap;
    _directoryNameToProviderIdentifierMap = v9;
  }
  v11 = [(FontSettingsManager *)self identifierUUIDFromFilePath:v6];
  if (v11)
  {
    uint64_t v12 = [(id)_directoryNameToProviderLocalizedNameMap objectForKey:v11];
    uint64_t v13 = [(id)_directoryNameToProviderIdentifierMap objectForKey:v11];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
    }
    else
    {
      uint64_t v14 = [(FontSettingsManager *)self identifierFromFilePath:v6];
      if (v14)
      {
        id v15 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v14 allowPlaceholder:0 error:0];
        uint64_t v16 = [v15 localizedName];

        if (v16) {
          uint64_t v12 = (__CFString *)v16;
        }
        else {
          uint64_t v12 = &stru_1CDF0;
        }
        [(id)_directoryNameToProviderLocalizedNameMap setObject:v12 forKey:v11];
        [(id)_directoryNameToProviderIdentifierMap setObject:v14 forKey:v11];
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  if (a3) {
    *a3 = v12;
  }
  id v17 = v14;

  return v17;
}

- (NSArray)installedFontFamilies
{
  installedFontFamilies = self->_installedFontFamilies;
  if (!installedFontFamilies)
  {
    v4 = +[FSUserFontManager userFontsInfo];
    id v5 = +[NSMutableSet setWithCapacity:0];
    id v6 = +[NSMutableDictionary dictionaryWithCapacity:0];
    uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:0];
    uint64_t v8 = +[NSMutableDictionary dictionaryWithCapacity:0];
    uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:0];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_AB50;
    v40[3] = &unk_1CA50;
    v31 = self;
    v40[4] = self;
    id v10 = v5;
    id v41 = v10;
    id v33 = v8;
    id v42 = v33;
    id v34 = v9;
    id v43 = v34;
    id v35 = v6;
    id v44 = v35;
    id v11 = v7;
    id v45 = v11;
    v30 = v4;
    [v4 enumerateKeysAndObjectsUsingBlock:v40];
    uint64_t v12 = +[NSMutableArray arrayWithCapacity:0];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v10;
    id v13 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v18 = [v34 objectForKey:v17];
          if (v18)
          {
            v19 = [UserInstalledFontFamily alloc];
            v20 = [v35 objectForKey:v17];
            uint64_t v21 = [v11 objectForKey:v17];
            id v22 = [(UserInstalledFontFamily *)v19 init:v17 withPostScriptNames:v20 andFontFiles:v21];

            v23 = [v33 objectForKey:v17];
            [v22 setProviderLocalizedName:v23];

            [v22 setProviderIdentifier:v18];
          }
          else
          {
            v24 = [FontAssetFontFamily alloc];
            objc_super v25 = [v35 objectForKey:v17];
            v26 = [v11 objectForKey:v17];
            id v22 = [(FontAssetFontFamily *)v24 init:v17 withPostScriptNames:v25 andFontFiles:v26];
          }
          [v12 addObject:v22];
        }
        id v14 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v14);
    }

    uint64_t v27 = [v12 sortedArrayUsingSelector:"compareLocalizedFamilyName:"];
    v28 = v31->_installedFontFamilies;
    v31->_installedFontFamilies = (NSArray *)v27;

    installedFontFamilies = v31->_installedFontFamilies;
  }

  return installedFontFamilies;
}

- (id)postscriptNamesForDownloadedFamily:(id)a3
{
  id v3 = a3;
  v36[0] = kCTFontFamilyNameAttribute;
  v36[1] = kCTFontDownloadableAttribute;
  v37[0] = v3;
  v37[1] = &__kCFBooleanTrue;
  v36[2] = kCTFontDownloadedAttribute;
  v37[2] = &__kCFBooleanTrue;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
  id v5 = CTFontDescriptorCreateWithAttributes(v4);

  objc_super v25 = v5;
  CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v5, 0);
  uint64_t v7 = +[NSMutableSet setWithCapacity:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = +[UIFont fontNamesForFamilyName:v3];
  uint64_t v9 = [v8 filteredArrayUsingPredicate:_visibleNameFilter];

  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        [v7 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  CFArrayRef v14 = MatchingFontDescriptors;
  id v15 = [(__CFArray *)v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
        v20 = [v19 postscriptName];
        unsigned __int8 v21 = [v20 hasPrefix:@"."];

        if ((v21 & 1) == 0)
        {
          id v22 = [v19 postscriptName];
          [v7 addObject:v22];
        }
      }
      id v16 = [(__CFArray *)v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

  v23 = [v7 allObjects];

  return v23;
}

- (id)systemFontFamiliesWithDownloadableFaces:(id)a3 andCachedDownloadFamilies:(id)a4
{
  id v68 = a3;
  id v67 = a4;
  v84 = +[NSMutableSet setWithCapacity:0];
  uint64_t v120 = kCTFontUserInstalledAttribute;
  v121 = &__kCFBooleanTrue;
  CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
  descriptor = CTFontDescriptorCreateWithAttributes(v5);

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  CFArrayRef obj = CTFontDescriptorCreateMatchingFontDescriptors(descriptor, 0);
  id v6 = [(__CFArray *)obj countByEnumeratingWithState:&v107 objects:v119 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v108;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v108 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = (void *)CTFontDescriptorCopyAttribute(*(CTFontDescriptorRef *)(*((void *)&v107 + 1) + 8 * i), kCTFontFamilyNameAttribute);
        [v84 addObject:v9];
      }
      id v6 = [(__CFArray *)obj countByEnumeratingWithState:&v107 objects:v119 count:16];
    }
    while (v6);
  }

  v83 = +[NSMutableDictionary dictionaryWithCapacity:0];
  v85 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v10 = +[UIFont familyNames];
  id v11 = +[NSSet setWithArray:v10];

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v74 = v11;
  id v12 = [v74 countByEnumeratingWithState:&v103 objects:v118 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v104;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v104 != v13) {
          objc_enumerationMutation(v74);
        }
        uint64_t v15 = *(void *)(*((void *)&v103 + 1) + 8 * (void)j);
        if ((objc_msgSend(v84, "containsObject:", v15, descriptor) & 1) == 0)
        {
          CFStringRef v116 = kCTFontFamilyNameAttribute;
          uint64_t v117 = v15;
          CFDictionaryRef v16 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
          CTFontDescriptorRef v17 = CTFontDescriptorCreateWithAttributes(v16);

          [v83 setObject:v17 forKey:v15];
        }
      }
      id v12 = [v74 countByEnumeratingWithState:&v103 objects:v118 count:16];
    }
    while (v12);
  }

  if (v68)
  {
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v80 = v68;
    id v18 = [v80 countByEnumeratingWithState:&v99 objects:v115 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v100;
      do
      {
        for (k = 0; k != v18; k = (char *)k + 1)
        {
          if (*(void *)v100 != v19) {
            objc_enumerationMutation(v80);
          }
          unsigned __int8 v21 = *(const __CTFontDescriptor **)(*((void *)&v99 + 1) + 8 * (void)k);
          id v22 = (void *)CTFontDescriptorCopyAttribute(v21, kCTFontFamilyNameAttribute);
          v23 = (void *)CTFontDescriptorCopyAttribute(v21, kCTFontDownloadedAttribute);
          [v83 setObject:v21 forKey:v22];
          unsigned int v24 = [v23 BOOLValue];
          objc_super v25 = [v85 objectForKey:v22];
          BOOL v26 = v25 == 0;

          if (v26)
          {
            if (v24) {
              uint64_t v30 = 1;
            }
            else {
              uint64_t v30 = 2;
            }
          }
          else
          {
            long long v27 = [v85 objectForKey:v22];
            signed int v28 = [v27 intValue];

            if (v28 == 2) {
              int v29 = v24;
            }
            else {
              int v29 = 1;
            }
            if ((((v28 != 1) | ~v24) & v29) != 0) {
              uint64_t v30 = 0;
            }
            else {
              uint64_t v30 = v28;
            }
          }
          long long v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v30, descriptor);
          [v85 setObject:v31 forKey:v22];
        }
        id v18 = [v80 countByEnumeratingWithState:&v99 objects:v115 count:16];
      }
      while (v18);
    }
  }
  v76 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0, descriptor);
  v71 = (void *)CFPreferencesCopyValue(@"AppleLanguages", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v72 = [v83 allValues];
  id v32 = [v72 countByEnumeratingWithState:&v95 objects:v114 count:16];
  if (v32)
  {
    id v81 = *(id *)v96;
    CFStringRef attribute = (const __CFString *)kCTFontDesignLanguagesAttribute;
    do
    {
      for (m = 0; m != v32; m = (char *)m + 1)
      {
        if (*(id *)v96 != v81) {
          objc_enumerationMutation(v72);
        }
        id v34 = *(const __CTFontDescriptor **)(*((void *)&v95 + 1) + 8 * (void)m);
        id v35 = (void *)CTFontDescriptorCopyAttribute(v34, attribute);
        long long v36 = (void *)CTFontDescriptorCopyAttribute(v34, kCTFontFamilyNameAttribute);
        long long v37 = [v85 objectForKey:v36];
        long long v38 = v37;
        if (!v37
          || [v37 intValue] != 2
          || ![v35 count]
          || ([kInvalidLanguageArray arrayByAddingObjectsFromArray:v35],
              long long v39 = objc_claimAutoreleasedReturnValue(),
              +[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v39, v71), v40 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v41 = [v40 isEqualToArray:kInvalidLanguageArray], v40, v39, (v41 & 1) == 0))
        {
          [v76 addObject:v34];
        }
      }
      id v32 = [v72 countByEnumeratingWithState:&v95 objects:v114 count:16];
    }
    while (v32);
  }

  BOOL v42 = v68 != 0;
  if (!v67) {
    BOOL v42 = 1;
  }
  if (v42)
  {
    id v73 = 0;
  }
  else
  {
    id v43 = +[NSMutableDictionary dictionaryWithCapacity:0];
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_BD60;
    v92[3] = &unk_1CA78;
    id v93 = v71;
    id v73 = v43;
    id v94 = v73;
    [v67 enumerateKeysAndObjectsUsingBlock:v92];
  }
  v70 = +[NSMutableArray arrayWithCapacity:0];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v82 = v76;
  id v44 = [v82 countByEnumeratingWithState:&v88 objects:v113 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v89;
LABEL_55:
    uint64_t v46 = 0;
    while (1)
    {
      if (*(void *)v89 != v45) {
        objc_enumerationMutation(v82);
      }
      v47 = *(const __CTFontDescriptor **)(*((void *)&v88 + 1) + 8 * v46);
      v48 = (void *)CTFontDescriptorCopyAttribute(v47, kCTFontFamilyNameAttribute);
      if ([v48 hasPrefix:@"."]) {
        goto LABEL_85;
      }
      if ([v48 isEqual:@"October India"]) {
        goto LABEL_85;
      }
      if ([v48 isEqual:@"November India"]) {
        goto LABEL_85;
      }
      if (v73)
      {
        v49 = [v73 objectForKey:v48];
        BOOL v50 = v49 == 0;

        if (!v50) {
          goto LABEL_85;
        }
      }
      attributea = (__CFString *)CTFontDescriptorCopyAttribute(v47, kCTFontDownloadableAttribute);
      v77 = (void *)CTFontDescriptorCopyAttribute(v47, kCTFontDownloadedAttribute);
      v51 = [v85 objectForKey:v48];
      v52 = v51;
      if (v51)
      {
        if ([v51 intValue] != 1)
        {
          [(__CFString *)attributea BOOLValue];
          unsigned int v53 = 0;
          goto LABEL_72;
        }
        if (([v77 BOOLValue] & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v112 = v48;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Inconsistent state for downloaded family %@", buf, 0xCu);
          }
          goto LABEL_93;
        }
        unsigned int v53 = 1;
      }
      else
      {
        unsigned int v53 = [v77 BOOLValue];
      }
      if (([(__CFString *)attributea BOOLValue] & v53) == 1)
      {
        v54 = [(FontSettingsManager *)self postscriptNamesForDownloadedFamily:v48];
        if (![v54 count])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v112 = v48;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "No faces for downloaded family %@", buf, 0xCu);
          }

LABEL_93:
          id v61 = 0;
          v62 = v82;
          goto LABEL_94;
        }
        goto LABEL_73;
      }
LABEL_72:
      v55 = +[UIFont fontNamesForFamilyName:v48];
      v54 = [v55 filteredArrayUsingPredicate:_visibleNameFilter];

LABEL_73:
      if ([(__CFString *)attributea BOOLValue])
      {
        if (v53) {
          id v56 = [[FontAssetFontFamily alloc] init:v48 withPostScriptNames:v54 andFontFiles:&__NSArray0__struct];
        }
        else {
          id v56 = [[UndownloadedFontFamily alloc] init:v48 withDescriptor:v47];
        }
        id v57 = v56;
        id v58 = (id)_downloading;
        objc_sync_enter(v58);
        if ([(id)_downloading containsObject:v48]) {
          id v59 = &dword_0 + 1;
        }
        else {
          id v59 = [(id)_removing containsObject:v48];
        }
        [v57 setIsProcessing:v59];
        objc_sync_exit(v58);
      }
      else
      {
        id v57 = [[FontFamily alloc] init:v48 withPostScriptNames:v54 forInstallKind:0];
      }
      if (v57) {
        [v70 addObject:v57];
      }

LABEL_85:
      if (v44 == (id)++v46)
      {
        id v44 = [v82 countByEnumeratingWithState:&v88 objects:v113 count:16];
        if (v44) {
          goto LABEL_55;
        }
        break;
      }
    }
  }

  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_C3C4;
  v86[3] = &unk_1CAA0;
  id v60 = v70;
  id v87 = v60;
  [v73 enumerateKeysAndObjectsUsingBlock:v86];
  [v60 sortUsingSelector:"compareLocalizedFamilyName:"];
  id v61 = v60;
  v62 = v87;
LABEL_94:

  return v61;
}

- (void)updateSystemAsyncWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3042000000;
  v10[3] = sub_C564;
  v10[4] = sub_C570;
  objc_initWeak(&v11, self);
  CFDictionaryRef v5 = _assetUpdateBackgroundQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C578;
  block[3] = &unk_1CAF0;
  id v8 = v4;
  uint64_t v9 = v10;
  block[4] = self;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
  objc_destroyWeak(&v11);
}

- (void)deltaUpdateSystemAsync
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3042000000;
  v4[3] = sub_C564;
  v4[4] = sub_C570;
  objc_initWeak(&v5, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_C8C8;
  v3[3] = &unk_1CB40;
  v3[4] = self;
  v3[5] = v4;
  dispatch_async((dispatch_queue_t)_assetUpdateBackgroundQueue, v3);
  _Block_object_dispose(v4, 8);
  objc_destroyWeak(&v5);
}

- (NSMutableArray)systemFontFamilies
{
  systemFontFamilies = self->_systemFontFamilies;
  if (!systemFontFamilies)
  {
    if (_downloadableFaces) {
      goto LABEL_8;
    }
    if (byte_24838)
    {
      if (byte_24839 == 1)
      {
        CFStringRef v12 = kCTFontDownloadableAttribute;
        uint64_t v13 = &__kCFBooleanTrue;
        CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
        id v5 = CTFontDescriptorCreateWithAttributes(v4);

        CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v5, 0);
        uint64_t v7 = (void *)_downloadableFaces;
        _downloadableFaces = (uint64_t)MatchingFontDescriptors;
      }
    }
    else
    {
      byte_24838 = 1;
      [(FontSettingsManager *)self updateSystemAsyncWithCompletion:&stru_1CB60];
    }
    if (_downloadableFaces) {
LABEL_8:
    }
      uint64_t DownloadFamilyNames = 0;
    else {
      uint64_t DownloadFamilyNames = GSFontGetDownloadFamilyNames();
    }
    uint64_t v9 = [(FontSettingsManager *)self systemFontFamiliesWithDownloadableFaces:_downloadableFaces andCachedDownloadFamilies:DownloadFamilyNames];
    id v10 = self->_systemFontFamilies;
    self->_systemFontFamilies = v9;

    if (!self->_systemFontFamilies && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_110D8();
    }
    systemFontFamilies = self->_systemFontFamilies;
  }

  return systemFontFamilies;
}

- (void)setBackupTimer
{
  [(id)_backupTimer invalidate];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_D440;
  v5[3] = &unk_1CB88;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v5 block:30.0];
  CFDictionaryRef v4 = (void *)_backupTimer;
  _backupTimer = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)removeFontFamilies:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v22 = +[NSMutableSet setWithCapacity:0];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v4;
  id v25 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v38;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v38 != v24)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v27 = v6;
        id v8 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          [v9 setIsProcessing:1];
          id v26 = [v9 familyName];
          [v22 addObject:v26];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_22;
          }
          id v26 = v8;
          id v9 = [v26 fontFilePaths];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v34 = 0u;
          long long v33 = 0u;
          id v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v34;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v34 != v11) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
                CFArrayRef v14 = [(FontSettingsManager *)self identifierFromFilePath:v13];
                if (v14)
                {
                  uint64_t v15 = [v5 objectForKey:v14];
                  CFDictionaryRef v16 = v15;
                  if (v15)
                  {
                    [v15 addObject:v13];
                  }
                  else
                  {
                    CFDictionaryRef v16 = +[NSMutableSet setWithObject:v13];
                    [v5 setObject:v16 forKey:v14];
                  }
                }
              }
              id v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v10);
          }
        }

LABEL_22:
        uint64_t v6 = v27 + 1;
      }
      while ((id)(v27 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v25);
  }

  [v5 enumerateKeysAndObjectsUsingBlock:&stru_1CBC8];
  if ([v22 count])
  {
    id v17 = (id)_downloading;
    objc_sync_enter(v17);
    [(id)_removing unionSet:v22];
    [(FontSettingsManager *)self setBackupTimer];
    objc_sync_exit(v17);

    systemFontFamilies = self->_systemFontFamilies;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_DB28;
    v31[3] = &unk_1CC30;
    id v19 = v22;
    id v32 = v19;
    v20 = [(NSMutableArray *)systemFontFamilies indexesOfObjectsPassingTest:v31];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_DB70;
    v30[3] = &unk_1CC58;
    v30[4] = self;
    [v20 enumerateIndexesUsingBlock:v30];
    unsigned __int8 v21 = +[NSNotificationCenter defaultCenter];
    [v21 postNotificationName:@"FontSettingsManagerUpdated" object:0];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_DBC0;
    v28[3] = &unk_1CC80;
    id v29 = v19;
    PurgeFontAssetsWithHandler(v28);
  }
}

- (void)startDownloadForFont:(id)a3
{
  id v4 = a3;
  id v5 = [v4 familyName];
  UIFontDescriptorAttributeName v24 = UIFontDescriptorFamilyAttribute;
  id v25 = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  uint64_t v7 = +[UIFontDescriptor fontDescriptorWithFontAttributes:v6];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3042000000;
  v18[3] = sub_C564;
  v18[4] = sub_C570;
  objc_initWeak(&v19, self);
  if (v7)
  {
    id v8 = (id)_downloading;
    objc_sync_enter(v8);
    [(id)_downloading addObject:v5];
    [(FontSettingsManager *)self setBackupTimer];
    objc_sync_exit(v8);

    [v4 setIsProcessing:1];
    id v9 = (id)_fontsDownloadProgress;
    objc_sync_enter(v9);
    [(id)_fontsDownloadProgress setObject:&off_1DAD0 forKeyedSubscript:v5];
    objc_sync_exit(v9);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_E098;
    v14[3] = &unk_1CCA8;
    id v15 = v5;
    CFDictionaryRef v16 = v20;
    id v17 = v18;
    id v10 = objc_retainBlock(v14);
    if (sub_10278() && sub_10348())
    {
      v23 = v7;
      uint64_t v11 = +[NSArray arrayWithObjects:&v23 count:1];
      CFArrayRef v12 = v10;
      uint64_t v13 = (void (*)(NSArray *, uint64_t, const __CFArray *))sub_10348();
      if (!v13)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      v13(v11, 2, v12);
    }
    else
    {
      id v22 = v7;
      CFArrayRef v12 = +[NSArray arrayWithObjects:&v22 count:1];
      CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v12, 0, v10);
    }
  }
  _Block_object_dispose(v18, 8);
  objc_destroyWeak(&v19);
  _Block_object_dispose(v20, 8);
}

- (id)downloadProgressForFont:(id)a3
{
  id v3 = a3;
  id v4 = (id)_fontsDownloadProgress;
  objc_sync_enter(v4);
  id v5 = (void *)_fontsDownloadProgress;
  uint64_t v6 = [v3 familyName];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  objc_sync_exit(v4);

  return v7;
}

- (void)setInstalledFontFamilies:(id)a3
{
}

- (void)setSystemFontFamilies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFontFamilies, 0);

  objc_storeStrong((id *)&self->_installedFontFamilies, 0);
}

@end