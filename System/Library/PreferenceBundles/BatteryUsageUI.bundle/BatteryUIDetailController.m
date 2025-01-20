@interface BatteryUIDetailController
- (id)getSortValueForKey:(id)a3;
- (id)getValueForSpecifier:(id)a3;
- (id)specifiers;
@end

@implementation BatteryUIDetailController

- (id)getValueForSpecifier:(id)a3
{
  v4 = [a3 propertyForKey:PSIDKey];
  if ([v4 isEqualToString:@"PLBatteryUIAppEnergyUsedKey"])
  {
    v5 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
    [v5 floatValue];
    uint64_t v7 = PSFormattedEnergyString(v6);
    goto LABEL_6;
  }
  if (([v4 isEqualToString:@"PLBatteryUIAppCellDataUsageKey"] & 1) != 0
    || [v4 isEqualToString:@"PLBatteryUIAppWifiDataUsageKey"])
  {
    v5 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
    [v5 floatValue];
    uint64_t v7 = CPFSSizeStrings();
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"PLBatteryUIAppTypeKey"])
  {
    v5 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
    uint64_t v7 = BatteryUIAppTypeToString((int)[v5 intValue]);
    goto LABEL_6;
  }
  if (([v4 isEqualToString:@"PLBatteryUIAppCPUEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppVENCEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppVDECEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppISPEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppRestOfSOCEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppSOCEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppGPUEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppDRAMEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppDisplayEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppWIFIEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppAUDIOEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppBBEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"BLMEnergyGPS"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppWifiLocationEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppWifiPipelineEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppBluetoothEnergyKey"] & 1) != 0
    || ([v4 isEqualToString:@"PLBatteryUIAppAccessoryEnergyKey"] & 1) != 0
    || [v4 isEqualToString:@"PLBatteryUIAppNfcEnergyKey"])
  {
    v10 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
    v5 = v10;
LABEL_30:
    [v10 floatValue];
    +[NSString stringWithFormat:@"%.2f mWh", v11];
    uint64_t v7 = LABEL_31:;
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"PLBatteryUIAppEnergyValueKey"])
  {
    v5 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
    [v5 floatValue];
    +[NSString stringWithFormat:@"%.2f%%", v12];
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"PLBatteryUIAppQualifiersKey"])
  {
    v5 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
    uint64_t v7 = BatteryUIPrintQualifierString(v5);
  }
  else if ([v4 isEqualToString:@"PLBatteryUIAppForegroundRuntimeKey"] {
         || [v4 isEqualToString:@"PLBatteryUIAppBackgroundRuntimeKey"])
  }
  {
    v5 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
    [v5 floatValue];
    uint64_t v7 = PSAbbreviatedFormattedTimeString();
  }
  else
  {
    if (![v4 isEqualToString:@"PLBatteryUIAppAudioTime"]
      && ![v4 isEqualToString:@"PLBatteryUIAppLocationTime"])
    {
      if ([v4 isEqualToString:@"PLBatteryUIAppCellularDataUsage"])
      {
        v10 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
        v5 = v10;
      }
      else
      {
        unsigned int v13 = [v4 isEqualToString:@"PLBatteryUIAppWiFiDataUsage"];
        v10 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
        v5 = v10;
        if (!v13) {
          goto LABEL_30;
        }
      }
      [v10 doubleValue];
      +[NSString stringWithFormat:@"%.1f MB", v14];
      goto LABEL_31;
    }
    v5 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:v4];
    [v5 doubleValue];
    uint64_t v7 = PSFormattedTimeString();
  }
LABEL_6:
  v8 = (void *)v7;

  return v8;
}

- (id)getSortValueForKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLBatteryUIAppNameKey"])
  {
    v4 = &off_C91D0;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppBundleIDKey"])
  {
    v4 = &off_C91E8;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppEnergyValueKey"])
  {
    v4 = &off_C9200;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppEnergyUsedKey"])
  {
    v4 = &off_C9218;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppCPUEnergyKey"])
  {
    v4 = &off_C9230;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppVENCEnergyKey"])
  {
    v4 = &off_C9248;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppVDECEnergyKey"])
  {
    v4 = &off_C9260;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppISPEnergyKey"])
  {
    v4 = &off_C9278;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppRestOfSOCEnergyKey"])
  {
    v4 = &off_C9290;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppSOCEnergyKey"])
  {
    v4 = &off_C92A8;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppGPUEnergyKey"])
  {
    v4 = &off_C92C0;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppDRAMEnergyKey"])
  {
    v4 = &off_C92D8;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppDisplayEnergyKey"])
  {
    v4 = &off_C92F0;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppAUDIOEnergyKey"])
  {
    v4 = &off_C9308;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppBBEnergyKey"])
  {
    v4 = &off_C9320;
  }
  else if ([v3 isEqualToString:@"BLMEnergyGPS"])
  {
    v4 = &off_C9338;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppWIFIEnergyKey"])
  {
    v4 = &off_C9350;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppWifiLocationEnergyKey"])
  {
    v4 = &off_C9368;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppWifiPipelineEnergyKey"])
  {
    v4 = &off_C9380;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppBluetoothEnergyKey"])
  {
    v4 = &off_C9398;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppAccessoryEnergyKey"])
  {
    v4 = &off_C93B0;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppNfcEnergyKey"])
  {
    v4 = &off_C93C8;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppQualifiersKey"])
  {
    v4 = &off_C93E0;
  }
  else if ([v3 isEqualToString:@"PLBatteryUIAppTypeKey"])
  {
    v4 = &off_C93F8;
  }
  else
  {
    v4 = &off_C9410;
  }

  return v4;
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  id v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
LABEL_18:
    id v45 = v3;
    goto LABEL_19;
  }
  v55 = +[NSMutableArray array];
  if (self->_appEntry) {
    goto LABEL_4;
  }
  v5 = [(BatteryUIDetailController *)self specifier];
  float v6 = [v5 propertyForKey:@"APP_ENERGY_ENTRY"];
  appEntry = self->_appEntry;
  self->_appEntry = v6;

  if (self->_appEntry)
  {
LABEL_4:
    uint64_t v53 = v2;
    v8 = [(BatteryUIDetailController *)self specifier];
    v9 = [v8 name];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

    float v11 = [(NSDictionary *)self->_appEntry objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
    uint64_t v54 = PSIDKey;
    objc_msgSend(v10, "setProperty:forKey:", v11);

    float v12 = [(BatteryUIDetailController *)self specifier];
    uint64_t v13 = PSLazyIconAppID;
    uint64_t v14 = [v12 propertyForKey:PSLazyIconAppID];

    if (v14)
    {
      v15 = [(BatteryUIDetailController *)self specifier];
      v16 = [v15 propertyForKey:v13];
      [v10 setProperty:v16 forKey:v13];
    }
    v17 = [(BatteryUIDetailController *)self specifier];
    uint64_t v18 = PSLazyIconLoading;
    v19 = [v17 propertyForKey:PSLazyIconLoading];

    if (v19)
    {
      v20 = [(BatteryUIDetailController *)self specifier];
      v21 = [v20 propertyForKey:v18];
      [v10 setProperty:v21 forKey:v18];
    }
    v22 = +[PSSpecifier groupSpecifierWithName:0];
    [v55 addObject:v22];

    v52 = v10;
    [v55 addObject:v10];
    v23 = [(BatteryUIDetailController *)self specifier];
    uint64_t v24 = [v23 propertyForKey:@"usageString"];

    v51 = (void *)v24;
    v25 = +[PSSpecifier groupSpecifierWithName:v24];
    [v55 addObject:v25];

    v26 = BatteryUILocalization(@"PLBatteryUIAppForegroundRuntimeKey");
    v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:0 get:"getValueForSpecifier:" detail:0 cell:4 edit:0];

    [v27 setProperty:@"PLBatteryUIAppForegroundRuntimeKey" forKey:v54];
    v50 = v27;
    [v55 addObject:v27];
    v28 = BatteryUILocalization(@"PLBatteryUIAppBackgroundRuntimeKey");
    v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:"getValueForSpecifier:" detail:0 cell:4 edit:0];

    [v29 setProperty:@"PLBatteryUIAppBackgroundRuntimeKey" forKey:v54];
    v49 = v29;
    [v55 addObject:v29];
    v30 = BatteryUILocalization(@"APP_DETAIL");
    v31 = +[PSSpecifier groupSpecifierWithName:v30];
    [v55 addObject:v31];

    v32 = [(NSDictionary *)self->_appEntry allKeys];
    id v33 = [v32 mutableCopy];

    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_3C30;
    v60[3] = &unk_BE560;
    v60[4] = self;
    [v33 sortUsingComparator:v60];
    +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", @"PLBatteryUIAppNameKey", @"PLBatteryUIAppBundleIDKey", @"PLBatteryUIAppForegroundRuntimeKey", @"PLBatteryUIAppBackgroundRuntimeKey", @"CPU", @"VENC", @"VDEC", @"ISP", @"RestOfSOC", @"SOC", @"GPU", @"DRAM", @"Display", @"WIFI", @"AUDIO", @"BB", @"GPS",
      @"WiFiData",
      @"WiFiLocation",
      @"WiFiPipeline",
      @"Bluetooth",
      @"Accessory",
      @"Nfc",
    v34 = 0);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v35 = v33;
    id v36 = [v35 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v57;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v57 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if (([v34 containsObject:v40] & 1) == 0)
          {
            v41 = BatteryUILocalization(v40);
            v42 = +[PSSpecifier preferenceSpecifierNamed:v41 target:self set:0 get:"getValueForSpecifier:" detail:0 cell:4 edit:0];

            [v42 setProperty:v40 forKey:v54];
            [v55 addObject:v42];
          }
        }
        id v37 = [v35 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v37);
    }

    v43 = *(void **)&self->PSListController_opaque[v53];
    *(void *)&self->PSListController_opaque[v53] = v55;
    id v44 = v55;

    id v3 = *(void **)&self->PSListController_opaque[v53];
    goto LABEL_18;
  }
  v47 = *(void **)&self->PSListController_opaque[v2];
  *(void *)&self->PSListController_opaque[v2] = v55;
  id v48 = v55;

  id v45 = *(id *)&self->PSListController_opaque[v2];
LABEL_19:

  return v45;
}

- (void).cxx_destruct
{
}

@end