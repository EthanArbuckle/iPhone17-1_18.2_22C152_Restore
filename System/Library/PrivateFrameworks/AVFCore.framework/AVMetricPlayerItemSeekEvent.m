@interface AVMetricPlayerItemSeekEvent
- (id)debugDescription;
@end

@implementation AVMetricPlayerItemSeekEvent

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemSeekEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricPlayerItemSeekEvent:%p %@>", self, -[AVMetricPlayerItemRateChangeEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr)];
}

@end