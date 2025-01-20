@interface CAAnimation(ClipUIServicesExtras)
- (uint64_t)cps_setDelegateWithDidStartHandler:()ClipUIServicesExtras didStopHandler:;
@end

@implementation CAAnimation(ClipUIServicesExtras)

- (uint64_t)cps_setDelegateWithDidStartHandler:()ClipUIServicesExtras didStopHandler:
{
  return +[CPSCAAnimationBlockDelegate attachToAnimation:a1 didStartHandler:a3 didStopHandler:a4];
}

@end