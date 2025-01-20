@interface GCDualShockGamepad
+ (BOOL)supportsSecureCoding;
- (GCControllerButtonInput)touchpadButton;
- (GCControllerDirectionPad)touchpadPrimary;
- (GCControllerDirectionPad)touchpadSecondary;
- (GCDualShockGamepad)initWithCoder:(id)a3;
- (GCDualShockGamepad)initWithController:(id)a3;
- (GCDualShockGamepad)initWithIdentifier:(id)a3;
- (void)_activateExtendedSupport;
- (void)initializeExtraControllerElements;
@end

@implementation GCDualShockGamepad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDualShockGamepad)initWithController:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  memset(v11, 0, sizeof(v11));
  GCExtendedGamepadInitInfoMake(v11);
  for (uint64_t i = 9; i != 1161; i += 72)
    *((unsigned char *)v11 + i) = 1;
  BYTE1(v12) = 0;
  BYTE9(v16) = 0;
  char v21 = 0;
  char v22 = 0;
  v10.receiver = self;
  v10.super_class = (Class)GCDualShockGamepad;
  v6 = [(GCExtendedGamepad *)&v10 initWithController:v4 initInfo:v11];
  v7 = v6;
  if (v6) {
    [(GCDualShockGamepad *)v6 initializeExtraControllerElements];
  }
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v11 + j);

  return v7;
}

- (GCDualShockGamepad)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDualShockGamepad;
  v3 = [(GCExtendedGamepad *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(GCDualShockGamepad *)v3 initializeExtraControllerElements];
  }
  return v4;
}

- (GCDualShockGamepad)initWithIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDualShockGamepad;
  v3 = [(GCExtendedGamepad *)&v6 initWithIdentifier:a3];
  id v4 = v3;
  if (v3) {
    [(GCDualShockGamepad *)v3 initializeExtraControllerElements];
  }
  return v4;
}

- (void)initializeExtraControllerElements
{
  long long v54 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  long long v51 = 0u;
  v50 = @"Touchpad Button";
  LOWORD(v51) = 257;
  DWORD2(v51) = 33;
  LODWORD(v53) = 1;
  if (self)
  {
    v3 = [(GCPhysicalInputProfile *)self _buttonWithInfo:&v50];
  }
  else
  {
    __destructor_8_s0_s48_s56_s64((uint64_t)&v50);
    v3 = 0;
  }
  touchpadButton = self->_touchpadButton;
  self->_touchpadButton = v3;

  [(GCControllerElement *)self->_touchpadButton setRemappable:1];
  [(GCControllerElement *)self->_touchpadButton setUnmappedNameLocalizationKey:@"DS4_BUTTON_TOUCHPAD"];
  [(GCControllerElement *)self->_touchpadButton setUnmappedSfSymbolsName:@"plus.rectangle"];
  v41 = @"Touchpad 1";
  __int16 v42 = 1;
  long long v43 = xmmword_220A94560;
  int v44 = 1;
  __int16 v45 = 0;
  char v46 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  v5 = [(GCPhysicalInputProfile *)self _directionPadWithInfo:&v41];
  touchpadPrimary = self->_touchpadPrimary;
  self->_touchpadPrimary = v5;

  [(GCControllerElement *)self->_touchpadPrimary setRemappable:1];
  [(GCControllerDirectionPad *)self->_touchpadPrimary setUnmappedNameLocalizationKey:@"DS4_TOUCHPAD_FINGER_ONE"];
  [(GCControllerElement *)self->_touchpadPrimary setUnmappedSfSymbolsName:@"hand.draw"];
  v32 = @"Touchpad 2";
  __int16 v33 = 1;
  long long v34 = xmmword_220A94570;
  int v35 = 1;
  __int16 v36 = 0;
  char v37 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v38 = 0;
  v7 = [(GCPhysicalInputProfile *)self _directionPadWithInfo:&v32];
  touchpadSecondary = self->_touchpadSecondary;
  self->_touchpadSecondary = v7;

  [(GCControllerElement *)self->_touchpadSecondary setRemappable:1];
  [(GCControllerDirectionPad *)self->_touchpadSecondary setUnmappedNameLocalizationKey:@"DS4_TOUCHPAD_FINGER_TWO"];
  [(GCControllerElement *)self->_touchpadSecondary setUnmappedSfSymbolsName:@"hand.draw"];
  v9 = [(GCExtendedGamepad *)self buttonHome];
  [v9 setUnmappedNameLocalizationKey:@"DS4_BUTTON_HOME"];

  objc_super v10 = [(GCExtendedGamepad *)self buttonOptions];
  [v10 setUnmappedNameLocalizationKey:@"DS4_BUTTON_OPTIONS"];

  v11 = [(GCExtendedGamepad *)self buttonMenu];
  [v11 setUnmappedNameLocalizationKey:@"DS4_BUTTON_MENU"];

  long long v12 = [(GCExtendedGamepad *)self dpad];
  [v12 setUnmappedNameLocalizationKey:@"DS4_DIRECTION_PAD"];

  long long v13 = [(GCExtendedGamepad *)self buttonA];
  [v13 setUnmappedNameLocalizationKey:@"DS4_BUTTON_A"];

  long long v14 = [(GCExtendedGamepad *)self buttonB];
  [v14 setUnmappedNameLocalizationKey:@"DS4_BUTTON_B"];

  long long v15 = [(GCExtendedGamepad *)self buttonX];
  [v15 setUnmappedNameLocalizationKey:@"DS4_BUTTON_X"];

  long long v16 = [(GCExtendedGamepad *)self buttonY];
  [v16 setUnmappedNameLocalizationKey:@"DS4_BUTTON_Y"];

  long long v17 = [(GCExtendedGamepad *)self leftShoulder];
  [v17 setUnmappedNameLocalizationKey:@"DS4_LEFT_SHOULDER"];

  long long v18 = [(GCExtendedGamepad *)self rightShoulder];
  [v18 setUnmappedNameLocalizationKey:@"DS4_RIGHT_SHOULDER"];

  long long v19 = [(GCExtendedGamepad *)self leftTrigger];
  [v19 setUnmappedNameLocalizationKey:@"DS4_LEFT_TRIGGER"];

  long long v20 = [(GCExtendedGamepad *)self rightTrigger];
  [v20 setUnmappedNameLocalizationKey:@"DS4_RIGHT_TRIGGER"];

  char v21 = [(GCExtendedGamepad *)self leftThumbstick];
  [v21 setUnmappedNameLocalizationKey:@"DS4_LEFT_THUMBSTICK"];

  char v22 = [(GCExtendedGamepad *)self rightThumbstick];
  [v22 setUnmappedNameLocalizationKey:@"DS4_RIGHT_THUMBSTICK"];

  v23 = [(GCExtendedGamepad *)self leftThumbstickButton];
  [v23 setUnmappedNameLocalizationKey:@"DS4_BUTTON_LEFT_THUMBSTICK"];

  v24 = [(GCExtendedGamepad *)self rightThumbstickButton];
  [v24 setUnmappedNameLocalizationKey:@"DS4_BUTTON_RIGHT_THUMBSTICK"];

  v25 = [(GCExtendedGamepad *)self buttonA];
  [v25 setUnmappedSfSymbolsName:@"xmark.circle"];

  v26 = [(GCExtendedGamepad *)self buttonB];
  [v26 setUnmappedSfSymbolsName:@"circle.circle"];

  v27 = [(GCExtendedGamepad *)self buttonX];
  [v27 setUnmappedSfSymbolsName:@"square.circle"];

  v28 = [(GCExtendedGamepad *)self buttonY];
  [v28 setUnmappedSfSymbolsName:@"triangle.circle"];

  v29 = [(GCExtendedGamepad *)self buttonOptions];
  [v29 setUnmappedSfSymbolsName:@"capsule.portrait"];

  v30 = [(GCExtendedGamepad *)self buttonMenu];
  [v30 setUnmappedSfSymbolsName:@"capsule.portrait"];

  v31 = [(GCExtendedGamepad *)self buttonHome];
  [v31 setUnmappedSfSymbolsName:@"logo.playstation"];
}

- (GCControllerButtonInput)touchpadButton
{
  return self->_touchpadButton;
}

- (GCControllerDirectionPad)touchpadPrimary
{
  return self->_touchpadPrimary;
}

- (GCControllerDirectionPad)touchpadSecondary
{
  return self->_touchpadSecondary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchpadSecondary, 0);
  objc_storeStrong((id *)&self->_touchpadPrimary, 0);

  objc_storeStrong((id *)&self->_touchpadButton, 0);
}

- (void)_activateExtendedSupport
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(GCPhysicalInputProfile *)self controller];
  v3 = [v2 components];
  id v4 = (void *)[v3 copy];

  id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v4);
      }
      v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
      if ([v8 conformsToProtocol:&unk_26D293850]) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
    id v5 = v8;

    if (v5)
    {
      v9 = [v5 registryID];

      if (v9)
      {
        objc_super v10 = +[_GCControllerManager sharedInstance];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v4 = +[_GCControllerManager sharedInstance];
          long long v12 = [v5 registryID];
          [v4 setProperty:&__kCFBooleanTrue forKey:@"ActivateExtendedSupport" forHIDServiceClientWithRegistryID:v12];

          goto LABEL_14;
        }
      }
    }
  }
  else
  {
LABEL_14:
  }
}

@end