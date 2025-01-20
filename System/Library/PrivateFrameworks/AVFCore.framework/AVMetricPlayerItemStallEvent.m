@interface AVMetricPlayerItemStallEvent
- (id)debugDescription;
@end

@implementation AVMetricPlayerItemStallEvent

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemStallEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricPlayerItemStallEvent:%p %@>", self, -[AVMetricPlayerItemRateChangeEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr)];
}

@end