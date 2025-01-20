@interface AKSharedGroupsMembershipInfo
- (AKSharedGroupsMembershipInfo)init;
- (BOOL)isEqual:(id)a3;
@end

@implementation AKSharedGroupsMembershipInfo

- (AKSharedGroupsMembershipInfo)init
{
  result = (AKSharedGroupsMembershipInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___AKSharedGroupsMembershipInfo_savedDate;
  uint64_t v4 = type metadata accessor for Date();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1000F0408((uint64_t)v8);

  sub_1000E79A4((uint64_t)v8);
  return v6 & 1;
}

@end