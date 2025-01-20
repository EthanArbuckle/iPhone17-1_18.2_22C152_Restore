@interface MRURoutingViewControllerUpdate
- (BOOL)canGroup;
- (BOOL)hasPendingPickedRoutes;
- (BOOL)shouldReload;
- (NSArray)activatedVendorSpecificDeviceIDs;
- (NSArray)airPlayRoutes;
- (NSArray)availableVendorSpecificDeviceIDs;
- (NSArray)displayAsPickedRoutes;
- (NSArray)displayableAvailableRoutes;
- (NSArray)nativeRoutes;
- (NSArray)nativeRoutesInVendorSpecificGroup;
- (NSArray)pendingPickedRoutes;
- (NSArray)pendingVendorSpecificDeviceIDs;
- (NSArray)pickedRoutes;
- (NSArray)volumeCapableRoutes;
- (NSDictionary)routeGrouping;
- (void)setActivatedVendorSpecificDeviceIDs:(id)a3;
- (void)setAirPlayRoutes:(id)a3;
- (void)setAvailableVendorSpecificDeviceIDs:(id)a3;
- (void)setCanGroup:(BOOL)a3;
- (void)setDisplayAsPickedRoutes:(id)a3;
- (void)setDisplayableAvailableRoutes:(id)a3;
- (void)setHasPendingPickedRoutes:(BOOL)a3;
- (void)setNativeRoutes:(id)a3;
- (void)setNativeRoutesInVendorSpecificGroup:(id)a3;
- (void)setPendingPickedRoutes:(id)a3;
- (void)setPendingVendorSpecificDeviceIDs:(id)a3;
- (void)setPickedRoutes:(id)a3;
- (void)setRouteGrouping:(id)a3;
- (void)setShouldReload:(BOOL)a3;
- (void)setVolumeCapableRoutes:(id)a3;
@end

@implementation MRURoutingViewControllerUpdate

- (NSArray)pickedRoutes
{
  return self->_pickedRoutes;
}

- (void)setPickedRoutes:(id)a3
{
}

- (NSArray)pendingPickedRoutes
{
  return self->_pendingPickedRoutes;
}

- (void)setPendingPickedRoutes:(id)a3
{
}

- (NSArray)displayableAvailableRoutes
{
  return self->_displayableAvailableRoutes;
}

- (void)setDisplayableAvailableRoutes:(id)a3
{
}

- (NSArray)displayAsPickedRoutes
{
  return self->_displayAsPickedRoutes;
}

- (void)setDisplayAsPickedRoutes:(id)a3
{
}

- (NSArray)volumeCapableRoutes
{
  return self->_volumeCapableRoutes;
}

- (void)setVolumeCapableRoutes:(id)a3
{
}

- (NSArray)airPlayRoutes
{
  return self->_airPlayRoutes;
}

- (void)setAirPlayRoutes:(id)a3
{
}

- (NSArray)nativeRoutes
{
  return self->_nativeRoutes;
}

- (void)setNativeRoutes:(id)a3
{
}

- (NSArray)nativeRoutesInVendorSpecificGroup
{
  return self->_nativeRoutesInVendorSpecificGroup;
}

- (void)setNativeRoutesInVendorSpecificGroup:(id)a3
{
}

- (NSArray)activatedVendorSpecificDeviceIDs
{
  return self->_activatedVendorSpecificDeviceIDs;
}

- (void)setActivatedVendorSpecificDeviceIDs:(id)a3
{
}

- (NSArray)pendingVendorSpecificDeviceIDs
{
  return self->_pendingVendorSpecificDeviceIDs;
}

- (void)setPendingVendorSpecificDeviceIDs:(id)a3
{
}

- (NSArray)availableVendorSpecificDeviceIDs
{
  return self->_availableVendorSpecificDeviceIDs;
}

- (void)setAvailableVendorSpecificDeviceIDs:(id)a3
{
}

- (NSDictionary)routeGrouping
{
  return self->_routeGrouping;
}

- (void)setRouteGrouping:(id)a3
{
}

- (BOOL)canGroup
{
  return self->_canGroup;
}

- (void)setCanGroup:(BOOL)a3
{
  self->_canGroup = a3;
}

- (BOOL)hasPendingPickedRoutes
{
  return self->_hasPendingPickedRoutes;
}

- (void)setHasPendingPickedRoutes:(BOOL)a3
{
  self->_hasPendingPickedRoutes = a3;
}

- (BOOL)shouldReload
{
  return self->_shouldReload;
}

- (void)setShouldReload:(BOOL)a3
{
  self->_shouldReload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGrouping, 0);
  objc_storeStrong((id *)&self->_availableVendorSpecificDeviceIDs, 0);
  objc_storeStrong((id *)&self->_pendingVendorSpecificDeviceIDs, 0);
  objc_storeStrong((id *)&self->_activatedVendorSpecificDeviceIDs, 0);
  objc_storeStrong((id *)&self->_nativeRoutesInVendorSpecificGroup, 0);
  objc_storeStrong((id *)&self->_nativeRoutes, 0);
  objc_storeStrong((id *)&self->_airPlayRoutes, 0);
  objc_storeStrong((id *)&self->_volumeCapableRoutes, 0);
  objc_storeStrong((id *)&self->_displayAsPickedRoutes, 0);
  objc_storeStrong((id *)&self->_displayableAvailableRoutes, 0);
  objc_storeStrong((id *)&self->_pendingPickedRoutes, 0);

  objc_storeStrong((id *)&self->_pickedRoutes, 0);
}

@end