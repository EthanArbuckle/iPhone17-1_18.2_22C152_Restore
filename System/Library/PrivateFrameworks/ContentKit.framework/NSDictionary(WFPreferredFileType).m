@interface NSDictionary(WFPreferredFileType)
- (id)wf_preferredFileType;
- (void)setWf_preferredFileType:()WFPreferredFileType;
@end

@implementation NSDictionary(WFPreferredFileType)

- (void)setWf_preferredFileType:()WFPreferredFileType
{
}

- (id)wf_preferredFileType
{
  return objc_getAssociatedObject(a1, sel_wf_preferredFileType);
}

@end