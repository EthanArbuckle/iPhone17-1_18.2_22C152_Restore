@interface UIView(WebKitInternal)
- (void)_wk_viewControllerForFullScreenPresentation;
@end

@implementation UIView(WebKitInternal)

- (void)_wk_viewControllerForFullScreenPresentation
{
  v2 = objc_msgSend((id)objc_msgSend(a1, "window"), "rootViewController");
  do
  {
    v3 = v2;
    v2 = (void *)[v2 presentedViewController];
  }
  while (v2);
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "viewIfLoaded"), "window");
  if (v4 == [a1 window]) {
    return v3;
  }
  else {
    return 0;
  }
}

@end