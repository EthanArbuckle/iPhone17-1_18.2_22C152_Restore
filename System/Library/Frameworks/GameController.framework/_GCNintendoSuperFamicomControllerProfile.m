@interface _GCNintendoSuperFamicomControllerProfile
+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDeviceControllerProductCategory:(id)a3;
@end

@implementation _GCNintendoSuperFamicomControllerProfile

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return @"Switch SNES Controller";
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v17 = a5;
  v18 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button A" additionalAliases:0 attributes:2 nameLocalizationKey:@"BUTTON_A" symbolName:@"a.circle" sourceAttributes:1 sourceExtendedEventField:4];
  v5 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button B" additionalAliases:0 attributes:2 nameLocalizationKey:@"BUTTON_B" symbolName:@"b.circle" sourceAttributes:1 sourceExtendedEventField:5];
  v6 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button X" additionalAliases:0 attributes:2 nameLocalizationKey:@"BUTTON_X" symbolName:@"x.circle" sourceAttributes:1 sourceExtendedEventField:6];
  v7 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button Y" additionalAliases:0 attributes:2 nameLocalizationKey:@"BUTTON_Y" symbolName:@"y.circle" sourceAttributes:1 sourceExtendedEventField:7];
  v8 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Left Shoulder" additionalAliases:0 attributes:2 nameLocalizationKey:@"LEFT_SHOULDER" symbolName:@"l1.rectangle.roundedbottom" sourceAttributes:1 sourceExtendedEventField:8];
  v9 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Right Shoulder" additionalAliases:0 attributes:2 nameLocalizationKey:@"RIGHT_SHOULDER" symbolName:@"r1.rectangle.roundedbottom" sourceAttributes:1 sourceExtendedEventField:9];
  v16 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button Menu" additionalAliases:0 attributes:0x4000 nameLocalizationKey:@"BUTTON_MENU" symbolName:@"line.horizontal.3.circle" sourceAttributes:1 sourceExtendedEventField:23];
  v10 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button Options" additionalAliases:0 attributes:49152 nameLocalizationKey:@"BUTTON_OPTIONS" symbolName:@"ellipsis.circle" sourceAttributes:1 sourceExtendedEventField:24];
  v11 = [[GCDeviceDirectionPadDescription alloc] initWithName:@"Direction Pad" additionalAliases:0 attributes:2 nameLocalizationKey:@"DIRECTION_PAD" symbolName:@"dpad" sourceAttributes:1 sourceUpExtendedEventField:0 sourceDownExtendedEventField:1 sourceLeftExtendedEventField:2 sourceRightExtendedEventField:3];
  v12 = [_GCDeviceGamepadComponentDescription alloc];
  v19[0] = v18;
  v19[1] = v5;
  v19[2] = v6;
  v19[3] = v7;
  v19[4] = v8;
  v19[5] = v9;
  v19[6] = v16;
  v19[7] = v10;
  v19[8] = v11;
  v13 = +[NSArray arrayWithObjects:v19 count:9];
  v14 = [(_GCDevicePhysicalInputComponentDescription *)v12 initWithIdentifier:@"PhysicalInput" elements:v13 bindings:v17];

  return v14;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v37 = a5;
  id v36 = a4;
  v38 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.a"];
  v6 = +[NSSet setWithObject:@"Button A"];
  [v38 setAliases:v6];

  [v38 setLocalizedName:GCFLOC_BUTTON_A];
  v7 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
  [v38 setSymbol:v7];

  [v38 setEventPressedValueField:4];
  v8 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.b"];
  v9 = +[NSSet setWithObject:@"Button B"];
  [v8 setAliases:v9];

  [v8 setLocalizedName:GCFLOC_BUTTON_B];
  v10 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
  [v8 setSymbol:v10];

  [v8 setEventPressedValueField:5];
  v11 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.x"];
  v12 = +[NSSet setWithObject:@"Button X"];
  [v11 setAliases:v12];

  [v11 setLocalizedName:GCFLOC_BUTTON_X];
  v13 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"x.circle");
  [v11 setSymbol:v13];

  [v11 setEventPressedValueField:6];
  v14 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.y"];
  v15 = +[NSSet setWithObject:@"Button Y"];
  [v14 setAliases:v15];

  [v14 setLocalizedName:GCFLOC_BUTTON_Y];
  v16 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"y.circle");
  [v14 setSymbol:v16];

  [v14 setEventPressedValueField:7];
  v35 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.l"];
  id v17 = +[NSSet setWithObject:@"Left Shoulder"];
  [v35 setAliases:v17];

  [v35 setLocalizedName:GCFLOC_LEFT_SHOULDER];
  v18 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l1.rectangle.roundedbottom");
  [v35 setSymbol:v18];

  [v35 setEventPressedValueField:8];
  v19 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.r"];
  v20 = +[NSSet setWithObject:@"Right Shoulder"];
  [v19 setAliases:v20];

  [v19 setLocalizedName:GCFLOC_RIGHT_SHOULDER];
  v21 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r1.rectangle.roundedbottom");
  [v19 setSymbol:v21];

  [v19 setEventPressedValueField:9];
  v22 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.start"];
  v23 = +[NSSet setWithObject:@"Button Menu"];
  [v22 setAliases:v23];

  [v22 setLocalizedName:GCFLOC_BUTTON_MENU];
  v24 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"line.horizontal.3.circle");
  [v22 setSymbol:v24];

  [v22 setEventPressedValueField:23];
  v25 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.select"];
  v26 = +[NSSet setWithObject:@"Button Options"];
  [v25 setAliases:v26];

  [v25 setLocalizedName:GCFLOC_BUTTON_OPTIONS];
  v27 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"ellipsis.circle");
  [v25 setSymbol:v27];

  [v25 setEventPressedValueField:24];
  v28 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
  v29 = +[NSSet setWithObject:@"Direction Pad"];
  [v28 setAliases:v29];

  [v28 setLocalizedName:GCFLOC_DIRECTION_PAD];
  v30 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
  [v28 setSymbol:v30];

  [v28 setAnalog:0];
  [v28 setEventUpValueField:0];
  [v28 setEventDownValueField:1];
  [v28 setEventLeftValueField:2];
  [v28 setEventRightValueField:3];
  v31 = objc_opt_new();
  v39[0] = v38;
  v39[1] = v8;
  v39[2] = v11;
  v39[3] = v14;
  v39[4] = v35;
  v39[5] = v19;
  v39[6] = v22;
  v39[7] = v25;
  v39[8] = v28;
  v32 = +[NSArray arrayWithObjects:v39 count:9];
  [v31 setElements:v32];

  v33 = [[_GCControllerInputComponentDescription alloc] initWithIdentifier:v36 controllerInputs:v31 bindings:v37];

  return v33;
}

@end