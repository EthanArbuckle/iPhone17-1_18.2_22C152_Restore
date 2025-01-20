@interface NSCoder(WFFileCoder)
- (id)wfFileCoder;
- (void)setWfFileCoder:()WFFileCoder;
@end

@implementation NSCoder(WFFileCoder)

- (void)setWfFileCoder:()WFFileCoder
{
}

- (id)wfFileCoder
{
  return objc_getAssociatedObject(a1, sel_wfFileCoder);
}

@end