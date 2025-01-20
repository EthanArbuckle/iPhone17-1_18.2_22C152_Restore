@interface _GCAmazonLunaControllerProfile
+ (_GCPhysicalDeviceManager)deviceManager;
+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4;
+ (id)logicalDeviceControllerProductCategory:(id)a3;
+ (void)deviceManager:(id)a3 prepareLogicalDevice:(id)a4;
+ (void)deviceManager:(id)a3 willPublishPhysicalDevice:(id)a4;
@end

@implementation _GCAmazonLunaControllerProfile

+ (_GCPhysicalDeviceManager)deviceManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __47___GCAmazonLunaControllerProfile_deviceManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceManager_onceToken_4 != -1) {
    dispatch_once(&deviceManager_onceToken_4, block);
  }
  v2 = (void *)deviceManager_deviceManager_4;

  return (_GCPhysicalDeviceManager *)v2;
}

+ (void)deviceManager:(id)a3 willPublishPhysicalDevice:(id)a4
{
}

+ (void)deviceManager:(id)a3 prepareLogicalDevice:(id)a4
{
}

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return @"Luna";
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
  char v21 = 0;
  char v22 = 0;
  v8 = [(GCExtendedGamepad *)[_GCLunaGamepad alloc] initWithIdentifier:v6 info:v11];
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v11 + j);

  return v8;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v116 = a5;
  id v115 = a4;
  v123 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.home"];
  id v6 = +[NSSet setWithObject:@"Button Home"];
  [v123 setAliases:v6];

  [v123 setLocalizedName:GCFLOC_LUNA_BUTTON_HOME];
  v7 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"house.circle");
  [v123 setSymbol:v7];

  [v123 setEventPressedValueField:22];
  v122 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.menu"];
  v8 = +[NSSet setWithObject:@"Button Menu"];
  [v122 setAliases:v8];

  [v122 setLocalizedName:GCFLOC_LUNA_BUTTON_MENU];
  v9 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"line.horizontal.3.circle");
  [v122 setSymbol:v9];

  [v122 setEventPressedValueField:23];
  v121 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.action"];
  v10 = +[NSSet setWithObject:@"Button Options"];
  [v121 setAliases:v10];

  [v121 setLocalizedName:GCFLOC_LUNA_BUTTON_OPTIONS];
  v11 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"ellipsis.circle");
  [v121 setSymbol:v11];

  [v121 setEventPressedValueField:24];
  v120 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.a"];
  long long v12 = +[NSSet setWithObject:@"Button A"];
  [v120 setAliases:v12];

  [v120 setLocalizedName:GCFLOC_LUNA_BUTTON_A];
  long long v13 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
  [v120 setSymbol:v13];

  [v120 setEventPressedValueField:4];
  v119 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.b"];
  long long v14 = +[NSSet setWithObject:@"Button B"];
  [v119 setAliases:v14];

  [v119 setLocalizedName:GCFLOC_LUNA_BUTTON_B];
  long long v15 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
  [v119 setSymbol:v15];

  [v119 setEventPressedValueField:5];
  v118 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.x"];
  long long v16 = +[NSSet setWithObject:@"Button X"];
  [v118 setAliases:v16];

  [v118 setLocalizedName:GCFLOC_LUNA_BUTTON_X];
  long long v17 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"x.circle");
  [v118 setSymbol:v17];

  [v118 setEventPressedValueField:6];
  v117 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.y"];
  long long v18 = +[NSSet setWithObject:@"Button Y"];
  [v117 setAliases:v18];

  [v117 setLocalizedName:GCFLOC_LUNA_BUTTON_Y];
  long long v19 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"y.circle");
  [v117 setSymbol:v19];

  [v117 setEventPressedValueField:7];
  v114 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.left.bumper"];
  long long v20 = +[NSSet setWithObject:@"Left Shoulder"];
  [v114 setAliases:v20];

  [v114 setLocalizedName:GCFLOC_LUNA_LEFT_SHOULDER];
  char v21 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"lb.rectangle.roundedbottom");
  [v114 setSymbol:v21];

  [v114 setEventPressedValueField:8];
  v113 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.right.bumper"];
  char v22 = +[NSSet setWithObject:@"Right Shoulder"];
  [v113 setAliases:v22];

  [v113 setLocalizedName:GCFLOC_LUNA_RIGHT_SHOULDER];
  v23 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"rb.rectangle.roundedbottom");
  [v113 setSymbol:v23];

  [v113 setEventPressedValueField:9];
  v112 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.left.trigger"];
  v24 = +[NSSet setWithObject:@"Left Trigger"];
  [v112 setAliases:v24];

  [v112 setLocalizedName:GCFLOC_LUNA_LEFT_TRIGGER];
  v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"lt.rectangle.roundedtop");
  [v112 setSymbol:v25];

  [v112 setAnalog:1];
  [v112 setEventPressedValueField:18];
  v111 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.right.trigger"];
  v26 = +[NSSet setWithObject:@"Right Trigger"];
  [v111 setAliases:v26];

  [v111 setLocalizedName:GCFLOC_LUNA_RIGHT_TRIGGER];
  v27 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"rt.rectangle.roundedtop");
  [v111 setSymbol:v27];

  [v111 setAnalog:1];
  [v111 setEventPressedValueField:19];
  v110 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
  v28 = +[NSSet setWithObject:@"Direction Pad"];
  [v110 setAliases:v28];

  [v110 setLocalizedName:GCFLOC_LUNA_DIRECTION_PAD];
  v29 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
  [v110 setSymbol:v29];

  [v110 setAnalog:0];
  [v110 setEventUpValueField:0];
  [v110 setEventDownValueField:1];
  [v110 setEventLeftValueField:2];
  [v110 setEventRightValueField:3];
  v30 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.left"];
  v31 = +[NSSet setWithObjects:@"Left Thumbstick", @"Left Thumbstick Button", 0];
  [v30 setAliases:v31];

  [v30 setLocalizedName:GCFLOC_LUNA_LEFT_THUMBSTICK];
  v32 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick");
  [v30 setSymbol:v32];

  [v30 setAnalog:1];
  [v30 setEventUpValueField:10];
  [v30 setEventDownValueField:11];
  [v30 setEventLeftValueField:12];
  [v30 setEventRightValueField:13];
  [v30 setEventPressedValueField:20];
  v33 = +[NSSet setWithObject:@"Left Thumbstick"];
  v34 = [v30 localizedName];
  v35 = [v30 symbol];
  v36 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v33, v34, v35, 10);
  v138 = v36;
  v37 = +[NSArray arrayWithObjects:&v138 count:1];
  [v30 setXSources:v37];

  v38 = +[NSSet setWithObject:@"Left Thumbstick"];
  v39 = [v30 localizedName];
  v40 = [v30 symbol];
  v41 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v38, v39, v40, 5);
  v137 = v41;
  v42 = +[NSArray arrayWithObjects:&v137 count:1];
  [v30 setYSources:v42];

  v43 = +[NSSet setWithObject:@"Left Thumbstick"];
  v44 = [v30 localizedName];
  v45 = [v30 symbol];
  v46 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v43, v44, v45, 1);
  v136 = v46;
  v47 = +[NSArray arrayWithObjects:&v136 count:1];
  [v30 setUpSources:v47];

  v48 = +[NSSet setWithObject:@"Left Thumbstick"];
  v49 = [v30 localizedName];
  v50 = [v30 symbol];
  v51 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v48, v49, v50, 2);
  v135 = v51;
  v52 = +[NSArray arrayWithObjects:&v135 count:1];
  [v30 setRightSources:v52];

  v53 = +[NSSet setWithObject:@"Left Thumbstick"];
  v54 = [v30 localizedName];
  v55 = [v30 symbol];
  v56 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v53, v54, v55, 4);
  v134 = v56;
  v57 = +[NSArray arrayWithObjects:&v134 count:1];
  [v30 setDownSources:v57];

  v58 = +[NSSet setWithObject:@"Left Thumbstick"];
  v59 = [v30 localizedName];
  v60 = [v30 symbol];
  v61 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v58, v59, v60, 8);
  v133 = v61;
  v62 = +[NSArray arrayWithObjects:&v133 count:1];
  [v30 setLeftSources:v62];

  v63 = +[NSSet setWithObject:@"Left Thumbstick Button"];
  uint64_t v64 = GCFLOC_LUNA_BUTTON_LEFT_THUMBSTICK;
  v65 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick.press.down");
  v66 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v63, v64, v65);
  v132 = v66;
  v67 = +[NSArray arrayWithObjects:&v132 count:1];
  [v30 setPressedSources:v67];

  v68 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.right"];
  v69 = +[NSSet setWithObjects:@"Right Thumbstick", @"Right Thumbstick Button", 0];
  [v68 setAliases:v69];

  [v68 setLocalizedName:GCFLOC_LUNA_RIGHT_THUMBSTICK];
  v70 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick");
  [v68 setSymbol:v70];

  [v68 setAnalog:1];
  [v68 setEventUpValueField:14];
  [v68 setEventDownValueField:15];
  [v68 setEventLeftValueField:16];
  [v68 setEventRightValueField:17];
  [v68 setEventPressedValueField:21];
  v71 = +[NSSet setWithObject:@"Right Thumbstick"];
  v72 = [v68 localizedName];
  v73 = [v68 symbol];
  v74 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v71, v72, v73, 10);
  v131 = v74;
  v75 = +[NSArray arrayWithObjects:&v131 count:1];
  [v68 setXSources:v75];

  v76 = +[NSSet setWithObject:@"Right Thumbstick"];
  v77 = [v68 localizedName];
  v78 = [v68 symbol];
  v79 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v76, v77, v78, 5);
  v130 = v79;
  v80 = +[NSArray arrayWithObjects:&v130 count:1];
  [v68 setYSources:v80];

  v81 = +[NSSet setWithObject:@"Right Thumbstick"];
  v82 = [v68 localizedName];
  v83 = [v68 symbol];
  v84 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v81, v82, v83, 1);
  v129 = v84;
  v85 = +[NSArray arrayWithObjects:&v129 count:1];
  [v68 setUpSources:v85];

  v86 = +[NSSet setWithObject:@"Right Thumbstick"];
  v87 = [v68 localizedName];
  v88 = [v68 symbol];
  v89 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v86, v87, v88, 2);
  v128 = v89;
  v90 = +[NSArray arrayWithObjects:&v128 count:1];
  [v68 setRightSources:v90];

  v91 = +[NSSet setWithObject:@"Right Thumbstick"];
  v92 = [v68 localizedName];
  v93 = [v68 symbol];
  v94 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v91, v92, v93, 4);
  v127 = v94;
  v95 = +[NSArray arrayWithObjects:&v127 count:1];
  [v68 setDownSources:v95];

  v96 = +[NSSet setWithObject:@"Right Thumbstick"];
  v97 = [v68 localizedName];
  v98 = [v68 symbol];
  v99 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v96, v97, v98, 8);
  v126 = v99;
  v100 = +[NSArray arrayWithObjects:&v126 count:1];
  [v68 setLeftSources:v100];

  v101 = +[NSSet setWithObject:@"Right Thumbstick Button"];
  uint64_t v102 = GCFLOC_LUNA_BUTTON_RIGHT_THUMBSTICK;
  v103 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick.press.down");
  v104 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v101, v102, v103);
  v125 = v104;
  v105 = +[NSArray arrayWithObjects:&v125 count:1];
  [v68 setPressedSources:v105];

  v106 = objc_opt_new();
  v124[0] = v123;
  v124[1] = v122;
  v124[2] = v121;
  v124[3] = v120;
  v124[4] = v119;
  v124[5] = v118;
  v124[6] = v117;
  v124[7] = v114;
  v124[8] = v113;
  v124[9] = v112;
  v124[10] = v111;
  v124[11] = v110;
  v124[12] = v30;
  v124[13] = v68;
  v107 = +[NSArray arrayWithObjects:v124 count:14];
  [v106 setElements:v107];

  v109 = [[_GCControllerInputComponentDescription alloc] initWithIdentifier:v115 controllerInputs:v106 bindings:v116];

  return v109;
}

@end