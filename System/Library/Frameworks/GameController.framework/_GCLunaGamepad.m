@interface _GCLunaGamepad
+ (BOOL)supportsSecureCoding;
- (_GCLunaGamepad)initWithCoder:(id)a3;
- (_GCLunaGamepad)initWithController:(id)a3;
- (void)initializeExtraControllerElements;
@end

@implementation _GCLunaGamepad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCLunaGamepad)initWithController:(id)a3
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
  v10.super_class = (Class)_GCLunaGamepad;
  v6 = [(GCExtendedGamepad *)&v10 initWithController:v4 initInfo:v11];
  v7 = v6;
  if (v6) {
    [(_GCLunaGamepad *)v6 initializeExtraControllerElements];
  }
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v11 + j);

  return v7;
}

- (_GCLunaGamepad)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCLunaGamepad;
  v3 = [(GCExtendedGamepad *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(_GCLunaGamepad *)v3 initializeExtraControllerElements];
  }
  return v4;
}

- (void)initializeExtraControllerElements
{
  v3 = [(GCExtendedGamepad *)self leftTrigger];
  [v3 setUnmappedSfSymbolsName:@"lt.rectangle.roundedtop"];

  id v4 = [(GCExtendedGamepad *)self rightTrigger];
  [v4 setUnmappedSfSymbolsName:@"rt.rectangle.roundedtop"];

  v5 = [(GCExtendedGamepad *)self leftShoulder];
  [v5 setUnmappedSfSymbolsName:@"lb.rectangle.roundedbottom"];

  objc_super v6 = [(GCExtendedGamepad *)self rightShoulder];
  [v6 setUnmappedSfSymbolsName:@"rb.rectangle.roundedbottom"];

  v7 = [(GCExtendedGamepad *)self buttonHome];
  [v7 setUnmappedNameLocalizationKey:@"LUNA_BUTTON_HOME"];

  v8 = [(GCExtendedGamepad *)self buttonOptions];
  [v8 setUnmappedNameLocalizationKey:@"LUNA_BUTTON_OPTIONS"];

  v9 = [(GCExtendedGamepad *)self buttonMenu];
  [v9 setUnmappedNameLocalizationKey:@"LUNA_BUTTON_MENU"];

  objc_super v10 = [(GCExtendedGamepad *)self dpad];
  [v10 setUnmappedNameLocalizationKey:@"LUNA_DIRECTION_PAD"];

  v11 = [(GCExtendedGamepad *)self buttonA];
  [v11 setUnmappedNameLocalizationKey:@"LUNA_BUTTON_A"];

  long long v12 = [(GCExtendedGamepad *)self buttonB];
  [v12 setUnmappedNameLocalizationKey:@"LUNA_BUTTON_B"];

  long long v13 = [(GCExtendedGamepad *)self buttonX];
  [v13 setUnmappedNameLocalizationKey:@"LUNA_BUTTON_X"];

  long long v14 = [(GCExtendedGamepad *)self buttonY];
  [v14 setUnmappedNameLocalizationKey:@"LUNA_BUTTON_Y"];

  long long v15 = [(GCExtendedGamepad *)self leftShoulder];
  [v15 setUnmappedNameLocalizationKey:@"LUNA_LEFT_SHOULDER"];

  long long v16 = [(GCExtendedGamepad *)self rightShoulder];
  [v16 setUnmappedNameLocalizationKey:@"LUNA_RIGHT_SHOULDER"];

  long long v17 = [(GCExtendedGamepad *)self leftTrigger];
  [v17 setUnmappedNameLocalizationKey:@"LUNA_LEFT_TRIGGER"];

  long long v18 = [(GCExtendedGamepad *)self rightTrigger];
  [v18 setUnmappedNameLocalizationKey:@"LUNA_RIGHT_TRIGGER"];

  long long v19 = [(GCExtendedGamepad *)self leftThumbstick];
  [v19 setUnmappedNameLocalizationKey:@"LUNA_LEFT_THUMBSTICK"];

  long long v20 = [(GCExtendedGamepad *)self rightThumbstick];
  [v20 setUnmappedNameLocalizationKey:@"LUNA_RIGHT_THUMBSTICK"];

  char v21 = [(GCExtendedGamepad *)self leftThumbstickButton];
  [v21 setUnmappedNameLocalizationKey:@"LUNA_BUTTON_LEFT_THUMBSTICK"];

  id v22 = [(GCExtendedGamepad *)self rightThumbstickButton];
  [v22 setUnmappedNameLocalizationKey:@"LUNA_BUTTON_RIGHT_THUMBSTICK"];
}

@end