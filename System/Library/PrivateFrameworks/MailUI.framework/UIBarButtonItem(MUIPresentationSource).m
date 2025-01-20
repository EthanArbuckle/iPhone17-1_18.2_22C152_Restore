@interface UIBarButtonItem(MUIPresentationSource)
- (uint64_t)mui_setAsSourceForPopoverPresentationController:()MUIPresentationSource;
@end

@implementation UIBarButtonItem(MUIPresentationSource)

- (uint64_t)mui_setAsSourceForPopoverPresentationController:()MUIPresentationSource
{
  return [a3 setBarButtonItem:a1];
}

@end