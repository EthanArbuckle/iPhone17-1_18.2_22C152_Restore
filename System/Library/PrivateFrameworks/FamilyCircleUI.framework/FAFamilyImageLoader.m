@interface FAFamilyImageLoader
+ (_TtC14FamilyCircleUI19FAFamilyImageLoader)shared;
- (NSDictionary)_authResults;
- (NSDictionary)authResults;
- (_TtC14FamilyCircleUI19FAFamilyImageLoader)init;
- (void)setAuthResults:(id)a3;
- (void)set_authResults:(id)a3;
@end

@implementation FAFamilyImageLoader

+ (_TtC14FamilyCircleUI19FAFamilyImageLoader)shared
{
  if (qword_267BE8438 != -1) {
    swift_once();
  }
  v2 = off_267BECCA0;
  return (_TtC14FamilyCircleUI19FAFamilyImageLoader *)v2;
}

- (NSDictionary)_authResults
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_218CAED18();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)set_authResults:(id)a3
{
  uint64_t v4 = sub_218CAED38();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14FamilyCircleUI19FAFamilyImageLoader__authResults);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSDictionary)authResults
{
  swift_getKeyPath();
  sub_218B719B4();
  v3 = self;
  sub_218CACBC8();
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();

  uint64_t v4 = (void *)sub_218CAED18();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v4;
}

- (void)setAuthResults:(id)a3
{
  sub_218CAED38();
  swift_getKeyPath();
  sub_218B719B4();
  uint64_t v4 = self;
  sub_218CACBB8();
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC14FamilyCircleUI19FAFamilyImageLoader)init
{
  result = (_TtC14FamilyCircleUI19FAFamilyImageLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI19FAFamilyImageLoader__imageProvider);
  v3 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI19FAFamilyImageLoader___observationRegistrar;
  uint64_t v4 = sub_218CACC08();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end