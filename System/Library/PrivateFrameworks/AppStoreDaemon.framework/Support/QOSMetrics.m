@interface QOSMetrics
+ (BOOL)shouldCollectMetrics;
- (_TtC9appstored10QOSMetrics)init;
@end

@implementation QOSMetrics

+ (BOOL)shouldCollectMetrics
{
  return sub_1000B97AC();
}

- (_TtC9appstored10QOSMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QOSMetrics();
  return [(QOSMetrics *)&v3 init];
}

@end