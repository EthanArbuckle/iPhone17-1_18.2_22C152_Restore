@interface MapsSuggestionsBreadcrumb
+ (BOOL)supportsSecureCoding;
+ (id)breadcrumbWithData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBreadcrumb:(id)a3;
- (CLLocation)location;
- (MapsSuggestionsBreadcrumb)initWithCoder:(id)a3;
- (MapsSuggestionsBreadcrumb)initWithLocation:(id)a3;
- (MapsSuggestionsBreadcrumb)initWithLocation:(id)a3 transportMode:(int)a4;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)nameForJSON;
- (id)objectForJSON;
- (int)likelyTransportMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MapsSuggestionsBreadcrumb

- (MapsSuggestionsBreadcrumb)initWithLocation:(id)a3 transportMode:(int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsBreadcrumb;
  v7 = [(MapsSuggestionsBreadcrumb *)&v11 self];

  if (v7)
  {
    v8 = (CLLocation *)[v6 copy];
    location = v7->_location;
    v7->_location = v8;

    v7->_likelyTransportMode = a4;
  }

  return v7;
}

- (MapsSuggestionsBreadcrumb)initWithLocation:(id)a3
{
  return [(MapsSuggestionsBreadcrumb *)self initWithLocation:a3 transportMode:4];
}

- (id)data
{
  v2 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBreadcrumb.mm";
      __int16 v9 = 1024;
      int v10 = 42;
      __int16 v11 = 2082;
      v12 = "-[MapsSuggestionsBreadcrumb data]";
      __int16 v13 = 2082;
      v14 = "nil == (data)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Error archiving breadcrumb", (uint8_t *)&v7, 0x26u);
    }
  }
  return v3;
}

+ (id)breadcrumbWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v8 = 0;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    v5 = v8;
    if (v5 || !v4)
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int v10 = (const char *)v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error decoding breadcrumb: %@", buf, 0xCu);
      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBreadcrumb.mm";
      __int16 v11 = 1024;
      int v12 = 49;
      __int16 v13 = 2082;
      v14 = "+[MapsSuggestionsBreadcrumb breadcrumbWithData:]";
      __int16 v15 = 2082;
      v16 = "data == nil";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. data should not be nil", buf, 0x26u);
    }
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isEqualToBreadcrumb:(id)a3
{
  id v4 = (MapsSuggestionsBreadcrumb *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_7;
  }
  if (self->_likelyTransportMode == v4->_likelyTransportMode) {
    char v6 = MapsSuggestionsAlmostSameLocation();
  }
  else {
LABEL_5:
  }
    char v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MapsSuggestionsBreadcrumb *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MapsSuggestionsBreadcrumb *)self isEqualToBreadcrumb:v4];
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
  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsBreadcrumb;
  id v4 = [(MapsSuggestionsBreadcrumb *)&v10 description];
  BOOL v5 = [(MapsSuggestionsBreadcrumb *)self location];
  uint64_t v6 = [(MapsSuggestionsBreadcrumb *)self likelyTransportMode];
  if (v6 >= 7)
  {
    int v7 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
  }
  else
  {
    int v7 = off_100071B10[(int)v6];
  }
  id v8 = [v3 initWithFormat:@"%@ %@ using %@", v4, v5, v7];

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MapsSuggestionsBreadcrumb)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsBreadcrumbLocationKey"];
  uint64_t v6 = -[MapsSuggestionsBreadcrumb initWithLocation:transportMode:](self, "initWithLocation:transportMode:", v5, [v4 decodeIntegerForKey:@"MapsSuggestionsBreadcrumbTransportModeKey"]);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_likelyTransportMode forKey:@"MapsSuggestionsBreadcrumbTransportModeKey"];
  [v4 encodeObject:self->_location forKey:@"MapsSuggestionsBreadcrumbLocationKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MapsSuggestionsBreadcrumb alloc];
  location = self->_location;
  uint64_t likelyTransportMode = self->_likelyTransportMode;
  return [(MapsSuggestionsBreadcrumb *)v4 initWithLocation:location transportMode:likelyTransportMode];
}

- (id)nameForJSON
{
  return @"breadcrumb";
}

- (id)objectForJSON
{
  CFStringRef v9 = @"location";
  id v3 = MSg::jsonFor((MSg *)self->_location, (CLLocation *)a2);
  CFStringRef v10 = @"likelyTransportMode";
  v11[0] = v3;
  uint64_t likelyTransportMode = self->_likelyTransportMode;
  if (likelyTransportMode >= 7)
  {
    BOOL v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_likelyTransportMode, v9, v10, v11[0]];
  }
  else
  {
    BOOL v5 = off_100071B10[likelyTransportMode];
  }
  uint64_t v6 = MSg::jsonFor();
  v11[1] = v6;
  int v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:&v9 count:2];

  return v7;
}

- (CLLocation)location
{
  return self->_location;
}

- (int)likelyTransportMode
{
  return self->_likelyTransportMode;
}

- (void).cxx_destruct
{
}

@end