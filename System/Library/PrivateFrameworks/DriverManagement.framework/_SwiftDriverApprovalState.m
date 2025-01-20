@interface _SwiftDriverApprovalState
- (BOOL)driverIsApproved;
- (BOOL)updatePending;
- (NSString)displayName;
- (NSString)usageText;
- (_SwiftDriverApprovalState)init;
- (id)bundleIdentifier;
@end

@implementation _SwiftDriverApprovalState

- (NSString)displayName
{
  v2 = (char *)self + OBJC_IVAR____SwiftDriverApprovalState_driver;
  if (!*(void *)&v2[*(int *)(type metadata accessor for DriverKitDriver() + 24) + 8]) {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  v3 = (void *)sub_24D006A50();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)usageText
{
  v2 = (char *)self + OBJC_IVAR____SwiftDriverApprovalState_driver;
  if (*(void *)&v2[*(int *)(type metadata accessor for DriverKitDriver() + 28) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_24D006A50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)updatePending
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_24D0069B0();
  swift_release();
  swift_release();

  if (v5) {
    swift_release();
  }
  return v5 != 0;
}

- (BOOL)driverIsApproved
{
  v2 = self;
  Swift::Bool v3 = DriverApprovalState.driverIsApproved()();

  return v3;
}

- (id)bundleIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24D006A50();
  swift_bridgeObjectRelease();

  return v2;
}

- (_SwiftDriverApprovalState)init
{
  result = (_SwiftDriverApprovalState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24D005AF4((uint64_t)self + OBJC_IVAR____SwiftDriverApprovalState_driver);
  Swift::Bool v3 = (char *)self + OBJC_IVAR____SwiftDriverApprovalState__approvalState;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D468);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____SwiftDriverApprovalState__updateStatus;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D478);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end