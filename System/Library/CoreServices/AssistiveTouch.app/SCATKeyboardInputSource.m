@interface SCATKeyboardInputSource
- (BOOL)handledEvent:(id)a3;
- (BOOL)isKeyboardInputSource;
- (id)_actionIdentifierForKeyCode:(unsigned __int16)a3 withType:(id)a4;
- (id)_persistentSwitchIdentifierForKeyCode:(unsigned __int16)a3;
- (id)_switchDisplayNameForKeyCode:(unsigned __int16)a3;
- (id)switchSource;
- (int64_t)switchKeyForSwitch:(id)a3;
@end

@implementation SCATKeyboardInputSource

- (BOOL)isKeyboardInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceKeyboard;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return [a3 keyCode];
}

- (BOOL)handledEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 10 || objc_msgSend(v4, "type") == 11)
  {
    v5 = [v4 keyInfo];
    id v6 = [v5 keyDown];

    v7 = [v4 keyInfo];
    id v8 = [v7 keyCode];

    v9 = [(SCATKeyboardInputSource *)self _actionIdentifierForKeyCode:v8 withType:@"SwitchActionTypeNormal"];
    v10 = [(SCATKeyboardInputSource *)self _actionIdentifierForKeyCode:v8 withType:@"SwitchActionTypeLongPress"];
    v11 = [(SCATKeyboardInputSource *)self _persistentSwitchIdentifierForKeyCode:v8];
    v12 = [(SCATKeyboardInputSource *)self _switchDisplayNameForKeyCode:v8];
    [(SCATInputSource *)self _handleAction:v9 longPressAction:v10 start:v6 switchIdentifier:v11 switchDisplayName:v12];

    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_actionIdentifierForKeyCode:(unsigned __int16)a3 withType:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = [(SCATInputSource *)self actions];

  if (v7)
  {
    id v8 = +[NSNumber numberWithUnsignedShort:v4];
    v9 = [(SCATInputSource *)self actions];
    v10 = [v9 objectForKeyedSubscript:v8];

    v11 = [v10 objectForKeyedSubscript:v6];
  }
  else
  {
    _AXLogWithFacility();
    v11 = 0;
  }

  return v11;
}

- (id)_persistentSwitchIdentifierForKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(SCATHardwareInputSource *)self persistentSwitchIdentifiers];
  v5 = +[NSNumber numberWithUnsignedShort:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)_switchDisplayNameForKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(SCATHardwareInputSource *)self switchDisplayNames];
  v5 = +[NSNumber numberWithUnsignedShort:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

@end