@interface SecureButtonTag
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC15AppDistribution15SecureButtonTag)init;
- (_TtC15AppDistribution15SecureButtonTag)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SecureButtonTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC15AppDistribution15SecureButtonTag)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC15AppDistribution15SecureButtonTag *)sub_247A50C30(v3);

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
    sub_247A51BD0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = SecureButtonTag.isEqual(_:)((uint64_t)v8);

  sub_247A35B1C((uint64_t)v8);
  return v6 & 1;
}

- (_TtC15AppDistribution15SecureButtonTag)init
{
  result = (_TtC15AppDistribution15SecureButtonTag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AppDistribution15SecureButtonTag_backgroundColor));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AppDistribution15SecureButtonTag_foregroundColor));
  int64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC15AppDistribution15SecureButtonTag_borderColor);
}

@end