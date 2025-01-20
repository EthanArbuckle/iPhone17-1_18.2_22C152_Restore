@interface IdentityGesture
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13CoreIDVShared15IdentityGesture)init;
- (_TtC13CoreIDVShared15IdentityGesture)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityGesture

+ (BOOL)supportsSecureCoding
{
  return byte_1EA844043;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA844043 = a3;
}

- (_TtC13CoreIDVShared15IdentityGesture)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared15IdentityGesture *)sub_1D792E2F0(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared15IdentityGesture_gesture);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D7A9BF98();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v4, v7);

  uint64_t v8 = *(uint64_t *)((char *)&v6->super.isa + OBJC_IVAR____TtC13CoreIDVShared15IdentityGesture_type);
  id v9 = (id)sub_1D7A9BF98();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v8, v9);
}

- (_TtC13CoreIDVShared15IdentityGesture)init
{
  result = (_TtC13CoreIDVShared15IdentityGesture *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end