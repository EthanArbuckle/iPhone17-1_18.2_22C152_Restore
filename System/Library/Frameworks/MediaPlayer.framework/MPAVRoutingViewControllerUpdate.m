@interface MPAVRoutingViewControllerUpdate
- (BOOL)canGroup;
- (BOOL)hasPendingPickedRoutes;
- (BOOL)shouldReload;
- (NSArray)displayAsPickedRoutes;
- (NSArray)displayableAvailableRoutes;
- (NSArray)pendingPickedRoutes;
- (NSArray)pickedRoutes;
- (NSArray)volumeCapableRoutes;
- (NSDictionary)routeGrouping;
- (void)setCanGroup:(BOOL)a3;
- (void)setDisplayAsPickedRoutes:(id)a3;
- (void)setDisplayableAvailableRoutes:(id)a3;
- (void)setHasPendingPickedRoutes:(BOOL)a3;
- (void)setPendingPickedRoutes:(id)a3;
- (void)setPickedRoutes:(id)a3;
- (void)setRouteGrouping:(id)a3;
- (void)setShouldReload:(BOOL)a3;
- (void)setVolumeCapableRoutes:(id)a3;
@end

@implementation MPAVRoutingViewControllerUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGrouping, 0);
  objc_storeStrong((id *)&self->_volumeCapableRoutes, 0);
  objc_storeStrong((id *)&self->_displayAsPickedRoutes, 0);
  objc_storeStrong((id *)&self->_displayableAvailableRoutes, 0);
  objc_storeStrong((id *)&self->_pendingPickedRoutes, 0);

  objc_storeStrong((id *)&self->_pickedRoutes, 0);
}

- (void)setShouldReload:(BOOL)a3
{
  self->_shouldReload = a3;
}

- (BOOL)shouldReload
{
  return self->_shouldReload;
}

- (void)setHasPendingPickedRoutes:(BOOL)a3
{
  self->_hasPendingPickedRoutes = a3;
}

- (BOOL)hasPendingPickedRoutes
{
  return self->_hasPendingPickedRoutes;
}

- (void)setCanGroup:(BOOL)a3
{
  self->_canGroup = a3;
}

- (BOOL)canGroup
{
  return self->_canGroup;
}

- (void)setRouteGrouping:(id)a3
{
}

- (NSDictionary)routeGrouping
{
  return self->_routeGrouping;
}

- (void)setVolumeCapableRoutes:(id)a3
{
}

- (NSArray)volumeCapableRoutes
{
  return self->_volumeCapableRoutes;
}

- (void)setDisplayAsPickedRoutes:(id)a3
{
}

- (NSArray)displayAsPickedRoutes
{
  return self->_displayAsPickedRoutes;
}

- (void)setDisplayableAvailableRoutes:(id)a3
{
}

- (NSArray)displayableAvailableRoutes
{
  return self->_displayableAvailableRoutes;
}

- (void)setPendingPickedRoutes:(id)a3
{
}

- (NSArray)pendingPickedRoutes
{
  return self->_pendingPickedRoutes;
}

- (void)setPickedRoutes:(id)a3
{
}

- (NSArray)pickedRoutes
{
  return self->_pickedRoutes;
}

@end