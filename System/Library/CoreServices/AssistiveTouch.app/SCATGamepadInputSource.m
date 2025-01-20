@interface SCATGamepadInputSource
- (BOOL)handledEvent:(id)a3;
- (BOOL)isGamepadInputSource;
- (id)_actionIdentifierForKeyCode:(unsigned __int16)a3 withType:(id)a4;
- (id)_persistentSwitchIdentifierForKeyCode:(unsigned __int16)a3;
- (id)_switchDisplayNameForKeyCode:(unsigned __int16)a3;
- (id)switchSource;
- (int64_t)switchKeyForSwitch:(id)a3;
@end

@implementation SCATGamepadInputSource

- (BOOL)isGamepadInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceGamepad;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return [a3 keyCode];
}

- (BOOL)handledEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 creatorHIDEvent];
  if (v4)
  {
    id v6 = v5;
    v7 = [v4 gameControllerInfo];
    if (([v7 isJoystickPressed] & 1) != 0
      || ([v7 isDirectionPadPressed] & 1) != 0
      || ([v7 isFaceButtonPressed] & 1) != 0
      || ([v7 isShoulderButtonPressed] & 1) != 0)
    {
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v8 = (uint64_t)[v7 isKeyboardTypeButtonPressed];
    }
    id v9 = +[AXGameControllerEvent axGameControllerKeyCodeForEvent:v6];
    BOOL v10 = v9 != 0;
    if (v9)
    {
      id v11 = v9;
      v12 = [(SCATGamepadInputSource *)self _actionIdentifierForKeyCode:v9 withType:@"SwitchActionTypeNormal"];
      v13 = [(SCATGamepadInputSource *)self _actionIdentifierForKeyCode:v11 withType:@"SwitchActionTypeLongPress"];
      v14 = [(SCATGamepadInputSource *)self _persistentSwitchIdentifierForKeyCode:v11];
      v15 = [(SCATGamepadInputSource *)self _switchDisplayNameForKeyCode:v11];
      [(SCATInputSource *)self _handleAction:v12 longPressAction:v13 start:v8 switchIdentifier:v14 switchDisplayName:v15];
    }
  }
  else
  {
    _AXLogWithFacility();
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_actionIdentifierForKeyCode:(unsigned __int16)a3 withType:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = [(SCATInputSource *)self actions];

  if (v7)
  {
    uint64_t v8 = +[NSNumber numberWithUnsignedShort:v4];
    id v9 = [(SCATInputSource *)self actions];
    BOOL v10 = [v9 objectForKeyedSubscript:v8];

    id v11 = [v10 objectForKeyedSubscript:v6];
  }
  else
  {
    _AXLogWithFacility();
    id v11 = 0;
  }

  return v11;
}

- (id)_persistentSwitchIdentifierForKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(SCATHardwareInputSource *)self persistentSwitchIdentifiers];
  id v5 = +[NSNumber numberWithUnsignedShort:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)_switchDisplayNameForKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(SCATHardwareInputSource *)self switchDisplayNames];
  id v5 = +[NSNumber numberWithUnsignedShort:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

@end