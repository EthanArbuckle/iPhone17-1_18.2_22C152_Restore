@interface GenerativeModelsAvailable
+ (BOOL)retrieveGenerativeModelsAvailable;
- (_TtC14analyticsagent25GenerativeModelsAvailable)init;
@end

@implementation GenerativeModelsAvailable

+ (BOOL)retrieveGenerativeModelsAvailable
{
  uint64_t v2 = _s14analyticsagent25GenerativeModelsAvailableC08retrievebcD10AndReasonsSS_So13OS_xpc_object_ptyFZ_0();
  uint64_t v4 = v3;
  swift_unknownObjectRelease();
  if (v2 == 0x6C62616C69617661 && v4 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    char v5 = 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
  }
  return v5 & 1;
}

- (_TtC14analyticsagent25GenerativeModelsAvailable)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeModelsAvailable();
  return [(GenerativeModelsAvailable *)&v3 init];
}

@end