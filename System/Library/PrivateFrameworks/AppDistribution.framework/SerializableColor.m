@interface SerializableColor
+ (BOOL)supportsSecureCoding;
- (_TtC15AppDistribution17SerializableColor)init;
- (_TtC15AppDistribution17SerializableColor)initWithCoder:(id)a3;
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
  sub_247A50970(v4);
}

- (_TtC15AppDistribution17SerializableColor)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC15AppDistribution17SerializableColor *)sub_247A51298(v3);

  return v4;
}

- (_TtC15AppDistribution17SerializableColor)init
{
  result = (_TtC15AppDistribution17SerializableColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end