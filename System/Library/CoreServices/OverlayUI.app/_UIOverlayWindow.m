@interface _UIOverlayWindow
+ (BOOL)_isSystemWindow;
- (BOOL)_wantsFocusEngine;
@end

@implementation _UIOverlayWindow

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)_wantsFocusEngine
{
  return 1;
}

@end