@interface GEOTransitLink
- (GEOVectorTile)containingTile;
- (GeoCodecsConnectivityJunction)fromJunction;
- (GeoCodecsConnectivityJunction)toJunction;
- (GeoCodecsRange)collapsedNodesIDRange;
- (GeoCodecsRange)collapsedNodesIndexRange;
- (GeoCodecsRange)originalNodeIDPointerIndexRange;
- (GeoCodecsRange)shieldIndexRange;
- (GeoCodecsRange)transitIndexRange;
- (GeoCodecsRange)travelTimeIndexRange;
- (id)init:(void *)a3 withVectorTile:(id)a4;
- (unint64_t)fromNodeID;
- (unint64_t)toNodeID;
- (unsigned)sectionCount;
- (unsigned)sectionOffset;
- (void)get;
@end

@implementation GEOTransitLink

- (id)init:(void *)a3 withVectorTile:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOTransitLink;
    v7 = [(GEOTransitLink *)&v10 init];
    v8 = v7;
    if (v7)
    {
      v7->_transitLink = a3;
      objc_storeWeak((id *)&v7->_containingTile, v6);
    }
    self = v8;
    a3 = self;
  }

  return a3;
}

- (void)get
{
  return self->_transitLink;
}

- (GEOVectorTile)containingTile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingTile);

  return (GEOVectorTile *)WeakRetained;
}

- (unsigned)sectionOffset
{
  transitLink = self->_transitLink;
  if (transitLink) {
    return transitLink[4];
  }
  else {
    return 0;
  }
}

- (unsigned)sectionCount
{
  transitLink = self->_transitLink;
  if (transitLink) {
    return transitLink[5];
  }
  else {
    return 0;
  }
}

- (GeoCodecsRange)transitIndexRange
{
  transitLink = (char *)self->_transitLink;
  if (transitLink) {
    return (GeoCodecsRange *)(transitLink + 24);
  }
  else {
    return 0;
  }
}

- (GeoCodecsConnectivityJunction)fromJunction
{
  transitLink = self->_transitLink;
  if (transitLink) {
    return (GeoCodecsConnectivityJunction *)*((void *)transitLink + 5);
  }
  else {
    return 0;
  }
}

- (GeoCodecsConnectivityJunction)toJunction
{
  transitLink = self->_transitLink;
  if (transitLink) {
    return (GeoCodecsConnectivityJunction *)*((void *)transitLink + 6);
  }
  else {
    return 0;
  }
}

- (unint64_t)fromNodeID
{
  transitLink = self->_transitLink;
  if (transitLink) {
    return transitLink[7];
  }
  else {
    return 0;
  }
}

- (unint64_t)toNodeID
{
  transitLink = self->_transitLink;
  if (transitLink) {
    return transitLink[8];
  }
  else {
    return 0;
  }
}

- (GeoCodecsRange)travelTimeIndexRange
{
  transitLink = (char *)self->_transitLink;
  if (transitLink) {
    return (GeoCodecsRange *)(transitLink + 72);
  }
  else {
    return 0;
  }
}

- (GeoCodecsRange)shieldIndexRange
{
  transitLink = (char *)self->_transitLink;
  if (transitLink) {
    return (GeoCodecsRange *)(transitLink + 88);
  }
  else {
    return 0;
  }
}

- (GeoCodecsRange)originalNodeIDPointerIndexRange
{
  transitLink = (char *)self->_transitLink;
  if (transitLink) {
    return (GeoCodecsRange *)(transitLink + 104);
  }
  else {
    return 0;
  }
}

- (GeoCodecsRange)collapsedNodesIndexRange
{
  transitLink = (char *)self->_transitLink;
  if (transitLink) {
    return (GeoCodecsRange *)(transitLink + 120);
  }
  else {
    return 0;
  }
}

- (GeoCodecsRange)collapsedNodesIDRange
{
  transitLink = (char *)self->_transitLink;
  if (transitLink) {
    return (GeoCodecsRange *)(transitLink + 152);
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end