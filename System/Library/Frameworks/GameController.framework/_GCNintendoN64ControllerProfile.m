@interface _GCNintendoN64ControllerProfile
+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4;
+ (id)logicalDeviceControllerProductCategory:(id)a3;
@end

@implementation _GCNintendoN64ControllerProfile

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return @"Switch N64 Controller";
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v43 = a5;
  id v42 = a4;
  v6 = [GCDeviceButtonInputDescription alloc];
  v7 = [GCFLOC_SWITCH_BUTTON_A key];
  v46 = [(GCDeviceButtonInputDescription *)v6 initWithName:@"Button A" additionalAliases:0 attributes:2 nameLocalizationKey:v7 symbolName:@"a.circle" sourceAttributes:1 sourceExtendedEventField:4];

  v8 = [GCDeviceButtonInputDescription alloc];
  v9 = [GCFLOC_SWITCH_BUTTON_B key];
  v44 = [(GCDeviceButtonInputDescription *)v8 initWithName:@"Button B" additionalAliases:0 attributes:2 nameLocalizationKey:v9 symbolName:@"b.circle" sourceAttributes:1 sourceExtendedEventField:5];

  v10 = [GCDeviceButtonInputDescription alloc];
  v11 = [GCFLOC_SWITCH_LEFT_SHOULDER key];
  v47 = [(GCDeviceButtonInputDescription *)v10 initWithName:@"Left Shoulder" additionalAliases:0 attributes:2 nameLocalizationKey:v11 symbolName:@"l.button.roundedbottom.horizontal" sourceAttributes:1 sourceExtendedEventField:8];

  v12 = [GCDeviceButtonInputDescription alloc];
  v13 = [GCFLOC_SWITCH_RIGHT_SHOULDER key];
  v45 = [(GCDeviceButtonInputDescription *)v12 initWithName:@"Right Shoulder" additionalAliases:0 attributes:2 nameLocalizationKey:v13 symbolName:@"r.button.roundedbottom.horizontal" sourceAttributes:1 sourceExtendedEventField:9];

  v14 = [GCDeviceButtonInputDescription alloc];
  v15 = [GCFLOC_SWITCH_N64_Z_BUTTON key];
  v41 = [(GCDeviceButtonInputDescription *)v14 initWithName:@"Left Trigger" additionalAliases:0 attributes:2 nameLocalizationKey:v15 symbolName:@"zl.button.roundedtop.horizontal" sourceAttributes:1 sourceExtendedEventField:18];

  v16 = [GCDeviceButtonInputDescription alloc];
  v17 = [GCFLOC_SWITCH_RIGHT_TRIGGER key];
  v40 = [(GCDeviceButtonInputDescription *)v16 initWithName:@"Right Trigger" additionalAliases:0 attributes:2 nameLocalizationKey:v17 symbolName:@"zr.button.roundedtop.horizontal" sourceAttributes:1 sourceExtendedEventField:19];

  v18 = [GCDeviceButtonInputDescription alloc];
  v19 = [GCFLOC_SWITCH_N64_START_BUTTON key];
  v20 = [(GCDeviceButtonInputDescription *)v18 initWithName:@"Button Menu" additionalAliases:0 attributes:0x4000 nameLocalizationKey:v19 symbolName:@"line.horizontal.3.circle" sourceAttributes:1 sourceExtendedEventField:23];

  v21 = [GCDeviceButtonInputDescription alloc];
  v22 = [GCFLOC_SWITCH_BUTTON_HOME key];
  v23 = [(GCDeviceButtonInputDescription *)v21 initWithName:@"Button Home" additionalAliases:0 attributes:49152 nameLocalizationKey:v22 symbolName:@"house.circle" sourceAttributes:1 sourceExtendedEventField:22];

  v24 = [GCDeviceButtonInputDescription alloc];
  v25 = [GCFLOC_BUTTON_SHARE key];
  v39 = [(GCDeviceButtonInputDescription *)v24 initWithName:@"Button Share" additionalAliases:0 attributes:49152 nameLocalizationKey:v25 symbolName:@"circle.square" sourceAttributes:1 sourceExtendedEventField:40];

  v26 = [GCDeviceDirectionPadDescription alloc];
  v27 = [GCFLOC_SWITCH_N64_C_BUTTONS key];
  v38 = [(GCDeviceDirectionPadDescription *)v26 initWithName:@"Right Thumbstick" additionalAliases:0 attributes:2 nameLocalizationKey:v27 symbolName:@"circle.grid.cross" sourceAttributes:1 sourceUpExtendedEventField:14 sourceDownExtendedEventField:15 sourceLeftExtendedEventField:16 sourceRightExtendedEventField:17];

  v28 = [GCDeviceDirectionPadDescription alloc];
  v29 = [GCFLOC_SWITCH_N64_CONTROL_PAD key];
  v37 = [(GCDeviceDirectionPadDescription *)v28 initWithName:@"Direction Pad" additionalAliases:0 attributes:2 nameLocalizationKey:v29 symbolName:@"dpad" sourceAttributes:1 sourceUpExtendedEventField:0 sourceDownExtendedEventField:1 sourceLeftExtendedEventField:2 sourceRightExtendedEventField:3];

  v30 = [GCDeviceDirectionPadDescription alloc];
  v31 = [GCFLOC_SWITCH_N64_THUMBSTICK key];
  v32 = [(GCDeviceDirectionPadDescription *)v30 initWithName:@"Left Thumbstick" additionalAliases:0 attributes:2 nameLocalizationKey:v31 symbolName:@"l.joystick" sourceAttributes:0 sourceUpExtendedEventField:10 sourceDownExtendedEventField:11 sourceLeftExtendedEventField:12 sourceRightExtendedEventField:13];

  v33 = [_GCDevicePhysicalInputComponentDescription alloc];
  v48[0] = v46;
  v48[1] = v44;
  v48[2] = v47;
  v48[3] = v45;
  v48[4] = v41;
  v48[5] = v40;
  v48[6] = v20;
  v48[7] = v23;
  v48[8] = v39;
  v48[9] = v38;
  v48[10] = v37;
  v48[11] = v32;
  v34 = +[NSArray arrayWithObjects:v48 count:12];
  v35 = [(_GCDevicePhysicalInputComponentDescription *)v33 initWithIdentifier:v42 elements:v34 bindings:v43];

  return v35;
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  return 0;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v108 = a5;
  id v107 = a4;
  v114 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.a"];
  v6 = +[NSSet setWithObject:@"Button A"];
  [v114 setAliases:v6];

  [v114 setLocalizedName:GCFLOC_SWITCH_BUTTON_A];
  v7 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
  [v114 setSymbol:v7];

  [v114 setEventPressedValueField:4];
  v113 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.b"];
  v8 = +[NSSet setWithObject:@"Button B"];
  [v113 setAliases:v8];

  [v113 setLocalizedName:GCFLOC_SWITCH_BUTTON_B];
  v9 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
  [v113 setSymbol:v9];

  [v113 setEventPressedValueField:5];
  v112 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.l"];
  v10 = +[NSSet setWithObject:@"Left Shoulder"];
  [v112 setAliases:v10];

  [v112 setLocalizedName:GCFLOC_SWITCH_LEFT_SHOULDER];
  v11 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.button.roundedbottom.horizontal");
  [v112 setSymbol:v11];

  [v112 setEventPressedValueField:8];
  v111 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.r"];
  v12 = +[NSSet setWithObject:@"Right Shoulder"];
  [v111 setAliases:v12];

  [v111 setLocalizedName:GCFLOC_SWITCH_RIGHT_SHOULDER];
  v13 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.button.roundedbottom.horizontal");
  [v111 setSymbol:v13];

  [v111 setEventPressedValueField:9];
  v110 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.z"];
  v14 = +[NSSet setWithObject:@"Left Trigger"];
  [v110 setAliases:v14];

  [v110 setLocalizedName:GCFLOC_SWITCH_N64_Z_BUTTON];
  v15 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"zl.button.roundedtop.horizontal");
  [v110 setSymbol:v15];

  [v110 setEventPressedValueField:18];
  v106 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.zr"];
  v16 = +[NSSet setWithObject:@"Right Trigger"];
  [v106 setAliases:v16];

  [v106 setLocalizedName:GCFLOC_SWITCH_RIGHT_TRIGGER];
  v17 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"zr.button.roundedtop.horizontal");
  [v106 setSymbol:v17];

  [v106 setEventPressedValueField:19];
  v109 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.start"];
  v18 = +[NSSet setWithObject:@"Button Menu"];
  [v109 setAliases:v18];

  [v109 setLocalizedName:GCFLOC_SWITCH_N64_START_BUTTON];
  v19 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"line.horizontal.3.circle");
  [v109 setSymbol:v19];

  [v109 setEventPressedValueField:23];
  v105 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.home"];
  v20 = +[NSSet setWithObject:@"Button Home"];
  [v105 setAliases:v20];

  [v105 setLocalizedName:GCFLOC_SWITCH_BUTTON_HOME];
  v21 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"house.circle");
  [v105 setSymbol:v21];

  [v105 setEventPressedValueField:22];
  v104 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.capture"];
  v22 = +[NSSet setWithObject:@"Button Share"];
  [v104 setAliases:v22];

  [v104 setLocalizedName:GCFLOC_BUTTON_SHARE];
  v23 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"circle.square");
  [v104 setSymbol:v23];

  [v104 setEventPressedValueField:40];
  v103 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
  v24 = +[NSSet setWithObject:@"Direction Pad"];
  [v103 setAliases:v24];

  [v103 setLocalizedName:GCFLOC_SWITCH_N64_CONTROL_PAD];
  v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
  [v103 setSymbol:v25];

  [v103 setAnalog:0];
  [v103 setEventUpValueField:0];
  [v103 setEventDownValueField:1];
  [v103 setEventLeftValueField:2];
  [v103 setEventRightValueField:3];
  v26 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"buttons.c"];
  v27 = +[NSSet setWithObject:@"Right Thumbstick"];
  [v26 setAliases:v27];

  uint64_t v28 = GCFLOC_SWITCH_N64_C_BUTTONS;
  [v26 setLocalizedName:GCFLOC_SWITCH_N64_C_BUTTONS];
  v29 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"circle.grid.cross");
  [v26 setSymbol:v29];

  [v26 setAnalog:0];
  [v26 setEventUpValueField:14];
  [v26 setEventDownValueField:15];
  [v26 setEventLeftValueField:16];
  [v26 setEventRightValueField:17];
  v30 = +[NSSet setWithObject:@"Right Thumbstick"];
  id v31 = objc_alloc((Class)&off_26D2C0788);
  v32 = (void *)[v31 initWithFormat:GCFLOC_DIRECTION_PAD_X_AXIS arg:v28];
  v33 = [v26 symbol];
  v34 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v30, v32, v33, 10);
  v127 = v34;
  v35 = +[NSArray arrayWithObjects:&v127 count:1];
  [v26 setXSources:v35];

  v36 = +[NSSet setWithObject:@"Right Thumbstick"];
  id v37 = objc_alloc((Class)&off_26D2C0788);
  v38 = (void *)[v37 initWithFormat:GCFLOC_DIRECTION_PAD_Y_AXIS arg:v28];
  v39 = [v26 symbol];
  v40 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v36, v38, v39, 5);
  v126 = v40;
  v41 = +[NSArray arrayWithObjects:&v126 count:1];
  [v26 setYSources:v41];

  id v42 = +[NSSet setWithObject:@"Right Thumbstick"];
  id v43 = objc_alloc((Class)&off_26D2C0788);
  v44 = (void *)[v43 initWithFormat:GCFLOC_DIRECTION_PAD_UP arg:v28];
  v45 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"circle.grid.cross.up.filled");
  v46 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v42, v44, v45, 1);
  v125 = v46;
  v47 = +[NSArray arrayWithObjects:&v125 count:1];
  [v26 setUpSources:v47];

  v48 = +[NSSet setWithObject:@"Right Thumbstick"];
  id v49 = objc_alloc((Class)&off_26D2C0788);
  v50 = (void *)[v49 initWithFormat:GCFLOC_DIRECTION_PAD_RIGHT arg:v28];
  v51 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"circle.grid.cross.right.filled");
  v52 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v48, v50, v51, 2);
  v124 = v52;
  v53 = +[NSArray arrayWithObjects:&v124 count:1];
  [v26 setRightSources:v53];

  v54 = +[NSSet setWithObject:@"Right Thumbstick"];
  id v55 = objc_alloc((Class)&off_26D2C0788);
  v56 = (void *)[v55 initWithFormat:GCFLOC_DIRECTION_PAD_DOWN arg:v28];
  v57 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"circle.grid.cross.down.filled");
  v58 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v54, v56, v57, 4);
  v123 = v58;
  v59 = +[NSArray arrayWithObjects:&v123 count:1];
  [v26 setDownSources:v59];

  v60 = +[NSSet setWithObject:@"Right Thumbstick"];
  id v61 = objc_alloc((Class)&off_26D2C0788);
  v62 = (void *)[v61 initWithFormat:GCFLOC_DIRECTION_PAD_LEFT arg:v28];
  v63 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"circle.grid.cross.left.filled");
  v64 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v60, v62, v63, 8);
  v122 = v64;
  v65 = +[NSArray arrayWithObjects:&v122 count:1];
  [v26 setLeftSources:v65];

  v66 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"controlstick"];
  v67 = +[NSSet setWithObjects:@"Left Thumbstick", 0];
  [v66 setAliases:v67];

  [v66 setLocalizedName:GCFLOC_SWITCH_N64_THUMBSTICK];
  v68 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick");
  [v66 setSymbol:v68];

  [v66 setAnalog:1];
  [v66 setEventUpValueField:10];
  [v66 setEventDownValueField:11];
  [v66 setEventLeftValueField:12];
  [v66 setEventRightValueField:13];
  v69 = +[NSSet setWithObject:@"Left Thumbstick"];
  v70 = [v66 localizedName];
  v71 = [v66 symbol];
  v72 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v69, v70, v71, 10);
  v121 = v72;
  v73 = +[NSArray arrayWithObjects:&v121 count:1];
  [v66 setXSources:v73];

  v74 = +[NSSet setWithObject:@"Left Thumbstick"];
  v75 = [v66 localizedName];
  v76 = [v66 symbol];
  v77 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v74, v75, v76, 5);
  v120 = v77;
  v78 = +[NSArray arrayWithObjects:&v120 count:1];
  [v66 setYSources:v78];

  v79 = +[NSSet setWithObject:@"Left Thumbstick"];
  v80 = [v66 localizedName];
  v81 = [v66 symbol];
  v82 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v79, v80, v81, 1);
  v119 = v82;
  v83 = +[NSArray arrayWithObjects:&v119 count:1];
  [v66 setUpSources:v83];

  v84 = +[NSSet setWithObject:@"Left Thumbstick"];
  v85 = [v66 localizedName];
  v86 = [v66 symbol];
  v87 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v84, v85, v86, 2);
  v118 = v87;
  v88 = +[NSArray arrayWithObjects:&v118 count:1];
  [v66 setRightSources:v88];

  v89 = +[NSSet setWithObject:@"Left Thumbstick"];
  v90 = [v66 localizedName];
  v91 = [v66 symbol];
  v92 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v89, v90, v91, 4);
  v117 = v92;
  v93 = +[NSArray arrayWithObjects:&v117 count:1];
  [v66 setDownSources:v93];

  v94 = +[NSSet setWithObject:@"Left Thumbstick"];
  v95 = [v66 localizedName];
  v96 = [v66 symbol];
  v97 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v94, v95, v96, 8);
  v116 = v97;
  v98 = +[NSArray arrayWithObjects:&v116 count:1];
  [v66 setLeftSources:v98];

  v99 = objc_opt_new();
  v115[0] = v105;
  v115[1] = v104;
  v115[2] = v109;
  v115[3] = v114;
  v115[4] = v113;
  v115[5] = v112;
  v115[6] = v111;
  v115[7] = v110;
  v115[8] = v106;
  v115[9] = v66;
  v115[10] = v26;
  v115[11] = v103;
  v100 = +[NSArray arrayWithObjects:v115 count:12];
  [v99 setElements:v100];

  v101 = [[_GCControllerInputComponentDescription alloc] initWithIdentifier:v107 controllerInputs:v99 bindings:v108];

  return v101;
}

@end