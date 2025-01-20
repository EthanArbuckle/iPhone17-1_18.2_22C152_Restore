@interface BWNodeSuspendResourcesMessage
+ (id)newMessage;
@end

@implementation BWNodeSuspendResourcesMessage

+ (id)newMessage
{
  id result = [BWNodeSuspendResourcesMessage alloc];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)BWNodeSuspendResourcesMessage;
    id result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      *((void *)result + 1) = 0x800000001;
    }
  }
  return result;
}

@end