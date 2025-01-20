@interface PassThroughRadarRequestFilter
- (BOOL)shouldRequestRadarForDisplayReason:(id)a3;
- (_TtC14HomeKitMetrics29PassThroughRadarRequestFilter)init;
@end

@implementation PassThroughRadarRequestFilter

- (BOOL)shouldRequestRadarForDisplayReason:(id)a3
{
  return 1;
}

- (_TtC14HomeKitMetrics29PassThroughRadarRequestFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PassThroughRadarRequestFilter();
  return [(PassThroughRadarRequestFilter *)&v3 init];
}

@end