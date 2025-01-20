@interface GEOPOIEvent
+ (BOOL)isUpdateRequiredForInvalidationData:(id)a3;
+ (BOOL)isUpdateRequiredForInvalidationToken:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- (BOOL)configureWithComponents:(id)a3;
- (BOOL)configureWithPOIComponent:(id)a3;
- (BOOL)configureWithPlaceInfoComponent:(id)a3;
- (BOOL)isUpdateRequired;
- (GEOCacheInvalidationData)invalidationData;
- (GEOMapItemIdentifier)identifier;
- (GEOPOIEvent)init;
- (GEOPOIEvent)initWithCoder:(id)a3;
- (GEOPOIEvent)initWithMapItemIdentifier:(id)a3;
- (GEOPOIEvent)initWithPlace:(id)a3;
- (NSArray)categories;
- (NSArray)hours;
- (NSArray)performers;
- (NSArray)relatedPOIIdentifiers;
- (NSDateInterval)dateInterval;
- (NSString)localizedName;
- (NSTimeZone)timeZone;
- (id)dateIntervalFromDateTimeRanges:(id)a3;
- (id)invalidationToken;
- (int64_t)expectedAttendance;
- (void)encodeWithCoder:(id)a3;
- (void)geoPOIEventCommonInit;
- (void)setCategories:(id)a3;
- (void)setCenterCoordinate:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setExpectedAttendance:(int64_t)a3;
- (void)setHours:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalidationData:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setPerformers:(id)a3;
- (void)setRelatedPOIIdentifiers:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation GEOPOIEvent

+ (BOOL)isUpdateRequiredForInvalidationData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = +[GEOResourceManifestManager modernManager];
    v5 = [v4 activeTileGroup];
    v6 = [v5 versionManifest];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = objc_msgSend(v6, "serviceVersions", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
          if (v11) {
            uint64_t v12 = *(unsigned int *)(v11 + 24);
          }
          else {
            uint64_t v12 = 0;
          }
          v13 = -[GEOServiceVersion versionDomains]((id *)v11);
          char v14 = [v3 isInvalidatedByServiceVersion:v12 domains:v13];

          if (v14)
          {
            LOBYTE(v8) = 1;
            goto LABEL_16;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v15 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v8 = v15;
      }
      while (v15);
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)isUpdateRequiredForInvalidationToken:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = a3;
    v7 = [[GEOPOIEventInvalidationData alloc] initWithData:v6];

    if (v7 && v7->_cacheInvalidationData)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = -[GEOPOIEventInvalidationData cacheInvalidationData]((id *)&v7->super.super.isa);
      id v15 = 0;
      uint64_t v11 = [v8 unarchivedObjectOfClass:v9 fromData:v10 error:&v15];
      id v12 = v15;

      if (!v12 && v11)
      {
        char v13 = [a1 isUpdateRequiredForInvalidationData:v11];

LABEL_12:
        return v13;
      }
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"Invalid token data"];
      char v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v13 = 0;
    }
    goto LABEL_12;
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)geoPOIEventCommonInit
{
  self->_centerCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid_3;
  self->_expectedAttendance = 0x7FFFFFFFFFFFFFFFLL;
}

- (GEOPOIEvent)init
{
  result = (GEOPOIEvent *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOPOIEvent)initWithMapItemIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPOIEvent;
  id v6 = [(GEOPOIEvent *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(GEOPOIEvent *)v6 geoPOIEventCommonInit];
    objc_storeStrong((id *)&v7->_identifier, a3);
  }

  return v7;
}

- (GEOPOIEvent)initWithPlace:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPOIEvent;
  id v5 = [(GEOPOIEvent *)&v10 init];
  if (v5
    && (![v4 hasStatus]
     || [v4 status]
     || ([(GEOPOIEvent *)v5 geoPOIEventCommonInit],
         [v4 components],
         id v6 = objc_claimAutoreleasedReturnValue(),
         BOOL v7 = [(GEOPOIEvent *)v5 configureWithComponents:v6],
         v6,
         !v7)))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v5;
  }

  return v8;
}

- (BOOL)configureWithComponents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = 0;
    BOOL v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v11 && (*(_WORD *)(v11 + 100) & 0x80) != 0)
        {
          int v12 = *(_DWORD *)(v11 + 88);
          if (v12 == 2)
          {
            BOOL v7 = -[GEOPOIEvent configureWithPlaceInfoComponent:](self, "configureWithPlaceInfoComponent:");
          }
          else if (v12 == 58)
          {
            BOOL v8 = -[GEOPOIEvent configureWithPOIComponent:](self, "configureWithPOIComponent:");
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    BOOL v7 = 0;
    BOOL v8 = 0;
  }

  return v8 && v7;
}

- (BOOL)configureWithPOIComponent:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = v4;
  if (v4 && (*((_WORD *)v4 + 50) & 0x20) != 0 && !*((_DWORD *)v4 + 20))
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    BOOL v8 = -[GEOPDComponent values](v4);
    uint64_t v6 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(v8);
          }
          -[GEOPDComponentValue poiEvent](*(id **)(*((void *)&v52 + 1) + 8 * i));
          uint64_t v11 = (id *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            int v12 = v11;
            char v13 = -[GEOPDPoiEvent eventId](v11);

            LOBYTE(v6) = v13 != 0;
            if (v13)
            {
              long long v14 = [GEOMapItemIdentifier alloc];
              long long v15 = -[GEOPDPoiEvent eventId](v12);
              long long v16 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v14, "initWithMapsIdentifier:", v15, (void)v52);
              identifier = self->_identifier;
              self->_identifier = v16;

              long long v18 = -[GEOPDPoiEvent name](v12);
              uint64_t v19 = [v18 stringValue];
              localizedName = self->_localizedName;
              self->_localizedName = v19;

              if ((_WORD)v12[12]) {
                int64_t v21 = *((int *)v12 + 23);
              }
              else {
                int64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
              }
              self->_expectedAttendance = v21;
              uint64_t v22 = -[GEOPDPoiEvent eventCategorys](v12);
              v23 = +[GEOPOIEventCategory poiEventCategoriesForEventCategories:v22];
              categories = self->_categories;
              self->_categories = v23;

              v25 = -[GEOPDPoiEvent poiIds](v12);
              v26 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v25];
              relatedPOIIdentifiers = self->_relatedPOIIdentifiers;
              self->_relatedPOIIdentifiers = v26;

              v28 = -[GEOPDPoiEvent eventDateTimes](v12);
              v29 = [(GEOPOIEvent *)self dateIntervalFromDateTimeRanges:v28];
              dateInterval = self->_dateInterval;
              self->_dateInterval = v29;

              id v31 = objc_alloc(MEMORY[0x1E4F1CAF0]);
              -[GEOPDPoiEvent timezone](v12);
              v32 = (id *)objc_claimAutoreleasedReturnValue();
              v33 = -[GEOTimezone identifier](v32);
              v34 = (NSTimeZone *)[v31 initWithName:v33];
              timeZone = self->_timeZone;
              self->_timeZone = v34;

              v36 = -[GEOPDPoiEvent eventDateTimes](v12);
              v37 = +[GEOPOIEventHours eventHoursForDateTimeRanges:v36];
              hours = self->_hours;
              self->_hours = v37;

              v39 = -[GEOPDPoiEvent performers](v12);
              v40 = +[GEOPOIEventPerformer poiEventPerformersForPerformers:v39];
              performers = self->_performers;
              self->_performers = v40;

              if ((*((_WORD *)v5 + 50) & 0x200) != 0)
              {
                v42 = -[GEOPDComponent versionDomains](v5);
                uint64_t v43 = [v42 count];

                if (v43)
                {
                  v44 = [GEOCacheInvalidationData alloc];
                  [v5 timestampFirstSeen];
                  double v46 = *(double *)&v45;
                  LODWORD(v45) = *((_DWORD *)v5 + 21);
                  double v47 = (double)v45;
                  uint64_t v48 = *((unsigned int *)v5 + 24);
                  v49 = -[GEOPDComponent versionDomains](v5);
                  v50 = [(GEOCacheInvalidationData *)v44 initWithTimestamp:v48 ttl:v49 version:v46 domains:v47];
                  invalidationData = self->_invalidationData;
                  self->_invalidationData = v50;
                }
              }
            }

            goto LABEL_23;
          }
        }
        uint64_t v6 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_23:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)dateIntervalFromDateTimeRanges:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v14 = v3;
      unint64_t v6 = 0;
      unint64_t v7 = -1;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (v10 && (~*(unsigned __int8 *)(v10 + 56) & 3) == 0)
          {
            if (*(void *)(v10 + 48) < v7) {
              unint64_t v7 = *(void *)(v10 + 48);
            }
            unint64_t v11 = *(void *)(v10 + 40);
            if (v6 <= v11) {
              unint64_t v6 = v11;
            }
          }
        }
        uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);

      if (v7 > v6)
      {
        uint64_t v5 = 0;
        id v3 = v14;
        goto LABEL_20;
      }
      id v4 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)v7];
      int v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)v6];
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v4 endDate:v12];

      id v3 = v14;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_20:

  return v5;
}

- (BOOL)configureWithPlaceInfoComponent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && (*((_WORD *)v4 + 50) & 0x20) != 0 && !*((_DWORD *)v4 + 20))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = -[GEOPDComponent values]((id *)v4);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = -[GEOPDComponentValue placeInfo](*(id **)(*((void *)&v18 + 1) + 8 * i));
          uint64_t v14 = v13;
          if (v13)
          {
            -[GEOPDPlaceInfo _readCenter](v13);
            if (*(void *)(v14 + 40))
            {
              long long v15 = -[GEOPDPlaceInfo center]((id *)v14);
              objc_msgSend(v15, "coordinate", (void)v18);
              self->_centerCoordinate.latitude = v16;
              self->_centerCoordinate.longitude = v17;

              BOOL v6 = 1;
              goto LABEL_17;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 0;
LABEL_17:
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (GEOPOIEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)GEOPOIEvent;
  uint64_t v5 = [(GEOPOIEvent *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventInvalidationDataKey"];
    invalidationData = v5->_invalidationData;
    v5->_invalidationData = (GEOCacheInvalidationData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (GEOMapItemIdentifier *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventLocalizedNameKey"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v10;

    [v4 decodeDoubleForKey:@"GEOPOIEventCenterCoordinateLatitudeKey"];
    double v13 = v12;
    [v4 decodeDoubleForKey:@"GEOPOIEventCenterCoordinateLongitudeKey"];
    v5->_centerCoordinate.latitude = v13;
    v5->_centerCoordinate.longitude = v14;
    v5->_expectedAttendance = [v4 decodeIntegerForKey:@"GEOPOIEventExpectedAttendanceKey"];
    id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v16 = objc_opt_class();
    double v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"GEOPOIEventCategoriesKey"];
    categories = v5->_categories;
    v5->_categories = (NSArray *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);

    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"GEOPOIEventRelatedPOIsKey"];
    relatedPOIIdentifiers = v5->_relatedPOIIdentifiers;
    v5->_relatedPOIIdentifiers = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventDateIntervalKey"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventTimeZoneKey"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v27;

    id v29 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v30 = objc_opt_class();
    id v31 = objc_msgSend(v29, "initWithObjects:", v30, objc_opt_class(), 0);

    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"GEOPOIEventHoursKey"];
    hours = v5->_hours;
    v5->_hours = (NSArray *)v32;

    id v34 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "initWithObjects:", v35, objc_opt_class(), 0);

    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"GEOPOIEventPerformersKey"];
    performers = v5->_performers;
    v5->_performers = (NSArray *)v37;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  invalidationData = self->_invalidationData;
  id v5 = a3;
  [v5 encodeObject:invalidationData forKey:@"GEOPOIEventInvalidationDataKey"];
  [v5 encodeObject:self->_identifier forKey:@"GEOPOIEventIdentifierKey"];
  [v5 encodeObject:self->_localizedName forKey:@"GEOPOIEventLocalizedNameKey"];
  [v5 encodeDouble:@"GEOPOIEventCenterCoordinateLatitudeKey" forKey:self->_centerCoordinate.latitude];
  [v5 encodeDouble:@"GEOPOIEventCenterCoordinateLongitudeKey" forKey:self->_centerCoordinate.longitude];
  [v5 encodeInteger:self->_expectedAttendance forKey:@"GEOPOIEventExpectedAttendanceKey"];
  [v5 encodeObject:self->_categories forKey:@"GEOPOIEventCategoriesKey"];
  [v5 encodeObject:self->_relatedPOIIdentifiers forKey:@"GEOPOIEventRelatedPOIsKey"];
  [v5 encodeObject:self->_dateInterval forKey:@"GEOPOIEventDateIntervalKey"];
  [v5 encodeObject:self->_timeZone forKey:@"GEOPOIEventTimeZoneKey"];
  [v5 encodeObject:self->_hours forKey:@"GEOPOIEventHoursKey"];
  [v5 encodeObject:self->_performers forKey:@"GEOPOIEventPerformersKey"];
}

- (BOOL)isUpdateRequired
{
  return +[GEOPOIEvent isUpdateRequiredForInvalidationData:self->_invalidationData];
}

- (id)invalidationToken
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_invalidationData)
  {
    id v3 = objc_alloc_init(GEOPOIEventInvalidationData);
    invalidationData = self->_invalidationData;
    id v10 = 0;
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:invalidationData requiringSecureCoding:1 error:&v10];
    id v6 = v10;
    -[GEOPOIEventInvalidationData setCacheInvalidationData:]((uint64_t)v3, v5);

    if (v6)
    {
      if (qword_1EB2A01A0 != -1) {
        dispatch_once(&qword_1EB2A01A0, &__block_literal_global_147);
      }
      unint64_t v7 = _MergedGlobals_288;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_288, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v12 = v6;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Failed to serialize invalidation data: %{private}@", buf, 0xCu);
      }
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [(GEOPOIEventInvalidationData *)v3 data];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (GEOCacheInvalidationData)invalidationData
{
  return self->_invalidationData;
}

- (void)setInvalidationData:(id)a3
{
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double latitude = self->_centerCoordinate.latitude;
  double longitude = self->_centerCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCenterCoordinate:(id)a3
{
  self->_centerCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (int64_t)expectedAttendance
{
  return self->_expectedAttendance;
}

- (void)setExpectedAttendance:(int64_t)a3
{
  self->_expectedAttendance = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (NSArray)relatedPOIIdentifiers
{
  return self->_relatedPOIIdentifiers;
}

- (void)setRelatedPOIIdentifiers:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSArray)hours
{
  return self->_hours;
}

- (void)setHours:(id)a3
{
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)setPerformers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_relatedPOIIdentifiers, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_invalidationData, 0);
}

@end