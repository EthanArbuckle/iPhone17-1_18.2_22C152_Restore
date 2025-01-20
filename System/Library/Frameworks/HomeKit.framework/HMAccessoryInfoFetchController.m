@interface HMAccessoryInfoFetchController
- (HMAccessoryInfoFetchController)init;
@end

@implementation HMAccessoryInfoFetchController

- (HMAccessoryInfoFetchController)init
{
  result = (HMAccessoryInfoFetchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___HMAccessoryInfoFetchController_log;
  uint64_t v4 = sub_19D457208();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___HMAccessoryInfoFetchController_homeUUID;
  uint64_t v6 = sub_19D4571D8();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_19D1E5DB4((uint64_t)self + OBJC_IVAR___HMAccessoryInfoFetchController_dataSource);

  swift_release();
}

@end