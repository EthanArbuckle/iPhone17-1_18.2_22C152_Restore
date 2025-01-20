@interface GEOMapFeatureRayTracingTile
- (GEOMapFeatureRayTracingTile)initWithTileKey:(uint64_t)a3 tileData:(void *)a4;
- (GEOMapRegion)boundingBox;
- (id)description;
- (id)readDataWithOptions:(unint64_t)a3 error:(id *)a4;
@end

@implementation GEOMapFeatureRayTracingTile

- (GEOMapFeatureRayTracingTile)initWithTileKey:(uint64_t)a3 tileData:(void *)a4
{
  id v7 = a4;
  if ((*(unsigned char *)a3 & 0x7F) == 0xC
    && ((*(unsigned __int16 *)(a3 + 9) | (*(unsigned __int8 *)(a3 + 11) << 16)) & 0xFFFC0) == 0x1640
    && (v24.receiver = a1,
        v24.super_class = (Class)GEOMapFeatureRayTracingTile,
        (a1 = [(GEOMapFeatureRayTracingTile *)&v24 init]) != 0))
  {
    *((void *)&v9 + 1) = *(unsigned __int16 *)(a3 + 9) | ((unint64_t)*(unsigned __int8 *)(a3 + 11) << 16);
    *(void *)&long long v9 = *(void *)(a3 + 1);
    unint64_t v8 = v9 >> 6;
    int v10 = __clz(v8);
    unsigned __int8 v23 = (int)((63 - v10 + (((63 - v10) & 0x80u) >> 7)) << 24) >> 25;
    unint64_t v22 = v8 - gloria::LEADING_BITS_VALUE_LUT[v23];
    double v11 = gloria::TileId::ToBBOX((gloria::TileId *)&v22);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = objc_alloc_init(GEOMapRegion);
    boundingBox = a1->_boundingBox;
    a1->_boundingBox = v18;

    [(GEOMapRegion *)a1->_boundingBox setNorthLat:v11];
    [(GEOMapRegion *)a1->_boundingBox setSouthLat:v13];
    [(GEOMapRegion *)a1->_boundingBox setEastLng:v15];
    [(GEOMapRegion *)a1->_boundingBox setWestLng:v17];
    objc_storeStrong((id *)&a1->_tileData, a4);
    a1 = a1;
    v20 = a1;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)readDataWithOptions:(unint64_t)a3 error:(id *)a4
{
  return [(GEOTileData *)self->_tileData readDataWithOptions:a3 error:a4];
}

- (id)description
{
  v3 = NSString;
  [(GEOMapRegion *)self->_boundingBox northLat];
  uint64_t v5 = v4;
  [(GEOMapRegion *)self->_boundingBox westLng];
  uint64_t v7 = v6;
  [(GEOMapRegion *)self->_boundingBox southLat];
  uint64_t v9 = v8;
  [(GEOMapRegion *)self->_boundingBox eastLng];
  return (id)[v3 stringWithFormat:@"<GEOMapFeatureRayTracingTile %p: %f,%f %f,%f: %@>", self, v5, v7, v9, v10, self->_tileData];
}

- (GEOMapRegion)boundingBox
{
  return self->_boundingBox;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBox, 0);

  objc_storeStrong((id *)&self->_tileData, 0);
}

@end