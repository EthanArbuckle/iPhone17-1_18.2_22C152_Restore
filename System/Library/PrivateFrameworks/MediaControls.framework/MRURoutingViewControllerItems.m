@interface MRURoutingViewControllerItems
- (NSArray)customRows;
- (NSArray)localDevicesAndHeadphones;
- (NSArray)speakersAndTVs;
- (NSDictionary)routeGrouping;
- (void)setCustomRows:(id)a3;
- (void)setLocalDevicesAndHeadphones:(id)a3;
- (void)setRouteGrouping:(id)a3;
- (void)setSpeakersAndTVs:(id)a3;
@end

@implementation MRURoutingViewControllerItems

- (NSDictionary)routeGrouping
{
  return self->_routeGrouping;
}

- (void)setRouteGrouping:(id)a3
{
}

- (NSArray)localDevicesAndHeadphones
{
  return self->_localDevicesAndHeadphones;
}

- (void)setLocalDevicesAndHeadphones:(id)a3
{
}

- (NSArray)speakersAndTVs
{
  return self->_speakersAndTVs;
}

- (void)setSpeakersAndTVs:(id)a3
{
}

- (NSArray)customRows
{
  return self->_customRows;
}

- (void)setCustomRows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customRows, 0);
  objc_storeStrong((id *)&self->_speakersAndTVs, 0);
  objc_storeStrong((id *)&self->_localDevicesAndHeadphones, 0);

  objc_storeStrong((id *)&self->_routeGrouping, 0);
}

@end