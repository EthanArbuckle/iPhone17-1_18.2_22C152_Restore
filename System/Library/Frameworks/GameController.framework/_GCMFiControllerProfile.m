@interface _GCMFiControllerProfile
+ (BOOL)match:(id)a3;
+ (BOOL)physicalDeviceUsesACHomeForMenu:(id)a3;
+ (_GCPhysicalDeviceManager)deviceManager;
+ (id)identifier;
+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5;
+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4;
+ (id)logicalDeviceControllerProductCategory:(id)a3;
+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3;
+ (void)determineCapabilitiesWithServiceInfo:(id)a3 initInfo:(id *)a4;
+ (void)deviceManager:(id)a3 prepareLogicalDevice:(id)a4;
+ (void)deviceManager:(id)a3 willPublishPhysicalDevice:(id)a4;
+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4;
+ (void)populateInitInfo:(id *)a3 forLogicalDevice:(id)a4;
@end

@implementation _GCMFiControllerProfile

+ (_GCPhysicalDeviceManager)deviceManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __40___GCMFiControllerProfile_deviceManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceManager_onceToken_0 != -1) {
    dispatch_once(&deviceManager_onceToken_0, block);
  }
  v2 = (void *)deviceManager_deviceManager_0;

  return (_GCPhysicalDeviceManager *)v2;
}

+ (id)identifier
{
  return @"MfiControllerProfile";
}

+ (BOOL)match:(id)a3
{
  id v3 = a3;
  v4 = objc_getAssociatedObject(v3, "MFiControllerCapabilities");
  if (v4
    || (v4 = -[_GCMFiControllerCapabilites initWithServiceInfo:]((char *)[_GCMFiControllerCapabilites alloc], v3)) != 0)
  {
    BOOL v5 = -[_GCMFiControllerCapabilites isExtendedGamepad]((uint64_t)v4);
    int v6 = -[_GCMFiControllerCapabilites isStandardGamepad]((uint64_t)v4);
    int v7 = v6;
    if (v5 || v6)
    {
      v9 = [v3 numberPropertyForKey:@"Authenticated"];
      if (v9
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v9 BOOLValue] & 1) != 0
        || (isDeviceParentAuthenticated((__IOHIDServiceClient *)[v3 service]) & 1) != 0)
      {

        objc_setAssociatedObject(v3, "MFiControllerCapabilities", v4, (void *)0x301);
        if (!gc_isInternalBuild())
        {
          BOOL v8 = 1;
          goto LABEL_18;
        }
        v9 = getGCLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v13 = " ?";
          if (v7) {
            v13 = " standard";
          }
          if (v5) {
            v14 = " extended";
          }
          else {
            v14 = v13;
          }
          v15 = [v3 name];
          int v20 = 136316162;
          v21 = " authenticated";
          __int16 v22 = 2080;
          v23 = v14;
          __int16 v24 = 2112;
          id v25 = v3;
          __int16 v26 = 2112;
          v27 = v15;
          __int16 v28 = 2114;
          v29 = v4;
          _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "Matched%s%s MFi game controller %@ '%@' %{public}@", (uint8_t *)&v20, 0x34u);
        }
        BOOL v8 = 1;
      }
      else
      {
        if (GCBypassMFiAuthentication())
        {
          v10 = [v3 stringPropertyForKey:@"Product"];
          if (gc_isInternalBuild())
          {
            v18 = getGCLogger();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = v10;
              if (!v10)
              {
                v19 = [v3 registryID];
              }
              int v20 = 138412290;
              v21 = v19;
              _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_INFO, "Service MFi authenticated bypassed for: %@", (uint8_t *)&v20, 0xCu);
              if (!v10) {
            }
              }
          }
        }
        v11 = [v3 stringPropertyForKey:@"Product"];
        if (gc_isInternalBuild())
        {
          v16 = getGCLogger();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = v11;
            if (!v11)
            {
              v17 = [v3 registryID];
            }
            int v20 = 138412290;
            v21 = v17;
            _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_INFO, "Service is NOT MFi authenticated: %@", (uint8_t *)&v20, 0xCu);
            if (!v11) {
          }
            }
        }

        BOOL v8 = 0;
      }

      goto LABEL_18;
    }
  }
  BOOL v8 = 0;
LABEL_18:

  return v8;
}

+ (void)deviceManager:(id)a3 willPublishPhysicalDevice:(id)a4
{
}

+ (void)deviceManager:(id)a3 prepareLogicalDevice:(id)a4
{
}

+ (BOOL)physicalDeviceUsesACHomeForMenu:(id)a3
{
  id v3 = [a3 serviceInfo];
  v4 = -[GCHIDServiceInfo mfiControllerCapabilities](v3);

  BOOL v5 = (-[_GCMFiControllerCapabilites home]((uint64_t)v4) & 1) != 0
    && (-[_GCMFiControllerCapabilites menu]((uint64_t)v4) & 1) == 0;

  return v5;
}

+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3
{
  return -1;
}

+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4
{
  BOOL v5 = [a3 serviceInfo];
  int v6 = (const void *)[v5 service];

  if (v6)
  {
    GC_IOHIDSetLEDs(v6, a4);
  }
}

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return @"MFi";
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(v10, 0, 512);
  GCExtendedGamepadInitInfoMake(v10);
  +[_GCMFiControllerProfile populateInitInfo:v10 forLogicalDevice:v5];
  int v7 = [[GCExtendedGamepad alloc] initWithIdentifier:v6 info:v10];
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v10 + i);

  return v7;
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 underlyingDevice];
  v10 = [v9 serviceInfo];
  v11 = -[GCHIDServiceInfo mfiControllerCapabilities](v10);

  if (-[_GCMFiControllerCapabilites isExtendedGamepad]((uint64_t)v11))
  {
    v12 = 0;
    goto LABEL_54;
  }
  v13 = objc_opt_new();
  if (-[_GCMFiControllerCapabilites a]((uint64_t)v11))
  {
    v14 = [GCDeviceButtonInputDescription alloc];
    v15 = +[NSSet set];
    v16 = [GCFLOC_BUTTON_A key];
    v17 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v14, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Button A", v15, 2, v16, @"a.circle", (-[_GCMFiControllerCapabilites a]((uint64_t)v11) >> 8) & 1, 4);
    [v13 addObject:v17];
  }
  if (-[_GCMFiControllerCapabilites b]((uint64_t)v11))
  {
    v18 = [GCDeviceButtonInputDescription alloc];
    v19 = +[NSSet set];
    int v20 = [GCFLOC_BUTTON_B key];
    v21 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v18, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Button B", v19, 2, v20, @"b.circle", (-[_GCMFiControllerCapabilites b]((uint64_t)v11) >> 8) & 1, 5);
    [v13 addObject:v21];
  }
  if (-[_GCMFiControllerCapabilites x]((uint64_t)v11))
  {
    __int16 v22 = [GCDeviceButtonInputDescription alloc];
    v23 = +[NSSet set];
    __int16 v24 = [GCFLOC_BUTTON_X key];
    id v25 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v22, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Button X", v23, 2, v24, @"x.circle", (-[_GCMFiControllerCapabilites x]((uint64_t)v11) >> 8) & 1, 6);
    [v13 addObject:v25];
  }
  if (-[_GCMFiControllerCapabilites y]((uint64_t)v11))
  {
    __int16 v26 = [GCDeviceButtonInputDescription alloc];
    v27 = +[NSSet set];
    __int16 v28 = [GCFLOC_BUTTON_Y key];
    v29 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v26, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Button Y", v27, 2, v28, @"y.circle", (-[_GCMFiControllerCapabilites y]((uint64_t)v11) >> 8) & 1, 7);
    [v13 addObject:v29];
  }
  if (-[_GCMFiControllerCapabilites l1]((uint64_t)v11))
  {
    v30 = [GCDeviceButtonInputDescription alloc];
    v31 = +[NSSet set];
    v32 = [GCFLOC_LEFT_SHOULDER key];
    v33 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v30, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Left Shoulder", v31, 2, v32, @"l1.rectangle.roundedbottom", (-[_GCMFiControllerCapabilites l1]((uint64_t)v11) >> 8) & 1, 8);
    [v13 addObject:v33];
  }
  if (-[_GCMFiControllerCapabilites r1]((uint64_t)v11))
  {
    v34 = [GCDeviceButtonInputDescription alloc];
    v35 = +[NSSet set];
    v36 = [GCFLOC_RIGHT_SHOULDER key];
    v37 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v34, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Right Shoulder", v35, 2, v36, @"r1.rectangle.roundedbottom", (-[_GCMFiControllerCapabilites r1]((uint64_t)v11) >> 8) & 1, 9);
    [v13 addObject:v37];
  }
  if (-[_GCMFiControllerCapabilites l2]((uint64_t)v11))
  {
    v38 = [GCDeviceButtonInputDescription alloc];
    v39 = +[NSSet set];
    v40 = [GCFLOC_LEFT_TRIGGER key];
    v41 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v38, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Left Trigger", v39, 2, v40, @"l2.rectangle.roundedtop", (-[_GCMFiControllerCapabilites l2]((uint64_t)v11) >> 8) & 1, 18);
    [v13 addObject:v41];
  }
  if (-[_GCMFiControllerCapabilites r2]((uint64_t)v11))
  {
    v42 = [GCDeviceButtonInputDescription alloc];
    v43 = +[NSSet set];
    v44 = [GCFLOC_RIGHT_TRIGGER key];
    v45 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v42, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Right Trigger", v43, 2, v44, @"r2.rectangle.roundedtop", (-[_GCMFiControllerCapabilites r2]((uint64_t)v11) >> 8) & 1, 19);
    [v13 addObject:v45];
  }
  if (-[_GCMFiControllerCapabilites l3]((uint64_t)v11))
  {
    v46 = [GCDeviceButtonInputDescription alloc];
    v47 = +[NSSet set];
    v48 = [GCFLOC_BUTTON_LEFT_THUMBSTICK key];
    v49 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v46, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Left Thumbstick Button", v47, 2, v48, @"l.joystick.press.down", (-[_GCMFiControllerCapabilites l3]((uint64_t)v11) >> 8) & 1, 20);
    [v13 addObject:v49];
  }
  if (-[_GCMFiControllerCapabilites r3]((uint64_t)v11))
  {
    v50 = [GCDeviceButtonInputDescription alloc];
    v51 = +[NSSet set];
    v52 = [GCFLOC_BUTTON_RIGHT_THUMBSTICK key];
    v53 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v50, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Right Thumbstick Button", v51, 2, v52, @"r.joystick.press.down", (-[_GCMFiControllerCapabilites r3]((uint64_t)v11) >> 8) & 1, 21);
    [v13 addObject:v53];
  }
  if (-[_GCMFiControllerCapabilites l4]((uint64_t)v11))
  {
    v54 = [GCDeviceButtonInputDescription alloc];
    v55 = +[NSSet set];
    v56 = [GCFLOC_BUTTON_L4 key];
    v57 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v54, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Left Bumper", v55, 2, v56, @"l4.button.horizontal", (-[_GCMFiControllerCapabilites l4]((uint64_t)v11) >> 8) & 1, 41);
    [v13 addObject:v57];
  }
  if (-[_GCMFiControllerCapabilites r4]((uint64_t)v11))
  {
    v58 = [GCDeviceButtonInputDescription alloc];
    v59 = +[NSSet set];
    v60 = [GCFLOC_BUTTON_R4 key];
    v61 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v58, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Right Bumper", v59, 2, v60, @"r4.button.horizontal", (-[_GCMFiControllerCapabilites r4]((uint64_t)v11) >> 8) & 1, 42);
    [v13 addObject:v61];
  }
  if (-[_GCMFiControllerCapabilites m1]((uint64_t)v11))
  {
    v62 = [GCDeviceButtonInputDescription alloc];
    v63 = +[NSSet setWithObject:@"Paddle 1"];
    v64 = [GCFLOC_BUTTON_M1 key];
    v65 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v62, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Back Right Button 0", v63, 2, v64, @"m1.button.horizontal", (-[_GCMFiControllerCapabilites m1]((uint64_t)v11) >> 8) & 1, 45);
    [v13 addObject:v65];
  }
  if (-[_GCMFiControllerCapabilites m2]((uint64_t)v11))
  {
    v66 = [GCDeviceButtonInputDescription alloc];
    v67 = +[NSSet setWithObject:@"Paddle 3"];
    v68 = [GCFLOC_BUTTON_M2 key];
    v69 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v66, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Back Left Button 0", v67, 2, v68, @"m2.button.horizontal", (-[_GCMFiControllerCapabilites m2]((uint64_t)v11) >> 8) & 1, 43);
    [v13 addObject:v69];
  }
  if (-[_GCMFiControllerCapabilites m3]((uint64_t)v11))
  {
    v70 = [GCDeviceButtonInputDescription alloc];
    v71 = +[NSSet setWithObject:@"Paddle 2"];
    v72 = [GCFLOC_BUTTON_M3 key];
    v73 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v70, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Back Right Button 1", v71, 2, v72, @"m3.button.horizontal", (-[_GCMFiControllerCapabilites m3]((uint64_t)v11) >> 8) & 1, 46);
    [v13 addObject:v73];
  }
  if (-[_GCMFiControllerCapabilites m4]((uint64_t)v11))
  {
    v74 = [GCDeviceButtonInputDescription alloc];
    v75 = +[NSSet setWithObject:@"Paddle 4"];
    v76 = [GCFLOC_BUTTON_M4 key];
    v77 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v74, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Back Left Button 1", v75, 2, v76, @"m4.button.horizontal", (-[_GCMFiControllerCapabilites m4]((uint64_t)v11) >> 8) & 1, 44);
    [v13 addObject:v77];
  }
  if ((-[_GCMFiControllerCapabilites home]((uint64_t)v11) & 1) != 0
    && (-[_GCMFiControllerCapabilites menu]((uint64_t)v11) & 1) != 0)
  {
    v78 = [GCDeviceButtonInputDescription alloc];
    v79 = +[NSSet set];
    v80 = [GCFLOC_BUTTON_HOME key];
    v81 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v78, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Button Home", v79, 49152, v80, @"house.circle", (-[_GCMFiControllerCapabilites home]((uint64_t)v11) >> 8) & 1, 22);
    [v13 addObject:v81];
  }
  else if ((-[_GCMFiControllerCapabilites home]((uint64_t)v11) & 1) == 0)
  {
    goto LABEL_41;
  }
  v82 = [GCDeviceButtonInputDescription alloc];
  v83 = +[NSSet set];
  v84 = [GCFLOC_BUTTON_MENU key];
  v85 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v82, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Button Menu", v83, 0x4000, v84, @"line.horizontal.3.circle", (-[_GCMFiControllerCapabilites menu]((uint64_t)v11) >> 8) & 1, 23);
  [v13 addObject:v85];

LABEL_41:
  if (-[_GCMFiControllerCapabilites options]((uint64_t)v11))
  {
    v86 = [GCDeviceButtonInputDescription alloc];
    v87 = +[NSSet set];
    v88 = [GCFLOC_BUTTON_OPTIONS key];
    v89 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v86, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Button Options", v87, 49152, v88, @"ellipsis.circle", (-[_GCMFiControllerCapabilites options]((uint64_t)v11) >> 8) & 1, 24);
    [v13 addObject:v89];
  }
  if (-[_GCMFiControllerCapabilites record]((uint64_t)v11))
  {
    v90 = [GCDeviceButtonInputDescription alloc];
    v91 = +[NSSet set];
    v92 = [GCFLOC_BUTTON_SHARE key];
    v93 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v90, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", @"Button Share", v91, 49152, v92, @"square.and.arrow.up", (-[_GCMFiControllerCapabilites record]((uint64_t)v11) >> 8) & 1, 40);
    [v13 addObject:v93];
  }
  if (-[_GCMFiControllerCapabilites dpad]((uint64_t)v11))
  {
    v94 = [GCDeviceDirectionPadDescription alloc];
    v95 = +[NSSet set];
    v96 = [GCFLOC_DIRECTION_PAD key];
    v97 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:](v94, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", @"Direction Pad", v95, 2, v96, @"dpad", (-[_GCMFiControllerCapabilites dpad]((uint64_t)v11) >> 8) & 1, 0, 1, 2, 3);
    [v13 addObject:v97];
  }
  if (-[_GCMFiControllerCapabilites leftThumbstick]((uint64_t)v11))
  {
    v98 = [GCDeviceDirectionPadDescription alloc];
    v99 = +[NSSet set];
    v100 = [GCFLOC_LEFT_THUMBSTICK key];
    v101 = [(GCDeviceDirectionPadDescription *)v98 initWithName:@"Left Thumbstick" additionalAliases:v99 attributes:2 nameLocalizationKey:v100 symbolName:@"l.joystick" sourceAttributes:0 sourceUpExtendedEventField:10 sourceDownExtendedEventField:11 sourceLeftExtendedEventField:12 sourceRightExtendedEventField:13];
    [v13 addObject:v101];
  }
  if (-[_GCMFiControllerCapabilites rightThumbstick]((uint64_t)v11))
  {
    v102 = [GCDeviceDirectionPadDescription alloc];
    v103 = +[NSSet set];
    v104 = [GCFLOC_RIGHT_THUMBSTICK key];
    v105 = [(GCDeviceDirectionPadDescription *)v102 initWithName:@"Right Thumbstick" additionalAliases:v103 attributes:2 nameLocalizationKey:v104 symbolName:@"r.joystick" sourceAttributes:0 sourceUpExtendedEventField:14 sourceDownExtendedEventField:15 sourceLeftExtendedEventField:16 sourceRightExtendedEventField:17];
    [v13 addObject:v105];
  }
  BOOL v106 = -[_GCMFiControllerCapabilites isExtendedGamepad]((uint64_t)v11);
  v107 = &classRef__GCDeviceExtendedGamepadComponentDescription;
  if (!v106) {
    v107 = &classRef__GCDeviceGamepadComponentDescription;
  }
  v12 = (void *)[objc_alloc(*v107) initWithIdentifier:v7 elements:v13 bindings:v8];

LABEL_54:

  return v12;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v158 = a5;
  id v7 = a4;
  id v8 = [a3 underlyingDevice];
  v9 = [v8 serviceInfo];
  v10 = -[GCHIDServiceInfo mfiControllerCapabilities](v9);

  v11 = objc_opt_new();
  if ((-[_GCMFiControllerCapabilites home]((uint64_t)v10) & 1) != 0
    && (-[_GCMFiControllerCapabilites menu]((uint64_t)v10) & 1) != 0)
  {
    v12 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.home"];
    v15 = +[NSSet setWithObject:@"Button Home"];
    [v12 setAliases:v15];

    [v12 setLocalizedName:GCFLOC_BUTTON_HOME];
    v16 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"house.circle");
    [v12 setSymbol:v16];

    [v12 setAnalog:(-[_GCMFiControllerCapabilites home]((uint64_t)v10) & 0x100) == 0];
    [v12 setEventPressedValueField:22];
    v17 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.menu"];
    v18 = +[NSSet setWithObject:@"Button Menu"];
    [v17 setAliases:v18];

    [v17 setLocalizedName:GCFLOC_BUTTON_MENU];
    v19 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"line.horizontal.3.circle");
    [v17 setSymbol:v19];

    [v17 setAnalog:(-[_GCMFiControllerCapabilites menu]((uint64_t)v10) & 0x100) == 0];
    [v17 setEventPressedValueField:23];
    [v11 addObject:v17];
    [v11 addObject:v12];
  }
  else
  {
    if ((-[_GCMFiControllerCapabilites home]((uint64_t)v10) & 1) == 0) {
      goto LABEL_7;
    }
    v12 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.menu"];
    v13 = +[NSSet setWithObject:@"Button Menu"];
    [v12 setAliases:v13];

    [v12 setLocalizedName:GCFLOC_BUTTON_MENU];
    v14 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"line.horizontal.3.circle");
    [v12 setSymbol:v14];

    [v12 setAnalog:(-[_GCMFiControllerCapabilites home]((uint64_t)v10) & 0x100) == 0];
    [v12 setEventPressedValueField:22];
    [v11 addObject:v12];
  }

LABEL_7:
  if (-[_GCMFiControllerCapabilites options]((uint64_t)v10))
  {
    int v20 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.options"];
    v21 = +[NSSet setWithObject:@"Button Options"];
    [v20 setAliases:v21];

    [v20 setLocalizedName:GCFLOC_BUTTON_OPTIONS];
    __int16 v22 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"ellipsis.circle");
    [v20 setSymbol:v22];

    [v20 setAnalog:(-[_GCMFiControllerCapabilites options]((uint64_t)v10) & 0x100) == 0];
    [v20 setEventPressedValueField:24];
    [v11 addObject:v20];
  }
  if (-[_GCMFiControllerCapabilites record]((uint64_t)v10))
  {
    v23 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.share"];
    __int16 v24 = +[NSSet setWithObject:@"Button Share"];
    [v23 setAliases:v24];

    [v23 setLocalizedName:GCFLOC_BUTTON_SHARE];
    id v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"square.and.arrow.up");
    [v23 setSymbol:v25];

    [v23 setEventPressedValueField:40];
    [v11 addObject:v23];
  }
  if (-[_GCMFiControllerCapabilites a]((uint64_t)v10))
  {
    __int16 v26 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.a"];
    v27 = +[NSSet setWithObject:@"Button A"];
    [v26 setAliases:v27];

    [v26 setLocalizedName:GCFLOC_BUTTON_A];
    __int16 v28 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
    [v26 setSymbol:v28];

    [v26 setAnalog:(-[_GCMFiControllerCapabilites a]((uint64_t)v10) & 0x100) == 0];
    [v26 setEventPressedValueField:4];
    [v11 addObject:v26];
  }
  if (-[_GCMFiControllerCapabilites b]((uint64_t)v10))
  {
    v29 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.b"];
    v30 = +[NSSet setWithObject:@"Button B"];
    [v29 setAliases:v30];

    [v29 setLocalizedName:GCFLOC_BUTTON_B];
    v31 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
    [v29 setSymbol:v31];

    [v29 setAnalog:(-[_GCMFiControllerCapabilites b]((uint64_t)v10) & 0x100) == 0];
    [v29 setEventPressedValueField:5];
    [v11 addObject:v29];
  }
  if (-[_GCMFiControllerCapabilites x]((uint64_t)v10))
  {
    v32 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.x"];
    v33 = +[NSSet setWithObject:@"Button X"];
    [v32 setAliases:v33];

    [v32 setLocalizedName:GCFLOC_BUTTON_X];
    v34 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"x.circle");
    [v32 setSymbol:v34];

    [v32 setAnalog:(-[_GCMFiControllerCapabilites x]((uint64_t)v10) & 0x100) == 0];
    [v32 setEventPressedValueField:6];
    [v11 addObject:v32];
  }
  if (-[_GCMFiControllerCapabilites y]((uint64_t)v10))
  {
    v35 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.y"];
    v36 = +[NSSet setWithObject:@"Button Y"];
    [v35 setAliases:v36];

    [v35 setLocalizedName:GCFLOC_BUTTON_Y];
    v37 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"y.circle");
    [v35 setSymbol:v37];

    [v35 setAnalog:(-[_GCMFiControllerCapabilites y]((uint64_t)v10) & 0x100) == 0];
    [v35 setEventPressedValueField:7];
    [v11 addObject:v35];
  }
  if (-[_GCMFiControllerCapabilites l1]((uint64_t)v10))
  {
    v38 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.left.shoulder"];
    v39 = +[NSSet setWithObject:@"Left Shoulder"];
    [v38 setAliases:v39];

    [v38 setLocalizedName:GCFLOC_LEFT_SHOULDER];
    v40 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l1.rectangle.roundedbottom");
    [v38 setSymbol:v40];

    [v38 setAnalog:(-[_GCMFiControllerCapabilites l1]((uint64_t)v10) & 0x100) == 0];
    [v38 setEventPressedValueField:8];
    [v11 addObject:v38];
  }
  if (-[_GCMFiControllerCapabilites r1]((uint64_t)v10))
  {
    v41 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.right.shoulder"];
    v42 = +[NSSet setWithObject:@"Right Shoulder"];
    [v41 setAliases:v42];

    [v41 setLocalizedName:GCFLOC_RIGHT_SHOULDER];
    v43 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r1.rectangle.roundedbottom");
    [v41 setSymbol:v43];

    [v41 setAnalog:(-[_GCMFiControllerCapabilites r1]((uint64_t)v10) & 0x100) == 0];
    [v41 setEventPressedValueField:9];
    [v11 addObject:v41];
  }
  if (-[_GCMFiControllerCapabilites l2]((uint64_t)v10))
  {
    v44 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.left.trigger"];
    v45 = +[NSSet setWithObject:@"Left Trigger"];
    [v44 setAliases:v45];

    [v44 setLocalizedName:GCFLOC_LEFT_TRIGGER];
    v46 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l2.rectangle.roundedtop");
    [v44 setSymbol:v46];

    [v44 setAnalog:(-[_GCMFiControllerCapabilites l2]((uint64_t)v10) & 0x100) == 0];
    [v44 setEventPressedValueField:18];
    [v11 addObject:v44];
  }
  if (-[_GCMFiControllerCapabilites r2]((uint64_t)v10))
  {
    v47 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.right.trigger"];
    v48 = +[NSSet setWithObject:@"Right Trigger"];
    [v47 setAliases:v48];

    [v47 setLocalizedName:GCFLOC_RIGHT_TRIGGER];
    v49 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r2.rectangle.roundedtop");
    [v47 setSymbol:v49];

    [v47 setAnalog:(-[_GCMFiControllerCapabilites r2]((uint64_t)v10) & 0x100) == 0];
    [v47 setEventPressedValueField:19];
    [v11 addObject:v47];
  }
  if (-[_GCMFiControllerCapabilites dpad]((uint64_t)v10))
  {
    v50 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
    v51 = +[NSSet setWithObject:@"Direction Pad"];
    [v50 setAliases:v51];

    [v50 setLocalizedName:GCFLOC_DIRECTION_PAD];
    v52 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
    [v50 setSymbol:v52];

    [v50 setAnalog:(-[_GCMFiControllerCapabilites dpad]((uint64_t)v10) & 0x100) == 0];
    [v50 setEventUpValueField:0];
    [v50 setEventDownValueField:1];
    [v50 setEventLeftValueField:2];
    [v50 setEventRightValueField:3];
    [v11 addObject:v50];
  }
  if (-[_GCMFiControllerCapabilites leftThumbstick]((uint64_t)v10))
  {
    if (-[_GCMFiControllerCapabilites l3]((uint64_t)v10))
    {
      v53 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.left"];
      +[NSSet setWithObjects:@"Left Thumbstick", @"Left Thumbstick Button", 0];
      v56 = v156 = v8;
      [v53 setAliases:v56];

      [v53 setLocalizedName:GCFLOC_LEFT_THUMBSTICK];
      v57 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick");
      [v53 setSymbol:v57];

      [v53 setAnalog:1];
      [v53 setEventUpValueField:10];
      [v53 setEventDownValueField:11];
      [v53 setEventLeftValueField:12];
      [v53 setEventRightValueField:13];
      [v53 setEventPressedValueField:20];
      v58 = +[NSSet setWithObject:@"Left Thumbstick"];
      v59 = [v53 localizedName];
      [v53 symbol];
      v60 = id v154 = v7;
      v61 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v58, v59, v60, 10);
      v172 = v61;
      v62 = +[NSArray arrayWithObjects:&v172 count:1];
      [v53 setXSources:v62];

      v63 = +[NSSet setWithObject:@"Left Thumbstick"];
      v64 = [v53 localizedName];
      v65 = [v53 symbol];
      v66 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v63, v64, v65, 5);
      v171 = v66;
      v67 = +[NSArray arrayWithObjects:&v171 count:1];
      [v53 setYSources:v67];

      v68 = +[NSSet setWithObject:@"Left Thumbstick"];
      v69 = [v53 localizedName];
      v70 = [v53 symbol];
      v71 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v68, v69, v70, 1);
      v170 = v71;
      v72 = +[NSArray arrayWithObjects:&v170 count:1];
      [v53 setUpSources:v72];

      v73 = +[NSSet setWithObject:@"Left Thumbstick"];
      v74 = [v53 localizedName];
      v75 = [v53 symbol];
      v76 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v73, v74, v75, 2);
      v169 = v76;
      v77 = +[NSArray arrayWithObjects:&v169 count:1];
      [v53 setRightSources:v77];

      v78 = +[NSSet setWithObject:@"Left Thumbstick"];
      v79 = [v53 localizedName];
      v80 = [v53 symbol];
      v81 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v78, v79, v80, 4);
      v168 = v81;
      v82 = +[NSArray arrayWithObjects:&v168 count:1];
      [v53 setDownSources:v82];

      v83 = +[NSSet setWithObject:@"Left Thumbstick"];
      v84 = [v53 localizedName];
      v85 = [v53 symbol];
      v86 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v83, v84, v85, 8);
      v167 = v86;
      v87 = +[NSArray arrayWithObjects:&v167 count:1];
      [v53 setLeftSources:v87];

      id v8 = v156;
      v88 = +[NSSet setWithObject:@"Left Thumbstick Button"];
      uint64_t v89 = GCFLOC_BUTTON_LEFT_THUMBSTICK;
      v90 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick.press.down");
      v91 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v88, v89, v90);
      v166 = v91;
      v92 = +[NSArray arrayWithObjects:&v166 count:1];
      [v53 setPressedSources:v92];

      id v7 = v154;
    }
    else
    {
      v53 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"stick.left"];
      v54 = +[NSSet setWithObjects:@"Left Thumbstick", @"Left Thumbstick Button", 0];
      [v53 setAliases:v54];

      [v53 setLocalizedName:GCFLOC_LEFT_THUMBSTICK];
      v55 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick");
      [v53 setSymbol:v55];

      [v53 setAnalog:1];
      [v53 setEventUpValueField:10];
      [v53 setEventDownValueField:11];
      [v53 setEventLeftValueField:12];
      [v53 setEventRightValueField:13];
    }
    [v11 addObject:v53];
  }
  if (-[_GCMFiControllerCapabilites rightThumbstick]((uint64_t)v10))
  {
    if (-[_GCMFiControllerCapabilites r3]((uint64_t)v10))
    {
      v93 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.right"];
      v96 = +[NSSet setWithObjects:@"Right Thumbstick", @"Right Thumbstick Button", 0];
      [v93 setAliases:v96];

      [v93 setLocalizedName:GCFLOC_RIGHT_THUMBSTICK];
      v97 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick");
      [v93 setSymbol:v97];

      [v93 setAnalog:1];
      [v93 setEventUpValueField:14];
      [v93 setEventDownValueField:15];
      [v93 setEventLeftValueField:16];
      [v93 setEventRightValueField:17];
      [v93 setEventPressedValueField:21];
      +[NSSet setWithObject:@"Right Thumbstick"];
      v98 = v157 = v8;
      [v93 localizedName];
      v99 = id v155 = v7;
      v100 = [v93 symbol];
      v101 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v98, v99, v100, 10);
      v165 = v101;
      v102 = +[NSArray arrayWithObjects:&v165 count:1];
      [v93 setXSources:v102];

      v103 = +[NSSet setWithObject:@"Right Thumbstick"];
      v104 = [v93 localizedName];
      v105 = [v93 symbol];
      BOOL v106 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v103, v104, v105, 5);
      v164 = v106;
      v107 = +[NSArray arrayWithObjects:&v164 count:1];
      [v93 setYSources:v107];

      v108 = +[NSSet setWithObject:@"Right Thumbstick"];
      v109 = [v93 localizedName];
      v110 = [v93 symbol];
      v111 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v108, v109, v110, 1);
      v163 = v111;
      v112 = +[NSArray arrayWithObjects:&v163 count:1];
      [v93 setUpSources:v112];

      v113 = +[NSSet setWithObject:@"Right Thumbstick"];
      v114 = [v93 localizedName];
      v115 = [v93 symbol];
      v116 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v113, v114, v115, 2);
      v162 = v116;
      v117 = +[NSArray arrayWithObjects:&v162 count:1];
      [v93 setRightSources:v117];

      v118 = +[NSSet setWithObject:@"Right Thumbstick"];
      v119 = [v93 localizedName];
      v120 = [v93 symbol];
      v121 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v118, v119, v120, 4);
      v161 = v121;
      v122 = +[NSArray arrayWithObjects:&v161 count:1];
      [v93 setDownSources:v122];

      v123 = +[NSSet setWithObject:@"Right Thumbstick"];
      v124 = [v93 localizedName];
      v125 = [v93 symbol];
      v126 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v123, v124, v125, 8);
      v160 = v126;
      v127 = +[NSArray arrayWithObjects:&v160 count:1];
      [v93 setLeftSources:v127];

      id v8 = v157;
      v128 = +[NSSet setWithObject:@"Right Thumbstick Button"];
      uint64_t v129 = GCFLOC_BUTTON_RIGHT_THUMBSTICK;
      v130 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick.press.down");
      v131 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v128, v129, v130);
      v159 = v131;
      v132 = +[NSArray arrayWithObjects:&v159 count:1];
      [v93 setPressedSources:v132];

      id v7 = v155;
    }
    else
    {
      v93 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"stick.right"];
      v94 = +[NSSet setWithObjects:@"Right Thumbstick", @"Right Thumbstick Button", 0];
      [v93 setAliases:v94];

      [v93 setLocalizedName:GCFLOC_RIGHT_THUMBSTICK];
      v95 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick");
      [v93 setSymbol:v95];

      [v93 setAnalog:1];
      [v93 setEventUpValueField:14];
      [v93 setEventDownValueField:15];
      [v93 setEventLeftValueField:16];
      [v93 setEventRightValueField:17];
    }
    [v11 addObject:v93];
  }
  if (-[_GCMFiControllerCapabilites l4]((uint64_t)v10))
  {
    v133 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.left.bumper"];
    v134 = +[NSSet setWithObject:@"Left Bumper"];
    [v133 setAliases:v134];

    [v133 setLocalizedName:GCFLOC_BUTTON_L4];
    v135 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l4.button.horizontal");
    [v133 setSymbol:v135];

    [v133 setAnalog:(-[_GCMFiControllerCapabilites l4]((uint64_t)v10) & 0x100) == 0];
    [v133 setEventPressedValueField:41];
    [v11 addObject:v133];
  }
  if (-[_GCMFiControllerCapabilites r4]((uint64_t)v10))
  {
    v136 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.right.bumper"];
    v137 = +[NSSet setWithObject:@"Right Bumper"];
    [v136 setAliases:v137];

    [v136 setLocalizedName:GCFLOC_BUTTON_R4];
    v138 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r4.button.horizontal");
    [v136 setSymbol:v138];

    [v136 setAnalog:(-[_GCMFiControllerCapabilites r4]((uint64_t)v10) & 0x100) == 0];
    [v136 setEventPressedValueField:42];
    [v11 addObject:v136];
  }
  if (-[_GCMFiControllerCapabilites m1]((uint64_t)v10))
  {
    v139 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.right.bottom.primary"];
    v140 = +[NSSet setWithObject:@"Back Right Button 0"];
    [v139 setAliases:v140];

    [v139 setLocalizedName:GCFLOC_BUTTON_M1];
    v141 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"m1.button.horizontal");
    [v139 setSymbol:v141];

    [v139 setAnalog:(-[_GCMFiControllerCapabilites m1]((uint64_t)v10) & 0x100) == 0];
    [v139 setEventPressedValueField:45];
    [v11 addObject:v139];
  }
  if (-[_GCMFiControllerCapabilites m2]((uint64_t)v10))
  {
    v142 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.left.bottom.primary"];
    v143 = +[NSSet setWithObject:@"Back Left Button 0"];
    [v142 setAliases:v143];

    [v142 setLocalizedName:GCFLOC_BUTTON_M2];
    v144 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"m2.button.horizontal");
    [v142 setSymbol:v144];

    [v142 setAnalog:(-[_GCMFiControllerCapabilites m2]((uint64_t)v10) & 0x100) == 0];
    [v142 setEventPressedValueField:43];
    [v11 addObject:v142];
  }
  if (-[_GCMFiControllerCapabilites m3]((uint64_t)v10))
  {
    v145 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.right.bottom.secondary"];
    v146 = +[NSSet setWithObject:@"Back Right Button 1"];
    [v145 setAliases:v146];

    [v145 setLocalizedName:GCFLOC_BUTTON_M3];
    v147 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"m3.button.horizontal");
    [v145 setSymbol:v147];

    [v145 setAnalog:(-[_GCMFiControllerCapabilites m3]((uint64_t)v10) & 0x100) == 0];
    [v145 setEventPressedValueField:46];
    [v11 addObject:v145];
  }
  if (-[_GCMFiControllerCapabilites m4]((uint64_t)v10))
  {
    v148 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.left.bottom.secondary"];
    v149 = +[NSSet setWithObject:@"Back Left Button 1"];
    [v148 setAliases:v149];

    [v148 setLocalizedName:GCFLOC_BUTTON_M4];
    v150 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"m4.button.horizontal");
    [v148 setSymbol:v150];

    [v148 setAnalog:(-[_GCMFiControllerCapabilites m4]((uint64_t)v10) & 0x100) == 0];
    [v148 setEventPressedValueField:44];
    [v11 addObject:v148];
  }
  v151 = objc_opt_new();
  [v151 setElements:v11];
  v152 = [[_GCControllerInputComponentDescription alloc] initWithIdentifier:v7 controllerInputs:v151 bindings:v158];

  return v152;
}

+ (void)populateInitInfo:(id *)a3 forLogicalDevice:(id)a4
{
  a3->var0[5].var2 = 0;
  a3->var0[6].var2 = 0;
  a3->var0[9].var2 = 0;
  a3->var0[10].var2 = 0;
  a3->var0[11].var1 = 0;
  a3->var0[12].var1 = 0;
  a3->var0[13].var1 = 0;
  a3->var0[14].var1 = 0;
  a3->var0[15].var1 = 0;
  a3->var0[16].var1 = 0;
  a3->var0[17].var1 = 0;
  a3->var0[18].var1 = 0;
  a3->var0[19].var1 = 0;
  a3->var0[20].var1 = 0;
  a3->var0[21].var1 = 0;
  a3->var0[0].var2 = 1;
  id v6 = [a4 underlyingDevice];
  id v5 = [v6 serviceInfo];
  +[_GCMFiControllerProfile determineCapabilitiesWithServiceInfo:v5 initInfo:a3];
}

+ (void)determineCapabilitiesWithServiceInfo:(id)a3 initInfo:(id *)a4
{
  id v5 = (__IOHIDServiceClient *)[a3 service];
  CFDictionaryRef v6 = (const __CFDictionary *)IOHIDServiceClientCopyProperty(v5, @"GameControllerPointer");
  if (v6)
  {
    v33 = v5;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = (id)CFDictionaryGetValue(v6, @"Elements");
    uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v41 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"UsagePage", v33);
          int v13 = [v12 intValue];

          v14 = [v11 objectForKeyedSubscript:@"Usage"];
          int v15 = [v14 intValue];

          BOOL v17 = __73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke(v16, v11);
          BOOL v18 = v17;
          if (v13 == 9)
          {
            int v20 = &a4->var0[__73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke_2(v17, v15)];
            v20->var2 = v18;
            v20->var1 = 1;
          }
          else if (v13 == 1 && (v15 & 0xFFFFFFFC) == 0x90)
          {
            BOOL v19 = a4->var0[0].var2 && v17;
            a4->var0[0].var2 = v19;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v8);
    }

    id v5 = v33;
  }
  CFDictionaryRef v21 = (const __CFDictionary *)IOHIDServiceClientCopyProperty(v5, @"Keyboard");
  if (v21)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obja = (id)CFDictionaryGetValue(v21, @"Elements");
    uint64_t v22 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(obja);
          }
          __int16 v26 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          v27 = objc_msgSend(v26, "objectForKeyedSubscript:", @"UsagePage", v33);
          int v28 = [v27 intValue];

          v29 = [v26 objectForKeyedSubscript:@"Usage"];
          int v30 = [v29 intValue];

          BOOL v32 = __73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke(v31, v26);
          if (v28 == 12)
          {
            if (v30 <= 515)
            {
              if (v30 == 101)
              {
                a4->var2 = 1;
              }
              else if (v30 == 178)
              {
                a4->var1 = 1;
              }
            }
            else
            {
              switch(v30)
              {
                case 516:
                  a4->var0[14].var2 = v32;
                  a4->var0[14].var1 = 1;
                  break;
                case 547:
                  a4->var0[13].var2 = v32;
                  a4->var0[13].var1 = 1;
                  break;
                case 521:
                  a4->var0[15].var2 = v32;
                  a4->var0[15].var1 = 1;
                  break;
              }
            }
          }
        }
        uint64_t v23 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v23);
    }
  }
}

@end