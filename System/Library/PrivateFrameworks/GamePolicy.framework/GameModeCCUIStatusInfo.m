@interface GameModeCCUIStatusInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC10GamePolicy22GameModeCCUIStatusInfo)init;
- (_TtC10GamePolicy22GameModeCCUIStatusInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GameModeCCUIStatusInfo

+ (BOOL)supportsSecureCoding
{
  return static GameModeCCUIStatusInfo.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static GameModeCCUIStatusInfo.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  GameModeCCUIStatusInfo.encode(with:)((NSCoder)v4);
}

- (_TtC10GamePolicy22GameModeCCUIStatusInfo)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy22GameModeCCUIStatusInfo *)GameModeCCUIStatusInfo.init(coder:)(a3);
}

- (_TtC10GamePolicy22GameModeCCUIStatusInfo)init
{
  result = (_TtC10GamePolicy22GameModeCCUIStatusInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end