@interface UnselectableUITextView
- (BOOL)canBecomeFirstResponder;
@end

@implementation UnselectableUITextView

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

@end