@interface GEOMapFeatureTransitLink
- (GEOMapFeatureTransitLink)initWithTransitLink:(id)a3 lineIndex:(unint64_t)a4;
- (GEOTransitLink)transitLink;
- (GeoCodecsVectorTilePoint)_tilePointsForSection:(unint64_t)a3 outCount:(unint64_t *)a4;
- (NSString)internalLineName;
- (float)_elevationsForSection:(unint64_t)a3 outCount:(unint64_t *)a4;
- (id)_containingTile;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)tileKey;
- (void)dealloc;
@end

@implementation GEOMapFeatureTransitLink

- (NSString)internalLineName
{
  v2 = GEOVectorTransitLineAlongLink(self->_transitLink, self->_lineIndex);
  v3 = [v2 feature];
  v4 = (void *)[v3 name];

  if (v4)
  {
    v5 = NSString;
    v6 = [v2 feature];
    v4 = objc_msgSend(v5, "stringWithUTF8String:", objc_msgSend(v6, "name"));
  }

  return (NSString *)v4;
}

- (id)_containingTile
{
  return [(GEOTransitLink *)self->_transitLink containingTile];
}

- (GeoCodecsVectorTilePoint)_tilePointsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  unint64_t v6 = 0;
  result = (GeoCodecsVectorTilePoint *)GEOTransitLinkPoints(self->_transitLink, a3, &v6);
  if (a4) {
    *a4 = v6;
  }
  return result;
}

- (float)_elevationsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapFeatureTransitLink;
  v4 = [(GEOMapFeatureLine *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 6, self->_transitLink);
  v4[7] = self->_lineIndex;
  return v4;
}

- (void).cxx_destruct
{
}

- (uint64_t)tileKey
{
  v1 = [a1 _containingTile];
  v2 = (void *)[v1 tileKey];
  *(void *)((char *)&v4 + 1) = (*v2 << 32) & 0xFFFFC00000000000 | ((unint64_t)((*v2 >> 8) & 0x3F) << 40);
  LOBYTE(v4) = *v2;

  return v4;
}

- (GEOTransitLink)transitLink
{
  return self->_transitLink;
}

- (GEOMapFeatureTransitLink)initWithTransitLink:(id)a3 lineIndex:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOMapFeatureTransitLink;
  v8 = [(GEOMapFeatureLine *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transitLink, a3);
    v9->_lineIndex = a4;
  }

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GEOMapFeatureTransitLink;
  [(GEOMapFeatureLine *)&v2 dealloc];
}

@end