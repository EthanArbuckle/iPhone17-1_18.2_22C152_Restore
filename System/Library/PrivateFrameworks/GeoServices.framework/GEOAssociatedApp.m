@interface GEOAssociatedApp
- (BOOL)hasPreferredAppAdamId;
- (GEOAssociatedApp)initWithGEOPDAssociatedApp:(id)a3;
- (GEOPDAssociatedApp)geoAssociatedApp;
- (NSArray)alternateAppAdamIds;
- (NSString)preferredAppAdamId;
- (void)setGeoAssociatedApp:(id)a3;
@end

@implementation GEOAssociatedApp

- (GEOAssociatedApp)initWithGEOPDAssociatedApp:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAssociatedApp;
  v6 = [(GEOAssociatedApp *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_geoAssociatedApp, a3);
  }

  return v7;
}

- (BOOL)hasPreferredAppAdamId
{
  uint64_t v2 = [(GEOAssociatedApp *)self geoAssociatedApp];
  v3 = (void *)v2;
  if (v2)
  {
    -[GEOPDAssociatedApp _readPreferredAppAdamId](v2);
    BOOL v4 = v3[4] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSString)preferredAppAdamId
{
  uint64_t v2 = [(GEOAssociatedApp *)self geoAssociatedApp];
  v3 = -[GEOPDAssociatedApp preferredAppAdamId](v2);

  return (NSString *)v3;
}

- (NSArray)alternateAppAdamIds
{
  uint64_t v2 = [(GEOAssociatedApp *)self geoAssociatedApp];
  v3 = -[GEOPDAssociatedApp alternateAppAdamIds](v2);

  return (NSArray *)v3;
}

- (GEOPDAssociatedApp)geoAssociatedApp
{
  return self->_geoAssociatedApp;
}

- (void)setGeoAssociatedApp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end