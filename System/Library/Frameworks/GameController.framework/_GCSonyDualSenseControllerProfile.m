@interface _GCSonyDualSenseControllerProfile
+ (BOOL)physicalDeviceSupportsMotion:(id)a3;
+ (_GCPhysicalDeviceManager)deviceManager;
+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerMotionWithIdentifier:(id)a4;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4;
+ (id)logicalDeviceControllerDetailedProductCategory:(id)a3;
+ (id)logicalDeviceControllerProductCategory:(id)a3;
+ (id)physicalDeviceGetHapticCapabilities:(id)a3;
+ (id)physicalDeviceGetHapticCapabilityGraph:(id)a3;
+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3;
+ (void)deviceManager:(id)a3 prepareLogicalDevice:(id)a4;
+ (void)deviceManager:(id)a3 willPublishPhysicalDevice:(id)a4;
+ (void)physicalDevice:(id)a3 getAdaptiveTriggersStatusesWithReply:(id)a4;
+ (void)physicalDevice:(id)a3 getBatteryWithReply:(id)a4;
+ (void)physicalDevice:(id)a3 getLightWithReply:(id)a4;
+ (void)physicalDevice:(id)a3 getSensorsEnabledWithReply:(id)a4;
+ (void)physicalDevice:(id)a3 setAdaptiveTriggersPayload:(id)a4 forIndex:(int)a5;
+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4;
+ (void)physicalDevice:(id)a3 setLight:(id)a4;
+ (void)physicalDevice:(id)a3 setSensorsActive:(BOOL)a4;
@end

@implementation _GCSonyDualSenseControllerProfile

+ (_GCPhysicalDeviceManager)deviceManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50___GCSonyDualSenseControllerProfile_deviceManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceManager_onceToken_1 != -1) {
    dispatch_once(&deviceManager_onceToken_1, block);
  }
  v2 = (void *)deviceManager_deviceManager_1;

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
  return @"DualSense";
}

+ (id)logicalDeviceControllerDetailedProductCategory:(id)a3
{
  v3 = [a3 underlyingDevice];
  v4 = [v3 serviceInfo];
  v5 = [v4 numberPropertyForKey:@"ProductID"];
  int v6 = [v5 unsignedIntValue];

  if (v6 == 3570) {
    v7 = @"DualSense Edge";
  }
  else {
    v7 = @"DualSense";
  }

  return v7;
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
  char v23 = 0;
  uint64_t v22 = 1;
  uint64_t v24 = 1;
  v8 = [(GCExtendedGamepad *)[GCDualSenseGamepad alloc] initWithIdentifier:v6 info:v11];
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v11 + j);

  return v8;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v116 = a5;
  id v115 = a4;
  v123 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.logo"];
  id v6 = +[NSSet setWithObject:@"Button Home"];
  [v123 setAliases:v6];

  [v123 setLocalizedName:GCFLOC_DS4_BUTTON_HOME];
  v7 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"logo.playstation");
  [v123 setSymbol:v7];

  [v123 setEventPressedValueField:22];
  v122 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.options"];
  v8 = +[NSSet setWithObject:@"Button Menu"];
  [v122 setAliases:v8];

  [v122 setLocalizedName:GCFLOC_DUALSENSE_BUTTON_MENU];
  v9 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"capsule.portrait");
  [v122 setSymbol:v9];

  [v122 setEventPressedValueField:23];
  v121 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.create"];
  v10 = +[NSSet setWithObject:@"Button Options"];
  [v121 setAliases:v10];

  [v121 setLocalizedName:GCFLOC_DUALSENSE_BUTTON_OPTIONS];
  v11 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"capsule.portrait");
  [v121 setSymbol:v11];

  [v121 setEventPressedValueField:24];
  v120 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.xmark"];
  long long v12 = +[NSSet setWithObject:@"Button A"];
  [v120 setAliases:v12];

  [v120 setLocalizedName:GCFLOC_DS4_BUTTON_A];
  long long v13 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"xmark.circle");
  [v120 setSymbol:v13];

  [v120 setEventPressedValueField:4];
  v119 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.circle"];
  long long v14 = +[NSSet setWithObject:@"Button B"];
  [v119 setAliases:v14];

  [v119 setLocalizedName:GCFLOC_DS4_BUTTON_B];
  long long v15 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"circle.circle");
  [v119 setSymbol:v15];

  [v119 setEventPressedValueField:5];
  v118 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.square"];
  long long v16 = +[NSSet setWithObject:@"Button X"];
  [v118 setAliases:v16];

  [v118 setLocalizedName:GCFLOC_DS4_BUTTON_X];
  long long v17 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"square.circle");
  [v118 setSymbol:v17];

  [v118 setEventPressedValueField:6];
  v117 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.triangle"];
  long long v18 = +[NSSet setWithObject:@"Button Y"];
  [v117 setAliases:v18];

  [v117 setLocalizedName:GCFLOC_DS4_BUTTON_Y];
  long long v19 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"triangle.circle");
  [v117 setSymbol:v19];

  [v117 setEventPressedValueField:7];
  v114 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.l1"];
  long long v20 = +[NSSet setWithObject:@"Left Shoulder"];
  [v114 setAliases:v20];

  [v114 setLocalizedName:GCFLOC_DS4_LEFT_SHOULDER];
  char v21 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l1.rectangle.roundedbottom");
  [v114 setSymbol:v21];

  [v114 setEventPressedValueField:8];
  v113 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.r1"];
  uint64_t v22 = +[NSSet setWithObject:@"Right Shoulder"];
  [v113 setAliases:v22];

  [v113 setLocalizedName:GCFLOC_DS4_RIGHT_SHOULDER];
  char v23 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r1.rectangle.roundedbottom");
  [v113 setSymbol:v23];

  [v113 setEventPressedValueField:9];
  v112 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.l2"];
  uint64_t v24 = +[NSSet setWithObject:@"Left Trigger"];
  [v112 setAliases:v24];

  [v112 setLocalizedName:GCFLOC_DS4_LEFT_TRIGGER];
  v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l2.rectangle.roundedtop");
  [v112 setSymbol:v25];

  [v112 setAnalog:1];
  [v112 setEventPressedValueField:18];
  v111 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.r2"];
  v26 = +[NSSet setWithObject:@"Right Trigger"];
  [v111 setAliases:v26];

  [v111 setLocalizedName:GCFLOC_DS4_RIGHT_TRIGGER];
  v27 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r2.rectangle.roundedtop");
  [v111 setSymbol:v27];

  [v111 setAnalog:1];
  [v111 setEventPressedValueField:19];
  v110 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
  v28 = +[NSSet setWithObject:@"Direction Pad"];
  [v110 setAliases:v28];

  [v110 setLocalizedName:GCFLOC_DS4_DIRECTION_PAD];
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

  [v30 setLocalizedName:GCFLOC_DS4_LEFT_THUMBSTICK];
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
  uint64_t v64 = GCFLOC_DS4_BUTTON_LEFT_THUMBSTICK;
  v65 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick.press.down");
  v66 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v63, v64, v65);
  v132 = v66;
  v67 = +[NSArray arrayWithObjects:&v132 count:1];
  [v30 setPressedSources:v67];

  v68 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.right"];
  v69 = +[NSSet setWithObjects:@"Right Thumbstick", @"Right Thumbstick Button", 0];
  [v68 setAliases:v69];

  [v68 setLocalizedName:GCFLOC_DS4_RIGHT_THUMBSTICK];
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
  uint64_t v102 = GCFLOC_DS4_BUTTON_RIGHT_THUMBSTICK;
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

+ (id)logicalDevice:(id)a3 makeControllerMotionWithIdentifier:(id)a4
{
  id v4 = a4;
  id v5 = [[GCMotion alloc] initWithIdentifier:v4];

  [(GCMotion *)v5 _setHasRotationRate:1];
  [(GCMotion *)v5 _setHasAttitude:0];

  return v5;
}

+ (void)physicalDevice:(id)a3 getLightWithReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gc_isInternalBuild())
  {
    v10 = getGCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "physicalDevice:%@ getLight", buf, 0xCu);
    }
  }
  v7 = [v5 lightServiceServer];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __70___GCSonyDualSenseControllerProfile_physicalDevice_getLightWithReply___block_invoke;
  v11[3] = &unk_26D22BEB0;
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 readLightWithReply:v11];
}

+ (void)physicalDevice:(id)a3 setLight:(id)a4
{
  id v5 = a4;
  id v17 = [a3 lightServiceServer];
  id v6 = [v5 color];
  [v6 red];
  int v8 = v7;
  id v9 = [v5 color];
  [v9 green];
  int v11 = v10;
  id v12 = [v5 color];

  [v12 blue];
  LODWORD(v14) = v13;
  LODWORD(v15) = v8;
  LODWORD(v16) = v11;
  [v17 updateLightWithRed:v15 green:v16 blue:v14];
}

+ (BOOL)physicalDeviceSupportsMotion:(id)a3
{
  return 1;
}

+ (void)physicalDevice:(id)a3 getSensorsEnabledWithReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gc_isInternalBuild())
  {
    int v10 = getGCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "physicalDevice:%@ getSensorsActive", buf, 0xCu);
    }
  }
  int v7 = [v5 motionServiceServer];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __79___GCSonyDualSenseControllerProfile_physicalDevice_getSensorsEnabledWithReply___block_invoke;
  v11[3] = &unk_26D22BED8;
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 readSensorsActiveWithReply:v11];
}

+ (void)physicalDevice:(id)a3 setSensorsActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 motionServiceServer];
  [v5 updateSensorsActive:v4];
}

+ (void)physicalDevice:(id)a3 getBatteryWithReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gc_isInternalBuild())
  {
    int v10 = getGCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "physicalDevice:%@ getBattery", buf, 0xCu);
    }
  }
  int v7 = [v5 batteryServiceServer];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __72___GCSonyDualSenseControllerProfile_physicalDevice_getBatteryWithReply___block_invoke;
  v11[3] = &unk_26D22BF00;
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 readBatteryWithReply:v11];
}

+ (void)physicalDevice:(id)a3 setAdaptiveTriggersPayload:(id)a4 forIndex:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = a4;
  if (gc_isInternalBuild())
  {
    v56 = getGCLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      int v57 = 138412802;
      id v58 = v7;
      __int16 v59 = 2112;
      id v60 = v8;
      __int16 v61 = 1024;
      int v62 = v5;
      _os_log_impl(&dword_220998000, v56, OS_LOG_TYPE_INFO, "physicalDevice:%@ setAdaptiveTriggersPayload:%@ forIndex: %d", (uint8_t *)&v57, 0x1Cu);
    }
  }
  id v9 = [v8 mode];
  uint64_t v10 = [v9 unsignedLongValue];

  switch(v10)
  {
    case 0:
      int v11 = [v7 adaptiveTriggersServiceServer];
      [v11 setAdaptiveTriggerModeOffForIndex:v5];
      goto LABEL_20;
    case 1:
      id v12 = [v8 strengths];
      unint64_t v13 = [v12 count];

      int v11 = [v7 adaptiveTriggersServiceServer];
      if (v13 >= 2)
      {
        double v14 = [v8 strengths];
        [v11 setAdaptiveTriggerModeFeedbackWithResistiveStrengths:v14 forIndex:v5];
        goto LABEL_19;
      }
      double v14 = [v8 startPosition];
      [v14 floatValue];
      int v44 = v43;
      id v17 = [v8 strengths];
      long long v20 = [v17 firstObject];
      [v20 floatValue];
      LODWORD(v46) = v45;
      LODWORD(v47) = v44;
      [v11 setAdaptiveTriggerModeFeedbackWithStartPosition:v5 resistiveStrength:v47 forIndex:v46];
      goto LABEL_17;
    case 2:
      int v11 = [v7 adaptiveTriggersServiceServer];
      double v14 = [v8 startPosition];
      [v14 floatValue];
      int v16 = v15;
      id v17 = [v8 endPosition];
      [v17 floatValue];
      int v19 = v18;
      long long v20 = [v8 strengths];
      char v21 = [v20 firstObject];
      [v21 floatValue];
      LODWORD(v23) = v22;
      LODWORD(v24) = v16;
      LODWORD(v25) = v19;
      [v11 setAdaptiveTriggerModeWeaponWithStartPosition:v5 endPosition:v24 resistiveStrength:v25 forIndex:v23];
      goto LABEL_16;
    case 3:
      v26 = [v8 amplitudes];
      unint64_t v27 = [v26 count];

      int v11 = [v7 adaptiveTriggersServiceServer];
      if (v27 < 2)
      {
        double v14 = [v8 startPosition];
        [v14 floatValue];
        int v49 = v48;
        id v17 = [v8 amplitudes];
        long long v20 = [v17 firstObject];
        [v20 floatValue];
        int v51 = v50;
        char v21 = [v8 frequency];
        [v21 floatValue];
        LODWORD(v53) = v52;
        LODWORD(v54) = v49;
        LODWORD(v55) = v51;
        [v11 setAdaptiveTriggerModeVibrationWithStartPosition:v5 amplitude:v54 frequency:v55 forIndex:v53];
LABEL_16:

LABEL_17:
      }
      else
      {
        double v14 = [v8 amplitudes];
        id v17 = [v8 frequency];
        [v17 floatValue];
        -[NSObject setAdaptiveTriggerModeVibrationWithAmplitudes:frequency:forIndex:](v11, "setAdaptiveTriggerModeVibrationWithAmplitudes:frequency:forIndex:", v14, v5);
      }

LABEL_19:
LABEL_20:

LABEL_21:
      return;
    case 4:
      v28 = [v8 strengths];
      uint64_t v29 = [v28 count];

      if (v29 != 2) {
        goto LABEL_21;
      }
      int v11 = [v7 adaptiveTriggersServiceServer];
      double v14 = [v8 startPosition];
      [v14 floatValue];
      int v31 = v30;
      id v17 = [v8 endPosition];
      [v17 floatValue];
      int v33 = v32;
      long long v20 = [v8 strengths];
      char v21 = [v20 objectAtIndexedSubscript:0];
      [v21 floatValue];
      int v35 = v34;
      v36 = [v8 strengths];
      v37 = [v36 objectAtIndexedSubscript:1];
      [v37 floatValue];
      LODWORD(v39) = v38;
      LODWORD(v40) = v31;
      LODWORD(v41) = v33;
      LODWORD(v42) = v35;
      [v11 setAdaptiveTriggerModeSlopeFeedbackWithStartPosition:v5 endPosition:v40 startStrength:v41 endStrength:v42 forIndex:v39];

      goto LABEL_16;
    default:
      if (!gc_isInternalBuild()) {
        goto LABEL_21;
      }
      int v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[_GCSonyDualSenseControllerProfile physicalDevice:setAdaptiveTriggersPayload:forIndex:](v11);
      }
      goto LABEL_20;
  }
}

+ (void)physicalDevice:(id)a3 getAdaptiveTriggersStatusesWithReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gc_isInternalBuild())
  {
    uint64_t v10 = getGCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "physicalDevice:%@ getAdaptiveTriggersStatuses", buf, 0xCu);
    }
  }
  id v7 = [v5 adaptiveTriggersServiceServer];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __89___GCSonyDualSenseControllerProfile_physicalDevice_getAdaptiveTriggersStatusesWithReply___block_invoke;
  v11[3] = &unk_26D22BF28;
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 readAdaptiveTriggerStatusWithReply:v11];
}

+ (id)physicalDeviceGetHapticCapabilities:(id)a3
{
  v3 = [[GCHapticActuator alloc] initWithLabel:@"Low Band" type:0 index:0];
  v7[0] = v3;
  BOOL v4 = [[GCHapticActuator alloc] initWithLabel:@"High Band" type:0 index:1];
  v7[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)physicalDeviceGetHapticCapabilityGraph:(id)a3
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = loadNSDictionaryFromJSON(v3, @"DualShockHapticCapabilityGraph");
  id v5 = [[GCHapticCapabilityGraph alloc] initWithJSONDictionaryRepresentation:v4];

  return v5;
}

+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3
{
  uint64_t v3 = [a3 serviceInfo];
  BOOL v4 = IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)[v3 service], @"PlayerLights");

  char v14 = 0;
  int v13 = 0;
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 objectForKey:@"LED"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t)[v6 count] >= 5
      && [v6 count])
    {
      unint64_t v7 = 0;
      do
      {
        id v8 = [v6 objectAtIndexedSubscript:v7];
        *((unsigned char *)&v13 + v7) = [v8 BOOLValue];

        ++v7;
      }
      while ([v6 count] > v7);
    }
  }
  int64_t v9 = 0;
  uint64_t v10 = &PlayerLightsConfig_0;
  while (v13 != *v10 || v14 != *((unsigned char *)v10 + 4))
  {
    ++v9;
    uint64_t v10 = (int *)((char *)v10 + 5);
    if (v9 == 9)
    {
      int64_t v9 = -1;
      break;
    }
  }

  return v9;
}

+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4
{
  int64_t v4 = a4 + 1;
  if ((unint64_t)(a4 + 1) <= 8)
  {
    id v5 = [a3 serviceInfo];
    id v6 = (__IOHIDServiceClient *)[v5 service];
    unint64_t v7 = (unsigned int *)((char *)&PlayerLightsConfig_0 + 5 * v4);
    uint64_t v8 = *((unsigned __int8 *)v7 + 4);
    uint64_t v9 = *v7;
    unint64_t v10 = v9 | (v8 << 32);
    int v19 = @"LED";
    int v11 = +[NSNumber numberWithBool:v9 & 1];
    id v12 = +[NSNumber numberWithBool:](&off_26D2B68C8, "numberWithBool:", (v10 >> 8) & 1, v11);
    v18[1] = v12;
    int v13 = +[NSNumber numberWithBool:(v10 >> 16) & 1];
    v18[2] = v13;
    char v14 = +[NSNumber numberWithBool:(v10 >> 24) & 1];
    v18[3] = v14;
    id v15 = +[NSNumber numberWithBool:v8 & 1];
    v18[4] = v15;
    int v16 = +[NSArray arrayWithObjects:v18 count:5];
    long long v20 = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

    IOHIDServiceClientSetProperty(v6, @"PlayerLights", v17);
  }
}

+ (void)physicalDevice:(os_log_t)log setAdaptiveTriggersPayload:forIndex:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_220998000, log, OS_LOG_TYPE_ERROR, "Error: Attempting to send an unrecognized adaptive trigger mode to the driver.", v1, 2u);
}

@end