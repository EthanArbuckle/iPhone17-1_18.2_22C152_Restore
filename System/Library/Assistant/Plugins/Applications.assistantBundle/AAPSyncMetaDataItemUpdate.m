@interface AAPSyncMetaDataItemUpdate
- (AAPSyncAnchor)anchor;
- (AAPSyncMetaDataItemUpdate)init;
- (AAPSyncMetaDataItemUpdate)initWithAppId:(id)a3 appProxy:(id)a4 anchor:(id)a5 configuration:(id)a6;
- (BOOL)isMetaDataItemUpdate;
- (NSString)appId;
- (NSString)description;
- (id)scrapeAppInfo;
- (id)valueForGenericParser:(id)a3 withDefaultGenerator:(id)a4 withErrorKeyDescriptor:(id)a5;
- (id)valueForPlistEntry:(id *)a3 inBundle:(__CFBundle *)a4 withInfo:(id)a5 entitlements:(id)a6;
- (id)valuesForEntries:(id *)a3 inPlistAtURL:(id)a4;
- (id)valuesForInfoPlistEntries:(id *)a3 inBundle:(__CFBundle *)a4 withEntitlements:(id)a5 forLocalization:(id)a6 ignoringDefaultValues:(id)a7;
- (id)valuesForLocalInfoPlistEntries:(id *)a3 inBundle:(__CFBundle *)a4 withEntitlements:(id)a5 ignoringDefaultValues:(id)a6;
- (void)_validate;
- (void)dealloc;
@end

@implementation AAPSyncMetaDataItemUpdate

- (AAPSyncMetaDataItemUpdate)initWithAppId:(id)a3 appProxy:(id)a4 anchor:(id)a5 configuration:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)AAPSyncMetaDataItemUpdate;
  v9 = [(AAPSyncMetaDataItemUpdate *)&v11 init];
  if (v9)
  {
    v9->_appId = (NSString *)[a3 copy];
    v9->_appProxy = (LSApplicationProxy *)a4;
    v9->_anchor = (AAPSyncAnchor *)[a5 copy];
    [(AAPSyncMetaDataItemUpdate *)v9 _validate];
  }
  return v9;
}

- (AAPSyncMetaDataItemUpdate)init
{
  return [(AAPSyncMetaDataItemUpdate *)self initWithAppId:0 appProxy:0 anchor:0 configuration:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AAPSyncMetaDataItemUpdate;
  [(AAPSyncMetaDataItemUpdate *)&v3 dealloc];
}

- (void)_validate
{
  if (!self->_appId) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"AAPSyncMetaDataItemUpdate.m" lineNumber:87 description:@"appId cannot be nil"];
  }
  if (!self->_appProxy) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"AAPSyncMetaDataItemUpdate.m" lineNumber:88 description:@"appProxy cannot be nil"];
  }
  if (!self->_anchor) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"AAPSyncMetaDataItemUpdate.m" lineNumber:89 description:@"anchor cannot be nil"];
  }
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncMetaDataItemUpdate.m", 95, @"appId must be a %@", v4 object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncMetaDataItemUpdate.m", 96, @"appProxy must be a %@", v5 object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncMetaDataItemUpdate.m", 97, @"anchor must be a %@", v6 object file lineNumber description];
  }
}

- (id)valueForGenericParser:(id)a3 withDefaultGenerator:(id)a4 withErrorKeyDescriptor:(id)a5
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncMetaDataItemUpdate.m", 105, @"Invalid parameter not satisfying: %@", @"genericParser" object file lineNumber description];
    if (a5) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncMetaDataItemUpdate.m", 106, @"Invalid parameter not satisfying: %@", @"errorKeyDescriptor" object file lineNumber description];
LABEL_3:
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3052000000;
  v30 = sub_AEE0;
  v31 = sub_AEF0;
  uint64_t v32 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_AEFC;
  v26[3] = &unk_20A60;
  v26[4] = &v27;
  v10 = (void *)(*((uint64_t (**)(id, void *))a3 + 2))(a3, v26);
  uint64_t v11 = v28[5];
  if (v10)
  {
    if (v11)
    {
      v12 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = (*((uint64_t (**)(id))a5 + 2))(a5);
        appId = self->_appId;
        v15 = (void *)v28[5];
        *(_DWORD *)buf = 136316162;
        v34 = "-[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]";
        __int16 v35 = 2114;
        uint64_t v36 = v13;
        __int16 v37 = 2112;
        v38 = appId;
        __int16 v39 = 2114;
        v40 = v15;
        __int16 v41 = 2112;
        v42 = v10;
        _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: Error: parsing encountered errors for %{public}@ (%@) but managed to recover -> errors=%{public}@ parsed=%@", buf, 0x34u);
      }
    }
    goto LABEL_16;
  }
  if (!v11
    || (v16 = AFSiriLogContextPlugin, !os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)))
  {
    if (a4) {
      goto LABEL_10;
    }
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  uint64_t v23 = (*((uint64_t (**)(id))a5 + 2))(a5);
  v24 = self->_appId;
  v25 = (void *)v28[5];
  *(_DWORD *)buf = 136315906;
  v34 = "-[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]";
  __int16 v35 = 2114;
  uint64_t v36 = v23;
  __int16 v37 = 2112;
  v38 = v24;
  __int16 v39 = 2114;
  v40 = v25;
  _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: Error: parsing failed for %{public}@ (%@) -> %{public}@", buf, 0x2Au);
  if (!a4) {
    goto LABEL_15;
  }
LABEL_10:
  v10 = (void *)(*((uint64_t (**)(id))a4 + 2))(a4);
  v17 = AFSiriLogContextPlugin;
  BOOL v18 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG);
  if (!v10)
  {
    if (v18)
    {
      uint64_t v21 = (*((uint64_t (**)(id))a5 + 2))(a5);
      sub_14ED0(v21, (uint64_t)self, buf, v17);
    }
    goto LABEL_15;
  }
  if (v18)
  {
    uint64_t v19 = (*((uint64_t (**)(id))a5 + 2))(a5);
    v20 = self->_appId;
    *(_DWORD *)buf = 136315906;
    v34 = "-[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]";
    __int16 v35 = 2114;
    uint64_t v36 = v19;
    __int16 v37 = 2112;
    v38 = v20;
    __int16 v39 = 2112;
    v40 = v10;
    _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: falling back to defaultGenerator value for %{public}@ (%@) -> %@", buf, 0x2Au);
  }
LABEL_16:

  _Block_object_dispose(&v27, 8);
  return v10;
}

- (id)valueForPlistEntry:(id *)a3 inBundle:(__CFBundle *)a4 withInfo:(id)a5 entitlements:(id)a6
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_B054;
  v9[3] = &unk_20A88;
  v9[5] = a6;
  v9[6] = a3;
  v9[4] = a5;
  id var4 = a3->var4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_B0C8;
  v8[3] = &unk_20AA8;
  v8[4] = a3;
  return [(AAPSyncMetaDataItemUpdate *)self valueForGenericParser:v9 withDefaultGenerator:var4 withErrorKeyDescriptor:v8];
}

- (id)valuesForInfoPlistEntries:(id *)a3 inBundle:(__CFBundle *)a4 withEntitlements:(id)a5 forLocalization:(id)a6 ignoringDefaultValues:(id)a7
{
  id v13 = objc_alloc_init((Class)NSMutableSet);
  if (a3->var0)
  {
    v14 = a3 + 1;
    do
    {
      objc_msgSend(v13, "addObject:");
      id var0 = v14->var0;
      ++v14;
    }
    while (var0);
  }
  if (![v13 count]) {
    goto LABEL_25;
  }
  if (a6)
  {
    FilteredLocalizedInfoPlist = (void *)_CFBundleCreateFilteredLocalizedInfoPlist();
    if (!FilteredLocalizedInfoPlist)
    {
      v17 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_14FB4((uint64_t)a6, (uint64_t)self, v17);
      }
LABEL_25:
      id v18 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    FilteredLocalizedInfoPlist = (void *)_CFBundleCreateFilteredInfoPlist();
    if (!FilteredLocalizedInfoPlist)
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_14F40();
      }
      goto LABEL_25;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v13, "count"));
    if (a3->var0)
    {
      id v30 = a6;
      *(void *)&long long v19 = 136316162;
      long long v29 = v19;
      do
      {
        id v20 = -[AAPSyncMetaDataItemUpdate valueForPlistEntry:inBundle:withInfo:entitlements:](self, "valueForPlistEntry:inBundle:withInfo:entitlements:", a3, a4, FilteredLocalizedInfoPlist, a5, v29);
        if (v20)
        {
          id v21 = v20;
          if (objc_msgSend(v20, "isEqual:", objc_msgSend(a7, "objectForKey:", a3->var0)))
          {
            v22 = AFSiriLogContextPlugin;
            if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
            {
              CFStringRef v23 = (const __CFString *)a3->var0;
              appId = self->_appId;
              *(_DWORD *)buf = v29;
              uint64_t v32 = "-[AAPSyncMetaDataItemUpdate valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:igno"
                    "ringDefaultValues:]";
              __int16 v33 = 2114;
              CFStringRef v34 = v23;
              __int16 v35 = 2112;
              uint64_t v36 = (AAPSyncMetaDataItemUpdate *)appId;
              __int16 v37 = 2114;
              id v38 = v30;
              __int16 v39 = 2112;
              id v40 = v21;
              _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: not setting value for key=%{public}@ (%@) for localization (%{public}@) because it is the same as the default -> %@", buf, 0x34u);
            }
          }
          else
          {
            [v18 setObject:v21 forKey:a3->var0];
          }
        }
        id v25 = a3[1].var0;
        ++a3;
      }
      while (v25);
    }
  }
  else
  {
    v26 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = "-[AAPSyncMetaDataItemUpdate valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:]";
      __int16 v33 = 2114;
      CFStringRef v28 = &stru_21158;
      *(_DWORD *)buf = 136315906;
      if (a6) {
        CFStringRef v28 = (const __CFString *)a6;
      }
      CFStringRef v34 = v28;
      __int16 v35 = 2112;
      uint64_t v36 = self;
      __int16 v37 = 2112;
      id v38 = FilteredLocalizedInfoPlist;
      _os_log_error_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: Error: could not understand %{public}@ info file data for metaDataItem=%@ -> %@", buf, 0x2Au);
    }
    id v18 = 0;
  }

LABEL_26:
  return v18;
}

- (id)valuesForLocalInfoPlistEntries:(id *)a3 inBundle:(__CFBundle *)a4 withEntitlements:(id)a5 ignoringDefaultValues:(id)a6
{
  uint64_t v6 = -1;
  v7 = a3;
  do
  {
    id var0 = v7->var0;
    ++v7;
    ++v6;
  }
  while (var0);
  if (v6 && (CFArrayRef v9 = CFBundleCopyBundleLocalizations(a4)) != 0)
  {
    CFArrayRef v10 = v9;
    id v11 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v6];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v29 = [(__CFArray *)v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v29)
    {
      uint64_t v23 = *(void *)v36;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v10);
          }
          id v13 = *(__CFString **)(*((void *)&v35 + 1) + 8 * i);
          id v14 = -[AAPSyncMetaDataItemUpdate valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:](self, "valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:", a3, a4, a5, v13, a6, v23);
          if ([v14 count])
          {
            id v30 = i;
            CanonicalLocaleIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLocaleIdentifierFromString(0, v13);
            if (!CanonicalLocaleIdentifierFromString) {
              CanonicalLocaleIdentifierFromString = v13;
            }
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v32;
              do
              {
                for (j = 0; j != v17; j = (char *)j + 1)
                {
                  if (*(void *)v32 != v18) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
                  id v21 = [v11 objectForKey:v20];
                  if (!v21)
                  {
                    id v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[__CFArray count](v10, "count"));
                    [v11 setObject:v21 forKey:v20];
                  }
                  objc_msgSend(v21, "setObject:forKey:", objc_msgSend(v14, "objectForKey:", v20), CanonicalLocaleIdentifierFromString);
                }
                id v17 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v17);
            }

            i = v30;
          }
        }
        id v29 = [(__CFArray *)v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v29);
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (id)valuesForEntries:(id *)a3 inPlistAtURL:(id)a4
{
  if (a4)
  {
    id v7 = objc_alloc_init((Class)NSMutableSet);
    if (a3->var0)
    {
      v8 = a3 + 1;
      do
      {
        objc_msgSend(v7, "addObject:");
        id var0 = v8->var0;
        ++v8;
      }
      while (var0);
    }
    if ([v7 count])
    {
      id v20 = 0;
      id v10 = [objc_alloc((Class)NSData) initWithContentsOfURL:a4 options:1 error:&v20];
      if (v10)
      {
        id v11 = v10;
        _CFPropertyListCreateFiltered();
        id v14 = AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
          sub_150E0((uint64_t)a4, (uint64_t)self, v14);
        }
      }
      else
      {
        id v13 = AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
        {
          appId = self->_appId;
          id v18 = [v20 domain];
          id v19 = [v20 code];
          *(_DWORD *)buf = 136316418;
          v22 = "-[AAPSyncMetaDataItemUpdate valuesForEntries:inPlistAtURL:]";
          __int16 v23 = 2112;
          id v24 = a4;
          __int16 v25 = 2112;
          v26 = appId;
          __int16 v27 = 2114;
          id v28 = v18;
          __int16 v29 = 2048;
          id v30 = v19;
          __int16 v31 = 2112;
          id v32 = v20;
          _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: could not load plist file at url='%@' (%@) -> {%{public}@:%li}%@", buf, 0x3Eu);
        }
      }
    }
  }
  else
  {
    v12 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_15050((uint64_t)self, v12);
    }
  }
  return 0;
}

- (id)scrapeAppInfo
{
  id v4 = objc_alloc_init((Class)SAAppInfo);
  id v35 = v4;
  [v4 setIdentifier:AAPSyncInfoIdentifierForAppId((uint64_t)self->_appId)];
  id v6 = [(LSApplicationProxy *)self->_appProxy bundleURL];
  CFTypeRef cf = (CFTypeRef)_CFBundleCreateUnique();
  if (cf)
  {
    v82[0] = kCFBundleIdentifierKey;
    v82[1] = "setAppId:";
    v82[2] = &stru_20AE8;
    v82[3] = AAPPlistStringParser;
    v82[4] = 0;
    v82[5] = kCFBundleVersionKey;
    v82[6] = "setAppVersion:";
    v82[7] = &stru_20AE8;
    v82[8] = AAPPlistStringParser;
    v82[9] = 0;
    v82[10] = _kCFBundleShortVersionStringKey;
    v82[12] = 0;
    v82[11] = 0;
    v82[13] = AAPPlistStringParser;
    v82[14] = 0;
    v82[15] = kCFBundleNameKey;
    v82[16] = "setAppName:";
    v82[17] = &stru_20AE8;
    v82[18] = AAPPlistStringParser;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_C51C;
    v46[3] = &unk_20B50;
    v46[4] = v6;
    v82[19] = v46;
    v82[20] = @"CFBundleDisplayName";
    v82[21] = "setDisplayAppName:";
    v82[22] = &stru_20AE8;
    v82[23] = AAPPlistStringParser;
    v82[24] = 0;
    v82[25] = @"CFBundleSpokenName";
    v82[26] = "setSpokenName:";
    v82[27] = &stru_20AE8;
    v82[28] = AAPPlistStringParser;
    v82[29] = 0;
    v82[30] = _INAlternativeAppNamesKey;
    v82[31] = "setAppNameSynonyms:";
    v82[32] = &stru_20AE8;
    v82[33] = AAPAlternativeAppNamesParser;
    v82[34] = 0;
    v82[35] = _kCFBundleURLTypesKey;
    v82[36] = "setSupportedSchemes:";
    v82[37] = &stru_20AE8;
    v82[38] = AAPPlistURLTypesSchemesParser;
    v82[39] = 0;
    v82[40] = @"SiriSupport";
    v82[41] = "setSiriSupport:";
    v82[42] = &stru_20AE8;
    v82[43] = AAPPlistSiriSupportParser;
    v82[44] = 0;
    v82[45] = @"SBStarkLaunchModes";
    v82[46] = "setStarkSupport:";
    v82[47] = &stru_20AE8;
    v82[48] = AAPPlistStarkSupportParser;
    v82[49] = 0;
    v82[50] = @"CFBundleCarDisplayName";
    v82[51] = "setCarPlayAlternativeDisplayName:";
    v82[52] = &stru_20AE8;
    v82[53] = AAPPlistStringParser;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
    v44 = v82;
    id v45 = 0;
    v78[0] = kCFBundleNameKey;
    v78[1] = "setAppNameMap:";
    v78[2] = &stru_20AE8;
    v78[3] = AAPPlistStringParser;
    v78[4] = 0;
    v78[5] = @"CFBundleDisplayName";
    v78[6] = "setDisplayAppNameMap:";
    v78[7] = &stru_20AE8;
    v78[8] = AAPPlistStringParser;
    v78[9] = 0;
    v78[10] = @"CFBundleSpokenName";
    v78[11] = "setSpokenNameMap:";
    v78[12] = &stru_20AE8;
    v78[13] = AAPPlistStringParser;
    v78[14] = 0;
    v78[15] = @"CFBundleCarDisplayName";
    v78[16] = "setCarPlayAlternativeDisplayNameMap:";
    v78[17] = &stru_20AE8;
    v78[18] = AAPPlistStringParser;
    long long v81 = 0u;
    long long v80 = 0u;
    long long v79 = 0u;
    v42 = v78;
    id v43 = 0;
    v74[0] = @"itemId";
    v74[1] = "setAdamId:";
    v74[2] = &stru_20AE8;
    v74[3] = AAPPlistStringFromNumberParser;
    v74[4] = 0;
    v74[5] = @"itemName";
    v74[6] = "setSpotlightName:";
    v74[7] = &stru_20AE8;
    v74[8] = AAPPlistStringParser;
    v74[9] = 0;
    v74[10] = @"artistName";
    v74[11] = "setProviderName:";
    v74[12] = &stru_20AE8;
    v74[13] = AAPPlistStringParser;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v40 = v74;
    id v41 = 0;
    v48 = "setAppIdentifyingInfo:";
    v49 = &stru_20AE8;
    v50 = AAPAggregateSyncIdentityParser;
    uint64_t v51 = 0;
    v52 = "setBetaApp:";
    v53 = &stru_20B28;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_C548;
    v39[3] = &unk_20B50;
    v39[4] = self;
    uint64_t v54 = 0;
    v55 = v39;
    v56 = "setSupportsUniversalSearchSubscription:";
    v57 = &stru_20B28;
    v58 = AAPUniversalSearchParser;
    uint64_t v59 = 0;
    v60 = "setHasSiriIntegration:";
    v61 = &stru_20B28;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_C578;
    v38[3] = &unk_20B50;
    v38[4] = self;
    uint64_t v62 = 0;
    v63 = v38;
    v64 = "setAppNameSynonymsMap:";
    v65 = &stru_20AE8;
    v66 = AAPAlternativeAppNamesMapParser;
    uint64_t v67 = 0;
    v68 = "setNowPlayingAppWithBrowsableContent:";
    v69 = &stru_20AE8;
    v70 = AAPPlistBrowsableMediaParser;
    uint64_t v73 = 0;
    long long v72 = 0u;
    long long v71 = 0u;
    id v7 = [(LSApplicationProxy *)self->_appProxy entitlements];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_152D0();
      }
    }
    id v8 = [(AAPSyncMetaDataItemUpdate *)self valuesForInfoPlistEntries:v44 inBundle:cf withEntitlements:v7 forLocalization:0 ignoringDefaultValues:0];
    id v45 = v8;
    if (v8)
    {
      id v9 = v8;
      id v10 = [v8 objectForKey:kCFBundleIdentifierKey];
      if ([v10 isEqualToString:self->_appId])
      {
        SEL v31 = a2;
        id v32 = v5;
        id v43 = [(AAPSyncMetaDataItemUpdate *)self valuesForLocalInfoPlistEntries:v42 inBundle:cf withEntitlements:v7 ignoringDefaultValues:v9];
        if (objc_msgSend(-[LSApplicationProxy applicationType](self->_appProxy, "applicationType"), "isEqualToString:", @"User"))id v41 = -[AAPSyncMetaDataItemUpdate valuesForEntries:inPlistAtURL:](self, "valuesForEntries:inPlistAtURL:", v74, objc_msgSend(-[LSApplicationProxy bundleContainerURL](self->_appProxy, "bundleContainerURL"), "URLByAppendingPathComponent:isDirectory:", @"iTunesMetadata.plist", 0)); {
        long long v33 = self;
        }
        uint64_t v11 = 0;
        v12 = &v44;
        v47[0] = &v44;
        v47[1] = &v42;
        v47[2] = &v40;
        v47[3] = 0;
        do
        {
          id v13 = *v12;
          if (**v12)
          {
            uint64_t v14 = 0;
            uint64_t v15 = 0;
            id v16 = v12[1];
            id v17 = *v12;
            do
            {
              id v18 = &v13[v14];
              uint64_t v19 = v13[v14 + 2];
              if (v19)
              {
                uint64_t v20 = v18[1];
                if (!v20)
                {
                  [+[NSAssertionHandler currentHandler] handleFailureInMethod:v31, v33, @"AAPSyncMetaDataItemUpdate.m", 472, @"no selector defined for setter of key=%@", *v17 object file lineNumber description];
                  uint64_t v20 = v18[1];
                  uint64_t v19 = v18[2];
                }
                (*(void (**)(uint64_t, id, uint64_t, id))(v19 + 16))(v19, v35, v20, objc_msgSend(v16, "objectForKey:"));
                id v13 = *v12;
              }
              ++v15;
              id v17 = &v13[5 * v15];
              uint64_t v21 = v13[v14 + 5];
              v14 += 5;
            }
            while (v21);
          }
          v12 = (void **)v47[++v11];
        }
        while (v12);
        if (v49)
        {
          uint64_t v22 = 0;
          id v23 = v45;
          id v24 = v43;
          __int16 v25 = &v48;
          id v26 = v41;
          do
          {
            if (!*v25) {
              [+[NSAssertionHandler currentHandler] handleFailureInMethod:v31, v33, @"AAPSyncMetaDataItemUpdate.m", 484, @"no selector defined for aggregateSetter at index=%li", v22 object file lineNumber description];
            }
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472;
            v37[2] = sub_C5D8;
            v37[3] = &unk_20B78;
            v37[4] = v23;
            v37[5] = v24;
            v37[6] = v26;
            v37[7] = v7;
            v37[8] = v25;
            v37[9] = cf;
            __int16 v27 = v25[3];
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_C604;
            v36[3] = &unk_20AA8;
            v36[4] = v25;
            [(AAPSyncMetaDataItemUpdate *)v33 valueForGenericParser:v37 withDefaultGenerator:v27 withErrorKeyDescriptor:v36];
            (*((void (**)(void))v25[1] + 2))();
            ++v22;
            id v28 = v25[5];
            v25 += 4;
          }
          while (v28);
        }
        uint64_t v5 = v32;
      }
      else
      {
        BOOL v29 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR);
        if (v10)
        {
          if (v29) {
            sub_15254();
          }
        }
        else if (v29)
        {
          sub_151E0();
        }
      }
    }
    CFRelease(cf);
  }
  else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
  {
    sub_1516C();
  }
  return v35;
}

- (BOOL)isMetaDataItemUpdate
{
  return 1;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@:%p appId='%@' bundleURL='%@' anchor=%@>", objc_opt_class(), self, self->_appId, [(LSApplicationProxy *)self->_appProxy bundleURL], self->_anchor];
}

- (NSString)appId
{
  return self->_appId;
}

- (AAPSyncAnchor)anchor
{
  return self->_anchor;
}

@end