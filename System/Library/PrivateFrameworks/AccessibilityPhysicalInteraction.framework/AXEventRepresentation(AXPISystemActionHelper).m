@interface AXEventRepresentation(AXPISystemActionHelper)
- (uint64_t)postHIDEventDirectly;
- (void)setPostHIDEventDirectly:()AXPISystemActionHelper;
@end

@implementation AXEventRepresentation(AXPISystemActionHelper)

- (void)setPostHIDEventDirectly:()AXPISystemActionHelper
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &PostHIDDirectly, v2, (void *)1);
}

- (uint64_t)postHIDEventDirectly
{
  v1 = objc_getAssociatedObject(a1, &PostHIDDirectly);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end