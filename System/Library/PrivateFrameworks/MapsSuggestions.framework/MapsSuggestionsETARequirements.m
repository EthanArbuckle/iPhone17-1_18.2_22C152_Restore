@interface MapsSuggestionsETARequirements
- (MapsSuggestionsETARequirements)initWithMaxAge:(double)a3 maxDistance:(double)a4 minAccuracy:(double)a5;
- (double)maxAge;
- (double)maxDistance;
- (double)minAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MapsSuggestionsETARequirements

- (MapsSuggestionsETARequirements)initWithMaxAge:(double)a3 maxDistance:(double)a4 minAccuracy:(double)a5
{
  v5 = self;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0)
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      __int16 v16 = 1024;
      int v17 = 37;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsETARequirements initWithMaxAge:maxDistance:minAccuracy:]";
      __int16 v20 = 2082;
      v21 = "0.0 == maxAge";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires maximum age", buf, 0x26u);
    }
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  if (a4 == 0.0)
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      __int16 v16 = 1024;
      int v17 = 38;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsETARequirements initWithMaxAge:maxDistance:minAccuracy:]";
      __int16 v20 = 2082;
      v21 = "0.0 == maxDistance";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires maximum distance", buf, 0x26u);
    }
    goto LABEL_8;
  }
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsETARequirements;
  v12 = [(MapsSuggestionsETARequirements *)&v13 init];
  if (v12)
  {
    v12->_maxAge = a3;
    v12->_maxDistance = a4;
    v12->_minAccuracy = a5;
  }
  v5 = v12;
  v8 = v5;
LABEL_9:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[MapsSuggestionsETARequirements allocWithZone:a3];
  double maxAge = self->_maxAge;
  double maxDistance = self->_maxDistance;
  double minAccuracy = self->_minAccuracy;
  return [(MapsSuggestionsETARequirements *)v4 initWithMaxAge:maxAge maxDistance:maxDistance minAccuracy:minAccuracy];
}

- (double)maxAge
{
  return self->_maxAge;
}

- (double)maxDistance
{
  return self->_maxDistance;
}

- (double)minAccuracy
{
  return self->_minAccuracy;
}

@end