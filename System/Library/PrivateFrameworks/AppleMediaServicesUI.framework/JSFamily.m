@interface JSFamily
- (_TtC14amsengagementd8JSFamily)init;
- (id)lookUpEligibility:(id)a3;
- (id)lookup:(id)a3;
@end

@implementation JSFamily

- (id)lookup:(id)a3
{
  return sub_1000E43E4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1000E19E4);
}

- (id)lookUpEligibility:(id)a3
{
  return sub_1000E43E4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1000E30D0);
}

- (_TtC14amsengagementd8JSFamily)init
{
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->accountStore[OBJC_IVAR____TtC14amsengagementd8JSFamily_config];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end