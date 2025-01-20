@interface _GEOTransitPreloadBatch
- (GEOTileKeyList)tilesToLoad;
- (NSMutableSet)placeDatasToLoad;
- (_GEOTransitPreloadBatch)init;
- (double)networkDataRateKB;
- (id).cxx_construct;
- (void)setPlaceDatasToLoad:(id)a3;
- (void)setTilesToLoad:(id)a3;
@end

@implementation _GEOTransitPreloadBatch

- (_GEOTransitPreloadBatch)init
{
  v10.receiver = self;
  v10.super_class = (Class)_GEOTransitPreloadBatch;
  v2 = [(_GEOTransitPreloadBatch *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(GEOTileKeyList);
    tilesToLoad = v2->_tilesToLoad;
    v2->_tilesToLoad = v3;

    if (GEOConfigGetBOOL(GeoServicesConfig_PreloadTransitPlacecards, (uint64_t)off_1E9113AF8))
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
      placeDatasToLoad = v2->_placeDatasToLoad;
      v2->_placeDatasToLoad = (NSMutableSet *)v5;
    }
    else
    {
      placeDatasToLoad = v2->_placeDatasToLoad;
      v2->_placeDatasToLoad = 0;
    }

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    latLngToLoad = v2->_latLngToLoad;
    v2->_latLngToLoad = (NSMutableArray *)v7;
  }
  return v2;
}

- (double)networkDataRateKB
{
  double v2 = self->endTime - self->startTime;
  if (v2 >= 0.000001) {
    return (double)self->bytesLoadedFromNetwork / 1000.0 / v2;
  }
  else {
    return 100000.0;
  }
}

- (GEOTileKeyList)tilesToLoad
{
  return self->_tilesToLoad;
}

- (void)setTilesToLoad:(id)a3
{
}

- (NSMutableSet)placeDatasToLoad
{
  return self->_placeDatasToLoad;
}

- (void)setPlaceDatasToLoad:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->placeDataRequestTicketForBatch, 0);
  objc_storeStrong((id *)&self->_latLngToLoad, 0);
  begin = self->coords.__begin_;
  if (begin)
  {
    self->coords.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_placeDatasToLoad, 0);

  objc_storeStrong((id *)&self->_tilesToLoad, 0);
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

@end