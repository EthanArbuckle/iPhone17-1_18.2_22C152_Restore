@interface MTDeviceSetupRequestFactory
+ (id)makeRequestFrom:(id)a3;
+ (id)makeRequestWithEcosystemName:(id)a3 homes:(id)a4 blockedDevicePairings:(id)a5;
- (MTDeviceSetupRequestFactory)init;
@end

@implementation MTDeviceSetupRequestFactory

+ (id)makeRequestFrom:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    id v4 = a3;
    uint64_t v3 = sub_2451326B8();
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = 0xF000000000000000;
  }
  id v7 = sub_2451082CC(v3, v6);
  sub_24510702C(v3, v6);

  return v7;
}

+ (id)makeRequestWithEcosystemName:(id)a3 homes:(id)a4 blockedDevicePairings:(id)a5
{
  uint64_t v5 = sub_245132838();
  uint64_t v7 = v6;
  uint64_t v8 = sub_245132898();
  sub_245108D5C(0, &qword_268EC3978);
  unint64_t v9 = sub_245132898();
  v10 = (void *)sub_2451085BC(v5, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v10;
}

- (MTDeviceSetupRequestFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MTDeviceSetupRequestFactory();
  return [(MTDeviceSetupRequestFactory *)&v3 init];
}

@end