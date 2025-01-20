@interface SecureButtonTag
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC14MarketplaceKit15SecureButtonTag)init;
- (_TtC14MarketplaceKit15SecureButtonTag)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SecureButtonTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14MarketplaceKit15SecureButtonTag)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC14MarketplaceKit15SecureButtonTag *)sub_244645C84(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SecureButtonTag.encode(with:)((NSCoder)v4);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SecureButtonTag.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_24469D238();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = SecureButtonTag.isEqual(_:)((uint64_t)v8);

  sub_244646194((uint64_t)v8);
  return v6 & 1;
}

- (_TtC14MarketplaceKit15SecureButtonTag)init
{
  result = (_TtC14MarketplaceKit15SecureButtonTag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  int64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14MarketplaceKit15SecureButtonTag_borderColor);
}

@end