@interface AXAssistiveTouchSoundActionsController
- (BOOL)supportsIconType:(id)a3;
- (id)actionsBySoundAction;
- (void)updateSoundActionsWithDictionary:(id)a3;
@end

@implementation AXAssistiveTouchSoundActionsController

- (id)actionsBySoundAction
{
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 assistiveTouchActionsBySoundAction];

  return v3;
}

- (void)updateSoundActionsWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchActionsBySoundAction:v3];
}

- (BOOL)supportsIconType:(id)a3
{
  id v3 = a3;
  if (supportsIconType__onceToken != -1) {
    dispatch_once(&supportsIconType__onceToken, &__block_literal_global_27);
  }
  if ([v3 isEqualToString:@"__NONE__"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    v5 = AXSystemActionIconTypes();
    if ([v5 containsObject:v3])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      v6 = AXAssistiveTouchCustomGesturesIcons();
      if ([v6 containsObject:v3])
      {
        unsigned __int8 v4 = 1;
      }
      else
      {
        v7 = AXAssistiveTouchScrollIcons();
        if ([v7 containsObject:v3])
        {
          unsigned __int8 v4 = 1;
        }
        else
        {
          v8 = AXAssistiveTouchDwellIcons();
          if ([v8 containsObject:v3]) {
            unsigned __int8 v4 = 1;
          }
          else {
            unsigned __int8 v4 = [(id)supportsIconType__sOtherSupportedIconTypes containsObject:v3];
          }
        }
      }
    }
  }

  return v4;
}

void __59__AXAssistiveTouchSoundActionsController_supportsIconType___block_invoke(id a1)
{
  v3[0] = AXAssistiveTouchIconTypePinch;
  v3[1] = AXAssistiveTouchIconTypeRotate;
  v3[2] = AXAssistiveTouchIconTypePinchAndRotate;
  v3[3] = AXAssistiveTouchIconTypeForceTap;
  v3[4] = AXAssistiveTouchIconTypeTap;
  v3[5] = AXAssistiveTouchIconTypeDoubleTap;
  v3[6] = AXAssistiveTouchIconTypeLongPress;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:7];
  v2 = (void *)supportsIconType__sOtherSupportedIconTypes;
  supportsIconType__sOtherSupportedIconTypes = v1;
}

@end