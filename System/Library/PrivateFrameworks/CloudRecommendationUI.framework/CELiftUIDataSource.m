@interface CELiftUIDataSource
- (_TtC21CloudRecommendationUI18CELiftUIDataSource)init;
- (_TtC21CloudRecommendationUI18CELiftUIDataSource)initWithAccount:(id)a3;
@end

@implementation CELiftUIDataSource

- (_TtC21CloudRecommendationUI18CELiftUIDataSource)initWithAccount:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC21CloudRecommendationUI18CELiftUIDataSource____lazy_storage___backupDeviceUUID) = xmmword_24A39A1B0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21CloudRecommendationUI18CELiftUIDataSource_account) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(CELiftUIDataSource *)&v8 init];
}

- (_TtC21CloudRecommendationUI18CELiftUIDataSource)init
{
  result = (_TtC21CloudRecommendationUI18CELiftUIDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC21CloudRecommendationUI18CELiftUIDataSource____lazy_storage___backupDeviceUUID);
  uint64_t v4 = *(void *)&self->account[OBJC_IVAR____TtC21CloudRecommendationUI18CELiftUIDataSource____lazy_storage___backupDeviceUUID];
  sub_24A38D1E8(v3, v4);
}

@end