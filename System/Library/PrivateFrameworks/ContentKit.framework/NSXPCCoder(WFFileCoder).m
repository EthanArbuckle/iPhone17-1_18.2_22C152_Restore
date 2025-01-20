@interface NSXPCCoder(WFFileCoder)
- (id)wfFileCoder;
@end

@implementation NSXPCCoder(WFFileCoder)

- (id)wfFileCoder
{
  v4.receiver = a1;
  v4.super_class = (Class)&off_26C75FF90;
  v2 = objc_msgSendSuper2(&v4, sel_wfFileCoder);
  if (!v2)
  {
    v2 = objc_opt_new();
    [v2 setDeletionResponsibility:1];
    [a1 setWfFileCoder:v2];
  }
  return v2;
}

@end