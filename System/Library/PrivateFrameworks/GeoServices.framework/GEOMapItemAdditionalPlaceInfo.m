@interface GEOMapItemAdditionalPlaceInfo
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (GEOMapItem)mapItem;
- (GEOMapItemAdditionalPlaceInfo)initWithMapItem:(id)a3;
- (GEOMapItemAdditionalPlaceInfo)initWithName:(id)a3 placeType:(int)a4 areaInMeters:(double)a5;
- (GEOMapItemAdditionalPlaceInfo)initWithPlace:(id)a3;
- (GEOMapRegion)mapRegion;
- (NSString)name;
- (double)areaInMeters;
- (float)photosMemoryScore;
- (int)placeType;
@end

@implementation GEOMapItemAdditionalPlaceInfo

- (GEOMapItemAdditionalPlaceInfo)initWithPlace:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapItemAdditionalPlaceInfo;
  v6 = [(GEOMapItemAdditionalPlaceInfo *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_place, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOMapItemAdditionalPlaceInfo)initWithMapItem:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapItemAdditionalPlaceInfo;
  v6 = [(GEOMapItemAdditionalPlaceInfo *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOMapItemAdditionalPlaceInfo)initWithName:(id)a3 placeType:(int)a4 areaInMeters:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [[GEOPlace alloc] initWithName:v8 placeType:v6 areaInMeters:a5];

  objc_super v10 = [(GEOMapItemAdditionalPlaceInfo *)self initWithPlace:v9];
  return v10;
}

- (NSString)name
{
  mapItem = self->_mapItem;
  if (!mapItem) {
    mapItem = self->_place;
  }
  v4 = [mapItem name];

  return (NSString *)v4;
}

- (int)placeType
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    return [(GEOMapItem *)mapItem _placeType];
  }
  else
  {
    int v5 = [(GEOPlace *)self->_place type];
    return _MapItemPlaceTypeForPlaceType(v5);
  }
}

- (double)areaInMeters
{
  mapItem = self->_mapItem;
  if (mapItem) {
    [(GEOMapItem *)mapItem _areaInMeters];
  }
  else {
    [(GEOPlace *)self->_place area];
  }
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  mapItem = self->_mapItem;
  if (!mapItem) {
    mapItem = self->_place;
  }
  [mapItem coordinate];
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (GEOMapRegion)mapRegion
{
  mapItem = self->_mapItem;
  if (mapItem) {
    [(GEOMapItem *)mapItem geoFenceMapRegion];
  }
  else {
  double v4 = [(GEOPlace *)self->_place mapRegion];
  }

  return (GEOMapRegion *)v4;
}

- (float)photosMemoryScore
{
  mapItem = self->_mapItem;
  if (!mapItem) {
    return -1.0;
  }
  [(GEOMapItem *)mapItem _photosMemoryScore];
  return result;
}

- (GEOMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_place, 0);
}

@end