@interface GEOComposedRouteETAUPosition
- ($212C09783140BCCD23384160D545CE0D)routeCoordinate;
- (GEOComposedRouteETAUPosition)initWithComposedRoute:(id)a3 andUpdateLocation:(id)a4 offset:(double)a5;
- (double)timeSinceLastUpdate;
- (int64_t)compare:(id)a3;
@end

@implementation GEOComposedRouteETAUPosition

- (GEOComposedRouteETAUPosition)initWithComposedRoute:(id)a3 andUpdateLocation:(id)a4 offset:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOComposedRouteETAUPosition;
  v10 = [(GEOComposedRouteETAUPosition *)&v13 init];
  if (v10)
  {
    v10->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v8, "coordinateAtOffset:", (double)objc_msgSend(v9, "metersFromStartOfRoute")+ a5);
    v10->_timeSinceLastUpdate = (double)[v9 minSecondsSinceLastUpdate];
    v11 = v10;
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  uint64_t v4 = [a3 routeCoordinate];
  unsigned int index = self->_routeCoordinate.index;
  if (index == v4)
  {
    float offset = self->_routeCoordinate.offset;
    if (offset == *((float *)&v4 + 1)) {
      return 0;
    }
    if (offset >= *((float *)&v4 + 1)) {
      return 1;
    }
    return -1;
  }
  if (index < v4) {
    return -1;
  }
  return 1;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (double)timeSinceLastUpdate
{
  return self->_timeSinceLastUpdate;
}

@end