@interface _GCNintendoProControllerProfile
+ (BOOL)physicalDeviceSupportsMotion:(id)a3;
+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerMotionWithIdentifier:(id)a4;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4;
+ (id)logicalDeviceControllerProductCategory:(id)a3;
+ (id)physicalDeviceGetHapticCapabilities:(id)a3;
+ (id)physicalDeviceGetHapticCapabilityGraph:(id)a3;
+ (void)physicalDevice:(id)a3 getSensorsEnabledWithReply:(id)a4;
+ (void)physicalDevice:(id)a3 setSensorsActive:(BOOL)a4;
@end

@implementation _GCNintendoProControllerProfile

+ (id)physicalDeviceGetHapticCapabilities:(id)a3
{
  v3 = [[GCHapticActuator alloc] initWithLabel:@"Left Handle" type:1 index:0];
  v7[0] = v3;
  v4 = [[GCHapticActuator alloc] initWithLabel:@"Right Handle" type:1 index:1];
  v7[1] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)physicalDeviceGetHapticCapabilityGraph:(id)a3
{
  uint64_t v3 = objc_opt_class();
  v4 = loadNSDictionaryFromJSON(v3, @"ProControllerHapticCapabilityGraph");
  v5 = [[GCHapticCapabilityGraph alloc] initWithJSONDictionaryRepresentation:v4];

  return v5;
}

+ (BOOL)physicalDeviceSupportsMotion:(id)a3
{
  return 1;
}

+ (void)physicalDevice:(id)a3 getSensorsEnabledWithReply:(id)a4
{
  id v5 = a4;
  v6 = [a3 motionServiceServer];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __77___GCNintendoProControllerProfile_physicalDevice_getSensorsEnabledWithReply___block_invoke;
  v8[3] = &unk_26D22BF78;
  id v9 = v5;
  id v7 = v5;
  [v6 readSensorsActiveWithReply:v8];
}

+ (void)physicalDevice:(id)a3 setSensorsActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 motionServiceServer];
  [v5 updateSensorsActive:v4];
}

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return @"Switch Pro Controller";
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
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
  for (uint64_t i = 0; i != 1152; i += 72)
    *(_WORD *)((char *)v11 + i + 8) = 257;
  BYTE1(v12) = 0;
  BYTE9(v16) = 0;
  char v21 = 1;
  v8 = [(GCExtendedGamepad *)[_GCNintendoSwitchGamepad alloc] initWithIdentifier:v6 info:v11];
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v11 + j);

  return v8;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v118 = a5;
  id v117 = a4;
  v126 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.home"];
  id v6 = +[NSSet setWithObject:@"Button Home"];
  [v126 setAliases:v6];

  [v126 setLocalizedName:GCFLOC_SWITCH_BUTTON_HOME];
  id v7 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"house.circle");
  [v126 setSymbol:v7];

  [v126 setEventPressedValueField:22];
  v125 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.capture"];
  v8 = +[NSSet setWithObject:@"Button Share"];
  [v125 setAliases:v8];

  [v125 setLocalizedName:GCFLOC_BUTTON_SHARE];
  id v9 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"circle.square");
  [v125 setSymbol:v9];

  [v125 setEventPressedValueField:40];
  v124 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.plus"];
  v10 = +[NSSet setWithObject:@"Button Menu"];
  [v124 setAliases:v10];

  [v124 setLocalizedName:GCFLOC_SWITCH_BUTTON_MENU];
  v11 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"plus.circle");
  [v124 setSymbol:v11];

  [v124 setEventPressedValueField:23];
  v123 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.minus"];
  long long v12 = +[NSSet setWithObject:@"Button Options"];
  [v123 setAliases:v12];

  [v123 setLocalizedName:GCFLOC_SWITCH_BUTTON_OPTIONS];
  long long v13 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"minus.circle");
  [v123 setSymbol:v13];

  [v123 setEventPressedValueField:24];
  v122 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.a"];
  long long v14 = +[NSSet setWithObject:@"Button A"];
  [v122 setAliases:v14];

  [v122 setLocalizedName:GCFLOC_SWITCH_BUTTON_A];
  long long v15 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
  [v122 setSymbol:v15];

  [v122 setEventPressedValueField:4];
  v121 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.b"];
  long long v16 = +[NSSet setWithObject:@"Button B"];
  [v121 setAliases:v16];

  [v121 setLocalizedName:GCFLOC_SWITCH_BUTTON_B];
  long long v17 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
  [v121 setSymbol:v17];

  [v121 setEventPressedValueField:5];
  v120 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.x"];
  long long v18 = +[NSSet setWithObject:@"Button X"];
  [v120 setAliases:v18];

  [v120 setLocalizedName:GCFLOC_SWITCH_BUTTON_X];
  long long v19 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"x.circle");
  [v120 setSymbol:v19];

  [v120 setEventPressedValueField:6];
  v119 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.y"];
  long long v20 = +[NSSet setWithObject:@"Button Y"];
  [v119 setAliases:v20];

  [v119 setLocalizedName:GCFLOC_SWITCH_BUTTON_Y];
  char v21 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"y.circle");
  [v119 setSymbol:v21];

  [v119 setEventPressedValueField:7];
  v116 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.l"];
  v22 = +[NSSet setWithObject:@"Left Shoulder"];
  [v116 setAliases:v22];

  [v116 setLocalizedName:GCFLOC_SWITCH_LEFT_SHOULDER];
  v23 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l1.rectangle.roundedbottom");
  [v116 setSymbol:v23];

  [v116 setEventPressedValueField:8];
  v115 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.r"];
  v24 = +[NSSet setWithObject:@"Right Shoulder"];
  [v115 setAliases:v24];

  [v115 setLocalizedName:GCFLOC_SWITCH_RIGHT_SHOULDER];
  v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r1.rectangle.roundedbottom");
  [v115 setSymbol:v25];

  [v115 setEventPressedValueField:9];
  v114 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.zl"];
  v26 = +[NSSet setWithObject:@"Left Trigger"];
  [v114 setAliases:v26];

  [v114 setLocalizedName:GCFLOC_SWITCH_LEFT_TRIGGER];
  v27 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"zl.rectangle.roundedtop");
  [v114 setSymbol:v27];

  [v114 setEventPressedValueField:18];
  v113 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.zr"];
  v28 = +[NSSet setWithObject:@"Right Trigger"];
  [v113 setAliases:v28];

  [v113 setLocalizedName:GCFLOC_SWITCH_RIGHT_TRIGGER];
  v29 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"zr.rectangle.roundedtop");
  [v113 setSymbol:v29];

  [v113 setEventPressedValueField:19];
  v112 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
  v30 = +[NSSet setWithObject:@"Direction Pad"];
  [v112 setAliases:v30];

  [v112 setLocalizedName:GCFLOC_SWITCH_DIRECTION_PAD];
  v31 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
  [v112 setSymbol:v31];

  [v112 setAnalog:0];
  [v112 setEventUpValueField:0];
  [v112 setEventDownValueField:1];
  [v112 setEventLeftValueField:2];
  [v112 setEventRightValueField:3];
  v32 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.left"];
  v33 = +[NSSet setWithObjects:@"Left Thumbstick", @"Left Thumbstick Button", 0];
  [v32 setAliases:v33];

  [v32 setLocalizedName:GCFLOC_SWITCH_LEFT_THUMBSTICK];
  v34 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick");
  [v32 setSymbol:v34];

  [v32 setAnalog:1];
  [v32 setEventUpValueField:10];
  [v32 setEventDownValueField:11];
  [v32 setEventLeftValueField:12];
  [v32 setEventRightValueField:13];
  [v32 setEventPressedValueField:20];
  v35 = +[NSSet setWithObject:@"Left Thumbstick"];
  v36 = [v32 localizedName];
  v37 = [v32 symbol];
  v38 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v35, v36, v37, 10);
  v141 = v38;
  v39 = +[NSArray arrayWithObjects:&v141 count:1];
  [v32 setXSources:v39];

  v40 = +[NSSet setWithObject:@"Left Thumbstick"];
  v41 = [v32 localizedName];
  v42 = [v32 symbol];
  v43 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v40, v41, v42, 5);
  v140 = v43;
  v44 = +[NSArray arrayWithObjects:&v140 count:1];
  [v32 setYSources:v44];

  v45 = +[NSSet setWithObject:@"Left Thumbstick"];
  v46 = [v32 localizedName];
  v47 = [v32 symbol];
  v48 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v45, v46, v47, 1);
  v139 = v48;
  v49 = +[NSArray arrayWithObjects:&v139 count:1];
  [v32 setUpSources:v49];

  v50 = +[NSSet setWithObject:@"Left Thumbstick"];
  v51 = [v32 localizedName];
  v52 = [v32 symbol];
  v53 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v50, v51, v52, 2);
  v138 = v53;
  v54 = +[NSArray arrayWithObjects:&v138 count:1];
  [v32 setRightSources:v54];

  v55 = +[NSSet setWithObject:@"Left Thumbstick"];
  v56 = [v32 localizedName];
  v57 = [v32 symbol];
  v58 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v55, v56, v57, 4);
  v137 = v58;
  v59 = +[NSArray arrayWithObjects:&v137 count:1];
  [v32 setDownSources:v59];

  v60 = +[NSSet setWithObject:@"Left Thumbstick"];
  v61 = [v32 localizedName];
  v62 = [v32 symbol];
  v63 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v60, v61, v62, 8);
  v136 = v63;
  v64 = +[NSArray arrayWithObjects:&v136 count:1];
  [v32 setLeftSources:v64];

  v65 = +[NSSet setWithObject:@"Left Thumbstick Button"];
  uint64_t v66 = GCFLOC_SWITCH_BUTTON_LEFT_THUMBSTICK;
  v67 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick.press.down");
  v68 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v65, v66, v67);
  v135 = v68;
  v69 = +[NSArray arrayWithObjects:&v135 count:1];
  [v32 setPressedSources:v69];

  v70 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.right"];
  v71 = +[NSSet setWithObjects:@"Right Thumbstick", @"Right Thumbstick Button", 0];
  [v70 setAliases:v71];

  [v70 setLocalizedName:GCFLOC_SWITCH_RIGHT_THUMBSTICK];
  v72 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick");
  [v70 setSymbol:v72];

  [v70 setAnalog:1];
  [v70 setEventUpValueField:14];
  [v70 setEventDownValueField:15];
  [v70 setEventLeftValueField:16];
  [v70 setEventRightValueField:17];
  [v70 setEventPressedValueField:21];
  v73 = +[NSSet setWithObject:@"Right Thumbstick"];
  v74 = [v70 localizedName];
  v75 = [v70 symbol];
  v76 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v73, v74, v75, 10);
  v134 = v76;
  v77 = +[NSArray arrayWithObjects:&v134 count:1];
  [v70 setXSources:v77];

  v78 = +[NSSet setWithObject:@"Right Thumbstick"];
  v79 = [v70 localizedName];
  v80 = [v70 symbol];
  v81 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v78, v79, v80, 5);
  v133 = v81;
  v82 = +[NSArray arrayWithObjects:&v133 count:1];
  [v70 setYSources:v82];

  v83 = +[NSSet setWithObject:@"Right Thumbstick"];
  v84 = [v70 localizedName];
  v85 = [v70 symbol];
  v86 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v83, v84, v85, 1);
  v132 = v86;
  v87 = +[NSArray arrayWithObjects:&v132 count:1];
  [v70 setUpSources:v87];

  v88 = +[NSSet setWithObject:@"Right Thumbstick"];
  v89 = [v70 localizedName];
  v90 = [v70 symbol];
  v91 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v88, v89, v90, 2);
  v131 = v91;
  v92 = +[NSArray arrayWithObjects:&v131 count:1];
  [v70 setRightSources:v92];

  v93 = +[NSSet setWithObject:@"Right Thumbstick"];
  v94 = [v70 localizedName];
  v95 = [v70 symbol];
  v96 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v93, v94, v95, 4);
  v130 = v96;
  v97 = +[NSArray arrayWithObjects:&v130 count:1];
  [v70 setDownSources:v97];

  v98 = +[NSSet setWithObject:@"Right Thumbstick"];
  v99 = [v70 localizedName];
  v100 = [v70 symbol];
  v101 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v98, v99, v100, 8);
  v129 = v101;
  v102 = +[NSArray arrayWithObjects:&v129 count:1];
  [v70 setLeftSources:v102];

  v103 = +[NSSet setWithObject:@"Right Thumbstick Button"];
  uint64_t v104 = GCFLOC_SWITCH_BUTTON_RIGHT_THUMBSTICK;
  v105 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick.press.down");
  v106 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v103, v104, v105);
  v128 = v106;
  v107 = +[NSArray arrayWithObjects:&v128 count:1];
  [v70 setPressedSources:v107];

  v108 = objc_opt_new();
  v127[0] = v126;
  v127[1] = v125;
  v127[2] = v124;
  v127[3] = v123;
  v127[4] = v122;
  v127[5] = v121;
  v127[6] = v120;
  v127[7] = v119;
  v127[8] = v116;
  v127[9] = v115;
  v127[10] = v114;
  v127[11] = v113;
  v127[12] = v112;
  v127[13] = v32;
  v127[14] = v70;
  v109 = +[NSArray arrayWithObjects:v127 count:15];
  [v108 setElements:v109];

  v111 = [[_GCControllerInputComponentDescription alloc] initWithIdentifier:v117 controllerInputs:v108 bindings:v118];

  return v111;
}

+ (id)logicalDevice:(id)a3 makeControllerMotionWithIdentifier:(id)a4
{
  id v4 = a4;
  id v5 = [[GCMotion alloc] initWithIdentifier:v4];

  [(GCMotion *)v5 _setHasRotationRate:1];
  [(GCMotion *)v5 _setHasAttitude:0];

  return v5;
}

@end