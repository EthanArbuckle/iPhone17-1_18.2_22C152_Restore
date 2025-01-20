@interface DCMutableMapsLink
- (BOOL)showsBicycling;
- (BOOL)showsStreetView;
- (BOOL)showsTraffic;
- (BOOL)showsTransit;
- (NSString)centerLocation;
- (NSString)destinationAddress;
- (NSString)searchLocation;
- (NSString)searchNearQuery;
- (NSString)searchQuery;
- (NSString)startAddress;
- (NSString)streetViewLocation;
- (int64_t)zoomLevel;
- (unint64_t)directionsMode;
- (unint64_t)mapType;
- (void)setCenterLocation:(id)a3;
- (void)setDestinationAddress:(id)a3;
- (void)setDirectionsMode:(unint64_t)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setSearchLocation:(id)a3;
- (void)setSearchNearQuery:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setShowsBicycling:(BOOL)a3;
- (void)setShowsStreetView:(BOOL)a3;
- (void)setShowsTraffic:(BOOL)a3;
- (void)setShowsTransit:(BOOL)a3;
- (void)setStartAddress:(id)a3;
- (void)setStreetViewLocation:(id)a3;
- (void)setZoomLevel:(int64_t)a3;
@end

@implementation DCMutableMapsLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streetViewLocation, 0);
  objc_storeStrong((id *)&self->_centerLocation, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_startAddress, 0);
  objc_storeStrong((id *)&self->_searchLocation, 0);
  objc_storeStrong((id *)&self->_searchNearQuery, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

- (void)setStreetViewLocation:(id)a3
{
}

- (NSString)streetViewLocation
{
  return self->_streetViewLocation;
}

- (void)setShowsBicycling:(BOOL)a3
{
  self->_showsBicycling = a3;
}

- (BOOL)showsBicycling
{
  return self->_showsBicycling;
}

- (void)setShowsStreetView:(BOOL)a3
{
  self->_showsStreetView = a3;
}

- (BOOL)showsStreetView
{
  return self->_showsStreetView;
}

- (void)setShowsTransit:(BOOL)a3
{
  self->_showsTransit = a3;
}

- (BOOL)showsTransit
{
  return self->_showsTransit;
}

- (void)setShowsTraffic:(BOOL)a3
{
  self->_showsTraffic = a3;
}

- (BOOL)showsTraffic
{
  return self->_showsTraffic;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setZoomLevel:(int64_t)a3
{
  self->_zoomLevel = a3;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setCenterLocation:(id)a3
{
}

- (NSString)centerLocation
{
  return self->_centerLocation;
}

- (void)setDirectionsMode:(unint64_t)a3
{
  self->_directionsMode = a3;
}

- (unint64_t)directionsMode
{
  return self->_directionsMode;
}

- (void)setDestinationAddress:(id)a3
{
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (void)setStartAddress:(id)a3
{
}

- (NSString)startAddress
{
  return self->_startAddress;
}

- (void)setSearchLocation:(id)a3
{
}

- (NSString)searchLocation
{
  return self->_searchLocation;
}

- (void)setSearchNearQuery:(id)a3
{
}

- (NSString)searchNearQuery
{
  return self->_searchNearQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

@end