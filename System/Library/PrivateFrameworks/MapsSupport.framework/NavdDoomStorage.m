@interface NavdDoomStorage
+ (BOOL)supportsSecureCoding;
- (CLLocation)mostRecentLocation;
- (NSArray)mostRecentDestinations;
- (NSDate)mostRecentAlert;
- (NSDate)mostRecentExitTime;
- (NSDate)mostRecentModification;
- (NSDate)mostRecentStart;
- (NSDate)nextAllowedRequestTime;
- (NSDate)nextWakeup;
- (NSDateInterval)mostRecentDoomWindow;
- (NSDictionary)mostRecentRoutesPerDestination;
- (NSSet)cachedIncidents;
- (NSString)JSONString;
- (NSString)statusString;
- (NavdDoomStorage)init;
- (NavdDoomStorage)initWithCoder:(id)a3;
- (id)_readObjectFromKey:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nameForJSON;
- (id)newIncidentsForDestination:(id)a3;
- (id)objectForJSON;
- (unint64_t)numberOfAlertableRoutes;
- (unint64_t)numberOfDirectionRequests;
- (unint64_t)numberOfUpdatesToDestinations;
- (unint64_t)numberOfUpdatesToExitTime;
- (unint64_t)numberOfUpdatesToRoutes;
- (unint64_t)numberOfUpdatesToRoutesPerDestination;
- (unint64_t)reasonForEnd;
- (unint64_t)status;
- (unint64_t)version;
- (void)_writeObject:(id)a3 toKey:(unint64_t)a4 updateModTime:(BOOL)a5;
- (void)clear;
- (void)completeWindowBecause:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedIncidents:(id)a3;
- (void)setMostRecentAlert:(id)a3;
- (void)setMostRecentDestinations:(id)a3;
- (void)setMostRecentDoomWindow:(id)a3;
- (void)setMostRecentExitTime:(id)a3;
- (void)setMostRecentLocation:(id)a3;
- (void)setMostRecentRoutesPerDestination:(id)a3;
- (void)setMostRecentStart:(id)a3;
- (void)setNextAllowedRequestTime:(id)a3;
- (void)setNextWakeup:(id)a3;
- (void)setNumberOfAlertableRoutes:(unint64_t)a3;
- (void)setNumberOfDirectionRequests:(unint64_t)a3;
- (void)setNumberOfUpdatesToDestinations:(unint64_t)a3;
- (void)setNumberOfUpdatesToExitTime:(unint64_t)a3;
- (void)setNumberOfUpdatesToRoutes:(unint64_t)a3;
- (void)setNumberOfUpdatesToRoutesPerDestination:(unint64_t)a3;
- (void)setReasonForEnd:(unint64_t)a3;
- (void)updateWithIncidents:(id)a3;
@end

@implementation NavdDoomStorage

- (NavdDoomStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)NavdDoomStorage;
  v2 = [(NavdDoomStorage *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:12];
    dict = v2->_dict;
    v2->_dict = v3;

    [(NSMutableDictionary *)v2->_dict setObject:&off_100090930 forKeyedSubscript:@"NavdDoomStorageKeyVersion"];
    v5 = v2;
  }

  return v2;
}

- (id)_readObjectFromKey:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (a3 - 1 > 0x12) {
    CFStringRef v5 = @"NavdDoomStorageKeyUnknown";
  }
  else {
    CFStringRef v5 = off_10008BC58[a3 - 1];
  }
  v6 = [(NSMutableDictionary *)v4->_dict objectForKeyedSubscript:v5];
  objc_sync_exit(v4);

  return v6;
}

- (void)_writeObject:(id)a3 toKey:(unint64_t)a4 updateModTime:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  v8 = self;
  objc_sync_enter(v8);
  id v9 = [v13 copy];
  if (a4 - 1 > 0x12) {
    CFStringRef v10 = @"NavdDoomStorageKeyUnknown";
  }
  else {
    CFStringRef v10 = off_10008BC58[a4 - 1];
  }
  [(NSMutableDictionary *)v8->_dict setObject:v9 forKeyedSubscript:v10];

  if (v5)
  {
    v11 = MapsSuggestionsNow();
    id v12 = [v11 copy];
    [(NSMutableDictionary *)v8->_dict setObject:v12 forKeyedSubscript:@"NavdDoomStorageKeyMostRecentModification"];
  }
  objc_sync_exit(v8);
}

- (unint64_t)version
{
  v2 = [(NavdDoomStorage *)self _readObjectFromKey:1];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (NSDate)mostRecentStart
{
  return (NSDate *)[(NavdDoomStorage *)self _readObjectFromKey:2];
}

- (void)setMostRecentStart:(id)a3
{
}

- (NSDate)mostRecentModification
{
  return (NSDate *)[(NavdDoomStorage *)self _readObjectFromKey:3];
}

- (unint64_t)status
{
  id v3 = [(NavdDoomStorage *)self mostRecentAlert];

  if (v3) {
    return 5;
  }
  BOOL v5 = [(NavdDoomStorage *)self mostRecentRoutesPerDestination];

  if (v5) {
    return 4;
  }
  v6 = [(NavdDoomStorage *)self mostRecentDestinations];

  if (v6) {
    return 3;
  }
  objc_super v7 = [(NavdDoomStorage *)self mostRecentDoomWindow];

  if (v7) {
    return 2;
  }
  v8 = [(NavdDoomStorage *)self mostRecentExitTime];
  unint64_t v4 = v8 != 0;

  return v4;
}

- (CLLocation)mostRecentLocation
{
  return (CLLocation *)[(NavdDoomStorage *)self _readObjectFromKey:5];
}

- (void)setMostRecentLocation:(id)a3
{
}

- (NSDate)mostRecentExitTime
{
  return (NSDate *)[(NavdDoomStorage *)self _readObjectFromKey:6];
}

- (void)setMostRecentExitTime:(id)a3
{
}

- (NSDateInterval)mostRecentDoomWindow
{
  return (NSDateInterval *)[(NavdDoomStorage *)self _readObjectFromKey:7];
}

- (void)setMostRecentDoomWindow:(id)a3
{
}

- (NSArray)mostRecentDestinations
{
  return (NSArray *)[(NavdDoomStorage *)self _readObjectFromKey:8];
}

- (void)setMostRecentDestinations:(id)a3
{
}

- (NSDictionary)mostRecentRoutesPerDestination
{
  return (NSDictionary *)[(NavdDoomStorage *)self _readObjectFromKey:9];
}

- (void)setMostRecentRoutesPerDestination:(id)a3
{
}

- (NSSet)cachedIncidents
{
  return (NSSet *)[(NavdDoomStorage *)self _readObjectFromKey:18];
}

- (void)setCachedIncidents:(id)a3
{
}

- (NSDate)nextAllowedRequestTime
{
  v2 = [(NavdDoomStorage *)self _readObjectFromKey:19];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    MapsSuggestionsNow();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v5 = v4;

  return (NSDate *)v5;
}

- (void)setNextAllowedRequestTime:(id)a3
{
}

- (NSDate)mostRecentAlert
{
  return (NSDate *)[(NavdDoomStorage *)self _readObjectFromKey:10];
}

- (void)setMostRecentAlert:(id)a3
{
}

- (NSDate)nextWakeup
{
  return (NSDate *)[(NavdDoomStorage *)self _readObjectFromKey:11];
}

- (void)setNextWakeup:(id)a3
{
}

- (unint64_t)numberOfUpdatesToExitTime
{
  v2 = [(NavdDoomStorage *)self _readObjectFromKey:12];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setNumberOfUpdatesToExitTime:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");
}

- (unint64_t)numberOfUpdatesToDestinations
{
  v2 = [(NavdDoomStorage *)self _readObjectFromKey:13];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setNumberOfUpdatesToDestinations:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");
}

- (unint64_t)numberOfUpdatesToRoutesPerDestination
{
  v2 = [(NavdDoomStorage *)self _readObjectFromKey:14];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setNumberOfUpdatesToRoutesPerDestination:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");
}

- (unint64_t)numberOfDirectionRequests
{
  v2 = [(NavdDoomStorage *)self _readObjectFromKey:15];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setNumberOfDirectionRequests:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");
}

- (unint64_t)numberOfAlertableRoutes
{
  v2 = [(NavdDoomStorage *)self _readObjectFromKey:16];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setNumberOfAlertableRoutes:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");
}

- (unint64_t)reasonForEnd
{
  v2 = [(NavdDoomStorage *)self _readObjectFromKey:17];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setReasonForEnd:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");
}

- (void)completeWindowBecause:(unint64_t)a3
{
  BOOL v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = @"NavdDoomStorageReasonUnknown";
    if (a3 == 1) {
      v6 = @"NavdDoomStorageReasonWindowExpired";
    }
    if (a3 == 2) {
      v6 = @"NavdDoomStorageReasonNewLOI";
    }
    *(_DWORD *)v19 = 138412290;
    *(void *)&v19[4] = v6;
    objc_super v7 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "completeWindowBecause:%@", v19, 0xCu);
  }
  v8 = [(NavdDoomStorage *)self mostRecentDoomWindow];
  BOOL v9 = v8 == 0;

  if (!v9)
  {
    id v10 = objc_alloc((Class)NSDateInterval);
    v11 = [(NavdDoomStorage *)self mostRecentDoomWindow];
    id v12 = [v11 startDate];
    id v13 = MapsSuggestionsNow();
    v14 = [v12 earlierDate:v13];
    id v15 = [v14 copy];
    v16 = MapsSuggestionsNow();
    id v17 = [v16 copy];
    id v18 = [v10 initWithStartDate:v15 endDate:v17];
    [(NavdDoomStorage *)self setMostRecentDoomWindow:v18];
  }
  -[NavdDoomStorage setReasonForEnd:](self, "setReasonForEnd:", a3, *(_OWORD *)v19);
}

- (NSString)statusString
{
  switch([(NavdDoomStorage *)self status])
  {
    case 1uLL:
      id v3 = &stru_10008D5E8;
      id v4 = [(NavdDoomStorage *)self mostRecentDoomWindow];

      if (v4)
      {
        BOOL v5 = [(NavdDoomStorage *)self mostRecentDoomWindow];
        +[NSString stringWithFormat:@" (DoomWindow = %@)", v5];
        id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v6 = [(NavdDoomStorage *)self mostRecentExitTime];
      +[NSString stringWithFormat:@"DOoM ExitTime := %@%@", v6, v3];
      objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    case 2uLL:
      id v3 = [(NavdDoomStorage *)self mostRecentDoomWindow];
      uint64_t v8 = +[NSString stringWithFormat:@"DOoM DoomWindow := %@", v3];
      goto LABEL_10;
    case 3uLL:
      id v3 = [(NavdDoomStorage *)self mostRecentDestinations];
      uint64_t v8 = +[NSString stringWithFormat:@"DOoM Destinations := %@", v3];
      goto LABEL_10;
    case 4uLL:
      id v3 = [(NavdDoomStorage *)self mostRecentRoutesPerDestination];
      uint64_t v8 = +[NSString stringWithFormat:@"DOoM Routes := %@", v3];
      goto LABEL_10;
    case 5uLL:
      id v3 = [(NavdDoomStorage *)self mostRecentAlert];
      uint64_t v8 = +[NSString stringWithFormat:@"DOoM Alert := %@", v3];
LABEL_10:
      objc_super v7 = (__CFString *)v8;
LABEL_11:

      break;
    default:
      objc_super v7 = @"DOoM Initialized";
      break;
  }

  return (NSString *)v7;
}

- (void)clear
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(NavdDoomStorage *)obj cachedIncidents];
  id v3 = [v2 copy];

  [(NSMutableDictionary *)obj->_dict removeAllObjects];
  id v4 = MapsSuggestionsNow();
  id v5 = [v4 copy];
  [(NSMutableDictionary *)obj->_dict setObject:v5 forKeyedSubscript:@"NavdDoomStorageKeyMostRecentStart"];

  v6 = MapsSuggestionsNow();
  id v7 = [v6 copy];
  [(NSMutableDictionary *)obj->_dict setObject:v7 forKeyedSubscript:@"NavdDoomStorageKeyMostRecentModification"];

  [(NSMutableDictionary *)obj->_dict setObject:v3 forKeyedSubscript:@"NavdDoomStorageKeyCachedIncidents"];
  objc_sync_exit(obj);
}

- (NSString)JSONString
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = +[NSJSONSerialization dataWithJSONObject:v2->_dict options:0 error:0];
  id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];

  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (void)updateWithIncidents:(id)a3
{
  id v20 = a3;
  id v4 = objc_opt_new();
  [(NavdDoomStorage *)self cachedIncidents];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v10 = [v9 expiryDate];
        BOOL v11 = MapsSuggestionsIsInTheFuture(v10);

        if (v11) {
          [v4 addObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v20;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
        id v17 = [v16 expiryDate];
        if (MapsSuggestionsIsInTheFuture(v17))
        {
          unsigned __int8 v18 = [v4 containsObject:v16];

          if ((v18 & 1) == 0) {
            [v4 addObject:v16];
          }
        }
        else
        {
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }

  id v19 = [v4 copy];
  [(NavdDoomStorage *)self setCachedIncidents:v19];
}

- (id)newIncidentsForDestination:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NavdDoomStorage *)self cachedIncidents];
    id v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = [v4 uniqueIdentifier];
      uint64_t v8 = +[NSPredicate predicateWithFormat:@"shouldSuppress == 0 AND destinationID = %@", v7];

      BOOL v9 = [(NavdDoomStorage *)self cachedIncidents];
      id v10 = [v9 filteredSetUsingPredicate:v8];
      id v11 = [v10 copy];
    }
    else
    {
      id v11 = (id)objc_opt_new();
    }
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomStorage.mm";
      __int16 v16 = 1024;
      int v17 = 485;
      __int16 v18 = 2082;
      id v19 = "-[NavdDoomStorage newIncidentsForDestination:]";
      __int16 v20 = 2082;
      long long v21 = "destination == nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Destination must not be nil", buf, 0x26u);
    }

    id v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NavdDoomStorage)initWithCoder:(id)a3
{
  id v24 = a3;
  id v4 = [(NavdDoomStorage *)self init];
  if (v4)
  {
    uint64_t v23 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    id v15 = [v24 decodeObjectOfClasses:v14 forKey:@"navdDoomStorageDict"];
    __int16 v16 = [(NSMutableDictionary *)v4->_dict objectForKeyedSubscript:@"NavdDoomStorageKeyVersion"];
    id v17 = [v16 unsignedIntegerValue];

    if (v17 == (id)1)
    {
      __int16 v18 = (NSMutableDictionary *)[v15 mutableCopy];
      dict = v4->_dict;
      v4->_dict = v18;
    }
    else
    {
      long long v21 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        int v26 = (int)v17;
        __int16 v27 = 1024;
        int v28 = 1;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Read old version %u, which is not current %u", buf, 0xEu);
      }

      id v4 = [(NavdDoomStorage *)v4 init];
    }
    __int16 v20 = v4;
  }
  else
  {
    __int16 v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_dict copy];
  [v6 encodeObject:v5 forKey:@"navdDoomStorageDict"];

  objc_sync_exit(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  objc_sync_enter(v3);
  id v4 = objc_alloc_init(NavdDoomStorage);
  id v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](v3->_dict, "count"));
  dict = v4->_dict;
  v4->_dict = v5;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = v3->_dict;
  id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](v3->_dict, "objectForKeyedSubscript:", v11, (void)v15);
        id v13 = [v12 copy];
        [(NSMutableDictionary *)v4->_dict setObject:v13 forKeyedSubscript:v11];
      }
      id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v3);
  return v4;
}

- (id)nameForJSON
{
  v2 = objc_opt_class();

  return [v2 description];
}

- (id)objectForJSON
{
  id v90 = objc_alloc_init((Class)NSMutableDictionary);
  MapsSuggestionsNow();
  v2 = (MSg *)objc_claimAutoreleasedReturnValue();
  id v4 = MSg::jsonFor(v2, v3);
  [v90 setObject:v4 forKeyedSubscript:@"currentTime"];

  MapsSuggestionsMostRecentLocation();
  id v5 = (MSg *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = MSg::jsonFor(v5, v6);
  [v90 setObject:v7 forKeyedSubscript:@"currentLocation"];

  id v8 = [(NavdDoomStorage *)self mostRecentStart];
  uint64_t v10 = MSg::jsonFor(v8, v9);
  [v90 setObject:v10 forKeyedSubscript:@"lastRun"];

  uint64_t v11 = [(NavdDoomStorage *)self mostRecentModification];
  id v13 = MSg::jsonFor(v11, v12);
  [v90 setObject:v13 forKeyedSubscript:@"mtime"];

  [(NavdDoomStorage *)self status];
  uint64_t v14 = MSg::jsonFor();
  [v90 setObject:v14 forKeyedSubscript:@"status"];

  long long v15 = [(NavdDoomStorage *)self mostRecentExitTime];
  long long v17 = MSg::jsonFor(v15, v16);
  [v90 setObject:v17 forKeyedSubscript:@"exitTime"];

  long long v18 = [(NavdDoomStorage *)self mostRecentDoomWindow];
  __int16 v20 = MSg::jsonFor(v18, v19);
  [v90 setObject:v20 forKeyedSubscript:@"doomWindow"];

  [(NavdDoomStorage *)self reasonForEnd];
  long long v21 = MSg::jsonFor();
  [v90 setObject:v21 forKeyedSubscript:@"endReason"];

  long long v22 = [(NavdDoomStorage *)self mostRecentDestinations];
  uint64_t v23 = MSg::jsonFor();
  [v90 setObject:v23 forKeyedSubscript:@"destinations"];

  id v88 = [(NavdDoomStorage *)self mostRecentRoutesPerDestination];
  if (v88)
  {
    id v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v88, "count"));
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id obj = v88;
    v92 = v24;
    id v93 = [obj countByEnumeratingWithState:&v111 objects:v117 count:16];
    if (v93)
    {
      uint64_t v91 = *(void *)v112;
      do
      {
        for (i = 0; i != v93; i = (char *)i + 1)
        {
          if (*(void *)v112 != v91) {
            objc_enumerationMutation(obj);
          }
          long long v25 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          v95 = [obj objectForKeyedSubscript:v25];
          v115[0] = @"destination";
          id v26 = v25;
          __int16 v27 = v26;
          if (v26)
          {
            *(void *)&long long v119 = @"type";
            [v26 type];
            v109 = NSStringFromMapsSuggestionsEntryType();
            v107 = MSg::jsonFor();
            v118[0] = v107;
            *((void *)&v119 + 1) = @"title";
            v105 = [v27 title];
            v103 = MSg::jsonFor();
            v118[1] = v103;
            *(void *)&long long v120 = @"subtitle";
            int v28 = [v27 subtitle];
            v29 = MSg::jsonFor();
            v118[2] = v29;
            *((void *)&v120 + 1) = @"location";
            v30 = [v27 numberForKey:@"MapsSuggestionsLatitudeKey"];
            v31 = MSg::jsonFor();
            v124 = v31;
            v32 = [v27 numberForKey:@"MapsSuggestionsLongitudeKey"];
            v33 = MSg::jsonFor();
            v125 = v33;
            v34 = +[NSArray arrayWithObjects:&v124 count:2];
            v118[3] = v34;
            *(void *)&long long v121 = @"address";
            v35 = [v27 stringForKey:@"MapsSuggestionsDestinationAddressKey"];
            v36 = MSg::jsonFor();
            v118[4] = v36;
            v96 = +[NSDictionary dictionaryWithObjects:v118 forKeys:&v119 count:5];
          }
          else
          {
            v96 = +[NSNull null];
          }

          v115[1] = @"routes";
          v116[0] = v96;
          id v98 = v95;
          if (v98)
          {
            id v37 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v98, "count"));
            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            id v99 = v98;
            v101 = v37;
            id v38 = [v99 countByEnumeratingWithState:&v119 objects:v118 count:16];
            if (v38)
            {
              uint64_t v100 = *(void *)v120;
              do
              {
                id v102 = v38;
                for (j = 0; j != v102; j = (char *)j + 1)
                {
                  if (*(void *)v120 != v100) {
                    objc_enumerationMutation(v99);
                  }
                  id v40 = *(id *)(*((void *)&v119 + 1) + 8 * (void)j);
                  v110 = v40;
                  if (v40)
                  {
                    v41 = [v40 outOfMapsAlertsInfo];
                    v42 = [v41 alertNonRecommendedRouteText];
                    v106 = [v42 responseAlertSecondary];

                    v43 = [v110 outOfMapsAlertsInfo];
                    uint64_t v44 = [v43 alertNonRecommendedRouteText];
                    v104 = [(id)v44 responseAlertSecondary];

                    v123[0] = @"name";
                    id v45 = v110;
                    v46 = [v45 names];
                    LOBYTE(v44) = [v46 count] == 0;

                    if (v44)
                    {
                      v108 = 0;
                    }
                    else
                    {
                      v47 = [v45 names];
                      v48 = [v47 firstObject];
                      v108 = [v48 name];
                    }
                    v50 = MSg::jsonFor();
                    v124 = v50;
                    v123[1] = @"alert1";
                    id v51 = v106;
                    if (v51)
                    {
                      v52 = +[NSString _navigation_stringForServerFormattedString:v51];
                      v53 = MSg::jsonFor();
                    }
                    else
                    {
                      v53 = +[NSNull null];
                    }

                    v125 = v53;
                    v123[2] = @"alert2";
                    id v54 = v104;
                    if (v54)
                    {
                      v55 = +[NSString _navigation_stringForServerFormattedString:v54];
                      v56 = MSg::jsonFor();
                    }
                    else
                    {
                      v56 = +[NSNull null];
                    }

                    v126 = v56;
                    v123[3] = @"expectedTime";
                    id v57 = v45;
                    v58 = [v57 traversalTimes];
                    unsigned int v59 = [v58 estimatedSeconds];

                    v60 = +[NSNumber numberWithDouble:(double)v59];
                    v61 = MSg::jsonFor();
                    v127 = v61;
                    v49 = +[NSDictionary dictionaryWithObjects:&v124 forKeys:v123 count:4];
                  }
                  else
                  {
                    v49 = +[NSNull null];
                  }

                  [v101 addObject:v49];
                }
                id v38 = [v99 countByEnumeratingWithState:&v119 objects:v118 count:16];
              }
              while (v38);
            }
          }
          else
          {
            v101 = +[NSNull null];
          }

          v116[1] = v101;
          v62 = +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:2];

          [v92 addObject:v62];
        }
        id v93 = [obj countByEnumeratingWithState:&v111 objects:v117 count:16];
      }
      while (v93);
    }
  }
  else
  {
    v92 = +[NSNull null];
  }

  [v90 setObject:v92 forKeyedSubscript:@"routes"];
  v63 = [(NavdDoomStorage *)self cachedIncidents];
  v65 = MSg::jsonFor((MSg *)(v63 != 0), v64);
  [v90 setObject:v65 forKeyedSubscript:@"cachedIncidents"];

  v66 = [(NavdDoomStorage *)self mostRecentAlert];
  v68 = MSg::jsonFor(v66, v67);
  [v90 setObject:v68 forKeyedSubscript:@"alert"];

  v69 = [(NavdDoomStorage *)self nextWakeup];
  v71 = MSg::jsonFor(v69, v70);
  [v90 setObject:v71 forKeyedSubscript:@"nextWakeup"];

  v72 = [(NavdDoomStorage *)self nextAllowedRequestTime];
  v74 = MSg::jsonFor(v72, v73);
  [v90 setObject:v74 forKeyedSubscript:@"nextAllowedRequestTime"];

  v75 = +[NSNumber numberWithUnsignedInteger:[(NavdDoomStorage *)self numberOfUpdatesToExitTime]];
  v76 = MSg::jsonFor();
  [v90 setObject:v76 forKeyedSubscript:@"numberOfUpdatesToExitTime"];

  v77 = +[NSNumber numberWithUnsignedInteger:[(NavdDoomStorage *)self numberOfUpdatesToDestinations]];
  v78 = MSg::jsonFor();
  [v90 setObject:v78 forKeyedSubscript:@"numberOfUpdatesToDestinations"];

  v79 = +[NSNumber numberWithUnsignedInteger:[(NavdDoomStorage *)self numberOfUpdatesToRoutes]];
  v80 = MSg::jsonFor();
  [v90 setObject:v80 forKeyedSubscript:@"numberOfUpdatesToRoutes"];

  v81 = +[NSNumber numberWithUnsignedInteger:[(NavdDoomStorage *)self numberOfDirectionRequests]];
  v82 = MSg::jsonFor();
  [v90 setObject:v82 forKeyedSubscript:@"numberOfDirectionRequests"];

  v83 = +[NSNumber numberWithUnsignedInteger:[(NavdDoomStorage *)self numberOfAlertableRoutes]];
  v84 = MSg::jsonFor();
  [v90 setObject:v84 forKeyedSubscript:@"numberOfAlertableRoutes"];

  id v85 = [v90 copy];
  v86 = MSg::jsonFor();

  return v86;
}

- (unint64_t)numberOfUpdatesToRoutes
{
  return self->_numberOfUpdatesToRoutes;
}

- (void)setNumberOfUpdatesToRoutes:(unint64_t)a3
{
  self->_numberOfUpdatesToRoutes = a3;
}

- (void).cxx_destruct
{
}

@end