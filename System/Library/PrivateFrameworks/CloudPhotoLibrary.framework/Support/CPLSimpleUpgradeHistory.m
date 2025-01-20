@interface CPLSimpleUpgradeHistory
+ (void)cleanupUnusedUpgradeHistoriesWithUsedBlock:(id)a3;
- (BOOL)versionHasChanged;
- (CPLSimpleUpgradeHistory)initWithLibraryIdentifier:(id)a3;
- (NSDate)lastCPLUpgradeDate;
- (NSDate)lastDBUpgradeDate;
- (NSDate)lastOSBuildUpgradeDate;
- (NSString)lastSeenCPLVersion;
- (NSString)lastSeenOSBuildVersion;
- (NSString)libraryIdentifier;
- (NSString)previousCPLVersion;
- (NSString)previousOSBuildVersion;
- (NSString)status;
- (id)_defaultsKey;
- (id)_valueForKey:(id)a3 class:(Class)a4;
- (int64_t)lastSeenDBVersion;
- (int64_t)previousDBVersion;
- (void)_save;
- (void)noteDatabaseWasUpgradedToVersion:(int64_t)a3 fromVersion:(int64_t)a4;
- (void)resetVersionHasChanged;
@end

@implementation CPLSimpleUpgradeHistory

- (id)_defaultsKey
{
  return [@"_CPLUpgradeHistory-" stringByAppendingString:self->_libraryIdentifier];
}

- (void)_save
{
  if (!_CPLSilentLogging)
  {
    v3 = sub_1001B9990();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      libraryIdentifier = self->_libraryIdentifier;
      history = self->_history;
      int v9 = 138412546;
      v10 = libraryIdentifier;
      __int16 v11 = 2112;
      v12 = history;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Saving upgrade history for %@: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  v6 = +[NSUserDefaults standardUserDefaults];
  v7 = self->_history;
  v8 = [(CPLSimpleUpgradeHistory *)self _defaultsKey];
  [v6 setObject:v7 forKey:v8];
}

- (CPLSimpleUpgradeHistory)initWithLibraryIdentifier:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CPLSimpleUpgradeHistory;
  v5 = [(CPLSimpleUpgradeHistory *)&v43 init];
  if (!v5) {
    goto LABEL_67;
  }
  v6 = +[NSUserDefaults standardUserDefaults];
  v7 = (NSString *)[v4 copy];
  libraryIdentifier = v5->_libraryIdentifier;
  v5->_libraryIdentifier = v7;

  int v9 = [(CPLSimpleUpgradeHistory *)v5 _defaultsKey];
  v10 = [v6 objectForKey:v9];

  if (!_CPLSilentLogging)
  {
    __int16 v11 = sub_1001B9990();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = v5->_libraryIdentifier;
      *(_DWORD *)buf = 138412546;
      CFStringRef v45 = (const __CFString *)v12;
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "At opening time, history for %@ is %@", buf, 0x16u);
    }
  }
  if ([v4 isEqualToString:CPLLibraryIdentifierSystemLibrary]) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    history = v5->_history;
    v5->_history = v15;

    v17 = [v6 objectForKey:@"_CPLLastOSBuildVersion"];
    if (v17)
    {
      [(NSMutableDictionary *)v5->_history setObject:v17 forKeyedSubscript:@"lastSeenOSBuildVersion"];
      [v6 removeObjectForKey:@"_CPLLastOSBuildVersion"];
    }

    v18 = [v6 objectForKey:@"_CPLPreviousOSBuildVersion"];
    if (v18)
    {
      [(NSMutableDictionary *)v5->_history setObject:v18 forKeyedSubscript:@"previousOSBuildVersion"];
      [v6 removeObjectForKey:@"_CPLPreviousOSBuildVersion"];
    }

    v19 = [v6 objectForKey:@"_CPLLastOSUpgrade"];
    if (v19)
    {
      [(NSMutableDictionary *)v5->_history setObject:v19 forKeyedSubscript:@"lastOSBuildUpgradeDate"];
      [v6 removeObjectForKey:@"_CPLLastOSUpgrade"];
    }

    v20 = [v6 objectForKey:@"_CPLLastDBVersion"];
    if (v20)
    {
      [(NSMutableDictionary *)v5->_history setObject:v20 forKeyedSubscript:@"lastSeenDBVersion"];
      [v6 removeObjectForKey:@"_CPLLastDBVersion"];
    }

    v21 = [v6 objectForKey:@"_CPLPreviousDBVersion"];
    if (v21)
    {
      [(NSMutableDictionary *)v5->_history setObject:v21 forKeyedSubscript:@"previousDBVersion"];
      [v6 removeObjectForKey:@"_CPLPreviousDBVersion"];
    }

    v22 = [v6 objectForKey:@"_CPLLastDBUpgrade"];
    if (v22)
    {
      [(NSMutableDictionary *)v5->_history setObject:v22 forKeyedSubscript:@"lastDBUpgradeDate"];
      [v6 removeObjectForKey:@"_CPLLastDBUpgrade"];
    }

    v23 = [v6 objectForKey:@"_CPLLastCPLVersion"];
    if (v23)
    {
      [(NSMutableDictionary *)v5->_history setObject:v23 forKeyedSubscript:@"lastSeenCPLVersion"];
      [v6 removeObjectForKey:@"_CPLLastCPLVersion"];
    }

    v24 = [v6 objectForKey:@"_CPLPreviousCPLVersion"];
    if (v24)
    {
      [(NSMutableDictionary *)v5->_history setObject:v24 forKeyedSubscript:@"previousCPLVersion"];
      [v6 removeObjectForKey:@"_CPLPreviousCPLVersion"];
    }

    v25 = [v6 objectForKey:@"_CPLLastCPLUpgrade"];
    if (v25)
    {
      [(NSMutableDictionary *)v5->_history setObject:v25 forKeyedSubscript:@"lastCPLUpgradeDate"];
      [v6 removeObjectForKey:@"_CPLLastCPLUpgrade"];
    }

    [(CPLSimpleUpgradeHistory *)v5 _save];
  }
  else
  {
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      v14 = (NSMutableDictionary *)[v10 mutableCopy];
    }
    else {
      v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    v26 = v5->_history;
    v5->_history = v14;
  }
  uint64_t v27 = __CPLBuildVersion();
  uint64_t v28 = [(CPLSimpleUpgradeHistory *)v5 lastSeenOSBuildVersion];
  v29 = (__CFString *)v28;
  if (v28 && v27)
  {
    if ([(id)v28 isEqual:v27]) {
      goto LABEL_50;
    }
  }
  else
  {
    if (!(v28 | v27)) {
      goto LABEL_50;
    }
    if (!v27)
    {
      if (!_CPLSilentLogging)
      {
        v42 = sub_1001B9990();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Running on a undetermined OS build", buf, 2u);
        }
      }
      [(NSMutableDictionary *)v5->_history removeObjectForKey:@"lastSeenOSBuildVersion"];
      goto LABEL_47;
    }
  }
  if (!_CPLSilentLogging)
  {
    v30 = sub_1001B9990();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v31 = @"unknown";
      if (v29) {
        CFStringRef v31 = v29;
      }
      *(_DWORD *)buf = 138543618;
      CFStringRef v45 = v31;
      __int16 v46 = 2114;
      uint64_t v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "OS Build version has changed since last launch, from %{public}@ to %{public}@", buf, 0x16u);
    }
  }
  [(NSMutableDictionary *)v5->_history setObject:v27 forKeyedSubscript:@"lastSeenOSBuildVersion"];
  v5->_versionHasChanged = 1;
LABEL_47:
  v32 = +[NSDate date];
  [(NSMutableDictionary *)v5->_history setObject:v32 forKeyedSubscript:@"lastOSBuildUpgradeDate"];

  v33 = v5->_history;
  if (v29) {
    [(NSMutableDictionary *)v33 setObject:v29 forKeyedSubscript:@"previousOSBuildVersion"];
  }
  else {
    [(NSMutableDictionary *)v33 removeObjectForKey:@"previousOSBuildVersion"];
  }
LABEL_50:
  uint64_t v34 = __CPLVersion();
  uint64_t v35 = [(CPLSimpleUpgradeHistory *)v5 lastSeenCPLVersion];
  v36 = (__CFString *)v35;
  if (v35 && v34)
  {
    if ([(id)v35 isEqual:v34]) {
      goto LABEL_64;
    }
LABEL_55:
    if (!_CPLSilentLogging)
    {
      v37 = sub_1001B9990();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v38 = @"unknown";
        if (v36) {
          CFStringRef v38 = v36;
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v45 = v38;
        __int16 v46 = 2112;
        uint64_t v47 = v34;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "CPL version has changed since last launch, from %@ to %@", buf, 0x16u);
      }
    }
    v5->_versionHasChanged = 1;
    [(NSMutableDictionary *)v5->_history setObject:v34 forKeyedSubscript:@"lastSeenCPLVersion"];
    v39 = +[NSDate date];
    [(NSMutableDictionary *)v5->_history setObject:v39 forKeyedSubscript:@"lastCPLUpgradeDate"];

    v40 = v5->_history;
    if (v36) {
      [(NSMutableDictionary *)v40 setObject:v36 forKeyedSubscript:@"previousCPLVersion"];
    }
    else {
      [(NSMutableDictionary *)v40 removeObjectForKey:@"previousCPLVersion"];
    }
    goto LABEL_64;
  }
  if (v35 | v34) {
    goto LABEL_55;
  }
LABEL_64:
  if (v5->_versionHasChanged) {
    [(CPLSimpleUpgradeHistory *)v5 _save];
  }

LABEL_67:
  return v5;
}

- (id)_valueForKey:(id)a3 class:(Class)a4
{
  id v4 = [(NSMutableDictionary *)self->_history objectForKeyedSubscript:a3];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)noteDatabaseWasUpgradedToVersion:(int64_t)a3 fromVersion:(int64_t)a4
{
  int64_t v7 = [(CPLSimpleUpgradeHistory *)self lastSeenDBVersion];
  if (v7) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = a4;
  }
  if (v8 != a3)
  {
    int v9 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
    [(NSMutableDictionary *)self->_history setObject:v9 forKeyedSubscript:@"previousDBVersion"];

    v10 = +[NSDate date];
    [(NSMutableDictionary *)self->_history setObject:v10 forKeyedSubscript:@"lastDBUpgradeDate"];

    __int16 v11 = +[NSNumber numberWithLongLong:a3];
    [(NSMutableDictionary *)self->_history setObject:v11 forKeyedSubscript:@"lastSeenDBVersion"];

    [(CPLSimpleUpgradeHistory *)self _save];
  }
}

- (NSString)lastSeenOSBuildVersion
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(CPLSimpleUpgradeHistory *)self _valueForKey:@"lastSeenOSBuildVersion" class:v3];
}

- (NSString)previousOSBuildVersion
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(CPLSimpleUpgradeHistory *)self _valueForKey:@"previousOSBuildVersion" class:v3];
}

- (NSDate)lastOSBuildUpgradeDate
{
  uint64_t v3 = objc_opt_class();
  return (NSDate *)[(CPLSimpleUpgradeHistory *)self _valueForKey:@"lastOSBuildUpgradeDate" class:v3];
}

- (int64_t)lastSeenDBVersion
{
  v2 = [(CPLSimpleUpgradeHistory *)self _valueForKey:@"lastSeenDBVersion" class:objc_opt_class()];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (int64_t)previousDBVersion
{
  v2 = [(CPLSimpleUpgradeHistory *)self _valueForKey:@"previousDBVersion" class:objc_opt_class()];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (NSDate)lastDBUpgradeDate
{
  uint64_t v3 = objc_opt_class();
  return (NSDate *)[(CPLSimpleUpgradeHistory *)self _valueForKey:@"lastDBUpgradeDate" class:v3];
}

- (NSString)lastSeenCPLVersion
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(CPLSimpleUpgradeHistory *)self _valueForKey:@"lastSeenCPLVersion" class:v3];
}

- (NSString)previousCPLVersion
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(CPLSimpleUpgradeHistory *)self _valueForKey:@"previousCPLVersion" class:v3];
}

- (NSDate)lastCPLUpgradeDate
{
  uint64_t v3 = objc_opt_class();
  return (NSDate *)[(CPLSimpleUpgradeHistory *)self _valueForKey:@"lastCPLUpgradeDate" class:v3];
}

- (void)resetVersionHasChanged
{
  self->_versionHasChanged = 0;
}

- (NSString)status
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  uint64_t v4 = +[NSDate date];
  id v5 = [(CPLSimpleUpgradeHistory *)self lastOSBuildUpgradeDate];
  CFStringRef v6 = @"unknown";
  if (v5)
  {
    id v39 = objc_alloc((Class)NSString);
    uint64_t v7 = [(CPLSimpleUpgradeHistory *)self previousOSBuildVersion];
    int64_t v8 = (void *)v7;
    if (v7) {
      CFStringRef v6 = (const __CFString *)v7;
    }
    uint64_t v9 = [(CPLSimpleUpgradeHistory *)self lastSeenOSBuildVersion];
    v10 = (void *)v9;
    __int16 v11 = v3;
    if (v9) {
      CFStringRef v12 = (const __CFString *)v9;
    }
    else {
      CFStringRef v12 = @"unknown";
    }
    BOOL v13 = +[CPLDateFormatter stringFromDateAgo:v5 now:v4];
    CFStringRef v38 = v12;
    id v3 = v11;
    CFStringRef v36 = v6;
    CFStringRef v6 = @"unknown";
    id v14 = [v39 initWithFormat:@"last upgrade from %@ to %@, %@", v36, v38, v13];
    [v11 addObject:v14];
  }
  v40 = (void *)v4;
  v15 = [(CPLSimpleUpgradeHistory *)self lastCPLUpgradeDate];
  if (v15)
  {
    id v16 = objc_alloc((Class)NSString);
    uint64_t v17 = [(CPLSimpleUpgradeHistory *)self previousCPLVersion];
    v18 = (void *)v17;
    v19 = v3;
    v20 = v5;
    if (v17) {
      CFStringRef v21 = (const __CFString *)v17;
    }
    else {
      CFStringRef v21 = @"unknown";
    }
    uint64_t v22 = [(CPLSimpleUpgradeHistory *)self lastSeenCPLVersion];
    v23 = (void *)v22;
    if (v22) {
      CFStringRef v6 = (const __CFString *)v22;
    }
    +[CPLDateFormatter stringFromDateAgo:v15 now:v4];
    v25 = v24 = v15;
    CFStringRef v37 = v21;
    id v5 = v20;
    id v3 = v19;
    id v26 = [v16 initWithFormat:@"last CPL upgrade from %@ to %@, %@", v37, v6, v25];
    [v19 addObject:v26];

    v15 = v24;
  }
  uint64_t v27 = [(CPLSimpleUpgradeHistory *)self lastDBUpgradeDate];
  if (v27)
  {
    id v28 = objc_alloc((Class)NSString);
    int64_t v29 = [(CPLSimpleUpgradeHistory *)self previousDBVersion];
    int64_t v30 = [(CPLSimpleUpgradeHistory *)self lastSeenDBVersion];
    +[CPLDateFormatter stringFromDateAgo:v27 now:v40];
    v32 = CFStringRef v31 = v15;
    id v33 = [v28 initWithFormat:@"last DB upgrade from %lld to %lld, %@", v29, v30, v32];
    [v3 addObject:v33];

    v15 = v31;
  }
  uint64_t v34 = [v3 componentsJoinedByString:@"\n"];

  return (NSString *)v34;
}

+ (void)cleanupUnusedUpgradeHistoriesWithUsedBlock:(id)a3
{
  id v3 = (uint64_t (**)(id, void *))a3;
  uint64_t v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [@"_CPLUpgradeHistory-" length];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v27 = v4;
  CFStringRef v6 = [v4 dictionaryRepresentation];
  uint64_t v7 = [v6 allKeys];

  int64_t v8 = v7;
  id v9 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v9)
  {
    id v10 = v9;
    int64_t v30 = 0;
    uint64_t v11 = *(void *)v36;
    CFStringRef v12 = (char *)(v3 + 2);
    id v28 = v3;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v14 hasPrefix:@"_CPLUpgradeHistory-"])
        {
          v15 = [v14 substringFromIndex:v5];
          if ((v3[2](v3, v15) & 1) == 0)
          {
            id v16 = v12;
            uint64_t v17 = v8;
            id v18 = v5;
            id v19 = v30;
            if (!_CPLSilentLogging)
            {
              v20 = sub_1001B9990();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v15;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Removing unused history for %@", buf, 0xCu);
              }
            }
            if (!v30) {
              id v19 = objc_alloc_init((Class)NSMutableArray);
            }
            int64_t v30 = v19;
            [v19 addObject:v14];
            id v5 = v18;
            int64_t v8 = v17;
            CFStringRef v12 = v16;
            id v3 = v28;
            uint64_t v11 = v29;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v10);
  }
  else
  {
    int64_t v30 = 0;
  }

  CFStringRef v21 = v30;
  if ([v30 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v30;
    id v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          [v27 removeObjectForKey:*(void *)(*((void *)&v31 + 1) + 8 * (void)j)];
        }
        id v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v24);
    }

    [v27 synchronize];
    CFStringRef v21 = v30;
  }
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (BOOL)versionHasChanged
{
  return self->_versionHasChanged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_history, 0);
}

@end