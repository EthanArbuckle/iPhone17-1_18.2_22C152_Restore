@interface MapsSuggestionsDestinationLinkOption
- (BOOL)isEqual:(id)a3;
- (BOOL)updateETA:(id)a3;
- (GEOComposedRoute)route;
- (MapsSuggestionsDestinationLinkOption)initWithETA:(id)a3;
- (MapsSuggestionsDestinationLinkOption)initWithRoute:(id)a3;
- (MapsSuggestionsETA)eta;
- (double)containsLocation:(id)a3;
- (double)containsTime:(id)a3;
- (id)nameForJSON;
- (id)objectForJSON;
- (int)transportMode;
- (void)setEta:(id)a3;
- (void)setRoute:(id)a3;
- (void)setTransportMode:(int)a3;
@end

@implementation MapsSuggestionsDestinationLinkOption

- (MapsSuggestionsDestinationLinkOption)initWithRoute:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsDestinationLinkOption;
    v6 = [(MapsSuggestionsDestinationLinkOption *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_route, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationLinkOption.mm";
      __int16 v14 = 1024;
      int v15 = 24;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsDestinationLinkOption initWithRoute:]";
      __int16 v18 = 2082;
      v19 = "nil == (route)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a route", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (MapsSuggestionsDestinationLinkOption)initWithETA:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsDestinationLinkOption;
    v6 = [(MapsSuggestionsDestinationLinkOption *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_eta, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationLinkOption.mm";
      __int16 v14 = 1024;
      int v15 = 34;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsDestinationLinkOption initWithETA:]";
      __int16 v18 = 2082;
      v19 = "nil == (eta)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a ETA", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)updateETA:(id)a3
{
  id v5 = a3;
  eta = self->_eta;
  p_eta = &self->_eta;
  v8 = eta;
  objc_sync_enter(v8);
  if (*(p_eta - 1)) {
    goto LABEL_2;
  }
  if (!*p_eta)
  {
LABEL_10:
    objc_storeStrong((id *)p_eta, a3);
    BOOL v9 = 1;
    goto LABEL_3;
  }
  unsigned int v11 = [(MapsSuggestionsETA *)*p_eta transportType];
  if (v11 == [v5 transportType])
  {
    v12 = [(MapsSuggestionsETA *)*p_eta time];
    v13 = [v5 time];
    __int16 v14 = [v12 laterDate:v13];
    int v15 = [v5 time];

    if (v14 != v15)
    {
      __int16 v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "ETA provided is not more recent than what we had!?", v17, 2u);
      }

      goto LABEL_2;
    }
    goto LABEL_10;
  }
LABEL_2:
  BOOL v9 = 0;
LABEL_3:
  objc_sync_exit(v8);

  return v9;
}

- (double)containsLocation:(id)a3
{
  id v4 = a3;
  id v5 = self->_route;
  objc_sync_enter(v5);
  if (v4 && self->_route)
  {
    id v6 = [objc_alloc((Class)GEORouteMatcher) initWithRoute:self->_route auditToken:0];
    [v4 coordinate];
    objc_msgSend(v6, "distanceToRouteFrom:");
    double v8 = v7;
    double v9 = MapsSuggestionsConfidenceDefinitelyTrue();
    double v10 = v9 - v8 * v8 / MapsSuggestionsDistanceToRouteConfidenceFactor();
    if (v10 <= 0.0) {
      double v10 = MapsSuggestionsConfidenceDefinitelyFalse();
    }
  }
  else
  {
    double v10 = MapsSuggestionsConfidenceDontKnow();
  }
  objc_sync_exit(v5);

  return v10;
}

- (double)containsTime:(id)a3
{
  id v5 = a3;
  id v6 = self->_eta;
  objc_sync_enter(v6);
  if (!v5 || !self->_eta)
  {
    double v12 = MapsSuggestionsConfidenceDontKnow();
    goto LABEL_8;
  }
  double v8 = [(MapsSuggestionsETA *)self->_eta time];
  [(MapsSuggestionsETA *)self->_eta seconds];
  double v9 = objc_msgSend(v8, "dateByAddingTimeInterval:");
  [v9 timeIntervalSinceDate:v5];
  double v11 = v10;

  if (v11 > 0.0) {
    double v3 = MapsSuggestionsConfidenceDefinitelyTrue();
  }
  if (v11 <= 0.0)
  {
    double v12 = MapsSuggestionsConfidenceDefinitelyFalse();
LABEL_8:
    double v3 = v12;
  }
  objc_sync_exit(v6);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MapsSuggestionsDestinationLinkOption *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(MapsSuggestionsDestinationLinkOption *)self eta];
      unsigned int v6 = [v5 transportType];
      double v7 = [(MapsSuggestionsDestinationLinkOption *)v4 eta];
      BOOL v8 = v6 == [v7 transportType];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)nameForJSON
{
  return @"linkOption";
}

- (id)objectForJSON
{
  v14[0] = @"transportMode";
  uint64_t transportMode = self->_transportMode;
  if (transportMode >= 7)
  {
    id v4 = +[NSString stringWithFormat:@"(unknown: %i)", transportMode];
  }
  else
  {
    id v4 = *(&off_100072368 + transportMode);
  }
  id v5 = MSg::jsonFor();
  v14[1] = @"eta";
  v15[0] = v5;
  CFStringRef v12 = @"seconds";
  unsigned int v6 = (MSg *)[(MapsSuggestionsETA *)self->_eta seconds];
  BOOL v8 = MSg::jsonFor(v6, v7);
  v13 = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[1] = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v10;
}

- (int)transportMode
{
  return self->_transportMode;
}

- (void)setTransportMode:(int)a3
{
  self->_uint64_t transportMode = a3;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (MapsSuggestionsETA)eta
{
  return self->_eta;
}

- (void)setEta:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eta, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end