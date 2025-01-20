@interface Application
+ (BOOL)_suppressesTextEffectsWindow;
- (BOOL)_hostsSystemStatusBar;
- (BOOL)_isSpringBoard;
- (BOOL)_shouldAllowKeyboardArbiter;
- (BOOL)_supportsAlwaysOnDisplay;
- (_TtC10ChronoCore11Application)init;
@end

@implementation Application

- (BOOL)_supportsAlwaysOnDisplay
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

- (BOOL)_hostsSystemStatusBar
{
  return 0;
}

- (BOOL)_isSpringBoard
{
  return 1;
}

- (_TtC10ChronoCore11Application)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Application();
  return [(Application *)&v3 init];
}

@end