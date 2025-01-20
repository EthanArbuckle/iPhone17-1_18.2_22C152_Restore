void __powerBatteryInterest(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536723200) {
    __powerUpdateBatteryState(a2);
  }
}

void __powerUpdateBatteryState(io_registry_entry_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CFMutableDictionaryRef properties = 0;
  if (!IORegistryEntryCreateCFProperties(a1, &properties, 0, 0))
  {
    int v1 = byte_1EBE2710C;
    int v2 = objc_msgSend((id)-[__CFDictionary objectForKey:](properties, "objectForKey:", @"ExternalConnected"), "BOOLValue");
    byte_1EBE2710C = v2;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [(id)gUserLdcmParams enableHalogenMitigationsAndUI];
      *(_DWORD *)buf = 67109632;
      int v22 = v1;
      __int16 v23 = 1024;
      *(_DWORD *)v24 = v2;
      *(_WORD *)&v24[4] = 2048;
      *(void *)&v24[6] = v3;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "handle battery state update: isExtChg=%u->%u, enableHalogenMitigationsAndUI %llu", buf, 0x18u);
    }
    if ([(id)gUserLdcmParams enableHalogenMitigationsAndUI] == 1
      && byte_1EBE2710C != v1
      && byte_1EBE2710C != 0)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v5 = (void *)[(id)gHalogenMeasurements allKeys];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
        v9 = MEMORY[0x1E4F14500];
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            v12 = (void *)[(id)gHalogenMeasurements objectForKey:v11];
            v13 = v12;
            if (v12 && [v12 attachDelayTimerRunning])
            {
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109634;
                int v22 = byte_1EBE2710C;
                __int16 v23 = 2112;
                *(void *)v24 = v11;
                *(_WORD *)&v24[8] = 2112;
                *(void *)&v24[10] = v13;
                _os_log_impl(&dword_1D9622000, v9, OS_LOG_TYPE_DEFAULT, "handle battery state update: isExtChg=%u, stop (delay) timer and perform measurement, key %@, halogenWrapper %@", buf, 0x1Cu);
              }
              dispatch_source_set_timer((dispatch_source_t)[v13 timer], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
              [v13 setAttachDelayTimerRunning:0];
              v14 = [v13 halogenMeasurementDispatchQueue];
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = ____powerUpdateBatteryState_block_invoke;
              block[3] = &unk_1E6B6D5A0;
              block[4] = v13;
              dispatch_async(v14, block);
            }
            else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109634;
              int v22 = byte_1EBE2710C;
              __int16 v23 = 2112;
              *(void *)v24 = v11;
              *(_WORD *)&v24[8] = 2112;
              *(void *)&v24[10] = v13;
              _os_log_impl(&dword_1D9622000, v9, OS_LOG_TYPE_DEFAULT, "handle battery state update: isExtChg=%u, (delay) timer not running, don't perform measurement, key %@, halogenWrapper %@", buf, 0x1Cu);
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
        }
        while (v7);
      }
    }
    CFRelease(properties);
  }
}

void systemPowerCallback(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  if (a3 > -536870145)
  {
    if (a3 == -536870144)
    {
      dispatch_time_t v10 = dispatch_walltime(0, 100000000);
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __systemPowerCallback_block_invoke;
      block[3] = &unk_1E6B6D5A0;
      block[4] = a1;
      dispatch_after(v10, global_queue, block);
      return;
    }
    if (a3 != -536870112) {
      return;
    }
    objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "lock");
    uint64_t v6 = a1;
    uint64_t v7 = 1;
    goto LABEL_8;
  }
  if (a3 != -536870288)
  {
    if (a3 != -536870272) {
      return;
    }
    IOAllowPowerChange([a1 systemPowerPort], a4);
    objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "lock");
    uint64_t v6 = a1;
    uint64_t v7 = 0;
LABEL_8:
    [v6 setPowerState:v7];
    objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "signal");
    uint64_t v8 = (void *)[a1 powerStateCond];
    [v8 unlock];
    return;
  }
  io_connect_t v9 = [a1 systemPowerPort];
  IOAllowPowerChange(v9, a4);
}

uint64_t __systemPowerCallback_block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "lock");
  [*(id *)(a1 + 32) setPowerState:2];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "signal");
  int v2 = (void *)[*(id *)(a1 + 32) powerStateCond];
  return [v2 unlock];
}

uint64_t recordCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = (void *)[a1 halogenUnitDelegate];
  return [v11 recordCallBackFunc:a2 AudioTimeStamp:a3 busNum:a4 numFrames:a5 AudioBufferList:a6];
}

uint64_t playbackCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = (void *)[a1 halogenUnitDelegate];
  return [v11 playbackCallBackFunc:a2 AudioTimeStamp:a3 busNum:a4 numFrames:a5 AudioBufferList:a6];
}

void IOAccessoryNotifyWet(uint64_t a1, unsigned char *a2, int a3)
{
  v47[1] = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM - Popping up a wet notification!!!", buf, 2u);
  }
  uint64_t v6 = 0;
  if (!a1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    dispatch_time_t v10 = 0;
    uint64_t v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_38;
  }
  int v41 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  id v9 = 0;
  dispatch_time_t v10 = 0;
  uint64_t v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  if (a2)
  {
    if (!*a2 || *(unsigned char *)a1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      id v9 = 0;
      dispatch_time_t v10 = 0;
LABEL_8:
      uint64_t v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_38;
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(unsigned char *)(a1 + 16) = Current - *(double *)(a1 + 8) < 480.0;
    *(CFAbsoluteTime *)(a1 + 8) = Current;
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    dispatch_time_t v10 = v16;
    if (!v16
      || ((uint64_t v17 = MEMORY[0x1E4F1CC38], *(unsigned char *)(a1 + 16)) ? (v18 = MEMORY[0x1E4F1CC38]) : (v18 = MEMORY[0x1E4F1CC28]),
          [v16 setObject:v18 forKeyedSubscript:@"reinsertion"],
          [v10 setObject:v17 forKeyedSubscript:@"typeC"],
          [v10 setObject:v17 forKeyedSubscript:@"chargerConnected"],
          (id v19 = objc_alloc_init(MEMORY[0x1E4F28C80])) == 0))
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      id v9 = 0;
      goto LABEL_8;
    }
    id v20 = v19;
    [v19 setUserInfo:v10];
    v21 = (void *)MEMORY[0x1E4F28DB0];
    id v40 = v20;
    v47[0] = v20;
    int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    id v42 = 0;
    uint64_t v23 = [v21 archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v42];
    id v9 = v42;

    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = v24;
    v39 = (void *)v23;
    if (v24)
    {
      [v24 setObject:@"com.apple.IOAccessoryManagerFramework.WetNotification" forKeyedSubscript:*MEMORY[0x1E4FA7348]];
      [v11 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4FA7350]];
      uint64_t v25 = MEMORY[0x1E4F1CC38];
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];
      [v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4FA7328]];
      [v11 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4FA7340]];
      uint64_t v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.IOAccessoryManagerFramework"];
      uint64_t v6 = v26;
      if (v26)
      {
        v27 = [v26 pathForResource:@"PlugIns/WetNotification.appex/Assets.car" ofType:&stru_1F3381008];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "IOAccessoryNotifyWet";
          __int16 v45 = 2112;
          uint64_t v46 = (uint64_t)v27;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Setting asset path for LDCM wet icon:%@", buf, 0x16u);
        }
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E4FA7390], v23);
        [v11 setObject:@"lockScreenLiquidDetection" forKeyedSubscript:*MEMORY[0x1E4FA7388]];
        [v11 setObject:@"YES" forKeyedSubscript:*MEMORY[0x1E4FA7380]];
        [v11 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4FA7368]];
        [v11 setObject:@"lockScreenLiquidDetection" forKeyedSubscript:*MEMORY[0x1E4FA7360]];
        v28 = [v6 resourceURL];
        [v11 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F1DA00]];

        v12 = [MEMORY[0x1E4FB16C8] modelSpecificLocalizedStringKeyForKey:@"WETMSG_DIALOG_BODY_LOCKSCREEN_TYPEC"];
        v29 = @"WETMSG_BUTTON_DISMISS";
        v30 = @"WETMSG_DIALOG_HEADER_LOCKSCREEN_TYPEC";
      }
      else
      {
        v29 = @"Dismiss";
        v30 = @"Liquid Detected";
        v12 = @"Disconnect cable from charger and device. Unplug charger and allow all connectors to dry. This may take several hours.";
      }
      if (*(unsigned char *)(a1 + 16))
      {
        v31 = @"WETMSG_BUTTON_EMERGENCY_OVERRIDE";
        if (!v6) {
          v31 = @"Emergency Override";
        }
        v13 = v31;
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E4FA73A8], v39);
      [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FA73B8]];
      [v11 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
      [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
      [v11 setObject:&unk_1F338AD20 forKeyedSubscript:*MEMORY[0x1E4FA73F8]];
      [v11 setObject:&unk_1F338AD38 forKeyedSubscript:*MEMORY[0x1E4FA7420]];
      if (v41)
      {
        v32 = @"WETMSG_BUTTON_RADAR";
        if (!v6) {
          v32 = @"Radar";
        }
        v14 = v32;
        [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
      }
      else
      {
        v14 = 0;
      }
      *(unsigned char *)a1 = 1;
      CFAllocatorRef v33 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      v34 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, (CFDictionaryRef)v11);
      *(void *)(a1 + 24) = v34;
      gLdcmNotificationContext = a1;
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v33, v34, (CFUserNotificationCallBack)IOAccessoryNotifyWetCallback, 0);
      *(void *)(a1 + 32) = RunLoopSource;
      if (RunLoopSource) {
        CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 40), RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      }
    }
    else
    {
      uint64_t v6 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
    }
    uint64_t v8 = v40;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v36 = [v9 localizedDescription];
        uint64_t v37 = [v36 UTF8String];
        *(_DWORD *)buf = 136315394;
        v44 = "IOAccessoryNotifyWet";
        __int16 v45 = 2080;
        uint64_t v46 = v37;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);
      }
      uint64_t v7 = v39;
      uint64_t v8 = v40;
    }
    else
    {
      uint64_t v7 = v39;
    }
  }
LABEL_38:
  v38 = v8;
}

void IOAccessoryNotifyWetCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = gLdcmNotificationContext;
  if (gLdcmNotificationContext)
  {
    if (*(unsigned char *)gLdcmNotificationContext)
    {
      *(unsigned char *)gLdcmNotificationContext = 0;
      IOAccessoryNotifyWetHandler(v2, a2);
    }
  }
}

void IOAccessoryNotifyWetHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a1)
  {
    unint64_t v5 = llround(CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 8));
    uint64_t v6 = [NSNumber numberWithLong:v5];
    [v4 setObject:v6 forKey:@"notificationDuration"];

    if (*(unsigned char *)(a1 + 16) && a2 == 2)
    {
      id v9 = [NSNumber numberWithInt:2];
      [v4 setObject:v9 forKey:@"notificationUserAction"];

      IOAccessoryNotifyWetHandlerEmergencyOverride(a1);
    }
    else if (a2 == 1)
    {
      uint64_t v8 = [NSNumber numberWithInt:1];
      [v4 setObject:v8 forKey:@"notificationUserAction"];

      IOAccessoryFileRadarLDCMV4();
    }
    else if (!a2)
    {
      uint64_t v7 = [NSNumber numberWithInt:0];
      [v4 setObject:v7 forKey:@"notificationUserAction"];

      IOAccessoryNotifyWetHandlerDismiss();
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      unint64_t v11 = v5;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM UI Notification Duration: %ld\n", (uint8_t *)&v10, 0xCu);
    }
    AnalyticsSendEvent();
    CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 40), *(CFRunLoopSourceRef *)(a1 + 32), (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(*(CFTypeRef *)(a1 + 32));
    CFRelease(*(CFTypeRef *)(a1 + 24));
  }
}

void IOAccessoryNotifyWetHandlerDismiss()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM UI Dismiss!!!\n", v0, 2u);
  }
}

uint64_t IOAccessoryNotifyWetHandlerEmergencyOverride(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM UI Emergency Override!!!\n", v3, 2u);
  }
  return [*(id *)(a1 + 48) setOverride:1];
}

void IOAccessoryNotifyWetCancel()
{
  uint64_t v0 = gLdcmNotificationContext;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM UI Cancel!!!\n", v4, 2u);
  }
  if (v0)
  {
    if (*(unsigned char *)v0)
    {
      int v1 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v2 = [NSNumber numberWithLong:llround(CFAbsoluteTimeGetCurrent() - *(double *)(v0 + 8))];
      [v1 setObject:v2 forKey:@"notificationDuration"];

      uint64_t v3 = [NSNumber numberWithInt:3];
      [v1 setObject:v3 forKey:@"notificationUserAction"];

      AnalyticsSendEvent();
      CFUserNotificationCancel(*(CFUserNotificationRef *)(v0 + 24));
      *(unsigned char *)uint64_t v0 = 0;
      CFRunLoopRemoveSource(*(CFRunLoopRef *)(v0 + 40), *(CFRunLoopSourceRef *)(v0 + 32), (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      CFRelease(*(CFTypeRef *)(v0 + 32));
      CFRelease(*(CFTypeRef *)(v0 + 24));
    }
  }
}

void IOAccessoryFileRadarLDCMV4()
{
  v28 = [MEMORY[0x1E4F1CA60] dictionary];
  id v29 = [MEMORY[0x1E4F28E78] stringWithUTF8String:"LIQUID DETECTION REPORT (detected via HalogenTypeC)\n\n"];
  [v29 appendString:@"Has your device or charging cable been near liquid in the past 5 hours? \n\n"];
  [v29 appendString:@"If yes:\n\n"];
  [v29 appendString:@"- Cable or device?\n\n"];
  [v29 appendString:@"- What kind of liquid? (e.g. tap water, rain, sweat, soda, beer, etc.)\n\n"];
  [v29 appendString:@"- What kind of exposure? (e.g. submersion, splash, droplet, sitting in puddle, using device with wet/sweaty hands, etc)\n\n"];
  [v29 appendString:@"- If the exposure was limited to a certain part of the device, where was it?\n\n"];
  [v29 appendString:@"- How long was the exposure?\n\n"];
  [v29 appendString:@"- Time since exposure\n"];
  [v29 appendString:@"\n\nIf no:\n\n"];
  [v29 appendString:@"Please describe what happened just before seeing the dialog. For example… Did you just connect an accessory? Did you drop your device? Are you in a humid environment?\n\n\n"];
  uint64_t v0 = [MEMORY[0x1E4F28E78] stringWithString:@"tap-to-radar://new?ComponentName=LDCM&ComponentVersion=AutofilledBugs&ComponentID=750390&Classification=Other Bug&Reproducibility=Not Applicable&"];
  int v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v2 = [v1 contentsOfDirectoryAtPath:@"/var/logs/ldcm/" error:0];

  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self BEGINSWITH[cd] 'internalMeasurementData'"];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  unint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self BEGINSWITH[cd] 'internalWaveformData'"];
  uint64_t v6 = [v2 filteredArrayUsingPredicate:v5];

  uint64_t v26 = (void *)v6;
  v27 = v4;
  uint64_t v25 = [v4 arrayByAddingObjectsFromArray:v6];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v25];
  if ([v7 count])
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      int v10 = NSString;
      unint64_t v11 = [v7 objectAtIndex:v8];
      uint64_t v12 = [v10 stringWithFormat:@"%@%@", @"/var/logs/ldcm/", v11];

      [v7 replaceObjectAtIndex:v8 withObject:v12];
      uint64_t v8 = v9;
    }
    while ([v7 count] > (unint64_t)v9++);
  }
  if ([v7 count])
  {
    v14 = [v7 componentsJoinedByString:@","];
    [v0 appendFormat:@"Attachments=%@", v14];
  }
  [v0 appendString:@"&"];
  [v0 appendFormat:@"Description=%@", v29];
  v15 = (void *)MEMORY[0x1E4F1CB10];
  long long v16 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  uint64_t v17 = [v0 stringByAddingPercentEncodingWithAllowedCharacters:v16];
  uint64_t v18 = [v15 URLWithString:v17];

  if (_FBSOpenApplicationOptionKeyPromptUnlockDevice) {
    goto LABEL_9;
  }
  id v19 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 4);
  if (!v19)
  {
    if (_FBSOpenApplicationOptionKeyPromptUnlockDevice) {
      goto LABEL_9;
    }
LABEL_16:
    int v22 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v22 openURL:v18 configuration:0 completionHandler:&__block_literal_global];
    goto LABEL_11;
  }
  _FBSOpenApplicationOptionKeyPromptUnlockDevice = (uint64_t)dlsym(v19, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  if (!_FBSOpenApplicationOptionKeyPromptUnlockDevice) {
    goto LABEL_16;
  }
LABEL_9:
  id v20 = [NSString alloc];
  uint64_t v21 = [v20 initWithBytes:_FBSOpenApplicationOptionKeyPromptUnlockDevice length:8 encoding:1];
  if (!v21) {
    goto LABEL_12;
  }
  int v22 = (void *)v21;
  uint64_t v23 = [NSNumber numberWithBool:1];
  [v28 setObject:v23 forKey:v22];

  id v24 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v24 openSensitiveURL:v18 withOptions:v28];

LABEL_11:
LABEL_12:
}

void __IOAccessoryFileRadarLDCMV4_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "IOAccessoryFileRadarLDCMV4_block_invoke";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Error while filing radar. %@\n", (uint8_t *)&v6, 0x16u);
  }
}

void IOPortLDCMFeatureInterestCallback(void *a1, io_registry_entry_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case -469794613:
      id v9 = a1;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(a2, @"MitigationsStatus", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      unint64_t v11 = CFProperty;
      if (v9 && CFProperty)
      {
        uint64_t v12 = [CFProperty intValue];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v14 = 136315394;
          *(void *)&v14[4] = "IOPortLDCMFeatureInterestCallback";
          *(_WORD *)&v14[12] = 1024;
          *(_DWORD *)&v14[14] = v12;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s kIOPortFeatureLDCMMessageTypeMitigationsStatusChange: %d\n", v14, 0x12u);
        }
        [v9 handleLDCMMitigationsStatusChange:v12];
      }

      break;
    case -469794614:
      id v13 = a1;
      if (v13)
      {
        id v5 = v13;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v14 = 136315138;
          *(void *)&v14[4] = "IOPortLDCMFeatureInterestCallback";
          int v6 = MEMORY[0x1E4F14500];
          uint64_t v7 = "%s kIOPortFeatureLDCMMessageTypeMeasurementStatusChange\n";
          goto LABEL_16;
        }
LABEL_17:
        objc_msgSend(v5, "handleLDCMInterrupt", *(_OWORD *)v14);
      }
      break;
    case -469794616:
      id v4 = a1;
      if (v4)
      {
        id v5 = v4;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v14 = 136315138;
          *(void *)&v14[4] = "IOPortLDCMFeatureInterestCallback";
          int v6 = MEMORY[0x1E4F14500];
          uint64_t v7 = "%s kIOPortFeatureLDCMMessageTypeLiquidDetectedChange\n";
LABEL_16:
          _os_log_impl(&dword_1D9622000, v6, OS_LOG_TYPE_DEFAULT, v7, v14, 0xCu);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      break;
    default:
      return;
  }
}

void IOPortLDCMPortInterestCallback(void *a1, io_registry_entry_t entry, int a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 == -469794615)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, @"ConnectionActive", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      id v5 = a1;
      if (v5)
      {
        int v6 = [CFProperty BOOLValue];
        BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
        if (v6)
        {
          if (v7)
          {
            int v8 = 136315138;
            id v9 = "IOPortLDCMPortInterestCallback";
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s kIOPort_Message_ConnectionStateChange attach\n", (uint8_t *)&v8, 0xCu);
          }
          [v5 handleAttachEvent];
        }
        else
        {
          if (v7)
          {
            int v8 = 136315138;
            id v9 = "IOPortLDCMPortInterestCallback";
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s kIOPort_Message_ConnectionStateChange detach \n", (uint8_t *)&v8, 0xCu);
          }
          [v5 handleDetachEvent];
        }
      }
    }
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t performEisMeasurement(void *a1)
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  __int16 v123 = -21846;
  io_connect_t connect = 0;
  int v122 = -1431655766;
  unint64_t v120 = 0xAAAAAAAAAAAAAAAALL;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v125 = "performEisMeasurement";
    *(_WORD *)&v125[8] = 2048;
    *(void *)&v125[10] = a1;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s performEisMeasurement entry wrapper = %p\n", buf, 0x16u);
  }
  if (!a1) {
    goto LABEL_198;
  }
  if (![a1 isMeasurementEnabled]) {
    goto LABEL_197;
  }
  objc_msgSend((id)objc_msgSend(a1, "cond"), "lock");
  [a1 setIsMeasurementActive:1];
  objc_msgSend((id)objc_msgSend(a1, "cond"), "unlock");
  uint64_t v2 = (void *)[a1 halogenMeasurement];
  int v3 = [a1 portID];
  if ([a1 isReceptacleEmpty])
  {
    unint64_t v4 = [a1 eventBasedDigitalID];
    int v5 = [a1 eventBasedOrientation];
    if ([a1 justDetached])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)v125 = "performEisMeasurement";
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s skipping measurement just after detach.\n", buf, 0xCu);
      }
      [a1 setJustDetached:0];
LABEL_14:
      char v6 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v4 = [a1 connectedAccessoryDigitalID];
    int v5 = [a1 connectedAccessoryOrientation];
    if ([a1 justAttachedCase])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)v125 = "performEisMeasurement";
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s skipping measurement just after attach of case.\n", buf, 0xCu);
      }
      [a1 setJustAttachedCase:0];
      goto LABEL_14;
    }
  }
  char v6 = 0;
LABEL_16:
  if (!digitalIdNumPinsFree(v4, (uint64_t)&v122)) {
    goto LABEL_197;
  }
  io_service_t v7 = [a1 service];
  if (IOServiceOpen(v7, *MEMORY[0x1E4F14960], 0, &connect)) {
    goto LABEL_197;
  }
  if (!_holdPowerAssertion(1, a1))
  {
    LODWORD(v9) = 7;
    goto LABEL_185;
  }
  p_info = (__objc2_class_ro **)(HalogenWrapper + 32);
  if (v6)
  {
    LODWORD(v9) = 7;
    goto LABEL_178;
  }
  unsigned int v10 = 0;
  char updated = 0;
  LODWORD(v9) = 7;
  double v11 = 1000.0;
  unint64_t v117 = v4;
  while (!IOAccessoryManagerGetFreePinMask())
  {
    unsigned int v119 = v10;
    unint64_t v12 = v120;
    if (v4 == 0x18FE81000000)
    {
      unint64_t v12 = v120 & 0xFFFFFFFFFFFFFFFBLL;
      v120 &= ~4uLL;
    }
    uint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = dword_1D964CF00[v13];
      if ((v12 & (1 << v14)) != 0)
      {
        unsigned int v15 = v14 + 2;
        if (v5 != 2) {
          unsigned int v15 = dword_1D964CF00[v13];
        }
        if (*((unsigned char *)&v122 + v15)) {
          break;
        }
      }
      if (++v13 == 4)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v125 = v3;
          *(_WORD *)&v125[4] = 2048;
          *(void *)&v125[6] = v12;
          v76 = MEMORY[0x1E4F14500];
          v77 = "(%d) Dynamic free pins have been consumed. Cannot take Halogen LDCM measurment freePinMask = 0x%llx";
          uint32_t v78 = 18;
          goto LABEL_96;
        }
        goto LABEL_97;
      }
    }
    int v118 = v3;
    [a1 setPinID:v14];
    uint64_t v9 = [a1 isReceptacleEmpty];
    uint64_t v16 = [a1 isWet];
    [(id)gUserLdcmParams wetTransitionCapacitanceThreshold];
    double v18 = v17;
    [(id)gUserLdcmParams dryTransitionCapacitanceThreshold];
    unsigned int v20 = [v2 doMeasurement:1 onPin:v14 isReceptacleEmpty:v9 isReceptacleWet:v16 withWetTransitionThreshold:v18 withDryTransitionThreshold:v19];
    LODWORD(v9) = v20;
    if (!v20)
    {
      uint64_t v23 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v24 = IOAccessoryGetPinStrForIndex_pinStr[(int)v14];
        int v25 = [v2 halogenResult];
        uint64_t v26 = [v2 getResultString];
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v125 = v118;
        *(_WORD *)&v125[4] = 1024;
        *(_DWORD *)&v125[6] = v119;
        *(_WORD *)&v125[10] = 1024;
        *(_DWORD *)&v125[12] = v14;
        *(_WORD *)&v125[16] = 2082;
        *(void *)&v125[18] = v24;
        LOWORD(v126) = 1024;
        *(_DWORD *)((char *)&v126 + 2) = v25;
        uint64_t v23 = MEMORY[0x1E4F14500];
        HIWORD(v126) = 2114;
        *(void *)v127 = v26;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement #%d on %d (%{public}s) returned %d (%{public}@)", buf, 0x2Eu);
      }
      if (gIsInternalBuild) {
        [v2 saveAsWav:@"/tmp/halogen.wav"];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        [v2 voltageGainCorrection];
        uint64_t v115 = v27;
        [v2 currentGainCorrection];
        uint64_t v114 = v28;
        [v2 currentPhaseCompensation];
        uint64_t v30 = v29;
        [v2 goertzelImpedance];
        uint64_t v32 = v31;
        [v2 goertzelPhase];
        uint64_t v34 = v33;
        [v2 compensatedImpedance];
        uint64_t v36 = v35;
        [v2 compensatedPhase];
        double v37 = v11;
        uint64_t v39 = v38;
        [v2 clippingScore];
        uint64_t v41 = v40;
        [v2 resistanceInOhms];
        uint64_t v43 = v42;
        [v2 capacitanceInNanoF];
        *(_DWORD *)buf = 67111680;
        *(_DWORD *)v125 = v118;
        *(_WORD *)&v125[4] = 2048;
        *(void *)&v125[6] = v115;
        *(_WORD *)&v125[14] = 2048;
        *(void *)&v125[16] = v114;
        *(_WORD *)&v125[24] = 2048;
        uint64_t v126 = v30;
        *(_WORD *)v127 = 2048;
        *(void *)&v127[2] = v32;
        __int16 v128 = 2048;
        uint64_t v129 = v34;
        __int16 v130 = 2048;
        uint64_t v131 = v36;
        __int16 v132 = 2048;
        uint64_t v133 = v39;
        double v11 = v37;
        __int16 v134 = 2048;
        uint64_t v135 = v41;
        __int16 v136 = 2048;
        uint64_t v137 = v43;
        __int16 v138 = 2048;
        uint64_t v139 = v44;
        _os_log_impl(&dword_1D9622000, v23, OS_LOG_TYPE_DEFAULT, "(%d) halogen measurement = [%.13f, %.13f, %.13f, %.13f, %.13f, %.13f, %.13f, %.13f, %.13f, %.13f]", buf, 0x6Cu);
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        [v2 precalVoltageSNR];
        uint64_t v46 = v45;
        [v2 precalCurrentSNR];
        uint64_t v48 = v47;
        [v2 calVoltageSNR];
        uint64_t v50 = v49;
        [v2 calCurrentSNR];
        uint64_t v52 = v51;
        [v2 measurementVoltageSNR];
        uint64_t v54 = v53;
        [v2 measurementCurrentSNR];
        uint64_t v56 = v55;
        [v2 measurementCondetSNR];
        *(_DWORD *)buf = 67110912;
        *(_DWORD *)v125 = v118;
        *(_WORD *)&v125[4] = 2048;
        *(void *)&v125[6] = v46;
        *(_WORD *)&v125[14] = 2048;
        *(void *)&v125[16] = v48;
        *(_WORD *)&v125[24] = 2048;
        uint64_t v126 = v50;
        *(_WORD *)v127 = 2048;
        *(void *)&v127[2] = v52;
        __int16 v128 = 2048;
        uint64_t v129 = v54;
        __int16 v130 = 2048;
        uint64_t v131 = v56;
        __int16 v132 = 2048;
        uint64_t v133 = v57;
        _os_log_impl(&dword_1D9622000, v23, OS_LOG_TYPE_DEFAULT, "(%d) halogen SNR = [precal: %.13f, %.13f cal: %.13f, %.13f measurement: %.13f, %.13f condet: %.13f]", buf, 0x4Eu);
      }
      unsigned int v58 = [v2 halogenResult];
      unsigned int v22 = v119;
      if (v58 > 8) {
        goto LABEL_55;
      }
      if (((1 << v58) & 7) != 0)
      {
        BOOL v59 = 1;
        goto LABEL_56;
      }
      if (((1 << v58) & 0x160) != 0)
      {
        BOOL v59 = 0;
        if (gEnableTapToRadarPopup && gGiveUserRadarOption && gIsInternalBuild) {
          BOOL v59 = [(id)gUserLdcmParams enableHalogenSnrTtr] != 0;
        }
      }
      else
      {
LABEL_55:
        BOOL v59 = 0;
      }
LABEL_56:
      v61 = (void *)[a1 halogenMeasurement];
      int v62 = [v61 halogenResult];
      int v63 = v62;
      if (!v59)
      {
        CFStringRef v68 = @"com.apple.ioaccessorymanager.ldcm.eis.clipping";
        if (v63 != 3)
        {
          if ([v61 halogenResult] == 4)
          {
            if (objc_msgSend(v61, "isBoundViolation_currentGainCorrection")) {
              IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.currentgaincorrection.outofrange", a1);
            }
            char v69 = objc_msgSend(v61, "isBoundViolation_currentPhaseCompensation");
            CFStringRef v68 = @"com.apple.ioaccessorymanager.ldcm.eis.currentphasecompensation.outofrange";
            if ((v69 & 1) == 0) {
              goto LABEL_80;
            }
          }
          else
          {
            int v70 = [v61 halogenResult];
            CFStringRef v68 = @"com.apple.ioaccessorymanager.ldcm.eis.calibration.bad.snr";
            if (v70 != 5)
            {
              int v71 = [v61 halogenResult];
              CFStringRef v68 = @"com.apple.ioaccessorymanager.ldcm.eis.calibration.bad.snr";
              if (v71 != 6)
              {
                int v72 = [v61 halogenResult];
                CFStringRef v68 = @"com.apple.ioaccessorymanager.ldcm.eis.measurement.bad.snr";
                if (v72 != 8) {
                  goto LABEL_80;
                }
              }
            }
          }
        }
LABEL_79:
        IOAccessoryAggDPostScalarPrefixKey(v68, a1);
        goto LABEL_81;
      }
      if (!v62
        || [v61 halogenResult] == 1
        || [v61 halogenResult] == 2)
      {
        [v61 capacitanceInNanoF];
        IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.eis.capacitance.histogram", a1, v64);
        [v61 goertzelImpedance];
        IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.eis.impedance.histogram", a1, v65 / v11);
        [v61 goertzelPhase];
        IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.eis.phase.histogram", a1, v66);
        if (objc_msgSend(v61, "isLowerBoundViolation_goertzelImpedance")) {
          IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.impedance.low", a1);
        }
        if (objc_msgSend(v61, "isUpperBoundViolation_goertzelImpedance")) {
          IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.impedance.high", a1);
        }
        if (objc_msgSend(v61, "isLowerBoundViolation_goertzelPhase")) {
          IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.phase.low", a1);
        }
        if (objc_msgSend(v61, "isUpperBoundViolation_goertzelPhase")) {
          IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.phase.high", a1);
        }
        int v67 = objc_msgSend(v61, "isBoundViolation_measurementCondetSNR");
        CFStringRef v68 = @"com.apple.ioaccessorymanager.ldcm.eis.digitalnoise.fault";
        if (v67) {
          goto LABEL_79;
        }
      }
LABEL_69:
      BOOL v59 = 1;
      goto LABEL_81;
    }
    uint64_t v21 = MEMORY[0x1E4F14500];
    if (v20 <= 6 && ((1 << v20) & 0x58) != 0)
    {
      unsigned int v22 = v119;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v125 = v118;
        *(_WORD *)&v125[4] = 1024;
        *(_DWORD *)&v125[6] = v119;
        _os_log_impl(&dword_1D9622000, v21, OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement #%d triggered abort due to sleep / failed arbitration / audio failure", buf, 0xEu);
      }
      goto LABEL_69;
    }
    BOOL v59 = 0;
    unsigned int v22 = v119;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v60 = IOAccessoryGetPinStrForIndex_pinStr[(int)v14];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v125 = v118;
      *(_WORD *)&v125[4] = 1024;
      *(_DWORD *)&v125[6] = v119;
      *(_WORD *)&v125[10] = 1024;
      *(_DWORD *)&v125[12] = v14;
      *(_WORD *)&v125[16] = 2082;
      *(void *)&v125[18] = v60;
      LOWORD(v126) = 1024;
      *(_DWORD *)((char *)&v126 + 2) = v9;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement #%d on %d (%{public}s) returned %#x", buf, 0x24u);
LABEL_80:
      BOOL v59 = 0;
    }
LABEL_81:
    if ([a1 isWet])
    {
      unint64_t v4 = v117;
      if (([a1 isReceptacleEmpty] & 1) == 0 && (objc_msgSend(a1, "isHeadsetConnected") & 1) == 0)
      {
        if (!((v9 != 0) | updated & 1)) {
          char updated = updateAccyHalogenHealthDictionary(a1);
        }
        _generateUIAnalyticEvents(a1, v118);
      }
    }
    else
    {
      unint64_t v4 = v117;
    }
    if (v59)
    {
      int v3 = v118;
      goto LABEL_97;
    }
    usleep(0x186A0u);
    BOOL v73 = v22 > 3;
    unsigned int v10 = v22 + 1;
    int v74 = v73 || v59;
    int v3 = v118;
    if (v74 == 1) {
      goto LABEL_97;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v125 = v3;
    v76 = MEMORY[0x1E4F14500];
    v77 = "(%d) IOAccessoryManagerGetFreePinMask() failed so abort measurement";
    uint32_t v78 = 8;
LABEL_96:
    _os_log_impl(&dword_1D9622000, v76, OS_LOG_TYPE_DEFAULT, v77, buf, v78);
  }
LABEL_97:
  p_info = HalogenWrapper.info;
  if (v9) {
    goto LABEL_178;
  }
  if ((updated & 1) == 0) {
    updateAccyHalogenHealthDictionary(a1);
  }
  unsigned int v79 = [v2 halogenResult];
  LODWORD(v9) = 0;
  if (v79 > 8) {
    goto LABEL_178;
  }
  if (((1 << v79) & 0x160) != 0)
  {
    LODWORD(v9) = 0;
    if (![(id)gUserLdcmParams enableHalogenSnrTtr]
      || !gEnableTapToRadarPopup
      || !gGiveUserRadarOption
      || !gIsInternalBuild)
    {
      goto LABEL_178;
    }
    if (([a1 isTapToRadarPending] & 1) == 0)
    {
      [a1 setIsTapToRadarPending:1];
      IOAccessoryGiveUserRadarOption(a1, 1);
    }
LABEL_177:
    LODWORD(v9) = 0;
    goto LABEL_178;
  }
  if (((1 << v79) & 3) == 0)
  {
    if (v79 != 2) {
      goto LABEL_178;
    }
    if ([a1 dryCnt])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v83 = [a1 dryCnt];
        uint64_t v84 = [a1 minDryReadings];
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v125 = v3;
        *(_WORD *)&v125[4] = 2048;
        *(void *)&v125[6] = v83;
        *(_WORD *)&v125[14] = 2048;
        *(void *)&v125[16] = v84;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) dryCnt=%llu didn't reach the minimum threshold of %llu before reading wet again", buf, 0x1Cu);
      }
      [a1 setDryCnt:0];
    }
    if (([a1 isWet] & 1) == 0)
    {
      objc_msgSend(a1, "setEventBasedPDigitalID:", (id)objc_msgSend(a1, "connectedAccessoryPDigitalID"));
      objc_msgSend(a1, "setEventBasedDigitalID:", objc_msgSend(a1, "connectedAccessoryDigitalID"));
      objc_msgSend(a1, "setEventBasedOrientation:", objc_msgSend(a1, "connectedAccessoryOrientation"));
      uint64_t v85 = mach_continuous_time();
      if ([a1 isTimestampValid])
      {
        v86 = v2;
        uint64_t v87 = [a1 wetDryTransitionTimestamp];
        uint64_t v88 = v87;
        if (dword_1EA8C4C4C)
        {
          unsigned int v89 = dword_1EA8C4C4C;
          unint64_t v90 = v87 * (unint64_t)sTimebaseInfo / dword_1EA8C4C4C;
        }
        else
        {
          mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          unsigned int v89 = dword_1EA8C4C4C;
          unint64_t v90 = v88 * (unint64_t)sTimebaseInfo / dword_1EA8C4C4C;
          if (!dword_1EA8C4C4C)
          {
            mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
            unsigned int v89 = dword_1EA8C4C4C;
          }
        }
        uint64_t v2 = v86;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v125 = v3;
          *(_WORD *)&v125[4] = 2048;
          *(void *)&v125[6] = (v85 * sTimebaseInfo / v89 - v90) / 0x3B9ACA00;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement dry interval = %lld seconds", buf, 0x12u);
        }
      }
      IOAccessoryAggDPostScalarKey(@"com.apple.ioaccessorymanager.voltage.count", (uint64_t)a1);
      [v2 capacitanceInNanoF];
      IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.eis.initial.wet.capacitance.histogram", a1, v100);
      [v2 goertzelImpedance];
      IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.eis.initial.wet.impedance.histogram", a1, v101 / v11);
      if (([a1 isReceptacleEmpty] & 1) == 0 && (objc_msgSend(a1, "isHeadsetConnected") & 1) == 0) {
        _generateUIAnalyticEvents(a1, v3);
      }
      [a1 setWetDryTransitionTimestamp:v85];
      [a1 setIsTimestampValid:1];
      [a1 setIsWet:1];
      reportEisMeasurementStateChange(a1);
    }
    if ([(id)gUserLdcmParams enableHalogenMitigationsAndUI] != 1
      && gEnableTapToRadarPopup
      && gGiveUserRadarOption
      && gIsInternalBuild)
    {
      if ([a1 wasTapToRadarShown] & 1) != 0 || (objc_msgSend(a1, "isTapToRadarPending"))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v125 = v3;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Suppress TapToRadar as it was already shown on this insertion", buf, 8u);
        }
      }
      else
      {
        [a1 setWasTapToRadarShown:1];
        [a1 setIsTapToRadarPending:1];
        IOAccessoryGiveUserRadarOption(a1, 0);
      }
    }
    if ([a1 isTimestampValid] && (objc_msgSend(a1, "isHeadsetConnected") & 1) == 0)
    {
      uint64_t v102 = [a1 wetDryTransitionTimestamp];
      unsigned int v103 = dword_1EA8C4C4C;
      if (!dword_1EA8C4C4C)
      {
        mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
        unsigned int v103 = dword_1EA8C4C4C;
      }
      unint64_t v104 = v102 * (unint64_t)sTimebaseInfo / v103;
      uint64_t v105 = mach_continuous_time();
      unsigned int v106 = dword_1EA8C4C4C;
      if (!dword_1EA8C4C4C)
      {
        mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
        unsigned int v106 = dword_1EA8C4C4C;
      }
      uint64_t v107 = v105 * sTimebaseInfo / v106 - v104;
      if (v107 / 0x3B9ACA00 >= [(id)gUserLdcmParams maxVhiDurationSec]
        && ([a1 didWetTooLong] & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v125 = v3;
          *(_WORD *)&v125[4] = 2048;
          *(void *)&v125[6] = v107 / 0x3B9ACA00;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) wet too long = %lld seconds", buf, 0x12u);
        }
        IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.notification.wettoolong", a1, (double)(v107 / 0x3B9ACA00));
        [a1 setDidWetTooLong:1];
      }
    }
    goto LABEL_177;
  }
  if (![a1 isWet]) {
    goto LABEL_177;
  }
  uint64_t v9 = [a1 dryCnt];
  objc_msgSend(a1, "setDryCnt:", objc_msgSend(a1, "dryCnt") + 1);
  uint64_t v80 = mach_continuous_time();
  if (!v9)
  {
    [a1 setFirstDryTimestamp:v80];
    goto LABEL_178;
  }
  unint64_t v81 = [a1 dryCnt];
  if (v81 >= [a1 minDryReadings])
  {
    if ([a1 isTimestampValid])
    {
      uint64_t v91 = [a1 firstDryTimestamp];
      uint64_t v92 = v91 - [a1 wetDryTransitionTimestamp];
      unsigned int v93 = dword_1EA8C4C4C;
      if (!dword_1EA8C4C4C)
      {
        mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
        unsigned int v93 = dword_1EA8C4C4C;
      }
      unint64_t v94 = v92 * (unint64_t)sTimebaseInfo / v93;
      unint64_t v95 = v94 / 0x3B9ACA00;
      if ([a1 accessoryConnectedWhileWet])
      {
        int v96 = v3;
        uint64_t v97 = [a1 firstDryTimestamp];
        uint64_t v98 = v97 - [a1 wetAccessoryAttachTimestamp];
        unsigned int v99 = dword_1EA8C4C4C;
        if (!dword_1EA8C4C4C)
        {
          mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          unsigned int v99 = dword_1EA8C4C4C;
        }
        unint64_t v95 = v98 * (unint64_t)sTimebaseInfo / v99 / 0x3B9ACA00;
        int v3 = v96;
        p_info = HalogenWrapper.info;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v125 = v3;
        *(_WORD *)&v125[4] = 2048;
        *(void *)&v125[6] = v95;
        *(_WORD *)&v125[14] = 2048;
        *(void *)&v125[16] = v94 / 0x3B9ACA00;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement wet interval = %lld seconds, dryTime = %lld seconds", buf, 0x1Cu);
      }
      if ([a1 didConfidentNotify] && (objc_msgSend(a1, "didWetTooLong") & 1) == 0)
      {
        if (v95 >= [(id)gUserLdcmParams minVhiDurationSec]
          || ([a1 isReceptacleEmpty] & 1) != 0)
        {
          if (([a1 didHighConfidentNotify] & 1) == 0)
          {
            IOAccessoryAggDPostScalarKey(@"com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount", (uint64_t)a1);
            [a1 setDidHighConfidentNotify:1];
          }
          if (([a1 isReceptacleEmpty] & 1) == 0 && (objc_msgSend(a1, "didWetDuration") & 1) == 0)
          {
            IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.notification.wetduration", a1, (double)v95);
            [a1 setDidWetDuration:1];
          }
        }
        else
        {
          IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.notification.drytooshort", a1, (double)v95);
        }
      }
      IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.eis.drytime.histogram", a1, (double)(v94 / 0xDF8475800));
      IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.eis.drytimeV2.histogram", a1, (double)(v94 / 0xDF8475800));
    }
    reportEisMeasurementStateChange(a1);
    [a1 setWetDryTransitionTimestamp:v80];
    [a1 setIsTimestampValid:1];
    [a1 setIsWet:0];
    [a1 setDryCnt:0];
    [a1 setDidConfidentNotify:0];
    [a1 setDidHighConfidentNotify:0];
    [a1 setDidNotify:0];
    [a1 setDidWetDuration:0];
    [a1 setDidWetTooLong:0];

    [a1 setEventBasedPDigitalID:0];
    [a1 setEventBasedDigitalID:0];
    [a1 setEventBasedOrientation:0];
    goto LABEL_177;
  }
  LODWORD(v9) = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v82 = [a1 dryCnt];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v125 = v3;
    *(_WORD *)&v125[4] = 2048;
    *(void *)&v125[6] = v82;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) dryCnt = %llu", buf, 0x12u);
    goto LABEL_177;
  }
LABEL_178:
  if (([(__objc2_class_ro *)p_info[66] userBehaviorMask] & 0x10) == 0
    && [a1 isReceptacleEmpty]
    && ([a1 isWet] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v125 = v3;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Empty Receptacle Dry State. Disable measurements", buf, 8u);
    }
    halogenMeasurementCleanup(a1);
  }
  _holdPowerAssertion(0, a1);
LABEL_185:
  if ([a1 isMeasurementEnabled])
  {
    if (v9 == 8)
    {
      unint64_t v109 = [a1 ldcmStartMeasurementsRetryNs];
      uint64_t v110 = 1;
    }
    else
    {
      if (v9 == 6)
      {
        uint64_t v108 = [a1 ldcmArbiterRetryNs];
      }
      else if ([a1 isWet])
      {
        uint64_t v108 = [a1 wetPollingIntervalNs];
      }
      else
      {
        uint64_t v108 = [a1 dryPollingIntervalNs];
      }
      unint64_t v109 = v108;
      uint64_t v110 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v125 = "performEisMeasurement";
      *(_WORD *)&v125[8] = 2048;
      *(void *)&v125[10] = v109 / 0xF4240;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s start measurement timer: %llu ms\n", buf, 0x16u);
    }
    v111 = [a1 timer];
    dispatch_time_t v112 = dispatch_walltime(0, v109);
    dispatch_source_set_timer(v111, v112, 0xFFFFFFFFFFFFFFFFLL, 0);
    [a1 setAttachDelayTimerRunning:v110];
  }
LABEL_197:
  objc_msgSend((id)objc_msgSend(a1, "cond"), "lock");
  [a1 setIsMeasurementActive:0];
  objc_msgSend((id)objc_msgSend(a1, "cond"), "signal");
  objc_msgSend((id)objc_msgSend(a1, "cond"), "unlock");
LABEL_198:
  uint64_t result = connect;
  if (connect) {
    return IOServiceClose(connect);
  }
  return result;
}

uint64_t isDeviceTypeC_V3()
{
  *(void *)existing = 0;
  mach_port_t v0 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v1 = IOServiceMatching("IOPort");
  if (IOServiceGetMatchingServices(v0, v1, &existing[1])) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = existing[1] == 0;
  }
  if (v2)
  {
    io_registry_entry_t v3 = 0;
LABEL_12:
    CFNumberRef v7 = 0;
    int v8 = 0;
    goto LABEL_13;
  }
  io_object_t v4 = IOIteratorNext(existing[1]);
  io_registry_entry_t v3 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  while (1)
  {
    int valuePtr = 0;
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, @"PortType", v5, 0);
    CFNumberRef v7 = CFProperty;
    if (CFProperty)
    {
      CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
      if (valuePtr == 2) {
        break;
      }
    }
    IOObjectRelease(v3);
    CFRelease(v7);
    io_registry_entry_t v3 = IOIteratorNext(existing[1]);
    if (!v3) {
      goto LABEL_12;
    }
  }
  int v8 = 1;
LABEL_13:
  CFDictionaryRef v9 = IOServiceMatching("IOPortFeatureLDCM");
  if (IOServiceGetMatchingServices(v0, v9, existing)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = existing[0] == 0;
  }
  if (v10)
  {
    io_registry_entry_t v11 = 0;
    CFNumberRef v12 = 0;
LABEL_19:
    int v13 = 1;
    if (!v3) {
      goto LABEL_21;
    }
LABEL_20:
    IOObjectRelease(v3);
    goto LABEL_21;
  }
  io_object_t v15 = IOIteratorNext(existing[0]);
  io_registry_entry_t v11 = v15;
  if (v15)
  {
    CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      int valuePtr = -1431655766;
      CFNumberRef v17 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v11, @"ArchitectureVersion", v16, 0);
      if (v17)
      {
        CFNumberRef v12 = v17;
        CFNumberGetValue(v17, kCFNumberIntType, &valuePtr);
        if (valuePtr == 3) {
          goto LABEL_19;
        }
        IOObjectRelease(v11);
        CFRelease(v12);
      }
      io_registry_entry_t v11 = IOIteratorNext(existing[0]);
    }
    while (v11);
  }
  CFNumberRef v12 = 0;
  int v13 = 0;
  if (v3) {
    goto LABEL_20;
  }
LABEL_21:
  if (existing[1]) {
    IOObjectRelease(existing[1]);
  }
  if (v11) {
    IOObjectRelease(v11);
  }
  if (existing[0]) {
    IOObjectRelease(existing[0]);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v12) {
    CFRelease(v12);
  }
  return v8 & v13;
}

uint64_t IOAccessoryStartVoltageEventMonitorLegacy(uint64_t result)
{
  kern_return_t v26;
  CFDictionaryRef v27;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v29;
  __CFRunLoop *Main;
  IONotificationPort *v31;
  CFDictionaryRef v32;
  mach_port_t mainPort;
  void *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    CFDictionaryRef v1 = (__CFRunLoop *)result;
    BOOL v2 = dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 4);
    if (v2)
    {
      io_registry_entry_t v3 = v2;
      _ADClientAddValueForScalarKey = (uint64_t (*)(void, void))dlsym(v2, "ADClientAddValueForScalarKey");
      _ADClientClearDistributionKey = (uint64_t)dlsym(v3, "ADClientClearDistributionKey");
      _ADClientClearScalarKey = (uint64_t)dlsym(v3, "ADClientClearScalarKey");
      _ADClientPushValueForDistributionKey = (uint64_t (*)(void, double))dlsym(v3, "ADClientPushValueForDistributionKey");
      _ADClientSetValueForScalarKey = dlsym(v3, "ADClientSetValueForScalarKey");
    }
    io_object_t v4 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 4);
    if (v4) {
      _logEventForAppleCare = (uint64_t (*)(void))dlsym(v4, "logEventForAppleCare");
    }
    CFAllocatorRef v5 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 4);
    if (v5) {
      _FBSOpenApplicationOptionKeyPromptUnlockDevice_0 = (uint64_t)dlsym(v5, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    }
    uint64_t result = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
    gIOAMLogLock = result;
    if (result)
    {
      char v6 = (const void *)MGCopyAnswer();
      if (v6)
      {
        CFNumberRef v7 = v6;
        gIsInternalBuild = CFEqual(v6, @"Internal") != 0;
        CFRelease(v7);
      }
      else
      {
        gIsInternalBuild = 0;
      }
      mainPort = *MEMORY[0x1E4F2EF00];
      uint64_t result = (uint64_t)IONotificationPortCreate(*MEMORY[0x1E4F2EF00]);
      gIOnotify = result;
      if (result)
      {
        uint64_t result = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        gDockState = result;
        if (result)
        {
          id v8 = (id)result;
          uint64_t result = objc_alloc_init(IOAccessoryUserLdcmParamClass);
          gUserLdcmParams = result;
          if (result)
          {
            uint64_t result = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
            gHalogenMeasurements = result;
            if (result)
            {
              id v9 = (id)result;
              uint64_t result = [MEMORY[0x1E4F1CA60] dictionary];
              gDigitalIDTimeWetDict = result;
              if (result)
              {
                id v10 = (id)result;
                uint64_t result = [MEMORY[0x1E4F1CA60] dictionary];
                gDigitalIDCountWetDict = result;
                if (result)
                {
                  id v11 = (id)result;
                  CFNumberRef v12 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
                  if (!v12) {
                    goto LABEL_42;
                  }
                  uint64_t v13 = [v12 objectForKey:@"accyHealthDict"];
                  if (!v13) {
                    goto LABEL_42;
                  }
                  uint64_t v14 = v13;
                  uint64_t v34 = 0;
                  io_object_t v15 = (void *)MEMORY[0x1E4F28DC0];
                  CFAllocatorRef v16 = (void *)MEMORY[0x1E4F1CAD0];
                  uint64_t v17 = objc_opt_class();
                  uint64_t v18 = objc_opt_class();
                  double v19 = objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0), v14, &v34);
                  unsigned int v20 = v34;
                  if (v34)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v21 = objc_msgSend((id)objc_msgSend(v20, "localizedDescription"), "UTF8String");
                      *(_DWORD *)buf = 136315394;
                      uint64_t v36 = "retrievePersistentAccyHealthDictionary";
                      double v37 = 2080;
                      uint64_t v38 = v21;
                      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);
                      unsigned int v20 = v34;
                    }
                  }
                  if (v19)
                  {
                    gAccyHealthDictionary = [v19 mutableCopy];
                    if (gAccyHealthDictionary) {
                      goto LABEL_27;
                    }
                  }
                  else
                  {
LABEL_42:
                    if (gAccyHealthDictionary)
                    {
LABEL_27:
                      gAssetContext = 0;
                      byte_1EBE270F8 = 0;
                      int v23 = isDeviceTypeC_V3();
                      id v24 = (IONotificationPort *)gIOnotify;
                      if (v23)
                      {
                        CFDictionaryRef v25 = IOServiceMatching("IOPort");
                        uint64_t v26 = IOServiceAddMatchingNotification(v24, "IOServiceFirstPublish", v25, (IOServiceMatchingCallback)IOAccessoryServiceMatchingCallbackTypeC, (void *)gIOnotify, (io_iterator_t *)&gIOiter);
                        IOAccessoryServiceMatchingCallbackTypeC((IONotificationPort *)gIOnotify, gIOiter);
                      }
                      else
                      {
                        uint64_t v27 = IOServiceMatching("AppleTriStarBuiltIn");
                        uint64_t v26 = IOServiceAddMatchingNotification(v24, "IOServiceFirstPublish", v27, (IOServiceMatchingCallback)IOAccessoryServiceMatchingCallback, (void *)gIOnotify, (io_iterator_t *)&gIOiter);
                        IOAccessoryServiceMatchingCallback((IONotificationPort *)gIOnotify, gIOiter);
                      }
                      if (v26) {
                        return 0;
                      }
                      uint64_t result = (uint64_t)IONotificationPortGetRunLoopSource((IONotificationPortRef)gIOnotify);
                      if (result)
                      {
                        CFRunLoopAddSource(v1, (CFRunLoopSourceRef)result, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
                        if ([(id)gUserLdcmParams enableHalogenMitigationsAndUI] == 1)
                        {
                          qword_1EBE271E0 = 0;
                          qword_1EBE27200 = (uint64_t)v1;
                          qword_1EBE27208 = 0;
                        }
                        if (!gBatteryStatusNotificationContext)
                        {
                          gBatteryStatusNotificationContext = (uint64_t)IONotificationPortCreate(mainPort);
                          RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)gBatteryStatusNotificationContext);
                          if (RunLoopSource)
                          {
                            uint64_t v29 = RunLoopSource;
                            Main = CFRunLoopGetMain();
                            CFRunLoopAddSource(Main, v29, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
                            uint64_t v31 = (IONotificationPort *)gBatteryStatusNotificationContext;
                            uint64_t v32 = IOServiceMatching("IOPMPowerSource");
                            if (IOServiceAddMatchingNotification(v31, "IOServiceFirstMatch", v32, (IOServiceMatchingCallback)__powerBatteryMatch, &gBatteryStatusNotificationContext, (io_iterator_t *)&dword_1EBE27108))
                            {
                              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                                IOAccessoryStartVoltageEventMonitorLegacy_cold_1();
                              }
                            }
                            else
                            {
                              __powerBatteryMatch(&gBatteryStatusNotificationContext, dword_1EBE27108);
                            }
                          }
                        }
                        return 1;
                      }
                      return result;
                    }
                  }
                  gAccyHealthDictionary = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
                  id v22 = (id)gAccyHealthDictionary;
                  goto LABEL_27;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void IOAccessoryServiceMatchingCallbackTypeC(IONotificationPort *a1, io_iterator_t a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], "LDCM", 0x8000100u);
  io_object_t v6 = IOIteratorNext(a2);
  if (v6)
  {
    io_registry_entry_t v7 = v6;
    id v8 = 0;
    while (1)
    {
      io_object_t notification = -1431655766;
      CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(v7, @"FeaturesSupported", v4, 0);
      if (CFProperty)
      {
        CFArrayRef v10 = CFProperty;
        if (CFArrayGetCount(CFProperty) >= 1)
        {
          v15.length = CFArrayGetCount(v10);
          v15.location = 0;
          if (CFArrayContainsValue(v10, v15, v5))
          {
            id v11 = [[IOAccessoryLDCMPortManagerTypeC alloc] initWithParams:60 dryPollingIntervalNs:30];
            id v8 = v11;
            if (v11 && [(IOAccessoryLDCMPortManagerTypeC *)v11 typeC])
            {
              CFNumberRef v12 = [(IOAccessoryLDCMPortManagerTypeC *)v8 halogenTypeCDispatchQueue];
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __IOAccessoryServiceMatchingCallbackTypeC_block_invoke;
              block[3] = &unk_1E6B6D5A0;
              block[4] = v8;
              dispatch_async(v12, block);
            }
            if (IOServiceAddInterestNotification(a1, v7, "IOGeneralInterest", (IOServiceInterestCallback)IOAccessoryInterestNotificationCallbackTypeC, v8, &notification))
            {
              IOObjectRelease(v7);
              if (!v5) {
                goto LABEL_17;
              }
LABEL_16:
              CFRelease(v5);
              goto LABEL_17;
            }
          }
        }
        IOObjectRelease(v7);
        CFRelease(v10);
      }
      else
      {
        IOObjectRelease(v7);
      }
      io_registry_entry_t v7 = IOIteratorNext(a2);
      if (!v7) {
        goto LABEL_15;
      }
    }
  }
  id v8 = 0;
LABEL_15:
  if (v5) {
    goto LABEL_16;
  }
LABEL_17:
  if (v8) {
}
  }

void IOAccessoryServiceMatchingCallback(IONotificationPort *a1, io_iterator_t iterator)
{
  kern_return_t v31;
  _DWORD *v32;
  _DWORD *v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  uint64_t v40;
  HalogenWrapper *v41;
  HalogenMeasurement *v42;
  NSObject *v43;
  char v44;
  CFStringRef identifier;
  CFAllocatorRef allocator;
  int v49;
  void v50[5];
  void block[4];
  int v52;
  io_object_t notification;
  io_connect_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  io_connect_t connect[4];
  long long v61;
  long long v62;
  long long v63;
  long long v64;
  long long v65;
  long long v66;
  long long v67;
  uint64_t v68;
  uint64_t v69;

  char v69 = *MEMORY[0x1E4F143B8];
  uint64_t v54 = 0;
  uint64_t v2 = IOIteratorNext(iterator);
  io_registry_entry_t v3 = 0;
  if (!v2)
  {
LABEL_67:
    uint64_t v44 = 1;
    goto LABEL_70;
  }
  allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  identifier = (const __CFString *)*MEMORY[0x1E4F1D198];
  p_info = HalogenWrapper.info;
  CFStringRef v5 = MEMORY[0x1E4F14500];
  while (1)
  {
    io_object_t notification = -1431655766;
    int Type = IOAccessoryManagerGetType();
    BOOL v7 = (Type & 0x600) != 0 && (Type & 0xF0) == 0;
    if ((IOAccessoryManagerGetType() & 0xF0) != 0
      || (CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v2, @"SupportsEisAfe", allocator, 0)) == 0)
    {
      uint64_t PrimaryPort = IOAccessoryManagerGetPrimaryPort();
      int v12 = 0;
      if (!v7) {
        goto LABEL_47;
      }
    }
    else
    {
      CFBooleanRef v9 = CFProperty;
      int Value = CFBooleanGetValue(CFProperty);
      CFRelease(v9);
      uint64_t PrimaryPort = IOAccessoryManagerGetPrimaryPort();
      if (Value)
      {
        if ([(__objc2_class_ro *)p_info[66] enableHalogenMitigationsAndUI] == 1) {
          [(__objc2_class_ro *)p_info[66] setUserBehaviorMask:47];
        }
        int v12 = 1;
      }
      else
      {
        int v12 = 0;
        if (!v7) {
          goto LABEL_47;
        }
      }
    }
    uint64_t v49 = v12;
    uint64_t v13 = v3;
    uint64_t v14 = v5;
    CFRange v15 = p_info;
    [(id)gIOAMLogLock lock];
    if (gIOAMLogFilepath)
    {

      gIOAMLogFilepath = 0;
    }
    gIOAMLogFilepath = [MEMORY[0x1E4F28E78] stringWithString:@"/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/"];
    id v16 = (id)gIOAMLogFilepath;
    BOOL v59 = 0;
    *(void *)io_connect_t connect = 0;
    uint64_t v57 = 0;
    unsigned int v58 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    CFTimeZoneRef v17 = CFTimeZoneCopySystem();
    if (v17) {
      break;
    }
LABEL_26:
    [(id)gIOAMLogLock unlock];
    connect[0] = 0;
    if (IOServiceOpen(v2, *MEMORY[0x1E4F14960], 0, connect)) {
      BOOL v27 = 0;
    }
    else {
      BOOL v27 = IOAccessoryManagerGetLdcmParams() == 0;
    }
    p_info = v15;
    CFStringRef v5 = v14;
    if (connect[0]) {
      IOServiceClose(connect[0]);
    }
    io_registry_entry_t v3 = v13;
    if (!v27) {
      goto LABEL_69;
    }
    if ((Type & 0x200) != 0) {
      [(__objc2_class_ro *)p_info[66] setUserBehaviorMask:[(__objc2_class_ro *)p_info[66] userBehaviorMask] & 0xFFFFFFFBLL];
    }
    int v12 = v49;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      connect[0] = 136315138;
      *(void *)&connect[1] = "retrievePersistentConfigDictParams";
      _os_log_impl(&dword_1D9622000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)connect, 0xCu);
    }
    uint64_t v28 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    if (v28)
    {
      uint64_t v29 = (void *)[v28 objectForKey:@"configDictionary"];
      if (v29)
      {
        if (v7) {
          processLdcmBehaviorPlist(v29, Type);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        connect[0] = 136315138;
        *(void *)&connect[1] = "retrievePersistentConfigDictParams";
        _os_log_impl(&dword_1D9622000, v5, OS_LOG_TYPE_DEFAULT, "%s: no persistent dictionary", (uint8_t *)connect, 0xCu);
      }
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __IOAccessoryServiceMatchingCallback_block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    uint64_t v52 = Type;
    dispatch_async(global_queue, block);
    if (IOServiceOpen(v2, *MEMORY[0x1E4F14960], 0, &v54)) {
      goto LABEL_69;
    }
    if (IOAccessoryManagerSetVoltageDetected()) {
      goto LABEL_69;
    }
    setDriverMitigationEnabled(PrimaryPort, v2, ([(__objc2_class_ro *)p_info[66] userBehaviorMask] >> 3) & 1);
    uint64_t v31 = IOServiceClose(v54);
    uint64_t v54 = 0;
    if (v31) {
      goto LABEL_69;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_1D9622000, v5, OS_LOG_TYPE_DEFAULT, ">>> showing initial accy health dictionary", (uint8_t *)connect, 2u);
    }
    dbgShowAccyHealthDictionary();
LABEL_47:
    uint64_t v32 = malloc_type_calloc(1uLL, 0x88uLL, 0x10800406FDFDDCEuLL);
    if (!v32) {
      goto LABEL_69;
    }
    uint64_t v33 = v32;
    __CFString *v32 = 2;
    *((void *)v32 + 13) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v33[32] = 5000;
    *(_OWORD *)io_connect_t connect = *(_OWORD *)v33;
    uint64_t v34 = *((_OWORD *)v33 + 1);
    uint64_t v35 = *((_OWORD *)v33 + 2);
    uint64_t v36 = *((_OWORD *)v33 + 4);
    int v63 = *((_OWORD *)v33 + 3);
    double v64 = v36;
    v61 = v34;
    int v62 = v35;
    double v37 = *((_OWORD *)v33 + 5);
    uint64_t v38 = *((_OWORD *)v33 + 6);
    uint64_t v39 = *((_OWORD *)v33 + 7);
    CFStringRef v68 = *((void *)v33 + 16);
    double v66 = v38;
    int v67 = v39;
    double v65 = v37;
    uint64_t v40 = [MEMORY[0x1E4F29238] valueWithDockState:connect];
    free(v33);
    objc_msgSend((id)gDockState, "setObject:forKey:", v40, objc_msgSend(NSNumber, "numberWithInt:", PrimaryPort));
    if (v12)
    {
      uint64_t v41 = objc_alloc_init(HalogenWrapper);
      if (v41)
      {
        io_registry_entry_t v3 = v41;
        objc_msgSend((id)gHalogenMeasurements, "setObject:forKey:", v41, objc_msgSend(NSNumber, "numberWithInt:", PrimaryPort));
        uint64_t v42 = [[HalogenMeasurement alloc] initWithSize:[(__objc2_class_ro *)p_info[66] numEisHalogenSamples] onPort:PrimaryPort];
        if (v42)
        {
          [(HalogenWrapper *)v3 setHalogenMeasurement:v42];
          [(HalogenWrapper *)v3 setService:v2];
          [(HalogenWrapper *)v3 setPortID:PrimaryPort];
        }
        else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          connect[0] = 136315138;
          *(void *)&connect[1] = "IOAccessoryServiceMatchingCallback";
          _os_log_impl(&dword_1D9622000, v5, OS_LOG_TYPE_DEFAULT, "%s failed to allocate HalogenMeasurement\n", (uint8_t *)connect, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          connect[0] = 136315138;
          *(void *)&connect[1] = "IOAccessoryServiceMatchingCallback";
          _os_log_impl(&dword_1D9622000, v5, OS_LOG_TYPE_DEFAULT, "%s Failed to create halogenWrapper\n", (uint8_t *)connect, 0xCu);
        }
        io_registry_entry_t v3 = 0;
      }
    }
    if (IOServiceAddInterestNotification(a1, v2, "IOGeneralInterest", (IOServiceInterestCallback)IOAccessoryInterestNotificationCallback, 0, &notification))
    {
      goto LABEL_69;
    }
    if (IOAccessoryManagerGetAccessoryID() == 91)
    {
      IOAccessoryHandleAttach(v2);
    }
    else if (v3 && ([(__objc2_class_ro *)p_info[66] userBehaviorMask] & 0x10) != 0)
    {
      [(HalogenWrapper *)v3 setIsMeasurementEnabled:1];
      uint64_t v43 = [(HalogenWrapper *)v3 halogenMeasurementDispatchQueue];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __IOAccessoryServiceMatchingCallback_block_invoke_535;
      v50[3] = &unk_1E6B6D5A0;
      v50[4] = v3;
      dispatch_async(v43, v50);
    }
    IOObjectRelease(v2);
    uint64_t v2 = IOIteratorNext(iterator);
    if (!v2) {
      goto LABEL_67;
    }
  }
  CFTimeZoneRef v18 = v17;
  double v19 = CFCalendarCreateWithIdentifier(0, identifier);
  if (!v19)
  {
    CFRelease(v18);
    goto LABEL_26;
  }
  unsigned int v20 = v19;
  CFCalendarSetTimeZone(v19, v18);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFCalendarDecomposeAbsoluteTime(v20, Current, "MdyHms", connect, &v59, &v58, &v57, &v56, &v55);
  uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%02d%02d%02d-%02d%02d", *(void *)connect, v59, v58 % 0x64, v57, v56);
  CFRelease(v18);
  CFRelease(v20);
  if (!v22) {
    goto LABEL_26;
  }
  [(id)gIOAMLogFilepath appendString:v22];
  [(id)gIOAMLogFilepath appendString:@".log"];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", @"/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/") & 1) != 0|| objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", @"/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/", 1, 0, 0))
  {
    int v23 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if (([v23 fileExistsAtPath:gIOAMLogFilepath] & 1) != 0
      || (id v24 = (void *)[MEMORY[0x1E4F28CB8] defaultManager],
          [v24 createFileAtPath:gIOAMLogFilepath contents:0 attributes:0]))
    {
      CFDictionaryRef v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", @"/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/", 0);
      if ((unint64_t)[v25 count] < 4) {
        goto LABEL_26;
      }
      uint64_t v26 = objc_msgSend(@"/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/", "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_0), "firstObject"));
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v26, 0)) {
        goto LABEL_26;
      }
    }
  }
  [(id)gIOAMLogLock unlock];
  io_registry_entry_t v3 = v13;
LABEL_69:
  uint64_t v44 = 0;
LABEL_70:
  if (v54) {
    IOServiceClose(v54);
  }
  if ((v44 & 1) == 0) {
    IOObjectRelease(v2);
  }
  if (v3) {
}
  }

uint64_t IOAccessoryVoltageEventMonitorMode(uint64_t result, char a2, char a3)
{
  enableVoltageEventMonitorModeAggD = result;
  enableVoltageEventMonitorModeAppleCareLogging = a2;
  enableVoltageEventMonitorModeConsole = a3;
  return result;
}

uint64_t IOAccessoryResetLifetimeDuration(io_registry_entry_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  if (!v3) {
    return 0;
  }
  CFNumberRef v4 = v3;
  uint64_t v5 = IORegistryEntrySetCFProperty(a1, @"acc-mb-ld-lifetime", v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOAccessoryRequestResetLifetimeDuration(int a1)
{
  io_iterator_t existing = 0;
  mach_port_t v2 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v3 = IOServiceMatching("AppleTriStarBuiltIn");
  uint64_t MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  if (MatchingServices)
  {
    uint64_t v7 = MatchingServices;
  }
  else
  {
    while (1)
    {
      io_registry_entry_t v5 = IOIteratorNext(existing);
      if (!v5) {
        break;
      }
      io_object_t v6 = v5;
      uint64_t v7 = IOAccessoryResetLifetimeDuration(v5, a1);
      IOObjectRelease(v6);
      if (v7) {
        goto LABEL_6;
      }
    }
    uint64_t v7 = 0;
  }
LABEL_6:
  if (existing) {
    IOObjectRelease(existing);
  }
  return v7;
}

unint64_t absoluteToNanoseconds(uint64_t a1)
{
  unsigned int v2 = dword_1EA8C4C4C;
  if (!dword_1EA8C4C4C)
  {
    mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    unsigned int v2 = dword_1EA8C4C4C;
  }
  return (unint64_t)sTimebaseInfo * a1 / v2;
}

uint64_t __IOAccessoryServiceMatchingCallbackTypeC_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performTypeCMeasurement];
}

void IOAccessoryInterestNotificationCallbackTypeC(void *a1, io_registry_entry_t entry, int a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 == -469794615)
  {
    CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, @"ConnectionActive", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      CFBooleanRef v5 = CFProperty;
      if (a1)
      {
        int Value = CFBooleanGetValue(CFProperty);
        BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
        if (Value)
        {
          if (v7)
          {
            int v8 = 136315138;
            CFBooleanRef v9 = "IOAccessoryInterestNotificationCallbackTypeC";
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s kIOPort_Message_ConnectionStateChange attach\n", (uint8_t *)&v8, 0xCu);
          }
          [a1 handleAttachEvent];
        }
        else
        {
          if (v7)
          {
            int v8 = 136315138;
            CFBooleanRef v9 = "IOAccessoryInterestNotificationCallbackTypeC";
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s kIOPort_Message_ConnectionStateChange detach \n", (uint8_t *)&v8, 0xCu);
          }
          [a1 handleDetachEvent];
        }
      }
      CFRelease(v5);
    }
  }
}

void __IOAccessoryServiceMatchingCallback_block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    CFDictionaryRef v3 = "IOAccessoryServiceMatchingCallback_block_invoke";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s starting remote asset query\n", (uint8_t *)&v2, 0xCu);
  }
  performAssetQuery(0, *(_DWORD *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    CFDictionaryRef v3 = "IOAccessoryServiceMatchingCallback_block_invoke";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s finished remote asset query\n", (uint8_t *)&v2, 0xCu);
  }
}

void performAssetQuery(uint64_t a1, __int16 a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v32 = "performAssetQuery";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
  }
  uint64_t v29 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F77FA0]) initWithAssetType:@"com.apple.MobileAsset.IOAccessoryManager"];
  [v4 setQueriesLocalAssetInformationOnly:a1];
  uint64_t v5 = [v4 runQueryAndReturnError:&v29];
  io_object_t v6 = v29;
  if (v29)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "localizedDescription"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      uint64_t v32 = "performAssetQuery";
      __int16 v33 = 2080;
      uint64_t v34 = v7;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: encountered error: %s\n", buf, 0x16u);
    }

    return;
  }
  int v8 = (void *)v5;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
    *(_DWORD *)buf = 136315394;
    uint64_t v32 = "performAssetQuery";
    __int16 v33 = 2080;
    uint64_t v34 = v9;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: MobileAsset query results: %s\n", buf, 0x16u);
  }
  uint64_t v10 = objc_msgSend(v8, "lastObject", v29);
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v32 = "getAsset";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
    }
    if ((a1 & 1) == 0 && ([v10 state] != 1 || !objc_msgSend(v10, "localURL")))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "getAsset";
        __int16 v33 = 2080;
        uint64_t v34 = v11;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Asset not yet downloaded, fetching: %s", buf, 0x16u);
      }
      id v30 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v32 = "downloadAssetWithError";
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
      }
      if (([v10 requiredDiskSpaceIsAvailable:0 error:&v30] & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
          uint64_t v26 = objc_msgSend((id)objc_msgSend(v30, "description"), "UTF8String");
          *(_DWORD *)buf = 136315650;
          uint64_t v32 = "downloadAssetWithError";
          __int16 v33 = 2080;
          uint64_t v34 = v25;
          __int16 v35 = 2080;
          uint64_t v36 = v26;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Skipping download for uninstalled asset. Error in asset %s: %s\n", buf, 0x20u);
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_48;
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v32 = "getAsset";
        int v23 = MEMORY[0x1E4F14500];
        id v24 = "%s: failed\n";
        goto LABEL_47;
      }
      [v10 beginDownloadWithOptions:0];
    }
    if (![v10 localURL])
    {
LABEL_48:
      int v22 = 0;
      goto LABEL_49;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "localURL"), "description"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      uint64_t v32 = "getAsset";
      __int16 v33 = 2080;
      uint64_t v34 = v12;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Asset on disk, found at: %s\n", buf, 0x16u);
    }
    uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "localURL"), "URLByAppendingPathComponent:", @"IOAccessoryManagerLdcmBehavior.plist"), "absoluteString");
    uint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
    CFRange v15 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v14];
    BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v32 = "load_dict";
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dictionaryWithContentsOfURL succeeded\n", buf, 0xCu);
      }
      gLdcmBehaviorPlist = (uint64_t)v15;
      id v17 = v15;
      id v18 = (id)gLdcmBehaviorPlist;
      if (v18)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v32 = "commitPersistentConfigDictParams";
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
        }
        double v19 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
        unsigned int v20 = v19;
        if (v19) {
          [v19 setObject:gLdcmBehaviorPlist forKey:@"configDictionary"];
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          if (v20) {
            uint64_t v21 = "true";
          }
          else {
            uint64_t v21 = "false";
          }
          *(_DWORD *)buf = 136315394;
          uint64_t v32 = "getAsset";
          __int16 v33 = 2080;
          uint64_t v34 = (uint64_t)v21;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: commitPersistentConfigDictParams: success=%s", buf, 0x16u);
        }
        int v22 = processLdcmBehaviorPlist(v18, a2);
        goto LABEL_49;
      }
    }
    else if (v16)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v32 = "load_dict";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dictionaryWithContentsOfURL failed\n", buf, 0xCu);
    }
    int v22 = 0;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
LABEL_49:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        if (v22) {
          BOOL v27 = "true";
        }
        else {
          BOOL v27 = "false";
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "getAsset";
        __int16 v33 = 2080;
        uint64_t v34 = (uint64_t)v27;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: success=%s\n", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        if (v22) {
          uint64_t v28 = "true";
        }
        else {
          uint64_t v28 = "false";
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "performAssetQuery";
        __int16 v33 = 2080;
        uint64_t v34 = (uint64_t)v28;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: getOrDownloadAsset: %s\n", buf, 0x16u);
      }
      return;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v32 = "getAsset";
    int v23 = MEMORY[0x1E4F14500];
    id v24 = "%s: load_dict failed\n";
LABEL_47:
    _os_log_impl(&dword_1D9622000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
    goto LABEL_48;
  }
}

void sub_1D9632704(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "performAssetQuery";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: exception\n", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x1D963207CLL);
  }
  _Unwind_Resume(a1);
}

void setDriverMitigationEnabled(int a1, io_service_t service, int a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  io_connect_t connect = 0;
  if (IOServiceOpen(service, *MEMORY[0x1E4F14960], 0, &connect))
  {
    BOOL v5 = 0;
  }
  else
  {
    [(id)gUserLdcmParams userBehaviorMask];
    [(id)gUserLdcmParams userBehaviorMask];
    BOOL v5 = IOAccessoryManagerConfigureGoldbondMode() == 0;
  }
  if (connect) {
    IOServiceClose(connect);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v8 = a1;
    __int16 v9 = 1024;
    int v10 = a3;
    __int16 v11 = 1024;
    BOOL v12 = v5;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) ~~~ setDriverMitigationEnabled [%d] returned %d", buf, 0x14u);
  }
}

void IOAccessoryInterestNotificationCallback(uint64_t a1, io_registry_entry_t a2, int a3, unsigned int *a4)
{
  kern_return_t v177;
  unsigned int v178;
  io_service_t v179;
  void *v180;
  unsigned char *v181;
  unsigned int *v182;
  unsigned char v183[32];
  unsigned char v184[29];
  io_connect_t connect;
  uint8_t v186[4];
  int v187;
  _OWORD v188[4];
  long long v189;
  unsigned char v190[48];
  long long v191;
  uint64_t valuePtr;
  int v193;
  unsigned char buf[32];
  unsigned char v195[32];
  long long v196;
  long long v197;
  long long v198;
  long long v199;
  uint64_t v200;
  unsigned char v201[136];
  uint64_t v202;
  uint64_t vars8;

  v202 = *MEMORY[0x1E4F143B8];
  if (a3 <= -469794790)
  {
    if (a3 == -536870896)
    {
      if (gDockState)
      {
        uint64_t PrimaryPort = IOAccessoryManagerGetPrimaryPort();
        if (PrimaryPort)
        {
          uint64_t v31 = PrimaryPort;
          uint64_t v32 = objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", PrimaryPort));
          if (v32)
          {
            [v32 dockStateValue];
            __int16 v33 = *(void **)&v201[104];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v201 = 67109120;
              *(_DWORD *)&v201[4] = v31;
              _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Event: Terminated", v201, 8u);
            }

            objc_msgSend((id)gDockState, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v31));
            objc_msgSend((id)gHalogenMeasurements, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v31));
          }
        }
      }
      return;
    }
    if (a3 != -536870608)
    {
      if (a3 != -469794799) {
        return;
      }
      goto LABEL_33;
    }
    memset(v183, 170, 6);
    if (!gDockState) {
      return;
    }
    uint64_t v34 = IOAccessoryManagerGetPrimaryPort();
    if (!v34) {
      return;
    }
    uint64_t v26 = v34;
    __int16 v35 = objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v34));
    if (!v35) {
      return;
    }
    LODWORD(valuePtr) = -1431655766;
    [v35 dockStateValue];
    *(_OWORD *)v195 = *(_OWORD *)&v201[32];
    *(_OWORD *)&v195[16] = *(_OWORD *)&v201[48];
    *(void *)&v196 = *(void *)&v201[64];
    *(_OWORD *)buf = *(_OWORD *)v201;
    *(_OWORD *)&buf[16] = *(_OWORD *)&v201[16];
    char v36 = v201[72];
    v188[0] = *(_OWORD *)&v201[73];
    *(void *)((char *)v188 + 15) = *(void *)&v201[88];
    *(void *)&v190[14] = *(void *)&v201[128];
    v189 = *(_OWORD *)&v201[98];
    *(_OWORD *)v190 = *(_OWORD *)&v201[114];
    if ((v201[72] & 1) == 0) {
      return;
    }
    if ((v201[96] | v201[97])) {
      return;
    }
    if (IOAccessoryManagerGetDigitalID()) {
      return;
    }
    CFAllocatorRef v37 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a2, @"IOAccessoryOrientation", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (!CFProperty) {
      return;
    }
    CFNumberRef v39 = CFProperty;
    int Value = CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
    CFRelease(v39);
    if (!Value) {
      return;
    }
    CFBooleanRef v41 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a2, @"IOAccessoryPowerHandshake", v37, 0);
    if (!v41) {
      return;
    }
    CFBooleanRef v42 = v41;
    int v43 = CFBooleanGetValue(v41);
    CFRelease(v42);
    BOOL v44 = v43 == 1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v201 = 67109632;
      *(_DWORD *)&v201[4] = v26;
      *(_WORD *)&v201[8] = 1024;
      *(_DWORD *)&v201[10] = v43 == 0;
      *(_WORD *)&v201[14] = 1024;
      *(_DWORD *)&v201[16] = v43 == 1;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Event: PH update, failed = %d, success = %d", v201, 0x14u);
    }
    if (v43)
    {
      char v47 = 0;
    }
    else
    {
      CFStringRef v45 = CFStringCreateWithFormat(v37, 0, @".%02x%02x%02x%02x%02x%02x%d", v183[0], v183[1], v183[2], v183[3], v183[4], v183[5], valuePtr);
      MutableCopy = CFStringCreateMutableCopy(v37, 0, @"com.apple.ioaccessorymanager.powerhandshakefail");
      CFStringAppend(MutableCopy, v45);
      if (_ADClientAddValueForScalarKey) {
        _ADClientAddValueForScalarKey(MutableCopy, 1);
      }
      CFRelease(MutableCopy);
      CFRelease(v45);
      char v47 = 1;
    }
    *(_OWORD *)&v201[32] = *(_OWORD *)v195;
    *(_OWORD *)&v201[48] = *(_OWORD *)&v195[16];
    *(_OWORD *)v201 = *(_OWORD *)buf;
    *(_OWORD *)&v201[16] = *(_OWORD *)&buf[16];
    *(_OWORD *)&v201[73] = v188[0];
    *(void *)&v201[128] = *(void *)&v190[14];
    *(_OWORD *)&v201[114] = *(_OWORD *)v190;
    *(void *)&v201[64] = v196;
    v201[72] = v36;
    *(void *)&v201[88] = *(void *)((char *)v188 + 15);
    v201[96] = v47;
    v201[97] = v44;
    *(_OWORD *)&v201[98] = v189;
    uint64_t v48 = [MEMORY[0x1E4F29238] valueWithDockState:v201];
    uint64_t v49 = (void *)gDockState;
    uint64_t v50 = NSNumber;
LABEL_128:
    objc_msgSend(v49, "setObject:forKey:", v48, objc_msgSend(v50, "numberWithInt:", v26));
    return;
  }
  if (a3 == -469794725)
  {
    IOAccessoryHandleAttach(a2);
    return;
  }
  if (a3 != -469794726)
  {
    if (a3 != -469794789) {
      return;
    }
    BOOL v5 = a4;
    if (!a4) {
      return;
    }
    if (!gDockState) {
      return;
    }
    uint64_t v6 = *a4;
    if (!objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v6))) {
      return;
    }
    v182 = v5;
    v179 = a2;
    if (enableVoltageEventMonitorModeConsole)
    {
      unint64_t v7 = *((unsigned __int8 *)v5 + 12);
      if (v7 > 3) {
        int v8 = "Invalid";
      }
      else {
        int v8 = IOAccessoryGetEventCodeForIndex_eventCodeStr[v7];
      }
      v180 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@" (%d) Event: %s, TimeStamp = %llu, Vhuint64_t i = %d, CumulativeTimeVhuint64_t i = %d sec,", v6, v8, *(void *)(v5 + 1), *((unsigned __int8 *)v5 + 13), *(unsigned int *)((char *)v5 + 46)];
      v9 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@" (%d) Event: %s, Vhuint64_t i = %d, CumulativeTimeVhuint64_t i = %d sec,", v6, v8, *((unsigned __int8 *)v5 + 13), *(unsigned int *)((char *)v5 + 46)];
      unint64_t v10 = *((unsigned __int8 *)v5 + 45);
      if (v10 > 6) {
        __int16 v11 = "Invalid";
      }
      else {
        __int16 v11 = IOAccessoryGetPowerModeStrForIndex_pwrModeStr[v10];
      }
      unint64_t v12 = *((unsigned __int8 *)v5 + 51);
      if (v12 > 2) {
        uint64_t v13 = "Invalid";
      }
      else {
        uint64_t v13 = IOAccessoryGetOrientStrForIndex_orientStr[v12];
      }
      if (*((unsigned char *)v5 + 52)) {
        uint64_t v14 = "Yes";
      }
      else {
        uint64_t v14 = "No";
      }
      [v180 appendString:objc_msgSend(NSString, "stringWithFormat:", @" DigitalID = [%02x %02x %02x %02x %02x %02x], ORIENT = %s, PH = %s, ACC_PWR = %s", *((unsigned __int8 *)v5 + 14), *((unsigned __int8 *)v5 + 15), *((unsigned __int8 *)v5 + 16), *((unsigned __int8 *)v5 + 17), *((unsigned __int8 *)v5 + 18), *((unsigned __int8 *)v5 + 19), v13, v14, v11)];
      if (*((unsigned char *)v5 + 52)) {
        CFRange v15 = "Yes";
      }
      else {
        CFRange v15 = "No";
      }
      [v9 appendString:objc_msgSend(NSString, "stringWithFormat:", @" DigitalID = [%02x %02x %02x %02x %02x %02x], ORIENT = %s, PH = %s, ACC_PWR = %s", *((unsigned __int8 *)v5 + 14), *((unsigned __int8 *)v5 + 15), *((unsigned __int8 *)v5 + 16), *((unsigned __int8 *)v5 + 17), *((unsigned __int8 *)v5 + 18), *((unsigned __int8 *)v5 + 19), v13, v15, v11)];
      uint64_t v17 = 0;
      id v18 = v5 + 5;
      do
      {
        if (*((unsigned char *)v18 + v17))
        {
          unint64_t v19 = *((unsigned __int8 *)v18 + v17 + 6);
          if (v19 > 1) {
            unsigned int v20 = "Invalid";
          }
          else {
            unsigned int v20 = IOAccessoryGetMeasStrForIndex_measStr[v19];
          }
          LOWORD(v16) = *((_WORD *)v18 + v17 + 6);
          double v21 = (double)v16 / 1000.0;
          int v22 = IOAccessoryGetPinStrForIndex_pinStr[v17];
          [v180 appendString:objc_msgSend(NSString, "stringWithFormat:", @", %s(%s) = %.3fV", v20, v22, *(void *)&v21)];
          [v9 appendString:objc_msgSend(NSString, "stringWithFormat:", @", %s(%s) = .3%fV", v20, v22, *(void *)&v21)];
          BOOL v5 = v182;
        }
        ++v17;
      }
      while (v17 != 4);
      if (os_log_type_enabled(0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v201 = 138412290;
        *(void *)&v201[4] = v180;
        _os_log_impl(&dword_1D9622000, 0, OS_LOG_TYPE_DEFAULT, "%@", v201, 0xCu);
      }
    }
    else
    {
      __int16 v9 = 0;
    }
    if (gPrevLog)
    {

      gPrevLog = 0;
    }
    if (v9)
    {
      gPrevLog = [NSString stringWithString:v9];
      id v57 = (id)gPrevLog;
    }
    IOAccessoryManagerGetType();
    if (enableVoltageEventMonitorModeAppleCareLogging)
    {
      unsigned int v58 = (void *)[MEMORY[0x1E4F1CA48] array];
      if (enableVoltageEventMonitorModeAppleCareLogging)
      {
        unint64_t v59 = *((char *)v5 + 12);
        if (v59 <= 2)
        {
          v60 = v58;
          v61 = off_1E6B6D840[v59];
          objc_msgSend(v58, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", 100));
          [v60 addObject:v61];
          for (uint64_t i = 0; i != 4; ++i)
          {
            if (*((unsigned char *)v5 + i + 20))
            {
              LOWORD(v62) = *((_WORD *)v5 + i + 16);
              double v64 = (double)v62 / 1000.0;
            }
            else
            {
              double v64 = 0.0;
            }
            [v60 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%s", IOAccessoryGetPinStrForIndex_pinStr[i])];
            objc_msgSend(v60, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v64));
          }
          [v60 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%02x %02x %02x %02x %02x %02x", *((unsigned __int8 *)v5 + 14), *((unsigned __int8 *)v5 + 15), *((unsigned __int8 *)v5 + 16), *((unsigned __int8 *)v5 + 17), *((unsigned __int8 *)v5 + 18), *((unsigned __int8 *)v5 + 19))];
          [v60 addObject:objc_msgSend(NSString, "stringWithFormat:", @"0x%x", *v5)];
          objc_msgSend(v60, "addObject:", objc_msgSend(NSNumber, "numberWithBool:", 0));
          objc_msgSend(v60, "addObject:", objc_msgSend(NSNumber, "numberWithBool:", 0));
          objc_msgSend(v60, "addObject:", objc_msgSend(NSNumber, "numberWithBool:", *((unsigned char *)v5 + 44) != 0));
          if (gAppleCareLogArray)
          {
            int v65 = objc_msgSend(v60, "isEqualToArray:");

            gAppleCareLogArray = 0;
            int v66 = v65 ^ 1;
          }
          else
          {
            int v66 = 1;
          }
          gAppleCareLogArray = [MEMORY[0x1E4F1C978] arrayWithArray:v60];
          id v67 = (id)gAppleCareLogArray;
          if (_logEventForAppleCare)
          {
            if (v66) {
              _logEventForAppleCare(v60);
            }
          }
        }
      }
    }
    int v68 = *((unsigned __int8 *)v5 + 12);
    if (v68 == 3)
    {
      if (!gDockState) {
        return;
      }
      uint64_t v26 = *v5;
      v77 = objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v26));
      if (!v77) {
        return;
      }
      [v77 dockStateValue];
      *(_OWORD *)v195 = *(_OWORD *)&v201[36];
      *(_OWORD *)&v195[16] = *(_OWORD *)&v201[52];
      int v78 = *(_DWORD *)v201;
      LODWORD(v196) = *(_DWORD *)&v201[68];
      *(_OWORD *)buf = *(_OWORD *)&v201[4];
      *(_OWORD *)&buf[16] = *(_OWORD *)&v201[20];
      char v79 = v201[72];
      char v80 = v201[73];
      *(_OWORD *)&v190[30] = *(_OWORD *)&v201[120];
      *(_OWORD *)v190 = *(_OWORD *)&v201[90];
      *(_OWORD *)&v190[16] = *(_OWORD *)&v201[106];
      v189 = *(_OWORD *)&v201[74];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v201 = 67109632;
        *(_DWORD *)&v201[4] = v26;
        *(_WORD *)&v201[8] = 1024;
        *(_DWORD *)&v201[10] = v78;
        *(_WORD *)&v201[14] = 1024;
        *(_DWORD *)&v201[16] = v79 & 1;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Event: GoldbondDisabledMbHeadset, CurrentVoltageState = %d, gPlug = %d", v201, 0x14u);
      }
      if (v80) {
        return;
      }
      *(_OWORD *)&v201[20] = *(_OWORD *)&buf[16];
      *(_OWORD *)&v201[36] = *(_OWORD *)v195;
      *(_OWORD *)&v201[52] = *(_OWORD *)&v195[16];
      *(_OWORD *)&v201[4] = *(_OWORD *)buf;
      *(_OWORD *)&v201[120] = *(_OWORD *)&v190[30];
      *(_OWORD *)&v201[106] = *(_OWORD *)&v190[16];
      *(_OWORD *)&v201[90] = *(_OWORD *)v190;
      gGiveUserRadarOption = 1;
      *(_DWORD *)v201 = v78;
      *(_DWORD *)&v201[68] = v196;
      v201[72] = v79;
      v201[73] = 1;
      *(_OWORD *)&v201[74] = v189;
      uint64_t v48 = [MEMORY[0x1E4F29238] valueWithDockState:v201];
      uint64_t v49 = (void *)gDockState;
      uint64_t v50 = NSNumber;
      goto LABEL_128;
    }
    if (v68 != 2) {
      return;
    }
    if (!gDockState) {
      return;
    }
    unsigned int v69 = *v182;
    int v70 = objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", *v182));
    if (!v70) {
      return;
    }
    *(_OWORD *)&v201[80] = unk_1D964D038;
    memset(&v201[96], 170, 40);
    memset(v201, 170, 80);
    [v70 dockStateValue];
    *(_OWORD *)&v201[96] = v198;
    *(_OWORD *)&v201[112] = v199;
    *(void *)&v201[128] = v200;
    *(_OWORD *)&v201[32] = *(_OWORD *)v195;
    *(_OWORD *)&v201[48] = *(_OWORD *)&v195[16];
    *(_OWORD *)&v201[64] = v196;
    *(_OWORD *)&v201[80] = v197;
    *(_OWORD *)v201 = *(_OWORD *)buf;
    *(_OWORD *)&v201[16] = *(_OWORD *)&buf[16];
    io_connect_t connect = 0;
    *(void *)&long long v71 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v71 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v184[13] = v71;
    *(_OWORD *)&v183[16] = v71;
    *(_OWORD *)v184 = v71;
    *(_OWORD *)v183 = v71;
    if (HIDWORD(v199)) {
      *(_DWORD *)&v201[124] = HIDWORD(v199) - 1;
    }
    uint64_t v72 = (uint64_t)v182;
    v181 = (char *)v182 + 14;
    p_info = (__objc2_class_ro **)(HalogenWrapper + 32);
    v177 = IOServiceOpen(v179, *MEMORY[0x1E4F14960], 0, &connect);
    v178 = v69;
    if (v177)
    {
      int v176 = 0;
      int v129 = 0;
LABEL_222:
      if (*(_DWORD *)&v201[124] && !v176) {
        IOAccessoryManagerRequestLdcmMeasurement();
      }
      if (connect) {
        IOServiceClose(connect);
      }
      if (v201[112])
      {
        if (!v201[132] && *(void *)&v201[40])
        {
          __int16 v130 = (void *)-[__objc2_class_ro objectForKey:](p_info[29], "objectForKey:", objc_msgSend(NSString, "stringWithFormat:", @"%012llx_%1d_%012llx", *(void *)&v201[40], v201[48], *(void *)&v201[56]));
          if (v130 && (uint64_t v131 = v130, v132 = *(void *)&v201[64], v132 <= [v130 overVoltageTimestamp]))
          {
            uint64_t v133 = *(void *)&v201[64];
            unsigned int v134 = dword_1EA8C4C4C;
            if (!dword_1EA8C4C4C)
            {
              mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
              unsigned int v134 = dword_1EA8C4C4C;
            }
            uint64_t v135 = sTimebaseInfo;
            uint64_t v136 = [v131 overVoltageTimestamp];
            unsigned int v137 = dword_1EA8C4C4C;
            if (!dword_1EA8C4C4C)
            {
              mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
              unsigned int v137 = dword_1EA8C4C4C;
            }
            uint64_t v138 = sTimebaseInfo;
            CFStringRef v139 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @".%012llx.%1d", *(void *)&v201[40], v201[48]);
            if (v139)
            {
              CFStringRef v140 = v139;
              IOAccessoryAggDCollectDataWithInterval(@"com.apple.ioaccessorymanager.ldcm.notification.overvoltage", v139, (v136 * v138 / (unint64_t)v137 - v133 * v135 / (unint64_t)v134) / 0x3B9ACA00);
              v201[132] = 1;
              CFRelease(v140);
            }
          }
          else
          {
            v193 = 0;
            int valuePtr = 0;
            if (-[__objc2_class_ro objectForKey:](p_info[29], "objectForKey:", objc_msgSend(NSString, "stringWithFormat:", @"%012llx_%1d_%012llx", *(void *)&v201[40], v201[48], *(void *)&v201[56])))
            {
              *(void *)&long long v148 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v148 + 1) = 0xAAAAAAAAAAAAAAAALL;
              *(_OWORD *)&v190[32] = v148;
              v191 = v148;
              *(_OWORD *)v190 = v148;
              *(_OWORD *)&v190[16] = v148;
              v189 = v148;
              v149 = (void *)[*(id *)&v201[104] reverseObjectEnumerator];
              memset(v188, 0, sizeof(v188));
              uint64_t v150 = [v149 countByEnumeratingWithState:v188 objects:buf count:16];
              if (v150)
              {
                uint64_t v151 = v150;
                uint64_t v152 = **(void **)&v188[1];
LABEL_273:
                uint64_t v153 = 0;
                while (2)
                {
                  if (**(void **)&v188[1] != v152) {
                    objc_enumerationMutation(v149);
                  }
                  [*(id *)(*((void *)&v188[0] + 1) + 8 * v153) getBytes:&v189 length:80];
                  BOOL v154 = *(void *)&v201[56] == *(void *)&v190[37] && BYTE12(v189) == 2;
                  if (v154 && (!isChargingCableAttached(v181) || v190[36]))
                  {
                    for (uint64_t j = 0; j != 4; ++j)
                    {
                      if (v190[j + 4])
                      {
                        __int16 v156 = *(_WORD *)&v190[2 * j + 16];
                        unsigned __int16 v157 = *((_WORD *)&valuePtr + j) - v156;
                        *((_WORD *)&valuePtr + j) = v156;
                        if ((v157 & 0x8000) == 0)
                        {
                          unsigned __int16 v158 = v157;
                          if ([(id)gUserLdcmParams maxUpFluctuationMv] <= (unint64_t)v157)
                          {
                            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v186 = 67109120;
                              v187 = v158;
                              _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[fluctuation] diffAdcMv %d", v186, 8u);
                            }
                            unint64_t v165 = *(void *)(v182 + 1);
                            uint64_t v166 = *(void *)&v201[64];
                            if (*(void *)&v201[64] <= v165)
                            {
                              if (dword_1EA8C4C4C)
                              {
                                unsigned int v167 = sTimebaseInfo;
                                unsigned int v168 = dword_1EA8C4C4C;
                                unint64_t v169 = *(void *)&v201[64]
                                     * (unint64_t)sTimebaseInfo
                                     / dword_1EA8C4C4C;
                              }
                              else
                              {
                                mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
                                unsigned int v167 = sTimebaseInfo;
                                unsigned int v168 = dword_1EA8C4C4C;
                                unint64_t v169 = v166
                                     * (unint64_t)sTimebaseInfo
                                     / dword_1EA8C4C4C;
                                if (!dword_1EA8C4C4C)
                                {
                                  mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
                                  unsigned int v167 = sTimebaseInfo;
                                  unsigned int v168 = dword_1EA8C4C4C;
                                }
                              }
                              CFStringRef v170 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @".%012llx.%1d", *(void *)&v201[40], v201[48]);
                              if (v170)
                              {
                                CFStringRef v171 = v170;
                                IOAccessoryAggDCollectDataWithInterval(@"com.apple.ioaccessorymanager.ldcm.notification.voltagefluctuation", v170, (v165 * v167 / v168 - v169) / 0x3B9ACA00);
                                CFStringRef v172 = v171;
                                goto LABEL_313;
                              }
                            }
                            goto LABEL_240;
                          }
                        }
                      }
                    }
                    if (++v153 != v151) {
                      continue;
                    }
                    uint64_t v151 = [v149 countByEnumeratingWithState:v188 objects:buf count:16];
                    if (v151) {
                      goto LABEL_273;
                    }
                  }
                  break;
                }
              }
            }
            uint64_t v159 = objc_msgSend(NSString, "stringWithFormat:", @"%012llx_%1d_%012llx", *(void *)&v201[40], v201[48], *(void *)&v201[56]);
            if ([(id)gAccyHealthDictionary objectForKey:v159])
            {
              unint64_t v160 = *(void *)(v182 + 1);
              uint64_t v161 = *(void *)&v201[64];
              if (*(void *)&v201[64] <= v160)
              {
                unint64_t v162 = dword_1EA8C4C4C;
                if (dword_1EA8C4C4C)
                {
                  uint64_t v163 = sTimebaseInfo;
                  unint64_t v164 = *(void *)&v201[64]
                       * (unint64_t)sTimebaseInfo
                       / dword_1EA8C4C4C;
                }
                else
                {
                  mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
                  uint64_t v163 = sTimebaseInfo;
                  unint64_t v162 = dword_1EA8C4C4C;
                  unint64_t v164 = v161 * (unint64_t)sTimebaseInfo / dword_1EA8C4C4C;
                  if (!dword_1EA8C4C4C)
                  {
                    mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
                    uint64_t v163 = sTimebaseInfo;
                    unint64_t v162 = dword_1EA8C4C4C;
                  }
                }
                unint64_t v173 = (v163 * v160 / v162 - v164) / 0x3B9ACA00;
                if (v173 >= [(id)gUserLdcmParams maxVhiDurationSec])
                {
                  CFStringRef v174 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @".%012llx.%1d", *(void *)&v201[40], v201[48]);
                  if (v174)
                  {
                    CFStringRef v175 = v174;
                    IOAccessoryAggDCollectDataWithInterval(@"com.apple.ioaccessorymanager.ldcm.notification.wettoolong", v174, v173);
                    CFStringRef v172 = v175;
LABEL_313:
                    CFRelease(v172);
                    v201[132] = 1;
                  }
                }
              }
            }
          }
        }
      }
      else if (v129)
      {
        evaluateFalseDetectPreventionDry((uint64_t)v201, v72);
      }
LABEL_240:
      if (!v177)
      {
        v198 = *(_OWORD *)&v201[96];
        v199 = *(_OWORD *)&v201[112];
        v200 = *(void *)&v201[128];
        *(_OWORD *)v195 = *(_OWORD *)&v201[32];
        *(_OWORD *)&v195[16] = *(_OWORD *)&v201[48];
        v196 = *(_OWORD *)&v201[64];
        v197 = *(_OWORD *)&v201[80];
        *(_OWORD *)buf = *(_OWORD *)v201;
        *(_OWORD *)&buf[16] = *(_OWORD *)&v201[16];
        uint64_t v141 = [MEMORY[0x1E4F29238] valueWithDockState:buf];
        objc_msgSend((id)gDockState, "setObject:forKey:", v141, objc_msgSend(NSNumber, "numberWithInt:", v178));
        IOAccessoryAggDCollectData(@"histogramVoltage", (uint64_t)v182);
        IOAccessoryAggDCollectData(@"com.apple.ioaccessorymanager.voltage.cumulativetime", (uint64_t)v182);
      }
      return;
    }
    BYTE2(v189) = -86;
    BOOL v74 = (*(unsigned int *)((char *)v182 + 14) | *((unsigned __int16 *)v182 + 9)) != 0;
    int v75 = *((unsigned __int8 *)v182 + 44);
    if (*((unsigned char *)v182 + 44)) {
      char v76 = 2 * (*((unsigned char *)v182 + 51) == 2);
    }
    else {
      char v76 = 0;
    }
    if (*(unsigned int *)((char *)v182 + 14) | *((unsigned __int16 *)v182 + 9))
    {
      unint64_t v81 = (char *)&gLdcmParams + 12 * !isChargingCableAttached(v181);
      uint64_t v82 = (unsigned __int16 *)(v81 + 24);
      uint64_t v83 = (unsigned __int16 *)(v81 + 48);
    }
    else
    {
      uint64_t v82 = (unsigned __int16 *)&unk_1EBE271AC;
      unint64_t v81 = (char *)&unk_1EBE271A0;
      uint64_t v83 = (unsigned __int16 *)&unk_1EBE271B8;
    }
    int v84 = 0;
    int v85 = 0;
    char v86 = 0;
    unsigned int v87 = (unsigned __int16)word_1EBE271C4;
    int v88 = v201[112];
    LOWORD(v189) = 257;
    char v89 = 1;
    uint64_t v90 = 16;
    int v91 = 1;
    do
    {
      unsigned int v92 = v90 - 16;
      if (*((unsigned char *)v182 + v90 + 4))
      {
        unsigned int v93 = *((unsigned __int16 *)v182 + v90);
        uint64_t v94 = (v76 + (_BYTE)v90 - 16) & 3;
        BOOL v95 = v93 < v82[v94];
        if (v93 >= *(unsigned __int16 *)&v81[2 * v94]) {
          char v86 = 1;
        }
        else {
          v190[(v92 >> 1) - 16] = 0;
        }
        ++v85;
        v91 &= v95;
        v89 &= v93 < v87;
        if (v93 >= v83[v94]) {
          ++v84;
        }
      }
      else
      {
        v190[(v92 >> 1) - 16] = 0;
      }
      ++v90;
    }
    while (v90 != 20);
    if (!v85)
    {
      int v176 = 0;
      io_service_t v99 = v179;
      goto LABEL_189;
    }
    if (v74)
    {
      BOOL v96 = isChargingCableAttached(v181);
      BOOL v97 = 1;
      if (!v75 && v96) {
        BOOL v97 = *((unsigned char *)v182 + 52) != 0;
      }
    }
    else
    {
      BOOL v97 = 1;
    }
    int v98 = (v85 == 1) & v86;
    io_service_t v99 = v179;
    if (v88 || !v97)
    {
      if (v88 && ((v91 ^ 1) & 1) == 0)
      {
        unsigned int v106 = *(_DWORD *)&v201[116] + 1;
        *(void *)&v201[116] = (*(_DWORD *)&v201[116] + 1);
        if (v106 >= unk_1EBE271CA)
        {
          int v176 = 0;
          v201[112] = 0;
          goto LABEL_166;
        }
        if (!IOAccessoryManagerRequestLdcmMeasurement())
        {
          int v107 = unk_1EBE271D2;
          int v176 = unk_1EBE271D2;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v108 = *v182;
            uint64_t v109 = *(void *)((char *)v182 + 53);
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)&uint8_t buf[4] = v108;
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = v109;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = *(_DWORD *)&v201[116];
            *(_WORD *)&buf[24] = 1024;
            *(_DWORD *)&buf[26] = v107;
            unint64_t v104 = MEMORY[0x1E4F14500];
            uint64_t v105 = "(%d) ~~~ [%012llx] LDCM consecutiveVoltageNotDetected %d / rearm %d";
            goto LABEL_164;
          }
LABEL_166:
          if (v189 | BYTE1(v189)) {
            unsigned int v110 = 1;
          }
          else {
            unsigned int v110 = v98;
          }
          if (*(void *)((char *)v182 + 53) == -1)
          {
            *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
            if (IOAccessoryManagerCopyDeviceInfo()) {
              goto LABEL_189;
            }
            CFNumberGetValue(*(CFNumberRef *)buf, kCFNumberSInt64Type, (char *)v182 + 53);
            CFRelease(*(CFTypeRef *)buf);
          }
          if (gAccyHealthDictionary)
          {
            uint64_t v111 = objc_msgSend(NSString, "stringWithFormat:", @"%012llx_%1d_%012llx", ((unint64_t)*((unsigned __int8 *)v182 + 14) << 40) | ((unint64_t)*((unsigned __int8 *)v182 + 15) << 32) | ((unint64_t)*((unsigned __int8 *)v182 + 16) << 24) | ((unint64_t)*((unsigned __int8 *)v182 + 17) << 16) | ((unint64_t)*((unsigned __int8 *)v182 + 18) << 8) | *((unsigned __int8 *)v182 + 19), *((unsigned __int8 *)v182 + 51), *(void *)((char *)v182 + 53));
            uint64_t v112 = [(id)gAccyHealthDictionary objectForKey:v111];
            v113 = (IOAccessoryLdcmHealthClass *)v112;
            if (!v112)
            {
              v113 = objc_alloc_init(IOAccessoryLdcmHealthClass);
              uint64_t v114 = v113;
              trimAccyHealthDictionary();
            }
            [(IOAccessoryLdcmHealthClass *)v113 setLastSeenTimestamp:*(void *)(v182 + 1)];
            [(IOAccessoryLdcmHealthClass *)v113 setLeakagePassedCount:[(IOAccessoryLdcmHealthClass *)v113 leakagePassedCount] + (v89 & 1)];
            [(IOAccessoryLdcmHealthClass *)v113 setDryCount:[(IOAccessoryLdcmHealthClass *)v113 dryCount] + (v91 & 1)];
            [(IOAccessoryLdcmHealthClass *)v113 setWetCount:[(IOAccessoryLdcmHealthClass *)v113 wetCount] + v110];
            [(IOAccessoryLdcmHealthClass *)v113 setOverVoltageCount:[(IOAccessoryLdcmHealthClass *)v113 overVoltageCount] + v84];
            int v115 = [(IOAccessoryLdcmHealthClass *)v113 isHealthy];
            if (([(id)gUserLdcmParams fdpBehaviorMask] & 1) == 0) {
              [(IOAccessoryLdcmHealthClass *)v113 setIsHealthy:1];
            }
            if (([(id)gUserLdcmParams fdpBehaviorMask] & 1) != 0
              && ([(id)gUserLdcmParams fdpBehaviorMask] & 2) != 0)
            {
              [(IOAccessoryLdcmHealthClass *)v113 setIsHealthy:[(IOAccessoryLdcmHealthClass *)v113 leakagePassedCount] != 0];
            }
            if (v84)
            {
              [(IOAccessoryLdcmHealthClass *)v113 setOverVoltageTimestamp:[(IOAccessoryLdcmHealthClass *)v113 lastSeenTimestamp]];
              if (([(id)gUserLdcmParams fdpBehaviorMask] & 1) != 0
                && ([(id)gUserLdcmParams fdpBehaviorMask] & 4) != 0)
              {
                [(IOAccessoryLdcmHealthClass *)v113 setIsHealthy:0];
                [(IOAccessoryLdcmHealthClass *)v113 setLeakagePassedCount:0];
              }
            }
            [(id)gAccyHealthDictionary setObject:v113 forKey:v111];
            int v116 = [(IOAccessoryLdcmHealthClass *)v113 isHealthy];
            if (!v112 || v115 != v116)
            {
              commitPersistentAccyHealthDictionary();
              if (![(IOAccessoryLdcmHealthClass *)v113 isHealthy]) {
                IOAccessoryAggDCollectData(@"com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount", (uint64_t)v182);
              }
              dbgShowAccyHealthDictionary();
            }
          }
LABEL_189:
          int v117 = v201[112];
          appendEventToHistory(*(void **)&v201[104], (uint64_t)v182);
          if (v117 == v88)
          {
            int v129 = 0;
            uint64_t v72 = (uint64_t)v182;
            goto LABEL_221;
          }
          IOAccessoryManagerSetVoltageDetected();
          long long v118 = *((_OWORD *)v182 + 1);
          *(_OWORD *)v183 = *(_OWORD *)v182;
          *(_OWORD *)&v183[16] = v118;
          *(_OWORD *)v184 = *((_OWORD *)v182 + 2);
          *(_OWORD *)&v184[13] = *(_OWORD *)((char *)v182 + 45);
          v183[12] = v201[112] ^ 1;
          v183[13] = v201[112];
          appendEventToHistory(*(void **)&v201[104], (uint64_t)v183);
          uint64_t v72 = (uint64_t)v182;
          if (!v201[112])
          {
            int v127 = *(_DWORD *)v183;
            int v128 = *(_DWORD *)v201;
            if (*(_DWORD *)v201 != 1)
            {
              *(_DWORD *)&v201[124] = 0;
              *(_DWORD *)v201 = 1;
              ++dword_1EA8C4C0C;
              *(void *)&v201[12] = *(void *)&v183[4];
              *(void *)&v201[80] = CFAbsoluteTimeGetCurrent();
              IOAccessoryAggDCollectData(@"com.apple.ioaccessorymanager.voltage.averagetime", (uint64_t)v183);
              if (gEnableTimeToDryPopup)
              {
                if (gIsInternalBuild) {
                  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, (CFStringRef)objc_msgSend(NSString, "stringWithFormat:", @"Time To Dry\n %02llu:%02llu:%02llu", (unint64_t)(*(double *)&v201[80] - *(double *)&v201[88]) / 0xE10, (unint64_t)(*(double *)&v201[80] - *(double *)&v201[88]) / 0x3C- 60* ((unint64_t)(((unint64_t)(*(double *)&v201[80] - *(double *)&v201[88])/ 0x3C* (unsigned __int128)0x888888888888889uLL) >> 64) >> 1), (unint64_t)(*(double *)&v201[80] - *(double *)&v201[88]) % 0x3C), 0, @"Ok", 0,
                }
                    0,
                    0);
              }
            }
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)&uint8_t buf[4] = v127;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v128;
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = *(_DWORD *)v201;
              *(_WORD *)&buf[20] = 1024;
              *(_DWORD *)&buf[22] = v201[72];
              _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Event: Vlo, VoltageState: %d -> %d, gPlug: %d", buf, 0x1Au);
            }
            dbgShowAccyHealthDictionary();
            goto LABEL_220;
          }
          IOAccessoryManagerGetType();
          if (*v181 != 4 || *((unsigned __int8 *)v182 + 15) != 241 || *((unsigned char *)v182 + 16) || *((unsigned char *)v182 + 17))
          {
            io_service_t v119 = v99;
          }
          else
          {
            if (!*((unsigned char *)v182 + 18))
            {
              io_service_t v119 = v99;
              BOOL v120 = *((unsigned char *)v182 + 19) == 0;
LABEL_197:
              int v121 = *(_DWORD *)v183;
              int v122 = *(_DWORD *)v201;
              if (*(_DWORD *)v201)
              {
                uint64_t v123 = v183[14];
                if (v184[18]) {
                  int v124 = !v120;
                }
                else {
                  int v124 = 1;
                }
                *(_DWORD *)&v201[124] = 11;
                *(_DWORD *)v201 = 0;
                ++stats;
                uint64_t v125 = *(void *)&v183[4];
                *(void *)&v201[4] = *(void *)&v183[4];
                *(void *)&v201[88] = CFAbsoluteTimeGetCurrent();
                IOAccessoryAggDCollectData(@"com.apple.ioaccessorymanager.voltage.count", (uint64_t)v183);
                unint64_t v126 = (v123 << 40) | ((unint64_t)v183[15] << 32) | ((unint64_t)v183[16] << 24) | ((unint64_t)v183[17] << 16) | ((unint64_t)v183[18] << 8) | v183[19];
                *(void *)&v201[24] = v126;
                *(_DWORD *)&v201[32] = *(_DWORD *)&v183[14];
                *(_WORD *)&v201[36] = *(_WORD *)&v183[18];
                if (v120)
                {
                  IOAccessoryAggDCollectData(@"com.apple.ioaccessorymanager.voltage.headset", (uint64_t)v183);
                  unint64_t v126 = *(void *)&v201[24];
                }
                uint64_t v72 = (uint64_t)v182;
                if ((v120 & v124 & 1) == 0 && (v123 & 0x20) == 0 && v126)
                {
                  IOAccessoryAggDCollectData(@"com.apple.ioaccessorymanager.ldcm.notification.count", (uint64_t)v183);
                  if (evaluateAccyHealthDictionary(*(unint64_t *)&v201[24], (uint64_t)v183))
                  {
                    *(void *)&v201[40] = *(void *)&v201[24];
                    v201[48] = v184[19];
                    *(void *)&v201[56] = *(void *)&v184[21];
                    *(void *)&v201[64] = v125;
                  }
                  else
                  {
                    setDriverMitigationEnabled(v121, v119, 0);
                  }
                  if (!v201[73])
                  {
                    v201[73] = 1;
                    gGiveUserRadarOption = 1;
                  }
                }
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67111936;
                *(_DWORD *)&uint8_t buf[4] = v121;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v122;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = *(_DWORD *)v201;
                *(_WORD *)&buf[20] = 1024;
                *(_DWORD *)&buf[22] = v201[72];
                *(_WORD *)&buf[26] = 1024;
                *(_DWORD *)&buf[28] = stats;
                *(_WORD *)v195 = 1024;
                *(_DWORD *)&v195[2] = v183[14];
                *(_WORD *)&v195[6] = 1024;
                *(_DWORD *)&v195[8] = v183[15];
                *(_WORD *)&v195[12] = 1024;
                *(_DWORD *)&v195[14] = v183[16];
                *(_WORD *)&v195[18] = 1024;
                *(_DWORD *)&v195[20] = v183[17];
                *(_WORD *)&v195[24] = 1024;
                *(_DWORD *)&v195[26] = v183[18];
                *(_WORD *)&v195[30] = 1024;
                LODWORD(v196) = v183[19];
                WORD2(v196) = 1024;
                *(_DWORD *)((char *)&v196 + 6) = v184[18];
                _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Event: Vhi, VoltageState: %d -> %d, gPlug: %d, VhiCount: %d, DigitalID: %02x %02x %02x %02x %02x %02x, CumulativeLifetimeExceeded: %d", buf, 0x4Au);
              }
LABEL_220:
              int v129 = 1;
LABEL_221:
              p_info = HalogenWrapper.info;
              goto LABEL_222;
            }
            io_service_t v119 = v99;
          }
          BOOL v120 = 0;
          goto LABEL_197;
        }
LABEL_303:
        int v176 = 0;
        goto LABEL_189;
      }
    }
    else
    {
      if (v189 | BYTE1(v189)) {
        int v100 = 1;
      }
      else {
        int v100 = v98;
      }
      if (v100 == 1)
      {
        *(_DWORD *)&v201[116] = 0;
        if (++*(_DWORD *)&v201[120] >= unk_1EBE271C6)
        {
          int v176 = 0;
          v201[112] = 1;
          goto LABEL_166;
        }
        if (!IOAccessoryManagerRequestLdcmMeasurement())
        {
          int v101 = unk_1EBE271CE;
          int v176 = unk_1EBE271CE;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v102 = *v182;
            uint64_t v103 = *(void *)((char *)v182 + 53);
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)&uint8_t buf[4] = v102;
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = v103;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = *(_DWORD *)&v201[120];
            *(_WORD *)&buf[24] = 1024;
            *(_DWORD *)&buf[26] = v101;
            unint64_t v104 = MEMORY[0x1E4F14500];
            uint64_t v105 = "(%d) ~~~ [%012llx] LDCM consecutiveVoltageDetected %d / rearm %d";
LABEL_164:
            _os_log_impl(&dword_1D9622000, v104, OS_LOG_TYPE_DEFAULT, v105, buf, 0x1Eu);
            goto LABEL_166;
          }
          goto LABEL_166;
        }
        goto LABEL_303;
      }
    }
    int v176 = 0;
    *(void *)&v201[116] = 0;
    goto LABEL_166;
  }
LABEL_33:
  *(_OWORD *)&v201[80] = unk_1D964D038;
  memset(&v201[96], 170, 40);
  memset(v201, 170, 80);
  unsigned int v23 = [(id)gUserLdcmParams userBehaviorMask];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "IOAccessoryHandleDetach";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s IOAccessoryHandleDetach entry\n", buf, 0xCu);
  }
  io_service_t v24 = a2;
  uint64_t v25 = IOAccessoryManagerGetPrimaryPort();
  if (!v25) {
    return;
  }
  uint64_t v26 = v25;
  if (!objc_msgSend((id)gHalogenMeasurements, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v25)))
  {
    if (!gDockState) {
      return;
    }
    uint64_t v51 = objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v26));
    if (!v51) {
      return;
    }
    [v51 dockStateValue];
    int v52 = v201[72];
    if (v201[72] && enableVoltageEventMonitorModeAppleCareLogging)
    {
      if ((IOAccessoryManagerGetType() & 0x600) != 0) {
        IOAccessoryAppleCareLoggingForNonVoltageEvents((uint64_t)"accessoryUnplug", &v201[32], v26);
      }
    }
    else if (!v201[72])
    {
LABEL_94:
      *(_WORD *)&v201[72] = 0;
      *(_WORD *)&v201[96] = 0;
      v198 = *(_OWORD *)&v201[96];
      v199 = *(_OWORD *)&v201[112];
      v200 = *(void *)&v201[128];
      *(_OWORD *)v195 = *(_OWORD *)&v201[32];
      *(_OWORD *)&v195[16] = *(_OWORD *)&v201[48];
      v196 = *(_OWORD *)&v201[64];
      v197 = *(_OWORD *)&v201[80];
      *(_OWORD *)buf = *(_OWORD *)v201;
      *(_OWORD *)&buf[16] = *(_OWORD *)&v201[16];
      uint64_t v48 = [MEMORY[0x1E4F29238] valueWithDockState:buf];
      uint64_t v49 = (void *)gDockState;
      uint64_t v50 = NSNumber;
      goto LABEL_128;
    }
    BOOL v55 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    int v56 = *(_DWORD *)v201;
    if (v55)
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = *(_DWORD *)v201;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v52;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Event: Detach, CurrentVoltageState = %d, gPlug = %d", buf, 0x14u);
    }
    if (!v56) {
      evaluateFalseDetectPreventionDry((uint64_t)v201, 0);
    }
    setDriverMitigationEnabled(v26, v24, (v23 >> 3) & 1);
    goto LABEL_94;
  }
  BOOL v27 = objc_msgSend((id)gHalogenMeasurements, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v26));
  uint64_t v28 = v27;
  if (v27)
  {
    if ([v27 isReceptacleEmpty]) {
      goto LABEL_39;
    }
    setDriverMitigationEnabled(v26, a2, (v23 >> 3) & 1);
    [v28 setIsReceptacleEmpty:1];
    [v28 setJustDetached:1];
    [v28 setJustAttachedCase:0];
    if (([(id)gUserLdcmParams userBehaviorMask] & 0x10) == 0
      && ![v28 isWet])
    {
      goto LABEL_39;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v26;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Detach: Empty Receptacle State. Keep measuring.", buf, 8u);
    }
    if (!digitalIdNumPinsFree([v28 connectedAccessoryDigitalID], (uint64_t)buf)
      || ([v28 isDebugAccessoryConnected] & 1) != 0
      || [v28 isBlacklistedAccessoryConnected])
    {
      int v29 = 1;
      [v28 setIsMeasurementEnabled:1];

      objc_msgSend(v28, "setConnectedAccessoryPDigitalID:", (id)objc_msgSend(v28, "eventBasedPDigitalID"));
      objc_msgSend(v28, "setConnectedAccessoryDigitalID:", objc_msgSend(v28, "eventBasedDigitalID"));
      objc_msgSend(v28, "setConnectedAccessoryOrientation:", objc_msgSend(v28, "eventBasedOrientation"));
    }
    else
    {
LABEL_39:
      int v29 = 0;
    }
    if ([v28 isTimestampValid]
      && [v28 isMeasurementEnabled]
      && [v28 didConfidentNotify])
    {
      uint64_t v53 = mach_continuous_time();
      if ([v28 accessoryConnectedWhileWet]) {
        uint64_t v54 = [v28 wetAccessoryAttachTimestamp];
      }
      else {
        uint64_t v54 = [v28 wetDryTransitionTimestamp];
      }
      uint64_t v142 = v54;
      if (dword_1EA8C4C4C)
      {
        uint64_t v143 = sTimebaseInfo;
        unint64_t v144 = dword_1EA8C4C4C;
        unint64_t v145 = v54 * (unint64_t)sTimebaseInfo / dword_1EA8C4C4C;
      }
      else
      {
        mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
        uint64_t v143 = sTimebaseInfo;
        unint64_t v144 = dword_1EA8C4C4C;
        unint64_t v145 = v142 * (unint64_t)sTimebaseInfo / dword_1EA8C4C4C;
        if (!dword_1EA8C4C4C)
        {
          mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          uint64_t v143 = sTimebaseInfo;
          unint64_t v144 = dword_1EA8C4C4C;
        }
      }
      unint64_t v146 = (v53 * v143 / v144 - v145) / 0x3B9ACA00;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[8] = 2048;
        *(void *)&buf[10] = v146;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) wet duration interval = %lld seconds", buf, 0x12u);
      }
      if (([v28 didHighConfidentNotify] & 1) == 0)
      {
        IOAccessoryAggDPostScalarKey(@"com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount", (uint64_t)v28);
        [v28 setDidHighConfidentNotify:1];
      }
      if (([v28 didWetDuration] & 1) == 0)
      {
        IOAccessoryAggDPostHistogramKey(@"com.apple.ioaccessorymanager.ldcm.notification.wetduration", v28, (double)v146);
        [v28 setDidWetDuration:1];
      }
    }
  }
  else
  {
    int v29 = 0;
  }
  [v28 setWetAccessoryAttachTimestamp:mach_continuous_time()];
  [v28 setIsHeadsetConnected:0];
  [v28 setIsDebugAccessoryConnected:0];
  [v28 setIsBlacklistedAccessoryConnected:0];
  if ([(id)gUserLdcmParams enableHalogenMitigationsAndUI] == 1 && gLiquidNotificationContext)
  {
    CFUserNotificationCancel((CFUserNotificationRef)qword_1EBE271F0);
    gLiquidNotificationContext = 0;
    qword_1EBE27208 = 0;
    CFRunLoopRemoveSource((CFRunLoopRef)qword_1EBE27200, (CFRunLoopSourceRef)qword_1EBE271F8, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease((CFTypeRef)qword_1EBE271F8);
    CFRelease((CFTypeRef)qword_1EBE271F0);
    if ((v29 & 1) == 0) {
      return;
    }
  }
  else if (!v29)
  {
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v26;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Restarting Measurements", buf, 8u);
  }
  v147 = [v28 halogenMeasurementDispatchQueue];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __IOAccessoryHandleDetach_block_invoke;
  *(void *)&buf[24] = &unk_1E6B6D5A0;
  *(void *)v195 = v28;
  dispatch_async(v147, buf);
}

void IOAccessoryHandleAttach(io_registry_entry_t a1)
{
  v61[9] = *MEMORY[0x1E4F143B8];
  __int16 v49 = -21846;
  int v48 = -1431655766;
  memset(&v61[4], 170, 36);
  v47[0] = -1431655766;
  *(_DWORD *)((char *)v47 + 3) = -1431655766;
  long long v59 = *(long long *)((char *)&xmmword_1D964D028 + 10);
  long long v60 = unk_1D964D042;
  memset(v61, 170, 30);
  unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberRef number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  io_connect_t connect = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)uint64_t v51 = "IOAccessoryHandleAttach";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s IOAccessoryHandleAttach entry\n", buf, 0xCu);
  }
  uint64_t PrimaryPort = IOAccessoryManagerGetPrimaryPort();
  if (PrimaryPort)
  {
    uint64_t v3 = PrimaryPort;
    uint64_t v4 = objc_msgSend((id)gHalogenMeasurements, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", PrimaryPort));
    if (!IOAccessoryManagerGetDigitalID())
    {
      unint64_t v5 = ((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8);
      unint64_t v6 = v5 | HIBYTE(v49);
      if (v6)
      {
        int v7 = digitalIdNumPinsFree(v5 | HIBYTE(v49), (uint64_t)buf);
        *(_DWORD *)buf = 0;
        CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryOrientation", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
        if (CFProperty)
        {
          CFNumberRef v9 = CFProperty;
          CFNumberGetValue(CFProperty, kCFNumberIntType, buf);
          CFRelease(v9);
          uint64_t v10 = *(unsigned int *)buf;
        }
        else
        {
          uint64_t v10 = 0;
        }
        if (v4)
        {
          int v11 = [v4 isWet];
          unsigned int v39 = [v4 isTimestampValid];
          [v4 setIsReceptacleEmpty:0];
          [v4 setJustDetached:0];
          [v4 setWetAccessoryAttachTimestamp:mach_continuous_time()];
          uint64_t v38 = [v4 halogenMeasurement];
          if ([v4 isMeasurementEnabled])
          {
            unsigned int v37 = v10;
            objc_msgSend((id)objc_msgSend(v4, "cond"), "lock");
            uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
            if ([v4 isMeasurementActive])
            {
              do
                char v13 = objc_msgSend((id)objc_msgSend(v4, "cond"), "waitUntilDate:", v12);
              while ([v4 isMeasurementActive] && (v13 & 1) != 0);
              if ((v13 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "halogenMeasurementCleanup() TIMEOUT... cleanup anyway", buf, 2u);
              }
            }
            halogenMeasurementCleanup(v4);
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)uint64_t v51 = "halogenMeasurementCleanupSafe";
              _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s stop measurement timer.\n", buf, 0xCu);
            }
            dispatch_source_set_timer((dispatch_source_t)[v4 timer], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
            [v4 setAttachDelayTimerRunning:0];
            objc_msgSend((id)objc_msgSend(v4, "cond"), "unlock");
            BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
            uint64_t v10 = v37;
            if (v7)
            {
              if (v14)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)uint64_t v51 = v3;
                CFRange v15 = MEMORY[0x1E4F14500];
                unint64_t v16 = "(%d) IOAccessoryHandleAttach() Stop empty receptacle measurements for previous attachment";
LABEL_39:
                _os_log_impl(&dword_1D9622000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 8u);
              }
            }
            else if (v14)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)uint64_t v51 = v3;
              CFRange v15 = MEMORY[0x1E4F14500];
              unint64_t v16 = "(%d) IOAccessoryHandleAttach() Pause empty receptacle measurements, attached accessory has no free pins";
              goto LABEL_39;
            }
          }
          if (IOServiceOpen(a1, *MEMORY[0x1E4F14960], 0, &connect)) {
            return;
          }
          IOAccessoryManagerSetVoltageDetected();
          [v4 setIsHeadsetConnected:0];
          IOServiceClose(connect);
          io_connect_t connect = 0;
          int Type = IOAccessoryManagerGetType();
          global_queue = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __IOAccessoryHandleAttach_block_invoke;
          block[3] = &__block_descriptor_36_e5_v8__0l;
          int v43 = Type;
          dispatch_async(global_queue, block);
          [v4 setIsDebugAccessoryConnected:(v48 >> 5) & 1];
          if ([v4 isDebugAccessoryConnected]) {
            return;
          }
          [v4 setIsBlacklistedAccessoryConnected:v6 == 0x18F281000000];
          if ([v4 isBlacklistedAccessoryConnected]) {
            return;
          }
          if (v38) {
            BOOL v30 = v7 == 0;
          }
          else {
            BOOL v30 = 1;
          }
          int v31 = !v30;
          if (v30) {
            [v4 setWasTapToRadarShown:1];
          }
          else {
            [v4 setIsMeasurementEnabled:1];
          }
          if (v11)
          {
            [v4 setIsWet:1];
            [v4 setAccessoryConnectedWhileWet:1];
            [v4 setIsMeasurementActive:0];
            [v4 setIsTimestampValid:v39];
            objc_msgSend(v4, "setConnectedAccessoryPDigitalID:", (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v48, 6));
            [v4 setConnectedAccessoryDigitalID:((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8) | HIBYTE(v49)];
            [v4 setConnectedAccessoryOrientation:v10];
            if (v7)
            {
              CFStringRef v32 = @"com.apple.ioaccessorymanager.ldcm.eis.accessory.connection";
              goto LABEL_61;
            }
            _generateUIAnalyticEvents(v4, v3);
            IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.accessory.connection", v4);
          }
          else
          {
            [v4 setIsMeasurementActive:0];
            [v4 setIsTimestampValid:v39];
            objc_msgSend(v4, "setConnectedAccessoryPDigitalID:", (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v48, 6));
            [v4 setConnectedAccessoryDigitalID:((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8) | HIBYTE(v49)];
            [v4 setConnectedAccessoryOrientation:v10];
            IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.accessory.connection", v4);
            if (v7)
            {
              if (!v31) {
                return;
              }
LABEL_62:
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)uint64_t v51 = v3;
                _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Attach: Start Measurements", buf, 8u);
              }
              if (v6 == 0x4F100000000) {
                goto LABEL_80;
              }
              if (v6 == 0x18FE81000000) {
                [v4 setJustAttachedCase:1];
              }
              if (([(id)gUserLdcmParams userBehaviorMask] & 0x20) != 0)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  unint64_t v34 = [v4 ldcmStartMeasurementsDelayNs];
                  *(_DWORD *)buf = 136315650;
                  *(void *)uint64_t v51 = "IOAccessoryHandleAttach";
                  *(_WORD *)&v51[8] = 2048;
                  *(void *)&v51[10] = v6;
                  *(_WORD *)&v51[18] = 2048;
                  *(void *)&v51[20] = v34 / 0xF4240;
                  _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: digitalID(0x%08llx), start measurement after %llums.\n", buf, 0x20u);
                }
                __int16 v35 = [v4 timer];
                dispatch_time_t v36 = dispatch_walltime(0, [v4 ldcmStartMeasurementsDelayNs]);
                dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, 0);
                [v4 setAttachDelayTimerRunning:1];
              }
              else
              {
LABEL_80:
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)uint64_t v51 = "IOAccessoryHandleAttach";
                  *(_WORD *)&v51[8] = 2048;
                  *(void *)&v51[10] = v6;
                  _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: digitalID(0x%08llx) indicates no charging or Not DisableStartDelay behavior, perform measurement now.\n", buf, 0x16u);
                }
                __int16 v33 = [v4 halogenMeasurementDispatchQueue];
                v41[0] = MEMORY[0x1E4F143A8];
                v41[1] = 3221225472;
                v41[2] = __IOAccessoryHandleAttach_block_invoke_745;
                v41[3] = &unk_1E6B6D5A0;
                v41[4] = v4;
                dispatch_async(v33, v41);
              }
              return;
            }
          }
          CFStringRef v32 = @"com.apple.ioaccessorymanager.ldcm.eis.accessory.nofreepins";
LABEL_61:
          IOAccessoryAggDPostScalarPrefixKey(v32, v4);
          if ((v31 & 1) == 0) {
            return;
          }
          goto LABEL_62;
        }
        if (!gDockState) {
          return;
        }
        uint64_t v17 = objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v3));
        if (!v17) {
          return;
        }
        char v18 = v10;
        [v17 dockStateValue];
        int v19 = *(_DWORD *)buf;
        *(_OWORD *)&v61[4] = *(_OWORD *)v51;
        *(_OWORD *)&v61[6] = *(_OWORD *)&v51[16];
        LODWORD(v61[8]) = *(_DWORD *)v52;
        unint64_t v40 = *(void *)&v52[4];
        char v20 = v52[12];
        v47[0] = *(_DWORD *)&v52[13];
        *(_DWORD *)((char *)v47 + 3) = *(_DWORD *)&v52[16];
        unint64_t v22 = *(void *)&v52[20];
        uint64_t v21 = v53;
        char v23 = v55;
        *(_OWORD *)((char *)&v61[1] + 6) = *(_OWORD *)((char *)v58 + 14);
        long long v60 = v57;
        *(_OWORD *)v61 = v58[0];
        long long v59 = v56;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)uint64_t v51 = v3;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v19;
          *(_WORD *)&v51[10] = 1024;
          *(_DWORD *)&v51[12] = 1;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%d) Event: Attach, CurrentVoltageState = %d, gPlug = %d", buf, 0x14u);
        }
        if (enableVoltageEventMonitorModeAppleCareLogging && (IOAccessoryManagerGetType() & 0x600) != 0) {
          IOAccessoryAppleCareLoggingForNonVoltageEvents((uint64_t)"accessoryPlug", (unsigned __int8 *)&v48, v3);
        }
        if (!IOServiceOpen(a1, *MEMORY[0x1E4F14960], 0, &connect))
        {
          IOAccessoryManagerSetVoltageDetected();
          IOServiceClose(connect);
          io_connect_t connect = 0;
          if ((v48 & 0x20) == 0 && !(v19 | v23 & 1))
          {
            if (!_retrieveDeviceInterfaceSerialNumber())
            {
              CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
              CFRelease(number);
              *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
              *(_OWORD *)int v52 = v24;
              v52[16] = -86;
              *(_OWORD *)&v51[16] = v24;
              *(_OWORD *)uint64_t v51 = v24;
              *(_DWORD *)buf = v3;
              v52[15] = v18;
              *(void *)&v52[17] = valuePtr;
              IOAccessoryAggDCollectData(@"com.apple.ioaccessorymanager.ldcm.notification.count", (uint64_t)buf);
              if (evaluateAccyHealthDictionary(((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8) | HIBYTE(v49), (uint64_t)buf))
              {
                unint64_t v25 = ((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8) | HIBYTE(v49);
                unint64_t v22 = valuePtr;
                uint64_t v21 = mach_continuous_time();
                char v20 = v18;
                p_info = (__objc2_class_ro **)(HalogenWrapper + 32);
              }
              else
              {
                setDriverMitigationEnabled(v3, a1, 0);
                p_info = HalogenWrapper.info;
                unint64_t v25 = v40;
              }
              int v19 = 0;
              char v23 = 1;
              gGiveUserRadarOption = 1;
              goto LABEL_36;
            }
            int v19 = 0;
          }
        }
        p_info = (__objc2_class_ro **)(HalogenWrapper + 32);
        unint64_t v25 = v40;
LABEL_36:
        *(_OWORD *)uint64_t v51 = *(_OWORD *)&v61[4];
        *(_OWORD *)&v51[16] = *(_OWORD *)&v61[6];
        long long v56 = v59;
        *(_DWORD *)buf = v19;
        *(_DWORD *)int v52 = v61[8];
        *(void *)&v52[4] = v25;
        v52[12] = v20;
        *(_DWORD *)&v52[13] = v47[0];
        *(_DWORD *)&v52[16] = *(_DWORD *)((char *)v47 + 3);
        *(void *)&v52[20] = v22;
        uint64_t v53 = v21;
        char v54 = 1;
        char v55 = v23;
        long long v57 = v60;
        v58[0] = *(_OWORD *)v61;
        *(_OWORD *)((char *)v58 + 14) = *(_OWORD *)((char *)&v61[1] + 6);
        uint64_t v27 = [MEMORY[0x1E4F29238] valueWithDockState:buf];
        -[__objc2_class_ro setObject:forKey:](p_info[36], "setObject:forKey:", v27, [NSNumber numberWithInt:v3]);
      }
    }
  }
}

uint64_t __IOAccessoryServiceMatchingCallback_block_invoke_535(uint64_t a1)
{
  return performEisMeasurement(*(void **)(a1 + 32));
}

uint64_t __IOAccessoryCreateIOAMLoggingFile_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(@"/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/", "stringByAppendingPathComponent:", a2), 0);
  uint64_t v5 = *MEMORY[0x1E4F282C0];
  unint64_t v6 = (void *)[v4 objectForKey:*MEMORY[0x1E4F282C0]];
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(@"/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/", "stringByAppendingPathComponent:", a3), 0), "objectForKey:", v5);
  return [v6 compare:v7];
}

uint64_t processLdcmBehaviorPlist(void *a1, __int16 a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, (const char *)&unk_1D964FD5A, (uint8_t *)&v29, 2u);
  }
  if ((a2 & 0xF0) != 0) {
    return 0;
  }
  uint64_t v4 = kIOAMLDCMBehaviorPlistLegacySubKey;
  if ((a2 & 0x400) != 0) {
    uint64_t v4 = kIOAMLDCMBehaviorPlistDeviceGen1SubKey;
  }
  uint64_t v5 = *v4;
  uint64_t result = [a1 objectForKey:kIOAMLDCMBehaviorPlistVersionKey];
  if (!result) {
    return result;
  }
  int v7 = [(id)result unsignedIntValue];
  unsigned int v8 = v7 - 1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136315650;
    BOOL v30 = "processLdcmBehaviorPlist";
    __int16 v31 = 1024;
    *(_DWORD *)CFStringRef v32 = v7;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v8 < 2;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: LDCM behavior plist version: %u, supported %d\n", (uint8_t *)&v29, 0x18u);
  }
  if (v8 > 1) {
    return 0;
  }
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, (const char *)&unk_1D964FD5A, (uint8_t *)&v29, 2u);
      }
      uint64_t result = [a1 objectForKey:kIOAMLDCMBehaviorPlistBehaviorBitmaskKey];
      if (result)
      {
        uint64_t result = [(id)result objectForKey:v5];
        if (result)
        {
          uint64_t v9 = [(id)result unsignedIntValue];
          [(id)gUserLdcmParams setUserBehaviorMask:v9];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            int v29 = 136315394;
            BOOL v30 = "processLdcmBehaviorPlistForVersion1";
            __int16 v31 = 1024;
            *(_DWORD *)CFStringRef v32 = v9;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: userBehaviorMask : %#x\n", (uint8_t *)&v29, 0x12u);
          }
          uint64_t result = [a1 objectForKey:kIOAMLDCMBehaviorPlistFdpBitmaskKey];
          if (result)
          {
            uint64_t result = [(id)result objectForKey:v5];
            if (result)
            {
              uint64_t v10 = [(id)result unsignedIntValue];
              [(id)gUserLdcmParams setFdpBehaviorMask:v10];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                int v29 = 136315394;
                BOOL v30 = "processLdcmBehaviorPlistForVersion1";
                __int16 v31 = 1024;
                *(_DWORD *)CFStringRef v32 = v10;
                _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: fdpBehaviorMask : %#x\n", (uint8_t *)&v29, 0x12u);
              }
              uint64_t result = [a1 objectForKey:kIOAMLDCMBehaviorPlistConsecutiveDetectedThresh];
              if (result)
              {
                int v11 = [(id)result unsignedIntValue];
                if (v11)
                {
                  int v12 = v11;
                  unk_1EBE271C6 = v11;
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                  {
                    int v29 = 136315394;
                    BOOL v30 = "processLdcmBehaviorPlistForVersion1";
                    __int16 v31 = 1024;
                    *(_DWORD *)CFStringRef v32 = v12;
                    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: consecutive detected thresh : %u\n", (uint8_t *)&v29, 0x12u);
                  }
                }
                uint64_t result = [a1 objectForKey:kIOAMLDCMBehaviorPlistConsecutiveNotDetectedThresh];
                if (result)
                {
                  int v13 = [(id)result unsignedIntValue];
                  if (v13)
                  {
                    int v14 = v13;
                    unk_1EBE271CA = v13;
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                    {
                      int v29 = 136315394;
                      BOOL v30 = "processLdcmBehaviorPlistForVersion1";
                      __int16 v31 = 1024;
                      *(_DWORD *)CFStringRef v32 = v14;
                      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: consecutive not detected thresh : %u\n", (uint8_t *)&v29, 0x12u);
                    }
                  }
                  uint64_t result = [a1 objectForKey:kIOAMLDCMBehaviorPlistConsecutiveDetectedInterval];
                  if (result)
                  {
                    int v15 = [(id)result unsignedIntValue];
                    if (v15)
                    {
                      int v16 = v15;
                      unk_1EBE271CE = v15;
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                      {
                        int v29 = 136315394;
                        BOOL v30 = "processLdcmBehaviorPlistForVersion1";
                        __int16 v31 = 1024;
                        *(_DWORD *)CFStringRef v32 = v16;
                        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: consecutive detected interval : %u\n", (uint8_t *)&v29, 0x12u);
                      }
                    }
                    uint64_t result = [a1 objectForKey:kIOAMLDCMBehaviorPlistConsecutiveNotDetectedInterval];
                    if (result)
                    {
                      int v17 = [(id)result unsignedIntValue];
                      if (!v17) {
                        return 1;
                      }
                      int v18 = v17;
                      unk_1EBE271D2 = v17;
                      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
                        return 1;
                      }
                      int v29 = 136315394;
                      BOOL v30 = "processLdcmBehaviorPlistForVersion1";
                      __int16 v31 = 1024;
                      *(_DWORD *)CFStringRef v32 = v18;
                      int v19 = MEMORY[0x1E4F14500];
                      char v20 = "%s: consecutive not detected interval : %u\n";
                      uint32_t v21 = 18;
                      goto LABEL_50;
                    }
                  }
                }
              }
            }
          }
        }
      }
      return result;
    }
    return 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136315138;
    BOOL v30 = "processLdcmBehaviorPlistForVersion2";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s\n", (uint8_t *)&v29, 0xCu);
  }
  uint64_t result = MGGetStringAnswer();
  if (result)
  {
    uint64_t v22 = result;
    uint64_t result = [a1 objectForKey:kIOAMLDCMBehaviorWetThresholdDictionaryKey];
    if (result)
    {
      char v23 = (void *)result;
      uint64_t result = [(id)result objectForKey:v22];
      if (result || (uint64_t result = [v23 objectForKey:kIOAMLDCMBehaviorThresholdDefaultKey]) != 0)
      {
        [(id)result doubleValue];
        double v25 = v24;
        uint64_t result = [a1 objectForKey:kIOAMLDCMBehaviorDryThresholdDictionarykey];
        if (result)
        {
          uint64_t v26 = (void *)result;
          uint64_t result = [(id)result objectForKey:v22];
          if (result || (uint64_t result = [v26 objectForKey:kIOAMLDCMBehaviorThresholdDefaultKey]) != 0)
          {
            [(id)result doubleValue];
            double v28 = v27;
            [(id)gUserLdcmParams setWetTransitionCapacitanceThreshold:v25];
            [(id)gUserLdcmParams setDryTransitionCapacitanceThreshold:v28];
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
              return 1;
            }
            int v29 = 136315650;
            BOOL v30 = "processLdcmBehaviorPlistForVersion2";
            __int16 v31 = 2048;
            *(double *)CFStringRef v32 = v25;
            *(_WORD *)&v32[8] = 2048;
            double v33 = v28;
            int v19 = MEMORY[0x1E4F14500];
            char v20 = "%s: wet threshold: %f dry threshold: %f\n";
            uint32_t v21 = 32;
LABEL_50:
            _os_log_impl(&dword_1D9622000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v29, v21);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

uint64_t dbgShowAccyHealthDictionary()
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  p_info = HalogenWrapper.info;
  obuint64_t j = (id)gAccyHealthDictionary;
  uint64_t result = [(id)gAccyHealthDictionary countByEnumeratingWithState:&v21 objects:v39 count:16];
  if (result)
  {
    uint64_t v3 = result;
    int v19 = 0;
    uint64_t v4 = *(void *)v22;
    uint64_t v5 = MEMORY[0x1E4F14500];
    *(void *)&long long v2 = 67110658;
    long long v17 = v2;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v21 + 1) + 8 * v6);
        unsigned int v8 = (void *)-[__objc2_class_ro objectForKey:](p_info[29], "objectForKey:", v7, v17);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v7 UTF8String];
          uint64_t v9 = [v8 lastSeenTimestamp];
          int v10 = [v8 isHealthy];
          uint64_t v11 = [v8 leakagePassedCount];
          int v12 = v5;
          uint64_t v13 = v3;
          uint64_t v14 = v4;
          uint64_t v15 = [v8 dryCount];
          uint64_t v16 = [v8 wetCount];
          *(_DWORD *)buf = v17;
          int v26 = v19 + v6;
          p_info = (__objc2_class_ro **)(HalogenWrapper + 32);
          __int16 v27 = 2082;
          uint64_t v28 = v20;
          __int16 v29 = 2048;
          uint64_t v30 = v9;
          __int16 v31 = 1024;
          int v32 = v10;
          __int16 v33 = 2048;
          uint64_t v34 = v11;
          __int16 v35 = 2048;
          uint64_t v36 = v15;
          uint64_t v4 = v14;
          uint64_t v3 = v13;
          uint64_t v5 = v12;
          __int16 v37 = 2048;
          uint64_t v38 = v16;
          _os_log_impl(&dword_1D9622000, v12, OS_LOG_TYPE_DEFAULT, "[health %d] <%{public}s> : %llu, isHealthy %d, leakagePassedCount %llu, dryCount %llu, wetCount %llu", buf, 0x40u);
        }
        ++v6;
      }
      while (v3 != v6);
      uint64_t result = [obj countByEnumeratingWithState:&v21 objects:v39 count:16];
      uint64_t v3 = result;
      v19 += v6;
    }
    while (result);
  }
  return result;
}

void IOAccessoryAggDCollectData(const void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (enableVoltageEventMonitorModeAggD)
  {
    long long v11 = unk_1D964D038;
    memset(v12, 170, 40);
    memset(v10, 170, sizeof(v10));
    if (_ADClientAddValueForScalarKey)
    {
      if (gDockState)
      {
        uint64_t v4 = objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", 1, v10[0], v10[1], v10[2], v10[3], v10[4], v11, v12[0], v12[1], *(void *)&v12[2]));
        if (v4)
        {
          [v4 dockStateValue];
          if (CFEqual(a1, @"com.apple.ioaccessorymanager.voltage.count") == 1)
          {
            uint64_t v5 = (void (*)(__CFString *, uint64_t))_ADClientAddValueForScalarKey;
            if (!_ADClientAddValueForScalarKey) {
              return;
            }
            uint64_t v6 = @"com.apple.ioaccessorymanager.voltage.count";
            goto LABEL_14;
          }
          if (CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.count") == 1)
          {
            uint64_t v5 = (void (*)(__CFString *, uint64_t))_ADClientAddValueForScalarKey;
            uint64_t v6 = @"com.apple.ioaccessorymanager.ldcm.notification.count";
LABEL_14:
            uint64_t v7 = 1;
LABEL_15:
            v5(v6, v7);
            return;
          }
          if (CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.suppress.phone") == 1)
          {
            uint64_t v5 = (void (*)(__CFString *, uint64_t))_ADClientAddValueForScalarKey;
            uint64_t v6 = @"com.apple.ioaccessorymanager.ldcm.notification.suppress.phone";
            goto LABEL_14;
          }
          if (CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.suppress.accessory") == 1)
          {
            uint64_t v5 = (void (*)(__CFString *, uint64_t))_ADClientAddValueForScalarKey;
            uint64_t v6 = @"com.apple.ioaccessorymanager.ldcm.notification.suppress.accessory";
            goto LABEL_14;
          }
          if (CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.confidentcount") == 1)
          {
            _ADClientAddValueForScalarKey(@"com.apple.ioaccessorymanager.ldcm.notification.confidentcount", 1);
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v14 = (const char *)a1;
              unsigned int v8 = MEMORY[0x1E4F14500];
              uint64_t v9 = "(!) Event: AggD key %{public}@ increment";
LABEL_23:
              _os_log_impl(&dword_1D9622000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
            }
          }
          else if (CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount") == 1)
          {
            _ADClientAddValueForScalarKey(@"com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount", 1);
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v14 = (const char *)a1;
              unsigned int v8 = MEMORY[0x1E4F14500];
              uint64_t v9 = "(!) Event: AggD key %{public}@ increment";
              goto LABEL_23;
            }
          }
          else
          {
            if (CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount") == 1)
            {
              IOAccessoryAggDBadAccyEventData((unsigned __int8 *)a2);
              return;
            }
            if (CFEqual(a1, @"com.apple.ioaccessorymanager.voltage.cumulativetime") == 1)
            {
              uint64_t v7 = *(unsigned int *)(a2 + 46);
              qword_1EA8C4C18 = v7;
              uint64_t v5 = (void (*)(__CFString *, uint64_t))_ADClientSetValueForScalarKey;
              if (_ADClientSetValueForScalarKey)
              {
                uint64_t v6 = @"com.apple.ioaccessorymanager.voltage.cumulativetime";
                goto LABEL_15;
              }
            }
            else
            {
              if (CFEqual(a1, @"com.apple.ioaccessorymanager.voltage.averagetime") == 1)
              {
                IOAccessoryAggDAverageVhiTimeData((uint64_t)v10, a2);
                return;
              }
              if (CFEqual(a1, @"histogramVoltage") == 1)
              {
                IOAccessoryAggDVoltageData((unsigned __int8 *)a2);
                return;
              }
              if (CFEqual(a1, @"com.apple.ioaccessorymanager.voltage.headset") == 1)
              {
                _ADClientAddValueForScalarKey(@"com.apple.ioaccessorymanager.voltage.headset", 1);
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v14 = (const char *)a1;
                  unsigned int v8 = MEMORY[0x1E4F14500];
                  uint64_t v9 = "(!) Event: AggD key %{public}@ increment";
                  goto LABEL_23;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v14 = "IOAccessoryAggDCollectData";
                unsigned int v8 = MEMORY[0x1E4F14500];
                uint64_t v9 = "%s Invalid AggD key\n";
                goto LABEL_23;
              }
            }
          }
        }
      }
    }
  }
}

unint64_t appendEventToHistory(void *a1, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v14[16] = v4;
  *(_OWORD *)&v14[32] = v4;
  *(_OWORD *)&v13[16] = v4;
  *(_OWORD *)uint64_t v14 = v4;
  if (objc_msgSend(a1, "count", v4)
    && (objc_msgSend((id)objc_msgSend(a1, "lastObject"), "getBytes:length:", v13, 80),
        *(unsigned __int8 *)(a2 + 12) == v13[12])
    && (*(_DWORD *)(a2 + 14) == *(_DWORD *)&v13[14]
      ? (BOOL v5 = *(unsigned __int16 *)(a2 + 18) == *(unsigned __int16 *)&v13[18])
      : (BOOL v5 = 0),
        v5
     && *(unsigned __int8 *)(a2 + 51) == v14[19]
     && (*(_DWORD *)(a2 + 26) == *(_DWORD *)&v13[26]
       ? (BOOL v6 = *(unsigned __int16 *)(a2 + 30) == *(unsigned __int16 *)&v13[30])
       : (BOOL v6 = 0),
         v6
      && (*(_DWORD *)(a2 + 20) == *(_DWORD *)&v13[20]
        ? (BOOL v7 = *(unsigned __int16 *)(a2 + 24) == *(unsigned __int16 *)&v13[24])
        : (BOOL v7 = 0),
          v7
       && (*(void *)(a2 + 32) == *(void *)v14
         ? (BOOL v8 = *(unsigned int *)(a2 + 40) == (unint64_t)*(unsigned int *)&v14[8])
         : (BOOL v8 = 0),
           v8)))))
  {
    ++*(_DWORD *)&v14[37];
    *(void *)&v14[29] = *(void *)(a2 + 4);
    uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 length:80];
    [a1 removeLastObject];
    return [a1 addObject:v12];
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 16);
    long long v10 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)uint64_t v13 = *(_OWORD *)a2;
    *(_OWORD *)&v13[16] = v9;
    *(_OWORD *)uint64_t v14 = v10;
    *(_OWORD *)&v14[13] = *(_OWORD *)(a2 + 45);
    *(_DWORD *)&v14[37] = 1;
    *(void *)&v14[29] = *(void *)(a2 + 4);
    objc_msgSend(a1, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v13, 80));
    unint64_t result = [a1 count];
    if (result >= 3) {
      return [a1 removeObjectAtIndex:0];
    }
  }
  return result;
}

void evaluateFalseDetectPreventionDry(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 132))
  {
    if (*(void *)(a1 + 40))
    {
      CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @".%012llx.%1d", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
      if (v4)
      {
        CFStringRef v5 = v4;
        uint64_t v6 = mach_continuous_time();
        if (a2)
        {
          uint64_t v7 = *(void *)(a2 + 4);
          uint64_t v8 = *(void *)(a1 + 64);
          unint64_t v9 = dword_1EA8C4C4C;
          if (dword_1EA8C4C4C)
          {
            uint64_t v10 = sTimebaseInfo;
            unint64_t v11 = v8 * (unint64_t)sTimebaseInfo / dword_1EA8C4C4C;
          }
          else
          {
            mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
            uint64_t v10 = sTimebaseInfo;
            unint64_t v9 = dword_1EA8C4C4C;
            unint64_t v11 = v8 * (unint64_t)sTimebaseInfo / dword_1EA8C4C4C;
            if (!dword_1EA8C4C4C)
            {
              mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
              uint64_t v10 = sTimebaseInfo;
              unint64_t v9 = dword_1EA8C4C4C;
            }
          }
          unint64_t v12 = (v7 * v10 / v9 - v11) / 0x3B9ACA00;
          if (v12 < [(id)gUserLdcmParams minVhiDurationSec])
          {
            CFStringRef v13 = @"com.apple.ioaccessorymanager.ldcm.notification.drytooshort";
            CFStringRef v14 = v5;
            unint64_t v15 = v12;
LABEL_11:
            IOAccessoryAggDCollectDataWithInterval(v13, v14, v15);
            CFRelease(v5);
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v7 = v6;
        }
        IOAccessoryAggDCollectData(@"com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount", 0);
        uint64_t v16 = *(void *)(a1 + 64);
        unint64_t v17 = dword_1EA8C4C4C;
        if (dword_1EA8C4C4C)
        {
          uint64_t v18 = sTimebaseInfo;
          unint64_t v19 = v16 * (unint64_t)sTimebaseInfo / dword_1EA8C4C4C;
        }
        else
        {
          mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          uint64_t v18 = sTimebaseInfo;
          unint64_t v17 = dword_1EA8C4C4C;
          unint64_t v19 = v16 * (unint64_t)sTimebaseInfo / dword_1EA8C4C4C;
          if (!dword_1EA8C4C4C)
          {
            mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
            uint64_t v18 = sTimebaseInfo;
            unint64_t v17 = dword_1EA8C4C4C;
          }
        }
        unint64_t v15 = (v7 * v18 / v17 - v19) / 0x3B9ACA00;
        CFStringRef v13 = @"com.apple.ioaccessorymanager.ldcm.notification.wetduration";
        CFStringRef v14 = v5;
        goto LABEL_11;
      }
    }
  }
LABEL_12:
  *(unsigned char *)(a1 + 132) = 0;
  *(void *)(a1 + 40) = 0;
}

BOOL isChargingCableAttached(unsigned char *a1)
{
  if (*a1 != 16) {
    return 0;
  }
  if ((a1[1] & 3) != 1) {
    return (a1[1] & 3) == 0 && !a1[2] && !a1[3] && !a1[4] && !a1[5];
  }
  if ((a1[2] & 8) == 0 || a1[3] || a1[4]) {
    return 0;
  }
  return a1[5] == 0;
}

void trimAccyHealthDictionary()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[(id)gAccyHealthDictionary count] >= 0x20)
  {
    uint64_t v0 = objc_msgSend(NSString, "stringWithFormat:", @"%012llx_%1d_%012llx", 0, 0, 0);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    CFDictionaryRef v1 = (void *)gAccyHealthDictionary;
    uint64_t v2 = [(id)gAccyHealthDictionary countByEnumeratingWithState:&v11 objects:v19 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = 0;
      uint64_t v5 = *(void *)v12;
      unint64_t v6 = -1;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v1);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (([v8 isEqualToString:v0] & 1) == 0)
          {
            unint64_t v9 = (void *)[(id)gAccyHealthDictionary objectForKey:v8];
            if ([v9 lastSeenTimestamp] < v6)
            {
              if (v4) {

              }
              id v4 = v8;
              unint64_t v6 = [v9 lastSeenTimestamp];
            }
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v19 count:16];
      }
      while (v3);
      if (v4)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v4 UTF8String];
          *(_DWORD *)buf = 136446466;
          uint64_t v16 = v10;
          __int16 v17 = 2048;
          unint64_t v18 = v6;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[trim] <%{public}s> : %llu", buf, 0x16u);
        }
        [(id)gAccyHealthDictionary removeObjectForKey:v4];
      }
    }
  }
}

void commitPersistentAccyHealthDictionary()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (v0)
  {
    CFDictionaryRef v1 = (void *)v0;
    uint64_t v5 = 0;
    uint64_t v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:gAccyHealthDictionary requiringSecureCoding:1 error:&v5];
    uint64_t v3 = v5;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "localizedDescription"), "UTF8String");
        *(_DWORD *)buf = 136315394;
        uint64_t v7 = "commitPersistentAccyHealthDictionary";
        __int16 v8 = 2080;
        uint64_t v9 = v4;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);
        uint64_t v3 = v5;
      }
    }
    if (v2) {
      [v1 setObject:v2 forKey:@"accyHealthDict"];
    }
  }
}

uint64_t evaluateAccyHealthDictionary(unint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (gAccyHealthDictionary
    && (uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%012llx_%1d_%012llx", 0, 0, 0),
        (uint64_t v5 = (void *)[(id)gAccyHealthDictionary objectForKey:v4]) != 0)
    && [v5 isHealthy])
  {
    if (!digitalIdNumPinsFree(a1, (uint64_t)buf))
    {
      int v8 = 0;
      int v9 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%012llx_%1d_%012llx", a1, *(unsigned __int8 *)(a2 + 51), *(void *)(a2 + 53));
    uint64_t v7 = (void *)[(id)gAccyHealthDictionary objectForKey:v6];
    if (v7)
    {
      int v8 = 0;
      int v9 = [v7 isHealthy] ^ 1;
      goto LABEL_7;
    }
    int v8 = 0;
  }
  else
  {
    int v8 = 1;
  }
  int v9 = 1;
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(unsigned __int8 *)(a2 + 51);
    uint64_t v11 = *(void *)(a2 + 53);
    *(_DWORD *)buf = 134219008;
    unint64_t v16 = a1;
    __int16 v17 = 1024;
    int v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 1024;
    int v24 = v9;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[eval] <%012llx_%1d_%012llx> : emptyFail %d, accyFail %d", buf, 0x28u);
  }
  long long v12 = @"com.apple.ioaccessorymanager.ldcm.notification.confidentcount";
  if (v9) {
    long long v12 = @"com.apple.ioaccessorymanager.ldcm.notification.suppress.accessory";
  }
  if (v8) {
    long long v13 = @"com.apple.ioaccessorymanager.ldcm.notification.suppress.phone";
  }
  else {
    long long v13 = v12;
  }
  IOAccessoryAggDCollectData(v13, a2);
  return (v8 | v9) ^ 1u;
}

uint64_t digitalIdNumPinsFree(unint64_t a1, uint64_t a2)
{
  uint64_t v2 = (a1 >> 40) & 4;
  uint64_t v3 = (a1 >> 40) & 3;
  *(_WORD *)(a2 + 4) = 257;
  *(_DWORD *)a2 = 16843009;
  uint64_t v4 = (a1 >> 40) & 0x18;
  if (((a1 >> 40) & 0x18) != 0)
  {
    *(_WORD *)a2 = 0;
    unsigned int v5 = 2;
    if (!v3) {
      goto LABEL_7;
    }
  }
  else
  {
    unsigned int v5 = 0;
    if (!v3) {
      goto LABEL_7;
    }
  }
  BOOL v6 = v4 == 0;
  BOOL v7 = v4 != 0;
  v5 += 2;
  int v8 = (unsigned char *)(a2 + 3);
  if (v6) {
    int v8 = (unsigned char *)(a2 + 1);
  }
  *int v8 = 0;
  *(unsigned char *)(a2 + 2 * v7) = 0;
LABEL_7:
  if (v2)
  {
    v5 += 2;
    int v9 = (unsigned char *)(a2 + 3);
    if ((a1 & 0x1B0000000000) == 0) {
      int v9 = (unsigned char *)(a2 + 1);
    }
    unsigned char *v9 = 0;
    *(unsigned char *)(a2 + 2 * ((a1 & 0x1B0000000000) != 0)) = 0;
  }
  if ((a1 & 0x8000000) != 0)
  {
    unsigned int v10 = BYTE3(a1) & 1;
    v5 += v10 + 1;
    BOOL v11 = v10 == 0;
    long long v12 = (BOOL *)(a2 + 3);
    if ((a1 & 0x1F0000000000) == 0) {
      long long v12 = (BOOL *)(a2 + 1);
    }
    BOOL *v12 = v11;
    unsigned int v13 = v2 >> 1;
    if ((a1 & 0x1B0000000000) != 0) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = v13;
    }
    *(unsigned char *)(a2 + v14) = 0;
  }
  if (v5 <= 4) {
    return 4 - v5;
  }
  else {
    return 0;
  }
}

void IOAccessoryAggDCollectDataWithInterval(const __CFString *a1, const __CFString *a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (enableVoltageEventMonitorModeAggD) {
    BOOL v3 = _ADClientPushValueForDistributionKey == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3
    && (CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.overvoltage")
     || CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.drytooshort")
     || CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.voltagefluctuation")
     || CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.wettoolong")
     || CFEqual(a1, @"com.apple.ioaccessorymanager.ldcm.notification.wetduration")))
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, a1);
    int v8 = MutableCopy;
    if (a2) {
      CFStringAppend(MutableCopy, a2);
    }
    if (v8)
    {
      _ADClientPushValueForDistributionKey(v8, (double)a3);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543618;
        unsigned int v10 = v8;
        __int16 v11 = 2048;
        unint64_t v12 = a3;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(!) Event: AggD key %{public}@ with value %llu", (uint8_t *)&v9, 0x16u);
      }
      CFRelease(v8);
    }
  }
}

void IOAccessoryAggDBadAccyEventData(unsigned __int8 *a1)
{
  if (_ADClientAddValueForScalarKey)
  {
    uint64_t v1 = 0;
    unint64_t v2 = ((unint64_t)a1[14] << 40) | ((unint64_t)a1[15] << 32) | ((unint64_t)a1[16] << 24) | ((unint64_t)a1[17] << 16) | ((unint64_t)a1[18] << 8) | a1[19];
    while (kAggDKnownDigitalID[v1] != v2)
    {
      if (++v1 == 6)
      {
        unint64_t v2 = 0xFFFFFFFFFFFFLL;
        break;
      }
    }
    if (a1[51] <= 1u) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = a1[51];
    }
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @".%012llx.%1d", v2, v3);
    if (v5)
    {
      CFStringRef v6 = v5;
      MutableCopy = CFStringCreateMutableCopy(v4, 0, @"com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount");
      if (MutableCopy)
      {
        int v8 = MutableCopy;
        CFStringAppend(MutableCopy, v6);
        _ADClientAddValueForScalarKey(v8, 1);
        CFRelease(v8);
      }
      CFRelease(v6);
    }
  }
}

uint64_t IOAccessoryAggDAverageVhiTimeData(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (dword_1EA8C4C0C == stats)
    {
      unint64_t v2 = *(void *)(a2 + 4);
      unint64_t v3 = *(void *)(result + 4);
      if (v3 < v2)
      {
        unint64_t v4 = dword_1EA8C4C4C;
        if (dword_1EA8C4C4C)
        {
          uint64_t v5 = sTimebaseInfo;
          unint64_t v6 = v2 * sTimebaseInfo / dword_1EA8C4C4C;
        }
        else
        {
          unint64_t result = mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          uint64_t v5 = sTimebaseInfo;
          unint64_t v4 = dword_1EA8C4C4C;
          unint64_t v6 = v2 * sTimebaseInfo / dword_1EA8C4C4C;
          if (!dword_1EA8C4C4C)
          {
            unint64_t result = mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
            uint64_t v5 = sTimebaseInfo;
            unint64_t v4 = dword_1EA8C4C4C;
          }
        }
        unint64_t v7 = v6 - v5 * v3 / v4;
        if (v7 >= 0x3B9ACA00)
        {
          qword_1EA8C4C10 = (v7 / 0x3B9ACA00 + qword_1EA8C4C10 * (stats - 1)) / stats;
          int v8 = (uint64_t (*)(__CFString *))_ADClientSetValueForScalarKey;
          if (_ADClientSetValueForScalarKey)
          {
            return v8(@"com.apple.ioaccessorymanager.voltage.averagetime");
          }
        }
      }
    }
  }
  return result;
}

void IOAccessoryAggDVoltageData(unsigned __int8 *a1)
{
  if (_ADClientPushValueForDistributionKey)
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @".%02x%02x%02x%02x%02x%02x", a1[14], a1[15], a1[16], a1[17], a1[18], a1[19]);
    uint64_t v5 = 0;
    unint64_t v6 = a1 + 20;
    do
    {
      if (v6[v5])
      {
        LOWORD(v4) = *(_WORD *)&v6[2 * v5 + 12];
        double v7 = (double)v4 / 1000.0;
        MutableCopy = CFStringCreateMutableCopy(v2, 0, off_1E6B6D7F8[v5]);
        CFStringAppend(MutableCopy, v3);
        _ADClientPushValueForDistributionKey(MutableCopy, v7);
        CFRelease(MutableCopy);
      }
      ++v5;
    }
    while (v5 != 4);
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

void *IOAccessoryAppleCareLoggingForNonVoltageEvents(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t result = (void *)[MEMORY[0x1E4F1CA48] array];
  if (enableVoltageEventMonitorModeAppleCareLogging)
  {
    double v7 = result;
    objc_msgSend(result, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", 100));
    [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%s", a1)];
    [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%02x %02x %02x %02x %02x %02x", *a2, a2[1], a2[2], a2[3], a2[4], a2[5])];
    [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"0x%x", a3)];
    objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithBool:", 0));
    objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithBool:", 0));
    unint64_t result = objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithBool:", 0));
    int v8 = (uint64_t (*)(void *))_logEventForAppleCare;
    if (_logEventForAppleCare)
    {
      return (void *)v8(v7);
    }
  }
  return result;
}

uint64_t IOAccessoryAggDPostScalarKey(uint64_t result, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2)
    {
      CFAllocatorRef v2 = (uint64_t (*)(uint64_t, uint64_t))_ADClientAddValueForScalarKey;
      if (_ADClientAddValueForScalarKey)
      {
        uint64_t v3 = result;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v4 = 138543362;
          uint64_t v5 = v3;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Incrementing aggd key: %{public}@", (uint8_t *)&v4, 0xCu);
          CFAllocatorRef v2 = (uint64_t (*)(uint64_t, uint64_t))_ADClientAddValueForScalarKey;
        }
        return v2(v3, 1);
      }
    }
  }
  return result;
}

void IOAccessoryAggDPostHistogramKey(const __CFString *a1, void *a2, double a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1 && a2 && _ADClientPushValueForDistributionKey)
  {
    if (CFStringCompare(a1, @"com.apple.ioaccessorymanager.ldcm.notification.wetduration", 1uLL)
      && CFStringCompare(a1, @"com.apple.ioaccessorymanager.ldcm.notification.wettoolong", 1uLL)
      && CFStringCompare(a1, @"com.apple.ioaccessorymanager.ldcm.notification.drytooshort", 1uLL))
    {
      BOOL ShouldKeyUseEventBasedData = IOAccessoryShouldKeyUseEventBasedData(a1);
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (ShouldKeyUseEventBasedData)
      {
        uint64_t v8 = [a2 eventBasedDigitalID];
        uint64_t v9 = [a2 eventBasedOrientation];
      }
      else
      {
        uint64_t v8 = [a2 connectedAccessoryDigitalID];
        uint64_t v9 = [a2 connectedAccessoryOrientation];
      }
      CFStringRef v13 = CFStringCreateWithFormat(v7, 0, @"_%012llx_%1d", v8, v9);
    }
    else
    {
      BOOL v10 = IOAccessoryShouldKeyUseEventBasedData(a1);
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (v10)
      {
        uint64_t v11 = [a2 eventBasedDigitalID];
        uint64_t v12 = [a2 eventBasedOrientation];
      }
      else
      {
        uint64_t v11 = [a2 connectedAccessoryDigitalID];
        uint64_t v12 = [a2 connectedAccessoryOrientation];
      }
      CFStringRef v13 = CFStringCreateWithFormat(v7, 0, @".%012llx.%1d", v11, v12);
    }
    CFStringRef v14 = v13;
    if (v13)
    {
      MutableCopy = CFStringCreateMutableCopy(v7, 0, a1);
      if (MutableCopy)
      {
        unint64_t v16 = MutableCopy;
        CFStringAppend(MutableCopy, v14);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          int v18 = v16;
          __int16 v19 = 2048;
          double v20 = a3;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logging aggd key: %{public}@ value: %f", buf, 0x16u);
        }
        _ADClientPushValueForDistributionKey(v16, a3);
        CFRelease(v16);
        CFRelease(v14);
      }
    }
  }
}

uint64_t __IOAccessoryHandleDetach_block_invoke(uint64_t a1)
{
  return performEisMeasurement(*(void **)(a1 + 32));
}

BOOL IOAccessoryShouldKeyUseEventBasedData(const __CFString *a1)
{
  return CFStringCompare(a1, @"com.apple.ioaccessorymanager.ldcm.eis.drytime.histogram", 1uLL) == kCFCompareEqualTo
      || CFStringCompare(a1, @"com.apple.ioaccessorymanager.ldcm.eis.drytimeV2.histogram", 1uLL) == kCFCompareEqualTo;
}

uint64_t _retrieveDeviceInterfaceSerialNumber()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v0 = 4;
  while (1)
  {
    uint64_t v1 = IOAccessoryManagerCopyDeviceInfo();
    if (!v1) {
      break;
    }
    usleep(0x186A0u);
    if (!--v0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v3 = 136315394;
        int v4 = "_retrieveDeviceInterfaceSerialNumber";
        __int16 v5 = 1024;
        int v6 = v1;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s IOAccessoryManagerCopyDeviceInfo returned %x\n", (uint8_t *)&v3, 0x12u);
      }
      return v1;
    }
  }
  return v1;
}

void __IOAccessoryHandleAttach_block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    int v3 = "IOAccessoryHandleAttach_block_invoke";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s starting local asset query\n", (uint8_t *)&v2, 0xCu);
  }
  performAssetQuery(1, *(_DWORD *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    int v3 = "IOAccessoryHandleAttach_block_invoke";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s finished local asset query\n", (uint8_t *)&v2, 0xCu);
  }
}

void _generateUIAnalyticEvents(void *a1, int a2)
{
  valuePtr[1] = *MEMORY[0x1E4F143B8];
  if ([a1 didNotify]) {
    return;
  }
  IOAccessoryAggDPostScalarKey(@"com.apple.ioaccessorymanager.ldcm.notification.count", (uint64_t)a1);
  [a1 setDidNotify:1];
  if ([a1 didConfidentNotify])
  {
LABEL_17:
    setDriverMitigationEnabled(a2, [a1 service], 0);
    return;
  }
  int v4 = -1431655766;
  CFNumberRef number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  valuePtr[0] = 0;
  if (!gAccyHealthDictionary)
  {
    uint64_t v5 = 0;
LABEL_86:
    int v12 = 1;
LABEL_90:
    int v13 = 1;
    goto LABEL_10;
  }
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%012llx_%1d_%012llx", 0, 0, 0);
  int v6 = (void *)[(id)gAccyHealthDictionary objectForKey:v5];
  if (!v6 || ![v6 isHealthy]) {
    goto LABEL_86;
  }
  if (!digitalIdNumPinsFree([a1 connectedAccessoryDigitalID], (uint64_t)buf))
  {
    int v12 = 0;
    int v13 = 0;
    goto LABEL_10;
  }
  [a1 service];
  int DeviceInterfaceSerialNumber = _retrieveDeviceInterfaceSerialNumber();
  if (DeviceInterfaceSerialNumber)
  {
    int v4 = DeviceInterfaceSerialNumber;
    int v12 = 0;
    goto LABEL_90;
  }
  CFNumberGetValue(number, kCFNumberSInt64Type, valuePtr);
  CFRelease(number);
  uint64_t v8 = NSString;
  uint64_t v9 = [a1 connectedAccessoryDigitalID];
  uint64_t v10 = [a1 connectedAccessoryOrientation];
  uint64_t v5 = objc_msgSend(v8, "stringWithFormat:", @"%012llx_%1d_%012llx", v9, v10, valuePtr[0]);
  uint64_t v11 = (void *)[(id)gAccyHealthDictionary objectForKey:v5];
  if (!v11)
  {
    int v12 = 0;
    int v4 = 0;
    goto LABEL_90;
  }
  int v12 = 0;
  int v4 = 0;
  int v13 = [v11 isHealthy] ^ 1;
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v46 = (const char *)v5;
    __int16 v47 = 1024;
    LODWORD(v48[0]) = v12;
    WORD2(v48[0]) = 1024;
    *(_DWORD *)((char *)v48 + 6) = v13;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[eval] <%{public}@> : emptyFail %d, accyFail %d", buf, 0x18u);
  }
  if (v12)
  {
    IOAccessoryAggDPostScalarKey(@"com.apple.ioaccessorymanager.ldcm.notification.suppress.phone", (uint64_t)a1);
    goto LABEL_17;
  }
  if (v13)
  {
    IOAccessoryAggDPostScalarKey(@"com.apple.ioaccessorymanager.ldcm.notification.suppress.accessory", (uint64_t)a1);
    IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.suppress.accessory", a1);
    if (v4) {
      IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.error.suppress.accessory", a1);
    }
    goto LABEL_17;
  }
  IOAccessoryAggDPostScalarKey(@"com.apple.ioaccessorymanager.ldcm.notification.confidentcount", (uint64_t)a1);
  [a1 setDidConfidentNotify:1];
  if ([(id)gUserLdcmParams enableHalogenMitigationsAndUI] == 1)
  {
    CFNumberRef number = 0;
    if (([(id)gUserLdcmParams userBehaviorMask] & 2) != 0 && !gLiquidNotificationContext)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - *(double *)&qword_1EBE271E0 >= 480.0)
      {
        char v15 = 0;
        qword_1EBE271E0 = *(void *)&Current;
      }
      else
      {
        char v15 = 1;
      }
      byte_1EBE271E8 = v15;
      char v16 = [(id)gUserLdcmParams userBehaviorMask];
      if ((v16 & 4) == 0)
      {
        byte_1EBE271E8 = 0;
        qword_1EBE271E0 = *(void *)&Current;
      }
      __int16 v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
      if (v17)
      {
        int v18 = v17;
        uint64_t v19 = MEMORY[0x1E4F1CC28];
        uint64_t v20 = MEMORY[0x1E4F1CC38];
        if ((v16 & 4) != 0) {
          uint64_t v21 = MEMORY[0x1E4F1CC28];
        }
        else {
          uint64_t v21 = MEMORY[0x1E4F1CC38];
        }
        [v17 setObject:v21 forKeyedSubscript:@"legacy"];
        if (byte_1EBE2710C) {
          uint64_t v22 = v20;
        }
        else {
          uint64_t v22 = v19;
        }
        [v18 setObject:v22 forKeyedSubscript:@"chargerConnected"];
        if (byte_1EBE271E8) {
          uint64_t v23 = v20;
        }
        else {
          uint64_t v23 = v19;
        }
        [v18 setObject:v23 forKeyedSubscript:@"reinsertion"];
        id v24 = objc_alloc_init(MEMORY[0x1E4F28C80]);
        if (v24)
        {
          uint64_t v25 = v24;
          [v24 setUserInfo:v18];
          valuePtr[0] = v25;
          uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", valuePtr, 1), 1, &number);
          id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          if (v27)
          {
            uint64_t v28 = v27;
            [v27 setObject:@"com.apple.IOAccessoryManagerFramework.WetNotification" forKeyedSubscript:*MEMORY[0x1E4FA7348]];
            [v28 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4FA7350]];
            uint64_t v29 = MEMORY[0x1E4F1CC38];
            [v28 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];
            [v28 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4FA7328]];
            [v28 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4FA7340]];
            uint64_t v30 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.IOAccessoryManagerFramework"];
            __int16 v31 = v30;
            if (v30)
            {
              uint64_t v32 = [v30 pathForResource:@"PlugIns/WetNotification.appex/Assets.car" ofType:&stru_1F3381008];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v46 = "IOAccessoryNotifyWet";
                __int16 v47 = 2112;
                v48[0] = v32;
                _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Setting asset path for LDCM wet icon:%@", buf, 0x16u);
              }
              [v28 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4FA7390]];
              [v28 setObject:@"lockScreenLiquidDetection" forKeyedSubscript:*MEMORY[0x1E4FA7388]];
              [v28 setObject:@"YES" forKeyedSubscript:*MEMORY[0x1E4FA7380]];
              [v28 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4FA7368]];
              [v28 setObject:@"lockScreenLiquidDetection" forKeyedSubscript:*MEMORY[0x1E4FA7360]];
              uint64_t v33 = [v31 resourceURL];
              [v28 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F1DA00]];
            }
            if ((v16 & 4) != 0)
            {
              if (v31) {
                __int16 v35 = @"WETMSG_DIALOG_HEADER_LOCKSCREEN";
              }
              else {
                __int16 v35 = @"LIQUID DETECTED";
              }
              if (v31) {
                uint64_t v36 = @"WETMSG_DIALOG_BODY_LOCKSCREEN";
              }
              else {
                uint64_t v36 = @"Charging is not available because liquid has been detected in the Lightning connector. Disconnect to allow the connector to dry.";
              }
              if (v31) {
                __int16 v37 = @"WETMSG_BUTTON_DISMISS";
              }
              else {
                __int16 v37 = @"Dismiss";
              }
              uint64_t v38 = @"WETMSG_BUTTON_EMERGENCY_OVERRIDE";
              if (!v31) {
                uint64_t v38 = @"Emergency Override";
              }
              if (byte_1EBE271E8) {
                uint64_t v34 = v38;
              }
              else {
                uint64_t v34 = 0;
              }
            }
            else
            {
              uint64_t v34 = 0;
              if (v31) {
                __int16 v35 = @"WETMSG_DIALOG_HEADER_LOCKSCREEN_LEGACY";
              }
              else {
                __int16 v35 = @"LIQUID DETECTED";
              }
              if (v31) {
                uint64_t v36 = @"WETMSG_DIALOG_BODY_LOCKSCREEN_LEGACY";
              }
              else {
                uint64_t v36 = @"Liquid has been detected in the Lightning connector. Disconnect to allow the connector to dry. Charging now may damage your iPhone.";
              }
              if (v31) {
                __int16 v37 = @"WETMSG_BUTTON_CLOSE";
              }
              else {
                __int16 v37 = @"Close";
              }
            }
            [v28 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4FA73A8]];
            [v28 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4FA73B8]];
            [v28 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
            [v28 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
            if (gEnableTapToRadarPopup && gGiveUserRadarOption && gIsInternalBuild)
            {
              if (v31) {
                unsigned int v39 = @"WETMSG_BUTTON_RADAR";
              }
              else {
                unsigned int v39 = @"Radar";
              }
              [v28 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
            }
            gLiquidNotificationContext = 1;
            if (a1) {
              qword_1EBE27208 = (uint64_t)a1;
            }
            CFAllocatorRef v40 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            qword_1EBE271F0 = (uint64_t)CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, (CFDictionaryRef)v28);
            RunLoopSource = CFUserNotificationCreateRunLoopSource(v40, (CFUserNotificationRef)qword_1EBE271F0, (CFUserNotificationCallBack)IOAccessoryNotifyWetCallback_0, 0);
            qword_1EBE271F8 = (uint64_t)RunLoopSource;
            if (RunLoopSource) {
              CFRunLoopAddSource((CFRunLoopRef)qword_1EBE27200, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
            }

            uint64_t v25 = v18;
            int v18 = v28;
          }
        }
      }
      CFNumberRef v42 = number;
      if (number)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = objc_msgSend((id)-[__CFNumber localizedDescription](v42, "localizedDescription"), "UTF8String");
          *(_DWORD *)buf = 136315394;
          uint64_t v46 = "IOAccessoryNotifyWet";
          __int16 v47 = 2080;
          v48[0] = v43;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);
          CFNumberRef v42 = number;
        }
      }
    }
  }
}

void IOAccessoryAggDPostScalarPrefixKey(const __CFString *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1 && a2 && _ADClientAddValueForScalarKey)
  {
    CFComparisonResult v4 = CFStringCompare(a1, @"com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount", 1uLL);
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v6 = [a2 connectedAccessoryDigitalID];
    uint64_t v7 = [a2 connectedAccessoryOrientation];
    CFStringRef v8 = v4
       ? CFStringCreateWithFormat(v5, 0, @"_%012llx_%1d", v6, v7)
       : CFStringCreateWithFormat(v5, 0, @".%012llx.%1d", v6, v7);
    if (v8)
    {
      CFStringRef v9 = v8;
      MutableCopy = CFStringCreateMutableCopy(v5, 0, a1);
      if (MutableCopy)
      {
        uint64_t v11 = MutableCopy;
        CFStringAppend(MutableCopy, v9);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          int v13 = v11;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Incrementing aggd key: %{public}@", buf, 0xCu);
        }
        _ADClientAddValueForScalarKey(v11, 1);
        CFRelease(v11);
        CFRelease(v9);
      }
    }
  }
}

uint64_t __IOAccessoryHandleAttach_block_invoke_745(uint64_t a1)
{
  return performEisMeasurement(*(void **)(a1 + 32));
}

uint64_t halogenMeasurementCleanup(void *a1)
{
  [a1 setConnectedAccessoryPDigitalID:0];
  [a1 setIsTimestampValid:0];
  [a1 setIsWet:0];
  [a1 setWasTapToRadarShown:0];
  [a1 setIsMeasurementEnabled:0];
  [a1 setDidNotify:0];
  [a1 setDidConfidentNotify:0];
  [a1 setDidHighConfidentNotify:0];
  [a1 setDidWetDuration:0];
  [a1 setAccessoryConnectedWhileWet:0];
  [a1 setDidWetTooLong:0];
  [a1 setIsHeadsetConnected:0];
  [a1 setIsDebugAccessoryConnected:0];
  return [a1 setIsBlacklistedAccessoryConnected:0];
}

void IOAccessoryNotifyWetCallback_0(uint64_t a1, uint64_t a2)
{
  if (gLiquidNotificationContext)
  {
    gLiquidNotificationContext = 0;
    if (qword_1EBE27208)
    {
      if (byte_1EBE271E8)
      {
        switch(a2)
        {
          case 2:
            ServiceWithuint64_t PrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
            if (ServiceWithPrimaryPort)
            {
              setDriverMitigationEnabled(1, ServiceWithPrimaryPort, 0);
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)int v3 = 0;
                _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "UI Emergency Override!!!\n", v3, 2u);
              }
              if (qword_1EBE27208) {
                IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.mitigation.override", (void *)qword_1EBE27208);
              }
            }
            break;
          case 1:
            IOAccessoryGiveUserRadarOption((void *)qword_1EBE27208, 0);
            break;
          case 0:
            IOAccessoryNotifyWetHandlerDismiss_0();
            break;
        }
        IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.eis.mitigation.override.seen", (void *)qword_1EBE27208);
      }
      else if (a2 == 1)
      {
        IOAccessoryGiveUserRadarOption((void *)qword_1EBE27208, 0);
      }
      else if (!a2)
      {
        IOAccessoryNotifyWetHandlerDismiss_0();
      }
      CFRunLoopRemoveSource((CFRunLoopRef)qword_1EBE27200, (CFRunLoopSourceRef)qword_1EBE271F8, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      CFRelease((CFTypeRef)qword_1EBE271F8);
      CFRelease((CFTypeRef)qword_1EBE271F0);
    }
  }
}

void IOAccessoryNotifyWetHandlerDismiss_0()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v0 = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "UI Dismiss!!!\n", v0, 2u);
  }
}

void IOAccessoryGiveUserRadarOption(void *a1, int a2)
{
  CFComparisonResult v4 = (void *)[a1 halogenMeasurement];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "copyItemAtPath:toPath:error:", @"/tmp/halogen.wav", @"/tmp/halogen_ttr.wav", 0);
  CFAllocatorRef v5 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"Halogen Measurements:\n\n"];
  objc_msgSend(v5, "appendFormat:", @"precalibrationSampleOffsetInFrames -> %d\n", objc_msgSend(v4, "precalibrationSampleOffsetInFrames"));
  objc_msgSend(v5, "appendFormat:", @"calibrationSampleOffsetInFrames -> %d\n", objc_msgSend(v4, "calibrationSampleOffsetInFrames"));
  objc_msgSend(v5, "appendFormat:", @"measurementSampleOffsetInFrames -> %d\n", objc_msgSend(v4, "measurementSampleOffsetInFrames"));
  [v4 voltageGainCorrection];
  objc_msgSend(v5, "appendFormat:", @"voltageGainCorrection -> %.13f\n", v6);
  [v4 currentGainCorrection];
  objc_msgSend(v5, "appendFormat:", @"currentGainCorrection -> %.13f\n", v7);
  [v4 currentPhaseCompensation];
  objc_msgSend(v5, "appendFormat:", @"currentPhaseCompensation -> %.13f\n", v8);
  [v4 goertzelImpedance];
  objc_msgSend(v5, "appendFormat:", @"goertzelImpedance -> %.13f\n", v9);
  [v4 goertzelPhase];
  objc_msgSend(v5, "appendFormat:", @"goertzelPhase -> %.13f\n", v10);
  [v4 compensatedImpedance];
  objc_msgSend(v5, "appendFormat:", @"compensatedImpedance -> %.13f\n", v11);
  [v4 compensatedPhase];
  objc_msgSend(v5, "appendFormat:", @"compensatedPhase -> %.13f\n", v12);
  [v4 clippingScore];
  objc_msgSend(v5, "appendFormat:", @"clippingScore -> %.13f\n", v13);
  [v4 resistanceInOhms];
  objc_msgSend(v5, "appendFormat:", @"Resistance in Ohms -> %.13f\n", v14);
  [v4 capacitanceInNanoF];
  objc_msgSend(v5, "appendFormat:", @"Capacitance in nF -> %.13f\n", v15);
  [v4 precalVoltageSignalLevel];
  objc_msgSend(v5, "appendFormat:", @"precalVoltageSignalLevel -> %.13f\n", v16);
  [v4 precalVoltageNoiseLevel];
  objc_msgSend(v5, "appendFormat:", @"precalVoltageNoiseLevel -> %.13f\n", v17);
  [v4 precalVoltageSNR];
  objc_msgSend(v5, "appendFormat:", @"precalVoltageSNR -> %.13f\n", v18);
  [v4 precalCurrentSignalLevel];
  objc_msgSend(v5, "appendFormat:", @"precalCurrentSignalLevel -> %.13f\n", v19);
  [v4 precalCurrentNoiseLevel];
  objc_msgSend(v5, "appendFormat:", @"precalCurrentNoiseLevel -> %.13f\n", v20);
  [v4 precalCurrentSNR];
  objc_msgSend(v5, "appendFormat:", @"precalCurrentSNR -> %.13f\n", v21);
  [v4 calVoltageSignalLevel];
  objc_msgSend(v5, "appendFormat:", @"calVoltageSignalLevel -> %.13f\n", v22);
  [v4 calVoltageNoiseLevel];
  objc_msgSend(v5, "appendFormat:", @"calVoltageNoiseLevel -> %.13f\n", v23);
  [v4 calVoltageSNR];
  objc_msgSend(v5, "appendFormat:", @"calVoltageSNR -> %.13f\n", v24);
  [v4 calCurrentSignalLevel];
  objc_msgSend(v5, "appendFormat:", @"calCurrentSignalLevel -> %.13f\n", v25);
  [v4 calCurrentNoiseLevel];
  objc_msgSend(v5, "appendFormat:", @"calCurrentNoiseLevel -> %.13f\n", v26);
  [v4 calCurrentSNR];
  objc_msgSend(v5, "appendFormat:", @"calCurrentSNR -> %.13f\n", v27);
  [v4 measurementVoltageSignalLevel];
  objc_msgSend(v5, "appendFormat:", @"measurementVoltageSignalLevel -> %.13f\n", v28);
  [v4 measurementVoltageNoiseLevel];
  objc_msgSend(v5, "appendFormat:", @"measurementVoltageNoiseLevel -> %.13f\n", v29);
  [v4 measurementVoltageSNR];
  objc_msgSend(v5, "appendFormat:", @"measurementVoltageSNR -> %.13f\n", v30);
  [v4 measurementCurrentSignalLevel];
  objc_msgSend(v5, "appendFormat:", @"measurementCurrentSignalLevel -> %.13f\n", v31);
  [v4 measurementCurrentNoiseLevel];
  objc_msgSend(v5, "appendFormat:", @"measurementCurrentNoiseLevel -> %.13f\n", v32);
  [v4 measurementCurrentSNR];
  objc_msgSend(v5, "appendFormat:", @"measurementCurrentSNR -> %.13f\n", v33);
  [v4 measurementCondetSNR];
  objc_msgSend(v5, "appendFormat:", @"measurementCondetSNR -> %.13f\n", v34);
  [v5 appendFormat:@"Measurement Result -> %@\n\n", objc_msgSend(v4, "getResultString")];
  objc_msgSend(v5, "appendFormat:", @"event based DigitalID -> 0x%012llx\n", objc_msgSend(a1, "eventBasedDigitalID"));
  objc_msgSend(v5, "appendFormat:", @"connected accessory DigitalID -> 0x%012llx\n", objc_msgSend(a1, "connectedAccessoryDigitalID"));
  objc_msgSend(v5, "appendFormat:", @"event based orientation -> %d\n", objc_msgSend(a1, "eventBasedOrientation"));
  objc_msgSend(v5, "appendFormat:", @"connected accessory orientation -> %d\n", objc_msgSend(a1, "connectedAccessoryOrientation"));
  int v35 = [a1 pinID];
  if (v35 > 3) {
    uint64_t v36 = "Invalid";
  }
  else {
    uint64_t v36 = IOAccessoryGetPinStrForIndex_pinStr[v35];
  }
  objc_msgSend(v5, "appendFormat:", @"pin -> %s\n", v36);
  __int16 v37 = [a1 halogenTtrDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __IOAccessoryGiveUserRadarOption_block_invoke;
  block[3] = &unk_1E6B6D820;
  int v39 = a2;
  void block[4] = v5;
  void block[5] = a1;
  dispatch_async(v37, block);
}

void __IOAccessoryGiveUserRadarOption_block_invoke(uint64_t a1)
{
  if ([(id)gUserLdcmParams enableHalogenMitigationsAndUI] == 1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = *(_DWORD *)(a1 + 48);
    IOAccessoryFileRadarHalogen(v2, v3);
  }
  else
  {
    CFOptionFlags v7 = 0xAAAAAAAAAAAAAAAALL;
    if (*(_DWORD *)(a1 + 48)) {
      CFStringRef v4 = @"SNR failure while doing Liquid Detection.\n File a Radar?";
    }
    else {
      CFStringRef v4 = @"Liquid detected in Lightning port.\n File a Radar?";
    }
    SInt32 v5 = CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v4, 0, @"Not Now", @"Yes", 0, &v7);
    [*(id *)(a1 + 40) setIsTapToRadarPending:0];
    if (v5) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v7 == 1;
    }
    if (v6) {
      IOAccessoryFileRadarHalogen(*(void *)(a1 + 32), *(_DWORD *)(a1 + 48));
    }
  }
}

void IOAccessoryFileRadarHalogen(uint64_t a1, int a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  CFStringRef v4 = (void *)[MEMORY[0x1E4F28E78] string];
  SInt32 v5 = (void *)[MEMORY[0x1E4F28F48] pipe];
  BOOL v6 = (void *)[MEMORY[0x1E4F28F48] pipe];
  id v7 = objc_alloc_init(MEMORY[0x1E4F29038]);
  [v7 setLaunchPath:@"/usr/local/bin/aggregatectl"];
  [v7 setArguments:&unk_1F338AD80];
  [v7 setStandardOutput:v5];
  [v7 setStandardError:v6];
  uint64_t v8 = (void *)[v5 fileHandleForReading];
  uint64_t v9 = (void *)[v6 fileHandleForReading];
  [v7 launch];
  do
  {
    uint64_t v10 = (void *)[v8 readDataOfLength:1024];
    objc_msgSend(v4, "appendString:", objc_msgSend([NSString alloc], "initWithData:encoding:", v10, 4));
  }
  while ([v10 length]);
  [v7 waitUntilExit];
  uint64_t v11 = [v9 readDataToEndOfFile];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v32 = "IOAccessoryGenerateAggregatectlLog";
    __int16 v33 = 2112;
    uint64_t v34 = (__CFString *)[[NSString alloc] initWithData:v11 encoding:4];
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s:\n%@", buf, 0x16u);
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createFileAtPath:contents:attributes:", @"/tmp/ioam_aggregatectl.log", objc_msgSend(v4, "dataUsingEncoding:", 4), 0) & 1) == 0&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v32 = "IOAccessoryGenerateAggregatectlLog";
    __int16 v33 = 2112;
    uint64_t v34 = @"/tmp/ioam_aggregatectl.log";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Unable to create file at '%@'", buf, 0x16u);
  }
  if (a2) {
    uint64_t v12 = "SNR Failure\n\n";
  }
  else {
    uint64_t v12 = "LIQUID DETECTION REPORT (detected via Halogen)\n\n";
  }
  uint64_t v13 = (void *)[MEMORY[0x1E4F28E78] stringWithUTF8String:v12];
  [v13 appendString:@"Has your phone or charging cable been near liquid in the past 5 hours? \n\n"];
  [v13 appendString:@"If yes:\n\n"];
  [v13 appendString:@"- Cable or Phone?\n\n"];
  [v13 appendString:@"- What kind of liquid? (e.g. tap water, rain, sweat, soda, beer, etc.)\n\n"];
  [v13 appendString:@"- What kind of exposure? (e.g. submersion, splash, droplet, sitting in puddle, using device with wet/sweaty hands, etc)\n\n"];
  [v13 appendString:@"- If the exposure was limited to a certain part of the device, where was it?\n\n"];
  [v13 appendString:@"- How long was the exposure?\n\n"];
  [v13 appendString:@"- Time since exposure\n"];
  [v13 appendString:@"\n\nIf no:\n\n"];
  [v13 appendString:@"Please describe what happened just before seeing the dialog. For example… Did you just connect an accessory? Did you drop your device? Are you in a humid environment?\n\n\n"];
  [v13 appendString:a1];
  uint64_t v14 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"tap-to-radar://new?ComponentName=LDCM&ComponentVersion=AutofilledBugs&ComponentID=750390&Classification=Other Bug&Reproducibility=Not Applicable&"];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", @"/tmp/halogen_ttr.wav"))objc_msgSend(v14, "appendFormat:", @"Attachments=%@", @"/tmp/halogen_ttr.wav"); {
  [v14 appendString:@","];
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", @"/tmp/ioam_aggregatectl.log"))objc_msgSend(v14, "appendFormat:", @"%@", @"/tmp/ioam_aggregatectl.log"); {
  uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", @"/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/", 0);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        [v14 appendString:@","];
        [v14 appendString:objc_msgSend(@"/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/", "stringByAppendingPathComponent:", v20)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }
  [v14 appendString:@"&"];
  [v14 appendFormat:@"Description=%@", v13];
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F28B88], "URLQueryAllowedCharacterSet")));
  if (_FBSOpenApplicationOptionKeyPromptUnlockDevice_0)
  {
    id v22 = [NSString alloc];
    uint64_t v23 = [v22 initWithBytes:_FBSOpenApplicationOptionKeyPromptUnlockDevice_0 length:8 encoding:1];
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      objc_msgSend(v25, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), v23);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace"), "openSensitiveURL:withOptions:", v21, v25);
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace"), "openURL:", v21);
  }
}

uint64_t _holdPowerAssertion(int a1, void *a2)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  int v4 = [a2 isPowerAssertionHeld];
  if (a1)
  {
    if ((v4 & 1) == 0)
    {
      v11[0] = @"AssertType";
      v11[1] = @"AssertLevel";
      v12[0] = @"NoIdleSleepAssertion";
      v12[1] = &unk_1F338AD50;
      v11[2] = @"AssertName";
      v11[3] = @"AllowsDeviceRestart";
      uint64_t v5 = *MEMORY[0x1E4F1CFD0];
      v12[2] = @"com.apple.ioaccessorymanager.halogen";
      _OWORD v12[3] = v5;
      CFDictionaryRef v6 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
      IOPMAssertionID AssertionID = [a2 sleepAssertionID];
      if (IOPMAssertionCreateWithProperties(v6, &AssertionID))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          _holdPowerAssertion_cold_2();
        }
        return [a2 isPowerAssertionHeld] ^ a1 ^ 1;
      }
      [a2 setSleepAssertionID:AssertionID];
      id v7 = a2;
      uint64_t v8 = 1;
LABEL_14:
      [v7 setIsPowerAssertionHeld:v8];
      return [a2 isPowerAssertionHeld] ^ a1 ^ 1;
    }
    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      _holdPowerAssertion_cold_1(a2);
    }
    return [a2 isPowerAssertionHeld] ^ a1 ^ 1;
  }
  if (!IOPMAssertionRelease([a2 sleepAssertionID]))
  {
    id v7 = a2;
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    _holdPowerAssertion_cold_3();
  }
  return [a2 isPowerAssertionHeld] ^ a1 ^ 1;
}

uint64_t updateAccyHalogenHealthDictionary(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t valuePtr = 0;
  if (!gAccyHealthDictionary
    || objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") > 2)
  {
    return 0;
  }
  CFNumberRef number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  if (gAccyHealthDictionary
    && objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") <= 2)
  {
    uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%012llx_%1d_%012llx", 0, 0, 0);
    uint64_t v3 = [(id)gAccyHealthDictionary objectForKey:v2];
    int v4 = (IOAccessoryLdcmHealthClass *)v3;
    if (!v3)
    {
      int v4 = objc_alloc_init(IOAccessoryLdcmHealthClass);
      uint64_t v5 = v4;
      [(IOAccessoryLdcmHealthClass *)v4 setIsHealthy:0];
      trimAccyHealthDictionary();
    }
    if (objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult")
      && objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") != 1)
    {
      if (objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") == 2) {
        [(IOAccessoryLdcmHealthClass *)v4 setWetCount:[(IOAccessoryLdcmHealthClass *)v4 wetCount] + 1];
      }
    }
    else
    {
      [(IOAccessoryLdcmHealthClass *)v4 setDryCount:[(IOAccessoryLdcmHealthClass *)v4 dryCount] + 1];
    }
    int v6 = [(IOAccessoryLdcmHealthClass *)v4 isHealthy];
    if ([(IOAccessoryLdcmHealthClass *)v4 dryCount]) {
      [(IOAccessoryLdcmHealthClass *)v4 setIsHealthy:1];
    }
    [(id)gAccyHealthDictionary setObject:v4 forKey:v2];
    int v7 = [(IOAccessoryLdcmHealthClass *)v4 isHealthy];
    if (!v3 || v6 != v7)
    {
      commitPersistentAccyHealthDictionary();
      if (![(IOAccessoryLdcmHealthClass *)v4 isHealthy])
      {
        if (a1)
        {
          if (_ADClientAddValueForScalarKey)
          {
            CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @".%012llx.%1d", 0, 0);
            if (v9)
            {
              CFStringRef v10 = v9;
              MutableCopy = CFStringCreateMutableCopy(v8, 0, @"com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount");
              if (MutableCopy)
              {
                uint64_t v12 = MutableCopy;
                CFStringAppend(MutableCopy, v10);
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  long long v26 = v12;
                  _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Incrementing aggd key: %{public}@", buf, 0xCu);
                }
                _ADClientAddValueForScalarKey(v12, 1);
                CFRelease(v12);
                CFRelease(v10);
              }
            }
          }
        }
      }
      dbgShowAccyHealthDictionary();
    }
  }
  [a1 service];
  if (_retrieveDeviceInterfaceSerialNumber()) {
    return 0;
  }
  CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
  CFRelease(number);
  uint64_t v13 = NSString;
  uint64_t v14 = [a1 connectedAccessoryDigitalID];
  uint64_t v15 = [a1 connectedAccessoryOrientation];
  uint64_t v16 = objc_msgSend(v13, "stringWithFormat:", @"%012llx_%1d_%012llx", v14, v15, valuePtr);
  uint64_t v17 = [(id)gAccyHealthDictionary objectForKey:v16];
  uint64_t v18 = (IOAccessoryLdcmHealthClass *)v17;
  if (!v17)
  {
    uint64_t v18 = objc_alloc_init(IOAccessoryLdcmHealthClass);
    uint64_t v19 = v18;
    [(IOAccessoryLdcmHealthClass *)v18 setIsHealthy:0];
    trimAccyHealthDictionary();
  }
  if (objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult")
    && objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") != 1)
  {
    if (objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") == 2) {
      [(IOAccessoryLdcmHealthClass *)v18 setWetCount:[(IOAccessoryLdcmHealthClass *)v18 wetCount] + 1];
    }
  }
  else
  {
    [(IOAccessoryLdcmHealthClass *)v18 setDryCount:[(IOAccessoryLdcmHealthClass *)v18 dryCount] + 1];
  }
  int v20 = [(IOAccessoryLdcmHealthClass *)v18 isHealthy];
  if ([(IOAccessoryLdcmHealthClass *)v18 dryCount]) {
    [(IOAccessoryLdcmHealthClass *)v18 setIsHealthy:1];
  }
  [(id)gAccyHealthDictionary setObject:v18 forKey:v16];
  int v21 = [(IOAccessoryLdcmHealthClass *)v18 isHealthy];
  if (!v17 || v20 != v21)
  {
    commitPersistentAccyHealthDictionary();
    if (![(IOAccessoryLdcmHealthClass *)v18 isHealthy]) {
      IOAccessoryAggDPostScalarPrefixKey(@"com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount", a1);
    }
    dbgShowAccyHealthDictionary();
  }
  return 1;
}

uint64_t reportEisMeasurementStateChange(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  io_connect_t connect = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "reportEisMeasurementStateChange";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s handleEisMeasurement entry\n", buf, 0xCu);
  }
  io_service_t v2 = [a1 service];
  uint64_t result = IOServiceOpen(v2, *MEMORY[0x1E4F14960], 0, &connect);
  if (!result)
  {
    memset(buf, 170, 6);
    objc_msgSend((id)objc_msgSend(a1, "connectedAccessoryPDigitalID"), "getBytes:length:", buf, 6);
    objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult");
    if (!IOAccessoryManagerSetVoltageDetected())
    {
      int v4 = objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult");
      v5.i32[0] = *(_DWORD *)buf;
      if (vmovn_s16((int16x8_t)vmovl_u8(v5)).u32[0] == 61700
        && !buf[4]
        && v4 == 2
        && !buf[5]
        && ([a1 isReceptacleEmpty] & 1) == 0)
      {
        IOAccessoryAggDPostScalarKey(@"com.apple.ioaccessorymanager.voltage.headset", (uint64_t)a1);
      }
    }
    uint64_t result = connect;
    if (connect) {
      return IOServiceClose(connect);
    }
  }
  return result;
}

uint64_t __powerBatteryMatch(void *a1, io_iterator_t iterator)
{
  kern_return_t v7;
  kern_return_t v8;
  io_object_t notification;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  kern_return_t v13;
  uint64_t v14;

  uint64_t v14 = *MEMORY[0x1E4F143B8];
  io_object_t notification = -1431655766;
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_registry_entry_t v5 = result;
    int v6 = MEMORY[0x1E4F14500];
    do
    {
      __powerUpdateBatteryState(v5);
      int v7 = IOServiceAddInterestNotification((IONotificationPortRef)gBatteryStatusNotificationContext, v5, "IOGeneralInterest", (IOServiceInterestCallback)__powerBatteryInterest, a1, &notification);
      if (v7)
      {
        uint64_t v8 = v7;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v11 = "__powerBatteryMatch";
          uint64_t v12 = 1024;
          uint64_t v13 = v8;
          _os_log_error_impl(&dword_1D9622000, v6, OS_LOG_TYPE_ERROR, "%s IOServiceAddInterestNotification failed: %08x", buf, 0x12u);
        }
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_registry_entry_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t ____powerUpdateBatteryState_block_invoke(uint64_t a1)
{
  return performEisMeasurement(*(void **)(a1 + 32));
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void handleLDCMNotification(int a1, void *a2, CFStringRef theString1)
{
  if (CFStringCompare(theString1, @"com.apple.CoreAccessories.LDCMPreferencesNotification", 1uLL) == kCFCompareEqualTo) {
    [a2 _processLDCMDefauts:0];
  }
  if (CFStringCompare(theString1, @"com.apple.CoreAccessories.TestLDCMAnalyticsNotification", 1uLL) == kCFCompareEqualTo)
  {
    io_registry_entry_t v5 = [a2 halogenTypeCDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __handleLDCMNotification_block_invoke;
    block[3] = &unk_1E6B6D5A0;
    void block[4] = a2;
    dispatch_async(v5, block);
  }
  if (CFStringCompare(theString1, @"com.apple.CoreAccessories.LDCMSettingsDidChangeNotification", 1uLL) == kCFCompareEqualTo)
  {
    int v6 = [a2 halogenTypeCDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __handleLDCMNotification_block_invoke_2;
    v11[3] = &unk_1E6B6D5A0;
    void v11[4] = a2;
    dispatch_async(v6, v11);
  }
  if (CFStringCompare(theString1, @"com.apple.CoreAccessories.LDCMMitigationsOverrideNotification", 1uLL) == kCFCompareEqualTo)
  {
    int v7 = [a2 halogenTypeCDispatchQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __handleLDCMNotification_block_invoke_3;
    v10[3] = &unk_1E6B6D5A0;
    v10[4] = a2;
    dispatch_async(v7, v10);
  }
  if (CFStringCompare(theString1, @"com.apple.CoreAccessories.LDCMActiveMeasurementsDidChangeNotification", 1uLL) == kCFCompareEqualTo)
  {
    uint64_t v8 = [a2 halogenTypeCDispatchQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __handleLDCMNotification_block_invoke_4;
    v9[3] = &unk_1E6B6D5A0;
    v9[4] = a2;
    dispatch_async(v8, v9);
  }
}

void handleUserRequestedRadarNotification(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 halogenTypeCUserPromptDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __handleUserRequestedRadarNotification_block_invoke;
  block[3] = &unk_1E6B6D5A0;
  void block[4] = a2;
  dispatch_async(v3, block);
}

void handleWetPromptResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = qword_1EA8C4C38;
  int v4 = [(id)qword_1EA8C4C38 halogenTypeCUserPromptDispatchQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __handleWetPromptResponse_block_invoke;
  v5[3] = &unk_1E6B6D888;
  v5[4] = v3;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void clearNotificationContext()
{
  if (gWetNotificationContext) {
    CFUserNotificationCancel((CFUserNotificationRef)gWetNotificationContext);
  }
  if (qword_1EA8C4C30)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, (CFRunLoopSourceRef)qword_1EA8C4C30, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease((CFTypeRef)qword_1EA8C4C30);
    qword_1EA8C4C30 = 0;
  }
  if (gWetNotificationContext)
  {
    CFRelease((CFTypeRef)gWetNotificationContext);
    gWetNotificationContext = 0;
  }
}

uint64_t __handleLDCMNotification_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processLDCMAnalyticsDefauts];
}

uint64_t __handleLDCMNotification_block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _manageLDCMSettings];
}

uint64_t __handleLDCMNotification_block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processMitigationsOverride];
}

uint64_t __handleLDCMNotification_block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _controlLDCMMeasurements];
}

uint64_t __handleUserRequestedRadarNotification_block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithString:@"Manual HalogenTypeC radar request.\n"];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _fileRadarHalogenTypeC:v2 TTRCategory:1];
}

void __handleWetPromptResponse_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  clearNotificationContext();
  [*(id *)(a1 + 32) setLastUserNotificationTimeNS:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)];
  if (*(void *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) isInternalBuild] && *(void *)(a1 + 40) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136315138;
        io_registry_entry_t v5 = "handleWetPromptResponse_block_invoke";
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s alternate response", (uint8_t *)&v4, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "_fileRadarHalogenTypeC:TTRCategory:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "typeC"), "getVerboseMeasurementOutputString"), "mutableCopy"), 0);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      io_registry_entry_t v5 = "handleWetPromptResponse_block_invoke";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s unexpected response", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      io_registry_entry_t v5 = "handleWetPromptResponse_block_invoke";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s default response", (uint8_t *)&v4, 0xCu);
    }
    uint64_t v2 = [*(id *)(a1 + 32) timerPortStateCheck];
    dispatch_time_t v3 = dispatch_walltime(0, 3600000000000);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

uint64_t compare(double *a1, double *a2)
{
  if (*a1 >= *a2) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = -1;
  }
  if (*a1 > *a2) {
    return 1;
  }
  else {
    return v2;
  }
}

uint64_t recordCallback_0(void *a1, AudioUnitRenderActionFlags *a2, const AudioTimeStamp *a3, UInt32 a4, UInt32 a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  signed int v10 = [a1 inputFrameSizeInBytes] * a5;
  memset(v22, 170, 24);
  int v11 = [a1 pcmInputDataMaxSzInBytes];
  if ((int)(v11 - [a1 pcmInputDataIndexInBytes]) < v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      UInt32 v24 = a5;
      __int16 v25 = 1024;
      int v26 = [a1 pcmInputDataMaxSzInBytes];
      __int16 v27 = 1024;
      int v28 = [a1 pcmInputDataIndexInBytes];
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:recordCallback() insufficient space in pcmInputData buffer to render %d frames.  bufsize = %d idx=%d", buf, 0x14u);
    }
  }
  else if (([a1 isMeasurementDone] & 1) == 0)
  {
    LODWORD(v22[1]) = 1;
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a1, "pcmInputData"), "bytes");
    v22[3] = v12 + (int)[a1 pcmInputDataIndexInBytes];
    HIDWORD(v22[2]) = v10;
    OSStatus v13 = AudioUnitRender((AudioUnit)[a1 audioComponentInst], a2, a3, a4, a5, (AudioBufferList *)&v22[1]);
    if (v13)
    {
      OSStatus v14 = v13;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        UInt32 v24 = v14;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:render failed osstatus=0x%x", buf, 8u);
      }
    }
    objc_msgSend(a1, "setPcmInputDataIndexInBytes:", objc_msgSend(a1, "pcmInputDataIndexInBytes") + v10);
    objc_msgSend(a1, "setPcmInputDataSampleCnt:", objc_msgSend(a1, "pcmInputDataSampleCnt") + a5);
    signed int v15 = [a1 pcmInputDataSampleCnt];
    int v16 = [a1 calibrationSampleOffsetInFrames];
    if (v15 >= (int)([a1 nMeasurementSamples] + v16))
    {
      if (([a1 isCalibrationDone] & 1) == 0)
      {
        [a1 setIsCalibrationDone:1];
        objc_msgSend(a1, "setMeasurementSampleOffsetInFrames:", objc_msgSend(a1, "nHydraSettlingSamples")+ objc_msgSend(a1, "pcmInputDataSampleCnt"));
        [a1 connect];
        [a1 pinToMeasure];
        UInt32 v17 = IOAccessoryManagerSelectEisPin();
        if (v17)
        {
          UInt32 v18 = v17;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            UInt32 v24 = v18;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:IOAccessoryManagerSelectEisPin failed to set the pin ret = 0x%x", buf, 8u);
          }
        }
        else
        {
          [a1 setEisPinToken2:v22[0]];
        }
      }
      signed int v19 = [a1 pcmInputDataSampleCnt];
      int v20 = [a1 measurementSampleOffsetInFrames];
      if (v19 >= (int)([a1 nMeasurementSamples] + v20))
      {
        [a1 setIsMeasurementDone:1];
        objc_msgSend((id)objc_msgSend(a1, "audioTimeoutCond"), "signal");
      }
    }
  }
  return 0;
}

uint64_t playbackCallback_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a1, "pcmOutputData"), "bytes");
  uint64_t v9 = [a1 pcmOutputDataIndexInBytes];
  int v10 = [a1 pcmOutputDataMaxSzInBytes];
  unint64_t v11 = *a6;
  if (v11)
  {
    int v12 = v10;
    unint64_t v13 = 0;
    OSStatus v14 = (void **)(a6 + 4);
    do
    {
      unsigned int v15 = *((_DWORD *)v14 - 1);
      if (v12 - (int)v9 >= v15) {
        size_t v16 = v15;
      }
      else {
        size_t v16 = (v12 - v9);
      }
      if (v16)
      {
        memcpy(*v14, (const void *)(v8 + (int)[a1 pcmOutputDataIndexInBytes]), v16);
        uint64_t v9 = (v16 + v9);
        unint64_t v11 = *a6;
      }
      v14 += 2;
      ++v13;
    }
    while (v13 < v11);
  }
  [a1 setPcmOutputDataIndexInBytes:v9];
  return 0;
}

void systemPowerCallback_0(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  if (a3 > -536870145)
  {
    if (a3 == -536870144)
    {
      dispatch_time_t v10 = dispatch_walltime(0, 100000000);
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __systemPowerCallback_block_invoke_0;
      block[3] = &unk_1E6B6D5A0;
      void block[4] = a1;
      dispatch_after(v10, global_queue, block);
      return;
    }
    if (a3 != -536870112) {
      return;
    }
    objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "lock");
    uint64_t v6 = a1;
    uint64_t v7 = 1;
    goto LABEL_8;
  }
  if (a3 != -536870288)
  {
    if (a3 != -536870272) {
      return;
    }
    IOAllowPowerChange([a1 systemPowerPort], a4);
    objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "lock");
    uint64_t v6 = a1;
    uint64_t v7 = 0;
LABEL_8:
    [v6 setPowerState:v7];
    objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "signal");
    uint64_t v8 = (void *)[a1 powerStateCond];
    [v8 unlock];
    return;
  }
  io_connect_t v9 = [a1 systemPowerPort];
  IOAllowPowerChange(v9, a4);
}

uint64_t __systemPowerCallback_block_invoke_0(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "lock");
  [*(id *)(a1 + 32) setPowerState:2];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "signal");
  unsigned int v2 = (void *)[*(id *)(a1 + 32) powerStateCond];
  return [v2 unlock];
}

BOOL IOAccessoryStartSystemStateMonitor()
{
  if (*(void *)monitor) {
    return 0;
  }
  int v0 = objc_alloc_init(IOAccessorySystemStateMonitor);
  uint64_t v1 = *(void **)monitor;
  *(void *)monitor = v0;

  return *(void *)monitor != 0;
}

void IOAccessoryStopSystemStateMonitor()
{
  int v0 = *(void **)monitor;
  *(void *)monitor = 0;
}

uint64_t ProcessPublishedEndpoints(void *a1, io_iterator_t iterator)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = MEMORY[0x1E4F14500];
    *(void *)&long long v5 = 136315138;
    long long v8 = v5;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v8;
        dispatch_time_t v10 = "ProcessPublishedEndpoints";
        _os_log_impl(&dword_1D9622000, v7, OS_LOG_TYPE_INFO, "%s adding endpoint", buf, 0xCu);
      }
      objc_msgSend(a1, "addEndpointForService:", v6, v8);
      IOObjectRelease(v6);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

uint64_t ProcessTerminatedEndpoints(void *a1, io_iterator_t iterator)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = MEMORY[0x1E4F14500];
    *(void *)&long long v5 = 136315138;
    long long v8 = v5;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v8;
        dispatch_time_t v10 = "ProcessTerminatedEndpoints";
        _os_log_impl(&dword_1D9622000, v7, OS_LOG_TYPE_INFO, "%s removing endpoint", buf, 0xCu);
      }
      objc_msgSend(a1, "removeEndpointForService:", v6, v8);
      IOObjectRelease(v6);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

BOOL IOAccessoryStartLDCM(__CFRunLoop *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  refCon = (IONotificationPort *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"LDCMDiscoveryDisabled"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Starting LDCM Now", buf, 2u);
  }
  if (!ldcmManagerStore)
  {
    uint64_t v4 = objc_opt_new();
    long long v5 = (void *)ldcmManagerStore;
    ldcmManagerStore = v4;
  }
  if (!ldcmMobileAssetDistributor)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)ldcmMobileAssetDistributor;
    ldcmMobileAssetDistributor = v6;
  }
  int started = IOAccessoryStartVoltageEventMonitorLegacy((uint64_t)a1);
  BOOL v9 = started != 0;
  io_iterator_t notification = -1431655766;
  dispatch_time_t v10 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = v3;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - LDCM Discovery disabled? default setting: %d", buf, 8u);
  }
  if ((v3 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM Discovery is enabled.", buf, 2u);
    }
    refCon = v10;
    unint64_t v17 = (unint64_t)a1;
    CFDictionaryRef v11 = IOServiceMatching("IOPortFeatureLDCM");
    if (IOServiceAddMatchingNotification(v10, "IOServiceFirstPublish", v11, (IOServiceMatchingCallback)IOPortLDCMServiceMatchingCallback, &refCon, &notification))
    {
      BOOL v12 = started == 0;
    }
    else
    {
      BOOL v12 = 0;
    }
    BOOL v9 = !v12;
    IOPortLDCMServiceMatchingCallback((uint64_t *)&refCon, notification);
  }
  RunLoopSource = IONotificationPortGetRunLoopSource(v10);
  if (RunLoopSource) {
    CFRunLoopAddSource(a1, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

void IOPortLDCMServiceMatchingCallback(uint64_t *a1, io_iterator_t iterator)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = IOIteratorNext(iterator);
  if (v5)
  {
    uint64_t v6 = 0;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    while (1)
    {
      CFNumberRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, @"ArchitectureVersion", v7, 0);
      BOOL v9 = CFProperty;
      if (!CFProperty) {
        break;
      }
      if ([CFProperty intValue] == 4)
      {
        dispatch_time_t v10 = [[IOPortLDCMManagerV4 alloc] initWithParams:64000000000 withDryPollingInterval:32000000000 withService:v5 withNotificationPort:v3 withServerRunloop:v4];

        if (!v10)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            IOPortLDCMServiceMatchingCallback_cold_2();
          }
          uint64_t v6 = 0;
          goto LABEL_21;
        }
        CFDictionaryRef v11 = [NSNumber numberWithInt:v5];
        [(id)ldcmManagerStore setObject:v10 forKey:v11];
        if (!ldcmMobileAssetManager)
        {
          uint64_t v12 = objc_opt_new();
          unint64_t v13 = (void *)ldcmMobileAssetManager;
          ldcmMobileAssetManager = v12;

          [(id)ldcmMobileAssetManager setDelegate:ldcmMobileAssetDistributor];
        }

        uint64_t v6 = v10;
      }
      IOObjectRelease(v5);

      uint64_t v5 = IOIteratorNext(iterator);
      if (!v5) {
        goto LABEL_10;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      IOPortLDCMServiceMatchingCallback_cold_1();
    }
LABEL_21:

LABEL_10:
  }
  if (iterator) {
    IOObjectRelease(iterator);
  }
  if (v5) {
    IOObjectRelease(v5);
  }
}

double __divdc3(double a1, double a2, double a3, double a4)
{
  double v4 = fmax(fabs(a3), fabs(a4));
  uint64_t v5 = (*(void *)&v4 >> 52) & 0x7FFLL;
  int v6 = __clz(*(void *)&v4 & 0x7FFFFFFFFFFFFFFFLL);
  double v7 = (double)(int)(((*(void *)&v4 << (v6 - 11) >> 52) & 0x7FF) - v6 - 1012);
  if (v5) {
    double v7 = (double)((int)v5 - 1023);
  }
  if (v4 == 0.0) {
    double v7 = -INFINITY;
  }
  if (*(uint64_t *)&v4 <= -1) {
    double v4 = -v4;
  }
  if (v5 == 2047) {
    double v8 = v4;
  }
  else {
    double v8 = v7;
  }
  if ((*(void *)&v8 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
  {
    int v9 = 0;
    goto LABEL_22;
  }
  int v9 = (int)v8;
  int v10 = -(int)v8;
  if (a3 == 0.0 || (uint64_t v11 = (*(void *)&a3 >> 52) & 0x7FFLL, v11 == 2047))
  {
LABEL_36:
    if (a4 == 0.0) {
      goto LABEL_22;
    }
    goto LABEL_37;
  }
  unint64_t v12 = *(void *)&a3 & 0xFFFFFFFFFFFFFLL;
  if (!v11)
  {
    int v13 = __clz(v12);
    unint64_t v14 = v12 << (v13 - 11);
    LODWORD(v11) = 12 - v13;
    unint64_t v12 = v14 & 0xFFEFFFFFFFFFFFFFLL;
  }
  BOOL v15 = __OFADD__(v11, v10);
  LODWORD(v11) = v11 - (int)v8;
  if (v15) {
    uint64_t v11 = ((int)v11 >> 31) ^ 0x80000000;
  }
  else {
    uint64_t v11 = v11;
  }
  unint64_t v16 = *(void *)&a3 & 0x8000000000000000;
  if ((int)v11 < 2047)
  {
    if ((int)v11 <= 0)
    {
      uint64_t v37 = v12 | v16 | 0x10000000000000;
      if ((int)v11 <= -1021) {
        int v38 = -1021;
      }
      else {
        int v38 = v11;
      }
      a3 = *(double *)&v37 * COERCE_DOUBLE((unint64_t)(v38 + 1022) << 52);
      if (a4 == 0.0) {
        goto LABEL_22;
      }
      goto LABEL_37;
    }
    *(void *)&a3 = v16 | (v11 << 52) | v12;
    goto LABEL_36;
  }
  a3 = COERCE_DOUBLE(v16 | 0x7FE0000000000000) + COERCE_DOUBLE(v16 | 0x7FE0000000000000);
  if (a4 == 0.0) {
    goto LABEL_22;
  }
LABEL_37:
  uint64_t v28 = (*(void *)&a4 >> 52) & 0x7FFLL;
  if (v28 != 2047)
  {
    unint64_t v29 = *(void *)&a4 & 0xFFFFFFFFFFFFFLL;
    if (!v28)
    {
      int v30 = __clz(v29);
      unint64_t v31 = v29 << (v30 - 11);
      LODWORD(v28) = 12 - v30;
      unint64_t v29 = v31 & 0xFFEFFFFFFFFFFFFFLL;
    }
    BOOL v15 = __OFADD__(v28, v10);
    LODWORD(v32) = v28 - (int)v8;
    if (v15) {
      uint64_t v32 = ((int)v32 >> 31) ^ 0x80000000;
    }
    else {
      uint64_t v32 = v32;
    }
    unint64_t v33 = *(void *)&a4 & 0x8000000000000000;
    if ((int)v32 < 2047)
    {
      if ((int)v32 <= 0)
      {
        if ((int)v32 <= -1021) {
          LODWORD(v32) = -1021;
        }
        a4 = COERCE_DOUBLE(v29 | v33 | 0x10000000000000)
           * COERCE_DOUBLE((unint64_t)(v32 + 1022) << 52);
      }
      else
      {
        *(void *)&a4 = v33 | (v32 << 52) | v29;
      }
    }
    else
    {
      a4 = COERCE_DOUBLE(v33 | 0x7FE0000000000000) + COERCE_DOUBLE(v33 | 0x7FE0000000000000);
    }
  }
LABEL_22:
  double v17 = a4 * a4 + a3 * a3;
  double v18 = (a4 * a2 + a1 * a3) / v17;
  int v19 = -v9;
  if (v18 != 0.0)
  {
    double v20 = (a4 * a2 + a1 * a3) / v17;
    uint64_t v21 = (*(void *)&v18 >> 52) & 0x7FFLL;
    if (v21 != 2047)
    {
      uint64_t v22 = *(void *)&v20 & 0xFFFFFFFFFFFFFLL;
      int v23 = __clz(*(void *)&v20 & 0xFFFFFFFFFFFFFLL);
      uint64_t v24 = (*(void *)&v20 & 0xFFFFFFFFFFFFFLL) << (v23 - 11);
      int v25 = 12 - v23;
      unint64_t v26 = v24 & 0xFFEFFFFFFFFFFFFFLL;
      if (!v21)
      {
        uint64_t v22 = v26;
        LODWORD(v21) = v25;
      }
      BOOL v15 = __OFADD__(v21, v19);
      LODWORD(v21) = v21 + v19;
      if (v15) {
        uint64_t v21 = ((int)v21 >> 31) ^ 0x80000000;
      }
      else {
        uint64_t v21 = v21;
      }
      unint64_t v27 = *(void *)&v18 & 0x8000000000000000;
      if ((int)v21 < 2047)
      {
        if ((int)v21 <= 0)
        {
          uint64_t v34 = v22 | v27 | 0x10000000000000;
          if ((int)v21 <= -1021) {
            int v35 = -1021;
          }
          else {
            int v35 = v21;
          }
          return *(double *)&v34 * COERCE_DOUBLE((unint64_t)(v35 + 1022) << 52);
        }
        else
        {
          *(void *)&double v18 = v27 | (v21 << 52) | v22;
        }
      }
      else
      {
        return COERCE_DOUBLE(v27 | 0x7FE0000000000000) + COERCE_DOUBLE(v27 | 0x7FE0000000000000);
      }
    }
  }
  return v18;
}

float __divsc3(float a1, float a2, float a3, float a4)
{
  float v4 = fmaxf(fabsf(a3), fabsf(a4));
  int v5 = (LODWORD(v4) >> 23);
  unsigned int v6 = __clz(LODWORD(v4) & 0x7FFFFFFF);
  float v7 = (float)(int)((LODWORD(v4) << (v6 - 8) >> 23) - v6 - 119);
  if ((LODWORD(v4) >> 23)) {
    float v7 = (float)(v5 - 127);
  }
  if (v4 == 0.0) {
    float v7 = -INFINITY;
  }
  if (SLODWORD(v4) <= -1) {
    float v4 = -v4;
  }
  if (v5 == 255) {
    float v8 = v4;
  }
  else {
    float v8 = v7;
  }
  if ((LODWORD(v8) & 0x7FFFFFFFu) > 0x7F7FFFFF)
  {
    int v9 = 0;
    goto LABEL_21;
  }
  int v9 = (int)v8;
  int v10 = -(int)v8;
  if (a3 == 0.0 || (unsigned int v11 = (LODWORD(a3) >> 23), v11 == 255))
  {
LABEL_34:
    if (a4 == 0.0) {
      goto LABEL_21;
    }
    goto LABEL_35;
  }
  unsigned int v12 = LODWORD(a3) & 0x7FFFFF;
  if (!(LODWORD(a3) >> 23))
  {
    unsigned int v13 = __clz(v12);
    unsigned int v14 = v12 << (v13 - 8);
    unsigned int v11 = 9 - v13;
    unsigned int v12 = v14 & 0xFF7FFFFF;
  }
  BOOL v15 = __OFADD__(v11, v10);
  signed int v16 = v11 - (int)v8;
  if (v15) {
    signed int v16 = (v16 >> 31) ^ 0x80000000;
  }
  unsigned int v17 = LODWORD(a3) & 0x80000000;
  if (v16 < 255)
  {
    if (v16 <= 0)
    {
      int v39 = v12 | v17 | 0x800000;
      if (v16 <= -125) {
        int v40 = -125;
      }
      else {
        int v40 = v16;
      }
      a3 = *(float *)&v39 * COERCE_FLOAT((v40 << 23) + 1056964608);
      if (a4 == 0.0) {
        goto LABEL_21;
      }
      goto LABEL_35;
    }
    LODWORD(a3) = v17 | (v16 << 23) | v12;
    goto LABEL_34;
  }
  a3 = COERCE_FLOAT(v17 | 0x7F000000) + COERCE_FLOAT(v17 | 0x7F000000);
  if (a4 == 0.0) {
    goto LABEL_21;
  }
LABEL_35:
  unsigned int v30 = (LODWORD(a4) >> 23);
  if (v30 != 255)
  {
    unsigned int v31 = LODWORD(a4) & 0x7FFFFF;
    if (!(LODWORD(a4) >> 23))
    {
      unsigned int v32 = __clz(v31);
      unsigned int v33 = v31 << (v32 - 8);
      unsigned int v30 = 9 - v32;
      unsigned int v31 = v33 & 0xFF7FFFFF;
    }
    BOOL v15 = __OFADD__(v30, v10);
    signed int v34 = v30 - (int)v8;
    if (v15) {
      signed int v34 = (v34 >> 31) ^ 0x80000000;
    }
    unsigned int v35 = LODWORD(a4) & 0x80000000;
    if (v34 < 255)
    {
      if (v34 <= 0)
      {
        if (v34 <= -125) {
          signed int v34 = -125;
        }
        a4 = COERCE_FLOAT(v31 | v35 | 0x800000) * COERCE_FLOAT((v34 << 23) + 1056964608);
      }
      else
      {
        LODWORD(a4) = v35 | (v34 << 23) | v31;
      }
    }
    else
    {
      a4 = COERCE_FLOAT(v35 | 0x7F000000) + COERCE_FLOAT(v35 | 0x7F000000);
    }
  }
LABEL_21:
  float v18 = (float)(a4 * a4) + (float)(a3 * a3);
  *(float *)&unsigned int v19 = (float)((float)(a4 * a2) + (float)(a1 * a3)) / v18;
  int v20 = -v9;
  if (*(float *)&v19 != 0.0)
  {
    float v21 = (float)((float)(a4 * a2) + (float)(a1 * a3)) / v18;
    unsigned int v22 = (v19 >> 23);
    if (v22 != 255)
    {
      int v23 = LODWORD(v21) & 0x7FFFFF;
      unsigned int v24 = __clz(LODWORD(v21) & 0x7FFFFF);
      int v25 = (LODWORD(v21) & 0x7FFFFF) << (v24 - 8);
      unsigned int v26 = 9 - v24;
      unsigned int v27 = v25 & 0xFF7FFFFF;
      if (!(v19 >> 23))
      {
        int v23 = v27;
        unsigned int v22 = v26;
      }
      BOOL v15 = __OFADD__(v22, v20);
      signed int v28 = v22 + v20;
      if (v15) {
        signed int v28 = (v28 >> 31) ^ 0x80000000;
      }
      unsigned int v29 = v19 & 0x80000000;
      if (v28 < 255)
      {
        if (v28 <= 0)
        {
          int v36 = v23 | v29 | 0x800000;
          if (v28 <= -125) {
            int v37 = -125;
          }
          else {
            int v37 = v28;
          }
          *(float *)&unsigned int v19 = *(float *)&v36 * COERCE_FLOAT((v37 << 23) + 1056964608);
        }
        else
        {
          unsigned int v19 = v29 | (v28 << 23) | v23;
        }
      }
      else
      {
        *(float *)&unsigned int v19 = COERCE_FLOAT(v29 | 0x7F000000) + COERCE_FLOAT(v29 | 0x7F000000);
      }
    }
  }
  return *(float *)&v19;
}

void IOAccessoryStartVoltageEventMonitorLegacy_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D9622000, MEMORY[0x1E4F14500], v0, "%s IOServiceAddMatchingNotification falied: %08x", v1, v2, v3, v4, 2u);
}

void _holdPowerAssertion_cold_1(void *a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  [a1 isPowerAssertionHeld];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s halogen power assertion already in the correct state: %d.\n", (uint8_t *)v1, 0x12u);
}

void _holdPowerAssertion_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D9622000, MEMORY[0x1E4F14500], v0, "%s failed to acquire power assertion. Error 0x%x\n", v1, v2, v3, v4, 2u);
}

void _holdPowerAssertion_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D9622000, MEMORY[0x1E4F14500], v0, "%s failed to release power assertion. Error 0x%x\n", v1, v2, v3, v4, 2u);
}

void IOPortLDCMServiceMatchingCallback_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "LDCM - Failed to read LDCM architecture version!!!", v0, 2u);
}

void IOPortLDCMServiceMatchingCallback_cold_2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "LDCM - Failed to instantiate IOPortLDCMManagerV4!!!", v0, 2u);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x1F410B478](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x1F410B498](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x1F410B4A8](inComponent, outInstance);
}

OSStatus AudioOutputUnitStart(AudioUnit ci)
{
  return MEMORY[0x1F410B5C0](ci);
}

OSStatus AudioOutputUnitStop(AudioUnit ci)
{
  return MEMORY[0x1F410B5C8](ci);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x1F410B648](inUnit);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1F410B670](inUnit, ioActionFlags, inTimeStamp, *(void *)&inOutputBusNumber, *(void *)&inNumberFrames, ioData);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1F410B690](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

OSStatus AudioUnitUninitialize(AudioUnit inUnit)
{
  return MEMORY[0x1F410B698](inUnit);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1F40D7690](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x1F40D7698](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D86F8]();
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A48](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1F410B6C0](inURL, *(void *)&inFileType, inStreamDesc, inChannelLayout, *(void *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x1F410B6C8](inExtAudioFile);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x1F410B710](inExtAudioFile, *(void *)&inNumberFrames, ioData);
}

uint64_t IOAccessoryManagerConfigureGoldbondMode()
{
  return MEMORY[0x1F417A698]();
}

uint64_t IOAccessoryManagerCopyDeviceInfo()
{
  return MEMORY[0x1F417A6A8]();
}

uint64_t IOAccessoryManagerGetAccessoryID()
{
  return MEMORY[0x1F417A6B0]();
}

uint64_t IOAccessoryManagerGetDigitalID()
{
  return MEMORY[0x1F417A6B8]();
}

uint64_t IOAccessoryManagerGetFreePinMask()
{
  return MEMORY[0x1F417A6C0]();
}

uint64_t IOAccessoryManagerGetLdcmParams()
{
  return MEMORY[0x1F417A6C8]();
}

uint64_t IOAccessoryManagerGetPrimaryPort()
{
  return MEMORY[0x1F417A6D0]();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return MEMORY[0x1F417A6D8]();
}

uint64_t IOAccessoryManagerGetServiceWithSupportedFeature()
{
  return MEMORY[0x1F417A6E0]();
}

uint64_t IOAccessoryManagerGetType()
{
  return MEMORY[0x1F417A6E8]();
}

uint64_t IOAccessoryManagerLDCMEnableMitigations()
{
  return MEMORY[0x1F417A6F0]();
}

uint64_t IOAccessoryManagerLDCMGetMeasurementStatus()
{
  return MEMORY[0x1F417A6F8]();
}

uint64_t IOAccessoryManagerLDCMSetLiquidDetected()
{
  return MEMORY[0x1F417A700]();
}

uint64_t IOAccessoryManagerRequestLdcmMeasurement()
{
  return MEMORY[0x1F417A708]();
}

uint64_t IOAccessoryManagerSelectEisPin()
{
  return MEMORY[0x1F417A710]();
}

uint64_t IOAccessoryManagerSetLDCM()
{
  return MEMORY[0x1F417A718]();
}

uint64_t IOAccessoryManagerSetVoltageDetected()
{
  return MEMORY[0x1F417A720]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86D8](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40E8F20](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1F40E8F38](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1F40E8F68](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F88](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

uint64_t IOPMScheduleUserActivityLevelNotificationWithTimeout()
{
  return MEMORY[0x1F40E9078]();
}

uint64_t IOPMUnregisterNotification()
{
  return MEMORY[0x1F40E90B0]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1F40E9158](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1F40E91C8](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1F40E91F8](*(void *)&entry, entryID);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1F40E9220](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1F40E9238](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

double cabs(__complex_double a1)
{
  MEMORY[0x1F40CA5A0]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  return result;
}

double carg(__complex_double a1)
{
  MEMORY[0x1F40CA668]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  return result;
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

FFTSetupD vDSP_create_fftsetupD(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetupD)MEMORY[0x1F40D19F8](__Log2n, *(void *)&__Radix);
}

void vDSP_destroy_fftsetupD(FFTSetupD __setup)
{
}

void vDSP_fft_zripD(FFTSetupD __Setup, const DSPDoubleSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
}