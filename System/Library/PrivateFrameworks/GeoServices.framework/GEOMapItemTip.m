@interface GEOMapItemTip
- (BOOL)hasTipId;
- (BOOL)hasTipTime;
- (GEOMapItemTip)initWithGEOPDTip:(id)a3;
- (GEOPDTip)geoTip;
- (NSString)bestImageURL;
- (NSString)localizedSnippet;
- (NSString)name;
- (NSString)tipId;
- (double)tipTime;
- (void)setGeoTip:(id)a3;
@end

@implementation GEOMapItemTip

- (GEOMapItemTip)initWithGEOPDTip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapItemTip;
  v6 = [(GEOMapItemTip *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_geoTip, a3);
  }

  return v7;
}

- (NSString)localizedSnippet
{
  v2 = [(GEOMapItemTip *)self geoTip];
  v3 = -[GEOPDTip snippets](v2);
  v4 = [v3 firstObject];

  return (NSString *)v4;
}

- (BOOL)hasTipTime
{
  v2 = [(GEOMapItemTip *)self geoTip];
  if (v2) {
    BOOL v3 = v2[68] & 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (double)tipTime
{
  v2 = [(GEOMapItemTip *)self geoTip];
  if (v2) {
    double v3 = v2[5];
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

- (NSString)name
{
  -[GEOPDTip tipster]((id *)&self->_geoTip->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  double v3 = -[GEOPDTipUser name](v2);

  return (NSString *)v3;
}

- (NSString)bestImageURL
{
  -[GEOPDTip tipster]((id *)&self->_geoTip->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  double v3 = -[GEOPDTipUser image](v2);
  v4 = [v3 bestURL];

  return (NSString *)v4;
}

- (BOOL)hasTipId
{
  uint64_t v2 = [(GEOMapItemTip *)self geoTip];
  double v3 = (void *)v2;
  if (v2)
  {
    -[GEOPDTip _readTipId](v2);
    BOOL v4 = v3[4] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSString)tipId
{
  uint64_t v2 = [(GEOMapItemTip *)self geoTip];
  double v3 = -[GEOPDTip tipId](v2);

  return (NSString *)v3;
}

- (GEOPDTip)geoTip
{
  return self->_geoTip;
}

- (void)setGeoTip:(id)a3
{
}

- (void).cxx_destruct
{
}

@end