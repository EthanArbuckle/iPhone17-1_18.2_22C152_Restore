@interface GEOMapItemBuilder
+ (id)buildWithSetterBlock:(id)a3;
- (GEOAddress)address;
- (GEOLatLng)latlng;
- (GEOLocation)location;
- (GEOMapItemBuilder)init;
- (GEOMapRegion)mapRegion;
- (NSString)name;
- (id)build;
- (int)referenceFrame;
- (void)setAddress:(id)a3;
- (void)setLatlng:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapRegion:(id)a3;
- (void)setName:(id)a3;
- (void)setReferenceFrame:(int)a3;
@end

@implementation GEOMapItemBuilder

- (GEOAddress)address
{
  return self->_address;
}

- (void)setName:(id)a3
{
}

- (void)setLatlng:(id)a3
{
}

- (void)setAddress:(id)a3
{
}

+ (id)buildWithSetterBlock:(id)a3
{
  v3 = (void (**)(id, GEOMapItemBuilder *))a3;
  v4 = objc_alloc_init(GEOMapItemBuilder);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [(GEOMapItemBuilder *)v4 build];

  return v5;
}

- (GEOMapItemBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemBuilder;
  v2 = [(GEOMapItemBuilder *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_has = 0;
    v4 = v2;
  }

  return v3;
}

- (id)build
{
  v3 = objc_alloc_init(GEOPlace);
  location = self->_location;
  if (location)
  {
    [(GEOLocation *)location coordinate];
    double v7 = v5;
    double v8 = v6;
    if (fabs(v6 + 180.0) >= 0.00000001 || fabs(v5 + 180.0) >= 0.00000001)
    {
      v9 = [[GEOMapRegion alloc] initWithLatitude:v5 longitude:v6];
      [(GEOPlace *)v3 setMapRegion:v9];
      v10 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v7, v8);
      [(GEOPlace *)v3 setCenter:v10];
    }
  }
  latlng = self->_latlng;
  if (latlng)
  {
    [(GEOLatLng *)latlng coordinate];
    double v14 = v12;
    double v15 = v13;
    if (fabs(v13 + 180.0) >= 0.00000001 || fabs(v12 + 180.0) >= 0.00000001)
    {
      v16 = [[GEOMapRegion alloc] initWithLatitude:v12 longitude:v13];
      [(GEOPlace *)v3 setMapRegion:v16];
      v17 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v14, v15);
      [(GEOPlace *)v3 setCenter:v17];
    }
  }
  if (*(unsigned char *)&self->_has) {
    [(GEOPlace *)v3 setReferenceFrame:self->_referenceFrame];
  }
  address = self->_address;
  if (address)
  {
    v19 = (void *)[(GEOAddress *)address copy];
    [(GEOPlace *)v3 setAddress:v19];
  }
  mapRegion = self->_mapRegion;
  if (mapRegion)
  {
    v21 = (void *)[(GEOMapRegion *)mapRegion copy];
    [(GEOPlace *)v3 setMapRegion:v21];
  }
  name = self->_name;
  if (name)
  {
    v23 = (void *)[(NSString *)name copy];
    [(GEOPlace *)v3 setName:v23];
  }
  v24 = +[GEOMapItemStorage mapItemStorageForPlace:v3];

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_latlng, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
  *(unsigned char *)&self->_has |= 1u;
}

- (GEOLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
}

- (GEOLatLng)latlng
{
  return self->_latlng;
}

- (NSString)name
{
  return self->_name;
}

@end