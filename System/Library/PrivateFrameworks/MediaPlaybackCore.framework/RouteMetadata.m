@interface RouteMetadata
- (BOOL)isAirplay;
- (NSString)routeDescription;
@end

@implementation RouteMetadata

- (BOOL)isAirplay
{
  return self->isAirplay[0];
}

- (NSString)routeDescription
{
  if (*(void *)&self->routeDescription[15])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_21BEAA138();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

@end