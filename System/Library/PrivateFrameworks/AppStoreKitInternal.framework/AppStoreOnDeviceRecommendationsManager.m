@interface AppStoreOnDeviceRecommendationsManager
- (_TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager)init;
- (id)performRequest:(id)a3;
@end

@implementation AppStoreOnDeviceRecommendationsManager

- (id)performRequest:(id)a3
{
  swift_getObjectType();
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1E1D5CC88();
  v8 = (void *)sub_1E1D5CC98();

  return v8;
}

- (_TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager)init
{
  result = (_TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager_amsEngagement));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager_accountStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager_activeStoreAccount));
  swift_release();
}

@end