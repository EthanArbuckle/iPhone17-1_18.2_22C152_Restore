@interface UIControl(AvatarViewWorkaround)
- (id)_cnui_super_touchesCancelled:()AvatarViewWorkaround withEvent:;
@end

@implementation UIControl(AvatarViewWorkaround)

- (id)_cnui_super_touchesCancelled:()AvatarViewWorkaround withEvent:
{
  v2.receiver = a1;
  v2.super_class = (Class)UIControl_0;
  return objc_msgSendSuper2(&v2, sel_touchesCancelled_withEvent_);
}

@end