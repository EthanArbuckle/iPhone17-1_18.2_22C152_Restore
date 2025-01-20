@interface _DKSystemEventStreams
+ (id)airplaneModeStream;
+ (id)airplayPredictionStream;
+ (id)alarmStream;
+ (id)appActivityStream;
+ (id)appClipUsageStream;
+ (id)appDirectoryInteractionStream;
+ (id)appInFocusStream;
+ (id)appInstallStream;
+ (id)appIntentsStream;
+ (id)appLaunchFeedbackStream;
+ (id)appLocationActivityStream;
+ (id)appMediaUsageStream;
+ (id)appRelevantShortcutsStream;
+ (id)appUsageStream;
+ (id)appViewedInDockStream;
+ (id)appWebUsageStream;
+ (id)audioInputRouteStream;
+ (id)audioOutputRoutStream;
+ (id)audioOutputRouteStream;
+ (id)behavioralRuleFeaturesStream;
+ (id)bluetoothIsConnectedStream;
+ (id)calendarEventStream;
+ (id)callInProgressStream;
+ (id)carPlayIsConnectedStream;
+ (id)defaultPairedDeviceNearbyStream;
+ (id)deviceActivityLevelFeedbackStream;
+ (id)deviceActivityLevelStream;
+ (id)deviceBatteryPercentageStream;
+ (id)deviceInUseProxyStream;
+ (id)deviceIsLockedImputedStream;
+ (id)deviceIsLockedStream;
+ (id)deviceIsPluggedInStream;
+ (id)deviceLowPowerModeStream;
+ (id)discoverabilitySignalsStream;
+ (id)discoverabilityUsageStream;
+ (id)diskSubsystemAccessStream;
+ (id)displayIsBacklit;
+ (id)displayOrientationStream;
+ (id)doNotDisturbStream;
+ (id)familyPredictionStream;
+ (id)focusModeStream;
+ (id)homeKitAccessoryControlStream;
+ (id)homeKitAppViewStream;
+ (id)homeKitSceneStream;
+ (id)internalQueryDataCollectionStream;
+ (id)keybagIsLockedStream;
+ (id)locationCoordinatesStream;
+ (id)locationVisitStream;
+ (id)microLocationVisitStream;
+ (id)motionStream;
+ (id)nextEventForTopOffProtectionStream;
+ (id)notificationUsageStream;
+ (id)nowPlayingStream;
+ (id)pairedDeviceForecastStream;
+ (id)peopleSuggesterOutputForSiriNLStream;
+ (id)remoteDeviceInBedTimesStream;
+ (id)safariHistoryStream;
+ (id)searchFeedbackStream;
+ (id)siriIntentEventStream;
+ (id)siriServiceStream;
+ (id)standbyTimerStream;
+ (id)timerStream;
+ (id)tombstoneStream;
+ (id)userIsFirstBacklightOnAfterWakeup;
+ (id)watchActiveStream;
+ (id)watchNearbyStream;
+ (id)widgetsViewedStream;
+ (id)wifiConnectionStream;
@end

@implementation _DKSystemEventStreams

+ (id)appInFocusStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/inFocus"];
}

+ (id)displayOrientationStream
{
  return +[_DKEventStream eventStreamWithName:@"/display/orientation"];
}

+ (id)appLocationActivityStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/locationActivity"];
}

+ (id)safariHistoryStream
{
  return +[_DKEventStream eventStreamWithName:@"/safari/history"];
}

+ (id)appIntentsStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/intents"];
}

+ (id)appActivityStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/activity"];
}

+ (id)appUsageStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/usage"];
}

+ (id)appClipUsageStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/clipUsage"];
}

+ (id)deviceIsPluggedInStream
{
  return +[_DKEventStream eventStreamWithName:@"/device/isPluggedIn"];
}

+ (id)deviceBatteryPercentageStream
{
  return +[_DKEventStream eventStreamWithName:@"/device/batteryPercentage"];
}

+ (id)appWebUsageStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/webUsage"];
}

+ (id)appMediaUsageStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/mediaUsage"];
}

+ (id)appInstallStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/install"];
}

+ (id)appRelevantShortcutsStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/relevantShortcuts"];
}

+ (id)appViewedInDockStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/dockView"];
}

+ (id)widgetsViewedStream
{
  return +[_DKEventStream eventStreamWithName:@"/widgets/viewed"];
}

+ (id)notificationUsageStream
{
  return +[_DKEventStream eventStreamWithName:@"/notification/usage"];
}

+ (id)focusModeStream
{
  return +[_DKEventStream eventStreamWithName:@"/inferred/focusMode"];
}

+ (id)deviceActivityLevelStream
{
  v2 = +[_DKAnyIntegerCategory type];
  v3 = +[_DKEventStream eventStreamWithName:@"/activity/level" valueType:v2];

  return v3;
}

+ (id)standbyTimerStream
{
  return +[_DKEventStream eventStreamWithName:@"/standby/timer"];
}

+ (id)deviceActivityLevelFeedbackStream
{
  return +[_DKEventStream eventStreamWithName:@"/activity/level/feedback"];
}

+ (id)doNotDisturbStream
{
  v2 = +[_DKBoolCategory type];
  v3 = +[_DKEventStream eventStreamWithName:@"/settings/doNotDisturb" valueType:v2];

  return v3;
}

+ (id)airplaneModeStream
{
  v2 = +[_DKBoolCategory type];
  v3 = +[_DKEventStream eventStreamWithName:@"/system/airplaneMode" valueType:v2];

  return v3;
}

+ (id)nextEventForTopOffProtectionStream
{
  v2 = +[_DKAnyDoubleQuantity type];
  v3 = +[_DKEventStream eventStreamWithName:@"/system/userWakingEvent" valueType:v2];

  return v3;
}

+ (id)deviceIsLockedStream
{
  return +[_DKEventStream eventStreamWithName:@"/device/isLocked"];
}

+ (id)deviceIsLockedImputedStream
{
  return +[_DKEventStream eventStreamWithName:@"/device/isLockedImputed"];
}

+ (id)keybagIsLockedStream
{
  return +[_DKEventStream eventStreamWithName:@"/keybag/isLocked"];
}

+ (id)deviceLowPowerModeStream
{
  return +[_DKEventStream eventStreamWithName:@"/device/lowPowerMode"];
}

+ (id)alarmStream
{
  return +[_DKEventStream eventStreamWithName:@"/clock/alarm"];
}

+ (id)timerStream
{
  return +[_DKEventStream eventStreamWithName:@"/clock/timer"];
}

+ (id)airplayPredictionStream
{
  return +[_DKEventStream eventStreamWithName:@"/airplay/prediction"];
}

+ (id)siriServiceStream
{
  return +[_DKEventStream eventStreamWithName:@"/siri/service"];
}

+ (id)siriIntentEventStream
{
  return +[_DKEventStream eventStreamWithName:@"/siri/intentEvent"];
}

+ (id)discoverabilitySignalsStream
{
  return +[_DKEventStream eventStreamWithName:@"/discoverability/signals"];
}

+ (id)discoverabilityUsageStream
{
  return +[_DKEventStream eventStreamWithName:@"/discoverability/usage"];
}

+ (id)diskSubsystemAccessStream
{
  return +[_DKEventStream eventStreamWithName:@"/disk/subsystemAccess"];
}

+ (id)displayIsBacklit
{
  return +[_DKEventStream eventStreamWithName:@"/display/isBacklit"];
}

+ (id)audioInputRouteStream
{
  return +[_DKEventStream eventStreamWithName:@"/audio/inputRoute"];
}

+ (id)audioOutputRoutStream
{
  v2 = objc_opt_class();
  return (id)[v2 audioOutputRouteStream];
}

+ (id)audioOutputRouteStream
{
  return +[_DKEventStream eventStreamWithName:@"/audio/outputRoute"];
}

+ (id)motionStream
{
  v2 = +[_DKAnyIntegerCategory type];
  v3 = +[_DKEventStream eventStreamWithName:@"/inferred/motion" valueType:v2];

  return v3;
}

+ (id)locationVisitStream
{
  return +[_DKEventStream eventStreamWithName:@"/inferred/locationVisit"];
}

+ (id)microLocationVisitStream
{
  return +[_DKEventStream eventStreamWithName:@"/inferred/microLocationVisit"];
}

+ (id)locationCoordinatesStream
{
  return +[_DKEventStream eventStreamWithName:@"/location/coordinates"];
}

+ (id)calendarEventStream
{
  return +[_DKEventStream eventStreamWithName:@"/calendar/eventTitle"];
}

+ (id)userIsFirstBacklightOnAfterWakeup
{
  return +[_DKEventStream eventStreamWithName:@"/user/isFirstBacklightOnAfterWakeup"];
}

+ (id)carPlayIsConnectedStream
{
  return +[_DKEventStream eventStreamWithName:@"/carplay/isConnected"];
}

+ (id)bluetoothIsConnectedStream
{
  return +[_DKEventStream eventStreamWithName:@"/bluetooth/isConnected"];
}

+ (id)watchNearbyStream
{
  return +[_DKSystemEventStreams defaultPairedDeviceNearbyStream];
}

+ (id)defaultPairedDeviceNearbyStream
{
  return +[_DKEventStream eventStreamWithName:@"/defaultPaired/nearby"];
}

+ (id)watchActiveStream
{
  return +[_DKEventStream eventStreamWithName:@"/watch/active"];
}

+ (id)nowPlayingStream
{
  return +[_DKEventStream eventStreamWithName:@"/media/nowPlaying"];
}

+ (id)callInProgressStream
{
  return +[_DKEventStream eventStreamWithName:@"/call/inProgress"];
}

+ (id)homeKitSceneStream
{
  return +[_DKEventStream eventStreamWithName:@"/homekit/scene"];
}

+ (id)homeKitAccessoryControlStream
{
  return +[_DKEventStream eventStreamWithName:@"/homekit/accessoryControl"];
}

+ (id)homeKitAppViewStream
{
  return +[_DKEventStream eventStreamWithName:@"/homekit/appView"];
}

+ (id)searchFeedbackStream
{
  return +[_DKEventStream eventStreamWithName:@"/search/feedback"];
}

+ (id)tombstoneStream
{
  return +[_DKEventStream eventStreamWithName:@"/event/tombstone"];
}

+ (id)internalQueryDataCollectionStream
{
  return +[_DKEventStream eventStreamWithName:@"/internal/queryDataCollection"];
}

+ (id)pairedDeviceForecastStream
{
  v2 = +[_DKAnyStringIdentifier type];
  v3 = +[_DKEventStream eventStreamWithName:@"PairedDeviceForecast" valueType:v2];

  return v3;
}

+ (id)remoteDeviceInBedTimesStream
{
  v2 = +[_DKAnyIntegerCategory type];
  v3 = +[_DKEventStream eventStreamWithName:@"RemoteDeviceInBed" valueType:v2];

  return v3;
}

+ (id)appLaunchFeedbackStream
{
  return +[_DKEventStream eventStreamWithName:@"/app/launchFeedback"];
}

+ (id)wifiConnectionStream
{
  return +[_DKEventStream eventStreamWithName:@"/wifi/connection"];
}

+ (id)appDirectoryInteractionStream
{
  return +[_DKEventStream eventStreamWithName:@"/userInteraction/appDirectory"];
}

+ (id)behavioralRuleFeaturesStream
{
  return +[_DKEventStream eventStreamWithName:@"/sharesheet/behavioralRuleFeatures"];
}

+ (id)peopleSuggesterOutputForSiriNLStream
{
  return +[_DKEventStream eventStreamWithName:@"/peopleSuggester/siriNl"];
}

+ (id)familyPredictionStream
{
  return +[_DKEventStream eventStreamWithName:@"/family/prediction"];
}

+ (id)deviceInUseProxyStream
{
  return +[_DKSystemEventStreams deviceIsLockedStream];
}

@end