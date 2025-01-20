@interface NSMeasurement(WFPreferredValueRounding)
- (id)wf_preferredValueRounding;
- (void)setWf_preferredValueRounding:()WFPreferredValueRounding;
@end

@implementation NSMeasurement(WFPreferredValueRounding)

- (void)setWf_preferredValueRounding:()WFPreferredValueRounding
{
}

- (id)wf_preferredValueRounding
{
  return objc_getAssociatedObject(a1, sel_wf_preferredValueRounding);
}

@end