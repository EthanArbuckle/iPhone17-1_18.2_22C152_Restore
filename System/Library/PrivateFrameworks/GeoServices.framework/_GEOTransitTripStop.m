@interface _GEOTransitTripStop
+ (id)transitTripStopsForPlaceData:(id)a3;
- (BOOL)isHidden;
- (GEOLatLng)location;
- (GEOStyleAttributes)styleAttributes;
- (GEOTransitDeparture)departure;
- (NSArray)labelItems;
- (NSString)debugDescription;
- (NSString)displayName;
- (NSTimeZone)timeZone;
- (_GEOTransitTripStop)initWithTransitSnippet:(id)a3 departureSequence:(id)a4;
- (unint64_t)stationIdentifier;
@end

@implementation _GEOTransitTripStop

+ (id)transitTripStopsForPlaceData:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[GEOPDTransitTripStopTime transitTripStopTimeForPlaceData:v3];
  v5 = +[GEOPDTransitTripStop transitTripStopForPlaceData:v3];
  v32 = objc_opt_new();
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v31 = v3;
    v7 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v30 = v5;
    id v8 = v5[2];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * v12);
          if (v13) {
            uint64_t v14 = *(void *)(v13 + 80);
          }
          else {
            uint64_t v14 = 0;
          }
          v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v14, v30);
          [v7 setObject:v13 forKeyedSubscript:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v16 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
        uint64_t v10 = v16;
      }
      while (v16);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v17 = v4[2];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * v21);
          if (v22) {
            uint64_t v23 = *(void *)(v22 + 136);
          }
          else {
            uint64_t v23 = 0;
          }
          v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v23, v30);
          v25 = [v7 objectForKeyedSubscript:v24];

          if (v25)
          {
            v26 = [[_GEOTransitTripStop alloc] initWithTransitSnippet:v25 departureSequence:v22];
            [v32 addObject:v26];
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v27 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
        uint64_t v19 = v27;
      }
      while (v27);
    }

    id v3 = v31;
    v5 = v30;
  }
  v28 = objc_msgSend(v32, "copy", v30);

  return v28;
}

- (_GEOTransitTripStop)initWithTransitSnippet:(id)a3 departureSequence:(id)a4
{
  BOOL v6 = (id *)a3;
  v7 = (id *)a4;
  v33.receiver = self;
  v33.super_class = (Class)_GEOTransitTripStop;
  id v8 = [(_GEOTransitTripStop *)&v33 init];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v6) {
      unint64_t v10 = (unint64_t)v6[10];
    }
    else {
      unint64_t v10 = 0;
    }
    v8->_stationIdentifier = v10;
    uint64_t v11 = -[GEOPDDepartureSequence departures](v7);
    uint64_t v12 = [v11 firstObject];
    departure = v9->_departure;
    v9->_departure = (GEOTransitDeparture *)v12;

    uint64_t v14 = -[GEOPDTransitInfoSnippet transitName](v6);
    uint64_t v15 = [v14 copy];
    transitName = v9->_transitName;
    v9->_transitName = (NSString *)v15;

    -[GEOPDTransitInfoSnippet timezone](v6);
    id v17 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = -[GEOTimezone identifier](v17);

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:v18];
    timeZone = v9->_timeZone;
    v9->_timeZone = (NSTimeZone *)v19;

    uint64_t v21 = [[_GEOMapItemTransitInfoSnippet alloc] initWithTransitInfoSnippet:v6];
    uint64_t v22 = [(_GEOMapItemTransitInfoSnippet *)v21 labelItems];
    uint64_t v23 = [v22 copy];
    labelItems = v9->_labelItems;
    v9->_labelItems = (NSArray *)v23;

    v25 = -[GEOPDTransitInfoSnippet stopLocationForTrip](v6);
    uint64_t v26 = [v25 copy];
    location = v9->_location;
    v9->_location = (GEOLatLng *)v26;

    v28 = -[GEOPDTransitInfoSnippet styleAttributesForTrip](v6);
    uint64_t v29 = [v28 copy];
    styleAttributes = v9->_styleAttributes;
    v9->_styleAttributes = (GEOStyleAttributes *)v29;

    if (v6) {
      BOOL v31 = *((unsigned char *)v6 + 108) != 0;
    }
    else {
      BOOL v31 = 0;
    }
    v9->_isHidden = v31;
  }
  return v9;
}

- (unint64_t)stationIdentifier
{
  return self->_stationIdentifier;
}

- (NSString)displayName
{
  return self->_transitName;
}

- (NSArray)labelItems
{
  return self->_labelItems;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (GEOLatLng)location
{
  return self->_location;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_GEOTransitTripStop *)self displayName];
  BOOL v6 = [v3 stringWithFormat:@"<%@ %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (GEOTransitDeparture)departure
{
  return self->_departure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departure, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_labelItems, 0);
  objc_storeStrong((id *)&self->_transitName, 0);

  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end