id AXSDSoundDetectionBundle()
{
  void *v0;
  uint64_t vars8;

  if (AXSDSoundDetectionBundle_onceToken != -1) {
    dispatch_once(&AXSDSoundDetectionBundle_onceToken, &__block_literal_global);
  }
  v0 = (void *)AXSDSoundDetectionBundle_AXBundle;
  return v0;
}

uint64_t __AXSDSoundDetectionBundle_block_invoke()
{
  AXSDSoundDetectionBundle_AXBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

void _AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = [MEMORY[0x263EFF910] now];
  [v5 timeIntervalSinceDate:v3];

  v8 = v3;
  v9 = v4;
  id v6 = v4;
  id v7 = v3;
  AXPerformBlockOnMainThreadAfterDelay();
}

void AXSDSoundDetectionHandleNotificationsForResponse(void *a1)
{
  id v1 = a1;
  v2 = [v1 actionIdentifier];
  id v3 = [v1 notification];
  id v4 = [v3 request];
  v5 = [v4 content];
  id v6 = [v5 userInfo];

  id v7 = [v6 objectForKey:@"SDNotificationDetectorKey"];
  if ([v2 isEqualToString:@"com.apple.SoundDetectionNotification.action.radar"])
  {
    v8 = [v1 notification];
    v9 = [v8 date];
    _AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt(v9, v7);
LABEL_13:

    goto LABEL_14;
  }
  v10 = AXLogUltron();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    AXSDSoundDetectionHandleNotificationsForResponse_cold_1((uint64_t)v7, (uint64_t)v2, v10);
  }

  if ([v2 isEqualToString:@"com.apple.SoundDetectionNotification.action.snooze.short"])
  {
    double v11 = 300.0;
  }
  else if ([v2 isEqualToString:@"com.apple.SoundDetectionNotification.action.snooze.medium"])
  {
    double v11 = 1800.0;
  }
  else
  {
    if (![v2 isEqualToString:@"com.apple.SoundDetectionNotification.action.snooze.long"])goto LABEL_14; {
    double v11 = 7200.0;
    }
  }
  uint64_t v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v11];
  if (v12)
  {
    v8 = (void *)v12;
    v9 = +[AXSDSettings sharedInstance];
    [v9 addSnoozeDateToSnoozeDictionary:v8 forKey:v7];
    goto LABEL_13;
  }
LABEL_14:
}

__CFString *AXSDSoundDetectionTypeForIdentifier(void *a1)
{
  id v1 = a1;
  v2 = AXSDSoundDetectionTypeNone;
  id v3 = &AXSDSoundDetectionTypeDistressedBaby;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeDistressedBaby]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"baby_distressed"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"baby"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeApplianceBeeps;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeApplianceBeeps]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"beep"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeApplianceBuzzes;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeApplianceBuzzes]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"buzzer"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"buzz"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeCarHorns;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeCarHorns]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"car_horn"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"horn"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeCatMeows;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeCatMeows]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"cat_meow"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"cat"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeApplianceBellDings;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeApplianceBellDings]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"ding_bell"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"bell"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeDogBarks;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeDogBarks]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"dog_bark"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"dog"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeDoorbells;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeDoorbells]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"door_bell"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"doorbell"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeDoorKnocks;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeDoorKnocks]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"door_knock"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeFireAlarms;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeFireAlarms]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"fire_alarm"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"fire-alarm"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypePersonShouting;
  if ([v1 isEqualToString:AXSDSoundDetectionTypePersonShouting]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"shout"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeSirenAlarms;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeSirenAlarms]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"siren_alarm"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"siren"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeSmokeAlarms;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeSmokeAlarms]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"smoke_alarm"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"smoke-alarm"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeWaterRunning;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeWaterRunning]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"water_running"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"water"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeCough;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeCough]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"cough"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeGlassBreaking;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeGlassBreaking]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"glass_breaking"]) {
    goto LABEL_50;
  }
  if ([v1 isEqualToString:@"glass"]) {
    goto LABEL_50;
  }
  id v3 = &AXSDSoundDetectionTypeKettle;
  if (([v1 isEqualToString:AXSDSoundDetectionTypeKettle] & 1) != 0
    || ([v1 isEqualToString:@"kettle"] & 1) != 0)
  {
    goto LABEL_50;
  }
  if (([v1 isEqualToString:AXSDSoundDetectionKShotTypeHallucinator] & 1) != 0
    || ([v1 isEqualToString:AXSDSoundDetectionKShotTypeModelWeights] & 1) != 0)
  {
    id v3 = &AXSDSoundDetectionTypeKShot;
LABEL_50:
    id v4 = *v3;

    v2 = v4;
    goto LABEL_51;
  }
  id v3 = &AXSDSoundDetectionTypeKShot;
  if (([v1 isEqualToString:AXSDSoundDetectionKShotTypeGeneralAppliance] & 1) != 0
    || [v1 isEqualToString:AXSDSoundDetectionTypeKShot])
  {
    goto LABEL_50;
  }
LABEL_51:
  if (v2 == AXSDSoundDetectionTypeNone)
  {
    v5 = AXLogUltron();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      AXSDSoundDetectionTypeForIdentifier_cold_1();
    }
  }
  return v2;
}

id AXSDSoundDetectionCategories()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = AXSDDetectorCategoryAlarm;
  v2[1] = AXSDDetectorCategoryAnimal;
  v2[2] = AXSDDetectorCategoryHousehold;
  v2[3] = AXSDDetectorCategoryPeople;
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  return v0;
}

id AXSDSoundDetectionTypesForCategory(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = v1;
  if (AXSDDetectorCategoryAlarm == v1)
  {
    v23 = AXSDSoundDetectionTypeFireAlarms;
    v24 = AXSDSoundDetectionTypeSirenAlarms;
    v25 = AXSDSoundDetectionTypeSmokeAlarms;
    v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = &v23;
LABEL_9:
    uint64_t v7 = 3;
LABEL_12:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23,
      v24,
      v25,
    id v4 = v26);
    goto LABEL_13;
  }
  if (AXSDDetectorCategoryAnimal == v1)
  {
    v21 = AXSDSoundDetectionTypeCatMeows;
    v22 = AXSDSoundDetectionTypeDogBarks;
    v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = &v21;
    uint64_t v7 = 2;
    goto LABEL_12;
  }
  if (AXSDDetectorCategoryHousehold == v1)
  {
    uint64_t v12 = AXSDSoundDetectionTypeApplianceBeeps;
    v13 = AXSDSoundDetectionTypeApplianceBuzzes;
    v14 = AXSDSoundDetectionTypeApplianceBellDings;
    v15 = AXSDSoundDetectionTypeCarHorns;
    v16 = AXSDSoundDetectionTypeDoorbells;
    v17 = AXSDSoundDetectionTypeDoorKnocks;
    v18 = AXSDSoundDetectionTypeWaterRunning;
    v19 = AXSDSoundDetectionTypeGlassBreaking;
    v20 = AXSDSoundDetectionTypeKettle;
    v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = &v12;
    uint64_t v7 = 9;
    goto LABEL_12;
  }
  if (AXSDDetectorCategoryPeople == v1)
  {
    v9 = AXSDSoundDetectionTypeDistressedBaby;
    v10 = AXSDSoundDetectionTypePersonShouting;
    double v11 = AXSDSoundDetectionTypeCough;
    v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = &v9;
    goto LABEL_9;
  }
  id v3 = AXLogUltron();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    AXSDSoundDetectionTypesForCategory_cold_1((uint64_t)v2, v3);
  }

  id v4 = (void *)MEMORY[0x263EFFA68];
LABEL_13:

  return v4;
}

uint64_t AXSDSoundDetectionTypeIsAppliance(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:AXSDSoundDetectionTypeApplianceBeeps] & 1) != 0
    || ([v1 isEqualToString:AXSDSoundDetectionTypeApplianceBuzzes] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:AXSDSoundDetectionTypeApplianceBellDings];
  }

  return v2;
}

uint64_t AXSDIsConnectedToCarPlay()
{
  v0 = [MEMORY[0x263F544E0] sharedAVSystemController];
  id v1 = [v0 attributeForKey:*MEMORY[0x263F54358]];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

id AXSDSoundDetectionLocalizedTitleForType(void *a1)
{
  return AXSDSoundDetectionLocalizedStringForType(a1, 0);
}

id AXSDSoundDetectionLocalizedStringForType(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (([v3 isEqualToString:AXSDSoundDetectionTypeKShot] & 1) != 0
    || ([v3 isEqualToString:AXSDSoundDetectionKShotTypeHallucinator] & 1) != 0
    || ([v3 isEqualToString:AXSDSoundDetectionKShotTypeModelWeights] & 1) != 0
    || [v3 isEqualToString:AXSDSoundDetectionKShotTypeGeneralAppliance])
  {
    id v4 = v3;
    goto LABEL_6;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeDistressedBaby])
  {
    id v6 = @"BodyBaby";
    uint64_t v7 = @"TitleBaby";
LABEL_45:
    if (!a2) {
      id v6 = v7;
    }
    v8 = v6;
    goto LABEL_48;
  }
  if (AXSDSoundDetectionTypeIsAppliance(v3))
  {
    if (a2)
    {
      if ([v3 isEqualToString:AXSDSoundDetectionTypeApplianceBeeps])
      {
        v8 = @"BodyApplianceBeep";
      }
      else if ([v3 isEqualToString:AXSDSoundDetectionTypeApplianceBellDings])
      {
        v8 = @"BodyApplianceBell";
      }
      else
      {
        v8 = @"BodyApplianceBuzz";
      }
    }
    else
    {
      v8 = @"TitleAppliance";
    }
    goto LABEL_48;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeCarHorns])
  {
    id v6 = @"BodyCarHorn";
    uint64_t v7 = @"TitleCarHorn";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeCatMeows])
  {
    id v6 = @"BodyCat";
    uint64_t v7 = @"TitleCat";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeDogBarks])
  {
    id v6 = @"BodyDog";
    uint64_t v7 = @"TitleDog";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeDoorbells])
  {
    id v6 = @"BodyDoorbell";
    uint64_t v7 = @"TitleDoorbell";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeDoorKnocks])
  {
    id v6 = @"BodyDoorKnock";
    uint64_t v7 = @"TitleDoorKnock";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeFireAlarms])
  {
    id v6 = @"BodyFireAlarm";
    uint64_t v7 = @"TitleFireAlarm";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeSirenAlarms])
  {
    id v6 = @"BodySiren";
    uint64_t v7 = @"TitleSiren";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeSmokeAlarms])
  {
    id v6 = @"BodySmokeAlarm";
    uint64_t v7 = @"TitleSmokeAlarm";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypePersonShouting])
  {
    id v6 = @"BodyShout";
    uint64_t v7 = @"TitleShout";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeWaterRunning])
  {
    id v6 = @"BodyWaterRunning";
    uint64_t v7 = @"TitleWaterRunning";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeCough])
  {
    id v6 = @"BodyCough";
    uint64_t v7 = @"TitleCough";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeGlassBreaking])
  {
    id v6 = @"BodyGlassBreaking";
    uint64_t v7 = @"TitleGlassBreaking";
    goto LABEL_45;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeKettle])
  {
    id v6 = @"BodyKettle";
    uint64_t v7 = @"TitleKettle";
    goto LABEL_45;
  }
  v15 = AXLogUltron();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    AXSDSoundDetectionLocalizedStringForType_cold_1();
  }

  v8 = 0;
LABEL_48:
  v9 = AXSDSoundDetectionBundle();
  id v4 = [v9 localizedStringForKey:v8 value:v8 table:@"SoundDetectionSupport"];

  if (a2)
  {
    v10 = AXSDSoundDetectionBundle();
    double v11 = v10;
    uint64_t v12 = @"DetectionBody";
LABEL_52:
    v13 = [v10 localizedStringForKey:v12 value:v12 table:@"SoundDetectionSupport"];

    uint64_t v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, v4);

    id v4 = (id)v14;
    goto LABEL_53;
  }
  if (AXSDIsConnectedToCarPlay())
  {
    v10 = AXSDSoundDetectionBundle();
    double v11 = v10;
    uint64_t v12 = @"DetectionMaybe";
    goto LABEL_52;
  }
LABEL_53:

LABEL_6:
  return v4;
}

id AXSDSoundDetectionLocalizedStringForCategory(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:AXSDDetectorCategoryAlarm])
  {
    uint64_t v2 = @"CATEGORY_ALARM";
  }
  else if ([v1 isEqualToString:AXSDDetectorCategoryAnimal])
  {
    uint64_t v2 = @"CATEGORY_ANIMAL";
  }
  else if ([v1 isEqualToString:AXSDDetectorCategoryHousehold])
  {
    uint64_t v2 = @"CATEGORY_HOUSEHOLD";
  }
  else if ([v1 isEqualToString:AXSDDetectorCategoryPeople])
  {
    uint64_t v2 = @"CATEGORY_PEOPLE";
  }
  else if ([v1 isEqualToString:AXSDDetectorCategoryNone])
  {
    uint64_t v2 = &stru_26D0B7B48;
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = AXSDSoundDetectionBundle();
  id v4 = [v3 localizedStringForKey:v2 value:v2 table:@"SoundDetectionSupport"];

  return v4;
}

id bmTypeForSoundDetectionType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:AXSDSoundDetectionTypeDistressedBaby])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A6F0];
LABEL_35:
    id v3 = *v2;
    goto LABEL_36;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeApplianceBeeps])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A6C0];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeApplianceBuzzes])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A6D0];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeApplianceBellDings])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A6C8];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeCarHorns])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A6D8];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeCatMeows])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A6E0];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeDogBarks])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A6F8];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeDoorbells])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A708];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeDoorKnocks])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A700];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeFireAlarms])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A710];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeSirenAlarms])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A730];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypePersonShouting])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A738];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeDistressedBaby])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A728];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeWaterRunning])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A740];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeCough])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A6E8];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeGlassBreaking])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A718];
    goto LABEL_35;
  }
  if ([v1 isEqualToString:AXSDSoundDetectionTypeKettle])
  {
    uint64_t v2 = (id *)MEMORY[0x263F2A720];
    goto LABEL_35;
  }
  id v3 = 0;
LABEL_36:

  return v3;
}

uint64_t AXIsSoundDetectionMedinaSupportEnabled()
{
  v0 = +[AXSDSettings sharedInstance];
  char v1 = [v0 forceMedinaSupport];

  if (v1) {
    return 1;
  }
  return MEMORY[0x270F09510]();
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void AXSDSoundDetectionHandleNotificationsForResponse_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_21F182000, log, OS_LOG_TYPE_DEBUG, "Snoozing %@ for duration: %@", (uint8_t *)&v3, 0x16u);
}

void AXSDSoundDetectionTypeForIdentifier_cold_1()
{
  v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F182000, v1, v2, "Attempted to get AXSDSoundDetectionType for invalid identifier: %@. Stacktrace: %@", v3, v4, v5, v6, v7);
}

void AXSDSoundDetectionTypesForCategory_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F182000, a2, OS_LOG_TYPE_DEBUG, "No AXSDSoundDetectionTypes found for detector category: %@", (uint8_t *)&v2, 0xCu);
}

void AXSDSoundDetectionLocalizedStringForType_cold_1()
{
  v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F182000, v1, v2, "Notification requested for invalid detection type: %@. Stacktrace: %@", v3, v4, v5, v6, v7);
}

uint64_t AXLogUltron()
{
  return MEMORY[0x270F093E0]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}