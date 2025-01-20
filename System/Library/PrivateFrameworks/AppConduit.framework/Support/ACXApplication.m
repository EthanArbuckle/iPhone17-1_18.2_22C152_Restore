@interface ACXApplication
- (id)externalApplicationDictionaryRepresentationForDeviceState:(id)a3;
- (id)externalComplicationDictionaryRepresentationForDeviceState:(id)a3;
- (int64_t)exportedAppStateForDeviceState:(id)a3;
@end

@implementation ACXApplication

- (id)externalApplicationDictionaryRepresentationForDeviceState:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(ACXApplication *)self bundleIdentifier];
  [v5 setObject:v6 forKeyedSubscript:@"i"];

  v7 = [(ACXApplication *)self applicationName];
  [v5 setObject:v7 forKeyedSubscript:@"n"];

  v8 = [(ACXApplication *)self teamID];
  [v5 setObject:v8 forKeyedSubscript:@"SPApplicationTeamID"];

  v9 = [(ACXApplication *)self companionAppBundleID];
  [v5 setObject:v9 forKeyedSubscript:@"SPContainerAppBundleId"];

  v10 = [(ACXApplication *)self watchKitAppExtensionBundleID];
  [v5 setObject:v10 forKeyedSubscript:@"SPPluginBundleIdKey"];

  v11 = +[NSNumber numberWithBool:[(ACXApplication *)self isBetaApp]];
  [v5 setObject:v11 forKeyedSubscript:@"WKBetaAppKey"];

  v12 = +[NSNumber numberWithBool:[(ACXApplication *)self isSystemApp]];
  [v5 setObject:v12 forKeyedSubscript:@"AppShipsWithOS"];

  v13 = [(ACXApplication *)self watchKitVersion];
  [v5 setObject:v13 forKeyedSubscript:@"WKWatchKitVersion"];

  v14 = [(ACXApplication *)self intentsRestrictedWhileLocked];
  [v5 setObject:v14 forKeyedSubscript:@"IntentsRestrictedWhileLockedAgg"];

  v15 = [(ACXApplication *)self intentsSupported];
  [v5 setObject:v15 forKeyedSubscript:@"IntentsSupportedAgg"];

  v16 = [(ACXApplication *)self clockFaceExtensionPaths];
  [v5 setObject:v16 forKeyedSubscript:@"ACXClockfaceExtensionPaths"];

  if (v4)
  {
    int64_t v17 = [(ACXApplication *)self exportedAppStateForDeviceState:v4];
    v18 = +[NSNumber numberWithInteger:v17];
    [v5 setObject:v18 forKeyedSubscript:@"s"];

    v19 = +[NSNumber numberWithInt:(unint64_t)(v17 - 1) < 2];
    [v5 setObject:v19 forKeyedSubscript:@"saw"];

    v20 = [(ACXApplication *)self bundleIdentifier];
    v21 = [v4 uniqueInstallIDForApp:v20];
    [v5 setObject:v21 forKeyedSubscript:@"SPApplicationUniqueID"];
  }
  v22 = [v4 device];
  v23 = [v22 osVersion];

  if ([(ACXApplication *)self isRuntimeCompatibleWithOSVersion:v23]) {
    v24 = &off_100097828;
  }
  else {
    v24 = &off_100097840;
  }
  [v5 setObject:v24 forKeyedSubscript:@"WKCompatibility"];
  v25 = [v4 device];
  id v26 = [v25 cpuType];
  v27 = [v4 device];
  LODWORD(v26) = -[ACXApplication isCompatibleWithCPUType:subtype:](self, "isCompatibleWithCPUType:subtype:", v26, [v27 cpuSubtype]);

  if (v26) {
    v28 = &off_100097858;
  }
  else {
    v28 = &off_100097870;
  }
  [v5 setObject:v28 forKeyedSubscript:@"ACXArchitectureCompatibility"];
  v29 = [(ACXApplication *)self userActivityTypes];
  [v5 setObject:v29 forKeyedSubscript:@"ACXUserActivityTypesKey"];

  id v30 = [v5 copy];

  return v30;
}

- (id)externalComplicationDictionaryRepresentationForDeviceState:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(ACXApplication *)self bundleIdentifier];
  [v5 setObject:v6 forKeyedSubscript:@"CFBundleIdentifier"];

  v7 = [(ACXApplication *)self companionAppName];
  [v5 setObject:v7 forKeyedSubscript:@"CFBundleName"];

  if (v4)
  {
    v8 = +[NSNumber numberWithInteger:[(ACXApplication *)self exportedAppStateForDeviceState:v4]];
    [v5 setObject:v8 forKeyedSubscript:@"s"];
  }
  v9 = [(ACXApplication *)self complicationPrincipalClass];

  if (v9)
  {
    v10 = [(ACXApplication *)self complicationPrincipalClass];
    [v5 setObject:v10 forKeyedSubscript:@"CLKComplicationPrincipalClass"];
  }
  v11 = [(ACXApplication *)self supportedComplicationFamilies];

  if (v11)
  {
    v12 = [(ACXApplication *)self supportedComplicationFamilies];
    [v5 setObject:v12 forKeyedSubscript:@"CLKComplicationSupportedFamilies"];
  }
  id v13 = [v5 copy];

  return v13;
}

- (int64_t)exportedAppStateForDeviceState:(id)a3
{
  id v4 = a3;
  v5 = [(ACXApplication *)self companionAppBundleID];
  unsigned __int8 v6 = [v4 updatePendingForCompanionApp:v5];

  if (v6)
  {
    int64_t v7 = 1;
  }
  else
  {
    v8 = [(ACXApplication *)self bundleIdentifier];
    int64_t v7 = (int64_t)objc_msgSend(v4, "exportedAppStateForDeviceState:", objc_msgSend(v4, "installStatusForApp:", v8));
  }
  return v7;
}

@end