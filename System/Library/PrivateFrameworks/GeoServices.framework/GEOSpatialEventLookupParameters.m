@interface GEOSpatialEventLookupParameters
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (GEOSpatialEventLookupParameters)init;
- (GEOSpatialEventLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 dateInterval:(id)a6;
- (GEOSpatialEventLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 dateInterval:(id)a6 maxResultCount:(int)a7;
- (NSArray)categories;
- (NSDateInterval)dateInterval;
- (double)radius;
- (int)maxResultCount;
@end

@implementation GEOSpatialEventLookupParameters

- (GEOSpatialEventLookupParameters)init
{
  result = (GEOSpatialEventLookupParameters *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSpatialEventLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 dateInterval:(id)a6
{
  return -[GEOSpatialEventLookupParameters initWithCoordinate:radius:categories:dateInterval:maxResultCount:](self, "initWithCoordinate:radius:categories:dateInterval:maxResultCount:", a5, a6, 0, a3.var0, a3.var1, a4);
}

- (GEOSpatialEventLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 dateInterval:(id)a6 maxResultCount:(int)a7
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v14 = a5;
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)GEOSpatialEventLookupParameters;
  v16 = [(GEOSpatialEventLookupParameters *)&v21 init];
  v17 = v16;
  if (v16)
  {
    v16->_coordinate.latitude = var0;
    v16->_coordinate.longitude = var1;
    v16->_radius = a4;
    objc_storeStrong((id *)&v16->_categories, a5);
    objc_storeStrong((id *)&v17->_dateInterval, a6);
    int UInteger = GEOConfigGetUInteger(GeoServicesConfig_BatchSpatialEventLookupMaxResultCount, (uint64_t)off_1E9113CA8);
    if (UInteger >= a7) {
      int v19 = a7;
    }
    else {
      int v19 = UInteger;
    }
    v17->_maxResultCount = v19;
  }

  return v17;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (int)maxResultCount
{
  return self->_maxResultCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_categories, 0);
}

@end