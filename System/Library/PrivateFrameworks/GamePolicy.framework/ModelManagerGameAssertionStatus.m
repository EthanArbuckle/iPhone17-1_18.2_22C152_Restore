@interface ModelManagerGameAssertionStatus
+ (BOOL)supportsSecureCoding;
- (_TtC10GamePolicy31ModelManagerGameAssertionStatus)init;
- (_TtC10GamePolicy31ModelManagerGameAssertionStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ModelManagerGameAssertionStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ModelManagerGameAssertionStatus.encode(with:)((NSCoder)v4);
}

- (_TtC10GamePolicy31ModelManagerGameAssertionStatus)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC10GamePolicy31ModelManagerGameAssertionStatus *)sub_24F9305A0(v3);

  return v4;
}

- (_TtC10GamePolicy31ModelManagerGameAssertionStatus)init
{
  result = (_TtC10GamePolicy31ModelManagerGameAssertionStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end