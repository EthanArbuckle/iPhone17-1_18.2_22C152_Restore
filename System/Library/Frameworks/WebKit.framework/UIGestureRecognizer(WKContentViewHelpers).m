@interface UIGestureRecognizer(WKContentViewHelpers)
- (uint64_t)_wk_cancel;
- (uint64_t)_wk_isTapAndAHalf;
@end

@implementation UIGestureRecognizer(WKContentViewHelpers)

- (uint64_t)_wk_cancel
{
  uint64_t result = [a1 isEnabled];
  if (result)
  {
    [a1 setEnabled:0];
    return [a1 setEnabled:1];
  }
  return result;
}

- (uint64_t)_wk_isTapAndAHalf
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);

  return [(NSString *)v1 containsString:@"TapAndAHalfRecognizer"];
}

@end