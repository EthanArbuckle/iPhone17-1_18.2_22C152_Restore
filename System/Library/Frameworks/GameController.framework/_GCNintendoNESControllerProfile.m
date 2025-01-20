@interface _GCNintendoNESControllerProfile
+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4;
+ (id)logicalDeviceControllerProductCategory:(id)a3;
@end

@implementation _GCNintendoNESControllerProfile

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return @"Switch NES Controller";
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v18 = a5;
  id v17 = a4;
  v6 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button A" additionalAliases:0 attributes:2 nameLocalizationKey:@"BUTTON_A" symbolName:@"a.circle" sourceAttributes:1 sourceExtendedEventField:4];
  v16 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button B" additionalAliases:0 attributes:2 nameLocalizationKey:@"BUTTON_B" symbolName:@"b.circle" sourceAttributes:1 sourceExtendedEventField:5];
  v7 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Left Shoulder" additionalAliases:0 attributes:2 nameLocalizationKey:@"LEFT_SHOULDER" symbolName:@"l1.rectangle.roundedbottom" sourceAttributes:1 sourceExtendedEventField:8];
  v8 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Right Shoulder" additionalAliases:0 attributes:2 nameLocalizationKey:@"RIGHT_SHOULDER" symbolName:@"r1.rectangle.roundedbottom" sourceAttributes:1 sourceExtendedEventField:9];
  v9 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button Menu" additionalAliases:0 attributes:0x4000 nameLocalizationKey:@"BUTTON_MENU" symbolName:@"line.horizontal.3.circle" sourceAttributes:1 sourceExtendedEventField:23];
  v10 = [[GCDeviceButtonInputDescription alloc] initWithName:@"Button Options" additionalAliases:0 attributes:49152 nameLocalizationKey:@"BUTTON_OPTIONS" symbolName:@"ellipsis.circle" sourceAttributes:1 sourceExtendedEventField:24];
  v11 = [[GCDeviceDirectionPadDescription alloc] initWithName:@"Direction Pad" additionalAliases:0 attributes:2 nameLocalizationKey:@"DIRECTION_PAD" symbolName:@"dpad" sourceAttributes:1 sourceUpExtendedEventField:0 sourceDownExtendedEventField:1 sourceLeftExtendedEventField:2 sourceRightExtendedEventField:3];
  v12 = [_GCDevicePhysicalInputComponentDescription alloc];
  v19[0] = v6;
  v19[1] = v16;
  v19[2] = v7;
  v19[3] = v8;
  v19[4] = v9;
  v19[5] = v10;
  v19[6] = v11;
  v13 = +[NSArray arrayWithObjects:v19 count:7];
  v14 = [(_GCDevicePhysicalInputComponentDescription *)v12 initWithIdentifier:v17 elements:v13 bindings:v18];

  return v14;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v32 = a5;
  id v31 = a4;
  v30 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.a"];
  v6 = +[NSSet setWithObject:@"Button A"];
  [v30 setAliases:v6];

  [v30 setLocalizedName:GCFLOC_BUTTON_A];
  v7 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
  [v30 setSymbol:v7];

  [v30 setEventPressedValueField:4];
  v8 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.b"];
  v9 = +[NSSet setWithObject:@"Button B"];
  [v8 setAliases:v9];

  [v8 setLocalizedName:GCFLOC_BUTTON_B];
  v10 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
  [v8 setSymbol:v10];

  [v8 setEventPressedValueField:5];
  v11 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.l"];
  v12 = +[NSSet setWithObject:@"Left Shoulder"];
  [v11 setAliases:v12];

  [v11 setLocalizedName:GCFLOC_LEFT_SHOULDER];
  v13 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l1.rectangle.roundedbottom");
  [v11 setSymbol:v13];

  [v11 setEventPressedValueField:8];
  v14 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.r"];
  v15 = +[NSSet setWithObject:@"Right Shoulder"];
  [v14 setAliases:v15];

  [v14 setLocalizedName:GCFLOC_RIGHT_SHOULDER];
  v16 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r1.rectangle.roundedbottom");
  [v14 setSymbol:v16];

  [v14 setEventPressedValueField:9];
  id v17 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.start"];
  id v18 = +[NSSet setWithObject:@"Button Menu"];
  [v17 setAliases:v18];

  [v17 setLocalizedName:GCFLOC_BUTTON_MENU];
  v19 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"line.horizontal.3.circle");
  [v17 setSymbol:v19];

  [v17 setEventPressedValueField:23];
  v20 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.select"];
  v21 = +[NSSet setWithObject:@"Button Options"];
  [v20 setAliases:v21];

  [v20 setLocalizedName:GCFLOC_BUTTON_OPTIONS];
  v22 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"ellipsis.circle");
  [v20 setSymbol:v22];

  [v20 setEventPressedValueField:24];
  v23 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
  v24 = +[NSSet setWithObject:@"Direction Pad"];
  [v23 setAliases:v24];

  [v23 setLocalizedName:GCFLOC_DIRECTION_PAD];
  v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
  [v23 setSymbol:v25];

  [v23 setAnalog:0];
  [v23 setEventUpValueField:0];
  [v23 setEventDownValueField:1];
  [v23 setEventLeftValueField:2];
  [v23 setEventRightValueField:3];
  v26 = objc_opt_new();
  v33[0] = v30;
  v33[1] = v8;
  v33[2] = v11;
  v33[3] = v14;
  v33[4] = v17;
  v33[5] = v20;
  v33[6] = v23;
  v27 = +[NSArray arrayWithObjects:v33 count:7];
  [v26 setElements:v27];

  v28 = [[_GCControllerInputComponentDescription alloc] initWithIdentifier:v31 controllerInputs:v26 bindings:v32];

  return v28;
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  return 0;
}

@end