@interface MapsSuggestionsRouteGeniusEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithData:(id)a3;
- (GEOComposedRoute)route;
- (MapsSuggestionsEntry)entry;
- (MapsSuggestionsRouteGeniusEntry)initWithCoder:(id)a3;
- (MapsSuggestionsRouteGeniusEntry)initWithEntry:(id)a3 route:(id)a4;
- (double)etaInSeconds;
- (id)data;
- (void)encodeWithCoder:(id)a3;
- (void)setEntry:(id)a3;
- (void)setRoute:(id)a3;
@end

@implementation MapsSuggestionsRouteGeniusEntry

- (MapsSuggestionsRouteGeniusEntry)initWithEntry:(id)a3 route:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsRouteGeniusEntry;
  v9 = [(MapsSuggestionsRouteGeniusEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entry, a3);
    objc_storeStrong((id *)&v10->_route, a4);
  }

  return v10;
}

- (id)data
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  if (!v3)
  {
    v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Error archiving entry %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

+ (id)entryWithData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v10 = 0;
    v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v10];
    v5 = v10;
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6)
    {
      id v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v12 = (const char *)v5;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error decoding MapsSuggestionsEntry - %@", buf, 0xCu);
      }

      id v8 = 0;
    }
    else
    {
      id v8 = v4;
    }
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      objc_super v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRouteGenius.m";
      __int16 v13 = 1024;
      int v14 = 37;
      __int16 v15 = 2082;
      v16 = "+[MapsSuggestionsRouteGeniusEntry entryWithData:]";
      __int16 v17 = 2082;
      v18 = "nil == (data)";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. data should not be nil", buf, 0x26u);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  entry = self->_entry;
  id v5 = a3;
  [v5 encodeObject:entry forKey:@"entry"];
  [v5 encodeObject:self->_route forKey:@"route"];
}

- (MapsSuggestionsRouteGeniusEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsRouteGeniusEntry;
  id v5 = [(MapsSuggestionsRouteGeniusEntry *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entry"];
    entry = v5->_entry;
    v5->_entry = (MapsSuggestionsEntry *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"route"];
    route = v5->_route;
    v5->_route = (GEOComposedRoute *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)etaInSeconds
{
  if (![(MapsSuggestionsEntry *)self->_entry containsKey:@"MapsSuggestionsETAKey"]) {
    return (double)[(GEOComposedRoute *)self->_route expectedTime];
  }
  id v3 = [(MapsSuggestionsEntry *)self->_entry ETAForKey:@"MapsSuggestionsETAKey"];
  [v3 seconds];
  double v5 = v4;

  return v5;
}

- (MapsSuggestionsEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end