@interface UIGestureRecognizer(WebKitInternal)
- (uint64_t)_wk_hasRecognizedOrEnded;
- (uint64_t)_wk_isTextInteractionLoupeGesture;
- (uint64_t)_wk_isTextInteractionTapGesture;
@end

@implementation UIGestureRecognizer(WebKitInternal)

- (uint64_t)_wk_isTextInteractionLoupeGesture
{
  v1 = (void *)[a1 name];

  return [v1 isEqualToString:@"UITextInteractionNameInteractiveRefinement"];
}

- (uint64_t)_wk_isTextInteractionTapGesture
{
  v1 = (void *)[a1 name];

  return [v1 isEqualToString:@"UITextInteractionNameSingleTap"];
}

- (uint64_t)_wk_hasRecognizedOrEnded
{
  unint64_t v1 = [a1 state];
  return (v1 < 6) & (0xEu >> v1);
}

@end