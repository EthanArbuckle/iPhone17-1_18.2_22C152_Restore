@interface AATimestampGranularityFactory
+ (AATimestampGranularityFactory)shared;
- (AATimestampGranularityFactory)init;
- (AATimestampGranularityFactory)initWithName:(id)a3;
@end

@implementation AATimestampGranularityFactory

+ (AATimestampGranularityFactory)shared
{
  if (qword_1EB686778 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB686768;

  return (AATimestampGranularityFactory *)v2;
}

- (AATimestampGranularityFactory)initWithName:(id)a3
{
  sub_1A916AF90();
  v4 = self;
  v5 = (AATimestampGranularityFactory *)_s12AppAnalytics34BridgedTimestampGranularityFactoryC04makedE0yAA0cdE0OSSF_0();

  swift_bridgeObjectRelease();
  return v5;
}

- (AATimestampGranularityFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(AATimestampGranularityFactory *)&v3 init];
}

@end