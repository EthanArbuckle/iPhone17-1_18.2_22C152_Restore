@interface AATimeDurationGranularityFactory
+ (AATimeDurationGranularityFactory)shared;
- (AATimeDurationGranularityFactory)init;
- (AATimeDurationGranularityFactory)initWithName:(id)a3;
@end

@implementation AATimeDurationGranularityFactory

+ (AATimeDurationGranularityFactory)shared
{
  if (qword_1E97B1018 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E97B1C50;

  return (AATimeDurationGranularityFactory *)v2;
}

- (AATimeDurationGranularityFactory)initWithName:(id)a3
{
  sub_1A916AF90();
  v4 = self;
  v5 = (AATimeDurationGranularityFactory *)_s12AppAnalytics37BridgedTimeDurationGranularityFactoryC04makedeF0yAA0cdeF0OSSF_0();

  swift_bridgeObjectRelease();
  return v5;
}

- (AATimeDurationGranularityFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(AATimeDurationGranularityFactory *)&v3 init];
}

@end