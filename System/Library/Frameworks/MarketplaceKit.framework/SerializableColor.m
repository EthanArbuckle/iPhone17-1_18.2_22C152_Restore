@interface SerializableColor
+ (BOOL)supportsSecureCoding;
- (_TtC14MarketplaceKit17SerializableColor)init;
- (_TtC14MarketplaceKit17SerializableColor)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SerializableColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2446459C4(v4);
}

- (_TtC14MarketplaceKit17SerializableColor)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC14MarketplaceKit17SerializableColor *)sub_2446463B4(v3);

  return v4;
}

- (_TtC14MarketplaceKit17SerializableColor)init
{
  result = (_TtC14MarketplaceKit17SerializableColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end