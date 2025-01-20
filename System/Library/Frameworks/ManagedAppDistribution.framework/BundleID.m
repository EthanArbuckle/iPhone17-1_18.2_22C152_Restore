@interface BundleID
- (BOOL)isEqual:(id)a3;
- (_TtC22ManagedAppDistribution8BundleID)init;
- (id)description;
- (int64_t)hash;
@end

@implementation BundleID

- (id)description
{
  swift_bridgeObjectRetain();
  v0 = (void *)sub_2445EF118();
  swift_bridgeObjectRelease();

  return v0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2445EF4A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = BundleID.isEqual(_:)((uint64_t)v8);

  sub_244584138((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_2445EF1C8();

  return v3;
}

- (_TtC22ManagedAppDistribution8BundleID)init
{
  result = (_TtC22ManagedAppDistribution8BundleID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end