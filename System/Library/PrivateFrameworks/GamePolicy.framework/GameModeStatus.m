@interface GameModeStatus
+ (BOOL)supportsSecureCoding;
- (_TtC10GamePolicy14GameModeStatus)init;
- (_TtC10GamePolicy14GameModeStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GameModeStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  GameModeStatus.encode(with:)((NSCoder)v4);
}

- (_TtC10GamePolicy14GameModeStatus)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC10GamePolicy14GameModeStatus *)sub_24F93905C(v3);

  return v4;
}

- (_TtC10GamePolicy14GameModeStatus)init
{
  result = (_TtC10GamePolicy14GameModeStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end