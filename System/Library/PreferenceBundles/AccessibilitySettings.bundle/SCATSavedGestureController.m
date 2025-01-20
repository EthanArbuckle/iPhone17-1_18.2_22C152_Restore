@interface SCATSavedGestureController
- (SEL)settingsGetter;
- (SEL)settingsSetter;
- (id)customGesturesExplanatoryText;
@end

@implementation SCATSavedGestureController

- (SEL)settingsSetter
{
  return "setAssistiveTouchSavedGestures:";
}

- (SEL)settingsGetter
{
  return "assistiveTouchSavedGestures";
}

- (id)customGesturesExplanatoryText
{
  return (id)AXParameterizedLocalizedString();
}

@end