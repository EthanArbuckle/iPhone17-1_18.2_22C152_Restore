@interface DADeviceAccessAnalytics
+ (void)markSessionActivationForPid:(id)a3 atTime:(id)a4;
+ (void)markSessionInvalidationForPid:(id)a3 atTime:(id)a4;
+ (void)markState:(int64_t)a3 deviceID:(id)a4 shared:(BOOL)a5 discovery:(id)a6 flags:(unint64_t)a7 sourceApp:(int64_t)a8 atTime:(id)a9 errorCode:(unint64_t)a10;
+ (void)sendAnalytics:(id)a3 forEvent:(id)a4;
+ (void)sendAnalyticsInfo:(id)a3 forEvent:(id)a4 withDeviceIdentifier:(id)a5;
@end

@implementation DADeviceAccessAnalytics

+ (void)sendAnalyticsInfo:(id)a3 forEvent:(id)a4 withDeviceIdentifier:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v11 && v7 && v8)
  {
    if (sendAnalyticsInfo_forEvent_withDeviceIdentifier__once != -1) {
      dispatch_once(&sendAnalyticsInfo_forEvent_withDeviceIdentifier__once, &__block_literal_global_0);
    }
    v9 = [NSString stringWithFormat:@"%@%@", v7, v8];
    v10 = [(id)sentIdentifier objectForKeyedSubscript:v9];

    if (!v10)
    {
      +[DADeviceAccessAnalytics sendAnalytics:v11 forEvent:v7];
      [(id)sentIdentifier setObject:&unk_26D125D10 forKeyedSubscript:v9];
    }
  }
}

uint64_t __75__DADeviceAccessAnalytics_sendAnalyticsInfo_forEvent_withDeviceIdentifier___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = sentIdentifier;
  sentIdentifier = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (void)sendAnalytics:(id)a3 forEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v9 = v5;
    AnalyticsSendEventLazy();
  }
  else if (gLogCategory_DeviceAccessAnalytics <= 115 {
         && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
  }
  {
    id v8 = [NSNumber numberWithInt:v5 == 0];
    LogPrintF();
  }
}

id __50__DADeviceAccessAnalytics_sendAnalytics_forEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)markSessionActivationForPid:(id)a3 atTime:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8 && v5)
  {
    if (markSessionActivationForPid_atTime__once != -1) {
      dispatch_once(&markSessionActivationForPid_atTime__once, &__block_literal_global_133);
    }
    [(id)sessionStartTime setObject:v5 forKeyedSubscript:v8];
  }
  else if (gLogCategory_DeviceAccessAnalytics <= 115 {
         && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
  }
  {
    id v6 = [NSNumber numberWithInt:v8 == 0];
    id v7 = [NSNumber numberWithInt:v5 == 0];
    LogPrintF();
  }
}

uint64_t __62__DADeviceAccessAnalytics_markSessionActivationForPid_atTime___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = sessionStartTime;
  sessionStartTime = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (void)markSessionInvalidationForPid:(id)a3 atTime:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && ([(id)sessionStartTime objectForKeyedSubscript:v5],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [(id)sessionStartTime objectForKeyedSubscript:v5];
    [v8 doubleValue];
    double v10 = v9;

    [v6 doubleValue];
    v12 = [NSNumber numberWithDouble:v11 - v10];
    [(id)sessionStartTime removeObjectForKey:v5];
    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = v12;
    id v13 = v12;
    id v14 = v17;
    AnalyticsSendEventLazy();
  }
  else if (gLogCategory_DeviceAccessAnalytics <= 115 {
         && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
  }
  {
    v15 = [NSNumber numberWithInt:v5 == 0];
    v16 = [NSNumber numberWithInt:v6 == 0];
    LogPrintF();
  }
}

id __64__DADeviceAccessAnalytics_markSessionInvalidationForPid_atTime___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"Identifier";
  v4[1] = @"ElapsedTime";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

+ (void)markState:(int64_t)a3 deviceID:(id)a4 shared:(BOOL)a5 discovery:(id)a6 flags:(unint64_t)a7 sourceApp:(int64_t)a8 atTime:(id)a9 errorCode:(unint64_t)a10
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a6;
  id v15 = a9;
  if (markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode__once != -1) {
    dispatch_once(&markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode__once, &__block_literal_global_147);
  }
  v16 = [(id)daDeviceState objectForKeyedSubscript:v13];
  v17 = [[DADeviceStateRecord alloc] initWithState:a3 andTime:v15];
  char v18 = [v14 flags];
  if (a3 == 5 && (v18 & 4) != 0)
  {
    v19 = NSNumber;
    double Current = CFAbsoluteTimeGetCurrent();
    [v14 activateTimeInterval];
    v22 = objc_msgSend(v19, "numberWithDouble:", vabdd_f64(Current, v21));
    [(DADeviceStateRecord *)v17 setDiscoveryTime:v22];
  }
  if (v16)
  {
    if (([v16 isEqual:v17] & 1) == 0)
    {
      v23 = [v16 timeIntervelBetweenState:v17];
      v24 = [v16 stateTransitionAsString:v17];
      if (gLogCategory_DeviceAccessAnalytics <= 40
        && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
      {
        id v86 = v13;
        v87 = v23;
        v85 = v24;
        LogPrintF();
      }
      uint64_t v116 = MEMORY[0x263EF8330];
      uint64_t v117 = 3221225472;
      v118 = __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_2;
      v119 = &unk_2645208C0;
      id v108 = v24;
      id v120 = v108;
      id v121 = v13;
      unint64_t v125 = a7;
      id v105 = v16;
      id v122 = v105;
      v123 = v17;
      id v25 = v23;
      id v124 = v25;
      AnalyticsSendEventLazy();
      [(id)daDeviceState setObject:v123 forKeyedSubscript:v121];
      if (v14
        && (unint64_t)[v14 flags] >= 2
        && (unint64_t)[v14 flags] >= 2
        && (unint64_t)a3 <= 0x1E
        && ((1 << a3) & 0x42100000) != 0)
      {
        v100 = v25;
        v26 = [v14 configuration];
        v27 = [v26 bundleID];
        v28 = v27;
        if (v27)
        {
          id v29 = v27;
        }
        else
        {
          id v29 = [v14 bundleID];
        }
        v93 = v29;

        v30 = [v14 configuration];
        if (v30)
        {
          v92 = &unk_26D125D10;
        }
        else
        {
          v31 = NSNumber;
          v32 = [v14 configurations];
          v92 = objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v32, "count"));
        }
        v33 = [v14 configuration];
        v34 = [v14 configurations];
        v96 = v17;
        id v97 = v15;
        v94 = v34;
        v95 = v33;
        if (v33)
        {
          v35 = [v33 bluetoothCompanyIdentifiers];
          [v35 count];

          v36 = [v33 bluetoothCompanyPayload];
          [v36 length];

          v37 = [v33 bluetoothNameSubstring];
          [v37 length];

          v38 = [v33 bluetoothServices];
          [v38 count];

          v39 = [v33 bluetoothServicePayload];
          [v39 length];

          [v33 bluetoothIdentifier];
          v40 = [v33 hotspotSSIDs];
          [v40 count];

          v41 = [v33 hotspotSSIDPrefixes];
          [v41 count];

          [v33 networkHotspotSSID];
        }
        else if (v34)
        {
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          id obj = v34;
          uint64_t v103 = [obj countByEnumeratingWithState:&v112 objects:v126 count:16];
          if (v103)
          {
            uint64_t v101 = *(void *)v113;
            id v89 = v13;
            while (2)
            {
              for (uint64_t i = 0; i != v103; ++i)
              {
                if (*(void *)v113 != v101) {
                  objc_enumerationMutation(obj);
                }
                v43 = *(void **)(*((void *)&v112 + 1) + 8 * i);
                v44 = objc_msgSend(v43, "bluetoothCompanyIdentifiers", v85, v86, v87);
                uint64_t v45 = [v44 count];

                v46 = [v43 bluetoothCompanyPayload];
                uint64_t v47 = [v46 length];

                v48 = [v43 bluetoothNameSubstring];
                uint64_t v49 = [v48 length];

                v50 = [v43 bluetoothServices];
                uint64_t v51 = [v50 count];

                v52 = [v43 bluetoothServicePayload];
                uint64_t v53 = [v52 length];

                uint64_t v54 = [v43 bluetoothIdentifier];
                LOBYTE(v45) = (v54 | v45 | v47 | v49 | v51 | v53) != 0;

                v55 = [v43 hotspotSSIDs];
                uint64_t v56 = [v55 count];

                v57 = [v43 hotspotSSIDPrefixes];
                uint64_t v58 = [v57 count];

                uint64_t v59 = [v43 networkHotspotSSID];
                BOOL v60 = (v59 | v56 | v58) != 0;

                if ((v45 & 1) != 0 || v60)
                {

                  id v13 = v89;
                  goto LABEL_39;
                }
              }
              id v13 = v89;
              uint64_t v103 = [obj countByEnumeratingWithState:&v112 objects:v126 count:16];
              if (v103) {
                continue;
              }
              break;
            }
          }
        }
LABEL_39:
        v61 = objc_msgSend(v14, "configuration", v85, v86, v87);
        v62 = NSNumber;
        if (v61)
        {
          v63 = [v14 configuration];
          v104 = objc_msgSend(v62, "numberWithUnsignedInteger:", objc_msgSend(v63, "flags") & 4);
        }
        else
        {
          v63 = [v14 configurations];
          v64 = [v63 cuFilteredArrayUsingBlock:&__block_literal_global_171];
          v104 = objc_msgSend(v62, "numberWithInt:", objc_msgSend(v64, "count") != 0);
        }
        v65 = [v14 configuration];
        v66 = NSNumber;
        if (v65)
        {
          v67 = [v14 configuration];
          v102 = objc_msgSend(v66, "numberWithUnsignedInteger:", objc_msgSend(v67, "flags") & 2);
        }
        else
        {
          v67 = [v14 configurations];
          v68 = [v67 cuFilteredArrayUsingBlock:&__block_literal_global_174];
          v102 = objc_msgSend(v66, "numberWithInt:", objc_msgSend(v68, "count") != 0);
        }
        v69 = [v14 configuration];
        v70 = NSNumber;
        if (v69)
        {
          v71 = [v14 configuration];
          objc_msgSend(v70, "numberWithBool:", objc_msgSend(v71, "allowsRename"));
          id obja = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v71 = [v14 configurations];
          v72 = [v71 cuFilteredArrayUsingBlock:&__block_literal_global_176];
          objc_msgSend(v70, "numberWithInt:", objc_msgSend(v72, "count") != 0);
          id obja = (id)objc_claimAutoreleasedReturnValue();
        }
        v73 = [v14 configuration];
        v74 = NSNumber;
        if (v73)
        {
          v75 = [v14 configuration];
          v91 = objc_msgSend(v74, "numberWithUnsignedInteger:", objc_msgSend(v75, "flags") & 8);
        }
        else
        {
          v75 = [v14 configurations];
          v76 = [v75 cuFilteredArrayUsingBlock:&__block_literal_global_178];
          v91 = objc_msgSend(v74, "numberWithInt:", objc_msgSend(v76, "count") != 0);
        }
        if (([v14 flags] & 8) != 0)
        {
          v77 = [v14 configuration];
          if (v77)
          {
            v90 = &unk_26D125D10;
          }
          else
          {
            v78 = NSNumber;
            v79 = [v14 configurations];
            v90 = objc_msgSend(v78, "numberWithUnsignedInteger:", objc_msgSend(v79, "count"));
          }
        }
        else
        {
          v90 = &unk_26D125D28;
        }
        if (gLogCategory_DeviceAccessAnalytics <= 40
          && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
        {
          v88 = [NSNumber numberWithUnsignedInteger:a10];
          LogPrintF();
        }
        id v109 = v100;
        id v110 = v105;
        id v111 = v14;
        id v107 = v90;
        id v106 = v102;
        id v80 = v91;
        id v81 = obja;
        id v82 = v92;
        id v83 = v93;
        id v84 = v104;
        AnalyticsSendEventLazy();

        id v25 = v100;
        v17 = v96;
        id v15 = v97;
      }
    }
  }
  else
  {
    [(id)daDeviceState setObject:v17 forKeyedSubscript:v13];
  }
}

uint64_t __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = daDeviceState;
  daDeviceState = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_2(uint64_t a1)
{
  v13[6] = *MEMORY[0x263EF8340];
  if (gLogCategory_DeviceAccessAnalytics <= 40
    && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    LogPrintF();
  }
  if ((*(void *)(a1 + 72) & 8) != 0) {
    v2 = &unk_26D125D40;
  }
  else {
    v2 = &unk_26D125D10;
  }
  v13[0] = v2;
  v12[0] = @"DeviceFlags";
  v12[1] = @"sourceApplication";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "state", v10, v11));
  uint64_t v4 = *(void *)(a1 + 32);
  v13[1] = v3;
  v13[2] = v4;
  v12[2] = @"State";
  v12[3] = @"StateFrom";
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "state"));
  v13[3] = v5;
  v12[4] = @"StateTo";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
  v12[5] = @"ElapsedTime";
  uint64_t v7 = *(void *)(a1 + 64);
  v13[4] = v6;
  v13[5] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];

  return v8;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_168(uint64_t a1, void *a2)
{
  unint64_t v2 = a2;
  id v3 = (id)(v2 & ([(id)v2 flags] << 61 >> 63));

  return v3;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_2_172(uint64_t a1, void *a2)
{
  unint64_t v2 = a2;
  id v3 = (id)(v2 & ([(id)v2 flags] << 62 >> 63));

  return v3;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 allowsRename]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_4(uint64_t a1, void *a2)
{
  unint64_t v2 = a2;
  id v3 = (id)(v2 & ([(id)v2 flags] << 60 >> 63));

  return v3;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_5(uint64_t a1)
{
  v31[20] = *MEMORY[0x263EF8340];
  v30[0] = @"AccessoryDiscoveryErrorOccurred";
  id v29 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 112)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v31[0] = v29;
  v31[1] = v2;
  v30[1] = @"AccessoryReadyToUseInSeconds";
  v30[2] = @"BluetoothTransportBridging";
  id v4 = *(__CFString **)(a1 + 48);
  if (!v4) {
    id v4 = @"-";
  }
  v31[2] = v3;
  v31[3] = v4;
  v30[3] = @"BundleID";
  v30[4] = @"DiscoveryTechnology";
  v28 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 120)];
  v31[4] = v28;
  v30[5] = @"DiscoveryTimeInSeconds";
  uint64_t v5 = [*(id *)(a1 + 56) discoveryTime];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  else {
    uint64_t v7 = &unk_26D125D28;
  }
  id v8 = *(void **)(a1 + 64);
  if (!v8) {
    id v8 = &unk_26D125D28;
  }
  v31[5] = v7;
  v31[6] = v8;
  v30[6] = @"DisplayItemsCount";
  v30[7] = @"HasBluetoothCompanyIDs";
  v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 128)];
  v31[7] = v27;
  v30[8] = @"HasBlobMaskMfgData";
  double v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 129)];
  v31[8] = v9;
  v30[9] = @"HasBluetoothNames";
  uint64_t v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 130)];
  v31[9] = v10;
  v30[10] = @"HasBluetoothServices";
  uint64_t v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 131)];
  v31[10] = v11;
  v30[11] = @"HasBlobMaskServiceData";
  uint64_t v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 132)];
  id v13 = (void *)v12;
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v15 = *(void *)(a1 + 80);
  if (!v14) {
    uint64_t v14 = MEMORY[0x263EFFA80];
  }
  v31[11] = v12;
  v31[12] = v14;
  v30[12] = @"HasRenameOption";
  v30[13] = @"HasRenameSSID";
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = MEMORY[0x263EFFA80];
  }
  v31[13] = v16;
  v30[14] = @"HasSSIDs";
  v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 133)];
  v31[14] = v17;
  v30[15] = @"HasSSIDPrefixes";
  char v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 134)];
  uint64_t v20 = *(void *)(a1 + 88);
  v19 = *(void **)(a1 + 96);
  v31[15] = v18;
  v31[16] = v20;
  v30[16] = @"isBluetoothPairing";
  v30[17] = @"isExtensionDiscovery";
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v19, "runningExtension"));
  v22 = (void *)v21;
  v23 = *(void **)(a1 + 104);
  if (!v23) {
    v23 = &unk_26D125D28;
  }
  v31[17] = v21;
  v31[18] = v23;
  v30[18] = @"MigrationItemsCount";
  v30[19] = @"SharedAccessory";
  v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 135)];
  v31[19] = v24;
  id v25 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:20];

  return v25;
}

@end