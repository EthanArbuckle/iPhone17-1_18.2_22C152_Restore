@interface MPAVRoutingViewControllerItems
- (NSArray)headphones;
- (NSArray)localDevices;
- (NSArray)speakersAndTVs;
- (NSDictionary)routeGrouping;
- (void)setHeadphones:(id)a3;
- (void)setLocalDevices:(id)a3;
- (void)setRouteGrouping:(id)a3;
- (void)setSpeakersAndTVs:(id)a3;
@end

@implementation MPAVRoutingViewControllerItems

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakersAndTVs, 0);
  objc_storeStrong((id *)&self->_headphones, 0);
  objc_storeStrong((id *)&self->_localDevices, 0);

  objc_storeStrong((id *)&self->_routeGrouping, 0);
}

- (void)setSpeakersAndTVs:(id)a3
{
}

- (NSArray)speakersAndTVs
{
  return self->_speakersAndTVs;
}

- (void)setHeadphones:(id)a3
{
}

- (NSArray)headphones
{
  return self->_headphones;
}

- (void)setLocalDevices:(id)a3
{
}

- (NSArray)localDevices
{
  return self->_localDevices;
}

- (void)setRouteGrouping:(id)a3
{
}

- (NSDictionary)routeGrouping
{
  return self->_routeGrouping;
}

@end