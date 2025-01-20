@interface DescriptorFetchResult
+ (BOOL)supportsSecureCoding;
- (_TtC9WidgetKit21DescriptorFetchResult)init;
- (_TtC9WidgetKit21DescriptorFetchResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DescriptorFetchResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit21DescriptorFetchResult)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit21DescriptorFetchResult *)DescriptorFetchResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191BBB5C4(v4);
}

- (_TtC9WidgetKit21DescriptorFetchResult)init
{
  result = (_TtC9WidgetKit21DescriptorFetchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end