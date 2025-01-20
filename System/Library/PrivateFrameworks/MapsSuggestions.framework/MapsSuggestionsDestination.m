@interface MapsSuggestionsDestination
+ (BOOL)supportsSecureCoding;
+ (MapsSuggestionsDestination)destinationWithData:(id)a3;
- (BOOL)addContainedBreadcrumb:(id)a3;
- (BOOL)addContainedEntry:(id)a3;
- (BOOL)hasBeenVisited;
- (BOOL)hasEntriesInTheFuture;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDestination:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (MapsSuggestionsDestination)initWithCoder:(id)a3;
- (MapsSuggestionsDestination)initWithEntry:(id)a3;
- (MapsSuggestionsDestination)initWithLocation:(id)a3 label:(id)a4;
- (NSString)description;
- (double)couldContainEntry:(id)a3;
- (double)couldContainLocation:(id)a3;
- (double)couldContainTime:(id)a3;
- (double)radius;
- (id)breadcrumbs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)earliestKnownTime;
- (id)entries;
- (id)entryAtTime:(id)a3;
- (id)firstEntryAfterTime:(id)a3;
- (id)firstEntryDuringPeriod:(id)a3;
- (id)label;
- (id)latestKnownTime;
- (id)location;
- (id)longDescription;
- (id)nameForJSON;
- (id)objectForJSON;
- (unint64_t)removeExpiredEntries;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MapsSuggestionsDestination

- (MapsSuggestionsDestination)initWithEntry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v31.receiver = self;
    v31.super_class = (Class)MapsSuggestionsDestination;
    v5 = [(MapsSuggestionsDestination *)&v31 init];
    if (v5)
    {
      v6 = [v4 undecoratedTitle];
      v7 = (NSString *)[v6 copy];
      label = v5->_label;
      v5->_label = v7;

      id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v4, 0);
      sub_100020078((uint64_t)v5, v9);

      id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
      sub_100020110((uint64_t)v5, v10);

      uint64_t v11 = +[NSDate distantFuture];
      earliestExpiration = v5->_earliestExpiration;
      v5->_earliestExpiration = (NSDate *)v11;

      if ([v4 containsKey:@"MapsSuggestionsEarliestTimeKey"])
      {
        uint64_t v13 = [v4 dateForKey:@"MapsSuggestionsEarliestTimeKey"];
        earliestArrivalDate = v5->_earliestArrivalDate;
        v5->_earliestArrivalDate = (NSDate *)v13;
      }
      if (!v5->_earliestArrivalDate
        && [v4 containsKey:@"MapsSuggestionsScheduledTimeKey"])
      {
        uint64_t v15 = [v4 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
        v16 = v5->_earliestArrivalDate;
        v5->_earliestArrivalDate = (NSDate *)v15;
      }
      if ([v4 containsKey:@"MapsSuggestionsLatestTimeKey"])
      {
        uint64_t v17 = [v4 dateForKey:@"MapsSuggestionsLatestTimeKey"];
        latestDepartureDate = v5->_latestDepartureDate;
        v5->_latestDepartureDate = (NSDate *)v17;
      }
      if (!v5->_latestDepartureDate
        && [v4 containsKey:@"MapsSuggestionsScheduledEndTimeKey"])
      {
        uint64_t v19 = [v4 dateForKey:@"MapsSuggestionsScheduledEndTimeKey"];
        v20 = v5->_latestDepartureDate;
        v5->_latestDepartureDate = (NSDate *)v19;
      }
      v21 = [v4 expires];
      BOOL v22 = v21 == 0;

      if (!v22)
      {
        uint64_t v23 = [v4 expires];
        v24 = v5->_earliestExpiration;
        v5->_earliestExpiration = (NSDate *)v23;
      }
      if (MapsSuggestionsCoordinateFromEntry())
      {
        id v25 = objc_alloc((Class)CLLocation);
        v26 = (CLLocation *)[v25 initWithLatitude:*(double *)buf longitude:*(double *)&buf[8]];
        likelyLocation = v5->_likelyLocation;
        v5->_likelyLocation = v26;
      }
    }
    self = v5;
    v28 = self;
  }
  else
  {
    v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 93;
      __int16 v33 = 2082;
      v34 = "-[MapsSuggestionsDestination initWithEntry:]";
      __int16 v35 = 2082;
      v36 = "nil == (entry)";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }

    v28 = 0;
  }

  return v28;
}

- (MapsSuggestionsDestination)initWithLocation:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      BOOL v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v23 = 1024;
      int v24 = 130;
      __int16 v25 = 2082;
      v26 = "-[MapsSuggestionsDestination initWithLocation:label:]";
      __int16 v27 = 2082;
      v28 = "nil == (location)";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v7)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      BOOL v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v23 = 1024;
      int v24 = 131;
      __int16 v25 = 2082;
      v26 = "-[MapsSuggestionsDestination initWithLocation:label:]";
      __int16 v27 = 2082;
      v28 = "nil == (label)";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a label", buf, 0x26u);
    }
LABEL_11:

    uint64_t v17 = 0;
    goto LABEL_12;
  }
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsDestination;
  id v9 = [(MapsSuggestionsDestination *)&v20 init];
  if (v9)
  {
    id v10 = (NSString *)[v8 copy];
    label = v9->_label;
    v9->_label = v10;

    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    sub_100020078((uint64_t)v9, v12);

    id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    sub_100020110((uint64_t)v9, v13);

    v14 = (CLLocation *)[v6 copy];
    likelyLocation = v9->_likelyLocation;
    v9->_likelyLocation = v14;

    v16 = [[MapsSuggestionsBreadcrumb alloc] initWithLocation:v9->_likelyLocation];
    sub_1000204D0((uint64_t)v9, v16);
  }
  self = v9;
  uint64_t v17 = self;
LABEL_12:

  return v17;
}

- (id)entries
{
  v3 = self->_entries;
  objc_sync_enter(v3);
  id v4 = self->_entries;
  objc_sync_exit(v3);

  return v4;
}

- (id)breadcrumbs
{
  v3 = self->_breadcrumbs;
  objc_sync_enter(v3);
  id v4 = self->_breadcrumbs;
  objc_sync_exit(v3);

  return v4;
}

- (id)label
{
  return self->_label;
}

- (id)location
{
  return self->_likelyLocation;
}

- (CLLocationCoordinate2D)coordinate
{
  [(CLLocation *)self->_likelyLocation coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (double)radius
{
  [(CLLocation *)self->_likelyLocation horizontalAccuracy];
  double v3 = v2;
  if (qword_100081E78 != -1) {
    dispatch_once(&qword_100081E78, &stru_100071A50);
  }
  double result = *(double *)&qword_100081E68;
  double v5 = *(double *)&qword_100081E70;
  if (*(double *)&qword_100081E70 <= v3) {
    double v5 = v3;
  }
  if (*(double *)&qword_100081E68 >= v3) {
    return v5;
  }
  return result;
}

- (BOOL)addContainedEntry:(id)a3
{
  id v4 = (char *)a3;
  if (v4)
  {
    if ((MapsSuggestionsCoordinateFromEntry() & 1) == 0)
    {
      double v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "We don't know where this entry is: %@", buf, 0xCu);
      }
      LOBYTE(v12) = 0;
      goto LABEL_38;
    }
    double v5 = [objc_alloc((Class)CLLocation) initWithLatitude:v48 longitude:v49];
    id v6 = self->_entries;
    objc_sync_enter(v6);
    p_likelyLocation = &self->_likelyLocation;
    if (self->_likelyLocation || sub_1000205BC((id *)&self->super.isa) != (id *)1)
    {
      objc_sync_exit(v6);

      if (*p_likelyLocation)
      {
        [(CLLocation *)*p_likelyLocation distanceFromLocation:v5];
        double v17 = v16;
        [(MapsSuggestionsDestination *)self radius];
        if (v17 > v18)
        {
          GEOFindOrCreateLog();
          id v6 = (NSMutableArray *)(id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_DEBUG))
          {
            v46 = [v4 title];
            *(_DWORD *)buf = 138412546;
            v51 = v46;
            __int16 v52 = 2048;
            *(double *)v53 = v17;
            _os_log_impl((void *)&_mh_execute_header, &v6->super.super, OS_LOG_TYPE_DEBUG, "This entry: %@ is further than %.2fm away", buf, 0x16u);
          }
          LOBYTE(v12) = 0;
          goto LABEL_37;
        }
        uint64_t v19 = self->_entries;
        objc_sync_enter(v19);
        entries = self->_entries;
        v21 = [v4 uniqueIdentifier];
        LOBYTE(entries) = [(NSMutableArray *)entries containsEntryWithIdentifier:v21];

        if ((entries & 1) == 0) {
          [(NSMutableArray *)self->_entries addObject:v4];
        }
        objc_sync_exit(v19);

        if ([v4 containsKey:@"MapsSuggestionsScheduledTimeKey"])
        {
          earliestArrivalDate = self->_earliestArrivalDate;
          __int16 v23 = [v4 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
          int v24 = [(NSDate *)earliestArrivalDate earlierDate:v23];
          __int16 v25 = self->_earliestArrivalDate;
          self->_earliestArrivalDate = v24;
        }
        if ([v4 containsKey:@"MapsSuggestionsEarliestTimeKey"])
        {
          v26 = self->_earliestArrivalDate;
          __int16 v27 = [v4 dateForKey:@"MapsSuggestionsEarliestTimeKey"];
          v28 = [(NSDate *)v26 earlierDate:v27];
          v29 = self->_earliestArrivalDate;
          self->_earliestArrivalDate = v28;
        }
        if ([v4 containsKey:@"MapsSuggestionsScheduledEndTimeKey"])
        {
          latestDepartureDate = self->_latestDepartureDate;
          objc_super v31 = [v4 dateForKey:@"MapsSuggestionsScheduledEndTimeKey"];
          v32 = [(NSDate *)latestDepartureDate laterDate:v31];
          __int16 v33 = self->_latestDepartureDate;
          self->_latestDepartureDate = v32;
        }
        if ([v4 containsKey:@"MapsSuggestionsLatestTimeKey"])
        {
          v34 = self->_latestDepartureDate;
          __int16 v35 = [v4 dateForKey:@"MapsSuggestionsLatestTimeKey"];
          v36 = [(NSDate *)v34 laterDate:v35];
          v37 = self->_latestDepartureDate;
          self->_latestDepartureDate = v36;
        }
        v38 = [v4 expires];
        BOOL v39 = v38 == 0;

        if (v39)
        {
          LOBYTE(v12) = 1;
          goto LABEL_38;
        }
        earliestExpiration = self->_earliestExpiration;
        id v6 = [v4 expires];
        v41 = [(NSDate *)earliestExpiration earlierDate:v6];
        v42 = self->_earliestExpiration;
        self->_earliestExpiration = v41;
      }
      else
      {
        objc_storeStrong((id *)&self->_likelyLocation, v5);
        v43 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          label = self->_label;
          likelyLocation = self->_likelyLocation;
          *(_DWORD *)buf = 138412546;
          v51 = (const char *)label;
          __int16 v52 = 2112;
          *(void *)v53 = likelyLocation;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Aha! Destination '%@' is at %@", buf, 0x16u);
        }

        id v6 = self->_entries;
        objc_sync_enter(v6);
        [(NSMutableArray *)self->_entries addObject:v4];
        objc_sync_exit(v6);
      }
      LOBYTE(v12) = 1;
    }
    else
    {
      v8 = [v4 uniqueIdentifier];
      id v9 = [(MapsSuggestionsDestination *)self entries];
      id v10 = [v9 firstObject];
      uint64_t v11 = [v10 uniqueIdentifier];
      unsigned int v12 = [v8 isEqualToString:v11];

      if (v12)
      {
        id v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = self->_label;
          *(_DWORD *)buf = 138412290;
          v51 = (const char *)v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "A repetition of the same location-less Destination '%@'", buf, 0xCu);
        }

        [(NSMutableArray *)self->_entries setObject:v4 atIndexedSubscript:0];
      }
      objc_sync_exit(v6);
    }
LABEL_37:

LABEL_38:
    goto LABEL_39;
  }
  uint64_t v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    v51 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
    __int16 v52 = 1024;
    *(_DWORD *)v53 = 220;
    *(_WORD *)&v53[4] = 2082;
    *(void *)&v53[6] = "-[MapsSuggestionsDestination addContainedEntry:]";
    __int16 v54 = 2082;
    v55 = "nil == (entry)";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry!", buf, 0x26u);
  }

  LOBYTE(v12) = 0;
LABEL_39:

  return v12;
}

- (BOOL)addContainedBreadcrumb:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v21 = 136446978;
      BOOL v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v23 = 1024;
      *(_DWORD *)int v24 = 290;
      *(_WORD *)&v24[4] = 2082;
      *(void *)&v24[6] = "-[MapsSuggestionsDestination addContainedBreadcrumb:]";
      __int16 v25 = 2082;
      v26 = "nil == (breadcrumb)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a breadcrumb!", (uint8_t *)&v21, 0x26u);
    }
    goto LABEL_20;
  }
  id v6 = [v4 location];

  if (!v6)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v21 = 136446978;
      BOOL v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v23 = 1024;
      *(_DWORD *)int v24 = 291;
      *(_WORD *)&v24[4] = 2082;
      *(void *)&v24[6] = "-[MapsSuggestionsDestination addContainedBreadcrumb:]";
      __int16 v25 = 2082;
      v26 = "nil == (breadcrumb.location)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a breadcrumb with a location!", (uint8_t *)&v21, 0x26u);
    }
    goto LABEL_20;
  }
  likelyLocation = self->_likelyLocation;
  if (!likelyLocation)
  {
    v14 = [v5 location];
    uint64_t v15 = self->_likelyLocation;
    self->_likelyLocation = v14;

    double v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      label = self->_label;
      double v18 = self->_likelyLocation;
      int v21 = 138412546;
      BOOL v22 = (const char *)label;
      __int16 v23 = 2112;
      *(void *)int v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Aha! Destination '%@' is at %@", (uint8_t *)&v21, 0x16u);
    }

    sub_1000204D0((uint64_t)self, v5);
    goto LABEL_17;
  }
  v8 = [v5 location];
  [(CLLocation *)likelyLocation distanceFromLocation:v8];
  double v10 = v9;

  [(MapsSuggestionsDestination *)self radius];
  if (v10 > v11)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 134217984;
      BOOL v22 = *(const char **)&v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "This breadcrumb is further than %.2fm away", (uint8_t *)&v21, 0xCu);
    }
LABEL_20:

    BOOL v19 = 0;
    goto LABEL_21;
  }
  unsigned int v12 = self->_breadcrumbs;
  objc_sync_enter(v12);
  if (([(NSMutableArray *)self->_breadcrumbs containsObject:v5] & 1) == 0) {
    [(NSMutableArray *)self->_breadcrumbs addObject:v5];
  }
  objc_sync_exit(v12);

LABEL_17:
  BOOL v19 = 1;
LABEL_21:

  return v19;
}

- (BOOL)hasEntriesInTheFuture
{
  double v3 = sub_1000205BC((id *)&self->super.isa);
  if (v3)
  {
    id v4 = (char *)v3 - 1;
    while (1)
    {
      double v5 = [(MapsSuggestionsDestination *)self entries];
      id v6 = [v5 objectAtIndexedSubscript:v4];

      if ([v6 containsKey:@"MapsSuggestionsScheduledTimeKey"])
      {
        id v7 = [v6 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
        char v8 = MapsSuggestionsIsInTheFuture();

        if (v8) {
          break;
        }
      }

      if (--v4 == (char *)-1)
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }

    LOBYTE(v3) = 1;
  }
  return (char)v3;
}

- (BOOL)hasBeenVisited
{
  return sub_100020680((id *)&self->super.isa) != 0;
}

- (id)earliestKnownTime
{
  return self->_earliestArrivalDate;
}

- (id)latestKnownTime
{
  return self->_latestDepartureDate;
}

- (double)couldContainEntry:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    char v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v25 = 1024;
      int v26 = 357;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsDestination couldContainEntry:]";
      __int16 v29 = 2082;
      v30 = "nil == (entry)";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. requires an entry", buf, 0x26u);
    }

    double v7 = MapsSuggestionsConfidenceDefinitelyFalse();
    goto LABEL_7;
  }
  double v5 = [(MapsSuggestionsDestination *)self entries];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    double v7 = MapsSuggestionsConfidenceDefinitelyTrue();
LABEL_7:
    double v9 = v7;
    goto LABEL_21;
  }
  double v10 = [v4 geoMapItem];
  if (v10)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    double v11 = [(MapsSuggestionsDestination *)self entries];
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) geoMapItem];
          unsigned int v16 = [v10 isEqualToMapItem:v15];

          if (v16)
          {
            double v9 = MapsSuggestionsConfidenceDefinitelyTrue();

            goto LABEL_20;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  double v9 = MapsSuggestionsConfidenceDefinitelyFalse();
LABEL_20:

LABEL_21:
  return v9;
}

- (double)couldContainLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    likelyLocation = self->_likelyLocation;
    if (likelyLocation)
    {
      [(CLLocation *)likelyLocation distanceFromLocation:v4];
      double v7 = v6;
      [(MapsSuggestionsDestination *)self radius];
      if (v7 <= v8) {
        double v9 = MapsSuggestionsConfidenceDefinitelyTrue();
      }
      else {
        double v9 = MapsSuggestionsConfidenceDefinitelyFalse();
      }
    }
    else
    {
      double v9 = MapsSuggestionsConfidenceDontKnow();
    }
  }
  else
  {
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v15 = 1024;
      int v16 = 381;
      __int16 v17 = 2082;
      long long v18 = "-[MapsSuggestionsDestination couldContainLocation:]";
      __int16 v19 = 2082;
      long long v20 = "nil == (location)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. requires a location", (uint8_t *)&v13, 0x26u);
    }

    double v9 = MapsSuggestionsConfidenceDefinitelyFalse();
  }
  double v11 = v9;

  return v11;
}

- (double)couldContainTime:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    long long v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v29 = 1024;
      int v30 = 398;
      __int16 v31 = 2082;
      v32 = "-[MapsSuggestionsDestination couldContainTime:]";
      __int16 v33 = 2082;
      v34 = "nil == (time)";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. requires a time", buf, 0x26u);
    }

    double v19 = MapsSuggestionsConfidenceDefinitelyFalse();
    goto LABEL_25;
  }
  if (!sub_1000205BC((id *)&self->super.isa))
  {
    double v19 = MapsSuggestionsConfidenceDontKnow();
LABEL_25:
    double v20 = v19;
    goto LABEL_31;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  id v5 = [(MapsSuggestionsDestination *)self entries];
  double v6 = (char *)[v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6)
  {

    double v8 = 0;
    double v7 = 0;
    goto LABEL_29;
  }
  double v7 = 0;
  double v8 = 0;
  uint64_t v9 = *(void *)v23;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v5);
      }
      double v11 = MapsSuggestionsPeriodFromEntry();
      id v12 = v11;
      if (v11)
      {
        if ([v11 containsDate:v4])
        {
          double v20 = MapsSuggestionsConfidenceDefinitelyTrue();

LABEL_27:
          goto LABEL_30;
        }
        if (v7)
        {
          int v13 = [v12 startDate];
          uint64_t v14 = [v13 earlierDate:v7];

          double v7 = (void *)v14;
          if (v8) {
            goto LABEL_12;
          }
        }
        else
        {
          double v7 = [v12 startDate];
          if (v8)
          {
LABEL_12:
            __int16 v15 = [v12 endDate];
            uint64_t v16 = [v15 laterDate:v8];

            double v8 = (void *)v16;
            goto LABEL_15;
          }
        }
        double v8 = [v12 endDate];
      }
LABEL_15:
    }
    double v6 = (char *)[v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6) {
      continue;
    }
    break;
  }

  if (v7 && v8)
  {
    id v5 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v7 endDate:v8];
    if ([v5 containsDate:v4]) {
      double v17 = MapsSuggestionsConfidenceDontKnow();
    }
    else {
      double v17 = MapsSuggestionsConfidenceDefinitelyFalse();
    }
    double v20 = v17;
    goto LABEL_27;
  }
LABEL_29:
  double v20 = MapsSuggestionsConfidenceDontKnow();
LABEL_30:

LABEL_31:
  return v20;
}

- (unint64_t)removeExpiredEntries
{
  if (MapsSuggestionsIsInTheFuture())
  {
    return (unint64_t)sub_1000205BC((id *)&self->super.isa);
  }
  else
  {
    id v4 = +[NSDate distantFuture];
    earliestExpiration = self->_earliestExpiration;
    self->_earliestExpiration = v4;

    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v7 = [(MapsSuggestionsDestination *)self entries];
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v26;
      *(void *)&long long v9 = 138412290;
      long long v24 = v9;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(NSDate **)(*((void *)&v25 + 1) + 8 * i);
          if ([(NSDate *)v12 hasExpired])
          {
            int v13 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v24;
              int v30 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Removing entry %@ because it has expired", buf, 0xCu);
            }

            [v6 addObject:v12];
          }
          else
          {
            uint64_t v14 = [(NSDate *)v12 expires];
            BOOL v15 = v14 == 0;

            if (!v15)
            {
              uint64_t v16 = self->_earliestExpiration;
              double v17 = [(NSDate *)v12 expires];
              long long v18 = [(NSDate *)v16 earlierDate:v17];
              double v19 = self->_earliestExpiration;
              self->_earliestExpiration = v18;
            }
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v8);
    }

    double v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      long long v21 = self->_earliestExpiration;
      *(_DWORD *)buf = 138412290;
      int v30 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Earliest expiration date after removing expired entries: %@", buf, 0xCu);
    }

    long long v22 = self->_entries;
    objc_sync_enter(v22);
    [(NSMutableArray *)self->_entries removeObjectsInArray:v6];
    id v23 = [(NSMutableArray *)self->_entries count];
    objc_sync_exit(v22);

    return (unint64_t)v23;
  }
}

- (id)entryAtTime:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(MapsSuggestionsDestination *)self entries];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = MapsSuggestionsPeriodFromEntry();
          double v11 = v10;
          if (v10 && ([v10 containsDate:v4] & 1) != 0)
          {
            id v6 = v9;

            goto LABEL_16;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      double v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v20 = 1024;
      int v21 = 477;
      __int16 v22 = 2082;
      id v23 = "-[MapsSuggestionsDestination entryAtTime:]";
      __int16 v24 = 2082;
      long long v25 = "nil == (time)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. requires a time", buf, 0x26u);
    }
    id v6 = 0;
  }
LABEL_16:

  return v6;
}

- (id)firstEntryAfterTime:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = [(MapsSuggestionsDestination *)self entries];
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = MapsSuggestionsPeriodFromEntry();
          double v11 = v10;
          if (v10)
          {
            id v12 = [v10 startDate];
            id v13 = [v4 earlierDate:v12];
            BOOL v14 = v13 == v4;

            if (v14)
            {
              id v6 = v9;

              goto LABEL_16;
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v23 = 1024;
      int v24 = 494;
      __int16 v25 = 2082;
      long long v26 = "-[MapsSuggestionsDestination firstEntryAfterTime:]";
      __int16 v27 = 2082;
      long long v28 = "nil == (time)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. requires a time", buf, 0x26u);
    }
    id v6 = 0;
  }
LABEL_16:

  return v6;
}

- (id)firstEntryDuringPeriod:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(MapsSuggestionsDestination *)self entries];
    id v6 = 0;
    id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          double v11 = MapsSuggestionsPeriodFromEntry();
          if (v11)
          {
            if ([v4 intersectsDateInterval:v11])
            {
              id v13 = v10;

              goto LABEL_17;
            }
          }
          else
          {
            id v12 = v10;

            id v6 = v12;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    id v6 = v6;
    id v13 = v6;
  }
  else
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v22 = 1024;
      int v23 = 513;
      __int16 v24 = 2082;
      __int16 v25 = "-[MapsSuggestionsDestination firstEntryDuringPeriod:]";
      __int16 v26 = 2082;
      __int16 v27 = "nil == (period)";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. requires a time", buf, 0x26u);
    }
    id v13 = 0;
  }
LABEL_17:

  return v13;
}

- (id)data
{
  double v2 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136446978;
      uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v9 = 1024;
      int v10 = 537;
      __int16 v11 = 2082;
      id v12 = "-[MapsSuggestionsDestination data]";
      __int16 v13 = 2082;
      BOOL v14 = "nil == (data)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Error archiving destination", (uint8_t *)&v7, 0x26u);
    }
  }
  return v3;
}

+ (MapsSuggestionsDestination)destinationWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v8 = 0;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    id v5 = v8;
    if (v5 || !v4)
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int v10 = (const char *)v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error decoding destination: %@", buf, 0xCu);
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestination.mm";
      __int16 v11 = 1024;
      int v12 = 544;
      __int16 v13 = 2082;
      BOOL v14 = "+[MapsSuggestionsDestination destinationWithData:]";
      __int16 v15 = 2082;
      long long v16 = "nil == (data)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. data should not be nil", buf, 0x26u);
    }
    id v4 = 0;
  }

  return (MapsSuggestionsDestination *)v4;
}

- (BOOL)isEqualToDestination:(id)a3
{
  id v4 = (MapsSuggestionsDestination *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    char v12 = 1;
    goto LABEL_9;
  }
  if (![(NSString *)self->_label isEqualToString:v4->_label]) {
    goto LABEL_7;
  }
  id v6 = [(MapsSuggestionsDestination *)self entries];
  int v7 = [(MapsSuggestionsDestination *)v5 entries];
  unsigned __int8 v8 = [v6 isEqualToArray:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_7;
  }
  __int16 v9 = [(MapsSuggestionsDestination *)self breadcrumbs];
  int v10 = [(MapsSuggestionsDestination *)v5 breadcrumbs];
  unsigned __int8 v11 = [v9 isEqualToArray:v10];

  if (v11) {
    char v12 = MapsSuggestionsAlmostSameLocation();
  }
  else {
LABEL_7:
  }
    char v12 = 0;
LABEL_9:

  return v12;
}

- (id)longDescription
{
  v33.receiver = self;
  v33.super_class = (Class)MapsSuggestionsDestination;
  id v3 = [(MapsSuggestionsDestination *)&v33 description];
  label = self->_label;
  [(CLLocation *)self->_likelyLocation coordinate];
  uint64_t v6 = v5;
  [(CLLocation *)self->_likelyLocation coordinate];
  uint64_t v8 = v7;
  __int16 v9 = sub_1000205BC((id *)&self->super.isa);
  int v10 = +[NSMutableString stringWithFormat:@"%@ '%@' <%+.6f,%+.6f>, E=%u, B=%u", v3, label, v6, v8, v9, sub_100020680((id *)&self->super.isa)];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unsigned __int8 v11 = [(MapsSuggestionsDestination *)self entries];
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v11);
        }
        __int16 v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v10 appendString:@"\n - "];
        long long v16 = [v15 shortDescription];
        [v10 appendString:v16];
      }
      id v12 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v12);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v17 = [(MapsSuggestionsDestination *)self breadcrumbs];
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v17);
        }
        int v21 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        [v10 appendString:@"\n - "];
        __int16 v22 = [v21 description];
        [v10 appendString:v22];
      }
      id v18 = [v17 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v18);
  }

  id v23 = [v10 copy];
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MapsSuggestionsDestination *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MapsSuggestionsDestination *)self isEqualToDestination:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsDestination;
  id v4 = [(MapsSuggestionsDestination *)&v13 description];
  label = self->_label;
  [(CLLocation *)self->_likelyLocation coordinate];
  uint64_t v7 = v6;
  [(CLLocation *)self->_likelyLocation coordinate];
  uint64_t v9 = v8;
  int v10 = sub_1000205BC((id *)&self->super.isa);
  id v11 = [v3 initWithFormat:@"%@ '%@' <%+.6f,%+.6f>, E=%u, B=%u", v4, label, v7, v9, v10, sub_100020680((id *)&self->super.isa)];

  return (NSString *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MapsSuggestionsDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSSet);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v5, "initWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsDestinationLocationKey"];
  int v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsDestinationLabelKey"];
  id v11 = [[MapsSuggestionsDestination alloc] initWithLocation:v9 label:v10];
  id v12 = [v4 decodeObjectOfClasses:v8 forKey:@"MapsSuggestionsDestinationEntriesKey"];
  sub_100020078((uint64_t)v11, v12);

  objc_super v13 = [v4 decodeObjectOfClasses:v8 forKey:@"MapsSuggestionsDestinationBreadcrumbKey"];
  sub_100020110((uint64_t)v11, v13);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_label forKey:@"MapsSuggestionsDestinationLabelKey"];
  [v6 encodeObject:self->_likelyLocation forKey:@"MapsSuggestionsDestinationLocationKey"];
  id v4 = [(MapsSuggestionsDestination *)self entries];
  [v6 encodeObject:v4 forKey:@"MapsSuggestionsDestinationEntriesKey"];

  id v5 = [(MapsSuggestionsDestination *)self breadcrumbs];
  [v6 encodeObject:v5 forKey:@"MapsSuggestionsDestinationBreadcrumbKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[MapsSuggestionsDestination alloc] initWithLocation:self->_likelyLocation label:self->_label];
  id v5 = [(MapsSuggestionsDestination *)self entries];
  id v6 = [v5 mutableCopy];
  sub_100020078((uint64_t)v4, v6);

  uint64_t v7 = [(MapsSuggestionsDestination *)self breadcrumbs];
  id v8 = [v7 mutableCopy];
  sub_100020110((uint64_t)v4, v8);

  return v4;
}

- (id)nameForJSON
{
  return @"destination";
}

- (id)objectForJSON
{
  id v38 = [objc_alloc((Class)NSMutableArray) initWithCapacity:sub_1000205BC((id *)&self->super.isa)];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  objc_super v33 = self;
  id v3 = [(MapsSuggestionsDestination *)self entries];
  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v4)
  {
    uint64_t v37 = *(void *)v51;
    do
    {
      id v39 = v4;
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v51 != v37) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v57[0] = @"id";
        v44 = [v6 uniqueIdentifier];
        v45 = MSg::jsonFor();
        v58[0] = v45;
        v57[1] = @"type";
        [v6 type];
        uint64_t v7 = NSStringFromMapsSuggestionsEntryType();
        id v8 = MSg::jsonFor();
        v58[1] = v8;
        v57[2] = @"title";
        uint64_t v9 = [v6 undecoratedTitle];
        int v10 = MSg::jsonFor();
        v58[2] = v10;
        v57[3] = @"subtitle";
        id v11 = [v6 undecoratedSubtitle];
        id v12 = MSg::jsonFor();
        v58[3] = v12;
        v57[4] = @"start";
        unsigned int v13 = [v6 containsKey:@"MapsSuggestionsScheduledTimeKey"];
        if (v13)
        {
          v43 = [v6 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
          uint64_t v15 = MSg::jsonFor(v43, v14);
          v36 = (void *)v15;
        }
        else
        {
          uint64_t v15 = +[NSNull null];
          v41 = (MSg *)v15;
        }
        v58[4] = v15;
        v57[5] = @"end";
        unsigned int v16 = [v6 containsKey:@"MapsSuggestionsScheduledEndTimeKey"];
        if (v16)
        {
          v42 = [v6 dateForKey:@"MapsSuggestionsScheduledEndTimeKey"];
          uint64_t v18 = MSg::jsonFor(v42, v17);
          __int16 v35 = (void *)v18;
        }
        else
        {
          uint64_t v18 = +[NSNull null];
          v40 = (MSg *)v18;
        }
        v58[5] = v18;
        uint64_t v19 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:6];
        [v38 addObject:v19];

        __int16 v20 = v40;
        if (v16)
        {

          __int16 v20 = v42;
        }

        int v21 = v41;
        if (v13)
        {

          int v21 = v43;
        }
      }
      id v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v4);
  }

  id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:sub_1000205BC((id *)&v33->super.isa)];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v23 = [(MapsSuggestionsDestination *)v33 breadcrumbs];
  __int16 v24 = (char *)[v23 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v47;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = MSg::jsonFor();
        [v22 addObject:v27];
      }
      __int16 v24 = (char *)[v23 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v24);
  }

  v54[0] = @"label";
  long long v28 = MSg::jsonFor();
  v55[0] = v28;
  v54[1] = @"likelyLocation";
  long long v30 = MSg::jsonFor((MSg *)v33->_likelyLocation, v29);
  v55[1] = v30;
  v55[2] = v38;
  v54[2] = @"entries";
  v54[3] = @"breadcrumbs";
  v55[3] = v22;
  long long v31 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestExpiration, 0);
  objc_storeStrong((id *)&self->_latestDepartureDate, 0);
  objc_storeStrong((id *)&self->_earliestArrivalDate, 0);
  objc_storeStrong((id *)&self->_breadcrumbs, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_likelyLocation, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end