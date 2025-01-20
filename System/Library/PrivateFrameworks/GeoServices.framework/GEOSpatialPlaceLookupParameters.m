@interface GEOSpatialPlaceLookupParameters
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (GEOMapRegion)mapRegion;
- (GEOPOICategoryFilter)poiCategoryFilter;
- (GEOSpatialPlaceLookupParameters)init;
- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5;
- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 maxResultCount:(int)a6;
- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 maxResultCount:(int)a6 source:(int64_t)a7;
- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 poiCategoryFilter:(id)a5;
- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 poiCategoryFilter:(id)a5 maxResultCount:(int)a6;
- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 poiCategoryFilter:(id)a5 maxResultCount:(int)a6 source:(int64_t)a7;
- (GEOSpatialPlaceLookupParameters)initWithMapRegion:(id)a3 poiCategoryFilter:(id)a4;
- (GEOSpatialPlaceLookupParameters)initWithMapRegion:(id)a3 poiCategoryFilter:(id)a4 maxResultCount:(int)a5;
- (GEOSpatialPlaceLookupParameters)initWithMapRegion:(id)a3 poiCategoryFilter:(id)a4 maxResultCount:(int)a5 source:(int64_t)a6;
- (NSArray)categories;
- (double)radius;
- (int)maxResultCount;
@end

@implementation GEOSpatialPlaceLookupParameters

- (GEOSpatialPlaceLookupParameters)init
{
  result = (GEOSpatialPlaceLookupParameters *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5
{
  return -[GEOSpatialPlaceLookupParameters initWithCoordinate:radius:categories:maxResultCount:](self, "initWithCoordinate:radius:categories:maxResultCount:", a5, 0, a3.var0, a3.var1, a4);
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 maxResultCount:(int)a6
{
  return -[GEOSpatialPlaceLookupParameters initWithCoordinate:radius:categories:maxResultCount:source:](self, "initWithCoordinate:radius:categories:maxResultCount:source:", a5, *(void *)&a6, 0, a3.var0, a3.var1, a4);
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 maxResultCount:(int)a6 source:(int64_t)a7
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v14 = a5;
  v22.receiver = self;
  v22.super_class = (Class)GEOSpatialPlaceLookupParameters;
  v15 = [(GEOSpatialPlaceLookupParameters *)&v22 init];
  v16 = v15;
  if (v15)
  {
    v15->_coordinate.latitude = var0;
    v15->_coordinate.longitude = var1;
    v15->_radius = a4;
    objc_storeStrong((id *)&v15->_categories, a5);
    v17 = &GeoServicesConfig_VisualIntelligenceCameraBatchSpatialPlaceLookupMaxResultCount;
    v18 = (uint64_t *)&unk_1E9115148;
    if (a7 != 1)
    {
      v18 = (uint64_t *)&unk_1E9113C98;
      v17 = &GeoServicesConfig_BatchSpatialPlaceLookupMaxResultCount;
    }
    int UInteger = GEOConfigGetUInteger(*v17, *v18);
    if (UInteger >= a6) {
      int v20 = a6;
    }
    else {
      int v20 = UInteger;
    }
    v16->_maxResultCount = v20;
  }

  return v16;
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 poiCategoryFilter:(id)a5
{
  return -[GEOSpatialPlaceLookupParameters initWithCoordinate:radius:poiCategoryFilter:maxResultCount:](self, "initWithCoordinate:radius:poiCategoryFilter:maxResultCount:", a5, 0, a3.var0, a3.var1, a4);
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 poiCategoryFilter:(id)a5 maxResultCount:(int)a6
{
  return -[GEOSpatialPlaceLookupParameters initWithCoordinate:radius:poiCategoryFilter:maxResultCount:source:](self, "initWithCoordinate:radius:poiCategoryFilter:maxResultCount:source:", a5, *(void *)&a6, 0, a3.var0, a3.var1, a4);
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 poiCategoryFilter:(id)a5 maxResultCount:(int)a6 source:(int64_t)a7
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v14 = a5;
  v22.receiver = self;
  v22.super_class = (Class)GEOSpatialPlaceLookupParameters;
  v15 = [(GEOSpatialPlaceLookupParameters *)&v22 init];
  v16 = v15;
  if (v15)
  {
    v15->_coordinate.latitude = var0;
    v15->_coordinate.longitude = var1;
    v15->_radius = a4;
    objc_storeStrong((id *)&v15->_poiCategoryFilter, a5);
    v17 = &GeoServicesConfig_VisualIntelligenceCameraBatchSpatialPlaceLookupMaxResultCount;
    v18 = (uint64_t *)&unk_1E9115148;
    if (a7 != 1)
    {
      v18 = (uint64_t *)&unk_1E9113C98;
      v17 = &GeoServicesConfig_BatchSpatialPlaceLookupMaxResultCount;
    }
    int UInteger = GEOConfigGetUInteger(*v17, *v18);
    if (UInteger >= a6) {
      int v20 = a6;
    }
    else {
      int v20 = UInteger;
    }
    v16->_maxResultCount = v20;
  }

  return v16;
}

- (GEOSpatialPlaceLookupParameters)initWithMapRegion:(id)a3 poiCategoryFilter:(id)a4
{
  return [(GEOSpatialPlaceLookupParameters *)self initWithMapRegion:a3 poiCategoryFilter:a4 maxResultCount:0];
}

- (GEOSpatialPlaceLookupParameters)initWithMapRegion:(id)a3 poiCategoryFilter:(id)a4 maxResultCount:(int)a5
{
  return [(GEOSpatialPlaceLookupParameters *)self initWithMapRegion:a3 poiCategoryFilter:a4 maxResultCount:*(void *)&a5 source:0];
}

- (GEOSpatialPlaceLookupParameters)initWithMapRegion:(id)a3 poiCategoryFilter:(id)a4 maxResultCount:(int)a5 source:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)GEOSpatialPlaceLookupParameters;
  v13 = [(GEOSpatialPlaceLookupParameters *)&v20 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_mapRegion, a3);
    objc_storeStrong((id *)&v14->_poiCategoryFilter, a4);
    v14->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid_2;
    v15 = &GeoServicesConfig_VisualIntelligenceCameraBatchSpatialPlaceLookupMaxResultCount;
    v16 = (uint64_t *)&unk_1E9115148;
    if (a6 != 1)
    {
      v16 = (uint64_t *)&unk_1E9113C98;
      v15 = &GeoServicesConfig_BatchSpatialPlaceLookupMaxResultCount;
    }
    int UInteger = GEOConfigGetUInteger(*v15, *v16);
    if (UInteger >= a5) {
      int v18 = a5;
    }
    else {
      int v18 = UInteger;
    }
    v14->_maxResultCount = v18;
  }

  return v14;
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

- (int)maxResultCount
{
  return self->_maxResultCount;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (GEOPOICategoryFilter)poiCategoryFilter
{
  return self->_poiCategoryFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCategoryFilter, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);

  objc_storeStrong((id *)&self->_categories, 0);
}

@end