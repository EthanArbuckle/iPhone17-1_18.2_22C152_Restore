@interface ACCPluginManager
- (ACCPluginManager)init;
- (BOOL)allowDuplicateClassTypes;
- (NSMutableSet)pluginBundleSearchPathsMutable;
- (NSMutableSet)pluginBundlesMutable;
- (NSMutableSet)pluginInstancesMutable;
- (NSSet)pluginBundleSearchPaths;
- (NSSet)pluginBundles;
- (NSSet)pluginInstances;
- (id)initClass:(Class)a3;
- (id)pluginInstancesWithClasses:(id)a3;
- (id)pluginInstancesWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)addBundleSearchPath:(id)a3 recursive:(BOOL)a4;
- (unint64_t)addBundleSearchPathsForDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 subpath:(id)a5 recursive:(BOOL)a6;
- (unint64_t)initAllPlugIns;
- (unint64_t)initPlugInsWithBundleNames:(id)a3;
- (unint64_t)initPlugInsWithBundleNames:(id)a3 orClasses:(id)a4 orProtocols:(id)a5 matchAny:(BOOL)a6;
- (unint64_t)initPlugInsWithClasses:(id)a3;
- (unint64_t)initPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)loadAllBundles;
- (unint64_t)loadBundlesWithClasses:(id)a3;
- (unint64_t)loadBundlesWithClasses:(id)a3 orProtocols:(id)a4 matchAny:(BOOL)a5;
- (unint64_t)loadBundlesWithExtension:(id)a3;
- (unint64_t)loadBundlesWithExtension:(id)a3 andClasses:(id)a4;
- (unint64_t)loadBundlesWithExtension:(id)a3 andClasses:(id)a4 orProtocols:(id)a5 matchAny:(BOOL)a6;
- (unint64_t)loadBundlesWithExtension:(id)a3 andNames:(id)a4;
- (unint64_t)loadBundlesWithExtension:(id)a3 andProtocols:(id)a4 matchAny:(BOOL)a5;
- (unint64_t)loadBundlesWithIdentifiers:(id)a3;
- (unint64_t)loadBundlesWithNames:(id)a3;
- (unint64_t)loadBundlesWithPaths:(id)a3;
- (unint64_t)loadBundlesWithPaths:(id)a3 andIdentifiers:(id)a4 orClasses:(id)a5 orProtocols:(id)a6 matchAny:(BOOL)a7;
- (unint64_t)loadBundlesWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)removeAllBundleSearchPaths;
- (unint64_t)removeAllBundles;
- (unint64_t)removeAllPlugIns;
- (unint64_t)removeBundleSearchPath:(id)a3;
- (unint64_t)removePlugIns:(id)a3;
- (unint64_t)removePlugInsWithClasses:(id)a3;
- (unint64_t)removePlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)startAllPlugIns;
- (unint64_t)startPlugIns:(id)a3;
- (unint64_t)startPlugInsWithClasses:(id)a3;
- (unint64_t)startPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)stopAllPlugIns;
- (unint64_t)stopPlugIns:(id)a3;
- (unint64_t)stopPlugInsWithClasses:(id)a3;
- (unint64_t)stopPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (void)setAllowDuplicateClassTypes:(BOOL)a3;
- (void)setPluginBundleSearchPathsMutable:(id)a3;
- (void)setPluginBundlesMutable:(id)a3;
- (void)setPluginInstancesMutable:(id)a3;
@end

@implementation ACCPluginManager

- (ACCPluginManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACCPluginManager;
  v2 = [(ACCPluginManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pluginBundleSearchPathsMutable = v2->_pluginBundleSearchPathsMutable;
    v2->_pluginBundleSearchPathsMutable = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pluginBundlesMutable = v2->_pluginBundlesMutable;
    v2->_pluginBundlesMutable = v5;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pluginInstancesMutable = v2->_pluginInstancesMutable;
    v2->_pluginInstancesMutable = v7;

    v2->_allowDuplicateClassTypes = 0;
  }
  return v2;
}

- (unint64_t)addBundleSearchPath:(id)a3 recursive:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  v8 = +[PathEntry entryWithPath:v6 recursive:v4];

  [v7 addObject:v8];
  return 1;
}

- (unint64_t)addBundleSearchPathsForDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 subpath:(id)a5 recursive:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  NSSearchPathForDirectoriesInDomains((NSSearchPathDirectory)a3, a4, 1);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v24;
    do
    {
      unint64_t v21 = v13;
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v17 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
        v18 = [v16 stringByAppendingPathComponent:v10];
        v19 = +[PathEntry entryWithPath:v18 recursive:v6];
        [v17 addObject:v19];
      }
      unint64_t v13 = (unint64_t)v12 + v21;
      id v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (unint64_t)removeBundleSearchPath:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(ACCPluginManager *)self pluginBundleSearchPaths];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 path];
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          uint64_t v14 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
          [v14 removeObject:v11];

          ++v8;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)removeAllBundleSearchPaths
{
  v3 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  id v4 = [v3 count];

  v5 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  [v5 removeAllObjects];

  return (unint64_t)v4;
}

- (unint64_t)loadAllBundles
{
  v3 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  id v4 = +[PathEntry bundlePathsWithinEntries:v3];
  unint64_t v5 = [(ACCPluginManager *)self loadBundlesWithPaths:v4];

  return v5;
}

- (unint64_t)loadBundlesWithExtension:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  id v6 = +[PathEntry bundlePathsWithinEntries:v5 withExtension:v4];

  unint64_t v7 = [(ACCPluginManager *)self loadBundlesWithPaths:v6];
  return v7;
}

- (unint64_t)loadBundlesWithExtension:(id)a3 andNames:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  uint64_t v9 = +[PathEntry bundlePathsWithinEntries:v8 withExtension:v7 andNames:v6];

  unint64_t v10 = [(ACCPluginManager *)self loadBundlesWithPaths:v9];
  return v10;
}

- (unint64_t)loadBundlesWithExtension:(id)a3 andClasses:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  uint64_t v9 = +[PathEntry bundlePathsWithinEntries:v8 withExtension:v7];

  unint64_t v10 = [(ACCPluginManager *)self loadBundlesWithPaths:v9 andIdentifiers:0 orClasses:v6 orProtocols:0 matchAny:1];
  return v10;
}

- (unint64_t)loadBundlesWithExtension:(id)a3 andProtocols:(id)a4 matchAny:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  id v11 = +[PathEntry bundlePathsWithinEntries:v10 withExtension:v9];

  unint64_t v12 = [(ACCPluginManager *)self loadBundlesWithPaths:v11 andIdentifiers:0 orClasses:0 orProtocols:v8 matchAny:v5];
  return v12;
}

- (unint64_t)loadBundlesWithExtension:(id)a3 andClasses:(id)a4 orProtocols:(id)a5 matchAny:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unsigned int v13 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  uint64_t v14 = +[PathEntry bundlePathsWithinEntries:v13 withExtension:v12];

  unint64_t v15 = [(ACCPluginManager *)self loadBundlesWithPaths:v14 andIdentifiers:0 orClasses:v11 orProtocols:v10 matchAny:v6];
  return v15;
}

- (unint64_t)loadBundlesWithNames:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  BOOL v6 = +[PathEntry bundlePathsWithinEntries:v5 withExtension:0 andNames:v4];

  unint64_t v7 = [(ACCPluginManager *)self loadBundlesWithPaths:v6];
  return v7;
}

- (unint64_t)loadBundlesWithIdentifiers:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  BOOL v6 = +[PathEntry bundlePathsWithinEntries:v5];
  unint64_t v7 = [(ACCPluginManager *)self loadBundlesWithPaths:v6 andIdentifiers:v4 orClasses:0 orProtocols:0 matchAny:1];

  return v7;
}

- (unint64_t)loadBundlesWithClasses:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  BOOL v6 = +[PathEntry bundlePathsWithinEntries:v5];
  unint64_t v7 = [(ACCPluginManager *)self loadBundlesWithPaths:v6 andIdentifiers:0 orClasses:v4 orProtocols:0 matchAny:1];

  return v7;
}

- (unint64_t)loadBundlesWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  id v8 = +[PathEntry bundlePathsWithinEntries:v7];
  unint64_t v9 = [(ACCPluginManager *)self loadBundlesWithPaths:v8 andIdentifiers:0 orClasses:0 orProtocols:v6 matchAny:v4];

  return v9;
}

- (unint64_t)loadBundlesWithClasses:(id)a3 orProtocols:(id)a4 matchAny:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  id v11 = +[PathEntry bundlePathsWithinEntries:v10];
  unint64_t v12 = [(ACCPluginManager *)self loadBundlesWithPaths:v11 andIdentifiers:0 orClasses:v9 orProtocols:v8 matchAny:v5];

  return v12;
}

- (unint64_t)loadBundlesWithPaths:(id)a3
{
  return [(ACCPluginManager *)self loadBundlesWithPaths:a3 andIdentifiers:0 orClasses:0 orProtocols:0 matchAny:1];
}

- (unint64_t)loadBundlesWithPaths:(id)a3 andIdentifiers:(id)a4 orClasses:(id)a5 orProtocols:(id)a6 matchAny:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v55 = a6;
  v51 = self;
  unint64_t v15 = [(ACCPluginManager *)self pluginBundlesMutable];
  long long v16 = [v15 count];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v12;
  id v54 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v54)
  {
    long long v18 = 0;
    uint64_t v53 = *(void *)v66;
    v48 = v16;
    p_info = &@"IAPAppAccessoryOOBBTPairingCompletionMACAddressKey".info;
    *(void *)&long long v17 = 138412802;
    long long v47 = v17;
    id v49 = v13;
    id v50 = v14;
    while (1)
    {
      v20 = 0;
      do
      {
        unint64_t v21 = v18;
        if (*(void *)v66 != v53) {
          objc_enumerationMutation(obj);
        }
        long long v18 = +[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", *(void *)(*((void *)&v65 + 1) + 8 * (void)v20), v47);

        if (v18)
        {
          [v18 load];
          if ([v18 isLoaded])
          {
            id v22 = [v18 principalClass];
            if (![v22 conformsToProtocol:p_info[446]]) {
              goto LABEL_47;
            }
            long long v23 = (void *)p_info[446];
            id v64 = 0;
            char v24 = classImplementsMethodsInProtocol(v22, v23, 1, 1, &v64);
            id v25 = v64;
            if (v24)
            {
              if (!v13
                || ![v13 count]
                || ([v18 bundleIdentifier],
                    long long v26 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v27 = [v13 containsObject:v26],
                    v26,
                    v27))
              {
                if (v14 && [v14 count])
                {
                  long long v62 = 0u;
                  long long v63 = 0u;
                  long long v60 = 0u;
                  long long v61 = 0u;
                  id v28 = v14;
                  id v29 = [v28 countByEnumeratingWithState:&v60 objects:v70 count:16];
                  if (v29)
                  {
                    id v30 = v29;
                    uint64_t v31 = *(void *)v61;
                    while (2)
                    {
                      for (i = 0; i != v30; i = (char *)i + 1)
                      {
                        if (*(void *)v61 != v31) {
                          objc_enumerationMutation(v28);
                        }
                        Class v33 = NSClassFromString(*(NSString **)(*((void *)&v60 + 1) + 8 * i));
                        if (v33 && [v22 isSubclassOfClass:v33])
                        {

                          id v14 = v50;
                          goto LABEL_26;
                        }
                      }
                      id v30 = [v28 countByEnumeratingWithState:&v60 objects:v70 count:16];
                      if (v30) {
                        continue;
                      }
                      break;
                    }

                    id v14 = v50;
                    goto LABEL_46;
                  }
LABEL_45:
                }
                else
                {
LABEL_26:
                  if (!v55 || ![v55 count]) {
                    goto LABEL_44;
                  }
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v56 = 0u;
                  long long v57 = 0u;
                  id v34 = v55;
                  id v35 = [v34 countByEnumeratingWithState:&v56 objects:v69 count:16];
                  if (v35)
                  {
                    id v36 = v35;
                    v37 = 0;
                    uint64_t v38 = *(void *)v57;
LABEL_30:
                    uint64_t v39 = 0;
                    while (1)
                    {
                      if (*(void *)v57 != v38) {
                        objc_enumerationMutation(v34);
                      }
                      if ([v22 conformsToProtocol:*(void *)(*((void *)&v56 + 1) + 8 * v39)])
                      {
                        ++v37;
                        if (a7) {
                          break;
                        }
                      }
                      if (v36 == (id)++v39)
                      {
                        id v36 = [v34 countByEnumeratingWithState:&v56 objects:v69 count:16];
                        if (v36) {
                          goto LABEL_30;
                        }
                        break;
                      }
                    }
                  }
                  else
                  {
                    v37 = 0;
                  }

                  v40 = (char *)[v34 count];
                  BOOL v41 = v37 && a7;
                  id v13 = v49;
                  id v14 = v50;
                  if (v41 || v37 == v40)
                  {
LABEL_44:
                    id v28 = [(ACCPluginManager *)v51 pluginBundlesMutable];
                    [v28 addObject:v18];
                    goto LABEL_45;
                  }
                }
              }
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              NSStringFromClass((Class)v22);
              id v28 = (id)objc_claimAutoreleasedReturnValue();
              v42 = [v18 bundlePath];
              *(_DWORD *)buf = v47;
              id v72 = v28;
              __int16 v73 = 2112;
              v74 = v42;
              __int16 v75 = 2112;
              id v76 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Class '%@' in bundle '%@' is missing implementation(s) for the following instance method(s):\n%@", buf, 0x20u);

              goto LABEL_45;
            }
LABEL_46:

            p_info = (void *)(@"IAPAppAccessoryOOBBTPairingCompletionMACAddressKey" + 8);
            goto LABEL_47;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[ACCPluginManager loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:](v77, v18, &v78);
          }
        }
LABEL_47:
        v20 = (char *)v20 + 1;
      }
      while (v20 != v54);
      id v43 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
      id v54 = v43;
      if (!v43)
      {

        long long v16 = v48;
        break;
      }
    }
  }

  v44 = [(ACCPluginManager *)v51 pluginBundlesMutable];
  v45 = [v44 count];

  return v45 - v16;
}

- (unint64_t)removeAllBundles
{
  v3 = [(ACCPluginManager *)self pluginBundlesMutable];
  id v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  [(ACCPluginManager *)self removeAllPlugIns];
  BOOL v5 = [(ACCPluginManager *)self pluginBundlesMutable];
  id v6 = [v5 count];

  unint64_t v7 = [(ACCPluginManager *)self pluginBundlesMutable];
  [v7 removeAllObjects];

  return (unint64_t)v6;
}

- (unint64_t)initAllPlugIns
{
  return [(ACCPluginManager *)self initPlugInsWithBundleNames:0 orClasses:0 orProtocols:0 matchAny:1];
}

- (unint64_t)initPlugInsWithClasses:(id)a3
{
  return [(ACCPluginManager *)self initPlugInsWithBundleNames:0 orClasses:a3 orProtocols:0 matchAny:1];
}

- (unint64_t)initPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  return [(ACCPluginManager *)self initPlugInsWithBundleNames:0 orClasses:0 orProtocols:a3 matchAny:a4];
}

- (unint64_t)initPlugInsWithBundleNames:(id)a3
{
  return [(ACCPluginManager *)self initPlugInsWithBundleNames:a3 orClasses:0 orProtocols:0 matchAny:1];
}

- (unint64_t)initPlugInsWithBundleNames:(id)a3 orClasses:(id)a4 orProtocols:(id)a5 matchAny:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(ACCPluginManager *)self pluginBundlesMutable];

  if (v13)
  {
    BOOL v58 = (!v10 || ![v10 count])
       && (!v11 || ![v11 count])
       && (!v12 || ![v12 count]);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = [(ACCPluginManager *)self pluginBundlesMutable];
    id v59 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
    if (!v59)
    {
      long long v61 = 0;
      unint64_t v54 = 0;
      goto LABEL_78;
    }
    long long v61 = 0;
    unint64_t v54 = 0;
    uint64_t v55 = *(void *)v78;
    id v53 = v11;
    long long v60 = self;
    id v51 = v10;
    long long v57 = v12;
    BOOL v56 = v6;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v78 != v55) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v77 + 1) + 8 * v15);
        uint64_t v62 = v15;
        id v63 = [v16 principalClass];
        if (v10 && [v10 count])
        {
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          id v17 = v10;
          id v18 = [v17 countByEnumeratingWithState:&v73 objects:v83 count:16];
          if (v18)
          {
            id v19 = v18;
            char v20 = 0;
            uint64_t v21 = *(void *)v74;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v74 != v21) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v23 = *(void *)(*((void *)&v73 + 1) + 8 * i);
                char v24 = [v16 bundlePath];
                id v25 = [v24 lastPathComponent];
                long long v26 = [v25 stringByDeletingPathExtension];
                LODWORD(v23) = [v26 isEqualToString:v23];

                if (v23) {
                  char v20 = 1;
                }
              }
              id v19 = [v17 countByEnumeratingWithState:&v73 objects:v83 count:16];
            }
            while (v19);
          }
          else
          {
            char v20 = 0;
          }

          int v27 = v20 & 1;
          id v10 = v51;
          id v11 = v53;
          self = v60;
          if (!v53)
          {
LABEL_44:
            int v35 = 0;
            goto LABEL_47;
          }
        }
        else
        {
          int v27 = 0;
          if (!v11) {
            goto LABEL_44;
          }
        }
        if (![v11 count]) {
          goto LABEL_44;
        }
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v28 = v11;
        id v29 = [v28 countByEnumeratingWithState:&v69 objects:v82 count:16];
        if (v29)
        {
          id v30 = v29;
          char v31 = 0;
          uint64_t v32 = *(void *)v70;
          do
          {
            for (j = 0; j != v30; j = (char *)j + 1)
            {
              if (*(void *)v70 != v32) {
                objc_enumerationMutation(v28);
              }
              Class v34 = NSClassFromString(*(NSString **)(*((void *)&v69 + 1) + 8 * (void)j));
              if (v34 && objc_msgSend(objc_msgSend(v16, "principalClass"), "isSubclassOfClass:", v34)) {
                char v31 = 1;
              }
            }
            id v30 = [v28 countByEnumeratingWithState:&v69 objects:v82 count:16];
          }
          while (v30);
        }
        else
        {
          char v31 = 0;
        }

        int v35 = v31 & 1;
        self = v60;
LABEL_47:
        id v12 = v57;
        if (v57 && [v57 count])
        {
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v36 = v57;
          id v37 = [v36 countByEnumeratingWithState:&v65 objects:v81 count:16];
          if (v37)
          {
            id v38 = v37;
            uint64_t v39 = 0;
            uint64_t v40 = *(void *)v66;
LABEL_51:
            uint64_t v41 = 0;
            while (1)
            {
              if (*(void *)v66 != v40) {
                objc_enumerationMutation(v36);
              }
              if ([v63 conformsToProtocol:*(void *)(*((void *)&v65 + 1) + 8 * v41)])
              {
                ++v39;
                if (v56) {
                  break;
                }
              }
              if (v38 == (id)++v41)
              {
                id v38 = [v36 countByEnumeratingWithState:&v65 objects:v81 count:16];
                if (v38) {
                  goto LABEL_51;
                }
                break;
              }
            }
          }
          else
          {
            uint64_t v39 = 0;
          }

          id v43 = (char *)[v36 count];
          if (v39) {
            int v42 = v56;
          }
          else {
            int v42 = 0;
          }
          if (v39 == v43) {
            int v42 = 1;
          }
          id v11 = v53;
          self = v60;
        }
        else
        {
          int v42 = 0;
        }
        if (((v58 | v27 | v35) & 1) != 0 || v42)
        {
          if ([(ACCPluginManager *)self allowDuplicateClassTypes]) {
            goto LABEL_71;
          }
          v44 = [(ACCPluginManager *)self pluginInstancesMutable];
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = __78__ACCPluginManager_initPlugInsWithBundleNames_orClasses_orProtocols_matchAny___block_invoke;
          v64[3] = &__block_descriptor_40_e33_B24__0___ACCPluginProtocol__8_B16lu32l8;
          v64[4] = v63;
          v45 = [v44 objectsPassingTest:v64];
          id v46 = [v45 count];

          if (!v46)
          {
LABEL_71:
            long long v47 = self;
            id v48 = [(ACCPluginManager *)v47 initClass:v63];

            if (v48)
            {
              [v48 initPlugin];
              id v49 = [(ACCPluginManager *)v47 pluginInstancesMutable];
              [v49 addObject:v48];

              ++v54;
              long long v61 = v48;
            }
            else
            {
              long long v61 = 0;
            }
          }
        }
        uint64_t v15 = v62 + 1;
      }
      while ((id)(v62 + 1) != v59);
      id v59 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
      if (!v59)
      {
LABEL_78:

        unint64_t v14 = v54;
        goto LABEL_79;
      }
    }
  }
  unint64_t v14 = 0;
LABEL_79:

  return v14;
}

uint64_t __78__ACCPluginManager_initPlugInsWithBundleNames_orClasses_orProtocols_matchAny___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    *a3 = 1;
  }
  return isKindOfClass & 1;
}

- (unint64_t)startAllPlugIns
{
  v3 = [(ACCPluginManager *)self pluginInstancesMutable];
  unint64_t v4 = [(ACCPluginManager *)self startPlugIns:v3];

  return v4;
}

- (unint64_t)startPlugInsWithClasses:(id)a3
{
  unint64_t v4 = [(ACCPluginManager *)self pluginInstancesWithClasses:a3];
  unint64_t v5 = [(ACCPluginManager *)self startPlugIns:v4];

  return v5;
}

- (unint64_t)startPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  unint64_t v5 = [(ACCPluginManager *)self pluginInstancesWithProtocols:a3 matchAny:a4];
  unint64_t v6 = [(ACCPluginManager *)self startPlugIns:v5];

  return v6;
}

- (unint64_t)startPlugIns:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isRunning", (void)v13) & 1) == 0)
          {
            [v11 startPlugin];
            v8 += [v11 isRunning];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)stopAllPlugIns
{
  id v3 = [(ACCPluginManager *)self pluginInstancesMutable];
  unint64_t v4 = [(ACCPluginManager *)self stopPlugIns:v3];

  return v4;
}

- (unint64_t)stopPlugInsWithClasses:(id)a3
{
  unint64_t v4 = [(ACCPluginManager *)self pluginInstancesWithClasses:a3];
  unint64_t v5 = [(ACCPluginManager *)self stopPlugIns:v4];

  return v5;
}

- (unint64_t)stopPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  unint64_t v5 = [(ACCPluginManager *)self pluginInstancesWithProtocols:a3 matchAny:a4];
  unint64_t v6 = [(ACCPluginManager *)self stopPlugIns:v5];

  return v6;
}

- (unint64_t)stopPlugIns:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "isRunning", (void)v13))
          {
            [v11 stopPlugin];
            v8 += [v11 isRunning] ^ 1;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)removeAllPlugIns
{
  id v3 = [(ACCPluginManager *)self pluginInstancesMutable];
  unint64_t v4 = [(ACCPluginManager *)self removePlugIns:v3];

  return v4;
}

- (unint64_t)removePlugInsWithClasses:(id)a3
{
  unint64_t v4 = [(ACCPluginManager *)self pluginInstancesWithClasses:a3];
  unint64_t v5 = [(ACCPluginManager *)self removePlugIns:v4];

  return v5;
}

- (unint64_t)removePlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  unint64_t v5 = [(ACCPluginManager *)self pluginInstancesWithProtocols:a3 matchAny:a4];
  unint64_t v6 = [(ACCPluginManager *)self removePlugIns:v5];

  return v6;
}

- (unint64_t)removePlugIns:(id)a3
{
  id v4 = a3;
  [(ACCPluginManager *)self stopPlugIns:v4];
  id v5 = [v4 count];
  unint64_t v6 = [(ACCPluginManager *)self pluginInstancesMutable];
  [v6 minusSet:v4];

  return (unint64_t)v5;
}

- (id)pluginInstancesWithClasses:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    unint64_t v6 = +[NSMutableSet set];
    id v7 = [(ACCPluginManager *)self pluginInstancesMutable];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    long long v13 = __47__ACCPluginManager_pluginInstancesWithClasses___block_invoke;
    long long v14 = &unk_10021A478;
    id v15 = v5;
    id v16 = v6;
    id v8 = v6;
    [v7 enumerateObjectsUsingBlock:&v11];

    uint64_t v9 = +[NSSet setWithSet:](NSSet, "setWithSet:", v8, v11, v12, v13, v14);
  }
  else
  {
    uint64_t v9 = [(ACCPluginManager *)self pluginInstances];
  }

  return v9;
}

void __47__ACCPluginManager_pluginInstancesWithClasses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  id v5 = (objc_class *)objc_opt_class();
  unint64_t v6 = NSStringFromClass(v5);
  LODWORD(v4) = [v4 containsObject:v6];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (id)pluginInstancesWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    id v8 = +[NSMutableSet set];
    uint64_t v9 = [(ACCPluginManager *)self pluginInstancesMutable];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __58__ACCPluginManager_pluginInstancesWithProtocols_matchAny___block_invoke;
    v13[3] = &unk_10021A4A0;
    BOOL v16 = a4;
    id v14 = v7;
    id v15 = v8;
    id v10 = v8;
    [v9 enumerateObjectsUsingBlock:v13];

    id v11 = +[NSSet setWithSet:v10];
  }
  else
  {
    id v11 = [(ACCPluginManager *)self pluginInstances];
  }

  return v11;
}

void __58__ACCPluginManager_pluginInstancesWithProtocols_matchAny___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v4);
      }
      if (objc_msgSend(v3, "conformsToProtocol:", *(void *)(*((void *)&v10 + 1) + 8 * v9), (void)v10))
      {
        ++v7;
        if (*(unsigned char *)(a1 + 48)) {
          break;
        }
      }
      if (v6 == (id)++v9)
      {
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  if (v7 == [*(id *)(a1 + 32) count] || *(unsigned char *)(a1 + 48) && v7) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, (void)v10);
  }
}

- (id)initClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);

  return v4;
}

- (NSSet)pluginBundleSearchPaths
{
  v2 = [(ACCPluginManager *)self pluginBundleSearchPathsMutable];
  id v3 = +[NSSet setWithSet:v2];

  return (NSSet *)v3;
}

- (NSSet)pluginBundles
{
  v2 = [(ACCPluginManager *)self pluginBundlesMutable];
  id v3 = +[NSSet setWithSet:v2];

  return (NSSet *)v3;
}

- (NSSet)pluginInstances
{
  v2 = [(ACCPluginManager *)self pluginInstancesMutable];
  id v3 = +[NSSet setWithSet:v2];

  return (NSSet *)v3;
}

- (BOOL)allowDuplicateClassTypes
{
  return self->_allowDuplicateClassTypes;
}

- (void)setAllowDuplicateClassTypes:(BOOL)a3
{
  self->_allowDuplicateClassTypes = a3;
}

- (NSMutableSet)pluginBundleSearchPathsMutable
{
  return self->_pluginBundleSearchPathsMutable;
}

- (void)setPluginBundleSearchPathsMutable:(id)a3
{
}

- (NSMutableSet)pluginBundlesMutable
{
  return self->_pluginBundlesMutable;
}

- (void)setPluginBundlesMutable:(id)a3
{
}

- (NSMutableSet)pluginInstancesMutable
{
  return self->_pluginInstancesMutable;
}

- (void)setPluginInstancesMutable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginInstancesMutable, 0);
  objc_storeStrong((id *)&self->_pluginBundlesMutable, 0);

  objc_storeStrong((id *)&self->_pluginBundleSearchPathsMutable, 0);
}

- (void)loadBundlesWithPaths:(void *)a3 andIdentifiers:orClasses:orProtocols:matchAny:.cold.1(uint8_t *a1, void *a2, void *a3)
{
  id v5 = [a2 bundlePath];
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error loading bundle: %@", a1, 0xCu);
}

@end