@interface Container
+ (NSArray)complicationBundleDataSources;
- (_TtC20WeatherComplications9Container)init;
@end

@implementation Container

+ (NSArray)complicationBundleDataSources
{
  sub_23796DA3C();
  sub_2379265BC(&qword_2689379F0);
  v2 = (void *)sub_23796EB08();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (_TtC20WeatherComplications9Container)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Container();
  return [(Container *)&v3 init];
}

@end