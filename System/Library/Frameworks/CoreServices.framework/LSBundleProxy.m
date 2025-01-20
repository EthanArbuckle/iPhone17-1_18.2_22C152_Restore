@interface LSBundleProxy
+ (BOOL)canInstantiateFromDatabase;
+ (BOOL)supportsSecureCoding;
+ (LSBundleProxy)bundleProxyWithAuditToken:(id *)a3 error:(id *)a4;
+ (id)bundleProxyForCurrentProcess;
+ (id)bundleProxyForIdentifier:(id)a3;
+ (id)bundleProxyForURL:(id)a3;
+ (id)bundleProxyForURL:(id)a3 error:(id *)a4;
+ (void)clearBundleProxyForCurrentProcess;
- (BOOL)_hasAssociatedPersonas;
- (BOOL)_usesSystemPersona;
- (BOOL)foundBackingBundle;
- (BOOL)isContainerized;
- (BOOL)isEqual:(id)a3;
- (LSBundleProxy)initWithCoder:(id)a3;
- (NSArray)machOUUIDs;
- (NSDictionary)entitlements;
- (NSDictionary)environmentVariables;
- (NSDictionary)groupContainerURLs;
- (NSString)bundleExecutable;
- (NSString)bundleIdentifier;
- (NSString)bundleType;
- (NSString)bundleVersion;
- (NSString)canonicalExecutablePath;
- (NSString)localizedShortName;
- (NSString)sdkVersion;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSURL)appStoreReceiptURL;
- (NSURL)bundleContainerURL;
- (NSURL)bundleURL;
- (NSURL)containerURL;
- (NSURL)dataContainerURL;
- (NSUUID)cacheGUID;
- (_LSLazyPropertyList)_entitlements;
- (_LSLazyPropertyList)_environmentVariables;
- (_LSLazyPropertyList)_infoDictionary;
- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleType:(unint64_t)a5 bundleID:(id)a6 localizedName:(id)a7 bundleContainerURL:(id)a8 dataContainerURL:(id)a9 resourcesDirectoryURL:(id)a10 iconsDictionary:(id)a11 iconFileNames:(id)a12 version:(id)a13;
- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4;
- (id)_managedPersonas;
- (id)_stringLocalizerForTable:(id)a3;
- (id)appStoreReceiptName;
- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4;
- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5;
- (id)entitlementValuesForKeys:(id)a3;
- (id)localizedName;
- (id)localizedValuesForKeys:(id)a3 fromTable:(id)a4;
- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4;
- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5;
- (id)objectsForInfoDictionaryKeys:(id)a3;
- (unint64_t)compatibilityState;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (void)_setCompatibilityState:(unint64_t)a3;
- (void)_setEntitlements:(id)a3;
- (void)_setEnvironmentVariables:(id)a3;
- (void)_setInfoDictionary:(id)a3;
- (void)canonicalExecutablePath;
- (void)encodeWithCoder:(id)a3;
- (void)setMachOUUIDs:(id)a3;
- (void)setSDKVersion:(id)a3;
@end

@implementation LSBundleProxy

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4
{
  return [(LSBundleProxy *)self objectForInfoDictionaryKey:a3 ofClass:a4 valuesOfClass:0];
}

- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4
{
  return [(LSBundleProxy *)self entitlementValueForKey:a3 ofClass:a4 valuesOfClass:0];
}

- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleType:(unint64_t)a5 bundleID:(id)a6 localizedName:(id)a7 bundleContainerURL:(id)a8 dataContainerURL:(id)a9 resourcesDirectoryURL:(id)a10 iconsDictionary:(id)a11 iconFileNames:(id)a12 version:(id)a13
{
  uint64_t v16 = *(void *)&a3;
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v86 = a6;
  id v85 = a7;
  id v17 = a8;
  id v92 = a9;
  uint64_t v18 = v16;
  id v19 = a10;
  v20 = (char *)a11;
  newValue = (char *)a12;
  id v84 = a13;
  if (v16)
  {
    if (a4)
    {
      v21 = a4;
      _LSDatabaseGetCacheGUID();
      id v91 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t SequenceNumber = _LSDatabaseGetSequenceNumber();
      uint64_t v23 = _LSBundleGet(a4->db, v18);
      v24 = v17;
      v25 = v86;
      if (v23)
      {
        uint64_t v26 = v23;
        uint64_t v77 = (uint64_t)v20;
        v80 = *(void **)(v23 + 280);
        unint64_t v27 = *(void *)(v23 + 172);
        if (*(_DWORD *)v23)
        {
          *(void *)buf = 0;
          unsigned int v28 = v18;
          id v29 = 0;
          if (!_LSBundleCopyNode(v21->db, v18, 0, 0, buf))
          {
            id v29 = [*(id *)buf URL];
          }

          unsigned int v30 = *(unsigned __int8 *)(v26 + 188);
          if (!v19 && v29)
          {
            id v29 = v29;
            id v19 = v29;
          }
        }
        else
        {
          unsigned int v28 = v18;
          id v29 = 0;
          unsigned int v30 = *(unsigned __int8 *)(v23 + 188);
        }
        id v73 = v29;
        v75 = v21;
        if (!v92)
        {
          if (*(_DWORD *)(v26 + 96)
            && ([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) == 0)
          {
            db = v21->db;
            int v48 = *(_DWORD *)(v26 + 96);
            id v107 = 0;
            v49 = _LSAliasCopyResolvedNode(db, v48, 0, 0, &v107);
            id v50 = v107;
            if (!v49)
            {
              v51 = _LSDefaultLog();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                uint64_t v72 = *(unsigned int *)(v26 + 96);
                *(_DWORD *)buf = 134218498;
                *(void *)&buf[4] = v72;
                __int16 v113 = 2048;
                unint64_t v114 = v28;
                __int16 v115 = 2112;
                uint64_t v116 = (uint64_t)v50;
                _os_log_error_impl(&dword_182959000, v51, OS_LOG_TYPE_ERROR, "Couldn't copy data container alias %lu for bundle %lu: %@", buf, 0x20u);
              }
            }
            objc_msgSend(v49, "URL", v73);
            id v92 = (id)objc_claimAutoreleasedReturnValue();

            v21 = v75;
          }
          else
          {
            id v92 = 0;
          }
        }
        v87 = v19;
        if (!v77)
        {
          uint64_t v77 = +[_LSLazyPropertyList lazyPropertyListWithContext:v21 unit:*(unsigned int *)(v26 + 452)];
        }
        uint64_t v76 = v26;
        if (!newValue)
        {
          if (*(_DWORD *)(v26 + 456))
          {
            v52 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
            uint64_t v100 = MEMORY[0x1E4F143A8];
            uint64_t v101 = 3221225472;
            v102 = __175__LSBundleProxy__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version___block_invoke;
            v103 = &unk_1E522D908;
            v106 = v21;
            id v53 = v52;
            id v104 = v53;
            id v105 = v86;
            _CSArrayEnumerateAllValues();
            if ([v53 count]) {
              newValue = (char *)v53;
            }
            else {
              newValue = 0;
            }

            v21 = v75;
            uint64_t v26 = v76;
          }
          else
          {
            newValue = 0;
          }
        }
        if (!v24)
        {
          int v54 = *(_DWORD *)(v26 + 504);
          if (v54)
          {
            v55 = _LSAliasCopyResolvedNode(v21->db, v54, 0, 0, 0);
            v24 = [v55 URL];

            uint64_t v26 = v76;
          }
          else
          {
            v24 = 0;
          }
        }
        v74 = v24;
        int v78 = (v30 >> 1) & 1;
        uint64_t v82 = *(void *)(v26 + 272);
        id v90 = (id)_CSStringCopyCFString();
        long long v56 = *(_OWORD *)(v26 + 76);
        v111[0] = *(_OWORD *)(v26 + 60);
        v111[1] = v56;
        _LSVersionNumberGetStringRepresentation(v111);
        id v89 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v79 = (v27 >> 38) & 1;
        id v88 = +[_LSLazyPropertyList lazyPropertyListWithContext:v21 unit:*(unsigned int *)(v26 + 136)];
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        v57 = _LSDatabaseGetStringArray(v21->db);
        uint64_t v58 = [v57 countByEnumeratingWithState:&v96 objects:v110 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          v34 = 0;
          uint64_t v60 = *(void *)v97;
          do
          {
            for (uint64_t i = 0; i != v59; ++i)
            {
              if (*(void *)v97 != v60) {
                objc_enumerationMutation(v57);
              }
              uint64_t v62 = *(void *)(*((void *)&v96 + 1) + 8 * i);
              v63 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v62];
              if (v63)
              {
                if (!v34)
                {
                  v34 = [MEMORY[0x1E4F1CA48] array];
                }
                objc_msgSend(v34, "addObject:", v63, v73);
              }
              else
              {
                v64 = _LSDefaultLog();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v62;
                  _os_log_impl(&dword_182959000, v64, OS_LOG_TYPE_DEFAULT, "Launch Services: Failed to create a UUID from invalid string %@", buf, 0xCu);
                }
              }
            }
            uint64_t v59 = [v57 countByEnumeratingWithState:&v96 objects:v110 count:16];
          }
          while (v59);
        }
        else
        {
          v34 = 0;
        }

        v35 = +[_LSLazyPropertyList lazyPropertyListWithContext:v75 unit:*(unsigned int *)(v76 + 140)];
        char v36 = 1;
        v37 = v85;
        v25 = v86;
        id v33 = v73;
        v24 = v74;
        v20 = (char *)v77;
      }
      else
      {
        v87 = v19;
        v46 = _LSDefaultLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v86;
          __int16 v113 = 2112;
          unint64_t v114 = (unint64_t)v91;
          __int16 v115 = 2048;
          uint64_t v116 = SequenceNumber;
          _os_log_error_impl(&dword_182959000, v46, OS_LOG_TYPE_ERROR, "LaunchServices: _LSBundleGet() failed, can't create LSBundleProxy for %@ {%@ %llu}", buf, 0x20u);
        }
        uint64_t v82 = SequenceNumber;

        LOBYTE(v79) = 0;
        v80 = 0;
        id v89 = 0;
        id v90 = 0;
        id v88 = 0;
        v34 = 0;
        v35 = 0;
        LOBYTE(v78) = 0;
        id v33 = 0;
        char v36 = 1;
        v37 = v85;
      }
    }
    else
    {
      v87 = v19;
      v38 = _LSDefaultLog();
      v37 = v85;
      v25 = v86;
      v24 = v17;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:](v18, v38, v39, v40, v41, v42, v43, v44);
      }

      id v90 = 0;
      id v91 = 0;
      uint64_t v82 = 0;
      LOBYTE(v79) = 0;
      v80 = 0;
      id v88 = 0;
      id v89 = 0;
      v34 = 0;
      v35 = 0;
      LOBYTE(v78) = 0;
      id v33 = 0;
      char v36 = 1;
    }
  }
  else
  {
    v31 = +[LSApplicationWorkspace defaultWorkspace];
    id v108 = 0;
    id v109 = 0;
    [v31 getKnowledgeUUID:&v109 andSequenceNumber:&v108];
    id v91 = v109;
    id v32 = v108;

    uint64_t v82 = [v32 unsignedLongLongValue];
    if (a5 == 6)
    {
      id v33 = v19;
      id v89 = 0;
      id v90 = 0;
      v87 = v33;
      id v88 = 0;
      v34 = 0;
      v35 = 0;
      LOBYTE(v78) = 0;
      LOBYTE(v79) = 1;
      v80 = 0;
      char v36 = 1;
      v37 = v85;
      v25 = v86;
      v24 = v17;
    }
    else
    {
      v87 = v19;
      v45 = _LSDefaultLog();
      v37 = v85;
      v25 = v86;
      v24 = v17;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v86;
        __int16 v113 = 2112;
        unint64_t v114 = (unint64_t)v91;
        __int16 v115 = 2048;
        uint64_t v116 = v82;
        _os_log_debug_impl(&dword_182959000, v45, OS_LOG_TYPE_DEBUG, "LaunchServices: failed to find bundle record for %@ {%@ %llu}", buf, 0x20u);
      }

      LOBYTE(v79) = 0;
      v80 = 0;
      id v89 = 0;
      id v90 = 0;
      id v88 = 0;
      v34 = 0;
      v35 = 0;
      char v36 = 0;
      LOBYTE(v78) = 0;
      id v33 = 0;
    }
  }
  v95.receiver = self;
  v95.super_class = (Class)LSBundleProxy;
  v65 = -[LSResourceProxy _initWithLocalizedName:](&v95, sel__initWithLocalizedName_, v37, v73);
  v66 = v65;
  if (v65)
  {
    objc_storeStrong(v65 + 6, a6);
    objc_storeStrong(v66 + 7, v33);
    objc_storeStrong(v66 + 8, v90);
    objc_storeStrong(v66 + 9, v24);
    *((unsigned char *)v66 + 40) = v36;
    objc_storeStrong(v66 + 10, a13);
    objc_storeStrong(v66 + 12, v91);
    v66[13] = (id)v82;
    *((unsigned char *)v66 + 41) = v79;
    id v67 = v66[4];
    v66[4] = 0;

    objc_storeStrong(v66 + 16, v88);
    objc_storeStrong(v66 + 14, v34);
    objc_storeStrong(v66 + 11, v89);
    objc_storeStrong(v66 + 17, v35);
    v66[15] = v80;
    if (IconServicesLibrary_frameworkLibrary_1
      || (IconServicesLibrary_frameworkLibrary_1 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
    {
      v68 = [v66 _boundIconInfo];
      [v68 setApplicationIdentifier:v25];
      -[_LSBoundIconInfo setContainerURL:]((uint64_t)v68, v24);
      -[_LSBoundIconInfo setDataContainerURL:]((uint64_t)v68, v92);
      [v68 setResourcesDirectoryURL:v87];
      -[_LSBoundIconInfo setIconsDictionary:](v68, v20);
      -[_LSBoundIconInfo setCacheKey:](v68, (char *)@"CFBundlePrimaryIcon");
      -[_LSBoundIconInfo setFileNames:](v68, newValue);
      -[_LSBoundIconInfo setPrerendered:]((uint64_t)v68, v78);
    }
  }
  v69 = v33;
  v70 = v66;

  return v70;
}

- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  id v9 = a3;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 752, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  v10 = [(LSBundleProxy *)self _entitlements];
  v11 = [v10 objectForKey:v9 checkingKeyClass:a4 checkingValueClass:a5];

  return v11;
}

- (_LSLazyPropertyList)_entitlements
{
  return self->__entitlements;
}

- (id)objectsForInfoDictionaryKeys:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 767, @"Invalid parameter not satisfying: %@", @"keys != nil" object file lineNumber description];
  }
  v6 = [LSBundleInfoCachedValues alloc];
  v7 = [(LSBundleProxy *)self _infoDictionary];
  v8 = [v7 uncheckedObjectsForKeys:v5];
  id v9 = [(LSBundleInfoCachedValues *)v6 _initWithKeys:v5 forDictionary:v8];

  return v9;
}

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  id v9 = a3;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 778, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  v10 = [(LSBundleProxy *)self _infoDictionary];
  v11 = [v10 objectForKey:v9 checkingKeyClass:a4 checkingValueClass:a5];

  return v11;
}

- (_LSLazyPropertyList)_infoDictionary
{
  return self->__infoDictionary;
}

+ (id)bundleProxyForCurrentProcess
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  v3 = [(id)current bundleIdentifier];
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 bundleIdentifier];

  if (!current) {
    goto LABEL_17;
  }
  if (([v3 isEqual:v5] & 1) == 0)
  {
    v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v3;
      __int16 v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "Current bundle's identifier changed from %@ to %@", buf, 0x16u);
    }

    v7 = (void *)current;
    current = 0;
  }
  v8 = (void *)current;
  if (!current)
  {
LABEL_17:
    if (_LSCurrentProcessMayMapDatabase())
    {
      id v9 = +[LSBundleRecord bundleRecordForCurrentProcess];
      uint64_t v10 = [v9 compatibilityObject];
      v11 = (void *)current;
      current = v10;
    }
    else
    {
      id v9 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_16);
      [v9 getBundleProxyForCurrentProcessWithCompletionHandler:&__block_literal_global_20];
    }

    v8 = (void *)current;
    if (current)
    {
      dispatch_time_t v12 = dispatch_time(0, 5000000000);
      v13 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_21;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_after(v12, v13, block);

      v8 = (void *)current;
    }
  }
  id v14 = v8;

  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);

  return v14;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setSDKVersion:(id)a3
{
}

- (void)setMachOUUIDs:(id)a3
{
}

- (void)_setInfoDictionary:(id)a3
{
}

- (void)_setEntitlements:(id)a3
{
}

+ (BOOL)canInstantiateFromDatabase
{
  int MayMapDatabase = _LSCurrentProcessMayMapDatabase();
  if (MayMapDatabase) {
    LOBYTE(MayMapDatabase) = !+[_LSQueryContext simulateLimitedMappingForXCTests];
  }
  return MayMapDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__environmentVariables, 0);
  objc_storeStrong((id *)&self->__entitlements, 0);
  objc_storeStrong((id *)&self->__infoDictionary, 0);
  objc_storeStrong((id *)&self->_machOUUIDs, 0);
  objc_storeStrong((id *)&self->_cacheGUID, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleContainerURL, 0);
  objc_storeStrong((id *)&self->_bundleExecutable, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_localizedShortName, 0);
}

+ (id)bundleProxyForIdentifier:(id)a3
{
  v4 = (__CFString *)a3;
  if (![a1 canInstantiateFromDatabase])
  {
    id v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
    goto LABEL_11;
  }
  uint64_t v10 = 0;
  if (!_LSContextInit(&v10))
  {
    uint64_t v6 = _LSFindBundleWithInfo_NoIOFiltered(&v10, 1uLL, v4, 0, 0, 0, 0, 0, 0);
    unsigned int v9 = v6;
    if (v6
      || (v6 = _LSFindBundleWithInfo_NoIOFiltered(&v10, 3uLL, v4, 0, 0, 0, 0, 0, 0), (unsigned int v9 = v6) != 0))
    {
      uint64_t v7 = +[LSApplicationProxy applicationProxyWithBundleUnitID:v6 withContext:&v10];
    }
    else
    {
      unsigned int v9 = _LSFindBundleWithInfo_NoIOFiltered(&v10, 5uLL, v4, 0, 0, 0, 0, 0, 0);
      if (v9)
      {
        uint64_t v7 = +[LSVPNPluginProxy VPNPluginProxyForIdentifier:v4 withContext:&v10];
      }
      else
      {
        if (!_LSPluginFindWithInfo(v10, 0, v4, 3, 0, &v9, 0))
        {
          id v5 = 0;
          goto LABEL_9;
        }
        uint64_t v7 = +[LSPlugInKitProxy plugInKitProxyForPlugin:v9 withContext:&v10];
      }
    }
    id v5 = (void *)v7;
LABEL_9:
    _LSContextDestroy(&v10);
    goto LABEL_10;
  }
  id v5 = 0;
LABEL_10:

LABEL_11:

  return v5;
}

- (NSString)canonicalExecutablePath
{
  v3 = [(LSBundleProxy *)self bundleExecutable];

  if (v3)
  {
    v4 = [(LSBundleProxy *)self bundleURL];

    if (v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
      uint64_t v6 = [(LSBundleProxy *)self bundleExecutable];
      uint64_t v7 = [(LSBundleProxy *)self bundleURL];
      v8 = [v7 URLByResolvingSymlinksInPath];
      unsigned int v9 = (void *)[v5 initFileURLWithPath:v6 isDirectory:0 relativeToURL:v8];
      uint64_t v10 = [v9 path];

      goto LABEL_9;
    }
    v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LSBundleProxy canonicalExecutablePath]();
    }
  }
  else
  {
    v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LSBundleProxy canonicalExecutablePath]();
    }
  }

  uint64_t v10 = 0;
LABEL_9:

  return (NSString *)v10;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleExecutable
{
  return self->_bundleExecutable;
}

- (id)localizedName
{
  os_unfair_lock_lock(&localizedNameLock);
  v6.receiver = self;
  v6.super_class = (Class)LSBundleProxy;
  v3 = [(LSResourceProxy *)&v6 localizedName];
  os_unfair_lock_unlock(&localizedNameLock);
  if (!v3)
  {
    v3 = [(LSBundleProxy *)self _localizedNameWithPreferredLocalizations:0 useShortNameOnly:0];
    if (v3)
    {
      os_unfair_lock_lock(&localizedNameLock);
      v4 = (void *)[v3 copy];
      [(LSResourceProxy *)self _setLocalizedName:v4];

      os_unfair_lock_unlock(&localizedNameLock);
    }
  }

  return v3;
}

- (BOOL)foundBackingBundle
{
  return self->_foundBackingBundle;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

+ (id)bundleProxyForURL:(id)a3
{
  return (id)[a1 bundleProxyForURL:a3 error:0];
}

+ (id)bundleProxyForURL:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a1 canInstantiateFromDatabase])
  {
    v13 = 0;
    if (!_LSContextInitReturningError(&v13, a4))
    {
      v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v7 = _LSFindBundleWithInfo_NoIOFiltered(&v13, 0, 0, 0, v6, 0, 0, 0, a4);
    if (v7)
    {
      v8 = +[LSApplicationProxy applicationProxyWithBundleUnitID:v7 withContext:&v13];
LABEL_17:
      _LSContextDestroy(&v13);
      goto LABEL_18;
    }
    unsigned int v9 = [[FSNode alloc] initWithURL:v6 flags:0 error:a4];
    if (v9)
    {
      unsigned int v12 = 0;
      if (_LSPluginFindWithInfo(v13, 0, 0, 0, v9, &v12, a4))
      {
        v8 = +[LSPlugInKitProxy plugInKitProxyForPlugin:v12 withContext:&v13];
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v10 = _LSDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_182959000, v10, OS_LOG_TYPE_DEFAULT, "no registered bundle with URL %@", buf, 0xCu);
      }
    }
    v8 = 0;
    goto LABEL_16;
  }
  __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
  __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"+[LSBundleProxy bundleProxyForURL:error:]", 291, 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_19:

  return v8;
}

+ (void)clearBundleProxyForCurrentProcess
{
  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  v2 = (void *)current;
  current = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_cold_1();
  }
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&current, a2);
  }
  else
  {
    uint64_t v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_cold_1();
    }
  }
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_21(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x18530F680]();
  [*(id *)(a1 + 32) clearBundleProxyForCurrentProcess];
}

+ (LSBundleProxy)bundleProxyWithAuditToken:(id *)a3 error:(id *)a4
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v4;
  id v5 = +[LSBundleRecord bundleRecordForAuditToken:v8 error:a4];
  id v6 = [v5 compatibilityObject];

  return (LSBundleProxy *)v6;
}

void __175__LSBundleProxy__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)_CSStringCopyCFString();
  if (v2)
  {
    [*(id *)(a1 + 32) addObject:v2];
  }
  else
  {
    v3 = _LSDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "Invaid icon file name saved for app %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSBundleProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)LSBundleProxy;
  int v5 = [(LSResourceProxy *)&v29 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleURL");
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v8;

    uint64_t v10 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleVersion");
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleExecutable");
    bundleExecutable = v5->_bundleExecutable;
    v5->_bundleExecutable = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleContainerURL");
    bundleContainerURL = v5->_bundleContainerURL;
    v5->_bundleContainerURL = (NSURL *)v14;

    v5->_sequenceNumber = [v4 decodeInt64ForKey:@"sequenceNumber"];
    v5->_compatibilityState = [v4 decodeInt64ForKey:@"compatibilityState"];
    v5->_foundBackingBundle = [v4 decodeBoolForKey:@"foundBundle"];
    uint64_t v16 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"cacheGUID");
    cacheGUID = v5->_cacheGUID;
    v5->_cacheGUID = (NSUUID *)v16;

    v5->_containerized = [v4 decodeBoolForKey:@"isContainerized"];
    uint64_t v18 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"localizedShortName");
    localizedShortName = v5->_localizedShortName;
    v5->_localizedShortName = (NSString *)v18;

    uint64_t v20 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"infoDictionary");
    infoDictionary = v5->__infoDictionary;
    v5->__infoDictionary = (_LSLazyPropertyList *)v20;

    uint64_t v22 = objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), @"machOUUIDs");
    machOUUIDs = v5->_machOUUIDs;
    v5->_machOUUIDs = (NSArray *)v22;

    uint64_t v24 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"sdkVersion");
    sdkVersion = v5->_sdkVersion;
    v5->_sdkVersion = (NSString *)v24;

    uint64_t v26 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"entitlements");
    entitlements = v5->__entitlements;
    v5->__entitlements = (_LSLazyPropertyList *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LSBundleProxy;
  id v4 = a3;
  [(LSResourceProxy *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, @"bundleIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_bundleURL forKey:@"bundleURL"];
  [v4 encodeObject:self->_bundleVersion forKey:@"bundleVersion"];
  [v4 encodeObject:self->_bundleExecutable forKey:@"bundleExecutable"];
  [v4 encodeObject:self->_bundleContainerURL forKey:@"bundleContainerURL"];
  [v4 encodeInt64:self->_sequenceNumber forKey:@"sequenceNumber"];
  [v4 encodeInt64:self->_compatibilityState forKey:@"compatibilityState"];
  [v4 encodeBool:self->_foundBackingBundle forKey:@"foundBundle"];
  [v4 encodeObject:self->_cacheGUID forKey:@"cacheGUID"];
  [v4 encodeBool:self->_containerized forKey:@"isContainerized"];
  [v4 encodeObject:self->_localizedShortName forKey:@"localizedShortName"];
  [v4 encodeObject:self->__infoDictionary forKey:@"infoDictionary"];
  [v4 encodeObject:self->_machOUUIDs forKey:@"machOUUIDs"];
  [v4 encodeObject:self->_sdkVersion forKey:@"sdkVersion"];
  [v4 encodeObject:self->__entitlements forKey:@"entitlements"];
}

- (NSString)bundleType
{
  return 0;
}

- (NSURL)containerURL
{
  v3 = [(LSBundleProxy *)self dataContainerURL];

  if (v3)
  {
    id v4 = [(LSBundleProxy *)self dataContainerURL];
  }
  else
  {
    objc_super v5 = [(LSBundleProxy *)self bundleURL];
    uint64_t v6 = [(LSBundleProxy *)self bundleIdentifier];
    uint64_t v7 = [v5 path];
    if (([v7 hasPrefix:@"/var/mobile/Applications/"] & 1) != 0
      || [v7 hasPrefix:@"/private/var/mobile/Applications/"])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CB10]);
      unsigned int v9 = [v7 stringByDeletingLastPathComponent];
      id v4 = (void *)[v8 initFileURLWithPath:v9 isDirectory:1];
    }
    else
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/var/mobile/" isDirectory:1];
    }
  }

  return (NSURL *)v4;
}

- (id)_managedPersonas
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)_usesSystemPersona
{
  return 0;
}

- (BOOL)_hasAssociatedPersonas
{
  id v2 = [(LSBundleProxy *)self _managedPersonas];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSURL)dataContainerURL
{
  return 0;
}

- (id)appStoreReceiptName
{
  if ([(LSBundleProxy *)self profileValidated]) {
    return @"sandboxReceipt";
  }
  else {
    return @"receipt";
  }
}

- (NSURL)appStoreReceiptURL
{
  BOOL v3 = [(LSBundleProxy *)self dataContainerURL];
  id v4 = [v3 URLByAppendingPathComponent:@"StoreKit" isDirectory:1];

  if (v4)
  {
    objc_super v5 = [(LSBundleProxy *)self appStoreReceiptName];
    uint64_t v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSURL *)v6;
}

- (NSDictionary)environmentVariables
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (NSString)signerIdentity
{
  return 0;
}

- (NSString)signerOrganization
{
  return 0;
}

- (NSDictionary)entitlements
{
  id v2 = [(LSBundleProxy *)self _entitlements];
  BOOL v3 = -[_LSLazyPropertyList propertyList](v2);

  return (NSDictionary *)v3;
}

- (id)entitlementValuesForKeys:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 740, @"Invalid parameter not satisfying: %@", @"keys != nil" object file lineNumber description];
  }
  uint64_t v6 = [LSBundleInfoCachedValues alloc];
  uint64_t v7 = [(LSBundleProxy *)self _entitlements];
  id v8 = [v7 uncheckedObjectsForKeys:v5];
  id v9 = [(LSBundleInfoCachedValues *)v6 _initWithKeys:v5 forDictionary:v8];

  return v9;
}

- (NSDictionary)groupContainerURLs
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (id)_stringLocalizerForTable:(id)a3
{
  id v4 = a3;
  id v5 = [_LSStringLocalizer alloc];
  uint64_t v6 = [(LSBundleProxy *)self bundleURL];
  uint64_t v7 = [(_LSStringLocalizer *)v5 initWithBundleURL:v6 stringsFile:v4];

  return v7;
}

- (id)localizedValuesForKeys:(id)a3 fromTable:(id)a4
{
  id v7 = a3;
  id v8 = (__CFString *)a4;
  if (!v7)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 793, @"Invalid parameter not satisfying: %@", @"keys != nil" object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x18530F680]();
  uint64_t v10 = [(LSBundleProxy *)self bundleURL];
  BOOL v11 = +[FSNode canReadURL:v10 fromSandboxWithAuditToken:0];

  id v12 = 0;
  if (v11)
  {
    if (v8) {
      v13 = v8;
    }
    else {
      v13 = @"InfoPlist";
    }
    uint64_t v14 = [(LSBundleProxy *)self _stringLocalizerForTable:v13];
    id v15 = [v14 localizedStringsWithStrings:v7 preferredLocalizations:0];
    if (v15) {
      id v12 = [[LSBundleInfoCachedValues alloc] _initWithKeys:v7 forDictionary:v15];
    }
    else {
      id v12 = 0;
    }
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LSBundleProxy *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    id v7 = [(LSBundleProxy *)v6 bundleType];
    id v8 = [(LSBundleProxy *)self bundleType];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      uint64_t v10 = [(LSBundleProxy *)self _valueForEqualityTesting];
      BOOL v11 = [(LSBundleProxy *)v6 _valueForEqualityTesting];
      char v12 = [v10 isEqual:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  id v2 = [(LSBundleProxy *)self _valueForEqualityTesting];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSURL)bundleContainerURL
{
  return self->_bundleContainerURL;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (BOOL)isContainerized
{
  return self->_containerized;
}

- (NSUUID)cacheGUID
{
  return self->_cacheGUID;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSArray)machOUUIDs
{
  return self->_machOUUIDs;
}

- (unint64_t)compatibilityState
{
  return self->_compatibilityState;
}

- (void)_setCompatibilityState:(unint64_t)a3
{
  self->_compatibilityState = a3;
}

- (_LSLazyPropertyList)_environmentVariables
{
  return self->__environmentVariables;
}

- (void)_setEnvironmentVariables:(id)a3
{
}

- (NSString)localizedShortName
{
  os_unfair_lock_lock(&localizedNameLock);
  unint64_t v3 = self->_localizedShortName;
  os_unfair_lock_unlock(&localizedNameLock);
  if (!v3)
  {
    unint64_t v3 = [(LSBundleProxy *)self _localizedNameWithPreferredLocalizations:0 useShortNameOnly:1];
    if (v3)
    {
      os_unfair_lock_lock(&localizedNameLock);
      id v4 = (NSString *)[(NSString *)v3 copy];
      localizedShortName = self->_localizedShortName;
      self->_localizedShortName = v4;

      os_unfair_lock_unlock(&localizedNameLock);
    }
  }

  return v3;
}

- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4
{
  return 0;
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Failed to get bundle proxy for current process: %@", v2, v3, v4, v5, v6);
}

- (void)_initWithBundleUnit:(uint64_t)a3 context:(uint64_t)a4 bundleType:(uint64_t)a5 bundleID:(uint64_t)a6 localizedName:(uint64_t)a7 bundleContainerURL:(uint64_t)a8 dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)canonicalExecutablePath
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Cannot generate canonicalExecutablePath for app %@ with no bundleURL set", v2, v3, v4, v5, v6);
}

@end