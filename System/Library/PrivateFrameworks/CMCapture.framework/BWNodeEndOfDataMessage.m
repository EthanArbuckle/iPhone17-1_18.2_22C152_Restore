@interface BWNodeEndOfDataMessage
+ (id)newMessage;
@end

@implementation BWNodeEndOfDataMessage

+ (id)newMessage
{
  id result = [BWNodeEndOfDataMessage alloc];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)BWNodeEndOfDataMessage;
    id result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      *((void *)result + 1) = 0x400000001;
    }
  }
  return result;
}

@end