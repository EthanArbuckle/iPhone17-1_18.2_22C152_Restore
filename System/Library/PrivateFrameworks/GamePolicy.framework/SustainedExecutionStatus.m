@interface SustainedExecutionStatus
+ (BOOL)supportsSecureCoding;
- (_TtC10GamePolicy24SustainedExecutionStatus)init;
- (_TtC10GamePolicy24SustainedExecutionStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SustainedExecutionStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SustainedExecutionStatus.encode(with:)((NSCoder)v4);
}

- (_TtC10GamePolicy24SustainedExecutionStatus)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC10GamePolicy24SustainedExecutionStatus *)sub_24F936274(v3);

  return v4;
}

- (_TtC10GamePolicy24SustainedExecutionStatus)init
{
  result = (_TtC10GamePolicy24SustainedExecutionStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end