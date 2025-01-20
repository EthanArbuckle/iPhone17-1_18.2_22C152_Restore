@interface AXSwitch
+ (AXSwitch)switchWithAction:(int64_t)a3 name:(id)a4 source:(id)a5 type:(id)a6;
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)expressionToSwitchTypeMapping;
- (AXMIDIEvent)midiEvent;
- (AXSwitch)initWithAction:(int64_t)a3 name:(id)a4 source:(id)a5 type:(id)a6;
- (AXSwitch)initWithCoder:(id)a3;
- (BOOL)hasLongPressAction;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsLongPress;
- (NSString)localizedSourceDescription;
- (NSString)longPressShortcutIdentifier;
- (NSString)manufacturerName;
- (NSString)name;
- (NSString)productName;
- (NSString)remoteDeviceIdentifier;
- (NSString)remoteDeviceName;
- (NSString)remoteSwitchIdentifier;
- (NSString)shortcutIdentifier;
- (NSString)source;
- (NSString)type;
- (NSUUID)uuid;
- (id)description;
- (int64_t)accessibilityEventModifierFlags;
- (int64_t)accessibilityEventUsage;
- (int64_t)accessibilityEventUsagePage;
- (int64_t)action;
- (int64_t)buttonNumber;
- (int64_t)headSwitch;
- (int64_t)longPressAction;
- (unint64_t)cameraSwitch;
- (unint64_t)expressionSensitivity;
- (unint64_t)hash;
- (unsigned)keyCode;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityEventModifierFlags:(int64_t)a3;
- (void)setAccessibilityEventUsage:(int64_t)a3;
- (void)setAccessibilityEventUsagePage:(int64_t)a3;
- (void)setAction:(int64_t)a3;
- (void)setButtonNumber:(int64_t)a3;
- (void)setCameraSwitch:(unint64_t)a3;
- (void)setExpressionSensitivity:(unint64_t)a3;
- (void)setHeadSwitch:(int64_t)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setKeyCode:(unsigned __int16)a3;
- (void)setLongPressAction:(int64_t)a3;
- (void)setLongPressShortcutIdentifier:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setMidiEvent:(id)a3;
- (void)setName:(id)a3;
- (void)setProductName:(id)a3;
- (void)setRemoteDeviceIdentifier:(id)a3;
- (void)setRemoteDeviceName:(id)a3;
- (void)setRemoteSwitchIdentifier:(id)a3;
- (void)setShortcutIdentifier:(id)a3;
- (void)setSource:(id)a3;
- (void)setType:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation AXSwitch

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXSwitch action](self, "action"), @"SwitchActionKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXSwitch longPressAction](self, "longPressAction"), @"SwitchLongPressAction");
  v5 = [(AXSwitch *)self name];
  [v4 encodeObject:v5 forKey:@"SwitchNameKey"];

  v6 = [(AXSwitch *)self source];
  [v4 encodeObject:v6 forKey:@"SwitchSourceKey"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSwitch isEnabled](self, "isEnabled"));
  [v4 encodeObject:v7 forKey:@"SwitchIsEnabledKey"];

  v8 = [(AXSwitch *)self type];
  [v4 encodeObject:v8 forKey:@"SwitchTypeKey"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[AXSwitch keyCode](self, "keyCode"));
  [v4 encodeObject:v9 forKey:@"SwitchKeyCodeKey"];

  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXSwitch buttonNumber](self, "buttonNumber"));
  [v4 encodeObject:v10 forKey:@"SwitchButtonNumberKey"];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXSwitch headSwitch](self, "headSwitch"));
  [v4 encodeObject:v11 forKey:@"SwitchHeadSwitch"];

  v12 = [(AXSwitch *)self uuid];
  [v4 encodeObject:v12 forKey:@"SwitchUUID"];

  v13 = [(AXSwitch *)self productName];
  [v4 encodeObject:v13 forKey:@"SwithProductName"];

  v14 = [(AXSwitch *)self manufacturerName];
  [v4 encodeObject:v14 forKey:@"SwithManufacturerName"];

  v15 = [(AXSwitch *)self remoteSwitchIdentifier];
  [v4 encodeObject:v15 forKey:@"SwitchRemoteSwitchIdentifier"];

  v16 = [(AXSwitch *)self remoteDeviceName];
  [v4 encodeObject:v16 forKey:@"SwitchRemoteDeviceName"];

  v17 = [(AXSwitch *)self remoteDeviceIdentifier];
  [v4 encodeObject:v17 forKey:@"SwitchRemoteDeviceIdentifier"];

  v18 = [(AXSwitch *)self midiEvent];
  [v4 encodeObject:v18 forKey:@"SwitchMidiEvent"];

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSwitch cameraSwitch](self, "cameraSwitch"));
  [v4 encodeObject:v19 forKey:@"SwitchCameraSwitch"];

  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSwitch expressionSensitivity](self, "expressionSensitivity"));
  [v4 encodeObject:v20 forKey:@"SwitchExpressionSensitivity"];

  v21 = objc_msgSend(NSNumber, "numberWithLong:", -[AXSwitch accessibilityEventUsagePage](self, "accessibilityEventUsagePage"));
  [v4 encodeObject:v21 forKey:@"SwitchAccessibilityEventUsagePage"];

  v22 = objc_msgSend(NSNumber, "numberWithLong:", -[AXSwitch accessibilityEventUsage](self, "accessibilityEventUsage"));
  [v4 encodeObject:v22 forKey:@"SwitchAccessibilityEventUsage"];

  v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXSwitch accessibilityEventModifierFlags](self, "accessibilityEventModifierFlags"));
  [v4 encodeObject:v23 forKey:@"SwitchAccessibilityEventModifierFlags"];

  v24 = [(AXSwitch *)self shortcutIdentifier];
  [v4 encodeObject:v24 forKey:@"shortcutIdentifier"];

  id v25 = [(AXSwitch *)self longPressShortcutIdentifier];
  [v4 encodeObject:v25 forKey:@"longPressShortcutIdentifier"];
}

- (AXSwitch)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)AXSwitch;
  v5 = [(AXSwitch *)&v49 init];
  if (v5)
  {
    v5->_action = [v4 decodeIntegerForKey:@"SwitchActionKey"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchNameKey"];
    uint64_t v7 = [v6 copy];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchSourceKey"];
    source = v5->_source;
    v5->_source = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchTypeKey"];
    type = v5->_type;
    v5->_type = (NSString *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchKeyCodeKey"];
    v5->_keyCode = [v13 unsignedShortValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchButtonNumberKey"];
    v5->_buttonNumber = [v14 integerValue];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchHeadSwitch"];
    v5->_headSwitch = [v15 integerValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchUUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwithProductName"];
    productName = v5->_productName;
    v5->_productName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwithManufacturerName"];
    manufacturerName = v5->_manufacturerName;
    v5->_manufacturerName = (NSString *)v20;

    v5->_longPressAction = [v4 decodeIntegerForKey:@"SwitchLongPressAction"];
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchRemoteSwitchIdentifier"];
    uint64_t v23 = [v22 copy];
    remoteSwitchIdentifier = v5->_remoteSwitchIdentifier;
    v5->_remoteSwitchIdentifier = (NSString *)v23;

    id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchRemoteDeviceName"];
    uint64_t v26 = [v25 copy];
    remoteDeviceName = v5->_remoteDeviceName;
    v5->_remoteDeviceName = (NSString *)v26;

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchRemoteDeviceIdentifier"];
    uint64_t v29 = [v28 copy];
    remoteDeviceIdentifier = v5->_remoteDeviceIdentifier;
    v5->_remoteDeviceIdentifier = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchMidiEvent"];
    midiEvent = v5->_midiEvent;
    v5->_midiEvent = (AXMIDIEvent *)v31;

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchCameraSwitch"];
    v5->_cameraSwitch = [v33 unsignedIntegerValue];

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchExpressionSensitivity"];
    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutIdentifier"];
    [(AXSwitch *)v5 setShortcutIdentifier:v35];

    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"longPressShortcutIdentifier"];
    [(AXSwitch *)v5 setLongPressShortcutIdentifier:v36];

    if (v34) {
      uint64_t v37 = [v34 unsignedIntegerValue];
    }
    else {
      uint64_t v37 = 2;
    }
    v5->_expressionSensitivity = v37;
    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchAccessibilityEventUsagePage"];
    v5->_accessibilityEventUsagePage = [v38 integerValue];

    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchAccessibilityEventUsage"];
    v5->_accessibilityEventUsage = [v39 integerValue];

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchAccessibilityEventModifierFlags"];
    v5->_accessibilityEventModifierFlags = [v40 integerValue];

    if ([(NSString *)v5->_source isEqualToString:@"SCATSwitchSourceBackTap"]
      && [v4 containsValueForKey:@"SwitchBackTapType"])
    {
      v5->_accessibilityEventUsagePage = 1;
      v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchBackTapType"];
      v5->_accessibilityEventUsage = [v41 unsignedIntegerValue];
    }
    if ([(NSString *)v5->_source isEqualToString:@"SCATSwitchSourceSound"]
      && [v4 containsValueForKey:@"SwitchSoundType"])
    {
      v5->_accessibilityEventUsagePage = 3;
      v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchSoundType"];
      v5->_accessibilityEventUsage = [v42 unsignedIntegerValue];
    }
    if ([(NSString *)v5->_source isEqualToString:@"SCATSwitchSourceHeadGesture"]
      && [v4 containsValueForKey:@"SwitchHeadGestureType"])
    {
      v5->_accessibilityEventUsagePage = 7;
      v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchHeadGestureType"];
      v5->_accessibilityEventUsage = [v43 unsignedIntegerValue];
    }
    if ([(NSString *)v5->_source isEqualToString:@"SCATSwitchSourceCameraHandGesture"]
      && [v4 containsValueForKey:@"SwitchCameraHandGestureType"])
    {
      v5->_accessibilityEventUsagePage = 8;
      v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchCameraHandGestureType"];
      v5->_accessibilityEventUsage = [v44 unsignedIntegerValue];
    }
    if ([(NSString *)v5->_source isEqualToString:@"SCATSwitchSourceHandGestures"]
      && [v4 containsValueForKey:@"SwitchHandGesturesType"])
    {
      v5->_accessibilityEventUsagePage = 2;
      v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchHandGesturesType"];
      v5->_accessibilityEventUsage = [v45 unsignedIntegerValue];
    }
    if ([(NSString *)v5->_source isEqualToString:@"SCATSwitchSourceAutomation"]
      && [v4 containsValueForKey:@"SwitchAutomationType"])
    {
      v5->_accessibilityEventUsagePage = 5;
      v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchAutomationType"];
      v5->_accessibilityEventUsage = [v46 unsignedIntegerValue];
    }
    v5->_isEnabled = 1;
    if ([v4 containsValueForKey:@"SwitchIsEnabledKey"])
    {
      v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SwitchIsEnabledKey"];
      v5->_isEnabled = [v47 BOOLValue];
    }
  }

  return v5;
}

+ (AXSwitch)switchWithAction:(int64_t)a3 name:(id)a4 source:(id)a5 type:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)[objc_alloc((Class)a1) initWithAction:a3 name:v12 source:v11 type:v10];

  return (AXSwitch *)v13;
}

- (AXSwitch)initWithAction:(int64_t)a3 name:(id)a4 source:(id)a5 type:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AXSwitch;
  v13 = [(AXSwitch *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_action = a3;
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    objc_storeStrong((id *)&v14->_source, a5);
    objc_storeStrong((id *)&v14->_type, a6);
    v14->_isEnabled = 1;
    uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v17;
  }
  return v14;
}

- (NSString)name
{
  v3 = [(AXSwitch *)self source];
  int v4 = [v3 isEqualToString:@"SwitchSourceScreen"];

  if (v4)
  {
    AXLocalizedString(@"SCREEN_SWITCH_NAME");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_name;
  }

  return v5;
}

- (BOOL)hasLongPressAction
{
  return [(AXSwitch *)self longPressAction] != 0;
}

- (BOOL)supportsLongPress
{
  v3 = [(AXSwitch *)self source];
  if ([v3 isEqualToString:@"SwitchSourceScreen"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(AXSwitch *)self source];
    if ([v5 isEqualToString:@"SwitchSourceKeyboard"])
    {
      char v4 = 1;
    }
    else
    {
      v6 = [(AXSwitch *)self source];
      if ([v6 isEqualToString:@"SwitchSourceMFI"])
      {
        char v4 = 1;
      }
      else
      {
        uint64_t v7 = [(AXSwitch *)self source];
        if ([v7 isEqualToString:@"SwitchSourceATVRemote"])
        {
          char v4 = 1;
        }
        else
        {
          v8 = [(AXSwitch *)self source];
          if ([v8 isEqualToString:@"SwitchSourceMIDI"])
          {
            char v4 = 1;
          }
          else
          {
            uint64_t v9 = [(AXSwitch *)self source];
            if ([v9 isEqualToString:@"SwitchSourceRemote"])
            {
              char v4 = 1;
            }
            else
            {
              id v10 = [(AXSwitch *)self source];
              if ([v10 isEqualToString:@"SwitchSourceGamepad"])
              {
                char v4 = 1;
              }
              else
              {
                id v11 = [(AXSwitch *)self source];
                if ([v11 isEqualToString:@"SCATSwitchSourceCameraHandGesture"])
                {
                  char v4 = 1;
                }
                else
                {
                  id v12 = [(AXSwitch *)self source];
                  char v4 = [v12 isEqualToString:@"SCATSwitchSourceAccessibility"];
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (NSString)localizedSourceDescription
{
  v2 = [(AXSwitch *)self source];
  if ([v2 isEqualToString:@"SwitchSourceCamera"]) {
    goto LABEL_2;
  }
  if ([v2 isEqualToString:@"SwitchSourceKeyboard"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_EXTERNAL_LABEL";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SwitchSourceMFI"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_MFI_LABEL";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SwitchSourceScreen"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_SCREEN_LABEL";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SwitchSourceATVRemote"])
  {
    id v10 = @"Apple TV Remote";
    goto LABEL_31;
  }
  if ([v2 isEqualToString:@"SwitchSourceRemote"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_REMOTE_LABEL";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SwitchSourceMIDI"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_MIDI_LABEL";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SCATSwitchSourceMotionTracker"])
  {
LABEL_2:
    uint64_t v9 = @"SWITCH_SOURCE_CAMERA_LABEL";
LABEL_30:
    AXParameterizedLocalizedString(2, v9, v3, v4, v5, v6, v7, v8, v12);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if ([v2 isEqualToString:@"SCATSwitchSourceBackTap"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_BACK_TAP";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SCATSwitchSourceAccessibility"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_ACCESSIBILITY";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SwitchSourceGamepad"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_GAMEPAD";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SCATSwitchSourceAutomation"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_AUTOMATION";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SCATSwitchSourceHandGestures"]) {
    goto LABEL_25;
  }
  if ([v2 isEqualToString:@"SCATSwitchSourceSound"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_SOUND";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SCATSwitchSourceHeadGesture"])
  {
    uint64_t v9 = @"SWITCH_SOURCE_HEAD_GESTURES";
    goto LABEL_30;
  }
  if ([v2 isEqualToString:@"SCATSwitchSourceCameraHandGesture"])
  {
LABEL_25:
    uint64_t v9 = @"SWITCH_SOURCE_HAND_GESTURES";
    goto LABEL_30;
  }
  id v10 = &stru_1EDC3DEF8;
LABEL_31:

  return (NSString *)v10;
}

- (id)description
{
  v21 = NSString;
  uint64_t v19 = objc_opt_class();
  uint64_t v3 = SCATActionDescription([(AXSwitch *)self action]);
  uint64_t v26 = [(AXSwitch *)self name];
  id v25 = [(AXSwitch *)self source];
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSwitch isEnabled](self, "isEnabled"));
  BOOL v20 = [(AXSwitch *)self hasLongPressAction];
  v22 = (void *)v3;
  if (v20)
  {
    SCATActionDescription([(AXSwitch *)self longPressAction]);
    uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v23 = @"None";
  }
  uint64_t v18 = [(AXSwitch *)self type];
  unsigned int v17 = [(AXSwitch *)self keyCode];
  int64_t v16 = [(AXSwitch *)self buttonNumber];
  int64_t v15 = [(AXSwitch *)self headSwitch];
  v14 = [(AXSwitch *)self productName];
  v13 = [(AXSwitch *)self manufacturerName];
  uint64_t v4 = [(AXSwitch *)self uuid];
  uint64_t v5 = [(AXSwitch *)self remoteDeviceIdentifier];
  uint64_t v6 = [(AXSwitch *)self remoteDeviceName];
  uint64_t v7 = [(AXSwitch *)self remoteSwitchIdentifier];
  uint64_t v8 = [(AXSwitch *)self midiEvent];
  uint64_t v9 = [(AXSwitch *)self shortcutIdentifier];
  id v10 = [(AXSwitch *)self longPressShortcutIdentifier];
  objc_msgSend(v21, "stringWithFormat:", @"[%@ (%p)]\nAction: %@ \nName: %@ \nSource: %@ \nIs Enabled: %@ \nLong Press action: %@ \nType: %@ \nKey code: %hu\nButton Number: %d\nHead Switch: %d\nProduct Name: %@\nManufacturer: %@\nUUID: %@\nRemote device identifier: %@\nRemote device name: %@\nRemote switch identifier: %@\nMIDI Event: %@\nShortcut %@ / Long press shortcut: %@\n", v19, self, v22, v26, v25, v24, v23, v18, v17, v16, v15, v14, v13, v4, v5, v6,
    v7,
    v8,
    v9,
  id v11 = v10);

  if (v20) {

  }
  return v11;
}

- (unint64_t)hash
{
  v2 = [(AXSwitch *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXSwitch *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v8 = 0;
      goto LABEL_52;
    }
    uint64_t v5 = [(AXSwitch *)self uuid];
    uint64_t v6 = [(AXSwitch *)v4 uuid];
    uint64_t v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      uint64_t v9 = v4;
      id v10 = [(AXSwitch *)self remoteDeviceIdentifier];
      if (v10)
      {
        id v11 = [(AXSwitch *)v9 remoteDeviceIdentifier];
        uint64_t v7 = [(AXSwitch *)self remoteDeviceIdentifier];
        if (![v11 isEqualToString:v7]) {
          goto LABEL_47;
        }
        v52 = v11;
      }
      uint64_t v12 = [(AXSwitch *)self remoteSwitchIdentifier];
      if (v12)
      {
        v13 = [(AXSwitch *)v9 remoteSwitchIdentifier];
        v14 = [(AXSwitch *)self remoteSwitchIdentifier];
        if (![v13 isEqualToString:v14])
        {
          char v22 = 1;
          goto LABEL_17;
        }
        objc_super v49 = v14;
        v50 = v13;
      }
      uint64_t v15 = [(AXSwitch *)self remoteDeviceName];
      if (v15)
      {
        int64_t v16 = (void *)v15;
        [(AXSwitch *)v9 remoteDeviceName];
        uint64_t v18 = v17 = v7;
        [(AXSwitch *)self remoteDeviceName];
        uint64_t v19 = v9;
        v21 = BOOL v20 = v10;
        char v22 = [v18 isEqualToString:v21] ^ 1;

        id v10 = v20;
        uint64_t v9 = v19;

        uint64_t v7 = v17;
      }
      else
      {
        char v22 = 0;
      }
      v14 = v49;
      v13 = v50;
      if (!v12)
      {
LABEL_18:
        if (v10)
        {
        }
        if (v22)
        {
          BOOL v8 = 0;
LABEL_51:

          goto LABEL_52;
        }
        uint64_t v23 = [(AXSwitch *)self source];
        unint64_t v24 = [(AXSwitch *)self cameraSwitch];
        if (v24 == [(AXSwitch *)v9 cameraSwitch])
        {
          unint64_t v25 = [(AXSwitch *)self expressionSensitivity];
          BOOL v26 = v25 == [(AXSwitch *)v9 expressionSensitivity];
        }
        else
        {
          BOOL v26 = 0;
        }
        v53 = (void *)v23;
        v27 = [(AXSwitch *)self shortcutIdentifier];
        if (v27)
        {
          v28 = [(AXSwitch *)self shortcutIdentifier];
          v13 = [(AXSwitch *)v9 shortcutIdentifier];
          if (![v28 isEqualToString:v13])
          {
            char v34 = 0;
            goto LABEL_33;
          }
          v50 = v28;
        }
        uint64_t v29 = [(AXSwitch *)self longPressShortcutIdentifier];
        if (v29)
        {
          v30 = [(AXSwitch *)self longPressShortcutIdentifier];
          uint64_t v31 = [(AXSwitch *)v9 longPressShortcutIdentifier];
          BOOL v32 = v26;
          char v33 = [v30 isEqualToString:v31];

          char v34 = v33;
          BOOL v26 = v32;
        }
        else
        {
          char v34 = 1;
        }

        v28 = v50;
        if (!v27)
        {
LABEL_34:

          int64_t v35 = [(AXSwitch *)self action];
          if (v35 != [(AXSwitch *)v9 action])
          {
            BOOL v8 = 0;
            id v10 = v53;
            goto LABEL_50;
          }
          id v11 = [(AXSwitch *)self name];
          uint64_t v7 = [(AXSwitch *)v9 name];
          int v36 = [v11 isEqualToString:v7] | v26;
          id v10 = v53;
          if (v36 == 1)
          {
            uint64_t v37 = [(AXSwitch *)v9 source];
            if ([v53 isEqual:v37])
            {
              char v38 = v34;
              v39 = [(AXSwitch *)self type];
              v40 = [(AXSwitch *)v9 type];
              if ([v39 isEqual:v40])
              {
                uint64_t v51 = v7;
                int v41 = [(AXSwitch *)self keyCode];
                if (v41 == [(AXSwitch *)v9 keyCode]
                  && (int64_t v42 = [(AXSwitch *)self buttonNumber],
                      v42 == [(AXSwitch *)v9 buttonNumber])
                  && (int64_t v43 = [(AXSwitch *)self headSwitch], v43 == [(AXSwitch *)v9 headSwitch])
                  && (BOOL v44 = [(AXSwitch *)self hasLongPressAction],
                      v44 == [(AXSwitch *)v9 hasLongPressAction])
                  && (int64_t v45 = [(AXSwitch *)self accessibilityEventUsagePage],
                      v45 == [(AXSwitch *)v9 accessibilityEventUsagePage])
                  && (int64_t v46 = [(AXSwitch *)self accessibilityEventUsage],
                      v46 == [(AXSwitch *)v9 accessibilityEventUsage]))
                {
                  int64_t v47 = [(AXSwitch *)self accessibilityEventModifierFlags];
                  if (v47 == [(AXSwitch *)v9 accessibilityEventModifierFlags]) {
                    BOOL v8 = v38;
                  }
                  else {
                    BOOL v8 = 0;
                  }
                }
                else
                {
                  BOOL v8 = 0;
                }
                uint64_t v7 = v51;
              }
              else
              {
                BOOL v8 = 0;
              }
            }
            else
            {
              BOOL v8 = 0;
            }

            goto LABEL_48;
          }
LABEL_47:
          BOOL v8 = 0;
LABEL_48:

LABEL_50:
          goto LABEL_51;
        }
LABEL_33:

        goto LABEL_34;
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  BOOL v8 = 1;
LABEL_52:

  return v8;
}

+ (NSDictionary)expressionToSwitchTypeMapping
{
  if (expressionToSwitchTypeMapping_onceToken != -1) {
    dispatch_once(&expressionToSwitchTypeMapping_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)expressionToSwitchTypeMapping_expressionToSwitchTypeMapping;

  return (NSDictionary *)v2;
}

void __41__AXSwitch_expressionToSwitchTypeMapping__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EDC62CB8;
  v2[1] = &unk_1EDC62CE8;
  v3[0] = &unk_1EDC62CD0;
  v3[1] = &unk_1EDC62D00;
  v2[2] = &unk_1EDC62D18;
  v2[3] = &unk_1EDC62D00;
  v3[2] = &unk_1EDC62CE8;
  v3[3] = &unk_1EDC62CB8;
  v2[4] = &unk_1EDC62D30;
  v2[5] = &unk_1EDC62D48;
  v3[4] = &unk_1EDC62D18;
  v3[5] = &unk_1EDC62D30;
  v2[6] = &unk_1EDC62D60;
  v2[7] = &unk_1EDC62D90;
  v3[6] = &unk_1EDC62D78;
  v3[7] = &unk_1EDC62D90;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)expressionToSwitchTypeMapping_expressionToSwitchTypeMapping;
  expressionToSwitchTypeMapping_expressionToSwitchTypeMapping = v0;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (int64_t)longPressAction
{
  return self->_longPressAction;
}

- (void)setLongPressAction:(int64_t)a3
{
  self->_longPressAction = a3;
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (NSString)longPressShortcutIdentifier
{
  return self->_longPressShortcutIdentifier;
}

- (void)setLongPressShortcutIdentifier:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void)setName:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unsigned)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(unsigned __int16)a3
{
  self->_keyCode = a3;
}

- (int64_t)buttonNumber
{
  return self->_buttonNumber;
}

- (void)setButtonNumber:(int64_t)a3
{
  self->_buttonNumber = a3;
}

- (int64_t)headSwitch
{
  return self->_headSwitch;
}

- (void)setHeadSwitch:(int64_t)a3
{
  self->_headSwitch = a3;
}

- (AXMIDIEvent)midiEvent
{
  return self->_midiEvent;
}

- (void)setMidiEvent:(id)a3
{
}

- (unint64_t)cameraSwitch
{
  return self->_cameraSwitch;
}

- (void)setCameraSwitch:(unint64_t)a3
{
  self->_cameraSwitch = a3;
}

- (unint64_t)expressionSensitivity
{
  return self->_expressionSensitivity;
}

- (void)setExpressionSensitivity:(unint64_t)a3
{
  self->_expressionSensitivity = a3;
}

- (int64_t)accessibilityEventUsagePage
{
  return self->_accessibilityEventUsagePage;
}

- (void)setAccessibilityEventUsagePage:(int64_t)a3
{
  self->_accessibilityEventUsagePage = a3;
}

- (int64_t)accessibilityEventUsage
{
  return self->_accessibilityEventUsage;
}

- (void)setAccessibilityEventUsage:(int64_t)a3
{
  self->_accessibilityEventUsage = a3;
}

- (int64_t)accessibilityEventModifierFlags
{
  return self->_accessibilityEventModifierFlags;
}

- (void)setAccessibilityEventModifierFlags:(int64_t)a3
{
  self->_accessibilityEventModifierFlags = a3;
}

- (NSString)remoteSwitchIdentifier
{
  return self->_remoteSwitchIdentifier;
}

- (void)setRemoteSwitchIdentifier:(id)a3
{
}

- (NSString)remoteDeviceName
{
  return self->_remoteDeviceName;
}

- (void)setRemoteDeviceName:(id)a3
{
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (void)setRemoteDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteDeviceName, 0);
  objc_storeStrong((id *)&self->_remoteSwitchIdentifier, 0);
  objc_storeStrong((id *)&self->_midiEvent, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_longPressShortcutIdentifier, 0);

  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
}

@end