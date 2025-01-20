@interface AMSUIDDynamicImpressionMetrics
- (AMSUIDDynamicImpressionMetrics)init;
- (AMSUIDDynamicImpressionMetrics)initWithIdentifier:(id)a3 fields:(id)a4 custom:(id)a5;
- (AMSUIDDynamicImpressionMetricsIdentifier)identifier;
- (NSDictionary)custom;
- (NSDictionary)fields;
- (void)setCustom:(id)a3;
- (void)setFields:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AMSUIDDynamicImpressionMetrics

- (AMSUIDDynamicImpressionMetrics)initWithIdentifier:(id)a3 fields:(id)a4 custom:(id)a5
{
  uint64_t v6 = sub_1BF465EA8();
  uint64_t v7 = sub_1BF465EA8();
  return (AMSUIDDynamicImpressionMetrics *)DynamicImpressionMetrics.init(identifier:fields:custom:)((uint64_t)a3, v6, v7);
}

- (NSDictionary)custom
{
  return (NSDictionary *)sub_1BF3FC224((uint64_t)self, (uint64_t)a2, (void (*)(void))DynamicImpressionMetrics.custom.getter);
}

- (void)setCustom:(id)a3
{
  uint64_t v4 = sub_1BF465EA8();
  v5 = self;
  DynamicImpressionMetrics.custom.setter(v4);
}

- (NSDictionary)fields
{
  return (NSDictionary *)sub_1BF3FC224((uint64_t)self, (uint64_t)a2, (void (*)(void))DynamicImpressionMetrics.fields.getter);
}

- (void)setFields:(id)a3
{
  uint64_t v4 = sub_1BF465EA8();
  v5 = self;
  DynamicImpressionMetrics.fields.setter(v4);
}

- (AMSUIDDynamicImpressionMetricsIdentifier)identifier
{
  id v2 = DynamicImpressionMetrics.identifier.getter();

  return (AMSUIDDynamicImpressionMetricsIdentifier *)v2;
}

- (void)setIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  DynamicImpressionMetrics.identifier.setter(v4);
}

- (AMSUIDDynamicImpressionMetrics)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMSUIDDynamicImpressionMetrics_identifier);
}

@end