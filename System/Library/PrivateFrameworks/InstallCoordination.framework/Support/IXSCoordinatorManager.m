@interface IXSCoordinatorManager
+ (NSURL)saveDir;
+ (id)prioritySaveURL;
+ (id)savePathForCoordinator:(id)a3;
+ (id)sharedInstance;
- (BOOL)_coordinator:(id)a3 isApplicableToConnection:(id)a4;
- (BOOL)_onMapQueue_removeCoordinatorFromMaps:(id)a3;
- (BOOL)prioritizeCoordinator:(id)a3;
- (BOOL)prioritizeCoordinatorWithIdentity:(id)a3;
- (IXSCoordinatorManager)init;
- (NSMutableArray)identityPriority;
- (NSMutableDictionary)connectionToProcessScopedCoordinatorMap;
- (NSMutableDictionary)identityToCoordinatorMap;
- (NSMutableDictionary)uuidToCoordinatorMap;
- (OS_dispatch_queue)createQueue;
- (OS_dispatch_queue)mapQueue;
- (id)_lookupCoordinatorForIdentity:(id)a3;
- (id)_lookupCoordinatorForIdentity:(id)a3 checkingScopeForConnection:(id)a4 error:(id *)a5;
- (id)coordinatorForIdentity:(id)a3;
- (id)coordinatorForIdentity:(id)a3 connection:(id)a4 error:(id *)a5 creatingIfNotExisting:(id)a6;
- (id)coordinatorForUUID:(id)a3;
- (id)coordinatorsForBundleIdentifier:(id)a3;
- (unint64_t)coordinatorCount;
- (void)_enumerateCoordinatorsForConnection:(id)a3 usingBlock:(id)a4;
- (void)_onMapQueue_saveIdentityPriority;
- (void)clearAllCoordinatorsForCreator:(unint64_t)a3;
- (void)connectionInvalidated:(id)a3;
- (void)convertProcessScopedCoordinatorToGlobalScoped:(id)a3;
- (void)enumerateCoordinators:(id)a3;
- (void)enumerateCoordinatorsApplicableToConnection:(id)a3 usingBlock:(id)a4;
- (void)performCreationBlockingOperation:(id)a3;
- (void)unregisterCoordinator:(id)a3;
@end

@implementation IXSCoordinatorManager

+ (id)savePathForCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [a1 saveDir];
  v6 = [v4 identity];

  v7 = [v6 uniqueIdentifier];
  v8 = +[NSString stringWithFormat:@"%@.plist", v7];
  v9 = [v5 URLByAppendingPathComponent:v8 isDirectory:0];

  return v9;
}

+ (NSURL)saveDir
{
  v2 = +[IXGlobalConfiguration sharedInstance];
  v3 = [v2 dataDirectoryAbortingOnError];

  id v4 = [v3 URLByAppendingPathComponent:@"Coordinators" isDirectory:1];

  return (NSURL *)v4;
}

+ (id)prioritySaveURL
{
  v2 = +[IXGlobalConfiguration sharedInstance];
  v3 = [v2 dataDirectoryAbortingOnError];

  id v4 = [v3 URLByAppendingPathComponent:@"CoordinatorPriority.plist" isDirectory:0];

  return v4;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DCE4;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109DD8 != -1) {
    dispatch_once(&qword_100109DD8, block);
  }
  v2 = (void *)qword_100109DD0;

  return v2;
}

- (unint64_t)coordinatorCount
{
  v3 = [(IXSCoordinatorManager *)self mapQueue];
  dispatch_assert_queue_not_V2(v3);
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DDE0;
  v6[3] = &unk_1000E90A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (IXSCoordinatorManager)init
{
  v157.receiver = self;
  v157.super_class = (Class)IXSCoordinatorManager;
  v2 = [(IXSCoordinatorManager *)&v157 init];
  if (!v2) {
    return v2;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.installcoordinationd.IXSCoordinatorManager", v3);
  mapQueue = v2->_mapQueue;
  v2->_mapQueue = (OS_dispatch_queue *)v4;

  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.installcoordinationd.IXSCoordinatorManager.create", v6);
  createQueue = v2->_createQueue;
  v2->_createQueue = (OS_dispatch_queue *)v7;

  uint64_t v9 = objc_opt_new();
  connectionToProcessScopedCoordinatorMap = v2->_connectionToProcessScopedCoordinatorMap;
  v2->_connectionToProcessScopedCoordinatorMap = (NSMutableDictionary *)v9;

  uint64_t v11 = [(id)objc_opt_class() saveDir];
  v12 = +[IXFileManager defaultManager];
  id v156 = 0;
  v116 = v11;
  v13 = [v12 urlsForItemsInDirectoryAtURL:v11 ignoringSymlinks:1 error:&v156];
  id v14 = v156;

  v115 = v13;
  if (v13)
  {
    uint64_t v15 = objc_opt_new();
    identityToCoordinatorMap = v2->_identityToCoordinatorMap;
    v2->_identityToCoordinatorMap = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    uuidToCoordinatorMap = v2->_uuidToCoordinatorMap;
    v2->_uuidToCoordinatorMap = (NSMutableDictionary *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v117 = dispatch_queue_create("com.apple.installcoordinationd.IXSCoordinatorManager.cancelQueue", v19);

    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id obj = v13;
    id v20 = [obj countByEnumeratingWithState:&v152 objects:v169 count:16];
    if (!v20) {
      goto LABEL_47;
    }
    id v21 = v20;
    uint64_t v22 = *(void *)v153;
    uint64_t v126 = *(void *)v153;
    while (1)
    {
      v23 = 0;
      id v128 = v21;
      do
      {
        if (*(void *)v153 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v152 + 1) + 8 * (void)v23);
        v26 = [v24 lastPathComponent];
        unsigned __int8 v27 = [v26 hasPrefix:@"."];

        if ((v27 & 1) == 0)
        {
          id v151 = v14;
          v28 = +[NSData dataWithContentsOfURL:v24 options:3 error:&v151];
          id v29 = v151;

          if (v28)
          {
            id v30 = objc_alloc((Class)NSKeyedUnarchiver);
            id v150 = v29;
            v31 = [v30 initForReadingFromData:v28 error:&v150];
            id v14 = v150;

            if (v31)
            {
              v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
              uint64_t v33 = [v31 decodeObjectOfClasses:v32 forKey:NSKeyedArchiveRootObjectKey];
              if (v33)
              {
                v34 = v33;
                [v31 finishDecoding];

                v35 = [v34 identity];

                if (v35)
                {
                  [v34 setIsTracked:1];
                  id v149 = 0;
                  unsigned int v36 = [v34 awakeFromSerializationWithError:&v149];
                  id v37 = v149;
                  id v38 = v37;
                  if (!v36) {
                    goto LABEL_44;
                  }
                  v122 = v37;
                  v39 = [v34 identity];
                  uint64_t v40 = [v34 uniqueIdentifier];
                  v41 = [(NSMutableDictionary *)v2->_identityToCoordinatorMap objectForKeyedSubscript:v39];
                  uint64_t v42 = [(NSMutableDictionary *)v2->_uuidToCoordinatorMap objectForKeyedSubscript:v40];
                  v120 = (void *)v40;
                  v121 = v42;
                  if (v41)
                  {
                    v118 = v39;
                    v43 = sub_100004B28((uint64_t)off_100109BB8);
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315906;
                      v162 = "-[IXSCoordinatorManager init]";
                      __int16 v163 = 2112;
                      v164 = v41;
                      __int16 v165 = 2112;
                      uint64_t v166 = (uint64_t)v34;
                      __int16 v167 = 2112;
                      uint64_t v168 = 0;
                      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s: Discovered already registered coordinator %@; canceling deserialized coordinator with the sa"
                        "me identity %@ : %@",
                        buf,
                        0x2Au);
                    }

                    int v44 = 1;
                    sub_10003DAE4((uint64_t)"-[IXSCoordinatorManager init]", 150, @"IXErrorDomain", 1uLL, 0, 0, @"Discovered already registered coordinator %@; canceling deserialized coordinator with the same identity %@",
                      v45,
                    uint64_t v46 = (uint64_t)v41);

                    v122 = (void *)v46;
                    v39 = v118;
                  }
                  else
                  {
                    if (v42)
                    {
                      v119 = v39;
                      v52 = sub_100004B28((uint64_t)off_100109BB8);
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315906;
                        v162 = "-[IXSCoordinatorManager init]";
                        __int16 v163 = 2112;
                        v164 = v121;
                        __int16 v165 = 2112;
                        uint64_t v166 = (uint64_t)v34;
                        __int16 v167 = 2112;
                        uint64_t v168 = 0;
                        _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s: Discovered already registered coordinator %@; canceling deserialized coordinator with the "
                          "same UUID %@ : %@",
                          buf,
                          0x2Au);
                      }

                      int v44 = 1;
                      sub_10003DAE4((uint64_t)"-[IXSCoordinatorManager init]", 153, @"IXErrorDomain", 1uLL, 0, 0, @"Discovered already registered coordinator %@; canceling deserialized coordinator with the same UUID %@",
                        v53,
                      uint64_t v54 = (uint64_t)v121);

                      v122 = (void *)v54;
                      v39 = v119;
                    }
                    else
                    {
                      [(NSMutableDictionary *)v2->_identityToCoordinatorMap setObject:v34 forKeyedSubscript:v39];
                      [(NSMutableDictionary *)v2->_uuidToCoordinatorMap setObject:v34 forKeyedSubscript:v40];
                      int v44 = 0;
                    }
                    v41 = 0;
                  }

                  id v38 = v122;
                  if (v44)
                  {
LABEL_44:
                    [v34 setIsTracked:0];
                    v146[0] = _NSConcreteStackBlock;
                    v146[1] = 3221225472;
                    v146[2] = sub_10000EFD0;
                    v146[3] = &unk_1000E8E08;
                    v147 = v34;
                    id v38 = v38;
                    id v148 = v38;
                    sub_100066F24(v117, v146);
                  }
                  id v21 = v128;
                  goto LABEL_32;
                }
                v49 = sub_100004B28((uint64_t)off_100109BB8);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v162 = "-[IXSCoordinatorManager init]";
                  __int16 v163 = 2112;
                  v164 = v34;
                  v50 = v49;
                  v51 = "%s: Somehow got coordinator without identity : %@";
LABEL_28:
                  _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 0x16u);
                }

                goto LABEL_30;
              }
              v48 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                v123 = [v24 path];
                uint64_t v56 = [v31 error];
                *(_DWORD *)buf = 136315650;
                v162 = "-[IXSCoordinatorManager init]";
                __int16 v163 = 2112;
                v164 = v123;
                __int16 v165 = 2112;
                uint64_t v166 = v56;
                v57 = (void *)v56;
                _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s: Failed to decode coordinator from data at %@ : %@", buf, 0x20u);
              }
              [v31 finishDecoding];
            }
            else
            {
              v32 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                v47 = [v24 path];
                *(_DWORD *)buf = 136315650;
                v162 = "-[IXSCoordinatorManager init]";
                __int16 v163 = 2112;
                v164 = v47;
                __int16 v165 = 2112;
                uint64_t v166 = (uint64_t)v14;
                _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s: Failed to create unarchiver to deserialize coordinator at %@ : %@", buf, 0x20u);
              }
            }

            v34 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v49 = [v24 path];
              *(_DWORD *)buf = 136315394;
              v162 = "-[IXSCoordinatorManager init]";
              __int16 v163 = 2112;
              v164 = v49;
              v50 = v34;
              v51 = "%s: Failed to decode coordinator from %@";
              goto LABEL_28;
            }
LABEL_30:
            id v21 = v128;
          }
          else
          {
            v31 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v55 = [v24 path];
              *(_DWORD *)buf = 136315650;
              v162 = "-[IXSCoordinatorManager init]";
              __int16 v163 = 2112;
              v164 = v55;
              __int16 v165 = 2112;
              uint64_t v166 = (uint64_t)v29;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize coordinator at %@ : %@", buf, 0x20u);
            }
            id v14 = v29;
            id v21 = v128;
          }

          v34 = +[IXFileManager defaultManager];
          [v34 removeItemAtURL:v24 error:0];
LABEL_32:

          uint64_t v22 = v126;
        }
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v58 = [obj countByEnumeratingWithState:&v152 objects:v169 count:16];
      id v21 = v58;
      if (!v58)
      {
LABEL_47:

        id v59 = v14;
        v60 = v117;
        goto LABEL_57;
      }
    }
  }
  v61 = [v14 domain];
  if (![v61 isEqualToString:NSPOSIXErrorDomain])
  {

    goto LABEL_54;
  }
  id v62 = [v14 code];

  if (v62 != (id)2)
  {
LABEL_54:
    v60 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v162 = "-[IXSCoordinatorManager init]";
      __int16 v163 = 2112;
      v164 = v116;
      __int16 v165 = 2112;
      uint64_t v166 = (uint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%s: Failed to enumerate saved coordinators at %@ : %@", buf, 0x20u);
    }
    id v59 = v14;
    goto LABEL_57;
  }
  v63 = +[IXFileManager defaultManager];
  id v145 = v14;
  unsigned __int8 v64 = [v63 createDirectoryAtURL:v116 withIntermediateDirectories:1 mode:493 class:4 error:&v145];
  id v59 = v145;

  if ((v64 & 1) == 0)
  {
    v60 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v65 = [v116 path];
      *(_DWORD *)buf = 136315650;
      v162 = "-[IXSCoordinatorManager init]";
      __int16 v163 = 2112;
      v164 = v65;
      __int16 v165 = 2112;
      uint64_t v166 = (uint64_t)v59;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%s: Failed to create coordinator save directory at %@: %@", buf, 0x20u);
    }
LABEL_57:
  }
  if (!v2->_identityToCoordinatorMap || !v2->_uuidToCoordinatorMap)
  {
    uint64_t v66 = objc_opt_new();
    v67 = v2->_identityToCoordinatorMap;
    v2->_identityToCoordinatorMap = (NSMutableDictionary *)v66;

    uint64_t v68 = objc_opt_new();
    v69 = v2->_uuidToCoordinatorMap;
    v2->_uuidToCoordinatorMap = (NSMutableDictionary *)v68;
  }
  [(id)objc_opt_class() prioritySaveURL];
  v129 = v144[1] = v59;
  uint64_t v70 = +[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:");
  v71 = v59;

  v127 = (void *)v70;
  if (v70)
  {
    v144[0] = v71;
    v72 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v70 error:v144];
    v73 = v144[0];

    if (v72)
    {
      v124 = v73;
      v74 = (NSMutableArray *)objc_opt_new();
      long long v140 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      v125 = v72;
      v75 = v72;
      id v76 = [v75 countByEnumeratingWithState:&v140 objects:v160 count:16];
      if (v76)
      {
        id v77 = v76;
        v78 = 0;
        uint64_t v79 = *(void *)v141;
        do
        {
          v80 = 0;
          v81 = v78;
          do
          {
            if (*(void *)v141 != v79) {
              objc_enumerationMutation(v75);
            }
            v82 = *(void **)(*((void *)&v140 + 1) + 8 * (void)v80);
            v139 = v81;
            unsigned __int8 v83 = [v82 resolvePersonaWithError:&v139];
            v78 = v139;

            if (v83)
            {
              [(NSMutableArray *)v74 addObject:v82];
            }
            else
            {
              v84 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                v85 = [v82 bundleID];
                *(_DWORD *)buf = 136315650;
                v162 = "-[IXSCoordinatorManager init]";
                __int16 v163 = 2112;
                v164 = v85;
                __int16 v165 = 2112;
                uint64_t v166 = (uint64_t)v78;
                _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%s: Failed to resolve persona %@ : %@", buf, 0x20u);
              }
            }
            v80 = (char *)v80 + 1;
            v81 = v78;
          }
          while (v77 != v80);
          id v77 = [v75 countByEnumeratingWithState:&v140 objects:v160 count:16];
        }
        while (v77);
      }
      else
      {
        v78 = 0;
      }

      identityPriority = v2->_identityPriority;
      v2->_identityPriority = v74;

      v73 = v124;
      v72 = v125;
    }
    else
    {
      v78 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v162 = "-[IXSCoordinatorManager init]";
        __int16 v163 = 2112;
        v164 = v73;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%s: Failed to deserialize identity priority data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v86 = [v71 domain];
    if ([v86 isEqualToString:NSCocoaErrorDomain])
    {
      id v87 = [v71 code];

      if (v87 == (id)260) {
        goto LABEL_89;
      }
    }
    else
    {
    }
    v72 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v88 = [v129 path];
      *(_DWORD *)buf = 136315650;
      v162 = "-[IXSCoordinatorManager init]";
      __int16 v163 = 2112;
      v164 = v88;
      __int16 v165 = 2112;
      uint64_t v166 = (uint64_t)v71;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%s: Failed to read identity priority serialization from %@ : %@", buf, 0x20u);
    }
    v73 = v71;
  }

  v71 = v73;
LABEL_89:
  if (!v2->_identityPriority)
  {
    v90 = [(IXSCoordinatorManager *)v2 identityToCoordinatorMap];
    v91 = [v90 allKeys];
    v92 = (NSMutableArray *)[v91 mutableCopy];
    v93 = v2->_identityPriority;
    v2->_identityPriority = v92;

    v94 = +[IXFileManager defaultManager];
    [v94 removeItemAtURL:v129 error:0];
  }
  v95 = objc_opt_new();
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  v96 = [(IXSCoordinatorManager *)v2 identityPriority];
  id v97 = [v96 countByEnumeratingWithState:&v135 objects:v159 count:16];
  if (v97)
  {
    id v98 = v97;
    uint64_t v99 = *(void *)v136;
    do
    {
      for (i = 0; i != v98; i = (char *)i + 1)
      {
        if (*(void *)v136 != v99) {
          objc_enumerationMutation(v96);
        }
        uint64_t v101 = *(void *)(*((void *)&v135 + 1) + 8 * i);
        v102 = [(IXSCoordinatorManager *)v2 identityToCoordinatorMap];
        v103 = [v102 objectForKeyedSubscript:v101];

        if (!v103) {
          [v95 addObject:v101];
        }
      }
      id v98 = [v96 countByEnumeratingWithState:&v135 objects:v159 count:16];
    }
    while (v98);
  }

  v104 = [(IXSCoordinatorManager *)v2 identityPriority];
  [v104 removeObjectsInArray:v95];

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v105 = [(IXSCoordinatorManager *)v2 identityToCoordinatorMap];
  id v106 = [v105 countByEnumeratingWithState:&v131 objects:v158 count:16];
  if (v106)
  {
    id v107 = v106;
    uint64_t v108 = *(void *)v132;
    do
    {
      for (j = 0; j != v107; j = (char *)j + 1)
      {
        if (*(void *)v132 != v108) {
          objc_enumerationMutation(v105);
        }
        uint64_t v110 = *(void *)(*((void *)&v131 + 1) + 8 * (void)j);
        v111 = [(IXSCoordinatorManager *)v2 identityPriority];
        unsigned __int8 v112 = [v111 containsObject:v110];

        if ((v112 & 1) == 0)
        {
          v113 = [(IXSCoordinatorManager *)v2 identityPriority];
          [v113 addObject:v110];
        }
      }
      id v107 = [v105 countByEnumeratingWithState:&v131 objects:v158 count:16];
    }
    while (v107);
  }

  return v2;
}

- (BOOL)_onMapQueue_removeCoordinatorFromMaps:(id)a3
{
  id v4 = a3;
  v5 = [(IXSCoordinatorManager *)self mapQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isTracked])
  {
    v6 = [v4 uniqueIdentifier];
    if (v6)
    {
      dispatch_queue_t v7 = [(IXSCoordinatorManager *)self uuidToCoordinatorMap];
      v8 = [v7 objectForKeyedSubscript:v6];

      if (v8)
      {
        uint64_t v9 = [v4 identity];
        BOOL v10 = v9 != 0;
        if (v9)
        {
          [v4 setIsTracked:0];
          uint64_t v11 = [(IXSCoordinatorManager *)self identityToCoordinatorMap];
          [v11 removeObjectForKey:v9];

          v12 = [(IXSCoordinatorManager *)self uuidToCoordinatorMap];
          [v12 removeObjectForKey:v6];

          v13 = [(IXSCoordinatorManager *)self identityPriority];
          [v13 removeObject:v9];

          id v14 = [v4 scopedToConnection];
          uint64_t v15 = [v14 connectionUUID];

          if (v15)
          {
            v16 = [(IXSCoordinatorManager *)self connectionToProcessScopedCoordinatorMap];
            uint64_t v17 = [v16 objectForKeyedSubscript:v15];

            [v17 removeObject:v4];
            if (![v17 count])
            {
              v18 = [(IXSCoordinatorManager *)self connectionToProcessScopedCoordinatorMap];
              [v18 removeObjectForKey:v15];
            }
          }
        }
        goto LABEL_14;
      }
      [v4 setIsTracked:0];
    }
    BOOL v10 = 0;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (void)_onMapQueue_saveIdentityPriority
{
  v3 = [(IXSCoordinatorManager *)self mapQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(id)objc_opt_class() prioritySaveURL];
  v5 = [(IXSCoordinatorManager *)self identityPriority];
  id v12 = 0;
  v6 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
  id v7 = v12;

  if (!v6)
  {
    BOOL v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[IXSCoordinatorManager _onMapQueue_saveIdentityPriority]";
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to archive identity priority array: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  id v11 = v7;
  unsigned __int8 v8 = [v6 writeToURL:v4 options:1 error:&v11];
  id v9 = v11;

  if ((v8 & 1) == 0)
  {
    BOOL v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v14 = "-[IXSCoordinatorManager _onMapQueue_saveIdentityPriority]";
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to save coordinator priority array to %@ : %@", buf, 0x20u);
    }
    id v7 = v9;
LABEL_8:

    id v9 = v7;
  }
}

- (BOOL)_coordinator:(id)a3 isApplicableToConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_5;
  }
  if ([v5 coordinatorScope] != 1) {
    goto LABEL_5;
  }
  id v7 = [v5 scopedToConnection];
  unsigned __int8 v8 = [v7 connectionUUID];

  if (!v8) {
    goto LABEL_5;
  }
  id v9 = [v6 connectionUUID];
  unsigned int v10 = [v9 isEqual:v8];

  if (!v10) {
    BOOL v11 = 0;
  }
  else {
LABEL_5:
  }
    BOOL v11 = 1;

  return v11;
}

- (id)coordinatorForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_10000F5B0;
  id v16 = sub_10000F5C0;
  id v17 = 0;
  id v5 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F5C8;
  block[3] = &unk_1000E90F0;
  id v10 = v4;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)coordinatorForIdentity:(id)a3
{
  return [(IXSCoordinatorManager *)self _lookupCoordinatorForIdentity:a3];
}

- (id)coordinatorsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F734;
  block[3] = &unk_1000E9140;
  block[4] = self;
  id v12 = v4;
  id v13 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(v6, block);

  id v9 = [v7 copy];

  return v9;
}

- (id)_lookupCoordinatorForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_10000F5B0;
  id v16 = sub_10000F5C0;
  id v17 = 0;
  id v5 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F9B4;
  block[3] = &unk_1000E90F0;
  id v10 = v4;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_lookupCoordinatorForIdentity:(id)a3 checkingScopeForConnection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_10000F5B0;
  id v38 = sub_10000F5C0;
  id v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  id v10 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FD7C;
  block[3] = &unk_1000E9168;
  v28 = &v34;
  block[4] = self;
  id v11 = v8;
  id v27 = v11;
  id v29 = &v30;
  dispatch_sync(v10, block);

  if (!v35[5]) {
    goto LABEL_6;
  }
  if (*((unsigned char *)v31 + 24))
  {
    uint64_t v12 = [v9 clientName];
    sub_10003DAE4((uint64_t)"-[IXSCoordinatorManager _lookupCoordinatorForIdentity:checkingScopeForConnection:error:]", 399, @"IXErrorDomain", 0x2FuLL, 0, 0, @"Creator of this process-scoped coordinator, \"%@\", has gone away; canceling coordinator.",
      v13,
    uint64_t v14 = (uint64_t)v12);
    [(id)v35[5] cancelForReason:v14 client:15 error:0];
    __int16 v15 = (void *)v35[5];
    v35[5] = 0;

    if (!v35[5])
    {
LABEL_6:
      id v17 = [v9 clientName];
      id v16 = sub_10003DAE4((uint64_t)"-[IXSCoordinatorManager _lookupCoordinatorForIdentity:checkingScopeForConnection:error:]", 411, @"IXErrorDomain", 6uLL, 0, 0, @"Failed to locate an existing coordinated app install with bundle ID %@ for client %@", v18, (uint64_t)v11);
LABEL_8:

      goto LABEL_9;
    }
  }
  if (!-[IXSCoordinatorManager _coordinator:isApplicableToConnection:](self, "_coordinator:isApplicableToConnection:"))
  {
    v19 = [(id)v35[5] identity];
    id v20 = [(id)v35[5] uniqueIdentifier];
    v25 = [v9 clientName];
    id v16 = sub_10003DAE4((uint64_t)"-[IXSCoordinatorManager _lookupCoordinatorForIdentity:checkingScopeForConnection:error:]", 407, @"IXErrorDomain", 0x30uLL, 0, 0, @"Coordinator found for %@ with UUID %@ was process-scoped, but not for client %@.", v21, (uint64_t)v19);

    id v17 = (void *)v35[5];
    v35[5] = 0;
    goto LABEL_8;
  }
  id v16 = 0;
LABEL_9:
  uint64_t v22 = (void *)v35[5];
  if (a5 && !v22)
  {
    *a5 = v16;
    uint64_t v22 = (void *)v35[5];
  }
  id v23 = v22;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v23;
}

- (id)coordinatorForIdentity:(id)a3 connection:(id)a4 error:(id *)a5 creatingIfNotExisting:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_10000F5B0;
  id v38 = sub_10000F5C0;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_10000F5B0;
  uint64_t v32 = sub_10000F5C0;
  id obj = 0;
  uint64_t v13 = [(IXSCoordinatorManager *)self _lookupCoordinatorForIdentity:v10 checkingScopeForConnection:v11 error:&obj];
  objc_storeStrong(&v39, obj);
  id v33 = v13;
  if (!v29[5])
  {
    uint64_t v14 = [(id)v35[5] domain];
    if ([v14 isEqualToString:@"IXErrorDomain"])
    {
      id v15 = [(id)v35[5] code];

      if (v12 && v15 == (id)6)
      {
        id v16 = (void *)v35[5];
        v35[5] = 0;

        id v17 = [(IXSCoordinatorManager *)self createQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100010120;
        block[3] = &unk_1000E91B8;
        v25 = &v28;
        block[4] = self;
        id v22 = v10;
        id v23 = v11;
        id v24 = v12;
        v26 = &v34;
        dispatch_sync(v17, block);
      }
    }
    else
    {
    }
  }
  uint64_t v18 = (void *)v29[5];
  if (a5 && !v18)
  {
    *a5 = (id) v35[5];
    uint64_t v18 = (void *)v29[5];
  }
  id v19 = v18;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);

  return v19;
}

- (void)performCreationBlockingOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatorManager *)self createQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000106C4;
  v7[3] = &unk_1000E91E0;
  id v8 = v4;
  id v6 = v4;
  sub_100066F24(v5, v7);
}

- (void)unregisterCoordinator:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010880;
  block[3] = &unk_1000E90F0;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v12 + 24))
  {
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[IXSCoordinatorManager unregisterCoordinator:]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Unregistered coordinator: %@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v11, 8);
}

- (BOOL)prioritizeCoordinatorWithIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v5 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010AAC;
  block[3] = &unk_1000E9208;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v14 + 24))
  {
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[IXSCoordinatorManager prioritizeCoordinatorWithIdentity:]";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Prioritized coordinator with ID %@", buf, 0x16u);
    }

    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)prioritizeCoordinator:(id)a3
{
  id v4 = [a3 identity];
  if (v4) {
    BOOL v5 = [(IXSCoordinatorManager *)self prioritizeCoordinatorWithIdentity:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)enumerateCoordinators:(id)a3
{
}

- (void)enumerateCoordinatorsApplicableToConnection:(id)a3 usingBlock:(id)a4
{
}

- (void)_enumerateCoordinatorsForConnection:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (unsigned int (**)(id, void))a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10000F5B0;
  id v23 = sub_10000F5C0;
  id v24 = (id)objc_opt_new();
  BOOL v8 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010DF4;
  block[3] = &unk_1000E9230;
  block[4] = self;
  void block[5] = &v19;
  dispatch_sync(v8, block);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = (id)v20[5];
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * v12);
      if ((!v6
         || -[IXSCoordinatorManager _coordinator:isApplicableToConnection:](self, "_coordinator:isApplicableToConnection:", *(void *)(*((void *)&v14 + 1) + 8 * v12), v6, (void)v14))&& !v7[2](v7, v13))
      {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (void)clearAllCoordinatorsForCreator:(unint64_t)a3
{
  BOOL v5 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = IXStringForClientID(a3);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[IXSCoordinatorManager clearAllCoordinatorsForCreator:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Clearing all coordinators for creator %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v22 = sub_10000F5B0;
  id v23 = sub_10000F5C0;
  id v24 = 0;
  id v7 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011298;
  block[3] = &unk_1000E90A8;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(v7, block);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = *(id *)(*(void *)&buf[8] + 40);
  id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
        if (!a3 || [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) creator] == (id)a3)
        {
          long long v14 = sub_10003DAE4((uint64_t)"-[IXSCoordinatorManager clearAllCoordinatorsForCreator:]", 577, @"IXErrorDomain", 1uLL, 0, 0, @"Clearing all coordinators", v9, v15);
          [v13 cancelForReason:v14 client:15 error:0];
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(buf, 8);
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 connectionUUID];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000F5B0;
  v26 = sub_10000F5C0;
  id v27 = 0;
  id v6 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011590;
  block[3] = &unk_1000E90F0;
  uint64_t v21 = &v22;
  block[4] = self;
  id v7 = v5;
  id v20 = v7;
  dispatch_sync(v6, block);

  if (v23[5])
  {
    id v8 = [v4 clientName];
    sub_10003DAE4((uint64_t)"-[IXSCoordinatorManager connectionInvalidated:]", 607, @"IXErrorDomain", 0x2FuLL, 0, 0, @"Creator of this process-scoped coordinator, \"%@\", has gone away; canceling coordinator.",
      v9,
    id v10 = (uint64_t)v8);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v11 = (id)v23[5];
    id v12 = [v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        long long v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) cancelForReason:v10 client:15 error:0];
          long long v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
      }
      while (v12);
    }
  }
  _Block_object_dispose(&v22, 8);
}

- (void)convertProcessScopedCoordinatorToGlobalScoped:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 scopedToConnection];
  id v6 = [v5 connectionUUID];

  id v7 = [(IXSCoordinatorManager *)self mapQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000117F8;
  block[3] = &unk_1000E9140;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_sync(v7, block);
}

- (OS_dispatch_queue)mapQueue
{
  return self->_mapQueue;
}

- (OS_dispatch_queue)createQueue
{
  return self->_createQueue;
}

- (NSMutableDictionary)identityToCoordinatorMap
{
  return self->_identityToCoordinatorMap;
}

- (NSMutableDictionary)uuidToCoordinatorMap
{
  return self->_uuidToCoordinatorMap;
}

- (NSMutableDictionary)connectionToProcessScopedCoordinatorMap
{
  return self->_connectionToProcessScopedCoordinatorMap;
}

- (NSMutableArray)identityPriority
{
  return self->_identityPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityPriority, 0);
  objc_storeStrong((id *)&self->_connectionToProcessScopedCoordinatorMap, 0);
  objc_storeStrong((id *)&self->_uuidToCoordinatorMap, 0);
  objc_storeStrong((id *)&self->_identityToCoordinatorMap, 0);
  objc_storeStrong((id *)&self->_createQueue, 0);

  objc_storeStrong((id *)&self->_mapQueue, 0);
}

@end