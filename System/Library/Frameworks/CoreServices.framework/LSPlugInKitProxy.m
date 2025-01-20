@interface LSPlugInKitProxy
+ (BOOL)supportsSecureCoding;
+ (id)containingBundleIdentifiersForPlugInBundleIdentifiers:(id)a3 error:(id *)a4;
+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4;
+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6;
+ (id)plugInKitProxyForUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8;
+ (id)pluginKitProxyForIdentifier:(id)a3;
+ (id)pluginKitProxyForURL:(id)a3;
+ (id)pluginKitProxyForUUID:(id)a3;
- (BOOL)UPPValidated;
- (BOOL)_usesSystemPersona;
- (BOOL)freeProfileValidated;
- (BOOL)isOnSystemPartition;
- (BOOL)pluginCanProvideIcon;
- (BOOL)profileValidated;
- (LSBundleProxy)containingBundle;
- (LSExtensionPoint)extensionPoint;
- (LSPlugInKitProxy)initWithCoder:(id)a3;
- (NSDate)registrationDate;
- (NSDictionary)infoPlist;
- (NSDictionary)pluginKitDictionary;
- (NSNumber)platform;
- (NSString)originalIdentifier;
- (NSString)pluginIdentifier;
- (NSString)protocol;
- (NSString)teamID;
- (NSUUID)pluginUUID;
- (id)_initWithPlugin:(unsigned int)a3 andContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6;
- (id)_initWithUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8;
- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4;
- (id)_managedPersonas;
- (id)_stringLocalizerForTable:(id)a3;
- (id)boundIconsDictionary;
- (id)bundleType;
- (id)correspondingApplicationExtensionRecord;
- (id)dataContainerURL;
- (id)description;
- (id)groupContainerURLs;
- (id)iconDataForVariant:(int)a3 withOptions:(int)a4;
- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 inScope:(unint64_t)a5;
- (id)signerIdentity;
- (id)signerOrganization;
- (unint64_t)compatibilityState;
- (void)detach;
- (void)encodeWithCoder:(id)a3;
- (void)extensionPoint;
@end

@implementation LSPlugInKitProxy

void __48__LSPlugInKitProxy_pluginKitProxyForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (v6)
  {
    v10 = v6;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
    v7 = [v10 pluginIdentifier];
    v8 = [v10 originalIdentifier];
    char v9 = [v7 isEqualToString:v8];

    id v6 = v10;
    if ((v9 & 1) == 0) {
      *a4 = 1;
    }
  }
}

- (NSString)pluginIdentifier
{
  return self->_pluginIdentifier;
}

- (NSString)originalIdentifier
{
  return self->_originalIdentifier;
}

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 inScope:(unint64_t)a5
{
  id v8 = a3;
  char v9 = (void *)MEMORY[0x18530F680]();
  v10 = [(LSBundleProxy *)self _infoDictionary];
  v11 = 0;
  if (a5 == 2)
  {
    v12 = 0;
    goto LABEL_8;
  }
  if (a5 != 1)
  {
    v12 = 0;
    v13 = 0;
    if (a5) {
      goto LABEL_13;
    }
    v12 = [v10 objectForKey:@"NSExtension" ofClass:objc_opt_class()];
    v11 = [v12 objectForKeyedSubscript:@"NSExtensionAttributes"];
    v13 = [v11 objectForKey:v8];
    if (v13)
    {
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
LABEL_8:
    v13 = [v10 objectForKey:v8 ofClass:a4];
    goto LABEL_13;
  }
  v12 = [v10 objectForKey:@"NSExtension" ofClass:objc_opt_class()];
  v13 = [v12 objectForKey:v8];
  v11 = 0;
  if (!a4) {
    goto LABEL_13;
  }
LABEL_10:
  if (v13 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v13 = 0;
  }
LABEL_13:

  return v13;
}

+ (id)pluginKitProxyForUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__38;
  v15 = __Block_byref_object_dispose__38;
  id v16 = 0;
  v4 = +[LSPlugInQuery pluginQueryWithUUID:v3];
  v5 = +[_LSQueryContext defaultContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__LSPlugInKitProxy_pluginKitProxyForUUID___block_invoke;
  v10[3] = &unk_1E522BB88;
  v10[4] = &v11;
  [v5 enumerateResolvedResultsOfQuery:v4 withBlock:v10];

  id v6 = (void *)v12[5];
  if (!v6)
  {
    v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v3;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Failed to find plugin with UUID %@", buf, 0xCu);
    }

    id v6 = (void *)v12[5];
  }
  id v8 = v6;

  _Block_object_dispose(&v11, 8);

  return v8;
}

+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4
{
  v4 = (void *)[objc_alloc((Class)a1) _initWithPlugin:*(void *)&a3 andContext:a4 applicationExtensionRecord:0 resolveAndDetach:1];

  return v4;
}

- (id)_initWithPlugin:(unsigned int)a3 andContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6
{
  BOOL v41 = a6;
  uint64_t v7 = *(void *)&a3;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v46 = a5;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__38;
  v64 = __Block_byref_object_dispose__38;
  id v65 = 0;
  id v8 = (int *)_LSGetPlugin((uint64_t)a4->db, v7);
  uint64_t v9 = (uint64_t)v8;
  if (!v8) {
    goto LABEL_33;
  }
  if (*v8)
  {
    v10 = _LSAliasCopyResolvedNode(a4->db, *v8, 0, 0, 0);
    uint64_t v11 = v10;
    if (v10)
    {
      v51 = [v10 URL];

      goto LABEL_6;
    }
LABEL_33:
    v51 = 0;
    goto LABEL_34;
  }
  v51 = 0;
LABEL_6:
  v12 = (void *)_CSStringCopyCFString();
  if (!v12)
  {
LABEL_34:

    id v24 = 0;
    id obj = 0;
    v48 = 0;
    id v44 = 0;
    id v45 = 0;
    id v43 = 0;
    v49 = 0;
    v50 = 0;
    id v16 = 0;
    v15 = 0;
    v23 = 0;
    v20 = 0;
    v12 = 0;
    goto LABEL_32;
  }
  __int16 v39 = *(_WORD *)_LSContainerGet();
  int v40 = *(_DWORD *)(v9 + 168);
  if ((v40 & 4) != 0)
  {
    id obj = (id)_CSStringCopyCFString();
    id v45 = (id)_CSStringCopyCFString();
  }
  else
  {
    id obj = (id)_CSStringCopyCFString();
    id v45 = obj;
  }
  id v44 = (id)_CSStringCopyCFString();
  id v43 = (id)_CSStringCopyCFString();
  int v38 = *(_DWORD *)(v9 + 20);
  long long v13 = *(_OWORD *)(v9 + 44);
  *(_OWORD *)buf = *(_OWORD *)(v9 + 28);
  *(_OWORD *)&buf[16] = v13;
  v49 = _LSVersionNumberGetStringRepresentation(buf);
  v50 = (void *)_CSStringCopyCFString();
  if (*(_DWORD *)(v9 + 96) && ([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) == 0)
  {
    v14 = _LSAliasCopyResolvedNode(a4->db, *(_DWORD *)(v9 + 96), 0, 0, 0);
    v48 = [v14 URL];
  }
  else
  {
    v48 = 0;
  }
  v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(int)_LSBundleDataGetRegTime(v9)];
  if (*(_DWORD *)(v9 + 92))
  {
    uint64_t v53 = MEMORY[0x1E4F143A8];
    uint64_t v54 = 3221225472;
    v55 = __91__LSPlugInKitProxy__initWithPlugin_andContext_applicationExtensionRecord_resolveAndDetach___block_invoke;
    v56 = &unk_1E5230050;
    v58 = &v60;
    v59 = a4;
    id v57 = v12;
    _CSArrayEnumerateAllValues();
  }
  id v16 = +[_LSLazyPropertyList lazyPropertyListWithContext:a4 unit:*(unsigned int *)(v9 + 140)];
  v17 = +[_LSLazyPropertyList lazyPropertyListWithContext:a4 unit:*(unsigned int *)(v9 + 136)];
  id v18 = +[_LSLazyPropertyList lazyPropertyListWithContext:a4 unit:_LSPluginGetSDKDictionaryDataUnit(a4->db, v7, v9)];
  if (!v18)
  {
    uint64_t v19 = _LSDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = -[_LSLazyPropertyList propertyList](0);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = obj;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v36;
      v37 = (void *)v36;
      _os_log_error_impl(&dword_182959000, v19, OS_LOG_TYPE_ERROR, "Invalid overlay plist for extension %@ (%@): %@", buf, 0x20u);
    }
  }
  v20 = [[_LSPlugInPropertyList alloc] initWithInfoPlist:v17 SDKPlist:v18];

  long long v21 = *(_OWORD *)(v9 + 76);
  *(_OWORD *)buf = *(_OWORD *)(v9 + 60);
  *(_OWORD *)&buf[16] = v21;
  memset(v66, 0, sizeof(v66));
  if (_LSVersionNumberCompare(buf, v66))
  {
    long long v22 = *(_OWORD *)(v9 + 76);
    *(_OWORD *)buf = *(_OWORD *)(v9 + 60);
    *(_OWORD *)&buf[16] = v22;
    v23 = _LSVersionNumberGetStringRepresentation(buf);
  }
  else
  {
    v23 = 0;
  }
  v52.receiver = self;
  v52.super_class = (Class)LSPlugInKitProxy;
  id v24 = [(LSBundleProxy *)&v52 _initWithBundleUnit:0 context:a4 bundleType:6 bundleID:v12 localizedName:0 bundleContainerURL:0 dataContainerURL:v48 resourcesDirectoryURL:v51 iconsDictionary:0 iconFileNames:0 version:v49];
  if (v24)
  {
    if (v46) {
      id v25 = v46;
    }
    else {
      id v25 = [[LSApplicationExtensionRecord alloc] _initWithContext:a4 pluginID:v7 pluginData:v9 error:0];
    }
    v26 = (void *)*((void *)v24 + 20);
    *((void *)v24 + 20) = v25;

    v27 = [*((id *)v24 + 20) containingBundleRecord];
    uint64_t v28 = [v27 compatibilityObject];
    v29 = (void *)*((void *)v24 + 28);
    *((void *)v24 + 28) = v28;

    *((_DWORD *)v24 + 39) = v40;
    objc_storeStrong((id *)v24 + 23, obj);
    objc_storeStrong((id *)v24 + 24, v45);
    objc_storeStrong((id *)v24 + 25, v44);
    objc_storeStrong((id *)v24 + 21, v43);
    *((_DWORD *)v24 + 38) = v38;
    objc_storeStrong((id *)v24 + 27, v15);
    if (v50)
    {
      uint64_t v30 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v50];
      v31 = (void *)*((void *)v24 + 26);
      *((void *)v24 + 26) = v30;
    }
    *((unsigned char *)v24 + 176) = (v39 & 0x10) != 0;
    [v24 _setInfoDictionary:v20];
    [v24 setMachOUUIDs:v61[5]];
    [v24 setSDKVersion:v23];
    v32 = (LaunchServices::DatabaseContext *)[v24 _setEntitlements:v16];
    if (v41 && _LSDatabaseContextGetDetachProxyObjects(v32))
    {
      [*((id *)v24 + 20) _resolveAllProperties];
      v33 = [*((id *)v24 + 20) containingBundleRecord];
      [v33 _resolveAllProperties];

      [*((id *)v24 + 20) detach];
    }
  }
LABEL_32:
  id v34 = v24;

  _Block_object_dispose(&v60, 8);
  return v34;
}

void __42__LSPlugInKitProxy_pluginKitProxyForUUID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x18530F680]();
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSString)teamID
{
  v2 = [(LSPlugInKitProxy *)self containingBundle];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = [v2 teamID];
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (LSBundleProxy)containingBundle
{
  return self->_containingBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingBundle, 0);
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_pluginUUID, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_originalIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionPointID, 0);

  objc_storeStrong((id *)&self->_appexRecord, 0);
}

void __91__LSPlugInKitProxy__initWithPlugin_andContext_applicationExtensionRecord_resolveAndDetach___block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (void *)_CSStringCopyCFString();
    if (v5)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
      if (v6)
      {
        uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        if (!v7)
        {
          uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
          id v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;

          uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        }
        [v7 addObject:v6];
      }
      else
      {
        uint64_t v11 = _LSDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          int v13 = 138412546;
          uint64_t v14 = v12;
          __int16 v15 = 2112;
          id v16 = v5;
          _os_log_impl(&dword_182959000, v11, OS_LOG_TYPE_DEFAULT, "Launch Services: Failed to create a UUID for %@ from invalid string %@", (uint8_t *)&v13, 0x16u);
        }
      }
    }
  }
  else
  {
    *a4 = 1;
  }
}

- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  appexRecord = self->_appexRecord;
  if (v4)
  {
    if (v6) {
      [(LSBundleRecord *)appexRecord localizedShortNameWithPreferredLocalizations:v6];
    }
    else {
      [(LSBundleRecord *)appexRecord localizedShortName];
    }
  }
  else if (v6)
  {
    [(LSBundleRecord *)appexRecord localizedNameWithPreferredLocalizations:v6];
  }
  else
  {
    [(LSBundleRecord *)appexRecord localizedName];
  uint64_t v8 = };
  uint64_t v9 = (void *)v8;

  return v9;
}

+ (id)pluginKitProxyForIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__38;
  v27 = __Block_byref_object_dispose__38;
  id v28 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  BOOL v4 = +[LSPlugInQuery pluginQueryWithIdentifier:v3];
  v5 = +[_LSQueryContext defaultContext];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__LSPlugInKitProxy_pluginKitProxyForIdentifier___block_invoke;
  v22[3] = &unk_1E522BB88;
  v22[4] = &v23;
  [v5 enumerateResolvedResultsOfQuery:v4 withBlock:v22];

  uint64_t v6 = [(id)v24[5] count];
  uint64_t v7 = (void *)v24[5];
  if (v6 == 1)
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
  }
  else if ((unint64_t)[v7 count] < 2)
  {
    id v8 = 0;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = (id)v24[5];
    id v8 = 0;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
LABEL_6:
      uint64_t v12 = 0;
      int v13 = v8;
      while (1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v8 = *(id *)(*((void *)&v18 + 1) + 8 * v12);

        uint64_t v14 = objc_msgSend(v8, "pluginIdentifier", (void)v18);
        __int16 v15 = [v8 originalIdentifier];
        char v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) == 0) {
          break;
        }
        ++v12;
        int v13 = v8;
        if (v10 == v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v29 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      [(id)v24[5] objectAtIndexedSubscript:0];
      id v9 = v8;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  _Block_object_dispose(&v23, 8);

  return v8;
}

+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) _initWithPlugin:v8 andContext:a4 applicationExtensionRecord:v10 resolveAndDetach:v6];

  return v11;
}

+ (id)pluginKitProxyForURL:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy__38;
  uint64_t v14 = __Block_byref_object_dispose__38;
  id v15 = 0;
  CFErrorRef v4 = _LSCreateResolvedURL(v3);
  v5 = +[LSPlugInQuery pluginQueryWithURL:v4];
  BOOL v6 = +[_LSQueryContext defaultContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__LSPlugInKitProxy_pluginKitProxyForURL___block_invoke;
  v9[3] = &unk_1E522BB88;
  v9[4] = &v10;
  [v6 enumerateResolvedResultsOfQuery:v5 withBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __41__LSPlugInKitProxy_pluginKitProxyForURL___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x18530F680]();
  if (v14)
  {
    id v10 = v14;
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v13 = *(void *)(v11 + 40);
    uint64_t v12 = (id *)(v11 + 40);
    if (!v13)
    {
      objc_storeStrong(v12, a2);
      *a4 = 1;
    }
  }
}

+ (id)plugInKitProxyForUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  long long v20 = (void *)[objc_alloc((Class)a1) _initWithUUID:v19 bundleIdentifier:v18 pluginIdentifier:v17 effectiveIdentifier:v16 version:v15 bundleURL:v14];

  return v20;
}

- (id)_initWithUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)LSPlugInKitProxy;
  id v18 = [(LSBundleProxy *)&v32 _initWithBundleUnit:0 context:0 bundleType:6 bundleID:a4 localizedName:0 bundleContainerURL:0 dataContainerURL:0 resourcesDirectoryURL:v17 iconsDictionary:0 iconFileNames:0 version:a7];
  if (v18)
  {
    id v19 = v16 ? v16 : v15;
    uint64_t v20 = [v19 copy];
    long long v21 = (void *)v18[23];
    v18[23] = v20;

    uint64_t v22 = [v15 copy];
    uint64_t v23 = (void *)v18[24];
    v18[24] = v22;

    uint64_t v24 = [v14 copy];
    uint64_t v25 = (void *)v18[26];
    v18[26] = v24;

    *((unsigned char *)v18 + 176) = 1;
    if (v17)
    {
      v26 = [[FSNode alloc] initWithURL:v17 flags:0 error:0];
      v27 = v26;
      if (v26)
      {
        id v28 = [(FSNode *)v26 volumeNodeWithFlags:0 error:0];
        if (v28)
        {
          v29 = +[FSNode rootVolumeNode];
          int v30 = [v28 isEqual:v29];

          if (v30) {
            *((unsigned char *)v18 + 176) = 1;
          }
        }
      }
    }
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSPlugInKitProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)LSPlugInKitProxy;
  v5 = [(LSBundleProxy *)&v23 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"pluginIdentifier");
    pluginIdentifier = v5->_pluginIdentifier;
    v5->_pluginIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"originalIdentifier");
    originalIdentifier = v5->_originalIdentifier;
    v5->_originalIdentifier = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"protocol");
    protocol = v5->_protocol;
    v5->_protocol = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"extensionPointID");
    extensionPointID = v5->_extensionPointID;
    v5->_extensionPointID = (NSString *)v12;

    v5->_platform = [v4 decodeInt32ForKey:@"platform"];
    uint64_t v14 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"pluginUUID");
    pluginUUID = v5->_pluginUUID;
    v5->_pluginUUID = (NSUUID *)v14;

    uint64_t v16 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"registrationDate");
    registrationDate = v5->_registrationDate;
    v5->_registrationDate = (NSDate *)v16;

    uint64_t v18 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"containingBundle");
    containingBundle = v5->_containingBundle;
    v5->_containingBundle = (LSBundleProxy *)v18;

    v5->_onSystemPartition = [v4 decodeBoolForKey:@"isOnSystemPartition"];
    uint64_t v20 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"appexRecord");
    appexRecord = v5->_appexRecord;
    v5->_appexRecord = (LSApplicationExtensionRecord *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LSPlugInKitProxy;
  id v4 = a3;
  [(LSBundleProxy *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_pluginIdentifier, @"pluginIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_originalIdentifier forKey:@"originalIdentifier"];
  [v4 encodeObject:self->_protocol forKey:@"protocol"];
  [v4 encodeObject:self->_extensionPointID forKey:@"extensionPointID"];
  [v4 encodeInt32:self->_platform forKey:@"platform"];
  [v4 encodeObject:self->_pluginUUID forKey:@"pluginUUID"];
  [v4 encodeObject:self->_registrationDate forKey:@"registrationDate"];
  [v4 encodeObject:self->_containingBundle forKey:@"containingBundle"];
  [v4 encodeBool:self->_onSystemPartition forKey:@"isOnSystemPartition"];
  [v4 encodeObject:self->_appexRecord forKey:@"appexRecord"];
}

- (NSNumber)platform
{
  if (self->_platform)
  {
    v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  }
  else
  {
    v2 = 0;
  }

  return (NSNumber *)v2;
}

- (unint64_t)compatibilityState
{
  return [(LSBundleProxy *)self->_containingBundle compatibilityState];
}

- (NSDictionary)pluginKitDictionary
{
  v2 = [(LSBundleProxy *)self _infoDictionary];
  id v3 = [v2 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

  return (NSDictionary *)v3;
}

- (NSDictionary)infoPlist
{
  v2 = [(LSBundleProxy *)self _infoDictionary];
  id v3 = -[_LSLazyPropertyList propertyList](v2);

  return (NSDictionary *)v3;
}

- (BOOL)pluginCanProvideIcon
{
  id v3 = [(LSPlugInKitProxy *)self protocol];
  char v4 = [v3 isEqualToString:getIMMessagePayloadProviderExtensionPointName[0]()];

  if (v4) {
    return 1;
  }
  objc_super v5 = [(LSPlugInKitProxy *)self containingBundle];
  uint64_t v6 = [v5 bundleIdentifier];
  char v7 = [v6 isEqualToString:@"com.apple.share"];

  if (v7) {
    return 1;
  }
  id v9 = [(LSPlugInKitProxy *)self containingBundle];
  BOOL v8 = v9 == 0;

  return v8;
}

- (LSExtensionPoint)extensionPoint
{
  extensionPointID = self->_extensionPointID;
  if (extensionPointID)
  {
    char v4 = extensionPointID;
LABEL_4:
    objc_super v5 = [(LSPlugInKitProxy *)self platform];
    uint64_t v6 = [v5 unsignedLongValue];

    char v7 = [NSNumber numberWithUnsignedInt:v6];
    BOOL v8 = +[LSExtensionPoint extensionPointForIdentifier:v4 platform:v7];

    goto LABEL_5;
  }
  char v4 = [(LSPlugInKitProxy *)self protocol];
  if (v4) {
    goto LABEL_4;
  }
  uint64_t v10 = _LSDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    [(LSPlugInKitProxy *)(uint64_t)self extensionPoint];
  }

  char v4 = 0;
  BOOL v8 = 0;
LABEL_5:

  return (LSExtensionPoint *)v8;
}

- (id)boundIconsDictionary
{
  v2 = [(LSBundleProxy *)self _infoDictionary];
  id v3 = [v2 objectForKey:@"CFBundleIcons" ofClass:objc_opt_class()];

  return v3;
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (IconServicesLibrary_frameworkLibrary_2
    || (char v7 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_2 = (uint64_t)v7) != 0))
  {
    char v7 = ((void (*)(void *, uint64_t, uint64_t))softLink_ISIconDataForResourceProxy_0[0])(self, v5, v4);
  }

  return v7;
}

- (id)bundleType
{
  return @"PluginKitPlugin";
}

- (BOOL)profileValidated
{
  return [(LSBundleRecord *)self->_appexRecord isProfileValidated];
}

- (BOOL)UPPValidated
{
  return [(LSBundleRecord *)self->_appexRecord isUPPValidated];
}

- (BOOL)freeProfileValidated
{
  return [(LSBundleRecord *)self->_appexRecord isFreeProfileValidated];
}

- (id)signerOrganization
{
  return [(LSBundleRecord *)self->_appexRecord signerOrganization];
}

- (id)signerIdentity
{
  return [(LSBundleRecord *)self->_appexRecord signerIdentity];
}

- (id)_stringLocalizerForTable:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  appexRecord = self->_appexRecord;
  id v5 = a3;
  uint64_t v6 = [(LSBundleRecord *)appexRecord platform];
  char v7 = [(LSBundleRecord *)self->_appexRecord SDKVersion];
  _LSVersionNumberMakeWithString(v14, v7);
  uint64_t v8 = _LSMakeDYLDVersionFromVersionNumber(v14);

  BOOL v9 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:v6 sdkVersion:v8];
  uint64_t v10 = [_LSStringLocalizer alloc];
  uint64_t v11 = [(LSBundleProxy *)self bundleURL];
  uint64_t v12 = [(_LSStringLocalizer *)v10 initWithBundleURL:v11 stringsFile:v5 legacyLocalizationList:v9];

  return v12;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)LSPlugInKitProxy;
  uint64_t v4 = [(LSPlugInKitProxy *)&v11 description];
  id v5 = [(LSPlugInKitProxy *)self pluginIdentifier];
  uint64_t v6 = [(LSPlugInKitProxy *)self pluginUUID];
  char v7 = [v6 UUIDString];
  uint64_t v8 = [(LSBundleProxy *)self bundleVersion];
  BOOL v9 = [v3 stringWithFormat:@"%@ pluginID=%@ UUID=%@ version=%@", v4, v5, v7, v8];

  return v9;
}

- (id)_managedPersonas
{
  v2 = [(LSPlugInKitProxy *)self containingBundle];
  id v3 = [v2 _managedPersonas];

  return v3;
}

- (BOOL)_usesSystemPersona
{
  v2 = [(LSPlugInKitProxy *)self containingBundle];
  char v3 = [v2 _usesSystemPersona];

  return v3;
}

- (id)dataContainerURL
{
  return [(LSBundleRecord *)self->_appexRecord dataContainerURL];
}

- (id)groupContainerURLs
{
  return [(LSBundleRecord *)self->_appexRecord groupContainerURLs];
}

- (void)detach
{
  [(LSRecord *)self->_appexRecord _resolveAllProperties];
  appexRecord = self->_appexRecord;

  [(LSRecord *)appexRecord detach];
}

- (NSUUID)pluginUUID
{
  return self->_pluginUUID;
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (BOOL)isOnSystemPartition
{
  return self->_onSystemPartition;
}

+ (id)containingBundleIdentifiersForPlugInBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__38;
  uint64_t v22 = __Block_byref_object_dispose__38;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__38;
  uint64_t v16 = __Block_byref_object_dispose__38;
  id v17 = 0;
  v11[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v11[1] = (void (*)(void, void))3221225472;
  v11[2] = (void (*)(void, void))__108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke;
  v11[3] = (void (*)(void, void))&unk_1E522C550;
  v11[4] = (void (*)(void, void))&v12;
  uint64_t v6 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke_2;
  v10[3] = &unk_1E522C7B8;
  v10[4] = &v18;
  void v10[5] = &v12;
  [v6 mapPlugInBundleIdentifiersToContainingBundleIdentifiers:v5 completionHandler:v10];
  char v7 = (void *)v19[5];
  if (a4 && !v7)
  {
    *a4 = (id) v13[5];
    char v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
}

void __108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)correspondingApplicationExtensionRecord
{
  return self->_appexRecord;
}

- (void)extensionPoint
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Failed to get the extension point ID of plugin %@", (uint8_t *)&v2, 0xCu);
}

@end