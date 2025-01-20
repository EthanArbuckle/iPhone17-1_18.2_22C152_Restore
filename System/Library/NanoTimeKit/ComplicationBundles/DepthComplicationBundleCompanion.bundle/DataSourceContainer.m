@interface DataSourceContainer
+ (NSArray)complicationBundleDataSources;
- (_TtC32DepthComplicationBundleCompanion19DataSourceContainer)init;
@end

@implementation DataSourceContainer

+ (NSArray)complicationBundleDataSources
{
  sub_66B8(&qword_49078);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_38360;
  *(void *)(v2 + 32) = type metadata accessor for DepthDataSource();
  *(void *)(v2 + 40) = type metadata accessor for TemperatureDataSource();
  sub_66B8(&qword_49080);
  v3.super.isa = sub_36E88().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC32DepthComplicationBundleCompanion19DataSourceContainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DataSourceContainer();
  return [(DataSourceContainer *)&v3 init];
}

@end