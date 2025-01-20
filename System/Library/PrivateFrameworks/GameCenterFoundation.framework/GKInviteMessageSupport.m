@interface GKInviteMessageSupport
+ (id)extractPropertiesWithData:(id)a3;
+ (id)makeInviteMessageDoneWithProperties:(id)a3;
- (GKInviteMessageSupport)init;
@end

@implementation GKInviteMessageSupport

+ (id)makeInviteMessageDoneWithProperties:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA338B48);
    uint64_t v3 = sub_1C2E92228();
  }
  uint64_t v4 = static InviteMessageSupport.makeInviteMessageDone(properties:)(v3);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  v7 = (void *)sub_1C2E91A48();
  sub_1C2DFD1D4(v4, v6);

  return v7;
}

+ (id)extractPropertiesWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1C2E91A58();
  unint64_t v6 = v5;

  uint64_t v7 = static InviteMessageSupport.extractProperties(data:)(v4, v6);
  sub_1C2DFD1D4(v4, v6);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA338B48);
    v8 = (void *)sub_1C2E92218();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (GKInviteMessageSupport)init
{
  return (GKInviteMessageSupport *)InviteMessageSupport.init()();
}

@end