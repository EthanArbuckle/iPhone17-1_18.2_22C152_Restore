@interface MapsSuggestionsEntry
+ (id)archivedDestinationForUniqueID:(id)a3;
+ (id)sharedDefaults;
+ (void)removeStaleArchivedDestinations;
- (id)notificationDetailsWithTitle:(id)a3 message:(id)a4;
- (void)archiveDestination;
@end

@implementation MapsSuggestionsEntry

+ (id)archivedDestinationForUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [a1 sharedDefaults];
    v6 = [v5 dataForKey:@"kSavedMapsCommuteDestinations"];
    *(void *)v13 = objc_opt_class();
    *(void *)&v13[8] = objc_opt_class();
    *(void *)&v13[16] = objc_opt_class();
    *(void *)&v13[24] = objc_opt_class();
    v7 = +[NSArray arrayWithObjects:v13 count:4];
    v8 = +[NSSet setWithArray:](NSSet, "setWithArray:", v7, *(void *)v13, *(void *)&v13[8], *(void *)&v13[16]);

    v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v6 error:0];
    v10 = [v9 objectForKeyedSubscript:@"kDestinationsKey"];

    v11 = [v10 objectForKeyedSubscript:v4];
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v13 = 136446978;
      *(void *)&v13[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/MapsSuggestionsEntry+DoomExtras.m";
      *(_WORD *)&v13[12] = 1024;
      *(_DWORD *)&v13[14] = 37;
      *(_WORD *)&v13[18] = 2082;
      *(void *)&v13[20] = "+[MapsSuggestionsEntry(DoomExtras) archivedDestinationForUniqueID:]";
      *(_WORD *)&v13[28] = 2082;
      *(void *)&v13[30] = "0u == uniqueID.length";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Desintation ID is nil", v13, 0x26u);
    }
    v11 = 0;
  }

  return v11;
}

+ (void)removeStaleArchivedDestinations
{
  v21 = [a1 sharedDefaults];
  uint64_t v2 = [v21 dataForKey:@"kSavedMapsCommuteDestinations"];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:v27 count:4];
  id v4 = +[NSSet setWithArray:v3];

  v20 = (void *)v2;
  v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v2 error:0];
  id v6 = [v5 mutableCopy];

  v7 = [v6 objectForKeyedSubscript:@"kDatesKey"];
  v8 = [v6 objectForKeyedSubscript:@"kDestinationsKey"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = [v7 allKeys];
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v15 = [v7 objectForKeyedSubscript:v14];
        [v15 timeIntervalSinceNow];
        double v17 = -v16;
        GEOConfigGetDouble();
        if (v18 < v17)
        {
          [v7 removeObjectForKey:v14];
          [v8 removeObjectForKey:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v19 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  [v21 setObject:v19 forKey:@"kSavedMapsCommuteDestinations"];
  [v21 synchronize];
}

- (void)archiveDestination
{
  v3 = [(MapsSuggestionsEntry *)self uniqueIdentifier];

  if (v3)
  {
    id v4 = [(id)objc_opt_class() sharedDefaults];
    v5 = [v4 dataForKey:@"kSavedMapsCommuteDestinations"];
    *(void *)double v18 = objc_opt_class();
    *(void *)&v18[8] = objc_opt_class();
    *(void *)&v18[16] = objc_opt_class();
    *(void *)&v18[24] = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:v18 count:4];
    v7 = +[NSSet setWithArray:](NSSet, "setWithArray:", v6, *(void *)v18, *(void *)&v18[8], *(void *)&v18[16]);

    v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v5 error:0];
    id v9 = [v8 mutableCopy];

    id v10 = [v9 objectForKeyedSubscript:@"kDatesKey"];
    id v11 = [v9 objectForKeyedSubscript:@"kDestinationsKey"];
    if (!v9)
    {
      id v9 = (id)objc_opt_new();
      uint64_t v12 = objc_opt_new();

      uint64_t v13 = objc_opt_new();
      [v9 setObject:v12 forKeyedSubscript:@"kDatesKey"];
      [v9 setObject:v13 forKeyedSubscript:@"kDestinationsKey"];
      id v10 = (void *)v12;
      id v11 = (void *)v13;
    }
    uint64_t v14 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
    [v11 setObject:self forKeyedSubscript:v14];

    v15 = MapsSuggestionsNow();
    double v16 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
    [v10 setObject:v15 forKeyedSubscript:v16];

    double v17 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
    [v4 setObject:v17 forKey:@"kSavedMapsCommuteDestinations"];
    [v4 synchronize];
  }
  else
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)double v18 = 136446978;
      *(void *)&v18[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/MapsSuggestionsEntry+DoomExtras.m";
      *(_WORD *)&v18[12] = 1024;
      *(_DWORD *)&v18[14] = 72;
      *(_WORD *)&v18[18] = 2082;
      *(void *)&v18[20] = "-[MapsSuggestionsEntry(DoomExtras) archiveDestination]";
      *(_WORD *)&v18[28] = 2082;
      *(void *)&v18[30] = "nil == (self.uniqueIdentifier)";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Destination ID is nil", v18, 0x26u);
    }
  }
}

- (id)notificationDetailsWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  GEOConfigGetDouble();
  double v9 = v8;
  id v10 = objc_alloc((Class)NSDate);
  id v11 = MapsSuggestionsNow();
  id v12 = [v10 initWithTimeInterval:v11 sinceDate:v9];

  id v13 = objc_alloc((Class)GEOCommuteNotificationDetails);
  uint64_t v14 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
  id v15 = [v13 initWithTitle:v7 message:v6 commuteDetailsIdentifier:v14 expirationDate:v12 score:1];

  return v15;
}

+ (id)sharedDefaults
{
  if (qword_1000A25C8 != -1) {
    dispatch_once(&qword_1000A25C8, &stru_10008C3C8);
  }
  uint64_t v2 = (void *)qword_1000A25C0;

  return v2;
}

@end