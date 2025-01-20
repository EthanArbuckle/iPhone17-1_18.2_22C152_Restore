@interface SCATInterDeviceInputSource
- (NSDictionary)actionIdentifiersToRecipeMappingIndices;
- (NSDictionary)longPressActionIdentifiersToRecipeMappingIndices;
- (id)_resolveSwitchForSwitchEvent:(id)a3 deviceName:(id)a4;
- (id)inputDeviceHandledAction;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_getActionIdentifier:(id)a3 longPressActionIdentifier:(id)a4 forSwitchEvent:(id)a5;
- (void)handleReceivedSwitchEvent:(id)a3 deviceName:(id)a4;
- (void)setActionIdentifiersToRecipeMappingIndices:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setInputDeviceHandledAction:(id)a3;
- (void)setLongPressActionIdentifiersToRecipeMappingIndices:(id)a3;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATInterDeviceInputSource

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SCATInterDeviceInputSource;
  [(SCATInputSource *)&v4 setDelegate:a3 queue:a4];
}

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SCATInterDeviceInputSource;
  [(SCATInputSource *)&v16 updateWithSwitches:v6 recipe:v7];
  if (v7)
  {
    v8 = +[NSMutableDictionary dictionary];
    v9 = +[NSMutableDictionary dictionary];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000AB6A8;
    v12[3] = &unk_1001ACF50;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    id v10 = v9;
    id v11 = v8;
    [v6 enumerateObjectsUsingBlock:v12];
    [(SCATInterDeviceInputSource *)self setActionIdentifiersToRecipeMappingIndices:v11];
    [(SCATInterDeviceInputSource *)self setLongPressActionIdentifiersToRecipeMappingIndices:v10];
  }
  else
  {
    [(SCATInterDeviceInputSource *)self setActionIdentifiersToRecipeMappingIndices:0];
    [(SCATInterDeviceInputSource *)self setLongPressActionIdentifiersToRecipeMappingIndices:0];
  }
}

- (void)_getActionIdentifier:(id)a3 longPressActionIdentifier:(id)a4 forSwitchEvent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = [v10 actions];
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    while (2)
    {
      id v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        int64_t v16 = [(SCATInputSource *)self _identifierForInterDeviceAction:*(void *)(*((void *)&v29 + 1) + 8 * (void)v15)];
        if (v16)
        {
          uint64_t v17 = v16;
          goto LABEL_11;
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  uint64_t v17 = 103;
LABEL_11:

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = objc_msgSend(v10, "longPressActions", 0);
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    while (2)
    {
      v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        int64_t v23 = [(SCATInputSource *)self _identifierForInterDeviceAction:*(void *)(*((void *)&v25 + 1) + 8 * (void)v22)];
        if (v23)
        {
          int64_t v24 = v23;
          goto LABEL_21;
        }
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  int64_t v24 = 0;
LABEL_21:

  if (v8) {
    [v8 setAction:v17];
  }
  if (v9) {
    [v9 setAction:v24];
  }
}

- (id)_resolveSwitchForSwitchEvent:(id)a3 deviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AXSettings sharedInstance];
  id v9 = [v8 assistiveTouchSwitches];

  long long v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472;
  v33 = sub_1000ABD88;
  v34 = &unk_1001ACD48;
  id v10 = v6;
  id v35 = v10;
  id v11 = [v9 objectsPassingTest:&v31];
  if ((unint64_t)[v11 count] >= 2)
  {
    long long v30 = v11;
    _AXAssert();
  }
  id v12 = objc_msgSend(v11, "anyObject", v30);
  if (!v12)
  {
    if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0)) {
      NSLog(@"Existing switches: %@", v9);
    }
    id v18 = (id)objc_opt_new();
    id v19 = objc_opt_new();
    [(SCATInterDeviceInputSource *)self _getActionIdentifier:v18 longPressActionIdentifier:v19 forSwitchEvent:v10];
    id v20 = [v18 action];
    uint64_t v21 = [v10 switchDisplayName];
    id v13 = +[AXSwitch switchWithAction:v20 name:v21 source:SCATSwitchSourceRemote type:SCATSwitchTypeOptional];

    objc_msgSend(v13, "setLongPressAction:", objc_msgSend(v19, "action"));
    [v13 setRemoteDeviceName:v7];
    v22 = [v10 switchIdentifier];
    [v13 setRemoteSwitchIdentifier:v22];

    int64_t v23 = [v10 deviceIdentifier];
    [v13 setRemoteDeviceIdentifier:v23];

    id v24 = [v9 mutableCopy];
    [v24 addObject:v13];
    long long v25 = +[AXSettings sharedInstance];
    [v25 setAssistiveTouchSwitches:v24];

    if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0))
    {
      long long v26 = [v10 deviceIdentifier];
      long long v27 = [v10 switchIdentifier];
      NSLog(@"Created new remote switch for device identifier %@, switch identifier %@: %@", v26, v27, v13, v31, v32, v33, v34);
    }
    goto LABEL_16;
  }
  id v13 = v12;
  uint64_t v14 = [v12 remoteDeviceName];
  if (([v14 isEqualToString:v7] & 1) == 0)
  {

    goto LABEL_13;
  }
  id v15 = [v13 name];
  int64_t v16 = [v10 switchDisplayName];
  unsigned __int8 v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) == 0)
  {
LABEL_13:
    if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0)) {
      NSLog(@"Had to update name of existing remote switch %@", v13);
    }
    id v18 = [v9 mutableCopy];
    [v18 removeObject:v13];
    [v13 setRemoteDeviceName:v7];
    long long v28 = [v10 switchDisplayName];
    [v13 setName:v28];

    [v18 addObject:v13];
    id v19 = +[AXSettings sharedInstance];
    [v19 setAssistiveTouchSwitches:v18];
LABEL_16:
  }

  return v13;
}

- (void)handleReceivedSwitchEvent:(id)a3 deviceName:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  id v7 = [v29 deviceIdentifier];
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = [(SCATInterDeviceInputSource *)self _resolveSwitchForSwitchEvent:v29 deviceName:v6];
    id v10 = [(SCATInterDeviceInputSource *)self actionIdentifiersToRecipeMappingIndices];

    if (v10)
    {
      id v11 = [(SCATInterDeviceInputSource *)self actionIdentifiersToRecipeMappingIndices];
      id v12 = [v9 uuid];
      id v13 = [v11 objectForKeyedSubscript:v12];

      if (v13)
      {
        id v14 = v13;
        id v15 = [(SCATInterDeviceInputSource *)self longPressActionIdentifiersToRecipeMappingIndices];
        int64_t v16 = [v9 uuid];
        unsigned __int8 v17 = [v15 objectForKeyedSubscript:v16];

        if (v17) {
          id v18 = v17;
        }
      }
      else
      {
        unsigned __int8 v17 = 0;
      }
    }
    else
    {
      id v13 = +[SCATActionItem fromSwitch:v9 longPress:0];
      unsigned __int8 v17 = +[SCATActionItem fromSwitch:v9 longPress:1];
    }
    if ([v13 action])
    {
      BOOL v20 = 1;
    }
    else
    {
      uint64_t v21 = [v13 shortcutIdentifier];
      BOOL v20 = v21 != 0;
    }
  }
  else
  {
    id v19 = [(SCATInterDeviceInputSource *)self actionIdentifiersToRecipeMappingIndices];

    if (v19)
    {
      BOOL v20 = 0;
      unsigned __int8 v17 = 0;
      id v13 = 0;
    }
    else
    {
      if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0)) {
        NSLog(@"No device identifier for the remote switch event, so we had to forward it without saving it.");
      }
      [(SCATInterDeviceInputSource *)self _getActionIdentifier:0 longPressActionIdentifier:0 forSwitchEvent:v29];
      unsigned __int8 v17 = 0;
      id v13 = 0;
      BOOL v20 = 1;
    }
  }
  if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0)) {
    NSLog(@"Should handle action: %i", v20);
  }
  v22 = [(SCATInputSource *)self delegate];
  unsigned int v23 = [v22 shouldForwardSwitchEventsForInputSource:self];

  if (v23) {
    _AXAssert();
  }
  if (v20)
  {
    id v24 = [v29 isDown];
    long long v25 = [v29 switchIdentifier];
    long long v26 = [v29 switchDisplayName];
    [(SCATInputSource *)self _handleAction:v13 longPressAction:v17 start:v24 switchIdentifier:v25 switchDisplayName:v26];
  }
  long long v27 = [(SCATInterDeviceInputSource *)self inputDeviceHandledAction];

  if (v27)
  {
    long long v28 = [(SCATInterDeviceInputSource *)self inputDeviceHandledAction];
    v28[2](v28, v20);
  }
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v8 = a3;
  id v9 = [(SCATInputSource *)self delegate];
  id v10 = [(SCATInputSource *)self queue];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000AC27C;
    v11[3] = &unk_1001ACF28;
    id v12 = v9;
    id v13 = self;
    id v14 = v8;
    BOOL v15 = a4;
    BOOL v16 = a5;
    [v10 performAsynchronousWritingBlock:v11];
  }
}

- (id)inputDeviceHandledAction
{
  return self->_inputDeviceHandledAction;
}

- (void)setInputDeviceHandledAction:(id)a3
{
}

- (NSDictionary)actionIdentifiersToRecipeMappingIndices
{
  return self->_actionIdentifiersToRecipeMappingIndices;
}

- (void)setActionIdentifiersToRecipeMappingIndices:(id)a3
{
}

- (NSDictionary)longPressActionIdentifiersToRecipeMappingIndices
{
  return self->_longPressActionIdentifiersToRecipeMappingIndices;
}

- (void)setLongPressActionIdentifiersToRecipeMappingIndices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressActionIdentifiersToRecipeMappingIndices, 0);
  objc_storeStrong((id *)&self->_actionIdentifiersToRecipeMappingIndices, 0);

  objc_storeStrong(&self->_inputDeviceHandledAction, 0);
}

@end