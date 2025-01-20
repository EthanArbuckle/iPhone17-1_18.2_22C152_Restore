@interface GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide)initWithJSON:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide;
  v4 = [(GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

- (GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitNumPlacesInGuideIsValid((unsigned __int8 *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitNumPlacesInGuideReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    [(GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *)self readAll:1];
    [v4 readAll:1];
  }

  return v5;
}

- (unint64_t)hash
{
  return 0;
}

- (void)mergeFrom:(id)a3
{
}

@end