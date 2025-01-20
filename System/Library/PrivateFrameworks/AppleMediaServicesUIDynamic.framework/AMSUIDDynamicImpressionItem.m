@interface AMSUIDDynamicImpressionItem
- (AMSUIDDynamicImpressionItem)init;
- (AMSUIDDynamicImpressionItem)initWithFrame:(CGRect)a3 impressionMetrics:(id)a4;
- (AMSUIDDynamicImpressionMetrics)impressionMetrics;
- (CGRect)frame;
- (void)setFrame:(CGRect)a3;
- (void)setImpressionMetrics:(id)a3;
@end

@implementation AMSUIDDynamicImpressionItem

- (AMSUIDDynamicImpressionItem)initWithFrame:(CGRect)a3 impressionMetrics:(id)a4
{
  return (AMSUIDDynamicImpressionItem *)DynamicImpressionItem.init(frame:impressionMetrics:)((uint64_t)a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)frame
{
  double v2 = DynamicImpressionItem.frame.getter();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (AMSUIDDynamicImpressionMetrics)impressionMetrics
{
  id v2 = DynamicImpressionItem.impressionMetrics.getter();

  return (AMSUIDDynamicImpressionMetrics *)v2;
}

- (void)setImpressionMetrics:(id)a3
{
  id v4 = a3;
  double v5 = self;
  DynamicImpressionItem.impressionMetrics.setter(v4);
}

- (AMSUIDDynamicImpressionItem)init
{
}

- (void).cxx_destruct
{
}

@end