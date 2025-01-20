@interface GCDualSenseGamepad
+ (BOOL)supportsSecureCoding;
- (GCControllerButtonInput)touchpadButton;
- (GCControllerDirectionPad)touchpadPrimary;
- (GCControllerDirectionPad)touchpadSecondary;
- (GCDualSenseGamepad)initWithCoder:(id)a3;
- (GCDualSenseGamepad)initWithController:(id)a3;
- (GCDualSenseGamepad)initWithIdentifier:(id)a3;
- (void)_activateExtendedSupport;
- (void)initializeExtraControllerElements;
- (void)populateEncodedInitInfo:(id *)a3;
@end

@implementation GCDualSenseGamepad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDualSenseGamepad)initWithController:(id)a3
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
  char v23 = 0;
  uint64_t v22 = 1;
  uint64_t v24 = 1;
  v10.receiver = self;
  v10.super_class = (Class)GCDualSenseGamepad;
  v6 = [(GCExtendedGamepad *)&v10 initWithController:v4 initInfo:v11];
  v7 = v6;
  if (v6) {
    [(GCDualSenseGamepad *)v6 initializeExtraControllerElements];
  }
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v11 + j);

  return v7;
}

- (GCDualSenseGamepad)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDualSenseGamepad;
  v3 = [(GCExtendedGamepad *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(GCDualSenseGamepad *)v3 initializeExtraControllerElements];
  }
  return v4;
}

- (GCDualSenseGamepad)initWithIdentifier:(id)a3
{
  id v4 = a3;
  memset(v10, 0, 512);
  GCExtendedGamepadInitInfoMake(v10);
  uint64_t v11 = 1;
  uint64_t v12 = 1;
  v9.receiver = self;
  v9.super_class = (Class)GCDualSenseGamepad;
  v5 = [(GCExtendedGamepad *)&v9 initWithIdentifier:v4 info:v10];
  objc_super v6 = v5;
  if (v5) {
    [(GCDualSenseGamepad *)v5 initializeExtraControllerElements];
  }
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v10 + i);

  return v6;
}

- (void)populateEncodedInitInfo:(id *)a3
{
  a3->var0[9].var3.var0.var3 = 1;
  a3->var0[10].var3.var0.var3 = 1;
}

- (void)initializeExtraControllerElements
{
  long long v56 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  long long v53 = 0u;
  v52 = @"Touchpad Button";
  LOWORD(v53) = 257;
  DWORD2(v53) = 33;
  LODWORD(v55) = 1;
  if (self)
  {
    v3 = [(GCPhysicalInputProfile *)self _buttonWithInfo:&v52];
  }
  else
  {
    __destructor_8_s0_s48_s56_s64((uint64_t)&v52);
    v3 = 0;
  }
  touchpadButton = self->_touchpadButton;
  self->_touchpadButton = v3;

  [(GCControllerElement *)self->_touchpadButton setRemappable:1];
  [(GCControllerElement *)self->_touchpadButton setUnmappedNameLocalizationKey:@"DS4_BUTTON_TOUCHPAD"];
  [(GCControllerElement *)self->_touchpadButton setUnmappedSfSymbolsName:@"plus.rectangle"];
  v43 = @"Touchpad 1";
  __int16 v44 = 1;
  long long v45 = xmmword_220A94560;
  int v46 = 1;
  __int16 v47 = 0;
  char v48 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v49 = 0;
  v5 = [(GCPhysicalInputProfile *)self _directionPadWithInfo:&v43];
  touchpadPrimary = self->_touchpadPrimary;
  self->_touchpadPrimary = v5;

  [(GCControllerElement *)self->_touchpadPrimary setRemappable:1];
  [(GCControllerDirectionPad *)self->_touchpadPrimary setUnmappedNameLocalizationKey:@"DS4_TOUCHPAD_FINGER_ONE"];
  [(GCControllerElement *)self->_touchpadPrimary setUnmappedSfSymbolsName:@"hand.draw"];
  v34 = @"Touchpad 2";
  __int16 v35 = 1;
  long long v36 = xmmword_220A94570;
  int v37 = 1;
  __int16 v38 = 0;
  char v39 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  v7 = [(GCPhysicalInputProfile *)self _directionPadWithInfo:&v34];
  touchpadSecondary = self->_touchpadSecondary;
  self->_touchpadSecondary = v7;

  [(GCControllerElement *)self->_touchpadSecondary setRemappable:1];
  [(GCControllerDirectionPad *)self->_touchpadSecondary setUnmappedNameLocalizationKey:@"DS4_TOUCHPAD_FINGER_TWO"];
  [(GCControllerElement *)self->_touchpadSecondary setUnmappedSfSymbolsName:@"hand.draw"];
  objc_super v9 = [(GCExtendedGamepad *)self leftTrigger];
  objc_super v10 = [(GCExtendedGamepad *)self rightTrigger];
  [v9 setIndex:0];
  [v10 setIndex:1];
  uint64_t v11 = [(GCExtendedGamepad *)self buttonHome];
  [v11 setUnmappedNameLocalizationKey:@"DS4_BUTTON_HOME"];

  uint64_t v12 = [(GCExtendedGamepad *)self buttonOptions];
  [v12 setUnmappedNameLocalizationKey:@"DUALSENSE_BUTTON_OPTIONS"];

  long long v13 = [(GCExtendedGamepad *)self buttonMenu];
  [v13 setUnmappedNameLocalizationKey:@"DUALSENSE_BUTTON_MENU"];

  long long v14 = [(GCExtendedGamepad *)self dpad];
  [v14 setUnmappedNameLocalizationKey:@"DS4_DIRECTION_PAD"];

  long long v15 = [(GCExtendedGamepad *)self buttonA];
  [v15 setUnmappedNameLocalizationKey:@"DS4_BUTTON_A"];

  long long v16 = [(GCExtendedGamepad *)self buttonB];
  [v16 setUnmappedNameLocalizationKey:@"DS4_BUTTON_B"];

  long long v17 = [(GCExtendedGamepad *)self buttonX];
  [v17 setUnmappedNameLocalizationKey:@"DS4_BUTTON_X"];

  long long v18 = [(GCExtendedGamepad *)self buttonY];
  [v18 setUnmappedNameLocalizationKey:@"DS4_BUTTON_Y"];

  long long v19 = [(GCExtendedGamepad *)self leftShoulder];
  [v19 setUnmappedNameLocalizationKey:@"DS4_LEFT_SHOULDER"];

  long long v20 = [(GCExtendedGamepad *)self rightShoulder];
  [v20 setUnmappedNameLocalizationKey:@"DS4_RIGHT_SHOULDER"];

  char v21 = [(GCExtendedGamepad *)self leftTrigger];
  [v21 setUnmappedNameLocalizationKey:@"DS4_LEFT_TRIGGER"];

  uint64_t v22 = [(GCExtendedGamepad *)self rightTrigger];
  [v22 setUnmappedNameLocalizationKey:@"DS4_RIGHT_TRIGGER"];

  char v23 = [(GCExtendedGamepad *)self leftThumbstick];
  [v23 setUnmappedNameLocalizationKey:@"DS4_LEFT_THUMBSTICK"];

  uint64_t v24 = [(GCExtendedGamepad *)self rightThumbstick];
  [v24 setUnmappedNameLocalizationKey:@"DS4_RIGHT_THUMBSTICK"];

  v25 = [(GCExtendedGamepad *)self leftThumbstickButton];
  [v25 setUnmappedNameLocalizationKey:@"DS4_BUTTON_LEFT_THUMBSTICK"];

  v26 = [(GCExtendedGamepad *)self rightThumbstickButton];
  [v26 setUnmappedNameLocalizationKey:@"DS4_BUTTON_RIGHT_THUMBSTICK"];

  v27 = [(GCExtendedGamepad *)self buttonA];
  [v27 setUnmappedSfSymbolsName:@"xmark.circle"];

  v28 = [(GCExtendedGamepad *)self buttonB];
  [v28 setUnmappedSfSymbolsName:@"circle.circle"];

  v29 = [(GCExtendedGamepad *)self buttonX];
  [v29 setUnmappedSfSymbolsName:@"square.circle"];

  v30 = [(GCExtendedGamepad *)self buttonY];
  [v30 setUnmappedSfSymbolsName:@"triangle.circle"];

  v31 = [(GCExtendedGamepad *)self buttonOptions];
  [v31 setUnmappedSfSymbolsName:@"capsule.portrait"];

  v32 = [(GCExtendedGamepad *)self buttonMenu];
  [v32 setUnmappedSfSymbolsName:@"capsule.portrait"];

  v33 = [(GCExtendedGamepad *)self buttonHome];
  [v33 setUnmappedSfSymbolsName:@"logo.playstation"];
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
      objc_super v9 = [v5 registryID];

      if (v9)
      {
        objc_super v10 = +[_GCControllerManager sharedInstance];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v4 = +[_GCControllerManager sharedInstance];
          uint64_t v12 = [v5 registryID];
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