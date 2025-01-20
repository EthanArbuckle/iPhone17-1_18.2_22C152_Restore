@interface IntelligentLightApp
+ (BOOL)_suppressesTextEffectsWindow;
- (BOOL)_shouldAllowKeyboardArbiter;
- (BOOL)_supportsMenuActions;
- (_TtC16IntelligentLight19IntelligentLightApp)init;
@end

@implementation IntelligentLightApp

+ (BOOL)_suppressesTextEffectsWindow
{
  return 1;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  return 0;
}

- (BOOL)_supportsMenuActions
{
  return 0;
}

- (_TtC16IntelligentLight19IntelligentLightApp)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntelligentLightApp();
  return [(IntelligentLightApp *)&v3 init];
}

@end