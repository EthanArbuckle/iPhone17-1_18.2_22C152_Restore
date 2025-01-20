@interface GEOConnectivityJunction
- (id)init:(GeoCodecsConnectivityJunction *)a3;
- (unsigned)pointsOnRoadCount;
- (unsigned)pointsOnRoadIndex;
@end

@implementation GEOConnectivityJunction

- (id)init:(GeoCodecsConnectivityJunction *)a3
{
  v3 = a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)GEOConnectivityJunction;
    v4 = [(GEOConnectivityJunction *)&v6 init];
    if (v4) {
      v4->_junction = v3;
    }
    self = v4;
    v3 = (GeoCodecsConnectivityJunction *)self;
  }

  return v3;
}

- (unsigned)pointsOnRoadCount
{
  junction = self->_junction;
  if (junction) {
    return junction->var0;
  }
  else {
    return 0;
  }
}

- (unsigned)pointsOnRoadIndex
{
  junction = self->_junction;
  if (junction) {
    return junction->var1;
  }
  else {
    return 0;
  }
}

@end