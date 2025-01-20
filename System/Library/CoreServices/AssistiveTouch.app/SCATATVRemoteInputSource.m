@interface SCATATVRemoteInputSource
- (BOOL)handledEvent:(id)a3;
- (BOOL)isATVRemoteInputSource;
- (id)actionIdentifierForButtonNumber:(int64_t)a3 withType:(id)a4;
- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3;
- (id)switchDisplayNameForButtonNumber:(int64_t)a3;
- (id)switchSource;
- (int64_t)switchKeyForSwitch:(id)a3;
@end

@implementation SCATATVRemoteInputSource

- (BOOL)isATVRemoteInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceATVRemote;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return (int64_t)[a3 buttonNumber];
}

- (id)actionIdentifierForButtonNumber:(int64_t)a3 withType:(id)a4
{
  id v6 = a4;
  v7 = [(SCATInputSource *)self actions];

  if (v7)
  {
    v8 = +[NSNumber numberWithInteger:a3];
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

- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3
{
  v4 = [(SCATHardwareInputSource *)self persistentSwitchIdentifiers];
  v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)switchDisplayNameForButtonNumber:(int64_t)a3
{
  v4 = [(SCATHardwareInputSource *)self switchDisplayNames];
  v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (BOOL)handledEvent:(id)a3
{
  id v5 = a3;
  if (![v5 creatorHIDEvent])
  {
    _AXLogWithFacility();
    goto LABEL_18;
  }
  unint64_t v6 = IOHIDEventGetSenderID() + 0x7FFFFFF7E8CE6C8ELL;
  if (v6 > 3 || v6 == 2)
  {
    v3 = [v5 accessibilityData];
    unsigned __int8 v8 = [v3 wasPostedByAccessibility];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }
  if (v6 > 3 || v6 == 2)
  {

    if ((v8 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_18:
    BOOL v16 = 0;
    goto LABEL_19;
  }
  if (v8) {
    goto LABEL_18;
  }
LABEL_16:
  if (!SCATIsATVRemoteButtonSwitchCandidateEvent()) {
    goto LABEL_18;
  }
  id v10 = [v5 isDownEvent];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  v12 = [(SCATATVRemoteInputSource *)self actionIdentifierForButtonNumber:IntegerValue withType:@"SwitchActionTypeNormal"];
  v13 = [(SCATATVRemoteInputSource *)self actionIdentifierForButtonNumber:IntegerValue withType:@"SwitchActionTypeLongPress"];
  v14 = [(SCATATVRemoteInputSource *)self persistentSwitchIdentifierForButtonNumber:IntegerValue];
  v15 = [(SCATATVRemoteInputSource *)self switchDisplayNameForButtonNumber:IntegerValue];
  [(SCATInputSource *)self _handleAction:v12 longPressAction:v13 start:v10 switchIdentifier:v14 switchDisplayName:v15];

  BOOL v16 = 1;
LABEL_19:

  return v16;
}

@end