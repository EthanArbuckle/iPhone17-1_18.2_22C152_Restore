@interface GEOBackgroundDirectionsRequestConfig
- (BOOL)usesBackgroundURL;
- (GEOBackgroundDirectionsRequestConfig)initWithRequest:(id)a3 requestPriority:(id)a4;
- (unint64_t)urlType;
@end

@implementation GEOBackgroundDirectionsRequestConfig

- (GEOBackgroundDirectionsRequestConfig)initWithRequest:(id)a3 requestPriority:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GEOBackgroundDirectionsRequestConfig;
  return [(GEODirectionsRequestConfig *)&v5 initWithRequest:a3 requestPriority:a4];
}

- (unint64_t)urlType
{
  return 33;
}

- (BOOL)usesBackgroundURL
{
  return 1;
}

@end