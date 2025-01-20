@interface GameModeCCUIStatusBundle
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC10GamePolicy24GameModeCCUIStatusBundle)init;
- (_TtC10GamePolicy24GameModeCCUIStatusBundle)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GameModeCCUIStatusBundle

+ (BOOL)supportsSecureCoding
{
  return static GameModeCCUIStatusBundle.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static GameModeCCUIStatusBundle.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  GameModeCCUIStatusBundle.encode(with:)((NSCoder)v4);
}

- (_TtC10GamePolicy24GameModeCCUIStatusBundle)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy24GameModeCCUIStatusBundle *)GameModeCCUIStatusBundle.init(coder:)(a3);
}

- (_TtC10GamePolicy24GameModeCCUIStatusBundle)init
{
  result = (_TtC10GamePolicy24GameModeCCUIStatusBundle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end