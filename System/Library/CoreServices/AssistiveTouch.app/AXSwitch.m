@interface AXSwitch
- (BOOL)hasSelectAction;
- (BOOL)hasStepAction;
@end

@implementation AXSwitch

- (BOOL)hasStepAction
{
  BOOL v3 = [(AXSwitch *)self action] == (id)104 || [(AXSwitch *)self action] == (id)105;
  v4 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 assistiveTouchLongPressEnabled];

  BOOL result = v5 | v3;
  if (v5 && !v3) {
    return [(AXSwitch *)self longPressAction] == (id)104
  }
        || [(AXSwitch *)self longPressAction] == (id)105;
  return result;
}

- (BOOL)hasSelectAction
{
  BOOL v3 = [(AXSwitch *)self action] == (id)103 || [(AXSwitch *)self action] == (id)109;
  v4 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 assistiveTouchLongPressEnabled];

  BOOL result = v5 | v3;
  if (v5 && !v3) {
    return [(AXSwitch *)self longPressAction] == (id)103
  }
        || [(AXSwitch *)self longPressAction] == (id)109;
  return result;
}

@end