@interface AXSSInterDeviceSwitchEvent
- (AXSSInterDeviceSwitchEvent)initWithDictionaryRepresentation:(id)a3;
- (AXSSInterDeviceSwitchEvent)initWithSwitchIdentifier:(id)a3 switchDisplayName:(id)a4 deviceIdentifier:(id)a5 actions:(id)a6 isDown:(BOOL)a7;
- (AXSSInterDeviceSwitchEvent)initWithSwitchIdentifier:(id)a3 switchDisplayName:(id)a4 deviceIdentifier:(id)a5 actions:(id)a6 longPressActions:(id)a7 isDown:(BOOL)a8;
- (BOOL)isDown;
- (NSArray)actions;
- (NSArray)longPressActions;
- (NSString)deviceIdentifier;
- (NSString)switchDisplayName;
- (NSString)switchIdentifier;
- (id)description;
- (id)dictionaryRepresentation;
- (void)setActions:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setIsDown:(BOOL)a3;
- (void)setLongPressActions:(id)a3;
- (void)setSwitchDisplayName:(id)a3;
- (void)setSwitchIdentifier:(id)a3;
@end

@implementation AXSSInterDeviceSwitchEvent

- (AXSSInterDeviceSwitchEvent)initWithSwitchIdentifier:(id)a3 switchDisplayName:(id)a4 deviceIdentifier:(id)a5 actions:(id)a6 isDown:(BOOL)a7
{
  return [(AXSSInterDeviceSwitchEvent *)self initWithSwitchIdentifier:a3 switchDisplayName:a4 deviceIdentifier:a5 actions:a6 longPressActions:0 isDown:a7];
}

- (AXSSInterDeviceSwitchEvent)initWithSwitchIdentifier:(id)a3 switchDisplayName:(id)a4 deviceIdentifier:(id)a5 actions:(id)a6 longPressActions:(id)a7 isDown:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AXSSInterDeviceSwitchEvent;
  v18 = [(AXSSInterDeviceSwitchEvent *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_switchIdentifier, a3);
    objc_storeStrong((id *)&v19->_switchDisplayName, a4);
    objc_storeStrong((id *)&v19->_deviceIdentifier, a5);
    objc_storeStrong((id *)&v19->_actions, a6);
    objc_storeStrong((id *)&v19->_longPressActions, a7);
    v19->_isDown = a8;
  }

  return v19;
}

- (AXSSInterDeviceSwitchEvent)initWithDictionaryRepresentation:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AXSSInterDeviceSwitchEvent;
  v5 = [(AXSSInterDeviceSwitchEvent *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 axssDecodeObjectOfClass:objc_opt_class() forKey:@"SwitchIdentifier"];
    switchIdentifier = v5->_switchIdentifier;
    v5->_switchIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 axssDecodeObjectOfClass:objc_opt_class() forKey:@"SwitchDisplayName"];
    switchDisplayName = v5->_switchDisplayName;
    v5->_switchDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 axssDecodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentifier"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 axssDecodeArrayOfClass:objc_opt_class() forKey:@"Actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v12;

    uint64_t v14 = [v4 axssDecodeArrayOfClass:objc_opt_class() forKey:@"LongPressActions"];
    longPressActions = v5->_longPressActions;
    v5->_longPressActions = (NSArray *)v14;

    v5->_isDown = [v4 axssDecodeBoolForKey:@"IsDown"];
    id v16 = [(AXSSInterDeviceSwitchEvent *)v5 switchDisplayName];
    uint64_t v17 = [v16 length];

    if (!v17)
    {
      v18 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceSwitchEvent initWithDictionaryRepresentation:].cold.4();
      }

      v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      v20 = [v19 localizedStringForKey:@"UNTITLED_SWITCH" value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];
      [(AXSSInterDeviceSwitchEvent *)v5 setSwitchDisplayName:v20];
    }
    v21 = [(AXSSInterDeviceSwitchEvent *)v5 switchIdentifier];
    uint64_t v22 = [v21 length];

    if (!v22)
    {
      objc_super v23 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceSwitchEvent initWithDictionaryRepresentation:]();
      }

      [(AXSSInterDeviceSwitchEvent *)v5 setSwitchIdentifier:@"missing-switch-identifier"];
    }
    v24 = [(AXSSInterDeviceSwitchEvent *)v5 deviceIdentifier];
    uint64_t v25 = [v24 length];

    if (!v25)
    {
      v26 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceSwitchEvent initWithDictionaryRepresentation:]();
      }

      [(AXSSInterDeviceSwitchEvent *)v5 setDeviceIdentifier:@"missing-device-identifier"];
    }
    v27 = [(AXSSInterDeviceSwitchEvent *)v5 actions];
    uint64_t v28 = [v27 count];

    if (!v28)
    {
      v29 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceSwitchEvent initWithDictionaryRepresentation:]();
      }

      v33[0] = AXSSSwitchActionSelect;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      [(AXSSInterDeviceSwitchEvent *)v5 setActions:v30];
    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AXSSInterDeviceSwitchEvent *)self switchIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"SwitchIdentifier"];

  v5 = [(AXSSInterDeviceSwitchEvent *)self switchDisplayName];
  [v3 setObject:v5 forKeyedSubscript:@"SwitchDisplayName"];

  uint64_t v6 = [(AXSSInterDeviceSwitchEvent *)self deviceIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"DeviceIdentifier"];

  v7 = [(AXSSInterDeviceSwitchEvent *)self actions];
  [v3 setObject:v7 forKeyedSubscript:@"Actions"];

  uint64_t v8 = [(AXSSInterDeviceSwitchEvent *)self longPressActions];
  [v3 setObject:v8 forKeyedSubscript:@"LongPressActions"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSInterDeviceSwitchEvent isDown](self, "isDown"));
  [v3 setObject:v9 forKeyedSubscript:@"IsDown"];

  return v3;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)AXSSInterDeviceSwitchEvent;
  v3 = [(AXSSInterDeviceSwitchEvent *)&v11 description];
  id v4 = [(AXSSInterDeviceSwitchEvent *)self switchIdentifier];
  v5 = [(AXSSInterDeviceSwitchEvent *)self switchDisplayName];
  uint64_t v6 = [(AXSSInterDeviceSwitchEvent *)self deviceIdentifier];
  v7 = [(AXSSInterDeviceSwitchEvent *)self actions];
  uint64_t v8 = [(AXSSInterDeviceSwitchEvent *)self longPressActions];
  v9 = [v3 stringByAppendingFormat:@" - switch identifier: %@, switch display name: %@, device identifier: %@, actions: %@, long press actions: %@, is down: %i", v4, v5, v6, v7, v8, -[AXSSInterDeviceSwitchEvent isDown](self, "isDown")];

  return v9;
}

- (NSString)switchIdentifier
{
  return self->_switchIdentifier;
}

- (void)setSwitchIdentifier:(id)a3
{
}

- (NSString)switchDisplayName
{
  return self->_switchDisplayName;
}

- (void)setSwitchDisplayName:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSArray)longPressActions
{
  return self->_longPressActions;
}

- (void)setLongPressActions:(id)a3
{
}

- (BOOL)isDown
{
  return self->_isDown;
}

- (void)setIsDown:(BOOL)a3
{
  self->_isDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressActions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_switchDisplayName, 0);

  objc_storeStrong((id *)&self->_switchIdentifier, 0);
}

- (void)initWithDictionaryRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Missing actions for switch event.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Missing device identifier for switch event.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Missing switch identifier for switch event.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Missing switch display name for switch event.", v2, v3, v4, v5, v6);
}

@end