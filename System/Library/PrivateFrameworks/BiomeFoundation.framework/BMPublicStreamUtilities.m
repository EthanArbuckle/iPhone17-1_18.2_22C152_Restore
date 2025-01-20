@interface BMPublicStreamUtilities
+ (BOOL)writeAllowedForStream:(int64_t)a3 processIdentifier:(id)a4;
+ (id)allowedStreamWriteIdentifiersForStream:(int64_t)a3;
+ (id)libraryPublicStreamMigrationPaths;
+ (id)libraryPublicStreamReverseMigrationPaths;
+ (id)streamIdentifierForPreMigrationStream:(int64_t)a3;
+ (id)streamIdentifierForStream:(int64_t)a3;
+ (id)streamIdentifiers;
+ (int64_t)streamForPreMigrationStreamIdentifier:(id)a3;
+ (int64_t)streamForStreamIdentifier:(id)a3;
+ (unint64_t)domainForStream:(int64_t)a3;
@end

@implementation BMPublicStreamUtilities

+ (id)libraryPublicStreamMigrationPaths
{
  return &unk_1F0B43530;
}

+ (id)streamIdentifiers
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:40];
  for (uint64_t i = 0; i != 40; ++i)
  {
    if (i && i != 3)
    {
      v5 = [a1 streamIdentifierForStream:i];
      [v3 addObject:v5];
    }
  }
  return v3;
}

+ (id)streamIdentifierForStream:(int64_t)a3
{
  v3 = +[BMPublicStreamUtilities streamIdentifierForPreMigrationStream:a3];
  v4 = +[BMPublicStreamUtilities libraryPublicStreamMigrationPaths];
  uint64_t v5 = [v4 valueForKey:v3];
  v6 = (void *)v5;
  if (v5) {
    v7 = (void *)v5;
  }
  else {
    v7 = v3;
  }
  id v8 = v7;

  return v8;
}

+ (id)streamIdentifierForPreMigrationStream:(int64_t)a3
{
  if ((unint64_t)a3 > 0x28 || (unint64_t)(a3 - 1) > 0x26) {
    return 0;
  }
  else {
    return off_1E6022B90[a3 - 1];
  }
}

+ (int64_t)streamForStreamIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[BMPublicStreamUtilities libraryPublicStreamReverseMigrationPaths];
  uint64_t v5 = [v4 valueForKey:v3];

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v3;
  }
  int64_t v7 = +[BMPublicStreamUtilities streamForPreMigrationStreamIdentifier:v6];

  return v7;
}

+ (int64_t)streamForPreMigrationStreamIdentifier:(id)a3
{
  id v3 = a3;
  if ([@"AppLaunch" isEqualToString:v3])
  {
    int64_t v4 = 1;
  }
  else if ([@"AppIntent" isEqualToString:v3])
  {
    int64_t v4 = 2;
  }
  else if ([@"TestStream" isEqualToString:v3])
  {
    int64_t v4 = 3;
  }
  else if ([@"POICategory" isEqualToString:v3])
  {
    int64_t v4 = 4;
  }
  else if ([@"ContextualActions" isEqualToString:v3])
  {
    int64_t v4 = 5;
  }
  else if ([@"SleepMode" isEqualToString:v3])
  {
    int64_t v4 = 6;
  }
  else if ([@"UserFocusComputedMode" isEqualToString:v3])
  {
    int64_t v4 = 9;
  }
  else if ([@"UserFocusActivity" isEqualToString:v3])
  {
    int64_t v4 = 10;
  }
  else if ([@"CarPlay" isEqualToString:v3])
  {
    int64_t v4 = 7;
  }
  else if ([@"DoNotDisturbWhileDriving" isEqualToString:v3])
  {
    int64_t v4 = 8;
  }
  else if ([@"HomeKitClientAccessoryControl" isEqualToString:v3])
  {
    int64_t v4 = 14;
  }
  else if ([@"HomeKitClientMediaAccessoryControl" isEqualToString:v3])
  {
    int64_t v4 = 15;
  }
  else if ([@"HomeKitClientActionSet" isEqualToString:v3])
  {
    int64_t v4 = 16;
  }
  else if ([@"Alarm" isEqualToString:v3])
  {
    int64_t v4 = 11;
  }
  else if ([@"ScreenRecording" isEqualToString:v3])
  {
    int64_t v4 = 12;
  }
  else if ([@"ScreenSharing" isEqualToString:v3])
  {
    int64_t v4 = 13;
  }
  else if ([@"NowPlaying" isEqualToString:v3])
  {
    int64_t v4 = 17;
  }
  else if ([@"Notification" isEqualToString:v3])
  {
    int64_t v4 = 18;
  }
  else if ([@"Workout" isEqualToString:v3])
  {
    int64_t v4 = 19;
  }
  else if ([@"GroupActivitySession" isEqualToString:v3])
  {
    int64_t v4 = 20;
  }
  else if ([@"SemanticLocation" isEqualToString:v3])
  {
    int64_t v4 = 21;
  }
  else if ([@"Backlight" isEqualToString:v3])
  {
    int64_t v4 = 22;
  }
  else if ([@"HealthKitWorkout" isEqualToString:v3])
  {
    int64_t v4 = 23;
  }
  else if ([@"AppClipLaunch" isEqualToString:v3])
  {
    int64_t v4 = 24;
  }
  else if ([@"AskToBuy" isEqualToString:v3])
  {
    int64_t v4 = 25;
  }
  else if ([@"FindMyLocationChange" isEqualToString:v3])
  {
    int64_t v4 = 27;
  }
  else if ([@"SoundDetection" isEqualToString:v3])
  {
    int64_t v4 = 28;
  }
  else if ([@"UserStatusChange" isEqualToString:v3])
  {
    int64_t v4 = 29;
  }
  else if ([@"TextInputSession" isEqualToString:v3])
  {
    int64_t v4 = 30;
  }
  else if ([@"DeviceMetadata" isEqualToString:v3])
  {
    int64_t v4 = 31;
  }
  else if ([@"SchoolTime" isEqualToString:v3])
  {
    int64_t v4 = 32;
  }
  else if ([@"Mindfulness" isEqualToString:v3])
  {
    int64_t v4 = 33;
  }
  else if ([@"ReadMessage" isEqualToString:v3])
  {
    int64_t v4 = 26;
  }
  else if ([@"ScreenTimeRequest" isEqualToString:v3])
  {
    int64_t v4 = 34;
  }
  else if ([@"SiriIntentEvents" isEqualToString:v3])
  {
    int64_t v4 = 35;
  }
  else if ([@"GameController" isEqualToString:v3])
  {
    int64_t v4 = 36;
  }
  else if ([@"SiriUI" isEqualToString:v3])
  {
    int64_t v4 = 37;
  }
  else if ([@"SiriExecution" isEqualToString:v3])
  {
    int64_t v4 = 38;
  }
  else if ([@"PostSiriEngagement" isEqualToString:v3])
  {
    int64_t v4 = 39;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)libraryPublicStreamReverseMigrationPaths
{
  return &unk_1F0B43558;
}

+ (BOOL)writeAllowedForStream:(int64_t)a3 processIdentifier:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a1 allowedStreamWriteIdentifiersForStream:a3];
  LOBYTE(a1) = [v7 containsObject:v6];

  return (char)a1;
}

+ (id)allowedStreamWriteIdentifiersForStream:(int64_t)a3
{
  if ((unint64_t)(a3 - 40) < 0xFFFFFFFFFFFFFFD9 || (unint64_t)(a3 - 1) > 0x26) {
    return 0;
  }
  else {
    return (id)qword_1E6022CC8[a3 - 1];
  }
}

+ (unint64_t)domainForStream:(int64_t)a3
{
  return a3 == 31 || a3 == 22;
}

@end