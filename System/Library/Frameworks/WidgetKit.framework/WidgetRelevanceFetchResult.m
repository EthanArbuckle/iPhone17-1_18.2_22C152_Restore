@interface WidgetRelevanceFetchResult
+ (BOOL)supportsSecureCoding;
- (_TtC9WidgetKit26WidgetRelevanceFetchResult)init;
- (_TtC9WidgetKit26WidgetRelevanceFetchResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WidgetRelevanceFetchResult

- (_TtC9WidgetKit26WidgetRelevanceFetchResult)init
{
  result = (_TtC9WidgetKit26WidgetRelevanceFetchResult *)sub_191CF5FC8();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit26WidgetRelevanceFetchResult)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC9WidgetKit26WidgetRelevanceFetchResult *)sub_191C2C2AC(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  WidgetRelevanceFetchResult.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
}

@end