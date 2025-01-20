@interface EDApplication
+ (BOOL)_isUIKitSystemProcess;
+ (BOOL)_suppressesTextEffectsWindow;
- (BOOL)_shouldAllowKeyboardArbiter;
@end

@implementation EDApplication

+ (BOOL)_isUIKitSystemProcess
{
  return 1;
}

+ (BOOL)_suppressesTextEffectsWindow
{
  return 1;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  return 0;
}

@end