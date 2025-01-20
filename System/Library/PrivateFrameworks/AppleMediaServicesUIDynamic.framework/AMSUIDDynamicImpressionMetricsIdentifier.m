@interface AMSUIDDynamicImpressionMetricsIdentifier
- (AMSUIDDynamicImpressionMetricsIdentifier)init;
- (AMSUIDDynamicImpressionMetricsIdentifier)initWithParent:(id)a3 element:(id)a4 index:(int64_t)a5;
- (NSString)element;
- (NSString)parent;
- (int64_t)index;
- (void)setElement:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setParent:(id)a3;
@end

@implementation AMSUIDDynamicImpressionMetricsIdentifier

- (AMSUIDDynamicImpressionMetricsIdentifier)initWithParent:(id)a3 element:(id)a4 index:(int64_t)a5
{
  if (a3)
  {
    uint64_t v6 = sub_1BF465FA8();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_1BF465FA8();
  return (AMSUIDDynamicImpressionMetricsIdentifier *)DynamicImpressionMetricsIdentifier.init(parent:element:index:)(v6, v8, v9, v10, a5);
}

- (NSString)element
{
  DynamicImpressionMetricsIdentifier.element.getter();
  v2 = (void *)sub_1BF465F78();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setElement:(id)a3
{
  uint64_t v4 = sub_1BF465FA8();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  DynamicImpressionMetricsIdentifier.element.setter(v4, v6);
}

- (int64_t)index
{
  return DynamicImpressionMetricsIdentifier.index.getter();
}

- (void)setIndex:(int64_t)a3
{
}

- (NSString)parent
{
  DynamicImpressionMetricsIdentifier.parent.getter();
  if (v2)
  {
    v3 = (void *)sub_1BF465F78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setParent:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1BF465FA8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  DynamicImpressionMetricsIdentifier.parent.setter(v4, v6);
}

- (AMSUIDDynamicImpressionMetricsIdentifier)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end