@interface StorableColor
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC10FinanceKit13StorableColor)init;
- (_TtC10FinanceKit13StorableColor)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StorableColor

+ (BOOL)supportsSecureCoding
{
  return byte_268D99E20;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_268D99E20 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2434C3A14(v4);
}

- (_TtC10FinanceKit13StorableColor)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC10FinanceKit13StorableColor *)sub_2434C4278(v3);

  return v4;
}

- (_TtC10FinanceKit13StorableColor)init
{
  result = (_TtC10FinanceKit13StorableColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end