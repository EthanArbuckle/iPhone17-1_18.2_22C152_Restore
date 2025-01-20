@interface PeopleDiscoveryEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (_TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent)init;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation PeopleDiscoveryEvent

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = sub_1C7B22390();
  unint64_t v8 = v7;

  swift_getObjCClassMetadata();
  id v9 = static PeopleDiscoveryEvent.event(with:dataVersion:)(v6, v8, a4);
  sub_1C7B20560(v6, v8);
  return v9;
}

- (id)serialize
{
  return sub_1C7B1F8D4(self, (uint64_t)a2, (void (*)(void))PeopleDiscoveryEvent.serialize());
}

- (id)json
{
  return sub_1C7B1F8D4(self, (uint64_t)a2, (void (*)(void))PeopleDiscoveryEvent.json());
}

- (_TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent)init
{
}

- (void).cxx_destruct
{
}

@end