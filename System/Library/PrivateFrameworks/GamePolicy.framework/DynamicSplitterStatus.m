@interface DynamicSplitterStatus
+ (BOOL)supportsSecureCoding;
- (_TtC10GamePolicy21DynamicSplitterStatus)init;
- (_TtC10GamePolicy21DynamicSplitterStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DynamicSplitterStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DynamicSplitterStatus.encode(with:)((NSCoder)v4);
}

- (_TtC10GamePolicy21DynamicSplitterStatus)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC10GamePolicy21DynamicSplitterStatus *)sub_24F926430(v3);

  return v4;
}

- (_TtC10GamePolicy21DynamicSplitterStatus)init
{
  result = (_TtC10GamePolicy21DynamicSplitterStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end