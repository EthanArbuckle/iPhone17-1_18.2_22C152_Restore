@interface _GCMicrosoftXboxControllerProfile
+ (BOOL)physicalDeviceSupportsBattery:(id)a3;
+ (_GCPhysicalDeviceManager)deviceManager;
+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4;
+ (id)logicalDeviceControllerDetailedProductCategory:(id)a3;
+ (id)logicalDeviceControllerProductCategory:(id)a3;
+ (id)physicalDeviceGetHapticCapabilities:(id)a3;
+ (id)physicalDeviceGetHapticCapabilityGraph:(id)a3;
+ (int64_t)logicalDeviceDeterminePhysicalInputType:(id)a3;
+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3;
+ (void)deviceManager:(id)a3 prepareLogicalDevice:(id)a4;
+ (void)deviceManager:(id)a3 willPublishPhysicalDevice:(id)a4;
+ (void)physicalDevice:(id)a3 getBatteryWithReply:(id)a4;
+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4;
@end

@implementation _GCMicrosoftXboxControllerProfile

+ (_GCPhysicalDeviceManager)deviceManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50___GCMicrosoftXboxControllerProfile_deviceManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceManager_onceToken_2 != -1) {
    dispatch_once(&deviceManager_onceToken_2, block);
  }
  v2 = (void *)deviceManager_deviceManager_2;

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
  return @"Xbox One";
}

+ (id)logicalDeviceControllerDetailedProductCategory:(id)a3
{
  v3 = [a3 underlyingDevice];
  v4 = [v3 serviceInfo];
  v5 = [v4 numberPropertyForKey:@"ProductID"];
  int v6 = [v5 unsignedIntValue];

  if (v6 <= 2827)
  {
    if (v6 > 2817)
    {
      if (v6 != 2818 && v6 != 2821)
      {
LABEL_15:
        v7 = @"Xbox One";
        goto LABEL_16;
      }
    }
    else
    {
      if (v6 == 654)
      {
        v7 = @"Xbox 360";
        goto LABEL_16;
      }
      if (v6 != 2816) {
        goto LABEL_15;
      }
    }
LABEL_11:
    v7 = @"Xbox Elite";
    goto LABEL_16;
  }
  switch(v6)
  {
    case 2849:
      goto LABEL_14;
    case 2850:
    case 2852:
      goto LABEL_11;
    case 2851:
      goto LABEL_8;
    default:
      if ((v6 - 2834) < 2)
      {
LABEL_8:
        v7 = @"Xbox Series X";
        break;
      }
      if (v6 != 2828) {
        goto LABEL_15;
      }
LABEL_14:
      v7 = @"Xbox Adaptive";
      break;
  }
LABEL_16:

  return v7;
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  memset(v13, 0, sizeof(v13));
  GCExtendedGamepadInitInfoMake(v13);
  for (uint64_t i = 0; i != 1152; i += 72)
    *(_WORD *)((char *)v13 + i + 8) = 257;
  BYTE1(v14) = 0;
  BYTE9(v18) = 0;
  char v23 = 0;
  char v24 = 0;
  uint64_t v9 = [a1 logicalDeviceDeterminePhysicalInputType:v6];
  if (v9 == 3) {
    char v25 = 1;
  }
  v10 = [(GCExtendedGamepad *)[GCXboxGamepad alloc] initWithIdentifier:v7 info:v13];
  [(GCXboxGamepad *)v10 setType:v9];
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v13 + j);

  return v10;
}

+ (int64_t)logicalDeviceDeterminePhysicalInputType:(id)a3
{
  v3 = [a3 underlyingDevice];
  v4 = [v3 serviceInfo];
  v5 = [v4 numberPropertyForKey:@"ProductID"];
  int v6 = [v5 unsignedIntValue];

  uint64_t v7 = (v6 - 2818);
  if (v7 > 0x21) {
    goto LABEL_11;
  }
  if (((1 << (v6 - 2)) & 0x200030000) != 0)
  {
    if (!gc_isInternalBuild())
    {
      int64_t v8 = 3;
      goto LABEL_13;
    }
    v10 = getGCDLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "recognized series x controller", buf, 2u);
    }
    int64_t v8 = 3;
LABEL_26:

    goto LABEL_13;
  }
  if (((1 << (v6 - 2)) & 9) == 0)
  {
    if (v7 == 10)
    {
      if (!gc_isInternalBuild())
      {
        int64_t v8 = 2;
        goto LABEL_13;
      }
      v10 = getGCDLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        int64_t v8 = 2;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "recognized adaptive controller", v13, 2u);
      }
      else
      {
        int64_t v8 = 2;
      }
      goto LABEL_26;
    }
LABEL_11:
    if (!gc_isInternalBuild())
    {
      int64_t v8 = 0;
      goto LABEL_13;
    }
    v10 = getGCDLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "recognized standard controller", v11, 2u);
    }
    int64_t v8 = 0;
    goto LABEL_26;
  }
  if (gc_isInternalBuild())
  {
    v10 = getGCDLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "recognized elite controller", v14, 2u);
    }
    int64_t v8 = 1;
    goto LABEL_26;
  }
  int64_t v8 = 1;
LABEL_13:

  return v8;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v143 = a5;
  id v142 = a4;
  uint64_t v140 = [a1 logicalDeviceDeterminePhysicalInputType:a3];
  v139 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.xbox"];
  int64_t v8 = +[NSSet setWithObject:@"Button Home"];
  [v139 setAliases:v8];

  [v139 setLocalizedName:GCFLOC_XBOX_BUTTON_HOME];
  uint64_t v9 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"logo.xbox");
  [v139 setSymbol:v9];

  [v139 setEventPressedValueField:22];
  v138 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.menu"];
  v10 = +[NSSet setWithObject:@"Button Menu"];
  [v138 setAliases:v10];

  [v138 setLocalizedName:GCFLOC_XBOX_BUTTON_MENU];
  v11 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"line.horizontal.3.circle");
  [v138 setSymbol:v11];

  [v138 setEventPressedValueField:23];
  v137 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.view"];
  v12 = +[NSSet setWithObject:@"Button Options"];
  [v137 setAliases:v12];

  [v137 setLocalizedName:GCFLOC_XBOX_BUTTON_OPTIONS];
  v13 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"rectangle.fill.on.rectangle.fill.circle");
  [v137 setSymbol:v13];

  [v137 setEventPressedValueField:24];
  v144 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.a"];
  long long v14 = +[NSSet setWithObject:@"Button A"];
  [v144 setAliases:v14];

  [v144 setLocalizedName:GCFLOC_XBOX_BUTTON_A];
  long long v15 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
  [v144 setSymbol:v15];

  [v144 setEventPressedValueField:4];
  v152 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.b"];
  long long v16 = +[NSSet setWithObject:@"Button B"];
  [v152 setAliases:v16];

  [v152 setLocalizedName:GCFLOC_XBOX_BUTTON_B];
  long long v17 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
  [v152 setSymbol:v17];

  [v152 setEventPressedValueField:5];
  v151 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.x"];
  long long v18 = +[NSSet setWithObject:@"Button X"];
  [v151 setAliases:v18];

  [v151 setLocalizedName:GCFLOC_XBOX_BUTTON_X];
  long long v19 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"x.circle");
  [v151 setSymbol:v19];

  [v151 setEventPressedValueField:6];
  v150 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.y"];
  long long v20 = +[NSSet setWithObject:@"Button Y"];
  [v150 setAliases:v20];

  [v150 setLocalizedName:GCFLOC_XBOX_BUTTON_Y];
  long long v21 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"y.circle");
  [v150 setSymbol:v21];

  [v150 setEventPressedValueField:7];
  v149 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.left.bumper"];
  long long v22 = +[NSSet setWithObject:@"Left Shoulder"];
  [v149 setAliases:v22];

  [v149 setLocalizedName:GCFLOC_XBOX_LEFT_SHOULDER];
  char v23 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"lb.rectangle.roundedbottom");
  [v149 setSymbol:v23];

  [v149 setEventPressedValueField:8];
  v148 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.right.bumper"];
  char v24 = +[NSSet setWithObject:@"Right Shoulder"];
  [v148 setAliases:v24];

  [v148 setLocalizedName:GCFLOC_XBOX_RIGHT_SHOULDER];
  char v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"rb.rectangle.roundedbottom");
  [v148 setSymbol:v25];

  [v148 setEventPressedValueField:9];
  v147 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.left.trigger"];
  v26 = +[NSSet setWithObject:@"Left Trigger"];
  [v147 setAliases:v26];

  [v147 setLocalizedName:GCFLOC_XBOX_LEFT_TRIGGER];
  v27 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"lt.rectangle.roundedtop");
  [v147 setSymbol:v27];

  [v147 setAnalog:1];
  [v147 setEventPressedValueField:18];
  v146 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.right.trigger"];
  v28 = +[NSSet setWithObject:@"Right Trigger"];
  [v146 setAliases:v28];

  [v146 setLocalizedName:GCFLOC_XBOX_RIGHT_TRIGGER];
  v29 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"rt.rectangle.roundedtop");
  [v146 setSymbol:v29];

  [v146 setAnalog:1];
  [v146 setEventPressedValueField:19];
  v145 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
  v30 = +[NSSet setWithObject:@"Direction Pad"];
  [v145 setAliases:v30];

  [v145 setLocalizedName:GCFLOC_XBOX_DIRECTION_PAD];
  v31 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
  [v145 setSymbol:v31];

  [v145 setAnalog:0];
  [v145 setEventUpValueField:0];
  [v145 setEventDownValueField:1];
  [v145 setEventLeftValueField:2];
  [v145 setEventRightValueField:3];
  v32 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.left"];
  v33 = +[NSSet setWithObjects:@"Left Thumbstick", @"Left Thumbstick Button", 0];
  [v32 setAliases:v33];

  [v32 setLocalizedName:GCFLOC_XBOX_LEFT_THUMBSTICK];
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
  v168 = v38;
  v39 = +[NSArray arrayWithObjects:&v168 count:1];
  [v32 setXSources:v39];

  v40 = +[NSSet setWithObject:@"Left Thumbstick"];
  v41 = [v32 localizedName];
  v42 = [v32 symbol];
  v43 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v40, v41, v42, 5);
  v167 = v43;
  v44 = +[NSArray arrayWithObjects:&v167 count:1];
  [v32 setYSources:v44];

  v45 = +[NSSet setWithObject:@"Left Thumbstick"];
  v46 = [v32 localizedName];
  v47 = [v32 symbol];
  v48 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v45, v46, v47, 1);
  v166 = v48;
  v49 = +[NSArray arrayWithObjects:&v166 count:1];
  [v32 setUpSources:v49];

  v50 = +[NSSet setWithObject:@"Left Thumbstick"];
  v51 = [v32 localizedName];
  v52 = [v32 symbol];
  v53 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v50, v51, v52, 2);
  v165 = v53;
  v54 = +[NSArray arrayWithObjects:&v165 count:1];
  [v32 setRightSources:v54];

  v55 = +[NSSet setWithObject:@"Left Thumbstick"];
  v56 = [v32 localizedName];
  v57 = [v32 symbol];
  v58 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v55, v56, v57, 4);
  v164 = v58;
  v59 = +[NSArray arrayWithObjects:&v164 count:1];
  [v32 setDownSources:v59];

  v60 = +[NSSet setWithObject:@"Left Thumbstick"];
  v61 = [v32 localizedName];
  v62 = [v32 symbol];
  v63 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v60, v61, v62, 8);
  v163 = v63;
  v64 = +[NSArray arrayWithObjects:&v163 count:1];
  [v32 setLeftSources:v64];

  v65 = +[NSSet setWithObject:@"Left Thumbstick Button"];
  uint64_t v66 = GCFLOC_XBOX_BUTTON_LEFT_THUMBSTICK;
  v67 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick.press.down");
  v68 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v65, v66, v67);
  v162 = v68;
  v69 = +[NSArray arrayWithObjects:&v162 count:1];
  [v32 setPressedSources:v69];

  v70 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.right"];
  v71 = +[NSSet setWithObjects:@"Right Thumbstick", @"Right Thumbstick Button", 0];
  [v70 setAliases:v71];

  [v70 setLocalizedName:GCFLOC_XBOX_RIGHT_THUMBSTICK];
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
  v161 = v76;
  v77 = +[NSArray arrayWithObjects:&v161 count:1];
  [v70 setXSources:v77];

  v78 = +[NSSet setWithObject:@"Right Thumbstick"];
  v79 = [v70 localizedName];
  v80 = [v70 symbol];
  v81 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v78, v79, v80, 5);
  v160 = v81;
  v82 = +[NSArray arrayWithObjects:&v160 count:1];
  [v70 setYSources:v82];

  v83 = +[NSSet setWithObject:@"Right Thumbstick"];
  v84 = [v70 localizedName];
  v85 = [v70 symbol];
  v86 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v83, v84, v85, 1);
  v159 = v86;
  v87 = +[NSArray arrayWithObjects:&v159 count:1];
  [v70 setUpSources:v87];

  v88 = +[NSSet setWithObject:@"Right Thumbstick"];
  v89 = [v70 localizedName];
  v90 = [v70 symbol];
  v91 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v88, v89, v90, 2);
  v158 = v91;
  v92 = +[NSArray arrayWithObjects:&v158 count:1];
  [v70 setRightSources:v92];

  v93 = +[NSSet setWithObject:@"Right Thumbstick"];
  v94 = [v70 localizedName];
  v95 = [v70 symbol];
  v96 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v93, v94, v95, 4);
  v157 = v96;
  v97 = +[NSArray arrayWithObjects:&v157 count:1];
  [v70 setDownSources:v97];

  v98 = +[NSSet setWithObject:@"Right Thumbstick"];
  v99 = [v70 localizedName];
  v100 = [v70 symbol];
  v101 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v98, v99, v100, 8);
  v156 = v101;
  v102 = +[NSArray arrayWithObjects:&v156 count:1];
  [v70 setLeftSources:v102];

  v103 = v144;
  v104 = v137;

  v105 = +[NSSet setWithObject:@"Right Thumbstick Button"];
  uint64_t v106 = GCFLOC_XBOX_BUTTON_RIGHT_THUMBSTICK;
  v107 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick.press.down");
  v108 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v105, v106, v107);
  v155 = v108;
  v109 = +[NSArray arrayWithObjects:&v155 count:1];
  [v70 setPressedSources:v109];

  v110 = v138;
  v111 = v139;
  v112 = objc_opt_new();
  v154[0] = v139;
  v154[1] = v138;
  v154[2] = v137;
  v154[3] = v144;
  v154[4] = v152;
  v154[5] = v151;
  v154[6] = v150;
  v154[7] = v149;
  v154[8] = v148;
  v154[9] = v147;
  v154[10] = v146;
  v154[11] = v145;
  v136 = v32;
  v154[12] = v32;
  v154[13] = v70;
  v113 = +[NSArray arrayWithObjects:v154 count:14];
  [v112 setElements:v113];

  if (v140 == 3)
  {
    v129 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.share"];
    v130 = +[NSSet setWithObject:@"Button Share"];
    [v129 setAliases:v130];

    [v129 setLocalizedName:GCFLOC_BUTTON_SHARE];
    v131 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"square.and.arrow.up");
    [v129 setSymbol:v131];

    [v129 setEventPressedValueField:40];
    v117 = [v112 elements];
    v120 = [v117 arrayByAddingObject:v129];
    [v112 setElements:v120];
  }
  else
  {
    if (v140 != 1) {
      goto LABEL_6;
    }
    v141 = v112;
    v114 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.paddle.1"];
    v115 = +[NSSet setWithObject:@"Paddle 1"];
    [v114 setAliases:v115];

    v135 = v114;
    [v114 setLocalizedName:GCFLOC_XBOX_BUTTON_PADDLE_1];
    v116 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"1.circle");
    [v114 setSymbol:v116];

    [v114 setEventPressedValueField:25];
    v117 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.paddle.2"];
    v118 = +[NSSet setWithObject:@"Paddle 2"];
    [v117 setAliases:v118];

    [v117 setLocalizedName:GCFLOC_XBOX_BUTTON_PADDLE_2];
    v119 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"2.circle");
    [v117 setSymbol:v119];

    [v117 setEventPressedValueField:26];
    v120 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.paddle.3"];
    v121 = +[NSSet setWithObject:@"Paddle 3"];
    [v120 setAliases:v121];

    [v120 setLocalizedName:GCFLOC_XBOX_BUTTON_PADDLE_3];
    v122 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"3.circle");
    [v120 setSymbol:v122];

    [v120 setEventPressedValueField:27];
    v123 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.paddle.4"];
    v124 = +[NSSet setWithObject:@"Paddle 4"];
    [v123 setAliases:v124];

    [v123 setLocalizedName:GCFLOC_XBOX_BUTTON_PADDLE_4];
    v125 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"4.circle");
    [v123 setSymbol:v125];

    [v123 setEventPressedValueField:28];
    v126 = [v141 elements];
    v153[0] = v135;
    v153[1] = v117;
    v153[2] = v120;
    v153[3] = v123;
    v127 = +[NSArray arrayWithObjects:v153 count:4];
    v128 = [v126 arrayByAddingObjectsFromArray:v127];
    [v141 setElements:v128];

    v129 = v135;
    v111 = v139;
    v110 = v138;
    v104 = v137;
    v103 = v144;

    v112 = v141;
  }

LABEL_6:
  v132 = v112;
  v133 = [[_GCControllerInputComponentDescription alloc] initWithIdentifier:v142 controllerInputs:v112 bindings:v143];

  return v133;
}

+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3
{
  v3 = [a3 serviceInfo];
  v4 = IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)[v3 service], @"LEDMode");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 unsignedIntValue];
    if ((v5 - 6) >= 4) {
      int64_t v6 = -1;
    }
    else {
      int64_t v6 = (v5 - 6);
    }
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4
{
  if ((unint64_t)a4 >= 4) {
    unsigned __int8 v4 = 6;
  }
  else {
    unsigned __int8 v4 = a4 + 6;
  }
  id v5 = [a3 serviceInfo];
  IOHIDServiceClientSetProperty((IOHIDServiceClientRef)[v5 service], @"LEDMode", +[NSNumber numberWithUnsignedChar:](&off_26D2B68C8, "numberWithUnsignedChar:", v4));
}

+ (BOOL)physicalDeviceSupportsBattery:(id)a3
{
  v3 = [a3 serviceInfo];
  unsigned __int8 v4 = [v3 numberPropertyForKey:@"ProductID"];
  int v5 = [v4 unsignedIntValue];

  return v5 != 654;
}

+ (void)physicalDevice:(id)a3 getBatteryWithReply:(id)a4
{
  id v5 = a4;
  int64_t v6 = [a3 batteryServiceServer];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __72___GCMicrosoftXboxControllerProfile_physicalDevice_getBatteryWithReply___block_invoke;
  v8[3] = &unk_26D22B848;
  id v9 = v5;
  id v7 = v5;
  [v6 readBatteryWithReply:v8];
}

+ (id)physicalDeviceGetHapticCapabilities:(id)a3
{
  v3 = [a3 serviceInfo];
  unsigned __int8 v4 = [v3 numberPropertyForKey:@"ProductID"];
  int v5 = [v4 unsignedIntValue];

  int64_t v6 = [v3 stringPropertyForKey:@"Product"];
  if (([v6 containsString:@"8BitDo M30"] & 1) != 0 || v5 == 2828)
  {
    id v9 = &__NSArray0__struct;
  }
  else
  {
    if (v5 == 654)
    {
      id v7 = [[GCHapticActuator alloc] initWithLabel:@"Low Band" type:0 index:0];
      v14[0] = v7;
      int64_t v8 = [[GCHapticActuator alloc] initWithLabel:@"High Band" type:0 index:1];
      v14[1] = v8;
      id v9 = +[NSArray arrayWithObjects:v14 count:2];
    }
    else
    {
      id v7 = [[GCHapticActuator alloc] initWithLabel:@"Low Band" type:0 index:0];
      v13[0] = v7;
      int64_t v8 = [[GCHapticActuator alloc] initWithLabel:@"High Band" type:0 index:1];
      v13[1] = v8;
      v10 = [[GCHapticActuator alloc] initWithLabel:@"Left Trigger" type:0 index:2];
      v13[2] = v10;
      v11 = [[GCHapticActuator alloc] initWithLabel:@"Right Trigger" type:0 index:3];
      v13[3] = v11;
      id v9 = +[NSArray arrayWithObjects:v13 count:4];
    }
  }

  return v9;
}

+ (id)physicalDeviceGetHapticCapabilityGraph:(id)a3
{
  v3 = [a3 serviceInfo];
  unsigned __int8 v4 = [v3 numberPropertyForKey:@"ProductID"];
  int v5 = [v4 unsignedIntValue];

  uint64_t v6 = objc_opt_class();
  if (v5 == 654) {
    id v7 = @"Xbox360HapticCapabilityGraph";
  }
  else {
    id v7 = @"XboxHapticCapabilityGraph";
  }
  int64_t v8 = loadNSDictionaryFromJSON(v6, v7);
  id v9 = [[GCHapticCapabilityGraph alloc] initWithJSONDictionaryRepresentation:v8];

  return v9;
}

@end