@interface GroupConfigurationLoader
- (_TtC18HealthPlatformCore24GroupConfigurationLoader)init;
- (id)elementGroupWithIdentifier:(id)a3;
@end

@implementation GroupConfigurationLoader

- (_TtC18HealthPlatformCore24GroupConfigurationLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GroupConfigurationLoader();
  return [(GroupConfigurationLoader *)&v3 init];
}

- (id)elementGroupWithIdentifier:(id)a3
{
  sub_1C1EAED38();
  v4 = self;
  v5 = self;
  v6 = (void *)sub_1C1EAED28();
  id v7 = objc_msgSend(v4, sel_topElementGroupWithIdentifier_, v6);

  swift_bridgeObjectRelease();
  return v7;
}

@end