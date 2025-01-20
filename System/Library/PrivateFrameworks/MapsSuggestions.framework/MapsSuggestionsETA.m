@interface MapsSuggestionsETA
+ (BOOL)supportsSecureCoding;
+ (id)ETAWithData:(id)a3;
- (BOOL)isBetterThanETA:(id)a3 requirements:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToETA:(id)a3;
- (BOOL)isValidForLocation:(id)a3 requirements:(id)a4;
- (CLLocation)location;
- (MapsSuggestionsETA)initWithCoder:(id)a3;
- (MapsSuggestionsETA)initWithSeconds:(double)a3 shortTrafficString:(id)a4 longTrafficString:(id)a5 writtenRouteName:(id)a6 spokenRouteName:(id)a7 transportType:(int)a8 location:(id)a9 time:(id)a10;
- (MapsSuggestionsETA)initWithSeconds:(double)a3 shortTrafficString:(id)a4 longTrafficString:(id)a5 writtenRouteName:(id)a6 spokenRouteName:(id)a7 transportType:(int)a8 location:(id)a9 time:(id)a10 originator:(id)a11;
- (MapsSuggestionsETA)initWithSeconds:(double)a3 trafficString:(id)a4 transportType:(int)a5 location:(id)a6;
- (MapsSuggestionsETA)initWithTrafficAndETAResult:(id)a3 transportType:(int)a4 location:(id)a5 time:(id)a6;
- (NSDate)time;
- (NSString)description;
- (NSString)longTrafficString;
- (NSString)originator;
- (NSString)shortTrafficString;
- (NSString)spokenRouteName;
- (NSString)writtenRouteName;
- (double)age;
- (double)seconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)nameForJSON;
- (id)objectForJSON;
- (int)transportType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MapsSuggestionsETA

- (MapsSuggestionsETA)initWithSeconds:(double)a3 shortTrafficString:(id)a4 longTrafficString:(id)a5 writtenRouteName:(id)a6 spokenRouteName:(id)a7 transportType:(int)a8 location:(id)a9 time:(id)a10 originator:(id)a11
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  if (!v22)
  {
    v42 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      __int16 v47 = 1024;
      int v48 = 71;
      __int16 v49 = 2082;
      v50 = "-[MapsSuggestionsETA initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:t"
            "ransportType:location:time:originator:]";
      __int16 v51 = 2082;
      v52 = "nil == (location)";
      _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires location", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v23)
  {
    v42 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      __int16 v47 = 1024;
      int v48 = 72;
      __int16 v49 = 2082;
      v50 = "-[MapsSuggestionsETA initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:t"
            "ransportType:location:time:originator:]";
      __int16 v51 = 2082;
      v52 = "nil == (time)";
      _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires time", buf, 0x26u);
    }
LABEL_11:

    v41 = 0;
    goto LABEL_12;
  }
  v44.receiver = self;
  v44.super_class = (Class)MapsSuggestionsETA;
  v25 = [(MapsSuggestionsETA *)&v44 init];
  v26 = v25;
  if (v25)
  {
    v25->_seconds = a3;
    uint64_t v27 = [v18 copy];
    shortTrafficString = v26->_shortTrafficString;
    v26->_shortTrafficString = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    longTrafficString = v26->_longTrafficString;
    v26->_longTrafficString = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    writtenRouteName = v26->_writtenRouteName;
    v26->_writtenRouteName = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    spokenRouteName = v26->_spokenRouteName;
    v26->_spokenRouteName = (NSString *)v33;

    v26->_transportType = a8;
    uint64_t v35 = [v22 copy];
    location = v26->_location;
    v26->_location = (CLLocation *)v35;

    uint64_t v37 = [v23 copy];
    time = v26->_time;
    v26->_time = (NSDate *)v37;

    uint64_t v39 = [v24 copy];
    originator = v26->_originator;
    v26->_originator = (NSString *)v39;
  }
  self = v26;
  v41 = self;
LABEL_12:

  return v41;
}

- (MapsSuggestionsETA)initWithSeconds:(double)a3 shortTrafficString:(id)a4 longTrafficString:(id)a5 writtenRouteName:(id)a6 spokenRouteName:(id)a7 transportType:(int)a8 location:(id)a9 time:(id)a10
{
  uint64_t v11 = *(void *)&a8;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = [MEMORY[0x1E4F28F80] processInfo];
  id v24 = [v23 processName];
  v25 = [(MapsSuggestionsETA *)self initWithSeconds:v17 shortTrafficString:v18 longTrafficString:v19 writtenRouteName:v20 spokenRouteName:v11 transportType:v21 location:a3 time:v22 originator:v24];

  return v25;
}

- (MapsSuggestionsETA)initWithSeconds:(double)a3 trafficString:(id)a4 transportType:(int)a5 location:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a6;
  v12 = MapsSuggestionsNow();
  v13 = [(MapsSuggestionsETA *)self initWithSeconds:v10 shortTrafficString:v10 longTrafficString:0 writtenRouteName:0 spokenRouteName:v7 transportType:v11 location:a3 time:v12];

  return v13;
}

- (MapsSuggestionsETA)initWithTrafficAndETAResult:(id)a3 transportType:(int)a4 location:(id)a5 time:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    [v9 seconds];
    double v12 = v11;
    v13 = [v9 shortTrafficString];
    v14 = [v9 longTrafficString];
    v15 = [v9 writtenRouteName];
    v16 = [v9 spokenRouteName];
    id v17 = MapsSuggestionsNow();
    self = [(MapsSuggestionsETA *)self initWithSeconds:v13 shortTrafficString:v14 longTrafficString:v15 writtenRouteName:v16 spokenRouteName:v7 transportType:v10 location:v12 time:v17];

    id v18 = self;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [+[MapsSuggestionsETA allocWithZone:a3] initWithSeconds:self->_shortTrafficString shortTrafficString:self->_longTrafficString longTrafficString:self->_writtenRouteName writtenRouteName:self->_spokenRouteName spokenRouteName:self->_transportType transportType:self->_location location:self->_seconds time:self->_time originator:self->_originator];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MapsSuggestionsETA *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MapsSuggestionsETA *)self isEqualToETA:v4];
  }

  return v5;
}

- (BOOL)isEqualToETA:(id)a3
{
  v4 = (MapsSuggestionsETA *)a3;
  if (self == v4) {
    goto LABEL_7;
  }
  [(MapsSuggestionsETA *)self seconds];
  double v6 = v5;
  [(MapsSuggestionsETA *)v4 seconds];
  if (vabdd_f64(v6, v7) > 2.22044605e-16) {
    goto LABEL_8;
  }
  v8 = [(MapsSuggestionsETA *)self shortTrafficString];
  id v9 = [(MapsSuggestionsETA *)v4 shortTrafficString];

  if (v8 != v9)
  {
    id v10 = [(MapsSuggestionsETA *)self shortTrafficString];
    double v11 = [(MapsSuggestionsETA *)v4 shortTrafficString];
    char v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) == 0) {
      goto LABEL_8;
    }
  }
  v13 = [(MapsSuggestionsETA *)self longTrafficString];
  v14 = [(MapsSuggestionsETA *)v4 longTrafficString];

  if (v13 == v14
    || ([(MapsSuggestionsETA *)self longTrafficString],
        v15 = objc_claimAutoreleasedReturnValue(),
        [(MapsSuggestionsETA *)v4 longTrafficString],
        v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v15 isEqualToString:v16],
        v16,
        v15,
        (v17 & 1) != 0))
  {
LABEL_7:
    BOOL v18 = 1;
  }
  else
  {
LABEL_8:
    BOOL v18 = 0;
  }

  return v18;
}

- (double)age
{
  v3 = MapsSuggestionsNow();
  v4 = [(MapsSuggestionsETA *)self time];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (BOOL)isValidForLocation:(id)a3 requirements:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [(MapsSuggestionsETA *)self age];
    double v9 = v8;
    [v7 maxAge];
    if (v9 <= v10)
    {
      v16 = [(MapsSuggestionsETA *)self location];
      [v16 horizontalAccuracy];
      double v18 = v17;

      [v7 minAccuracy];
      if (v18 <= v19)
      {
        if (!v6) {
          goto LABEL_21;
        }
        id v22 = [(MapsSuggestionsETA *)self location];
        MapsSuggestionsBestLocation(v6, v22);
        id v23 = (id)objc_claimAutoreleasedReturnValue();

        if (v23 != v6)
        {
          double v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v28) = 0;
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "The provided currentLocation was not better than the used one", (uint8_t *)&v28, 2u);
          }
          BOOL v20 = 1;
          goto LABEL_13;
        }
        id v24 = [(MapsSuggestionsETA *)self location];
        [v24 distanceFromLocation:v6];
        double v26 = v25;

        [v7 maxDistance];
        if (v26 <= v27)
        {
LABEL_21:
          BOOL v20 = 1;
          goto LABEL_14;
        }
        double v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v28 = 134217984;
          uint64_t v29 = *(const char **)&v26;
          char v12 = "ETA invalid: moved too much (distance = %.2fm).";
          goto LABEL_10;
        }
      }
      else
      {
        double v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v28 = 134217984;
          uint64_t v29 = *(const char **)&v18;
          char v12 = "ETA invalid: not accurate enough (accuracy = %.2fm).";
          goto LABEL_10;
        }
      }
    }
    else
    {
      double v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v28 = 134217984;
        uint64_t v29 = *(const char **)&v9;
        char v12 = "ETA invalid: too old (age = %.2fs).";
LABEL_10:
        v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
        uint32_t v15 = 12;
        goto LABEL_11;
      }
    }
  }
  else
  {
    double v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136446978;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      __int16 v30 = 1024;
      int v31 = 199;
      __int16 v32 = 2082;
      uint64_t v33 = "-[MapsSuggestionsETA isValidForLocation:requirements:]";
      __int16 v34 = 2082;
      uint64_t v35 = "nil == (requirements)";
      char v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires requirements";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 38;
LABEL_11:
      _os_log_impl(&dword_1A70DF000, v13, v14, v12, (uint8_t *)&v28, v15);
    }
  }
  BOOL v20 = 0;
LABEL_13:

LABEL_14:
  return v20;
}

- (BOOL)isBetterThanETA:(id)a3 requirements:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 247;
      __int16 v31 = 2082;
      __int16 v32 = "-[MapsSuggestionsETA isBetterThanETA:requirements:]";
      __int16 v33 = 2082;
      __int16 v34 = "nil == (requirements)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires ETA requirements", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (v6)
  {
    double v8 = [(MapsSuggestionsETA *)self location];
    double v9 = [v6 location];
    double v10 = MapsSuggestionsBestLocation(v8, v9);

    if (([v6 isValidForLocation:v10 requirements:v7] & 1) == 0)
    {
      BOOL v23 = 1;
      goto LABEL_12;
    }
    if ([(MapsSuggestionsETA *)self isValidForLocation:v10 requirements:v7])
    {
      id v11 = v6;
      id v12 = v7;
      v13 = [(MapsSuggestionsETA *)self location];
      [v13 coordinate];
      *(void *)buf = v14;
      *(void *)&buf[8] = v15;

      v16 = [v11 location];
      [v16 coordinate];
      uint64_t v28 = v17;
      uint64_t v29 = v18;

      CLLocationCoordinate2DGetDistanceFrom();
      double v20 = v19;
      objc_msgSend(v12, "maxDistance", v28, v29, *(void *)buf, *(void *)&buf[8]);
      LODWORD(v16) = v20 > v21;

      if (v16)
      {
        id v22 = [(MapsSuggestionsETA *)self location];
        BOOL v23 = v10 == v22;
      }
      else
      {
        [(MapsSuggestionsETA *)self age];
        double v26 = v25;
        [v11 age];
        BOOL v23 = v26 < v27;
      }
      goto LABEL_12;
    }
LABEL_9:
    BOOL v23 = 0;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v23 = 1;
LABEL_13:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"MapsSuggestionsETASecondsKey" forKey:self->_seconds];
  [v4 encodeObject:self->_shortTrafficString forKey:@"MapsSuggestionsETAShortTrafficStringKey"];
  [v4 encodeObject:self->_longTrafficString forKey:@"MapsSuggestionsETALongTrafficStringKey"];
  [v4 encodeObject:self->_writtenRouteName forKey:@"MapsSuggestionsETAWrittenRouteNameKey"];
  [v4 encodeObject:self->_spokenRouteName forKey:@"MapsSuggestionsETASpokenRouteNameKey"];
  [v4 encodeInteger:self->_transportType forKey:@"MapsSuggestionsETATransportTypeKey"];
  [v4 encodeObject:self->_time forKey:@"MapsSuggestionsETATimeKey"];
  [v4 encodeObject:self->_location forKey:@"MapsSuggestionsETALocationKey"];
  [v4 encodeObject:self->_originator forKey:@"MapsSuggestionsETAOriginatorKey"];
}

- (MapsSuggestionsETA)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"MapsSuggestionsETASecondsKey"];
  double v6 = v5;
  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsETAShortTrafficStringKey"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsETALongTrafficStringKey"];
  double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsETAWrittenRouteNameKey"];
  double v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsETASpokenRouteNameKey"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"MapsSuggestionsETATransportTypeKey"];
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsETATimeKey"];
  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsETALocationKey"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsETAOriginatorKey"];
  if (!v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F28F80] processInfo];
    v13 = [v14 processName];
  }
  uint64_t v15 = [(MapsSuggestionsETA *)self initWithSeconds:v17 shortTrafficString:v7 longTrafficString:v8 writtenRouteName:v9 spokenRouteName:v10 transportType:v12 location:v6 time:v11 originator:v13];

  return v15;
}

- (id)data
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  [v3 finishEncoding];
  id v4 = [v3 encodedData];

  if (v4)
  {
    double v5 = [v3 encodedData];
  }
  else
  {
    double v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      double v9 = self;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "Could not serialize ETA: %@", (uint8_t *)&v8, 0xCu);
    }

    double v5 = 0;
  }

  return v5;
}

+ (id)ETAWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v12 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v12];
    uint64_t v5 = (uint64_t)v12;
    [v4 setRequiresSecureCoding:1];
    [v4 setDecodingFailurePolicy:1];
    double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    [v4 finishDecoding];
    uint64_t v7 = [v4 error];
    if (v7 | v5)
    {
    }
    else if (v6)
    {
      id v8 = v6;
LABEL_15:

      goto LABEL_16;
    }
    GEOFindOrCreateLog();
    double v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (char *)v5;
      if (!v5)
      {
        uint64_t v10 = [v4 error];
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Could not deserialize MapsSuggestionsETA, error: %@", buf, 0xCu);
      if (!v5) {
    }
      }
    id v8 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
    __int16 v15 = 1024;
    int v16 = 350;
    __int16 v17 = 2082;
    uint64_t v18 = "+[MapsSuggestionsETA ETAWithData:]";
    __int16 v19 = 2082;
    double v20 = "data == nil";
    _os_log_impl(&dword_1A70DF000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires serialized data", buf, 0x26u);
  }
  id v8 = 0;
LABEL_16:

  return v8;
}

- (id)nameForJSON
{
  return @"eta";
}

- (id)objectForJSON
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"value";
  id v3 = (MSg *)[(MapsSuggestionsETA *)self seconds];
  uint64_t v5 = MSg::jsonFor(v3, v4);
  v15[0] = v5;
  v14[1] = @"age";
  double v6 = (MSg *)[(MapsSuggestionsETA *)self age];
  id v8 = MSg::jsonFor(v6, v7);
  v15[1] = v8;
  v14[2] = @"from";
  double v9 = [(MapsSuggestionsETA *)self location];
  id v11 = MSg::jsonFor(v9, v10);
  v15[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v24.receiver = self;
  v24.super_class = (Class)MapsSuggestionsETA;
  double v4 = [(MapsSuggestionsETA *)&v24 description];
  [(MapsSuggestionsETA *)self seconds];
  uint64_t v6 = v5;
  double v7 = [(MapsSuggestionsETA *)self writtenRouteName];
  id v8 = [(MapsSuggestionsETA *)self trafficString];
  uint64_t v9 = [(MapsSuggestionsETA *)self transportType];
  if (v9 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = off_1E5CB88A0[(int)v9];
  }
  id v11 = [(MapsSuggestionsETA *)self location];
  [v11 coordinate];
  uint64_t v13 = v12;
  uint64_t v14 = [(MapsSuggestionsETA *)self location];
  [v14 coordinate];
  uint64_t v16 = v15;
  __int16 v17 = [(MapsSuggestionsETA *)self location];
  [v17 horizontalAccuracy];
  uint64_t v19 = v18;
  double v20 = [(MapsSuggestionsETA *)self time];
  uint64_t v21 = [(MapsSuggestionsETA *)self originator];
  id v22 = (void *)[v3 initWithFormat:@"%@ %.0fs over @\"%@\", \"%@\" (%@ / <%.8f,%.8f> ±%.2fm / %@ / %@)", v4, v6, v7, v8, v10, v13, v16, v19, v20, v21];

  return (NSString *)v22;
}

- (double)seconds
{
  return self->_seconds;
}

- (NSString)shortTrafficString
{
  return self->_shortTrafficString;
}

- (NSString)longTrafficString
{
  return self->_longTrafficString;
}

- (NSString)writtenRouteName
{
  return self->_writtenRouteName;
}

- (NSString)spokenRouteName
{
  return self->_spokenRouteName;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSDate)time
{
  return self->_time;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)originator
{
  return self->_originator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_spokenRouteName, 0);
  objc_storeStrong((id *)&self->_writtenRouteName, 0);
  objc_storeStrong((id *)&self->_longTrafficString, 0);
  objc_storeStrong((id *)&self->_shortTrafficString, 0);
}

@end