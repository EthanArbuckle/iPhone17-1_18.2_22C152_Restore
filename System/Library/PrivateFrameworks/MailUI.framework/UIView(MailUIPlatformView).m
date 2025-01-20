@interface UIView(MailUIPlatformView)
- (uint64_t)mui_setFlexibleWidthAndHeightResizingMask;
@end

@implementation UIView(MailUIPlatformView)

- (uint64_t)mui_setFlexibleWidthAndHeightResizingMask
{
  return [a1 setAutoresizingMask:18];
}

@end